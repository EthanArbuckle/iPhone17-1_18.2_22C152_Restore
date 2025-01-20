void sub_217A1E9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getPHAssetClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getPHAssetClass_softClass;
  uint64_t v8 = getPHAssetClass_softClass;
  if (!getPHAssetClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getPHAssetClass_block_invoke;
    v2[3] = &unk_2642B58D0;
    v2[4] = &v3;
    __getPHAssetClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_217A1ED2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getPHPhotoLibraryClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getPHPhotoLibraryClass_softClass;
  uint64_t v8 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getPHPhotoLibraryClass_block_invoke;
    v2[3] = &unk_2642B58D0;
    v2[4] = &v3;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_217A1EE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getPHAssetChangeRequestClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getPHAssetChangeRequestClass_softClass;
  uint64_t v8 = getPHAssetChangeRequestClass_softClass;
  if (!getPHAssetChangeRequestClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getPHAssetChangeRequestClass_block_invoke;
    v2[3] = &unk_2642B58D0;
    v2[4] = &v3;
    __getPHAssetChangeRequestClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_217A1F02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class __getPHAssetChangeRequestClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHAssetChangeRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getPHAssetChangeRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08690] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPHAssetChangeRequestClass(void)_block_invoke"), @"ALAsset.m", 42, @"Unable to find class %s", "PHAssetChangeRequest");
    __break(1u);
  }
  return result;
}

void PhotosLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __PhotosLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2642B58F0;
    uint64_t v5 = 0;
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v1 = (void *)[MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *PhotosLibrary(void)"];
    uint64_t v0 = objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"ALAsset.m", 38, @"%s", v3[0]);
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PhotosLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHPhotoLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getPHPhotoLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08690] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPHPhotoLibraryClass(void)_block_invoke"), @"ALAsset.m", 39, @"Unable to find class %s", "PHPhotoLibrary");
    __break(1u);
  }
  return result;
}

Class __getPHAssetClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getPHAssetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08690] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPHAssetClass(void)_block_invoke"), @"ALAsset.m", 40, @"Unable to find class %s", "PHAsset");
    __break(1u);
  }
  return result;
}

void sub_217A1F4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A1FA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPHAdjustmentDataClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHAdjustmentData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getPHAdjustmentDataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08690] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPHAdjustmentDataClass(void)_block_invoke"), @"ALAsset.m", 41, @"Unable to find class %s", "PHAdjustmentData");
    __break(1u);
  }
  return result;
}

Class __getPHContentEditingOutputClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHContentEditingOutput");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getPHContentEditingOutputClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08690] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getPHContentEditingOutputClass(void)_block_invoke"), @"ALAsset.m", 43, @"Unable to find class %s", "PHContentEditingOutput");
    __break(1u);
  }
  return result;
}

void sub_217A1FCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A1FE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A20128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A202CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A20474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A20740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A208E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A20DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A20EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A21194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_217A212F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A214F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A2162C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A218D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A21DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_217A2244C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_217A2265C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A229E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_sync_exit(v33);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__86(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__87(uint64_t a1)
{
}

void sub_217A22E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A22FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A2320C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A234B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A237E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A23BC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A23E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__140(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__141(uint64_t a1)
{
}

void sub_217A24034(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A24240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A24BA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A250A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_217A25F04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A264D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A265EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A26908(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A26DE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A26FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A270DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A273A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A2752C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A27624(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A276C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A27904(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A27AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217A27E80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A280CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A2813C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217A282FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CFRelease(CFTypeRef cf)
{
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

void NSLog(NSString *format, ...)
{
}

uint64_t PLBackendGetLog()
{
  return MEMORY[0x270F537E0]();
}

uint64_t PLCreateImageFromDataWithFormat()
{
  return MEMORY[0x270F53730]();
}

uint64_t PLExifOrientationSwapsWidthAndHeight()
{
  return MEMORY[0x270F53808]();
}

uint64_t PLGetDimensionsFromImageProperties()
{
  return MEMORY[0x270F53748]();
}

uint64_t PLGetSourceTypeHintFromFilename()
{
  return MEMORY[0x270F53750]();
}

uint64_t PLImageOrientationFromExifOrientation()
{
  return MEMORY[0x270F53820]();
}

uint64_t PLIsCloudPhotoLibraryEnabledForCurrentUser()
{
  return MEMORY[0x270F53760]();
}

uint64_t PLMigrationGetLog()
{
  return MEMORY[0x270F53860]();
}

uint64_t PLPhotosAccessAllowed()
{
  return MEMORY[0x270F53888]();
}

uint64_t PLPhysicalDeviceIsIPad()
{
  return MEMORY[0x270F53890]();
}

uint64_t PLPushPhotoLibraryClient()
{
  return MEMORY[0x270F53778]();
}

uint64_t PLScaleDimensionsForThumbnail()
{
  return MEMORY[0x270F538C0]();
}

uint64_t PUTGetCurrentAccess()
{
  return MEMORY[0x270F538E8]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x270EE5608]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
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

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x270ED96A8]();
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
}