void sub_1C2CBBBE4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C2CBBC04(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {

    objc_end_catch();
  }
  JUMPOUT(0x1C2CBBAE0);
}

void _SLSystemConfigManagerPreferencesCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = (void *)MEMORY[0x1C876A440]();
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  v6 = +[SLSystemConfigManager sharedInstanceForCallbackWhileLocked:a3];
  pthread_mutex_unlock(&__SystemConfigManagerMutex);
  if (v6) {
    [v6 _notifyTarget:a2];
  }
}

void sub_1C2CBD9EC(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1C2CBD804);
  }
  objc_exception_rethrow();
}

void sub_1C2CBDA14(_Unwind_Exception *a1)
{
}

void sub_1C2CBFA5C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 136));
  _Unwind_Resume(a1);
}

void sub_1C2CC0154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2CC0A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t _SLServiceRegionIsChina()
{
  v0 = CPGetDeviceRegionCode();
  v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 isEqualToString:@"CH"];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t _SLServiceChineseKeyboardInstalled()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  v1 = [v0 enabledInputModeIdentifiers];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = MEMORY[0x1C876A190](*(void *)(*((void *)&v11 + 1) + 8 * v6));
        char v8 = objc_msgSend(v7, "isEqualToString:", @"zh", (void)v11);

        if (v8)
        {
          uint64_t v9 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

uint64_t _SLServiceHasEntitlement(const __CFString *a1)
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  uint64_t v3 = SecTaskCreateFromSelf(Default);
  uint64_t v4 = (void *)SecTaskCopyValueForEntitlement(v3, a1, 0);
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

void sub_1C2CC38E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2CC6FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MKCoordinateRegionMakeWithDistance(double a1, double a2, double a3, double a4)
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v8 = (uint64_t (*)(double, double, double, double))getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  long long v14 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  if (!getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr)
  {
    uint64_t v9 = (void *)MapKitLibrary();
    v12[3] = (uint64_t)dlsym(v9, "MKCoordinateRegionMakeWithDistance");
    getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    char v8 = (uint64_t (*)(double, double, double, double))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v8) {
    __MKCoordinateRegionMakeWithDistance_cold_1();
  }
  return v8(a1, a2, a3, a4);
}

void sub_1C2CC710C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2CC7C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2CC8450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double initMKMapRectNull()
{
  v0 = (void *)MapKitLibrary();
  v1 = (long long *)dlsym(v0, "MKMapRectNull");
  if (!v1) {
    initMKMapRectNull_cold_1();
  }
  long long v2 = v1[1];
  constantMKMapRectNull = *v1;
  *(_OWORD *)&qword_1EA3358D8 = v2;
  getMKMapRectNull = (uint64_t (*)())MKMapRectNullFunction;
  return *(double *)&constantMKMapRectNull;
}

uint64_t MapKitLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!MapKitLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __MapKitLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E6467910;
    uint64_t v4 = 0;
    MapKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MapKitLibraryCore_frameworkLibrary;
  if (!MapKitLibraryCore_frameworkLibrary) {
    MapKitLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __MapKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MapKitLibraryCore_frameworkLibrary = result;
  return result;
}

double MKMapRectNullFunction()
{
  return *(double *)&constantMKMapRectNull;
}

void *__getMKMapPointForCoordinateSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MapKitLibrary();
  uint64_t result = dlsym(v2, "MKMapPointForCoordinate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKMapPointForCoordinateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKMapRectUnionSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MapKitLibrary();
  uint64_t result = dlsym(v2, "MKMapRectUnion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKMapRectUnionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKCoordinateRegionMakeWithDistanceSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MapKitLibrary();
  uint64_t result = dlsym(v2, "MKCoordinateRegionMakeWithDistance");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKCoordinateRegionForMapRectSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MapKitLibrary();
  uint64_t result = dlsym(v2, "MKCoordinateRegionForMapRect");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKCoordinateRegionForMapRectSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMKLocationManagerClass_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  Class result = objc_getClass("MKLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMKLocationManagerClass_block_invoke_cold_1();
  }
  getMKLocationManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMKMapViewClass_block_invoke(uint64_t a1)
{
  MapKitLibrary();
  Class result = objc_getClass("MKMapView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMKMapViewClass_block_invoke_cold_1();
  }
  getMKMapViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C2CCA3E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C2CCB844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2CCE6D0(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1C2CCE5B8);
  }
  objc_exception_rethrow();
}

void sub_1C2CCE6F8(_Unwind_Exception *a1)
{
}

void sub_1C2CD28E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2CD2C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void sub_1C2CD32AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2CD3504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2CDA7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void _SLSheetURLPreviewImageFrameWithBounds()
{
  uint64_t v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 scale];

  v1 = [MEMORY[0x1E4F42D90] mainScreen];
  [v1 scale];

  long long v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];

  long long v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
}

void sub_1C2CDB614(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t SLAttachmentPayloadIsAssetLibraryURL(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 payload];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v3 = [v1 payload];
    uint64_t v4 = [v3 scheme];
    uint64_t v5 = [v4 isEqualToString:@"assets-library"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t SLAttachmentPayloadIsVideoFileURL(void *a1)
{
  id v1 = a1;
  if ([v1 type] == 9)
  {
    uint64_t v2 = [v1 payload];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v3 = [v1 payload];
      uint64_t v4 = [v3 scheme];
      uint64_t v5 = [v4 isEqualToString:@"file"];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id _SLAttachmentURLForAsset(void *a1)
{
  id v2 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v2 defaultRepresentation];
      id v3 = [v4 url];
    }
    else
    {
      _SLLog(v1, 3, @"SLAttachment media assets must be URLs or ALAssets - returning nil attachment");
      id v3 = 0;
    }
  }

  return v3;
}

CGImageRef SLCreateThumbnailImageForImageData(const __CFData *a1, uint64_t a2)
{
  keys[3] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v10 = a2;
  CGImageSourceRef v2 = CGImageSourceCreateWithData(a1, 0);
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberNSIntegerType, &v10);
  uint64_t v5 = (void *)*MEMORY[0x1E4F1CFD0];
  uint64_t v6 = (void *)*MEMORY[0x1E4F2FE38];
  keys[0] = *(void **)MEMORY[0x1E4F2FE48];
  keys[1] = v6;
  values[0] = v5;
  values[1] = v5;
  keys[2] = *(void **)MEMORY[0x1E4F2FF68];
  values[2] = v4;
  CFDictionaryRef v7 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v3, 0, v7);
  CFRelease(v4);
  CFRelease(v7);
  CFRelease(v3);
  return ThumbnailAtIndex;
}

CGImageSource *SLDownSampledImageData(void *a1, uint64_t a2, uint64_t a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  CFDataRef v6 = a1;
  uint64_t v24 = a2;
  _SLLog(v3, 6, @"Will downsample image to target width:%i height:%i");
  CFDictionaryRef v7 = CGImageSourceCreateWithData(v6, 0);

  if (!v7)
  {
    _SLLog(v3, 6, @"SLImageDownsampling cannot create image source, returning nil");
    goto LABEL_29;
  }
  CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
  CFDictionaryRef v9 = v8;
  if (!v8)
  {
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FCA0], a2, a3);
  uint64_t v11 = [(__CFDictionary *)v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
  if (!v11)
  {
LABEL_8:
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  long long v12 = v11;
  uint64_t v13 = *MEMORY[0x1E4F2FD70];
  uint64_t v14 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2FD70]];
  v15 = (void *)v14;
  if (v14)
  {
    uint64_t v25 = v13;
    v26[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  }
  else
  {

    uint64_t v16 = 0;
  }

LABEL_11:
  if (CGImageSourceGetCount(v7))
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
    CFRelease(v7);
    if (ImageAtIndex)
    {
      CFDictionaryRef v7 = (CGImageSource *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
      CGImageDestinationRef v18 = CGImageDestinationCreateWithData(v7, @"public.jpeg", 1uLL, 0);
      if (v18)
      {
        v19 = v18;
        v20 = objc_opt_new();
        [v20 setObject:&unk_1F1E40E58 forKeyedSubscript:*MEMORY[0x1E4F2F430]];
        if (a2 && a3)
        {
          if (a2 <= a3) {
            uint64_t v21 = a3;
          }
          else {
            uint64_t v21 = a2;
          }
          v22 = objc_msgSend(NSNumber, "numberWithInteger:", v21, v24);
          [v20 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F2F428]];
        }
        _SLLog(v3, 6, @"Orientation is %@");
        if (v10) {
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E4F2FCA0], v10);
        }
        if (v16) {
          [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F2FD40]];
        }
        CGImageDestinationAddImage(v19, ImageAtIndex, (CFDictionaryRef)v20);
        CGImageDestinationFinalize(v19);
        CFRelease(v19);
      }
      CGImageRelease(ImageAtIndex);
      goto LABEL_28;
    }
  }
  else
  {
    CFRelease(v7);
  }
  CFDictionaryRef v7 = 0;
LABEL_28:

LABEL_29:

  return v7;
}

uint64_t SLServiceMain(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  CFDataRef v6 = [v4 serviceName];
  _SLLog(v3, 5, @"SLServiceMain is creating a service listener for %@");

  objc_msgSend(v4, "beginAcceptingConnections", v6);
  return 0;
}

__CFString *SLUserDataDirectory()
{
  CFURLRef v0 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v0)
  {
    CFURLRef v1 = v0;
    CFStringRef v2 = CFURLCopyFileSystemPath(v0, kCFURLPOSIXPathStyle);
    if (v2)
    {
      CFStringRef v3 = v2;
      MutableCopy = CFStringCreateMutableCopy(0, 0, v2);
      CFStringAppend(MutableCopy, @"/Library/Social/");
      CFRelease(v3);
    }
    else
    {
      MutableCopy = 0;
    }
    CFRelease(v1);
  }
  else
  {
    MutableCopy = 0;
  }

  return MutableCopy;
}

id SLUserLibraryDirectory()
{
  if (SLUserLibraryDirectory_onceToken != -1) {
    dispatch_once(&SLUserLibraryDirectory_onceToken, &__block_literal_global_4);
  }
  CFURLRef v0 = (void *)SLUserLibraryDirectory_userLibraryDirectory;

  return v0;
}

void __SLUserLibraryDirectory_block_invoke()
{
  CFURLRef v0 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v0)
  {
    CFURLRef v1 = v0;
    CFStringRef v2 = CFURLCopyFileSystemPath(v0, kCFURLPOSIXPathStyle);
    if (v2)
    {
      CFStringRef v3 = v2;
      MutableCopy = CFStringCreateMutableCopy(0, 0, v2);
      CFStringAppend(MutableCopy, @"/Library/");
      CFRelease(v3);
      uint64_t v5 = (void *)SLUserLibraryDirectory_userLibraryDirectory;
      SLUserLibraryDirectory_userLibraryDirectory = (uint64_t)MutableCopy;
    }
    CFRelease(v1);
  }
}

id SLSocialFrameworkBundle()
{
  if (SLSocialFrameworkBundle_onceToken != -1) {
    dispatch_once(&SLSocialFrameworkBundle_onceToken, &__block_literal_global_6);
  }
  CFURLRef v0 = (void *)SLSocialFrameworkBundle_socialBundle;

  return v0;
}

void __SLSocialFrameworkBundle_block_invoke()
{
  CPSystemRootDirectory();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFURLRef v0 = (void *)MEMORY[0x1E4F28B50];
  CFURLRef v1 = [v4 stringByAppendingPathComponent:@"System/Library/Frameworks/Social.framework"];
  uint64_t v2 = [v0 bundleWithPath:v1];
  CFStringRef v3 = (void *)SLSocialFrameworkBundle_socialBundle;
  SLSocialFrameworkBundle_socialBundle = v2;
}

void sub_1C2CE0D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void ___startObservingPreferenceChanges_block_invoke()
{
  CFURLRef v0 = _preferencesQueue();
  notify_register_dispatch("com.apple.social.facebook.envDidChange", (int *)&_startObservingPreferenceChanges_token, v0, &__block_literal_global_74);
}

uint64_t ___startObservingPreferenceChanges_block_invoke_2()
{
  return CFPreferencesAppSynchronize(@"com.apple.social.facebook");
}

id _preferencesQueue()
{
  if (_preferencesQueue_once != -1) {
    dispatch_once(&_preferencesQueue_once, &__block_literal_global_76);
  }
  CFURLRef v0 = (void *)_preferencesQueue_queue;

  return v0;
}

uint64_t ___preferencesQueue_block_invoke()
{
  _preferencesQueue_queue = (uint64_t)dispatch_queue_create("com.apple.social.facebook.preferencesQueue", 0);

  return MEMORY[0x1F41817F8]();
}

void sub_1C2CE1908(void *a1)
{
}

void sub_1C2CE41B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1C2CE4A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2CE4D98(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1C2CE4EA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _SLLog(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = _SLGetLogSystem_onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_SLGetLogSystem_onceToken, &__block_literal_global_7);
  }
  os_log_shim_with_CFString();
}

void sub_1C2CEE5D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_1C2CF2A00(mach_port_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unint64_t *a5, void *a6, unsigned int *a7)
{
  int v18 = 1;
  uint64_t v19 = a3;
  int v20 = 16777472;
  unsigned int v21 = a4;
  uint64_t v22 = *MEMORY[0x1E4F14068];
  unint64_t v23 = __PAIR64__(a4, a2);
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x1F41887A0])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 3, 0x3Cu, 0x48u, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (v12)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v15 = 4294966988;
  }
  else if (msg.msgh_id == 1300)
  {
    if ((msg.msgh_bits & 0x80000000) != 0)
    {
      uint64_t v15 = 4294966996;
      if (v18 == 1 && msg.msgh_size == 64 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
      {
        unsigned int v16 = v21;
        if (v21 == v24)
        {
          *a5 = v23;
          *a6 = v19;
          *a7 = v16;
          return 0;
        }
      }
    }
    else if (msg.msgh_size == 36)
    {
      uint64_t v15 = 4294966996;
      if (HIDWORD(v19))
      {
        if (msg.msgh_remote_port) {
          uint64_t v15 = 4294966996;
        }
        else {
          uint64_t v15 = HIDWORD(v19);
        }
      }
    }
    else
    {
      uint64_t v15 = 4294966996;
    }
  }
  else
  {
    uint64_t v15 = 4294966995;
  }
  mach_msg_destroy(&msg);
  return v15;
}

uint64_t sub_1C2CF2BF8(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v11 = 1;
  uint64_t v12 = a4;
  int v13 = 16777472;
  int v14 = a5;
  uint64_t v15 = *MEMORY[0x1E4F14068];
  int v16 = a2;
  uint64_t v17 = a3;
  int v18 = a5;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B100000000;
  if (MEMORY[0x1F41887A0])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&msg, 3, 0x44u, 0x2Cu, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v8;
  }
  if (v7)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v8;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v8 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v8;
  }
  if (msg.msgh_id != 1301)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_17;
  }
  uint64_t v8 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_17;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_17;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_17;
  }
  uint64_t v8 = HIDWORD(v12);
  if (HIDWORD(v12)) {
    goto LABEL_17;
  }
  return v8;
}

uint64_t sub_1C2CF2D74(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v17 = 1;
  uint64_t v18 = a4;
  int v19 = 16777472;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a2;
  uint64_t v23 = a3;
  int v24 = a5;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B200000000;
  if (MEMORY[0x1F41887A0])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&msg, 3, 0x44u, 0x40u, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v12;
  }
  if (v11)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v12;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v14 = 4294966988;
  }
  else if (msg.msgh_id == 1302)
  {
    if ((msg.msgh_bits & 0x80000000) != 0)
    {
      uint64_t v14 = 4294966996;
      if (v17 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v19) == 1)
      {
        int v15 = v20;
        if (v20 == v22)
        {
          *a6 = v18;
          *a7 = v15;
          return 0;
        }
      }
    }
    else if (msg.msgh_size == 36)
    {
      uint64_t v14 = 4294966996;
      if (HIDWORD(v18))
      {
        if (msg.msgh_remote_port) {
          uint64_t v14 = 4294966996;
        }
        else {
          uint64_t v14 = HIDWORD(v18);
        }
      }
    }
    else
    {
      uint64_t v14 = 4294966996;
    }
  }
  else
  {
    uint64_t v14 = 4294966995;
  }
  mach_msg_destroy(&msg);
  return v14;
}

uint64_t sub_1C2CF2F68(mach_port_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F14068];
  unsigned int v10 = a2;
  uint64_t v11 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B300000000;
  if (MEMORY[0x1F41887A0])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v5 = mach_msg(&msg, 3, 0x2Cu, 0x2Cu, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v6;
  }
  if (v5)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v6;
  }
  else
  {
    if (msg.msgh_id == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      uint64_t v6 = 4294966996;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v6 = v10;
        if (!v10) {
          return v6;
        }
      }
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
    mach_msg_destroy(&msg);
    return v6;
  }
}

uint64_t Be81a395Bf0(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(&off_1E64682F0
       + ((91 * ((dword_1EA335818 + dword_1EA335810) ^ 0x70)) ^ byte_1C2CFAB50[byte_1C2CFB550[(91 * ((dword_1EA335818 + dword_1EA335810) ^ 0x70))] ^ 0x94])
       + 8);
  uint64_t v2 = *(&off_1E64682F0
       + ((91 * (*v1 ^ dword_1EA335818 ^ 0x70)) ^ byte_1C2CFB150[byte_1C2CFAD50[(91 * (*v1 ^ dword_1EA335818 ^ 0x70))] ^ 0x39])
       - 222);
  uint64_t v3 = *v2 - *v1 - (void)&v9;
  void *v1 = 1822798427 * v3 + 0x6E6E655B55E8ACD0;
  void *v2 = 1822798427 * (v3 ^ 0x8EC5F3EEF9E6FF70);
  uint64_t v4 = (uint64_t)*(&off_1E64682F0
                + ((91 * ((dword_1EA335818 + dword_1EA335810) ^ 0x70)) ^ byte_1C2CFB150[byte_1C2CFAD50[(91 * ((dword_1EA335818 + dword_1EA335810) ^ 0x70))] ^ 0xB1])
                - 99);
  uint64_t v5 = *(void *)(v4 + 120);
  unint64_t v6 = 942846689 * ((unint64_t)&v10 ^ 0x2DF4282E8CBBA516);
  int v10 = v6 ^ 0xF067FA72;
  uint64_t v11 = a1;
  unint64_t v12 = v5 ^ v6;
  unsigned __int8 v7 = 91 * ((*(_DWORD *)v2 + *(_DWORD *)v1) ^ 0x70);
  (*(void (**)(int *))(v4 + 8
                                     * ((byte_1C2CFB350[byte_1C2CFB058[v7 - 8] ^ 0x89] ^ v7) - 29)))(&v10);
  return v13;
}

uint64_t sub_1C2CF32A8(unsigned int a1)
{
  return byte_1C2CFAB50[byte_1C2CFB550[a1] ^ 0x94] ^ a1;
}

uint64_t IW1PcFszqNK(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (uint64_t)*(&off_1E64682F0
                + ((91 * (dword_1EA335808 ^ 0x70 ^ dword_1EA335818)) ^ byte_1C2CFB250[byte_1C2CFAE50[(91 * (dword_1EA335808 ^ 0x70 ^ dword_1EA335818))] ^ 0xB5])
                - 155);
  uint64_t v2 = *(void *)(v1 - 4);
  uint64_t v3 = (unint64_t *)*(&off_1E64682F0
                           + ((91 * ((dword_1EA335818 - v2) ^ 0x70)) ^ byte_1C2CFAA50[byte_1C2CFB450[(91 * ((dword_1EA335818 - v2) ^ 0x70))] ^ 0xAA])
                           - 63);
  unint64_t v4 = 1822798427 * ((unint64_t)&v10[*v3 ^ v2] ^ 0x8EC5F3EEF9E6FF70);
  *(void *)(v1 - 4) = v4;
  *uint64_t v3 = v4;
  uint64_t v5 = (uint64_t)*(&off_1E64682F0
                + ((91 * ((dword_1EA335818 - dword_1EA335808) ^ 0x70)) ^ byte_1C2CFAB50[byte_1C2CFB550[(91 * ((dword_1EA335818 - dword_1EA335808) ^ 0x70))] ^ 0x52])
                - 196);
  uint64_t v6 = *(void *)(v5 + 248);
  unint64_t v7 = 942846689
     * ((((unint64_t)&v11 | 0xDBD392286209E2F0)
       - ((unint64_t)&v11 | 0x242C6DD79DF61D0FLL)
       + 0x242C6DD79DF61D0FLL) ^ 0xF627BA06EEB247E6);
  int v11 = v7 ^ 0xF067FA72;
  uint64_t v12 = a1;
  unint64_t v13 = v6 ^ v7;
  unsigned __int8 v8 = 91 * ((*(_DWORD *)v3 - *(_DWORD *)(v1 - 4)) ^ 0x70);
  (*(void (**)(int *))(v5
                                + 8
                                * ((byte_1C2CFAF5C[(byte_1C2CFAC5C[v8 - 12] ^ 0x24) - 12] ^ v8)
                                 + 68)))(&v11);
  return v14;
}

uint64_t sub_1C2CF34FC(unsigned int a1)
{
  return byte_1C2CFB150[byte_1C2CFAD50[a1] ^ 0xB1] ^ a1;
}

uint64_t sub_1C2CF3528(char a1, unsigned int a2)
{
  return byte_1C2CFAF5C[(byte_1C2CFAC5C[a2 - 12] ^ a1) - 12] ^ a2;
}

uint64_t sub_1C2CF3554(unsigned int a1)
{
  return byte_1C2CFAF5C[(byte_1C2CFAC5C[a1 - 12] ^ 0x24) - 12] ^ a1;
}

uint64_t sub_1C2CF3584(char a1, unsigned int a2)
{
  return byte_1C2CFB350[(byte_1C2CFB058[a2 - 8] ^ a1)] ^ a2;
}

uint64_t sub_1C2CF35B0(unsigned int a1)
{
  return byte_1C2CFB350[byte_1C2CFB058[a1 - 8] ^ 0x89] ^ a1;
}

uint64_t sub_1C2CF35DC(char a1, unsigned int a2)
{
  return byte_1C2CFB150[(byte_1C2CFAD50[a2] ^ a1)] ^ a2;
}

uint64_t sub_1C2CF3608(unsigned int a1)
{
  return byte_1C2CFB150[byte_1C2CFAD50[a1] ^ 0x39] ^ a1;
}

uint64_t sub_1C2CF3634(char a1, unsigned int a2)
{
  return byte_1C2CFAA50[(byte_1C2CFB450[a2] ^ a1)] ^ a2;
}

uint64_t sub_1C2CF3660(unsigned int a1)
{
  return byte_1C2CFAA50[byte_1C2CFB450[a1] ^ 0xAA] ^ a1;
}

uint64_t sub_1C2CF368C(char a1, unsigned int a2)
{
  return byte_1C2CFB250[(byte_1C2CFAE50[a2] ^ a1)] ^ a2;
}

uint64_t sub_1C2CF36B8(unsigned int a1)
{
  return byte_1C2CFB250[byte_1C2CFAE50[a1] ^ 0xB5] ^ a1;
}

uint64_t sub_1C2CF36E4(char a1, unsigned int a2)
{
  return byte_1C2CFAB50[(byte_1C2CFB550[a2] ^ a1)] ^ a2;
}

uint64_t sub_1C2CF3710(unsigned int a1)
{
  return byte_1C2CFAB50[byte_1C2CFB550[a1] ^ 0x52] ^ a1;
}

void sub_1C2CF373C(uint64_t a1)
{
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1C2CF37F8@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v1 - 1531033816) & 0x6AD9BE7F) + 27) * (v2 != 0)) ^ (a1 + v1 - 13))))();
}

uint64_t sub_1C2CF3838()
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(v3 + 8 * (v0 + 61)))(v2);
  *(_DWORD *)(v1 + 24) = 0;
  return result;
}

void KxmB0CKvgWt(uint64_t a1, int a2)
{
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1C2CF3A2C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = *(void *)(v5 + 16);
  unsigned int v18 = 1829790799
      * (((&v16 | 0xD30D353F) - &v16 + (&v16 & 0x2CF2CAC0)) ^ 0x11C49574)
      + 463207035;
  int v17 = v12;
  (*(void (**)(int *))(v5 + 528))(&v16);
  v12[0] = *(void *)(v5 + 280);
  v12[1] = a1;
  int v13 = a2;
  v12[2] = a3;
  uint64_t v14 = a4;
  uint64_t v15 = a5;
  unsigned int v18 = 1829790799
      * ((((&v16 | 0xC30BD196) ^ 0xFFFFFFFE) - (~&v16 | 0x3CF42E69)) ^ 0xFE3D8E22)
      + 463207035;
  int v17 = v12;
  (*(void (**)(int *))(v5 + 528))(&v16);
  return (v16 - 955058042);
}

void sub_1C2CF3B60(uint64_t a1)
{
  *(void *)&v6[15] = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)a1 ^ (646995413 * ((((2 * a1) | 0x8F18737E) - a1 + 947111489) ^ 0x534DB4D5));
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)*(&off_1E64682F0 + (v1 ^ 0xA));
  strcpy(v6, "com.apple.absd");
  uint64_t v4 = (uint64_t)*(&off_1E64682F0 + v1 + 2);
  int v5 = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v4 + 8 * (v1 ^ 0x69)))(v3, v6, v2);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1C2CF3C80()
{
  uint64_t v7 = *v5;
  uint64_t v9 = v4;
  strcpy(v10, "e.absinthed");
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(v6 + 8 * (v3 ^ 0x59)))(v7, &v9, v1);
  if (result != v3 - 48) {
    int v2 = 955013739;
  }
  *(_DWORD *)(v0 + 4) = v2;
  return result;
}

void nDYmeMqvWb(uint64_t a1, uint64_t a2, int a3)
{
  if (a1) {
    BOOL v3 = a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  int v5 = !v3 && a3 != 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1C2CF3D7C(uint64_t a1, uint64_t a2, int a3)
{
  v8[0] = *(void *)(v3 + 16);
  unsigned int v12 = 1829790799 * (&v10 ^ 0xC2C9A04B) + 463207035;
  int v11 = v8;
  (*(void (**)(int *))(v3 + 528))(&v10);
  v8[0] = *(void *)(v3 + 224);
  v8[1] = a1;
  v8[2] = a2;
  int v9 = a3;
  int v11 = v8;
  unsigned int v12 = 1829790799 * ((2 * (&v10 & 0x21EBD450) - &v10 + 1578380203) ^ 0x9CDD8BE0)
      + 463207035;
  (*(void (**)(int *))(v3 + 528))(&v10);
  return (v10 - 955058042);
}

void sub_1C2CF3E80(uint64_t a1)
{
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1C2CF3F28()
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t (*)()))(v2 + 8 * (int)(v0 & 0xC4000437)))(*(void *)(v3 + 8 * (v0 ^ 0x1B9BFA72)) - 8, nullsub_1);
  _DWORD *v1 = -1133814153;
  return result;
}

void t1BoNctgaUu66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1C2CF50BC()
{
  return 4294923273;
}

void __MKCoordinateRegionMakeWithDistance_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "MKCoordinateRegion __MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D, CLLocationDistance, CLLocationDistance)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SLSheetPlaceViewController.m", 45, @"%s", dlerror());

  __break(1u);
}

void initMKMapRectNull_cold_1()
{
}

void MapKitLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *MapKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SLSheetPlaceViewController.m", 39, @"%s", *a1);

  __break(1u);
}

void __getMKLocationManagerClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMKLocationManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SLSheetPlaceViewController.m", 42, @"Unable to find class %s", "MKLocationManager");

  __break(1u);
}

void __getMKMapViewClass_block_invoke_cold_1()
{
  int v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMKMapViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SLSheetPlaceViewController.m", 41, @"Unable to find class %s", "MKMapView");

  __break(1u);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1F40D77B8]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextEOClip(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

uint64_t CPFileBuildDirectoriesToPath()
{
  return MEMORY[0x1F41092F8]();
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1F4109310]();
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x1F4109900]();
}

uint64_t DMCopyCurrentBuildVersion()
{
  return MEMORY[0x1F41173B8]();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x1F411C8F8]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1F412FA18]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t SBSCopyBundleInfoValueForKeyAndProcessID()
{
  return MEMORY[0x1F415C300]();
}

uint64_t SBSCopyDisplayIdentifiersForProcessID()
{
  return MEMORY[0x1F415C310]();
}

uint64_t SBSCopyLocalizedApplicationNameForDisplayIdentifier()
{
  return MEMORY[0x1F415C320]();
}

int SCError(void)
{
  return MEMORY[0x1F4101E20]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FE8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FF0](prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1F4102000](allocator, name, prefsID, authorization);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4102010](prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x1F4102018](prefs, wait);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102028](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1F4102030](prefs, callout, context);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x1F4102058](prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4102068](prefs);
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102070](prefs, runLoop, runLoopMode);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t SecTrustCopyInfo()
{
  return MEMORY[0x1F40F71B0]();
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1F40F71F0](trust, result);
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4102B78]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x1F4102CF0]();
}

uint64_t UIKeyboardIsAutomaticAppearanceEnabled()
{
  return MEMORY[0x1F4102CF8]();
}

uint64_t WebThreadRun()
{
  return MEMORY[0x1F4103ED8]();
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x1F40D31B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UISharedImageSetPreferredImageScale()
{
  return MEMORY[0x1F4102F48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

uint64_t os_log_shim_with_CFString()
{
  return MEMORY[0x1F40CD3A8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}