void sub_22D90D8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D90DC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D90DF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MediaAccessibilityLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __MediaAccessibilityLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2649C27E8;
    uint64_t v7 = 0;
    MediaAccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary;
    if (MediaAccessibilityLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "MAImageCaptioningCopyCaptionWithSource");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaAccessibilityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaAccessibilityLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22D90F250(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_22D90FF04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, id *a16)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v18);
  objc_destroyWeak(location);
  objc_destroyWeak(a16);
  objc_destroyWeak(v17);
  objc_destroyWeak((id *)(v19 - 112));
  _Unwind_Resume(a1);
}

void sub_22D9102B4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22D9104B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D910678(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22D9119B8()
{
}

void sub_22D911B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D914328(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_22D916FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_22D917198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_22D91731C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D9174CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D918894(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_22D91CEE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

double maxImageArea()
{
  v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 nativeBounds];
  double v2 = v1;
  double v4 = v3;

  return fmax(v2 * v4, 3307500.0);
}

uint64_t _PDFObjectRetain(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef _PDFObjectCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"%p", a1);
}

BOOL _PDFObjectEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void _dictionaryApplierFunction(uint64_t a1, CGPDFObject *a2, void *a3)
{
  id v5 = a3;
  long long v6 = objc_msgSend(NSString, "stringWithFormat:", @"/%s", a1);
  CGPDFStreamRef value = 0;
  CGPDFDictionaryRef dict = 0;
  CGPDFObjectType Type = CGPDFObjectGetType(a2);
  if ((Type - 1) >= 7)
  {
    if (Type == kCGPDFObjectTypeDictionary)
    {
      if (CGPDFObjectGetValue(a2, kCGPDFObjectTypeDictionary, &dict)
        && !CFSetContainsValue((CFSetRef)seenObjects, dict))
      {
        CFSetAddValue((CFMutableSetRef)seenObjects, dict);
        v9 = [MEMORY[0x263EFF9A0] dictionary];
        CGPDFDictionaryApplyFunction(dict, (CGPDFDictionaryApplierFunction)_dictionaryApplierFunction, v9);
        goto LABEL_4;
      }
    }
    else if (Type == kCGPDFObjectTypeStream && CGPDFObjectGetValue(a2, kCGPDFObjectTypeStream, &value))
    {
      CGPDFDictionaryRef Dictionary = CGPDFStreamGetDictionary(value);
      if (Dictionary)
      {
        v11 = Dictionary;
        CFSetAddValue((CFMutableSetRef)seenObjects, Dictionary);
        v9 = [MEMORY[0x263EFF9A0] dictionary];
        CGPDFDictionaryApplyFunction(v11, (CGPDFDictionaryApplierFunction)_dictionaryApplierFunction, v9);
        if (![v9 count]) {
          goto LABEL_5;
        }
        CGPDFDataFormat format = CGPDFDataFormatRaw;
        CFDataRef v12 = CGPDFStreamCopyData(value, &format);
        if (!v12) {
          goto LABEL_5;
        }
        CFDataRef v13 = v12;
        [v9 setObject:v12 forKey:@"/%Stream"];
        CFRelease(v13);
LABEL_4:
        [v5 setValue:v9 forKey:v6];
LABEL_5:
      }
    }
  }
  else
  {
    uint64_t v8 = _objectFromPDFObject(a2);
    if (v8)
    {
      v9 = (void *)v8;
      goto LABEL_4;
    }
  }
}

id _objectFromPDFObject(CGPDFObject *a1)
{
  char value = 0;
  double v14 = 0.0;
  uint64_t v15 = 0;
  CGPDFStringRef string = 0;
  uint64_t v13 = 0;
  CGPDFArrayRef array = 0;
  switch(CGPDFObjectGetType(a1))
  {
    case kCGPDFObjectTypeNull:
      id v2 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_14;
    case kCGPDFObjectTypeBoolean:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeBoolean, &value)) {
        goto LABEL_28;
      }
      if (value) {
        double v3 = (void *)MEMORY[0x263EFFA88];
      }
      else {
        double v3 = (void *)MEMORY[0x263EFFA80];
      }
      id v2 = v3;
      goto LABEL_14;
    case kCGPDFObjectTypeInteger:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeInteger, &v15)) {
        goto LABEL_28;
      }
      id v2 = [NSNumber numberWithLong:v15];
      goto LABEL_14;
    case kCGPDFObjectTypeReal:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeReal, &v14)) {
        goto LABEL_28;
      }
      id v2 = [NSNumber numberWithDouble:v14];
      goto LABEL_14;
    case kCGPDFObjectTypeName:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeName, &v13)) {
        goto LABEL_28;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"/%s", v13);
      id v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      double v4 = v2;
      break;
    case kCGPDFObjectTypeString:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeString, &string)) {
        goto LABEL_28;
      }
      CFStringRef v5 = CGPDFStringCopyTextString(string);
      if (v5) {
        double v4 = (void *)v5;
      }
      else {
        double v4 = 0;
      }
      break;
    case kCGPDFObjectTypeArray:
      if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeArray, &array)) {
        goto LABEL_28;
      }
      size_t Count = CGPDFArrayGetCount(array);
      double v4 = [MEMORY[0x263EFF980] arrayWithCapacity:Count];
      if (Count)
      {
        for (size_t i = 0; i != Count; ++i)
        {
          CGPDFObjectRef v10 = 0;
          if (CGPDFArrayGetObject(array, i, &v10))
          {
            uint64_t v8 = _objectFromPDFObject(v10);
            if (v8) {
              [v4 addObject:v8];
            }
          }
        }
      }
      break;
    default:
LABEL_28:
      double v4 = 0;
      break;
  }
  return v4;
}

void sub_22D920DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22D921688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_22D9262E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

id _dictionaryForPDFDictionary(CGPDFDictionary *a1, void *a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = objc_opt_new();
  v7[0] = @"resultDict";
  v7[1] = @"visitedSet";
  v8[0] = v4;
  v8[1] = v3;
  CFStringRef v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  CGPDFDictionaryApplyFunction(a1, (CGPDFDictionaryApplierFunction)_iterateDictionaryValueCallback, v5);
  return v4;
}

uint64_t _getStreams(const char *a1, uint64_t a2, CGPDFDictionary **a3)
{
  uint64_t result = strncmp(a1, "On", 2uLL);
  if (!result)
  {
    long long v6 = *a3;
    return CGPDFDictionaryGetStream(v6, a1, a3 + 1);
  }
  return result;
}

void _iterateDictionaryValueCallback(uint64_t a1, CGPDFObject *a2, void *a3)
{
  id v5 = a3;
  id v10 = [v5 objectForKeyedSubscript:@"resultDict"];
  long long v6 = [v5 objectForKeyedSubscript:@"visitedSet"];

  uint64_t v7 = [NSString stringWithCString:a1 encoding:4];
  uint64_t v8 = _objectForCGPDFObjectRefAndVisitedSet(a2, v6);
  if (v8)
  {
    [v10 setObject:v8 forKeyedSubscript:v7];
  }
  else
  {
    v9 = [MEMORY[0x263EFF9D0] null];
    [v10 setObject:v9 forKeyedSubscript:v7];
  }
}

CGPDFObject *_objectForCGPDFObjectRefAndVisitedSet(CGPDFObject *a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  if (!v3)
  {
    NSLog(&cfstr_VisitedsetMust.isa);
LABEL_7:
    a1 = 0;
    goto LABEL_8;
  }
  if (!a1) {
    goto LABEL_8;
  }
  id v5 = [v3 objectForKey:a1];

  if (v5) {
    goto LABEL_7;
  }
  long long v6 = [MEMORY[0x263EFF9D0] null];
  [v4 setObject:v6 forKey:a1];

  switch(CGPDFObjectGetType(a1))
  {
    case kCGPDFObjectTypeBoolean:
      LOBYTE(value) = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeBoolean, &value);
      uint64_t v7 = [NSNumber numberWithUnsignedChar:value];
      goto LABEL_23;
    case kCGPDFObjectTypeInteger:
      CGPDFObjectRef value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeInteger, &value);
      uint64_t v7 = [NSNumber numberWithLong:value];
      goto LABEL_23;
    case kCGPDFObjectTypeReal:
      CGPDFObjectRef value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeReal, &value);
      uint64_t v7 = [NSNumber numberWithDouble:*(double *)&value];
      goto LABEL_23;
    case kCGPDFObjectTypeName:
      CGPDFObjectRef value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeName, &value);
      uint64_t v7 = [NSString stringWithCString:value encoding:4];
      goto LABEL_23;
    case kCGPDFObjectTypeString:
      CGPDFObjectRef value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeString, &value);
      uint64_t v7 = (uint64_t)CGPDFStringCopyTextString(value);
      goto LABEL_23;
    case kCGPDFObjectTypeArray:
      uint64_t v15 = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeArray, &v15);
      v9 = v15;
      id v10 = v4;
      size_t Count = CGPDFArrayGetCount(v9);
      a1 = (CGPDFObject *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:Count];
      if (Count)
      {
        for (size_t i = 0; i != Count; ++i)
        {
          CGPDFObjectRef value = 0;
          CGPDFArrayGetObject(v9, i, &value);
          uint64_t v13 = _objectForCGPDFObjectRefAndVisitedSet(value, v10);
          if (v13)
          {
            [(CGPDFObject *)a1 setObject:v13 atIndexedSubscript:i];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x263EFF9D0] null];
            [(CGPDFObject *)a1 setObject:v14 atIndexedSubscript:i];
          }
        }
      }

      break;
    case kCGPDFObjectTypeDictionary:
      CGPDFObjectRef value = 0;
      CGPDFObjectGetValue(a1, kCGPDFObjectTypeDictionary, &value);
      uint64_t v7 = _dictionaryForPDFDictionary(value, v4);
LABEL_23:
      a1 = (CGPDFObject *)v7;
      break;
    default:
      goto LABEL_7;
  }
LABEL_8:

  return a1;
}

void sub_22D928070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D928EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D929350(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D92946C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22D929AF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void *__getDDDetectionControllerWillPresentActionNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DataDetectorsUILibrary();
  uint64_t result = dlsym(v2, "DDDetectionControllerWillPresentActionNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDDDetectionControllerWillPresentActionNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t DataDetectorsUILibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __DataDetectorsUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2649C2EC0;
    uint64_t v5 = 0;
    DataDetectorsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = DataDetectorsUILibraryCore_frameworkLibrary;
  double v1 = (void *)v3[0];
  if (!DataDetectorsUILibraryCore_frameworkLibrary)
  {
    double v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DataDetectorsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getDDDetectionControllerDidDismissActionNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DataDetectorsUILibrary();
  uint64_t result = dlsym(v2, "DDDetectionControllerDidDismissActionNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDDDetectionControllerDidDismissActionNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

void sub_22D92C30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __MUGlowHDREnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MUGlowHDREnabled__glowHDREnabled = result;
  return result;
}

void *__getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MediaAccessibilityLibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __MediaAccessibilityLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2649C2F00;
    uint64_t v7 = 0;
    MediaAccessibilityLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary_0;
    if (MediaAccessibilityLibraryCore_frameworkLibrary_0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary_0;
LABEL_5:
  uint64_t result = dlsym(v2, "MAImageCaptioningSetCaptionIntoMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaAccessibilityLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MediaAccessibilityLibraryCore_frameworkLibrary_0 = result;
  return result;
}

double akMedian(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 - 1;
  unint64_t v3 = (unint64_t)(a2 - 1) >> 1;
  if (a2 != 1)
  {
    unint64_t v4 = 0;
    while (1)
    {
      unint64_t v5 = v4 + 1;
      if (v2 == v4 + 1) {
        break;
      }
      unint64_t v6 = (v4 + v2) >> 1;
      double v7 = *(double *)(a1 + 8 * v6);
      double v8 = *(double *)(a1 + 8 * v2);
      if (v7 <= v8)
      {
        double v7 = *(double *)(a1 + 8 * v2);
      }
      else
      {
        *(double *)(a1 + 8 * v6) = v8;
        *(double *)(a1 + 8 * v2) = v7;
      }
      double v9 = *(double *)(a1 + 8 * v4);
      if (v9 > v7)
      {
        *(double *)(a1 + 8 * v4) = v7;
        *(double *)(a1 + 8 * v2) = v9;
        double v9 = *(double *)(a1 + 8 * v4);
      }
      double v10 = *(double *)(a1 + 8 * v6);
      if (v10 > v9)
      {
        *(double *)(a1 + 8 * v6) = v9;
        *(double *)(a1 + 8 * v4) = v10;
        double v10 = *(double *)(a1 + 8 * v6);
      }
      *(void *)(a1 + 8 * v6) = *(void *)(a1 + 8 * v5);
      *(double *)(a1 + 8 * v5) = v10;
      for (unint64_t i = v2; ; *(double *)(a1 + 8 * i) = v14)
      {
        double v12 = *(double *)(a1 + 8 * v4);
        do
        {
          uint64_t v13 = a1 + 8 * v5++;
          double v14 = *(double *)(v13 + 8);
        }
        while (v12 > v14);
        do
        {
          uint64_t v15 = a1 + 8 * i--;
          double v16 = *(double *)(v15 - 8);
        }
        while (v16 > v12);
        if (i < v5) {
          break;
        }
        *(double *)(a1 + 8 * v5) = v16;
      }
      *(double *)(a1 + 8 * v4) = v16;
      *(double *)(a1 + 8 * i) = v12;
      if (i <= v3) {
        unint64_t v4 = v5;
      }
      if (i >= v3) {
        unint64_t v2 = i - 1;
      }
      if (v2 <= v4) {
        return *(double *)(a1 + 8 * v3);
      }
    }
    double v17 = *(double *)(a1 + 8 * v4);
    double v18 = *(double *)(a1 + 8 * v2);
    if (v17 > v18)
    {
      *(double *)(a1 + 8 * v4) = v18;
      *(double *)(a1 + 8 * v2) = v17;
    }
  }
  return *(double *)(a1 + 8 * v3);
}

void generateRandomKey(void *__buf)
{
  do
  {
    arc4random_buf(__buf, 0x10uLL);
    if (*__buf) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = __buf[1] == 0;
    }
  }
  while (v2 || (*__buf & __buf[1]) == -1);
}

void sub_22D933D9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AKLog()
{
  return MEMORY[0x270F0C168]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D70](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D78](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D80](a1);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x270EE6298](data);
}

CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
{
  return (CGDataConsumerRef)MEMORY[0x270EE62A0](url);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x270EE62F0](url);
}

uint64_t CGDisplayListContextCreate()
{
  return MEMORY[0x270EE6340]();
}

uint64_t CGDisplayListCreate()
{
  return MEMORY[0x270EE6348]();
}

uint64_t CGDisplayListRelease()
{
  return MEMORY[0x270EE63D0]();
}

uint64_t CGDisplayListSetBoundingBox()
{
  return MEMORY[0x270EE63E0]();
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x270EE6408](font);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x270EF4F10](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F30](consumer, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x270EE6850]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x270EF4F68](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F80]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F88](metadata);
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x270EF4FA0](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x270EF4FA8](metadata, parent, path);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x270EF4FB0](metadata, parent, path, tag);
}

CFStringRef CGImageMetadataTagCopyName(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x270EF4FC8](tag);
}

CFStringRef CGImageMetadataTagCopyPrefix(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x270EF4FD0](tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x270EF4FD8](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x270EF4FE0](xmlns, prefix, name, *(void *)&type, value);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x270EF4FF0](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5038](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

uint64_t CGPDFAnnotationGetCGPDFDictionary()
{
  return MEMORY[0x270EE6990]();
}

uint64_t CGPDFAnnotationGetType()
{
  return MEMORY[0x270EE6998]();
}

uint64_t CGPDFAnnotationIsPristine()
{
  return MEMORY[0x270EE69A0]();
}

uint64_t CGPDFAnnotationIsVersioned()
{
  return MEMORY[0x270EE69A8]();
}

size_t CGPDFArrayGetCount(CGPDFArrayRef array)
{
  return MEMORY[0x270EE69D8](array);
}

BOOL CGPDFArrayGetDictionary(CGPDFArrayRef array, size_t index, CGPDFDictionaryRef *value)
{
  return MEMORY[0x270EE69E0](array, index, value);
}

BOOL CGPDFArrayGetName(CGPDFArrayRef array, size_t index, const char **value)
{
  return MEMORY[0x270EE69F0](array, index, value);
}

BOOL CGPDFArrayGetNumber(CGPDFArrayRef array, size_t index, CGPDFReal *value)
{
  return MEMORY[0x270EE6A00](array, index, value);
}

BOOL CGPDFArrayGetObject(CGPDFArrayRef array, size_t index, CGPDFObjectRef *value)
{
  return MEMORY[0x270EE6A08](array, index, value);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A80](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

void CGPDFDictionaryApplyFunction(CGPDFDictionaryRef dict, CGPDFDictionaryApplierFunction function, void *info)
{
}

BOOL CGPDFDictionaryGetArray(CGPDFDictionaryRef dict, const char *key, CGPDFArrayRef *value)
{
  return MEMORY[0x270EE6AE0](dict, key, value);
}

BOOL CGPDFDictionaryGetDictionary(CGPDFDictionaryRef dict, const char *key, CGPDFDictionaryRef *value)
{
  return MEMORY[0x270EE6AF0](dict, key, value);
}

BOOL CGPDFDictionaryGetInteger(CGPDFDictionaryRef dict, const char *key, CGPDFInteger *value)
{
  return MEMORY[0x270EE6AF8](dict, key, value);
}

BOOL CGPDFDictionaryGetName(CGPDFDictionaryRef dict, const char *key, const char **value)
{
  return MEMORY[0x270EE6B00](dict, key, value);
}

BOOL CGPDFDictionaryGetNumber(CGPDFDictionaryRef dict, const char *key, CGPDFReal *value)
{
  return MEMORY[0x270EE6B08](dict, key, value);
}

BOOL CGPDFDictionaryGetObject(CGPDFDictionaryRef dict, const char *key, CGPDFObjectRef *value)
{
  return MEMORY[0x270EE6B10](dict, key, value);
}

uint64_t CGPDFDictionaryGetRect()
{
  return MEMORY[0x270EE6B20]();
}

BOOL CGPDFDictionaryGetStream(CGPDFDictionaryRef dict, const char *key, CGPDFStreamRef *value)
{
  return MEMORY[0x270EE6B28](dict, key, value);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x270EE6B30](dict, key, value);
}

CGPDFDictionaryRef CGPDFDocumentGetCatalog(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x270EE6BC0](document);
}

uint64_t CGPDFDrawingContextCreateWithStream()
{
  return MEMORY[0x270EE6C78]();
}

uint64_t CGPDFDrawingContextDraw()
{
  return MEMORY[0x270EE6C80]();
}

uint64_t CGPDFDrawingContextRelease()
{
  return MEMORY[0x270EE6C90]();
}

uint64_t CGPDFFontCreateWithObject()
{
  return MEMORY[0x270EE6C98]();
}

uint64_t CGPDFFontDescriptorGetFlags()
{
  return MEMORY[0x270EE6CA0]();
}

uint64_t CGPDFFontGetFont()
{
  return MEMORY[0x270EE6CA8]();
}

uint64_t CGPDFFontGetFontDescriptor()
{
  return MEMORY[0x270EE6CB0]();
}

uint64_t CGPDFFontRelease()
{
  return MEMORY[0x270EE6CB8]();
}

uint64_t CGPDFFormCreate()
{
  return MEMORY[0x270EE6CC0]();
}

uint64_t CGPDFFormGetBBox()
{
  return MEMORY[0x270EE6CC8]();
}

uint64_t CGPDFFormGetMatrix()
{
  return MEMORY[0x270EE6CD0]();
}

uint64_t CGPDFFormGetResources()
{
  return MEMORY[0x270EE6CD8]();
}

uint64_t CGPDFFormGetStream()
{
  return MEMORY[0x270EE6CE0]();
}

uint64_t CGPDFFormRelease()
{
  return MEMORY[0x270EE6CE8]();
}

CGPDFObjectType CGPDFObjectGetType(CGPDFObjectRef object)
{
  return MEMORY[0x270EE6D08](object);
}

BOOL CGPDFObjectGetValue(CGPDFObjectRef object, CGPDFObjectType type, void *value)
{
  return MEMORY[0x270EE6D10](object, *(void *)&type, value);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGPDFDocumentRef CGPDFPageGetDocument(CGPDFPageRef page)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6D90](page);
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return (CGAffineTransform *)MEMORY[0x270EE6D98](retstr, page, *(void *)&box, *(void *)&rotate, preserveAspectRatio, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x270EE6DA8](page);
}

CFDataRef CGPDFStreamCopyData(CGPDFStreamRef stream, CGPDFDataFormat *format)
{
  return (CFDataRef)MEMORY[0x270EE6EB8](stream, format);
}

CGPDFDictionaryRef CGPDFStreamGetDictionary(CGPDFStreamRef stream)
{
  return (CGPDFDictionaryRef)MEMORY[0x270EE6EC0](stream);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x270EE6ED0](string);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F06218]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
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
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}