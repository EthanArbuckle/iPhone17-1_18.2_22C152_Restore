uint64_t mio_elf_hash(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  char *v3;
  unint64_t i;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if (a2 < 4)
  {
    v2 = 0;
    i = a2;
  }
  else
  {
    v2 = 0;
    v3 = (char *)(a1 + 3);
    for (i = a2; i > 3; i -= 4)
    {
      v5 = *(v3 - 3) + 16 * v2;
      v6 = *(v3 - 2) + 16 * ((v5 >> 24) & 0xF0 ^ v5);
      v7 = *(v3 - 1) + 16 * ((v6 >> 24) & 0xF0 ^ v6);
      v8 = *v3 + 16 * ((v7 >> 24) & 0xF0 ^ v7);
      v2 = (v8 >> 24) & 0xF0 ^ v8;
      v3 += 4;
    }
  }
  switch(i)
  {
    case 1uLL:
      goto LABEL_11;
    case 2uLL:
LABEL_10:
      v10 = *(char *)(a2 + a1 - 2) + 16 * v2;
      v2 = (v10 >> 24) & 0xF0 ^ v10;
LABEL_11:
      v11 = *(char *)(a2 + a1 - 1) + 16 * v2;
      return (v11 >> 24) & 0xF0 ^ v11;
    case 3uLL:
      v9 = *(char *)(a2 + a1 - 3) + 16 * v2;
      v2 = (v9 >> 24) & 0xF0 ^ v9;
      goto LABEL_10;
  }
  return v2;
}

uint64_t MIOVideoTrackTypeInfoFromUTI(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 UTF8String];
  unint64_t v3 = [v1 lengthOfBytesUsingEncoding:4];

  return mio_elf_hash(v2, v3);
}

id MIOKnownTrackTypeDescription(uint64_t a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MIOKnownTrackTypeDescription_knownTypes;
  if (!MIOKnownTrackTypeDescription_knownTypes)
  {
    v8[0] = &unk_26CB7CBE8;
    v8[1] = &unk_26CB7CC00;
    v9[0] = @"com.apple.mio.tracktype.AlphaDataOnly";
    v9[1] = @"com.apple.mio.tracktype.NoVideoData";
    v8[2] = &unk_26CB7CC18;
    v8[3] = &unk_26CB7CC30;
    v9[2] = @"com.apple.mio.tracktype.IRData";
    v9[3] = @"com.apple.mio.tracktype.RasterOrientedVideoData";
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
    v4 = (void *)MIOKnownTrackTypeDescription_knownTypes;
    MIOKnownTrackTypeDescription_knownTypes = v3;

    uint64_t v2 = (void *)MIOKnownTrackTypeDescription_knownTypes;
  }
  v5 = [NSNumber numberWithUnsignedLong:a1];
  v6 = [v2 objectForKeyedSubscript:v5];

  return v6;
}

void sub_21B5F00FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F02A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B5F0508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F0800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B5F0AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F0C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B5F1004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B5F1DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F1E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F1EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F1F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F20D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F2248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F22C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F242C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F24B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F2638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F2794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F28E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F327C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_21B5F3734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21B5F38D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F39B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F3B8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F3CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F3D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F3E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F3FA0(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21B5F40F4(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21B5F4278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F435C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F4440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F4524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F4694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F49A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F4A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F4D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F4DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F4F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F5184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F528C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F566C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B5F5864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F5A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F5E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F5F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F6014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F629C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F64AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F65F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F6720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F6858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F6D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F7060(_Unwind_Exception *a1)
{
  v8 = v4;

  _Unwind_Resume(a1);
}

void sub_21B5F72EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F73A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F743C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21B5F7538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F75C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F7610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F7810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F7908(_Unwind_Exception *a1)
{
  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B5F7A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F85F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B5F896C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21B5F8AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B5F8C00(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_21B5F9498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_21B5F9BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5F9C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOMonochrome2ByteToy416FrameProcessor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_21B5F9E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FA1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B5FA53C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_21B5FA8F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FA994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FAA64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FAD6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FAEE4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    v13 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_21B5ED000, v13, OS_LOG_TYPE_ERROR, "Cannot convert pixel buffer. (%{public}@)", (uint8_t *)&buf, 0xCu);
    }

    v14 = [NSString stringWithFormat:@"Cannot convert pixel buffer. (%@)"];
    [MEMORY[0x263F087E8] populateStreamError:v11 message:v14 code:20];

    objc_end_catch();
    JUMPOUT(0x21B5FAEACLL);
  }
  _Unwind_Resume(a1);
}

void sub_21B5FB264(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    v7 = [NSString stringWithFormat:@"Cannot create pixel buffer pool for adjusting Bytes Per Row. (%@)"];
    [MEMORY[0x263F087E8] populateStreamError:v3 message:v7 code:19];

    objc_end_catch();
    JUMPOUT(0x21B5FB258);
  }

  _Unwind_Resume(a1);
}

void sub_21B5FB7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FBA40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FBC0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FBDCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FBF18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FBFEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FC158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FC330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FC484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FC64C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FC73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B5FC84C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<CMTime>::reserve(void **a1, unint64_t a2)
{
  v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 24;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>(v3, a2);
    v7 = &v6[24 * v5];
    v9 = &v6[24 * v8];
    uint64_t v11 = (char *)*a1;
    v10 = (char *)a1[1];
    id v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_21B5FCBA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<CMTime>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2643AEFF0, MEMORY[0x263F8C060]);
}

void sub_21B5FCE70(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_21B5FD288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FD328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FD3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FD5B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_21B5FDA8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FDD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  v25 = v24;

  _Unwind_Resume(a1);
}

void sub_21B5FE050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FE208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B5FF0F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FF1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21B5FF348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<CMTimeRange>::reserve(void **a1, unint64_t a2)
{
  v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 4) < a2)
  {
    if (a2 >= 0x555555555555556) {
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 48;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTimeRange>>(v3, a2);
    v7 = &v6[48 * v5];
    v9 = &v6[48 * v8];
    uint64_t v11 = (char *)*a1;
    v10 = (char *)a1[1];
    id v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 3);
        long long v14 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v14;
        *((_OWORD *)v12 - 3) = v13;
        v12 -= 48;
        v10 -= 48;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CMTimeRange>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

void sub_21B5FFD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B5FFFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MOVStreamWriter;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6002C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B60043C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6005C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,anonymous namespace'::StreamRecordingData>::count[abi:ne180100](uint64_t a1, const void **a2)
{
  uint64_t v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = a1 + 16;
    uint64_t v5 = 1;
    do
    {
      if (!std::less<std::string>::operator()[abi:ne180100](v4, a2, v2 + 4))
      {
        if (!std::less<std::string>::operator()[abi:ne180100](v4, v2 + 4, a2)) {
          return v5;
        }
        ++v2;
      }
      uint64_t v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t *std::map<std::string,anonymous namespace'::StreamRecordingData>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = a1[1];
  v6 = a1 + 1;
  v7 = a1 + 1;
  if (!v4) {
    goto LABEL_10;
  }
  v6 = a1 + 1;
  while (1)
  {
    while (1)
    {
      v7 = (uint64_t **)v4;
      uint64_t v8 = (const void **)(v4 + 4);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)v4 + 4))break; {
      uint64_t v4 = *v7;
      }
      v6 = v7;
      if (!*v7) {
        goto LABEL_10;
      }
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2)) {
      break;
    }
    v6 = v7 + 1;
    uint64_t v4 = v7[1];
    if (!v4) {
      goto LABEL_10;
    }
  }
  v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    v10 = (char *)operator new(0x110uLL);
    v15[0] = v10;
    v15[1] = v5;
    char v16 = 0;
    uint64_t v11 = (std::string *)(v10 + 32);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
      id v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      *((void *)v10 + 6) = *(void *)(a2 + 16);
      id v12 = (uint64_t *)v10;
    }
    *((void *)v10 + 33) = 0;
    *(_OWORD *)(v10 + 248) = 0u;
    *(_OWORD *)(v10 + 232) = 0u;
    *(_OWORD *)(v10 + 216) = 0u;
    *(_OWORD *)(v10 + 200) = 0u;
    *(_OWORD *)(v10 + 184) = 0u;
    *(_OWORD *)(v10 + 168) = 0u;
    *(_OWORD *)(v10 + 152) = 0u;
    *(_OWORD *)(v10 + 136) = 0u;
    *(_OWORD *)(v10 + 120) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    char v16 = 1;
    uint64_t *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    char *v6 = v12;
    long long v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      id v12 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    v9 = (uint64_t *)v15[0];
    v15[0] = 0;
  }
  return v9 + 7;
}

void sub_21B600800(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_21B60092C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,anonymous namespace'::MetadataRecordingData>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = a1[1];
  v6 = a1 + 1;
  v7 = a1 + 1;
  if (!v4) {
    goto LABEL_10;
  }
  v6 = a1 + 1;
  while (1)
  {
    while (1)
    {
      v7 = (uint64_t **)v4;
      uint64_t v8 = (const void **)(v4 + 4);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)v4 + 4))break; {
      uint64_t v4 = *v7;
      }
      v6 = v7;
      if (!*v7) {
        goto LABEL_10;
      }
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2)) {
      break;
    }
    v6 = v7 + 1;
    uint64_t v4 = v7[1];
    if (!v4) {
      goto LABEL_10;
    }
  }
  v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    v10 = (char *)operator new(0x88uLL);
    v15[0] = v10;
    v15[1] = v5;
    char v16 = 0;
    uint64_t v11 = (std::string *)(v10 + 32);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
      id v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      *((void *)v10 + 6) = *(void *)(a2 + 16);
      id v12 = (uint64_t *)v10;
    }
    *(_OWORD *)(v10 + 120) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    char v16 = 1;
    uint64_t *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    char *v6 = v12;
    long long v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      id v12 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    v9 = (uint64_t *)v15[0];
    v15[0] = 0;
  }
  return v9 + 7;
}

void sub_21B600AC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_21B600DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B600F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B600FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B601124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B601258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B60133C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B601474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6015B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B60169C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B601900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6019B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B601A24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_21B601B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v11);

  _Unwind_Resume(a1);
}

void sub_21B601DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }

  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,anonymous namespace'::StreamRecordingData>::find[abi:ne180100](uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    uint64_t v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      uint64_t v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

void sub_21B602220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6023D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B602564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B60284C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  v26[31] = v28;

  objc_sync_exit(v26);

  if (a25 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void anonymous namespace'::MetadataRecordingData::~MetadataRecordingData(id *this)
{
}

void sub_21B602B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v29 - 49) < 0) {
    operator delete(*(void **)(v29 - 72));
  }

  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,std::map<std::string,anonymous namespace'::MetadataRecordingData>>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = a1[1];
  uint64_t v6 = a1 + 1;
  BOOL v7 = a1 + 1;
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v6 = a1 + 1;
  while (1)
  {
    while (1)
    {
      BOOL v7 = (uint64_t **)v4;
      uint64_t v8 = (const void **)(v4 + 4);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)v4 + 4))break; {
      uint64_t v4 = *v7;
      }
      uint64_t v6 = v7;
      if (!*v7) {
        goto LABEL_10;
      }
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2)) {
      break;
    }
    uint64_t v6 = v7 + 1;
    uint64_t v4 = v7[1];
    if (!v4) {
      goto LABEL_10;
    }
  }
  v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    v10 = operator new(0x50uLL);
    v15[0] = v10;
    v15[1] = v5;
    char v16 = 0;
    uint64_t v11 = (std::string *)(v10 + 4);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
      id v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      v10[6] = *(void *)(a2 + 16);
      id v12 = v10;
    }
    v10[8] = 0;
    v10[9] = 0;
    v10[7] = v10 + 8;
    char v16 = 1;
    uint64_t *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    char *v6 = v12;
    long long v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      id v12 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    v9 = (uint64_t *)v15[0];
    v15[0] = 0;
  }
  return v9 + 7;
}

void sub_21B602D14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_21B603560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, ...)
{
  va_start(va, a6);
  v8[25] = v9;

  objc_sync_exit(v8);

  if (*(char *)(v11 - 105) < 0) {
    operator delete(*(void **)(v11 - 128));
  }

  _Unwind_Resume(a1);
}

void sub_21B60356C()
{
}

void sub_21B603578()
{
  JUMPOUT(0x21B6036D8);
}

void sub_21B60363C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, ...)
{
  va_start(va, a6);

  objc_end_catch();

  objc_sync_exit(v8);
  if (*(char *)(v11 - 105) < 0) {
    operator delete(*(void **)(v11 - 128));
  }

  _Unwind_Resume(a1);
}

void sub_21B603650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, ...)
{
  va_start(va, a6);

  objc_sync_exit(v8);

  if (*(char *)(v11 - 105) < 0) {
    operator delete(*(void **)(v11 - 128));
  }

  _Unwind_Resume(a1);
}

void sub_21B603660()
{
  JUMPOUT(0x21B6036C4);
}

void sub_21B603680()
{
}

void sub_21B603688()
{
}

void sub_21B60369C()
{
}

void sub_21B6036A4()
{
}

void sub_21B6036AC()
{
}

void sub_21B6036B4()
{
}

void anonymous namespace'::StreamRecordingData::~StreamRecordingData(id *this)
{
}

void sub_21B6038D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B603B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B603D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B603FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B604204(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21B60435C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B604D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_21B604FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B605524(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_21B6055F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B605A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  if (*(char *)(v19 - 129) < 0) {
    operator delete(*(void **)(v19 - 152));
  }

  _Unwind_Resume(a1);
}

void sub_21B60608C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  uint64_t v2 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 48);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 64);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
}

void sub_21B606648(_Unwind_Exception *a1)
{
  if (*(char *)(v4 - 113) < 0) {
    operator delete(*(void **)(v4 - 136));
  }

  _Unwind_Resume(a1);
}

void sub_21B606788(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_ea8_64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)(a1 + 64);
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 64), *(void *)(a2 + 72));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 64);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 80);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*(void **)(a1 + 64));
  }
}

void sub_21B606BA4(_Unwind_Exception *a1)
{
  if (*(char *)(v4 - 113) < 0) {
    operator delete(*(void **)(v4 - 136));
  }

  _Unwind_Resume(a1);
}

void sub_21B606F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)(a1 + 56);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 56), *(void *)(a2 + 64));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 56);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 72);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
}

void sub_21B607354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  objc_sync_exit(v18);
  _Unwind_Resume(a1);
}

void sub_21B6076B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (*(char *)(v23 - 137) < 0) {
    operator delete(*(void **)(v23 - 160));
  }

  _Unwind_Resume(a1);
}

void sub_21B607844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  v17 = v16;

  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

void sub_21B60791C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B607A64(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21B607BD4(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21B607D3C(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21B607FFC(_Unwind_Exception *a1)
{
  if (*(char *)(v4 - 113) < 0) {
    operator delete(*(void **)(v4 - 136));
  }

  _Unwind_Resume(a1);
}

void sub_21B608104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6084C4(_Unwind_Exception *a1)
{
  if (*(char *)(v3 - 153) < 0) {
    operator delete(*(void **)(v3 - 176));
  }

  _Unwind_Resume(a1);
}

void sub_21B60875C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B608A1C(_Unwind_Exception *a1)
{
  if (*(char *)(v4 - 97) < 0) {
    operator delete(*(void **)(v4 - 120));
  }

  _Unwind_Resume(a1);
}

void sub_21B608EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_21B6091D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  objc_sync_exit(v21);
  if (a19 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B609454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v23 - 89) < 0) {
    operator delete(*(void **)(v23 - 112));
  }
  if (*(char *)(v23 - 65) < 0) {
    operator delete(*(void **)(v23 - 88));
  }

  _Unwind_Resume(a1);
}

void sub_21B609620(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_ea8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(a1 + 2, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__r.__words[2] = *(void *)(a2 + 64);
    *(_OWORD *)&a1[2].__r_.__value_.__l.__data_ = v4;
  }
  uint64_t v5 = a1 + 3;
  if (*(char *)(a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 72), *(void *)(a2 + 80));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 72);
    a1[3].__r_.__value_.__r.__words[2] = *(void *)(a2 + 88);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
}

void sub_21B6096DC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v2 + 71) < 0) {
    operator delete(*v1);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_ea8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  if (*(char *)(a1 + 71) < 0)
  {
    uint64_t v2 = *(void **)(a1 + 48);
    operator delete(v2);
  }
}

void sub_21B609968(_Unwind_Exception *a1)
{
  objc_sync_exit(v4);
  _Unwind_Resume(a1);
}

void sub_21B609B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B609EA8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf)
{
  v22 = v18;

  objc_sync_exit(v20);
  if (a2 == 1)
  {
    id v24 = objc_begin_catch(a1);
    id v25 = *(id *)(v17 + 32);
    objc_sync_enter(v25);
    v26 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v24;
      _os_log_impl(&dword_21B5ED000, v26, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: appendTimedMetadataGroup exception: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&buf, 0xCu);
    }

    v27 = [*(id *)(*(void *)(v17 + 32) + 80) error];
    uint64_t v28 = *(id **)(v17 + 32);
    uint64_t v29 = [v28[46] criticalErrorOccurred:v27 context:v28];
    [v28 activateNewState:v29 byEvent:@"asyncWriteAssociatedMetadata"];

    objc_sync_exit(v25);
    objc_end_catch();
    JUMPOUT(0x21B609E6CLL);
  }
  _Unwind_Resume(a1);
}

void sub_21B60A264(_Unwind_Exception *a1)
{
  if (*(char *)(v2 - 49) < 0) {
    operator delete(*(void **)(v2 - 72));
  }

  _Unwind_Resume(a1);
}

void sub_21B60A390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B60A4D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B60A610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21B60A72C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_21B60A8B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21B60A93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B60AA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21B60AC44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B60ACFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21B60AE24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B60B274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B60B714(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B60B934(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_21B60BA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B60C03C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B60C448(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21B60C578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B60C6BC(_Unwind_Exception *a1)
{
  long long v4 = v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B60C830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B60D908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  _Unwind_Resume(a1);
}

void sub_21B60DC10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B60DD78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B60E29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a39 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B60E51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B60E8B8(_Unwind_Exception *a1, int a2)
{
  if (*(char *)(v9 - 153) < 0) {
    operator delete(*(void **)(v9 - 176));
  }
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    long long v13 = v5[55];
    long long v14 = v13;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)(v9 - 176) = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v14, OS_SIGNPOST_INTERVAL_END, v6, "mio.att_appendTimedMetadataGroup", (const char *)&unk_21B668A56, (uint8_t *)(v9 - 176), 2u);
    }

    v15 = [NSString stringWithFormat:@"Exception occurred during writing %@ for stream '%@'. Dropping sample."];
    char v16 = [MEMORY[0x263F087E8] streamErrorWithMessage:v15 code:21];
    [v5 informDelegateAboutError:v16];

    objc_end_catch();
    JUMPOUT(0x21B60E864);
  }

  _Unwind_Resume(a1);
}

void sub_21B60ED28(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, long long buf)
{
  v26 = v22;

  objc_sync_exit(v23);
  if (a2 == 1)
  {
    id v28 = objc_begin_catch(a1);
    uint64_t v29 = *(id *)(v20 + 440);
    v30 = v29;
    os_signpost_id_t v31 = *(void *)(v20 + 448);
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v30, OS_SIGNPOST_INTERVAL_END, v31, "mio.append.timed.metadata.group", (const char *)&unk_21B668A56, (uint8_t *)&buf, 2u);
    }

    id v32 = (id)v20;
    objc_sync_enter(v32);
    v33 = [*(id *)(v24 + 3256) defaultLog];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v28;
      _os_log_impl(&dword_21B5ED000, v33, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: appendTimedMetadataGroup exception: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&buf, 0xCu);
    }

    v34 = [NSString stringWithFormat:@"Exception occurred during writing %@ for stream '%@'. Dropping sample."];
    v35 = [MEMORY[0x263F087E8] streamErrorWithMessage:v34 code:21];
    [v32 informDelegateAboutError:v35];

    objc_sync_exit(v32);
    objc_end_catch();
    JUMPOUT(0x21B60ECD8);
  }
  if (a17 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B60EFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B60F100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B60F210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B610548()
{
  objc_end_catch();
  JUMPOUT(0x21B6105B0);
}

void sub_21B610560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  JUMPOUT(0x21B6105C0);
}

void sub_21B610570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  JUMPOUT(0x21B6105C0);
}

void sub_21B610580()
{
  JUMPOUT(0x21B6105A8);
}

void sub_21B61058C()
{
  JUMPOUT(0x21B610594);
}

void sub_21B6105A0()
{
  JUMPOUT(0x21B6105A8);
}

void sub_21B610B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6110EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_21B611224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B611464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);

  objc_destroyWeak(v8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v10 - 40));
  _Unwind_Resume(a1);
}

void sub_21B6121CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B612448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_21B612FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  _Unwind_Resume(a1);
}

void sub_21B613174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6131F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6132DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61335C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B613414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B613484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61356C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6135EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,anonymous namespace'::StreamRecordingData>,std::__map_value_compare<std::string,std::__value_type<std::string,anonymous namespace'::StreamRecordingData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,anonymous namespace'::StreamRecordingData>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    operator delete(a2);
  }
}

void std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,anonymous namespace'::StreamRecordingData>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,anonymous namespace'::StreamRecordingData>,void,void>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<std::string,anonymous namespace'::MetadataRecordingData>,std::__map_value_compare<std::string,std::__value_type<std::string,anonymous namespace'::MetadataRecordingData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,anonymous namespace'::MetadataRecordingData>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    operator delete(a2);
  }
}

void std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,anonymous namespace'::MetadataRecordingData>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,anonymous namespace'::MetadataRecordingData>,void,void>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<std::string,std::map<std::string,anonymous namespace'::MetadataRecordingData>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,anonymous namespace'::MetadataRecordingData>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,anonymous namespace'::MetadataRecordingData>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    operator delete(a2);
  }
}

void std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,anonymous namespace'::MetadataRecordingData>>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,std::map<std::string,anonymous namespace'::MetadataRecordingData>>,void,void>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    os_signpost_id_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    os_signpost_id_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    os_signpost_id_t v6 = a2;
  }
  else {
    os_signpost_id_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t std::unique_ptr<std::__tree_node<std::__value_type<std::string,anonymous namespace'::StreamRecordingData>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,anonymous namespace'::StreamRecordingData>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
    operator delete(v2);
    }
  }
  return a1;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  size_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    int v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    size_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t std::unique_ptr<std::__tree_node<std::__value_type<std::string,anonymous namespace'::MetadataRecordingData>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,anonymous namespace'::MetadataRecordingData>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
    operator delete(v2);
    }
  }
  return a1;
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<CMTime>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    int v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>(v7, v9);
  }
  else {
    int v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_21B6140D4(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t *std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  std::string::size_type v6 = (uint64_t **)std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__insert_node_at(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

void *std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  unint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        unint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        unint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      unint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    unint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  std::string::size_type v6 = operator new(0x50uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 4);
  unint64_t v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    v6[6] = *((void *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  v6[7] = 0;
  v6[8] = 0;
  v6[9] = 0;
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_21B6144D8(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,CMTime>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,CMTime>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,anonymous namespace'::MetadataRecordingData>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,anonymous namespace'::MetadataRecordingData>>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
    operator delete(v2);
    }
  }
  return a1;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

void sub_21B614B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B614F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B6156F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_21B616964(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21B616B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_21B617B10(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v4 = objc_begin_catch(exception_object);
    uint64_t v5 = [*(id *)(v2 + 3256) defaultLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)(v3 - 112) = 0;
      _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_ERROR, "AVAssetWriter.requiresInProcessOperation not supported.", (uint8_t *)(v3 - 112), 2u);
    }

    objc_end_catch();
    JUMPOUT(0x21B6175D8);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B6189CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_21B618D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B6196E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B619878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B619944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B619A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B619C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B619CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIONonPlanarToL008FrameProcessor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B619E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61A26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61A3B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61A67C(_Unwind_Exception *a1)
{
  id v4 = v2;

  _Unwind_Resume(a1);
}

void sub_21B61A800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61A8E4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B61AA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61AC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61AE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61B0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61B234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61B338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61B498(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21B61B56C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61B670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61B728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61B7F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61B8C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61B984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61BA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61BAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61BBBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61BC7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61BD6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61BE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61C0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61C31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B61C54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_21B61C750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61C874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61C938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61CA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B61CB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61CBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61CC94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61CFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61D260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B61D400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61D520(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21B61D5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61D64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIORawBayerFrameProcessor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B61D7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61D8E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B61D948(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B61D9D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B61DA3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookup(__CVBuffer *a1, uint64_t a2)
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a1);

  return MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookupForFormat(PixelFormatType, a2);
}

double MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookupForFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%d_%zu", a1, a2);
  uint64_t v3 = objc_opt_class();
  objc_sync_enter(v3);
  id v4 = +[MIOPixelBufferUtility sharedBytesPerPixelLookUp];
  uint64_t v5 = [v4 objectForKey:v2];
  [v5 doubleValue];
  double v7 = v6;

  objc_sync_exit(v3);
  return v7;
}

void sub_21B61DB80(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void MIOCVPixelBufferSetBytesPerPixelOfPlaneToLookup(__CVBuffer *a1, uint64_t a2, double a3)
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a1);

  MIOCVPixelBufferSetBytesPerPixelOfPlaneToLookupForFormat(PixelFormatType, a2, a3);
}

void MIOCVPixelBufferSetBytesPerPixelOfPlaneToLookupForFormat(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d_%zu", a1, a2);
  uint64_t v5 = objc_opt_class();
  objc_sync_enter(v5);
  double v6 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    double v10 = a3;
    __int16 v11 = 2112;
    long long v12 = v4;
    _os_log_impl(&dword_21B5ED000, v6, OS_LOG_TYPE_INFO, "BytesPerPixelLookUp: Register %f for %@", buf, 0x16u);
  }

  double v7 = +[MIOPixelBufferUtility sharedBytesPerPixelLookUp];
  unint64_t v8 = [NSNumber numberWithDouble:a3];
  [v7 setObject:v8 forKey:v4];

  objc_sync_exit(v5);
}

void sub_21B61DD5C(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

CVPixelBufferRef MIOCVCreatePixelBuffer(OSType a1, size_t a2, size_t a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRef v9 = 0;
  uint64_t v10 = *MEMORY[0x263F04130];
  v11[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, a3, a1, v6, &v9);
  CVPixelBufferRef v7 = v9;

  return v7;
}

void sub_21B61DE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MIOCVPixelBufferGetBytesPerPixel(__CVBuffer *a1)
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a1);

  return MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, 0);
}

double MIOCVPixelBufferGetBytesPerPixelOfPlane(__CVBuffer *a1, size_t a2)
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a1);

  return MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, a2);
}

double MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(uint64_t a1, size_t a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  double BytesPerPixelOfPlaneFromLookupForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookupForFormat(a1, a2);
  if (BytesPerPixelOfPlaneFromLookupForFormat == 0.0)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    uint64_t v18 = *MEMORY[0x263F04130];
    v19[0] = MEMORY[0x263EFFA78];
    CFDictionaryRef v5 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x280uLL, 0x1E0uLL, a1, v5, &pixelBufferOut);
    if (!pixelBufferOut)
    {
      uint64_t v10 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(extraColumnsOnLeft) = 67109120;
        HIDWORD(extraColumnsOnLeft) = a1;
        _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_ERROR, "Cannot allocate reference buffer (Format: %d).", (uint8_t *)&extraColumnsOnLeft, 8u);
      }

      objc_msgSend(NSString, "stringWithFormat:", @"Cannot allocate reference buffer (Format: %d).", a1);
      id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v11);
    }
    if (CVPixelBufferGetPlaneCount(pixelBufferOut))
    {
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, a2);
      size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBufferOut, a2);
    }
    else
    {
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      size_t WidthOfPlane = 640;
    }
    size_t extraColumnsOnLeft = 0;
    size_t extraColumnsOnRight = 0;
    CVPixelBufferGetExtendedPixels(pixelBufferOut, &extraColumnsOnLeft, &extraColumnsOnRight, 0, 0);
    CVPixelBufferRelease(pixelBufferOut);
    if (WidthOfPlane - 641 <= 0xFFFFFFFFFFFFFD7FLL)
    {
      long long v12 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v12, OS_LOG_TYPE_ERROR, "Invalid pixel buffer configuration.", buf, 2u);
      }

      id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Invalid pixel buffer configuration." userInfo:0];
      objc_exception_throw(v13);
    }
    unint64_t v8 = 0x280u / (unsigned __int16)WidthOfPlane;
    extraColumnsOnLeft /= v8;
    extraColumnsOnRight /= v8;
    double BytesPerPixelOfPlaneFromLookupForFormat = (double)BytesPerRowOfPlane
                                            / (double)(extraColumnsOnLeft + WidthOfPlane + extraColumnsOnRight);
    MIOCVPixelBufferSetBytesPerPixelOfPlaneToLookupForFormat(a1, a2, BytesPerPixelOfPlaneFromLookupForFormat);
  }
  return BytesPerPixelOfPlaneFromLookupForFormat;
}

void sub_21B61E1CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

size_t MIOCVPixelBufferUsablePlaneCount(__CVBuffer *a1)
{
  size_t result = CVPixelBufferGetPlaneCount(a1);
  if (result <= 1) {
    return 1;
  }
  return result;
}

void sub_21B61E5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61EC1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61ED78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61EFBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61F2B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61F418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61F954(_Unwind_Exception *a1)
{
  fclose(v1);
  _Unwind_Resume(a1);
}

void sub_21B61FADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61FE08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B61FF94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B620194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6203B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6205E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6207CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B620DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B620EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B620FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6216DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6217FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6219AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B621C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B621EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6220F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6222F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21B6224C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B622690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B622B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B622F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

MOVStreamFrame *MIOMakeFrame(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  CFDictionaryRef v6 = [[MOVStreamFrame alloc] initWithPixelBuffer:a1 timeStamp:v5 context:a3];

  return v6;
}

void sub_21B6238D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B623A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B623B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B623CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B623E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B623F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6241EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B624570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21B624914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B624D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B624E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B624F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B625050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B625208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B625738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B625934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B625BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B625D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B626334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B626440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62659C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B626698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6267AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B626BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B626DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62736C(_Unwind_Exception *a1)
{
  CFDictionaryRef v6 = v5;

  _Unwind_Resume(a1);
}

void sub_21B62747C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B627530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6275B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B6276B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *std::vector<CMTimeRange>::__assign_with_size[abi:ne180100]<CMTimeRange*,CMTimeRange*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  CVPixelBufferRef v7 = result;
  uint64_t v8 = *((void *)result + 2);
  CVPixelBufferRef v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(void *)result) >> 4) < a4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0x555555555555555) {
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 4);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v12 = 0x555555555555555;
    }
    else {
      unint64_t v12 = v11;
    }
    size_t result = std::vector<CMTimeRange>::__vallocate[abi:ne180100](v7, v12);
    long long v14 = (char *)v7[1];
    id v13 = (void **)(v7 + 1);
    CVPixelBufferRef v9 = v14;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  id v13 = (void **)(result + 8);
  long long v15 = (unsigned char *)*((void *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 4) >= a4) {
    goto LABEL_16;
  }
  char v16 = &__src[16 * ((v15 - v9) >> 4)];
  if (v15 != v9)
  {
    size_t result = (char *)memmove(*(void **)result, __src, v15 - v9);
    CVPixelBufferRef v9 = (char *)*v13;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    size_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  void *v13 = &v9[v17];
  return result;
}

char *std::vector<CMTimeRange>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::vector<CMTime>::__throw_length_error[abi:ne180100]();
  }
  size_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTimeRange>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

void sub_21B6280B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B628284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B628384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B628630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62873C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62891C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

void sub_21B628C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B628D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B629700(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int16 buf)
{
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(exception_object);
    long long v14 = v12;
    os_signpost_id_t v15 = [v11 avfAppendSignPostID];
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v14, OS_SIGNPOST_INTERVAL_END, v15, "mio.append.timed.metadata.group", (const char *)&unk_21B668A56, (uint8_t *)&buf, 2u);
    }

    char v16 = NSString;
    uint64_t v20 = [v11 streamId];
    size_t v17 = [v16 stringWithFormat:@"Exception occurred during appendTimedMetadataGroup %@ for stream '%@'."];

    uint64_t v18 = [MEMORY[0x263F087E8] streamErrorWithMessage:v17 code:21];
    uint64_t v19 = [v11 writer];
    [v19 reportError:v18];

    objc_end_catch();
    JUMPOUT(0x21B6296C4);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B629A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B629E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62A020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62A080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62A0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62A140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOPixelBufferPool;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B62A248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62A3C0(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B62A560(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B62A744(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B62A924(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B62AB1C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B62AD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62AF2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62B128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62C1F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62C75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_21B62CC9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62CE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62CEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *GetPixelBufferBaseAddress(__CVBuffer *a1)
{
  if (CVPixelBufferIsPlanar(a1))
  {
    return CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  }
  else
  {
    return CVPixelBufferGetBaseAddress(a1);
  }
}

size_t GetPixelBufferRowBytes(__CVBuffer *a1)
{
  if (CVPixelBufferIsPlanar(a1)) {
    return CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  }
  else {
    return CVPixelBufferGetBytesPerRow(a1);
  }
}

void sub_21B62E0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62E78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62E9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B62EA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOq8q2ToL010FrameProcessor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B62EE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21B630144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int16 buf)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(exception_object);
    uint64_t v18 = v16;
    os_signpost_id_t v19 = [v15 avfAppendSignPostID];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v18, OS_SIGNPOST_INTERVAL_END, v19, "mio.append.sample.buffer.attachments", (const char *)&unk_21B668A56, (uint8_t *)&buf, 2u);
    }

    uint64_t v20 = NSString;
    uint64_t v24 = [v15 streamId];
    v21 = [v20 stringWithFormat:@"Exception occurred during appendTimedMetadataGroup %@ for stream '%@'."];

    v22 = [MEMORY[0x263F087E8] streamErrorWithMessage:v21 code:21];
    uint64_t v23 = [v15 writer];
    [v23 reportError:v22];

    objc_end_catch();
    JUMPOUT(0x21B630108);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B6305E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6306D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B630770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6308D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B630B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B630D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B630F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B631104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63120C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21B6313F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6314CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6316C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B63181C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21B6318E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B631A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21B631AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B631BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B631C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B631F84(_Unwind_Exception *a1)
{
  CVPixelBufferRef v7 = v6;

  _Unwind_Resume(a1);
}

void sub_21B6320E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,anonymous namespace'::StreamRecordingData>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t)(a1 + 1);
  uint64_t v4 = (uint64_t)a1[1];
  CFDictionaryRef v6 = (uint64_t *)(a1 + 1);
  CVPixelBufferRef v7 = (uint64_t *)(a1 + 1);
  if (!v4) {
    goto LABEL_10;
  }
  CFDictionaryRef v6 = (uint64_t *)(a1 + 1);
  while (1)
  {
    while (1)
    {
      CVPixelBufferRef v7 = (uint64_t *)v4;
      uint64_t v8 = (const void **)(v4 + 32);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)(v4 + 32)))break; {
      uint64_t v4 = *v7;
      }
      CFDictionaryRef v6 = v7;
      if (!*v7) {
        goto LABEL_10;
      }
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2)) {
      break;
    }
    CFDictionaryRef v6 = v7 + 1;
    uint64_t v4 = v7[1];
    if (!v4) {
      goto LABEL_10;
    }
  }
  uint64_t v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    unint64_t v10 = (char *)operator new(0x110uLL);
    v15[0] = (uint64_t)v10;
    v15[1] = v5;
    char v16 = 0;
    uint64_t v11 = (std::string *)(v10 + 32);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
      unint64_t v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      *((void *)v10 + 6) = *(void *)(a2 + 16);
      unint64_t v12 = (uint64_t *)v10;
    }
    *((void *)v10 + 33) = 0;
    *(_OWORD *)(v10 + 248) = 0u;
    *(_OWORD *)(v10 + 232) = 0u;
    *(_OWORD *)(v10 + 216) = 0u;
    *(_OWORD *)(v10 + 200) = 0u;
    *(_OWORD *)(v10 + 184) = 0u;
    *(_OWORD *)(v10 + 168) = 0u;
    *(_OWORD *)(v10 + 152) = 0u;
    *(_OWORD *)(v10 + 136) = 0u;
    *(_OWORD *)(v10 + 120) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    char v16 = 1;
    uint64_t *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    uint64_t *v6 = (uint64_t)v12;
    id v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      unint64_t v12 = (uint64_t *)*v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    uint64_t v9 = v15[0];
    v15[0] = 0;
  }
  return v9 + 56;
}

void sub_21B632298(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_21B632724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B632988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
  std::__tree<unsigned int>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void sub_21B632A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B632C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B632F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,anonymous namespace'::MetadataRecordingData>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t)(a1 + 1);
  uint64_t v4 = (uint64_t)a1[1];
  CFDictionaryRef v6 = (uint64_t *)(a1 + 1);
  CVPixelBufferRef v7 = (uint64_t *)(a1 + 1);
  if (!v4) {
    goto LABEL_10;
  }
  CFDictionaryRef v6 = (uint64_t *)(a1 + 1);
  while (1)
  {
    while (1)
    {
      CVPixelBufferRef v7 = (uint64_t *)v4;
      uint64_t v8 = (const void **)(v4 + 32);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)(v4 + 32)))break; {
      uint64_t v4 = *v7;
      }
      CFDictionaryRef v6 = v7;
      if (!*v7) {
        goto LABEL_10;
      }
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2)) {
      break;
    }
    CFDictionaryRef v6 = v7 + 1;
    uint64_t v4 = v7[1];
    if (!v4) {
      goto LABEL_10;
    }
  }
  uint64_t v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    unint64_t v10 = (char *)operator new(0x88uLL);
    v15[0] = (uint64_t)v10;
    v15[1] = v5;
    char v16 = 0;
    uint64_t v11 = (std::string *)(v10 + 32);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
      unint64_t v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      *((void *)v10 + 6) = *(void *)(a2 + 16);
      unint64_t v12 = (uint64_t *)v10;
    }
    *(_OWORD *)(v10 + 120) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    char v16 = 1;
    uint64_t *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    uint64_t *v6 = (uint64_t)v12;
    id v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      unint64_t v12 = (uint64_t *)*v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    uint64_t v9 = v15[0];
    v15[0] = 0;
  }
  return v9 + 56;
}

void sub_21B633138(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_21B63328C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B63345C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6335C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6336A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B633758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B633870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6339A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v18 = v17;

  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B633B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B633CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B633E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v18 = v17;

  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B633EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B633F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6340DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6343CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B634698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B634794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B634830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6348E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<std::__tree_node<std::__value_type<std::string,anonymous namespace'::StreamRecordingData>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,anonymous namespace'::StreamRecordingData>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {

      if (*(char *)(v2 + 55) < 0) {
        operator delete(*(void **)(v2 + 32));
      }
    }
    operator delete((void *)v2);
  }
  return a1;
}

uint64_t std::set<unsigned int>::set[abi:ne180100](uint64_t a1, unsigned int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 4 * a3;
    do
    {
      std::__tree<unsigned int>::__emplace_hint_unique_key_args<unsigned int,unsigned int const&>((uint64_t **)a1, v4, a2, a2);
      ++a2;
      v6 -= 4;
    }
    while (v6);
  }
  return a1;
}

void sub_21B634A3C(_Unwind_Exception *a1)
{
  std::__tree<unsigned int>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<unsigned int>::__emplace_hint_unique_key_args<unsigned int,unsigned int const&>(uint64_t **a1, uint64_t *a2, unsigned int *a3, _DWORD *a4)
{
  uint64_t v6 = std::__tree<unsigned int>::__find_equal<unsigned int>(a1, a2, &v11, &v10, a3);
  CVPixelBufferRef v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    CVPixelBufferRef v7 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v7 + 7) = *a4;
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<unsigned int>::__find_equal<unsigned int>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, unsigned int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (unsigned int v6 = *a5, v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    uint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      uint64_t v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      id v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        id v13 = v10;
      }
      while (v14);
    }
    unsigned int v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          id v17 = (uint64_t *)v16;
          unsigned int v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      id v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    unint64_t v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      unint64_t v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    os_signpost_id_t v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      os_signpost_id_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          unsigned int v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__tree<unsigned int>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<unsigned int>::destroy(a1, *a2);
    std::__tree<unsigned int>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::unique_ptr<std::__tree_node<std::__value_type<std::string,anonymous namespace'::MetadataRecordingData>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,anonymous namespace'::MetadataRecordingData>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {

      if (*(char *)(v2 + 55) < 0) {
        operator delete(*(void **)(v2 + 32));
      }
    }
    operator delete((void *)v2);
  }
  return a1;
}

void sub_21B635180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B635508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B635760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B635AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B635D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MOVStreamHEVCLosslessEncoder::MOVStreamHEVCLosslessEncoder(MOVStreamHEVCLosslessEncoder *this)
{
  this->var2 = 0;
  *(void *)&this->var9 = *(void *)"";
  *(_WORD *)&this->var12 = 0;
  *(void *)&this->var3 = 0x2D000000500;
  this->var5 = 30.0;
  this->var6 = 0;
  *(_WORD *)&this->var0 = 0;
  *(_OWORD *)&this->var7.var0 = xmmword_21B6613F0;
  this->var7.var4 = 1.0;
  *(_DWORD *)&this->var7.var5 = 257;
}

{
  this->var2 = 0;
  *(void *)&this->var9 = *(void *)"";
  *(_WORD *)&this->var12 = 0;
  *(void *)&this->var3 = 0x2D000000500;
  this->var5 = 30.0;
  this->var6 = 0;
  *(_WORD *)&this->var0 = 0;
  *(_OWORD *)&this->var7.var0 = xmmword_21B6613F0;
  this->var7.var4 = 1.0;
  *(_DWORD *)&this->var7.var5 = 257;
}

void MOVStreamHEVCLosslessEncoder::~MOVStreamHEVCLosslessEncoder(MOVStreamHEVCLosslessEncoder *this)
{
}

{
}

uint64_t MOVStreamHEVCLosslessEncoder::Open(uint64_t a1, int32_t a2, int32_t a3, int a4, char a5, const opaqueCMFormatDescription *a6, void (__cdecl *a7)(void *, void *, OSStatus, VTEncodeInfoFlags, CMSampleBufferRef), void *a8, double a9)
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v96 = a1;
  if (a2 < 64 || a3 <= 63)
  {
    uint64_t v16 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "Frame size too small";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 105;
      _os_log_impl(&dword_21B5ED000, v16, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
    }

    a1 = v96;
  }
  *(double *)(a1 + 24) = a9;
  id v17 = (uint64_t *)(a1 + 24);
  *(_DWORD *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 20) = a3;
  *(_DWORD *)(a1 + 104) = 1752589105;
  *(unsigned char *)(a1 + 1) = a5;
  v95 = (VTSessionRef *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
LABEL_7:
    *(unsigned char *)(a1 + 108) = 0;
    int v18 = a4 - 1;
    if ((a4 - 1) > 9)
    {
      int v19 = 8;
      int v20 = 1;
    }
    else
    {
      int v19 = dword_21B661400[v18];
      int v20 = dword_21B661428[v18];
    }
    *(_DWORD *)(a1 + 100) = v19;
    v21 = (int *)(a1 + 100);
    *(_DWORD *)(a1 + 48) = v20;
    *(unsigned char *)(a1 + 64) = 1;
    unsigned int v22 = *(void **)(a1 + 8);
    if (v22)
    {
      if (![v22 configureSessionOverride:*v95]) {
        return 4294954394;
      }
      if (!+[MIOLog debugEnabled]) {
        goto LABEL_17;
      }
      uint64_t v23 = +[MIOLog defaultLog];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
      *(_WORD *)buf = 0;
      uint64_t v24 = "Custom video encoder configuration.";
      goto LABEL_15;
    }
    if (+[MIOLog debugEnabled])
    {
      v38 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v38, OS_LOG_TYPE_DEBUG, "*-----------------------------------------------------------------------------*", buf, 2u);
      }
    }
    CFAllocatorRef v39 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef v40 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, (const void *)(v96 + 44));
    if (+[MIOLog debugEnabled])
    {
      v41 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        int v42 = *(_DWORD *)(v96 + 44);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v42;
        _os_log_impl(&dword_21B5ED000, v41, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_Usage = %d", buf, 8u);
      }
    }
    OSStatus v43 = VTSessionSetProperty(*v95, (CFStringRef)*MEMORY[0x263F1E678], v40);
    CFRelease(v40);
    if (v43)
    {
      v44 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v43;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "kVTCompressionPropertyKey_Usage failed";
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
        __int16 v104 = 1024;
        int v105 = 434;
        _os_log_impl(&dword_21B5ED000, v44, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
      }
      goto LABEL_95;
    }
    int v45 = *(_DWORD *)(v96 + 48);
    if (v45 > 121)
    {
      switch(v45)
      {
        case 1308:
          v46 = @"HEVC_Main444_AutoLevel";
          goto LABEL_88;
        case 1309:
          goto LABEL_75;
        case 1310:
          v46 = @"HEVC_Main44410_AutoLevel";
          goto LABEL_88;
        case 1311:
          v46 = @"HEVC_Monochrome12_AutoLevel";
          goto LABEL_88;
        case 1312:
          v50 = (__CFString **)MEMORY[0x263F1EB80];
          goto LABEL_87;
        case 1313:
          v46 = @"HEVC_Monochrome10_AutoLevel";
          goto LABEL_88;
        default:
          if (v45 == 122)
          {
            v50 = (__CFString **)MEMORY[0x263F1EAA0];
          }
          else
          {
            if (v45 != 244) {
              goto LABEL_75;
            }
            v50 = (__CFString **)MEMORY[0x263F1EAA8];
          }
          break;
      }
      goto LABEL_87;
    }
    if (v45 <= 65)
    {
      switch(v45)
      {
        case 1:
          v46 = @"HEVC_Main_AutoLevel";
          goto LABEL_88;
        case 2:
          v46 = @"HEVC_Main10_AutoLevel";
          goto LABEL_88;
        case 3:
          v46 = @"HEVC_MainStill_AutoLevel";
          goto LABEL_88;
      }
LABEL_75:
      v44 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        int v51 = *(_DWORD *)(v96 + 48);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v51;
        _os_log_impl(&dword_21B5ED000, v44, OS_LOG_TYPE_ERROR, "Profile passed unrecognized (%d). exit.", buf, 8u);
      }
      goto LABEL_95;
    }
    switch(v45)
    {
      case 'B':
        v50 = (__CFString **)MEMORY[0x263F1EA88];
        break;
      case 'M':
        v50 = (__CFString **)MEMORY[0x263F1EB48];
        break;
      case 'd':
        v50 = (__CFString **)MEMORY[0x263F1EAF8];
        break;
      default:
        goto LABEL_75;
    }
LABEL_87:
    v46 = *v50;
LABEL_88:
    if (+[MIOLog debugEnabled])
    {
      v52 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v46;
        _os_log_impl(&dword_21B5ED000, v52, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_ProfileLevel = %{public}@", buf, 0xCu);
      }
    }
    if (VTSessionSetProperty(*v95, (CFStringRef)*MEMORY[0x263F1E638], v46))
    {
      v44 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "VTVideoEncoderSetProperty failed";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 507;
        _os_log_impl(&dword_21B5ED000, v44, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
      }
    }
    else
    {
      CFNumberRef v54 = CFNumberCreate(v39, kCFNumberSInt32Type, (const void *)(v96 + 52));
      if (+[MIOLog debugEnabled])
      {
        v55 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          int v56 = *(_DWORD *)(v96 + 52);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v56;
          _os_log_impl(&dword_21B5ED000, v55, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_Priority = %d", buf, 8u);
        }
      }
      OSStatus v57 = VTSessionSetProperty(*v95, (CFStringRef)*MEMORY[0x263F1E630], v54);
      CFRelease(v54);
      if (v57)
      {
        if (!+[MIOLog debugEnabled]) {
          return 2;
        }
        v44 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "kVTCompressionPropertyKey_Priority failed";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 524;
          _os_log_impl(&dword_21B5ED000, v44, OS_LOG_TYPE_DEBUG, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
        }
      }
      else
      {
        v58 = (const void *)*MEMORY[0x263EFFB40];
        v59 = (const void *)*MEMORY[0x263EFFB38];
        if (*(unsigned char *)(v96 + 67)) {
          v60 = (const void *)*MEMORY[0x263EFFB40];
        }
        else {
          v60 = (const void *)*MEMORY[0x263EFFB38];
        }
        if (+[MIOLog debugEnabled])
        {
          v61 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            int v62 = *(unsigned __int8 *)(v96 + 67);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v62;
            _os_log_impl(&dword_21B5ED000, v61, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_AllowFrameReordering = %d", buf, 8u);
          }
        }
        if (VTSessionSetProperty(*v95, (CFStringRef)*MEMORY[0x263F1E4C8], v60))
        {
          v44 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "VTVideoEncoderSetProperty failed";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCL"
                                  "osslessEncoder.mm";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 540;
            _os_log_impl(&dword_21B5ED000, v44, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
          }
        }
        else
        {
          CFNumberRef v63 = CFNumberCreate(v39, kCFNumberDoubleType, (const void *)(v96 + 56));
          if (+[MIOLog debugEnabled])
          {
            v64 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v65 = *(void *)(v96 + 56);
              *(_DWORD *)buf = 134217984;
              *(void *)&uint8_t buf[4] = v65;
              _os_log_impl(&dword_21B5ED000, v64, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration = %f", buf, 0xCu);
            }
          }
          OSStatus v66 = VTSessionSetProperty(*v95, (CFStringRef)*MEMORY[0x263F1E5C8], v63);
          CFRelease(v63);
          if (v66)
          {
            v44 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration failed";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEV"
                                    "CLosslessEncoder.mm";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 559;
              _os_log_impl(&dword_21B5ED000, v44, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
            }
          }
          else
          {
            CFNumberRef v67 = CFNumberCreate(v39, kCFNumberDoubleType, v17);
            if (+[MIOLog debugEnabled])
            {
              v68 = +[MIOLog defaultLog];
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v69 = *v17;
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = v69;
                _os_log_impl(&dword_21B5ED000, v68, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_ExpectedFrameRate = %f", buf, 0xCu);
              }
            }
            OSStatus v70 = VTSessionSetProperty(*v95, (CFStringRef)*MEMORY[0x263F1E548], v67);
            CFRelease(v67);
            if (!v70)
            {
              *(float *)valuePtr = 1.0;
              CFNumberRef v71 = CFNumberCreate(v39, kCFNumberFloat32Type, valuePtr);
              if (+[MIOLog debugEnabled])
              {
                v72 = +[MIOLog defaultLog];
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(double *)&uint8_t buf[4] = *(float *)valuePtr;
                  _os_log_impl(&dword_21B5ED000, v72, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_Quality = %f", buf, 0xCu);
                }
              }
              OSStatus v73 = VTSessionSetProperty(*v95, (CFStringRef)*MEMORY[0x263F1E640], v71);
              CFRelease(v71);
              if (v73)
              {
                v74 = +[MIOLog defaultLog];
                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&uint8_t buf[4] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_Quality failed";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStrea"
                                        "mHEVCLosslessEncoder.mm";
                  *(_WORD *)&buf[22] = 1024;
                  *(_DWORD *)&buf[24] = 595;
                  _os_log_impl(&dword_21B5ED000, v74, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
                }
              }
              else
              {
                if (*(unsigned char *)(v96 + 65)) {
                  v75 = v58;
                }
                else {
                  v75 = v59;
                }
                if (*(unsigned char *)v96) {
                  v76 = v59;
                }
                else {
                  v76 = v75;
                }
                if (+[MIOLog debugEnabled])
                {
                  v77 = +[MIOLog defaultLog];
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                  {
                    int v78 = *(unsigned __int8 *)(v96 + 65);
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)&uint8_t buf[4] = v78;
                    _os_log_impl(&dword_21B5ED000, v77, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_RealTime = %d", buf, 8u);
                  }
                }
                OSStatus v79 = VTSessionSetProperty(*v95, (CFStringRef)*MEMORY[0x263F1E650], v76);
                if (v79)
                {
                  v74 = +[MIOLog defaultLog];
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109890;
                    *(_DWORD *)&uint8_t buf[4] = v79;
                    *(_WORD *)&buf[8] = 2080;
                    *(void *)&buf[10] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_RealTime failed";
                    *(_WORD *)&buf[18] = 2080;
                    *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStr"
                                          "eamHEVCLosslessEncoder.mm";
                    __int16 v104 = 1024;
                    int v105 = 618;
                    _os_log_impl(&dword_21B5ED000, v74, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
                  }
                }
                else
                {
                  if (!*(unsigned char *)v96) {
                    goto LABEL_189;
                  }
                  if (+[MIOLog debugEnabled])
                  {
                    v80 = +[MIOLog defaultLog];
                    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                    {
                      int v81 = *(unsigned __int8 *)(v96 + 65);
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&uint8_t buf[4] = v81;
                      _os_log_impl(&dword_21B5ED000, v80, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_MaximizePowerEfficiency = %d", buf, 8u);
                    }
                  }
                  OSStatus v82 = VTSessionSetProperty(*v95, (CFStringRef)*MEMORY[0x263F1E5D0], v59);
                  if (v82)
                  {
                    v74 = +[MIOLog defaultLog];
                    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109890;
                      *(_DWORD *)&uint8_t buf[4] = v82;
                      *(_WORD *)&buf[8] = 2080;
                      *(void *)&buf[10] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_MaximizePowerEfficiency failed";
                      *(_WORD *)&buf[18] = 2080;
                      *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVS"
                                            "treamHEVCLosslessEncoder.mm";
                      __int16 v104 = 1024;
                      int v105 = 636;
                      _os_log_impl(&dword_21B5ED000, v74, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
                    }
                  }
                  else
                  {
LABEL_189:
                    if (*(unsigned char *)(v96 + 66)) {
                      v83 = v58;
                    }
                    else {
                      v83 = v59;
                    }
                    if (+[MIOLog debugEnabled])
                    {
                      v84 = +[MIOLog defaultLog];
                      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                      {
                        int v85 = *(unsigned __int8 *)(v96 + 66);
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)&uint8_t buf[4] = v85;
                        _os_log_impl(&dword_21B5ED000, v84, OS_LOG_TYPE_DEBUG, "Encoder Config >> my_kVTCompressionPropertyKey_DebugMetadataSEI2 = %d", buf, 8u);
                      }
                    }
                    OSStatus v86 = VTSessionSetProperty(*v95, @"DebugMetadataSEI", v83);
                    if (v86)
                    {
                      v74 = +[MIOLog defaultLog];
                      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67109890;
                        *(_DWORD *)&uint8_t buf[4] = v86;
                        *(_WORD *)&buf[8] = 2080;
                        *(void *)&buf[10] = "VTVideoEncoderSetProperty my_kVTCompressionPropertyKey_DebugMetadataSEI2 failed";
                        *(_WORD *)&buf[18] = 2080;
                        *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MO"
                                              "VStreamHEVCLosslessEncoder.mm";
                        __int16 v104 = 1024;
                        int v105 = 651;
                        _os_log_impl(&dword_21B5ED000, v74, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
                      }
                    }
                    else
                    {
                      CFNumberRef v87 = CFNumberCreate(v39, kCFNumberSInt32Type, v21);
                      if (+[MIOLog debugEnabled])
                      {
                        v88 = +[MIOLog defaultLog];
                        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
                        {
                          int v89 = *v21;
                          *(_DWORD *)buf = 67109120;
                          *(_DWORD *)&uint8_t buf[4] = v89;
                          _os_log_impl(&dword_21B5ED000, v88, OS_LOG_TYPE_DEBUG, "Encoder Config >> my_kVTCompressionPropertyKey_OutputBitDepth = %d", buf, 8u);
                        }
                      }
                      OSStatus v90 = VTSessionSetProperty(*v95, @"OutputBitDepth", v87);
                      CFRelease(v87);
                      if (!v90)
                      {
                        if (!+[MIOLog debugEnabled]) {
                          goto LABEL_17;
                        }
                        uint64_t v23 = +[MIOLog defaultLog];
                        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                        {
LABEL_16:

LABEL_17:
                          *(void *)buf = *MEMORY[0x263EFFB38];
                          if (VTSessionCopyProperty(*v95, (CFStringRef)*MEMORY[0x263F1E4C8], (CFAllocatorRef)*MEMORY[0x263EFFB08], buf))
                          {
                            id v25 = (MOVStreamHEVCLosslessEncoder *)(id)[MEMORY[0x263F087E8] writerWarningWithMessage:@"Cannot check AllowFrameReordering status of encoding session. Assuming disabled." code:0];
                          }
                          else
                          {
                            *(unsigned char *)(v96 + 109) = *(void *)buf == *MEMORY[0x263EFFB40];
                            if (+[MIOLog debugEnabled])
                            {
                              v47 = +[MIOLog defaultLog];
                              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                              {
                                int v48 = *(unsigned __int8 *)(v96 + 109);
                                *(float *)valuePtr = 1.5047e-36;
                                int v98 = v48;
                                _os_log_impl(&dword_21B5ED000, v47, OS_LOG_TYPE_DEBUG, "AllowFrameReordering: %d", valuePtr, 8u);
                              }
                            }
                            CFRelease(*(CFTypeRef *)buf);
                          }
                          if (a6)
                          {
                            MOVStreamHEVCLosslessEncoder::propagateColorAttachments(v25, a6, (OpaqueVTCompressionSession *)*v95);
                          }
                          else if (+[MIOLog debugEnabled])
                          {
                            v49 = +[MIOLog defaultLog];
                            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                            {
                              *(_WORD *)valuePtr = 0;
                              _os_log_impl(&dword_21B5ED000, v49, OS_LOG_TYPE_DEBUG, "Missing format discription for VTCompressionSession.", valuePtr, 2u);
                            }
                          }
                          return 0;
                        }
                        *(_WORD *)buf = 0;
                        uint64_t v24 = "*-----------------------------------------------------------------------------*";
LABEL_15:
                        _os_log_impl(&dword_21B5ED000, v23, OS_LOG_TYPE_DEBUG, v24, buf, 2u);
                        goto LABEL_16;
                      }
                      v74 = +[MIOLog defaultLog];
                      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315650;
                        *(void *)&uint8_t buf[4] = "VTVideoEncoderSetProperty my_kVTCompressionPropertyKey_OutputBitDepth failed";
                        *(_WORD *)&buf[12] = 2080;
                        *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MO"
                                              "VStreamHEVCLosslessEncoder.mm";
                        *(_WORD *)&buf[22] = 1024;
                        *(_DWORD *)&buf[24] = 669;
                        _os_log_impl(&dword_21B5ED000, v74, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
                      }
                    }
                  }
                }
              }

              return 2;
            }
            v44 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_ExpectedFrameRate failed";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEV"
                                    "CLosslessEncoder.mm";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 577;
              _os_log_impl(&dword_21B5ED000, v44, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
            }
          }
        }
      }
    }
LABEL_95:

    return 2;
  }
  uint64_t v26 = MEMORY[0x263EFFA88];
  uint64_t v27 = *MEMORY[0x263F1ED58];
  v101[0] = *MEMORY[0x263F1ED50];
  v101[1] = v27;
  v102[0] = MEMORY[0x263EFFA88];
  v102[1] = MEMORY[0x263EFFA88];
  id v28 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:2];
  uint64_t v29 = v96;
  v30 = *(void **)(v96 + 8);
  if (v30)
  {
    os_signpost_id_t v31 = [v30 overrideVideoEncoderSpecification];
    id v32 = v31;
    if (v31)
    {
      id v33 = v31;

      id v28 = v33;
      uint64_t v29 = v96;
    }
    int v34 = [*(id *)(v29 + 8) codecTypeOverride];
    if (v34) {
      *(_DWORD *)(v29 + 104) = v34;
    }

    uint64_t v29 = v96;
  }
  if (!*(unsigned char *)(v29 + 1)) {
    goto LABEL_46;
  }
  v35 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v35, OS_LOG_TYPE_INFO, "VTCompressionSession: Enabling kVTCompressionSessionOption_AllowClientProcessEncode", buf, 2u);
  }

  uint64_t v99 = *MEMORY[0x263F1E6C0];
  uint64_t v100 = v26;
  v92 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
  v93 = v95;
  outputCallbackRefCon = a8;
  uint64_t v36 = VTCompressionSessionCreateWithOptions();

  uint64_t v29 = v96;
  if (!*(unsigned char *)(v96 + 1))
  {
LABEL_46:
    uint64_t v36 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, a3, *(_DWORD *)(v29 + 104), (CFDictionaryRef)v28, 0, 0, a7, a8, (VTCompressionSessionRef *)v95);
    if (v36) {
      goto LABEL_30;
    }
LABEL_47:

    a1 = v96;
    goto LABEL_7;
  }
  if (!v36) {
    goto LABEL_47;
  }
LABEL_30:
  v37 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = v36;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = "VTCompressionSessionCreate failed\n";
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
    __int16 v104 = 1024;
    int v105 = 187;
    _os_log_impl(&dword_21B5ED000, v37, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
  }

  return v36;
}

void sub_21B637370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MOVStreamHEVCLosslessEncoder::propagateColorAttachments(MOVStreamHEVCLosslessEncoder *this, CMFormatDescriptionRef desc, OpaqueVTCompressionSession *a3)
{
  CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(desc);
  if (Extensions)
  {
    CFDictionaryRef v5 = Extensions;
    Value = CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x263F04020]);
    if (Value) {
      VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x263F1E6A8], Value);
    }
    unsigned int v7 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x263F03ED8]);
    if (v7) {
      VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x263F1E508], v7);
    }
    uint64_t v8 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x263F03FC0]);
    if (v8)
    {
      uint64_t v9 = v8;
      VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x263F1E670], v8);
      if (CFEqual(v9, (CFTypeRef)*MEMORY[0x263F04008]))
      {
        uint64_t v10 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x263F03F48]);
        if (v10) {
          VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x263F1E568], v10);
        }
      }
    }
    uint64_t v11 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x263F00E70]);
    if (v11) {
      VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x263F1E580], v11);
    }
  }
  return 0;
}

MOVStreamHEVCLosslessEncoder *MOVStreamHEVCLosslessEncoder::invalidateSession(MOVStreamHEVCLosslessEncoder *this)
{
  if (!this->var12) {
    this->var12 = 1;
  }
  return this;
}

uint64_t MOVStreamHEVCLosslessEncoder::Close(MOVStreamHEVCLosslessEncoder *this)
{
  if (!this->var12)
  {
    this->var12 = 1;
    var6 = this->var6;
    CMTime v5 = *(CMTime *)*(void *)&MEMORY[0x263F01098];
    VTCompressionSessionCompleteFrames(var6, &v5);
    uint64_t v3 = this->var6;
    if (v3)
    {
      CFRelease(v3);
      this->var6 = 0;
    }
  }
  return 0;
}

void MOVStreamHEVCLosslessEncoder::InvalidateEncoder(MOVStreamHEVCLosslessEncoder *this)
{
  if (!this->var12)
  {
    this->var12 = 1;
    var6 = this->var6;
    if (var6)
    {
      CFRelease(var6);
      this->var6 = 0;
    }
  }
}

BOOL MOVStreamHEVCLosslessEncoder::isSessionClosed(MOVStreamHEVCLosslessEncoder *this)
{
  return this->var12;
}

BOOL MOVStreamHEVCLosslessEncoder::frameReorderingEnabled(MOVStreamHEVCLosslessEncoder *this)
{
  return this->var13;
}

uint64_t MOVStreamHEVCLosslessEncoder::EncodeFrame(MOVStreamHEVCLosslessEncoder *this, __CVBuffer *a2, CMTime *a3, CFDictionaryRef frameProperties, void *sourceFrameRefcon)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  VTEncodeInfoFlags infoFlagsOut = 0;
  var6 = this->var6;
  CMTime presentationTimeStamp = *a3;
  CMTime v12 = *(CMTime *)*(void *)&MEMORY[0x263F01098];
  uint64_t v8 = VTCompressionSessionEncodeFrame(var6, a2, &presentationTimeStamp, &v12, frameProperties, sourceFrameRefcon, &infoFlagsOut);
  if (v8)
  {
    uint64_t v9 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      int v16 = v8;
      __int16 v17 = 2080;
      int v18 = "VTCompressionSessionEncodeFrame failed\n";
      __int16 v19 = 2080;
      int v20 = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
      __int16 v21 = 1024;
      int v22 = 380;
      _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
    }
  }
  else
  {
    long long v10 = *(_OWORD *)&a3->value;
    this->var8.var3 = a3->epoch;
    *(_OWORD *)&this->var8.var0 = v10;
    ++this->var9;
  }
  return v8;
}

void sub_21B637BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B637CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6382D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_21B638738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21B638AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21B63945C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_21B63A0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_21B63BB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,uint64_t a29,void *a30,void *a31,void *a32,uint64_t a33,void *a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46)
{
  _Unwind_Resume(a1);
}

void sub_21B63C1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63C2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63C334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B63C40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63C4C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63C544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63C71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B63C9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B63CAAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63CB14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63CB90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63CCB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63D058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63D324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63D574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63D798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63D874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63D924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63E188(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(a1);
    int v16 = NSString;
    int v18 = [v11 streamId];
    __int16 v17 = [v16 stringWithFormat:@"Cannot read sample buffer for '%@': %@"];

    [MEMORY[0x263F087E8] populateReaderError:a11 message:v17 code:27];
    objc_end_catch();
    JUMPOUT(0x21B63E118);
  }
  _Unwind_Resume(a1);
}

void sub_21B63E4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63E870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_21B63E9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63EF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63F0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63F260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63F390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63F564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63F9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21B63FB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63FD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B63FF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B6404B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_21B6407E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6409A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B640A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B640D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B640FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B6410B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B641484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B641BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6429FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B642A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOL010ToL010Stride16FrameProcessor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B642F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B6433D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B643538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6437B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B643984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B643A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MOVStreamReader;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B643E78(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21B645A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_21B64609C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B646238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B646604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_21B646808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B646B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B646EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B646FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21B64707C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B647474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B647664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6477E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6478DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B647980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B647B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B647BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B647C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B647D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B647DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B647DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B647E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B647F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648098(_Unwind_Exception *a1)
{
  CMTime v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B648148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6481D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6482F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648428(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21B648518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B648594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64861C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B648818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6488E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64897C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B648F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6490A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6494D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6497A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B649FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64A150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64A2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64A744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_21B64A964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64AA60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64AB28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64AD54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64AE50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64AEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t unpack_buffer(uint64_t result, uint64_t a2, uint64_t *a3, int a4, double a5, double a6, double a7, int8x16_t a8)
{
  uint64_t v8 = a3[1];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *a3;
    unint64_t v11 = a3[2];
    uint64_t v12 = a3[3];
    uint64_t v13 = v11 >> 2;
    if (v11 >> 2 <= 1) {
      uint64_t v13 = 1;
    }
    BOOL v14 = (unsigned __int8 *)(result + 4);
    v15.i64[0] = 0x3000000030;
    v15.i64[1] = 0x3000000030;
    do
    {
      if (v11 >= 4)
      {
        uint64_t v16 = 0;
        __int16 v17 = v14;
        do
        {
          unsigned int v18 = *v17;
          *(uint32x2_t *)v19.i8 = vshl_u32((uint32x2_t)vdup_n_s32(v18), (uint32x2_t)0x200000004);
          size_t result = v18 >> 2;
          a8.i32[0] = *((_DWORD *)v17 - 1);
          uint16x4_t v20 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)a8.i8).u64[0];
          v19.i32[2] = v18;
          v19.i32[3] = v18 >> 2;
          int8x16_t v21 = vorrq_s8((int8x16_t)vshll_n_u16(v20, 6uLL), vandq_s8(v19, v15));
          a8 = vorrq_s8(v21, (int8x16_t)vshrq_n_u32(vmovl_u16(v20), 4uLL));
          if (a4) {
            unsigned int v22 = -1;
          }
          else {
            unsigned int v22 = 0;
          }
          *(int16x4_t *)(v10 + 8 * v16++) = vmovn_s32((int32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v22), a8, v21));
          v17 += 5;
        }
        while (v13 != v16);
      }
      v10 += v12;
      ++v9;
      v14 += a2;
    }
    while (v9 != v8);
  }
  return result;
}

{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int8x16_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;
  int8x16_t v19;
  uint16x4_t v20;
  int8x16_t v21;
  unsigned int v22;

  uint64_t v8 = a3[1];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *a3;
    unint64_t v11 = a3[2];
    uint64_t v12 = a3[3];
    uint64_t v13 = v11 >> 2;
    if (v11 >> 2 <= 1) {
      uint64_t v13 = 1;
    }
    BOOL v14 = (unsigned __int8 *)(result + 4);
    v15.i64[0] = 0xC0000000C0;
    v15.i64[1] = 0xC0000000C0;
    do
    {
      if (v11 >= 4)
      {
        uint64_t v16 = 0;
        __int16 v17 = v14;
        do
        {
          unsigned int v18 = *v17;
          *(uint32x2_t *)v19.i8 = vshl_u32((uint32x2_t)vdup_n_s32(v18), (uint32x2_t)0x400000006);
          size_t result = 4 * v18;
          a8.i32[0] = *((_DWORD *)v17 - 1);
          uint16x4_t v20 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)a8.i8).u64[0];
          v19.i32[2] = 4 * v18;
          v19.i32[3] = v18;
          int8x16_t v21 = vorrq_s8((int8x16_t)vshll_n_u16(v20, 8uLL), vandq_s8(v19, v15));
          a8 = vorrq_s8(v21, (int8x16_t)vshrq_n_u32(vmovl_u16(v20), 2uLL));
          if (a4) {
            unsigned int v22 = -1;
          }
          else {
            unsigned int v22 = 0;
          }
          *(int16x4_t *)(v10 + 8 * v16++) = vmovn_s32((int32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v22), a8, v21));
          v17 += 5;
        }
        while (v13 != v16);
      }
      v10 += v12;
      ++v9;
      v14 += a2;
    }
    while (v9 != v8);
  }
  return result;
}

__int16 **pack_buffer(__int16 **result, uint64_t a2, unsigned char *a3)
{
  unint64_t v3 = (unint64_t)result[1];
  if (v3)
  {
    unint64_t v4 = 0;
    CMTime v5 = *result;
    unint64_t v6 = (unint64_t)result[2];
    do
    {
      if (v6 >= 4)
      {
        unint64_t v7 = 0;
        uint64_t v8 = v5;
        uint64_t v9 = a3;
        do
        {
          __int16 v10 = *v8;
          unsigned int v11 = (unsigned __int16)v8[1];
          unsigned int v12 = (unsigned __int16)v8[2];
          __int16 v13 = v8[3];
          unsigned char *v9 = HIBYTE(*v8);
          v9[1] = BYTE1(v11);
          v9[2] = BYTE1(v12);
          v9[3] = HIBYTE(v13);
          v9[4] = (v11 >> 4) & 0xC | (v10 >> 6) | (v12 >> 2) & 0x30 | v13 & 0xC0;
          ++v7;
          unint64_t v6 = (unint64_t)result[2];
          v8 += 4;
          v9 += 5;
        }
        while (v7 < v6 >> 2);
        unint64_t v3 = (unint64_t)result[1];
      }
      a3 += a2;
      CMTime v5 = (__int16 *)((char *)result[3] + (void)v5);
      ++v4;
    }
    while (v3 > v4);
  }
  return result;
}

uint64_t conv_q8q2_to_L010(uint64_t result, int a2, int16x8_t *a3, int a4, unsigned int a5, int a6)
{
  if (a6)
  {
    int v6 = 0;
    unsigned int v7 = (a5 + 7) >> 3;
    if (v7 <= 1) {
      unsigned int v7 = 1;
    }
    v8.i64[0] = 0xC000C000C000C0;
    v8.i64[1] = 0xC000C000C000C0;
    do
    {
      if (a5 + 7 >= 8)
      {
        for (int i = 0; i != v7; ++i)
        {
          BOOL v10 = (a5 & 7) != 0 && i == 1;
          if (v10) {
            uint64_t v11 = -5;
          }
          else {
            uint64_t v11 = 0;
          }
          unsigned int v12 = (int8x16_t *)(result + v11);
          if (v10) {
            uint64_t v13 = -8;
          }
          else {
            uint64_t v13 = 0;
          }
          int8x16_t v14 = *v12;
          size_t result = (uint64_t)&v12->i64[1] + 2;
          int8x16_t v15 = (int16x8_t *)((char *)a3 + v13);
          int16x8_t *v15 = vsliq_n_s16((int16x8_t)vandq_s8((int8x16_t)vshlq_u16(vmovl_u8((uint8x8_t)vqtbl1_s8(v14, (int8x8_t)0x909090904040404)), (uint16x8_t)xmmword_21B6614F0), v8), (int16x8_t)vmovl_u8((uint8x8_t)vqtbl1_s8(v14, (int8x8_t)0x807060503020100)), 8uLL);
          a3 = v15 + 1;
        }
      }
      result += a2 - 5 * (a5 >> 2);
      a3 = (int16x8_t *)((char *)a3 + 2 * ((a4 - 2 * a5) >> 1));
      ++v6;
    }
    while (v6 != a6);
  }
  return result;
}

int16x8_t *conv_L010_to_q8q2(int16x8_t *result, int a2, unsigned __int8 *a3, int a4, unsigned int a5, int a6)
{
  if (a6)
  {
    int v6 = 0;
    unsigned int v7 = (a5 + 7) >> 3;
    uint64_t v8 = (a2 - 2 * a5) >> 1;
    if (v7 <= 1) {
      unsigned int v7 = 1;
    }
    v9.i64[0] = 0xC000C000C000C0;
    v9.i64[1] = 0xC000C000C000C0;
    do
    {
      if (a5 + 7 >= 8)
      {
        for (int i = 0; i != v7; ++i)
        {
          BOOL v11 = (a5 & 7) != 0 && i == 1;
          if (v11) {
            uint64_t v12 = -5;
          }
          else {
            uint64_t v12 = 0;
          }
          uint64_t v13 = &a3[v12];
          if (v11) {
            uint64_t v14 = -8;
          }
          else {
            uint64_t v14 = 0;
          }
          int8x16_t v15 = (int16x8_t *)((char *)result + v14);
          int16x8_t v16 = *v15;
          size_t result = v15 + 1;
          *(int8x8_t *)v17.i8 = vshrn_n_s16(v16, 8uLL);
          int8x8_t v18 = vmovn_s16((int16x8_t)vshlq_u16((uint16x8_t)vandq_s8((int8x16_t)v16, v9), (uint16x8_t)xmmword_21B661500));
          int8x8_t v19 = vpadd_s8(v18, v18);
          v17.u64[1] = (unint64_t)vpadd_s8(v19, v19);
          int8x16_t v20 = vqtbl1q_s8(v17, (int8x16_t)xmmword_21B661510);
          *((_WORD *)v13 + 4) = v20.i16[4];
          *(void *)uint64_t v13 = v20.i64[0];
          a3 = v13 + 10;
        }
      }
      size_t result = (int16x8_t *)((char *)result + 2 * v8);
      a3 += a4 - 5 * (a5 >> 2);
      ++v6;
    }
    while (v6 != a6);
  }
  return result;
}

void sub_21B64B5D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64B698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64B77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64BA10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64BDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64BEC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *std::vector<CMTime>::__assign_with_size[abi:ne180100]<CMTime*,CMTime*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  unsigned int v7 = result;
  uint64_t v8 = *((void *)result + 2);
  int8x16_t v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(void *)result) >> 3) < a4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    size_t result = std::vector<CMTime>::__vallocate[abi:ne180100](v7, v12);
    uint64_t v14 = (char *)v7[1];
    uint64_t v13 = (void **)(v7 + 1);
    int8x16_t v9 = v14;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      int8x8_t v18 = v9;
      int8x8_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v13 = (void **)(result + 8);
  int8x16_t v15 = (unsigned char *)*((void *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 3) >= a4) {
    goto LABEL_16;
  }
  int16x8_t v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    size_t result = (char *)memmove(*(void **)result, __src, v15 - v9);
    int8x16_t v9 = (char *)*v13;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    int8x8_t v18 = v9;
    int8x8_t v19 = v16;
LABEL_18:
    size_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  unsigned __int8 *v13 = &v9[v17];
  return result;
}

char *std::vector<CMTime>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<CMTime>::__throw_length_error[abi:ne180100]();
  }
  size_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_21B64C230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64C2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64C3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64C794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64C9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B64CAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64CC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64CDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64D184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64D338(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21B64D494(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21B64D6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64D8EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64DCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64DE10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64E0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64E428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64E7EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64EB88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64EEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64F244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64F5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64F840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64FAB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64FC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64FCE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64FD8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B64FEE0(_Unwind_Exception *a1)
{
  unsigned int v7 = v6;

  _Unwind_Resume(a1);
}

void sub_21B650184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B650318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double timerEnd(uint64_t a1)
{
  uint64_t v1 = mach_absolute_time() - a1;
  mach_timebase_info(&info);
  double v2 = (double)(v1 * info.numer / info.denom) / 1000000.0;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C59F30, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C59F30))
  {
    qword_267C59F28 = *(void *)&v2;
    __cxa_guard_release(&qword_267C59F30);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C59F40, memory_order_acquire) & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_267C59F40))
    {
      qword_267C59F38 = *(void *)&v2;
      __cxa_guard_release(&qword_267C59F40);
    }
  }
  int v3 = _MergedGlobals;
  int v4 = ++_MergedGlobals;
  if (v3)
  {
    double v5 = *(double *)&qword_267C59F28;
    if (v2 >= *(double *)&qword_267C59F28)
    {
      double v6 = *(double *)&qword_267C59F38;
      if (v2 <= *(double *)&qword_267C59F38) {
        goto LABEL_6;
      }
LABEL_10:
      qword_267C59F38 = *(void *)&v2;
      double v6 = v2;
      double v7 = v2 + *(double *)&qword_267C59F48;
      *(double *)&qword_267C59F48 = v2 + *(double *)&qword_267C59F48;
      if (v4 != 480) {
        return v2;
      }
      goto LABEL_11;
    }
    qword_267C59F28 = *(void *)&v2;
    double v5 = v2;
    double v6 = *(double *)&qword_267C59F38;
    if (v2 > *(double *)&qword_267C59F38) {
      goto LABEL_10;
    }
  }
  else
  {
    qword_267C59F28 = *(void *)&v2;
    qword_267C59F38 = *(void *)&v2;
    qword_267C59F48 = 0;
    double v5 = v2;
    double v6 = v2;
  }
LABEL_6:
  double v7 = v2 + *(double *)&qword_267C59F48;
  *(double *)&qword_267C59F48 = v2 + *(double *)&qword_267C59F48;
  if (v4 != 480) {
    return v2;
  }
LABEL_11:
  printf("duration = %5.3f msec, min/max/avg/count = %5.3f/%5.3f/%5.3f/%d\n", v2, v5, v6, v7 / 480.0, 480);
  _MergedGlobals = 0;
  return v2;
}

unsigned __int16 *right_shift_uint16_buffer(unsigned __int16 *result, uint16x8_t *a2, unint64_t a3, char a4)
{
  int16x8_t v4 = vdupq_n_s16(a4);
  double v5 = (uint16x8_t *)result;
  double v6 = a2;
  if (a3 >= 0x40)
  {
    unint64_t v7 = a3 >> 6;
    uint16x8_t v8 = (uint16x8_t)vnegq_s16(v4);
    double v6 = a2;
    double v5 = (uint16x8_t *)result;
    do
    {
      uint16x8_t *v6 = vshlq_u16(*v5, v8);
      v6[1] = vshlq_u16(v5[1], v8);
      v6[2] = vshlq_u16(v5[2], v8);
      v6[3] = vshlq_u16(v5[3], v8);
      v5 += 4;
      v6 += 4;
      --v7;
    }
    while (v7);
  }
  uint64_t v9 = (a3 >> 4) & 3;
  if (v9)
  {
    uint16x8_t v10 = (uint16x8_t)vnegq_s16(v4);
    uint16x8_t *v6 = vshlq_u16(*v5, v10);
    if (v9 != 1)
    {
      v6[1] = vshlq_u16(v5[1], v10);
      if (v9 != 2) {
        v6[2] = vshlq_u16(v5[2], v10);
      }
    }
  }
  uint64_t v11 = (a3 >> 1) & 7;
  if (v11)
  {
    a2->i16[0] = *result >> a4;
    if (v11 != 1)
    {
      a2->i16[1] = result[1] >> a4;
      if (v11 != 2)
      {
        a2->i16[2] = result[2] >> a4;
        if (v11 != 3)
        {
          a2->i16[3] = result[3] >> a4;
          if (v11 != 4)
          {
            a2->i16[4] = result[4] >> a4;
            if (v11 != 5)
            {
              a2->i16[5] = result[5] >> a4;
              if (v11 != 6) {
                a2->i16[6] = result[6] >> a4;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned __int16 *left_shift_uint16_buffer(unsigned __int16 *result, uint16x8_t *a2, unint64_t a3, char a4)
{
  uint16x8_t v4 = (uint16x8_t)vdupq_n_s16(a4);
  double v5 = (uint16x8_t *)result;
  double v6 = a2;
  if (a3 >= 0x40)
  {
    unint64_t v7 = a3 >> 6;
    double v6 = a2;
    double v5 = (uint16x8_t *)result;
    do
    {
      uint16x8_t *v6 = vshlq_u16(*v5, v4);
      v6[1] = vshlq_u16(v5[1], v4);
      v6[2] = vshlq_u16(v5[2], v4);
      v6[3] = vshlq_u16(v5[3], v4);
      v5 += 4;
      v6 += 4;
      --v7;
    }
    while (v7);
  }
  uint64_t v8 = (a3 >> 4) & 3;
  if (v8)
  {
    uint16x8_t *v6 = vshlq_u16(*v5, v4);
    if (v8 != 1)
    {
      v6[1] = vshlq_u16(v5[1], v4);
      if (v8 != 2) {
        v6[2] = vshlq_u16(v5[2], v4);
      }
    }
  }
  uint64_t v9 = (a3 >> 1) & 7;
  if (v9)
  {
    a2->i16[0] = *result << a4;
    if (v9 != 1)
    {
      a2->i16[1] = result[1] << a4;
      if (v9 != 2)
      {
        a2->i16[2] = result[2] << a4;
        if (v9 != 3)
        {
          a2->i16[3] = result[3] << a4;
          if (v9 != 4)
          {
            a2->i16[4] = result[4] << a4;
            if (v9 != 5)
            {
              a2->i16[5] = result[5] << a4;
              if (v9 != 6) {
                a2->i16[6] = result[6] << a4;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t join_bayer_buffer_yuv(uint64_t result, const unsigned __int16 *a2, unsigned __int16 *a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7, unint64_t a8, unsigned int a9, BOOL a10)
{
  if (a5)
  {
    uint64_t v10 = 0;
    unsigned int v11 = 0;
    unint64_t v12 = 2 * a4;
    unint64_t v13 = (a4 >> 3) & 0xFFFFFFFFFFFFFFFLL;
    unint64_t v14 = a6 >> 1;
    unint64_t v15 = a7 >> 1;
    unint64_t v16 = a8 >> 1;
    unint64_t v17 = ((2 * a4) >> 2) & 3;
    unint64_t v18 = 2 * (a6 >> 1);
    uint64_t v19 = 2 * (a8 >> 1);
    uint64_t v20 = 2 * (a7 >> 1);
    unint64_t v21 = 8 * v13;
    uint16x8_t v22 = (uint16x8_t)vnegq_s16(vdupq_n_s16(a9));
    do
    {
      if (v12 >= 0x10)
      {
        uint64_t v23 = 0;
        uint64_t v24 = (char *)&a3[v18 / 2] + v18 * v11;
        unint64_t v25 = (unint64_t)v11 >> 1;
        uint64_t v26 = (char *)a2 + v19 * v25;
        uint64_t v27 = result + v20 * v25;
        do
        {
          int8x16_t v28 = (int8x16_t)vshlq_u16(*(uint16x8_t *)(v27 + 16 * v23), v22);
          int8x16_t v29 = (int8x16_t)vshlq_u16(*(uint16x8_t *)&v26[16 * v23], v22);
          int8x16_t v30 = (int8x16_t)vshrq_n_u16((uint16x8_t)v28, 0xAuLL);
          int8x16_t v31 = (int8x16_t)vshrq_n_u16((uint16x8_t)v29, 0xAuLL);
          if (a10) {
            unsigned int v32 = -1;
          }
          else {
            unsigned int v32 = 0;
          }
          int8x16_t v33 = (int8x16_t)vdupq_n_s16(v32);
          v44.val[1] = vorrq_s8(vandq_s8(v30, v33), v28);
          v43.val[0] = vandq_s8(v31, v33);
          v44.val[0] = vorrq_s8(v43.val[0], v29);
          *(int16x4_t *)v43.val[0].i8 = vmovn_s32((int32x4_t)v44.val[1]);
          v43.val[1] = *(int8x16_t *)&v24[16 * v23];
          *(int8x16_t *)&v24[16 * v23] = vqtbl2q_s8(v43, (int8x16_t)xmmword_21B6615A0);
          *(int8x16_t *)((char *)&a3[8 * v23] + v18 * v11) = vqtbl2q_s8(v44, (int8x16_t)xmmword_21B6615B0);
          v43.val[0] = (int8x16_t)vuzp2q_s16((int16x8_t)v44.val[0], (int16x8_t)xmmword_21B6615A0);
          v43.val[1] = *(int8x16_t *)&v24[16 * v23];
          *(int8x16_t *)&v24[16 * v23++] = vqtbl2q_s8(v43, (int8x16_t)xmmword_21B6615C0);
        }
        while (v13 > v23);
      }
      if (!v17) {
        goto LABEL_4;
      }
      int v34 = &a3[v10 * v14];
      uint64_t v35 = v11 >> 1;
      uint64_t v36 = result + 2 * v15 * v35;
      v37 = &a2[v16 * v35];
      v38 = &v34[v21];
      CFAllocatorRef v39 = &a3[v14 * (v11 | 1) + v21];
      CFNumberRef v40 = (unsigned __int16 *)(v36 + v21 * 2);
      v41 = (unsigned __int16 *)&v37[v21];
      unsigned __int16 *v39 = *v40 >> a9;
      v38[1] = v40[1] >> a9;
      unsigned __int16 *v38 = v37[8 * v13] >> a9;
      v39[1] = v37[v21 + 1] >> a9;
      if (a10)
      {
        *v39 |= *v39 >> 10;
        v38[1] |= v38[1] >> 10;
        *v38 |= *v38 >> 10;
        v39[1] |= v39[1] >> 10;
        if (v17 == 1) {
          goto LABEL_4;
        }
        v39[1] = v40[1] >> a9;
        v38[2] = v40[2] >> a9;
        v38[1] = v41[1] >> a9;
        v39[2] = v41[2] >> a9;
        v39[1] |= v39[1] >> 10;
        v38[2] |= v38[2] >> 10;
        v38[1] |= v38[1] >> 10;
        v39[2] |= v39[2] >> 10;
        if (v17 == 2) {
          goto LABEL_4;
        }
        v39[2] = v40[2] >> a9;
        v38[3] = v40[3] >> a9;
        v38[2] = v41[2] >> a9;
        v39[3] = v41[3] >> a9;
        v39[2] |= v39[2] >> 10;
        v38[3] |= v38[3] >> 10;
        v38[2] |= v38[2] >> 10;
        int v42 = v39[3] | (v39[3] >> 10);
      }
      else
      {
        if (v17 == 1) {
          goto LABEL_4;
        }
        v39[1] = v40[1] >> a9;
        v38[2] = v40[2] >> a9;
        v38[1] = v41[1] >> a9;
        v39[2] = v41[2] >> a9;
        if (v17 == 2) {
          goto LABEL_4;
        }
        v39[2] = v40[2] >> a9;
        v38[3] = v40[3] >> a9;
        v38[2] = v41[2] >> a9;
        int v42 = v41[3] >> a9;
      }
      v39[3] = v42;
LABEL_4:
      v11 += 2;
      uint64_t v10 = v11;
    }
    while (v11 < a5);
  }
  return result;
}

uint64_t copy_alpha_channel_to_monochrome(uint64_t result, unsigned __int16 *a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  if (a4)
  {
    unint64_t v6 = (a3 >> 3) & 0xFFFFFFFFFFFFFFFLL;
    unint64_t v7 = a6 >> 1;
    uint64_t v8 = a3 & 7;
    unint64_t v9 = a5 >> 1;
    if (v6)
    {
      if ((a3 & 7) != 0)
      {
        uint64_t v10 = 0;
        uint64_t v11 = result;
        unint64_t v12 = a2;
        do
        {
          uint64_t v13 = 0;
          do
          {
            unint64_t v14 = (const __int16 *)(v11 + (v13 << 6));
            unsigned long long v15 = (unsigned __int128)vld4q_s16(v14);
            *(_OWORD *)&v12[8 * v13++] = v15;
          }
          while (v6 > v13);
          unint64_t v16 = (unsigned __int16 *)(result + 2 * v10 * v7 + (v6 << 6));
          unint64_t v17 = &a2[8 * v6 + v10 * v9];
          unsigned __int16 *v17 = *v16;
          if (v8 != 1)
          {
            v17[1] = v16[4];
            if (v8 != 2)
            {
              v17[2] = v16[8];
              if (v8 != 3)
              {
                v17[3] = v16[12];
                if (v8 != 4)
                {
                  v17[4] = v16[16];
                  if (v8 != 5)
                  {
                    v17[5] = v16[20];
                    if (v8 != 6) {
                      v17[6] = v16[24];
                    }
                  }
                }
              }
            }
          }
          ++v10;
          v12 += v9;
          v11 += 2 * v7;
        }
        while (a4 > v10);
      }
      else
      {
        uint64_t v24 = 2 * v9;
        uint64_t v25 = 2 * v7;
        do
        {
          uint64_t v26 = 0;
          do
          {
            uint64_t v27 = (const __int16 *)(result + (v26 << 6));
            unsigned long long v28 = (unsigned __int128)vld4q_s16(v27);
            *(_OWORD *)&a2[8 * v26++] = v28;
          }
          while (v6 > v26);
          ++v8;
          a2 = (unsigned __int16 *)((char *)a2 + v24);
          result += v25;
        }
        while (a4 > v8);
      }
    }
    else if ((a3 & 7) != 0)
    {
      unint64_t v18 = a2 + 3;
      uint64_t v19 = 2 * v9;
      uint64_t v20 = (unsigned __int16 *)(result + 24);
      uint64_t v21 = 2 * v7;
      uint64_t v22 = 1;
      do
      {
        *(v18 - 3) = *(v20 - 12);
        if (v8 != 1)
        {
          *(v18 - 2) = *(v20 - 8);
          if (v8 != 2)
          {
            *(v18 - 1) = *(v20 - 4);
            if (v8 != 3)
            {
              unsigned __int16 *v18 = *v20;
              if (v8 != 4)
              {
                v18[1] = v20[4];
                if (v8 != 5)
                {
                  v18[2] = v20[8];
                  if (v8 != 6) {
                    v18[3] = v20[12];
                  }
                }
              }
            }
          }
        }
        BOOL v23 = a4 > v22++;
        unint64_t v18 = (unsigned __int16 *)((char *)v18 + v19);
        uint64_t v20 = (unsigned __int16 *)((char *)v20 + v21);
      }
      while (v23);
    }
  }
  return result;
}

uint64_t copy_monochrome_to_alpha_channel(uint64_t result, unsigned __int16 *a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  if (a4)
  {
    unint64_t v6 = (a3 >> 3) & 0xFFFFFFFFFFFFFFFLL;
    unint64_t v7 = a5 >> 1;
    uint64_t v8 = a3 & 7;
    unint64_t v9 = a6 >> 1;
    if (v6)
    {
      if ((a3 & 7) != 0)
      {
        uint64_t v10 = 0;
        *(void *)&long long v11 = 0x8000800080008000;
        *((void *)&v11 + 1) = 0x8000800080008000;
        uint64_t v12 = result;
        uint64_t v13 = a2;
        do
        {
          uint64_t v14 = 0;
          do
          {
            unsigned long long v15 = (int8x16_t *)&v13[32 * v14];
            long long v16 = *(_OWORD *)(v12 + 16 * v14);
            uint64_t v15[2] = vqtbl2q_s8(*(int8x16x2_t *)&v11, (int8x16_t)xmmword_21B6615F0);
            v15[3] = vqtbl2q_s8(*(int8x16x2_t *)&v11, (int8x16_t)xmmword_21B661600);
            int8x16_t *v15 = vqtbl2q_s8(*(int8x16x2_t *)&v11, (int8x16_t)xmmword_21B6615D0);
            v15[1] = vqtbl2q_s8(*(int8x16x2_t *)&v11, (int8x16_t)xmmword_21B6615E0);
            ++v14;
          }
          while (v6 > v14);
          unint64_t v17 = (unsigned __int16 *)(result + 2 * v10 * v7 + 16 * v6);
          unint64_t v18 = &a2[32 * v6 + v10 * v9];
          unsigned __int16 *v18 = *v17;
          if (v8 != 1)
          {
            v18[4] = v17[1];
            if (v8 != 2)
            {
              v18[8] = v17[2];
              if (v8 != 3)
              {
                v18[12] = v17[3];
                if (v8 != 4)
                {
                  v18[16] = v17[4];
                  if (v8 != 5)
                  {
                    v18[20] = v17[5];
                    if (v8 != 6) {
                      v18[24] = v17[6];
                    }
                  }
                }
              }
            }
          }
          ++v10;
          v13 += v9;
          v12 += 2 * v7;
        }
        while (a4 > v10);
      }
      else
      {
        uint64_t v25 = 2 * v9;
        uint64_t v26 = 2 * v7;
        *(void *)&long long v27 = 0x8000800080008000;
        *((void *)&v27 + 1) = 0x8000800080008000;
        do
        {
          uint64_t v28 = 0;
          do
          {
            int8x16_t v29 = (int8x16_t *)&a2[32 * v28];
            long long v30 = *(_OWORD *)(result + 16 * v28);
            v29[2] = vqtbl2q_s8(*(int8x16x2_t *)&v27, (int8x16_t)xmmword_21B6615F0);
            v29[3] = vqtbl2q_s8(*(int8x16x2_t *)&v27, (int8x16_t)xmmword_21B661600);
            *int8x16_t v29 = vqtbl2q_s8(*(int8x16x2_t *)&v27, (int8x16_t)xmmword_21B6615D0);
            v29[1] = vqtbl2q_s8(*(int8x16x2_t *)&v27, (int8x16_t)xmmword_21B6615E0);
            ++v28;
          }
          while (v6 > v28);
          ++v8;
          a2 = (unsigned __int16 *)((char *)a2 + v25);
          result += v26;
        }
        while (a4 > v8);
      }
    }
    else if ((a3 & 7) != 0)
    {
      uint64_t v19 = a2 + 12;
      uint64_t v20 = 2 * v9;
      uint64_t v21 = (unsigned __int16 *)(result + 6);
      uint64_t v22 = 2 * v7;
      uint64_t v23 = 1;
      do
      {
        *(v19 - 12) = *(v21 - 3);
        if (v8 != 1)
        {
          *(v19 - 8) = *(v21 - 2);
          if (v8 != 2)
          {
            *(v19 - 4) = *(v21 - 1);
            if (v8 != 3)
            {
              *uint64_t v19 = *v21;
              if (v8 != 4)
              {
                v19[4] = v21[1];
                if (v8 != 5)
                {
                  v19[8] = v21[2];
                  if (v8 != 6) {
                    v19[12] = v21[3];
                  }
                }
              }
            }
          }
        }
        BOOL v24 = a4 > v23++;
        uint64_t v19 = (unsigned __int16 *)((char *)v19 + v20);
        uint64_t v21 = (unsigned __int16 *)((char *)v21 + v22);
      }
      while (v24);
    }
  }
  return result;
}

unint64_t split_bayer_buffer_yuv(unint64_t result, unsigned __int16 *a2, unsigned __int16 *a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7, unint64_t a8, double a9, double a10, int16x8_t a11, double a12, int16x8_t a13, double a14, double a15, int16x8_t a16, unsigned int a17)
{
  if (a5)
  {
    unint64_t v18 = (a4 >> 3) & 0xFFFFFFFFFFFFFFFLL;
    uint64_t v19 = a6 >> 1;
    unint64_t v20 = a7 >> 1;
    unint64_t v21 = a8 >> 1;
    unint64_t v22 = ((2 * a4) >> 2) & 3;
    if (2 * a4 >= 0x10)
    {
      uint64_t v33 = 0;
      unsigned int v34 = 0;
      int8x16_t v35 = (int8x16_t)vdupq_n_s16(a17);
      uint64_t v36 = 2 * v19;
      int16x4_t v37 = (int16x4_t)vextq_s8(v35, v35, 8uLL).u64[0];
      uint64_t v38 = 8 * v18;
      CFAllocatorRef v39 = a2;
      CFNumberRef v40 = a3;
      do
      {
        uint64_t v41 = 0;
        unint64_t v42 = result + 2 * v33 * v19;
        uint64_t v43 = v34 >> 1;
        int8x16x2_t v44 = &a2[v20 * v43];
        int v45 = &a3[v21 * v43];
        do
        {
          uint64_t v46 = 8 * v41;
          v47 = (const __int16 *)(result + v36 + v36 * v34 + 16 * v41);
          a11 = (int16x8_t)vld2_s16(v47);
          int v48 = (const __int16 *)(result + v36 * v34 + 16 * v41);
          a13 = (int16x8_t)vld2_s16(v48);
          uint16x4_t v49 = (uint16x4_t)vuzp1_s16(*(int16x4_t *)v35.i8, v37);
          *(uint16x4_t *)a16.i8 = vshl_u16(*(uint16x4_t *)a11.i8, v49);
          uint16x4_t v50 = (uint16x4_t)vuzp2_s16(*(int16x4_t *)v35.i8, v37);
          *(uint16x4_t *)v17.i8 = vshl_u16(v51, v50);
          a16 = vzip1q_s16(a16, v17);
          *(int16x8_t *)&v39[v46] = a16;
          *(uint16x4_t *)a13.i8 = vshl_u16(*(uint16x4_t *)a13.i8, v49);
          *(uint16x4_t *)a11.i8 = vshl_u16(v52, v50);
          a11 = vzip1q_s16(a13, a11);
          *(int16x8_t *)&v40[v46] = a11;
          ++v41;
        }
        while (v18 > v41);
        if (v22)
        {
          v53 = (unsigned __int16 *)(v42 + v38 * 2);
          CFNumberRef v54 = (unsigned __int16 *)(result + 2 * v19 * (v34 | 1) + v38 * 2);
          v55 = &v44[v38];
          int v56 = &v45[v38];
          unsigned __int16 *v55 = *v54 << a17;
          v55[1] = v53[1] << a17;
          *int v56 = *v53 << a17;
          v56[1] = v54[1] << a17;
          if (v22 != 1)
          {
            v55[1] = v54[1] << a17;
            v55[2] = v53[2] << a17;
            v56[1] = v53[1] << a17;
            v56[2] = v54[2] << a17;
            if (v22 != 2)
            {
              v55[2] = v54[2] << a17;
              v55[3] = v53[3] << a17;
              v56[2] = v53[2] << a17;
              v56[3] = v54[3] << a17;
            }
          }
        }
        v40 += v21;
        v39 += v20;
        v34 += 2;
        uint64_t v33 = v34;
      }
      while (v34 < a5);
    }
    else if (v22)
    {
      uint64_t v23 = v19;
      uint64_t v24 = (16 * (a4 >> 3)) | 4;
      uint64_t v25 = (unsigned __int16 *)(result + v24);
      uint64_t v26 = 4 * v19;
      long long v27 = (unsigned __int16 *)((char *)a2 + v24);
      uint64_t v28 = 2 * v20;
      int8x16_t v29 = (unsigned __int16 *)((char *)a3 + v24);
      uint64_t v30 = 2 * v21;
      unsigned int v31 = 2;
      do
      {
        unsigned int v32 = &v25[v23];
        *(v27 - 2) = v25[v23 - 2] << a17;
        *(v27 - 1) = *(v25 - 1) << a17;
        *(v29 - 2) = *(v25 - 2) << a17;
        *(v29 - 1) = v25[v23 - 1] << a17;
        if (v22 != 1)
        {
          *(v27 - 1) = *(v32 - 1) << a17;
          _WORD *v27 = *v25 << a17;
          *(v29 - 1) = *(v25 - 1) << a17;
          *int8x16_t v29 = *v32 << a17;
          if (v22 != 2)
          {
            _WORD *v27 = v25[v23] << a17;
            v27[1] = v25[1] << a17;
            *int8x16_t v29 = *v25 << a17;
            v29[1] = v25[v23 + 1] << a17;
          }
        }
        size_t result = v31;
        uint64_t v25 = (unsigned __int16 *)((char *)v25 + v26);
        long long v27 = (_WORD *)((char *)v27 + v28);
        int8x16_t v29 = (_WORD *)((char *)v29 + v30);
        v31 += 2;
      }
      while (result < a5);
    }
  }
  return result;
}

unsigned __int16 *split_bayer_buffer(unsigned __int16 *result, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, unint64_t a6, unint64_t a7, unint64_t a8, unsigned int a9, BOOL a10)
{
  if (a6 / a7 < 2) {
    return result;
  }
  unint64_t v10 = a7 >> 4;
  LODWORD(v11) = a9;
  uint64_t v12 = (unsigned __int16 *)((char *)result + a7);
  unint64_t v13 = a7 & 0x1F;
  unint64_t v14 = (a6 / a7) >> 1;
  if (a7 >= 0x20)
  {
    unint64_t v23 = a7 >> 5;
    uint64_t v24 = (a8 >> 4) & 0xFFFFFFFFFFFFFFELL;
    if (a9)
    {
      LODWORD(v25) = 0;
      int8x16_t v26 = (int8x16_t)vdupq_n_s16(a9);
      int16x4_t v27 = (int16x4_t)vextq_s8(v26, v26, 8uLL).u64[0];
      uint64_t v28 = 8 * v10;
      uint64_t v29 = 16 * v24;
      while (1)
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        unsigned int v32 = 1;
        do
        {
          uint64_t v33 = (const __int16 *)&result[v30];
          int16x4x2_t v75 = vld2_s16(v33);
          v33 += 8;
          int16x4x2_t v77 = vld2_s16(v33);
          unsigned int v34 = (const __int16 *)&v12[v30];
          int16x4x2_t v79 = vld2_s16(v34);
          v34 += 8;
          int16x4x2_t v81 = vld2_s16(v34);
          uint16x4_t v35 = (uint16x4_t)vuzp1_s16(*(int16x4_t *)v26.i8, v27);
          *(uint16x4_t *)&long long v36 = vshl_u16((uint16x4_t)v75.val[0], v35);
          *((uint16x4_t *)&v36 + 1) = vshl_u16((uint16x4_t)v77.val[0], v35);
          *(_OWORD *)&a2[v31] = v36;
          *(int16x4_t *)&long long v36 = vuzp2_s16(*(int16x4_t *)v26.i8, v27);
          v75.val[0] = (int16x4_t)vshl_u16((uint16x4_t)v75.val[1], *(uint16x4_t *)&v36);
          uint16x4_t v37 = vshl_u16((uint16x4_t)v77.val[1], *(uint16x4_t *)&v36);
          *(int16x4x2_t *)&a3[v31] = v75;
          v75.val[0] = (int16x4_t)vshl_u16((uint16x4_t)v79.val[0], v35);
          uint16x4_t v38 = vshl_u16((uint16x4_t)v81.val[0], v35);
          *(int16x4x2_t *)&a4[v31] = v75;
          v75.val[0] = (int16x4_t)vshl_u16((uint16x4_t)v79.val[1], *(uint16x4_t *)&v36);
          uint16x4_t v39 = vshl_u16((uint16x4_t)v81.val[1], *(uint16x4_t *)&v36);
          *(int16x4x2_t *)&a5[v31] = v75;
          BOOL v22 = v23 > v32++;
          v31 += 8;
          v30 += 16;
        }
        while (v22);
        CFNumberRef v40 = &result[v30];
        uint64_t v41 = &v12[v30];
        if (!v13) {
          goto LABEL_49;
        }
        a2[v31] = *v40 << a9;
        a3[v31] = v40[1] << a9;
        a4[v31] = *v41 << a9;
        a5[v31] = v41[1] << a9;
        if (v13 <= 4)
        {
          v40 += 2;
          v41 += 2;
          if (a10) {
            goto LABEL_50;
          }
          goto LABEL_25;
        }
        a2[v31 + 1] = v40[2] << a9;
        unint64_t v42 = &result[v30];
        a3[v31 + 1] = result[v30 + 3] << a9;
        a4[v31 + 1] = v41[2] << a9;
        uint64_t v43 = &v12[v30];
        a5[v31 + 1] = v12[v30 + 3] << a9;
        if (v13 < 9)
        {
          CFNumberRef v40 = v42 + 4;
          uint64_t v41 = v43 + 4;
          if (a10) {
            goto LABEL_50;
          }
          goto LABEL_25;
        }
        a2[v31 + 2] = v42[4] << a9;
        a3[v31 + 2] = v42[5] << a9;
        a4[v31 + 2] = v43[4] << a9;
        a5[v31 + 2] = v43[5] << a9;
        if (v13 < 0xD)
        {
          CFNumberRef v40 = v42 + 6;
          uint64_t v41 = v43 + 6;
          if (a10) {
            goto LABEL_50;
          }
          goto LABEL_25;
        }
        a2[v31 + 3] = v42[6] << a9;
        int8x16x2_t v44 = &result[v30];
        a3[v31 + 3] = result[v30 + 7] << a9;
        a4[v31 + 3] = v43[6] << a9;
        int v45 = &v12[v30];
        a5[v31 + 3] = v12[v30 + 7] << a9;
        if (v13 < 0x11)
        {
          CFNumberRef v40 = v44 + 8;
          uint64_t v41 = v45 + 8;
          if (a10) {
            goto LABEL_50;
          }
          goto LABEL_25;
        }
        a2[v31 + 4] = v44[8] << a9;
        a3[v31 + 4] = v44[9] << a9;
        a4[v31 + 4] = v45[8] << a9;
        a5[v31 + 4] = v45[9] << a9;
        if (v13 < 0x15)
        {
          CFNumberRef v40 = v44 + 10;
          uint64_t v41 = v45 + 10;
          if (a10) {
            goto LABEL_50;
          }
          goto LABEL_25;
        }
        a2[v31 + 5] = v44[10] << a9;
        uint64_t v46 = &result[v30];
        a3[v31 + 5] = result[v30 + 11] << a9;
        a4[v31 + 5] = v45[10] << a9;
        v47 = &v12[v30];
        a5[v31 + 5] = v12[v30 + 11] << a9;
        if (v13 < 0x19) {
          break;
        }
        a2[v31 + 6] = v46[12] << a9;
        a3[v31 + 6] = v46[13] << a9;
        a4[v31 + 6] = v47[12] << a9;
        a5[v31 + 6] = v47[13] << a9;
        if (v13 < 0x1D)
        {
          CFNumberRef v40 = v46 + 14;
          uint64_t v41 = v47 + 14;
          if (!a10) {
            goto LABEL_25;
          }
LABEL_50:
          a2 = (unsigned __int16 *)((char *)a2 + v29);
          a3 = (unsigned __int16 *)((char *)a3 + v29);
          a4 = (unsigned __int16 *)((char *)a4 + v29);
          a5 = (unsigned __int16 *)((char *)a5 + v29);
          goto LABEL_25;
        }
        a2[v31 + 7] = v46[14] << a9;
        int v48 = &result[v30];
        a3[v31 + 7] = v48[15] << a9;
        CFNumberRef v40 = v48 + 16;
        a4[v31 + 7] = v47[14] << a9;
        uint16x4_t v49 = &v12[v30];
        a5[v31 + 7] = v49[15] << a9;
        uint64_t v41 = v49 + 16;
        if (a10) {
          goto LABEL_50;
        }
LABEL_25:
        size_t result = &v40[v28];
        uint64_t v12 = &v41[v28];
        unint64_t v25 = (v25 + 1);
        if (v14 <= v25) {
          return result;
        }
      }
      CFNumberRef v40 = v46 + 12;
      uint64_t v41 = v47 + 12;
LABEL_49:
      if (a10) {
        goto LABEL_50;
      }
      goto LABEL_25;
    }
    uint64_t v50 = 8 * v10;
    uint64_t v51 = 16 * v24;
    while (1)
    {
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      unsigned int v54 = 1;
      do
      {
        v55 = (const __int16 *)&result[v52];
        int16x4x2_t v74 = vld2_s16(v55);
        v55 += 8;
        int16x4x2_t v76 = vld2_s16(v55);
        int v56 = (const __int16 *)&v12[v52];
        int16x4x2_t v78 = vld2_s16(v56);
        v56 += 8;
        int16x4x2_t v80 = vld2_s16(v56);
        int16x4_t v57 = v76.val[0];
        *(int16x4x2_t *)&a2[v53] = v74;
        int16x4_t v58 = v76.val[1];
        *(int16x4x2_t *)&a3[v53] = *(int16x4x2_t *)((char *)&v74 + 8);
        int16x4_t v59 = v80.val[0];
        *(int16x4x2_t *)&a4[v53] = v78;
        int16x4_t v60 = v80.val[1];
        *(int16x4x2_t *)&a5[v53] = *(int16x4x2_t *)((char *)&v78 + 8);
        BOOL v22 = v23 > v54++;
        v53 += 8;
        v52 += 16;
      }
      while (v22);
      v61 = &result[v52];
      int v62 = &v12[v52];
      if (!v13) {
        goto LABEL_78;
      }
      a2[v53] = *v61;
      a3[v53] = v61[1];
      a4[v53] = *v62;
      a5[v53] = v62[1];
      if (v13 <= 4)
      {
        v61 += 2;
        v62 += 2;
        if (a10) {
          goto LABEL_79;
        }
        goto LABEL_54;
      }
      a2[v53 + 1] = v61[2];
      CFNumberRef v63 = &result[v52];
      a3[v53 + 1] = result[v52 + 3];
      a4[v53 + 1] = v62[2];
      v64 = &v12[v52];
      a5[v53 + 1] = v12[v52 + 3];
      if (v13 < 9)
      {
        v61 = v63 + 4;
        int v62 = v64 + 4;
        if (a10) {
          goto LABEL_79;
        }
        goto LABEL_54;
      }
      a2[v53 + 2] = v63[4];
      a3[v53 + 2] = v63[5];
      a4[v53 + 2] = v64[4];
      a5[v53 + 2] = v64[5];
      if (v13 < 0xD)
      {
        v61 = v63 + 6;
        int v62 = v64 + 6;
        if (a10) {
          goto LABEL_79;
        }
        goto LABEL_54;
      }
      a2[v53 + 3] = v63[6];
      uint64_t v65 = &result[v52];
      a3[v53 + 3] = result[v52 + 7];
      a4[v53 + 3] = v64[6];
      OSStatus v66 = &v12[v52];
      a5[v53 + 3] = v12[v52 + 7];
      if (v13 < 0x11)
      {
        v61 = v65 + 8;
        int v62 = v66 + 8;
        if (a10) {
          goto LABEL_79;
        }
        goto LABEL_54;
      }
      a2[v53 + 4] = v65[8];
      a3[v53 + 4] = v65[9];
      a4[v53 + 4] = v66[8];
      a5[v53 + 4] = v66[9];
      if (v13 < 0x15)
      {
        v61 = v65 + 10;
        int v62 = v66 + 10;
        if (a10) {
          goto LABEL_79;
        }
        goto LABEL_54;
      }
      a2[v53 + 5] = v65[10];
      CFNumberRef v67 = &result[v52];
      a3[v53 + 5] = result[v52 + 11];
      a4[v53 + 5] = v66[10];
      v68 = &v12[v52];
      a5[v53 + 5] = v12[v52 + 11];
      if (v13 < 0x19) {
        break;
      }
      a2[v53 + 6] = v67[12];
      a3[v53 + 6] = v67[13];
      a4[v53 + 6] = v68[12];
      a5[v53 + 6] = v68[13];
      if (v13 < 0x1D)
      {
        v61 = v67 + 14;
        int v62 = v68 + 14;
        if (!a10) {
          goto LABEL_54;
        }
LABEL_79:
        a2 = (unsigned __int16 *)((char *)a2 + v51);
        a3 = (unsigned __int16 *)((char *)a3 + v51);
        a4 = (unsigned __int16 *)((char *)a4 + v51);
        a5 = (unsigned __int16 *)((char *)a5 + v51);
        goto LABEL_54;
      }
      a2[v53 + 7] = v67[14];
      a3[v53 + 7] = result[v52 + 15];
      v61 = &result[v52 + 16];
      a4[v53 + 7] = v68[14];
      uint64_t v69 = &v12[v52];
      a5[v53 + 7] = v69[15];
      int v62 = v69 + 16;
      if (a10) {
        goto LABEL_79;
      }
LABEL_54:
      size_t result = &v61[v50];
      uint64_t v12 = &v62[v50];
      unint64_t v11 = (v11 + 1);
      if (v14 <= v11) {
        return result;
      }
    }
    v61 = v67 + 12;
    int v62 = v68 + 12;
LABEL_78:
    if (a10) {
      goto LABEL_79;
    }
    goto LABEL_54;
  }
  if ((a7 & 0x1F) != 0)
  {
    if (a10)
    {
      uint64_t v15 = 0;
      long long v16 = a2 + 7;
      int16x8_t v17 = a3 + 7;
      unint64_t v18 = a4 + 7;
      unsigned int v19 = 1;
      do
      {
        *(unsigned __int16 *)((char *)v16 + v15 - 14) = *result << a9;
        *(unsigned __int16 *)((char *)a3 + v15) = result[1] << a9;
        *(unsigned __int16 *)((char *)a4 + v15) = *v12 << a9;
        *(unsigned __int16 *)((char *)a5 + v15) = v12[1] << a9;
        if (v13 < 5)
        {
          unint64_t v20 = result + 2;
          unint64_t v21 = v12 + 2;
        }
        else
        {
          *(unsigned __int16 *)((char *)v16 + v15 - 12) = result[2] << a9;
          *(unsigned __int16 *)((char *)v17 + v15 - 12) = result[3] << a9;
          *(unsigned __int16 *)((char *)v18 + v15 - 12) = v12[2] << a9;
          *(unsigned __int16 *)((char *)a5 + v15 + 2) = v12[3] << a9;
          if (v13 < 9)
          {
            unint64_t v20 = result + 4;
            unint64_t v21 = v12 + 4;
          }
          else
          {
            *(unsigned __int16 *)((char *)v16 + v15 - 10) = result[4] << a9;
            *(unsigned __int16 *)((char *)v17 + v15 - 10) = result[5] << a9;
            *(unsigned __int16 *)((char *)v18 + v15 - 10) = v12[4] << a9;
            *(unsigned __int16 *)((char *)a5 + v15 + 4) = v12[5] << a9;
            if (v13 < 0xD)
            {
              unint64_t v20 = result + 6;
              unint64_t v21 = v12 + 6;
            }
            else
            {
              *(unsigned __int16 *)((char *)v16 + v15 - 8) = result[6] << a9;
              *(unsigned __int16 *)((char *)v17 + v15 - 8) = result[7] << a9;
              *(unsigned __int16 *)((char *)v18 + v15 - 8) = v12[6] << a9;
              *(unsigned __int16 *)((char *)a5 + v15 + 6) = v12[7] << a9;
              if (v13 < 0x11)
              {
                unint64_t v20 = result + 8;
                unint64_t v21 = v12 + 8;
              }
              else
              {
                *(unsigned __int16 *)((char *)v16 + v15 - 6) = result[8] << a9;
                *(unsigned __int16 *)((char *)v17 + v15 - 6) = result[9] << a9;
                *(unsigned __int16 *)((char *)v18 + v15 - 6) = v12[8] << a9;
                *(unsigned __int16 *)((char *)a5 + v15 + 8) = v12[9] << a9;
                if (v13 < 0x15)
                {
                  unint64_t v20 = result + 10;
                  unint64_t v21 = v12 + 10;
                }
                else
                {
                  *(unsigned __int16 *)((char *)v16 + v15 - 4) = result[10] << a9;
                  *(unsigned __int16 *)((char *)v17 + v15 - 4) = result[11] << a9;
                  *(unsigned __int16 *)((char *)v18 + v15 - 4) = v12[10] << a9;
                  *(unsigned __int16 *)((char *)a5 + v15 + 10) = v12[11] << a9;
                  if (v13 < 0x19)
                  {
                    unint64_t v20 = result + 12;
                    unint64_t v21 = v12 + 12;
                  }
                  else
                  {
                    *(unsigned __int16 *)((char *)v16 + v15 - 2) = result[12] << a9;
                    *(unsigned __int16 *)((char *)v17 + v15 - 2) = result[13] << a9;
                    *(unsigned __int16 *)((char *)v18 + v15 - 2) = v12[12] << a9;
                    *(unsigned __int16 *)((char *)a5 + v15 + 12) = v12[13] << a9;
                    if (v13 < 0x1D)
                    {
                      unint64_t v20 = result + 14;
                      unint64_t v21 = v12 + 14;
                    }
                    else
                    {
                      *(unsigned __int16 *)((char *)v16 + v15) = result[14] << a9;
                      *(unsigned __int16 *)((char *)v17 + v15) = result[15] << a9;
                      unint64_t v20 = result + 16;
                      *(unsigned __int16 *)((char *)v18 + v15) = v12[14] << a9;
                      *(unsigned __int16 *)((char *)a5 + v15 + 14) = v12[15] << a9;
                      unint64_t v21 = v12 + 16;
                    }
                  }
                }
              }
            }
          }
        }
        size_t result = &v20[8 * v10];
        uint64_t v12 = &v21[8 * v10];
        BOOL v22 = v14 > v19++;
        v15 += a8 & 0xFFFFFFFFFFFFFFE0;
      }
      while (v22);
    }
    else
    {
      unsigned int v70 = 1;
      uint64_t v71 = 8 * v10;
      do
      {
        *a2 = *result << a9;
        *a3 = result[1] << a9;
        *a4 = *v12 << a9;
        *a5 = v12[1] << a9;
        if (v13 < 5)
        {
          v72 = result + 2;
          OSStatus v73 = v12 + 2;
        }
        else
        {
          a2[1] = result[2] << a9;
          a3[1] = result[3] << a9;
          a4[1] = v12[2] << a9;
          a5[1] = v12[3] << a9;
          if (v13 < 9)
          {
            v72 = result + 4;
            OSStatus v73 = v12 + 4;
          }
          else
          {
            a2[2] = result[4] << a9;
            a3[2] = result[5] << a9;
            a4[2] = v12[4] << a9;
            a5[2] = v12[5] << a9;
            if (v13 < 0xD)
            {
              v72 = result + 6;
              OSStatus v73 = v12 + 6;
            }
            else
            {
              a2[3] = result[6] << a9;
              a3[3] = result[7] << a9;
              a4[3] = v12[6] << a9;
              a5[3] = v12[7] << a9;
              if (v13 < 0x11)
              {
                v72 = result + 8;
                OSStatus v73 = v12 + 8;
              }
              else
              {
                a2[4] = result[8] << a9;
                a3[4] = result[9] << a9;
                a4[4] = v12[8] << a9;
                a5[4] = v12[9] << a9;
                if (v13 < 0x15)
                {
                  v72 = result + 10;
                  OSStatus v73 = v12 + 10;
                }
                else
                {
                  a2[5] = result[10] << a9;
                  a3[5] = result[11] << a9;
                  a4[5] = v12[10] << a9;
                  a5[5] = v12[11] << a9;
                  if (v13 < 0x19)
                  {
                    v72 = result + 12;
                    OSStatus v73 = v12 + 12;
                  }
                  else
                  {
                    a2[6] = result[12] << a9;
                    a3[6] = result[13] << a9;
                    a4[6] = v12[12] << a9;
                    a5[6] = v12[13] << a9;
                    if (v13 < 0x1D)
                    {
                      v72 = result + 14;
                      OSStatus v73 = v12 + 14;
                    }
                    else
                    {
                      a2[7] = result[14] << a9;
                      a3[7] = result[15] << a9;
                      v72 = result + 16;
                      a4[7] = v12[14] << a9;
                      a5[7] = v12[15] << a9;
                      OSStatus v73 = v12 + 16;
                    }
                  }
                }
              }
            }
          }
        }
        size_t result = &v72[v71];
        uint64_t v12 = &v73[v71];
        BOOL v22 = v14 > v70++;
      }
      while (v22);
    }
  }
  return result;
}

unsigned __int16 *join_bayer_buffer(unsigned __int16 *result, const unsigned __int16 *a2, const unsigned __int16 *a3, const unsigned __int16 *a4, unsigned __int16 *a5, unint64_t a6, unint64_t a7, unint64_t a8, unint64_t a9, unsigned int a10, BOOL a11, BOOL a12)
{
  if (a7 <= a6)
  {
    LODWORD(v12) = 0;
    unint64_t v13 = a7 - a9;
    unint64_t v14 = (a7 - a9) >> 4;
    unint64_t v15 = (a7 - a9) & 0xF;
    unint64_t v16 = a7 >> 1;
    unint64_t v17 = a8 >> 1;
    unint64_t v18 = a6 / a7;
    unsigned int v19 = &a5[v17];
    uint64_t v20 = 4 * v17;
    uint16x8_t v21 = (uint16x8_t)vnegq_s16(vdupq_n_s16(a10));
    do
    {
      BOOL v22 = a5;
      unint64_t v23 = v19;
      uint64_t v24 = result;
      unint64_t v25 = a2;
      int8x16_t v26 = a3;
      int16x4_t v27 = a4;
      if (v13 >= 0x10)
      {
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        unsigned int v30 = 1;
        do
        {
          int16x8_t v34 = *(int16x8_t *)&result[v29];
          int16x8_t v35 = *(int16x8_t *)&a2[v29];
          int16x8_t v36 = *(int16x8_t *)&a3[v29];
          int16x8_t v37 = *(int16x8_t *)&a4[v29];
          if (a10)
          {
            int16x8_t v34 = (int16x8_t)vshlq_u16((uint16x8_t)v34, v21);
            int16x8_t v35 = (int16x8_t)vshlq_u16((uint16x8_t)v35, v21);
            int16x8_t v36 = (int16x8_t)vshlq_u16((uint16x8_t)v36, v21);
            int16x8_t v37 = (int16x8_t)vshlq_u16((uint16x8_t)v37, v21);
          }
          if (a12)
          {
            int16x8_t v34 = (int16x8_t)vorrq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v34, 0xAuLL), (int8x16_t)v34);
            int16x8_t v35 = (int16x8_t)vorrq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v35, 0xAuLL), (int8x16_t)v35);
            int16x8_t v36 = (int16x8_t)vorrq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v36, 0xAuLL), (int8x16_t)v36);
            int16x8_t v37 = (int16x8_t)vorrq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v37, 0xAuLL), (int8x16_t)v37);
          }
          uint64_t v31 = (int16x8_t *)&v19[v28];
          unsigned int v32 = (int16x8_t *)&a5[v28];
          *unsigned int v32 = vzip1q_s16(v34, v35);
          v32[1] = vzip1q_s16((int16x8_t)vextq_s8((int8x16_t)v34, (int8x16_t)v34, 8uLL), (int16x8_t)vextq_s8((int8x16_t)v35, (int8x16_t)v35, 8uLL));
          *uint64_t v31 = vzip1q_s16(v36, v37);
          v31[1] = vzip1q_s16((int16x8_t)vextq_s8((int8x16_t)v36, (int8x16_t)v36, 8uLL), (int16x8_t)vextq_s8((int8x16_t)v37, (int8x16_t)v37, 8uLL));
          BOOL v33 = v14 > v30++;
          v29 += 8;
          v28 += 16;
        }
        while (v33);
        int16x4_t v27 = &a4[v29];
        int8x16_t v26 = &a3[v29];
        unint64_t v25 = &a2[v29];
        uint64_t v24 = &result[v29];
        unint64_t v23 = &v19[v28];
        BOOL v22 = &a5[v28];
      }
      if (!v15) {
        goto LABEL_31;
      }
      unsigned __int16 *v22 = *v24 >> a10;
      v22[1] = *v25 >> a10;
      unsigned __int16 *v23 = *v26 >> a10;
      v23[1] = *v27 >> a10;
      if (a12)
      {
        *v22 |= *v22 >> 10;
        v22[1] |= v22[1] >> 10;
        *v23 |= *v23 >> 10;
        v23[1] |= v23[1] >> 10;
        if (v15 >= 3)
        {
          v22[2] = v24[1] >> a10;
          v22[3] = v25[1] >> a10;
          v23[2] = v26[1] >> a10;
          v23[3] = v27[1] >> a10;
          v22[2] |= v22[2] >> 10;
          v22[3] |= v22[3] >> 10;
          v23[2] |= v23[2] >> 10;
          v23[3] |= v23[3] >> 10;
          if (v15 >= 5)
          {
            v22[4] = v24[2] >> a10;
            v22[5] = v25[2] >> a10;
            v23[4] = v26[2] >> a10;
            v23[5] = v27[2] >> a10;
            v22[4] |= v22[4] >> 10;
            v22[5] |= v22[5] >> 10;
            v23[4] |= v23[4] >> 10;
            v23[5] |= v23[5] >> 10;
            if (v15 >= 7)
            {
              v22[6] = v24[3] >> a10;
              v22[7] = v25[3] >> a10;
              v23[6] = v26[3] >> a10;
              v23[7] = v27[3] >> a10;
              v22[6] |= v22[6] >> 10;
              v22[7] |= v22[7] >> 10;
              v23[6] |= v23[6] >> 10;
              v23[7] |= v23[7] >> 10;
              if (v15 >= 9)
              {
                v22[8] = v24[4] >> a10;
                v22[9] = v25[4] >> a10;
                v23[8] = v26[4] >> a10;
                v23[9] = v27[4] >> a10;
                v22[8] |= v22[8] >> 10;
                v22[9] |= v22[9] >> 10;
                v23[8] |= v23[8] >> 10;
                v23[9] |= v23[9] >> 10;
                if (v15 >= 0xB)
                {
                  v22[10] = v24[5] >> a10;
                  v22[11] = v25[5] >> a10;
                  v23[10] = v26[5] >> a10;
                  v23[11] = v27[5] >> a10;
                  v22[10] |= v22[10] >> 10;
                  v22[11] |= v22[11] >> 10;
                  v23[10] |= v23[10] >> 10;
                  v23[11] |= v23[11] >> 10;
                  if (v15 >= 0xD)
                  {
                    v22[12] = v24[6] >> a10;
                    v22[13] = v25[6] >> a10;
                    v23[12] = v26[6] >> a10;
                    v23[13] = v27[6] >> a10;
                    v22[12] |= v22[12] >> 10;
                    v22[13] |= v22[13] >> 10;
                    v23[12] |= v23[12] >> 10;
                    v23[13] |= v23[13] >> 10;
                    if (v15 == 15)
                    {
                      v22[14] = v24[7] >> a10;
                      v22[15] = v25[7] >> a10;
                      v23[14] = v26[7] >> a10;
                      v23[15] = v27[7] >> a10;
                      v22[14] |= v22[14] >> 10;
                      v22[15] |= v22[15] >> 10;
                      v23[14] |= v23[14] >> 10;
                      int v38 = v23[15] | (v23[15] >> 10);
LABEL_30:
                      v23[15] = v38;
                    }
                  }
                }
              }
            }
          }
        }
      }
      else if (v15 >= 3)
      {
        v22[2] = v24[1] >> a10;
        v22[3] = v25[1] >> a10;
        v23[2] = v26[1] >> a10;
        v23[3] = v27[1] >> a10;
        if (v15 >= 5)
        {
          v22[4] = v24[2] >> a10;
          v22[5] = v25[2] >> a10;
          v23[4] = v26[2] >> a10;
          v23[5] = v27[2] >> a10;
          if (v15 >= 7)
          {
            v22[6] = v24[3] >> a10;
            v22[7] = v25[3] >> a10;
            v23[6] = v26[3] >> a10;
            v23[7] = v27[3] >> a10;
            if (v15 >= 9)
            {
              v22[8] = v24[4] >> a10;
              v22[9] = v25[4] >> a10;
              v23[8] = v26[4] >> a10;
              v23[9] = v27[4] >> a10;
              if (v15 >= 0xB)
              {
                v22[10] = v24[5] >> a10;
                v22[11] = v25[5] >> a10;
                v23[10] = v26[5] >> a10;
                v23[11] = v27[5] >> a10;
                if (v15 >= 0xD)
                {
                  v22[12] = v24[6] >> a10;
                  v22[13] = v25[6] >> a10;
                  v23[12] = v26[6] >> a10;
                  v23[13] = v27[6] >> a10;
                  if (v15 == 15)
                  {
                    v22[14] = v24[7] >> a10;
                    v22[15] = v25[7] >> a10;
                    v23[14] = v26[7] >> a10;
                    int v38 = v27[7] >> a10;
                    goto LABEL_30;
                  }
                }
              }
            }
          }
        }
      }
LABEL_31:
      uint64_t v39 = 2 * v16;
      result += v16;
      a2 += v16;
      a3 += v16;
      a4 += v16;
      if (a11)
      {
        size_t result = (unsigned __int16 *)((char *)result + v39);
        a2 = (const unsigned __int16 *)((char *)a2 + v39);
        a3 = (const unsigned __int16 *)((char *)a3 + v39);
        a4 = (const unsigned __int16 *)((char *)a4 + v39);
      }
      a5 = (unsigned __int16 *)((char *)a5 + v20);
      unsigned int v19 = (unsigned __int16 *)((char *)v19 + v20);
      unint64_t v12 = (v12 + 1);
    }
    while (v18 > v12);
  }
  return result;
}

unsigned __int8 *split_companded_bayer_buffer(unsigned __int8 *result, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, unsigned __int8 *a5, unint64_t a6, unint64_t a7, unint64_t a8, unint64_t a9, unint64_t a10)
{
  if (a6 / a7 >= 2)
  {
    unint64_t v10 = a9 & 0x1F;
    unint64_t v11 = (a6 / a7) >> 1;
    uint64_t v12 = a7 - a9;
    unint64_t v13 = a8 >> 4;
    if (a9 >= 0x20)
    {
      unint64_t v25 = a9 >> 5;
      if ((a9 & 0x1F) != 0)
      {
        uint64_t v26 = 0;
        LODWORD(v27) = 0;
        uint64_t v28 = 16 * v13;
        uint64_t v29 = result;
        do
        {
          uint64_t v32 = 0;
          BOOL v33 = &v29[a7];
          unsigned int v34 = 1;
          uint64_t v35 = v26;
          do
          {
            int16x8_t v36 = (const char *)&result[v32];
            int8x8x2_t v63 = vld2_s8(v36);
            v36 += 16;
            int8x8x2_t v65 = vld2_s8(v36);
            int16x8_t v37 = (const char *)&v33[v32];
            int8x8x2_t v67 = vld2_s8(v37);
            v37 += 16;
            int8x8x2_t v69 = vld2_s8(v37);
            int8x8_t v38 = v65.val[0];
            *(int8x8x2_t *)&a2[v35] = v63;
            int8x8_t v39 = v65.val[1];
            *(int8x8x2_t *)&a3[v35] = *(int8x8x2_t *)((char *)&v63 + 8);
            int8x8_t v40 = v69.val[0];
            *(int8x8x2_t *)&a4[v35] = v67;
            int8x8_t v41 = v69.val[1];
            *(int8x8x2_t *)&a5[v35] = *(int8x8x2_t *)((char *)&v67 + 8);
            v32 += 32;
            v35 += 16;
            BOOL v23 = v25 > v34++;
          }
          while (v23);
          unint64_t v42 = &result[v32];
          a2[v35] = result[v32];
          a3[v35] = result[v32 + 1];
          uint64_t v43 = &v33[v32];
          a4[v35] = v33[v32];
          a5[v35] = v33[v32 + 1];
          if (v10 <= 4)
          {
            unsigned int v30 = v42 + 2;
            uint64_t v31 = v43 + 2;
          }
          else
          {
            a2[v35 + 1] = v42[2];
            a3[v35 + 1] = v42[3];
            a4[v35 + 1] = v43[2];
            a5[v35 + 1] = v43[3];
            if (v10 < 9)
            {
              unsigned int v30 = v42 + 4;
              uint64_t v31 = v43 + 4;
            }
            else
            {
              a2[v35 + 2] = v42[4];
              int8x16x2_t v44 = &result[v32];
              a3[v35 + 2] = result[v32 + 5];
              a4[v35 + 2] = v43[4];
              int v45 = &v33[v32];
              a5[v35 + 2] = v33[v32 + 5];
              if (v10 < 0xD)
              {
                unsigned int v30 = v44 + 6;
                uint64_t v31 = v45 + 6;
              }
              else
              {
                a2[v35 + 3] = v44[6];
                a3[v35 + 3] = v44[7];
                a4[v35 + 3] = v45[6];
                a5[v35 + 3] = v45[7];
                if (v10 < 0x11)
                {
                  unsigned int v30 = v44 + 8;
                  uint64_t v31 = v45 + 8;
                }
                else
                {
                  a2[v35 + 4] = v44[8];
                  uint64_t v46 = &result[v32];
                  a3[v35 + 4] = result[v32 + 9];
                  a4[v35 + 4] = v45[8];
                  v47 = &v33[v32];
                  a5[v35 + 4] = v33[v32 + 9];
                  if (v10 < 0x15)
                  {
                    unsigned int v30 = v46 + 10;
                    uint64_t v31 = v47 + 10;
                  }
                  else
                  {
                    a2[v35 + 5] = v46[10];
                    a3[v35 + 5] = v46[11];
                    a4[v35 + 5] = v47[10];
                    a5[v35 + 5] = v47[11];
                    if (v10 < 0x19)
                    {
                      unsigned int v30 = v46 + 12;
                      uint64_t v31 = v47 + 12;
                    }
                    else
                    {
                      a2[v35 + 6] = v46[12];
                      int v48 = &result[v32];
                      a3[v35 + 6] = v48[13];
                      a4[v35 + 6] = v47[12];
                      uint16x4_t v49 = &v33[v32];
                      a5[v35 + 6] = v49[13];
                      if (v10 < 0x1D)
                      {
                        unsigned int v30 = v48 + 14;
                        uint64_t v31 = v49 + 14;
                      }
                      else
                      {
                        uint64_t v50 = &a5[v35];
                        uint64_t v51 = &a4[v35];
                        a2[v35 + 7] = v48[14];
                        a3[v35 + 7] = v48[15];
                        unsigned int v30 = v48 + 16;
                        v51[7] = v49[14];
                        v50[7] = v49[15];
                        uint64_t v31 = v49 + 16;
                      }
                    }
                  }
                }
              }
            }
          }
          uint64_t v29 = &v31[v12];
          size_t result = &v30[v12 + a7];
          unint64_t v27 = (v27 + 1);
          v26 += v28;
        }
        while (v11 > v27);
      }
      else
      {
        uint64_t v52 = 2 * a7 - a9;
        uint64_t v53 = 16 * v13;
        unsigned int v54 = result;
        do
        {
          uint64_t v55 = 0;
          do
          {
            int v56 = (const char *)result;
            int8x8x2_t v64 = vld2_s8(v56);
            v56 += 16;
            int8x8x2_t v66 = vld2_s8(v56);
            int16x4_t v57 = (const char *)&v54[a7];
            int8x8x2_t v68 = vld2_s8(v57);
            v57 += 16;
            int8x8x2_t v70 = vld2_s8(v57);
            int8x8_t v58 = v66.val[0];
            uint64_t v59 = 16 * v55;
            *(int8x8x2_t *)&a2[v59] = v64;
            int8x8_t v60 = v66.val[1];
            *(int8x8x2_t *)&a3[v59] = *(int8x8x2_t *)((char *)&v64 + 8);
            int8x8_t v61 = v70.val[0];
            *(int8x8x2_t *)&a4[v59] = v68;
            int8x8_t v62 = v70.val[1];
            result += 32;
            ++v55;
            v54 += 32;
            *(int8x8x2_t *)&a5[v59] = *(int8x8x2_t *)((char *)&v68 + 8);
          }
          while (v25 > v55);
          v54 += v52;
          result += v52;
          unint64_t v10 = (v10 + 1);
          a5 += v53;
          a4 += v53;
          a3 += v53;
          a2 += v53;
        }
        while (v11 > v10);
      }
    }
    else if ((a9 & 0x1F) != 0)
    {
      uint64_t v14 = 0;
      unint64_t v15 = a3 + 7;
      uint64_t v16 = 16 * v13;
      unint64_t v17 = a4 + 7;
      unint64_t v18 = a5 + 7;
      unsigned int v19 = 1;
      uint64_t v20 = result;
      do
      {
        uint64_t v24 = &v20[a7];
        a2[v14] = *result;
        a3[v14] = result[1];
        a4[v14] = *v24;
        a5[v14] = v24[1];
        if (v10 < 5)
        {
          uint16x8_t v21 = result + 2;
          BOOL v22 = v24 + 2;
        }
        else
        {
          a2[v14 + 1] = result[2];
          v15[v14 - 6] = result[3];
          v17[v14 - 6] = v24[2];
          v18[v14 - 6] = v24[3];
          if (v10 < 9)
          {
            uint16x8_t v21 = result + 4;
            BOOL v22 = v24 + 4;
          }
          else
          {
            a2[v14 + 2] = result[4];
            v15[v14 - 5] = result[5];
            v17[v14 - 5] = v24[4];
            v18[v14 - 5] = v24[5];
            if (v10 < 0xD)
            {
              uint16x8_t v21 = result + 6;
              BOOL v22 = v24 + 6;
            }
            else
            {
              a2[v14 + 3] = result[6];
              v15[v14 - 4] = result[7];
              v17[v14 - 4] = v24[6];
              v18[v14 - 4] = v24[7];
              if (v10 < 0x11)
              {
                uint16x8_t v21 = result + 8;
                BOOL v22 = v24 + 8;
              }
              else
              {
                a2[v14 + 4] = result[8];
                v15[v14 - 3] = result[9];
                v17[v14 - 3] = v24[8];
                v18[v14 - 3] = v24[9];
                if (v10 < 0x15)
                {
                  uint16x8_t v21 = result + 10;
                  BOOL v22 = v24 + 10;
                }
                else
                {
                  a2[v14 + 5] = result[10];
                  v15[v14 - 2] = result[11];
                  v17[v14 - 2] = v24[10];
                  v18[v14 - 2] = v24[11];
                  if (v10 < 0x19)
                  {
                    uint16x8_t v21 = result + 12;
                    BOOL v22 = v24 + 12;
                  }
                  else
                  {
                    a2[v14 + 6] = result[12];
                    v15[v14 - 1] = result[13];
                    v17[v14 - 1] = v24[12];
                    v18[v14 - 1] = v24[13];
                    if (v10 < 0x1D)
                    {
                      uint16x8_t v21 = result + 14;
                      BOOL v22 = v24 + 14;
                    }
                    else
                    {
                      a2[v14 + 7] = result[14];
                      v15[v14] = result[15];
                      uint16x8_t v21 = result + 16;
                      v17[v14] = v24[14];
                      v18[v14] = v24[15];
                      BOOL v22 = v24 + 16;
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v20 = &v22[v12];
        size_t result = &v21[v12 + a7];
        v14 += v16;
        BOOL v23 = v11 > v19++;
      }
      while (v23);
    }
  }
  return result;
}

uint64_t join_companded_bayer_buffer(uint64_t result, const unsigned __int8 *a2, const unsigned __int8 *a3, const unsigned __int8 *a4, int8x16_t *a5, unint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9, BOOL a10)
{
  if (a6)
  {
    unint64_t v10 = a7 & 0xF;
    uint64_t v11 = a9 + a7;
    uint64_t v12 = 2 * a8;
    if (a7 >= 0x10)
    {
      LODWORD(v21) = 0;
      do
      {
        uint64_t v22 = 0;
        unsigned int v23 = 1;
        uint64_t v24 = a5;
        do
        {
          int8x16_t v25 = *(int8x16_t *)(result + v22);
          int8x16_t v26 = *(int8x16_t *)&a2[v22];
          int8x16_t v27 = *(int8x16_t *)&a3[v22];
          int8x16_t v28 = *(int8x16_t *)&a4[v22];
          uint64_t v29 = (int8x16_t *)((char *)v24 + a8);
          int8x16_t *v24 = vzip1q_s8(v25, v26);
          v24[1] = vzip1q_s8(vextq_s8(v25, v25, 8uLL), vextq_s8(v26, v26, 8uLL));
          v24 += 2;
          *uint64_t v29 = vzip1q_s8(v27, v28);
          v29[1] = vzip1q_s8(vextq_s8(v27, v27, 8uLL), vextq_s8(v28, v28, 8uLL));
          BOOL v30 = a7 >> 4 > v23++;
          v22 += 16;
        }
        while (v30);
        if ((a7 & 0xF) != 0)
        {
          v24->i8[0] = *(unsigned char *)(result + v22);
          v24->i8[1] = a2[v22];
          uint64_t v31 = &v24->i8[a8];
          *uint64_t v31 = a3[v22];
          v31[1] = a4[v22];
          if (v10 > 2)
          {
            v24->i8[2] = *(unsigned char *)(result + v22 + 1);
            v24->i8[3] = a2[v22 + 1];
            v31[2] = a3[v22 + 1];
            v31[3] = a4[v22 + 1];
            if (v10 >= 5)
            {
              uint64_t v32 = &v24->i8[a8];
              v24->i8[4] = *(unsigned char *)(result + v22 + 2);
              v24->i8[5] = a2[v22 + 2];
              v32[4] = a3[v22 + 2];
              v32[5] = a4[v22 + 2];
              if (v10 >= 7)
              {
                v24->i8[6] = *(unsigned char *)(result + v22 + 3);
                v24->i8[7] = a2[v22 + 3];
                v32[6] = a3[v22 + 3];
                v32[7] = a4[v22 + 3];
                if (v10 >= 9)
                {
                  BOOL v33 = &v24->i8[a8];
                  v24->i8[8] = *(unsigned char *)(result + v22 + 4);
                  v24->i8[9] = a2[v22 + 4];
                  v33[8] = a3[v22 + 4];
                  v33[9] = a4[v22 + 4];
                  if (v10 >= 0xB)
                  {
                    v24->i8[10] = *(unsigned char *)(result + v22 + 5);
                    v24->i8[11] = a2[v22 + 5];
                    v33[10] = a3[v22 + 5];
                    v33[11] = a4[v22 + 5];
                    if (v10 >= 0xD)
                    {
                      unsigned int v34 = &v24->i8[a8];
                      v24->i8[12] = *(unsigned char *)(result + v22 + 6);
                      v24->i8[13] = a2[v22 + 6];
                      v34[12] = a3[v22 + 6];
                      v34[13] = a4[v22 + 6];
                      if (v10 == 15)
                      {
                        v24->i8[14] = *(unsigned char *)(result + v22 + 7);
                        v24->i8[15] = a2[v22 + 7];
                        v34[14] = a3[v22 + 7];
                        v34[15] = a4[v22 + 7];
                      }
                    }
                  }
                }
              }
            }
          }
        }
        result += v11;
        a2 += v11;
        a3 += v11;
        a4 += v11;
        if (a10)
        {
          result += a7;
          a2 += a7;
          a3 += a7;
          a4 += a7;
        }
        a5 = (int8x16_t *)((char *)a5 + v12);
        unint64_t v21 = (v21 + 1);
      }
      while (v21 < a6);
    }
    else if ((a7 & 0xF) != 0)
    {
      if (a10)
      {
        unint64_t v13 = &a5->u8[7];
        unsigned int v14 = 1;
        uint64_t v15 = 7;
        do
        {
          unint64_t v17 = &v13[a8];
          *(v13 - 7) = *(unsigned char *)(result + v15 - 7);
          *(v13 - 6) = a2[v15 - 7];
          *(v17 - 7) = a3[v15 - 7];
          *(v17 - 6) = a4[v15 - 7];
          if (v10 >= 3)
          {
            *(v13 - 5) = *(unsigned char *)(result + v15 - 6);
            *(v13 - 4) = a2[v15 - 6];
            *(v17 - 5) = a3[v15 - 6];
            *(v17 - 4) = a4[v15 - 6];
            if (v10 >= 5)
            {
              unint64_t v18 = &v13[a8];
              *(v13 - 3) = *(unsigned char *)(result + v15 - 5);
              *(v13 - 2) = a2[v15 - 5];
              *(v18 - 3) = a3[v15 - 5];
              *(v18 - 2) = a4[v15 - 5];
              if (v10 >= 7)
              {
                *(v13 - 1) = *(unsigned char *)(result + v15 - 4);
                unsigned __int8 *v13 = a2[v15 - 4];
                *(v18 - 1) = a3[v15 - 4];
                unsigned __int8 *v18 = a4[v15 - 4];
                if (v10 >= 9)
                {
                  unsigned int v19 = &v13[a8];
                  v13[1] = *(unsigned char *)(result + v15 - 3);
                  v13[2] = a2[v15 - 3];
                  v19[1] = a3[v15 - 3];
                  void v19[2] = a4[v15 - 3];
                  if (v10 >= 0xB)
                  {
                    v13[3] = *(unsigned char *)(result + v15 - 2);
                    v13[4] = a2[v15 - 2];
                    v19[3] = a3[v15 - 2];
                    v19[4] = a4[v15 - 2];
                    if (v10 >= 0xD)
                    {
                      uint64_t v20 = &v13[a8];
                      v13[5] = *(unsigned char *)(result + v15 - 1);
                      v13[6] = a2[v15 - 1];
                      v20[5] = a3[v15 - 1];
                      v20[6] = a4[v15 - 1];
                      if (v10 == 15)
                      {
                        v13[7] = *(unsigned char *)(result + v15);
                        v13[8] = a2[v15];
                        v20[7] = a3[v15];
                        v20[8] = a4[v15];
                      }
                    }
                  }
                }
              }
            }
          }
          unint64_t v16 = v14++;
          v15 += a9 + 2 * a7;
          v13 += v12;
        }
        while (v16 < a6);
      }
      else
      {
        uint64_t v35 = &a5->u8[7];
        unsigned int v36 = 1;
        uint64_t v37 = 7;
        do
        {
          int8x8_t v39 = &v35[a8];
          *(v35 - 7) = *(unsigned char *)(result + v37 - 7);
          *(v35 - 6) = a2[v37 - 7];
          *(v39 - 7) = a3[v37 - 7];
          *(v39 - 6) = a4[v37 - 7];
          if (v10 >= 3)
          {
            *(v35 - 5) = *(unsigned char *)(result + v37 - 6);
            *(v35 - 4) = a2[v37 - 6];
            *(v39 - 5) = a3[v37 - 6];
            *(v39 - 4) = a4[v37 - 6];
            if (v10 >= 5)
            {
              int8x8_t v40 = &v35[a8];
              *(v35 - 3) = *(unsigned char *)(result + v37 - 5);
              *(v35 - 2) = a2[v37 - 5];
              *(v40 - 3) = a3[v37 - 5];
              *(v40 - 2) = a4[v37 - 5];
              if (v10 >= 7)
              {
                *(v35 - 1) = *(unsigned char *)(result + v37 - 4);
                unsigned __int8 *v35 = a2[v37 - 4];
                *(v40 - 1) = a3[v37 - 4];
                unsigned __int8 *v40 = a4[v37 - 4];
                if (v10 >= 9)
                {
                  int8x8_t v41 = &v35[a8];
                  v35[1] = *(unsigned char *)(result + v37 - 3);
                  v35[2] = a2[v37 - 3];
                  v41[1] = a3[v37 - 3];
                  v41[2] = a4[v37 - 3];
                  if (v10 >= 0xB)
                  {
                    v35[3] = *(unsigned char *)(result + v37 - 2);
                    v35[4] = a2[v37 - 2];
                    v41[3] = a3[v37 - 2];
                    v41[4] = a4[v37 - 2];
                    if (v10 >= 0xD)
                    {
                      unint64_t v42 = &v35[a8];
                      v35[5] = *(unsigned char *)(result + v37 - 1);
                      v35[6] = a2[v37 - 1];
                      v42[5] = a3[v37 - 1];
                      v42[6] = a4[v37 - 1];
                      if (v10 == 15)
                      {
                        v35[7] = *(unsigned char *)(result + v37);
                        v35[8] = a2[v37];
                        v42[7] = a3[v37];
                        v42[8] = a4[v37];
                      }
                    }
                  }
                }
              }
            }
          }
          unint64_t v38 = v36++;
          v37 += v11;
          v35 += v12;
        }
        while (v38 < a6);
      }
    }
  }
  return result;
}

void sub_21B652F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B653014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65313C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6533D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B653758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B653818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOWriterStereoPixelBufferStreamInput;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6538A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65395C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B653B2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_21B6544FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B6549B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void VTCompressionOutputCallbackImpl(void *a1, char *a2, uint64_t a3, uint64_t a4, opaqueCMSampleBuffer *a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v7 = (void *)*((void *)a2 + 4);
  if (a5)
  {
    long long v10 = *(_OWORD *)(a2 + 8);
    uint64_t v11 = *((void *)a2 + 3);
    [v7 writeSampleBuffer:a5 pts:&v10 metadata:*(void *)a2 withStatus:a3 andFlags:a4];

    MEMORY[0x21D492190](a2, 0x1080C4028F97B41);
  }
  else
  {
    unint64_t v9 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = a3;
      _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_ERROR, "No sample buffer received. VTCompressionSession failed with status: %d", buf, 8u);
    }

    [v7 skipFrameWithStatus:a3 andFlags:a4];
  }
}

void sub_21B654B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B654C38(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x21D492190](v3, 0x10A0C40E4A639F8);

  _Unwind_Resume(a1);
}

void sub_21B654D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B654DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B654E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MOVStreamVideoEncoderInterface;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B654ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B655194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65571C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65587C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B655940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B655D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B655E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B655FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B6560A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B656150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6561E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B656268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6568A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B656BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B656DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B657034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65709C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOCompandedRawBayerFrameProcessor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6571D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B658030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B658098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOL016Raw14FrameProcessor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6581A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B658364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B658574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65860C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOWriterPixelBufferStreamInput;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B658764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B658890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B658C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B658CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B658EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B658F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B659278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6593A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6595C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_21B659EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65A0FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65A254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v11;

  _Unwind_Resume(a1);
}

void sub_21B65A3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_21B65A430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65A490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65A4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B65A978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A10](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A28](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x270EE7A48](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE7AC0](allocator, target, *(void *)&attachmentMode);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x270EE7AE8](formatDescription, otherFormatDescription);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x270EE7AF8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x270EE7B08](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B18](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B28](desc);
}

OSStatus CMMetadataFormatDescriptionCreateWithKeys(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef keys, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7B58](allocator, *(void *)&metadataType, keys, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7B68](allocator, *(void *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BC8](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BE0](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x270EE7C10](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x270EE7C38](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C40](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x270EE7C50](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C70](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x270EE7C80](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetTotalSampleSize(CMSampleBufferRef sbuf)
{
  return MEMORY[0x270EE7CA8](sbuf);
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
}

OSStatus CMSimpleQueueCreate(CFAllocatorRef allocator, int32_t capacity, CMSimpleQueueRef *queueOut)
{
  return MEMORY[0x270EE7CF0](allocator, *(void *)&capacity, queueOut);
}

const void *__cdecl CMSimpleQueueDequeue(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x270EE7D00](queue);
}

OSStatus CMSimpleQueueEnqueue(CMSimpleQueueRef queue, const void *element)
{
  return MEMORY[0x270EE7D10](queue, element);
}

int32_t CMSimpleQueueGetCount(CMSimpleQueueRef queue)
{
  return MEMORY[0x270EE7D28](queue);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x270EE7D88](retstr, time);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7DA0](retstr, lhs, rhs);
}

OSStatus CMTimeCodeFormatDescriptionCreate(CFAllocatorRef allocator, CMTimeCodeFormatType timeCodeFormatType, CMTime *frameDuration, uint32_t frameQuanta, uint32_t flags, CFDictionaryRef extensions, CMTimeCodeFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7DB0](allocator, *(void *)&timeCodeFormatType, frameDuration, *(void *)&frameQuanta, *(void *)&flags, extensions, formatDescriptionOut);
}

uint32_t CMTimeCodeFormatDescriptionGetFrameQuanta(CMTimeCodeFormatDescriptionRef timeCodeFormatDescription)
{
  return MEMORY[0x270EE7DB8](timeCodeFormatDescription);
}

uint32_t CMTimeCodeFormatDescriptionGetTimeCodeFlags(CMTimeCodeFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7DC0](desc);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DC8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE8](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E00](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E18](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E28](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E30](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return (CMTime *)MEMORY[0x270EE7E40](retstr, t, fromRange, toRange);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x270EE7E78](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x270EE7E90](range, otherRange);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x270EE7EA8](allocator, range);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x270EE7EC0](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x270EE7EC8](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetUnion(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x270EE7EE0](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF0](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F10](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCopyTagCollectionArray(CMVideoFormatDescriptionRef formatDescription, CFArrayRef *tagCollectionsOut)
{
  return MEMORY[0x270EE7FA0](formatDescription, tagCollectionsOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FB0](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD8](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FC0](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE9FC8](buffer, *(void *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

CFStringRef CVColorPrimariesGetStringForIntegerCodePoint(int colorPrimariesCodePoint)
{
  return (CFStringRef)MEMORY[0x270EEA030](*(void *)&colorPrimariesCodePoint);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA298](allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

void CVPixelBufferPoolFlush(CVPixelBufferPoolRef pool, CVPixelBufferPoolFlushFlags options)
{
}

CFDictionaryRef CVPixelBufferPoolGetAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x270EEA2B0](pool);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x270EEA2E8](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x270EEA340](allocator, *(void *)&pixelFormat);
}

CFStringRef CVTransferFunctionGetStringForIntegerCodePoint(int transferFunctionCodePoint)
{
  return (CFStringRef)MEMORY[0x270EEA360](*(void *)&transferFunctionCodePoint);
}

CFStringRef CVYCbCrMatrixGetStringForIntegerCodePoint(int yCbCrMatrixCodePoint)
{
  return (CFStringRef)MEMORY[0x270EEA370](*(void *)&yCbCrMatrixCodePoint);
}

uint64_t FigHEVCBridge_CopyHEVCSEIPayloadData()
{
  return MEMORY[0x270EE8278]();
}

uint64_t FigHEVCBridge_Get3DLayerIDs()
{
  return MEMORY[0x270EE8290]();
}

uint64_t FigHEVCBridge_GetHEVCParameterSetAtIndex()
{
  return MEMORY[0x270EE82A0]();
}

uint64_t FigHEVCBridge_GetNALUnitHeaderLengthFromHVCC()
{
  return MEMORY[0x270EE82A8]();
}

uint64_t FigHEVCBridge_GetSPSChromaFormatAndBitDepths()
{
  return MEMORY[0x270EE82B0]();
}

uint64_t FigSampleBufferGetTaggedBufferGroup()
{
  return MEMORY[0x270EE8340]();
}

uint64_t FigTagCollectionCreate()
{
  return MEMORY[0x270EE83B8]();
}

uint64_t FigTagCollectionGetTagsWithCategory()
{
  return MEMORY[0x270EE83C0]();
}

uint64_t FigTagGetSInt64Value()
{
  return MEMORY[0x270EE83D0]();
}

uint64_t FigTagMakeWithSInt64Value()
{
  return MEMORY[0x270EE83D8]();
}

uint64_t FigTaggedBufferGroupCreate()
{
  return MEMORY[0x270EE83E0]();
}

uint64_t FigTaggedBufferGroupGetCVPixelBufferAtIndex()
{
  return MEMORY[0x270EE83E8]();
}

uint64_t FigTaggedBufferGroupGetCount()
{
  return MEMORY[0x270EE83F0]();
}

uint64_t FigTaggedBufferGroupGetTagCollectionAtIndex()
{
  return MEMORY[0x270EE83F8]();
}

uint64_t IOSurfaceGetProhibitUseCount()
{
  return MEMORY[0x270EF4D90]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x270F06628](session, completeUntilPresentationTimeStamp);
}

OSStatus VTCompressionSessionCreate(CFAllocatorRef allocator, int32_t width, int32_t height, CMVideoCodecType codecType, CFDictionaryRef encoderSpecification, CFDictionaryRef sourceImageBufferAttributes, CFAllocatorRef compressedDataAllocator, VTCompressionOutputCallback outputCallback, void *outputCallbackRefCon, VTCompressionSessionRef *compressionSessionOut)
{
  return MEMORY[0x270F06630](allocator, *(void *)&width, *(void *)&height, *(void *)&codecType, encoderSpecification, sourceImageBufferAttributes, compressedDataAllocator, outputCallback);
}

uint64_t VTCompressionSessionCreateWithOptions()
{
  return MEMORY[0x270F06638]();
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x270F06640](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

void VTCompressionSessionInvalidate(VTCompressionSessionRef session)
{
}

OSStatus VTCopyVideoEncoderList(CFDictionaryRef options, CFArrayRef *listOfVideoEncodersOut)
{
  return MEMORY[0x270F06670](options, listOfVideoEncodersOut);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x270F067C0](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067D0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionCopyProperty(VTSessionRef session, CFStringRef propertyKey, CFAllocatorRef allocator, void *propertyValueOut)
{
  return MEMORY[0x270F06810](session, propertyKey, allocator, propertyValueOut);
}

OSStatus VTSessionCopySupportedPropertyDictionary(VTSessionRef session, CFDictionaryRef *supportedPropertyDictionaryOut)
{
  return MEMORY[0x270F06818](session, supportedPropertyDictionaryOut);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}