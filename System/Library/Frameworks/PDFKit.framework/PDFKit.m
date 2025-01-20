uint64_t SetAKEnabled(uint64_t result)
{
  AKAdaptorEnabled = result;
  return result;
}

void sub_2143692B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL IsObcCEquivalent(void *a1, const char *a2)
{
  return strcmp((const char *)[a1 objCType], a2) == 0;
}

void PDFAnnotationCGPathApplierFunc(void *a1, uint64_t a2)
{
  id v21 = a1;
  v3 = [v21 objectForKey:@"bounds"];
  [v3 PDFKitPDFRectValue];
  double v5 = v4;
  double v7 = v6;

  v8 = [v21 objectForKey:@"elementCount"];
  uint64_t v9 = [v8 integerValue];

  v10 = [v21 objectForKey:@"pathArray"];
  v11 = *(double **)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
    case 1:
      goto LABEL_4;
    case 2:
      v12 = v11 + 3;
      v11 += 2;
      goto LABEL_6;
    case 3:
      v12 = v11 + 5;
      v11 += 4;
      goto LABEL_6;
    case 4:
      if (v9 < 1) {
        goto LABEL_12;
      }
      v15 = [v21 objectForKey:@"firstPoint"];
      [v15 PDFKitPDFPointValue];
      double v14 = v16;
      double v13 = v17;
      goto LABEL_10;
    default:
      v11 = (double *)MEMORY[0x263F00148];
LABEL_4:
      v12 = v11 + 1;
LABEL_6:
      double v13 = *v12;
      double v14 = *v11;
      if (v9) {
        goto LABEL_11;
      }
      v15 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", v14, *v12);
      [v21 setObject:v15 forKey:@"firstPoint"];
LABEL_10:

LABEL_11:
      v18 = [NSNumber numberWithDouble:v5 + v14];
      [v10 addObject:v18];

      v19 = [NSNumber numberWithDouble:v7 + v13];
      [v10 addObject:v19];

      v20 = [NSNumber numberWithInteger:v9 + 1];
      [v21 setObject:v20 forKey:@"elementCount"];

LABEL_12:

      return;
  }
}

BOOL getStreams(const char *a1, uint64_t a2, uint64_t a3)
{
  if (!strcmp(a1, "Off"))
  {
    double v5 = *(CGPDFDictionary **)a3;
    double v7 = a1;
    double v6 = (CGPDFStreamRef *)(a3 + 16);
  }
  else
  {
    *(void *)(a3 + 24) = a1;
    double v5 = *(CGPDFDictionary **)a3;
    double v6 = (CGPDFStreamRef *)(a3 + 8);
    double v7 = a1;
  }

  return CGPDFDictionaryGetStream(v5, v7, v6);
}

void sub_21437F45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21437F664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCRNormalizedQuadClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!TextRecognitionLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __TextRecognitionLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264203C40;
    uint64_t v6 = 0;
    TextRecognitionLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!TextRecognitionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CRNormalizedQuad");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getCRNormalizedQuadClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCRNormalizedQuadClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TextRecognitionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TextRecognitionLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getVKCFormRegionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!VisionKitCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __VisionKitCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264203C78;
    uint64_t v6 = 0;
    VisionKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!VisionKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VKCFormRegion");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getVKCFormRegionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVKCFormRegionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21438310C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214386394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_214386618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  std::mutex::unlock(v20);

  _Unwind_Resume(a1);
}

void sub_214386ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  std::mutex::unlock(v28);

  _Unwind_Resume(a1);
}

void sub_214386E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  std::mutex::unlock(v13);

  _Unwind_Resume(a1);
}

void sub_214386FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 4_Block_object_dispose(&a9, 8) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_21438730C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2143874B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21438770C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va6, a4);
  va_start(va5, a4);
  va_start(va4, a4);
  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v8 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v10 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v12 = va_arg(va3, const void *);
  va_copy(va4, va3);
  double v14 = va_arg(va4, const void *);
  va_copy(va5, va4);
  double v16 = va_arg(va5, const void *);
  va_copy(va6, va5);
  v18 = va_arg(va6, const void *);
  applesauce::CF::ObjectRef<CGPDFDocument *>::~ObjectRef((const void **)va);
  applesauce::CF::ObjectRef<CGDataProvider *>::~ObjectRef((const void **)va1);
  applesauce::CF::ObjectRef<CGContext *>::~ObjectRef((const void **)va2);
  applesauce::CF::ObjectRef<CGDataConsumer *>::~ObjectRef((const void **)va3);
  applesauce::CF::ObjectRef<__CFData *>::~ObjectRef((const void **)va4);
  applesauce::CF::ObjectRef<CGContext *>::~ObjectRef((const void **)va5);
  applesauce::CF::ObjectRef<CGDisplayList *>::~ObjectRef((const void **)va6);

  _Unwind_Resume(a1);
}

const void **applesauce::CF::ObjectRef<CGPDFDocument *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **applesauce::CF::ObjectRef<CGDataProvider *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **applesauce::CF::ObjectRef<CGContext *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **applesauce::CF::ObjectRef<CGDataConsumer *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **applesauce::CF::ObjectRef<__CFData *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **applesauce::CF::ObjectRef<CGDisplayList *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_214387DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_214388610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,CFTypeRef cf,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

id quadTransformedWithAffineTransform(void *a1, double *a2)
{
  id v3 = a1;
  [v3 topLeft];
  double v5 = v4;
  double v7 = v6;
  double v9 = *a2;
  double v8 = a2[1];
  double v10 = a2[3];
  double v51 = a2[2];
  double v11 = a2[5];
  double v50 = a2[4];
  [v3 bottomLeft];
  double v13 = v12;
  double v15 = v14;
  double v46 = v11;
  double v47 = v10;
  double v48 = v9;
  double v49 = v8;
  double v44 = *a2;
  double v45 = a2[1];
  double v40 = a2[4];
  double v41 = a2[2];
  double v42 = a2[5];
  double v43 = a2[3];
  [v3 topRight];
  double v17 = v16;
  double v19 = v18;
  double v38 = *a2;
  double v39 = a2[1];
  double v34 = a2[4];
  double v35 = a2[2];
  double v36 = a2[5];
  double v37 = a2[3];
  [v3 bottomRight];
  double v21 = v20;
  double v23 = v22;
  double v32 = *a2;
  double v33 = a2[1];
  double v28 = a2[4];
  double v29 = a2[2];
  double v30 = a2[5];
  double v31 = a2[3];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2050000000;
  v24 = (void *)getVKQuadClass(void)::softClass;
  uint64_t v56 = getVKQuadClass(void)::softClass;
  if (!getVKQuadClass(void)::softClass)
  {
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = ___ZL14getVKQuadClassv_block_invoke;
    v52[3] = &unk_264203E48;
    v52[4] = &v53;
    ___ZL14getVKQuadClassv_block_invoke((uint64_t)v52);
    v24 = (void *)v54[3];
  }
  v25 = v24;
  _Block_object_dispose(&v53, 8);
  v26 = objc_msgSend([v25 alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v50 + v7 * v51 + v48 * v5, v46 + v7 * v47 + v49 * v5, v34 + v19 * v35 + v38 * v17, v36 + v19 * v37 + v39 * v17, v40 + v15 * v41 + v44 * v13, v42 + v15 * v43 + v45 * v13, v28 + v23 * v29 + v32 * v21, v30 + v23 * v31 + v33 * v21);

  return v26;
}

void sub_214388A90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 128), 8);

  _Unwind_Resume(a1);
}

const void **applesauce::CF::ObjectRef<__CTFont const*>::~ObjectRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **applesauce::CF::ObjectRef<CGPath *>::~ObjectRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_214388C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214388FB4(_Unwind_Exception *a1)
{
  CGBuf::~CGBuf((CGBuf *)(v1 + 392));

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c10_ZTS5CGBuf(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_ea8_32c10_ZTS5CGBuf(uint64_t a1)
{
}

void divideQuadSideIntoSegments(void *a1, uint64_t a2, double *a3)
{
  id v5 = a1;
  if (a2 == 1)
  {
    id v17 = v5;
    [v5 topRight];
    double v18 = v12;
    double v19 = v11;
    [v17 bottomRight];
  }
  else
  {
    double v19 = v8;
    double v18 = v8;
    if (a2) {
      goto LABEL_6;
    }
    id v17 = v5;
    [v5 topLeft];
    double v18 = v10;
    double v19 = v9;
    [v17 bottomLeft];
  }
  id v5 = v17;
LABEL_6:
  float64x2_t v13 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v18, 0);
  float64x2_t v14 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v19, 0);
  v22.val[0] = vmlaq_n_f64(v14, (float64x2_t)xmmword_214422D30, v6 - v19);
  v22.val[1] = vmlaq_n_f64(v13, (float64x2_t)xmmword_214422D30, v7 - v18);
  double v15 = a3 + 2;
  vst2q_f64(v15, v22);
  *a3 = v19;
  a3[1] = v18;
  v21.val[0] = vmlaq_n_f64(v14, (float64x2_t)xmmword_214422D40, v6 - v19);
  v21.val[1] = vmlaq_n_f64(v13, (float64x2_t)xmmword_214422D40, v7 - v18);
  double v16 = a3 + 6;
  vst2q_f64(v16, v21);
  a3[10] = v6;
  a3[11] = v7;
}

void sub_214389154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2143893C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20)
{
  std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy((uint64_t)&a19, a20);
  _Unwind_Resume(a1);
}

void sub_214389A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_214389E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214389EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21438A1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void ___ZL23getVKImageAnalyzerClassv_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VKImageAnalyzer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVKImageAnalyzerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    ___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1();
    VisionKitCoreLibrary();
  }
}

void VisionKitCoreLibrary(void)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!VisionKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = ___ZL24VisionKitCoreLibraryCorePPc_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264203E68;
    uint64_t v3 = 0;
    VisionKitCoreLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!VisionKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t ___ZL24VisionKitCoreLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionKitCoreLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL30getVKImageAnalyzerRequestClassv_block_invoke(uint64_t a1)
{
  VisionKitCoreLibrary();
  Class result = objc_getClass("VKImageAnalyzerRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVKImageAnalyzerRequestClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (CGBuf *)___ZL30getVKImageAnalyzerRequestClassv_block_invoke_cold_1();
    return CGBuf::CGBuf(v3, v4);
  }
  return result;
}

void CGBuf::CGBuf(CGBuf *this, const CGBuf *a2)
{
  CGImageRef v4 = *(CGImageRef *)a2;
  *(void *)this = *(void *)a2;
  if (v4)
  {
    if ((uint64_t)atomic_load_explicit((atomic_ullong *volatile)v4, memory_order_acquire) <= 0) {
      CGBuf::CGBuf();
    }
    atomic_fetch_add((atomic_ullong *volatile)v4, 1uLL);
  }
  *((void *)this + 1) = CGImageRetain(*((CGImageRef *)a2 + 1));
  *((void *)this + 2) = CGContextRetain(*((CGContextRef *)a2 + 2));
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  id v5 = (CGColorSpace *)*((void *)a2 + 6);
  *((void *)this + 5) = *((void *)a2 + 5);
  CGColorSpaceRef v6 = CGColorSpaceRetain(v5);
  uint64_t v7 = *((void *)a2 + 7);
  *((void *)this + 6) = v6;
  *((void *)this + 7) = v7;
  if (v7)
  {
    *((void *)this + 7) = (char *)this + 64;
    uint64_t v8 = *((unsigned __int8 *)a2 + 326);
    if ((*((_DWORD *)a2 + 80) & 0x1Fu) - 1 < 4) {
      ++v8;
    }
    memcpy((char *)this + 64, *((const void **)a2 + 7), 16 * v8);
  }
  *((_DWORD *)this + 80) = *((_DWORD *)a2 + 80);
  *((_DWORD *)this + 81) = *((_DWORD *)a2 + 81);
}

void CGBuf::~CGBuf(CGBuf *this)
{
  long long v2 = (CGColorSpace *)*((void *)this + 6);
  if (v2) {
    CGColorSpaceRelease(v2);
  }
  *((void *)this + 6) = 0;
  uint64_t v3 = *(atomic_ullong **)this;
  if (*(void *)this)
  {
    uint64_t add = atomic_fetch_add(v3, 0xFFFFFFFFFFFFFFFFLL);
    if (add <= 0)
    {
      _CGHandleAssert();
    }
    else if (add == 1)
    {
      CGBufferStorage::~CGBufferStorage(v3);
    }
  }
  *(void *)this = 0;
  id v5 = (CGImage *)*((void *)this + 1);
  if (v5) {
    CGImageRelease(v5);
  }
  *((void *)this + 1) = 0;
  CGColorSpaceRef v6 = (CGContext *)*((void *)this + 2);
  if (v6) {
    CGContextRelease(v6);
  }
  *((void *)this + 2) = 0;
}

void __clang_call_terminate(void *a1)
{
}

void CGBufferStorage::~CGBufferStorage(atomic_ullong *this)
{
  if (atomic_load_explicit(this, memory_order_acquire)) {
    _CGHandleAssert();
  }
  long long v2 = (void (*)(atomic_ullong, atomic_ullong))this[9];
  if (v2) {
    v2(this[10], this[2]);
  }
  uint64_t v3 = (void (*)(atomic_ullong *, atomic_ullong))this[8];
  if (v3) {
    v3(this, this[6]);
  }
}

Class ___ZL14getVKQuadClassv_block_invoke(uint64_t a1)
{
  VisionKitCoreLibrary();
  Class result = objc_getClass("VKQuad");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    ___ZL14getVKQuadClassv_block_invoke_cold_1();
  }
  getVKQuadClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>,0>(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t *std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__emplace_unique_key_args<double,double &,applesauce::CF::ObjectRef<__CTFont const*>&>(uint64_t **a1, double *a2, void *a3, CFTypeRef *a4)
{
  uint64_t v8 = a1 + 1;
  uint64_t v7 = a1[1];
  double v9 = a1 + 1;
  double v10 = a1 + 1;
  if (v7)
  {
    double v11 = *a2;
    while (1)
    {
      while (1)
      {
        double v10 = (uint64_t **)v7;
        double v12 = *((double *)v7 + 4);
        if (v11 >= v12) {
          break;
        }
        uint64_t v7 = (uint64_t *)*v7;
        double v9 = v10;
        if (!*v10) {
          goto LABEL_9;
        }
      }
      if (v12 >= v11) {
        break;
      }
      uint64_t v7 = (uint64_t *)v7[1];
      if (!v7)
      {
        double v9 = v10 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    float64x2_t v13 = (uint64_t *)operator new(0x30uLL);
    v15[1] = v8;
    std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>::pair[abi:ne180100]<double &,applesauce::CF::ObjectRef<__CTFont const*>&,0>(v13 + 4, a3, a4);
    char v16 = 1;
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__insert_node_at(a1, (uint64_t)v10, v9, v13);
    v15[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,void *>>>>::reset[abi:ne180100]((uint64_t)v15, 0);
    return v13;
  }
  return (uint64_t *)v10;
}

uint64_t *std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  id v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  Class result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void *std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>::pair[abi:ne180100]<double &,applesauce::CF::ObjectRef<__CTFont const*>&,0>(void *a1, void *a2, CFTypeRef *a3)
{
  *a1 = *a2;
  CFTypeRef v4 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  a1[1] = v4;
  return a1;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      long long v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      CFTypeRef v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), id v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            double v9 = (uint64_t **)a2[2];
          }
          else
          {
            double v9 = (uint64_t **)v2[1];
            double v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *double v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            long long v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), id v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        long long v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *id v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  long long v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy(a1, a2[1]);

    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::__emplace_unique_key_args<double,std::piecewise_construct_t const&,std::tuple<double const&>,std::tuple<>>(uint64_t **a1, double *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  if (v6)
  {
    double v8 = *a2;
    while (1)
    {
      while (1)
      {
        double v9 = (uint64_t **)v6;
        double v10 = *((double *)v6 + 4);
        if (v8 >= v10) {
          break;
        }
        int v6 = (uint64_t *)*v6;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      int v6 = (uint64_t *)v6[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    double v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

void sub_21438B290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21438B398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21438B60C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21438B6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21438B790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21438B808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PDFPageEvaluator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21438B90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::unique_ptr<CGPDFScanner,std::function<void ()(CGPDFScanner*)>>::reset[abi:ne180100]((uint64_t *)va, 0);
  std::__function::__value_func<void ()(CGPDFScanner *)>::~__value_func[abi:ne180100](v5);
  _Unwind_Resume(a1);
}

void sub_21438BBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21438BF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t op_q(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_q:", a1);
}

uint64_t op_Q(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_Q:", a1);
}

uint64_t op_cm(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_cm:", a1);
}

uint64_t op_singlequote(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_singlequote:", a1);
}

uint64_t op_doublequote(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_doublequote:", a1);
}

uint64_t op_TJ(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_TJ:", a1);
}

uint64_t op_Tj(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_Tj:", a1);
}

uint64_t op_Do(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_Do:", a1);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *std::__function::__value_func<void ()(CGPDFScanner *)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::__function::__value_func<void ()(CGPDFScanner *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  void *v3 = 0;
  return a1;
}

uint64_t *std::unique_ptr<CGPDFScanner,std::function<void ()(CGPDFScanner*)>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v3 = *result;
  *Class result = a2;
  if (v3) {
    return (uint64_t *)std::function<void ()(CGPDFScanner *)>::operator()((uint64_t)(result + 1), v3);
  }
  return result;
}

uint64_t std::function<void ()(CGPDFScanner *)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x2166A0BC0);
}

void sub_21438D868(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_21438DC48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_21438E138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21438E6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21438EC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_21438F30C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21438F9E8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_21438FCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21438FF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214390A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
}

void sub_214390C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2143910C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_21439188C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_2143928F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_214392C24()
{
}

void sub_2143952AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
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

void __getIOSurfaceContextOptions_block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F00320];
  v3[0] = &unk_26C52E358;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  uint64_t v1 = (void *)getIOSurfaceContextOptions_options;
  getIOSurfaceContextOptions_options = v0;
}

void sub_21439D1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PDFPageLayerTileRectFromPoints(__n128 a1, __n128 a2, double a3, double a4)
{
  float v4 = a3 - a1.n128_f64[0];
  if (v4 >= 0.0)
  {
    float v5 = a4 - a2.n128_f64[0];
    if (v5 >= 0.0) {
      return PDFRectMake(a1, a2, v4, v5);
    }
  }
  return result;
}

void sub_2143A5178(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2143A9A30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143A9B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2143AB720(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143AB840(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143AD380(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143AE97C(_Unwind_Exception *a1)
{
}

Class __getAFInsertionManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AutoFillCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    void v3[2] = (void *)3221225472;
    v3[3] = __AutoFillCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264204530;
    uint64_t v5 = 0;
    AutoFillCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AutoFillCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getAFInsertionManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AFInsertionManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAFInsertionManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AutoFillCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AutoFillCoreLibraryCore_frameworkLibrary = result;
  return result;
}

id _dictionaryForPDFDictionary(CGPDFDictionary *a1, void *a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v4 = objc_opt_new();
  v7[0] = @"resultDict";
  v7[1] = @"visitedSet";
  v8[0] = v4;
  v8[1] = v3;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  CGPDFDictionaryApplyFunction(a1, (CGPDFDictionaryApplierFunction)_iterateDictionaryValueCallback, v5);

  return v4;
}

void _iterateDictionaryValueCallback(uint64_t a1, CGPDFObject *a2, void *a3)
{
  id v5 = a3;
  id v10 = [v5 objectForKeyedSubscript:@"resultDict"];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"visitedSet"];

  uint64_t v7 = [NSString stringWithCString:a1 encoding:4];
  double v8 = _objectForCGPDFObjectRefAndVisitedSet(a2, v6);
  if (v8)
  {
    [v10 setObject:v8 forKeyedSubscript:v7];
  }
  else
  {
    double v9 = [MEMORY[0x263EFF9D0] null];
    [v10 setObject:v9 forKeyedSubscript:v7];
  }
}

id _objectForCGPDFObjectRefAndVisitedSet(CGPDFObject *a1, void *a2)
{
  id v3 = a2;
  long long v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    uint64_t v6 = [v3 objectForKey:a1];

    if (v6)
    {
LABEL_4:
      id v5 = 0;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263EFF9D0] null];
      [v4 setObject:v7 forKey:a1];

      switch(CGPDFObjectGetType(a1))
      {
        case kCGPDFObjectTypeBoolean:
          LOBYTE(value) = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeBoolean, &value);
          uint64_t v8 = [NSNumber numberWithUnsignedChar:value];
          goto LABEL_19;
        case kCGPDFObjectTypeInteger:
          CGPDFObjectRef value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeInteger, &value);
          uint64_t v8 = [NSNumber numberWithLong:value];
          goto LABEL_19;
        case kCGPDFObjectTypeReal:
          CGPDFObjectRef value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeReal, &value);
          uint64_t v8 = [NSNumber numberWithDouble:*(double *)&value];
          goto LABEL_19;
        case kCGPDFObjectTypeName:
          CGPDFObjectRef value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeName, &value);
          uint64_t v8 = [NSString stringWithCString:value encoding:4];
          goto LABEL_19;
        case kCGPDFObjectTypeString:
          CGPDFObjectRef value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeString, &value);
          uint64_t v8 = (uint64_t)CGPDFStringCopyTextString(value);
          goto LABEL_19;
        case kCGPDFObjectTypeArray:
          char v16 = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeArray, &v16);
          double v9 = v16;
          id v10 = v4;
          size_t Count = CGPDFArrayGetCount(v9);
          id v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:Count];
          if (Count)
          {
            for (size_t i = 0; i != Count; ++i)
            {
              CGPDFObjectRef value = 0;
              CGPDFArrayGetObject(v9, i, &value);
              uint64_t v13 = _objectForCGPDFObjectRefAndVisitedSet(value, v10);
              if (v13)
              {
                [v5 setObject:v13 atIndexedSubscript:i];
              }
              else
              {
                float64x2_t v14 = [MEMORY[0x263EFF9D0] null];
                [v5 setObject:v14 atIndexedSubscript:i];
              }
            }
          }

          break;
        case kCGPDFObjectTypeDictionary:
          CGPDFObjectRef value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeDictionary, &value);
          uint64_t v8 = _dictionaryForPDFDictionary(value, v4);
LABEL_19:
          id v5 = (void *)v8;
          break;
        default:
          goto LABEL_4;
      }
    }
  }

  return v5;
}

void sub_2143B42FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143B4394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2143B4550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2143B46A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143B48C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143B49DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143B4B38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143B52F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143B5434(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143B58DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_2143B5AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2143B6458(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void highlightPath(CGContext *a1, float64x2_t *a2, float64x2_t *a3, float64x2_t *a4, float64x2_t *a5)
{
  float64x2_t v5 = vsubq_f64(*a4, *a2);
  float64x2_t v6 = (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL);
  *a2 = vmlaq_f64(*a2, v6, v5);
  *a4 = vmlsq_f64(*a4, v6, v5);
  *a3 = vmlaq_f64(*a3, v6, v5);
  float64x2_t v7 = vmlsq_f64(*a5, v6, v5);
  *a5 = v7;
  double v9 = a2->f64[0];
  double v8 = a2->f64[1];
  double v10 = a3->f64[1];
  double v11 = a3->f64[0] - a2->f64[0];
  double v12 = v10 - v8;
  double v13 = sqrt(v12 * v12 + v11 * v11);
  if (v13 != 0.0)
  {
    double v19 = a4->f64[1];
    double v20 = sqrt((v8 - v19) * (v8 - v19) + (v9 - a4->f64[0]) * (v9 - a4->f64[0])) / (v13 * 4.0);
    CGFloat v21 = (v9 + a4->f64[0]) * 0.5;
    CGFloat v22 = (v8 + v19) * 0.5;
    double v34 = v21;
    double v35 = v22;
    CGFloat v23 = (v7.f64[0] + a3->f64[0]) * 0.5;
    CGFloat v24 = (v7.f64[1] + v10) * 0.5;
    CGContextMoveToPoint(a1, v21, v22);
    CGContextAddCurveToPoint(a1, (v21 + a2->f64[0]) * 0.5, (v22 + a2->f64[1]) * 0.5, (a2->f64[0] + a2->f64[0] + v20 * v11) * 0.5, (a2->f64[1] + a2->f64[1] + v20 * v12) * 0.5, a2->f64[0] + v20 * v11, a2->f64[1] + v20 * v12);
    CGFloat v25 = a3->f64[0] - v20 * v11;
    CGFloat v26 = a3->f64[1] - v20 * v12;
    CGContextAddLineToPoint(a1, v25, v26);
    CGContextAddCurveToPoint(a1, (v25 + a3->f64[0]) * 0.5, (v26 + a3->f64[1]) * 0.5, (v23 + a3->f64[0]) * 0.5, (v24 + a3->f64[1]) * 0.5, v23, v24);
    CGContextAddCurveToPoint(a1, (v23 + a5->f64[0]) * 0.5, (v24 + a5->f64[1]) * 0.5, (a5->f64[0] + a5->f64[0] - v20 * v11) * 0.5, (a5->f64[1] + a5->f64[1] - v20 * v12) * 0.5, a5->f64[0] - v20 * v11, a5->f64[1] - v20 * v12);
    CGFloat v27 = a4->f64[0] + v20 * v11;
    CGFloat v28 = a4->f64[1] + v20 * v12;
    CGContextAddLineToPoint(a1, v27, v28);
    double v29 = a4->f64[1];
    double v30 = (v27 + a4->f64[0]) * 0.5;
    double v31 = (v28 + v29) * 0.5;
    double v32 = (v34 + a4->f64[0]) * 0.5;
    double v33 = (v35 + v29) * 0.5;
    CGContextAddCurveToPoint(a1, v30, v31, v32, v33, v34, v35);
  }
}

void strikeOutPath(CGContext *a1, double *a2, double *a3, double *a4, double *a5)
{
  double v6 = a2[1];
  double v7 = a4[1];
  double v8 = sqrt((v6 - v7) * (v6 - v7) + (*a2 - *a4) * (*a2 - *a4));
  CGFloat v9 = (*a3 + *a5) * 0.5;
  CGFloat v10 = (a3[1] + a5[1]) * 0.5;
  CGContextMoveToPoint(a1, (*a2 + *a4) * 0.5, (v6 + v7) * 0.5);
  CGContextAddLineToPoint(a1, v9, v10);
  double v11 = v8 * 0.08;
  if (v8 * 0.08 < 1.0) {
    double v11 = 1.0;
  }

  CGContextSetLineWidth(a1, v11);
}

void underlinePath(CGContext *a1, double *a2, CGFloat *a3, CGFloat *a4)
{
  double v7 = sqrt((a2[1] - a3[1]) * (a2[1] - a3[1]) + (*a2 - *a3) * (*a2 - *a3)) * 0.08;
  if (v7 >= 1.0) {
    double v8 = v7;
  }
  else {
    double v8 = 1.0;
  }
  CGContextSetLineWidth(a1, v8);
  CGContextMoveToPoint(a1, *a3, a3[1] + v8);
  CGFloat v9 = *a4;
  double v10 = a4[1] + v8;

  CGContextAddLineToPoint(a1, v9, v10);
}

void redactPath(CGContext *a1, CGFloat *a2, double *a3, double *a4, double *a5, double a6)
{
  CGContextSaveGState(a1);
  double v12 = *a4;
  double v13 = a4[1];
  double v14 = *a5;
  double v15 = a5[1];
  if (v13 >= v15) {
    double v16 = a5[1];
  }
  else {
    double v16 = a4[1];
  }
  if (v13 >= v15) {
    double v17 = a4[1];
  }
  else {
    double v17 = a5[1];
  }
  if (v12 >= v14) {
    double v18 = *a5;
  }
  else {
    double v18 = *a4;
  }
  if (v12 >= v14) {
    double v19 = *a4;
  }
  else {
    double v19 = *a5;
  }
  double v20 = a3[1];
  if (*a3 < v18) {
    double v18 = *a3;
  }
  double v21 = a2[1];
  if (*a2 >= v18) {
    double v22 = v18;
  }
  else {
    double v22 = *a2;
  }
  if (v20 >= v16) {
    double v23 = v16;
  }
  else {
    double v23 = a3[1];
  }
  if (v21 < v23) {
    double v23 = a2[1];
  }
  if (*a3 >= v19) {
    double v19 = *a3;
  }
  if (*a2 >= v19) {
    double v19 = *a2;
  }
  if (v20 >= v17) {
    double v24 = a3[1];
  }
  else {
    double v24 = v17;
  }
  if (v21 >= v24) {
    double v24 = a2[1];
  }
  double v25 = sqrt((v15 - v13) * (v15 - v13) + (v14 - v12) * (v14 - v12));
  if (v25 != 0.0)
  {
    double v80 = *a2;
    double v69 = a6;
    double v26 = (v22 + v19) * 0.5;
    double v27 = (v23 + v24) * 0.5;
    double v28 = asin((v17 - v16) / v25);
    if (v13 > v21)
    {
      double v28 = PDFDegToRad(180.0) - v28;
      double v15 = a5[1];
      double v13 = a4[1];
      double v80 = *a2;
    }
    if (v15 <= v13) {
      double v29 = v28;
    }
    else {
      double v29 = -v28;
    }
    long long v30 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v78 = *MEMORY[0x263F000D0];
    *(_OWORD *)&v87.CGFloat a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v87.double c = v30;
    long long v74 = v30;
    long long v71 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&v87.double tx = v71;
    CGAffineTransformTranslate(&v88, &v87, v26, v27);
    double v31 = v27;
    CGFloat v32 = v29;
    CGFloat v67 = v29;
    CGAffineTransform v87 = v88;
    CGAffineTransformRotate(&v88, &v87, -v29);
    CGFloat a = v88.a;
    double b = v88.b;
    CGFloat v33 = v88.b;
    CGFloat d = v88.d;
    double c = v88.c;
    CGFloat v35 = v88.c;
    double v37 = v26;
    CGFloat v38 = v88.tx;
    CGFloat ty = v88.ty;
    memset(&v88, 0, sizeof(v88));
    v87.CGFloat a = a;
    v87.double b = v33;
    CGFloat v40 = a;
    double v70 = a;
    v87.double c = v35;
    v87.CGFloat d = d;
    v87.double tx = v38;
    v87.CGFloat ty = ty;
    CGAffineTransformTranslate(&v88, &v87, -0.8, 0.8);
    CGAffineTransform v86 = v88;
    CGAffineTransformRotate(&v87, &v86, v32);
    CGAffineTransform v88 = v87;
    double v41 = -v37;
    double v76 = v38;
    double v42 = -v31;
    CGAffineTransform v86 = v87;
    CGAffineTransformTranslate(&v87, &v86, -v37, v42);
    CGAffineTransform v88 = v87;
    *(float64x2_t *)a2 = vaddq_f64(*(float64x2_t *)&v87.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v87.c, a2[1]), *(float64x2_t *)&v87.a, v80));
    memset(&v87, 0, sizeof(v87));
    v86.CGFloat a = v40;
    v86.double b = b;
    v86.double c = c;
    v86.CGFloat d = d;
    v86.double tx = v38;
    v86.CGFloat ty = ty;
    CGAffineTransformTranslate(&v87, &v86, 0.8, 0.8);
    CGAffineTransform v85 = v87;
    CGAffineTransformRotate(&v86, &v85, v67);
    CGAffineTransform v87 = v86;
    CGAffineTransform v85 = v86;
    CGAffineTransformTranslate(&v86, &v85, -v37, v42);
    CGAffineTransform v87 = v86;
    *(float64x2_t *)a3 = vaddq_f64(*(float64x2_t *)&v86.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v86.c, a3[1]), *(float64x2_t *)&v86.a, *a3));
    memset(&v86, 0, sizeof(v86));
    v85.CGFloat a = v70;
    v85.double b = b;
    v85.double c = c;
    v85.CGFloat d = d;
    v85.double tx = v38;
    v85.CGFloat ty = ty;
    CGAffineTransformTranslate(&v86, &v85, -0.8, -0.8);
    CGAffineTransform v84 = v86;
    CGAffineTransformRotate(&v85, &v84, v67);
    CGAffineTransform v86 = v85;
    CGAffineTransform v84 = v85;
    CGAffineTransformTranslate(&v85, &v84, -v37, v42);
    CGAffineTransform v86 = v85;
    *(float64x2_t *)a4 = vaddq_f64(*(float64x2_t *)&v85.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v85.c, a4[1]), *(float64x2_t *)&v85.a, *a4));
    memset(&v85, 0, sizeof(v85));
    v84.CGFloat a = v70;
    v84.double b = b;
    v84.double c = c;
    v84.CGFloat d = d;
    double v65 = d;
    double v66 = ty;
    v84.double tx = v38;
    v84.CGFloat ty = ty;
    CGAffineTransformTranslate(&v85, &v84, 0.8, -0.8);
    CGAffineTransform v83 = v85;
    CGAffineTransformRotate(&v84, &v83, v67);
    CGAffineTransform v85 = v84;
    CGAffineTransform v83 = v84;
    CGAffineTransformTranslate(&v84, &v83, -v37, v42);
    CGAffineTransform v85 = v84;
    *(float64x2_t *)a5 = vaddq_f64(*(float64x2_t *)&v84.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v84.c, a5[1]), *(float64x2_t *)&v84.a, *a5));
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, *a2, a2[1]);
    CGPathAddLineToPoint(Mutable, 0, *a3, a3[1]);
    CGPathAddLineToPoint(Mutable, 0, *a5, a5[1]);
    CGPathAddLineToPoint(Mutable, 0, *a4, a4[1]);
    CGPathAddLineToPoint(Mutable, 0, *a2, a2[1]);
    CGPathCloseSubpath(Mutable);
    int v44 = GetDefaultsWriteHighlightRedactions();
    CGContextAddPath(a1, Mutable);
    double v45 = [MEMORY[0x263F825C8] blackColor];
    double v46 = v45;
    if (v44)
    {
      id v47 = v45;
      CGContextSetStrokeColorWithColor(a1, (CGColorRef)[v47 CGColor]);

      CGContextStrokePath(a1);
      CGPathRelease(Mutable);
    }
    else
    {
      id v48 = [v45 colorWithAlphaComponent:v69];
      CGContextSetFillColorWithColor(a1, (CGColorRef)[v48 CGColor]);

      CGContextFillPath(a1);
      CGContextAddPath(a1, Mutable);
      CGContextClip(a1);
      CGPathRelease(Mutable);
      *(_OWORD *)&v83.CGFloat a = v78;
      *(_OWORD *)&v83.double c = v74;
      *(_OWORD *)&v83.double tx = v71;
      CGAffineTransformRotate(&v84, &v83, v67);
      CGAffineTransform v86 = v84;
      CGAffineTransform v83 = v84;
      CGAffineTransformTranslate(&v84, &v83, v41, v42);
      CGAffineTransform v86 = v84;
      double v63 = v84.d;
      double v64 = v84.b;
      double v62 = v84.ty;
      double tx = a4[1];
      double v81 = *a4;
      double v49 = v84.tx + tx * v84.c + v84.a * *a4;
      *(_OWORD *)&v83.CGFloat a = v78;
      *(_OWORD *)&v83.double c = v74;
      *(_OWORD *)&v83.double tx = v71;
      CGAffineTransformRotate(&v84, &v83, v67);
      CGAffineTransform v85 = v84;
      CGAffineTransform v83 = v84;
      CGAffineTransformTranslate(&v84, &v83, v41, v42);
      CGAffineTransform v85 = v84;
      double v51 = *a5;
      double v50 = a5[1];
      double v60 = v84.d;
      double v61 = v84.b;
      double v59 = v84.ty;
      double v52 = v84.tx + v50 * v84.c + v84.a * *a5;
      *(_OWORD *)&v83.CGFloat a = v78;
      *(_OWORD *)&v83.double c = v74;
      *(_OWORD *)&v83.double tx = v71;
      CGAffineTransformRotate(&v84, &v83, v67);
      CGAffineTransform v87 = v84;
      CGAffineTransform v83 = v84;
      CGAffineTransformTranslate(&v84, &v83, v41, v42);
      CGAffineTransform v87 = v84;
      if (v49 < v52)
      {
        double v53 = v62 + tx * v63 + v64 * v81;
        double v82 = c * v53;
        double v79 = v65 * v53;
        double v75 = v87.ty + a3[1] * v87.d + v87.b * *a3 - (v59 + v50 * v60 + v61 * v51);
        double v54 = v53 + v75;
        double v73 = c * v54;
        double v55 = v65 * v54;
        do
        {
          CGContextMoveToPoint(a1, v76 + v82 + v70 * v49, v66 + v79 + b * v49);
          double v56 = v75 + v49;
          CGContextAddLineToPoint(a1, v76 + v73 + v70 * v56, v66 + v55 + b * v56);
          CGContextMoveToPoint(a1, v76 + v73 + v70 * v49, v66 + v55 + b * v49);
          CGContextAddLineToPoint(a1, v76 + v82 + v70 * v56, v66 + v79 + b * v56);
          double v49 = v75 + v49;
        }
        while (v56 < v52);
      }
      v57 = objc_msgSend(MEMORY[0x263F825C8], "darkGrayColor", *(void *)&v59, *(void *)&v60, *(void *)&v61);
      id v58 = [v57 colorWithAlphaComponent:v69];
      CGContextSetStrokeColorWithColor(a1, (CGColorRef)[v58 CGColor]);

      CGContextSetLineWidth(a1, 1.0);
      CGContextStrokePath(a1);
      CGContextRestoreGState(a1);
    }
  }
}

id PDFMarkupMenuColorForMenuIcon(uint64_t a1)
{
  if (PDFMarkupMenuColorForMenuIcon_onceToken != -1) {
    dispatch_once(&PDFMarkupMenuColorForMenuIcon_onceToken, &__block_literal_global_8);
  }
  uint64_t v2 = (void *)PDFMarkupMenuColorForMenuIcon_colors;
  id v3 = [NSNumber numberWithUnsignedInt:a1];
  long long v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void __PDFMarkupMenuColorForMenuIcon_block_invoke()
{
  v15[7] = *MEMORY[0x263EF8340];
  v14[0] = &unk_26C52E370;
  double v13 = +[PDFAnnotation PDFMarkupColors];
  double v12 = [v13 objectAtIndex:0];
  v15[0] = v12;
  v14[1] = &unk_26C52E388;
  uint64_t v0 = +[PDFAnnotation PDFMarkupColors];
  uint64_t v1 = [v0 objectAtIndex:1];
  v15[1] = v1;
  v14[2] = &unk_26C52E3A0;
  uint64_t v2 = +[PDFAnnotation PDFMarkupColors];
  id v3 = [v2 objectAtIndex:2];
  void v15[2] = v3;
  v14[3] = &unk_26C52E3B8;
  long long v4 = +[PDFAnnotation PDFMarkupColors];
  float64x2_t v5 = [v4 objectAtIndex:3];
  v15[3] = v5;
  v14[4] = &unk_26C52E3D0;
  double v6 = +[PDFAnnotation PDFMarkupColors];
  double v7 = [v6 objectAtIndex:4];
  v15[4] = v7;
  v14[5] = &unk_26C52E3E8;
  double v8 = [MEMORY[0x263F825C8] whiteColor];
  v15[5] = v8;
  v14[6] = &unk_26C52E400;
  CGFloat v9 = [MEMORY[0x263F825C8] whiteColor];
  v15[6] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:7];
  double v11 = (void *)PDFMarkupMenuColorForMenuIcon_colors;
  PDFMarkupMenuColorForMenuIcon_colors = v10;
}

id PDFMarkupMenuString(uint64_t a1)
{
  if (PDFMarkupMenuString_onceToken != -1) {
    dispatch_once(&PDFMarkupMenuString_onceToken, &__block_literal_global_22);
  }
  uint64_t v2 = (void *)PDFMarkupMenuString_menuIconStrings;
  id v3 = [NSNumber numberWithUnsignedInt:a1];
  long long v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void __PDFMarkupMenuString_block_invoke()
{
  v10[7] = *MEMORY[0x263EF8340];
  v9[0] = &unk_26C52E370;
  uint64_t v0 = PDFKitLocalizedString(@"Yellow");
  v10[0] = v0;
  v9[1] = &unk_26C52E388;
  uint64_t v1 = PDFKitLocalizedString(@"Green");
  v10[1] = v1;
  v9[2] = &unk_26C52E3A0;
  uint64_t v2 = PDFKitLocalizedString(@"Blue");
  v10[2] = v2;
  v9[3] = &unk_26C52E3B8;
  id v3 = PDFKitLocalizedString(@"Pink");
  v10[3] = v3;
  v9[4] = &unk_26C52E3D0;
  long long v4 = PDFKitLocalizedString(@"Purple");
  v10[4] = v4;
  v9[5] = &unk_26C52E3E8;
  float64x2_t v5 = PDFKitLocalizedString(@"Underline");
  v10[5] = v5;
  v9[6] = &unk_26C52E400;
  double v6 = PDFKitLocalizedString(@"Strikethrough");
  v10[6] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:7];
  double v8 = (void *)PDFMarkupMenuString_menuIconStrings;
  PDFMarkupMenuString_menuIconStrings = v7;
}

uint64_t PDFMarkupMenuColorMenuIconForMarkupStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 6) {
    return 1;
  }
  else {
    return (a1 + 1);
  }
}

void sub_2143C2370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  objc_destroyWeak((id *)(v22 - 96));
  objc_destroyWeak((id *)(v22 - 88));
  _Unwind_Resume(a1);
}

void sub_2143C2E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id RVItemClass()
{
  if (loadReveal_onceToken != -1) {
    dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)kRVItemClass;

  return v0;
}

id DDParsecCollectionViewControllerClass()
{
  if (loadReveal_onceToken != -1) {
    dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)kDDParsecCollectionViewControllerClass;

  return v0;
}

void *__loadReveal_block_invoke()
{
  if (dlopen("/System/Library/PrivateFrameworks/RevealCore.framework/RevealCore", 1))
  {
    kRVItemClass = (uint64_t)NSClassFromString(&cfstr_Rvitem.isa);
    kRVDocumentContextClass = (uint64_t)NSClassFromString(&cfstr_Rvdocumentcont.isa);
  }
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/DataDetectorsUI.framework/DataDetectorsUI", 1);
  if (result)
  {
    uint64_t result = NSClassFromString(&cfstr_Ddparseccollec.isa);
    kDDParsecCollectionViewControllerClass = (uint64_t)result;
  }
  return result;
}

void sub_2143CC7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2143CCCF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2143CD064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2143CF7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_2143CF918(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2143CFE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_2143CFFA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2143D04C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void _PDFLog(os_log_type_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (_PDFLog_onceToken != -1) {
    dispatch_once(&_PDFLog_onceToken, &__block_literal_global_12);
  }
  id v12 = [NSString alloc];
  double v13 = (void *)[[NSString alloc] initWithUTF8String:a3];
  double v14 = (void *)[v12 initWithFormat:v13 arguments:&a9];

  if (v14)
  {
    double v15 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, a1))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v17 = a2;
      __int16 v18 = 2114;
      double v19 = v14;
      _os_log_impl(&dword_214361000, v15, a1, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

void UpdateRectTransformDictionary(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a1;
  id v9 = a2;
  double v31 = a4;
  uint64_t v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = [v8 allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        __int16 v18 = [v8 objectForKey:v17];
        [v11 setObject:v18 forKey:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v14);
  }

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v9;
  uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        CGRect v48 = *(CGRect *)(v23 + 16);
        long long v24 = *(_OWORD *)(v23 + 64);
        *(_OWORD *)&v36.CGFloat a = *(_OWORD *)(v23 + 48);
        *(_OWORD *)&v36.double c = v24;
        *(_OWORD *)&v36.double tx = *(_OWORD *)(v23 + 80);
        CGRect v49 = CGRectApplyAffineTransform(v48, &v36);
        double v25 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", PDFRectFromCGRect(v49.origin.x, v49.origin.y, v49.size.width, v49.size.height));
        uint64_t v26 = [v11 objectForKey:v25];
        if (v26)
        {
          double v27 = (void *)v26;
          if (v10) {
            v10[2](v10, v23, v26);
          }
          [v11 removeObjectForKey:v25];
        }
        else
        {
          uint64_t v28 = v31[2](v31, v23);
          if (!v28) {
            goto LABEL_20;
          }
          double v27 = (void *)v28;
          [v8 setObject:v28 forKey:v25];
        }

LABEL_20:
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v20);
  }

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __UpdateRectTransformDictionary_block_invoke;
  v34[3] = &unk_264204B70;
  id v29 = v8;
  id v35 = v29;
  [v11 enumerateKeysAndObjectsUsingBlock:v34];
  [v11 removeAllObjects];
  if (a3)
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __UpdateRectTransformDictionary_block_invoke_2;
    v33[3] = &__block_descriptor_40_e33_v32__0__NSValue_8__CALayer_16_B24l;
    v33[4] = a3;
    [v29 enumerateKeysAndObjectsUsingBlock:v33];
  }

  [MEMORY[0x263F158F8] commit];
}

void sub_2143D48F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __UpdateRectTransformDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 removeFromSuperlayer];
  [*(id *)(a1 + 32) removeObjectForKey:v5];
}

void __UpdateRectTransformDictionary_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!CGColorEqualToColor((CGColorRef)[v4 backgroundColor], *(CGColorRef *)(a1 + 32))) {
    [v4 setBackgroundColor:*(void *)(a1 + 32)];
  }
}

uint64_t get_number(CGPDFArray *a1, size_t a2, CGPDFReal *a3)
{
  CGPDFReal value = 0.0;
  if (CGPDFArrayGetNumber(a1, a2, &value))
  {
    *a3 = value;
  }
  else
  {
    if (!CGPDFArrayGetNull(a1, a2) && CGPDFArrayGetCount(a1) > a2)
    {
      NSLog(&cfstr_MissingOrInval.isa);
      return 0;
    }
    *a3 = 3.40282347e38;
  }
  return 1;
}

void sub_2143D86DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2143D89CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,const void *a24)
{
  if (__p) {
    operator delete(__p);
  }

  if (a20) {
    operator delete(a20);
  }
  applesauce::CF::ObjectRef<CGDisplayList *>::~ObjectRef(&a24);

  _Unwind_Resume(a1);
}

void sub_2143D8FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,const void *a30,const void *a31)
{
}

const void **applesauce::CF::ObjectRef<__CFData const*>::~ObjectRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *__copy_helper_block_ea8_64c62_ZTSNSt3__16vectorIPK18CGDisplayListEntryNS_9allocatorIS3_EEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  uint64_t v2 = (void *)(a1 + 64);
  v2[2] = 0;
  return std::vector<CGDisplayListEntry const*>::__init_with_size[abi:ne180100]<CGDisplayListEntry const**,CGDisplayListEntry const**>(v2, *(const void **)(a2 + 64), *(void *)(a2 + 72), (uint64_t)(*(void *)(a2 + 72) - *(void *)(a2 + 64)) >> 3);
}

void __destroy_helper_block_ea8_64c62_ZTSNSt3__16vectorIPK18CGDisplayListEntryNS_9allocatorIS3_EEEE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(void *)(a1 + 72) = v2;
    operator delete(v2);
  }
}

PDFDetectedFormRow *PDFDetectedFormRow::mergeFields(PDFDetectedFormRow *this)
{
  id v3 = (id *)*((void *)this + 1);
  unint64_t v1 = *((void *)this + 2);
  uint64_t v2 = (char *)this + 8;
  if (v1 - (unint64_t)v3 >= 0x10 && (unint64_t)(v3 + 1) < v1)
  {
    id v5 = this;
    unint64_t v6 = 1;
    do
    {
      if ((unint64_t)(v3 + 1) < v1)
      {
        uint64_t v7 = v3 + 1;
        id v8 = v3;
        while (1)
        {
          id v9 = v7;
          this = (PDFDetectedFormRow *)[*v8 canBeMergedWith:v8[1]];
          if (!this) {
            break;
          }
          ++v6;
          uint64_t v7 = v9 + 1;
          id v8 = v9;
          if ((unint64_t)(v9 + 1) >= *((void *)v5 + 2))
          {
            id v8 = v9;
            break;
          }
        }
        if (v6 < 2)
        {
          id v3 = v8;
        }
        else
        {
          [*v3 rect];
          CGFloat v11 = v10;
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          __int16 v18 = &v3[v6 - 1];
          [*v18 rect];
          v37.origin.double x = v19;
          v37.origin.double y = v20;
          v37.size.double width = v21;
          v37.size.double height = v22;
          v33.origin.double x = v11;
          v33.origin.double y = v13;
          v33.size.double width = v15;
          v33.size.double height = v17;
          CGRect v34 = CGRectUnion(v33, v37);
          double x = v34.origin.x;
          double y = v34.origin.y;
          double width = v34.size.width;
          double height = v34.size.height;
          double v27 = CGRectGetWidth(v34);
          v35.origin.double x = x;
          v35.origin.double y = y;
          v35.size.double width = width;
          v35.size.double height = height;
          if (CGRectGetHeight(v35) <= 0.0)
          {
            std::vector<PDFDetectedFormField * {__strong}>::erase((uint64_t)v2, v3 + 1, &v3[v6]);
            this = (PDFDetectedFormRow *)objc_msgSend(*v3, "setRect:", x, y, width, height);
          }
          else
          {
            double v28 = v27 / (double)v6;
            if (v18 >= v3)
            {
              char v29 = 0;
              uint64_t v30 = 8 * v6 - 8;
              double v31 = v3;
              while (1)
              {
                [*v31 rect];
                if (vabdd_f64(v28, CGRectGetWidth(v36)) > 0.5) {
                  break;
                }
                if (!v30) {
                  char v29 = 1;
                }
                ++v31;
                v30 -= 8;
                if (v18 < v31) {
                  goto LABEL_22;
                }
              }
            }
            char v29 = 0;
LABEL_22:
            std::vector<PDFDetectedFormField * {__strong}>::erase((uint64_t)v2, v3 + 1, &v3[v6]);
            this = (PDFDetectedFormRow *)objc_msgSend(*v3, "setRect:", x, y, width, height);
            if (v29)
            {
              [*v3 setKind:3];
              [*v3 setNumberOfSegments:v6];
              this = (PDFDetectedFormRow *)[*v3 setSegmentWidth:v28];
            }
          }
          unint64_t v6 = 1;
        }
      }
      CGFloat v32 = v3 + 2;
      ++v3;
      unint64_t v1 = *((void *)v5 + 2);
    }
    while ((unint64_t)v32 < v1);
  }
  return this;
}

void sub_2143D9428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *PDFDetectedFormRow::fieldNearestXCoordinate(PDFDetectedFormRow *this, double a2)
{
  uint64_t v2 = (id *)*((void *)this + 1);
  id v3 = (id *)*((void *)this + 2);
  if (v3 != v2)
  {
    unint64_t v6 = v3 - v2;
    id v3 = (id *)*((void *)this + 1);
    do
    {
      uint64_t v7 = &v3[v6 >> 1];
      id v9 = *v7;
      id v8 = v7 + 1;
      [v9 minX];
      if (v10 >= a2) {
        v6 >>= 1;
      }
      else {
        v6 += ~(v6 >> 1);
      }
      if (v10 < a2) {
        id v3 = v8;
      }
    }
    while (v6);
    if (v3 == *((id **)this + 2))
    {
      --v3;
    }
    else if (v3 != *((id **)this + 1))
    {
      [*v3 minX];
      double v12 = vabdd_f64(a2, v11);
      [*(v3 - 1) minX];
      if (v12 >= vabdd_f64(a2, v13)) {
        --v3;
      }
    }
  }
  return v3;
}

void sub_2143D9688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void *std::vector<PDFDetectedFormRow>::insert(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void *)a2;
  uint64_t v7 = *a1;
  unint64_t v6 = a1[1];
  uint64_t v8 = (a2 - *a1) >> 5;
  unint64_t v11 = a1[2];
  uint64_t v9 = (uint64_t)(a1 + 2);
  unint64_t v10 = v11;
  if (v6 >= v11)
  {
    unint64_t v12 = ((uint64_t)(v6 - v7) >> 5) + 1;
    if (v12 >> 59) {
      std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = v10 - v7;
    if (v13 >> 4 > v12) {
      unint64_t v12 = v13 >> 4;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    uint64_t v21 = v9;
    if (v14) {
      CGFloat v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormRow>>(v9, v14);
    }
    else {
      CGFloat v15 = 0;
    }
    CGFloat v17 = v15;
    __int16 v18 = &v15[32 * v8];
    CGFloat v19 = v18;
    CGFloat v20 = &v15[32 * v14];
    std::__split_buffer<PDFDetectedFormRow>::push_back(&v17, a3);
    id v4 = (void *)std::vector<PDFDetectedFormRow>::__swap_out_circular_buffer(a1, &v17, (uint64_t)v4);
    std::__split_buffer<PDFDetectedFormRow>::~__split_buffer(&v17);
  }
  else if (a2 == v6)
  {
    std::vector<PDFDetectedFormRow>::__construct_one_at_end[abi:ne180100]<PDFDetectedFormRow>((uint64_t)a1, a3);
  }
  else
  {
    std::vector<PDFDetectedFormRow>::__move_range((uint64_t)a1, a2, v6, a2 + 32);
    *id v4 = *(void *)a3;
    if (v4 == (void *)a3) {
      return (void *)a3;
    }
    else {
      std::vector<PDFDetectedFormField * {__strong}>::__assign_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(v7 + 32 * v8 + 8, *(void ***)(a3 + 8), *(void ***)(a3 + 16), (uint64_t)(*(void *)(a3 + 16) - *(void *)(a3 + 8)) >> 3);
    }
  }
  return v4;
}

void sub_2143D97EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<PDFDetectedFormRow>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void PDFDetectedFormRow::insertField(PDFDetectedFormRow *this, PDFDetectedFormField *a2)
{
  unint64_t v6 = a2;
  id v3 = (id *)*((void *)this + 1);
  id v4 = (id *)*((void *)this + 2);
  char v7 = 0;
  id v5 = std::__lower_bound[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<PDFDetectedFormField * {__strong}*>,std::__wrap_iter<PDFDetectedFormField * {__strong}*>,PDFDetectedFormField * {__strong},std::__identity,PDFDetectedFormRow::insertField(PDFDetectedFormField *)::{lambda(PDFDetectedFormField *,PDFDetectedFormField *)#1}>(v3, v4, (void **)&v6);
  std::vector<PDFDetectedFormField * {__strong}>::insert((void *)this + 1, v5, (id *)&v6);
}

void sub_2143D9860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_2143D9A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Block_object_dispose(&a16, 8);
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a25, 8);
  std::__tree<double>::destroy(v32, a32);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__3(void *result, void *a2)
{
  result[6] = a2[6];
  uint64_t v2 = a2 + 7;
  uint64_t v3 = a2[7];
  result[7] = v3;
  id v4 = result + 7;
  uint64_t v5 = a2[8];
  result[8] = v5;
  if (v5)
  {
    *(void *)(v3 + 16) = v4;
    a2[6] = v2;
    void *v2 = 0;
    a2[8] = 0;
  }
  else
  {
    result[6] = v4;
  }
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

__n128 __Block_byref_object_copy__49(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__50(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void std::vector<CGDisplayListEntry const*>::reserve(void **a1, unint64_t a2)
{
  id v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>(v3, a2);
    char v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    unint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
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

void **std::vector<PDFDetectedFormField * {__strong}>::erase(uint64_t a1, void **a2, void **a3)
{
  if (a2 != a3)
  {
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(a3, *(void ***)(a1 + 8), a2);
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7 != v5)
    {
      do
      {
        uint64_t v8 = *(void **)(v7 - 8);
        v7 -= 8;
      }
      while (v7 != v6);
    }
    *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v6;
  }
  return a2;
}

void **std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(void **a1, void **a2, void **a3)
{
  id v4 = a1;
  if (a1 != a2)
  {
    do
    {
      uint64_t v6 = *v4;
      *v4++ = 0;
      uint64_t v7 = *a3;
      *a3++ = v6;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  unint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    id v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

id *std::vector<PDFDetectedFormField * {__strong}>::insert(void *a1, id *a2, id *a3)
{
  id v4 = a2;
  unint64_t v6 = a1[1];
  uint64_t v8 = (uint64_t)(a1 + 2);
  unint64_t v7 = a1[2];
  if (v6 >= v7)
  {
    uint64_t v9 = (char *)*a1;
    unint64_t v10 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    if (v10 >> 61) {
      std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = (char *)a2 - v9;
    uint64_t v12 = ((char *)a2 - v9) >> 3;
    uint64_t v13 = v7 - (void)v9;
    if (v13 >> 2 > v10) {
      unint64_t v10 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v10;
    }
    CGRect v35 = a1 + 2;
    if (v14) {
      CGFloat v15 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>((uint64_t)(a1 + 2), v14);
    }
    else {
      CGFloat v15 = 0;
    }
    double v16 = &v15[v12];
    uint64_t v32 = v15;
    *(void *)&long long v33 = v16;
    *((void *)&v33 + 1) = v16;
    CGRect v34 = (char *)&v15[v14];
    if (v12 == v14)
    {
      if (v11 < 1)
      {
        if (v9 == (char *)v4) {
          unint64_t v19 = 1;
        }
        else {
          unint64_t v19 = v11 >> 2;
        }
        uint64_t v39 = v8;
        CGFloat v20 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>(v8, v19);
        CGFloat v22 = (uint64_t *)v33;
        uint64_t v23 = *((void *)&v33 + 1) - v33;
        if (*((void *)&v33 + 1) == (void)v33)
        {
          int64x2_t v29 = vdupq_n_s64(v33);
          unint64_t v25 = (unint64_t)&v20[v19 >> 2];
        }
        else
        {
          uint64_t v24 = v23 >> 3;
          unint64_t v25 = (unint64_t)&v20[v19 >> 2] + (v23 & 0xFFFFFFFFFFFFFFF8);
          uint64_t v26 = 8 * v24;
          double v27 = (char *)&v20[v19 >> 2];
          do
          {
            uint64_t v28 = *v22;
            *v22++ = 0;
            *(void *)double v27 = v28;
            v27 += 8;
            v26 -= 8;
          }
          while (v26);
          int64x2_t v29 = (int64x2_t)v33;
        }
        uint64_t v30 = v34;
        CGRect v36 = v32;
        uint64_t v32 = v20;
        *(void *)&long long v33 = &v20[v19 >> 2];
        int64x2_t v37 = v29;
        *((void *)&v33 + 1) = v25;
        CGRect v34 = (char *)&v20[v21];
        long long v38 = v30;
        std::__split_buffer<PDFDetectedFormField * {__strong}>::~__split_buffer((uint64_t)&v36);
        double v16 = (void **)*((void *)&v33 + 1);
      }
      else
      {
        if (v12 >= -1) {
          uint64_t v17 = v12 + 1;
        }
        else {
          uint64_t v17 = v12 + 2;
        }
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(&v15[v12], v16, &v16[-(v17 >> 1)]);
        double v16 = v18;
        *(void *)&long long v33 = v33 - 8 * (v17 >> 1);
        *((void *)&v33 + 1) = v18;
      }
    }
    *double v16 = *a3;
    *((void *)&v33 + 1) += 8;
    id v4 = (id *)std::vector<PDFDetectedFormField * {__strong}>::__swap_out_circular_buffer(a1, &v32, v4);
    std::__split_buffer<PDFDetectedFormField * {__strong}>::~__split_buffer((uint64_t)&v32);
  }
  else if (a2 == (id *)v6)
  {
    *a2 = *a3;
    a1[1] = v4 + 1;
  }
  else
  {
    std::vector<PDFDetectedFormField * {__strong}>::__move_range((uint64_t)a1, a2, v6, (uint64_t)(a2 + 1));
    if (v4 <= a3) {
      a3 += a1[1] > (unint64_t)a3;
    }
    objc_storeStrong(v4, *a3);
  }
  return v4;
}

void sub_2143DA354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id *std::__lower_bound[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<PDFDetectedFormField * {__strong}*>,std::__wrap_iter<PDFDetectedFormField * {__strong}*>,PDFDetectedFormField * {__strong},std::__identity,PDFDetectedFormRow::insertField(PDFDetectedFormField *)::{lambda(PDFDetectedFormField *,PDFDetectedFormField *)#1}>(id *a1, id *a2, void **a3)
{
  uint64_t v3 = a1;
  if (a2 != a1)
  {
    unint64_t v5 = a2 - a1;
    do
    {
      unint64_t v6 = &v3[v5 >> 1];
      unint64_t v7 = *a3;
      id v8 = *v6;
      id v9 = v7;
      [v8 minX];
      double v11 = v10;
      [v9 minX];
      double v13 = v12;

      if (v11 >= v13) {
        v5 >>= 1;
      }
      else {
        v5 += ~(v5 >> 1);
      }
      if (v11 < v13) {
        uint64_t v3 = v6 + 1;
      }
    }
    while (v5);
  }
  return v3;
}

void sub_2143DA418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<PDFDetectedFormField * {__strong}>::__move_range(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  unint64_t v6 = *(void **)(a1 + 8);
  unint64_t v7 = (void *)((char *)v6 + (void)a2 - a4);
  id v8 = v6;
  if ((unint64_t)v7 < a3)
  {
    id v9 = v7;
    id v8 = *(void **)(a1 + 8);
    do
    {
      uint64_t v10 = *v9;
      *v9++ = 0;
      *v8++ = v10;
    }
    while ((unint64_t)v9 < a3);
  }
  *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v8;
  return std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(a2, v7, v6);
}

uint64_t std::vector<PDFDetectedFormField * {__strong}>::__swap_out_circular_buffer(void *a1, void *a2, void *a3)
{
  uint64_t result = a2[1];
  unint64_t v5 = (void *)*a1;
  uint64_t v6 = result;
  if ((void *)*a1 != a3)
  {
    uint64_t v6 = a2[1];
    unint64_t v7 = a3;
    do
    {
      uint64_t v8 = *--v7;
      *unint64_t v7 = 0;
      *(void *)(v6 - _Block_object_dispose(&STACK[0x200], 8) = v8;
      v6 -= 8;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  id v9 = (void *)a1[1];
  uint64_t v10 = (void *)a2[2];
  if (v9 != a3)
  {
    do
    {
      uint64_t v11 = *a3;
      *a3++ = 0;
      *v10++ = v11;
    }
    while (a3 != v9);
    uint64_t v6 = a2[1];
  }
  a2[2] = v10;
  double v12 = (void *)*a1;
  *a1 = v6;
  a2[1] = v12;
  uint64_t v13 = a1[1];
  a1[1] = a2[2];
  a2[2] = v13;
  uint64_t v14 = a1[2];
  a1[2] = a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return result;
}

void *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(void *a1, void *a2, void *a3)
{
  if (a2 != a1)
  {
    uint64_t v6 = a2;
    do
    {
      uint64_t v8 = *--v6;
      uint64_t v7 = v8;
      *uint64_t v6 = 0;
      id v9 = (void *)*--a3;
      *a3 = v7;
    }
    while (v6 != a1);
  }
  return a2;
}

void std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2642035C8, MEMORY[0x263F8C060]);
}

void sub_2143DA5D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t std::__split_buffer<PDFDetectedFormField * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void **std::__advance[abi:ne180100]<std::__tree_const_iterator<double,std::__tree_node<double,void *> *,long>>(void **result, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t v7 = *result;
    do
    {
      uint64_t v8 = (void *)*v7;
      if (*v7)
      {
        do
        {
          id v4 = v8;
          uint64_t v8 = (void *)v8[1];
        }
        while (v8);
      }
      else
      {
        do
        {
          id v4 = (void *)v7[2];
          BOOL v5 = *v4 == (void)v7;
          uint64_t v7 = v4;
        }
        while (v5);
      }
      uint64_t v7 = v4;
    }
    while (!__CFADD__(a2++, 1));
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = *result;
    do
    {
      uint64_t v3 = (void *)v2[1];
      if (v3)
      {
        do
        {
          id v4 = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          id v4 = (void *)v2[2];
          BOOL v5 = *v4 == (void)v2;
          uint64_t v2 = v4;
        }
        while (!v5);
      }
      uint64_t v2 = v4;
    }
    while (a2-- > 1);
  }
  *uint64_t result = v4;
  return result;
}

void *std::vector<CGDisplayListEntry const*>::__init_with_size[abi:ne180100]<CGDisplayListEntry const**,CGDisplayListEntry const**>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<CGDisplayListEntry const*>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2143DA7C4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x200], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<CGDisplayListEntry const*>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

char *std::vector<PDFDetectedFormRow>::__construct_one_at_end[abi:ne180100]<PDFDetectedFormRow>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  *(void *)uint64_t v3 = *(void *)a2;
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  uint64_t result = std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)(v3 + 8), *(void ***)(a2 + 8), *(void ***)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v3 + 32;
  return result;
}

void sub_2143DA878(_Unwind_Exception *a1)
{
  *(void *)(v1 + _Block_object_dispose(&STACK[0x200], 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<PDFDetectedFormRow>::__move_range(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a2 + v6 - a4;
  uint64_t v8 = v6;
  if (v7 < a3)
  {
    uint64_t v10 = v6 + 8;
    unint64_t v11 = a2 + v6 - a4;
    do
    {
      *(void *)(v10 - _Block_object_dispose(&STACK[0x200], 8) = *(void *)v11;
      *(void *)(v10 + _Block_object_dispose(&STACK[0x200], 8) = 0;
      *(void *)(v10 + 16) = 0;
      *(void *)uint64_t v10 = 0;
      std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)v10, *(void ***)(v11 + 8), *(void ***)(v11 + 16), (uint64_t)(*(void *)(v11 + 16) - *(void *)(v11 + 8)) >> 3);
      v10 += 32;
      v11 += 32;
    }
    while (v11 < a3);
    uint64_t v8 = v10 - 8;
  }
  *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormRow *,PDFDetectedFormRow *,PDFDetectedFormRow *>((uint64_t)&v13, a2, v7, v6);
}

void sub_2143DA938(_Unwind_Exception *a1)
{
  *(void *)(v1 + _Block_object_dispose(&STACK[0x200], 8) = v2 - 8;
  _Unwind_Resume(a1);
}

char *std::__split_buffer<PDFDetectedFormRow>::push_back(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  if (v4 == a1[3])
  {
    unint64_t v5 = a1[1];
    uint64_t v6 = v5 - *a1;
    if (v5 <= *a1)
    {
      uint64_t v14 = v4 - *a1;
      BOOL v13 = v14 == 0;
      uint64_t v15 = v14 >> 4;
      if (v13) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = v15;
      }
      uint64_t v17 = a1[4];
      uint64_t v25 = a1[4];
      *(void *)&long long v23 = std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormRow>>(v17, v16);
      *((void *)&v23 + 1) = v23 + 32 * (v16 >> 2);
      *(void *)&long long v24 = *((void *)&v23 + 1);
      *((void *)&v24 + 1) = v23 + 32 * v18;
      std::__split_buffer<PDFDetectedFormRow>::__construct_at_end_with_size<std::move_iterator<PDFDetectedFormRow*>>((char *)&v23, a1[1], (uint64_t)(a1[2] - a1[1]) >> 5);
      long long v19 = v24;
      long long v20 = *(_OWORD *)a1;
      long long v21 = *((_OWORD *)a1 + 1);
      *(_OWORD *)a1 = v23;
      *((_OWORD *)a1 + 1) = v19;
      long long v23 = v20;
      long long v24 = v21;
      std::__split_buffer<PDFDetectedFormRow>::~__split_buffer((void **)&v23);
      uint64_t v4 = a1[2];
    }
    else
    {
      uint64_t v7 = v6 >> 5;
      BOOL v8 = v6 >> 5 < -1;
      uint64_t v9 = (v6 >> 5) + 2;
      if (v8) {
        unint64_t v10 = v9;
      }
      else {
        unint64_t v10 = v7 + 1;
      }
      unint64_t v11 = v10 >> 1;
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormRow *,PDFDetectedFormRow *,PDFDetectedFormRow *>((uint64_t)&v23, v5, v4, (void *)(v5 - 32 * (v10 >> 1)));
      uint64_t v4 = v12;
      a1[1] -= 32 * v11;
      a1[2] = v12;
    }
  }
  *(void *)uint64_t v4 = *(void *)a2;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  uint64_t result = std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)(v4 + 8), *(void ***)(a2 + 8), *(void ***)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3);
  a1[2] += 32;
  return result;
}

void sub_2143DAA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t std::vector<PDFDetectedFormRow>::__swap_out_circular_buffer(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (uint64_t)(a1 + 2);
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>,std::reverse_iterator<PDFDetectedFormRow*>,std::reverse_iterator<PDFDetectedFormRow*>>((uint64_t)(a1 + 2), a3, a3, *a1, *a1, v6, v6);
  a2[1] = v8;
  a2[2] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*,PDFDetectedFormRow*,PDFDetectedFormRow*>(v7, a3, a1[1], a2[2]);
  uint64_t v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

char *std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(char *result, void **a2, void **a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<CGDisplayListEntry const*>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (char **)*((void *)v6 + 1);
    while (a2 != a3)
    {
      uint64_t v8 = *a2++;
      uint64_t result = v8;
      *v7++ = result;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_2143DAB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormRow *,PDFDetectedFormRow *,PDFDetectedFormRow *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    uint64_t v7 = a3;
    uint64_t v8 = a4;
    do
    {
      uint64_t v9 = *(void *)(v7 - 32);
      v7 -= 32;
      *(void *)(v8 - 32) = v9;
      v8 -= 32;
      if (v6 != a4) {
        std::vector<PDFDetectedFormField * {__strong}>::__assign_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(a4 - 24, *(void ***)(v6 - 24), *(void ***)(v6 - 16), (uint64_t)(*(void *)(v6 - 16) - *(void *)(v6 - 24)) >> 3);
      }
      a4 = v8;
      uint64_t v6 = v7;
    }
    while (v7 != a2);
  }
  return a3;
}

void std::vector<PDFDetectedFormField * {__strong}>::__assign_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(uint64_t a1, void **a2, void **a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = *(id **)a1;
  if (a4 <= (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3)
  {
    unint64_t v14 = (uint64_t)(*(void *)(a1 + 8) - (void)v8) >> 3;
    if (v14 >= a4)
    {
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((int)&v24, a2, a3, v8);
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)(a1 + 8);
      if (v21 != v19)
      {
        do
        {
          CGFloat v22 = *(void **)(v21 - 8);
          v21 -= 8;
        }
        while (v21 != v20);
      }
      *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v20;
    }
    else
    {
      uint64_t v15 = &a2[v14];
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((int)&v23, a2, v15, v8);
      uint64_t v16 = *(void *)(a1 + 8);
      if (v15 != a3)
      {
        uint64_t v17 = *(void **)(a1 + 8);
        do
        {
          uint64_t v18 = *v15++;
          *v17++ = v18;
          v16 += 8;
        }
        while (v15 != a3);
      }
      *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v16;
    }
  }
  else
  {
    std::vector<PDFDetectedFormField * {__strong}>::__vdeallocate((void **)a1);
    if (a4 >> 61) {
      std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = *(void *)(a1 + 16) - *(void *)a1;
    uint64_t v10 = v9 >> 2;
    if (v9 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<CGDisplayListEntry const*>::__vallocate[abi:ne180100]((void *)a1, v11);
    uint64_t v12 = *(void **)(a1 + 8);
    while (v6 != a3)
    {
      BOOL v13 = *v6++;
      *v12++ = v13;
    }
    *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v12;
  }
}

void std::vector<PDFDetectedFormField * {__strong}>::__vdeallocate(void **a1)
{
  uint64_t v1 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        unint64_t v5 = (void *)*((void *)v3 - 1);
        v3 -= 8;
      }
      while (v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void **std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(int a1, void **a2, void **a3, id *location)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      uint64_t v7 = *v5++;
      objc_storeStrong(location++, v7);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormRow>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormRow *,PDFDetectedFormRow *,PDFDetectedFormRow *>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      *a4 = *(void *)v5;
      if ((void *)v5 != a4) {
        std::vector<PDFDetectedFormField * {__strong}>::__assign_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((uint64_t)(a4 + 1), *(void ***)(v5 + 8), *(void ***)(v5 + 16), (uint64_t)(*(void *)(v5 + 16) - *(void *)(v5 + 8)) >> 3);
      }
      v5 += 32;
      a4 += 4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

char *std::__split_buffer<PDFDetectedFormRow>::__construct_at_end_with_size<std::move_iterator<PDFDetectedFormRow*>>(char *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  uint64_t v4 = *((void *)result + 2);
  if (a3)
  {
    uint64_t v6 = v4 + 8;
    uint64_t v7 = 32 * a3;
    v4 += 32 * a3;
    do
    {
      *(void *)(v6 - _Block_object_dispose(&STACK[0x200], 8) = *(void *)a2;
      *(void *)(v6 + _Block_object_dispose(&STACK[0x200], 8) = 0;
      *(void *)(v6 + 16) = 0;
      *(void *)uint64_t v6 = 0;
      uint64_t result = std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)v6, *(void ***)(a2 + 8), *(void ***)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3);
      v6 += 32;
      a2 += 32;
      v7 -= 32;
    }
    while (v7);
  }
  *((void *)v3 + 2) = v4;
  return result;
}

void sub_2143DAF64(_Unwind_Exception *a1)
{
  *(void *)(v1 + 16) = v2 - 8;
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>,std::reverse_iterator<PDFDetectedFormRow*>,std::reverse_iterator<PDFDetectedFormRow*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v17 = a6;
  *((void *)&v17 + 1) = a7;
  long long v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  char v15 = 0;
  if (a3 == a5)
  {
    uint64_t v12 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      uint64_t v10 = *(void *)(v9 - 32);
      v9 -= 32;
      *(void *)(v7 - 24) = 0;
      uint64_t v11 = v7 - 24;
      *(void *)(v11 - _Block_object_dispose(&STACK[0x200], 8) = v10;
      *(void *)(v11 + _Block_object_dispose(&STACK[0x200], 8) = 0;
      *(void *)(v11 + 16) = 0;
      std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)v11, *(void ***)(v9 + 8), *(void ***)(v9 + 16), (uint64_t)(*(void *)(v9 + 16) - *(void *)(v9 + 8)) >> 3);
      uint64_t v7 = *((void *)&v17 + 1) - 32;
      *((void *)&v17 + 1) -= 32;
    }
    while (v9 != a5);
    uint64_t v12 = v17;
  }
  char v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v12;
}

void sub_2143DB02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*,PDFDetectedFormRow*,PDFDetectedFormRow*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(void *)uint64_t v4 = *(void *)v6;
      *(void *)(v4 + 16) = 0;
      *(void *)(v4 + 24) = 0;
      *(void *)(v4 + _Block_object_dispose(&STACK[0x200], 8) = 0;
      std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)(v4 + 8), *(void ***)(v6 + 8), *(void ***)(v6 + 16), (uint64_t)(*(void *)(v6 + 16) - *(void *)(v6 + 8)) >> 3);
      uint64_t v4 = v11 + 32;
      v11 += 32;
      v6 += 32;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_2143DB0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = (void **)(v1 + 8);
    std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 32;
  }
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    do
    {
      uint64_t v3 = v1 - 32;
      uint64_t v4 = (void **)(v1 - 24);
      std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v4);
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

void **std::__split_buffer<PDFDetectedFormRow>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<PDFDetectedFormRow>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 32;
    uint64_t v4 = (void **)(i - 24);
    std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
}

void std::__tree<double>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<double>::destroy(a1, *a2);
    std::__tree<double>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<double>::__emplace_unique_key_args<double,double const&>(uint64_t **a1, double *a2, uint64_t *a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    double v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        double v9 = *((double *)v5 + 4);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = (uint64_t *)*v5;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = (uint64_t *)v5[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

void std::vector<PDFDetectedFormRow>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 32;
        double v7 = (void **)(v4 - 24);
        std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v7);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_2143DB9FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143DD828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_2143DEE28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__355(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__356(uint64_t a1)
{
}

void sub_2143DF5C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143DF770(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_2143DFD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2143E163C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2143E2174(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143E25E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143E26C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143E273C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143E2B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2143E2EB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143E31D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_2143E3C30(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 136));
  objc_destroyWeak((id *)(v1 - 128));
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_2143E41FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_2143E4C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_2143E54B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143E578C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143E6238(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143E6A98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2143E6E88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double PDFRectGetMinX(double result, double a2, double a3)
{
  if (result >= result + a3) {
    return result + a3;
  }
  return result;
}

double PDFRectGetMinY(double a1, double a2, double a3, double a4)
{
  double result = a2 + a4;
  if (a2 < a2 + a4) {
    return a2;
  }
  return result;
}

double PDFRectGetMaxX(double result, double a2, double a3)
{
  if (result <= result + a3) {
    return result + a3;
  }
  return result;
}

double PDFRectGetMaxY(double a1, double a2, double a3, double a4)
{
  double result = a2 + a4;
  if (a2 > a2 + a4) {
    return a2;
  }
  return result;
}

double PDFRectGetMidX(double a1, double a2, double a3)
{
  return a1 + a3 * 0.5;
}

double PDFRectGetMidY(double a1, double a2, double a3, double a4)
{
  return a2 + a4 * 0.5;
}

double PDFPointScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double PDFRectScale(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

BOOL PDFPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

BOOL PDFEdgeInsetsEqualToInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (vabdd_f64(a1, a5) > 0.00000011920929) {
    return 0;
  }
  double v9 = vabdd_f64(a4, a8);
  BOOL v10 = vabdd_f64(a2, a6) <= 0.00000011920929;
  if (vabdd_f64(a3, a7) > 0.00000011920929) {
    BOOL v10 = 0;
  }
  return v9 <= 0.00000011920929 && v10;
}

double PDFEdgeInsetsGetMaxInsets(double result, double a2, double a3, double a4, double a5)
{
  if (result < a5) {
    return a5;
  }
  return result;
}

double PDFScaleRectToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double result = a7 / a3;
  if (a4 * (a7 / a3) > a8) {
    return a8 / a4;
  }
  return result;
}

double PDFEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = a1 + a6;
  double v9 = a3 - (a8 + a6);
  double v10 = v9 * 0.5;
  if (v9 > 0.0) {
    double v10 = -0.0;
  }
  return v8 + v10;
}

uint64_t PDFNormalizeRotation(uint64_t a1)
{
  if (a1 < 0) {
    a1 += 360 * (-a1 / 0x168uLL) + 360;
  }
  return (uint64_t)(round((double)a1 / 90.0) * 90.0) % 360;
}

double PDFRectRotate(uint64_t a1, double a2, double a3)
{
  if (a1 != 270 && a1 != 90) {
    return a2;
  }
  return a3;
}

double PDFDegToRad(double a1)
{
  return a1 / 180.0 * 3.14159265;
}

double PDFRectGetCenterPoint(double a1, double a2, double a3)
{
  return a1 + a3 * 0.5;
}

double PDFRectMakeFromCenter(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double PDFRectFromPDFPoints(double result, double a2, double a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

void PDFPointsGetMinMaxValues(void *a1, double *a2, double *a3, double *a4, double *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a1;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    double v13 = 3.40282347e38;
    double v14 = 1.17549435e-38;
    double v15 = 1.17549435e-38;
    double v16 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) PDFKitPDFPointValue];
        if (v18 < v16) {
          double v16 = v18;
        }
        if (v19 < v13) {
          double v13 = v19;
        }
        if (v18 >= v15) {
          double v15 = v18;
        }
        if (v19 >= v14) {
          double v14 = v19;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 3.40282347e38;
    double v14 = 1.17549435e-38;
    double v15 = 1.17549435e-38;
    double v16 = 3.40282347e38;
  }
  *a2 = v16;
  *a3 = v13;
  *a4 = v15;
  *a5 = v14;
}

double PDFPointClampInPDFRect(double result, double a2, double a3, double a4, double a5)
{
  double v5 = a3 + a5;
  if (result >= v5) {
    double result = v5;
  }
  if (result < a3) {
    return a3;
  }
  return result;
}

double CGFloatClamp(double result, double a2, double a3)
{
  if (result < a2) {
    double result = a2;
  }
  if (result > a3) {
    return a3;
  }
  return result;
}

BOOL PDFRectValid(double a1, double a2, double a3, double a4)
{
  double v4 = fabs(a1);
  BOOL v5 = v4 < INFINITY;
  if (v4 > INFINITY) {
    BOOL v5 = 1;
  }
  if (fabs(a2) == INFINITY) {
    BOOL v5 = 0;
  }
  if (fabs(a3) == INFINITY) {
    BOOL v5 = 0;
  }
  if (fabs(a4) == INFINITY) {
    return 0;
  }
  return v5;
}

double PDFNormalizedCGVectorFromPoints(double a1, double a2, double a3, double a4)
{
  return (a1 - a3) / sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double PDFNormalizeCGVector(double a1, double a2)
{
  return a1 / sqrt(a2 * a2 + a1 * a1);
}

double PDFGetAngleBetweenCGVectors(double a1, double a2, double a3, double a4)
{
  return acos((a2 * a4 + a1 * a3) / (sqrt(a2 * a2 + a1 * a1) * sqrt(a4 * a4 + a3 * a3)));
}

id PDFGetToolTipNoLabel(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && ([v1 document], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v4 = (void *)v3;
    BOOL v5 = NSString;
    uint64_t v6 = PDFKitLocalizedString(@"Go to page %lu");
    double v7 = objc_msgSend(v5, "stringWithFormat:", v6, objc_msgSend(v4, "indexForPage:", v2) + 1);
  }
  else
  {
    double v7 = PDFKitLocalizedString(@"Broken link");
  }

  return v7;
}

id PDFKitLocalizedString(void *a1)
{
  id v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  uint64_t v3 = [v1 bundleWithIdentifier:@"com.apple.PDFKit"];
  double v4 = [v3 localizedStringForKey:v2 value:&stru_26C516768 table:0];

  return v4;
}

CFStringRef createFilenameForEncoding(CGPDFObject *a1, CFStringEncoding a2)
{
  CGPDFReal value = 0;
  if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeString, &value))
  {
    CGPDFDictionaryRef dict = 0;
    if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeDictionary, &dict)
      || !CGPDFDictionaryGetString(dict, "F", (CGPDFStringRef *)&value))
    {
      return 0;
    }
  }
  CFStringRef result = value;
  if (value)
  {
    CFStringRef result = (CFStringRef)CGPDFStringGetBytePtr((CGPDFStringRef)value);
    if (result)
    {
      BOOL v5 = (const UInt8 *)result;
      CFStringRef result = (CFStringRef)CGPDFStringGetLength((CGPDFStringRef)value);
      if (result) {
        return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, (CFIndex)result, a2, 0);
      }
    }
  }
  return result;
}

__CFString *getFilepathFromObjectDetermineEncoding(CGPDFObject *a1, const __CFString *a2)
{
  if (!a2)
  {
    double v13 = 0;
    goto LABEL_65;
  }
  memset(&v35, 0, sizeof(v35));
  CFStringRef FilenameForEncoding = createFilenameForEncoding(a1, 0);
  BOOL v5 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (FilenameForEncoding)
  {
    CFStringRef v6 = FilenameForEncoding;
    MutableCopdouble y = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a2);
    double v8 = (__CFString *)MutableCopy;
    if (MutableCopy)
    {
      CFIndex Length = CFStringGetLength(MutableCopy);
      if (CFStringGetCharacterAtIndex(v8, Length - 1) != 47) {
        CFStringAppend(v8, @"/");
      }
      CFStringAppend(v8, v6);
      CFIndex v10 = CFStringGetLength(v8);
      if (v10)
      {
        uint64_t v11 = 2 * v10 + 2;
        uint64_t v12 = (char *)malloc_type_malloc(v11, 0x26B87056uLL);
        if (CFStringGetCString(v8, v12, v11, 0x8000100u) && (stat(v12, &v35) & 0x80000000) == 0) {
          goto LABEL_58;
        }
        if (v12) {
          free(v12);
        }
      }
    }
    CFRelease(v6);
  }
  else
  {
    double v8 = 0;
  }
  CFStringRef v14 = createFilenameForEncoding(a1, 1u);
  if (v14)
  {
    CFStringRef v6 = v14;
    CFStringRef v15 = CFStringCreateMutableCopy(*v5, 0, a2);
    if (v15)
    {
      double v13 = (__CFString *)v15;
      CFIndex v16 = CFStringGetLength(v15);
      if (CFStringGetCharacterAtIndex(v13, v16 - 1) != 47) {
        CFStringAppend(v13, @"/");
      }
      CFStringAppend(v13, v6);
      CFIndex v17 = CFStringGetLength(v13);
      if (v17)
      {
        uint64_t v18 = 2 * v17 + 2;
        uint64_t v12 = (char *)malloc_type_malloc(v18, 0x5D280693uLL);
        if (CFStringGetCString(v13, v12, v18, 0x8000100u) && (stat(v12, &v35) & 0x80000000) == 0) {
          goto LABEL_59;
        }
        if (v12) {
          free(v12);
        }
      }
      CFRelease(v13);
    }
    CFRelease(v6);
  }
  CFStringRef v19 = createFilenameForEncoding(a1, 2u);
  if (v19)
  {
    CFStringRef v6 = v19;
    CFStringRef v20 = CFStringCreateMutableCopy(*v5, 0, a2);
    if (v20)
    {
      double v13 = (__CFString *)v20;
      CFIndex v21 = CFStringGetLength(v20);
      if (CFStringGetCharacterAtIndex(v13, v21 - 1) != 47) {
        CFStringAppend(v13, @"/");
      }
      CFStringAppend(v13, v6);
      CFIndex v22 = CFStringGetLength(v13);
      if (v22)
      {
        uint64_t v23 = 2 * v22 + 2;
        uint64_t v12 = (char *)malloc_type_malloc(v23, 0xF28B4831uLL);
        if (CFStringGetCString(v13, v12, v23, 0x8000100u) && (stat(v12, &v35) & 0x80000000) == 0) {
          goto LABEL_59;
        }
        if (v12) {
          free(v12);
        }
      }
      CFRelease(v13);
    }
    CFRelease(v6);
  }
  CFStringRef v24 = createFilenameForEncoding(a1, 3u);
  if (v24)
  {
    CFStringRef v6 = v24;
    CFStringRef v25 = CFStringCreateMutableCopy(*v5, 0, a2);
    if (v25)
    {
      double v13 = (__CFString *)v25;
      CFIndex v26 = CFStringGetLength(v25);
      if (CFStringGetCharacterAtIndex(v13, v26 - 1) != 47) {
        CFStringAppend(v13, @"/");
      }
      CFStringAppend(v13, v6);
      CFIndex v27 = CFStringGetLength(v13);
      if (v27)
      {
        uint64_t v28 = 2 * v27 + 2;
        uint64_t v12 = (char *)malloc_type_malloc(v28, 0x7F0A2B40uLL);
        if (CFStringGetCString(v13, v12, v28, 0x8000100u) && (stat(v12, &v35) & 0x80000000) == 0) {
          goto LABEL_59;
        }
        if (v12) {
          free(v12);
        }
      }
      CFRelease(v13);
    }
    CFRelease(v6);
  }
  CFStringRef v29 = createFilenameForEncoding(a1, 0x19u);
  if (!v29) {
    goto LABEL_64;
  }
  CFStringRef v6 = v29;
  CFStringRef v30 = CFStringCreateMutableCopy(*v5, 0, a2);
  if (!v30)
  {
    double v13 = v8;
LABEL_63:
    CFRelease(v6);
    goto LABEL_65;
  }
  double v13 = (__CFString *)v30;
  CFIndex v31 = CFStringGetLength(v30);
  if (CFStringGetCharacterAtIndex(v13, v31 - 1) != 47) {
    CFStringAppend(v13, @"/");
  }
  CFStringAppend(v13, v6);
  CFIndex v32 = CFStringGetLength(v13);
  if (!v32)
  {
    uint64_t v12 = 0;
LABEL_57:
    CFRelease(v13);
LABEL_58:
    double v13 = 0;
    goto LABEL_59;
  }
  uint64_t v33 = 2 * v32 + 2;
  uint64_t v12 = (char *)malloc_type_malloc(v33, 0xDCD744E4uLL);
  if (!CFStringGetCString(v13, v12, v33, 0x8000100u) || stat(v12, &v35) < 0) {
    goto LABEL_57;
  }
LABEL_59:
  if (v12) {
    free(v12);
  }
  CFRelease(v6);
  if (v13)
  {
    CFStringRef v6 = v8;
    if (!v8) {
      goto LABEL_65;
    }
    goto LABEL_63;
  }
LABEL_64:
  double v13 = v8;
LABEL_65:

  return v13;
}

id PDFCGColorCreateGenericGray(CGFloat a1, CGFloat a2)
{
  components[2] = *(CGFloat *)MEMORY[0x263EF8340];
  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  components[0] = a1;
  components[1] = a2;
  BOOL v5 = CGColorCreate(DeviceGray, components);
  CFStringRef v6 = [MEMORY[0x263F825C8] colorWithCGColor:v5];
  if (DeviceGray) {
    CGColorSpaceRelease(DeviceGray);
  }
  if (v5) {
    CGColorRelease(v5);
  }

  return v6;
}

id PDFCGColorCreateGenericRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  CGFloat components[3] = a4;
  id v9 = CGColorCreate(DeviceRGB, components);
  CFIndex v10 = [MEMORY[0x263F825C8] colorWithCGColor:v9];
  if (DeviceRGB) {
    CGColorSpaceRelease(DeviceRGB);
  }
  if (v9) {
    CGColorRelease(v9);
  }

  return v10;
}

id PDFCGColorCreateGenericCMYK(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v14[5] = *(CGFloat *)MEMORY[0x263EF8340];
  DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
  v14[0] = a1;
  v14[1] = a2;
  v14[2] = a3;
  void v14[3] = a4;
  v14[4] = a5;
  uint64_t v11 = CGColorCreate(DeviceCMYK, v14);
  uint64_t v12 = [MEMORY[0x263F825C8] colorWithCGColor:v11];
  if (DeviceCMYK) {
    CGColorSpaceRelease(DeviceCMYK);
  }
  if (v11) {
    CGColorRelease(v11);
  }

  return v12;
}

id PDFColorCreateFromNSArray(void *a1)
{
  id v1 = a1;
  switch([v1 count])
  {
    case 0:
      id v2 = PDFCGColorCreateGenericGray(0.0, 0.0);
      break;
    case 1:
      uint64_t v3 = [v1 objectAtIndex:0];
      [v3 floatValue];
      id v2 = PDFCGColorCreateGenericGray(v4, 1.0);
      goto LABEL_8;
    case 3:
      uint64_t v3 = [v1 objectAtIndex:0];
      [v3 floatValue];
      CGFloat v6 = v5;
      double v7 = [v1 objectAtIndex:1];
      [v7 floatValue];
      CGFloat v9 = v8;
      CFIndex v10 = [v1 objectAtIndex:2];
      [v10 floatValue];
      id v2 = PDFCGColorCreateGenericRGB(v6, v9, v11, 1.0);
      goto LABEL_7;
    case 4:
      uint64_t v3 = [v1 objectAtIndex:0];
      [v3 floatValue];
      CGFloat v13 = v12;
      double v7 = [v1 objectAtIndex:1];
      [v7 floatValue];
      CGFloat v15 = v14;
      CFIndex v10 = [v1 objectAtIndex:2];
      [v10 floatValue];
      CGFloat v17 = v16;
      uint64_t v18 = [v1 objectAtIndex:3];
      [v18 floatValue];
      id v2 = PDFCGColorCreateGenericCMYK(v13, v15, v17, v19, 1.0);

LABEL_7:
LABEL_8:

      break;
    default:
      NSLog(&cfstr_ErrorCannotCre_3.isa, v1);
      id v2 = 0;
      break;
  }

  return v2;
}

id PDFColorCreateFromCGPDFArray(CGPDFArray *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(_OWORD *)CGPDFReal value = xmmword_214423118;
  *(_OWORD *)float v8 = unk_214423128;
  switch(CGPDFArrayGetCount(a1))
  {
    case 0uLL:
      CGFloat v2 = 0.0;
      CGFloat v3 = 0.0;
      goto LABEL_4;
    case 1uLL:
      CGPDFArrayGetNumber(a1, 0, value);
      CGFloat v2 = value[0];
      CGFloat v3 = 1.0;
LABEL_4:
      float v4 = PDFCGColorCreateGenericGray(v2, v3);
      break;
    case 3uLL:
      CGPDFArrayGetNumber(a1, 0, value);
      CGPDFArrayGetNumber(a1, 1uLL, &value[1]);
      CGPDFArrayGetNumber(a1, 2uLL, v8);
      float v4 = PDFCGColorCreateGenericRGB(value[0], value[1], v8[0], 1.0);
      break;
    case 4uLL:
      CGPDFArrayGetNumber(a1, 0, value);
      CGPDFArrayGetNumber(a1, 1uLL, &value[1]);
      CGPDFArrayGetNumber(a1, 2uLL, v8);
      CGPDFArrayGetNumber(a1, 3uLL, &v8[1]);
      float v4 = PDFCGColorCreateGenericCMYK(value[0], value[1], v8[0], v8[1], 1.0);
      break;
    default:
      size_t Count = CGPDFArrayGetCount(a1);
      NSLog(&cfstr_ErrorCannotCre_4.isa, Count);
      float v4 = 0;
      break;
  }

  return v4;
}

void PDFKitPlatformColorGetRGBA(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a1;
  if (v9)
  {
    id v10 = v9;
    float v11 = (CGColor *)[v10 CGColor];
    float v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00260]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v12, kCGRenderingIntentDefault, v11, 0);
    CGColorSpaceRelease(v12);
    id v14 = [MEMORY[0x263F825C8] colorWithCGColor:CopyByMatchingToColorSpace];

    CGColorRelease(CopyByMatchingToColorSpace);
    [v14 getRed:a2 green:a3 blue:a4 alpha:a5];
  }
}

BOOL PDFColorComponentsAreEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  int64_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)[v5 CGColor]);
  id v7 = v4;
  if (NumberOfComponents == CGColorGetNumberOfComponents((CGColorRef)[v7 CGColor]))
  {
    Components = CGColorGetComponents((CGColorRef)[v5 CGColor]);
    id v9 = CGColorGetComponents((CGColorRef)[v7 CGColor]);
    int64_t v10 = NumberOfComponents - 1;
    if (NumberOfComponents < 1)
    {
      BOOL v17 = 1;
    }
    else
    {
      do
      {
        double v11 = *Components++;
        double v12 = v11;
        double v13 = *v9++;
        double v14 = vabdd_f64(v12, v13);
        BOOL v16 = v10-- != 0;
        BOOL v17 = v14 <= 0.001;
      }
      while (v14 <= 0.001 && v16);
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

BOOL PDFKitCGImageIsWideGamut(CGImage *a1)
{
  if (!a1) {
    return 0;
  }
  ColorSpace = CGImageGetColorSpace(a1);
  if (!ColorSpace) {
    return 0;
  }

  return CGColorSpaceIsWideGamutRGB(ColorSpace);
}

uint64_t PDFFontWithNameAndSize(uint64_t a1, double a2)
{
  if (a2 == 0.0) {
    a2 = 12.0;
  }
  return [MEMORY[0x263F82760] fontWithName:a1 size:a2];
}

double PDFScreenGetBackingScaleFactor()
{
  uint64_t v0 = [MEMORY[0x263F82B60] mainScreen];
  [v0 scale];
  double v2 = v1;

  return v2;
}

void PDFKitAddRelativeCurveToPoint(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  id v15 = a1;
  [v15 currentPoint];
  objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", a2 + v13, a3 + v14, a4 + v13, a5 + v14, a6 + v13, a7 + v14);
}

uint64_t PDFKitBezierPathWithRoundedRect()
{
  return objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:");
}

uint64_t PDFURLLooksSuspicious(void *a1)
{
  id v1 = a1;
  double v2 = [v1 scheme];
  id v3 = [v2 lowercaseString];

  if ((([v3 isEqualToString:@"http"] & 1) != 0
     || [v3 isEqualToString:@"https"])
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v4 = objc_msgSend(v1, "_lp_userVisibleStringUsesEncodedHost");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t PDFKitBundle()
{
  return [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PDFKit"];
}

uint64_t GetDefaultsWriteValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = v4;
  if (v4)
  {
    CGFloat v6 = [v4 objectForKey:v3];

    if (v6) {
      a2 = [v5 BOOLForKey:v3];
    }
  }

  return a2;
}

uint64_t GetUseWhippet()
{
  if (sUseWhippet) {
    return 0;
  }
  else {
    return GetDefaultsWriteValue(@"PDFKit2_UseWhippet", 1);
  }
}

uint64_t GetUseIOSurfaceForTiles()
{
  if (sUseIOSurfaceForTiles_0 == 2) {
    return GetDefaultsWriteValue(@"PDFKit2_UseIOSurfaceForTiles", 1);
  }
  else {
    return sUseIOSurfaceForTiles_0 == 1;
  }
}

uint64_t SetUseIOSurfaceForTiles(uint64_t result)
{
  sUseIOSurfaceForTiles_0 = result;
  if ((result & 1) == 0) {
    sUseWhippet = 1;
  }
  return result;
}

uint64_t GetDefaultsWriteColorTileEdge()
{
  return GetDefaultsWriteValue(@"PDFKit2_ColorTileEdge", 0);
}

uint64_t GetDefaultsWriteDrawTiles()
{
  return GetDefaultsWriteValue(@"PDFKit2_DrawTiles", 1);
}

uint64_t GetDefaultsWriteColorWidgetBackgrounds()
{
  return GetDefaultsWriteValue(@"PDFKit2_ColorWidgetBackgrounds", 0);
}

uint64_t GetDefaultsWriteUseAppendMode()
{
  return GetDefaultsWriteValue(@"PDFKit2_UseAppendMode", 1);
}

uint64_t GetDefaultsWriteDrawInvisibleText()
{
  return GetDefaultsWriteValue(@"PDFKit2_DrawInvisibleText", 0);
}

uint64_t GetDefaultsWriteAnnotationLoggingEnabled()
{
  if (GetDefaultsWriteAnnotationLoggingEnabled_onceToken != -1) {
    dispatch_once(&GetDefaultsWriteAnnotationLoggingEnabled_onceToken, &__block_literal_global_15);
  }
  return GetDefaultsWriteAnnotationLoggingEnabled_value;
}

uint64_t __GetDefaultsWriteAnnotationLoggingEnabled_block_invoke()
{
  uint64_t result = GetDefaultsWriteValue(@"PDFKIT_LOG_ANNOTATIONS", 0);
  GetDefaultsWriteAnnotationLoggingEnabled_CGPDFReal value = result;
  return result;
}

uint64_t GetDefaultsWriteDrawAccessibility()
{
  return GetDefaultsWriteValue(@"PDFKit2_DrawAccessibility", 0);
}

uint64_t GetDefaultsWriteHighlightAnnotations()
{
  return GetDefaultsWriteValue(@"PDFKit2_HighlightAnnotations", 0);
}

uint64_t GetDefaultsWriteHighlightRedactions()
{
  return GetDefaultsWriteValue(@"PDFKit2_HighlightRedactions", 0);
}

uint64_t GetDefaultsWriteHighlightDetectedAnnotations()
{
  return GetDefaultsWriteValue(@"PDFKit2_HighlightDetectedAnnotations", 0);
}

uint64_t GetDefaultsWriteLogPerfTimes()
{
  return GetDefaultsWriteValue(@"PDFKit2_LogPerfTime", 0);
}

uint64_t PDFKitIsOCREnabled()
{
  uint64_t result = GetDefaultsWriteValue(@"PDFKit2_OCR_Enabled", 1);
  if (result)
  {
    if (_os_feature_enabled_impl())
    {
      return 1;
    }
    else
    {
      return _os_feature_enabled_impl();
    }
  }
  return result;
}

uint64_t PDFKitIsVisionKitFormDetectionEnabled()
{
  uint64_t result = GetDefaultsWriteValue(@"PDFKit2_VisionKitFormDetectionEnabled", 1);
  if (result)
  {
    return _os_feature_enabled_impl();
  }
  return result;
}

uint64_t PDFKitIsFormFillingEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t GetDefaultsWriteDrawOCRQuads()
{
  return GetDefaultsWriteValue(@"PDFKit2_DrawOCRQuads", 0);
}

BOOL ShouldRenderAnnotationsInPDFKit()
{
  return AKAdaptorEnabled == 0;
}

uint64_t GetDefaultsWriteAKEnabled()
{
  return AKAdaptorEnabled;
}

uint64_t PDFRectToString(double a1, double a2, double a3, double a4)
{
  return [NSString stringWithFormat:@"(%.2f, %.2f), [%.2f, %.2f]", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4];
}

double GetMachSeconds()
{
  if (*(double *)&GetMachSeconds_kMachAbsTimeToSeconds <= 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v1) = info.denom;
    LODWORD(v0) = info.numer;
    *(double *)&GetMachSeconds_kMachAbsTimeToSeconds = (double)v0 / (double)v1 / 1000000000.0;
  }
  return *(double *)&GetMachSeconds_kMachAbsTimeToSeconds * (double)mach_absolute_time();
}

uint64_t PDFKitDeviceIsiPhone()
{
  if (PDFKitDeviceIsiPhone_onceToken != -1) {
    dispatch_once(&PDFKitDeviceIsiPhone_onceToken, &__block_literal_global_175);
  }
  return PDFKitDeviceIsiPhone_deviceIsiPhone;
}

void __PDFKitDeviceIsiPhone_block_invoke()
{
  id v0 = [MEMORY[0x263F82670] currentDevice];
  PDFKitDeviceIsiPhone_deviceIsiPhone = [v0 userInterfaceIdiom] == 0;
}

uint64_t PDFKitDeviceIsiPad()
{
  if (PDFKitDeviceIsiPad_onceToken != -1) {
    dispatch_once(&PDFKitDeviceIsiPad_onceToken, &__block_literal_global_178);
  }
  return PDFKitDeviceIsiPad_deviceIsiPad;
}

void __PDFKitDeviceIsiPad_block_invoke()
{
  id v0 = [MEMORY[0x263F82670] currentDevice];
  PDFKitDeviceIsiPad_deviceIsiPaCGFloat d = [v0 userInterfaceIdiom] == 1;
}

uint64_t PDFKitDeviceIsN61()
{
  if (PDFKitDeviceIsN61_onceToken != -1) {
    dispatch_once(&PDFKitDeviceIsN61_onceToken, &__block_literal_global_180);
  }
  return PDFKitDeviceIsN61_deviceIsN61;
}

uint64_t __PDFKitDeviceIsN61_block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  PDFKitDeviceIsN61_deviceIsN61 = result;
  return result;
}

uint64_t PDFKitDeviceIsN56()
{
  if (PDFKitDeviceIsN56_onceToken != -1) {
    dispatch_once(&PDFKitDeviceIsN56_onceToken, &__block_literal_global_182);
  }
  return PDFKitDeviceIsN56_deviceIsN56;
}

uint64_t __PDFKitDeviceIsN56_block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  PDFKitDeviceIsN56_deviceIsN56 = result;
  return result;
}

BOOL PDFSubclassOverridesSelector(objc_class *a1, objc_class *a2, SEL name)
{
  if (a1 == a2) {
    return 0;
  }
  IMP MethodImplementation = class_getMethodImplementation(a1, name);
  IMP v6 = class_getMethodImplementation(a2, name);
  if (MethodImplementation) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  return !v7 && MethodImplementation != v6;
}

void sub_2143EA9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2143EAA64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2143EAB8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2143EB1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AKAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKAnnotationClass;

  return v0;
}

id AKControllerClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKControllerClass;

  return v0;
}

id AKToolbarViewClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKToolbarViewClass;

  return v0;
}

id AKPageModelControllerClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKPageModelControllerClass;

  return v0;
}

id AKArrowAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKArrowAnnotationClass;

  return v0;
}

id AKArrowShapeAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKArrowShapeAnnotationClass;

  return v0;
}

id AKBorderMaskAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKBorderMaskAnnotationClass;

  return v0;
}

id AKCropAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKCropAnnotationClass;

  return v0;
}

id AKDoodleAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKDoodleAnnotationClass;

  return v0;
}

id AKInkAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKInkAnnotationClass;

  return v0;
}

id AKHeartAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKHeartAnnotationClass;

  return v0;
}

id AKImageAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKImageAnnotationClass;

  return v0;
}

id AKLoupeAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKLoupeAnnotationClass;

  return v0;
}

id AKOvalAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKOvalAnnotationClass;

  return v0;
}

id AKPolygonAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKPolygonAnnotationClass;

  return v0;
}

id AKRectAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKRectAnnotationClass;

  return v0;
}

id AKRedactionRectAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKRedactionRectAnnotationClass;

  return v0;
}

id AKSignatureAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKSignatureAnnotationClass;

  return v0;
}

id AKSpeechBubbleAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKSpeechBubbleAnnotationClass;

  return v0;
}

id AKStarAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKStarAnnotationClass;

  return v0;
}

id AKTextBoxAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKTextBoxAnnotationClass;

  return v0;
}

id AKTextFieldAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKTextFieldAnnotationClass;

  return v0;
}

id AKThoughtBubbleAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKThoughtBubbleAnnotationClass;

  return v0;
}

id AKTriangleAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKTriangleAnnotationClass;

  return v0;
}

id AKSignaturesPresentationContextClass()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKSignaturesPresentationContextClass;

  return v0;
}

id AKWillBeginEditingTextAnnotationNotificationString()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKWillBeginEditingTextAnnotationNotificationString;

  return v0;
}

id AKDidEndEditingTextAnnotationNotificationString()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKWillDidEndTextAnnotationNotificationString;

  return v0;
}

id AKEditingTextAnnotationKeyString()
{
  if (loadAnnotationKit_onceToken != -1) {
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  }
  id v0 = (void *)kAKEditingTextAnnotationKeyString;

  return v0;
}

void __loadAnnotationKit_block_invoke()
{
  if (dlopen("/System/Library/PrivateFrameworks/AnnotationKit.framework/AnnotationKit", 1))
  {
    kAKAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akannotation.isa);
    kAKControllerClass = (uint64_t)NSClassFromString(&cfstr_Akcontroller.isa);
    kAKToolbarViewClass = (uint64_t)NSClassFromString(&cfstr_Aktoolbarview.isa);
    kAKPageModelControllerClass = (uint64_t)NSClassFromString(&cfstr_Akpagemodelcon.isa);
    kAKArrowAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akarrowannotat.isa);
    kAKArrowShapeAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akarrowshapean.isa);
    kAKBorderMaskAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akbordermaskan.isa);
    kAKCropAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akcropannotati.isa);
    kAKDoodleAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akdoodleannota.isa);
    kAKInkAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akinkannotatio.isa);
    kAKHeartAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akheartannotat.isa);
    kAKImageAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akimageannotat.isa);
    kAKLoupeAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akloupeannotat.isa);
    kAKOvalAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akovalannotati.isa);
    kAKPolygonAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akpolygonannot.isa);
    kAKRectAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akrectannotati.isa);
    kAKRedactionRectAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akredactionrec.isa);
    kAKSignatureAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Aksignatureann.isa);
    kAKSpeechBubbleAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akspeechbubble.isa);
    kAKStarAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akstarannotati.isa);
    kAKTextBoxAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Aktextboxannot.isa);
    kAKTextFieldAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Aktextfieldann.isa);
    kAKThoughtBubbleAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Akthoughtbubbl.isa);
    kAKTriangleAnnotationClass = (uint64_t)NSClassFromString(&cfstr_Aktriangleanno.isa);
    kAKSignaturesPresentationContextClass = (uint64_t)NSClassFromString(&cfstr_Aksignaturespr.isa);
    id v0 = (void *)kAKWillBeginEditingTextAnnotationNotificationString;
    kAKWillBeginEditingTextAnnotationNotificationString = @"com.apple.AnnotationKit.AKWillBeginEditingTextAnnotationNotification";

    unint64_t v1 = (void *)kAKWillDidEndTextAnnotationNotificationString;
    kAKWillDidEndTextAnnotationNotificationString = @"com.apple.AnnotationKit.AKDidEndEditingTextAnnotationNotification";

    double v2 = (void *)kAKEditingTextAnnotationKeyString;
    kAKEditingTextAnnotationKeyString = @"com.apple.AnnotationKit.AKEditingTextAnnotationKey";
  }
}

void sub_2143EE1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2143EF044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_2143F0370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2143F0CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t DrawPDFPageWithProgressCallback(uint64_t a1)
{
  if (a1 && (unint64_t v1 = *(void **)a1, ++*(void *)(a1 + 8), v1)) {
    return [v1 drawProgressCallback];
  }
  else {
    return 1;
  }
}

void sub_2143F1974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2143F37C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_2143F3F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

uint64_t _sortCGSelections(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CGPDFSelectionGetClientProperty();
  uint64_t v4 = [v3 document];
  unint64_t v5 = [v4 indexForPage:v3];

  IMP v6 = CGPDFSelectionGetClientProperty();

  BOOL v7 = [v6 document];
  unint64_t v8 = [v7 indexForPage:v6];

  if (v5 < v8) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v5 > v8;
  }

  return v9;
}

uint64_t _sortPageRanges(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = [v3 page];
  IMP v6 = [v5 document];

  BOOL v7 = [v3 page];
  unint64_t v8 = [v6 indexForPage:v7];

  uint64_t v9 = [v4 page];
  int64_t v10 = [v9 document];

  double v11 = [v4 page];
  unint64_t v12 = [v10 indexForPage:v11];

  if (v8 >= v12)
  {
    if (v8 > v12)
    {
      uint64_t v13 = 1;
    }
    else
    {
      unint64_t v14 = [v3 range];
      unint64_t v15 = [v4 range];
      if (v14 < v15) {
        uint64_t v13 = -1;
      }
      else {
        uint64_t v13 = v14 != v15;
      }
    }
  }
  else
  {
    uint64_t v13 = -1;
  }

  return v13;
}

void sub_214401350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2144076CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_21440B4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_21440B618(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t PDFView._intelligenceCollectContent(in:collector:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v173 = sub_2144176B8();
  uint64_t v172 = *(void *)(v173 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v170 = (char *)&v159 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = sub_2144176E8();
  uint64_t v169 = *(void *)(v171 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v168 = (char *)&v159 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_2144176C8();
  uint64_t v166 = *(void *)(v167 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v165 = (char *)&v159 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v188 = sub_2144175A8();
  uint64_t v187 = *(void *)(v188 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v186 = (char *)&v159 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v197 = sub_214417628();
  uint64_t v15 = *(void *)(v197 - 8);
  uint64_t v16 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v182 = (char *)&v159 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v178 = (char *)&v159 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780A968);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  v192 = (char *)&v159 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  v175 = (char *)&v159 - v22;
  v195 = (void *)sub_214417508();
  uint64_t v184 = *(v195 - 1);
  uint64_t v23 = MEMORY[0x270FA5388](v195);
  v174 = (char *)&v159 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v180 = (char *)&v159 - v26;
  MEMORY[0x270FA5388](v25);
  v160 = (char *)&v159 - v27;
  v204 = (void *)sub_2144176A8();
  uint64_t v203 = *(v204 - 1);
  MEMORY[0x270FA5388](v204);
  v179 = (char *)&v159 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_214417658();
  uint64_t v191 = *(void *)(v29 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  v190 = (char *)&v159 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  v189 = (char *)&v159 - v32;
  uint64_t v202 = sub_214417688();
  uint64_t v201 = *(void *)(v202 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v202);
  v177 = (char *)&v159 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = v34;
  MEMORY[0x270FA5388](v33);
  v209 = (char *)&v159 - v35;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780A970);
  uint64_t v162 = *(void *)(v36 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v36 - 8);
  uint64_t v199 = (uint64_t)&v159 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v206 = (uint64_t)&v159 - v39;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780A978);
  uint64_t v41 = MEMORY[0x270FA5388](v40 - 8);
  long long v43 = (char *)&v159 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v41);
  double v45 = (char *)&v159 - v44;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780A980);
  MEMORY[0x270FA5388](v46 - 8);
  CGRect v48 = (char *)&v159 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v207 = sub_214417578();
  uint64_t v200 = *(void *)(v207 - 8);
  uint64_t v49 = MEMORY[0x270FA5388](v207);
  v198 = (char *)&v159 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = v50;
  MEMORY[0x270FA5388](v49);
  v208 = (char *)&v159 - v51;
  uint64_t v52 = sub_2144177A8();
  uint64_t v205 = sub_214417798();
  uint64_t v196 = v52;
  sub_214417788();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v53 = objc_msgSend(v5, sel_document);
  if (!v53)
  {
    v219.receiver = v5;
    v219.super_class = (Class)PDFView;
    objc_msgSendSuper2(&v219, sel__intelligenceCollectContentIn_collector_, a1, a2, a3, a4, a5);
    return swift_release();
  }
  id v54 = v53;
  id v55 = objc_msgSend(v53, sel_documentAttributes);
  uint64_t v193 = a1;
  id v185 = v54;
  id v194 = v5;
  if (!v55)
  {
    long long v217 = 0u;
    long long v218 = 0u;
LABEL_14:
    sub_214415268((uint64_t)&v217, &qword_26780A988);
    goto LABEL_15;
  }
  double v56 = v55;
  uint64_t v57 = sub_2144176F8();

  v210 = @"Title";
  type metadata accessor for PDFDocumentAttribute();
  sub_214416368(&qword_26780A9B8, (void (*)(uint64_t))type metadata accessor for PDFDocumentAttribute);
  id v58 = @"Title";
  sub_214417808();
  if (*(void *)(v57 + 16) && (unint64_t v59 = sub_21441619C((uint64_t)&aBlock), (v60 & 1) != 0))
  {
    sub_214416234(*(void *)(v57 + 56) + 32 * v59, (uint64_t)&v217);
  }
  else
  {
    long long v217 = 0u;
    long long v218 = 0u;
  }
  id v54 = v185;
  sub_2144161E0((uint64_t)&aBlock);
  swift_bridgeObjectRelease();
  if (!*((void *)&v218 + 1)) {
    goto LABEL_14;
  }
  if (swift_dynamicCast())
  {
    v181 = aBlock;
    uint64_t v183 = v212;
    goto LABEL_16;
  }
LABEL_15:
  v181 = (char *)sub_214417638();
  uint64_t v183 = v61;
LABEL_16:
  sub_214417698();
  (*(void (**)(char *, void, uint64_t, void *))(v203 + 56))(v48, 0, 1, v204);
  uint64_t v62 = sub_214417528();
  double v63 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56);
  v63(v45, 1, 1, v62);
  v63(v43, 1, 1, v62);
  sub_214417568();
  sub_214417798();
  sub_214417788();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v64 = v194;
  id v65 = objc_msgSend(v194, sel_document);
  if (!v65) {
    goto LABEL_23;
  }
  double v66 = v65;
  id v67 = objc_msgSend(v64, sel_visiblePages);
  sub_214416584(0, &qword_26780A9E8);
  unint64_t v68 = sub_214417768();

  id v69 = v66;
  double v70 = sub_214417194(v68, v69);

  swift_bridgeObjectRelease();
  aBlock = v70;
  swift_bridgeObjectRetain();
  sub_2144165C0(&aBlock);
  swift_bridgeObjectRelease();
  uint64_t v71 = *((void *)aBlock + 2);
  if (!v71)
  {
    swift_release();
    id v64 = v194;
    goto LABEL_25;
  }
  uint64_t v72 = *((void *)aBlock + 4);
  uint64_t v73 = *(void *)&aBlock[8 * v71 + 24];
  swift_release();
  uint64_t v74 = v73 + 1;
  if (!__OFADD__(v73, 1))
  {
    id v64 = v194;
    if (v74 < v72)
    {
      __break(1u);
LABEL_23:
      uint64_t v75 = sub_2144175C8();
      uint64_t v76 = v206;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v206, 1, 1, v75);
LABEL_26:
      swift_release();
      sub_214417558();
      __swift_project_boxed_opaque_existential_1(&aBlock, (uint64_t)v214);
      sub_214417648();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
      long long v78 = v189;
      sub_214417668();
      uint64_t v79 = v191;
      double v80 = v190;
      (*(void (**)(char *, void, uint64_t))(v191 + 104))(v190, *MEMORY[0x263F81BD0], v29);
      sub_214416368(&qword_26780A990, MEMORY[0x263F81BF8]);
      char v81 = sub_214417708();
      double v82 = *(void (**)(char *, uint64_t))(v79 + 8);
      v82(v80, v29);
      v82(v78, v29);
      uint64_t v83 = (uint64_t)v192;
      uint64_t v176 = v15;
      if ((v81 & 1) == 0)
      {
        CGAffineTransform v84 = v179;
        sub_214417698();
        char v85 = sub_214417678();
        (*(void (**)(char *, void *))(v203 + 8))(v84, v204);
        if (v85)
        {
          id v86 = objc_msgSend(v64, sel_undoManager);
          CGAffineTransform v87 = v195;
          if (v86)
          {
            CGAffineTransform v88 = v86;
            uint64_t v89 = v15;
            unsigned __int8 v90 = objc_msgSend(v86, sel_canUndo);

            uint64_t v91 = (uint64_t)v175;
            if (v90) {
              goto LABEL_46;
            }
          }
          else
          {
            uint64_t v89 = v15;
            sub_214417798();
            sub_214417788();
            if ((swift_task_isCurrentExecutor() & 1) == 0) {
              swift_task_reportUnexpectedExecutor();
            }
            swift_release();
            uint64_t v91 = (uint64_t)v175;
          }
          id v114 = objc_msgSend(v54, sel_documentURL);
          if (v114)
          {
            v115 = v114;
            v116 = v180;
            sub_2144174F8();

            uint64_t v117 = v184;
            v118 = *(void (**)(uint64_t, char *, void *))(v184 + 32);
            v118(v91, v116, v87);
            (*(void (**)(uint64_t, void, uint64_t, void *))(v117 + 56))(v91, 0, 1, v87);
            if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v117 + 48))(v91, 1, v87) != 1)
            {
              v119 = v160;
              v118((uint64_t)v160, (char *)v91, v87);
              uint64_t v120 = v201;
              (*(void (**)(char *, char *, uint64_t))(v201 + 16))(v177, v209, v202);
              (*(void (**)(char *, char *, void *))(v117 + 16))(v116, v119, v87);
              uint64_t v121 = v200;
              (*(void (**)(char *, char *, uint64_t))(v200 + 16))(v198, v208, v207);
              v122 = v178;
              sub_2144175F8();
              sub_214415200(v206, v199);
              sub_2144175D8();
              uint64_t v123 = v89;
              v124 = v186;
              uint64_t v125 = v197;
              (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v186, v122, v197);
              uint64_t v126 = v187;
              uint64_t v127 = v188;
              (*(void (**)(char *, void, uint64_t))(v187 + 104))(v124, *MEMORY[0x263F81A88], v188);
              sub_214417548();

              (*(void (**)(char *, uint64_t))(v126 + 8))(v124, v127);
              (*(void (**)(char *, uint64_t))(v123 + 8))(v122, v125);
              (*(void (**)(char *, void *))(v117 + 8))(v160, v195);
              (*(void (**)(char *, uint64_t))(v120 + 8))(v209, v202);
              sub_214415268(v206, &qword_26780A970);
              (*(void (**)(char *, uint64_t))(v121 + 8))(v208, v207);
              return swift_release();
            }
          }
          else
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v184 + 56))(v91, 1, 1, v87);
          }
          sub_214415268(v91, &qword_26780A968);
          id v54 = v185;
LABEL_46:
          v195 = *(void **)(v200 + 16);
          v128 = v198;
          v129 = v208;
          ((void (*)(char *, char *, uint64_t))v195)(v198, v208, v207);
          swift_bridgeObjectRetain();
          v130 = v178;
          sub_214417618();
          uint64_t v131 = v206;
          v132 = v54;
          uint64_t v133 = v199;
          sub_214415200(v206, v199);
          sub_2144175D8();
          v134 = v186;
          (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v186, v130, v197);
          uint64_t v135 = v187;
          uint64_t v136 = v188;
          (*(void (**)(char *, void, uint64_t))(v187 + 104))(v134, *MEMORY[0x263F81A88], v188);
          uint64_t v196 = sub_214417538();
          (*(void (**)(char *, uint64_t))(v135 + 8))(v134, v136);
          sub_214416584(0, &qword_26780A998);
          uint64_t v137 = v166;
          v138 = v165;
          uint64_t v139 = v167;
          (*(void (**)(char *, void, uint64_t))(v166 + 104))(v165, *MEMORY[0x263F8F060], v167);
          v204 = v132;
          uint64_t v203 = sub_2144177C8();
          (*(void (**)(char *, uint64_t))(v137 + 8))(v138, v139);
          uint64_t v140 = v201;
          uint64_t v141 = v202;
          (*(void (**)(char *, char *, uint64_t))(v201 + 16))(v177, v209, v202);
          uint64_t v142 = v207;
          ((void (*)(char *, char *, uint64_t))v195)(v128, v129, v207);
          sub_214415200(v131, v133);
          unint64_t v143 = (*(unsigned __int8 *)(v140 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80);
          unint64_t v144 = (v164 + v143 + 7) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v145 = v200;
          unint64_t v146 = (*(unsigned __int8 *)(v200 + 80) + v144 + 16) & ~(unint64_t)*(unsigned __int8 *)(v200 + 80);
          unint64_t v147 = (v161 + *(unsigned __int8 *)(v162 + 80) + v146) & ~(unint64_t)*(unsigned __int8 *)(v162 + 80);
          unint64_t v148 = (v163 + v147 + 7) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v149 = swift_allocObject();
          *(void *)(v149 + 16) = v204;
          (*(void (**)(unint64_t, char *, uint64_t))(v140 + 32))(v149 + v143, v177, v141);
          v150 = (char **)(v149 + v144);
          v151 = (char *)v183;
          *v150 = v181;
          v150[1] = v151;
          uint64_t v152 = v145;
          (*(void (**)(unint64_t, char *, uint64_t))(v145 + 32))(v149 + v146, v198, v142);
          sub_214415928(v199, v149 + v147);
          *(void *)(v149 + v14_Block_object_dispose(&STACK[0x200], 8) = v196;
          v215 = sub_214415990;
          uint64_t v216 = v149;
          aBlock = (char *)MEMORY[0x263EF8330];
          uint64_t v212 = 1107296256;
          v213 = sub_214415B08;
          v214 = &block_descriptor;
          v153 = _Block_copy(&aBlock);
          v154 = v204;
          swift_retain();
          v155 = v168;
          sub_2144176D8();
          *(void *)&long long v217 = MEMORY[0x263F8EE78];
          sub_214416368(&qword_26780A9A0, MEMORY[0x263F8F030]);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26780A9A8);
          sub_214415B64();
          v156 = v170;
          uint64_t v157 = v173;
          sub_2144177D8();
          v158 = (void *)v203;
          MEMORY[0x21669EC00](0, v155, v156, v153);
          _Block_release(v153);

          swift_release();
          (*(void (**)(char *, uint64_t))(v172 + 8))(v156, v157);
          (*(void (**)(char *, uint64_t))(v169 + 8))(v155, v171);
          (*(void (**)(char *, uint64_t))(v176 + 8))(v178, v197);
          (*(void (**)(char *, uint64_t))(v201 + 8))(v209, v202);
          sub_214415268(v206, &qword_26780A970);
          (*(void (**)(char *, uint64_t))(v152 + 8))(v208, v142);
          swift_release();
          return swift_release();
        }
      }
      id v92 = objc_msgSend(v54, sel_documentURL);
      uint64_t v94 = v207;
      v93 = v208;
      v95 = v195;
      if (v92)
      {
        v96 = v92;
        v97 = v180;
        sub_2144174F8();

        uint64_t v98 = v184;
        v99 = *(void (**)(uint64_t, char *, void *))(v184 + 32);
        v99(v83, v97, v95);
        (*(void (**)(uint64_t, void, uint64_t, void *))(v98 + 56))(v83, 0, 1, v95);
        if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v98 + 48))(v83, 1, v95) != 1)
        {
          uint64_t v100 = v98;
          uint64_t v101 = v197;
          v102 = v174;
          v99((uint64_t)v174, (char *)v83, v95);
          (*(void (**)(char *, char *, void *))(v100 + 16))(v97, v102, v95);
          uint64_t v103 = v200;
          uint64_t v104 = v94;
          v105 = v93;
          (*(void (**)(char *, char *, uint64_t))(v200 + 16))(v198, v93, v104);
          v106 = v182;
          sub_2144175E8();
          v107 = v102;
          uint64_t v76 = v206;
          (*(void (**)(char *, void *))(v100 + 8))(v107, v95);
LABEL_36:
          sub_214415200(v76, v199);
          sub_2144175D8();
          uint64_t v108 = v76;
          uint64_t v109 = v176;
          v110 = v186;
          (*(void (**)(char *, char *, uint64_t))(v176 + 16))(v186, v106, v101);
          uint64_t v111 = v187;
          uint64_t v112 = v188;
          (*(void (**)(char *, void, uint64_t))(v187 + 104))(v110, *MEMORY[0x263F81A88], v188);
          sub_214417548();

          (*(void (**)(char *, uint64_t))(v111 + 8))(v110, v112);
          (*(void (**)(char *, uint64_t))(v109 + 8))(v106, v101);
          (*(void (**)(char *, uint64_t))(v201 + 8))(v209, v202);
          sub_214415268(v108, &qword_26780A970);
          (*(void (**)(char *, uint64_t))(v103 + 8))(v105, v207);
          return swift_release();
        }
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v184 + 56))(v83, 1, 1, v195);
      }
      uint64_t v101 = v197;
      sub_214415268(v83, &qword_26780A968);
      uint64_t v103 = v200;
      (*(void (**)(char *, char *, uint64_t))(v200 + 16))(v198, v93, v94);
      v106 = v182;
      sub_214417618();
      v105 = v93;
      goto LABEL_36;
    }
LABEL_25:
    objc_msgSend(v69, sel_pageCount);
    uint64_t v76 = v206;
    sub_2144175B8();

    uint64_t v77 = sub_2144175C8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v76, 0, 1, v77);
    goto LABEL_26;
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_214415200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780A970);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_214415268(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2144152C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v39 = a4;
  uint64_t v40 = a6;
  uint64_t v37 = a5;
  uint64_t v38 = a3;
  uint64_t v36 = a2;
  uint64_t v9 = sub_2144175A8();
  uint64_t v42 = *(void *)(v9 - 8);
  uint64_t v43 = v9;
  MEMORY[0x270FA5388]();
  uint64_t v41 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780A970);
  MEMORY[0x270FA5388]();
  uint64_t v35 = (uint64_t)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_214417578();
  uint64_t v12 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_214417688();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_214417628();
  uint64_t v19 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = objc_msgSend(a1, sel_dataRepresentation);
  if (!v22) {
    return sub_214417588();
  }
  uint64_t v23 = v22;
  uint64_t v24 = sub_214417518();
  uint64_t v32 = a7;
  unint64_t v26 = v25;

  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v36, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v37, v33);
  sub_2144164D4(v24, v26);
  swift_bridgeObjectRetain();
  sub_214417608();
  sub_214415200(v40, v35);
  sub_2144175D8();
  uint64_t v27 = v41;
  uint64_t v28 = v34;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v41, v21, v34);
  uint64_t v30 = v42;
  uint64_t v29 = v43;
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v27, *MEMORY[0x263F81A88], v43);
  sub_214417598();
  sub_21441652C(v24, v26);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v28);
}

uint64_t sub_2144156B0()
{
  uint64_t v1 = sub_214417688();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v17 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v3 = (v17 + 24) & ~v17;
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = sub_214417578();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v7 = (v4 + v16 + 16) & ~v16;
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780A970) - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v7 + v8 + v10) & ~v10;
  uint64_t v15 = *(void *)(v9 + 64);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  uint64_t v12 = sub_2144175C8();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v0 + v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0 + v11, v12);
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v15 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v17 | v16 | v10 | 7);
}

uint64_t sub_214415928(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780A970);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_214415990()
{
  uint64_t v1 = *(void *)(sub_214417688() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(sub_214417578() - 8);
  unint64_t v5 = (v3 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780A970) - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void **)(v0 + 16);
  uint64_t v10 = *(void *)(v0 + v3);
  uint64_t v11 = *(void *)(v0 + v3 + 8);
  uint64_t v12 = *(void *)(v0 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_2144152C4(v9, v0 + v2, v10, v11, v0 + v5, v0 + v8, v12);
}

uint64_t sub_214415B08(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_214415B64()
{
  unint64_t result = qword_26780A9B0;
  if (!qword_26780A9B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780A9A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780A9B0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for PDFDocumentAttribute()
{
  if (!qword_26780A9C0)
  {
    ForeignTypeMetadatCGFloat a = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26780A9C0);
    }
  }
}

uint64_t sub_214415D68(uint64_t a1, uint64_t a2)
{
  return sub_214415ED4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_214415D80(uint64_t a1, id *a2)
{
  uint64_t result = sub_214417728();
  *a2 = 0;
  return result;
}

uint64_t sub_214415DF8(uint64_t a1, id *a2)
{
  char v3 = sub_214417738();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_214415E78@<X0>(uint64_t *a1@<X8>)
{
  sub_214417748();
  uint64_t v2 = sub_214417718();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_214415EBC(uint64_t a1, uint64_t a2)
{
  return sub_214415ED4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_214415ED4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_214417748();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_214415F18()
{
  sub_214417748();
  sub_214417758();

  return swift_bridgeObjectRelease();
}

uint64_t sub_214415F6C()
{
  sub_214417748();
  sub_214417868();
  sub_214417758();
  uint64_t v0 = sub_214417878();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_214415FE0()
{
  uint64_t v0 = sub_214417748();
  uint64_t v2 = v1;
  if (v0 == sub_214417748() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_214417858();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_21441606C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_214417718();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2144160B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_214417748();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2144160E0(uint64_t a1)
{
  uint64_t v2 = sub_214416368(&qword_26780A9B8, (void (*)(uint64_t))type metadata accessor for PDFDocumentAttribute);
  uint64_t v3 = sub_214416368(&qword_26780A9E0, (void (*)(uint64_t))type metadata accessor for PDFDocumentAttribute);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_21441619C(uint64_t a1)
{
  uint64_t v2 = sub_2144177E8();

  return sub_2144163B0(a1, v2);
}

uint64_t sub_2144161E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_214416234(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_214416290()
{
  return sub_214416368(&qword_26780A9C8, (void (*)(uint64_t))type metadata accessor for PDFDocumentAttribute);
}

uint64_t sub_2144162D8()
{
  return sub_214416368(&qword_26780A9D0, (void (*)(uint64_t))type metadata accessor for PDFDocumentAttribute);
}

uint64_t sub_214416320()
{
  return sub_214416368(&qword_26780A9D8, (void (*)(uint64_t))type metadata accessor for PDFDocumentAttribute);
}

uint64_t sub_214416368(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2144163B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_214416478(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x21669EC40](v9, a1);
      sub_2144161E0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_214416478(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2144164D4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_21441652C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_214416584(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2144165C0(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_214417180((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_21441662C(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_21441662C(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_214417848();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_138;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v76 = 0;
      uint64_t v77 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v79 = *(void *)(v77 + 8 * i);
        uint64_t v80 = v76;
        do
        {
          uint64_t v81 = *(void *)(v77 + v80);
          if (v79 >= v81) {
            break;
          }
          if (!v77) {
            goto LABEL_142;
          }
          *(void *)(v77 + v80 + _Block_object_dispose(&STACK[0x200], 8) = v81;
          *(void *)(v77 + v80) = v79;
          v80 -= 8;
        }
        while (v80 != -8);
        v76 += 8;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_137;
    }
    uint64_t v93 = result;
    uint64_t v94 = v3;
    if (v3 > 1)
    {
      uint64_t v6 = v5 >> 1;
      uint64_t result = sub_214417778();
      *(void *)(result + 16) = v6;
      uint64_t v3 = v94;
      uint64_t v92 = result;
      v96 = (char *)(result + 32);
LABEL_13:
      uint64_t v8 = 0;
      uint64_t v9 = *v2;
      unsigned __int8 v90 = v2;
      uint64_t v91 = *v2 - 8;
      uint64_t v10 = MEMORY[0x263F8EE78];
      uint64_t v95 = *v2;
      while (1)
      {
        uint64_t v12 = v8++;
        if (v8 < v3)
        {
          uint64_t v13 = *(void *)(v9 + 8 * v8);
          uint64_t v14 = *(void *)(v9 + 8 * v12);
          uint64_t v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            uint64_t v15 = v13;
            while (1)
            {
              uint64_t v16 = *(void *)(v9 + 8 * v8);
              if (v13 < v14 == v16 >= v15) {
                break;
              }
              ++v8;
              uint64_t v15 = v16;
              if (v3 == v8)
              {
                uint64_t v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12) {
              goto LABEL_139;
            }
            if (v12 < v8)
            {
              uint64_t v17 = v8 - 1;
              uint64_t v18 = v12;
              do
              {
                if (v18 != v17)
                {
                  if (!v9) {
                    goto LABEL_145;
                  }
                  uint64_t v19 = *(void *)(v9 + 8 * v18);
                  *(void *)(v9 + 8 * v1_Block_object_dispose(&STACK[0x200], 8) = *(void *)(v9 + 8 * v17);
                  *(void *)(v9 + 8 * v17) = v19;
                }
                BOOL v58 = ++v18 < v17--;
              }
              while (v58);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12)) {
            goto LABEL_136;
          }
          if (v8 - v12 < v93)
          {
            uint64_t v20 = v12 + v93;
            if (__OFADD__(v12, v93)) {
              goto LABEL_140;
            }
            if (v20 >= v3) {
              uint64_t v20 = v3;
            }
            if (v20 < v12)
            {
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
              return result;
            }
            if (v8 != v20)
            {
              uint64_t v21 = (uint64_t *)(v91 + 8 * v8);
              do
              {
                uint64_t v22 = *(void *)(v9 + 8 * v8);
                uint64_t v23 = v12;
                uint64_t v24 = v21;
                do
                {
                  uint64_t v25 = *v24;
                  if (v22 >= *v24) {
                    break;
                  }
                  if (!v9) {
                    goto LABEL_143;
                  }
                  uint64_t *v24 = v22;
                  v24[1] = v25;
                  --v24;
                  ++v23;
                }
                while (v8 != v23);
                ++v8;
                ++v21;
              }
              while (v8 != v20);
              uint64_t v8 = v20;
            }
          }
        }
        if (v8 < v12) {
          goto LABEL_131;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_214416E78(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
          uint64_t v10 = result;
        }
        unint64_t v27 = *(void *)(v10 + 16);
        unint64_t v26 = *(void *)(v10 + 24);
        unint64_t v11 = v27 + 1;
        uint64_t v9 = v95;
        if (v27 >= v26 >> 1)
        {
          uint64_t result = (uint64_t)sub_214416E78((char *)(v26 > 1), v27 + 1, 1, (char *)v10);
          uint64_t v9 = v95;
          uint64_t v10 = result;
        }
        *(void *)(v10 + 16) = v11;
        uint64_t v28 = v10 + 32;
        uint64_t v29 = (uint64_t *)(v10 + 32 + 16 * v27);
        *uint64_t v29 = v12;
        v29[1] = v8;
        if (v27)
        {
          while (1)
          {
            unint64_t v30 = v11 - 1;
            if (v11 >= 4)
            {
              unint64_t v35 = v28 + 16 * v11;
              uint64_t v36 = *(void *)(v35 - 64);
              uint64_t v37 = *(void *)(v35 - 56);
              BOOL v41 = __OFSUB__(v37, v36);
              uint64_t v38 = v37 - v36;
              if (v41) {
                goto LABEL_120;
              }
              uint64_t v40 = *(void *)(v35 - 48);
              uint64_t v39 = *(void *)(v35 - 40);
              BOOL v41 = __OFSUB__(v39, v40);
              uint64_t v33 = v39 - v40;
              char v34 = v41;
              if (v41) {
                goto LABEL_121;
              }
              unint64_t v42 = v11 - 2;
              uint64_t v43 = (uint64_t *)(v28 + 16 * (v11 - 2));
              uint64_t v45 = *v43;
              uint64_t v44 = v43[1];
              BOOL v41 = __OFSUB__(v44, v45);
              uint64_t v46 = v44 - v45;
              if (v41) {
                goto LABEL_122;
              }
              BOOL v41 = __OFADD__(v33, v46);
              uint64_t v47 = v33 + v46;
              if (v41) {
                goto LABEL_124;
              }
              if (v47 >= v38)
              {
                id v65 = (uint64_t *)(v28 + 16 * v30);
                uint64_t v67 = *v65;
                uint64_t v66 = v65[1];
                BOOL v41 = __OFSUB__(v66, v67);
                uint64_t v68 = v66 - v67;
                if (v41) {
                  goto LABEL_130;
                }
                BOOL v58 = v33 < v68;
                goto LABEL_84;
              }
            }
            else
            {
              if (v11 != 3)
              {
                uint64_t v59 = *(void *)(v10 + 32);
                uint64_t v60 = *(void *)(v10 + 40);
                BOOL v41 = __OFSUB__(v60, v59);
                uint64_t v52 = v60 - v59;
                char v53 = v41;
                goto LABEL_78;
              }
              uint64_t v32 = *(void *)(v10 + 32);
              uint64_t v31 = *(void *)(v10 + 40);
              BOOL v41 = __OFSUB__(v31, v32);
              uint64_t v33 = v31 - v32;
              char v34 = v41;
            }
            if (v34) {
              goto LABEL_123;
            }
            unint64_t v42 = v11 - 2;
            CGRect v48 = (uint64_t *)(v28 + 16 * (v11 - 2));
            uint64_t v50 = *v48;
            uint64_t v49 = v48[1];
            BOOL v51 = __OFSUB__(v49, v50);
            uint64_t v52 = v49 - v50;
            char v53 = v51;
            if (v51) {
              goto LABEL_125;
            }
            id v54 = (uint64_t *)(v28 + 16 * v30);
            uint64_t v56 = *v54;
            uint64_t v55 = v54[1];
            BOOL v41 = __OFSUB__(v55, v56);
            uint64_t v57 = v55 - v56;
            if (v41) {
              goto LABEL_127;
            }
            if (__OFADD__(v52, v57)) {
              goto LABEL_129;
            }
            if (v52 + v57 >= v33)
            {
              BOOL v58 = v33 < v57;
LABEL_84:
              if (v58) {
                unint64_t v30 = v42;
              }
              goto LABEL_86;
            }
LABEL_78:
            if (v53) {
              goto LABEL_126;
            }
            uint64_t v61 = (uint64_t *)(v28 + 16 * v30);
            uint64_t v63 = *v61;
            uint64_t v62 = v61[1];
            BOOL v41 = __OFSUB__(v62, v63);
            uint64_t v64 = v62 - v63;
            if (v41) {
              goto LABEL_128;
            }
            if (v64 < v52) {
              goto LABEL_15;
            }
LABEL_86:
            unint64_t v69 = v30 - 1;
            if (v30 - 1 >= v11)
            {
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
              goto LABEL_141;
            }
            if (!v9) {
              goto LABEL_144;
            }
            double v70 = (uint64_t *)(v28 + 16 * v69);
            uint64_t v71 = *v70;
            uint64_t v72 = v28;
            uint64_t v73 = (void *)(v28 + 16 * v30);
            uint64_t v74 = v73[1];
            uint64_t result = sub_214416C74((char *)(v9 + 8 * *v70), (char *)(v9 + 8 * *v73), v9 + 8 * v74, v96);
            if (v1) {
              goto LABEL_114;
            }
            if (v74 < v71) {
              goto LABEL_117;
            }
            if (v30 > *(void *)(v10 + 16)) {
              goto LABEL_118;
            }
            *double v70 = v71;
            *(void *)(v72 + 16 * v69 + _Block_object_dispose(&STACK[0x200], 8) = v74;
            unint64_t v75 = *(void *)(v10 + 16);
            if (v30 >= v75) {
              goto LABEL_119;
            }
            unint64_t v11 = v75 - 1;
            uint64_t result = (uint64_t)memmove(v73, v73 + 2, 16 * (v75 - 1 - v30));
            uint64_t v28 = v72;
            *(void *)(v10 + 16) = v75 - 1;
            uint64_t v9 = v95;
            if (v75 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v11 = 1;
LABEL_15:
        uint64_t v3 = v94;
        if (v8 >= v94)
        {
          uint64_t v7 = v92;
          uint64_t v2 = v90;
          goto LABEL_103;
        }
      }
    }
    uint64_t v7 = MEMORY[0x263F8EE78];
    v96 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 == 1)
    {
      uint64_t v92 = MEMORY[0x263F8EE78];
      goto LABEL_13;
    }
    unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
    uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_103:
    uint64_t v92 = v7;
    if (v11 >= 2)
    {
      uint64_t v82 = *v2;
      do
      {
        unint64_t v83 = v11 - 2;
        if (v11 < 2) {
          goto LABEL_132;
        }
        if (!v82) {
          goto LABEL_146;
        }
        uint64_t v84 = v10;
        uint64_t v85 = v10 + 32;
        uint64_t v86 = *(void *)(v10 + 32 + 16 * v83);
        uint64_t v87 = *(void *)(v10 + 32 + 16 * (v11 - 1) + 8);
        uint64_t result = sub_214416C74((char *)(v82 + 8 * v86), (char *)(v82 + 8 * *(void *)(v85 + 16 * (v11 - 1))), v82 + 8 * v87, v96);
        if (v1) {
          break;
        }
        if (v87 < v86) {
          goto LABEL_133;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_214416F74(v84);
          uint64_t v84 = result;
        }
        if (v83 >= *(void *)(v84 + 16)) {
          goto LABEL_134;
        }
        CGAffineTransform v88 = (void *)(v84 + 32 + 16 * v83);
        *CGAffineTransform v88 = v86;
        v88[1] = v87;
        unint64_t v89 = *(void *)(v84 + 16);
        if (v11 > v89) {
          goto LABEL_135;
        }
        uint64_t result = (uint64_t)memmove((void *)(v84 + 32 + 16 * (v11 - 1)), (const void *)(v84 + 32 + 16 * v11), 16 * (v89 - v11));
        uint64_t v10 = v84;
        *(void *)(v84 + 16) = v89 - 1;
        unint64_t v11 = v89 - 1;
      }
      while (v89 > 2);
    }
LABEL_114:
    swift_bridgeObjectRelease();
    *(void *)(v92 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_214416C74(char *__dst, char *__src, unint64_t a3, char *a4)
{
  unint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 7;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[8 * v13] <= a4) {
      memmove(a4, __src, 8 * v13);
    }
    uint64_t v14 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8) {
      goto LABEL_39;
    }
    uint64_t v17 = (char *)(a3 - 8);
    uint64_t v18 = v6;
    while (1)
    {
      uint64_t v19 = v17 + 8;
      uint64_t v21 = *((void *)v18 - 1);
      v18 -= 8;
      uint64_t v20 = v21;
      if (*((void *)v14 - 1) < v21) {
        break;
      }
      uint64_t v20 = *((void *)v14 - 1);
      uint64_t v18 = v6;
      if (v19 != v14)
      {
        v14 -= 8;
LABEL_35:
        *(void *)uint64_t v17 = v20;
        goto LABEL_36;
      }
      BOOL v22 = v17 >= v14;
      v14 -= 8;
      if (v22) {
        goto LABEL_35;
      }
LABEL_36:
      if (v18 > v7)
      {
        v17 -= 8;
        uint64_t v6 = v18;
        if (v14 > v4) {
          continue;
        }
      }
      uint64_t v6 = v18;
      goto LABEL_39;
    }
    if (v19 == v6 && v17 < v6) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (a4 != __dst || &__dst[8 * v10] <= a4) {
    memmove(a4, __dst, 8 * v10);
  }
  uint64_t v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      uint64_t v15 = *(void *)v6;
      if (*(void *)v6 >= *(void *)v4) {
        break;
      }
      BOOL v16 = v7 == v6;
      v6 += 8;
      if (!v16) {
        goto LABEL_16;
      }
LABEL_17:
      v7 += 8;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_19;
      }
    }
    uint64_t v15 = *(void *)v4;
    BOOL v16 = v7 == v4;
    v4 += 8;
    if (v16) {
      goto LABEL_17;
    }
LABEL_16:
    *(void *)uint64_t v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v6 = v7;
LABEL_39:
  int64_t v23 = v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0);
  if (v6 != v4 || v6 >= &v4[v23 & 0xFFFFFFFFFFFFFFF8]) {
    memmove(v6, v4, 8 * (v23 >> 3));
  }
  return 1;
}

char *sub_214416E78(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780A9F0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_214416F74(uint64_t a1)
{
  return sub_214416E78(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_214416F88(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780A9F8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_214417084(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780A9F8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_214417180(uint64_t a1)
{
  return sub_214417084(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_214417194(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_214417828())
  {
    sub_2144177A8();
    unint64_t v4 = (char *)MEMORY[0x263F8EE78];
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x21669EC60](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      int64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      uint64_t v9 = v3;
      sub_214417798();
      sub_214417788();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v10 = objc_msgSend(a2, sel_indexForPage_, v7);
      uint64_t v11 = sub_2144174E8();

      swift_release();
      if (v10 == (id)v11)
      {
        uint64_t v3 = v9;
      }
      else
      {
        uint64_t v3 = v9;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v4 = sub_214416F88(0, *((void *)v4 + 2) + 1, 1, v4);
        }
        unint64_t v13 = *((void *)v4 + 2);
        unint64_t v12 = *((void *)v4 + 3);
        if (v13 >= v12 >> 1) {
          unint64_t v4 = sub_214416F88((char *)(v12 > 1), v13 + 1, 1, v4);
        }
        *((void *)v4 + 2) = v13 + 1;
        *(void *)&v4[8 * v13 + 32] = v10;
      }
      ++v5;
      if (v8 == v3) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
  unint64_t v4 = (char *)MEMORY[0x263F8EE78];
LABEL_21:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21441739C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getCRNormalizedQuadClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVKCFormRegionClass_block_invoke_cold_1(v0);
}

uint64_t __getVKCFormRegionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL30getVKImageAnalyzerRequestClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL30getVKImageAnalyzerRequestClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return CGBuf::CGBuf(v0);
}

uint64_t CGBuf::CGBuf()
{
  return _CGHandleAssert();
}

void ___ZL14getVKQuadClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAFInsertionManagerClass_block_invoke_cold_1(v0);
}

void __getAFInsertionManagerClass_block_invoke_cold_1()
{
}

uint64_t sub_2144174E8()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_2144174F8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_214417508()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_214417518()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_214417528()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_214417538()
{
  return MEMORY[0x270F80B58]();
}

uint64_t sub_214417548()
{
  return MEMORY[0x270F80B60]();
}

uint64_t sub_214417558()
{
  return MEMORY[0x270F80B68]();
}

uint64_t sub_214417568()
{
  return MEMORY[0x270F80B90]();
}

uint64_t sub_214417578()
{
  return MEMORY[0x270F80BB0]();
}

uint64_t sub_214417588()
{
  return MEMORY[0x270F80DC8]();
}

uint64_t sub_214417598()
{
  return MEMORY[0x270F80DD0]();
}

uint64_t sub_2144175A8()
{
  return MEMORY[0x270F80FA8]();
}

uint64_t sub_2144175B8()
{
  return MEMORY[0x270F80FC8]();
}

uint64_t sub_2144175C8()
{
  return MEMORY[0x270F80FD8]();
}

uint64_t sub_2144175D8()
{
  return MEMORY[0x270F80FE8]();
}

uint64_t sub_2144175E8()
{
  return MEMORY[0x270F80FF0]();
}

uint64_t sub_2144175F8()
{
  return MEMORY[0x270F81000]();
}

uint64_t sub_214417608()
{
  return MEMORY[0x270F81008]();
}

uint64_t sub_214417618()
{
  return MEMORY[0x270F81020]();
}

uint64_t sub_214417628()
{
  return MEMORY[0x270F81028]();
}

uint64_t sub_214417638()
{
  return MEMORY[0x270F811A0]();
}

uint64_t sub_214417648()
{
  return MEMORY[0x270F811B8]();
}

uint64_t sub_214417658()
{
  return MEMORY[0x270F811E8]();
}

uint64_t sub_214417668()
{
  return MEMORY[0x270F81300]();
}

uint64_t sub_214417678()
{
  return MEMORY[0x270F813C0]();
}

uint64_t sub_214417688()
{
  return MEMORY[0x270F81410]();
}

uint64_t sub_214417698()
{
  return MEMORY[0x270FA17B8]();
}

uint64_t sub_2144176A8()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2144176B8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2144176C8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2144176D8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2144176E8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2144176F8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_214417708()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_214417718()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_214417728()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_214417738()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_214417748()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_214417758()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_214417768()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_214417778()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_214417788()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_214417798()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2144177A8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2144177B8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2144177C8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2144177D8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2144177E8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2144177F8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_214417808()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_214417818()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_214417828()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_214417848()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_214417858()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_214417868()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_214417878()
{
  return MEMORY[0x270F9FC90]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

uint64_t CAEncodeLayerTree()
{
  return MEMORY[0x270EFB798]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x270EE43B0](alloc, str, attributes);
}

CFDictionaryRef CFAttributedStringGetAttributes(CFAttributedStringRef aStr, CFIndex loc, CFRange *effectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x270EE43F0](aStr, loc, effectiveRange);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x270EE4400](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x270EE4408](aStr);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x270EE4BD0]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x270EE5968](retstr, transform);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
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

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x270EE5B98](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x270EE5BE8](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C50]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x270EE5CC0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
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

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5D68](space);
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

uint64_t CGContextDrawDisplayList()
{
  return MEMORY[0x270EE5EF0]();
}

uint64_t CGContextDrawPDFPageWithProgressCallback()
{
  return MEMORY[0x270EE5F30]();
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x270EE5FC0](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x270EE5FC8](c);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

uint64_t CGContextGetProperty()
{
  return MEMORY[0x270EE6018]();
}

uint64_t CGContextGetType()
{
  return MEMORY[0x270EE6038]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x270EE6088](c);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x270EE60E8]();
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x270EE60F0]();
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

uint64_t CGContextSetLineWidthThreshold()
{
  return MEMORY[0x270EE6180]();
}

uint64_t CGContextSetProperty()
{
  return MEMORY[0x270EE6198]();
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t CGContextSetTextGreekingThreshold()
{
  return MEMORY[0x270EE6230]();
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
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

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x270EE62F0](url);
}

uint64_t CGDataProviderGetBytesInRanges()
{
  return MEMORY[0x270EE6300]();
}

uint64_t CGDataProviderGetProperty()
{
  return MEMORY[0x270EE6308]();
}

uint64_t CGDataProviderGetSizeOfData()
{
  return MEMORY[0x270EE6310]();
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGDataProviderSetProperty()
{
  return MEMORY[0x270EE6330]();
}

uint64_t CGDisplayListContextCreate()
{
  return MEMORY[0x270EE6340]();
}

uint64_t CGDisplayListCreate()
{
  return MEMORY[0x270EE6348]();
}

uint64_t CGDisplayListCreateWithRect()
{
  return MEMORY[0x270EE6350]();
}

uint64_t CGDisplayListDrawInContext()
{
  return MEMORY[0x270EE6358]();
}

uint64_t CGDisplayListEntryGetBoundingBox()
{
  return MEMORY[0x270EE6360]();
}

uint64_t CGDisplayListEntryGetType()
{
  return MEMORY[0x270EE6368]();
}

uint64_t CGDisplayListEntryGlyphsCopyGlyphs()
{
  return MEMORY[0x270EE6370]();
}

uint64_t CGDisplayListEntryGlyphsCopyPositions()
{
  return MEMORY[0x270EE6378]();
}

uint64_t CGDisplayListEntryGlyphsGetCTM()
{
  return MEMORY[0x270EE6380]();
}

uint64_t CGDisplayListEntryGlyphsGetCount()
{
  return MEMORY[0x270EE6388]();
}

uint64_t CGDisplayListEntryGlyphsGetFTM()
{
  return MEMORY[0x270EE6390]();
}

uint64_t CGDisplayListEntryGlyphsGetFont()
{
  return MEMORY[0x270EE6398]();
}

uint64_t CGDisplayListEntryGlyphsGetScale()
{
  return MEMORY[0x270EE63A0]();
}

uint64_t CGDisplayListEntryImageGetImage()
{
  return MEMORY[0x270EE63A8]();
}

uint64_t CGDisplayListEntryPathGetPath()
{
  return MEMORY[0x270EE63B0]();
}

uint64_t CGDisplayListEnumerateEntriesWithOptions()
{
  return MEMORY[0x270EE63B8]();
}

uint64_t CGDisplayListGetNumberOfEntries()
{
  return MEMORY[0x270EE63C0]();
}

uint64_t CGDisplayListGetNumberOfEntriesOfType()
{
  return MEMORY[0x270EE63C8]();
}

uint64_t CGDisplayListRelease()
{
  return MEMORY[0x270EE63D0]();
}

uint64_t CGDisplayListRetain()
{
  return MEMORY[0x270EE63D8]();
}

uint64_t CGDisplayListSetBoundingBox()
{
  return MEMORY[0x270EE63E0]();
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x270EE6408](font);
}

CGRect CGFontGetFontBBox(CGFontRef font)
{
  MEMORY[0x270EE6458](font);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

BOOL CGFontGetGlyphBBoxes(CGFontRef font, const CGGlyph *glyphs, size_t count, CGRect *bboxes)
{
  return MEMORY[0x270EE6470](font, glyphs, count, bboxes);
}

uint64_t CGFontGetGlyphsForUnichars()
{
  return MEMORY[0x270EE6480]();
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return MEMORY[0x270EE64B0](font);
}

uint64_t CGIOSurfaceContextCreate()
{
  return MEMORY[0x270EE66B8]();
}

uint64_t CGIOSurfaceContextCreateWithOptions()
{
  return MEMORY[0x270EE66C0]();
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x270EF4ED0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
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

CFStringRef CGImageMetadataCopyStringValueWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CFStringRef)MEMORY[0x270EF4F60](metadata, parent, path);
}

CGImageMetadataRef CGImageMetadataCreateFromXMPData(CFDataRef data)
{
  return (CGImageMetadataRef)MEMORY[0x270EF4F78](data);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F80]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F88](metadata);
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x270EF4F90](metadata, options);
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

BOOL CGImageMetadataSetValueWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CFTypeRef value)
{
  return MEMORY[0x270EF4FC0](metadata, parent, path, value);
}

CFStringRef CGImageMetadataTagCopyPrefix(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x270EF4FD0](tag);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

uint64_t CGPDFAnnotationCreate()
{
  return MEMORY[0x270EE6988]();
}

uint64_t CGPDFAnnotationGetCGPDFDictionary()
{
  return MEMORY[0x270EE6990]();
}

uint64_t CGPDFAnnotationIsPristine()
{
  return MEMORY[0x270EE69A0]();
}

uint64_t CGPDFAnnotationIsVersioned()
{
  return MEMORY[0x270EE69A8]();
}

uint64_t CGPDFAnnotationSetAnnotationForKey()
{
  return MEMORY[0x270EE69B0]();
}

uint64_t CGPDFAnnotationSetBurnIn()
{
  return MEMORY[0x270EE69B8]();
}

uint64_t CGPDFAppenderCreateCFObject()
{
  return MEMORY[0x270EE69C0]();
}

void CGPDFArrayApplyBlock(CGPDFArrayRef array, CGPDFArrayApplierBlock block, void *info)
{
}

BOOL CGPDFArrayGetArray(CGPDFArrayRef array, size_t index, CGPDFArrayRef *value)
{
  return MEMORY[0x270EE69D0](array, index, value);
}

size_t CGPDFArrayGetCount(CGPDFArrayRef array)
{
  return MEMORY[0x270EE69D8](array);
}

BOOL CGPDFArrayGetDictionary(CGPDFArrayRef array, size_t index, CGPDFDictionaryRef *value)
{
  return MEMORY[0x270EE69E0](array, index, value);
}

BOOL CGPDFArrayGetInteger(CGPDFArrayRef array, size_t index, CGPDFInteger *value)
{
  return MEMORY[0x270EE69E8](array, index, value);
}

BOOL CGPDFArrayGetName(CGPDFArrayRef array, size_t index, const char **value)
{
  return MEMORY[0x270EE69F0](array, index, value);
}

BOOL CGPDFArrayGetNull(CGPDFArrayRef array, size_t index)
{
  return MEMORY[0x270EE69F8](array, index);
}

BOOL CGPDFArrayGetNumber(CGPDFArrayRef array, size_t index, CGPDFReal *value)
{
  return MEMORY[0x270EE6A00](array, index, value);
}

BOOL CGPDFArrayGetObject(CGPDFArrayRef array, size_t index, CGPDFObjectRef *value)
{
  return MEMORY[0x270EE6A08](array, index, value);
}

BOOL CGPDFArrayGetString(CGPDFArrayRef array, size_t index, CGPDFStringRef *value)
{
  return MEMORY[0x270EE6A10](array, index, value);
}

uint64_t CGPDFArrayRelease()
{
  return MEMORY[0x270EE6A18]();
}

uint64_t CGPDFArrayRetain()
{
  return MEMORY[0x270EE6A20]();
}

CGPDFContentStreamRef CGPDFContentStreamCreateWithPage(CGPDFPageRef page)
{
  return (CGPDFContentStreamRef)MEMORY[0x270EE6A28](page);
}

CGPDFContentStreamRef CGPDFContentStreamCreateWithStream(CGPDFStreamRef stream, CGPDFDictionaryRef streamResources, CGPDFContentStreamRef parent)
{
  return (CGPDFContentStreamRef)MEMORY[0x270EE6A30](stream, streamResources, parent);
}

CGPDFObjectRef CGPDFContentStreamGetResource(CGPDFContentStreamRef cs, const char *category, const char *name)
{
  return (CGPDFObjectRef)MEMORY[0x270EE6A38](cs, category, name);
}

void CGPDFContentStreamRelease(CGPDFContentStreamRef cs)
{
}

uint64_t CGPDFContextAddAnnotation()
{
  return MEMORY[0x270EE6A48]();
}

uint64_t CGPDFContextAddCatalogEntry()
{
  return MEMORY[0x270EE6A50]();
}

void CGPDFContextAddDocumentMetadata(CGContextRef context, CFDataRef metadata)
{
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

uint64_t CGPDFContextSetIDTree()
{
  return MEMORY[0x270EE6AB0]();
}

uint64_t CGPDFContextSetParentTree()
{
  return MEMORY[0x270EE6AB8]();
}

uint64_t CGPDFContextSetRedactionPath()
{
  return MEMORY[0x270EE6AC0]();
}

void CGPDFDictionaryApplyBlock(CGPDFDictionaryRef dict, CGPDFDictionaryApplierBlock block, void *info)
{
}

void CGPDFDictionaryApplyFunction(CGPDFDictionaryRef dict, CGPDFDictionaryApplierFunction function, void *info)
{
}

BOOL CGPDFDictionaryGetArray(CGPDFDictionaryRef dict, const char *key, CGPDFArrayRef *value)
{
  return MEMORY[0x270EE6AE0](dict, key, value);
}

BOOL CGPDFDictionaryGetBoolean(CGPDFDictionaryRef dict, const char *key, CGPDFBoolean *value)
{
  return MEMORY[0x270EE6AE8](dict, key, value);
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

uint64_t CGPDFDictionaryGetObjectReference()
{
  return MEMORY[0x270EE6B18]();
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

uint64_t CGPDFDictionaryGetUnresolvedObject()
{
  return MEMORY[0x270EE6B38]();
}

uint64_t CGPDFDocumentAppendDocumentInfo()
{
  return MEMORY[0x270EE6B40]();
}

uint64_t CGPDFDocumentAppendMetadata()
{
  return MEMORY[0x270EE6B48]();
}

uint64_t CGPDFDocumentAuthenticateOwnerPassword()
{
  return MEMORY[0x270EE6B50]();
}

uint64_t CGPDFDocumentAuthenticateUserPassword()
{
  return MEMORY[0x270EE6B58]();
}

uint64_t CGPDFDocumentCopyEncryptionKey()
{
  return MEMORY[0x270EE6B60]();
}

uint64_t CGPDFDocumentCopyHashedOwnerPassword()
{
  return MEMORY[0x270EE6B68]();
}

uint64_t CGPDFDocumentCopyHashedUserPassword()
{
  return MEMORY[0x270EE6B70]();
}

uint64_t CGPDFDocumentCopyPage()
{
  return MEMORY[0x270EE6B78]();
}

uint64_t CGPDFDocumentCopyToConsumerWithChanges()
{
  return MEMORY[0x270EE6B80]();
}

uint64_t CGPDFDocumentCreateLinearizedRangesForPage()
{
  return MEMORY[0x270EE6B88]();
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6B90](provider);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6B98](url);
}

uint64_t CGPDFDocumentExchangePagesAtIndices()
{
  return MEMORY[0x270EE6BB0]();
}

CGPDFAccessPermissions CGPDFDocumentGetAccessPermissions(CGPDFDocumentRef document)
{
  return MEMORY[0x270EE6BB8](document);
}

CGPDFDictionaryRef CGPDFDocumentGetCatalog(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x270EE6BC0](document);
}

uint64_t CGPDFDocumentGetDataProvider()
{
  return MEMORY[0x270EE6BC8]();
}

uint64_t CGPDFDocumentGetDestination()
{
  return MEMORY[0x270EE6BD0]();
}

uint64_t CGPDFDocumentGetEncryptMetadata()
{
  return MEMORY[0x270EE6BD8]();
}

uint64_t CGPDFDocumentGetEncryptionVersion()
{
  return MEMORY[0x270EE6BE0]();
}

CGPDFArrayRef CGPDFDocumentGetID(CGPDFDocumentRef document)
{
  return (CGPDFArrayRef)MEMORY[0x270EE6BE8](document);
}

CGPDFDictionaryRef CGPDFDocumentGetInfo(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x270EE6BF0](document);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x270EE6BF8](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x270EE6C00](document, pageNumber);
}

uint64_t CGPDFDocumentGetPageNoCreate()
{
  return MEMORY[0x270EE6C08]();
}

uint64_t CGPDFDocumentGetPageNumberForPageDictionary()
{
  return MEMORY[0x270EE6C10]();
}

uint64_t CGPDFDocumentGetRawPermissions()
{
  return MEMORY[0x270EE6C18]();
}

void CGPDFDocumentGetVersion(CGPDFDocumentRef document, int *majorVersion, int *minorVersion)
{
}

uint64_t CGPDFDocumentGetXRef()
{
  return MEMORY[0x270EE6C28]();
}

uint64_t CGPDFDocumentInsertPageAtIndex()
{
  return MEMORY[0x270EE6C30]();
}

BOOL CGPDFDocumentIsEncrypted(CGPDFDocumentRef document)
{
  return MEMORY[0x270EE6C38](document);
}

BOOL CGPDFDocumentIsUnlocked(CGPDFDocumentRef document)
{
  return MEMORY[0x270EE6C50](document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

uint64_t CGPDFDocumentRemovePageAtIndex()
{
  return MEMORY[0x270EE6C60]();
}

CGPDFDocumentRef CGPDFDocumentRetain(CGPDFDocumentRef document)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6C68](document);
}

BOOL CGPDFDocumentUnlockWithPassword(CGPDFDocumentRef document, const char *password)
{
  return MEMORY[0x270EE6C70](document, password);
}

uint64_t CGPDFDrawingContextCreateWithStream()
{
  return MEMORY[0x270EE6C78]();
}

uint64_t CGPDFDrawingContextDrawWithContentTypes()
{
  return MEMORY[0x270EE6C88]();
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

uint64_t CGPDFGStateConcatCTM()
{
  return MEMORY[0x270EE6CF0]();
}

uint64_t CGPDFGStateGetCTM()
{
  return MEMORY[0x270EE6CF8]();
}

uint64_t CGPDFLayoutCreateSelectionAtPoint()
{
  return MEMORY[0x270F1B520]();
}

uint64_t CGPDFLayoutCreateString()
{
  return MEMORY[0x270F1B528]();
}

uint64_t CGPDFLayoutGetCharacterBounds()
{
  return MEMORY[0x270F1B530]();
}

uint64_t CGPDFLayoutGetCharacterUnicode()
{
  return MEMORY[0x270F1B538]();
}

uint64_t CGPDFLayoutGetRootNode()
{
  return MEMORY[0x270F1B540]();
}

uint64_t CGPDFLayoutRelease()
{
  return MEMORY[0x270F1B548]();
}

uint64_t CGPDFLayoutRetain()
{
  return MEMORY[0x270F1B550]();
}

uint64_t CGPDFNameCreate()
{
  return MEMORY[0x270EE6D00]();
}

uint64_t CGPDFNodeGetBounds()
{
  return MEMORY[0x270F1B558]();
}

uint64_t CGPDFNodeGetNodeContainingPoint()
{
  return MEMORY[0x270F1B560]();
}

CGPDFObjectType CGPDFObjectGetType(CGPDFObjectRef object)
{
  return MEMORY[0x270EE6D08](object);
}

BOOL CGPDFObjectGetValue(CGPDFObjectRef object, CGPDFObjectType type, void *value)
{
  return MEMORY[0x270EE6D10](object, *(void *)&type, value);
}

CGPDFOperatorTableRef CGPDFOperatorTableCreate(void)
{
  return (CGPDFOperatorTableRef)MEMORY[0x270EE6D18]();
}

void CGPDFOperatorTableRelease(CGPDFOperatorTableRef table)
{
}

void CGPDFOperatorTableSetCallback(CGPDFOperatorTableRef table, const char *name, CGPDFOperatorCallback callback)
{
}

uint64_t CGPDFPageAddAnnotation()
{
  return MEMORY[0x270EE6D30]();
}

uint64_t CGPDFPageContainsWideGamutContent()
{
  return MEMORY[0x270EE6D38]();
}

uint64_t CGPDFPageCopyBackgroundColorHint()
{
  return MEMORY[0x270EE6D40]();
}

uint64_t CGPDFPageCopyPageLabel()
{
  return MEMORY[0x270EE6D48]();
}

uint64_t CGPDFPageCopyPageLayout()
{
  return MEMORY[0x270EE6D50]();
}

uint64_t CGPDFPageCopyString()
{
  return MEMORY[0x270EE6D60]();
}

uint64_t CGPDFPageCreateWithImage()
{
  return MEMORY[0x270EE6D70]();
}

uint64_t CGPDFPageEnumerateAnnotations()
{
  return MEMORY[0x270EE6D78]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CGPDFDictionaryRef CGPDFPageGetDictionary(CGPDFPageRef page)
{
  return (CGPDFDictionaryRef)MEMORY[0x270EE6D88](page);
}

CGPDFDocumentRef CGPDFPageGetDocument(CGPDFPageRef page)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6D90](page);
}

uint64_t CGPDFPageGetLayout()
{
  return MEMORY[0x270F1B568]();
}

size_t CGPDFPageGetPageNumber(CGPDFPageRef page)
{
  return MEMORY[0x270EE6DA0](page);
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x270EE6DA8](page);
}

uint64_t CGPDFPageGetThumbnail()
{
  return MEMORY[0x270EE6DB0]();
}

uint64_t CGPDFPageInsertTableDescriptions()
{
  return MEMORY[0x270EE6DB8]();
}

uint64_t CGPDFPageLayoutGetAreaOfInterestAtPoint()
{
  return MEMORY[0x270EE6DC0]();
}

uint64_t CGPDFPageLayoutGetCharacterSelectionBoundingBox()
{
  return MEMORY[0x270EE6DC8]();
}

uint64_t CGPDFPageLayoutGetColumnBoundsAtPointWithCompletion()
{
  return MEMORY[0x270EE6DD0]();
}

uint64_t CGPDFPageLayoutGetStringRangeIndexNearestPoint()
{
  return MEMORY[0x270EE6DD8]();
}

uint64_t CGPDFPageLayoutGetTextRangeIndexAtPoint()
{
  return MEMORY[0x270EE6DE0]();
}

void CGPDFPageRelease(CGPDFPageRef page)
{
}

uint64_t CGPDFPageRemoveAnnotation()
{
  return MEMORY[0x270EE6DF0]();
}

uint64_t CGPDFPageRemoveLayout()
{
  return MEMORY[0x270F1B570]();
}

uint64_t CGPDFPageRemoveProperty()
{
  return MEMORY[0x270EE6DF8]();
}

CGPDFPageRef CGPDFPageRetain(CGPDFPageRef page)
{
  return (CGPDFPageRef)MEMORY[0x270EE6E00](page);
}

uint64_t CGPDFPageSetBoxRect()
{
  return MEMORY[0x270EE6E08]();
}

uint64_t CGPDFPageSetExtraContentStream()
{
  return MEMORY[0x270EE6E10]();
}

uint64_t CGPDFPageSetProperty()
{
  return MEMORY[0x270EE6E18]();
}

uint64_t CGPDFPageSetRotationAngle()
{
  return MEMORY[0x270EE6E20]();
}

uint64_t CGPDFPageSortAnnotations()
{
  return MEMORY[0x270EE6E28]();
}

uint64_t CGPDFPageSubstituteAnnotationDictionary()
{
  return MEMORY[0x270EE6E30]();
}

uint64_t CGPDFRStateCreate()
{
  return MEMORY[0x270EE6E38]();
}

uint64_t CGPDFRStateCreateCopy()
{
  return MEMORY[0x270EE6E40]();
}

uint64_t CGPDFRStateGRestore()
{
  return MEMORY[0x270EE6E48]();
}

uint64_t CGPDFRStateGSave()
{
  return MEMORY[0x270EE6E50]();
}

uint64_t CGPDFRStateGetGState()
{
  return MEMORY[0x270EE6E58]();
}

uint64_t CGPDFRStateRelease()
{
  return MEMORY[0x270EE6E60]();
}

CGPDFScannerRef CGPDFScannerCreate(CGPDFContentStreamRef cs, CGPDFOperatorTableRef table, void *info)
{
  return (CGPDFScannerRef)MEMORY[0x270EE6E68](cs, table, info);
}

CGPDFContentStreamRef CGPDFScannerGetContentStream(CGPDFScannerRef scanner)
{
  return (CGPDFContentStreamRef)MEMORY[0x270EE6E70](scanner);
}

BOOL CGPDFScannerPopArray(CGPDFScannerRef scanner, CGPDFArrayRef *value)
{
  return MEMORY[0x270EE6E78](scanner, value);
}

BOOL CGPDFScannerPopName(CGPDFScannerRef scanner, const char **value)
{
  return MEMORY[0x270EE6E80](scanner, value);
}

BOOL CGPDFScannerPopNumber(CGPDFScannerRef scanner, CGPDFReal *value)
{
  return MEMORY[0x270EE6E88](scanner, value);
}

BOOL CGPDFScannerPopString(CGPDFScannerRef scanner, CGPDFStringRef *value)
{
  return MEMORY[0x270EE6E90](scanner, value);
}

void CGPDFScannerRelease(CGPDFScannerRef scanner)
{
}

BOOL CGPDFScannerScan(CGPDFScannerRef scanner)
{
  return MEMORY[0x270EE6EA0](scanner);
}

void CGPDFScannerStop(CGPDFScannerRef s)
{
}

uint64_t CGPDFSelectionAddSelection()
{
  return MEMORY[0x270F1B578]();
}

uint64_t CGPDFSelectionCreateAtPointWithOptions()
{
  return MEMORY[0x270F1B580]();
}

uint64_t CGPDFSelectionCreateAttributedString()
{
  return MEMORY[0x270F1B588]();
}

uint64_t CGPDFSelectionCreateBetweenPointsWithOptions()
{
  return MEMORY[0x270F1B590]();
}

uint64_t CGPDFSelectionCreateForRange()
{
  return MEMORY[0x270F1B5A0]();
}

uint64_t CGPDFSelectionCreateForStringRange()
{
  return MEMORY[0x270F1B5A8]();
}

uint64_t CGPDFSelectionCreateFromPoint()
{
  return MEMORY[0x270F1B5B0]();
}

uint64_t CGPDFSelectionCreateFromSelection()
{
  return MEMORY[0x270F1B5B8]();
}

uint64_t CGPDFSelectionCreateInRect()
{
  return MEMORY[0x270F1B5C0]();
}

uint64_t CGPDFSelectionCreateSelectionsByLine()
{
  return MEMORY[0x270F1B5C8]();
}

uint64_t CGPDFSelectionCreateString()
{
  return MEMORY[0x270F1B5D0]();
}

uint64_t CGPDFSelectionCreateToPoint()
{
  return MEMORY[0x270F1B5D8]();
}

uint64_t CGPDFSelectionEnumerateRectsAndTransforms()
{
  return MEMORY[0x270EE6EB0]();
}

uint64_t CGPDFSelectionEqualToSelection()
{
  return MEMORY[0x270F1B5E0]();
}

uint64_t CGPDFSelectionExtendAtEnd()
{
  return MEMORY[0x270F1B5E8]();
}

uint64_t CGPDFSelectionExtendAtStart()
{
  return MEMORY[0x270F1B5F0]();
}

uint64_t CGPDFSelectionGetBounds()
{
  return MEMORY[0x270F1B5F8]();
}

uint64_t CGPDFSelectionGetClientProperty()
{
  return MEMORY[0x270F1B600]();
}

uint64_t CGPDFSelectionGetNumberOfRectsAndTransforms()
{
  return MEMORY[0x270F1B608]();
}

uint64_t CGPDFSelectionGetNumberOfStringRanges()
{
  return MEMORY[0x270F1B610]();
}

uint64_t CGPDFSelectionGetPage()
{
  return MEMORY[0x270F1B618]();
}

uint64_t CGPDFSelectionGetRectAndTransform()
{
  return MEMORY[0x270F1B620]();
}

uint64_t CGPDFSelectionGetStartIndex()
{
  return MEMORY[0x270F1B628]();
}

uint64_t CGPDFSelectionGetStringRange()
{
  return MEMORY[0x270F1B630]();
}

uint64_t CGPDFSelectionGetTextRange()
{
  return MEMORY[0x270F1B638]();
}

uint64_t CGPDFSelectionIsEmpty()
{
  return MEMORY[0x270F1B640]();
}

uint64_t CGPDFSelectionIsStandaloneGraphic()
{
  return MEMORY[0x270F1B648]();
}

uint64_t CGPDFSelectionRelease()
{
  return MEMORY[0x270F1B650]();
}

uint64_t CGPDFSelectionSetClientProperty()
{
  return MEMORY[0x270F1B658]();
}

CFDataRef CGPDFStreamCopyData(CGPDFStreamRef stream, CGPDFDataFormat *format)
{
  return (CFDataRef)MEMORY[0x270EE6EB8](stream, format);
}

CGPDFDictionaryRef CGPDFStreamGetDictionary(CGPDFStreamRef stream)
{
  return (CGPDFDictionaryRef)MEMORY[0x270EE6EC0](stream);
}

CFDateRef CGPDFStringCopyDate(CGPDFStringRef string)
{
  return (CFDateRef)MEMORY[0x270EE6EC8](string);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x270EE6ED0](string);
}

const unsigned __int8 *__cdecl CGPDFStringGetBytePtr(CGPDFStringRef string)
{
  return (const unsigned __int8 *)MEMORY[0x270EE6ED8](string);
}

size_t CGPDFStringGetLength(CGPDFStringRef string)
{
  return MEMORY[0x270EE6EE0](string);
}

uint64_t CGPDFStringRelease()
{
  return MEMORY[0x270EE6EE8]();
}

uint64_t CGPDFStringRetain()
{
  return MEMORY[0x270EE6EF0]();
}

uint64_t CGPDFTaggedNodeGetObjectReference()
{
  return MEMORY[0x270F1B698]();
}

uint64_t CGPDFXRefGetEntry()
{
  return MEMORY[0x270EE6F48]();
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x270EE6FD0](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x270EE7038](path);
}

uint64_t CGPathIntersectsPathUsingEvenOdd()
{
  return MEMORY[0x270EE70A8]();
}

uint64_t CGPathIntersectsRect()
{
  return MEMORY[0x270EE70B0]();
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x270EE70C8](path);
}

uint64_t CGPathIsLine()
{
  return MEMORY[0x270EE70D0]();
}

BOOL CGPathIsRect(CGPathRef path, CGRect *rect)
{
  return MEMORY[0x270EE70E0](path, rect);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
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

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AF8](name, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x270EE9B48](descriptor, mandatoryAttributes);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x270EE9B68]();
}

CTLineRef CTLineCreateJustifiedLine(CTLineRef line, CGFloat justificationFactor, double justificationWidth)
{
  return (CTLineRef)MEMORY[0x270EE9D60](line, justificationFactor, justificationWidth);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x270EE9D70](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x270EE9DB0](line, options);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x270EE9E00](line, ascent, descent, leading);
  return result;
}

CTLineRef CTTypesetterCreateLine(CTTypesetterRef typesetter, CFRange stringRange)
{
  return (CTLineRef)MEMORY[0x270EE9EF8](typesetter, stringRange.location, stringRange.length);
}

CTTypesetterRef CTTypesetterCreateWithAttributedString(CFAttributedStringRef string)
{
  return (CTTypesetterRef)MEMORY[0x270EE9F08](string);
}

CFIndex CTTypesetterSuggestLineBreak(CTTypesetterRef typesetter, CFIndex startIndex, double width)
{
  return MEMORY[0x270EE9F20](typesetter, startIndex, width);
}

uint64_t DDResultIsPastDate()
{
  return MEMORY[0x270F25220]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x270F96010]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x270EF2A90]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

NSString *NSFullUserName(void)
{
  return (NSString *)MEMORY[0x270EF2AA8]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSRect NSIntersectionRect(NSRect aRect, NSRect bRect)
{
  MEMORY[0x270EF2B00]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

BOOL NSPointInRect(NSPoint aPoint, NSRect aRect)
{
  return MEMORY[0x270EF2B88]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x270EF2C10]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x270ED7C68](libraryName);
}

uint64_t NSZoneReallyFree()
{
  return MEMORY[0x270EF2C90]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return MEMORY[0x270EE56C0]();
}

uint64_t _CGHandleAssert()
{
  return MEMORY[0x270EE73F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void CGBuf::CGBuf(CGBuf *this, CGImage *a2)
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

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::exception::~exception(std::exception *this)
{
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x270F9A478](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}