mkdir build
cd build

if [[ "$target_platform" == osx* ]]; then
  LLDB_USE_SYSTEM_DEBUGSERVER=ON
else
  LLDB_USE_SYSTEM_DEBUGSERVER=OFF
fi

cmake \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_ENABLE_RTTI=ON \
  -DLLVM_INCLUDE_TESTS=OFF \
  -DLLVM_INCLUDE_UTILS=OFF \
  -DLLVM_INCLUDE_DOCS=OFF \
  -DLLVM_INCLUDE_EXAMPLES=OFF \
  -DLLDB_CODESIGN_IDENTITY="" \
  -DLLDB_ENABLE_PYTHON=ON \
  -DLLDB_USE_SYSTEM_DEBUGSERVER=$LLDB_USE_SYSTEM_DEBUGSERVER \
  ..

make -j${CPU_COUNT}
make install
