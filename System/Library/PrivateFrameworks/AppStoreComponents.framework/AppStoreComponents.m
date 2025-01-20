uint64_t ASCAXIdentifierWithSuffix(uint64_t a1)
{
  return [NSString stringWithFormat:@"AppStoreComponents.%@", a1];
}

id ASCAXLabelForElements(void *a1)
{
  id v1 = a1;
  v2 = (void *)MEMORY[0x1E4F28F60];
  id v3 = v1;
  v4 = [v2 predicateWithBlock:&__block_literal_global];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  id v6 = v5;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v7 = (void (*)(id))getAXLabelForElementsSymbolLoc_ptr;
  v16 = getAXLabelForElementsSymbolLoc_ptr;
  if (!getAXLabelForElementsSymbolLoc_ptr)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getAXLabelForElementsSymbolLoc_block_invoke;
    v12[3] = &unk_1E645D5A8;
    v12[4] = &v13;
    __getAXLabelForElementsSymbolLoc_block_invoke((uint64_t)v12);
    v7 = (void (*)(id))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v7)
  {
    ASCAXLabelForElements_cold_1();
    v11 = v10;
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v11);
  }
  v8 = v7(v6);

  return v8;
}

id ASCAXFormatFloatWithPercentage(uint64_t a1, float a2)
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v4 = (void (*)(uint64_t, float))getAXFormatFloatWithPercentageSymbolLoc_ptr;
  uint64_t v13 = getAXFormatFloatWithPercentageSymbolLoc_ptr;
  if (!getAXFormatFloatWithPercentageSymbolLoc_ptr)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getAXFormatFloatWithPercentageSymbolLoc_block_invoke;
    v9[3] = &unk_1E645D5A8;
    v9[4] = &v10;
    __getAXFormatFloatWithPercentageSymbolLoc_block_invoke((uint64_t)v9);
    v4 = (void (*)(uint64_t, float))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v4)
  {
    ASCAXLabelForElements_cold_1();
    v8 = v7;
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }
  v5 = v4(a1, a2);

  return v5;
}

id ASCAXStarRatingStringForRating(float a1)
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void (*)(double))getUIAXStarRatingStringForRatingSymbolLoc_ptr;
  v11 = getUIAXStarRatingStringForRatingSymbolLoc_ptr;
  if (!getUIAXStarRatingStringForRatingSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getUIAXStarRatingStringForRatingSymbolLoc_block_invoke;
    v7[3] = &unk_1E645D5A8;
    v7[4] = &v8;
    __getUIAXStarRatingStringForRatingSymbolLoc_block_invoke((uint64_t)v7);
    v2 = (void (*)(double))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    ASCAXLabelForElements_cold_1();
    id v6 = v5;
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  id v3 = v2(a1);

  return v3;
}

void *__getAXLabelForElementsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AXRuntimeLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AXRuntimeLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E645D5C8;
    uint64_t v7 = 0;
    AXRuntimeLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
    if (AXRuntimeLibraryCore_frameworkLibrary)
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
  v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "AXLabelForElements");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXLabelForElementsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AXRuntimeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXRuntimeLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL __VisibleAXElementsFrom_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v4 = 0;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v2 isHidden] & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || ([v2 alpha], v3 > 0.05)) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

void *__getAXFormatFloatWithPercentageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AXCoreUtilitiesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AXCoreUtilitiesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E645D620;
    uint64_t v7 = 0;
    AXCoreUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    double v3 = (void *)v5[0];
    id v2 = (void *)AXCoreUtilitiesLibraryCore_frameworkLibrary;
    if (AXCoreUtilitiesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      double v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)AXCoreUtilitiesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "AXFormatFloatWithPercentage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXFormatFloatWithPercentageSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AXCoreUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXCoreUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getUIAXStarRatingStringForRatingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!UIAccessibilityLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __UIAccessibilityLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E645D638;
    uint64_t v7 = 0;
    UIAccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
    double v3 = (void *)v5[0];
    id v2 = (void *)UIAccessibilityLibraryCore_frameworkLibrary;
    if (UIAccessibilityLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      double v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)UIAccessibilityLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "UIAXStarRatingStringForRating");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIAXStarRatingStringForRatingSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIAccessibilityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIAccessibilityLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1C2B93CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1C2B9DA14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

double ASCArtworkCropScaleSizeToFit(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  double v10 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ((a2 != *MEMORY[0x1E4F1DB30] || a3 != v11) && (a4 != v10 || a5 != v11))
  {
    double v14 = -a4;
    if (a4 >= 0.0) {
      double v14 = a4;
    }
    if (v14 == 0.0) {
      double v15 = 0.0;
    }
    else {
      double v15 = a2 / a4;
    }
    double v16 = -a5;
    if (a5 >= 0.0) {
      double v16 = a5;
    }
    if (v16 == 0.0) {
      double v17 = 0.0;
    }
    else {
      double v17 = a3 / a5;
    }
    if ((![v9 isEqualToString:@"cc"] || a2 != a3)
      && ([v9 isEqualToString:@"sr"] & 1) == 0)
    {
      double v18 = a4 * v17;
      if ([v9 isEqualToString:@"bb"])
      {
        if (v15 >= v17) {
          a2 = v18;
        }
      }
      else if (v15 < v17)
      {
        a2 = v18;
      }
    }
    double v10 = floor(a2);
  }

  return v10;
}

uint64_t ASCArtworkFormatIsLayered(void *a1)
{
  id v1 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  uint64_t v2 = [v1 isEqualToString:@"lcr"];

  return v2;
}

uint64_t ASCArtworkDecorationHasBorder(void *a1)
{
  id v1 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  int v2 = [v1 isEqualToString:@"none"];

  return v2 ^ 1u;
}

void sub_1C2BACA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ASCLockupContextIsAdGridContext(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"adGridWithPortraitScreenshots"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"adGridWithLandscapeScreenshots"];
  }

  return v2;
}

uint64_t ASCLockupContextIsAdMaterialContext(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"adMaterialWithPortraitScreenshots"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"adMaterialWithLandscapeScreenshots"];
  }

  return v2;
}

uint64_t ASCLockupContextIsAdMaterialWithLandscapeScreenshotsContext(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"adMaterialWithLandscapeScreenshots"];
}

uint64_t ASCLockupContextIsContingentPricingContext(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"contingentPricing"];
}

uint64_t ASCLockupContextIsWebBrowserContext(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"webBrowser"];
}

void sub_1C2BB739C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ASCLockupFeatureGetClasses()
{
  id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  double v10 = objc_msgSend(v18, "initWithObjects:", v17, v16, v15, v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(),
                  0);

  return v10;
}

id ASCLockupFeaturesDecodeForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = ASCLockupFeatureGetClasses();
  uint64_t v6 = [v4 decodeObjectOfClasses:v5 forKey:v3];

  return v6;
}

void sub_1C2BB8488(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C2BB88A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
}

void sub_1C2BB8F7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 48));
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1C2BB90F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C2BB9564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1C2BB96C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C2BBA340(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2BBD754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2BBDB14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2BC000C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSKStoreProductViewControllerClass_block_invoke(uint64_t a1)
{
  StoreKitLibrary();
  Class result = objc_getClass("SKStoreProductViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSKStoreProductViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSKStoreProductViewControllerClass_block_invoke_cold_1();
    return (Class)StoreKitLibrary();
  }
  return result;
}

uint64_t StoreKitLibrary()
{
  uint64_t v0 = StoreKitLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t StoreKitLibraryCore()
{
  if (!StoreKitLibraryCore_frameworkLibrary) {
    StoreKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return StoreKitLibraryCore_frameworkLibrary;
}

uint64_t __StoreKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StoreKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSKStoreProductParameterITunesItemIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreKitLibrary();
  uint64_t result = dlsym(v2, "SKStoreProductParameterITunesItemIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_ptr;
  uint64_t v6 = getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_ptr;
  if (!getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)StoreKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "SKStoreProductParameterCustomProductPageIdentifier");
    getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1C2BC0C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreKitLibrary();
  uint64_t result = dlsym(v2, "SKStoreProductParameterCustomProductPageIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

void *__getSKStoreProductParameterIsViewOnlySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreKitLibrary();
  uint64_t result = dlsym(v2, "SKStoreProductParameterIsViewOnly");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKStoreProductParameterIsViewOnlySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreKitLibrary();
  uint64_t result = dlsym(v2, "SKStoreProductParameterEnableOpenAppCallback");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getSKStoreProductParameterWebBrowserSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)StoreKitLibrary();
  uint64_t result = dlsym(v2, "SKStoreProductParameterWebBrowser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKStoreProductParameterWebBrowserSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1C2BC5114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2BC5968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2BC6524(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2BC6B54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

double ASCLockupViewSizeGetIconSize(void *a1, uint64_t a2)
{
  id v3 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  if ([v3 isEqualToString:@"mini"])
  {
    uint64_t v4 = 0x4044000000000000;
LABEL_5:
    double v5 = *(double *)&v4;
    goto LABEL_6;
  }
  if ([v3 isEqualToString:@"small"])
  {
LABEL_4:
    uint64_t v4 = 0x404F000000000000;
    goto LABEL_5;
  }
  if (![v3 isEqualToString:@"medium"])
  {
    if ([v3 isEqualToString:@"largeAppShowcase"])
    {
      uint64_t v4 = 0x4056000000000000;
      goto LABEL_5;
    }
    if ([v3 isEqualToString:@"largeAppAd"])
    {
      uint64_t v4 = 0x404E000000000000;
      goto LABEL_5;
    }
    if (([v3 isEqualToString:@"smallOfferButton"] & 1) == 0)
    {
      if (([v3 isEqualToString:@"mediumOfferButton"] & 1) == 0) {
        ASCUnknownEnumCase(@"ASCLockupViewSize", v3);
      }
      uint64_t v4 = 0x4049000000000000;
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (a2 == 2) {
    double v5 = 105.0;
  }
  else {
    double v5 = 88.0;
  }
LABEL_6:

  return v5;
}

uint64_t ASCLockupViewSizeIsMini(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"mini"];
}

uint64_t ASCLockupViewSizeIsSmall(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"small"];
}

uint64_t ASCLockupViewSizeIsMedium(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"medium"];
}

uint64_t ASCLockupViewSizeIsLargeAppShowcase(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"largeAppShowcase"];
}

uint64_t ASCLockupViewSizeIsLargeAppAd(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"largeAppAd"];
}

uint64_t ASCLockupViewSizeIsSmallOfferButton(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"smallOfferButton"];
}

uint64_t ASCLockupViewSizeIsMediumOfferButton(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"mediumOfferButton"];
}

double ASCLockupViewSizeGetLayoutEstimatedSize(void *a1, void *a2, double a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  +[ASCEligibility assertCurrentProcessEligibility]();
  if ([v7 isEqualToString:@"mini"])
  {
    +[__ASCLayoutProxy miniLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "miniLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  else if ([v7 isEqualToString:@"small"])
  {
    +[__ASCLayoutProxy smallLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "smallLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  else if ([v7 isEqualToString:@"medium"])
  {
    +[__ASCLayoutProxy mediumLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "mediumLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  else if ([v7 isEqualToString:@"smallOfferButton"])
  {
    +[__ASCLayoutProxy smallOfferButtonLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "smallOfferButtonLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  else
  {
    if (![v7 isEqualToString:@"mediumOfferButton"])
    {
      double v10 = *MEMORY[0x1E4F1DB30];
      goto LABEL_12;
    }
    +[__ASCLayoutProxy mediumOfferButtonLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "mediumOfferButtonLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  double v10 = v9;
LABEL_12:

  return v10;
}

double ASCLockupViewSizeGetEstimatedSize(void *a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v15 = a1;
  id v16 = a2;
  +[ASCEligibility assertCurrentProcessEligibility]();
  if (([v15 isEqualToString:@"mini"] & 1) != 0
    || ([v15 isEqualToString:@"small"] & 1) != 0
    || ([v15 isEqualToString:@"medium"] & 1) != 0
    || ([v15 isEqualToString:@"smallOfferButton"] & 1) != 0
    || [v15 isEqualToString:@"mediumOfferButton"])
  {
    a3 = a6 + a8 + ASCLockupViewSizeGetLayoutEstimatedSize(v15, v16, a3 - a6 - a8, a4 - a5 - a7);
  }
  else
  {
    if (([v15 isEqualToString:@"largeAppShowcase"] & 1) == 0
      && ![v15 isEqualToString:@"largeAppAd"])
    {
      ASCUnknownEnumCase(@"ASCLockupViewSize", v15);
    }
    ASCLockupViewSizeGetIconSize(v15, [v16 horizontalSizeClass]);
  }

  return a3;
}

id ASCLockupViewSizeGetOfferButtonSize(void *a1)
{
  int v1 = [a1 isEqualToString:@"mediumOfferButton"];
  uint64_t v2 = &ASCOfferButtonSizeSmall;
  if (v1) {
    uint64_t v2 = &ASCOfferButtonSizeMedium;
  }
  id v3 = (void *)*v2;

  return v3;
}

uint64_t ASCLockupViewSizeOfferButtonSubtitlePosition(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"medium"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    [v1 isEqualToString:@"mini"];
    uint64_t v2 = 0;
  }

  return v2;
}

id ASCLockupViewSizeGetOfferTheme(void *a1)
{
  id v1 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  if (([v1 isEqualToString:@"mini"] & 1) != 0
    || ([v1 isEqualToString:@"small"] & 1) != 0
    || ([v1 isEqualToString:@"medium"] & 1) != 0
    || [v1 isEqualToString:@"smallOfferButton"])
  {
    uint64_t v2 = +[ASCOfferTheme grayTheme];
  }
  else if ([v1 isEqualToString:@"largeAppShowcase"] {
         || [v1 isEqualToString:@"largeAppAd"])
  }
  {
    uint64_t v2 = +[ASCOfferTheme blueTheme];
  }
  else
  {
    if (![v1 isEqualToString:@"mediumOfferButton"]) {
      ASCUnknownEnumCase(@"ASCLockupViewSize", v1);
    }
    uint64_t v2 = +[ASCOfferTheme essoTheme];
  }
  id v3 = (void *)v2;

  return v3;
}

void sub_1C2BC9478(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1C2BC98EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1C2BC9D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2BCA370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ASCMetricsFieldsGetCodableClasses()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  double v5 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);

  return v5;
}

id ASCMetricsFieldsDecodeForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  double v5 = ASCMetricsFieldsGetCodableClasses();
  uint64_t v6 = [v4 decodeObjectOfClasses:v5 forKey:v3];

  return v6;
}

id ASCMetricsDataDecodeArrayForKey(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 alloc];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  double v9 = [v5 decodeObjectOfClasses:v8 forKey:v4];

  return v9;
}

void sub_1C2BCE6BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2BCFC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2BCFD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2BD0510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2BD1A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2BD1C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2BD2A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id ASCOfferFlagsGetDescription(__int16 a1)
{
  +[ASCEligibility assertCurrentProcessEligibility]();
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = v2;
  if (a1)
  {
    [v2 addObject:@"ASCOfferHasMessagesExtension"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"ASCOfferCreatesJobs"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 addObject:@"ASCOfferIsArcadeApp"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 addObject:@"ASCOfferIsPreorder"];
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 addObject:@"ASCOfferIsDisabled"];
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 addObject:@"ASCOfferForceWatchInstall"];
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 addObject:@"ASCOfferIsDeletableSystemApp"];
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 addObject:@"ASCOfferIsIOSAppOnMacOS"];
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 addObject:@"ASCOfferIsFree"];
  if ((a1 & 0x200) == 0)
  {
LABEL_11:
    if ((a1 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 addObject:@"ASCOfferIsDSIDLess"];
  if ((a1 & 0x400) == 0)
  {
LABEL_12:
    if ((a1 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 addObject:@"ASCOfferIsContingentOffer"];
  if ((a1 & 0x800) == 0)
  {
LABEL_13:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  [v3 addObject:@"ASCOfferShouldInstallParentApp"];
  if ((a1 & 0x1000) != 0) {
LABEL_14:
  }
    [v3 addObject:@"ASCOfferIsAppDistributionOffer"];
LABEL_15:
  id v4 = [v3 componentsJoinedByString:@" | "];

  return v4;
}

id ASCOfferTitlesDecodeForKey(void *a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 alloc];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v5 decodeObjectOfClasses:v8 forKey:v4];

  return v9;
}

id ASCOfferGetCodableClasses()
{
  if (ASCOfferGetCodableClasses_onceToken != -1) {
    dispatch_once(&ASCOfferGetCodableClasses_onceToken, &__block_literal_global_18);
  }
  id v0 = (void *)ASCOfferGetCodableClasses_classes;

  return v0;
}

uint64_t __ASCOfferGetCodableClasses_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  ASCOfferGetCodableClasses_classes = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

id ASCOfferDecodeForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = ASCOfferGetCodableClasses();
  uint64_t v6 = [v4 decodeObjectOfClasses:v5 forKey:v3];

  return v6;
}

CGPath *ASCPathCreateProgressRing(double a1, double a2, double a3, double a4, CGFloat a5, double a6, double a7)
{
  CGRect v20 = CGRectInset(*(CGRect *)&a1, a5, a5);
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGFloat MidX = CGRectGetMidX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v14 = CGRectGetWidth(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v15 = CGRectGetHeight(v23);
  if (v14 < v15) {
    double v15 = v14;
  }
  CGFloat v16 = v15 * 0.5;
  Mutable = CGPathCreateMutable();
  CGPathAddRelativeArc(Mutable, 0, MidX, MidY, v16, a6 * 6.28318531 + -1.57079633, a7 * 6.28318531);
  return Mutable;
}

void sub_1C2BD7FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ASCOfferMetadataGetOfferTheme(void *a1)
{
  if ([a1 isViewInAppStore])
  {
    uint64_t v1 = +[ASCOfferTheme viewInAppStoreTheme];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

id ASCOfferMetadataAnimationForName(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"none"])
  {
    uint64_t v2 = 0;
  }
  else
  {
    if (![v1 isEqualToString:@"rotate"]) {
      ASCUnknownEnumCase(@"ASCOfferMetadataAnimationName", v1);
    }
    uint64_t v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation.z"];
    [v2 setFromValue:&unk_1F1E15C40];
    [v2 setToValue:&unk_1F1E15C50];
    [v2 setByValue:&unk_1F1E15C60];
    [v2 setDuration:1.0];
    [v2 setRemovedOnCompletion:0];
    LODWORD(v3) = 2139095040;
    [v2 setRepeatCount:v3];
  }

  return v2;
}

void sub_1C2BDBF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2BDC370(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1C2BDC54C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C2BDF064(_Unwind_Exception *a1)
{
}

void sub_1C2BDF084(void *a1)
{
}

void sub_1C2BDF24C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C2BDF484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_1C2BDF674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2BDF83C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C2BDFA74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_1C2BE07B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(void *)(a2 + 14) = result;
  return result;
}

void sub_1C2BE1B44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

unint64_t ASCSignpostTagCreateForProcess(unint64_t a1, int a2)
{
  if (!(a1 >> 47)) {
    return a2 | (a1 << 17);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __ASCSignpostTagCreateForProcess_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (ASCSignpostTagCreateForProcess_onceToken != -1) {
    dispatch_once(&ASCSignpostTagCreateForProcess_onceToken, block);
  }
  return a1 + a2;
}

void __ASCSignpostTagCreateForProcess_block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    __ASCSignpostTagCreateForProcess_block_invoke_cold_1(a1);
  }
}

unint64_t ASCSignpostTagCreate(unint64_t a1)
{
  pid_t v2 = getpid();

  return ASCSignpostTagCreateForProcess(a1, v2);
}

unint64_t ASCSignpostTagUnique()
{
  unint64_t add_explicit = atomic_fetch_add_explicit(&ASCSignpostTagUnique_nextValue, 1uLL, memory_order_relaxed);
  pid_t v1 = getpid();

  return ASCSignpostTagCreateForProcess(add_explicit, v1);
}

unint64_t ASCSignpostTagFromIDInProcess(void *a1, int a2)
{
  unint64_t v3 = [a1 int64value];

  return ASCSignpostTagCreateForProcess(v3, a2);
}

unint64_t ASCSignpostTagFromID(void *a1)
{
  unint64_t v1 = [a1 int64value];
  pid_t v2 = getpid();

  return ASCSignpostTagCreateForProcess(v1, v2);
}

id ASCLockupDarkStyleSubtitleColor()
{
  id v0 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
  unint64_t v1 = +[ASCSemanticColor secondaryLabel]();
  pid_t v2 = [v1 resolvedColorWithTraitCollection:v0];

  return v2;
}

void sub_1C2BE73FC(_Unwind_Exception *a1)
{
}

void sub_1C2BE741C(void *a1)
{
}

void sub_1C2BE79A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1C2BE7C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2BE7F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ASCUnknownEnumCase(void *a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [[NSString alloc] initWithFormat:@"%@ does not have case with value %@", v3, v4];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA00]);
  v9[0] = @"enumName";
  v9[1] = @"enumValue";
  v10[0] = v3;
  v10[1] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v8 = (id)[v6 initWithName:@"ASCUnknownEnumCaseException" reason:v5 userInfo:v7];

  objc_exception_throw(v8);
}

void sub_1C2BE9A20(void *a1)
{
  objc_begin_catch(a1);
  objc_storeStrong((id *)&ASCUtilities_testingUtilities, v1);
  objc_exception_rethrow();
}

void sub_1C2BE9A3C(_Unwind_Exception *a1)
{
}

void sub_1C2BE9CE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2BE9F7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1C2BEDB24(void *a1)
{
  objc_begin_catch(a1);
  objc_storeStrong((id *)&ASCWorkspace_testingWorkspace, v1);
  objc_exception_rethrow();
}

void sub_1C2BEDB40(_Unwind_Exception *a1)
{
}

id ASCAppOfferStateDelegateGetInterface()
{
  if (ASCAppOfferStateDelegateGetInterface_onceToken != -1) {
    dispatch_once(&ASCAppOfferStateDelegateGetInterface_onceToken, &__block_literal_global_32);
  }
  id v0 = (void *)ASCAppOfferStateDelegateGetInterface_interface;

  return v0;
}

void __ASCAppOfferStateDelegateGetInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E27B48];
  unint64_t v1 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  ASCAppOfferStateDelegateGetInterface_interface = v0;

  uint64_t v2 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  id v3 = ASCOfferGetCodableClasses();
  [v2 setClasses:v3 forSelector:sel_offer_didChangeState_withMetadata_flags_ argumentIndex:0 ofReply:0];

  id v4 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v5 forSelector:sel_offer_didChangeState_withMetadata_flags_ argumentIndex:1 ofReply:0];

  id v6 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v6 setClasses:v7 forSelector:sel_offer_didChangeState_withMetadata_flags_ argumentIndex:2 ofReply:0];

  id v8 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  uint64_t v9 = ASCOfferGetCodableClasses();
  [v8 setClasses:v9 forSelector:sel_offer_didChangeStatusText_ argumentIndex:0 ofReply:0];

  double v10 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v10 setClasses:v11 forSelector:sel_offer_didChangeStatusText_ argumentIndex:1 ofReply:0];
}

id ASCAppOfferStateServiceGetInterface()
{
  if (ASCAppOfferStateServiceGetInterface_onceToken != -1) {
    dispatch_once(&ASCAppOfferStateServiceGetInterface_onceToken, &__block_literal_global_52);
  }
  uint64_t v0 = (void *)ASCAppOfferStateServiceGetInterface_interface;

  return v0;
}

void __ASCAppOfferStateServiceGetInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E56320];
  unint64_t v1 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  ASCAppOfferStateServiceGetInterface_interface = v0;

  uint64_t v2 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  id v3 = ASCOfferGetCodableClasses();
  id v4 = [v3 setByAddingObject:objc_opt_class()];
  [v2 setClasses:v4 forSelector:sel_startObservingStateOfOffers_ argumentIndex:0 ofReply:0];

  uint64_t v5 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  id v6 = ASCOfferGetCodableClasses();
  uint64_t v7 = [v6 setByAddingObject:objc_opt_class()];
  [v5 setClasses:v7 forSelector:sel_stopObservingStateOfOffers_ argumentIndex:0 ofReply:0];

  id v8 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  uint64_t v9 = ASCOfferGetCodableClasses();
  [v8 setClasses:v9 forSelector:sel_performActionOfOffer_withActivity_inContext_withReplyHandler_ argumentIndex:0 ofReply:0];

  double v10 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v10 setClasses:v11 forSelector:sel_performActionOfOffer_withActivity_inContext_withReplyHandler_ argumentIndex:1 ofReply:0];

  uint64_t v12 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v12 setClasses:v13 forSelector:sel_performActionOfOffer_withActivity_inContext_withReplyHandler_ argumentIndex:2 ofReply:0];

  double v14 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  double v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v14 setClasses:v15 forSelector:sel_performActionOfOffer_withActivity_inContext_withReplyHandler_ argumentIndex:0 ofReply:1];

  CGFloat v16 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v16 setClasses:v17 forSelector:sel_reinstallWatchAppWithID_withReplyHandler_ argumentIndex:0 ofReply:0];

  id v18 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v18 setClasses:v19 forSelector:sel_reinstallWatchAppWithID_withReplyHandler_ argumentIndex:0 ofReply:1];

  CGRect v20 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  CGRect v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v20 setClasses:v21 forSelector:sel_reinstallWatchSystemAppWithBundleID_withReplyHandler_ argumentIndex:0 ofReply:0];

  CGRect v22 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  CGRect v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v22 setClasses:v23 forSelector:sel_reinstallWatchSystemAppWithBundleID_withReplyHandler_ argumentIndex:0 ofReply:1];

  v24 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v24 setClasses:v25 forSelector:sel_viewAppForAppDistributionOffer_ argumentIndex:0 ofReply:0];

  v26 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v26 setClasses:v27 forSelector:sel_decorateBuyParamsForOffer_withActivity_withReplyHandler_ argumentIndex:0 ofReply:0];

  v28 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v28 setClasses:v29 forSelector:sel_decorateBuyParamsForOffer_withActivity_withReplyHandler_ argumentIndex:1 ofReply:0];

  v30 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v30 setClasses:v31 forSelector:sel_decorateBuyParamsForOffer_withActivity_withReplyHandler_ argumentIndex:0 ofReply:1];

  v32 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  id v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v32 setClasses:v33 forSelector:sel_decorateBuyParamsForOffer_withActivity_withReplyHandler_ argumentIndex:1 ofReply:1];
}

id ASCUtilityServiceGetInterface()
{
  if (ASCUtilityServiceGetInterface_onceToken != -1) {
    dispatch_once(&ASCUtilityServiceGetInterface_onceToken, &__block_literal_global_86);
  }
  uint64_t v0 = (void *)ASCUtilityServiceGetInterface_interface;

  return v0;
}

void __ASCUtilityServiceGetInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E56380];
  unint64_t v1 = (void *)ASCUtilityServiceGetInterface_interface;
  ASCUtilityServiceGetInterface_interface = v0;

  uint64_t v2 = (void *)ASCUtilityServiceGetInterface_interface;
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_openURL_withReplyHandler_ argumentIndex:0 ofReply:0];

  id v4 = (void *)ASCUtilityServiceGetInterface_interface;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v5 forSelector:sel_openURL_withReplyHandler_ argumentIndex:0 ofReply:1];

  id v6 = (void *)ASCUtilityServiceGetInterface_interface;
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v6 setClasses:v7 forSelector:sel_restoreAppStoreWithReplyHandler_ argumentIndex:0 ofReply:1];
}

id ASCLockupFetcherServiceGetInterface()
{
  if (ASCLockupFetcherServiceGetInterface_onceToken != -1) {
    dispatch_once(&ASCLockupFetcherServiceGetInterface_onceToken, &__block_literal_global_97);
  }
  uint64_t v0 = (void *)ASCLockupFetcherServiceGetInterface_interface;

  return v0;
}

void __ASCLockupFetcherServiceGetInterface_block_invoke()
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E563E0];
  unint64_t v1 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  ASCLockupFetcherServiceGetInterface_interface = v0;

  uint64_t v2 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_getLockupWithRequest_withReplyHandler_ argumentIndex:0 ofReply:0];

  id v4 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  uint64_t v5 = ASCLockupFeatureGetClasses();
  id v6 = [v5 setByAddingObject:objc_opt_class()];
  [v4 setClasses:v6 forSelector:sel_getLockupWithRequest_withReplyHandler_ argumentIndex:0 ofReply:1];

  id v7 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v7 setClasses:v8 forSelector:sel_getLockupWithRequest_withReplyHandler_ argumentIndex:1 ofReply:1];

  uint64_t v9 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  double v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v9 setClasses:v10 forSelector:sel_getLockupsWithRequest_withReplyHandler_ argumentIndex:0 ofReply:0];

  id v11 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  uint64_t v12 = ASCLockupFeatureGetClasses();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:3];
  double v14 = [v12 setByAddingObjectsFromArray:v13];
  [v11 setClasses:v14 forSelector:sel_getLockupsWithRequest_withReplyHandler_ argumentIndex:0 ofReply:1];

  double v15 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  CGFloat v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v15 setClasses:v16 forSelector:sel_getLockupsWithRequest_withReplyHandler_ argumentIndex:1 ofReply:1];

  uint64_t v17 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v17 setClasses:v18 forSelector:sel_getLockupCollectionWithRequest_withReplyHandler_ argumentIndex:0 ofReply:0];

  uint64_t v19 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v21 = objc_opt_class();
  CGRect v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0, v34, v35);
  [v19 setClasses:v22 forSelector:sel_getLockupCollectionWithRequest_withReplyHandler_ argumentIndex:0 ofReply:1];

  CGRect v23 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v23 setClasses:v24 forSelector:sel_getLockupCollectionWithRequest_withReplyHandler_ argumentIndex:1 ofReply:1];

  v25 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v25 setClasses:v26 forSelector:sel_getLockupForBundleID_withContext_enableAppDistribution_withReplyHandler_ argumentIndex:0 ofReply:0];

  v27 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v27 setClasses:v28 forSelector:sel_getLockupForBundleID_withContext_enableAppDistribution_withReplyHandler_ argumentIndex:1 ofReply:0];

  v29 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v30 = ASCLockupFeatureGetClasses();
  v31 = [v30 setByAddingObject:objc_opt_class()];
  [v29 setClasses:v31 forSelector:sel_getLockupForBundleID_withContext_enableAppDistribution_withReplyHandler_ argumentIndex:0 ofReply:1];

  v32 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  id v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v32 setClasses:v33 forSelector:sel_getLockupForBundleID_withContext_enableAppDistribution_withReplyHandler_ argumentIndex:1 ofReply:1];
}

id ASCMetricsServiceGetInterface()
{
  if (ASCMetricsServiceGetInterface_onceToken != -1) {
    dispatch_once(&ASCMetricsServiceGetInterface_onceToken, &__block_literal_global_120);
  }
  uint64_t v0 = (void *)ASCMetricsServiceGetInterface_interface;

  return v0;
}

void __ASCMetricsServiceGetInterface_block_invoke()
{
  v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E56440];
  unint64_t v1 = (void *)ASCMetricsServiceGetInterface_interface;
  ASCMetricsServiceGetInterface_interface = v0;

  uint64_t v2 = (void *)ASCMetricsServiceGetInterface_interface;
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_processMetricsData_pageFields_activity_withReplyHandler_ argumentIndex:0 ofReply:0];

  id v4 = (void *)ASCMetricsServiceGetInterface_interface;
  uint64_t v5 = ASCMetricsFieldsGetCodableClasses();
  [v4 setClasses:v5 forSelector:sel_processMetricsData_pageFields_activity_withReplyHandler_ argumentIndex:1 ofReply:0];

  id v6 = (void *)ASCMetricsServiceGetInterface_interface;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v6 setClasses:v7 forSelector:sel_processMetricsData_pageFields_activity_withReplyHandler_ argumentIndex:2 ofReply:0];

  id v8 = (void *)ASCMetricsServiceGetInterface_interface;
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v8 setClasses:v9 forSelector:sel_processMetricsData_pageFields_activity_withReplyHandler_ argumentIndex:0 ofReply:1];

  double v10 = (void *)ASCMetricsServiceGetInterface_interface;
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v10 setClasses:v11 forSelector:sel_processViewRenderWithPredicate_withReplyHandler_ argumentIndex:0 ofReply:0];

  uint64_t v12 = (void *)ASCMetricsServiceGetInterface_interface;
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v12 setClasses:v13 forSelector:sel_processViewRenderWithPredicate_withReplyHandler_ argumentIndex:0 ofReply:1];

  double v14 = (void *)ASCMetricsServiceGetInterface_interface;
  double v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v14 setClasses:v15 forSelector:sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_ argumentIndex:0 ofReply:0];

  CGFloat v16 = (void *)ASCMetricsServiceGetInterface_interface;
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v16 setClasses:v17 forSelector:sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_ argumentIndex:1 ofReply:0];

  id v18 = (void *)ASCMetricsServiceGetInterface_interface;
  uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v18 setClasses:v19 forSelector:sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_ argumentIndex:2 ofReply:0];

  id v20 = (void *)ASCMetricsServiceGetInterface_interface;
  uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v20 setClasses:v21 forSelector:sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_ argumentIndex:3 ofReply:0];

  CGRect v22 = (void *)ASCMetricsServiceGetInterface_interface;
  CGRect v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v22 setClasses:v23 forSelector:sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_ argumentIndex:0 ofReply:1];

  v24 = ASCMetricsFieldsGetCodableClasses();
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v26 = [v24 setByAddingObjectsFromArray:v25];

  [(id)ASCMetricsServiceGetInterface_interface setClasses:v26 forSelector:sel_logErrorMessage_ argumentIndex:0 ofReply:0];
}

id ASCServiceBrokerGetInterface()
{
  if (ASCServiceBrokerGetInterface_onceToken != -1) {
    dispatch_once(&ASCServiceBrokerGetInterface_onceToken, &__block_literal_global_139);
  }
  uint64_t v0 = (void *)ASCServiceBrokerGetInterface_interface;

  return v0;
}

void __ASCServiceBrokerGetInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E564A0];
  unint64_t v1 = (void *)ASCServiceBrokerGetInterface_interface;
  ASCServiceBrokerGetInterface_interface = v0;

  uint64_t v2 = (void *)ASCServiceBrokerGetInterface_interface;
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_testConnectionWithReplyHandler_ argumentIndex:0 ofReply:1];

  id v4 = (void *)ASCServiceBrokerGetInterface_interface;
  uint64_t v5 = ASCAppOfferStateDelegateGetInterface();
  [v4 setInterface:v5 forSelector:sel_getAppOfferStateServiceForDelegate_withReplyHandler_ argumentIndex:0 ofReply:0];

  id v6 = (void *)ASCServiceBrokerGetInterface_interface;
  id v7 = ASCAppOfferStateServiceGetInterface();
  [v6 setInterface:v7 forSelector:sel_getAppOfferStateServiceForDelegate_withReplyHandler_ argumentIndex:0 ofReply:1];

  id v8 = (void *)ASCServiceBrokerGetInterface_interface;
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v8 setClasses:v9 forSelector:sel_getAppOfferStateServiceForDelegate_withReplyHandler_ argumentIndex:1 ofReply:1];

  double v10 = (void *)ASCServiceBrokerGetInterface_interface;
  id v11 = ASCUtilityServiceGetInterface();
  [v10 setInterface:v11 forSelector:sel_getUtilityServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  uint64_t v12 = (void *)ASCServiceBrokerGetInterface_interface;
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v12 setClasses:v13 forSelector:sel_getUtilityServiceWithReplyHandler_ argumentIndex:1 ofReply:1];

  double v14 = (void *)ASCServiceBrokerGetInterface_interface;
  double v15 = ASCLockupFetcherServiceGetInterface();
  [v14 setInterface:v15 forSelector:sel_getLockupFetcherServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  CGFloat v16 = (void *)ASCServiceBrokerGetInterface_interface;
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v16 setClasses:v17 forSelector:sel_getLockupFetcherServiceWithReplyHandler_ argumentIndex:1 ofReply:1];

  id v18 = (void *)ASCServiceBrokerGetInterface_interface;
  uint64_t v19 = ASCMetricsServiceGetInterface();
  [v18 setInterface:v19 forSelector:sel_getMetricsServiceWithReplyHandler_ argumentIndex:0 ofReply:1];

  id v20 = (void *)ASCServiceBrokerGetInterface_interface;
  id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v20 setClasses:v21 forSelector:sel_getMetricsServiceWithReplyHandler_ argumentIndex:1 ofReply:1];
}

__CFString *ASCStringFromNotifyStatus(uint64_t a1)
{
  int v2 = a1;
  id v3 = @"NOTIFY_STATUS_OK";
  switch(v2)
  {
    case 0:
      break;
    case 1:
      id v3 = @"NOTIFY_STATUS_INVALID_NAME";
      break;
    case 2:
      id v3 = @"NOTIFY_STATUS_INVALID_TOKEN";
      break;
    case 3:
      id v3 = @"NOTIFY_STATUS_INVALID_PORT";
      break;
    case 4:
      id v3 = @"NOTIFY_STATUS_INVALID_FILE";
      break;
    case 5:
      id v3 = @"NOTIFY_STATUS_INVALID_SIGNAL";
      break;
    case 6:
      id v3 = @"NOTIFY_STATUS_INVALID_REQUEST";
      break;
    case 7:
      id v3 = @"NOTIFY_STATUS_NOT_AUTHORIZED";
      break;
    case 8:
      id v3 = @"NOTIFY_STATUS_OPT_DISABLE";
      break;
    case 9:
      id v3 = @"NOTIFY_STATUS_SERVER_NOT_FOUND";
      break;
    case 10:
      id v3 = @"NOTIFY_STATUS_NULL_INPUT";
      break;
    default:
      if (a1 == 1000000) {
        id v3 = @"NOTIFY_STATUS_FAILED";
      }
      else {
        id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"NOTIFY_STATUS_UNKNOWN (%u)", a1);
      }
      break;
  }

  return v3;
}

id ASCLockupImageStringForName(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = +[ASCImageRenderer bundleImageNamed:v3 compatibleWithTraitCollection:v4];
    if (v5
      || (+[ASCImageRenderer systemImageNamed:v3 compatibleWithTraitCollection:v4], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v6 = [MEMORY[0x1E4FB1398] textAttachmentWithImage:v5];
      id v7 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v6];

      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      ASCLockupImageStringForName_cold_1((uint64_t)v3);
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

id ASCLocalizedFormatString(void *a1)
{
  unint64_t v1 = (void *)MEMORY[0x1E4F1CA20];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "asc_storefrontLocale");
  id v4 = [v3 localeIdentifier];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B50], "asc_frameworkBundle");
  id v6 = objc_msgSend(v5, "__asc_localizedStringForKey:inTable:withLanguage:", v2, 0, v4);

  return v6;
}

id ASCLocalizedPlatformFormatString(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "asc_storefrontLocale");
  id v3 = [v2 localeIdentifier];

  id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "asc_frameworkBundle");
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B50], "asc_localizedStringKeyPlatformSuffix");
  id v6 = [v1 stringByAppendingString:v5];

  id v7 = objc_msgSend(v4, "__asc_localizedStringForKey:inTable:withLanguage:", v6, 0, v3);
  if ([v7 isEqualToString:v6])
  {
    objc_msgSend(v4, "__asc_localizedStringForKey:inTable:withLanguage:", v1, 0, v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v7;
  }
  uint64_t v9 = v8;

  return v9;
}

uint64_t ASCLocalizedStringFromBundle(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "__asc_localizedStringForKey:inTable:withLanguage:", a2, 0, a3);
}

double ASCFontPointSizesResolve(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  double v10 = [v9 preferredContentSizeCategory];
  if (([v10 isEqualToString:*MEMORY[0x1E4FB27C8]] & 1) == 0)
  {
    if ([v10 isEqualToString:*MEMORY[0x1E4FB27E8]])
    {
      double v11 = a3 * 0.333333333;
      double v12 = 0.666666667;
LABEL_6:
      double v13 = v11 + a2 * v12;
LABEL_7:
      a2 = round(v13);
      goto LABEL_8;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4FB27D8]])
    {
      double v11 = a3 * 0.666666667;
      double v12 = 0.333333333;
      goto LABEL_6;
    }
    a2 = a3;
    if ([v10 isEqualToString:*MEMORY[0x1E4FB27D0]]) {
      goto LABEL_8;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4FB27C0]])
    {
      double v15 = a4 * 0.333333333;
      double v16 = 0.666666667;
LABEL_14:
      double v13 = v15 + a3 * v16;
      goto LABEL_7;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4FB27B8]])
    {
      double v15 = a4 * 0.666666667;
      double v16 = 0.333333333;
      goto LABEL_14;
    }
    a2 = a4;
    if ([v10 isEqualToString:*MEMORY[0x1E4FB27B0]]) {
      goto LABEL_8;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4FB2798]])
    {
      double v17 = a5 * 0.2;
      double v18 = 0.8;
LABEL_24:
      double v13 = v17 + a4 * v18;
      goto LABEL_7;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4FB2790]])
    {
      double v17 = a5 * 0.4;
      double v18 = 0.6;
      goto LABEL_24;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4FB2788]])
    {
      double v17 = a5 * 0.6;
      double v18 = 0.4;
      goto LABEL_24;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4FB2780]])
    {
      double v17 = a5 * 0.8;
      double v18 = 0.2;
      goto LABEL_24;
    }
    a2 = a5;
    if (([v10 isEqualToString:*MEMORY[0x1E4FB2778]] & 1) == 0) {
      ASCUnknownEnumCase(@"UIContentSizeCategory", v10);
    }
  }
LABEL_8:

  return a2;
}

double sub_1C2BF1010(void *a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1C2C26FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v17[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(a1, sel_traitCollection);
  char v11 = sub_1C2C26E98();

  sub_1C2BF7E8C(v3, (uint64_t)v17);
  if (v11)
  {
    sub_1C2BF7EC4(v17);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v18, v18[3]);
    char v12 = sub_1C2C26488();
    sub_1C2BF7EC4(v17);
    if (v12)
    {
      __swift_project_boxed_opaque_existential_1((void *)(v3 + 632), *(void *)(v3 + 656));
      sub_1C2C082FC();
      sub_1C2C265D8();
      double v14 = v13;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return (a2 - v14) * 0.5;
    }
  }
  return a2;
}

double sub_1C2BF11CC(void *a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1C2C26FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v10 = sub_1C2BF1010(a1, a2);
  id v11 = objc_msgSend(a1, sel_traitCollection);
  char v12 = sub_1C2C26EC8();

  if ((v12 & 1) == 0)
  {
    id v13 = objc_msgSend(a1, sel_traitCollection);
    char v14 = sub_1C2C26E98();

    if (v14)
    {
      __swift_project_boxed_opaque_existential_1((void *)(v3 + 712), *(void *)(v3 + 736));
      sub_1C2C264F8();
      double v16 = v10 - v15;
      __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
      sub_1C2C082FC();
      sub_1C2C265D8();
      double v18 = v17;
      uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
      v19(v9, v6);
      double v20 = v16 - v18 - *(double *)(v3 + 456);
      __swift_project_boxed_opaque_existential_1((void *)(v3 + 472), *(void *)(v3 + 496));
      sub_1C2C082FC();
      sub_1C2C265D8();
      double v22 = v21;
      v19(v9, v6);
      return v20 - v22;
    }
  }
  return v10;
}

double sub_1C2BF13FC(void *a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1C2C26FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v10 = sub_1C2BF11CC(a1, a2);
  id v11 = &selRef_skeletonNumberOfLines;
  id v12 = objc_msgSend(a1, sel_traitCollection, sub_1C2BF7EF4(v2, a1, v10));
  char v13 = sub_1C2C26EC8();

  if (v13)
  {
    __swift_project_boxed_opaque_existential_1(v3 + 2, v3[5]);
    sub_1C2C082FC();
    sub_1C2C265D8();
    char v14 = *(void (**)(char *, uint64_t))(v7 + 8);
    v14(v9, v6);
    __swift_project_boxed_opaque_existential_1(v3 + 52, v3[55]);
    sub_1C2C082FC();
    sub_1C2C265D8();
    v14(v9, v6);
    __swift_project_boxed_opaque_existential_1(v3 + 59, v3[62]);
    sub_1C2C082FC();
    sub_1C2C265D8();
    v14(v9, v6);
    id v11 = &selRef_skeletonNumberOfLines;
  }
  sub_1C2BF1010(a1, a2);
  __swift_project_boxed_opaque_existential_1(v3 + 84, v3[87]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  __swift_project_boxed_opaque_existential_1(v3 + 144, v3[147]);
  sub_1C2C264E8();
  __swift_project_boxed_opaque_existential_1(v3 + 144, v3[147]);
  if (sub_1C2C26488())
  {
    id v15 = [a1 v11[104]];
    sub_1C2C26E98();
  }
  return a2;
}

void *sub_1C2BF178C@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v7 = v6;
  uint64_t v75 = a2;
  uint64_t v76 = sub_1C2C26478();
  uint64_t v74 = *(void *)(v76 - 8);
  MEMORY[0x1F4188790](v76);
  v63 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v69 = COERCE_DOUBLE(sub_1C2C26B58());
  uint64_t v67 = *(void *)(*(void *)&v69 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](*(void *)&v69);
  v68 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  v66 = (char *)&v62 - v16;
  uint64_t v17 = sub_1C2C26B78();
  uint64_t v72 = *(void *)(v17 - 8);
  uint64_t v73 = v17;
  MEMORY[0x1F4188790](v17);
  v71 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_1C2C26FF8();
  uint64_t v19 = *(void *)(v77 - 8);
  MEMORY[0x1F4188790](v77);
  double v21 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = objc_msgSend(a1, sel_traitCollection);
  int v23 = sub_1C2C26E98();

  double v24 = sub_1C2BF1010(a1, a5);
  __swift_project_boxed_opaque_existential_1(v7 + 144, v7[147]);
  v92.origin.CGFloat x = a3;
  v92.origin.CGFloat y = a4;
  v92.size.CGFloat width = a5;
  v92.size.CGFloat height = a6;
  CGRectGetHeight(v92);
  sub_1C2C264F8();
  double v80 = v25;
  v93.origin.CGFloat x = a3;
  v93.origin.CGFloat y = a4;
  v93.size.CGFloat width = a5;
  v93.size.CGFloat height = a6;
  CGRectGetHeight(v93);
  CGFloat v78 = a5;
  CGFloat v79 = a6;
  sub_1C2C26EF8();
  uint64_t v26 = v7[147];
  v70 = v7 + 144;
  __swift_project_boxed_opaque_existential_1(v7 + 144, v26);
  char v27 = sub_1C2C26488();
  int v64 = v23;
  if (v27 & 1) != 0 && (v23)
  {
    __swift_project_boxed_opaque_existential_1(v7 + 84, v7[87]);
    sub_1C2C082FC();
    sub_1C2C265D8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v77);
  }
  v65 = v21;
  uint64_t v62 = v19;
  sub_1C2BF79F4((uint64_t)v7, (uint64_t)v90);
  sub_1C2BF7A70((uint64_t)(v7 + 94), (uint64_t)v89, &qword_1EB6817F0);
  sub_1C2BF7C98((uint64_t)(v7 + 99), (uint64_t)v88);
  sub_1C2BF7C98((uint64_t)(v7 + 104), (uint64_t)v87);
  sub_1C2BF7A70((uint64_t)(v7 + 109), (uint64_t)v86, &qword_1EB6817F0);
  sub_1C2BF7A70((uint64_t)(v7 + 114), (uint64_t)v85, &qword_1EB6817F0);
  sub_1C2BF7A70((uint64_t)(v7 + 124), (uint64_t)v84, &qword_1EB6817E8);
  sub_1C2BF7A70((uint64_t)(v7 + 129), (uint64_t)v83, &qword_1EB6817F0);
  sub_1C2BF7A70((uint64_t)(v7 + 134), (uint64_t)v82, &qword_1EB6817E8);
  sub_1C2BF7A70((uint64_t)(v7 + 139), (uint64_t)v81, &qword_1EB6817E8);
  sub_1C2BF1FFC((uint64_t)v90, (uint64_t)v89, (uint64_t)v88, (uint64_t)v87, (uint64_t)v86, (uint64_t)v85, (uint64_t)v84, (uint64_t)v83, (uint64_t)v91, (uint64_t)v82, (uint64_t)v81);
  v90[3] = &type metadata for AdLockupLayout.AdLockupInnerContentLayout;
  v90[4] = sub_1C2BF7AD4();
  v90[0] = swift_allocObject();
  sub_1C2BF7C60((uint64_t)v91, v90[0] + 16);
  sub_1C2BF7C98((uint64_t)(v7 + 89), (uint64_t)v89);
  sub_1C2BF7C98((uint64_t)(v7 + 2), (uint64_t)v88);
  sub_1C2BF7C98((uint64_t)(v7 + 119), (uint64_t)v87);
  sub_1C2BF7C98((uint64_t)(v7 + 59), (uint64_t)v86);
  uint64_t v28 = *MEMORY[0x1E4F71BE8];
  v29 = *(void (**)(char *, uint64_t, void))(v67 + 104);
  double v30 = v69;
  v29(v66, v28, *(void *)&v69);
  v29(v68, v28, *(void *)&v30);
  v31 = v71;
  sub_1C2C26B68();
  v32 = v63;
  sub_1C2C26B48();
  if (v64)
  {
    sub_1C2C26458();
    double MinX = v33;
    sub_1C2C26458();
    double v36 = v35;
    sub_1C2C26428();
    double v69 = a3;
    double v38 = v36 + v37;
    __swift_project_boxed_opaque_existential_1(v7 + 84, v7[87]);
    v39 = v65;
    sub_1C2C082FC();
    sub_1C2C265D8();
    double v41 = v40;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v39, v77);
    double v42 = v38 + v41;
    a3 = v69;
  }
  else
  {
    id v43 = objc_msgSend(a1, sel_traitCollection);
    char v44 = sub_1C2C26EB8();

    v45 = v65;
    if (v44)
    {
      v94.origin.CGFloat x = a3;
      v94.origin.CGFloat y = a4;
      v94.size.CGFloat width = v78;
      v94.size.CGFloat height = v79;
      double MinX = CGRectGetMinX(v94);
    }
    else
    {
      sub_1C2C26458();
      double v47 = v46;
      sub_1C2C26428();
      double v49 = v47 + v48;
      __swift_project_boxed_opaque_existential_1(v7 + 79, v7[82]);
      sub_1C2C082FC();
      sub_1C2C265D8();
      double v51 = v50;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v45, v77);
      double MinX = v49 + v51;
    }
    sub_1C2C26458();
    double v53 = v52;
    sub_1C2C26428();
    double v42 = floor(v53 + v54 * 0.5 - v80 * 0.5);
  }
  __swift_project_boxed_opaque_existential_1(v70, v7[147]);
  CGFloat v55 = v80;
  sub_1C2C264B8();
  v95.origin.CGFloat x = MinX;
  v95.origin.CGFloat y = v42;
  v95.size.CGFloat width = v24;
  v95.size.CGFloat height = v55;
  double MaxY = CGRectGetMaxY(v95);
  sub_1C2C26458();
  double v58 = v57;
  sub_1C2C26428();
  if (MaxY <= v58 + v59) {
    double MaxY = v58 + v59;
  }
  v96.origin.CGFloat x = a3;
  v96.origin.CGFloat y = a4;
  v96.size.CGFloat width = v78;
  v96.size.CGFloat height = v79;
  double Width = CGRectGetWidth(v96);
  MEMORY[0x1C8767BC0](a3, a4, Width, MaxY, MaxY, 0.0);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v32, v76);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v31, v73);
  return sub_1C2BF7CFC(v91);
}

uint64_t sub_1C2BF1FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  *(void *)(a9 + 32) = 0;
  *(_OWORD *)a9 = 0u;
  *(_OWORD *)(a9 + 16) = 0u;
  uint64_t v29 = a9 + 160;
  *(_OWORD *)(a9 + 136) = 0u;
  *(_OWORD *)(a9 + 152) = 0u;
  *(_OWORD *)(a9 + 168) = 0u;
  *(_OWORD *)(a9 + 184) = 0u;
  *(_OWORD *)(a9 + 216) = 0u;
  *(_OWORD *)(a9 + 232) = 0u;
  *(_OWORD *)(a9 + 248) = 0u;
  *(_OWORD *)(a9 + 120) = 0u;
  *(_OWORD *)(a9 + 264) = 0u;
  *(_OWORD *)(a9 + 280) = 0u;
  *(_OWORD *)(a9 + 296) = 0u;
  *(_OWORD *)(a9 + 312) = 0u;
  *(_OWORD *)(a9 + 328) = 0u;
  *(_OWORD *)(a9 + 344) = 0u;
  *(_OWORD *)(a9 + 200) = 0u;
  sub_1C2BF79F4(a1, a9 + 360);
  uint64_t v31 = a2;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  uint64_t v23 = a7;
  sub_1C2BF7D2C(v18, a9, &qword_1EB6817F0);
  sub_1C2BF7C98(v19, a9 + 40);
  sub_1C2BF7C98(v20, a9 + 80);
  sub_1C2BF7D2C(v21, a9 + 120, &qword_1EB6817F0);
  sub_1C2BF7D2C(v22, v29, &qword_1EB6817F0);
  sub_1C2BF7D2C(a7, a9 + 200, &qword_1EB6817E8);
  sub_1C2BF7A70(a8, (uint64_t)v33, &qword_1EB6817F0);
  uint64_t v24 = v34;
  if (v34)
  {
    uint64_t v25 = v35;
    uint64_t v26 = __swift_project_boxed_opaque_existential_1(v33, v34);
    *((void *)&v37 + 1) = v24;
    uint64_t v38 = *(void *)(v25 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v36);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(boxed_opaque_existential_1, v26, v24);
    sub_1C2BF9534(a8, &qword_1EB6817F0);
    sub_1C2BF9534(v23, &qword_1EB6817E8);
    sub_1C2BF9534(v22, &qword_1EB6817F0);
    sub_1C2BF9534(v21, &qword_1EB6817F0);
    __swift_destroy_boxed_opaque_existential_1(v20);
    __swift_destroy_boxed_opaque_existential_1(v19);
    sub_1C2BF9534(v31, &qword_1EB6817F0);
    sub_1C2BF7D90(a1);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  }
  else
  {
    sub_1C2BF9534(a8, &qword_1EB6817F0);
    sub_1C2BF9534(v23, &qword_1EB6817E8);
    sub_1C2BF9534(v22, &qword_1EB6817F0);
    sub_1C2BF9534(v21, &qword_1EB6817F0);
    __swift_destroy_boxed_opaque_existential_1(v20);
    __swift_destroy_boxed_opaque_existential_1(v19);
    sub_1C2BF9534(v31, &qword_1EB6817F0);
    sub_1C2BF7D90(a1);
    sub_1C2BF9534((uint64_t)v33, &qword_1EB6817F0);
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v38 = 0;
  }
  sub_1C2BF7DC0((uint64_t)&v36, a9 + 240);
  sub_1C2BF7DC0(a10, a9 + 280);
  return sub_1C2BF7DC0(a11, a9 + 320);
}

void *sub_1C2BF22CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v7 = v6;
  uint64_t v138 = a2;
  v142 = (void *)sub_1C2C26FF8();
  uint64_t v13 = *(v142 - 1);
  MEMORY[0x1F4188790](v142);
  v141 = (char *)&v124 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C2C26478();
  uint64_t v136 = *(void *)(v15 - 8);
  uint64_t v137 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v124 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_1C2C26B88();
  uint64_t v18 = *(void *)(v143 - 8);
  MEMORY[0x1F4188790](v143);
  v139 = (char *)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v124 - v21;
  uint64_t v23 = sub_1C2C26BB8();
  uint64_t v134 = *(void *)(v23 - 8);
  uint64_t v135 = v23;
  *(void *)&double v24 = MEMORY[0x1F4188790](v23).n128_u64[0];
  v144 = (char *)&v124 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v26 = objc_msgSend(a1, sel_traitCollection, v24);
  id v140 = objc_msgSend(v26, sel_horizontalSizeClass);

  sub_1C2BF1010(a1, a5);
  double v27 = sub_1C2BF11CC(a1, a5);
  sub_1C2BF79F4(v7, (uint64_t)v157);
  sub_1C2BF7A70(v7 + 752, (uint64_t)&v155, &qword_1EB6817F0);
  v127 = (void *)(v7 + 792);
  sub_1C2BF7C98(v7 + 792, (uint64_t)v154);
  v128 = (void *)(v7 + 832);
  sub_1C2BF7C98(v7 + 832, (uint64_t)v153);
  uint64_t v129 = v7 + 872;
  sub_1C2BF7A70(v7 + 872, (uint64_t)v152, &qword_1EB6817F0);
  uint64_t v130 = v7 + 912;
  sub_1C2BF7A70(v7 + 912, (uint64_t)v151, &qword_1EB6817F0);
  uint64_t v132 = v7 + 992;
  sub_1C2BF7A70(v7 + 992, (uint64_t)v150, &qword_1EB6817E8);
  uint64_t v133 = v7 + 1032;
  sub_1C2BF7A70(v7 + 1032, (uint64_t)v149, &qword_1EB6817F0);
  uint64_t v131 = v7 + 1072;
  sub_1C2BF7A70(v7 + 1072, (uint64_t)v148, &qword_1EB6817E8);
  sub_1C2BF7A70(v7 + 1112, (uint64_t)v147, &qword_1EB6817E8);
  sub_1C2BF1FFC((uint64_t)v157, (uint64_t)&v155, (uint64_t)v154, (uint64_t)v153, (uint64_t)v152, (uint64_t)v151, (uint64_t)v150, (uint64_t)v149, (uint64_t)v160, (uint64_t)v148, (uint64_t)v147);
  sub_1C2BF7EF4(v161, a1, v27);
  if (v28 > *(double *)(v7 + 8)) {
    double v29 = v28;
  }
  else {
    double v29 = *(double *)(v7 + 8);
  }
  CGFloat v145 = a5;
  CGFloat v146 = a6;
  sub_1C2C26EF8();
  v158 = &type metadata for AdLockupLayout.AdLockupInnerContentLayout;
  unint64_t v159 = sub_1C2BF7AD4();
  v157[0] = swift_allocObject();
  sub_1C2BF7C60((uint64_t)v160, v157[0] + 16);
  sub_1C2BF7C98(v7 + 712, (uint64_t)&v155);
  sub_1C2BF7C98(v7 + 16, (uint64_t)v154);
  v126 = (void *)(v7 + 952);
  sub_1C2BF7C98(v7 + 952, (uint64_t)v153);
  sub_1C2BF7C98(v7 + 472, (uint64_t)v152);
  double v30 = *(void (**)(char *, void, uint64_t))(v18 + 104);
  uint64_t v31 = v143;
  v30(v22, *MEMORY[0x1E4F71C08], v143);
  v30(v139, *MEMORY[0x1E4F71C18], v31);
  v32 = v141;
  sub_1C2C26BA8();
  uint64_t v143 = (uint64_t)v17;
  double v33 = v142;
  sub_1C2C26B98();
  __swift_project_boxed_opaque_existential_1((void *)(v7 + 632), *(void *)(v7 + 656));
  sub_1C2C082FC();
  sub_1C2C265D8();
  double v35 = v34;
  long long v36 = *(void (**)(char *, void *))(v13 + 8);
  v139 = (char *)(v13 + 8);
  v36(v32, v33);
  if (v140 == (id)1)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v7 + 1152), *(void *)(v7 + 1176));
    sub_1C2C264F8();
    double v38 = v37;
    double v40 = v39;
    sub_1C2C26458();
    double v42 = v41;
    sub_1C2C26458();
    double v44 = v43;
    sub_1C2C26428();
    double v46 = v44 + v45;
    __swift_project_boxed_opaque_existential_1((void *)(v7 + 672), *(void *)(v7 + 696));
    sub_1C2C082FC();
    sub_1C2C265D8();
    double v48 = v47;
    v36(v32, v33);
    double v49 = v46 + v48;
  }
  else
  {
    v142 = (void *)v7;
    id v50 = objc_msgSend(a1, sel_traitCollection);
    char v51 = sub_1C2C26EB8();

    double MaxX = 0.0;
    if (v51)
    {
      v162.origin.CGFloat x = a3;
      v162.origin.CGFloat y = a4;
      v162.size.CGFloat width = v145;
      v162.size.CGFloat height = v146;
      double MaxX = CGRectGetMaxX(v162);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330898);
    uint64_t v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = xmmword_1C2C2F750;
    double v54 = v142;
    uint64_t v55 = v142[102];
    uint64_t v56 = v142[103];
    double v57 = __swift_project_boxed_opaque_existential_1(v127, v55);
    *(void *)(v53 + 56) = v55;
    *(void *)(v53 + 64) = *(void *)(v56 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v53 + 32));
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v55 - 8) + 16))(boxed_opaque_existential_1, v57, v55);
    uint64_t v59 = v54[107];
    uint64_t v60 = v54[108];
    v61 = __swift_project_boxed_opaque_existential_1(v128, v59);
    *(void *)(v53 + 96) = v59;
    *(void *)(v53 + 104) = *(void *)(v60 + 8);
    uint64_t v62 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v53 + 72));
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v59 - 8) + 16))(v62, v61, v59);
    sub_1C2BF7A70(v129, (uint64_t)v157, &qword_1EB6817F0);
    v63 = v158;
    if (v158)
    {
      unint64_t v64 = v159;
      v65 = __swift_project_boxed_opaque_existential_1(v157, (uint64_t)v158);
      *(void *)(v53 + 136) = v63;
      *(void *)(v53 + 144) = *(void *)(v64 + 8);
      v66 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v53 + 112));
      (*((void (**)(uint64_t *, void *, ValueMetadata *))v63[-1].Description + 2))(v66, v65, v63);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v157);
    }
    else
    {
      sub_1C2BF9534((uint64_t)v157, &qword_1EB6817F0);
      *(void *)(v53 + 144) = 0;
      *(_OWORD *)(v53 + 112) = 0u;
      *(_OWORD *)(v53 + 128) = 0u;
    }
    sub_1C2BF7A70(v130, (uint64_t)v157, &qword_1EB6817F0);
    uint64_t v67 = v158;
    if (v158)
    {
      unint64_t v68 = v159;
      double v69 = __swift_project_boxed_opaque_existential_1(v157, (uint64_t)v158);
      *(void *)(v53 + 176) = v67;
      *(void *)(v53 + 184) = *(void *)(v68 + 8);
      v70 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v53 + 152));
      (*((void (**)(uint64_t *, void *, ValueMetadata *))v67[-1].Description + 2))(v70, v69, v67);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v157);
    }
    else
    {
      sub_1C2BF9534((uint64_t)v157, &qword_1EB6817F0);
      *(void *)(v53 + 184) = 0;
      *(_OWORD *)(v53 + 152) = 0u;
      *(_OWORD *)(v53 + 168) = 0u;
    }
    sub_1C2BF7A70(v131, v53 + 192, &qword_1EB6817E8);
    sub_1C2BF7A70(v132, v53 + 232, &qword_1EB6817E8);
    sub_1C2BF7A70(v133, (uint64_t)v157, &qword_1EB6817F0);
    v71 = v158;
    if (v158)
    {
      unint64_t v72 = v159;
      uint64_t v73 = __swift_project_boxed_opaque_existential_1(v157, (uint64_t)v158);
      *(void *)(v53 + 296) = v71;
      *(void *)(v53 + 304) = *(void *)(v72 + 8);
      uint64_t v74 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v53 + 272));
      (*((void (**)(uint64_t *, void *, ValueMetadata *))v71[-1].Description + 2))(v74, v73, v71);
      uint64_t result = (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v157);
    }
    else
    {
      uint64_t result = (void *)sub_1C2BF9534((uint64_t)v157, &qword_1EB6817F0);
      *(void *)(v53 + 304) = 0;
      *(_OWORD *)(v53 + 272) = 0u;
      *(_OWORD *)(v53 + 288) = 0u;
    }
    if (*(void *)(v53 + 16) < 7uLL)
    {
      __break(1u);
      return result;
    }
    v141 = (char *)(v53 + 32);
    for (uint64_t i = 32; i != 312; i += 40)
    {
      sub_1C2BF7A70(v53 + i, (uint64_t)&v155, &qword_1EB6817E8);
      if (v156)
      {
        sub_1C2BF8100(&v155, (uint64_t)v157);
        __swift_project_boxed_opaque_existential_1(v157, (uint64_t)v158);
        if (sub_1C2C26488())
        {
          __swift_project_boxed_opaque_existential_1(v157, (uint64_t)v158);
          if ((sub_1C2C264C8() & 1) == 0)
          {
            id v77 = objc_msgSend(a1, sel_traitCollection);
            char v78 = sub_1C2C26EB8();

            __swift_project_boxed_opaque_existential_1(v157, (uint64_t)v158);
            sub_1C2C264A8();
            if (v78)
            {
              double MinX = CGRectGetMinX(*(CGRect *)&v79);
              if (MinX < MaxX) {
                double MaxX = MinX;
              }
            }
            else
            {
              double v84 = CGRectGetMaxX(*(CGRect *)&v79);
              if (MaxX <= v84) {
                double MaxX = v84;
              }
            }
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v157);
      }
      else
      {
        sub_1C2BF9534((uint64_t)&v155, &qword_1EB6817E8);
      }
    }
    CGFloat v85 = a3;
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6817E8);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    id v86 = objc_msgSend(a1, sel_traitCollection);
    char v87 = sub_1C2C26EB8();

    double v124 = a4;
    double v125 = a3;
    CGFloat v88 = v29;
    CGFloat v89 = v85;
    CGFloat v90 = a4;
    CGFloat v91 = v145;
    CGFloat v92 = v146;
    if (v87)
    {
      double v93 = CGRectGetMinX(*(CGRect *)&v89);
      uint64_t v7 = (uint64_t)v142;
      CGRect v94 = v126;
      __swift_project_boxed_opaque_existential_1(v126, v142[122]);
      sub_1C2C264A8();
      CGFloat Width = CGRectGetWidth(v163);
      double v96 = MaxX;
      double MaxX = v93 + Width;
    }
    else
    {
      double v97 = CGRectGetMaxX(*(CGRect *)&v89);
      uint64_t v7 = (uint64_t)v142;
      CGRect v94 = v126;
      __swift_project_boxed_opaque_existential_1(v126, v142[122]);
      sub_1C2C264A8();
      double v96 = v97 - CGRectGetWidth(v164);
    }
    CGFloat v98 = v35 + MaxX;
    double v99 = v96 - v35;
    sub_1C2C26458();
    CGFloat v101 = v100;
    CGFloat v102 = v99 - (v35 + MaxX);
    __swift_project_boxed_opaque_existential_1((void *)(v7 + 1152), *(void *)(v7 + 1176));
    sub_1C2C264F8();
    double v38 = v103;
    double v40 = v104;
    v165.origin.CGFloat x = v98;
    v165.origin.CGFloat y = v101;
    v165.size.CGFloat width = v99 - v98;
    v165.size.CGFloat height = v88;
    double v105 = CGRectGetMidX(v165) - v38 * 0.5;
    v166.origin.CGFloat x = v98;
    v166.origin.CGFloat y = v101;
    v166.size.CGFloat width = v102;
    v166.size.CGFloat height = v88;
    double v106 = CGRectGetMidY(v166) - v40 * 0.5;
    sub_1C2BF7C98((uint64_t)v94, (uint64_t)v157);
    __swift_project_boxed_opaque_existential_1(v157, (uint64_t)v158);
    id v107 = objc_msgSend(a1, sel_traitCollection);
    char v108 = sub_1C2C26EB8();

    a4 = v124;
    double v109 = v125;
    double v110 = v124;
    CGFloat v111 = v145;
    CGFloat v112 = v146;
    if (v108)
    {
      double v113 = CGRectGetMinX(*(CGRect *)&v109);
    }
    else
    {
      double v114 = CGRectGetMaxX(*(CGRect *)&v109);
      __swift_project_boxed_opaque_existential_1(v94, *(void *)(v7 + 976));
      sub_1C2C264A8();
      double v113 = v114 - v115;
    }
    double v42 = floor(v105);
    double v49 = floor(v106);
    v116 = (void (*)(long long *, void))sub_1C2C26498();
    double *v117 = v113;
    v116(&v155, 0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v157);
    a3 = v125;
  }
  __swift_project_boxed_opaque_existential_1((void *)(v7 + 1152), *(void *)(v7 + 1176));
  sub_1C2C264B8();
  v167.origin.CGFloat x = v42;
  v167.origin.CGFloat y = v49;
  v167.size.CGFloat width = v38;
  v167.size.CGFloat height = v40;
  double MaxY = CGRectGetMaxY(v167);
  uint64_t v119 = v143;
  sub_1C2C26458();
  double v121 = v120;
  sub_1C2C26428();
  if (MaxY <= v121 + v122) {
    double MaxY = v121 + v122;
  }
  v168.origin.CGFloat x = a3;
  v168.origin.CGFloat y = a4;
  v168.size.CGFloat width = v145;
  v168.size.CGFloat height = v146;
  double v123 = CGRectGetWidth(v168);
  MEMORY[0x1C8767BC0](a3, a4, v123, MaxY, MaxY, 0.0);
  (*(void (**)(uint64_t, uint64_t))(v136 + 8))(v119, v137);
  (*(void (**)(char *, uint64_t))(v134 + 8))(v144, v135);
  return sub_1C2BF7CFC(v160);
}

uint64_t sub_1C2BF3100()
{
  id v1 = (void *)v0;
  v150 = (char *)((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v3 = v2;
  uint64_t v157 = sub_1C2C269C8();
  uint64_t v162 = *(void *)(v157 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v156 = &v127[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v154 = sub_1C2C269D8();
  uint64_t v5 = *(void **)(v154 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v153 = &v127[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1C2C26968();
  uint64_t v163 = *(void *)(v7 - 8);
  uint64_t v164 = v7;
  ((void (*)(void))MEMORY[0x1F4188790])();
  v152 = &v127[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v155 = sub_1C2C26A08();
  uint64_t v159 = *(void *)(v155 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  id v11 = &v127[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  v148 = &v127[-v13];
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  v151 = &v127[-v15];
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = &v127[-v16];
  sub_1C2BF7A70(v0, (uint64_t)v189, &qword_1EB6817F0);
  if (!v190)
  {
    sub_1C2BF9534((uint64_t)v189, &qword_1EB6817F0);
    sub_1C2BF7C60(v0, (uint64_t)v189);
    goto LABEL_6;
  }
  __swift_project_boxed_opaque_existential_1(v189, v190);
  char v18 = sub_1C2C264C8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v189);
  sub_1C2BF7C60((uint64_t)v1, (uint64_t)v189);
  if (v18)
  {
LABEL_6:
    sub_1C2BF7CFC(v189);
    goto LABEL_7;
  }
  sub_1C2BF7A70((uint64_t)v189, (uint64_t)v186, &qword_1EB6817F0);
  if (v187)
  {
    __swift_project_boxed_opaque_existential_1(v186, v187);
    int v19 = sub_1C2C26488();
    sub_1C2BF7CFC(v189);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v186);
    goto LABEL_8;
  }
  sub_1C2BF7CFC(v189);
  sub_1C2BF9534((uint64_t)v186, &qword_1EB6817F0);
LABEL_7:
  int v19 = 0;
LABEL_8:
  sub_1C2BF7A70((uint64_t)(v1 + 20), (uint64_t)v186, &qword_1EB6817F0);
  v147 = v11;
  if (v187)
  {
    __swift_project_boxed_opaque_existential_1(v186, v187);
    char v20 = sub_1C2C264C8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v186);
    sub_1C2BF7C60((uint64_t)v1, (uint64_t)v186);
    if ((v20 & 1) == 0)
    {
      sub_1C2BF7A70((uint64_t)&v188, (uint64_t)v183, &qword_1EB6817F0);
      int v21 = v184;
      if (v184)
      {
        __swift_project_boxed_opaque_existential_1(v183, v184);
        int v21 = sub_1C2C26488();
        sub_1C2BF7CFC(v186);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
      }
      else
      {
        sub_1C2BF7CFC(v186);
        sub_1C2BF9534((uint64_t)v183, &qword_1EB6817F0);
      }
      goto LABEL_14;
    }
  }
  else
  {
    sub_1C2BF9534((uint64_t)v186, &qword_1EB6817F0);
    sub_1C2BF7C60((uint64_t)v1, (uint64_t)v186);
  }
  sub_1C2BF7CFC(v186);
  int v21 = 0;
LABEL_14:
  uint64_t v22 = v1[13];
  v158 = v1 + 10;
  __swift_project_boxed_opaque_existential_1(v1 + 10, v22);
  char v23 = sub_1C2C264C8();
  sub_1C2BF7C60((uint64_t)v1, (uint64_t)v183);
  if (v23)
  {
    LODWORD(v149) = 0;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v185, v185[3]);
    LODWORD(v149) = sub_1C2C26488();
  }
  sub_1C2BF7CFC(v183);
  v160 = v1 + 15;
  sub_1C2BF7A70((uint64_t)(v1 + 15), (uint64_t)v180, &qword_1EB6817F0);
  if (!v181)
  {
    sub_1C2BF9534((uint64_t)v180, &qword_1EB6817F0);
    sub_1C2BF7C60((uint64_t)v1, (uint64_t)v180);
    goto LABEL_22;
  }
  __swift_project_boxed_opaque_existential_1(v180, v181);
  char v24 = sub_1C2C264C8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v180);
  sub_1C2BF7C60((uint64_t)v1, (uint64_t)v180);
  if (v24)
  {
LABEL_22:
    sub_1C2BF7CFC(v180);
    goto LABEL_23;
  }
  sub_1C2BF7A70((uint64_t)&v182, (uint64_t)v177, &qword_1EB6817F0);
  if (v178)
  {
    __swift_project_boxed_opaque_existential_1(v177, v178);
    int v25 = sub_1C2C26488();
    sub_1C2BF7CFC(v180);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v177);
    goto LABEL_24;
  }
  sub_1C2BF7CFC(v180);
  sub_1C2BF9534((uint64_t)v177, &qword_1EB6817F0);
LABEL_23:
  int v25 = 0;
LABEL_24:
  CGFloat v146 = v17;
  sub_1C2BF7A70((uint64_t)(v1 + 40), (uint64_t)v177, &qword_1EB6817E8);
  if (!v178)
  {
    sub_1C2BF9534((uint64_t)v177, &qword_1EB6817E8);
    sub_1C2BF7C60((uint64_t)v1, (uint64_t)v177);
    goto LABEL_33;
  }
  __swift_project_boxed_opaque_existential_1(v177, v178);
  char v26 = sub_1C2C264C8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v177);
  sub_1C2BF7C60((uint64_t)v1, (uint64_t)v177);
  if (v26)
  {
LABEL_33:
    sub_1C2BF7CFC(v177);
    goto LABEL_34;
  }
  sub_1C2BF7A70((uint64_t)&v179, (uint64_t)v174, &qword_1EB6817E8);
  if (v175)
  {
    __swift_project_boxed_opaque_existential_1(v174, v175);
    char v27 = sub_1C2C26488();
    sub_1C2BF7CFC(v177);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
    if (((v19 | v21 | v25) & 1) == 0 && (v27 & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_35;
  }
  sub_1C2BF7CFC(v177);
  sub_1C2BF9534((uint64_t)v174, &qword_1EB6817E8);
LABEL_34:
  if (((v19 | v21 | v25) & 1) == 0)
  {
LABEL_29:
    id v28 = v150;
    id v29 = objc_msgSend(v150, sel_traitCollection);
    sub_1C2C26EC8();

    id v30 = objc_msgSend(v28, sel_traitCollection);
    char v31 = sub_1C2C26EC8();

    uint64_t v32 = 22;
    if (v31) {
      uint64_t v32 = 12;
    }
    sub_1C2BF7C98((uint64_t)&v1[v32 + 45], (uint64_t)v174);
    sub_1C2BF7C98((uint64_t)(v1 + 5), (uint64_t)&v171);
    sub_1C2BF7C98((uint64_t)v158, (uint64_t)&v168);
    sub_1C2BF7C98((uint64_t)v174, (uint64_t)v167);
    sub_1C2BF7C98((uint64_t)(v1 + 62), (uint64_t)v166);
    sub_1C2BF7C98((uint64_t)(v1 + 77), (uint64_t)&v165);
    uint64_t v33 = sub_1C2C26D18();
    uint64_t v34 = MEMORY[0x1E4F71D28];
    v3[3] = v33;
    v3[4] = v34;
    __swift_allocate_boxed_opaque_existential_1(v3);
    sub_1C2C26D08();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
  }
LABEL_35:
  sub_1C2BF7A70((uint64_t)v1, (uint64_t)v174, &qword_1EB6817F0);
  if (v175)
  {
    __swift_project_boxed_opaque_existential_1(v174, v175);
    sub_1C2C26758();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
  }
  else
  {
    sub_1C2BF9534((uint64_t)v174, &qword_1EB6817F0);
  }
  sub_1C2BF7A70((uint64_t)v1, (uint64_t)v174, &qword_1EB6817F0);
  int v128 = v25;
  if (v175)
  {
    __swift_project_boxed_opaque_existential_1(v174, v175);
    sub_1C2C26738();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
  }
  else
  {
    sub_1C2BF9534((uint64_t)v174, &qword_1EB6817F0);
  }
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  sub_1C2C26758();
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  sub_1C2C26738();
  double v35 = v158;
  __swift_project_boxed_opaque_existential_1(v158, v1[13]);
  sub_1C2C26758();
  __swift_project_boxed_opaque_existential_1(v35, v1[13]);
  sub_1C2C26738();
  sub_1C2BF7A70((uint64_t)v160, (uint64_t)v174, &qword_1EB6817F0);
  if (v175)
  {
    __swift_project_boxed_opaque_existential_1(v174, v175);
    sub_1C2C26758();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
  }
  else
  {
    sub_1C2BF9534((uint64_t)v174, &qword_1EB6817F0);
  }
  sub_1C2BF7A70((uint64_t)v160, (uint64_t)v174, &qword_1EB6817F0);
  CGFloat v145 = v3;
  if (v175)
  {
    __swift_project_boxed_opaque_existential_1(v174, v175);
    sub_1C2C26738();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
  }
  else
  {
    sub_1C2BF9534((uint64_t)v174, &qword_1EB6817F0);
  }
  sub_1C2BF7A70((uint64_t)v1, (uint64_t)&v171, &qword_1EB6817F0);
  long long v36 = (unsigned int *)MEMORY[0x1E4F71B18];
  double v37 = (unsigned int *)MEMORY[0x1E4F71B40];
  v161 = v5;
  if (v172)
  {
    sub_1C2BF8100(&v171, (uint64_t)v174);
    if (v19)
    {
      uint64_t v38 = v175;
      double v39 = v37;
      uint64_t v40 = v176;
      double v41 = __swift_project_boxed_opaque_existential_1(v174, v175);
      uint64_t v172 = v38;
      uint64_t v173 = *(void *)(v40 + 8);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v171);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v38 - 8) + 16))(boxed_opaque_existential_1, v41, v38);
      v150 = (char *)(v1 + 52);
      uint64_t v170 = 0;
      long long v168 = 0u;
      long long v169 = 0u;
      uint64_t v43 = *v36;
      double v44 = v152;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v163 + 104))(v152, v43, v164);
      double v45 = (void (*)(unsigned char *, void, uint64_t))v5[13];
      double v46 = v153;
      uint64_t v47 = v154;
      v45(v153, *v39, v154);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681158);
      uint64_t v48 = v162;
      uint64_t v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_1C2C2F760;
      sub_1C2C26998();
      v167[0] = v49;
      sub_1C2BF77FC((unint64_t *)&qword_1EB681140, MEMORY[0x1E4F71B28]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681148);
      sub_1C2BF9490();
      id v50 = v156;
      uint64_t v51 = v157;
      sub_1C2C26F58();
      double v52 = v146;
      sub_1C2C269F8();
      (*(void (**)(unsigned char *, uint64_t))(v48 + 8))(v50, v51);
      ((void (*)(unsigned char *, uint64_t))v161[1])(v46, v47);
      (*(void (**)(unsigned char *, uint64_t))(v163 + 8))(v44, v164);
      sub_1C2BF9534((uint64_t)&v168, &qword_1EB681138);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
      uint64_t v53 = (char *)sub_1C2BFBE3C(0, 1, 1, MEMORY[0x1E4FBC860]);
      unint64_t v55 = *((void *)v53 + 2);
      unint64_t v54 = *((void *)v53 + 3);
      if (v55 >= v54 >> 1) {
        uint64_t v53 = (char *)sub_1C2BFBE3C(v54 > 1, v55 + 1, 1, v53);
      }
      uint64_t v56 = v159;
      *((void *)v53 + 2) = v55 + 1;
      (*(void (**)(char *, unsigned char *, uint64_t))(v56 + 32))(&v53[((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v55], v52, v155);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
      uint64_t v5 = v161;
      double v37 = (unsigned int *)MEMORY[0x1E4F71B40];
      long long v36 = (unsigned int *)MEMORY[0x1E4F71B18];
      goto LABEL_54;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
LABEL_56:
    uint64_t v57 = (uint64_t)(v1 + 67);
    v150 = (char *)MEMORY[0x1E4FBC860];
    goto LABEL_57;
  }
  sub_1C2BF9534((uint64_t)&v171, &qword_1EB6817F0);
  if ((v19 & 1) == 0) {
    goto LABEL_56;
  }
  uint64_t v53 = (char *)MEMORY[0x1E4FBC860];
LABEL_54:
  v150 = v53;
  uint64_t v57 = (uint64_t)(v1 + 72);
LABEL_57:
  sub_1C2BF7C98(v57, (uint64_t)v174);
  uint64_t v58 = v1[8];
  uint64_t v59 = v1[9];
  uint64_t v60 = __swift_project_boxed_opaque_existential_1(v1 + 5, v58);
  uint64_t v172 = v58;
  uint64_t v173 = *(void *)(v59 + 8);
  v61 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v171);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v58 - 8) + 16))(v61, v60, v58);
  uint64_t v170 = 0;
  long long v168 = 0u;
  long long v169 = 0u;
  uint64_t v62 = v163;
  v63 = *(void (**)(void))(v163 + 104);
  unint64_t v64 = v152;
  unsigned int v144 = *v36;
  CGFloat v146 = (unsigned char *)(v163 + 104);
  uint64_t v143 = (void (*)(unsigned char *, void, uint64_t))v63;
  v63(v152);
  v65 = v5 + 13;
  v66 = (void (*)(void))v5[13];
  uint64_t v67 = v153;
  uint64_t v68 = v154;
  unsigned int v141 = *v37;
  v142 = v65;
  id v140 = (void (*)(unsigned char *, void, uint64_t))v66;
  v66(v153);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681158);
  uint64_t v70 = v162;
  uint64_t v71 = *(unsigned __int8 *)(v162 + 80);
  uint64_t v72 = (v71 + 32) & ~v71;
  uint64_t v137 = v72 + *(void *)(v162 + 72);
  uint64_t v138 = v69;
  uint64_t v136 = v71 | 7;
  uint64_t v73 = swift_allocObject();
  long long v134 = xmmword_1C2C2F760;
  *(_OWORD *)(v73 + 16) = xmmword_1C2C2F760;
  uint64_t v139 = v72;
  sub_1C2C26998();
  v167[0] = v73;
  uint64_t v74 = sub_1C2BF77FC((unint64_t *)&qword_1EB681140, MEMORY[0x1E4F71B28]);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681148);
  unint64_t v76 = sub_1C2BF9490();
  id v77 = v156;
  unint64_t v131 = v76;
  uint64_t v132 = v75;
  uint64_t v78 = v157;
  uint64_t v133 = v74;
  sub_1C2C26F58();
  sub_1C2C269F8();
  uint64_t v135 = *(void (**)(unsigned char *, uint64_t))(v70 + 8);
  uint64_t v162 = v70 + 8;
  v135(v77, v78);
  uint64_t v79 = (void (*)(void, void))v161[1];
  ++v161;
  uint64_t v129 = (void (*)(unsigned char *, uint64_t))v79;
  v79(v67, v68);
  double v80 = *(void (**)(unsigned char *, uint64_t))(v62 + 8);
  uint64_t v163 = v62 + 8;
  uint64_t v130 = v80;
  v80(v64, v164);
  sub_1C2BF9534((uint64_t)&v168, &qword_1EB681138);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
  size_t v81 = (size_t)v150;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    size_t v81 = sub_1C2BFBE3C(0, *(void *)(v81 + 16) + 1, 1, (void *)v81);
  }
  uint64_t v82 = v159;
  unint64_t v84 = *(void *)(v81 + 16);
  unint64_t v83 = *(void *)(v81 + 24);
  if (v84 >= v83 >> 1) {
    size_t v81 = sub_1C2BFBE3C(v83 > 1, v84 + 1, 1, (void *)v81);
  }
  *(void *)(v81 + 16) = v84 + 1;
  char v87 = *(unsigned char **)(v82 + 32);
  uint64_t v86 = v82 + 32;
  CGFloat v85 = v87;
  CGFloat v88 = (char *)((*(unsigned __int8 *)(v86 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 48));
  uint64_t v89 = *(void *)(v86 + 40);
  ((void (*)(char *, unsigned char *, uint64_t))v87)(&v88[v81 + v89 * v84], v151, v155);
  if (v149)
  {
    uint64_t v149 = v89;
    v150 = v88;
    v151 = v85;
    uint64_t v159 = v86;
    uint64_t v90 = v1[13];
    uint64_t v91 = v1[14];
    CGFloat v92 = __swift_project_boxed_opaque_existential_1(v158, v90);
    uint64_t v172 = v90;
    uint64_t v93 = *(void *)(v91 + 8);
    CGRect v94 = v129;
    uint64_t v173 = v93;
    CGRect v95 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v171);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v90 - 8) + 16))(v95, v92, v90);
    v158 = v1 + 77;
    uint64_t v170 = 0;
    long long v168 = 0u;
    long long v169 = 0u;
    uint64_t v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = v134;
    sub_1C2C269B8();
    v167[0] = v96;
    CGFloat v98 = v156;
    uint64_t v97 = v157;
    sub_1C2C26F58();
    double v99 = (void *)v81;
    double v100 = v152;
    uint64_t v101 = v164;
    v143(v152, v144, v164);
    CGFloat v102 = v153;
    uint64_t v103 = v154;
    v140(v153, v141, v154);
    sub_1C2C269F8();
    v94(v102, v103);
    double v104 = v100;
    size_t v81 = (size_t)v99;
    v130(v104, v101);
    v135(v98, v97);
    sub_1C2BF9534((uint64_t)&v168, &qword_1EB681138);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
    unint64_t v105 = v99[2];
    unint64_t v106 = *(void *)(v81 + 24);
    if (v105 >= v106 >> 1) {
      size_t v81 = sub_1C2BFBE3C(v106 > 1, v105 + 1, 1, (void *)v81);
    }
    uint64_t v86 = v159;
    uint64_t v89 = v149;
    CGFloat v88 = v150;
    *(void *)(v81 + 16) = v105 + 1;
    CGFloat v85 = v151;
    ((void (*)(char *, unsigned char *, uint64_t))v151)(&v88[v81 + v105 * v89], v148, v155);
  }
  sub_1C2BF7A70((uint64_t)v160, (uint64_t)&v168, &qword_1EB6817F0);
  if (*((void *)&v169 + 1))
  {
    sub_1C2BF8100(&v168, (uint64_t)&v171);
    if (v128)
    {
      uint64_t v149 = v89;
      v150 = v88;
      v151 = v85;
      uint64_t v159 = v86;
      uint64_t v107 = v172;
      uint64_t v108 = v173;
      double v109 = __swift_project_boxed_opaque_existential_1(&v171, v172);
      *((void *)&v169 + 1) = v107;
      uint64_t v170 = *(void *)(v108 + 8);
      double v110 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v168);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v107 - 8) + 16))(v110, v109, v107);
      v161 = v1 + 82;
      memset(v167, 0, 40);
      uint64_t v111 = swift_allocObject();
      *(_OWORD *)(v111 + 16) = v134;
      sub_1C2C269B8();
      v166[0] = v111;
      double v113 = v156;
      uint64_t v112 = v157;
      sub_1C2C26F58();
      double v114 = v152;
      uint64_t v115 = v164;
      v143(v152, v144, v164);
      v117 = v153;
      uint64_t v116 = v154;
      v140(v153, v141, v154);
      v118 = v147;
      sub_1C2C269F8();
      v129(v117, v116);
      v130(v114, v115);
      v135(v113, v112);
      sub_1C2BF9534((uint64_t)v167, &qword_1EB681138);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v168);
      unint64_t v120 = *(void *)(v81 + 16);
      unint64_t v119 = *(void *)(v81 + 24);
      if (v120 >= v119 >> 1) {
        size_t v81 = sub_1C2BFBE3C(v119 > 1, v120 + 1, 1, (void *)v81);
      }
      uint64_t v122 = v149;
      double v121 = v150;
      *(void *)(v81 + 16) = v120 + 1;
      ((void (*)(char *, unsigned char *, uint64_t))v151)(&v121[v81 + v120 * v122], v118, v155);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
  }
  else
  {
    sub_1C2BF9534((uint64_t)&v168, &qword_1EB6817F0);
  }
  uint64_t v123 = sub_1C2C26A28();
  uint64_t v124 = MEMORY[0x1E4F71B58];
  double v125 = v145;
  v145[3] = v123;
  v125[4] = v124;
  __swift_allocate_boxed_opaque_existential_1(v125);
  sub_1C2C269E8();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
}

uint64_t sub_1C2BF45B8@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v55 = a1;
  uint64_t v57 = sub_1C2C26FF8();
  uint64_t v56 = *(char **)(v57 - 8);
  MEMORY[0x1F4188790](v57);
  id v11 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C2C26D58();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1C2C26478();
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x1F4188790](v54);
  uint64_t v17 = (char *)v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2BF3100();
  __swift_project_boxed_opaque_existential_1(v64, v64[3]);
  sub_1C2C26C88();
  sub_1C2C26458();
  double v19 = v18;
  sub_1C2C26428();
  double v21 = v19 + v20;
  sub_1C2C26468();
  sub_1C2C26D48();
  double v23 = v22;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  char v24 = v56;
  double v25 = v21 - v23;
  __swift_project_boxed_opaque_existential_1(v5 + 92, v5[95]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  double v27 = v26;
  id v28 = (void (*)(char *, uint64_t))*((void *)v24 + 1);
  uint64_t v56 = v11;
  v28(v11, v57);
  double v29 = v25 + v27;
  sub_1C2C26458();
  double v31 = v30;
  sub_1C2BF7A70((uint64_t)(v5 + 40), (uint64_t)&v60, &qword_1EB6817E8);
  if (v61)
  {
    sub_1C2BF8100(&v60, (uint64_t)v62);
    __swift_project_boxed_opaque_existential_1(v62, v63);
    if (sub_1C2C26488())
    {
      __swift_project_boxed_opaque_existential_1(v62, v63);
      if ((sub_1C2C264C8() & 1) == 0)
      {
        __swift_project_boxed_opaque_existential_1(v62, v63);
        sub_1C2C264E8();
        double v33 = v32;
        CGFloat v52 = v31;
        __swift_project_boxed_opaque_existential_1(v62, v63);
        sub_1C2C26458();
        sub_1C2C26EF8();
        sub_1C2C264B8();
        __swift_project_boxed_opaque_existential_1(v5 + 114, v5[117]);
        uint64_t v34 = v56;
        sub_1C2C082FC();
        sub_1C2C265D8();
        double v36 = v35;
        v28(v34, v57);
        double v31 = v52 + v33 + v36;
      }
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_1C2BF9534((uint64_t)&v60, &qword_1EB6817E8);
  }
  sub_1C2BF7A70((uint64_t)(v5 + 20), (uint64_t)&v60, &qword_1EB6817F0);
  if (v61)
  {
    sub_1C2BF8100(&v60, (uint64_t)v62);
    __swift_project_boxed_opaque_existential_1(v62, v63);
    if (sub_1C2C26488())
    {
      __swift_project_boxed_opaque_existential_1(v62, v63);
      if ((sub_1C2C264C8() & 1) == 0) {
        goto LABEL_24;
      }
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_1C2BF9534((uint64_t)&v60, &qword_1EB6817F0);
  }
  sub_1C2BF7A70((uint64_t)(v5 + 35), (uint64_t)&v60, &qword_1EB6817E8);
  if (v61)
  {
    sub_1C2BF8100(&v60, (uint64_t)v62);
    __swift_project_boxed_opaque_existential_1(v62, v63);
    if ((sub_1C2C26488() & 1) == 0
      || (__swift_project_boxed_opaque_existential_1(v62, v63), (sub_1C2C264C8() & 1) != 0))
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
      goto LABEL_17;
    }
LABEL_24:
    __swift_project_boxed_opaque_existential_1(v62, v63);
    sub_1C2C264E8();
    uint64_t v57 = v46;
    __swift_project_boxed_opaque_existential_1(v62, v63);
    sub_1C2C26EF8();
    sub_1C2C264B8();
LABEL_27:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
    goto LABEL_28;
  }
  sub_1C2BF9534((uint64_t)&v60, &qword_1EB6817E8);
LABEL_17:
  sub_1C2BF7A70((uint64_t)(v5 + 25), (uint64_t)&v60, &qword_1EB6817E8);
  if (v61)
  {
    sub_1C2BF8100(&v60, (uint64_t)v62);
    __swift_project_boxed_opaque_existential_1(v62, v63);
    if ((sub_1C2C264C8() & 1) == 0)
    {
      sub_1C2BF7A70((uint64_t)(v5 + 30), (uint64_t)&v58, &qword_1EB6817E8);
      if (v59)
      {
        sub_1C2BF8100(&v58, (uint64_t)&v60);
        __swift_project_boxed_opaque_existential_1(&v60, v61);
        if ((sub_1C2C264C8() & 1) == 0)
        {
          __swift_project_boxed_opaque_existential_1(v62, v63);
          sub_1C2C264E8();
          CGFloat v38 = v37;
          CGFloat v40 = v39;
          CGFloat v52 = a5;
          CGFloat v42 = v29 - (v39 - v41);
          __swift_project_boxed_opaque_existential_1(v62, v63);
          sub_1C2C26EF8();
          sub_1C2C264B8();
          __swift_project_boxed_opaque_existential_1(&v60, v61);
          sub_1C2C264E8();
          v51[2] = v43;
          v65.origin.CGFloat x = v31;
          v51[1] = v44;
          v65.origin.CGFloat y = v42;
          v65.size.CGFloat width = v38;
          v65.size.CGFloat height = v40;
          CGRectGetMaxX(v65);
          __swift_project_boxed_opaque_existential_1(v5 + 109, v5[112]);
          double v45 = v56;
          sub_1C2C082FC();
          sub_1C2C265D8();
          v28(v45, v57);
          __swift_project_boxed_opaque_existential_1(&v60, v61);
          a5 = v52;
          sub_1C2C26EF8();
          sub_1C2C264B8();
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }
      else
      {
        sub_1C2BF9534((uint64_t)&v58, &qword_1EB6817E8);
      }
    }
    goto LABEL_27;
  }
  sub_1C2BF9534((uint64_t)&v60, &qword_1EB6817E8);
LABEL_28:
  uint64_t v47 = v54;
  uint64_t v48 = v53;
  v66.origin.CGFloat x = a2;
  v66.origin.CGFloat y = a3;
  v66.size.CGFloat width = a4;
  v66.size.CGFloat height = a5;
  double Width = CGRectGetWidth(v66);
  MEMORY[0x1C8767BC0](a2, a3, Width, v29, v29, 0.0);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v17, v47);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
}

double sub_1C2BF4FE8(void *a1, double a2)
{
  return sub_1C2BF7EF4((void *)(v2 + 360), a1, a2);
}

void *sub_1C2BF4FF4@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, CGFloat a6@<D3>)
{
  id v12 = objc_msgSend(a1, sel_traitCollection);
  char v13 = sub_1C2C26EC8();

  if (v13)
  {
    return sub_1C2BF178C(a1, a2, a3, a4, a5, a6);
  }
  else
  {
    return sub_1C2BF22CC(a1, a2, a3, a4, a5, a6);
  }
}

double sub_1C2BF50CC(void *a1, double a2)
{
  return sub_1C2BF13FC(a1, a2);
}

uint64_t sub_1C2BF50E8(uint64_t a1, uint64_t a2)
{
  return sub_1C2BF78A4(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1C2BF5100(uint64_t a1, id *a2)
{
  uint64_t result = sub_1C2C26DE8();
  *a2 = 0;
  return result;
}

uint64_t sub_1C2BF5178(uint64_t a1, id *a2)
{
  char v3 = sub_1C2C26DF8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1C2BF51F8@<X0>(uint64_t *a1@<X8>)
{
  sub_1C2C26E08();
  uint64_t v2 = sub_1C2C26DD8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1C2BF5240()
{
  uint64_t v0 = sub_1C2C26E08();
  uint64_t v2 = v1;
  if (v0 == sub_1C2C26E08() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1C2C27008();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1C2BF52CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C2C26E08();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C2BF52F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1C2C26DD8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t destroy for AdLockupLayout(void *a1)
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 2));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 12));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 17));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 22));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 27));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 32));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 37));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 42));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 47));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 52));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 59));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 64));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 69));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 74));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 79));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 84));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 89));
  if (a1[97]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 94));
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 99));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 104));
  if (a1[112]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 109));
  }
  if (a1[117]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 114));
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 119));
  if (a1[127]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 124));
  }
  if (a1[132]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 129));
  }
  if (a1[137]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 134));
  }
  if (a1[142]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 139));
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 144));
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

uint64_t initializeWithCopy for AdLockupLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 136, a2 + 136);
  long long v8 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 176, a2 + 176);
  long long v9 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 216, a2 + 216);
  uint64_t v10 = *(void *)(a2 + 280);
  uint64_t v11 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = v10;
  *(void *)(a1 + 288) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 256, a2 + 256);
  long long v12 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 296, a2 + 296);
  uint64_t v13 = *(void *)(a2 + 360);
  uint64_t v14 = *(void *)(a2 + 368);
  *(void *)(a1 + 360) = v13;
  *(void *)(a1 + 368) = v14;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 336, a2 + 336);
  long long v15 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v15;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 376, a2 + 376);
  uint64_t v16 = *(void *)(a2 + 440);
  uint64_t v17 = *(void *)(a2 + 448);
  *(void *)(a1 + 440) = v16;
  *(void *)(a1 + 448) = v17;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 416, a2 + 416);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  long long v18 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 496) = v18;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 472, a2 + 472);
  uint64_t v19 = *(void *)(a2 + 536);
  *(void *)(a1 + 536) = v19;
  *(void *)(a1 + 544) = *(void *)(a2 + 544);
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 512, a2 + 512);
  long long v20 = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 576) = v20;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 552, a2 + 552);
  uint64_t v21 = *(void *)(a2 + 616);
  *(void *)(a1 + 616) = v21;
  *(void *)(a1 + 624) = *(void *)(a2 + 624);
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 592, a2 + 592);
  long long v22 = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 656) = v22;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 632, a2 + 632);
  uint64_t v23 = *(void *)(a2 + 696);
  *(void *)(a1 + 696) = v23;
  *(void *)(a1 + 704) = *(void *)(a2 + 704);
  (**(void (***)(uint64_t, uint64_t))(v23 - 8))(a1 + 672, a2 + 672);
  long long v24 = *(_OWORD *)(a2 + 736);
  *(_OWORD *)(a1 + 736) = v24;
  (**(void (***)(uint64_t, uint64_t))(v24 - 8))(a1 + 712, a2 + 712);
  double v25 = (_OWORD *)(a1 + 752);
  double v26 = (_OWORD *)(a2 + 752);
  uint64_t v27 = *(void *)(a2 + 776);
  if (v27)
  {
    *(void *)(a1 + 776) = v27;
    *(void *)(a1 + 784) = *(void *)(a2 + 784);
    (**(void (***)(_OWORD *, _OWORD *))(v27 - 8))(v25, v26);
  }
  else
  {
    long long v28 = *(_OWORD *)(a2 + 768);
    _OWORD *v25 = *v26;
    *(_OWORD *)(a1 + 768) = v28;
    *(void *)(a1 + 784) = *(void *)(a2 + 784);
  }
  long long v29 = *(_OWORD *)(a2 + 816);
  *(_OWORD *)(a1 + 816) = v29;
  (**(void (***)(uint64_t, uint64_t))(v29 - 8))(a1 + 792, a2 + 792);
  uint64_t v30 = *(void *)(a2 + 856);
  *(void *)(a1 + 856) = v30;
  *(void *)(a1 + 864) = *(void *)(a2 + 864);
  (**(void (***)(uint64_t, uint64_t))(v30 - 8))(a1 + 832, a2 + 832);
  double v31 = (_OWORD *)(a1 + 872);
  double v32 = (_OWORD *)(a2 + 872);
  uint64_t v33 = *(void *)(a2 + 896);
  if (v33)
  {
    *(void *)(a1 + 896) = v33;
    *(void *)(a1 + 904) = *(void *)(a2 + 904);
    (**(void (***)(_OWORD *, _OWORD *))(v33 - 8))(v31, v32);
  }
  else
  {
    long long v34 = *(_OWORD *)(a2 + 888);
    _OWORD *v31 = *v32;
    *(_OWORD *)(a1 + 888) = v34;
    *(void *)(a1 + 904) = *(void *)(a2 + 904);
  }
  double v35 = (_OWORD *)(a1 + 912);
  double v36 = (_OWORD *)(a2 + 912);
  uint64_t v37 = *(void *)(a2 + 936);
  if (v37)
  {
    *(void *)(a1 + 936) = v37;
    *(void *)(a1 + 944) = *(void *)(a2 + 944);
    (**(void (***)(_OWORD *, _OWORD *))(v37 - 8))(v35, v36);
  }
  else
  {
    long long v38 = *(_OWORD *)(a2 + 928);
    *double v35 = *v36;
    *(_OWORD *)(a1 + 928) = v38;
    *(void *)(a1 + 944) = *(void *)(a2 + 944);
  }
  long long v39 = *(_OWORD *)(a2 + 976);
  *(_OWORD *)(a1 + 976) = v39;
  (**(void (***)(uint64_t, uint64_t))(v39 - 8))(a1 + 952, a2 + 952);
  CGFloat v40 = (_OWORD *)(a1 + 992);
  double v41 = (_OWORD *)(a2 + 992);
  uint64_t v42 = *(void *)(a2 + 1016);
  if (v42)
  {
    *(void *)(a1 + 1016) = v42;
    *(void *)(a1 + 1024) = *(void *)(a2 + 1024);
    (**(void (***)(_OWORD *, _OWORD *))(v42 - 8))(v40, v41);
  }
  else
  {
    long long v43 = *(_OWORD *)(a2 + 1008);
    *CGFloat v40 = *v41;
    *(_OWORD *)(a1 + 1008) = v43;
    *(void *)(a1 + 1024) = *(void *)(a2 + 1024);
  }
  uint64_t v44 = (_OWORD *)(a1 + 1032);
  double v45 = (_OWORD *)(a2 + 1032);
  uint64_t v46 = *(void *)(a2 + 1056);
  if (v46)
  {
    *(void *)(a1 + 1056) = v46;
    *(void *)(a1 + 1064) = *(void *)(a2 + 1064);
    (**(void (***)(_OWORD *, _OWORD *))(v46 - 8))(v44, v45);
  }
  else
  {
    long long v47 = *(_OWORD *)(a2 + 1048);
    *uint64_t v44 = *v45;
    *(_OWORD *)(a1 + 1048) = v47;
    *(void *)(a1 + 1064) = *(void *)(a2 + 1064);
  }
  uint64_t v48 = (_OWORD *)(a1 + 1072);
  uint64_t v49 = (_OWORD *)(a2 + 1072);
  uint64_t v50 = *(void *)(a2 + 1096);
  if (v50)
  {
    *(void *)(a1 + 1096) = v50;
    *(void *)(a1 + 1104) = *(void *)(a2 + 1104);
    (**(void (***)(_OWORD *, _OWORD *))(v50 - 8))(v48, v49);
  }
  else
  {
    long long v51 = *(_OWORD *)(a2 + 1088);
    *uint64_t v48 = *v49;
    *(_OWORD *)(a1 + 1088) = v51;
    *(void *)(a1 + 1104) = *(void *)(a2 + 1104);
  }
  CGFloat v52 = (_OWORD *)(a1 + 1112);
  uint64_t v53 = (_OWORD *)(a2 + 1112);
  uint64_t v54 = *(void *)(a2 + 1136);
  if (v54)
  {
    *(void *)(a1 + 1136) = v54;
    *(void *)(a1 + 1144) = *(void *)(a2 + 1144);
    (**(void (***)(_OWORD *, _OWORD *))(v54 - 8))(v52, v53);
  }
  else
  {
    long long v55 = *(_OWORD *)(a2 + 1128);
    *CGFloat v52 = *v53;
    *(_OWORD *)(a1 + 1128) = v55;
    *(void *)(a1 + 1144) = *(void *)(a2 + 1144);
  }
  uint64_t v56 = *(void *)(a2 + 1176);
  *(void *)(a1 + 1176) = v56;
  *(void *)(a1 + 1184) = *(void *)(a2 + 1184);
  (**(void (***)(uint64_t, uint64_t))(v56 - 8))(a1 + 1152, a2 + 1152);
  return a1;
}

uint64_t assignWithCopy for AdLockupLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 136), (uint64_t *)(a2 + 136));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 176), (uint64_t *)(a2 + 176));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 216), (uint64_t *)(a2 + 216));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 256), (uint64_t *)(a2 + 256));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 296), (uint64_t *)(a2 + 296));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 336), (uint64_t *)(a2 + 336));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 376), (uint64_t *)(a2 + 376));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 416), (uint64_t *)(a2 + 416));
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 472), (uint64_t *)(a2 + 472));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 512), (uint64_t *)(a2 + 512));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 552), (uint64_t *)(a2 + 552));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 592), (uint64_t *)(a2 + 592));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 632), (uint64_t *)(a2 + 632));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 672), (uint64_t *)(a2 + 672));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 712), (uint64_t *)(a2 + 712));
  uint64_t v4 = *(void *)(a2 + 776);
  if (*(void *)(a1 + 776))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 752), (uint64_t *)(a2 + 752));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 752);
  }
  else if (v4)
  {
    *(void *)(a1 + 776) = v4;
    *(void *)(a1 + 784) = *(void *)(a2 + 784);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 752, a2 + 752);
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)(a2 + 752);
  long long v6 = *(_OWORD *)(a2 + 768);
  *(void *)(a1 + 784) = *(void *)(a2 + 784);
  *(_OWORD *)(a1 + 752) = v5;
  *(_OWORD *)(a1 + 768) = v6;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 792), (uint64_t *)(a2 + 792));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 832), (uint64_t *)(a2 + 832));
  uint64_t v7 = *(void *)(a2 + 896);
  if (*(void *)(a1 + 896))
  {
    if (v7)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 872), (uint64_t *)(a2 + 872));
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 872);
  }
  else if (v7)
  {
    *(void *)(a1 + 896) = v7;
    *(void *)(a1 + 904) = *(void *)(a2 + 904);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 872, a2 + 872);
    goto LABEL_15;
  }
  long long v8 = *(_OWORD *)(a2 + 872);
  long long v9 = *(_OWORD *)(a2 + 888);
  *(void *)(a1 + 904) = *(void *)(a2 + 904);
  *(_OWORD *)(a1 + 872) = v8;
  *(_OWORD *)(a1 + 888) = v9;
LABEL_15:
  uint64_t v10 = *(void *)(a2 + 936);
  if (*(void *)(a1 + 936))
  {
    if (v10)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 912), (uint64_t *)(a2 + 912));
      goto LABEL_22;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 912);
  }
  else if (v10)
  {
    *(void *)(a1 + 936) = v10;
    *(void *)(a1 + 944) = *(void *)(a2 + 944);
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 912, a2 + 912);
    goto LABEL_22;
  }
  long long v11 = *(_OWORD *)(a2 + 912);
  long long v12 = *(_OWORD *)(a2 + 928);
  *(void *)(a1 + 944) = *(void *)(a2 + 944);
  *(_OWORD *)(a1 + 912) = v11;
  *(_OWORD *)(a1 + 928) = v12;
LABEL_22:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 952), (uint64_t *)(a2 + 952));
  uint64_t v13 = *(void *)(a2 + 1016);
  if (*(void *)(a1 + 1016))
  {
    if (v13)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 992), (uint64_t *)(a2 + 992));
      goto LABEL_29;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 992);
  }
  else if (v13)
  {
    *(void *)(a1 + 1016) = v13;
    *(void *)(a1 + 1024) = *(void *)(a2 + 1024);
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 992, a2 + 992);
    goto LABEL_29;
  }
  long long v14 = *(_OWORD *)(a2 + 992);
  long long v15 = *(_OWORD *)(a2 + 1008);
  *(void *)(a1 + 1024) = *(void *)(a2 + 1024);
  *(_OWORD *)(a1 + 992) = v14;
  *(_OWORD *)(a1 + 1008) = v15;
LABEL_29:
  uint64_t v16 = *(void *)(a2 + 1056);
  if (*(void *)(a1 + 1056))
  {
    if (v16)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1032), (uint64_t *)(a2 + 1032));
      goto LABEL_36;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 1032);
  }
  else if (v16)
  {
    *(void *)(a1 + 1056) = v16;
    *(void *)(a1 + 1064) = *(void *)(a2 + 1064);
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 1032, a2 + 1032);
    goto LABEL_36;
  }
  long long v17 = *(_OWORD *)(a2 + 1032);
  long long v18 = *(_OWORD *)(a2 + 1048);
  *(void *)(a1 + 1064) = *(void *)(a2 + 1064);
  *(_OWORD *)(a1 + 1032) = v17;
  *(_OWORD *)(a1 + 1048) = v18;
LABEL_36:
  uint64_t v19 = *(void *)(a2 + 1096);
  if (*(void *)(a1 + 1096))
  {
    if (v19)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1072), (uint64_t *)(a2 + 1072));
      goto LABEL_43;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 1072);
  }
  else if (v19)
  {
    *(void *)(a1 + 1096) = v19;
    *(void *)(a1 + 1104) = *(void *)(a2 + 1104);
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 1072, a2 + 1072);
    goto LABEL_43;
  }
  long long v20 = *(_OWORD *)(a2 + 1072);
  long long v21 = *(_OWORD *)(a2 + 1088);
  *(void *)(a1 + 1104) = *(void *)(a2 + 1104);
  *(_OWORD *)(a1 + 1072) = v20;
  *(_OWORD *)(a1 + 1088) = v21;
LABEL_43:
  uint64_t v22 = *(void *)(a2 + 1136);
  if (!*(void *)(a1 + 1136))
  {
    if (v22)
    {
      *(void *)(a1 + 1136) = v22;
      *(void *)(a1 + 1144) = *(void *)(a2 + 1144);
      (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 1112, a2 + 1112);
      goto LABEL_50;
    }
LABEL_49:
    long long v23 = *(_OWORD *)(a2 + 1112);
    long long v24 = *(_OWORD *)(a2 + 1128);
    *(void *)(a1 + 1144) = *(void *)(a2 + 1144);
    *(_OWORD *)(a1 + 1112) = v23;
    *(_OWORD *)(a1 + 1128) = v24;
    goto LABEL_50;
  }
  if (!v22)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 1112);
    goto LABEL_49;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1112), (uint64_t *)(a2 + 1112));
LABEL_50:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1152), (uint64_t *)(a2 + 1152));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          void *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

void *__swift_memcpy1192_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x4A8uLL);
}

uint64_t assignWithTake for AdLockupLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  long long v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v6;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  long long v7 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v7;
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  long long v8 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v8;
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  long long v9 = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 352) = v9;
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  long long v10 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v10;
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  long long v11 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v11;
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  *(void *)&long long v11 = *(void *)(a2 + 464);
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  *(void *)(a1 + 464) = v11;
  __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  long long v12 = *(_OWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 472) = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 488) = v12;
  *(void *)(a1 + 504) = *(void *)(a2 + 504);
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  long long v13 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 512) = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = v13;
  *(void *)(a1 + 544) = *(void *)(a2 + 544);
  __swift_destroy_boxed_opaque_existential_1(a1 + 552);
  long long v14 = *(_OWORD *)(a2 + 568);
  *(_OWORD *)(a1 + 552) = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 568) = v14;
  *(void *)(a1 + 584) = *(void *)(a2 + 584);
  __swift_destroy_boxed_opaque_existential_1(a1 + 592);
  long long v15 = *(_OWORD *)(a2 + 608);
  *(_OWORD *)(a1 + 592) = *(_OWORD *)(a2 + 592);
  *(_OWORD *)(a1 + 608) = v15;
  *(void *)(a1 + 624) = *(void *)(a2 + 624);
  __swift_destroy_boxed_opaque_existential_1(a1 + 632);
  long long v16 = *(_OWORD *)(a2 + 648);
  *(_OWORD *)(a1 + 632) = *(_OWORD *)(a2 + 632);
  *(_OWORD *)(a1 + 648) = v16;
  *(void *)(a1 + 664) = *(void *)(a2 + 664);
  __swift_destroy_boxed_opaque_existential_1(a1 + 672);
  long long v17 = *(_OWORD *)(a2 + 688);
  *(_OWORD *)(a1 + 672) = *(_OWORD *)(a2 + 672);
  *(_OWORD *)(a1 + 688) = v17;
  *(void *)(a1 + 704) = *(void *)(a2 + 704);
  __swift_destroy_boxed_opaque_existential_1(a1 + 712);
  long long v18 = *(_OWORD *)(a2 + 728);
  *(_OWORD *)(a1 + 712) = *(_OWORD *)(a2 + 712);
  *(_OWORD *)(a1 + 728) = v18;
  *(void *)(a1 + 744) = *(void *)(a2 + 744);
  if (*(void *)(a1 + 776)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 752);
  }
  long long v19 = *(_OWORD *)(a2 + 768);
  *(_OWORD *)(a1 + 752) = *(_OWORD *)(a2 + 752);
  *(_OWORD *)(a1 + 768) = v19;
  *(void *)(a1 + 784) = *(void *)(a2 + 784);
  __swift_destroy_boxed_opaque_existential_1(a1 + 792);
  long long v20 = *(_OWORD *)(a2 + 808);
  *(_OWORD *)(a1 + 792) = *(_OWORD *)(a2 + 792);
  *(_OWORD *)(a1 + 808) = v20;
  *(void *)(a1 + 824) = *(void *)(a2 + 824);
  __swift_destroy_boxed_opaque_existential_1(a1 + 832);
  long long v21 = *(_OWORD *)(a2 + 848);
  *(_OWORD *)(a1 + 832) = *(_OWORD *)(a2 + 832);
  *(_OWORD *)(a1 + 848) = v21;
  *(void *)(a1 + 864) = *(void *)(a2 + 864);
  if (*(void *)(a1 + 896)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 872);
  }
  long long v22 = *(_OWORD *)(a2 + 888);
  *(_OWORD *)(a1 + 872) = *(_OWORD *)(a2 + 872);
  *(_OWORD *)(a1 + 888) = v22;
  *(void *)(a1 + 904) = *(void *)(a2 + 904);
  if (*(void *)(a1 + 936)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 912);
  }
  long long v23 = *(_OWORD *)(a2 + 928);
  *(_OWORD *)(a1 + 912) = *(_OWORD *)(a2 + 912);
  *(_OWORD *)(a1 + 928) = v23;
  *(void *)(a1 + 944) = *(void *)(a2 + 944);
  __swift_destroy_boxed_opaque_existential_1(a1 + 952);
  long long v24 = *(_OWORD *)(a2 + 968);
  *(_OWORD *)(a1 + 952) = *(_OWORD *)(a2 + 952);
  *(_OWORD *)(a1 + 968) = v24;
  *(void *)(a1 + 984) = *(void *)(a2 + 984);
  if (*(void *)(a1 + 1016)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 992);
  }
  long long v25 = *(_OWORD *)(a2 + 1008);
  *(_OWORD *)(a1 + 992) = *(_OWORD *)(a2 + 992);
  *(_OWORD *)(a1 + 1008) = v25;
  *(void *)(a1 + 1024) = *(void *)(a2 + 1024);
  if (*(void *)(a1 + 1056)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 1032);
  }
  long long v26 = *(_OWORD *)(a2 + 1048);
  *(_OWORD *)(a1 + 1032) = *(_OWORD *)(a2 + 1032);
  *(_OWORD *)(a1 + 1048) = v26;
  *(void *)(a1 + 1064) = *(void *)(a2 + 1064);
  if (*(void *)(a1 + 1096)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 1072);
  }
  long long v27 = *(_OWORD *)(a2 + 1088);
  *(_OWORD *)(a1 + 1072) = *(_OWORD *)(a2 + 1072);
  *(_OWORD *)(a1 + 1088) = v27;
  *(void *)(a1 + 1104) = *(void *)(a2 + 1104);
  if (*(void *)(a1 + 1136)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 1112);
  }
  *(void *)(a1 + 1144) = *(void *)(a2 + 1144);
  long long v28 = *(_OWORD *)(a2 + 1128);
  *(_OWORD *)(a1 + 1112) = *(_OWORD *)(a2 + 1112);
  *(_OWORD *)(a1 + 1128) = v28;
  __swift_destroy_boxed_opaque_existential_1(a1 + 1152);
  *(_OWORD *)(a1 + 1152) = *(_OWORD *)(a2 + 1152);
  *(_OWORD *)(a1 + 1168) = *(_OWORD *)(a2 + 1168);
  *(void *)(a1 + 1184) = *(void *)(a2 + 1184);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdLockupLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 1192)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 1160) = 0u;
    *(_OWORD *)(result + 1176) = 0u;
    *(_OWORD *)(result + 1144) = 0u;
    *(_OWORD *)(result + 1128) = 0u;
    *(_OWORD *)(result + 1112) = 0u;
    *(_OWORD *)(result + 1096) = 0u;
    *(_OWORD *)(result + 1080) = 0u;
    *(_OWORD *)(result + 1064) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 1192) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 1192) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdLockupLayout()
{
  return &type metadata for AdLockupLayout;
}

uint64_t destroy for AdLockupLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  __swift_destroy_boxed_opaque_existential_1(a1 + 552);
  __swift_destroy_boxed_opaque_existential_1(a1 + 592);
  __swift_destroy_boxed_opaque_existential_1(a1 + 632);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 672);
}

uint64_t initializeWithCopy for AdLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 136, a2 + 136);
  long long v8 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 176, a2 + 176);
  long long v9 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 216, a2 + 216);
  uint64_t v10 = *(void *)(a2 + 280);
  uint64_t v11 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = v10;
  *(void *)(a1 + 288) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 256, a2 + 256);
  long long v12 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 296, a2 + 296);
  uint64_t v13 = *(void *)(a2 + 360);
  uint64_t v14 = *(void *)(a2 + 368);
  *(void *)(a1 + 360) = v13;
  *(void *)(a1 + 368) = v14;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 336, a2 + 336);
  long long v15 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v15;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 376, a2 + 376);
  uint64_t v16 = *(void *)(a2 + 440);
  uint64_t v17 = *(void *)(a2 + 448);
  *(void *)(a1 + 440) = v16;
  *(void *)(a1 + 448) = v17;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 416, a2 + 416);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  long long v18 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 496) = v18;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 472, a2 + 472);
  uint64_t v19 = *(void *)(a2 + 536);
  *(void *)(a1 + 536) = v19;
  *(void *)(a1 + 544) = *(void *)(a2 + 544);
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 512, a2 + 512);
  long long v20 = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 576) = v20;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 552, a2 + 552);
  uint64_t v21 = *(void *)(a2 + 616);
  *(void *)(a1 + 616) = v21;
  *(void *)(a1 + 624) = *(void *)(a2 + 624);
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 592, a2 + 592);
  long long v22 = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 656) = v22;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 632, a2 + 632);
  uint64_t v23 = *(void *)(a2 + 696);
  *(void *)(a1 + 696) = v23;
  *(void *)(a1 + 704) = *(void *)(a2 + 704);
  (**(void (***)(uint64_t, uint64_t))(v23 - 8))(a1 + 672, a2 + 672);
  return a1;
}

uint64_t *assignWithCopy for AdLockupLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  __swift_assign_boxed_opaque_existential_1(a1 + 22, a2 + 22);
  __swift_assign_boxed_opaque_existential_1(a1 + 27, a2 + 27);
  __swift_assign_boxed_opaque_existential_1(a1 + 32, a2 + 32);
  __swift_assign_boxed_opaque_existential_1(a1 + 37, a2 + 37);
  __swift_assign_boxed_opaque_existential_1(a1 + 42, a2 + 42);
  __swift_assign_boxed_opaque_existential_1(a1 + 47, a2 + 47);
  __swift_assign_boxed_opaque_existential_1(a1 + 52, a2 + 52);
  a1[57] = a2[57];
  a1[58] = a2[58];
  __swift_assign_boxed_opaque_existential_1(a1 + 59, a2 + 59);
  __swift_assign_boxed_opaque_existential_1(a1 + 64, a2 + 64);
  __swift_assign_boxed_opaque_existential_1(a1 + 69, a2 + 69);
  __swift_assign_boxed_opaque_existential_1(a1 + 74, a2 + 74);
  __swift_assign_boxed_opaque_existential_1(a1 + 79, a2 + 79);
  __swift_assign_boxed_opaque_existential_1(a1 + 84, a2 + 84);
  return a1;
}

void *__swift_memcpy712_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x2C8uLL);
}

uint64_t assignWithTake for AdLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  long long v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v6;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  long long v7 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v7;
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  long long v8 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v8;
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  long long v9 = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 352) = v9;
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  long long v10 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v10;
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  long long v11 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v11;
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  *(void *)&long long v11 = *(void *)(a2 + 464);
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  *(void *)(a1 + 464) = v11;
  __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  long long v12 = *(_OWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 472) = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 488) = v12;
  *(void *)(a1 + 504) = *(void *)(a2 + 504);
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  long long v13 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 512) = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = v13;
  *(void *)(a1 + 544) = *(void *)(a2 + 544);
  __swift_destroy_boxed_opaque_existential_1(a1 + 552);
  long long v14 = *(_OWORD *)(a2 + 568);
  *(_OWORD *)(a1 + 552) = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 568) = v14;
  *(void *)(a1 + 584) = *(void *)(a2 + 584);
  __swift_destroy_boxed_opaque_existential_1(a1 + 592);
  long long v15 = *(_OWORD *)(a2 + 608);
  *(_OWORD *)(a1 + 592) = *(_OWORD *)(a2 + 592);
  *(_OWORD *)(a1 + 608) = v15;
  *(void *)(a1 + 624) = *(void *)(a2 + 624);
  __swift_destroy_boxed_opaque_existential_1(a1 + 632);
  long long v16 = *(_OWORD *)(a2 + 648);
  *(_OWORD *)(a1 + 632) = *(_OWORD *)(a2 + 632);
  *(_OWORD *)(a1 + 648) = v16;
  *(void *)(a1 + 664) = *(void *)(a2 + 664);
  __swift_destroy_boxed_opaque_existential_1(a1 + 672);
  long long v17 = *(_OWORD *)(a2 + 688);
  *(_OWORD *)(a1 + 672) = *(_OWORD *)(a2 + 672);
  *(_OWORD *)(a1 + 688) = v17;
  *(void *)(a1 + 704) = *(void *)(a2 + 704);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdLockupLayout.Metrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 712)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 712) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 712) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdLockupLayout.Metrics()
{
  return &type metadata for AdLockupLayout.Metrics;
}

void type metadata accessor for Size(uint64_t a1)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C2BF75A0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1C2BF75C0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1C2BF760C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1C2BF762C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_1C2BF7668(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1C2BF76B0(uint64_t a1)
{
  uint64_t v2 = sub_1C2BF77FC(&qword_1EA3308A0, type metadata accessor for Size);
  uint64_t v3 = sub_1C2BF77FC(&qword_1EA3308A8, type metadata accessor for Size);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1C2BF776C()
{
  return sub_1C2BF77FC(&qword_1EA330878, type metadata accessor for Size);
}

uint64_t sub_1C2BF77B4()
{
  return sub_1C2BF77FC(&qword_1EA330880, type metadata accessor for Size);
}

uint64_t sub_1C2BF77FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C2BF7844()
{
  return sub_1C2BF77FC(&qword_1EA330888, type metadata accessor for Size);
}

uint64_t sub_1C2BF788C(uint64_t a1, uint64_t a2)
{
  return sub_1C2BF78A4(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1C2BF78A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1C2C26E08();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1C2BF78E8()
{
  sub_1C2C26E08();
  sub_1C2C26E18();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2BF793C()
{
  sub_1C2C26E08();
  sub_1C2C27028();
  sub_1C2C26E18();
  uint64_t v0 = sub_1C2C27048();
  swift_bridgeObjectRelease();
  return v0;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1C2BF79F4(uint64_t a1, uint64_t a2)
{
  return a2;
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

uint64_t sub_1C2BF7A70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1C2BF7AD4()
{
  unint64_t result = qword_1EA330890;
  if (!qword_1EA330890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA330890);
  }
  return result;
}

uint64_t sub_1C2BF7B28()
{
  if (v0[5]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));
  if (v0[20]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  }
  if (v0[25]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 22));
  }
  if (v0[30]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 27));
  }
  if (v0[35]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 32));
  }
  if (v0[40]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 37));
  }
  if (v0[45]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 42));
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 49));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 54));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 59));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 64));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 69));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 74));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 79));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 84));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 89));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 94));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 99));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 106));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 111));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 116));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 121));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 126));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 131));

  return MEMORY[0x1F4186498](v0, 1088, 7);
}

uint64_t sub_1C2BF7C60(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2BF7C98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_1C2BF7CFC(void *a1)
{
  return a1;
}

uint64_t sub_1C2BF7D2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C2BF7D90(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C2BF7DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6817E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1C2BF7E8C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *sub_1C2BF7EC4(void *a1)
{
  return a1;
}

double sub_1C2BF7EF4(void *a1, void *a2, double a3)
{
  uint64_t v6 = sub_1C2C26FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  long long v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(a2, sel_traitCollection);
  sub_1C2C26EC8();

  __swift_project_boxed_opaque_existential_1(a1 + 12, a1[15]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  long long v11 = *(void (**)(char *, uint64_t))(v7 + 8);
  v11(v9, v6);
  __swift_project_boxed_opaque_existential_1(a1 + 32, a1[35]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  v11(v9, v6);
  __swift_project_boxed_opaque_existential_1(a1 + 47, a1[50]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  v11(v9, v6);
  return a3;
}

uint64_t sub_1C2BF8100(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AdLockupLayout.AdLockupInnerContentLayout(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AdLockupLayout.AdLockupInnerContentLayout(void *a1)
{
  if (a1[3]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 5));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 10));
  if (a1[18]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 15));
  }
  if (a1[23]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 20));
  }
  if (a1[28]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 25));
  }
  if (a1[33]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 30));
  }
  if (a1[38]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 35));
  }
  if (a1[43]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 40));
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 47));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 52));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 57));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 62));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 67));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 72));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 77));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 82));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 87));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 92));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 97));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 104));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 109));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 114));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 119));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 124));

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 129));
}

uint64_t initializeWithCopy for AdLockupLayout.AdLockupInnerContentLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, a2 + 40);
  long long v8 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 80, a2 + 80);
  long long v9 = (_OWORD *)(a1 + 120);
  id v10 = (_OWORD *)(a2 + 120);
  uint64_t v11 = *(void *)(a2 + 144);
  if (v11)
  {
    uint64_t v12 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = v11;
    *(void *)(a1 + 152) = v12;
    (**(void (***)(_OWORD *, _OWORD *))(v11 - 8))(v9, v10);
  }
  else
  {
    long long v13 = *(_OWORD *)(a2 + 136);
    _OWORD *v9 = *v10;
    *(_OWORD *)(a1 + 136) = v13;
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
  }
  long long v14 = (_OWORD *)(a1 + 160);
  long long v15 = (_OWORD *)(a2 + 160);
  uint64_t v16 = *(void *)(a2 + 184);
  if (v16)
  {
    uint64_t v17 = *(void *)(a2 + 192);
    *(void *)(a1 + 184) = v16;
    *(void *)(a1 + 192) = v17;
    (**(void (***)(_OWORD *, _OWORD *))(v16 - 8))(v14, v15);
  }
  else
  {
    long long v18 = *(_OWORD *)(a2 + 176);
    _OWORD *v14 = *v15;
    *(_OWORD *)(a1 + 176) = v18;
    *(void *)(a1 + 192) = *(void *)(a2 + 192);
  }
  uint64_t v19 = (_OWORD *)(a1 + 200);
  long long v20 = (_OWORD *)(a2 + 200);
  uint64_t v21 = *(void *)(a2 + 224);
  if (v21)
  {
    uint64_t v22 = *(void *)(a2 + 232);
    *(void *)(a1 + 224) = v21;
    *(void *)(a1 + 232) = v22;
    (**(void (***)(_OWORD *, _OWORD *))(v21 - 8))(v19, v20);
  }
  else
  {
    long long v23 = *(_OWORD *)(a2 + 216);
    *uint64_t v19 = *v20;
    *(_OWORD *)(a1 + 216) = v23;
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
  }
  long long v24 = (_OWORD *)(a1 + 240);
  long long v25 = (_OWORD *)(a2 + 240);
  uint64_t v26 = *(void *)(a2 + 264);
  if (v26)
  {
    uint64_t v27 = *(void *)(a2 + 272);
    *(void *)(a1 + 264) = v26;
    *(void *)(a1 + 272) = v27;
    (**(void (***)(_OWORD *, _OWORD *))(v26 - 8))(v24, v25);
  }
  else
  {
    long long v28 = *(_OWORD *)(a2 + 256);
    _OWORD *v24 = *v25;
    *(_OWORD *)(a1 + 256) = v28;
    *(void *)(a1 + 272) = *(void *)(a2 + 272);
  }
  long long v29 = (_OWORD *)(a1 + 280);
  uint64_t v30 = (_OWORD *)(a2 + 280);
  uint64_t v31 = *(void *)(a2 + 304);
  if (v31)
  {
    uint64_t v32 = *(void *)(a2 + 312);
    *(void *)(a1 + 304) = v31;
    *(void *)(a1 + 312) = v32;
    (**(void (***)(_OWORD *, _OWORD *))(v31 - 8))(v29, v30);
  }
  else
  {
    long long v33 = *(_OWORD *)(a2 + 296);
    _OWORD *v29 = *v30;
    *(_OWORD *)(a1 + 296) = v33;
    *(void *)(a1 + 312) = *(void *)(a2 + 312);
  }
  long long v34 = (_OWORD *)(a1 + 320);
  double v35 = (_OWORD *)(a2 + 320);
  uint64_t v36 = *(void *)(a2 + 344);
  if (v36)
  {
    uint64_t v37 = *(void *)(a2 + 352);
    *(void *)(a1 + 344) = v36;
    *(void *)(a1 + 352) = v37;
    (**(void (***)(_OWORD *, _OWORD *))(v36 - 8))(v34, v35);
  }
  else
  {
    long long v38 = *(_OWORD *)(a2 + 336);
    *long long v34 = *v35;
    *(_OWORD *)(a1 + 336) = v38;
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
  }
  *(_OWORD *)(a1 + 360) = *(_OWORD *)(a2 + 360);
  long long v39 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v39;
  (**(void (***)(uint64_t, uint64_t))(v39 - 8))(a1 + 376, a2 + 376);
  uint64_t v40 = *(void *)(a2 + 440);
  uint64_t v41 = *(void *)(a2 + 448);
  *(void *)(a1 + 440) = v40;
  *(void *)(a1 + 448) = v41;
  (**(void (***)(uint64_t, uint64_t))(v40 - 8))(a1 + 416, a2 + 416);
  long long v42 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 480) = v42;
  (**(void (***)(uint64_t, uint64_t))(v42 - 8))(a1 + 456, a2 + 456);
  uint64_t v43 = *(void *)(a2 + 520);
  *(void *)(a1 + 520) = v43;
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  (**(void (***)(uint64_t, uint64_t))(v43 - 8))(a1 + 496, a2 + 496);
  long long v44 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 560) = v44;
  (**(void (***)(uint64_t, uint64_t))(v44 - 8))(a1 + 536, a2 + 536);
  uint64_t v45 = *(void *)(a2 + 600);
  *(void *)(a1 + 600) = v45;
  *(void *)(a1 + 608) = *(void *)(a2 + 608);
  (**(void (***)(uint64_t, uint64_t))(v45 - 8))(a1 + 576, a2 + 576);
  long long v46 = *(_OWORD *)(a2 + 640);
  *(_OWORD *)(a1 + 640) = v46;
  (**(void (***)(uint64_t, uint64_t))(v46 - 8))(a1 + 616, a2 + 616);
  uint64_t v47 = *(void *)(a2 + 680);
  *(void *)(a1 + 680) = v47;
  *(void *)(a1 + 688) = *(void *)(a2 + 688);
  (**(void (***)(uint64_t, uint64_t))(v47 - 8))(a1 + 656, a2 + 656);
  long long v48 = *(_OWORD *)(a2 + 720);
  *(_OWORD *)(a1 + 720) = v48;
  (**(void (***)(uint64_t, uint64_t))(v48 - 8))(a1 + 696, a2 + 696);
  uint64_t v49 = *(void *)(a2 + 760);
  *(void *)(a1 + 760) = v49;
  *(void *)(a1 + 768) = *(void *)(a2 + 768);
  (**(void (***)(uint64_t, uint64_t))(v49 - 8))(a1 + 736, a2 + 736);
  long long v50 = *(_OWORD *)(a2 + 800);
  *(_OWORD *)(a1 + 800) = v50;
  (**(void (***)(uint64_t, uint64_t))(v50 - 8))(a1 + 776, a2 + 776);
  *(_OWORD *)(a1 + 816) = *(_OWORD *)(a2 + 816);
  uint64_t v51 = *(void *)(a2 + 856);
  *(void *)(a1 + 856) = v51;
  *(void *)(a1 + 864) = *(void *)(a2 + 864);
  (**(void (***)(uint64_t, uint64_t))(v51 - 8))(a1 + 832, a2 + 832);
  long long v52 = *(_OWORD *)(a2 + 896);
  *(_OWORD *)(a1 + 896) = v52;
  (**(void (***)(uint64_t, uint64_t))(v52 - 8))(a1 + 872, a2 + 872);
  uint64_t v53 = *(void *)(a2 + 936);
  *(void *)(a1 + 936) = v53;
  *(void *)(a1 + 944) = *(void *)(a2 + 944);
  (**(void (***)(uint64_t, uint64_t))(v53 - 8))(a1 + 912, a2 + 912);
  long long v54 = *(_OWORD *)(a2 + 976);
  *(_OWORD *)(a1 + 976) = v54;
  (**(void (***)(uint64_t, uint64_t))(v54 - 8))(a1 + 952, a2 + 952);
  uint64_t v55 = *(void *)(a2 + 1016);
  *(void *)(a1 + 1016) = v55;
  *(void *)(a1 + 1024) = *(void *)(a2 + 1024);
  (**(void (***)(uint64_t, uint64_t))(v55 - 8))(a1 + 992, a2 + 992);
  long long v56 = *(_OWORD *)(a2 + 1056);
  *(_OWORD *)(a1 + 1056) = v56;
  (**(void (***)(uint64_t, uint64_t))(v56 - 8))(a1 + 1032, a2 + 1032);
  return a1;
}

uint64_t assignWithCopy for AdLockupLayout.AdLockupInnerContentLayout(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else if (v4)
  {
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
    goto LABEL_8;
  }
  long long v5 = *a2;
  long long v6 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)a2 + 10);
  uint64_t v7 = *((void *)a2 + 18);
  if (*(void *)(a1 + 144))
  {
    if (v7)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)a2 + 15);
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  }
  else if (v7)
  {
    *(void *)(a1 + 144) = v7;
    *(void *)(a1 + 152) = *((void *)a2 + 19);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, (uint64_t)a2 + 120);
    goto LABEL_15;
  }
  long long v8 = *(long long *)((char *)a2 + 120);
  long long v9 = *(long long *)((char *)a2 + 136);
  *(void *)(a1 + 152) = *((void *)a2 + 19);
  *(_OWORD *)(a1 + 120) = v8;
  *(_OWORD *)(a1 + 136) = v9;
LABEL_15:
  uint64_t v10 = *((void *)a2 + 23);
  if (*(void *)(a1 + 184))
  {
    if (v10)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 160), (uint64_t *)a2 + 20);
      goto LABEL_22;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  }
  else if (v10)
  {
    *(void *)(a1 + 184) = v10;
    *(void *)(a1 + 192) = *((void *)a2 + 24);
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 160, (uint64_t)(a2 + 10));
    goto LABEL_22;
  }
  long long v11 = a2[10];
  long long v12 = a2[11];
  *(void *)(a1 + 192) = *((void *)a2 + 24);
  *(_OWORD *)(a1 + 160) = v11;
  *(_OWORD *)(a1 + 176) = v12;
LABEL_22:
  uint64_t v13 = *((void *)a2 + 28);
  if (*(void *)(a1 + 224))
  {
    if (v13)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 200), (uint64_t *)a2 + 25);
      goto LABEL_29;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  }
  else if (v13)
  {
    *(void *)(a1 + 224) = v13;
    *(void *)(a1 + 232) = *((void *)a2 + 29);
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 200, (uint64_t)a2 + 200);
    goto LABEL_29;
  }
  long long v14 = *(long long *)((char *)a2 + 200);
  long long v15 = *(long long *)((char *)a2 + 216);
  *(void *)(a1 + 232) = *((void *)a2 + 29);
  *(_OWORD *)(a1 + 200) = v14;
  *(_OWORD *)(a1 + 216) = v15;
LABEL_29:
  uint64_t v16 = *((void *)a2 + 33);
  if (*(void *)(a1 + 264))
  {
    if (v16)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 240), (uint64_t *)a2 + 30);
      goto LABEL_36;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  }
  else if (v16)
  {
    *(void *)(a1 + 264) = v16;
    *(void *)(a1 + 272) = *((void *)a2 + 34);
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 240, (uint64_t)(a2 + 15));
    goto LABEL_36;
  }
  long long v17 = a2[15];
  long long v18 = a2[16];
  *(void *)(a1 + 272) = *((void *)a2 + 34);
  *(_OWORD *)(a1 + 240) = v17;
  *(_OWORD *)(a1 + 256) = v18;
LABEL_36:
  uint64_t v19 = *((void *)a2 + 38);
  if (*(void *)(a1 + 304))
  {
    if (v19)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 280), (uint64_t *)a2 + 35);
      goto LABEL_43;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  }
  else if (v19)
  {
    *(void *)(a1 + 304) = v19;
    *(void *)(a1 + 312) = *((void *)a2 + 39);
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 280, (uint64_t)a2 + 280);
    goto LABEL_43;
  }
  long long v20 = *(long long *)((char *)a2 + 280);
  long long v21 = *(long long *)((char *)a2 + 296);
  *(void *)(a1 + 312) = *((void *)a2 + 39);
  *(_OWORD *)(a1 + 280) = v20;
  *(_OWORD *)(a1 + 296) = v21;
LABEL_43:
  uint64_t v22 = *((void *)a2 + 43);
  if (!*(void *)(a1 + 344))
  {
    if (v22)
    {
      *(void *)(a1 + 344) = v22;
      *(void *)(a1 + 352) = *((void *)a2 + 44);
      (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 320, (uint64_t)(a2 + 20));
      goto LABEL_50;
    }
LABEL_49:
    long long v23 = a2[20];
    long long v24 = a2[21];
    *(void *)(a1 + 352) = *((void *)a2 + 44);
    *(_OWORD *)(a1 + 320) = v23;
    *(_OWORD *)(a1 + 336) = v24;
    goto LABEL_50;
  }
  if (!v22)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 320);
    goto LABEL_49;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 320), (uint64_t *)a2 + 40);
LABEL_50:
  *(void *)(a1 + 360) = *((void *)a2 + 45);
  *(void *)(a1 + 368) = *((void *)a2 + 46);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 376), (uint64_t *)a2 + 47);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 416), (uint64_t *)a2 + 52);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 456), (uint64_t *)a2 + 57);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 496), (uint64_t *)a2 + 62);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 536), (uint64_t *)a2 + 67);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 576), (uint64_t *)a2 + 72);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 616), (uint64_t *)a2 + 77);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 656), (uint64_t *)a2 + 82);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 696), (uint64_t *)a2 + 87);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 736), (uint64_t *)a2 + 92);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 776), (uint64_t *)a2 + 97);
  *(void *)(a1 + 816) = *((void *)a2 + 102);
  *(void *)(a1 + 824) = *((void *)a2 + 103);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 832), (uint64_t *)a2 + 104);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 872), (uint64_t *)a2 + 109);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 912), (uint64_t *)a2 + 114);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 952), (uint64_t *)a2 + 119);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 992), (uint64_t *)a2 + 124);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1032), (uint64_t *)a2 + 129);
  return a1;
}

void *__swift_memcpy1072_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x430uLL);
}

uint64_t assignWithTake for AdLockupLayout.AdLockupInnerContentLayout(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  if (*(void *)(a1 + 144)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  }
  long long v6 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v6;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  if (*(void *)(a1 + 184)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  }
  long long v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  if (*(void *)(a1 + 224)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  }
  long long v8 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = v8;
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  if (*(void *)(a1 + 264)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  }
  long long v9 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v9;
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  if (*(void *)(a1 + 304)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  }
  long long v10 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v10;
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  if (*(void *)(a1 + 344)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 320);
  }
  long long v11 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v11;
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  *(void *)&long long v11 = *(void *)(a2 + 368);
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(void *)(a1 + 368) = v11;
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  long long v12 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v12;
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  long long v13 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v13;
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  long long v14 = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  *(_OWORD *)(a1 + 472) = v14;
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  long long v15 = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 512) = v15;
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  long long v16 = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 536) = *(_OWORD *)(a2 + 536);
  *(_OWORD *)(a1 + 552) = v16;
  *(void *)(a1 + 568) = *(void *)(a2 + 568);
  __swift_destroy_boxed_opaque_existential_1(a1 + 576);
  long long v17 = *(_OWORD *)(a2 + 592);
  *(_OWORD *)(a1 + 576) = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 592) = v17;
  *(void *)(a1 + 608) = *(void *)(a2 + 608);
  __swift_destroy_boxed_opaque_existential_1(a1 + 616);
  long long v18 = *(_OWORD *)(a2 + 632);
  *(_OWORD *)(a1 + 616) = *(_OWORD *)(a2 + 616);
  *(_OWORD *)(a1 + 632) = v18;
  *(void *)(a1 + 648) = *(void *)(a2 + 648);
  __swift_destroy_boxed_opaque_existential_1(a1 + 656);
  long long v19 = *(_OWORD *)(a2 + 672);
  *(_OWORD *)(a1 + 656) = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 672) = v19;
  *(void *)(a1 + 688) = *(void *)(a2 + 688);
  __swift_destroy_boxed_opaque_existential_1(a1 + 696);
  long long v20 = *(_OWORD *)(a2 + 712);
  *(_OWORD *)(a1 + 696) = *(_OWORD *)(a2 + 696);
  *(_OWORD *)(a1 + 712) = v20;
  *(void *)(a1 + 728) = *(void *)(a2 + 728);
  __swift_destroy_boxed_opaque_existential_1(a1 + 736);
  long long v21 = *(_OWORD *)(a2 + 752);
  *(_OWORD *)(a1 + 736) = *(_OWORD *)(a2 + 736);
  *(_OWORD *)(a1 + 752) = v21;
  *(void *)(a1 + 768) = *(void *)(a2 + 768);
  __swift_destroy_boxed_opaque_existential_1(a1 + 776);
  long long v22 = *(_OWORD *)(a2 + 792);
  *(_OWORD *)(a1 + 776) = *(_OWORD *)(a2 + 776);
  *(_OWORD *)(a1 + 792) = v22;
  *(void *)(a1 + 808) = *(void *)(a2 + 808);
  *(_OWORD *)(a1 + 816) = *(_OWORD *)(a2 + 816);
  __swift_destroy_boxed_opaque_existential_1(a1 + 832);
  long long v23 = *(_OWORD *)(a2 + 848);
  *(_OWORD *)(a1 + 832) = *(_OWORD *)(a2 + 832);
  *(_OWORD *)(a1 + 848) = v23;
  *(void *)(a1 + 864) = *(void *)(a2 + 864);
  __swift_destroy_boxed_opaque_existential_1(a1 + 872);
  long long v24 = *(_OWORD *)(a2 + 888);
  *(_OWORD *)(a1 + 872) = *(_OWORD *)(a2 + 872);
  *(_OWORD *)(a1 + 888) = v24;
  *(void *)(a1 + 904) = *(void *)(a2 + 904);
  __swift_destroy_boxed_opaque_existential_1(a1 + 912);
  long long v25 = *(_OWORD *)(a2 + 928);
  *(_OWORD *)(a1 + 912) = *(_OWORD *)(a2 + 912);
  *(_OWORD *)(a1 + 928) = v25;
  *(void *)(a1 + 944) = *(void *)(a2 + 944);
  __swift_destroy_boxed_opaque_existential_1(a1 + 952);
  long long v26 = *(_OWORD *)(a2 + 968);
  *(_OWORD *)(a1 + 952) = *(_OWORD *)(a2 + 952);
  *(_OWORD *)(a1 + 968) = v26;
  *(void *)(a1 + 984) = *(void *)(a2 + 984);
  __swift_destroy_boxed_opaque_existential_1(a1 + 992);
  long long v27 = *(_OWORD *)(a2 + 1008);
  *(_OWORD *)(a1 + 992) = *(_OWORD *)(a2 + 992);
  *(_OWORD *)(a1 + 1008) = v27;
  *(void *)(a1 + 1024) = *(void *)(a2 + 1024);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1032);
  long long v28 = *(_OWORD *)(a2 + 1048);
  *(_OWORD *)(a1 + 1032) = *(_OWORD *)(a2 + 1032);
  *(_OWORD *)(a1 + 1048) = v28;
  *(void *)(a1 + 1064) = *(void *)(a2 + 1064);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdLockupLayout.AdLockupInnerContentLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 1072)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdLockupLayout.AdLockupInnerContentLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 1064) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 1072) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 1072) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdLockupLayout.AdLockupInnerContentLayout()
{
  return &type metadata for AdLockupLayout.AdLockupInnerContentLayout;
}

unint64_t sub_1C2BF9490()
{
  unint64_t result = qword_1EB681150;
  if (!qword_1EB681150)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB681148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB681150);
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

uint64_t sub_1C2BF9534(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_1C2BF9598()
{
  return objc_msgSend(*v0, sel_alignmentRectInsets);
}

id PaymentServiceHostBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id PaymentServiceHostBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PaymentServiceHostBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PaymentServiceHostBridge()
{
  return self;
}

uint64_t destroy for AppShowcaseLockupLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 232);
  __swift_destroy_boxed_opaque_existential_1(a1 + 272);
  __swift_destroy_boxed_opaque_existential_1(a1 + 312);
  if (*(void *)(a1 + 376)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 352);
  }
  __swift_destroy_boxed_opaque_existential_1(a1 + 392);
  __swift_destroy_boxed_opaque_existential_1(a1 + 432);
  if (*(void *)(a1 + 496)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  }

  return __swift_destroy_boxed_opaque_existential_1(a1 + 512);
}

uint64_t initializeWithCopy for AppShowcaseLockupLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  long long v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 176) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 152, a2 + 152);
  long long v8 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 216) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 192, a2 + 192);
  long long v9 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 256) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 232, a2 + 232);
  uint64_t v10 = *(void *)(a2 + 296);
  uint64_t v11 = *(void *)(a2 + 304);
  *(void *)(a1 + 296) = v10;
  *(void *)(a1 + 304) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 272, a2 + 272);
  long long v12 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 336) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 312, a2 + 312);
  long long v13 = (_OWORD *)(a1 + 352);
  long long v14 = (_OWORD *)(a2 + 352);
  uint64_t v15 = *(void *)(a2 + 376);
  if (v15)
  {
    uint64_t v16 = *(void *)(a2 + 384);
    *(void *)(a1 + 376) = v15;
    *(void *)(a1 + 384) = v16;
    (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
  }
  else
  {
    long long v17 = *(_OWORD *)(a2 + 368);
    *long long v13 = *v14;
    *(_OWORD *)(a1 + 368) = v17;
    *(void *)(a1 + 384) = *(void *)(a2 + 384);
  }
  long long v18 = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 416) = v18;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 392, a2 + 392);
  uint64_t v19 = *(void *)(a2 + 456);
  uint64_t v20 = *(void *)(a2 + 464);
  *(void *)(a1 + 456) = v19;
  *(void *)(a1 + 464) = v20;
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 432, a2 + 432);
  long long v21 = (_OWORD *)(a1 + 472);
  long long v22 = (_OWORD *)(a2 + 472);
  uint64_t v23 = *(void *)(a2 + 496);
  if (v23)
  {
    uint64_t v24 = *(void *)(a2 + 504);
    *(void *)(a1 + 496) = v23;
    *(void *)(a1 + 504) = v24;
    (**(void (***)(_OWORD *, _OWORD *))(v23 - 8))(v21, v22);
  }
  else
  {
    long long v25 = *(_OWORD *)(a2 + 488);
    _OWORD *v21 = *v22;
    *(_OWORD *)(a1 + 488) = v25;
    *(void *)(a1 + 504) = *(void *)(a2 + 504);
  }
  uint64_t v26 = *(void *)(a2 + 536);
  *(void *)(a1 + 536) = v26;
  *(void *)(a1 + 544) = *(void *)(a2 + 544);
  (**(void (***)(uint64_t, uint64_t))(v26 - 8))(a1 + 512, a2 + 512);
  return a1;
}

uint64_t assignWithCopy for AppShowcaseLockupLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  uint64_t v4 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v4;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 152), (uint64_t *)(a2 + 152));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 192), (uint64_t *)(a2 + 192));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 232), (uint64_t *)(a2 + 232));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 272), (uint64_t *)(a2 + 272));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 312), (uint64_t *)(a2 + 312));
  uint64_t v5 = *(void *)(a2 + 376);
  if (*(void *)(a1 + 376))
  {
    if (v5)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 352), (uint64_t *)(a2 + 352));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 352);
  }
  else if (v5)
  {
    *(void *)(a1 + 376) = v5;
    *(void *)(a1 + 384) = *(void *)(a2 + 384);
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 352, a2 + 352);
    goto LABEL_8;
  }
  long long v6 = *(_OWORD *)(a2 + 352);
  long long v7 = *(_OWORD *)(a2 + 368);
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  *(_OWORD *)(a1 + 352) = v6;
  *(_OWORD *)(a1 + 368) = v7;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 392), (uint64_t *)(a2 + 392));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 432), (uint64_t *)(a2 + 432));
  uint64_t v8 = *(void *)(a2 + 496);
  if (!*(void *)(a1 + 496))
  {
    if (v8)
    {
      *(void *)(a1 + 496) = v8;
      *(void *)(a1 + 504) = *(void *)(a2 + 504);
      (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 472, a2 + 472);
      goto LABEL_15;
    }
LABEL_14:
    long long v9 = *(_OWORD *)(a2 + 472);
    long long v10 = *(_OWORD *)(a2 + 488);
    *(void *)(a1 + 504) = *(void *)(a2 + 504);
    *(_OWORD *)(a1 + 472) = v9;
    *(_OWORD *)(a1 + 488) = v10;
    goto LABEL_15;
  }
  if (!v8)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 472);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 472), (uint64_t *)(a2 + 472));
LABEL_15:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 512), (uint64_t *)(a2 + 512));
  return a1;
}

void *__swift_memcpy552_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x228uLL);
}

uint64_t assignWithTake for AppShowcaseLockupLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  uint64_t v6 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v6;
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  __swift_destroy_boxed_opaque_existential_1(a1 + 152);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  __swift_destroy_boxed_opaque_existential_1(a1 + 192);
  long long v7 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v7;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  __swift_destroy_boxed_opaque_existential_1(a1 + 232);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  __swift_destroy_boxed_opaque_existential_1(a1 + 272);
  long long v8 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v8;
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  __swift_destroy_boxed_opaque_existential_1(a1 + 312);
  long long v9 = *(_OWORD *)(a2 + 328);
  *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 328) = v9;
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  if (*(void *)(a1 + 376)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 352);
  }
  long long v10 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 368) = v10;
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  __swift_destroy_boxed_opaque_existential_1(a1 + 392);
  long long v11 = *(_OWORD *)(a2 + 408);
  *(_OWORD *)(a1 + 392) = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 408) = v11;
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  __swift_destroy_boxed_opaque_existential_1(a1 + 432);
  long long v12 = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 432) = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 448) = v12;
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  if (*(void *)(a1 + 496)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  }
  *(void *)(a1 + 504) = *(void *)(a2 + 504);
  long long v13 = *(_OWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 472) = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 488) = v13;
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  long long v14 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 512) = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = v14;
  *(void *)(a1 + 544) = *(void *)(a2 + 544);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppShowcaseLockupLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 552)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppShowcaseLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 552) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 552) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppShowcaseLockupLayout()
{
  return &type metadata for AppShowcaseLockupLayout;
}

uint64_t destroy for AppShowcaseLockupLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 232);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 272);
}

uint64_t initializeWithCopy for AppShowcaseLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  long long v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 176) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 152, a2 + 152);
  long long v8 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 216) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 192, a2 + 192);
  long long v9 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 256) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 232, a2 + 232);
  uint64_t v10 = *(void *)(a2 + 296);
  uint64_t v11 = *(void *)(a2 + 304);
  *(void *)(a1 + 296) = v10;
  *(void *)(a1 + 304) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 272, a2 + 272);
  return a1;
}

uint64_t assignWithCopy for AppShowcaseLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  uint64_t v4 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v4;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 152), (uint64_t *)(a2 + 152));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 192), (uint64_t *)(a2 + 192));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 232), (uint64_t *)(a2 + 232));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 272), (uint64_t *)(a2 + 272));
  return a1;
}

void *__swift_memcpy312_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x138uLL);
}

uint64_t assignWithTake for AppShowcaseLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  uint64_t v6 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v6;
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  __swift_destroy_boxed_opaque_existential_1(a1 + 152);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  __swift_destroy_boxed_opaque_existential_1(a1 + 192);
  long long v7 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v7;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  __swift_destroy_boxed_opaque_existential_1(a1 + 232);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  __swift_destroy_boxed_opaque_existential_1(a1 + 272);
  long long v8 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v8;
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppShowcaseLockupLayout.Metrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 312)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppShowcaseLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 312) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 312) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppShowcaseLockupLayout.Metrics()
{
  return &type metadata for AppShowcaseLockupLayout.Metrics;
}

uint64_t sub_1C2BFA560@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2 = v1;
  uint64_t v117 = a1;
  uint64_t v3 = sub_1C2C269C8();
  uint64_t v142 = *(void *)(v3 - 8);
  uint64_t v4 = v142;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v110 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C2C26968();
  uint64_t v146 = *(void *)(v7 - 8);
  uint64_t v147 = v7;
  MEMORY[0x1F4188790](v7);
  long long v9 = (char *)&v110 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_1C2C269D8();
  uint64_t v10 = *(void *)(v143 - 8);
  MEMORY[0x1F4188790](v143);
  long long v12 = (char *)&v110 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_1C2C26A08();
  uint64_t v148 = *(void *)(v144 - 8);
  MEMORY[0x1F4188790](v144);
  uint64_t v115 = (char *)&v110 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  double v113 = (char *)&v110 - v15;
  MEMORY[0x1F4188790](v16);
  unint64_t v119 = (char *)&v110 - v17;
  MEMORY[0x1F4188790](v18);
  v118 = (char *)&v110 - v19;
  MEMORY[0x1F4188790](v20);
  uint64_t v112 = (char *)&v110 - v21;
  MEMORY[0x1F4188790](v22);
  uint64_t v111 = (char *)&v110 - v23;
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v110 - v25;
  CGFloat v145 = v2;
  uint64_t v141 = (uint64_t)(v2 + 39);
  uint64_t v114 = sub_1C2C26718();
  uint64_t v156 = v114;
  uint64_t v157 = MEMORY[0x1E4F71A48];
  __swift_allocate_boxed_opaque_existential_1(&v155);
  sub_1C2C26708();
  uint64_t v154 = 0;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v27 = *(void (**)(void))(v10 + 104);
  unsigned int v138 = *MEMORY[0x1E4F71B38];
  uint64_t v139 = v10 + 104;
  uint64_t v137 = (void (*)(char *, void, uint64_t))v27;
  v27(v12);
  uint64_t v28 = v146;
  long long v29 = *(void (**)(void))(v146 + 104);
  unsigned int v135 = *MEMORY[0x1E4F71B18];
  uint64_t v136 = v146 + 104;
  long long v134 = (void (*)(char *, void, uint64_t))v29;
  v29(v9);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681158);
  uint64_t v31 = v142;
  uint64_t v32 = *(unsigned __int8 *)(v142 + 80);
  uint64_t v33 = (v32 + 32) & ~v32;
  uint64_t v34 = v33 + *(void *)(v4 + 72);
  uint64_t v132 = v30;
  uint64_t v131 = v34;
  uint64_t v130 = v32 | 7;
  uint64_t v35 = swift_allocObject();
  long long v128 = xmmword_1C2C2F760;
  *(_OWORD *)(v35 + 16) = xmmword_1C2C2F760;
  uint64_t v133 = v33;
  sub_1C2C26998();
  *(void *)&v150[0] = v35;
  unint64_t v36 = sub_1C2BFBDE4();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681148);
  unint64_t v38 = sub_1C2BF9490();
  uint64_t v127 = v37;
  unint64_t v126 = v38;
  unint64_t v129 = v36;
  sub_1C2C26F58();
  uint64_t v122 = (void (*)(void, void, void))v26;
  sub_1C2C269F8();
  long long v39 = *(void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v142 = v31 + 8;
  uint64_t v116 = v6;
  uint64_t v141 = v3;
  double v125 = v39;
  v39(v6, v3);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v28 + 8);
  uint64_t v146 = v28 + 8;
  uint64_t v124 = v40;
  v40(v9, v147);
  uint64_t v41 = *(void (**)(char *, uint64_t))(v10 + 8);
  long long v42 = v12;
  uint64_t v140 = v10 + 8;
  uint64_t v123 = v41;
  v41(v12, v143);
  sub_1C2BF9534((uint64_t)&v152, &qword_1EB681138);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
  uint64_t v43 = (void *)sub_1C2BFBE3C(0, 1, 1, MEMORY[0x1E4FBC860]);
  unint64_t v45 = v43[2];
  unint64_t v44 = v43[3];
  if (v45 >= v44 >> 1) {
    uint64_t v43 = (void *)sub_1C2BFBE3C(v44 > 1, v45 + 1, 1, v43);
  }
  v43[2] = v45 + 1;
  long long v46 = *(void (**)(void, void, void))(v148 + 32);
  unint64_t v121 = (*(unsigned __int8 *)(v148 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v148 + 80);
  uint64_t v120 = *(void *)(v148 + 72);
  uint64_t v47 = v122;
  v148 += 32;
  uint64_t v122 = v46;
  v46((char *)v43 + v121 + v120 * v45, v47, v144);
  long long v48 = v145;
  uint64_t v49 = v145 + 49;
  sub_1C2BF7C98((uint64_t)(v145 + 49), (uint64_t)&v155);
  __swift_project_boxed_opaque_existential_1(&v155, v156);
  sub_1C2C26758();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
  __swift_project_boxed_opaque_existential_1(v48 + 49, v48[52]);
  sub_1C2C26738();
  sub_1C2BF7A70((uint64_t)(v48 + 44), (uint64_t)&v152, &qword_1EB6817E8);
  long long v50 = v116;
  if (!*((void *)&v153 + 1))
  {
    sub_1C2BF9534((uint64_t)&v152, &qword_1EB6817E8);
LABEL_14:
    uint64_t v69 = v145[52];
    uint64_t v70 = v145[53];
    uint64_t v71 = __swift_project_boxed_opaque_existential_1(v49, v69);
    uint64_t v156 = v69;
    uint64_t v157 = *(void *)(v70 + 8);
    uint64_t v72 = __swift_allocate_boxed_opaque_existential_1(&v155);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v69 - 8) + 16))(v72, v71, v69);
    uint64_t v154 = 0;
    long long v152 = 0u;
    long long v153 = 0u;
    uint64_t v73 = v143;
    v137(v42, v138, v143);
    uint64_t v74 = v147;
    v134(v9, v135, v147);
    uint64_t v75 = swift_allocObject();
    *(_OWORD *)(v75 + 16) = v128;
    sub_1C2C26998();
    *(void *)&v150[0] = v75;
    uint64_t v76 = v141;
    sub_1C2C26F58();
    sub_1C2C269F8();
    v125(v50, v76);
    v124(v9, v74);
    v123(v42, v73);
    sub_1C2BF9534((uint64_t)&v152, &qword_1EB681138);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
    unint64_t v78 = v43[2];
    unint64_t v77 = v43[3];
    if (v78 >= v77 >> 1) {
      uint64_t v43 = (void *)sub_1C2BFBE3C(v77 > 1, v78 + 1, 1, v43);
    }
    v43[2] = v78 + 1;
    v122((char *)v43 + v121 + v78 * v120, v118, v144);
    goto LABEL_17;
  }
  sub_1C2BF8100(&v152, (uint64_t)&v155);
  __swift_project_boxed_opaque_existential_1(&v155, v156);
  char v51 = sub_1C2C264C8();
  sub_1C2BF7C98((uint64_t)&v155, (uint64_t)&v152);
  if (v51)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
LABEL_13:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
    goto LABEL_14;
  }
  __swift_project_boxed_opaque_existential_1(&v152, *((uint64_t *)&v153 + 1));
  char v52 = sub_1C2C26488();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
  if ((v52 & 1) == 0) {
    goto LABEL_13;
  }
  v118 = (char *)(v145 + 2);
  uint64_t v154 = 0;
  long long v152 = 0u;
  long long v153 = 0u;
  uint64_t v53 = v143;
  v137(v42, v138, v143);
  uint64_t v54 = v147;
  v134(v9, v135, v147);
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = v128;
  sub_1C2C26998();
  *(void *)&v150[0] = v55;
  uint64_t v56 = v141;
  sub_1C2C26F58();
  sub_1C2C269F8();
  v125(v50, v56);
  v124(v9, v54);
  v123(v42, v53);
  sub_1C2BF9534((uint64_t)&v152, &qword_1EB681138);
  unint64_t v58 = v43[2];
  unint64_t v57 = v43[3];
  if (v58 >= v57 >> 1) {
    uint64_t v43 = (void *)sub_1C2BFBE3C(v57 > 1, v58 + 1, 1, v43);
  }
  v43[2] = v58 + 1;
  v122((char *)v43 + v121 + v58 * v120, v111, v144);
  uint64_t v59 = v145[52];
  uint64_t v60 = v145[53];
  uint64_t v61 = __swift_project_boxed_opaque_existential_1(v49, v59);
  *((void *)&v153 + 1) = v59;
  uint64_t v154 = *(void *)(v60 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v152);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v59 - 8) + 16))(boxed_opaque_existential_1, v61, v59);
  uint64_t v151 = 0;
  memset(v150, 0, sizeof(v150));
  uint64_t v63 = v143;
  v137(v42, v138, v143);
  uint64_t v64 = v147;
  v134(v9, v135, v147);
  uint64_t v65 = swift_allocObject();
  *(_OWORD *)(v65 + 16) = v128;
  sub_1C2C26998();
  uint64_t v149 = v65;
  uint64_t v66 = v141;
  sub_1C2C26F58();
  sub_1C2C269F8();
  v125(v50, v66);
  v124(v9, v64);
  v123(v42, v63);
  sub_1C2BF9534((uint64_t)v150, &qword_1EB681138);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
  unint64_t v68 = v43[2];
  unint64_t v67 = v43[3];
  if (v68 >= v67 >> 1) {
    uint64_t v43 = (void *)sub_1C2BFBE3C(v67 > 1, v68 + 1, 1, v43);
  }
  v43[2] = v68 + 1;
  v122((char *)v43 + v121 + v68 * v120, v112, v144);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
LABEL_17:
  uint64_t v79 = v145;
  __swift_project_boxed_opaque_existential_1(v145 + 54, v145[57]);
  sub_1C2C26758();
  __swift_project_boxed_opaque_existential_1(v79 + 54, v79[57]);
  sub_1C2C26738();
  uint64_t v80 = v79[57];
  uint64_t v81 = v79[58];
  uint64_t v82 = __swift_project_boxed_opaque_existential_1(v79 + 54, v80);
  uint64_t v156 = v80;
  uint64_t v157 = *(void *)(v81 + 8);
  unint64_t v83 = __swift_allocate_boxed_opaque_existential_1(&v155);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v80 - 8) + 16))(v83, v82, v80);
  sub_1C2BF7C98((uint64_t)(v79 + 24), (uint64_t)&v152);
  uint64_t v84 = v143;
  v137(v42, v138, v143);
  uint64_t v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = v128;
  sub_1C2C269B8();
  *(void *)&v150[0] = v85;
  uint64_t v86 = v141;
  sub_1C2C26F58();
  uint64_t v87 = v147;
  v134(v9, v135, v147);
  sub_1C2C269F8();
  v124(v9, v87);
  v125(v50, v86);
  v123(v42, v84);
  sub_1C2BF9534((uint64_t)&v152, &qword_1EB681138);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
  unint64_t v89 = v43[2];
  unint64_t v88 = v43[3];
  if (v89 >= v88 >> 1) {
    uint64_t v43 = (void *)sub_1C2BFBE3C(v88 > 1, v89 + 1, 1, v43);
  }
  v43[2] = v89 + 1;
  v122((char *)v43 + v121 + v89 * v120, v119, v144);
  sub_1C2BF7A70((uint64_t)(v145 + 59), (uint64_t)&v152, &qword_1EB6817F0);
  if (*((void *)&v153 + 1))
  {
    sub_1C2BF8100(&v152, (uint64_t)&v155);
    __swift_project_boxed_opaque_existential_1(&v155, v156);
    char v90 = sub_1C2C264C8();
    sub_1C2BF7C98((uint64_t)&v155, (uint64_t)&v152);
    if (v90)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(&v152, *((uint64_t *)&v153 + 1));
      char v91 = sub_1C2C26488();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
      if (v91)
      {
        uint64_t v92 = v156;
        uint64_t v93 = v157;
        CGRect v94 = __swift_project_boxed_opaque_existential_1(&v155, v156);
        *((void *)&v153 + 1) = v92;
        uint64_t v154 = *(void *)(v93 + 8);
        CGRect v95 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v152);
        (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v92 - 8) + 16))(v95, v94, v92);
        sub_1C2BF7C98((uint64_t)(v145 + 34), (uint64_t)v150);
        uint64_t v96 = v143;
        v137(v42, v138, v143);
        uint64_t v97 = v147;
        v134(v9, v135, v147);
        uint64_t v98 = swift_allocObject();
        *(_OWORD *)(v98 + 16) = v128;
        sub_1C2C26998();
        uint64_t v149 = v98;
        uint64_t v99 = v141;
        sub_1C2C26F58();
        sub_1C2C269F8();
        v125(v50, v99);
        v124(v9, v97);
        v123(v42, v96);
        sub_1C2BF9534((uint64_t)v150, &qword_1EB681138);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
        unint64_t v101 = v43[2];
        unint64_t v100 = v43[3];
        if (v101 >= v100 >> 1) {
          uint64_t v43 = (void *)sub_1C2BFBE3C(v100 > 1, v101 + 1, 1, v43);
        }
        v43[2] = v101 + 1;
        v122((char *)v43 + v121 + v101 * v120, v113, v144);
      }
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
  }
  else
  {
    sub_1C2BF9534((uint64_t)&v152, &qword_1EB6817F0);
  }
  CGFloat v102 = v115;
  uint64_t v156 = v114;
  uint64_t v157 = MEMORY[0x1E4F71A48];
  __swift_allocate_boxed_opaque_existential_1(&v155);
  sub_1C2C26708();
  uint64_t v154 = 0;
  long long v152 = 0u;
  long long v153 = 0u;
  uint64_t v103 = v143;
  v137(v42, v138, v143);
  uint64_t v104 = v147;
  v134(v9, v135, v147);
  uint64_t v105 = swift_allocObject();
  *(_OWORD *)(v105 + 16) = v128;
  sub_1C2C26998();
  *(void *)&v150[0] = v105;
  uint64_t v106 = v141;
  sub_1C2C26F58();
  sub_1C2C269F8();
  v125(v50, v106);
  v124(v9, v104);
  v123(v42, v103);
  sub_1C2BF9534((uint64_t)&v152, &qword_1EB681138);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
  unint64_t v108 = v43[2];
  unint64_t v107 = v43[3];
  if (v108 >= v107 >> 1) {
    uint64_t v43 = (void *)sub_1C2BFBE3C(v107 > 1, v108 + 1, 1, v43);
  }
  v43[2] = v108 + 1;
  v122((char *)v43 + v121 + v108 * v120, v102, v144);
  return sub_1C2C269E8();
}

uint64_t sub_1C2BFBBB0()
{
  uint64_t v0 = sub_1C2C26A28();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2BFA560((uint64_t)v3);
  sub_1C2C26988();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_1C2BFBCC0()
{
  uint64_t v0 = sub_1C2C26A28();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2BFA560((uint64_t)v3);
  sub_1C2C26978();
  double v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t sub_1C2BFBDD8@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2BFC014(v1, a1);
}

unint64_t sub_1C2BFBDE4()
{
  unint64_t result = qword_1EB681140;
  if (!qword_1EB681140)
  {
    sub_1C2C269C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB681140);
  }
  return result;
}

size_t sub_1C2BFBE3C(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3308B0);
  uint64_t v10 = *(void *)(sub_1C2C26A08() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_1C2C26A08() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_1C2BFC014(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2BFC04C()
{
  uint64_t v0 = sub_1C2C263F8();
  uint64_t v1 = *(void **)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (uint64_t **)((char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  double IconSize = ASCLockupViewSizeGetIconSize(@"small", 1);
  uint64_t v6 = v5;
  uint64_t v112 = MEMORY[0x1E4FBB3D0];
  uint64_t v113 = MEMORY[0x1E4F71D78];
  *(void *)&long long v111 = 0x4024000000000000;
  int64_t v7 = (void *)*MEMORY[0x1E4FB28F0];
  *uint64_t v3 = (uint64_t *)*MEMORY[0x1E4FB28F0];
  uint64_t v8 = *MEMORY[0x1E4F719A0];
  uint64_t v9 = v1 + 13;
  uint64_t v64 = (void (*)(uint64_t **, uint64_t, uint64_t))v1[13];
  unsigned int v65 = v8;
  v64(v3, v8, v0);
  uint64_t v62 = sub_1C2C268B8();
  uint64_t v109 = v62;
  uint64_t v110 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v108);
  uint64_t v106 = v0;
  uint64_t v107 = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v105);
  uint64_t v11 = v1 + 2;
  uint64_t v63 = (void (*)(uint64_t *, uint64_t **, uint64_t))v1[2];
  v63(boxed_opaque_existential_1, v3, v0);
  uint64_t v60 = v7;
  sub_1C2C268C8();
  uint64_t v66 = (void (*)(uint64_t **, uint64_t))v1[1];
  unint64_t v67 = v1 + 1;
  v66(v3, v0);
  unint64_t v12 = (void *)*MEMORY[0x1E4FB28C8];
  *uint64_t v3 = (uint64_t *)*MEMORY[0x1E4FB28C8];
  uint64_t v13 = v64;
  v64(v3, v8, v0);
  uint64_t v14 = v62;
  uint64_t v106 = v62;
  uint64_t v107 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v105);
  uint64_t v103 = v0;
  uint64_t v104 = MEMORY[0x1E4F719A8];
  uint64_t v15 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v102);
  unint64_t v16 = v63;
  v63(v15, v3, v0);
  uint64_t v17 = v12;
  sub_1C2C268C8();
  v66(v3, v0);
  *uint64_t v3 = v17;
  uint64_t v18 = v65;
  v13(v3, v65, v0);
  uint64_t v103 = v14;
  uint64_t v104 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v102);
  uint64_t v100 = v0;
  uint64_t v101 = MEMORY[0x1E4F719A8];
  uint64_t v19 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v99);
  v16(v19, v3, v0);
  uint64_t v20 = v17;
  sub_1C2C268C8();
  uint64_t v21 = v66;
  v66(v3, v0);
  *uint64_t v3 = v20;
  uint64_t v22 = v18;
  uint64_t v23 = v64;
  v64(v3, v22, v0);
  uint64_t v61 = v9;
  uint64_t v100 = v14;
  uint64_t v101 = MEMORY[0x1E4F71AE8];
  unint64_t v58 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v99);
  uint64_t v97 = v0;
  uint64_t v98 = MEMORY[0x1E4F719A8];
  uint64_t v24 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v96);
  uint64_t v25 = v63;
  v63(v24, v3, v0);
  uint64_t v26 = v20;
  sub_1C2C268C8();
  v21(v3, v0);
  *uint64_t v3 = v26;
  v23(v3, v65, v0);
  uint64_t v27 = v62;
  uint64_t v97 = v62;
  uint64_t v98 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v96);
  uint64_t v94 = v0;
  uint64_t v95 = MEMORY[0x1E4F719A8];
  uint64_t v28 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v93);
  v25(v28, v3, v0);
  long long v29 = v26;
  sub_1C2C268C8();
  v66(v3, v0);
  uint64_t v30 = v60;
  *uint64_t v3 = v60;
  uint64_t v31 = v65;
  v23(v3, v65, v0);
  uint64_t v94 = v27;
  uint64_t v95 = MEMORY[0x1E4F71AE8];
  unint64_t v58 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v93);
  uint64_t v91 = v0;
  uint64_t v92 = MEMORY[0x1E4F719A8];
  uint64_t v32 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v90);
  uint64_t v33 = v63;
  v63(v32, v3, v0);
  uint64_t v59 = v11;
  uint64_t v34 = v30;
  sub_1C2C268C8();
  uint64_t v35 = v66;
  v66(v3, v0);
  *uint64_t v3 = v34;
  uint64_t v36 = v31;
  uint64_t v37 = v64;
  v64(v3, v36, v0);
  uint64_t v38 = v62;
  uint64_t v91 = v62;
  uint64_t v92 = MEMORY[0x1E4F71AE8];
  uint64_t v60 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v90);
  uint64_t v88 = v0;
  uint64_t v89 = MEMORY[0x1E4F719A8];
  long long v39 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v87);
  v33(v39, v3, v0);
  uint64_t v40 = v34;
  sub_1C2C268C8();
  v35(v3, v0);
  *uint64_t v3 = v40;
  uint64_t v41 = v65;
  v37(v3, v65, v0);
  uint64_t v88 = v38;
  uint64_t v89 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v87);
  uint64_t v85 = v0;
  uint64_t v86 = MEMORY[0x1E4F719A8];
  long long v42 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v84);
  v33(v42, v3, v0);
  uint64_t v43 = v40;
  sub_1C2C268C8();
  unint64_t v44 = v66;
  v66(v3, v0);
  *uint64_t v3 = v43;
  unint64_t v45 = v64;
  v64(v3, v41, v0);
  uint64_t v85 = v38;
  uint64_t v86 = MEMORY[0x1E4F71AE8];
  uint64_t v60 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v84);
  uint64_t v82 = v0;
  uint64_t v83 = MEMORY[0x1E4F719A8];
  long long v46 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v81);
  uint64_t v47 = v63;
  v63(v46, v3, v0);
  long long v48 = v43;
  sub_1C2C268C8();
  v44(v3, v0);
  *uint64_t v3 = v48;
  v45(v3, v41, v0);
  uint64_t v49 = v62;
  uint64_t v82 = v62;
  uint64_t v83 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v81);
  uint64_t v79 = v0;
  uint64_t v80 = MEMORY[0x1E4F719A8];
  long long v50 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v78);
  v47(v50, v3, v0);
  char v51 = v48;
  sub_1C2C268C8();
  char v52 = v66;
  v66(v3, v0);
  uint64_t v80 = MEMORY[0x1E4F71D78];
  uint64_t v79 = MEMORY[0x1E4FBB3D0];
  uint64_t v77 = MEMORY[0x1E4F71D78];
  *(void *)&long long v78 = 0x4024000000000000;
  uint64_t v76 = MEMORY[0x1E4FBB3D0];
  uint64_t v74 = MEMORY[0x1E4F71D78];
  *(void *)&long long v75 = 0x4014000000000000;
  uint64_t v73 = MEMORY[0x1E4FBB3D0];
  uint64_t v53 = MEMORY[0x1E4FBB3D0];
  *(void *)&long long v72 = 0x401C000000000000;
  *uint64_t v3 = v51;
  v64(v3, v65, v0);
  uint64_t v70 = v49;
  uint64_t v71 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v69);
  v68[3] = v0;
  v68[4] = MEMORY[0x1E4F719A8];
  uint64_t v54 = __swift_allocate_boxed_opaque_existential_1(v68);
  v63(v54, v3, v0);
  uint64_t v55 = v51;
  sub_1C2C268C8();
  v52(v3, v0);
  qword_1EA330B48 = v53;
  qword_1EA330B50 = MEMORY[0x1E4F71D78];
  qword_1EA330B30 = 0x4040000000000000;
  qword_1EA330B70 = v53;
  qword_1EA330B78 = MEMORY[0x1E4F71D78];
  qword_1EA330B58 = 0x4024000000000000;
  qword_1EA3308B8 = *(void *)&IconSize;
  unk_1EA3308C0 = v6;
  sub_1C2BF8100(&v111, (uint64_t)&unk_1EA3308C8);
  sub_1C2BF8100(&v108, (uint64_t)&unk_1EA3308F0);
  sub_1C2BF8100(&v105, (uint64_t)&unk_1EA330918);
  sub_1C2BF8100(&v102, (uint64_t)&unk_1EA330940);
  sub_1C2BF8100(&v99, (uint64_t)&unk_1EA330968);
  sub_1C2BF8100(&v96, (uint64_t)&unk_1EA330990);
  sub_1C2BF8100(&v93, (uint64_t)&unk_1EA3309B8);
  sub_1C2BF8100(&v90, (uint64_t)&unk_1EA3309E0);
  sub_1C2BF8100(&v87, (uint64_t)&unk_1EA330A08);
  sub_1C2BF8100(&v84, (uint64_t)&unk_1EA330A30);
  sub_1C2BF8100(&v81, (uint64_t)&unk_1EA330A58);
  xmmword_1EA330A80 = xmmword_1C2C2FB00;
  sub_1C2BF8100(&v78, (uint64_t)&unk_1EA330A90);
  sub_1C2BF8100(&v75, (uint64_t)&unk_1EA330AB8);
  sub_1C2BF8100(&v72, (uint64_t)&unk_1EA330AE0);
  return sub_1C2BF8100(&v69, (uint64_t)&unk_1EA330B08);
}

uint64_t sub_1C2BFC980()
{
  uint64_t v0 = sub_1C2C263F8();
  uint64_t v1 = *(void **)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (uint64_t *)((char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  double v4 = (void *)sub_1C2C26DD8();
  double IconSize = ASCLockupViewSizeGetIconSize(v4, 1);
  uint64_t v7 = v6;

  if (qword_1EA3307A8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1C2C26598();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_1EA330BB0);
  uint64_t v10 = (void (**)(void, void, void))(*(void *)(v8 - 8) + 16);
  unint64_t v45 = (void (*)(void *, uint64_t, uint64_t))*v10;
  v45(v3, v9, v8);
  unint64_t v12 = v1 + 13;
  uint64_t v11 = (void (*)(void))v1[13];
  unsigned int v48 = *MEMORY[0x1E4F71998];
  uint64_t v43 = v11;
  v11(v3);
  uint64_t v47 = sub_1C2C268B8();
  uint64_t v71 = v47;
  uint64_t v72 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v70);
  uint64_t v68 = v0;
  uint64_t v69 = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v67);
  uint64_t v14 = v1 + 2;
  long long v50 = (void (*)(uint64_t *, void *, uint64_t))v1[2];
  v50(boxed_opaque_existential_1, v3, v0);
  sub_1C2C268C8();
  uint64_t v15 = (void (*)(void *, uint64_t))v1[1];
  uint64_t v49 = v1 + 1;
  long long v46 = v15;
  v15(v3, v0);
  if (qword_1EA330798 != -1) {
    swift_once();
  }
  uint64_t v44 = __swift_project_value_buffer(v8, (uint64_t)qword_1EA330B80);
  unint64_t v16 = v45;
  v45(v3, v44, v8);
  long long v42 = v10;
  uint64_t v17 = v43;
  ((void (*)(void *, void, uint64_t))v43)(v3, v48, v0);
  uint64_t v68 = v47;
  uint64_t v69 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v67);
  uint64_t v65 = v0;
  uint64_t v66 = MEMORY[0x1E4F719A8];
  uint64_t v18 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v64);
  v50(v18, v3, v0);
  sub_1C2C268C8();
  uint64_t v19 = v46;
  v46(v3, v0);
  uint64_t v40 = v8;
  v16(v3, v44, v8);
  uint64_t v41 = v12;
  ((void (*)(void *, void, uint64_t))v17)(v3, v48, v0);
  uint64_t v20 = v47;
  uint64_t v65 = v47;
  uint64_t v66 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v64);
  uint64_t v62 = v0;
  uint64_t v63 = MEMORY[0x1E4F719A8];
  uint64_t v21 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v61);
  uint64_t v44 = (uint64_t)v14;
  v50(v21, v3, v0);
  sub_1C2C268C8();
  v19(v3, v0);
  uint64_t v22 = v20;
  if (qword_1EA3307A0 != -1) {
    swift_once();
  }
  uint64_t v23 = v40;
  uint64_t v39 = __swift_project_value_buffer(v40, (uint64_t)qword_1EA330B98);
  uint64_t v24 = v45;
  v45(v3, v39, v23);
  uint64_t v25 = v48;
  ((void (*)(void *, void, uint64_t))v17)(v3, v48, v0);
  uint64_t v62 = v22;
  uint64_t v63 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v61);
  uint64_t v59 = v0;
  uint64_t v60 = MEMORY[0x1E4F719A8];
  uint64_t v26 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v58);
  v50(v26, v3, v0);
  sub_1C2C268C8();
  uint64_t v27 = v46;
  v46(v3, v0);
  v24(v3, v39, v23);
  uint64_t v28 = (void (*)(void *))v17;
  ((void (*)(void *, uint64_t, uint64_t))v17)(v3, v25, v0);
  uint64_t v29 = v47;
  uint64_t v59 = v47;
  uint64_t v60 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v58);
  uint64_t v56 = v0;
  uint64_t v57 = MEMORY[0x1E4F719A8];
  uint64_t v30 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v55);
  uint64_t v31 = v50;
  v50(v30, v3, v0);
  sub_1C2C268C8();
  v27(v3, v0);
  uint64_t v32 = (void *)*MEMORY[0x1E4FB28F0];
  *uint64_t v3 = *MEMORY[0x1E4FB28F0];
  unsigned int v48 = *MEMORY[0x1E4F719A0];
  v28(v3);
  uint64_t v56 = v29;
  uint64_t v57 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v55);
  uint64_t v53 = v0;
  uint64_t v54 = MEMORY[0x1E4F719A8];
  uint64_t v33 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v52);
  v31(v33, v3, v0);
  id v34 = v32;
  sub_1C2C268C8();
  v27(v3, v0);
  *uint64_t v3 = v34;
  ((void (*)(void *, void, uint64_t))v43)(v3, v48, v0);
  uint64_t v53 = v29;
  uint64_t v54 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v52);
  void v51[3] = v0;
  v51[4] = MEMORY[0x1E4F719A8];
  uint64_t v35 = __swift_allocate_boxed_opaque_existential_1(v51);
  v50(v35, v3, v0);
  id v36 = v34;
  sub_1C2C268C8();
  v27(v3, v0);
  qword_1EA3332D0 = *(void *)&IconSize;
  unk_1EA3332D8 = v7;
  sub_1C2BF8100(&v70, (uint64_t)&unk_1EA3332E0);
  sub_1C2BF8100(&v67, (uint64_t)&unk_1EA333308);
  sub_1C2BF8100(&v64, (uint64_t)&unk_1EA333330);
  sub_1C2BF8100(&v61, (uint64_t)&unk_1EA333368);
  sub_1C2BF8100(&v58, (uint64_t)&unk_1EA333390);
  sub_1C2BF8100(&v55, (uint64_t)&unk_1EA3333B8);
  uint64_t result = sub_1C2BF8100(&v52, (uint64_t)&unk_1EA3333E0);
  qword_1EA333358 = 2;
  byte_1EA333360 = 0;
  return result;
}

id static ASCLayoutProxy.adLockupLayout(traitCollection:artworkView:headingText:titleText:subtitleText:offerText:offerButton:starRatingView:ratingCountLabel:adTransparencyButton:editorsChoiceView:descriptionLabel:)(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12)
{
  return sub_1C2BFE9B8(a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_1C2BFD2F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(self, sel_currentDevice);
  id v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

  if ((unint64_t)v15 > 1) {
    sub_1C2C26558();
  }
  else {
    sub_1C2C26588();
  }
  uint64_t v16 = sub_1C2C26578();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 0, 1, v16);
  sub_1C2C0C3B4(a2, a3, a1, (uint64_t)v10);
  sub_1C2C0C844(a2, a3, (uint64_t)v13, (uint64_t)v10, a4);
  sub_1C2C01790((uint64_t)v10, type metadata accessor for LockupMediaLayout.DisplayType);
  sub_1C2C01858((uint64_t)v13);
  sub_1C2C0CBC4((uint64_t)v10);
  return sub_1C2C018B8((uint64_t)v10, a4);
}

id static ASCLayoutProxy.lockupMediaSizingLayout(for:screenshots:trailers:containerView:mediaViews:)(uint64_t a1, uint64_t a2, void *a3, void *a4, unint64_t a5)
{
  uint64_t v11 = type metadata accessor for LockupMediaLayout(0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (id *)((char *)&v24.receiver - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2BFD2F8(a1, a2, a3, (uint64_t)v16);
  sub_1C2C017F0((uint64_t)v16, (uint64_t)v13 + *(int *)(v11 + 24), type metadata accessor for LockupMediaLayout.Metrics);
  uint64_t v17 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  uint64_t v18 = MEMORY[0x1E4F71DA0];
  v13[3] = v17;
  v13[4] = v18;
  *uint64_t v13 = a4;
  id v19 = a4;
  v13[5] = sub_1C2BFD724(a5);
  v25[3] = v11;
  v25[4] = sub_1C2BFEFCC(&qword_1EA330BE0);
  v25[5] = sub_1C2BFEFCC(&qword_1EA330BE8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v25);
  sub_1C2C017F0((uint64_t)v13, (uint64_t)boxed_opaque_existential_1, type metadata accessor for LockupMediaLayout);
  id v21 = objc_allocWithZone(v5);
  sub_1C2BFF010((uint64_t)v25, (uint64_t)v21 + OBJC_IVAR_____ASCLayoutProxy_base);
  v24.receiver = v21;
  v24.super_class = v5;
  id v22 = objc_msgSendSuper2(&v24, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  sub_1C2C01790((uint64_t)v13, type metadata accessor for LockupMediaLayout);
  sub_1C2C01790((uint64_t)v16, type metadata accessor for LockupMediaLayout.Metrics);
  return v22;
}

void *sub_1C2BFD724(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1C2C26FC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return (void *)v3;
  }
  uint64_t v19 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1C2BFE728(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v19;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      uint64_t v6 = MEMORY[0x1E4F71DA0];
      do
      {
        uint64_t v7 = MEMORY[0x1C8768700](v5, a1);
        uint64_t v19 = v3;
        unint64_t v9 = *(void *)(v3 + 16);
        unint64_t v8 = *(void *)(v3 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_1C2BFE728((void *)(v8 > 1), v9 + 1, 1);
          uint64_t v3 = v19;
        }
        ++v5;
        uint64_t v17 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
        uint64_t v18 = v6;
        *(void *)&long long v16 = v7;
        *(void *)(v3 + 16) = v9 + 1;
        sub_1C2BF8100(&v16, v3 + 40 * v9 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v10 = (void **)(a1 + 32);
      uint64_t v11 = MEMORY[0x1E4F71DA0];
      do
      {
        uint64_t v12 = *v10;
        uint64_t v19 = v3;
        unint64_t v14 = *(void *)(v3 + 16);
        unint64_t v13 = *(void *)(v3 + 24);
        id v15 = v12;
        if (v14 >= v13 >> 1)
        {
          sub_1C2BFE728((void *)(v13 > 1), v14 + 1, 1);
          uint64_t v3 = v19;
        }
        uint64_t v17 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
        uint64_t v18 = v11;
        *(void *)&long long v16 = v15;
        *(void *)(v3 + 16) = v14 + 1;
        sub_1C2BF8100(&v16, v3 + 40 * v14 + 32);
        ++v10;
        --v2;
      }
      while (v2);
    }
    return (void *)v3;
  }
  __break(1u);
  return result;
}

double static ASCLayoutProxy.lockupMediaPreferredMediaSize(fitting:for:with:and:in:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, double a5, double a6)
{
  uint64_t v12 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1F4188790](v12 - 8);
  unint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2BFD2F8(a1, a2, a3, (uint64_t)v14);
  double v15 = sub_1C2C12044((uint64_t)v14, a4, a5, a6);
  sub_1C2C01790((uint64_t)v14, type metadata accessor for LockupMediaLayout.Metrics);
  return v15;
}

uint64_t static ASCLayoutProxy.artwork(from:and:)(uint64_t a1, void *a2)
{
  return sub_1C2C0D4C8(a1, a2, 0, 1);
}

uint64_t sub_1C2BFDFBC(uint64_t a1)
{
  return sub_1C2BFE17C(a1, qword_1EA330B80, MEMORY[0x1E4FB29A8], 0xED0000656C746954, (uint64_t)j___s18AppStoreComponents14ASCLayoutProxyC28lockupTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0);
}

uint64_t sub_1C2BFE038()
{
  uint64_t v0 = sub_1C2C26598();
  __swift_allocate_value_buffer(v0, qword_1EA330B98);
  uint64_t v1 = (void *)__swift_project_value_buffer(v0, (uint64_t)qword_1EA330B98);
  uint64_t v2 = *MEMORY[0x1E4FB29C0];
  *uint64_t v1 = 0xD000000000000010;
  v1[1] = 0x80000001C2C346D0;
  v1[2] = j___s18AppStoreComponents14ASCLayoutProxyC31lockupSubtitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0;
  v1[3] = 0;
  v1[4] = v2;
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);

  return v3();
}

uint64_t sub_1C2BFE144(uint64_t a1)
{
  return sub_1C2BFE17C(a1, qword_1EA330BB0, MEMORY[0x1E4FB29C8], 0xEF676E6964616548, (uint64_t)j___s18AppStoreComponents14ASCLayoutProxyC30lockupHeadingPointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0);
}

uint64_t sub_1C2BFE17C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_1C2C26598();
  __swift_allocate_value_buffer(v9, a2);
  uint64_t v10 = (void *)__swift_project_value_buffer(v9, (uint64_t)a2);
  uint64_t v11 = *a3;
  void *v10 = 0x70756B636F4C6461;
  v10[1] = a4;
  v10[2] = a5;
  void v10[3] = 0;
  v10[4] = v11;
  uint64_t v12 = *(uint64_t (**)(void))(*(void *)(v9 - 8) + 104);

  return v12();
}

uint64_t sub_1C2BFE280()
{
  uint64_t v0 = sub_1C2C26598();
  __swift_allocate_value_buffer(v0, qword_1EA330BC8);
  uint64_t v1 = (void *)__swift_project_value_buffer(v0, (uint64_t)qword_1EA330BC8);
  uint64_t v2 = *MEMORY[0x1E4FB29C8];
  *uint64_t v1 = 0xD000000000000019;
  v1[1] = 0x80000001C2C346F0;
  v1[2] = j___s18AppStoreComponents14ASCLayoutProxyC42adTransparencyButtonTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0;
  v1[3] = 0;
  v1[4] = v2;
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);

  return v3();
}

double static ASCLayoutProxy.adTransparencyButtonScaledCapInset(_:in:)()
{
  uint64_t v0 = sub_1C2C263F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v11[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EA3307B0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1C2C26598();
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EA330BC8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(v3, v5, v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F71998], v0);
  v11[3] = v0;
  v11[4] = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, char *, uint64_t))(v1 + 16))(boxed_opaque_existential_1, v3, v0);
  sub_1C2C263D8();
  double v8 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v8;
}

void *sub_1C2BFE728(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C2BFE748(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_1C2BFE748(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330C00);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    void v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6817E0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void (*sub_1C2BFE880(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1C2BFE930(v6, a2, a3);
  return sub_1C2BFE8E8;
}

void sub_1C2BFE8E8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1C2BFE930(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1C8768700](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1C2BFE9B0;
  }
  __break(1u);
  return result;
}

void sub_1C2BFE9B0(id *a1)
{
}

id sub_1C2BFE9B8(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  if (qword_1EA330788 != -1) {
    swift_once();
  }
  sub_1C2BF79F4((uint64_t)&qword_1EA3308B8, (uint64_t)&v79);
  uint64_t v41 = a1;
  id v78 = a1;
  uint64_t v19 = MEMORY[0x1E4F71DB0];
  if (a2)
  {
    uint64_t v77 = MEMORY[0x1E4F71DB0];
    *((void *)&v76 + 1) = sub_1C2C0191C(0, &qword_1EB681810);
    *(void *)&long long v75 = a2;
  }
  else
  {
    uint64_t v77 = 0;
    long long v76 = 0u;
    long long v75 = 0u;
  }
  uint64_t v20 = sub_1C2C0191C(0, &qword_1EB681810);
  uint64_t v21 = v20;
  uint64_t v74 = v19;
  uint64_t v73 = v20;
  *(void *)&long long v72 = a3;
  uint64_t v71 = v19;
  uint64_t v70 = v20;
  *(void *)&long long v69 = a4;
  uint64_t v68 = 0;
  memset(v67, 0, sizeof(v67));
  if (a5)
  {
    uint64_t v66 = v19;
    *((void *)&v65 + 1) = v20;
    *(void *)&long long v64 = a5;
  }
  else
  {
    uint64_t v66 = 0;
    long long v65 = 0uLL;
    long long v64 = 0uLL;
  }
  uint64_t v22 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  uint64_t v63 = MEMORY[0x1E4F71DA0];
  uint64_t v62 = v22;
  *(void *)&long long v61 = a6;
  uint64_t v43 = a5;
  if (a7)
  {
    uint64_t v60 = MEMORY[0x1E4F71DA0];
    *((void *)&v59 + 1) = v22;
    *(void *)&long long v58 = a7;
  }
  else
  {
    uint64_t v60 = 0;
    long long v59 = 0u;
    long long v58 = 0u;
  }
  long long v42 = a7;
  if (a8)
  {
    uint64_t v57 = v19;
    *((void *)&v56 + 1) = v21;
    uint64_t v23 = a8;
    *(void *)&long long v55 = a8;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v57 = 0;
    long long v56 = 0u;
    long long v55 = 0u;
  }
  objc_super v24 = a3;
  if (!a10)
  {
    uint64_t v54 = 0;
    long long v53 = 0u;
    long long v52 = 0u;
    uint64_t v25 = a11;
    if (a9) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v51 = 0;
    long long v50 = 0u;
    long long v49 = 0u;
    goto LABEL_20;
  }
  uint64_t v54 = MEMORY[0x1E4F71DA0];
  *((void *)&v53 + 1) = v22;
  *(void *)&long long v52 = a10;
  uint64_t v25 = a11;
  if (!a9) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v51 = MEMORY[0x1E4F71DA0];
  *((void *)&v50 + 1) = v22;
  *(void *)&long long v49 = a9;
LABEL_20:
  uint64_t v48 = v19;
  uint64_t v47 = v21;
  *(void *)&long long v46 = v25;
  sub_1C2BF79F4((uint64_t)&v79, (uint64_t)__src);
  id v26 = a10;
  id v27 = a9;
  id v28 = v25;
  id v29 = v41;
  id v30 = a2;
  id v31 = v24;
  id v32 = a4;
  id v33 = v43;
  id v34 = a6;
  id v35 = v42;
  id v36 = v23;
  sub_1C2C264D8();
  sub_1C2BF7D90((uint64_t)&v79);
  sub_1C2BF8100(__dst, (uint64_t)&__src[89]);
  sub_1C2C01958((uint64_t)&v75, (uint64_t)&__src[94], &qword_1EB6817F0);
  sub_1C2BF8100(&v72, (uint64_t)&__src[99]);
  sub_1C2BF8100(&v69, (uint64_t)&__src[104]);
  sub_1C2C01958((uint64_t)v67, (uint64_t)&__src[109], &qword_1EB6817F0);
  sub_1C2C01958((uint64_t)&v64, (uint64_t)&__src[114], &qword_1EB6817F0);
  sub_1C2BF8100(&v61, (uint64_t)&__src[119]);
  sub_1C2C01958((uint64_t)&v58, (uint64_t)&__src[124], &qword_1EB6817E8);
  sub_1C2C01958((uint64_t)&v55, (uint64_t)&__src[129], &qword_1EB6817F0);
  sub_1C2C01958((uint64_t)&v52, (uint64_t)&__src[134], &qword_1EB6817E8);
  sub_1C2C01958((uint64_t)&v49, (uint64_t)&__src[139], &qword_1EB6817E8);
  sub_1C2BF8100(&v46, (uint64_t)&__src[144]);
  memcpy(__dst, __src, 0x4A8uLL);

  __src[3] = &type metadata for AdLockupLayout;
  __src[4] = sub_1C2C019BC();
  __src[5] = sub_1C2C01A10();
  __src[0] = swift_allocObject();
  sub_1C2BF7E8C((uint64_t)__dst, __src[0] + 16);
  uint64_t v37 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  id v38 = objc_allocWithZone(v37);
  sub_1C2BFF010((uint64_t)__src, (uint64_t)v38 + OBJC_IVAR_____ASCLayoutProxy_base);
  v44.receiver = v38;
  v44.super_class = v37;
  id v39 = objc_msgSendSuper2(&v44, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)__src);
  sub_1C2BF7EC4(__dst);
  return v39;
}

uint64_t _s18AppStoreComponents14ASCLayoutProxyC32numberOfViewsInLockupMediaLayout3for4with3andSiSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgtFZ_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  size_t v11 = (char *)&v16 - v10;
  sub_1C2C0C3B4(a2, a3, a1, (uint64_t)&v16 - v10);
  sub_1C2C017F0((uint64_t)v11, (uint64_t)v8, type metadata accessor for LockupMediaLayout.DisplayType);
  uint64_t v12 = sub_1C2C26578();
  unsigned int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v8, 10, v12);
  uint64_t v14 = v13;
  switch(v13)
  {
    case 1u:
    case 4u:
      uint64_t v14 = 1;
      break;
    case 2u:
      uint64_t v14 = 2;
      break;
    case 3u:
      break;
    case 5u:
      uint64_t v14 = 0;
      break;
    case 6u:
      uint64_t v14 = 9;
      break;
    case 7u:
      uint64_t v14 = 14;
      break;
    case 8u:
      uint64_t v14 = 5;
      break;
    case 9u:
      uint64_t v14 = 7;
      break;
    case 0xAu:
      uint64_t v14 = 4;
      break;
    default:
      sub_1C2C01790((uint64_t)v8, type metadata accessor for LockupMediaLayout.DisplayType);
      uint64_t v14 = 1;
      break;
  }
  sub_1C2C01790((uint64_t)v11, type metadata accessor for LockupMediaLayout.DisplayType);
  return v14;
}

uint64_t sub_1C2BFEFCC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LockupMediaLayout(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C2BFF010(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id _s18AppStoreComponents14ASCLayoutProxyC17lockupMediaLayout3for11screenshots8trailers13containerView10mediaViewsACSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgSo6UIViewCSayATGtFZ_0(uint64_t a1, uint64_t a2, void *a3, void *a4, unint64_t a5)
{
  uint64_t v10 = type metadata accessor for LockupMediaLayout(0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (id *)((char *)&v31.receiver - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v13 - 8);
  double v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1F4188790](v19 - 8);
  uint64_t v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1C2C26578();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v18, 1, 1, v22);
  sub_1C2C0C3B4(a2, a3, a1, (uint64_t)v15);
  sub_1C2C0C844(a2, a3, (uint64_t)v18, (uint64_t)v15, (uint64_t)v21);
  sub_1C2C01790((uint64_t)v15, type metadata accessor for LockupMediaLayout.DisplayType);
  sub_1C2C01858((uint64_t)v18);
  sub_1C2C017F0((uint64_t)v21, (uint64_t)v12 + *(int *)(v10 + 24), type metadata accessor for LockupMediaLayout.Metrics);
  uint64_t v23 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  uint64_t v24 = MEMORY[0x1E4F71DA0];
  v12[3] = v23;
  v12[4] = v24;
  *uint64_t v12 = a4;
  id v25 = a4;
  void v12[5] = sub_1C2BFD724(a5);
  v32[3] = v10;
  v32[4] = sub_1C2BFEFCC(&qword_1EA330BE0);
  v32[5] = sub_1C2BFEFCC(&qword_1EA330BE8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v32);
  sub_1C2C017F0((uint64_t)v12, (uint64_t)boxed_opaque_existential_1, type metadata accessor for LockupMediaLayout);
  id v27 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  id v28 = objc_allocWithZone(v27);
  sub_1C2BFF010((uint64_t)v32, (uint64_t)v28 + OBJC_IVAR_____ASCLayoutProxy_base);
  v31.receiver = v28;
  v31.super_class = v27;
  id v29 = objc_msgSendSuper2(&v31, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  sub_1C2C01790((uint64_t)v12, type metadata accessor for LockupMediaLayout);
  sub_1C2C01790((uint64_t)v21, type metadata accessor for LockupMediaLayout.Metrics);
  return v29;
}

double _s18AppStoreComponents14ASCLayoutProxyC25estimatedMediaContentSize3for11screenshots8trailers7fitting2inSo6CGSizeVSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgAKSo18UITraitEnvironment_ptFZ_0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, double a5, double a6)
{
  uint64_t v12 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)&v27 - v22;
  sub_1C2C0C3B4(a2, a3, a1, (uint64_t)v20);
  sub_1C2C0CBC4((uint64_t)v23);
  sub_1C2C01790((uint64_t)v20, type metadata accessor for LockupMediaLayout.DisplayType);
  uint64_t v24 = sub_1C2C26578();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v17, 1, 1, v24);
  sub_1C2C0CBC4((uint64_t)v20);
  sub_1C2C0C844(a2, a3, (uint64_t)v17, (uint64_t)v20, (uint64_t)v14);
  sub_1C2C01790((uint64_t)v20, type metadata accessor for LockupMediaLayout.DisplayType);
  double v25 = sub_1C2C10604((uint64_t)v14, a4, a5, a6);
  sub_1C2C01790((uint64_t)v14, type metadata accessor for LockupMediaLayout.Metrics);
  sub_1C2C01858((uint64_t)v17);
  sub_1C2C01790((uint64_t)v23, type metadata accessor for LockupMediaLayout.DisplayType);
  return v25;
}

uint64_t _s18AppStoreComponents14ASCLayoutProxyC26containerViewRotationAngle3for11screenshots8trailers12CoreGraphics7CGFloatVSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgtFZ_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v22 - v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v22 - v13;
  sub_1C2C0C3B4(a2, a3, a1, (uint64_t)v11);
  sub_1C2C0CBC4((uint64_t)v14);
  sub_1C2C01790((uint64_t)v11, type metadata accessor for LockupMediaLayout.DisplayType);
  unint64_t v15 = sub_1C2C0D4C8(a2, a3, 0, 1);
  unint64_t v16 = v15;
  if (v15 >> 62)
  {
    uint64_t result = sub_1C2C26FC8();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t result = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v16 & 0xC000000000000001) != 0)
  {
    id v18 = (id)MEMORY[0x1C8768700](0, v16);
  }
  else
  {
    if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v18 = *(id *)(v16 + 32);
  }
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_isPortrait);

LABEL_9:
  sub_1C2C017F0((uint64_t)v14, (uint64_t)v8, type metadata accessor for LockupMediaLayout.DisplayType);
  uint64_t v20 = sub_1C2C26578();
  int v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v8, 10, v20);
  if (v21 != 7 && v21 != 6) {
    sub_1C2C01790((uint64_t)v8, type metadata accessor for LockupMediaLayout.DisplayType);
  }
  return sub_1C2C01790((uint64_t)v14, type metadata accessor for LockupMediaLayout.DisplayType);
}

double _s18AppStoreComponents14ASCLayoutProxyC13layoutMargins3for014existingLayoutG0So12UIEdgeInsetsVSo16ASCLockupContextaSg_AHtFZ_0(void *a1, double a2)
{
  if (!a1) {
    return a2;
  }
  uint64_t v4 = sub_1C2C26E08();
  uint64_t v6 = v5;
  if (v4 == sub_1C2C26E08() && v6 == v7)
  {
    id v21 = a1;
    goto LABEL_16;
  }
  char v9 = sub_1C2C27008();
  id v10 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_17:
    a2 = *MEMORY[0x1E4FB2848];

    return a2;
  }
  uint64_t v11 = sub_1C2C26E08();
  uint64_t v13 = v12;
  if (v11 == sub_1C2C26E08() && v13 == v14)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  char v16 = sub_1C2C27008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16) {
    goto LABEL_17;
  }
  uint64_t v17 = sub_1C2C26E08();
  uint64_t v19 = v18;
  if (v17 == sub_1C2C26E08() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v23 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {

      return a2;
    }
  }
  id v24 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v24, sel_userInterfaceIdiom);

  return a2;
}

double _s18AppStoreComponents14ASCLayoutProxyC28lockupTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0()
{
  uint64_t v0 = sub_1C2C26E08();
  uint64_t v2 = v1;
  if (v0 == sub_1C2C26E08() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 19.0;
  }
  else
  {
    char v5 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double result = 19.0;
    if ((v5 & 1) == 0)
    {
      uint64_t v7 = sub_1C2C26E08();
      uint64_t v9 = v8;
      if (v7 == sub_1C2C26E08() && v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        return 20.0;
      }
      char v12 = sub_1C2C27008();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      double result = 20.0;
      if ((v12 & 1) == 0)
      {
        uint64_t v13 = sub_1C2C26E08();
        uint64_t v15 = v14;
        if (v13 == sub_1C2C26E08() && v15 == v16)
        {
          swift_bridgeObjectRelease_n();
          return 21.0;
        }
        char v17 = sub_1C2C27008();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        double result = 21.0;
        if ((v17 & 1) == 0)
        {
          uint64_t v18 = sub_1C2C26E08();
          uint64_t v20 = v19;
          if (v18 == sub_1C2C26E08() && v20 == v21)
          {
            swift_bridgeObjectRelease_n();
            return 22.0;
          }
          char v22 = sub_1C2C27008();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          double result = 22.0;
          if ((v22 & 1) == 0)
          {
            uint64_t v23 = sub_1C2C26E08();
            uint64_t v25 = v24;
            if (v23 == sub_1C2C26E08() && v25 == v26)
            {
              swift_bridgeObjectRelease_n();
              return 24.0;
            }
            char v27 = sub_1C2C27008();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            double result = 24.0;
            if ((v27 & 1) == 0)
            {
              uint64_t v28 = sub_1C2C26E08();
              uint64_t v30 = v29;
              if (v28 == sub_1C2C26E08() && v30 == v31)
              {
                swift_bridgeObjectRelease_n();
                return 26.0;
              }
              char v32 = sub_1C2C27008();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              double result = 26.0;
              if ((v32 & 1) == 0)
              {
                uint64_t v33 = sub_1C2C26E08();
                uint64_t v35 = v34;
                if (v33 == sub_1C2C26E08() && v35 == v36)
                {
                  swift_bridgeObjectRelease_n();
                  return 28.0;
                }
                char v37 = sub_1C2C27008();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                double result = 28.0;
                if ((v37 & 1) == 0)
                {
                  uint64_t v38 = sub_1C2C26E08();
                  uint64_t v40 = v39;
                  if (v38 == sub_1C2C26E08() && v40 == v41)
                  {
                    swift_bridgeObjectRelease_n();
                    return 34.0;
                  }
                  char v43 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v43) {
                    return 34.0;
                  }
                  uint64_t v44 = sub_1C2C26E08();
                  uint64_t v46 = v45;
                  if (v44 == sub_1C2C26E08() && v46 == v47) {
                    goto LABEL_41;
                  }
                  char v48 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v48) {
                    return 36.0;
                  }
                  uint64_t v49 = sub_1C2C26E08();
                  uint64_t v51 = v50;
                  if (v49 == sub_1C2C26E08() && v51 == v52) {
                    goto LABEL_41;
                  }
                  char v53 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v53) {
                    return 36.0;
                  }
                  uint64_t v54 = sub_1C2C26E08();
                  uint64_t v56 = v55;
                  if (v54 == sub_1C2C26E08() && v56 == v57) {
                    goto LABEL_41;
                  }
                  char v58 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v58) {
                    return 36.0;
                  }
                  uint64_t v59 = sub_1C2C26E08();
                  uint64_t v61 = v60;
                  if (v59 == sub_1C2C26E08() && v61 == v62)
                  {
LABEL_41:
                    swift_bridgeObjectRelease_n();
                    return 36.0;
                  }
                  char v63 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  double result = 36.0;
                  if ((v63 & 1) == 0) {
                    return 22.0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

double _s18AppStoreComponents14ASCLayoutProxyC31lockupSubtitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0()
{
  uint64_t v0 = sub_1C2C26E08();
  uint64_t v2 = v1;
  if (v0 == sub_1C2C26E08() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 13.0;
  }
  else
  {
    char v5 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double result = 13.0;
    if ((v5 & 1) == 0)
    {
      uint64_t v7 = sub_1C2C26E08();
      uint64_t v9 = v8;
      if (v7 == sub_1C2C26E08() && v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        return 14.0;
      }
      char v12 = sub_1C2C27008();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      double result = 14.0;
      if ((v12 & 1) == 0)
      {
        uint64_t v13 = sub_1C2C26E08();
        uint64_t v15 = v14;
        if (v13 == sub_1C2C26E08() && v15 == v16)
        {
          swift_bridgeObjectRelease_n();
          return 15.0;
        }
        char v17 = sub_1C2C27008();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        double result = 15.0;
        if ((v17 & 1) == 0)
        {
          uint64_t v18 = sub_1C2C26E08();
          uint64_t v20 = v19;
          if (v18 == sub_1C2C26E08() && v20 == v21)
          {
            swift_bridgeObjectRelease_n();
            return 16.0;
          }
          char v22 = sub_1C2C27008();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          double result = 16.0;
          if ((v22 & 1) == 0)
          {
            uint64_t v23 = sub_1C2C26E08();
            uint64_t v25 = v24;
            if (v23 == sub_1C2C26E08() && v25 == v26)
            {
              swift_bridgeObjectRelease_n();
              return 18.0;
            }
            char v27 = sub_1C2C27008();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            double result = 18.0;
            if ((v27 & 1) == 0)
            {
              uint64_t v28 = sub_1C2C26E08();
              uint64_t v30 = v29;
              if (v28 == sub_1C2C26E08() && v30 == v31)
              {
                swift_bridgeObjectRelease_n();
                return 20.0;
              }
              char v32 = sub_1C2C27008();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              double result = 20.0;
              if ((v32 & 1) == 0)
              {
                uint64_t v33 = sub_1C2C26E08();
                uint64_t v35 = v34;
                if (v33 == sub_1C2C26E08() && v35 == v36)
                {
                  swift_bridgeObjectRelease_n();
                  return 22.0;
                }
                char v37 = sub_1C2C27008();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                double result = 22.0;
                if ((v37 & 1) == 0)
                {
                  uint64_t v38 = sub_1C2C26E08();
                  uint64_t v40 = v39;
                  if (v38 == sub_1C2C26E08() && v40 == v41) {
                    goto LABEL_36;
                  }
                  char v42 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v42) {
                    return 24.0;
                  }
                  uint64_t v43 = sub_1C2C26E08();
                  uint64_t v45 = v44;
                  if (v43 == sub_1C2C26E08() && v45 == v46) {
                    goto LABEL_36;
                  }
                  char v47 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v47) {
                    return 24.0;
                  }
                  uint64_t v48 = sub_1C2C26E08();
                  uint64_t v50 = v49;
                  if (v48 == sub_1C2C26E08() && v50 == v51) {
                    goto LABEL_36;
                  }
                  char v52 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v52) {
                    return 24.0;
                  }
                  uint64_t v53 = sub_1C2C26E08();
                  uint64_t v55 = v54;
                  if (v53 == sub_1C2C26E08() && v55 == v56) {
                    goto LABEL_36;
                  }
                  char v57 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v57) {
                    return 24.0;
                  }
                  uint64_t v58 = sub_1C2C26E08();
                  uint64_t v60 = v59;
                  if (v58 == sub_1C2C26E08() && v60 == v61)
                  {
LABEL_36:
                    swift_bridgeObjectRelease_n();
                    return 24.0;
                  }
                  char v62 = sub_1C2C27008();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  double result = 16.0;
                  if (v62) {
                    return 24.0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

double _s18AppStoreComponents14ASCLayoutProxyC30lockupHeadingPointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0()
{
  uint64_t v0 = sub_1C2C26E08();
  uint64_t v2 = v1;
  if (v0 == sub_1C2C26E08() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 12.0;
  }
  char v5 = sub_1C2C27008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v6 = 12.0;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = sub_1C2C26E08();
    uint64_t v9 = v8;
    if (v7 == sub_1C2C26E08() && v9 == v10) {
      goto LABEL_13;
    }
    char v12 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      return v6;
    }
    uint64_t v13 = sub_1C2C26E08();
    uint64_t v15 = v14;
    if (v13 == sub_1C2C26E08() && v15 == v16) {
      goto LABEL_13;
    }
    char v18 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v18) {
      return v6;
    }
    uint64_t v19 = sub_1C2C26E08();
    uint64_t v21 = v20;
    if (v19 == sub_1C2C26E08() && v21 == v22)
    {
      swift_bridgeObjectRelease_n();
      return 13.0;
    }
    char v23 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 13.0;
    if (v23) {
      return v6;
    }
    uint64_t v24 = sub_1C2C26E08();
    uint64_t v26 = v25;
    if (v24 == sub_1C2C26E08() && v26 == v27)
    {
      swift_bridgeObjectRelease_n();
      return 15.0;
    }
    char v28 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 15.0;
    if (v28) {
      return v6;
    }
    uint64_t v29 = sub_1C2C26E08();
    uint64_t v31 = v30;
    if (v29 == sub_1C2C26E08() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
      return 17.0;
    }
    char v33 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 17.0;
    if (v33) {
      return v6;
    }
    uint64_t v34 = sub_1C2C26E08();
    uint64_t v36 = v35;
    if (v34 == sub_1C2C26E08() && v36 == v37)
    {
      swift_bridgeObjectRelease_n();
      return 19.0;
    }
    char v38 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 19.0;
    if (v38) {
      return v6;
    }
    uint64_t v39 = sub_1C2C26E08();
    uint64_t v41 = v40;
    if (v39 == sub_1C2C26E08() && v41 == v42)
    {
      swift_bridgeObjectRelease_n();
      return 22.0;
    }
    char v43 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 22.0;
    if (v43) {
      return v6;
    }
    uint64_t v44 = sub_1C2C26E08();
    uint64_t v46 = v45;
    if (v44 == sub_1C2C26E08() && v46 == v47) {
      goto LABEL_13;
    }
    char v48 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v48) {
      return v6;
    }
    uint64_t v49 = sub_1C2C26E08();
    uint64_t v51 = v50;
    if (v49 == sub_1C2C26E08() && v51 == v52) {
      goto LABEL_13;
    }
    char v53 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v53) {
      return v6;
    }
    uint64_t v54 = sub_1C2C26E08();
    uint64_t v56 = v55;
    if (v54 == sub_1C2C26E08() && v56 == v57) {
      goto LABEL_13;
    }
    char v58 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v58) {
      return v6;
    }
    uint64_t v59 = sub_1C2C26E08();
    uint64_t v61 = v60;
    if (v59 == sub_1C2C26E08() && v61 == v62)
    {
LABEL_13:
      swift_bridgeObjectRelease_n();
      return v6;
    }
    char v63 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v63) {
      return 22.0;
    }
    else {
      return 13.0;
    }
  }
  return v6;
}

double _s18AppStoreComponents14ASCLayoutProxyC42adTransparencyButtonTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0()
{
  uint64_t v0 = sub_1C2C26E08();
  uint64_t v2 = v1;
  if (v0 == sub_1C2C26E08() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 11.0;
  }
  char v5 = sub_1C2C27008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v6 = 11.0;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = sub_1C2C26E08();
    uint64_t v9 = v8;
    if (v7 == sub_1C2C26E08() && v9 == v10) {
      goto LABEL_13;
    }
    char v12 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      return v6;
    }
    uint64_t v13 = sub_1C2C26E08();
    uint64_t v15 = v14;
    if (v13 == sub_1C2C26E08() && v15 == v16) {
      goto LABEL_13;
    }
    char v18 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v18) {
      return v6;
    }
    uint64_t v19 = sub_1C2C26E08();
    uint64_t v21 = v20;
    if (v19 == sub_1C2C26E08() && v21 == v22) {
      goto LABEL_13;
    }
    char v23 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v23) {
      return v6;
    }
    uint64_t v24 = sub_1C2C26E08();
    uint64_t v26 = v25;
    if (v24 == sub_1C2C26E08() && v26 == v27)
    {
      swift_bridgeObjectRelease_n();
      return 13.0;
    }
    char v28 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 13.0;
    if (v28) {
      return v6;
    }
    uint64_t v29 = sub_1C2C26E08();
    uint64_t v31 = v30;
    if (v29 == sub_1C2C26E08() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
      return 15.0;
    }
    char v33 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 15.0;
    if (v33) {
      return v6;
    }
    uint64_t v34 = sub_1C2C26E08();
    uint64_t v36 = v35;
    if (v34 == sub_1C2C26E08() && v36 == v37)
    {
      swift_bridgeObjectRelease_n();
      return 17.0;
    }
    char v38 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 17.0;
    if (v38) {
      return v6;
    }
    uint64_t v39 = sub_1C2C26E08();
    uint64_t v41 = v40;
    if (v39 == sub_1C2C26E08() && v41 == v42)
    {
      swift_bridgeObjectRelease_n();
      return 20.0;
    }
    char v43 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 20.0;
    if (v43) {
      return v6;
    }
    uint64_t v44 = sub_1C2C26E08();
    uint64_t v46 = v45;
    if (v44 == sub_1C2C26E08() && v46 == v47)
    {
      swift_bridgeObjectRelease_n();
      return 24.0;
    }
    char v48 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 24.0;
    if (v48) {
      return v6;
    }
    uint64_t v49 = sub_1C2C26E08();
    uint64_t v51 = v50;
    if (v49 == sub_1C2C26E08() && v51 == v52)
    {
      swift_bridgeObjectRelease_n();
      return 27.0;
    }
    char v53 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 27.0;
    if (v53) {
      return v6;
    }
    uint64_t v54 = sub_1C2C26E08();
    uint64_t v56 = v55;
    if (v54 == sub_1C2C26E08() && v56 == v57) {
      goto LABEL_13;
    }
    char v58 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v58) {
      return v6;
    }
    uint64_t v59 = sub_1C2C26E08();
    uint64_t v61 = v60;
    if (v59 == sub_1C2C26E08() && v61 == v62)
    {
LABEL_13:
      swift_bridgeObjectRelease_n();
      return v6;
    }
    char v63 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v63) {
      return 27.0;
    }
    else {
      return 11.0;
    }
  }
  return v6;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

double _s18AppStoreComponents14ASCLayoutProxyC44adTransparencyDeveloperNamePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0()
{
  uint64_t v0 = sub_1C2C26E08();
  uint64_t v2 = v1;
  if (v0 == sub_1C2C26E08() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 11.0;
  }
  char v5 = sub_1C2C27008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v6 = 11.0;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = sub_1C2C26E08();
    uint64_t v9 = v8;
    if (v7 == sub_1C2C26E08() && v9 == v10) {
      goto LABEL_13;
    }
    char v12 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      return v6;
    }
    uint64_t v13 = sub_1C2C26E08();
    uint64_t v15 = v14;
    if (v13 == sub_1C2C26E08() && v15 == v16) {
      goto LABEL_13;
    }
    char v18 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v18) {
      return v6;
    }
    uint64_t v19 = sub_1C2C26E08();
    uint64_t v21 = v20;
    if (v19 == sub_1C2C26E08() && v21 == v22)
    {
      swift_bridgeObjectRelease_n();
      return 12.0;
    }
    char v23 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 12.0;
    if (v23) {
      return v6;
    }
    uint64_t v24 = sub_1C2C26E08();
    uint64_t v26 = v25;
    if (v24 == sub_1C2C26E08() && v26 == v27)
    {
      swift_bridgeObjectRelease_n();
      return 14.0;
    }
    char v28 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 14.0;
    if (v28) {
      return v6;
    }
    uint64_t v29 = sub_1C2C26E08();
    uint64_t v31 = v30;
    if (v29 == sub_1C2C26E08() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
      return 16.0;
    }
    char v33 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 16.0;
    if (v33) {
      return v6;
    }
    uint64_t v34 = sub_1C2C26E08();
    uint64_t v36 = v35;
    if (v34 == sub_1C2C26E08() && v36 == v37)
    {
      swift_bridgeObjectRelease_n();
      return 18.0;
    }
    char v38 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 18.0;
    if (v38) {
      return v6;
    }
    uint64_t v39 = sub_1C2C26E08();
    uint64_t v41 = v40;
    if (v39 == sub_1C2C26E08() && v41 == v42)
    {
      swift_bridgeObjectRelease_n();
      return 22.0;
    }
    char v43 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 22.0;
    if (v43) {
      return v6;
    }
    uint64_t v44 = sub_1C2C26E08();
    uint64_t v46 = v45;
    if (v44 == sub_1C2C26E08() && v46 == v47)
    {
      swift_bridgeObjectRelease_n();
      return 24.0;
    }
    char v48 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v6 = 24.0;
    if (v48) {
      return v6;
    }
    uint64_t v49 = sub_1C2C26E08();
    uint64_t v51 = v50;
    if (v49 == sub_1C2C26E08() && v51 == v52) {
      goto LABEL_13;
    }
    char v53 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v53) {
      return v6;
    }
    uint64_t v54 = sub_1C2C26E08();
    uint64_t v56 = v55;
    if (v54 == sub_1C2C26E08() && v56 == v57) {
      goto LABEL_13;
    }
    char v58 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v58) {
      return v6;
    }
    uint64_t v59 = sub_1C2C26E08();
    uint64_t v61 = v60;
    if (v59 == sub_1C2C26E08() && v61 == v62)
    {
LABEL_13:
      swift_bridgeObjectRelease_n();
      return v6;
    }
    char v63 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v63) {
      return 24.0;
    }
    else {
      return 12.0;
    }
  }
  return v6;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1C2C01790(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C2C017F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C2C01858(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C2C018B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2C0191C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1C2C01958(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1C2C019BC()
{
  unint64_t result = qword_1EA330C08;
  if (!qword_1EA330C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA330C08);
  }
  return result;
}

unint64_t sub_1C2C01A10()
{
  unint64_t result = qword_1EA330C10;
  if (!qword_1EA330C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA330C10);
  }
  return result;
}

uint64_t sub_1C2C01A64()
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 4));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 9));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 14));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 19));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 24));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 29));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 34));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 39));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 44));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 49));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 54));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 61));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 66));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 71));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 76));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 81));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 86));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 91));
  if (v0[99]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 96));
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 101));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 106));
  if (v0[114]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 111));
  }
  if (v0[119]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 116));
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 121));
  if (v0[129]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 126));
  }
  if (v0[134]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 131));
  }
  if (v0[139]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 136));
  }
  if (v0[144]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 141));
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 146));

  return MEMORY[0x1F4186498](v0, 1208, 7);
}

uint64_t sub_1C2C01BB4(uint64_t a1)
{
  return sub_1C2C01BF0(a1, (uint64_t)&ASCOfferButtonSizeSmall, &qword_1EB681160);
}

uint64_t sub_1C2C01BC8(uint64_t a1)
{
  return sub_1C2C01C84(a1, (uint64_t)&ASCOfferButtonSizeSmall, (double *)&qword_1EB681918);
}

uint64_t sub_1C2C01BDC(uint64_t a1)
{
  return sub_1C2C01BF0(a1, (uint64_t)&ASCOfferButtonSizeMedium, &qword_1EA330C18);
}

uint64_t sub_1C2C01BF0(uint64_t a1, uint64_t a2, void *a3)
{
  type metadata accessor for ASCLayoutProxy();
  sub_1C2C26E08();
  sub_1C2C0987C((uint64_t)v6);
  uint64_t v4 = v6[9];
  sub_1C2C07B1C((uint64_t)v6);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4;
  return result;
}

uint64_t sub_1C2C01C70(uint64_t a1)
{
  return sub_1C2C01C84(a1, (uint64_t)&ASCOfferButtonSizeMedium, (double *)&qword_1EA330C20);
}

uint64_t sub_1C2C01C84(uint64_t a1, uint64_t a2, double *a3)
{
  type metadata accessor for ASCLayoutProxy();
  sub_1C2C26E08();
  double v4 = static ASCLayoutProxy.axOfferButtonHeightForSize(_:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4;
  return result;
}

uint64_t sub_1C2C01CE8(uint64_t a1)
{
  return sub_1C2C01D10(a1, qword_1EA330C28, MEMORY[0x1E4FB2950]);
}

uint64_t sub_1C2C01CFC(uint64_t a1)
{
  return sub_1C2C01D10(a1, qword_1EA330C40, MEMORY[0x1E4FB28D8]);
}

uint64_t sub_1C2C01D10(uint64_t a1, uint64_t *a2, void **a3)
{
  uint64_t v5 = sub_1C2C26B38();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v26[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v26[-1] - v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v26[-1] - v13;
  MEMORY[0x1F4188790](v15);
  char v17 = (char *)&v26[-1] - v16;
  __swift_allocate_value_buffer(v18, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  sub_1C2C26B28();
  uint64_t v19 = sub_1C2C263F8();
  v26[3] = v19;
  v26[4] = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v26);
  uint64_t v21 = *a3;
  uint64_t *boxed_opaque_existential_1 = (uint64_t)v21;
  (*(void (**)(void))(*(void *)(v19 - 8) + 104))();
  id v22 = v21;
  sub_1C2C26AE8();
  char v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  sub_1C2C26AF8();
  v23(v11, v5);
  sub_1C2C26B08();
  v23(v14, v5);
  sub_1C2C26B18();
  return ((uint64_t (*)(char *, uint64_t))v23)(v17, v5);
}

uint64_t sub_1C2C01F50(uint64_t a1)
{
  return sub_1C2C026E4(a1, &qword_1EA330C80[3], &qword_1EA330C80[4], qword_1EA330C80, (uint64_t)&unk_1EA330C58);
}

uint64_t sub_1C2C01F68()
{
  uint64_t v0 = sub_1C2C263F8();
  uint64_t v1 = *(void **)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (uint64_t *)((char *)&v23[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  double v4 = (void *)sub_1C2C26DD8();
  double IconSize = ASCLockupViewSizeGetIconSize(v4, 1);
  uint64_t v7 = v6;

  uint64_t v31 = MEMORY[0x1E4FBB3D0];
  uint64_t v32 = MEMORY[0x1E4F71D78];
  *(void *)&long long v30 = 0x4024000000000000;
  uint64_t v8 = (void *)*MEMORY[0x1E4FB2950];
  uint64_t v9 = *MEMORY[0x1E4FB29C0];
  *uint64_t v3 = *MEMORY[0x1E4FB2950];
  v3[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F71A00];
  uint64_t v11 = sub_1C2C26598();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v3, v10, v11);
  uint64_t v12 = (void (*)(void *, void, uint64_t))v1[13];
  v12(v3, *MEMORY[0x1E4F71998], v0);
  uint64_t v13 = sub_1C2C268B8();
  uint64_t v28 = v13;
  uint64_t v29 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v27);
  uint64_t v25 = v0;
  uint64_t v26 = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v24);
  uint64_t v15 = (void (*)(uint64_t *, void *, uint64_t))v1[2];
  v15(boxed_opaque_existential_1, v3, v0);
  id v16 = v8;
  sub_1C2C268C8();
  char v17 = (void (*)(void *, uint64_t))v1[1];
  v17(v3, v0);
  uint64_t v18 = (void *)*MEMORY[0x1E4FB28D8];
  *uint64_t v3 = *MEMORY[0x1E4FB28D8];
  v12(v3, *MEMORY[0x1E4F719A0], v0);
  uint64_t v25 = v13;
  uint64_t v26 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v24);
  v23[3] = v0;
  v23[4] = MEMORY[0x1E4F719A8];
  uint64_t v19 = __swift_allocate_boxed_opaque_existential_1(v23);
  v15(v19, v3, v0);
  id v20 = v18;
  sub_1C2C268C8();
  v17(v3, v0);
  qword_1EA330D48 = MEMORY[0x1E4FBB3D0];
  qword_1EA330D50 = MEMORY[0x1E4F71D78];
  qword_1EA330D30 = 0x4030000000000000;
  qword_1EA330CA8 = *(void *)&IconSize;
  unk_1EA330CB0 = v7;
  sub_1C2BF8100(&v30, (uint64_t)&unk_1EA330CB8);
  sub_1C2BF8100(&v27, (uint64_t)&unk_1EA330CE0);
  return sub_1C2BF8100(&v24, (uint64_t)&unk_1EA330D08);
}

uint64_t sub_1C2C02270()
{
  uint64_t v0 = sub_1C2C263F8();
  uint64_t v1 = *(void **)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (uint64_t *)((char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  double v4 = (void *)sub_1C2C26DD8();
  double IconSize = ASCLockupViewSizeGetIconSize(v4, 1);
  uint64_t v7 = v6;

  uint64_t v36 = MEMORY[0x1E4FBB3D0];
  uint64_t v37 = MEMORY[0x1E4F71D78];
  *(void *)&long long v35 = 0x4024000000000000;
  uint64_t v8 = (void *)*MEMORY[0x1E4FB28D8];
  uint64_t v9 = *MEMORY[0x1E4FB29C0];
  *uint64_t v3 = *MEMORY[0x1E4FB28D8];
  v3[1] = v9;
  unsigned int v26 = *MEMORY[0x1E4F71A00];
  uint64_t v10 = v26;
  uint64_t v11 = sub_1C2C26598();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v25 = *(void (**)(void *, uint64_t, uint64_t))(v12 + 104);
  uint64_t v27 = v12 + 104;
  v25(v3, v10, v11);
  unsigned int v24 = *MEMORY[0x1E4F71998];
  char v23 = (void (*)(void *))v1[13];
  v23(v3);
  uint64_t v13 = sub_1C2C268B8();
  uint64_t v33 = v13;
  uint64_t v34 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v32);
  uint64_t v30 = v0;
  uint64_t v31 = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v29);
  id v22 = (void (*)(uint64_t *, void *, uint64_t))v1[2];
  v22(boxed_opaque_existential_1, v3, v0);
  id v15 = v8;
  sub_1C2C268C8();
  id v16 = (void (*)(void *, uint64_t))v1[1];
  v16(v3, v0);
  char v17 = (void *)*MEMORY[0x1E4FB2950];
  *uint64_t v3 = *MEMORY[0x1E4FB2950];
  v3[1] = v9;
  v25(v3, v26, v11);
  ((void (*)(void *, void, uint64_t))v23)(v3, v24, v0);
  uint64_t v30 = v13;
  uint64_t v31 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v29);
  v28[3] = v0;
  v28[4] = MEMORY[0x1E4F719A8];
  uint64_t v18 = __swift_allocate_boxed_opaque_existential_1(v28);
  v22(v18, v3, v0);
  id v19 = v17;
  sub_1C2C268C8();
  v16(v3, v0);
  qword_1EA330DF8 = MEMORY[0x1E4FBB3D0];
  qword_1EA330E00 = MEMORY[0x1E4F71D78];
  qword_1EA330DE0 = 0x4030000000000000;
  qword_1EA330D58 = *(void *)&IconSize;
  unk_1EA330D60 = v7;
  sub_1C2BF8100(&v35, (uint64_t)&unk_1EA330D68);
  sub_1C2BF8100(&v32, (uint64_t)&unk_1EA330D90);
  return sub_1C2BF8100(&v29, (uint64_t)&unk_1EA330DB8);
}

void sub_1C2C025F0()
{
  if (qword_1EA3307E0 != -1) {
    swift_once();
  }
  CGFloat v0 = *(double *)&qword_1EA330CA8;
  CGFloat v1 = unk_1EA330CB0;
  id v2 = objc_msgSend(self, sel_clearColor);
  v4.CGFloat width = v0;
  v4.CGFloat height = v1;
  UIGraphicsBeginImageContextWithOptions(v4, 0, 0.0);
  objc_msgSend(v2, sel_set);
  v5.origin.CGFloat x = 0.0;
  v5.origin.CGFloat y = 0.0;
  v5.size.CGFloat width = v0;
  v5.size.CGFloat height = v1;
  UIRectFill(v5);
  uint64_t v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  qword_1EA330E08 = (uint64_t)v3;
}

uint64_t sub_1C2C026CC(uint64_t a1)
{
  return sub_1C2C026E4(a1, &qword_1EB6811D8[3], &qword_1EB6811D8[4], qword_1EB6811D8, (uint64_t)&unk_1EB6811B0);
}

uint64_t sub_1C2C026E4(uint64_t a1, void *a2, void *a3, uint64_t *a4, uint64_t a5)
{
  if (qword_1EB681168 != -1) {
    swift_once();
  }
  uint64_t v9 = MEMORY[0x1E4FBC958];
  uint64_t v10 = MEMORY[0x1E4F71988];
  uint64_t v14 = MEMORY[0x1E4FBC958];
  uint64_t v15 = MEMORY[0x1E4F71988];
  *(void *)&long long v13 = qword_1EB681160;
  if (qword_1EB681920 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_1EB681918;
  *a2 = v9;
  *a3 = v10;
  *a4 = v11;
  return sub_1C2BF8100(&v13, a5);
}

uint64_t sub_1C2C027C8()
{
  if (qword_1EA3307B8 != -1) {
    swift_once();
  }
  uint64_t v0 = MEMORY[0x1E4FBC958];
  uint64_t v1 = MEMORY[0x1E4F71988];
  uint64_t v4 = MEMORY[0x1E4FBC958];
  uint64_t v5 = MEMORY[0x1E4F71988];
  *(void *)&long long v3 = qword_1EA330C18;
  if (qword_1EA3307C0 != -1) {
    swift_once();
  }
  qword_1EA330E50 = v0;
  unk_1EA330E58 = v1;
  qword_1EA330E38 = qword_1EA330C20;
  return sub_1C2BF8100(&v3, (uint64_t)&unk_1EA330E10);
}

uint64_t sub_1C2C0288C()
{
  uint64_t v0 = sub_1C2C263F8();
  uint64_t v1 = *(void **)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (uint64_t **)((char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = type metadata accessor for SmallLockupLayout.Metrics(0);
  __swift_allocate_value_buffer(v4, qword_1EB6812B0);
  uint64_t v58 = v4;
  uint64_t v57 = __swift_project_value_buffer(v4, (uint64_t)qword_1EB6812B0);
  double IconSize = ASCLockupViewSizeGetIconSize(@"small", 1);
  uint64_t v7 = v6;
  uint64_t v107 = MEMORY[0x1E4FBB3D0];
  uint64_t v108 = MEMORY[0x1E4F71D78];
  *(void *)&long long v106 = 0x4024000000000000;
  uint64_t v8 = (void *)*MEMORY[0x1E4FB28F0];
  *long long v3 = (uint64_t *)*MEMORY[0x1E4FB28F0];
  unsigned int v63 = *MEMORY[0x1E4F719A0];
  uint64_t v9 = v1 + 13;
  long long v64 = (void (*)(uint64_t **))v1[13];
  v64(v3);
  uint64_t v104 = sub_1C2C268B8();
  uint64_t v105 = MEMORY[0x1E4F71AE8];
  uint64_t v10 = v104;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v103);
  uint64_t v101 = v0;
  uint64_t v102 = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v100);
  uint64_t v12 = v1 + 2;
  long long v65 = (void (*)(uint64_t *, uint64_t **, uint64_t))v1[2];
  v65(boxed_opaque_existential_1, v3, v0);
  id v56 = v8;
  sub_1C2C268C8();
  uint64_t v62 = (void (*)(uint64_t **, uint64_t))v1[1];
  uint64_t v66 = v1 + 1;
  v62(v3, v0);
  long long v13 = (void *)*MEMORY[0x1E4FB28C8];
  *long long v3 = (uint64_t *)*MEMORY[0x1E4FB28C8];
  uint64_t v14 = v63;
  uint64_t v15 = (void (*)(uint64_t **, uint64_t, uint64_t))v64;
  ((void (*)(uint64_t **, void, uint64_t))v64)(v3, v63, v0);
  uint64_t v60 = v10;
  uint64_t v61 = v9;
  uint64_t v101 = v10;
  uint64_t v102 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v100);
  uint64_t v98 = v0;
  uint64_t v99 = MEMORY[0x1E4F719A8];
  id v16 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v97);
  v65(v16, v3, v0);
  char v17 = v13;
  sub_1C2C268C8();
  uint64_t v18 = v62;
  v62(v3, v0);
  *long long v3 = v17;
  v15(v3, v14, v0);
  uint64_t v98 = v10;
  uint64_t v99 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v97);
  uint64_t v95 = v0;
  uint64_t v96 = MEMORY[0x1E4F719A8];
  id v19 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v94);
  id v20 = v65;
  v65(v19, v3, v0);
  uint64_t v21 = v17;
  uint64_t v55 = v21;
  sub_1C2C268C8();
  v18(v3, v0);
  *long long v3 = v21;
  uint64_t v22 = v63;
  char v23 = (void (*)(uint64_t **, uint64_t, uint64_t))v64;
  ((void (*)(uint64_t **, void, uint64_t))v64)(v3, v63, v0);
  uint64_t v24 = v60;
  uint64_t v95 = v60;
  uint64_t v96 = MEMORY[0x1E4F71AE8];
  uint64_t v54 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v94);
  uint64_t v92 = v0;
  uint64_t v93 = MEMORY[0x1E4F719A8];
  uint64_t v25 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v91);
  uint64_t v59 = v12;
  v20(v25, v3, v0);
  unsigned int v26 = v55;
  sub_1C2C268C8();
  uint64_t v27 = v62;
  v62(v3, v0);
  *long long v3 = v26;
  uint64_t v28 = v26;
  v23(v3, v22, v0);
  uint64_t v92 = v24;
  uint64_t v93 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v91);
  uint64_t v89 = v0;
  uint64_t v90 = MEMORY[0x1E4F719A8];
  long long v29 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v88);
  uint64_t v30 = v65;
  v65(v29, v3, v0);
  uint64_t v31 = v28;
  sub_1C2C268C8();
  v27(v3, v0);
  long long v32 = v56;
  *long long v3 = (uint64_t *)v56;
  uint64_t v33 = v63;
  ((void (*)(uint64_t **, void, uint64_t))v64)(v3, v63, v0);
  uint64_t v34 = v60;
  uint64_t v89 = v60;
  uint64_t v90 = MEMORY[0x1E4F71AE8];
  uint64_t v55 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v88);
  uint64_t v86 = v0;
  uint64_t v87 = MEMORY[0x1E4F719A8];
  long long v35 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v85);
  v30(v35, v3, v0);
  uint64_t v36 = v32;
  sub_1C2C268C8();
  uint64_t v37 = v62;
  v62(v3, v0);
  *long long v3 = v36;
  uint64_t v38 = v33;
  uint64_t v39 = v64;
  ((void (*)(uint64_t **, uint64_t, uint64_t))v64)(v3, v38, v0);
  uint64_t v86 = v34;
  uint64_t v87 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v85);
  uint64_t v83 = v0;
  uint64_t v84 = MEMORY[0x1E4F719A8];
  uint64_t v40 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v82);
  uint64_t v41 = v65;
  v65(v40, v3, v0);
  uint64_t v42 = v36;
  sub_1C2C268C8();
  v37(v3, v0);
  *long long v3 = v42;
  ((void (*)(uint64_t **, void, uint64_t))v39)(v3, v63, v0);
  uint64_t v43 = MEMORY[0x1E4F71D78];
  uint64_t v83 = v34;
  uint64_t v84 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v82);
  uint64_t v80 = v0;
  uint64_t v81 = MEMORY[0x1E4F719A8];
  uint64_t v44 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v79);
  v41(v44, v3, v0);
  uint64_t v45 = MEMORY[0x1E4FBB3D0];
  uint64_t v46 = v42;
  sub_1C2C268C8();
  v37(v3, v0);
  uint64_t v80 = v45;
  uint64_t v81 = v43;
  *(void *)&long long v79 = 0x4024000000000000;
  if (qword_1EB681920 != -1) {
    swift_once();
  }
  uint64_t v77 = MEMORY[0x1E4FBC958];
  uint64_t v78 = MEMORY[0x1E4F71988];
  *(void *)&long long v76 = qword_1EB681918;
  uint64_t v74 = v45;
  uint64_t v75 = v43;
  *(void *)&long long v73 = 0;
  uint64_t v47 = sub_1C2C26718();
  uint64_t v48 = MEMORY[0x1E4F71A48];
  uint64_t v71 = v47;
  uint64_t v72 = MEMORY[0x1E4F71A48];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v70);
  sub_1C2C26708();
  uint64_t v68 = v47;
  uint64_t v69 = v48;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v67);
  sub_1C2C26708();
  uint64_t v49 = (double *)v57;
  uint64_t v50 = v57 + *(int *)(v58 + 76);
  uint64_t v51 = *MEMORY[0x1E4F71C18];
  uint64_t v52 = sub_1C2C26B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 104))(v50, v51, v52);
  *uint64_t v49 = IconSize;
  *((void *)v49 + 1) = v7;
  sub_1C2BF8100(&v106, (uint64_t)(v49 + 2));
  sub_1C2BF8100(&v103, (uint64_t)(v49 + 7));
  sub_1C2BF8100(&v100, (uint64_t)(v49 + 12));
  sub_1C2BF8100(&v97, (uint64_t)(v49 + 17));
  sub_1C2BF8100(&v94, (uint64_t)(v49 + 22));
  sub_1C2BF8100(&v91, (uint64_t)(v49 + 27));
  sub_1C2BF8100(&v70, (uint64_t)(v49 + 32));
  sub_1C2BF8100(&v88, (uint64_t)(v49 + 37));
  sub_1C2BF8100(&v85, (uint64_t)(v49 + 42));
  sub_1C2BF8100(&v67, (uint64_t)(v49 + 47));
  sub_1C2BF8100(&v82, (uint64_t)(v49 + 52));
  sub_1C2BF8100(&v79, (uint64_t)(v49 + 57));
  sub_1C2BF8100(&v76, (uint64_t)(v49 + 62));
  return sub_1C2BF8100(&v73, (uint64_t)(v49 + 67));
}

uint64_t sub_1C2C030B0()
{
  uint64_t v0 = sub_1C2C263F8();
  uint64_t v1 = *(void **)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (void *)((char *)v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  double IconSize = ASCLockupViewSizeGetIconSize(@"medium", 1);
  uint64_t v6 = v5;
  uint64_t v7 = (void *)*MEMORY[0x1E4FB28F0];
  *long long v3 = *MEMORY[0x1E4FB28F0];
  uint64_t v8 = *MEMORY[0x1E4F719A0];
  uint64_t v40 = (void (*)(void *, uint64_t, uint64_t))v1[13];
  v40(v3, v8, v0);
  uint64_t v66 = sub_1C2C268B8();
  uint64_t v67 = MEMORY[0x1E4F71AE8];
  uint64_t v9 = v66;
  uint64_t v39 = v66;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v65);
  uint64_t v63 = v0;
  uint64_t v64 = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v62);
  uint64_t v45 = (void (*)(uint64_t *, void *, uint64_t))v1[2];
  uint64_t v42 = v1 + 2;
  v45(boxed_opaque_existential_1, v3, v0);
  id v37 = v7;
  sub_1C2C268C8();
  uint64_t v43 = (void (*)(void *, uint64_t))v1[1];
  v43(v3, v0);
  uint64_t v11 = (void *)*MEMORY[0x1E4FB28C8];
  *long long v3 = *MEMORY[0x1E4FB28C8];
  unsigned int v44 = v8;
  uint64_t v12 = v40;
  uint64_t v38 = v1 + 13;
  v40(v3, v8, v0);
  uint64_t v63 = v9;
  uint64_t v64 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v62);
  uint64_t v60 = v0;
  uint64_t v61 = MEMORY[0x1E4F719A8];
  long long v13 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v59);
  uint64_t v14 = v45;
  v45(v13, v3, v0);
  id v15 = v11;
  sub_1C2C268C8();
  id v16 = v43;
  v43(v3, v0);
  uint64_t v41 = v1 + 1;
  *long long v3 = v15;
  v12(v3, v8, v0);
  uint64_t v17 = v39;
  uint64_t v60 = v39;
  uint64_t v61 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v59);
  uint64_t v57 = v0;
  uint64_t v58 = MEMORY[0x1E4F719A8];
  uint64_t v18 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v56);
  v14(v18, v3, v0);
  id v19 = v15;
  sub_1C2C268C8();
  id v20 = v16;
  v16(v3, v0);
  uint64_t v21 = v37;
  *long long v3 = v37;
  uint64_t v22 = v44;
  char v23 = v40;
  v40(v3, v44, v0);
  uint64_t v57 = v17;
  uint64_t v58 = MEMORY[0x1E4F71AE8];
  v36[1] = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v56);
  uint64_t v54 = v0;
  uint64_t v55 = MEMORY[0x1E4F719A8];
  uint64_t v24 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v53);
  v45(v24, v3, v0);
  id v25 = v21;
  sub_1C2C268C8();
  v20(v3, v0);
  *long long v3 = v25;
  v23(v3, v22, v0);
  uint64_t v26 = v39;
  uint64_t v54 = v39;
  uint64_t v55 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v53);
  uint64_t v51 = v0;
  uint64_t v52 = MEMORY[0x1E4F719A8];
  uint64_t v27 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v50);
  uint64_t v28 = v45;
  v45(v27, v3, v0);
  id v29 = v25;
  sub_1C2C268C8();
  v43(v3, v0);
  *long long v3 = v29;
  v23(v3, v44, v0);
  uint64_t v51 = v26;
  uint64_t v52 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v50);
  uint64_t v48 = v0;
  uint64_t v49 = MEMORY[0x1E4F719A8];
  uint64_t v30 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v47);
  v28(v30, v3, v0);
  id v31 = v29;
  sub_1C2C268C8();
  long long v32 = v43;
  v43(v3, v0);
  *long long v3 = v31;
  v23(v3, v44, v0);
  uint64_t v48 = v26;
  uint64_t v49 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v47);
  v46[3] = v0;
  v46[4] = MEMORY[0x1E4F719A8];
  uint64_t v33 = __swift_allocate_boxed_opaque_existential_1(v46);
  v28(v33, v3, v0);
  id v34 = v31;
  sub_1C2C268C8();
  v32(v3, v0);
  if (qword_1EB681168 != -1) {
    swift_once();
  }
  qword_1EA330FA8 = MEMORY[0x1E4FBC958];
  unk_1EA330FB0 = MEMORY[0x1E4F71988];
  qword_1EA330F90 = qword_1EB681160;
  qword_1EA330E60 = *(void *)&IconSize;
  *(void *)algn_1EA330E68 = v6;
  qword_1EA330E70 = 0x402C000000000000;
  sub_1C2BF8100(&v65, (uint64_t)&unk_1EA330E78);
  sub_1C2BF8100(&v62, (uint64_t)&unk_1EA330EA0);
  sub_1C2BF8100(&v59, (uint64_t)&unk_1EA330EC8);
  sub_1C2BF8100(&v56, (uint64_t)&unk_1EA330EF0);
  sub_1C2BF8100(&v53, (uint64_t)&unk_1EA330F18);
  sub_1C2BF8100(&v50, (uint64_t)&unk_1EA330F40);
  return sub_1C2BF8100(&v47, (uint64_t)&unk_1EA330F68);
}

uint64_t sub_1C2C036DC()
{
  uint64_t v0 = sub_1C2C263F8();
  uint64_t v1 = *(void **)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (void *)((char *)v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  double IconSize = ASCLockupViewSizeGetIconSize(@"medium", 2);
  uint64_t v6 = v5;
  uint64_t v7 = (void *)*MEMORY[0x1E4FB28F0];
  *long long v3 = *MEMORY[0x1E4FB28F0];
  uint64_t v8 = *MEMORY[0x1E4F719A0];
  uint64_t v40 = (void (*)(void *, uint64_t, uint64_t))v1[13];
  v40(v3, v8, v0);
  uint64_t v66 = sub_1C2C268B8();
  uint64_t v67 = MEMORY[0x1E4F71AE8];
  uint64_t v9 = v66;
  uint64_t v39 = v66;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v65);
  uint64_t v63 = v0;
  uint64_t v64 = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v62);
  uint64_t v45 = (void (*)(uint64_t *, void *, uint64_t))v1[2];
  uint64_t v42 = v1 + 2;
  v45(boxed_opaque_existential_1, v3, v0);
  id v37 = v7;
  sub_1C2C268C8();
  uint64_t v43 = (void (*)(void *, uint64_t))v1[1];
  v43(v3, v0);
  uint64_t v11 = (void *)*MEMORY[0x1E4FB28C8];
  *long long v3 = *MEMORY[0x1E4FB28C8];
  unsigned int v44 = v8;
  uint64_t v12 = v40;
  uint64_t v38 = v1 + 13;
  v40(v3, v8, v0);
  uint64_t v63 = v9;
  uint64_t v64 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v62);
  uint64_t v60 = v0;
  uint64_t v61 = MEMORY[0x1E4F719A8];
  long long v13 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v59);
  uint64_t v14 = v45;
  v45(v13, v3, v0);
  id v15 = v11;
  sub_1C2C268C8();
  id v16 = v43;
  v43(v3, v0);
  uint64_t v41 = v1 + 1;
  *long long v3 = v15;
  v12(v3, v8, v0);
  uint64_t v17 = v39;
  uint64_t v60 = v39;
  uint64_t v61 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v59);
  uint64_t v57 = v0;
  uint64_t v58 = MEMORY[0x1E4F719A8];
  uint64_t v18 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v56);
  v14(v18, v3, v0);
  id v19 = v15;
  sub_1C2C268C8();
  id v20 = v16;
  v16(v3, v0);
  uint64_t v21 = v37;
  *long long v3 = v37;
  uint64_t v22 = v44;
  char v23 = v40;
  v40(v3, v44, v0);
  uint64_t v57 = v17;
  uint64_t v58 = MEMORY[0x1E4F71AE8];
  v36[1] = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v56);
  uint64_t v54 = v0;
  uint64_t v55 = MEMORY[0x1E4F719A8];
  uint64_t v24 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v53);
  v45(v24, v3, v0);
  id v25 = v21;
  sub_1C2C268C8();
  v20(v3, v0);
  *long long v3 = v25;
  v23(v3, v22, v0);
  uint64_t v26 = v39;
  uint64_t v54 = v39;
  uint64_t v55 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v53);
  uint64_t v51 = v0;
  uint64_t v52 = MEMORY[0x1E4F719A8];
  uint64_t v27 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v50);
  uint64_t v28 = v45;
  v45(v27, v3, v0);
  id v29 = v25;
  sub_1C2C268C8();
  v43(v3, v0);
  *long long v3 = v29;
  v23(v3, v44, v0);
  uint64_t v51 = v26;
  uint64_t v52 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v50);
  uint64_t v48 = v0;
  uint64_t v49 = MEMORY[0x1E4F719A8];
  uint64_t v30 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v47);
  v28(v30, v3, v0);
  id v31 = v29;
  sub_1C2C268C8();
  long long v32 = v43;
  v43(v3, v0);
  *long long v3 = v31;
  v23(v3, v44, v0);
  uint64_t v48 = v26;
  uint64_t v49 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v47);
  v46[3] = v0;
  v46[4] = MEMORY[0x1E4F719A8];
  uint64_t v33 = __swift_allocate_boxed_opaque_existential_1(v46);
  v28(v33, v3, v0);
  id v34 = v31;
  sub_1C2C268C8();
  v32(v3, v0);
  if (qword_1EB681168 != -1) {
    swift_once();
  }
  qword_1EA331100 = MEMORY[0x1E4FBC958];
  unk_1EA331108 = MEMORY[0x1E4F71988];
  qword_1EA3310E8 = qword_1EB681160;
  qword_1EA330FB8 = *(void *)&IconSize;
  unk_1EA330FC0 = v6;
  qword_1EA330FC8 = 0x402E000000000000;
  sub_1C2BF8100(&v65, (uint64_t)&unk_1EA330FD0);
  sub_1C2BF8100(&v62, (uint64_t)&unk_1EA330FF8);
  sub_1C2BF8100(&v59, (uint64_t)&unk_1EA331020);
  sub_1C2BF8100(&v56, (uint64_t)&unk_1EA331048);
  sub_1C2BF8100(&v53, (uint64_t)&unk_1EA331070);
  sub_1C2BF8100(&v50, (uint64_t)&unk_1EA331098);
  return sub_1C2BF8100(&v47, (uint64_t)&unk_1EA3310C0);
}

uint64_t sub_1C2C03D08()
{
  uint64_t v0 = sub_1C2C263F8();
  uint64_t v1 = *(void **)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (void *)((char *)v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = (void *)sub_1C2C26DD8();
  double IconSize = ASCLockupViewSizeGetIconSize(v4, 1);
  uint64_t v7 = v6;

  uint64_t v8 = (void *)*MEMORY[0x1E4FB28F0];
  *long long v3 = *MEMORY[0x1E4FB28F0];
  unsigned int v45 = *MEMORY[0x1E4F719A0];
  long long v50 = (void (*)(void *))v1[13];
  v50(v3);
  uint64_t v48 = v1 + 13;
  uint64_t v71 = sub_1C2C268B8();
  uint64_t v72 = MEMORY[0x1E4F71AE8];
  uint64_t v9 = v71;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v70);
  uint64_t v68 = v0;
  uint64_t v69 = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v67);
  uint64_t v11 = v1 + 2;
  uint64_t v49 = (void (*)(uint64_t *, void *, uint64_t))v1[2];
  v49(boxed_opaque_existential_1, v3, v0);
  id v42 = v8;
  sub_1C2C268C8();
  long long v47 = (void (*)(void *, uint64_t))v1[1];
  v47(v3, v0);
  uint64_t v43 = v1 + 1;
  uint64_t v12 = (void *)*MEMORY[0x1E4FB2990];
  *long long v3 = *MEMORY[0x1E4FB2990];
  uint64_t v13 = v45;
  uint64_t v14 = (void (*)(void *, uint64_t, uint64_t))v50;
  ((void (*)(void *, void, uint64_t))v50)(v3, v45, v0);
  uint64_t v68 = v9;
  uint64_t v44 = v9;
  uint64_t v69 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v67);
  uint64_t v65 = v0;
  uint64_t v66 = MEMORY[0x1E4F719A8];
  id v15 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v64);
  v49(v15, v3, v0);
  uint64_t v46 = v11;
  id v16 = v12;
  sub_1C2C268C8();
  uint64_t v17 = v47;
  v47(v3, v0);
  *long long v3 = v16;
  v14(v3, v13, v0);
  uint64_t v65 = v9;
  uint64_t v66 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v64);
  uint64_t v62 = v0;
  uint64_t v63 = MEMORY[0x1E4F719A8];
  uint64_t v18 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v61);
  id v19 = v49;
  v49(v18, v3, v0);
  id v20 = v16;
  sub_1C2C268C8();
  v17(v3, v0);
  uint64_t v21 = (void *)*MEMORY[0x1E4FB2950];
  *long long v3 = *MEMORY[0x1E4FB2950];
  uint64_t v22 = v13;
  uint64_t v23 = v13;
  uint64_t v24 = (void (*)(void *, uint64_t, uint64_t))v50;
  ((void (*)(void *, uint64_t, uint64_t))v50)(v3, v23, v0);
  uint64_t v25 = v44;
  uint64_t v62 = v44;
  uint64_t v63 = MEMORY[0x1E4F71AE8];
  v41[1] = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v61);
  uint64_t v59 = v0;
  uint64_t v60 = MEMORY[0x1E4F719A8];
  uint64_t v26 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v58);
  v19(v26, v3, v0);
  id v27 = v21;
  sub_1C2C268C8();
  uint64_t v28 = v47;
  v47(v3, v0);
  *long long v3 = v27;
  v24(v3, v22, v0);
  uint64_t v29 = v25;
  uint64_t v59 = v25;
  uint64_t v60 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v58);
  uint64_t v56 = v0;
  uint64_t v57 = MEMORY[0x1E4F719A8];
  uint64_t v30 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v55);
  id v31 = v49;
  v49(v30, v3, v0);
  id v32 = v27;
  sub_1C2C268C8();
  v28(v3, v0);
  uint64_t v33 = v42;
  *long long v3 = v42;
  uint64_t v34 = v45;
  ((void (*)(void *, void, uint64_t))v50)(v3, v45, v0);
  uint64_t v56 = v29;
  uint64_t v57 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v55);
  uint64_t v53 = v0;
  uint64_t v54 = MEMORY[0x1E4F719A8];
  long long v35 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v52);
  v31(v35, v3, v0);
  id v36 = v33;
  sub_1C2C268C8();
  id v37 = v47;
  v47(v3, v0);
  *long long v3 = v36;
  ((void (*)(void *, uint64_t, uint64_t))v50)(v3, v34, v0);
  uint64_t v53 = v44;
  uint64_t v54 = MEMORY[0x1E4F71AE8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v52);
  void v51[3] = v0;
  v51[4] = MEMORY[0x1E4F719A8];
  uint64_t v38 = __swift_allocate_boxed_opaque_existential_1(v51);
  v31(v38, v3, v0);
  id v39 = v36;
  sub_1C2C268C8();
  v37(v3, v0);
  qword_1EA331110 = *(void *)&IconSize;
  unk_1EA331118 = v7;
  sub_1C2BF8100(&v70, (uint64_t)&unk_1EA331120);
  sub_1C2BF8100(&v67, (uint64_t)&unk_1EA331148);
  sub_1C2BF8100(&v64, (uint64_t)&unk_1EA331170);
  sub_1C2BF8100(&v61, (uint64_t)&unk_1EA3311A8);
  sub_1C2BF8100(&v58, (uint64_t)&unk_1EA3311D0);
  sub_1C2BF8100(&v55, (uint64_t)&unk_1EA3311F8);
  uint64_t result = sub_1C2BF8100(&v52, (uint64_t)&unk_1EA331220);
  qword_1EA331198 = 0;
  byte_1EA3311A0 = 1;
  return result;
}

double static ASCLayoutProxy.smallOfferButtonLockupEstimatedSize(fitting:compatibleWith:)(void *a1, double a2)
{
  return sub_1C2C053AC(a1, &qword_1EB681110, (uint64_t)&unk_1EB6811B0, a2);
}

double static ASCLayoutProxy.mediumOfferButtonLockupEstimatedSize(fitting:compatibleWith:)(void *a1, double a2)
{
  return sub_1C2C053AC(a1, &qword_1EA3307F8, (uint64_t)&unk_1EA330E10, a2);
}

double static ASCLayoutProxy.smallLockupEstimatedSize(fitting:compatibleWith:)(void *a1)
{
  if (qword_1EB6812C8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for SmallLockupLayout.Metrics(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EB6812B0);
  sub_1C2C26BF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681948);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C2C2FB10;
  *(void *)(v4 + 32) = a1;
  sub_1C2C26E68();
  id v5 = a1;
  uint64_t v6 = (void *)sub_1C2C26C08();
  double v7 = sub_1C2C04840(v3, v6);

  return v7;
}

double sub_1C2C04840(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_1C2C26878();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  double v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C2C268A8();
  uint64_t v9 = *(void *)(v8 - 8);
  __n128 v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v5 + 104))(v7, *MEMORY[0x1E4F71AD8], v4, v10);
  sub_1C2C26888();
  id v13 = objc_msgSend(a2, sel_traitCollection);
  LOBYTE(v7) = sub_1C2C26EC8();

  if (v7)
  {
    uint64_t v14 = *(void *)(a1 + 8);
    v20[3] = MEMORY[0x1E4FBC958];
    v20[4] = MEMORY[0x1E4F71988];
    v20[0] = v14;
    uint64_t v15 = sub_1C2C26BC8();
    uint64_t v16 = MEMORY[0x1E4F71C30];
    uint64_t v22 = v15;
    uint64_t v23 = MEMORY[0x1E4F71C30];
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 16, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 56, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 216, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 296, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 336, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 456, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 496, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 416, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 536, (uint64_t)v20);
  }
  else
  {
    sub_1C2BF7C98(a1 + 96, (uint64_t)v20);
    uint64_t v15 = sub_1C2C26BC8();
    uint64_t v16 = MEMORY[0x1E4F71C30];
    uint64_t v22 = v15;
    uint64_t v23 = MEMORY[0x1E4F71C30];
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 296, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 416, (uint64_t)v20);
  }
  uint64_t v22 = v15;
  uint64_t v23 = v16;
  __swift_allocate_boxed_opaque_existential_1(v21);
  sub_1C2C26BD8();
  sub_1C2C26898();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  sub_1C2C26868();
  double v18 = v17;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return v18;
}

double _s18AppStoreComponents14ASCLayoutProxyC23miniLockupEstimatedSize7fitting14compatibleWithSo6CGSizeVAH_So17UITraitCollectionCtFZ_0(uint64_t a1, double a2)
{
  uint64_t v28 = a1;
  uint64_t v29 = sub_1C2C26CE8();
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C2C26798();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v26 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C2C26B38();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  __n128 v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C2C26848();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EA3307E0 != -1) {
    swift_once();
  }
  sub_1C2C07750((uint64_t)&qword_1EA330CA8, (uint64_t)v41);
  if (qword_1EA3307F0 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_1EA330848;
  id v16 = (id)qword_1EA330E08;
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v11, (uint64_t)qword_1EA333408);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v17, v11);
  v40[3] = sub_1C2C268D8();
  v40[4] = MEMORY[0x1E4F71AF8];
  __swift_allocate_boxed_opaque_existential_1(v40);
  sub_1C2C268E8();
  if (qword_1EA3307C8 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v7, (uint64_t)qword_1EA330C28);
  id v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v19(v10, v18, v7);
  sub_1C2C268F8();
  uint64_t v20 = sub_1C2C26908();
  uint64_t v21 = MEMORY[0x1E4F71B08];
  v39[3] = v20;
  v39[4] = MEMORY[0x1E4F71B08];
  __swift_allocate_boxed_opaque_existential_1(v39);
  sub_1C2C26928();
  if (qword_1EA3307D0 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v7, (uint64_t)qword_1EA330C40);
  v19(v10, v22, v7);
  sub_1C2C268F8();
  uint64_t v37 = v20;
  uint64_t v38 = v21;
  __swift_allocate_boxed_opaque_existential_1(v36);
  sub_1C2C26928();
  if (qword_1EA3307D8 != -1) {
    swift_once();
  }
  uint64_t v34 = &type metadata for OfferButtonPlaceholder;
  unint64_t v35 = sub_1C2C07BC4();
  *(void *)&long long v33 = swift_allocObject();
  sub_1C2C07C58((uint64_t)&unk_1EA330C58, v33 + 16);
  sub_1C2C07750((uint64_t)v41, (uint64_t)v32);
  sub_1C2BF7C98((uint64_t)v40, (uint64_t)&v32[176]);
  sub_1C2BF7C98((uint64_t)v39, (uint64_t)&v32[216]);
  sub_1C2C07870((uint64_t)v36, (uint64_t)&v30);
  if (v31)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    sub_1C2C078D8((uint64_t)v41);
    sub_1C2BF8100(&v30, (uint64_t)v42);
  }
  else
  {
    sub_1C2C26788();
    sub_1C2C268F8();
    *((void *)&v42[1] + 1) = v20;
    *(void *)&v42[2] = v21;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)v42);
    sub_1C2C26918();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    sub_1C2C078D8((uint64_t)v41);
    sub_1C2C0792C((uint64_t)&v30);
  }
  sub_1C2BF8100(v42, (uint64_t)&v32[256]);
  BOOL v23 = v37 == 0;
  sub_1C2C0792C((uint64_t)v36);
  v32[336] = v23;
  sub_1C2BF8100(&v33, (uint64_t)&v32[296]);
  memcpy(v42, v32, 0x151uLL);
  sub_1C2C15CAC((uint64_t)v4);
  uint64_t v24 = v29;
  sub_1C2C26D98();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v24);
  sub_1C2C07CB4((uint64_t)v42);
  return a2;
}

double sub_1C2C053AC(void *a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v8 = sub_1C2C26FF8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a2 != -1) {
    swift_once();
  }
  sub_1C2C07554(a3, (uint64_t)v21);
  sub_1C2C26BF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681948);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1C2C2FB10;
  *(void *)(v12 + 32) = a1;
  v20[1] = v12;
  sub_1C2C26E68();
  id v13 = a1;
  uint64_t v14 = (void *)sub_1C2C26C08();
  id v15 = objc_msgSend(v14, sel_traitCollection);
  char v16 = sub_1C2C26EC8();

  if (v16)
  {
    uint64_t v17 = v23;
    uint64_t v18 = v23[3];
  }
  else
  {
    uint64_t v18 = v22;
    uint64_t v17 = v21;
  }
  __swift_project_boxed_opaque_existential_1(v17, v18);
  sub_1C2C082FC();
  sub_1C2C265D8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  sub_1C2C07B70((uint64_t)v21);
  return a4;
}

double sub_1C2C055A0(void *a1, void *a2, double a3)
{
  uint64_t v6 = sub_1C2C26FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)&double v8 = MEMORY[0x1F4188790](v6).n128_u64[0];
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(a2, sel_traitCollection, v8);
  __swift_project_boxed_opaque_existential_1(a1 + 8, a1[11]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v7 + 8);
  v12(v10, v6);
  if (sub_1C2C26EA8())
  {
    __swift_project_boxed_opaque_existential_1(a1 + 18, a1[21]);
    sub_1C2C082FC();
    sub_1C2C265D8();
    v12(v10, v6);
  }
  else
  {
    if (sub_1C2C26EC8()) {
      __swift_project_boxed_opaque_existential_1(a1 + 18, a1[21]);
    }
    else {
      __swift_project_boxed_opaque_existential_1(a1 + 23, a1[26]);
    }
    sub_1C2C082FC();
    sub_1C2C265D8();
    v12(v10, v6);
    __swift_project_boxed_opaque_existential_1(a1 + 28, a1[31]);
    sub_1C2C082FC();
    sub_1C2C265D8();
    v12(v10, v6);
  }
  __swift_project_boxed_opaque_existential_1(a1 + 33, a1[36]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  v12(v10, v6);
  __swift_project_boxed_opaque_existential_1(a1 + 38, a1[41]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  v12(v10, v6);
  sub_1C2C26EC8();

  return a3;
}

double _s18AppStoreComponents14ASCLayoutProxyC25mediumLockupEstimatedSize7fitting14compatibleWithSo6CGSizeVAH_So17UITraitCollectionCtFZ_0(void *a1, double a2)
{
  if (objc_msgSend(a1, sel_horizontalSizeClass) == (id)1)
  {
    if (qword_1EA330800 != -1) {
      swift_once();
    }
    uint64_t v4 = &qword_1EA330E60;
  }
  else
  {
    if (qword_1EA330808 != -1) {
      swift_once();
    }
    uint64_t v4 = &qword_1EA330FB8;
  }
  sub_1C2C07130((uint64_t)v4, (uint64_t)v10);
  sub_1C2C26BF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681948);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1C2C2FB10;
  *(void *)(v5 + 32) = a1;
  sub_1C2C26E68();
  id v6 = a1;
  uint64_t v7 = (void *)sub_1C2C26C08();
  double v8 = sub_1C2C055A0(v10, v7, a2);

  sub_1C2C07394((uint64_t)v10);
  return v8;
}

uint64_t _s18AppStoreComponents14ASCLayoutProxyC12lockupLayout6ofSize15traitCollection11artworkView11headingText05titleO008subtitleO005offerO00R6Button5badgeACSo09ASCLockupmI0a_So07UITraitK0CSo6UIViewCSo7UILabelCSgA2uv2SSgtFZ_0(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v161 = a3;
  uint64_t v162 = a8;
  uint64_t v157 = a7;
  id v158 = a6;
  uint64_t v159 = a5;
  id v160 = a4;
  id v155 = a2;
  uint64_t v9 = type metadata accessor for SmallLockupLayout.Metrics(0);
  MEMORY[0x1F4188790](v9);
  id v11 = (char *)&v155 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (int *)type metadata accessor for SmallLockupLayout(0);
  MEMORY[0x1F4188790](v12);
  uint64_t v156 = (char *)&v155 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C2C26798();
  MEMORY[0x1F4188790](v14 - 8);
  id v15 = (void *)sub_1C2C26DD8();
  uint64_t v16 = sub_1C2C26E08();
  uint64_t v18 = v17;
  if (v16 == sub_1C2C26E08() && v18 == v19)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_5;
  }
  char v20 = sub_1C2C27008();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v20)
  {
LABEL_5:
    id v21 = v161;
    uint64_t v22 = v159;
    if (v160)
    {
      id v23 = v160;
      if ((objc_msgSend(v23, sel_isHidden) & 1) == 0 && objc_msgSend(v23, sel_hasContent))
      {
        uint64_t v24 = qword_1EA3307E8;
        id v25 = v23;
        id v26 = v22;
        if (v24 != -1) {
          swift_once();
        }
        sub_1C2C07750((uint64_t)&qword_1EA330D58, (uint64_t)v192);

LABEL_15:
        sub_1C2C07750((uint64_t)v192, (uint64_t)v176);
        *(void *)v177 = v21;
        sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
        sub_1C2C26508();
        *(void *)v177 = v25;
        sub_1C2C0191C(0, &qword_1EB681810);
        sub_1C2C26508();
        *(void *)v177 = v26;
        sub_1C2C26508();
        *(void *)v177 = v162;
        sub_1C2C26508();
        *((void *)&v205 + 1) = &type metadata for MiniLockupLayout;
        unint64_t v206 = sub_1C2C077AC();
        uint64_t v28 = swift_allocObject();
        uint64_t v29 = (void *)(v28 + 16);
        *(void *)&long long v204 = v28;
        sub_1C2C07750((uint64_t)v176, (uint64_t)v177);
        sub_1C2BF7C98((uint64_t)&v201, (uint64_t)&v177[176]);
        sub_1C2BF7C98((uint64_t)&v198, (uint64_t)&v177[216]);
        sub_1C2C07870((uint64_t)&v195, (uint64_t)&v164);
        if (v165)
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v198);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v201);
          sub_1C2C078D8((uint64_t)v176);
          sub_1C2BF8100(&v164, (uint64_t)&v166);
        }
        else
        {
          sub_1C2C26788();
          sub_1C2C268F8();
          uint64_t v167 = sub_1C2C26908();
          uint64_t v168 = MEMORY[0x1E4F71B08];
          __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v166);
          sub_1C2C26918();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v198);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v201);
          sub_1C2C078D8((uint64_t)v176);
          sub_1C2C0792C((uint64_t)&v164);
        }
        sub_1C2BF8100(&v166, (uint64_t)&v177[256]);
        BOOL v30 = *((void *)&v196 + 1) == 0;
        sub_1C2C0792C((uint64_t)&v195);
        v177[336] = v30;
        sub_1C2BF8100(&v173, (uint64_t)&v177[296]);
        memcpy(v29, v177, 0x151uLL);
        sub_1C2BF8100(&v204, (uint64_t)v176);
        *(void *)&v177[24] = &type metadata for PlaceableLayoutProxy;
        *(void *)&v177[32] = sub_1C2C0798C();
        *(void *)&v177[40] = sub_1C2C079E0();
        *(void *)v177 = swift_allocObject();
        sub_1C2C07A6C((uint64_t)v176, *(void *)v177 + 16);
        uint64_t v31 = (objc_class *)type metadata accessor for ASCLayoutProxy();
        id v32 = objc_allocWithZone(v31);
        sub_1C2BFF010((uint64_t)v177, (uint64_t)v32 + OBJC_IVAR_____ASCLayoutProxy_base);
        v163.receiver = v32;
        v163.super_class = v31;
        id v33 = objc_msgSendSuper2(&v163, sel_init);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v177);
        sub_1C2C07AC8((uint64_t)v176);

        sub_1C2C078D8((uint64_t)v192);
        return (uint64_t)v33;
      }
    }
    uint64_t v27 = qword_1EA3307E0;
    id v26 = v158;
    if (v27 != -1) {
      swift_once();
    }
    sub_1C2C07750((uint64_t)&qword_1EA330CA8, (uint64_t)v192);
    id v25 = v22;
    goto LABEL_15;
  }
  uint64_t v34 = (void *)sub_1C2C26DD8();
  uint64_t v35 = sub_1C2C26E08();
  uint64_t v37 = v36;
  if (v35 == sub_1C2C26E08() && v37 == v38)
  {

    swift_bridgeObjectRelease_n();
LABEL_23:
    if (qword_1EB681110 != -1) {
      swift_once();
    }
    sub_1C2C07554((uint64_t)&unk_1EB6811B0, (uint64_t)v177);
    uint64_t v40 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
    *(void *)&v177[112] = MEMORY[0x1E4F71DA0];
    *(void *)&v177[104] = v40;
    uint64_t v41 = v162;
    *(void *)&v177[80] = v162;
    v192[3] = &type metadata for OfferButtonLockupLayout;
    v192[4] = sub_1C2C075B0();
    v192[5] = sub_1C2C07604();
    v192[0] = swift_allocObject();
    sub_1C2C076A0((uint64_t)v177, v192[0] + 16);
    id v42 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    id v43 = objc_allocWithZone(v42);
    sub_1C2BFF010((uint64_t)v192, (uint64_t)v43 + OBJC_IVAR_____ASCLayoutProxy_base);
    v169.receiver = v43;
    v169.super_class = v42;
    id v44 = v41;
    id v45 = objc_msgSendSuper2(&v169, sel_init);
LABEL_26:
    id v33 = v45;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v192);
    sub_1C2C076FC((uint64_t)v177);
    return (uint64_t)v33;
  }
  char v39 = sub_1C2C27008();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v39) {
    goto LABEL_23;
  }
  long long v47 = (void *)sub_1C2C26DD8();
  uint64_t v48 = sub_1C2C26E08();
  uint64_t v50 = v49;
  if (v48 == sub_1C2C26E08() && v50 == v51)
  {

    swift_bridgeObjectRelease_n();
LABEL_32:
    if (qword_1EA3307F8 != -1) {
      swift_once();
    }
    sub_1C2C07554((uint64_t)&unk_1EA330E10, (uint64_t)v177);
    uint64_t v53 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
    *(void *)&v177[112] = MEMORY[0x1E4F71DA0];
    *(void *)&v177[104] = v53;
    uint64_t v54 = v162;
    *(void *)&v177[80] = v162;
    v192[3] = &type metadata for OfferButtonLockupLayout;
    v192[4] = sub_1C2C075B0();
    v192[5] = sub_1C2C07604();
    v192[0] = swift_allocObject();
    sub_1C2C076A0((uint64_t)v177, v192[0] + 16);
    long long v55 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    id v56 = objc_allocWithZone(v55);
    sub_1C2BFF010((uint64_t)v192, (uint64_t)v56 + OBJC_IVAR_____ASCLayoutProxy_base);
    v170.receiver = v56;
    v170.super_class = v55;
    id v57 = v54;
    id v45 = objc_msgSendSuper2(&v170, sel_init);
    goto LABEL_26;
  }
  char v52 = sub_1C2C27008();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v52) {
    goto LABEL_32;
  }
  uint64_t v58 = sub_1C2C26E08();
  uint64_t v60 = v59;
  if (v58 == sub_1C2C26E08() && v60 == v61)
  {
    swift_bridgeObjectRelease_n();
LABEL_39:
    if (qword_1EB6812C8 != -1) {
      swift_once();
    }
    uint64_t v63 = __swift_project_value_buffer(v9, (uint64_t)qword_1EB6812B0);
    sub_1C2C07490(v63, (uint64_t)v11, type metadata accessor for SmallLockupLayout.Metrics);
    uint64_t v64 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
    uint64_t v65 = MEMORY[0x1E4F71DA0];
    *(void *)&v177[32] = MEMORY[0x1E4F71DA0];
    *(void *)&v177[24] = v64;
    id v66 = v160;
    *(void *)v177 = v161;
    id v68 = v158;
    long long v67 = v159;
    uint64_t v69 = v157;
    if (v160)
    {
      uint64_t v70 = sub_1C2C0191C(0, &qword_1EB681810);
      v192[4] = MEMORY[0x1E4F71DB0];
      v192[3] = v70;
      v192[0] = v66;
    }
    else
    {
      memset(v192, 0, 40);
    }
    uint64_t v71 = sub_1C2C0191C(0, &qword_1EB681810);
    *(void *)&v176[24] = v71;
    *(void *)&v176[32] = MEMORY[0x1E4F71DB0];
    *(void *)uint64_t v176 = v67;
    *((void *)&v205 + 1) = v71;
    unint64_t v206 = MEMORY[0x1E4F71DB0];
    *(void *)&long long v204 = v68;
    if (v69)
    {
      *((void *)&v202 + 1) = v71;
      uint64_t v203 = MEMORY[0x1E4F71DB0];
      *(void *)&long long v201 = v69;
    }
    else
    {
      uint64_t v203 = 0;
      long long v201 = 0u;
      long long v202 = 0u;
    }
    uint64_t v72 = (uint64_t)v156;
    long long v73 = &v156[v12[10]];
    *((void *)v73 + 4) = 0;
    *(_OWORD *)long long v73 = 0u;
    *((_OWORD *)v73 + 1) = 0u;
    uint64_t v74 = (void *)(v72 + v12[11]);
    v74[3] = v64;
    v74[4] = v65;
    uint64_t v75 = v162;
    *uint64_t v74 = v162;
    sub_1C2C073E8((uint64_t)v11, v72);
    sub_1C2BF8100((long long *)v177, v72 + v12[5]);
    sub_1C2C01958((uint64_t)v192, v72 + v12[6], &qword_1EB6817F0);
    sub_1C2BF8100((long long *)v176, v72 + v12[7]);
    sub_1C2BF8100(&v204, v72 + v12[8]);
    sub_1C2C01958((uint64_t)&v201, v72 + v12[9], &qword_1EB6817F0);
    *(void *)&v177[24] = v12;
    *(void *)&v177[32] = sub_1C2C0744C(&qword_1EB6812E8);
    *(void *)&v177[40] = sub_1C2C0744C(qword_1EB6812F0);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v177);
    sub_1C2C07490(v72, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SmallLockupLayout);
    uint64_t v77 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    id v78 = objc_allocWithZone(v77);
    sub_1C2BFF010((uint64_t)v177, (uint64_t)v78 + OBJC_IVAR_____ASCLayoutProxy_base);
    v171.receiver = v78;
    v171.super_class = v77;
    id v79 = v160;
    id v80 = v67;
    id v81 = v68;
    id v82 = v75;
    id v83 = v161;
    id v84 = v69;
    id v33 = objc_msgSendSuper2(&v171, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v177);
    sub_1C2C074F8(v72);
    return (uint64_t)v33;
  }
  char v62 = sub_1C2C27008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v62) {
    goto LABEL_39;
  }
  uint64_t v85 = sub_1C2C26E08();
  uint64_t v87 = v86;
  if (v85 == sub_1C2C26E08() && v87 == v88)
  {
    swift_bridgeObjectRelease_n();
LABEL_52:
    if (objc_msgSend(v155, sel_horizontalSizeClass) == (id)1)
    {
      id v91 = v160;
      id v90 = v161;
      id v93 = v158;
      uint64_t v92 = v159;
      long long v94 = v157;
      if (qword_1EA330800 != -1) {
        swift_once();
      }
      uint64_t v95 = &qword_1EA330E60;
    }
    else
    {
      id v91 = v160;
      id v90 = v161;
      id v93 = v158;
      uint64_t v92 = v159;
      long long v94 = v157;
      if (qword_1EA330808 != -1) {
        swift_once();
      }
      uint64_t v95 = &qword_1EA330FB8;
    }
    sub_1C2C07130((uint64_t)v95, (uint64_t)v192);
    sub_1C2C07130((uint64_t)v192, (uint64_t)v176);
    uint64_t v96 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
    uint64_t v97 = MEMORY[0x1E4F71DA0];
    *((void *)&v205 + 1) = v96;
    unint64_t v206 = MEMORY[0x1E4F71DA0];
    *(void *)&long long v204 = v90;
    if (v91)
    {
      *((void *)&v202 + 1) = sub_1C2C0191C(0, &qword_1EB681810);
      uint64_t v203 = MEMORY[0x1E4F71DB0];
      *(void *)&long long v201 = v91;
    }
    else
    {
      uint64_t v203 = 0;
      long long v201 = 0u;
      long long v202 = 0u;
    }
    uint64_t v98 = sub_1C2C0191C(0, &qword_1EB681810);
    uint64_t v199 = v98;
    uint64_t v200 = MEMORY[0x1E4F71DB0];
    uint64_t v197 = MEMORY[0x1E4F71DB0];
    *(void *)&long long v198 = v92;
    *((void *)&v196 + 1) = v98;
    *(void *)&long long v195 = v93;
    if (v94)
    {
      *((void *)&v174 + 1) = v98;
      uint64_t v175 = MEMORY[0x1E4F71DB0];
      *(void *)&long long v173 = v94;
    }
    else
    {
      uint64_t v175 = 0;
      long long v173 = 0u;
      long long v174 = 0u;
    }
    uint64_t v190 = v96;
    uint64_t v191 = v97;
    uint64_t v99 = v162;
    unint64_t v189 = (unint64_t)v162;
    memcpy(v177, v176, sizeof(v177));
    sub_1C2BF8100(&v204, (uint64_t)&v178);
    sub_1C2C01958((uint64_t)&v201, (uint64_t)&v180, &qword_1EB6817F0);
    sub_1C2BF8100(&v198, (uint64_t)&v182);
    sub_1C2BF8100(&v195, (uint64_t)&v184);
    sub_1C2C01958((uint64_t)&v173, (uint64_t)&v186, &qword_1EB6817F0);
    *(void *)&v176[24] = &type metadata for MediumLockupLayout;
    *(void *)&v176[32] = sub_1C2C0718C();
    *(void *)&v176[40] = sub_1C2C071E0();
    *(void *)uint64_t v176 = swift_allocObject();
    sub_1C2C072E4((uint64_t)v177, *(void *)v176 + 16);
    long long v100 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    id v101 = objc_allocWithZone(v100);
    sub_1C2BFF010((uint64_t)v176, (uint64_t)v101 + OBJC_IVAR_____ASCLayoutProxy_base);
    v172.receiver = v101;
    v172.super_class = v100;
    id v102 = v91;
    id v103 = v92;
    id v104 = v93;
    id v105 = v99;
    id v106 = v90;
    id v107 = v94;
    id v33 = objc_msgSendSuper2(&v172, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v176);
    sub_1C2C07340((uint64_t)v177);
    sub_1C2C07394((uint64_t)v192);
    return (uint64_t)v33;
  }
  char v89 = sub_1C2C27008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v89) {
    goto LABEL_52;
  }
  uint64_t v108 = (void *)sub_1C2C26DD8();
  uint64_t v109 = sub_1C2C26E08();
  uint64_t v111 = v110;
  if (v109 == sub_1C2C26E08() && v111 == v112)
  {

    swift_bridgeObjectRelease_n();
LABEL_70:
    if (qword_1EA330810 != -1) {
      swift_once();
    }
    sub_1C2BFC014((uint64_t)&qword_1EA331110, (uint64_t)v192);
    uint64_t v114 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
    unint64_t v115 = MEMORY[0x1E4F71DA0];
    *(void *)&v176[24] = v114;
    *(void *)&v176[32] = MEMORY[0x1E4F71DA0];
    id v117 = v160;
    id v116 = v161;
    *(void *)uint64_t v176 = v161;
    id v119 = v158;
    v118 = v159;
    uint64_t v120 = v157;
    if (v160)
    {
      *((void *)&v205 + 1) = sub_1C2C0191C(0, &qword_1EB681810);
      unint64_t v206 = v115;
      *(void *)&long long v204 = v117;
    }
    else
    {
      unint64_t v206 = 0;
      long long v204 = 0u;
      long long v205 = 0u;
    }
    uint64_t v121 = sub_1C2C0191C(0, &qword_1EB681810);
    *((void *)&v202 + 1) = v121;
    uint64_t v203 = MEMORY[0x1E4F71DB0];
    uint64_t v200 = MEMORY[0x1E4F71DB0];
    *(void *)&long long v201 = v118;
    uint64_t v199 = v121;
    *(void *)&long long v198 = v119;
    if (v120)
    {
      *((void *)&v196 + 1) = v121;
      uint64_t v197 = MEMORY[0x1E4F71DB0];
      *(void *)&long long v195 = v120;
    }
    else
    {
      uint64_t v197 = 0;
      long long v195 = 0u;
      long long v196 = 0u;
    }
    uint64_t v188 = v114;
    unint64_t v189 = v115;
    uint64_t v122 = v162;
    uint64_t v187 = v162;
    memcpy(v177, v192, 0x138uLL);
    sub_1C2BF8100((long long *)v176, (uint64_t)&v177[312]);
    sub_1C2C01958((uint64_t)&v204, (uint64_t)v179, &qword_1EB6817E8);
    sub_1C2BF8100(&v201, (uint64_t)v181);
    sub_1C2BF8100(&v198, (uint64_t)v183);
    sub_1C2C01958((uint64_t)&v195, (uint64_t)v185, &qword_1EB6817F0);
    v192[3] = &type metadata for AppShowcaseLockupLayout;
    v192[4] = sub_1C2C06F30();
    v192[5] = sub_1C2C06F84();
    v192[0] = swift_allocObject();
    sub_1C2C07080((uint64_t)v177, v192[0] + 16);
    uint64_t v123 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    id v124 = objc_allocWithZone(v123);
    sub_1C2BFF010((uint64_t)v192, (uint64_t)v124 + OBJC_IVAR_____ASCLayoutProxy_base);
    v193.receiver = v124;
    v193.super_class = v123;
    id v125 = v117;
    id v126 = v118;
    id v127 = v119;
    id v128 = v122;
    id v129 = v116;
    id v130 = v120;
    id v131 = objc_msgSendSuper2(&v193, sel_init);
LABEL_92:
    id v33 = v131;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v192);
    sub_1C2C070DC((uint64_t)v177);
    return (uint64_t)v33;
  }
  char v113 = sub_1C2C27008();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v113) {
    goto LABEL_70;
  }
  uint64_t v132 = (void *)sub_1C2C26DD8();
  uint64_t v133 = sub_1C2C26E08();
  uint64_t v135 = v134;
  if (v133 == sub_1C2C26E08() && v135 == v136)
  {

    swift_bridgeObjectRelease_n();
LABEL_83:
    if (qword_1EA330790 != -1) {
      swift_once();
    }
    sub_1C2BFC014((uint64_t)&qword_1EA3332D0, (uint64_t)v192);
    uint64_t v138 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
    unint64_t v139 = MEMORY[0x1E4F71DA0];
    *(void *)&v176[24] = v138;
    *(void *)&v176[32] = MEMORY[0x1E4F71DA0];
    id v141 = v160;
    id v140 = v161;
    *(void *)uint64_t v176 = v161;
    id v143 = v158;
    uint64_t v142 = v159;
    uint64_t v144 = v157;
    if (v160)
    {
      *((void *)&v205 + 1) = sub_1C2C0191C(0, &qword_1EB681810);
      unint64_t v206 = v139;
      *(void *)&long long v204 = v141;
    }
    else
    {
      unint64_t v206 = 0;
      long long v204 = 0u;
      long long v205 = 0u;
    }
    uint64_t v145 = sub_1C2C0191C(0, &qword_1EB681810);
    *((void *)&v202 + 1) = v145;
    uint64_t v203 = MEMORY[0x1E4F71DB0];
    uint64_t v200 = MEMORY[0x1E4F71DB0];
    *(void *)&long long v201 = v142;
    uint64_t v199 = v145;
    *(void *)&long long v198 = v143;
    if (v144)
    {
      *((void *)&v196 + 1) = v145;
      uint64_t v197 = MEMORY[0x1E4F71DB0];
      *(void *)&long long v195 = v144;
    }
    else
    {
      uint64_t v197 = 0;
      long long v195 = 0u;
      long long v196 = 0u;
    }
    uint64_t v188 = v138;
    unint64_t v189 = v139;
    uint64_t v146 = v162;
    uint64_t v187 = v162;
    memcpy(v177, v192, 0x138uLL);
    sub_1C2BF8100((long long *)v176, (uint64_t)&v177[312]);
    sub_1C2C01958((uint64_t)&v204, (uint64_t)v179, &qword_1EB6817E8);
    sub_1C2BF8100(&v201, (uint64_t)v181);
    sub_1C2BF8100(&v198, (uint64_t)v183);
    sub_1C2C01958((uint64_t)&v195, (uint64_t)v185, &qword_1EB6817F0);
    v192[3] = &type metadata for AppShowcaseLockupLayout;
    v192[4] = sub_1C2C06F30();
    v192[5] = sub_1C2C06F84();
    v192[0] = swift_allocObject();
    sub_1C2C07080((uint64_t)v177, v192[0] + 16);
    uint64_t v147 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    id v148 = objc_allocWithZone(v147);
    sub_1C2BFF010((uint64_t)v192, (uint64_t)v148 + OBJC_IVAR_____ASCLayoutProxy_base);
    v194.receiver = v148;
    v194.super_class = v147;
    id v149 = v141;
    id v150 = v142;
    id v151 = v143;
    id v152 = v146;
    id v153 = v140;
    id v154 = v144;
    id v131 = objc_msgSendSuper2(&v194, sel_init);
    goto LABEL_92;
  }
  char v137 = sub_1C2C27008();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v137) {
    goto LABEL_83;
  }
  *(void *)v177 = 0;
  *(void *)&v177[8] = 0xE000000000000000;
  sub_1C2C26F68();
  sub_1C2C26E28();
  v192[0] = a1;
  type metadata accessor for Size(0);
  sub_1C2C26FA8();
  uint64_t result = sub_1C2C26FB8();
  __break(1u);
  return result;
}

unint64_t sub_1C2C06F30()
{
  unint64_t result = qword_1EA331248;
  if (!qword_1EA331248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331248);
  }
  return result;
}

unint64_t sub_1C2C06F84()
{
  unint64_t result = qword_1EA331250;
  if (!qword_1EA331250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331250);
  }
  return result;
}

uint64_t sub_1C2C06FD8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 168);
  __swift_destroy_boxed_opaque_existential_1(v0 + 208);
  __swift_destroy_boxed_opaque_existential_1(v0 + 248);
  __swift_destroy_boxed_opaque_existential_1(v0 + 288);
  __swift_destroy_boxed_opaque_existential_1(v0 + 328);
  if (*(void *)(v0 + 392)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 368);
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 408);
  __swift_destroy_boxed_opaque_existential_1(v0 + 448);
  if (*(void *)(v0 + 512)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 488);
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 528);

  return MEMORY[0x1F4186498](v0, 568, 7);
}

uint64_t sub_1C2C07080(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2C070DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C2C07130(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1C2C0718C()
{
  unint64_t result = qword_1EA331258;
  if (!qword_1EA331258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331258);
  }
  return result;
}

unint64_t sub_1C2C071E0()
{
  unint64_t result = qword_1EA331260;
  if (!qword_1EA331260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331260);
  }
  return result;
}

uint64_t sub_1C2C07234()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  __swift_destroy_boxed_opaque_existential_1(v0 + 200);
  __swift_destroy_boxed_opaque_existential_1(v0 + 240);
  __swift_destroy_boxed_opaque_existential_1(v0 + 280);
  __swift_destroy_boxed_opaque_existential_1(v0 + 320);
  __swift_destroy_boxed_opaque_existential_1(v0 + 360);
  if (*(void *)(v0 + 424)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 400);
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 440);
  __swift_destroy_boxed_opaque_existential_1(v0 + 480);
  if (*(void *)(v0 + 544)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 520);
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 560);

  return MEMORY[0x1F4186498](v0, 600, 7);
}

uint64_t sub_1C2C072E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2C07340(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C2C07394(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C2C073E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SmallLockupLayout.Metrics(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2C0744C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SmallLockupLayout(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C2C07490(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C2C074F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SmallLockupLayout(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C2C07554(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1C2C075B0()
{
  unint64_t result = qword_1EB681200;
  if (!qword_1EB681200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB681200);
  }
  return result;
}

unint64_t sub_1C2C07604()
{
  unint64_t result = qword_1EB681208[0];
  if (!qword_1EB681208[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EB681208);
  }
  return result;
}

uint64_t sub_1C2C07658()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  return MEMORY[0x1F4186498](v0, 136, 7);
}

uint64_t sub_1C2C076A0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2C076FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C2C07750(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1C2C077AC()
{
  unint64_t result = qword_1EA331268;
  if (!qword_1EA331268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331268);
  }
  return result;
}

uint64_t sub_1C2C07800()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1(v0 + 192);
  __swift_destroy_boxed_opaque_existential_1(v0 + 232);
  __swift_destroy_boxed_opaque_existential_1(v0 + 272);
  __swift_destroy_boxed_opaque_existential_1(v0 + 312);

  return MEMORY[0x1F4186498](v0, 353, 7);
}

uint64_t sub_1C2C07870(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA331270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2C078D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C2C0792C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA331270);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C2C0798C()
{
  unint64_t result = qword_1EA331278;
  if (!qword_1EA331278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331278);
  }
  return result;
}

unint64_t sub_1C2C079E0()
{
  unint64_t result = qword_1EA331280;
  if (!qword_1EA331280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331280);
  }
  return result;
}

uint64_t sub_1C2C07A34()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C2C07A6C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2C07AC8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C2C07B1C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C2C07B70(uint64_t a1)
{
  return a1;
}

unint64_t sub_1C2C07BC4()
{
  unint64_t result = qword_1EA331288;
  if (!qword_1EA331288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331288);
  }
  return result;
}

uint64_t sub_1C2C07C18()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_1C2C07C58(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2C07CB4(uint64_t a1)
{
  return a1;
}

double sub_1C2C07D08()
{
  xmmword_1EA331290 = (__int128)vdupq_n_s64(0x404B800000000000uLL);
  xmmword_1EA3312A0 = (__int128)vdupq_n_s64(0x4054C00000000000uLL);
  xmmword_1EA3312B0 = xmmword_1C2C2FB20;
  xmmword_1EA3312C0 = xmmword_1C2C2FB30;
  double result = 6.0;
  xmmword_1EA3312D0 = xmmword_1C2C2FB40;
  return result;
}

double static ASCLayoutProxy.miniProductPagePreferredArtworkSize.getter()
{
  if (qword_1EA330818 != -1) {
    swift_once();
  }
  return *(double *)&xmmword_1EA3312A0;
}

id static ASCLayoutProxy.miniProductPageLayout(traitCollection:iconArtwork:title:subtitle:metadata:description:screenshots:)()
{
  return sub_1C2C07EE0();
}

id sub_1C2C07EE0()
{
  if (qword_1EA330818 != -1) {
    swift_once();
  }
  long long v7 = xmmword_1EA3312A0;
  long long v8 = xmmword_1EA331290;
  long long v5 = xmmword_1EA3312C0;
  long long v6 = xmmword_1EA3312B0;
  long long v0 = xmmword_1EA3312D0;
  sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  sub_1C2C26508();
  sub_1C2C26508();
  sub_1C2C0191C(0, &qword_1EB681810);
  sub_1C2C26508();
  sub_1C2C26508();
  sub_1C2C26508();
  sub_1C2C26508();
  v12[0] = v8;
  v12[1] = v7;
  v12[2] = v6;
  v12[3] = v5;
  v12[4] = v0;
  v11[3] = &type metadata for MiniProductPageLayout;
  v11[4] = sub_1C2C08160();
  v11[0] = swift_allocObject();
  sub_1C2C08214((uint64_t)v12, v11[0] + 16);
  void v10[3] = &type metadata for PlaceableLayoutProxy;
  v10[4] = sub_1C2C0798C();
  v10[5] = sub_1C2C079E0();
  v10[0] = swift_allocObject();
  sub_1C2C07A6C((uint64_t)v11, v10[0] + 16);
  uint64_t v1 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  id v2 = objc_allocWithZone(v1);
  sub_1C2BFF010((uint64_t)v10, (uint64_t)v2 + OBJC_IVAR_____ASCLayoutProxy_base);
  v9.receiver = v2;
  v9.super_class = v1;
  id v3 = objc_msgSendSuper2(&v9, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  sub_1C2C07AC8((uint64_t)v11);
  sub_1C2C082A8((uint64_t)v12);
  return v3;
}

unint64_t sub_1C2C08160()
{
  unint64_t result = qword_1EA3312E0;
  if (!qword_1EA3312E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3312E0);
  }
  return result;
}

uint64_t sub_1C2C081B4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  __swift_destroy_boxed_opaque_existential_1(v0 + 216);
  __swift_destroy_boxed_opaque_existential_1(v0 + 256);
  __swift_destroy_boxed_opaque_existential_1(v0 + 296);

  return MEMORY[0x1F4186498](v0, 336, 7);
}

uint64_t sub_1C2C08214(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2C08270()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C2C082A8(uint64_t a1)
{
  return a1;
}

double static ASCLayoutProxy.offerButtonHeightForSize(_:)()
{
  sub_1C2C0987C((uint64_t)v2);
  double v0 = *(double *)&v2[9];
  sub_1C2C07B1C((uint64_t)v2);
  return v0;
}

double static ASCLayoutProxy.axOfferButtonHeightForSize(_:)()
{
  uint64_t v0 = sub_1C2C26FF8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2C26BF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681948);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C2C2FB10;
  sub_1C2C0191C(0, &qword_1EB681800);
  *(void *)(v4 + 32) = sub_1C2C26ED8();
  *(void *)&v16[0] = v4;
  sub_1C2C26E68();
  long long v5 = (void *)sub_1C2C26C08();
  sub_1C2C0987C((uint64_t)v16);
  double v6 = v16[9];
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  id v7 = v5;
  sub_1C2C263E8();
  sub_1C2C265D8();
  double v9 = v8;

  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v3, v0);
  double v11 = v6 + v9;
  __swift_project_boxed_opaque_existential_1(v18, v18[3]);
  id v12 = v7;
  sub_1C2C263E8();
  sub_1C2C265D8();
  double v14 = v13;

  v10(v3, v0);
  sub_1C2C07B1C((uint64_t)v16);
  return v11 + v14;
}

double static ASCLayoutProxy.offerProgressDiameterForSize(_:)()
{
  sub_1C2C09AB8((uint64_t)v2);
  double v0 = v3;
  sub_1C2C08638((uint64_t)v2);
  return v0;
}

uint64_t sub_1C2C08638(uint64_t a1)
{
  return a1;
}

double static ASCLayoutProxy.offerButtonRegularWidthForSize(_:)()
{
  sub_1C2C09CF4((uint64_t)v2);
  double v0 = *(double *)v2;
  sub_1C2C08638((uint64_t)v2);
  return v0;
}

id static ASCLayoutProxy.offerIconLayoutForSize(_:imageView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldTrailingAlign:)(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, char a7, char a8, char a9)
{
  if (a7) {
    sub_1C2C09AB8((uint64_t)v31);
  }
  else {
    sub_1C2C09CF4((uint64_t)v31);
  }
  sub_1C2C0953C((uint64_t)v31, (uint64_t)v30);
  uint64_t v16 = MEMORY[0x1E4F71DA0];
  if (!a5)
  {
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    if (a6) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v26 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    goto LABEL_9;
  }
  *((void *)&v28 + 1) = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  uint64_t v29 = v16;
  *(void *)&long long v27 = a5;
  if (!a6) {
    goto LABEL_8;
  }
LABEL_6:
  *((void *)&v25 + 1) = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  uint64_t v26 = v16;
  *(void *)&long long v24 = a6;
LABEL_9:
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = sub_1C2C09070((uint64_t)v30, (uint64_t)a4, (uint64_t)&v27, (uint64_t)&v24, a8 & 1, a9 & 1, a1);
  v30[3] = &type metadata for OfferIconLayout;
  v30[4] = sub_1C2C09598();
  v30[5] = sub_1C2C095EC();
  v30[0] = v19;
  id v20 = objc_allocWithZone(v9);
  sub_1C2BFF010((uint64_t)v30, (uint64_t)v20 + OBJC_IVAR_____ASCLayoutProxy_base);
  v23.receiver = v20;
  v23.super_class = v9;
  swift_retain();
  id v21 = objc_msgSendSuper2(&v23, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  swift_release();
  sub_1C2C08638((uint64_t)v31);
  return v21;
}

id static ASCLayoutProxy.offerTextLayoutForSize(_:titleBackgroundView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldExpandBackground:)(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, char a7, char a8, char a9)
{
  sub_1C2C0987C((uint64_t)v28);
  if (a6)
  {
    *((void *)&v26 + 1) = sub_1C2C0191C(0, &qword_1EB681810);
    uint64_t v27 = MEMORY[0x1E4F71DB0];
    *(void *)&long long v25 = a6;
  }
  else
  {
    uint64_t v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
  }
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  uint64_t v20 = sub_1C2C091C4((uint64_t)v28, (uint64_t)v17, (uint64_t)v18, (uint64_t)&v25, a7 & 1, a8 & 1, a9 & 1, a1);
  v28[3] = &type metadata for OfferTextLayout;
  v28[4] = sub_1C2C09640();
  uint64_t v28[5] = sub_1C2C09694();
  v28[0] = v20;
  id v21 = objc_allocWithZone(v9);
  sub_1C2BFF010((uint64_t)v28, (uint64_t)v21 + OBJC_IVAR_____ASCLayoutProxy_base);
  v24.receiver = v21;
  v24.super_class = v9;
  swift_retain();
  id v22 = objc_msgSendSuper2(&v24, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  swift_release();
  return v22;
}

id static ASCLayoutProxy.offerDisclosureLayout(disclosureIndicator:)()
{
  uint64_t v1 = v0;
  v7[3] = &type metadata for OfferDisclosureLayout;
  v7[4] = sub_1C2C096E8();
  v7[0] = swift_allocObject();
  sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  sub_1C2C26508();
  v6[3] = &type metadata for PlaceableLayoutProxy;
  v6[4] = sub_1C2C0798C();
  v6[5] = sub_1C2C079E0();
  v6[0] = swift_allocObject();
  sub_1C2C07A6C((uint64_t)v7, v6[0] + 16);
  id v2 = objc_allocWithZone(v0);
  sub_1C2BFF010((uint64_t)v6, (uint64_t)v2 + OBJC_IVAR_____ASCLayoutProxy_base);
  v5.receiver = v2;
  v5.super_class = v1;
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  sub_1C2C07AC8((uint64_t)v7);
  return v3;
}

uint64_t sub_1C2C09070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, double a7)
{
  uint64_t v25 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  uint64_t v26 = MEMORY[0x1E4F71DA0];
  *(void *)&long long v24 = a2;
  sub_1C2C0953C(a1, (uint64_t)&v17);
  *((void *)&v21 + 1) = MEMORY[0x1E4FBC958];
  *(void *)&long long v22 = MEMORY[0x1E4F71988];
  *(double *)&long long v20 = a7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  sub_1C2BF8100(&v20, (uint64_t)v18);
  long long v20 = v17;
  long long v21 = v18[0];
  long long v22 = v18[1];
  uint64_t v23 = v19;
  sub_1C2C08638(a1);
  type metadata accessor for OfferIconLayout.Storage();
  uint64_t v14 = swift_allocObject();
  long long v15 = v21;
  *(_OWORD *)(v14 + 16) = v20;
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = v22;
  *(void *)(v14 + 64) = v23;
  sub_1C2BF8100(&v24, v14 + 72);
  sub_1C2C01958(a3, v14 + 112, &qword_1EB6817E8);
  sub_1C2C01958(a4, v14 + 152, &qword_1EB6817E8);
  *(unsigned char *)(v14 + 192) = a5;
  *(unsigned char *)(v14 + 193) = a6;
  return v14;
}

uint64_t sub_1C2C091C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, double a8)
{
  char v15 = a7 & 1;
  uint64_t v46 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  uint64_t v47 = MEMORY[0x1E4F71DA0];
  *(void *)&long long v45 = a2;
  uint64_t v43 = sub_1C2C0191C(0, &qword_1EB681810);
  uint64_t v44 = MEMORY[0x1E4F71DB0];
  *(void *)&long long v42 = a3;
  sub_1C2C09774(a1, (uint64_t)v25);
  *((void *)&v28 + 1) = MEMORY[0x1E4FBC958];
  *(void *)&long long v29 = MEMORY[0x1E4F71988];
  *(double *)&long long v27 = a8;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26 + 8);
  sub_1C2BF8100(&v27, (uint64_t)v26 + 8);
  long long v39 = v26[0];
  long long v40 = v26[1];
  long long v41 = v26[2];
  long long v35 = v25[8];
  long long v36 = v25[9];
  long long v37 = v25[10];
  long long v38 = v25[11];
  long long v31 = v25[4];
  long long v32 = v25[5];
  long long v33 = v25[6];
  long long v34 = v25[7];
  long long v27 = v25[0];
  long long v28 = v25[1];
  long long v29 = v25[2];
  long long v30 = v25[3];
  sub_1C2C07B1C(a1);
  type metadata accessor for OfferTextLayout.Storage();
  uint64_t v16 = swift_allocObject();
  long long v17 = v40;
  *(_OWORD *)(v16 + 208) = v39;
  *(_OWORD *)(v16 + 224) = v17;
  *(_OWORD *)(v16 + 240) = v41;
  long long v18 = v36;
  *(_OWORD *)(v16 + 144) = v35;
  *(_OWORD *)(v16 + 160) = v18;
  long long v19 = v38;
  *(_OWORD *)(v16 + 176) = v37;
  *(_OWORD *)(v16 + 192) = v19;
  long long v20 = v32;
  *(_OWORD *)(v16 + 80) = v31;
  *(_OWORD *)(v16 + 96) = v20;
  long long v21 = v34;
  *(_OWORD *)(v16 + 112) = v33;
  *(_OWORD *)(v16 + 128) = v21;
  long long v22 = v28;
  *(_OWORD *)(v16 + 16) = v27;
  *(_OWORD *)(v16 + 32) = v22;
  long long v23 = v30;
  *(_OWORD *)(v16 + 48) = v29;
  *(_OWORD *)(v16 + 64) = v23;
  sub_1C2BF8100(&v45, v16 + 256);
  sub_1C2BF8100(&v42, v16 + 296);
  sub_1C2C01958(a4, v16 + 336, &qword_1EB6817F0);
  *(unsigned char *)(v16 + 376) = a5;
  *(unsigned char *)(v16 + 377) = a6;
  *(unsigned char *)(v16 + 378) = v15;
  return v16;
}

id _s18AppStoreComponents14ASCLayoutProxyC16offerEmptyLayout9imageView05titleJ008subtitleJ0ACSo6UIViewC_AISgAJtFZ_0(void *a1, void *a2, void *a3)
{
  unint64_t v6 = MEMORY[0x1E4F71DA0];
  if (!a2)
  {
    unint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v25 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    goto LABEL_6;
  }
  *((void *)&v17 + 1) = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  unint64_t v18 = v6;
  *(void *)&long long v16 = a2;
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  *((void *)&v24 + 1) = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  unint64_t v25 = v6;
  *(void *)&long long v23 = a3;
LABEL_6:
  uint64_t v21 = sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  unint64_t v22 = v6;
  *(void *)&long long v20 = a1;
  type metadata accessor for OfferEmptyLayout.Storage();
  uint64_t v7 = swift_allocObject();
  sub_1C2BF8100(&v20, v7 + 16);
  sub_1C2C01958((uint64_t)&v16, v7 + 56, &qword_1EB6817E8);
  sub_1C2C01958((uint64_t)&v23, v7 + 96, &qword_1EB6817E8);
  *((void *)&v17 + 1) = &type metadata for OfferEmptyLayout;
  unint64_t v18 = sub_1C2C097D0();
  unint64_t v19 = sub_1C2C09824();
  *(void *)&long long v16 = v7;
  double v8 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  id v9 = objc_allocWithZone(v8);
  sub_1C2BFF010((uint64_t)&v16, (uint64_t)v9 + OBJC_IVAR_____ASCLayoutProxy_base);
  v15.receiver = v9;
  v15.super_class = v8;
  id v10 = a1;
  id v11 = a2;
  id v12 = a3;
  swift_retain();
  id v13 = objc_msgSendSuper2(&v15, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  swift_release();
  return v13;
}

uint64_t sub_1C2C0953C(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1C2C09598()
{
  unint64_t result = qword_1EB681118;
  if (!qword_1EB681118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB681118);
  }
  return result;
}

unint64_t sub_1C2C095EC()
{
  unint64_t result = qword_1EB681120;
  if (!qword_1EB681120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB681120);
  }
  return result;
}

unint64_t sub_1C2C09640()
{
  unint64_t result = qword_1EB6817A8;
  if (!qword_1EB6817A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6817A8);
  }
  return result;
}

unint64_t sub_1C2C09694()
{
  unint64_t result = qword_1EB6817B0;
  if (!qword_1EB6817B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6817B0);
  }
  return result;
}

unint64_t sub_1C2C096E8()
{
  unint64_t result = qword_1EA3312E8;
  if (!qword_1EA3312E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3312E8);
  }
  return result;
}

uint64_t sub_1C2C0973C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C2C09774(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1C2C097D0()
{
  unint64_t result = qword_1EB681128;
  if (!qword_1EB681128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB681128);
  }
  return result;
}

unint64_t sub_1C2C09824()
{
  unint64_t result = qword_1EB681130;
  if (!qword_1EB681130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB681130);
  }
  return result;
}

uint64_t sub_1C2C0987C@<X0>(uint64_t a1@<X8>)
{
  id v2 = (void *)sub_1C2C26DD8();
  uint64_t v3 = sub_1C2C26E08();
  uint64_t v5 = v4;
  if (v3 == sub_1C2C26E08() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_10;
  }
  char v8 = sub_1C2C27008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_10:

    if (qword_1EA330828 != -1) {
      swift_once();
    }
    id v13 = &xmmword_1EA331328;
    goto LABEL_17;
  }
  uint64_t v9 = sub_1C2C26E08();
  uint64_t v11 = v10;
  if (v9 == sub_1C2C26E08() && v11 == v12)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v14 = sub_1C2C27008();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      sub_1C2C26F68();
      swift_bridgeObjectRelease();
      sub_1C2C26E28();
      uint64_t result = sub_1C2C26FB8();
      __break(1u);
      return result;
    }
  }
  if (qword_1EB681910 != -1) {
    swift_once();
  }
  id v13 = &xmmword_1EB681820;
LABEL_17:

  return sub_1C2C09774((uint64_t)v13, a1);
}

uint64_t sub_1C2C09AB8@<X0>(uint64_t a1@<X8>)
{
  id v2 = (void *)sub_1C2C26DD8();
  uint64_t v3 = sub_1C2C26E08();
  uint64_t v5 = v4;
  if (v3 == sub_1C2C26E08() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_10;
  }
  char v8 = sub_1C2C27008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_10:

    if (qword_1EA330838 != -1) {
      swift_once();
    }
    id v13 = &xmmword_1EA331450;
    goto LABEL_17;
  }
  uint64_t v9 = sub_1C2C26E08();
  uint64_t v11 = v10;
  if (v9 == sub_1C2C26E08() && v11 == v12)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v14 = sub_1C2C27008();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      sub_1C2C26F68();
      swift_bridgeObjectRelease();
      sub_1C2C26E28();
      uint64_t result = sub_1C2C26FB8();
      __break(1u);
      return result;
    }
  }
  if (qword_1EA330820 != -1) {
    swift_once();
  }
  id v13 = &xmmword_1EA3312F0;
LABEL_17:

  return sub_1C2C0953C((uint64_t)v13, a1);
}

uint64_t sub_1C2C09CF4@<X0>(uint64_t a1@<X8>)
{
  id v2 = (void *)sub_1C2C26DD8();
  uint64_t v3 = sub_1C2C26E08();
  uint64_t v5 = v4;
  if (v3 == sub_1C2C26E08() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_10;
  }
  char v8 = sub_1C2C27008();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_10:

    if (qword_1EA330830 != -1) {
      swift_once();
    }
    id v13 = &xmmword_1EA331418;
    goto LABEL_17;
  }
  uint64_t v9 = sub_1C2C26E08();
  uint64_t v11 = v10;
  if (v9 == sub_1C2C26E08() && v11 == v12)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v14 = sub_1C2C27008();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      sub_1C2C26F68();
      swift_bridgeObjectRelease();
      sub_1C2C26E28();
      uint64_t result = sub_1C2C26FB8();
      __break(1u);
      return result;
    }
  }
  if (qword_1EB6811A8 != -1) {
    swift_once();
  }
  id v13 = &xmmword_1EB681170;
LABEL_17:

  return sub_1C2C0953C((uint64_t)v13, a1);
}

double sub_1C2C09F30()
{
  qword_1EB681888 = MEMORY[0x1E4FBB3D0];
  unk_1EB681890 = MEMORY[0x1E4F71D78];
  qword_1EB681870 = 0x4028000000000000;
  qword_1EB6818B0 = MEMORY[0x1E4FBB3D0];
  unk_1EB6818B8 = MEMORY[0x1E4F71D78];
  qword_1EB681898 = 0x4008000000000000;
  qword_1EB6818D8 = MEMORY[0x1E4FBB3D0];
  unk_1EB6818E0 = MEMORY[0x1E4F71D78];
  qword_1EB6818C0 = 0x4050000000000000;
  qword_1EB681900 = MEMORY[0x1E4FBB3D0];
  unk_1EB681908 = MEMORY[0x1E4F71D78];
  qword_1EB6818E8 = 0;
  xmmword_1EB681820 = xmmword_1C2C2FB80;
  *(_OWORD *)algn_1EB681830 = xmmword_1C2C2FB80;
  xmmword_1EB681840 = xmmword_1C2C2FB80;
  unk_1EB681850 = xmmword_1C2C2FB80;
  double result = 74.0;
  xmmword_1EB681860 = xmmword_1C2C2FB00;
  return result;
}

double sub_1C2C09F94()
{
  qword_1EB681198 = MEMORY[0x1E4FBB3D0];
  unk_1EB6811A0 = MEMORY[0x1E4F71D78];
  qword_1EB681180 = 0;
  double result = 74.0;
  xmmword_1EB681170 = xmmword_1C2C2FB90;
  return result;
}

__n128 sub_1C2C09FC4()
{
  qword_1EA331318 = MEMORY[0x1E4FBB3D0];
  unk_1EA331320 = MEMORY[0x1E4F71D78];
  qword_1EA331300 = 0;
  __asm { FMOV            V0.2D, #28.0 }
  xmmword_1EA3312F0 = (__int128)result;
  return result;
}

double sub_1C2C09FF0()
{
  qword_1EA331390 = MEMORY[0x1E4FBB3D0];
  unk_1EA331398 = MEMORY[0x1E4F71D78];
  qword_1EA331378 = 0x4028000000000000;
  qword_1EA3313B8 = MEMORY[0x1E4FBB3D0];
  unk_1EA3313C0 = MEMORY[0x1E4F71D78];
  qword_1EA3313A0 = 0x4008000000000000;
  qword_1EA3313E0 = MEMORY[0x1E4FBB3D0];
  unk_1EA3313E8 = MEMORY[0x1E4F71D78];
  qword_1EA3313C8 = 0x4050000000000000;
  qword_1EA331408 = MEMORY[0x1E4FBB3D0];
  unk_1EA331410 = MEMORY[0x1E4F71D78];
  qword_1EA3313F0 = 0;
  xmmword_1EA331328 = xmmword_1C2C2FB80;
  unk_1EA331338 = xmmword_1C2C2FB80;
  xmmword_1EA331348 = xmmword_1C2C2FB80;
  unk_1EA331358 = xmmword_1C2C2FB80;
  double result = 74.0;
  xmmword_1EA331368 = xmmword_1C2C2FBA0;
  return result;
}

double sub_1C2C0A054()
{
  qword_1EA331440 = MEMORY[0x1E4FBB3D0];
  unk_1EA331448 = MEMORY[0x1E4F71D78];
  qword_1EA331428 = 0;
  double result = 74.0;
  xmmword_1EA331418 = xmmword_1C2C2FBA0;
  return result;
}

double sub_1C2C0A084()
{
  qword_1EA331478 = MEMORY[0x1E4FBB3D0];
  unk_1EA331480 = MEMORY[0x1E4F71D78];
  qword_1EA331460 = 0;
  double result = 28.0;
  xmmword_1EA331450 = xmmword_1C2C2FBB0;
  return result;
}

double sub_1C2C0A0B4()
{
  qword_1EA3314C0 = MEMORY[0x1E4FBB3D0];
  unk_1EA3314C8 = MEMORY[0x1E4F71D78];
  qword_1EA3314A8 = 0x4042800000000000;
  double result = 0.0;
  xmmword_1EA331488 = xmmword_1C2C2FBC0;
  unk_1EA331498 = xmmword_1C2C2FBC0;
  return result;
}

id _s18AppStoreComponents14ASCLayoutProxyC17tvTextPillOverlay14backgroundView04textK0ACSo6UIViewC_AHtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  if (qword_1EA330840 != -1) {
    swift_once();
  }
  sub_1C2C0A36C((uint64_t)&xmmword_1EA331488, (uint64_t)v18);
  unint64_t v20 = sub_1C2C0A3C8();
  uint64_t v21 = MEMORY[0x1E4F71DA0];
  unint64_t v19 = a1;
  unint64_t v23 = v20;
  uint64_t v24 = MEMORY[0x1E4F71DA0];
  unint64_t v22 = a2;
  v17[3] = sub_1C2C26948();
  void v17[4] = MEMORY[0x1E4F71B10];
  __swift_allocate_boxed_opaque_existential_1(v17);
  id v5 = a1;
  id v6 = a2;
  sub_1C2C26958();
  sub_1C2C0A408();
  sub_1C2C26C98();
  sub_1C2C0A45C((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  uint64_t v7 = v26;
  uint64_t v8 = v27;
  uint64_t v9 = v28;
  uint64_t v10 = __swift_mutable_project_boxed_opaque_existential_2((uint64_t)v25, v26);
  __n128 v11 = MEMORY[0x1F4188790](v10);
  id v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v14 + 16))(v13, v11);
  id v15 = sub_1C2C0B1A4((uint64_t)v13, v4, v7, v8, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return v15;
}

uint64_t sub_1C2C0A36C(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1C2C0A3C8()
{
  unint64_t result = qword_1EB681808;
  if (!qword_1EB681808)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB681808);
  }
  return result;
}

unint64_t sub_1C2C0A408()
{
  unint64_t result = qword_1EA3314D0;
  if (!qword_1EA3314D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3314D0);
  }
  return result;
}

uint64_t sub_1C2C0A45C(uint64_t a1)
{
  return a1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_2(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t static ASCLayoutProxy.traitEnvironment(with:)(void *a1)
{
  id v2 = objc_allocWithZone((Class)sub_1C2C26BF8());
  id v3 = a1;
  return sub_1C2C26BE8();
}

uint64_t static ASCLayoutProxy.rectWithLayoutDirection(for:in:relativeTo:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v1, sel_layoutDirection);

  return sub_1C2C26F08();
}

uint64_t static ASCLayoutProxy.rectWithLayoutDirection(for:layoutDirection:relativeTo:)()
{
  return sub_1C2C26F08();
}

uint64_t ASCLayoutProxy.measuredSize(fitting:in:)()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR_____ASCLayoutProxy_base), *(void *)(v0 + OBJC_IVAR_____ASCLayoutProxy_base + 24));
  return sub_1C2C264F8();
}

double ASCLayoutProxy.alignmentInsets(in:)(uint64_t a1)
{
  sub_1C2BFF010(v1 + OBJC_IVAR_____ASCLayoutProxy_base, (uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6817F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3314E0);
  if (swift_dynamicCast())
  {
    sub_1C2BF8100(v7, (uint64_t)v10);
    uint64_t v3 = v11;
    uint64_t v4 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    double v5 = (*(double (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
    sub_1C2C0A9E8((uint64_t)v7);
    return *MEMORY[0x1E4FB2848];
  }
  return v5;
}

uint64_t sub_1C2C0A9E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3314E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ASCLayoutProxy.placeChildren(relativeTo:in:)()
{
  uint64_t v1 = sub_1C2C26478();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR_____ASCLayoutProxy_base), *(void *)(v0 + OBJC_IVAR_____ASCLayoutProxy_base + 24));
  sub_1C2C26C88();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_1C2C0AD44()
{
  uint64_t v0 = sub_1C2C26828();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C2C26848();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v8, qword_1EA333408);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EA333408);
  sub_1C2C26838();
  sub_1C2C26818();
  sub_1C2C26808();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t ASCLayoutProxy.description.getter()
{
  return 0;
}

id ASCLayoutProxy.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ASCLayoutProxy.init()()
{
}

id ASCLayoutProxy.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ASCLayoutProxy()
{
  return self;
}

uint64_t method lookup function for ASCLayoutProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ASCLayoutProxy);
}

id sub_1C2C0B1A4(uint64_t a1, objc_class *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[3] = a3;
  v13[4] = a4;
  v13[5] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  id v9 = objc_allocWithZone(a2);
  sub_1C2BFF010((uint64_t)v13, (uint64_t)v9 + OBJC_IVAR_____ASCLayoutProxy_base);
  v12.receiver = v9;
  v12.super_class = a2;
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v10;
}

uint64_t CenteredThreeLineReverseTextLayout.init(primaryText:secondaryText:primarySpace:numberOfLines:)@<X0>(long long *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_1C2BF8100(a1, a5);
  sub_1C2BF8100(a2, a5 + 40);
  uint64_t result = sub_1C2BF8100(a3, a5 + 80);
  *(void *)(a5 + 120) = a4;
  return result;
}

uint64_t CenteredThreeLineReverseTextLayout.primaryText.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2BF7C98(v1, a1);
}

uint64_t CenteredThreeLineReverseTextLayout.primaryText.setter(long long *a1)
{
  __swift_destroy_boxed_opaque_existential_1(v1);

  return sub_1C2BF8100(a1, v1);
}

uint64_t (*CenteredThreeLineReverseTextLayout.primaryText.modify())()
{
  return _ASCAdLockupView_incorrectFrameSize;
}

uint64_t CenteredThreeLineReverseTextLayout.secondaryText.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2BF7C98(v1 + 40, a1);
}

uint64_t CenteredThreeLineReverseTextLayout.secondaryText.setter(long long *a1)
{
  uint64_t v3 = v1 + 40;
  __swift_destroy_boxed_opaque_existential_1(v3);

  return sub_1C2BF8100(a1, v3);
}

uint64_t (*CenteredThreeLineReverseTextLayout.secondaryText.modify())()
{
  return _ASCAdLockupView_incorrectFrameSize;
}

uint64_t CenteredThreeLineReverseTextLayout.primarySpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2BF7C98(v1 + 80, a1);
}

uint64_t CenteredThreeLineReverseTextLayout.primarySpace.setter(long long *a1)
{
  uint64_t v3 = v1 + 80;
  __swift_destroy_boxed_opaque_existential_1(v3);

  return sub_1C2BF8100(a1, v3);
}

uint64_t (*CenteredThreeLineReverseTextLayout.primarySpace.modify())()
{
  return _ASCAdLockupView_incorrectFrameSize;
}

uint64_t CenteredThreeLineReverseTextLayout.numberOfLines.getter()
{
  return *(void *)(v0 + 120);
}

uint64_t CenteredThreeLineReverseTextLayout.numberOfLines.setter(uint64_t result)
{
  *(void *)(v1 + 120) = result;
  return result;
}

uint64_t (*CenteredThreeLineReverseTextLayout.numberOfLines.modify())()
{
  return _ASCAdLockupView_incorrectFrameSize;
}

uint64_t CenteredThreeLineReverseTextLayout.placeChildren(relativeTo:in:)(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v5 = v4;
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  char v10 = sub_1C2C26728();
  sub_1C2C0B994((uint64_t)v5, (uint64_t)v48);
  if (v10)
  {
    sub_1C2C0B9CC((uint64_t)v48);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v49, v49[3]);
    char v11 = sub_1C2C26728();
    sub_1C2C0B9CC((uint64_t)v48);
    if ((v11 & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_1(v5, v5[3]);
      sub_1C2C26758();
      __swift_project_boxed_opaque_existential_1(v5, v5[3]);
      sub_1C2C264E8();
      double v13 = v16;
      double v15 = v17;
      __swift_project_boxed_opaque_existential_1(v5, v5[3]);
      sub_1C2C26778();
      sub_1C2BF7C98((uint64_t)(v5 + 5), (uint64_t)v47);
      __swift_project_boxed_opaque_existential_1(v47, v47[3]);
      sub_1C2C26758();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      __swift_project_boxed_opaque_existential_1(v5 + 5, v5[8]);
      goto LABEL_6;
    }
  }
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1C2C26758();
  __swift_project_boxed_opaque_existential_1(v5 + 5, v5[8]);
  sub_1C2C26758();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1C2C264E8();
  double v13 = v12;
  double v15 = v14;
  __swift_project_boxed_opaque_existential_1(v5 + 5, v5[8]);
LABEL_6:
  sub_1C2C264E8();
  double v19 = v18;
  double v42 = v15;
  double v43 = v20;
  double v22 = v21;
  CGFloat v36 = v13;
  __swift_project_boxed_opaque_existential_1(v5 + 10, v5[13]);
  sub_1C2C265F8();
  double v40 = v23;
  CGFloat rect = v19;
  double v37 = v22;
  double v24 = v13 + v19 - v22 + v23;
  v50.origin.CGFloat x = a1;
  v50.origin.CGFloat y = a2;
  v50.size.CGFloat width = a3;
  v50.size.CGFloat height = a4;
  CGFloat v25 = (CGRectGetHeight(v50) - v24) * 0.5;
  v51.origin.CGFloat x = a1;
  v51.origin.CGFloat y = a2;
  v51.size.CGFloat width = a3;
  v51.size.CGFloat height = a4;
  CGFloat v26 = CGRectGetMinY(v51) + v25;
  v52.origin.CGFloat x = a1;
  v52.origin.CGFloat y = a2;
  v52.size.CGFloat width = a3;
  v52.size.CGFloat height = a4;
  CGFloat MinX = CGRectGetMinX(v52);
  v53.origin.CGFloat x = a1;
  v53.origin.CGFloat y = a2;
  v53.size.CGFloat width = a3;
  v53.size.CGFloat height = a4;
  CGFloat v28 = a4;
  CGFloat Width = CGRectGetWidth(v53);
  __swift_project_boxed_opaque_existential_1(v5 + 5, v5[8]);
  sub_1C2C264B8();
  v54.origin.CGFloat x = a1;
  v54.origin.CGFloat y = a2;
  v54.size.CGFloat width = a3;
  v54.size.CGFloat height = a4;
  CGFloat v39 = CGRectGetMinX(v54);
  v55.origin.CGFloat x = MinX;
  v55.origin.CGFloat y = v26;
  v55.size.CGFloat width = Width;
  v55.size.CGFloat height = rect;
  CGFloat v38 = v40 + CGRectGetMaxY(v55) - v37;
  v56.origin.CGFloat x = a1;
  v56.origin.CGFloat y = a2;
  v56.size.CGFloat width = a3;
  v56.size.CGFloat height = a4;
  CGFloat v41 = CGRectGetWidth(v56);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1C2C264B8();
  v57.origin.CGFloat x = MinX;
  v57.origin.CGFloat y = v26;
  v57.size.CGFloat width = Width;
  v57.size.CGFloat height = rect;
  double MinY = CGRectGetMinY(v57);
  v58.origin.CGFloat x = a1;
  v58.origin.CGFloat y = a2;
  v58.size.CGFloat width = a3;
  v58.size.CGFloat height = a4;
  double recta = v43 + MinY - CGRectGetMinY(v58);
  v59.origin.CGFloat x = a1;
  v59.origin.CGFloat y = a2;
  v59.size.CGFloat width = a3;
  v59.size.CGFloat height = a4;
  double v44 = CGRectGetMinX(v59);
  v60.origin.CGFloat x = a1;
  v60.origin.CGFloat y = a2;
  v60.size.CGFloat width = a3;
  v60.size.CGFloat height = a4;
  double v30 = CGRectGetMinY(v60);
  v61.origin.CGFloat x = a1;
  v61.origin.CGFloat y = a2;
  v61.size.CGFloat width = a3;
  v61.size.CGFloat height = v28;
  double v31 = CGRectGetWidth(v61);
  v62.origin.CGFloat y = v38;
  v62.origin.CGFloat x = v39;
  v62.size.CGFloat width = v41;
  v62.size.CGFloat height = v36;
  double MaxY = CGRectGetMaxY(v62);
  v63.origin.CGFloat x = a1;
  v63.origin.CGFloat y = a2;
  v63.size.CGFloat width = a3;
  v63.size.CGFloat height = v28;
  CGFloat v33 = CGRectGetMinY(v63);
  return MEMORY[0x1C8767B90](v44, v30, v31, MaxY - v33, recta, v42);
}

uint64_t sub_1C2C0B994(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2C0B9CC(uint64_t a1)
{
  return a1;
}

uint64_t destroy for CenteredThreeLineReverseTextLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 80);
}

uint64_t initializeWithCopy for CenteredThreeLineReverseTextLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t *assignWithCopy for CenteredThreeLineReverseTextLayout(uint64_t *a1, uint64_t *a2)
{
  a1[15] = a2[15];
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for CenteredThreeLineReverseTextLayout(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  uint64_t v6 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for CenteredThreeLineReverseTextLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CenteredThreeLineReverseTextLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CenteredThreeLineReverseTextLayout()
{
  return &type metadata for CenteredThreeLineReverseTextLayout;
}

uint64_t initializeWithCopy for CenteringLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for CenteringLayout(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CenteringLayout(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for CenteringLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CenteringLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CenteringLayout()
{
  return &type metadata for CenteringLayout;
}

void *sub_1C2C0BE78@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1C2C0BE84(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1C2C0BE8C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1C2C0BEA0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1C2C0BEB4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1C2C0BEC8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1C2C0BEF8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1C2C0BF24@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1C2C0BF48(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1C2C0BF5C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1C2C0BF70(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1C2C0BF84@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1C2C0BF98(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1C2C0BFAC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1C2C0BFC0(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1C2C0BFD4()
{
  return *v0 == 0;
}

uint64_t sub_1C2C0BFE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void *sub_1C2C0BFFC(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1C2C0C010@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1C2C0C020(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1C2C0C02C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C2C0C040@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_1C2C0C378(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_1C2C0C080(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_1C2C264E8();
  uint64_t v10 = v4[5];
  double v11 = a1;
  double v12 = a2;
  double v13 = a3;
  double v14 = a4;
  if (v10) {
    CGRectGetMidX(*(CGRect *)&v11);
  }
  else {
    CGRectGetMinX(*(CGRect *)&v11);
  }
  double v15 = a1;
  double v16 = a2;
  double v17 = a3;
  double v18 = a4;
  if ((v10 & 2) != 0) {
    CGRectGetMidY(*(CGRect *)&v15);
  }
  else {
    CGRectGetMinY(*(CGRect *)&v15);
  }
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1C2C26EF8();
  sub_1C2C264B8();

  return sub_1C2C26408();
}

ValueMetadata *type metadata accessor for CenteringLayout.Axis()
{
  return &type metadata for CenteringLayout.Axis;
}

unint64_t sub_1C2C0C21C()
{
  unint64_t result = qword_1EA3314F0;
  if (!qword_1EA3314F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3314F0);
  }
  return result;
}

unint64_t sub_1C2C0C274()
{
  unint64_t result = qword_1EA3314F8;
  if (!qword_1EA3314F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3314F8);
  }
  return result;
}

unint64_t sub_1C2C0C2CC()
{
  unint64_t result = qword_1EA331500;
  if (!qword_1EA331500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331500);
  }
  return result;
}

unint64_t sub_1C2C0C324()
{
  unint64_t result = qword_1EA331508;
  if (!qword_1EA331508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331508);
  }
  return result;
}

uint64_t sub_1C2C0C378(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1C2C0C3B4@<X0>(uint64_t a1@<X1>, id a2@<X2>, uint64_t a3@<X0>, uint64_t a4@<X8>)
{
  unint64_t v6 = sub_1C2C0D4C8(a1, a2, 0, 1);
  unint64_t v7 = v6;
  unint64_t v8 = v6 >> 62;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_1C2C26FC8();
    swift_bridgeObjectRelease();
    if (v42 >= 1) {
      goto LABEL_3;
    }
LABEL_44:
    uint64_t v43 = sub_1C2C26578();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(a4, 5, 10, v43);
    goto LABEL_45;
  }
  if (*(uint64_t *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1) {
    goto LABEL_44;
  }
LABEL_3:
  if (a3)
  {
    uint64_t v9 = sub_1C2C26E08();
    uint64_t v11 = v10;
    if (v9 == sub_1C2C26E08() && v11 == v12) {
      goto LABEL_11;
    }
    char v14 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_12;
    }
    uint64_t v15 = sub_1C2C26E08();
    uint64_t v17 = v16;
    if (v15 == sub_1C2C26E08() && v17 == v18)
    {
LABEL_11:
      swift_bridgeObjectRelease_n();
      goto LABEL_12;
    }
    char v26 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v26)
    {
LABEL_12:
      swift_bridgeObjectRelease();
      id v19 = objc_msgSend(self, sel_currentDevice);
      id v20 = objc_msgSend(v19, sel_userInterfaceIdiom);

      uint64_t v21 = sub_1C2C26578();
      double v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
      uint64_t v23 = a4;
      if (v20 == (id)1) {
        uint64_t v24 = 7;
      }
      else {
        uint64_t v24 = 6;
      }
LABEL_15:
      return v22(v23, v24, 10, v21);
    }
    uint64_t v27 = sub_1C2C26E08();
    uint64_t v29 = v28;
    if (v27 == sub_1C2C26E08() && v29 == v30) {
      goto LABEL_21;
    }
    char v31 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_26;
    }
    uint64_t v32 = sub_1C2C26E08();
    uint64_t v34 = v33;
    if (v32 == sub_1C2C26E08() && v34 == v35)
    {
LABEL_21:
      uint64_t result = swift_bridgeObjectRelease_n();
LABEL_26:
      if (v8)
      {
        swift_bridgeObjectRetain();
        double v37 = (void *)sub_1C2C26FC8();
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        double v37 = *(void **)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v37)
      {
        if ((v7 & 0xC000000000000001) != 0)
        {
          id v38 = (id)MEMORY[0x1C8768700](0, v7);
        }
        else
        {
          if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return result;
          }
          id v38 = *(id *)(v7 + 32);
        }
        double v37 = v38;
        swift_bridgeObjectRelease();
        unsigned int v39 = objc_msgSend(v37, sel_isPortrait);
      }
      else
      {
        swift_bridgeObjectRelease();
        unsigned int v39 = 1;
      }
      id v40 = objc_msgSend(self, sel_currentDevice);
      id v41 = objc_msgSend(v40, sel_userInterfaceIdiom);

      uint64_t v21 = sub_1C2C26578();
      double v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
      uint64_t v23 = a4;
      if (v39)
      {
        if (v41 == (id)1) {
          uint64_t v24 = 9;
        }
        else {
          uint64_t v24 = 3;
        }
      }
      else if (v41 == (id)1)
      {
        uint64_t v24 = 10;
      }
      else
      {
        uint64_t v24 = 8;
      }
      goto LABEL_15;
    }
    char v36 = sub_1C2C27008();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v36) {
      goto LABEL_26;
    }
  }
  sub_1C2C0CD60(v7, a4);
LABEL_45:

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2C0C844@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C2C26578();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v17 - 8);
  id v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2C0D168(a4, (uint64_t)v19);
  unint64_t v20 = sub_1C2C0D4C8(a1, a2, 0, 1);
  unint64_t v21 = v20;
  if (v20 >> 62)
  {
    uint64_t result = sub_1C2C26FC8();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    sub_1C2C26588();
    goto LABEL_9;
  }
  uint64_t result = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v21 & 0xC000000000000001) != 0)
  {
    id v23 = (id)MEMORY[0x1C8768700](0, v21);
  }
  else
  {
    if (!*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v23 = *(id *)(v21 + 32);
  }
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_width);
  objc_msgSend(v24, sel_height);
  sub_1C2C26588();

LABEL_9:
  sub_1C2C0D8F0(a3, (uint64_t)v12);
  CGFloat v25 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  uint64_t v26 = a5 + v25[6];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v26, 1, 1, v13);
  sub_1C2C0D168((uint64_t)v19, a5);
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(a5 + v25[5], v16, v13);
  sub_1C2C0D958((uint64_t)v12, v26);
  if (objc_msgSend(self, sel_isMainThread))
  {
    id v27 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v27, sel_bounds);
    uint64_t v29 = v28;
    uint64_t v31 = v30;

    sub_1C2C01858((uint64_t)v12);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t result = sub_1C2C0D1CC((uint64_t)v19);
    uint64_t v32 = (void *)(a5 + v25[7]);
    void *v32 = v29;
    v32[1] = v31;
  }
  else
  {
    sub_1C2C01858((uint64_t)v12);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t result = sub_1C2C0D1CC((uint64_t)v19);
    uint64_t v33 = (void *)(a5 + v25[7]);
    *uint64_t v33 = 0;
    v33[1] = 0;
  }
  return result;
}

uint64_t sub_1C2C0CBC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v4 - 8);
  unint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_currentDevice);
  id v8 = objc_msgSend(v7, sel_userInterfaceIdiom);

  sub_1C2C0D168(v2, (uint64_t)v6);
  uint64_t v9 = sub_1C2C26578();
  uint64_t v10 = *(void *)(v9 - 8);
  int v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 10, v9);
  if (v11 == 2)
  {
    if (v8 != (id)1) {
      goto LABEL_8;
    }
LABEL_6:
    sub_1C2C0D168(v2, a1);
    return sub_1C2C0D1CC((uint64_t)v6);
  }
  if (v11 != 1) {
    goto LABEL_6;
  }
  if (v8 == (id)1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, 2, 10, v9);
    return sub_1C2C0D1CC((uint64_t)v6);
  }
LABEL_8:
  sub_1C2C0D1CC((uint64_t)v6);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, 3, 10, v9);
}

uint64_t sub_1C2C0CD60@<X0>(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(self, sel_currentDevice);
  id v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

  if (!(a1 >> 62))
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v8 = v6;
    if (v6) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    if (v8 <= 2 || v5 == (id)1)
    {
      if (v8 >= 2)
      {
        uint64_t v18 = sub_1C2C26578();
        uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
        uint64_t v14 = v18;
        uint64_t v15 = a2;
        uint64_t v16 = 2;
      }
      else
      {
        uint64_t v14 = sub_1C2C26578();
        uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
        uint64_t v15 = a2;
        if (v8 == 1) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = 5;
        }
      }
    }
    else
    {
      uint64_t v17 = sub_1C2C26578();
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
      uint64_t v14 = v17;
      uint64_t v15 = a2;
      uint64_t v16 = 3;
    }
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_1C2C26FC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t result = sub_1C2C26FC8();
  if (!result) {
    goto LABEL_9;
  }
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v9 = (id)MEMORY[0x1C8768700](0, a1);
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v9 = *(id *)(a1 + 32);
  }
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unsigned __int8 v11 = objc_msgSend(v10, sel_isPortrait);

  if (v11) {
    goto LABEL_10;
  }
  uint64_t v12 = sub_1C2C26578();
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  uint64_t v14 = v12;
  uint64_t v15 = a2;
  uint64_t v16 = 4;
LABEL_18:

  return v13(v15, v16, 10, v14);
}

uint64_t sub_1C2C0CF9C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C2C26FC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1C2C26FC8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1C8768710](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1C2C0D318(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C2C26FC8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_1C2C26E68();
}

uint64_t sub_1C2C0D168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2C0D1CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1C2C0D228(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      if (v4 != a3)
      {
LABEL_7:
        sub_1C2C0191C(0, &qword_1EA330BF0);
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681948);
      id v7 = (void *)swift_allocObject();
      int64_t v8 = _swift_stdlib_malloc_size(v7);
      uint64_t v9 = v8 - 32;
      if (v8 < 32) {
        uint64_t v9 = v8 - 25;
      }
      long long v7[2] = v5;
      v7[3] = (2 * (v9 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

uint64_t sub_1C2C0D318(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C2C26FC8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1C2C26FC8();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C2C0D9C0();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA331518);
            uint64_t v10 = sub_1C2BFE880(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1C2C0191C(0, &qword_1EA330BF0);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2C0D4C8(uint64_t a1, id a2, uint64_t a3, char a4)
{
  LOBYTE(v4) = a4;
  unint64_t v28 = MEMORY[0x1E4FBC860];
  if (!a2) {
    goto LABEL_10;
  }
  id v7 = objc_msgSend(a2, sel_videos);
  sub_1C2C0191C(0, &qword_1EA331510);
  unint64_t v8 = sub_1C2C26E58();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    id v9 = (id)sub_1C2C26FC8();
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_4;
    }
LABEL_36:
    swift_bridgeObjectRelease();
    if (!a1) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v9 = *(id *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v9) {
    goto LABEL_36;
  }
LABEL_4:
  if ((v8 & 0xC000000000000001) != 0)
  {
    id v10 = (id)MEMORY[0x1C8768700](0, v8);
  }
  else
  {
    if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_42;
    }
    id v10 = *(id *)(v8 + 32);
  }
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v11, sel_preview);

  if (!v12) {
    goto LABEL_10;
  }
  id v9 = v12;
  MEMORY[0x1C87685B0]();
  if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_46;
  }
  while (1)
  {
    sub_1C2C26E88();
    sub_1C2C26E68();

LABEL_10:
    if (a1)
    {
LABEL_11:
      id v13 = objc_msgSend((id)a1, sel_artwork);
      sub_1C2C0191C(0, &qword_1EA330BF0);
      a1 = sub_1C2C26E58();

      sub_1C2C0CF9C(a1);
    }
LABEL_12:
    unint64_t v8 = v28;
    if (v4) {
      return v8;
    }
    id v9 = (id)(v28 >> 62);
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_1C2C26FC8();
      swift_bridgeObjectRelease();
      if (v27 <= a3) {
        return v8;
      }
    }
    else if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a3)
    {
      return v8;
    }
    if (a3 < 0)
    {
LABEL_42:
      __break(1u);
    }
    else if (!v9)
    {
      uint64_t v4 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v4 >= a3) {
        goto LABEL_18;
      }
      goto LABEL_45;
    }
    swift_bridgeObjectRetain();
    a1 = sub_1C2C26FC8();
    uint64_t result = swift_bridgeObjectRelease();
    if (a1 < 0) {
      break;
    }
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1C2C26FC8();
    swift_bridgeObjectRelease();
    if (v4 >= a3)
    {
LABEL_18:
      if ((v8 & 0xC000000000000001) != 0 && a3)
      {
        sub_1C2C0191C(0, &qword_1EA330BF0);
        uint64_t v14 = 0;
        do
        {
          uint64_t v15 = v14 + 1;
          sub_1C2C26F78();
          uint64_t v14 = v15;
        }
        while (a3 != v15);
      }
      if (v9)
      {
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_1C2C26FD8();
        uint64_t v17 = v19;
        id v9 = v20;
        unint64_t v18 = v21;
        swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v16 = v8 & 0xFFFFFFFFFFFFFF8;
        uint64_t v17 = (v8 & 0xFFFFFFFFFFFFFF8) + 32;
        unint64_t v18 = (2 * a3) | 1;
        swift_bridgeObjectRetain();
        if (v18)
        {
LABEL_27:
          sub_1C2C27018();
          swift_unknownObjectRetain_n();
          uint64_t v24 = swift_dynamicCastClass();
          if (!v24)
          {
            swift_unknownObjectRelease();
            uint64_t v24 = MEMORY[0x1E4FBC860];
          }
          uint64_t v25 = *(void *)(v24 + 16);
          swift_release();
          if (__OFSUB__(v18 >> 1, v9))
          {
            __break(1u);
          }
          else if (v25 == (v18 >> 1) - (void)v9)
          {
            uint64_t v23 = swift_dynamicCastClass();
            if (!v23)
            {
              swift_unknownObjectRelease();
              uint64_t v23 = MEMORY[0x1E4FBC860];
            }
            goto LABEL_33;
          }
          swift_unknownObjectRelease();
        }
      }
      sub_1C2C0D228(v16, v17, (uint64_t)v9, v18);
      uint64_t v23 = v22;
LABEL_33:
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return v23;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    sub_1C2C26E78();
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2C0D8F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2C0D958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C2C0D9C0()
{
  unint64_t result = qword_1EA331520;
  if (!qword_1EA331520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA331518);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331520);
  }
  return result;
}

uint64_t *sub_1C2C0DA1C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C2C26578();
    uint64_t v8 = *(void *)(v7 - 8);
    id v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    uint64_t v18 = v8;
    if (v9(a2, 10, v7))
    {
      uint64_t v10 = type metadata accessor for LockupMediaLayout.DisplayType(0);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      uint64_t v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    }
    else
    {
      uint64_t v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
      v11(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 10, v7);
    }
    v11((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    if (v9((uint64_t *)((char *)a2 + v13), 1, v7))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      v11((uint64_t *)v14, (uint64_t *)v15, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v14, 0, 1, v7);
    }
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t type metadata accessor for LockupMediaLayout.DisplayType(uint64_t a1)
{
  return sub_1C2C10518(a1, (uint64_t *)&unk_1EA331548);
}

uint64_t sub_1C2C0DC84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C2C26578();
  uint64_t v11 = *(void *)(v4 - 8);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  int v6 = v5(a1, 10, v4);
  uint64_t v7 = *(void (**)(void, void))(v11 + 8);
  uint64_t v10 = v7;
  if (!v6)
  {
    v7(a1, v4);
    uint64_t v7 = v10;
  }
  v7(a1 + *(int *)(a2 + 20), v4);
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  uint64_t result = v5(v8, 1, v4);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v8, v4);
  }
  return result;
}

char *sub_1C2C0DDD4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2C26578();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  uint64_t v17 = v7;
  if (v8(a2, 10, v6))
  {
    uint64_t v9 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  }
  else
  {
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v10(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  }
  v10(&a1[*(int *)(a3 + 20)], &a2[*(int *)(a3 + 20)], v6);
  uint64_t v11 = a3;
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  if (v8(&a2[v12], 1, v6))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    v10(v13, v14, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v6);
  }
  *(_OWORD *)&a1[*(int *)(v11 + 28)] = *(_OWORD *)&a2[*(int *)(v11 + 28)];
  return a1;
}

char *sub_1C2C0DFD0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2C26578();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 10, v6);
  int v10 = v8(a2, 10, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v7 + 24);
  v12(&a1[*(int *)(a3 + 20)], &a2[*(int *)(a3 + 20)], v6);
  uint64_t v23 = a3;
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  int v16 = v8(&a1[v13], 1, v6);
  int v17 = v8(v15, 1, v6);
  if (!v16)
  {
    if (!v17)
    {
      v12(v14, v15, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
    goto LABEL_12;
  }
  if (v17)
  {
LABEL_12:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v14, v15, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
LABEL_13:
  uint64_t v19 = *(int *)(v23 + 28);
  unint64_t v20 = &a1[v19];
  unint64_t v21 = &a2[v19];
  *(void *)unint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  return a1;
}

char *sub_1C2C0E2A4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2C26578();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  uint64_t v17 = v7;
  if (v8(a2, 10, v6))
  {
    uint64_t v9 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    int v10 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  }
  else
  {
    int v10 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v10(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  }
  v10(&a1[*(int *)(a3 + 20)], &a2[*(int *)(a3 + 20)], v6);
  uint64_t v11 = a3;
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  if (v8(&a2[v12], 1, v6))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    v10(v13, v14, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v6);
  }
  *(_OWORD *)&a1[*(int *)(v11 + 28)] = *(_OWORD *)&a2[*(int *)(v11 + 28)];
  return a1;
}

char *sub_1C2C0E4A0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2C26578();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 10, v6);
  int v10 = v8(a2, 10, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v7 + 40);
  v12(&a1[*(int *)(a3 + 20)], &a2[*(int *)(a3 + 20)], v6);
  uint64_t v20 = a3;
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  int v16 = v8(&a1[v13], 1, v6);
  int v17 = v8(v15, 1, v6);
  if (!v16)
  {
    if (!v17)
    {
      v12(v14, v15, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
    goto LABEL_12;
  }
  if (v17)
  {
LABEL_12:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v15, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
LABEL_13:
  *(_OWORD *)&a1[*(int *)(v20 + 28)] = *(_OWORD *)&a2[*(int *)(v20 + 28)];
  return a1;
}

uint64_t sub_1C2C0E764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C2C0E778);
}

uint64_t sub_1C2C0E778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_1C2C26578();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_1C2C0E8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C2C0E8DC);
}

uint64_t sub_1C2C0E8DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_1C2C26578();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

uint64_t type metadata accessor for LockupMediaLayout.Metrics(uint64_t a1)
{
  return sub_1C2C10518(a1, (uint64_t *)&unk_1EA331530);
}

void sub_1C2C0EA58()
{
  type metadata accessor for LockupMediaLayout.DisplayType(319);
  if (v0 <= 0x3F)
  {
    sub_1C2C26578();
    if (v1 <= 0x3F)
    {
      sub_1C2C0EB64();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1C2C0EB64()
{
  if (!qword_1EA331540)
  {
    sub_1C2C26578();
    unint64_t v0 = sub_1C2C26F38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA331540);
    }
  }
}

uint64_t *sub_1C2C0EBBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_1C2C26578();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 10, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 10, v7);
    }
  }
  return a1;
}

uint64_t sub_1C2C0ED08(uint64_t a1)
{
  uint64_t v2 = sub_1C2C26578();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 10, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_1C2C0EDD8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2C26578();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 10, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  }
  return a1;
}

void *sub_1C2C0EEE8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2C26578();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 10, v6);
  int v10 = v8(a2, 10, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  return a1;
}

void *sub_1C2C0F05C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2C26578();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 10, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  }
  return a1;
}

void *sub_1C2C0F16C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2C26578();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 10, v6);
  int v10 = v8(a2, 10, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  return a1;
}

uint64_t sub_1C2C0F2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C2C0F2F4);
}

uint64_t sub_1C2C0F2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C2C26578();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 0xB) {
    return v5 - 10;
  }
  else {
    return 0;
  }
}

uint64_t sub_1C2C0F360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C2C0F374);
}

uint64_t sub_1C2C0F374(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 10);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_1C2C26578();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_1C2C0F3F8(uint64_t a1)
{
  uint64_t v2 = sub_1C2C26578();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 10, v2);
}

uint64_t sub_1C2C0F460(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C2C26578();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 10, v4);
}

uint64_t sub_1C2C0F4D0()
{
  uint64_t result = sub_1C2C26578();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

void *sub_1C2C0F548(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    v4[5] = a2[5];
    uint64_t v8 = *(int *)(a3 + 24);
    int v9 = (char *)v4 + v8;
    int v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1C2C26578();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    uint64_t v23 = v13;
    if (v13(v10, 10, v11))
    {
      uint64_t v14 = type metadata accessor for LockupMediaLayout.DisplayType(0);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 10, v11);
    }
    uint64_t v16 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v17(&v9[v16[5]], &v10[v16[5]], v11);
    uint64_t v18 = v16[6];
    uint64_t v24 = v9;
    uint64_t v19 = &v9[v18];
    uint64_t v20 = &v10[v18];
    if (v23(&v10[v18], 1, v11))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      v17(v19, v20, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v19, 0, 1, v11);
    }
    *(_OWORD *)&v24[v16[7]] = *(_OWORD *)&v10[v16[7]];
  }
  return v4;
}

uint64_t sub_1C2C0F7EC(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1C2C26578();
  uint64_t v11 = *(void *)(v5 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v6(v4, 10, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v4, v5);
  }
  uint64_t v7 = type metadata accessor for LockupMediaLayout.Metrics(0);
  int v10 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v10(v4 + *(int *)(v7 + 20), v5);
  uint64_t v8 = v4 + *(int *)(v7 + 24);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v8, 1, v5);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v8, v5);
  }
  return result;
}

uint64_t sub_1C2C0F944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)(a1 + v7);
  int v9 = (char *)(a2 + v7);
  uint64_t v10 = sub_1C2C26578();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  uint64_t v21 = v12;
  if (v12(v9, 10, v10))
  {
    uint64_t v13 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 10, v10);
  }
  uint64_t v14 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v15(&v8[v14[5]], &v9[v14[5]], v10);
  uint64_t v16 = v14[6];
  uint64_t v22 = v8;
  uint64_t v17 = &v8[v16];
  uint64_t v18 = &v9[v16];
  if (v21(&v9[v16], 1, v10))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    v15(v17, v18, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
  }
  *(_OWORD *)&v22[v14[7]] = *(_OWORD *)&v9[v14[7]];
  return a1;
}

uint64_t *sub_1C2C0FB90(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v29 = a1;
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1C2C26578();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 10, v9);
  int v13 = v11(v8, 10, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 10, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v16(&v7[v15[5]], &v8[v15[5]], v9);
  uint64_t v17 = v15[6];
  uint64_t v27 = v8;
  unint64_t v28 = v7;
  uint64_t v18 = &v7[v17];
  uint64_t v19 = &v8[v17];
  int v20 = v11(v18, 1, v9);
  int v21 = v11(v19, 1, v9);
  if (!v20)
  {
    if (!v21)
    {
      v16(v18, v19, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
    goto LABEL_12;
  }
  if (v21)
  {
LABEL_12:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v19, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
LABEL_13:
  uint64_t v23 = v15[7];
  uint64_t v24 = &v28[v23];
  uint64_t v25 = &v27[v23];
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  return v29;
}

uint64_t sub_1C2C0FE80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_1C2C26578();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v19(v8, 10, v9))
  {
    uint64_t v11 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 10, v9);
  }
  int v12 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  int v13 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v13(&v7[v12[5]], &v8[v12[5]], v9);
  uint64_t v14 = v12[6];
  int v20 = v7;
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  if (v19(&v8[v14], 1, v9))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v13(v15, v16, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v15, 0, 1, v9);
  }
  *(_OWORD *)&v20[v12[7]] = *(_OWORD *)&v8[v12[7]];
  return a1;
}

uint64_t sub_1C2C10090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = sub_1C2C26578();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 10, v11);
  int v15 = v13(v10, 10, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 10, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    uint64_t v16 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v17 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v18(&v9[v17[5]], &v10[v17[5]], v11);
  uint64_t v19 = v17[6];
  uint64_t v26 = v10;
  uint64_t v27 = v9;
  int v20 = &v9[v19];
  int v21 = &v10[v19];
  int v22 = v13(v20, 1, v11);
  int v23 = v13(v21, 1, v11);
  if (!v22)
  {
    if (!v23)
    {
      v18(v20, v21, v11);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v20, v11);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v20, v21, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
LABEL_13:
  *(_OWORD *)&v27[v17[7]] = *(_OWORD *)&v26[v17[7]];
  return a1;
}

uint64_t sub_1C2C10378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C2C1038C);
}

uint64_t sub_1C2C1038C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for LockupMediaLayout.Metrics(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1C2C1043C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C2C10450);
}

uint64_t sub_1C2C10450(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for LockupMediaLayout.Metrics(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LockupMediaLayout(uint64_t a1)
{
  return sub_1C2C10518(a1, (uint64_t *)&unk_1EA331558);
}

uint64_t sub_1C2C10518(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C2C10550()
{
  uint64_t result = type metadata accessor for LockupMediaLayout.Metrics(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1C2C105F4()
{
  qword_1EA331528 = 0x4024000000000000;
}

double sub_1C2C10604(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v89 = a2;
  uint64_t v7 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1F4188790](v7);
  uint64_t v83 = (uint64_t)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v82 = (uint64_t)&v79 - v10;
  uint64_t v11 = sub_1C2C26FF8();
  uint64_t v87 = *(void *)(v11 - 8);
  uint64_t v88 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v86 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v85 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v84 = (uint64_t)&v79 - v16;
  MEMORY[0x1F4188790](v17);
  uint64_t v81 = (uint64_t)&v79 - v18;
  MEMORY[0x1F4188790](v19);
  int v21 = (char *)&v79 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v24 = (char *)&v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1C2C26578();
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  id v80 = (char *)&v79 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v28);
  uint64_t v30 = (char *)&v79 - v29;
  MEMORY[0x1F4188790](v31);
  uint64_t v33 = (char *)&v79 - v32;
  MEMORY[0x1F4188790](v34);
  char v36 = (char *)&v79 - v35;
  uint64_t v90 = v7;
  sub_1C2C0D8F0(a1 + *(int *)(v7 + 24), (uint64_t)v24);
  double v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48);
  if (v37((uint64_t)v24, 1, v25) == 1)
  {
    sub_1C2BF9534((uint64_t)v24, &qword_1EA330BF8);
    sub_1C2C129A8(a1, (uint64_t)v21, type metadata accessor for LockupMediaLayout.DisplayType);
    double v38 = 0.0;
    uint64_t v39 = a1;
    switch(v37((uint64_t)v21, 10, v25))
    {
      case 1u:
      case 2u:
      case 3u:
      case 9u:
      case 0xAu:
        uint64_t v40 = a1;
        uint64_t v41 = v84;
        sub_1C2C129A8(v40, v84, type metadata accessor for LockupMediaLayout.DisplayType);
        int v42 = v37(v41, 10, v25);
        uint64_t v43 = (uint64_t)v85;
        switch(v42)
        {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
            break;
          default:
            sub_1C2C12A10(v41, type metadata accessor for LockupMediaLayout.DisplayType);
            break;
        }
        sub_1C2C129A8(v39, v43, type metadata accessor for LockupMediaLayout.DisplayType);
        int v73 = v37(v43, 10, v25);
        if ((v73 - 9) < 2)
        {
          uint64_t v74 = MEMORY[0x1E4FBC958];
          uint64_t v93 = MEMORY[0x1E4F71988];
          uint64_t v75 = 0x4010000000000000;
LABEL_29:
          uint64_t v92 = v74;
          v91[0] = v75;
          goto LABEL_33;
        }
        if (v73 == 7)
        {
          uint64_t v74 = MEMORY[0x1E4FBC958];
          uint64_t v93 = MEMORY[0x1E4F71988];
          uint64_t v75 = 0x4022000000000000;
          goto LABEL_29;
        }
        if (qword_1EA330850 != -1) {
          swift_once();
        }
        uint64_t v92 = MEMORY[0x1E4FBC958];
        uint64_t v93 = MEMORY[0x1E4F71988];
        v91[0] = qword_1EA331528;
        sub_1C2C12A10(v43, type metadata accessor for LockupMediaLayout.DisplayType);
LABEL_33:
        __swift_project_boxed_opaque_existential_1(v91, MEMORY[0x1E4FBC958]);
        long long v76 = v86;
        sub_1C2C082FC();
        sub_1C2C265D8();
        (*(void (**)(char *, uint64_t))(v87 + 8))(v76, v88);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
LABEL_34:
        sub_1C2C26548();
        return a3;
      case 4u:
        goto LABEL_34;
      case 5u:
        return v38;
      case 6u:
        uint64_t v55 = v82;
        sub_1C2C129A8(a1, v82, type metadata accessor for LockupMediaLayout.Metrics);
        sub_1C2C26518();
        double v57 = v56;
        sub_1C2C26568();
        double v59 = v58;
        sub_1C2C12A10(v55, type metadata accessor for LockupMediaLayout.DisplayType);
        CGRect v60 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
        BOOL v61 = v57 < v59;
        unsigned int v62 = 8;
        unsigned int v63 = 3;
        goto LABEL_13;
      case 7u:
        uint64_t v55 = v83;
        sub_1C2C129A8(a1, v83, type metadata accessor for LockupMediaLayout.Metrics);
        sub_1C2C26518();
        double v65 = v64;
        sub_1C2C26568();
        double v67 = v66;
        sub_1C2C12A10(v55, type metadata accessor for LockupMediaLayout.DisplayType);
        CGRect v60 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
        BOOL v61 = v65 < v67;
        unsigned int v62 = 10;
        unsigned int v63 = 9;
LABEL_13:
        if (v61) {
          uint64_t v68 = v63;
        }
        else {
          uint64_t v68 = v62;
        }
        v60(v55, v68, 10, v25);
        double v38 = sub_1C2C10604(v55, v89, a3, a4);
        sub_1C2C12A10(v55, type metadata accessor for LockupMediaLayout.Metrics);
        return v38;
      case 8u:
        sub_1C2C26548();
        uint64_t v69 = v81;
        sub_1C2C129A8(a1, v81, type metadata accessor for LockupMediaLayout.DisplayType);
        int v70 = v37(v69, 10, v25);
        if ((v70 - 9) < 2)
        {
          uint64_t v71 = MEMORY[0x1E4FBC958];
          uint64_t v93 = MEMORY[0x1E4F71988];
          uint64_t v72 = 0x4010000000000000;
LABEL_23:
          uint64_t v92 = v71;
          v91[0] = v72;
          goto LABEL_39;
        }
        if (v70 == 7)
        {
          uint64_t v71 = MEMORY[0x1E4FBC958];
          uint64_t v93 = MEMORY[0x1E4F71988];
          uint64_t v72 = 0x4022000000000000;
          goto LABEL_23;
        }
        if (qword_1EA330850 != -1) {
          swift_once();
        }
        uint64_t v92 = MEMORY[0x1E4FBC958];
        uint64_t v93 = MEMORY[0x1E4F71988];
        v91[0] = qword_1EA331528;
        sub_1C2C12A10(v69, type metadata accessor for LockupMediaLayout.DisplayType);
LABEL_39:
        __swift_project_boxed_opaque_existential_1(v91, MEMORY[0x1E4FBC958]);
        id v78 = v86;
        sub_1C2C082FC();
        sub_1C2C265D8();
        (*(void (**)(char *, uint64_t))(v87 + 8))(v78, v88);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
        double v38 = a3;
        break;
      default:
        (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v30, v21, v25);
        CGRect v50 = v80;
        sub_1C2C26588();
        sub_1C2C26528();
        double v52 = v51;
        sub_1C2C26528();
        if (v53 >= v52)
        {
          sub_1C2C26548();
        }
        else
        {
          sub_1C2C26538();
          a3 = v54;
        }
        uint64_t v48 = *(void (**)(char *, uint64_t))(v26 + 8);
        v48(v50, v25);
        uint64_t v49 = v30;
        goto LABEL_8;
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v36, v24, v25);
    sub_1C2C26588();
    sub_1C2C26528();
    double v45 = v44;
    sub_1C2C26528();
    if (v46 >= v45)
    {
      sub_1C2C26548();
    }
    else
    {
      sub_1C2C26538();
      a3 = v47;
    }
    uint64_t v48 = *(void (**)(char *, uint64_t))(v26 + 8);
    v48(v33, v25);
    uint64_t v49 = v36;
LABEL_8:
    v48(v49, v25);
    return a3;
  }
  return v38;
}

uint64_t sub_1C2C110E0@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v7 = v6;
  uint64_t v74 = a2;
  uint64_t v13 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v71 = (uint64_t)v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA330BF8);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1C2C26578();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  int v21 = (char *)v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)v66 - v23;
  uint64_t v25 = (uint64_t)v7 + *(int *)(type metadata accessor for LockupMediaLayout(0) + 24);
  uint64_t v26 = type metadata accessor for LockupMediaLayout.Metrics(0);
  sub_1C2C0D8F0(v25 + *(int *)(v26 + 24), (uint64_t)v17);
  uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  uint64_t v68 = v19 + 48;
  double v67 = v27;
  if (v27((uint64_t)v17, 1, v18) == 1)
  {
    sub_1C2BF9534((uint64_t)v17, &qword_1EA330BF8);
    double v28 = a6;
    double v29 = a5;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v17, v18);
    sub_1C2C26588();
    sub_1C2C26528();
    double v31 = v30;
    sub_1C2C26528();
    if (v32 >= v31)
    {
      sub_1C2C26548();
      double v28 = v34;
      double v29 = a5;
    }
    else
    {
      sub_1C2C26538();
      double v29 = v33;
      double v28 = a6;
    }
    uint64_t v35 = *(void (**)(char *, uint64_t))(v19 + 8);
    v35(v21, v18);
    v35(v24, v18);
  }
  uint64_t v70 = v18;
  uint64_t v69 = v25;
  double v72 = v29;
  double v73 = v28;
  double v36 = sub_1C2C12044(v25, (uint64_t)a1, v29, v28);
  double v38 = v37;
  uint64_t v39 = *(void *)(v7[5] + 16);
  uint64_t v40 = swift_bridgeObjectRetain();
  v66[1] = v40;
  if (v39)
  {
    uint64_t v41 = 0;
    uint64_t v42 = v40 + 32;
    double v43 = 0.0;
    double v44 = 0.0;
    double v77 = a5;
    double v76 = v36;
    double v75 = v38;
    do
    {
      double v78 = v44;
      uint64_t v45 = v41 + 1;
      sub_1C2BF7C98(v42, (uint64_t)v79 + 8);
      *(void *)&v81[0] = v41;
      sub_1C2BF8100((_OWORD *)((char *)v79 + 8), (uint64_t)v81 + 8);
      v79[0] = v81[0];
      v79[1] = v81[1];
      long long v80 = v81[2];
      double v46 = sub_1C2C117C4(*(uint64_t *)&v81[0], (uint64_t)a1, v36, v38, a3, a4, a5, a6);
      double v47 = a4;
      CGFloat v49 = v48;
      double v50 = a3;
      CGFloat v52 = v51;
      double v53 = a6;
      CGFloat v55 = v54;
      __swift_project_boxed_opaque_existential_1((void *)v79 + 1, v80);
      sub_1C2C264B8();
      v82.origin.CGFloat x = v46;
      v82.origin.CGFloat y = v49;
      v82.size.CGFloat width = v52;
      v82.size.CGFloat height = v55;
      double MaxX = CGRectGetMaxX(v82);
      if (v43 <= MaxX) {
        double v43 = MaxX;
      }
      v83.origin.CGFloat x = v46;
      double v36 = v76;
      v83.origin.CGFloat y = v49;
      a4 = v47;
      v83.size.CGFloat width = v52;
      a3 = v50;
      double v38 = v75;
      double v44 = v78;
      v83.size.CGFloat height = v55;
      a6 = v53;
      a5 = v77;
      double MaxY = CGRectGetMaxY(v83);
      if (v44 <= MaxY) {
        double v44 = MaxY;
      }
      sub_1C2BF9534((uint64_t)v79, &qword_1EA331570);
      v42 += 40;
      ++v41;
    }
    while (v39 != v45);
  }
  swift_bridgeObjectRelease();
  uint64_t v58 = v71;
  sub_1C2C129A8(v69, v71, type metadata accessor for LockupMediaLayout.DisplayType);
  int v59 = v67(v58, 10, v70);
  if ((v59 - 6) >= 2)
  {
    if (v59 == 8)
    {
      v86.origin.CGFloat x = a3;
      v86.origin.CGFloat y = a4;
      v86.size.CGFloat width = a5;
      v86.size.CGFloat height = a6;
      CGRectGetMidX(v86);
    }
    else
    {
      sub_1C2C12A10(v58, type metadata accessor for LockupMediaLayout.DisplayType);
    }
  }
  else
  {
    v84.origin.CGFloat x = a3;
    v84.origin.CGFloat y = a4;
    v84.size.CGFloat width = a5;
    v84.size.CGFloat height = a6;
    CGRectGetMidX(v84);
    v85.origin.CGFloat x = a3;
    v85.origin.CGFloat y = a4;
    v85.size.CGFloat width = a5;
    v85.size.CGFloat height = a6;
    CGRectGetMidY(v85);
  }
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_1C2C26EF8();
  sub_1C2C264B8();
  id v60 = objc_msgSend(a1, sel_traitCollection);
  char v61 = sub_1C2C26EB8();

  if (v61)
  {
    uint64_t v62 = v7[5];
    uint64_t v63 = *(void *)(v62 + 16);
    if (v63)
    {
      double v64 = (void *)(v62 + 32);
      swift_bridgeObjectRetain();
      do
      {
        __swift_project_boxed_opaque_existential_1(v64, v64[3]);
        __swift_project_boxed_opaque_existential_1(v64, v64[3]);
        sub_1C2C264A8();
        sub_1C2C26EF8();
        sub_1C2C264B8();
        v64 += 5;
        --v63;
      }
      while (v63);
      swift_bridgeObjectRelease();
    }
  }
  return sub_1C2C26408();
}

double sub_1C2C117C4(uint64_t a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v56 = a1;
  uint64_t v57 = a2;
  double v59 = a4;
  uint64_t v14 = sub_1C2C26FF8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v18 - 8);
  CGFloat v55 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v54 = (uint64_t)&v54 - v21;
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v54 - v23;
  MEMORY[0x1F4188790](v25);
  uint64_t v27 = (char *)&v54 - v26;
  uint64_t v58 = v8 + *(int *)(type metadata accessor for LockupMediaLayout(0) + 24);
  sub_1C2C129A8(v58, (uint64_t)v27, type metadata accessor for LockupMediaLayout.DisplayType);
  uint64_t v28 = sub_1C2C26578();
  double v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 48);
  int v30 = v29(v27, 10, v28);
  uint64_t v31 = MEMORY[0x1E4FBC958];
  uint64_t v32 = MEMORY[0x1E4F71988];
  if ((v30 - 9) < 2)
  {
    uint64_t v62 = MEMORY[0x1E4F71988];
    uint64_t v33 = 0x4010000000000000;
LABEL_5:
    uint64_t v61 = MEMORY[0x1E4FBC958];
    v60[0] = v33;
    goto LABEL_9;
  }
  if (v30 == 7)
  {
    uint64_t v62 = MEMORY[0x1E4F71988];
    uint64_t v33 = 0x4022000000000000;
    goto LABEL_5;
  }
  if (qword_1EA330850 != -1) {
    swift_once();
  }
  uint64_t v61 = v31;
  uint64_t v62 = v32;
  v60[0] = qword_1EA331528;
  sub_1C2C12A10((uint64_t)v27, type metadata accessor for LockupMediaLayout.DisplayType);
  uint64_t v31 = v61;
LABEL_9:
  __swift_project_boxed_opaque_existential_1(v60, v31);
  sub_1C2C082FC();
  sub_1C2C265D8();
  double v35 = v34;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
  uint64_t v36 = v58;
  sub_1C2C129A8(v58, (uint64_t)v24, type metadata accessor for LockupMediaLayout.DisplayType);
  double v37 = 0.0;
  switch(v29(v24, 10, v28))
  {
    case 1u:
      v65.origin.CGFloat x = a5;
      v65.origin.CGFloat y = a6;
      v65.size.CGFloat width = a7;
      v65.size.CGFloat height = a8;
      double v37 = CGRectGetMidX(v65) + a3 * -0.5;
      return v37 + a5;
    case 2u:
      v66.origin.CGFloat x = a5;
      v66.origin.CGFloat y = a6;
      v66.size.CGFloat width = a7;
      v66.size.CGFloat height = a8;
      double Width = CGRectGetWidth(v66);
      double v44 = a3 + a3 + v35;
      goto LABEL_16;
    case 3u:
      v67.origin.CGFloat x = a5;
      v67.origin.CGFloat y = a6;
      v67.size.CGFloat width = a7;
      v67.size.CGFloat height = a8;
      double Width = CGRectGetWidth(v67);
      double v44 = a3 * 3.0 + v35 + v35;
LABEL_16:
      double v45 = Width - v44;
      goto LABEL_43;
    case 4u:
      v68.origin.CGFloat x = a5;
      v68.origin.CGFloat y = a6;
      v68.size.CGFloat width = a7;
      v68.size.CGFloat height = a8;
      double v37 = (CGRectGetWidth(v68) - a3) * 0.5;
      return v37 + a5;
    case 5u:
      return v37 + a5;
    case 6u:
      type metadata accessor for LockupMediaLayout.Metrics(0);
      sub_1C2C26518();
      double v47 = v46;
      sub_1C2C26568();
      if (v47 >= v48)
      {
        double v50 = sub_1C2C1280C(v56, a3, v59, v35);
LABEL_23:
        double v37 = v50;
      }
      else
      {
        double v49 = floor((double)v56 / 3.0) + (double)(v56 % 3);
        double v37 = v49 * a3 + v49 * v35;
      }
      break;
    case 7u:
      sub_1C2C128D8(v56);
      goto LABEL_23;
    case 8u:
      sub_1C2C127A8(v56);
      goto LABEL_23;
    case 9u:
    case 0xAu:
      v63.origin.CGFloat x = a5;
      v63.origin.CGFloat y = a6;
      v63.size.CGFloat width = a7;
      v63.size.CGFloat height = a8;
      double v38 = CGRectGetWidth(v63);
      uint64_t v39 = v54;
      sub_1C2C129A8(v36, v54, type metadata accessor for LockupMediaLayout.DisplayType);
      int v40 = v29((char *)v39, 10, v28);
      double v41 = 3.0;
      uint64_t v42 = (uint64_t)v55;
      switch(v40)
      {
        case 1:
        case 4:
          double v41 = 1.0;
          break;
        case 2:
          double v41 = 2.0;
          break;
        case 3:
          break;
        case 5:
          double v41 = 0.0;
          break;
        case 6:
          double v41 = 9.0;
          break;
        case 7:
          double v41 = 14.0;
          break;
        case 8:
          double v41 = 5.0;
          break;
        case 9:
          double v41 = 7.0;
          break;
        case 10:
          double v41 = 4.0;
          break;
        default:
          sub_1C2C12A10(v39, type metadata accessor for LockupMediaLayout.DisplayType);
          double v41 = 1.0;
          break;
      }
      sub_1C2C129A8(v36, v42, type metadata accessor for LockupMediaLayout.DisplayType);
      int v51 = v29((char *)v42, 10, v28);
      double v52 = 2.0;
      switch(v51)
      {
        case 1:
        case 4:
          double v52 = 0.0;
          break;
        case 2:
          double v52 = 1.0;
          break;
        case 3:
          break;
        case 5:
          double v52 = -1.0;
          break;
        case 6:
          double v52 = 8.0;
          break;
        case 7:
          double v52 = 13.0;
          break;
        case 8:
          double v52 = 4.0;
          break;
        case 9:
          double v52 = 6.0;
          break;
        case 10:
          double v52 = 3.0;
          break;
        default:
          sub_1C2C12A10(v42, type metadata accessor for LockupMediaLayout.DisplayType);
          double v52 = 0.0;
          break;
      }
      double v45 = v38 - (v41 * a3 + v35 * v52);
LABEL_43:
      double v37 = (v35 + a3) * (double)v56 + v45 * 0.5;
      break;
    default:
      v64.origin.CGFloat x = a5;
      v64.origin.CGFloat y = a6;
      v64.size.CGFloat width = a7;
      v64.size.CGFloat height = a8;
      double v37 = (CGRectGetWidth(v64) - a3) * 0.5;
      sub_1C2C12A10((uint64_t)v24, type metadata accessor for LockupMediaLayout.DisplayType);
      break;
  }
  return v37 + a5;
}

double sub_1C2C11F64(uint64_t a1, uint64_t a2, double a3, double a4)
{
  return sub_1C2C10604(a1, a2, a3, a4);
}

double sub_1C2C11F84(uint64_t a1, uint64_t a2, double a3, double a4)
{
  return sub_1C2C10604(v4 + *(int *)(a2 + 24), a1, a3, a4);
}

uint64_t sub_1C2C11FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C2C129A8(v2 + *(int *)(a1 + 24), a2, type metadata accessor for LockupMediaLayout.Metrics);
}

unint64_t sub_1C2C11FEC()
{
  unint64_t result = qword_1EA331568;
  if (!qword_1EA331568)
  {
    type metadata accessor for LockupMediaLayout(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331568);
  }
  return result;
}

double sub_1C2C12044(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v58 = a2;
  uint64_t v59 = sub_1C2C26FF8();
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x1F4188790](v59);
  uint64_t v56 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C2C26578();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v55 - v13;
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v55 - v16;
  uint64_t v18 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)&v55 - v22;
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v55 - v25;
  sub_1C2C129A8(a1, (uint64_t)&v55 - v25, type metadata accessor for LockupMediaLayout.DisplayType);
  uint64_t v55 = v9;
  uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  double v28 = 0.0;
  switch(v27(v26, 10, v8))
  {
    case 1u:
    case 2u:
    case 3u:
    case 9u:
    case 0xAu:
      sub_1C2C129A8(a1, (uint64_t)v23, type metadata accessor for LockupMediaLayout.DisplayType);
      double v29 = 3.0;
      switch(v27(v23, 10, v8))
      {
        case 1u:
        case 4u:
          double v29 = 1.0;
          break;
        case 2u:
          double v29 = 2.0;
          break;
        case 3u:
          break;
        case 5u:
          double v29 = 0.0;
          break;
        case 6u:
          double v29 = 9.0;
          break;
        case 7u:
          double v29 = 14.0;
          break;
        case 8u:
          double v29 = 5.0;
          break;
        case 9u:
          double v29 = 7.0;
          break;
        case 0xAu:
          double v29 = 4.0;
          break;
        default:
          sub_1C2C12A10((uint64_t)v23, type metadata accessor for LockupMediaLayout.DisplayType);
          double v29 = 1.0;
          break;
      }
      sub_1C2C129A8(a1, (uint64_t)v20, type metadata accessor for LockupMediaLayout.DisplayType);
      unsigned int v45 = v27(v20, 10, v8);
      if (v45 - 9 < 2)
      {
        uint64_t v46 = MEMORY[0x1E4FBC958];
        uint64_t v62 = MEMORY[0x1E4F71988];
        uint64_t v47 = 0x4010000000000000;
LABEL_36:
        uint64_t v61 = v46;
        v60[0] = v47;
        goto LABEL_40;
      }
      if (v45 == 7)
      {
        uint64_t v46 = MEMORY[0x1E4FBC958];
        uint64_t v62 = MEMORY[0x1E4F71988];
        uint64_t v47 = 0x4022000000000000;
        goto LABEL_36;
      }
      if (qword_1EA330850 != -1) {
        swift_once();
      }
      uint64_t v61 = MEMORY[0x1E4FBC958];
      uint64_t v62 = MEMORY[0x1E4F71988];
      v60[0] = qword_1EA331528;
      sub_1C2C12A10((uint64_t)v20, type metadata accessor for LockupMediaLayout.DisplayType);
LABEL_40:
      __swift_project_boxed_opaque_existential_1(v60, MEMORY[0x1E4FBC958]);
      double v48 = v56;
      sub_1C2C082FC();
      sub_1C2C265D8();
      double v50 = v49;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v48, v59);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
      double v51 = v29 + -1.0;
      if (v29 + -1.0 <= 0.0) {
        double v51 = 0.0;
      }
      double v28 = (a3 - v51 * v50) / v29;
      type metadata accessor for LockupMediaLayout.Metrics(0);
      sub_1C2C26548();
      if (v52 > a4) {
        goto LABEL_43;
      }
      return v28;
    case 4u:
      type metadata accessor for LockupMediaLayout.Metrics(0);
      sub_1C2C26588();
      sub_1C2C26528();
      double v36 = v35;
      sub_1C2C26528();
      if (v37 >= v36)
      {
        sub_1C2C26548();
      }
      else
      {
        sub_1C2C26538();
        a3 = v38;
      }
      (*(void (**)(char *, uint64_t))(v55 + 8))(v17, v8);
      return a3;
    case 5u:
      return v28;
    case 6u:
      double v39 = *(double *)(a1 + *(int *)(type metadata accessor for LockupMediaLayout.Metrics(0) + 28)) * 0.78;
      goto LABEL_14;
    case 7u:
      double v40 = *(double *)(a1 + *(int *)(type metadata accessor for LockupMediaLayout.Metrics(0) + 28)) * 0.35;
      if (v40 <= 232.0) {
        double v40 = 232.0;
      }
      if (v40 <= 280.0) {
        double v39 = v40;
      }
      else {
        double v39 = 280.0;
      }
LABEL_14:
      sub_1C2C26518();
      double v42 = v41;
      sub_1C2C26568();
      if (v42 >= v43)
      {
        sub_1C2C26548();
        return v39;
      }
      else
      {
LABEL_43:
        sub_1C2C26538();
        return v53;
      }
    case 8u:
      double v28 = a3 * 0.64;
      type metadata accessor for LockupMediaLayout.Metrics(0);
      sub_1C2C26548();
      return v28;
    default:
      uint64_t v30 = v55;
      (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v14, v26, v8);
      sub_1C2C26588();
      sub_1C2C26528();
      double v32 = v31;
      sub_1C2C26528();
      if (v33 >= v32)
      {
        sub_1C2C26548();
      }
      else
      {
        sub_1C2C26538();
        a3 = v34;
      }
      double v44 = *(void (**)(char *, uint64_t))(v30 + 8);
      v44(v11, v8);
      v44(v14, v8);
      return a3;
  }
}

uint64_t sub_1C2C127A8(uint64_t result)
{
  if (__OFSUB__(result, 3 * (result / 3))) {
    __break(1u);
  }
  return result;
}

double sub_1C2C1280C(uint64_t a1, double a2, double a3, double a4)
{
  double v4 = 2.0;
  double v5 = 1.0;
  switch(a1)
  {
    case 1:
    case 5:
      return a4 * 0.5 + a2 * 0.5 + v5 * a2 + v5 * a4;
    case 2:
      goto LABEL_4;
    case 3:
    case 7:
      double v5 = 0.0;
      return a4 * 0.5 + a2 * 0.5 + v5 * a2 + v5 * a4;
    case 4:
      double v4 = 1.0;
      goto LABEL_4;
    case 6:
      double v4 = 0.0;
LABEL_4:
      double result = v4 * a2 + v4 * a4;
      break;
    default:
      double result = a2 + a4;
      break;
  }
  return result;
}

uint64_t sub_1C2C128D8(uint64_t result)
{
  uint64_t v1 = result - 3;
  if (__OFSUB__(result, 3)) {
    goto LABEL_13;
  }
  if ((v1 & 0x8000000000000000) == 0)
  {
    uint64_t v2 = v1 - qword_1F1DFFA70;
    if (__OFSUB__(v1, qword_1F1DFFA70)
      || (v2 & 0x8000000000000000) == 0
      && ((uint64_t v3 = v2 - qword_1F1DFFA78, __OFSUB__(v2, qword_1F1DFFA78))
       || (v3 & 0x8000000000000000) == 0 && __OFSUB__(v3, qword_1F1DFFA80)))
    {
      __break(1u);
LABEL_13:
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1C2C129A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C2C12A10(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C2C12A70()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MediaPlatform()
{
  return self;
}

uint64_t sub_1C2C12AA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = (void *)v1;
  uint64_t v136 = sub_1C2C269D8();
  uint64_t v4 = *(void *)(v136 - 8);
  MEMORY[0x1F4188790](v136);
  uint64_t v133 = (char *)&v101 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C2C26968();
  uint64_t v142 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v101 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C2C269C8();
  uint64_t v141 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v132 = (char *)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_1C2C26A08();
  uint64_t v134 = *(void *)(v137 - 8);
  MEMORY[0x1F4188790](v137);
  id v126 = (char *)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  id v124 = (char *)&v101 - v13;
  MEMORY[0x1F4188790](v14);
  id v129 = (char *)&v101 - v15;
  uint64_t v16 = sub_1C2C26A28();
  uint64_t v127 = *(void *)(v16 - 8);
  uint64_t v128 = v16;
  MEMORY[0x1F4188790](v16);
  uint64_t v138 = (char *)&v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = v1 + 504;
  sub_1C2C15B58(v1 + 504, (uint64_t)v163);
  uint64_t v18 = v163[3];
  sub_1C2BF9534((uint64_t)v163, &qword_1EB6817F0);
  sub_1C2C072E4(v1, (uint64_t)v163);
  uint64_t v140 = v6;
  if (!v18)
  {
    sub_1C2C07340((uint64_t)v163);
LABEL_8:
    sub_1C2C072E4(v1, (uint64_t)v160);
    goto LABEL_9;
  }
  sub_1C2C15B58((uint64_t)&v164, (uint64_t)v160);
  if (!v161)
  {
    sub_1C2C07340((uint64_t)v163);
    sub_1C2BF9534((uint64_t)v160, &qword_1EB6817F0);
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(v160, v161);
  char v19 = sub_1C2C264C8();
  sub_1C2C07340((uint64_t)v163);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v160);
  sub_1C2C072E4((uint64_t)v2, (uint64_t)v160);
  if (v19)
  {
LABEL_9:
    sub_1C2C07340((uint64_t)v160);
    goto LABEL_10;
  }
  sub_1C2C15B58((uint64_t)&v162, (uint64_t)v157);
  if (v158)
  {
    __swift_project_boxed_opaque_existential_1(v157, v158);
    LODWORD(v135) = sub_1C2C26488();
    sub_1C2C07340((uint64_t)v160);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v157);
    goto LABEL_11;
  }
  sub_1C2C07340((uint64_t)v160);
  sub_1C2BF9534((uint64_t)v157, &qword_1EB6817F0);
LABEL_10:
  LODWORD(v135) = 0;
LABEL_11:
  sub_1C2C15B58((uint64_t)(v2 + 48), (uint64_t)v157);
  uint64_t v20 = v158;
  sub_1C2BF9534((uint64_t)v157, &qword_1EB6817F0);
  sub_1C2C072E4((uint64_t)v2, (uint64_t)v157);
  unint64_t v139 = v8;
  uint64_t v130 = v9;
  uint64_t v131 = v4;
  if (!v20)
  {
    sub_1C2C07340((uint64_t)v157);
LABEL_18:
    sub_1C2C072E4((uint64_t)v2, (uint64_t)v154);
    goto LABEL_19;
  }
  sub_1C2C15B58((uint64_t)&v159, (uint64_t)v154);
  if (!v155)
  {
    sub_1C2C07340((uint64_t)v157);
    sub_1C2BF9534((uint64_t)v154, &qword_1EB6817F0);
    goto LABEL_18;
  }
  __swift_project_boxed_opaque_existential_1(v154, v155);
  char v21 = sub_1C2C264C8();
  sub_1C2C07340((uint64_t)v157);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v154);
  sub_1C2C072E4((uint64_t)v2, (uint64_t)v154);
  if (v21)
  {
LABEL_19:
    sub_1C2C07340((uint64_t)v154);
    goto LABEL_20;
  }
  sub_1C2C15B58((uint64_t)&v156, (uint64_t)v151);
  if (v152)
  {
    __swift_project_boxed_opaque_existential_1(v151, v152);
    unsigned int v22 = sub_1C2C26488();
    sub_1C2C07340((uint64_t)v154);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v151);
    goto LABEL_21;
  }
  sub_1C2C07340((uint64_t)v154);
  sub_1C2BF9534((uint64_t)v151, &qword_1EB6817F0);
LABEL_20:
  unsigned int v22 = 0;
LABEL_21:
  if (sub_1C2C26EA8())
  {
    if (((v135 | v22) & 1) == 0)
    {
LABEL_23:
      __swift_project_boxed_opaque_existential_1(v2 + 53, v2[56]);
      sub_1C2C26738();
      __swift_project_boxed_opaque_existential_1(v2 + 58, v2[61]);
      sub_1C2C26738();
      sub_1C2BF7C98((uint64_t)(v2 + 53), (uint64_t)v151);
      sub_1C2BF7C98((uint64_t)(v2 + 58), (uint64_t)&v148);
      sub_1C2BF7C98((uint64_t)(v2 + 8), (uint64_t)&v145);
      sub_1C2BF7C98((uint64_t)(v2 + 18), (uint64_t)v144);
      sub_1C2BF7C98((uint64_t)(v2 + 18), (uint64_t)&v143);
      uint64_t v23 = sub_1C2C26D18();
      uint64_t v24 = MEMORY[0x1E4F71D28];
      a1[3] = v23;
      a1[4] = v24;
      a1[5] = MEMORY[0x1E4F71D30];
      __swift_allocate_boxed_opaque_existential_1(a1);
      return sub_1C2C26D08();
    }
  }
  else if (!(v135 & 1 | ((sub_1C2C26EC8() & 1) == 0) | v22 & 1))
  {
    goto LABEL_23;
  }
  unsigned int v123 = v22;
  id v107 = a1;
  __swift_project_boxed_opaque_existential_1(v2 + 53, v2[56]);
  sub_1C2C26758();
  uint64_t v26 = v2[56];
  uint64_t v122 = v2 + 53;
  __swift_project_boxed_opaque_existential_1(v2 + 53, v26);
  sub_1C2C26738();
  __swift_project_boxed_opaque_existential_1(v2 + 58, v2[61]);
  sub_1C2C26758();
  uint64_t v27 = v2[61];
  id v106 = v2 + 58;
  __swift_project_boxed_opaque_existential_1(v2 + 58, v27);
  sub_1C2C26738();
  sub_1C2C269E8();
  sub_1C2C15B58((uint64_t)(v2 + 48), (uint64_t)&v148);
  double v28 = (unsigned int *)MEMORY[0x1E4F71B40];
  uint64_t v108 = v2;
  if (v149)
  {
    sub_1C2BF8100(&v148, (uint64_t)v151);
    uint64_t v29 = v152;
    uint64_t v30 = v153;
    double v31 = __swift_project_boxed_opaque_existential_1(v151, v152);
    uint64_t v149 = v29;
    uint64_t v150 = *(void *)(v30 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v148);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v29 - 8) + 16))(boxed_opaque_existential_1, v31, v29);
    uint64_t v121 = v2 + 3;
    uint64_t v147 = 0;
    long long v145 = 0u;
    long long v146 = 0u;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681158);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_1C2C2FF90;
    sub_1C2C269B8();
    sub_1C2C269A8();
    v144[0] = v33;
    sub_1C2C15BC0((unint64_t *)&qword_1EB681140, MEMORY[0x1E4F71B28]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681148);
    sub_1C2C15C08((unint64_t *)&qword_1EB681150, &qword_1EB681148);
    double v34 = v132;
    uint64_t v35 = v130;
    sub_1C2C26F58();
    uint64_t v36 = v142;
    double v37 = v139;
    uint64_t v38 = v140;
    (*(void (**)(char *, void, uint64_t))(v142 + 104))(v139, *MEMORY[0x1E4F71B18], v140);
    uint64_t v39 = *v28;
    uint64_t v40 = v131;
    double v41 = v133;
    uint64_t v42 = v136;
    (*(void (**)(char *, uint64_t, uint64_t))(v131 + 104))(v133, v39, v136);
    double v43 = v129;
    sub_1C2C269F8();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v42);
    double v44 = *(void (**)(char *, uint64_t))(v36 + 8);
    uint64_t v45 = v38;
    uint64_t v46 = v36;
    uint64_t v47 = (unsigned int *)MEMORY[0x1E4F71B18];
    v44(v37, v45);
    uint64_t v48 = v141;
    double v49 = v34;
    uint64_t v2 = v108;
    (*(void (**)(char *, uint64_t))(v141 + 8))(v49, v35);
    sub_1C2BF9534((uint64_t)&v145, &qword_1EB681138);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v148);
    sub_1C2C26A18();
    (*(void (**)(char *, uint64_t))(v134 + 8))(v43, v137);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v151);
  }
  else
  {
    sub_1C2BF9534((uint64_t)&v148, &qword_1EB6817F0);
    double v41 = v133;
    uint64_t v48 = v141;
    uint64_t v46 = v142;
    uint64_t v47 = (unsigned int *)MEMORY[0x1E4F71B18];
    uint64_t v40 = v131;
  }
  uint64_t v50 = v2[56];
  uint64_t v51 = v2[57];
  double v52 = __swift_project_boxed_opaque_existential_1(v122, v50);
  uint64_t v152 = v50;
  uint64_t v153 = *(void *)(v51 + 8);
  double v53 = __swift_allocate_boxed_opaque_existential_1(v151);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v50 - 8) + 16))(v53, v52, v50);
  uint64_t v54 = 8;
  if (v123) {
    uint64_t v54 = 13;
  }
  int v105 = v123 | v135;
  sub_1C2BF7C98((uint64_t)&v2[v54], (uint64_t)&v148);
  uint64_t v147 = 0;
  long long v145 = 0u;
  long long v146 = 0u;
  unsigned int v123 = *v47;
  uint64_t v55 = *(void **)(v46 + 104);
  uint64_t v135 = v46 + 104;
  uint64_t v122 = v55;
  ((void (*)(char *))v55)(v139);
  unsigned int v120 = *MEMORY[0x1E4F71B40];
  uint64_t v56 = *(void (**)(void))(v40 + 104);
  uint64_t v121 = (void *)(v40 + 104);
  id v119 = (void (*)(char *, void, uint64_t))v56;
  v56(v41);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681158);
  uint64_t v58 = *(unsigned __int8 *)(v48 + 80);
  uint64_t v102 = *(void *)(v48 + 72);
  uint64_t v104 = ((v58 + 32) & ~v58) + v102;
  uint64_t v117 = v57;
  uint64_t v118 = (v58 + 32) & ~v58;
  uint64_t v116 = v58 | 7;
  uint64_t v59 = swift_allocObject();
  long long v103 = xmmword_1C2C2F760;
  *(_OWORD *)(v59 + 16) = xmmword_1C2C2F760;
  sub_1C2C26998();
  v144[0] = v59;
  uint64_t v114 = sub_1C2C15BC0((unint64_t *)&qword_1EB681140, MEMORY[0x1E4F71B28]);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681148);
  uint64_t v111 = sub_1C2C15C08((unint64_t *)&qword_1EB681150, &qword_1EB681148);
  id v60 = v132;
  uint64_t v61 = v130;
  sub_1C2C26F58();
  uint64_t v62 = v124;
  CGRect v63 = v139;
  sub_1C2C269F8();
  unint64_t v115 = *(void (**)(char *, uint64_t))(v48 + 8);
  uint64_t v141 = v48 + 8;
  v115(v60, v61);
  CGRect v65 = *(void (**)(char *, uint64_t))(v40 + 8);
  uint64_t v64 = v40 + 8;
  uint64_t v112 = v65;
  uint64_t v66 = v136;
  v65(v41, v136);
  CGRect v67 = *(void (**)(char *, uint64_t))(v142 + 8);
  v142 += 8;
  uint64_t v110 = v67;
  v67(v63, v140);
  sub_1C2BF9534((uint64_t)&v145, &qword_1EB681138);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v148);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v151);
  sub_1C2C26A18();
  uint64_t v68 = v134 + 8;
  uint64_t v109 = *(void (**)(char *, uint64_t))(v134 + 8);
  v109(v62, v137);
  uint64_t v69 = v2[61];
  uint64_t v70 = v2[62];
  uint64_t v71 = __swift_project_boxed_opaque_existential_1(v106, v69);
  uint64_t v152 = v69;
  uint64_t v72 = *(void *)(v70 + 8);
  uint64_t v73 = v66;
  uint64_t v74 = v133;
  uint64_t v153 = v72;
  double v75 = __swift_allocate_boxed_opaque_existential_1(v151);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v69 - 8) + 16))(v75, v71, v69);
  uint64_t v76 = 18;
  if (v105) {
    uint64_t v76 = 23;
  }
  sub_1C2BF7C98((uint64_t)&v2[v76], (uint64_t)&v148);
  uint64_t v147 = 0;
  long long v145 = 0u;
  long long v146 = 0u;
  uint64_t v77 = swift_allocObject();
  *(_OWORD *)(v77 + 16) = v103;
  sub_1C2C269B8();
  v144[0] = v77;
  double v78 = v132;
  sub_1C2C26F58();
  uint64_t v79 = v139;
  uint64_t v80 = v140;
  ((void (*)(char *, void, uint64_t))v122)(v139, v123, v140);
  v119(v74, v120, v66);
  uint64_t v81 = v126;
  sub_1C2C269F8();
  uint64_t v131 = v64;
  v112(v74, v73);
  CGRect v82 = v79;
  v110(v79, v80);
  v115(v78, v61);
  sub_1C2BF9534((uint64_t)&v145, &qword_1EB681138);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v148);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v151);
  CGRect v83 = v138;
  sub_1C2C26A18();
  v109(v81, v137);
  sub_1C2C15B58(v125, (uint64_t)&v148);
  uint64_t v84 = v80;
  CGRect v85 = v83;
  if (v149)
  {
    sub_1C2BF8100(&v148, (uint64_t)v151);
    uint64_t v86 = v152;
    uint64_t v134 = v68;
    uint64_t v87 = v82;
    uint64_t v88 = v153;
    uint64_t v89 = v85;
    uint64_t v90 = __swift_project_boxed_opaque_existential_1(v151, v152);
    uint64_t v149 = v86;
    uint64_t v150 = *(void *)(v88 + 8);
    id v91 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v148);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v86 - 8) + 16))(v91, v90, v86);
    uint64_t v147 = 0;
    long long v145 = 0u;
    long long v146 = 0u;
    uint64_t v92 = swift_allocObject();
    *(_OWORD *)(v92 + 16) = xmmword_1C2C2FF90;
    sub_1C2C269B8();
    sub_1C2C269A8();
    v144[0] = v92;
    uint64_t v93 = v130;
    sub_1C2C26F58();
    ((void (*)(char *, void, uint64_t))v122)(v82, v123, v84);
    long long v94 = v133;
    uint64_t v95 = v136;
    v119(v133, v120, v136);
    uint64_t v96 = v129;
    sub_1C2C269F8();
    v112(v94, v95);
    v110(v87, v84);
    v115(v78, v93);
    sub_1C2BF9534((uint64_t)&v145, &qword_1EB681138);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v148);
    sub_1C2C26A18();
    v109(v96, v137);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v151);
  }
  else
  {
    sub_1C2BF9534((uint64_t)&v148, &qword_1EB6817F0);
    uint64_t v89 = v83;
  }
  uint64_t v97 = MEMORY[0x1E4F71B58];
  uint64_t v98 = v107;
  uint64_t v99 = v128;
  v107[3] = v128;
  v98[4] = v97;
  v98[5] = MEMORY[0x1E4F71B60];
  long long v100 = __swift_allocate_boxed_opaque_existential_1(v98);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v127 + 32))(v100, v89, v99);
}

uint64_t sub_1C2C13B94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v88 = a2;
  uint64_t v82 = sub_1C2C26B88();
  uint64_t v79 = *(void *)(v82 - 8);
  MEMORY[0x1F4188790](v82);
  uint64_t v81 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  double v78 = (char *)&v61 - v6;
  uint64_t v83 = sub_1C2C26BB8();
  uint64_t v80 = *(void *)(v83 - 8);
  MEMORY[0x1F4188790](v83);
  uint64_t v77 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C2C26A58();
  uint64_t v71 = *(void *)(v8 - 8);
  uint64_t v72 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v73 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C2C26A68();
  uint64_t v75 = *(void *)(v10 - 8);
  uint64_t v76 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v74 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C2C26A78();
  uint64_t v69 = *(void *)(v12 - 8);
  uint64_t v70 = v12;
  MEMORY[0x1F4188790](v12);
  CGRect v67 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1C2C26A98();
  uint64_t v66 = *(void *)(v68 - 8);
  MEMORY[0x1F4188790](v68);
  CGRect v65 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_1C2C26AB8();
  uint64_t v61 = *(void *)(v63 - 8);
  MEMORY[0x1F4188790](v63);
  uint64_t v84 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1C2C26AD8();
  uint64_t v86 = *(void *)(v16 - 8);
  *(void *)&long long v87 = v16;
  MEMORY[0x1F4188790](v16);
  CGRect v85 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1C2C26B58();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  char v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v61 - v23;
  uint64_t v64 = sub_1C2C26B78();
  uint64_t v62 = *(void *)(v64 - 8);
  *(void *)&double v25 = MEMORY[0x1F4188790](v64).n128_u64[0];
  uint64_t v27 = (char *)&v61 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v28 = objc_msgSend(a1, sel_traitCollection, v25);
  uint64_t v89 = v2;
  sub_1C2C12AA4(v101);

  uint64_t v90 = a1;
  id v29 = objc_msgSend(a1, sel_traitCollection);
  LOBYTE(v28) = sub_1C2C26EC8();

  if (v28)
  {
    long long v87 = v102;
    uint64_t v30 = v102;
    double v31 = __swift_project_boxed_opaque_existential_1(v101, v102);
    long long v99 = v87;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v98);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(boxed_opaque_existential_1, v31, v30);
    uint64_t v33 = v89;
    sub_1C2BF7C98(v89 + 344, (uint64_t)v97);
    uint64_t v34 = *(void *)(v33 + 16);
    uint64_t v95 = MEMORY[0x1E4FBC958];
    uint64_t v96 = MEMORY[0x1E4F71988];
    v94[0] = v34;
    sub_1C2BF7C98(v33 + 544, (uint64_t)v92);
    sub_1C2BF7C98(v33 + 264, (uint64_t)v91);
    uint64_t v35 = *MEMORY[0x1E4F71BE8];
    uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 104);
    v36(v24, v35, v18);
    v36(v21, v35, v18);
    sub_1C2C26B68();
    sub_1C2C26B48();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v27, v64);
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v61 + 104))(v84, *MEMORY[0x1E4F71BC0], v63);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA331580);
    uint64_t v37 = *(void *)(sub_1C2C26AA8() - 8);
    unint64_t v38 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    uint64_t v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = xmmword_1C2C2F760;
    uint64_t v64 = v39 + v38;
    uint64_t v40 = v65;
    uint64_t v41 = v66;
    uint64_t v42 = v68;
    (*(void (**)(char *, void, uint64_t))(v66 + 104))(v65, *MEMORY[0x1E4F71B98], v68);
    v98[0] = MEMORY[0x1E4FBC860];
    sub_1C2C15BC0(&qword_1EA331588, MEMORY[0x1E4F71B88]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA331590);
    sub_1C2C15C08(&qword_1EA331598, &qword_1EA331590);
    double v43 = v67;
    uint64_t v44 = v70;
    sub_1C2C26F58();
    sub_1C2C26A88();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v43, v44);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v42);
    uint64_t v45 = sub_1C2C26718();
    uint64_t v46 = MEMORY[0x1E4F71A48];
    *(void *)&long long v99 = v45;
    *((void *)&v99 + 1) = MEMORY[0x1E4F71A48];
    __swift_allocate_boxed_opaque_existential_1(v98);
    sub_1C2C26708();
    uint64_t v47 = v85;
    sub_1C2C26AC8();
    uint64_t v48 = v87;
    *(void *)&long long v99 = v87;
    *((void *)&v99 + 1) = MEMORY[0x1E4F71BC8];
    uint64_t v100 = MEMORY[0x1E4F71BD0];
    double v49 = __swift_allocate_boxed_opaque_existential_1(v98);
    (*(void (**)(uint64_t *, char *, uint64_t))(v86 + 16))(v49, v47, v48);
    sub_1C2BFF010((uint64_t)v101, (uint64_t)v97);
    (*(void (**)(char *, void, uint64_t))(v71 + 104))(v73, *MEMORY[0x1E4F71B78], v72);
    uint64_t v50 = v89;
    sub_1C2BF7C98(v89 + 264, (uint64_t)v94);
    uint64_t v51 = v74;
    sub_1C2C26A48();
    uint64_t v52 = v76;
    *(void *)&long long v99 = v76;
    *((void *)&v99 + 1) = MEMORY[0x1E4F71B80];
    double v53 = __swift_allocate_boxed_opaque_existential_1(v98);
    uint64_t v54 = v75;
    (*(void (**)(uint64_t *, char *, uint64_t))(v75 + 16))(v53, v51, v52);
    sub_1C2BF7C98(v50 + 344, (uint64_t)v97);
    uint64_t v55 = *(void *)(v50 + 16);
    uint64_t v95 = MEMORY[0x1E4FBC958];
    uint64_t v96 = MEMORY[0x1E4F71988];
    v94[0] = v55;
    uint64_t v93 = 0;
    memset(v92, 0, sizeof(v92));
    void v91[3] = v45;
    v91[4] = v46;
    __swift_allocate_boxed_opaque_existential_1(v91);
    sub_1C2C26708();
    uint64_t v56 = *MEMORY[0x1E4F71C18];
    uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t))(v79 + 104);
    uint64_t v58 = v82;
    v57(v78, v56, v82);
    v57(v81, v56, v58);
    uint64_t v59 = v77;
    sub_1C2C26BA8();
    sub_1C2C26B98();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v59, v83);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v51, v52);
    (*(void (**)(char *, void))(v86 + 8))(v85, v87);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v101);
}

double sub_1C2C146B0(void *a1, void *a2, double a3)
{
  swift_getObjectType();

  return sub_1C2C14784(a1, a2, a3);
}

uint64_t sub_1C2C1470C(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  unint64_t v10 = sub_1C2C15C58();
  v11.n128_f64[0] = a4;
  v12.n128_f64[0] = a5;

  return MEMORY[0x1F4129978](a1, a2, v10, a3, v11, v12);
}

uint64_t sub_1C2C14778@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2C07130(v1, a1);
}

double sub_1C2C14784(void *a1, void *a2, double a3)
{
  uint64_t v6 = sub_1C2C26FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)&double v8 = MEMORY[0x1F4188790](v6).n128_u64[0];
  unint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(a2, sel_traitCollection, v8);
  __swift_project_boxed_opaque_existential_1(a1 + 8, a1[11]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  __n128 v12 = *(void (**)(char *, uint64_t))(v7 + 8);
  v12(v10, v6);
  if (sub_1C2C26EA8())
  {
    __swift_project_boxed_opaque_existential_1(a1 + 18, a1[21]);
    sub_1C2C082FC();
    sub_1C2C265D8();
    v12(v10, v6);
  }
  else
  {
    if (sub_1C2C26EC8()) {
      __swift_project_boxed_opaque_existential_1(a1 + 18, a1[21]);
    }
    else {
      __swift_project_boxed_opaque_existential_1(a1 + 23, a1[26]);
    }
    sub_1C2C082FC();
    sub_1C2C265D8();
    v12(v10, v6);
    __swift_project_boxed_opaque_existential_1(a1 + 28, a1[31]);
    sub_1C2C082FC();
    sub_1C2C265D8();
    v12(v10, v6);
  }
  __swift_project_boxed_opaque_existential_1(a1 + 33, a1[36]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  v12(v10, v6);
  __swift_project_boxed_opaque_existential_1(a1 + 38, a1[41]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  v12(v10, v6);
  sub_1C2C26EC8();

  return a3;
}

uint64_t destroy for MediumLockupLayout(uint64_t a1)
{
  if (*(void *)(a1 + 408)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 384);
  }
  __swift_destroy_boxed_opaque_existential_1(a1 + 424);
  __swift_destroy_boxed_opaque_existential_1(a1 + 464);
  if (*(void *)(a1 + 528)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 504);
  }
  return __swift_destroy_boxed_opaque_existential_1(a1 + 544);
}

uint64_t initializeWithCopy for MediumLockupLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 24, a2 + 24);
  long long v5 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 88) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 64, a2 + 64);
  long long v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 104, a2 + 104);
  long long v7 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 168) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 144, a2 + 144);
  long long v8 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 184, a2 + 184);
  long long v9 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 248) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 224, a2 + 224);
  long long v10 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 288) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 264, a2 + 264);
  uint64_t v11 = *(void *)(a2 + 328);
  uint64_t v12 = *(void *)(a2 + 336);
  *(void *)(a1 + 328) = v11;
  *(void *)(a1 + 336) = v12;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 304, a2 + 304);
  long long v13 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 344, a2 + 344);
  uint64_t v14 = (_OWORD *)(a1 + 384);
  uint64_t v15 = (_OWORD *)(a2 + 384);
  uint64_t v16 = *(void *)(a2 + 408);
  if (v16)
  {
    uint64_t v17 = *(void *)(a2 + 416);
    *(void *)(a1 + 408) = v16;
    *(void *)(a1 + 416) = v17;
    (**(void (***)(_OWORD *, _OWORD *))(v16 - 8))(v14, v15);
  }
  else
  {
    long long v18 = *(_OWORD *)(a2 + 400);
    _OWORD *v14 = *v15;
    *(_OWORD *)(a1 + 400) = v18;
    *(void *)(a1 + 416) = *(void *)(a2 + 416);
  }
  long long v19 = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 448) = v19;
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 424, a2 + 424);
  uint64_t v20 = *(void *)(a2 + 488);
  uint64_t v21 = *(void *)(a2 + 496);
  *(void *)(a1 + 488) = v20;
  *(void *)(a1 + 496) = v21;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 464, a2 + 464);
  uint64_t v22 = (_OWORD *)(a1 + 504);
  uint64_t v23 = (_OWORD *)(a2 + 504);
  uint64_t v24 = *(void *)(a2 + 528);
  if (v24)
  {
    *(void *)(a1 + 528) = v24;
    *(void *)(a1 + 536) = *(void *)(a2 + 536);
    (**(void (***)(_OWORD *, _OWORD *))(v24 - 8))(v22, v23);
  }
  else
  {
    long long v25 = *(_OWORD *)(a2 + 520);
    _OWORD *v22 = *v23;
    *(_OWORD *)(a1 + 520) = v25;
    *(void *)(a1 + 536) = *(void *)(a2 + 536);
  }
  uint64_t v26 = *(void *)(a2 + 568);
  *(void *)(a1 + 568) = v26;
  *(void *)(a1 + 576) = *(void *)(a2 + 576);
  (**(void (***)(uint64_t, uint64_t))(v26 - 8))(a1 + 544, a2 + 544);
  return a1;
}

uint64_t assignWithCopy for MediumLockupLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 64), (uint64_t *)(a2 + 64));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 144), (uint64_t *)(a2 + 144));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 184), (uint64_t *)(a2 + 184));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 224), (uint64_t *)(a2 + 224));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 264), (uint64_t *)(a2 + 264));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 304), (uint64_t *)(a2 + 304));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  uint64_t v4 = *(void *)(a2 + 408);
  if (*(void *)(a1 + 408))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 384), (uint64_t *)(a2 + 384));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 384);
  }
  else if (v4)
  {
    *(void *)(a1 + 408) = v4;
    *(void *)(a1 + 416) = *(void *)(a2 + 416);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 384, a2 + 384);
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)(a2 + 384);
  long long v6 = *(_OWORD *)(a2 + 400);
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  *(_OWORD *)(a1 + 384) = v5;
  *(_OWORD *)(a1 + 400) = v6;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 424), (uint64_t *)(a2 + 424));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 464), (uint64_t *)(a2 + 464));
  uint64_t v7 = *(void *)(a2 + 528);
  if (!*(void *)(a1 + 528))
  {
    if (v7)
    {
      *(void *)(a1 + 528) = v7;
      *(void *)(a1 + 536) = *(void *)(a2 + 536);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 504, a2 + 504);
      goto LABEL_15;
    }
LABEL_14:
    long long v8 = *(_OWORD *)(a2 + 504);
    long long v9 = *(_OWORD *)(a2 + 520);
    *(void *)(a1 + 536) = *(void *)(a2 + 536);
    *(_OWORD *)(a1 + 504) = v8;
    *(_OWORD *)(a1 + 520) = v9;
    goto LABEL_15;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 504);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 504), (uint64_t *)(a2 + 504));
LABEL_15:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 544), (uint64_t *)(a2 + 544));
  return a1;
}

void *__swift_memcpy584_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x248uLL);
}

uint64_t assignWithTake for MediumLockupLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  long long v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  long long v5 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v5;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 184);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 224);
  long long v6 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v6;
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 264);
  long long v7 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 280) = v7;
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 304);
  long long v8 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v8;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 344);
  long long v9 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v9;
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  if (*(void *)(a1 + 408)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 384);
  }
  long long v10 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 400) = v10;
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  __swift_destroy_boxed_opaque_existential_1(a1 + 424);
  long long v11 = *(_OWORD *)(a2 + 440);
  *(_OWORD *)(a1 + 424) = *(_OWORD *)(a2 + 424);
  *(_OWORD *)(a1 + 440) = v11;
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  __swift_destroy_boxed_opaque_existential_1(a1 + 464);
  long long v12 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 464) = *(_OWORD *)(a2 + 464);
  *(_OWORD *)(a1 + 480) = v12;
  *(void *)(a1 + 496) = *(void *)(a2 + 496);
  if (*(void *)(a1 + 528)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 504);
  }
  *(void *)(a1 + 536) = *(void *)(a2 + 536);
  long long v13 = *(_OWORD *)(a2 + 520);
  *(_OWORD *)(a1 + 504) = *(_OWORD *)(a2 + 504);
  *(_OWORD *)(a1 + 520) = v13;
  __swift_destroy_boxed_opaque_existential_1(a1 + 544);
  long long v14 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 544) = *(_OWORD *)(a2 + 544);
  *(_OWORD *)(a1 + 560) = v14;
  *(void *)(a1 + 576) = *(void *)(a2 + 576);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediumLockupLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 584)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediumLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 584) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 584) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediumLockupLayout()
{
  return &type metadata for MediumLockupLayout;
}

uint64_t destroy for MediumLockupLayout.Metrics(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 304);
}

uint64_t initializeWithCopy for MediumLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 24, a2 + 24);
  long long v5 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 88) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 64, a2 + 64);
  long long v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 104, a2 + 104);
  long long v7 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 168) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 144, a2 + 144);
  long long v8 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 184, a2 + 184);
  long long v9 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 248) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 224, a2 + 224);
  long long v10 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 288) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 264, a2 + 264);
  uint64_t v11 = *(void *)(a2 + 328);
  uint64_t v12 = *(void *)(a2 + 336);
  *(void *)(a1 + 328) = v11;
  *(void *)(a1 + 336) = v12;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 304, a2 + 304);
  return a1;
}

uint64_t *assignWithCopy for MediumLockupLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  __swift_assign_boxed_opaque_existential_1(a1 + 3, a2 + 3);
  __swift_assign_boxed_opaque_existential_1(a1 + 8, a2 + 8);
  __swift_assign_boxed_opaque_existential_1(a1 + 13, a2 + 13);
  __swift_assign_boxed_opaque_existential_1(a1 + 18, a2 + 18);
  __swift_assign_boxed_opaque_existential_1(a1 + 23, a2 + 23);
  __swift_assign_boxed_opaque_existential_1(a1 + 28, a2 + 28);
  __swift_assign_boxed_opaque_existential_1(a1 + 33, a2 + 33);
  __swift_assign_boxed_opaque_existential_1(a1 + 38, a2 + 38);
  return a1;
}

void *__swift_memcpy344_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x158uLL);
}

uint64_t assignWithTake for MediumLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  long long v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  long long v5 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v5;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 184);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 224);
  long long v6 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v6;
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 264);
  long long v7 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 280) = v7;
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 304);
  long long v8 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v8;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediumLockupLayout.Metrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 344)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediumLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 344) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 344) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediumLockupLayout.Metrics()
{
  return &type metadata for MediumLockupLayout.Metrics;
}

unint64_t sub_1C2C15B04()
{
  unint64_t result = qword_1EA331578;
  if (!qword_1EA331578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331578);
  }
  return result;
}

uint64_t sub_1C2C15B58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6817F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2C15BC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C2C15C08(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C2C15C58()
{
  unint64_t result = qword_1EA3315A0;
  if (!qword_1EA3315A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3315A0);
  }
  return result;
}

uint64_t sub_1C2C15CAC@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2 = v1;
  uint64_t v93 = a1;
  uint64_t v104 = sub_1C2C266F8();
  uint64_t v108 = *(void *)(v104 - 8);
  MEMORY[0x1F4188790](v104);
  int v105 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v89 = (char *)&v76 - v5;
  MEMORY[0x1F4188790](v6);
  uint64_t v90 = (char *)&v76 - v7;
  MEMORY[0x1F4188790](v8);
  long long v102 = (char *)&v76 - v9;
  MEMORY[0x1F4188790](v10);
  long long v103 = (char *)&v76 - v11;
  uint64_t v99 = sub_1C2C26CA8();
  uint64_t v107 = *(void *)(v99 - 8);
  MEMORY[0x1F4188790](v99);
  uint64_t v98 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v97 = (char *)&v76 - v14;
  MEMORY[0x1F4188790](v15);
  uint64_t v96 = (char *)&v76 - v16;
  MEMORY[0x1F4188790](v17);
  long long v19 = (uint64_t *)((char *)&v76 - v18);
  uint64_t v20 = sub_1C2C26C18();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v101 = (char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1C2C267F8();
  uint64_t v109 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  uint64_t v80 = (uint64_t *)((char *)&v76 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v25);
  uint64_t v27 = (char *)&v76 - v26;
  uint64_t v87 = sub_1C2C26C28();
  MEMORY[0x1F4188790](v87);
  uint64_t v86 = (char *)&v76 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1C2C26CE8();
  uint64_t v91 = *(void *)(v29 - 8);
  uint64_t v92 = v29;
  MEMORY[0x1F4188790](v29);
  id v106 = (char *)&v76 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2C267D8();
  uint64_t v88 = v1 + 37;
  sub_1C2BF7C98((uint64_t)(v1 + 37), (uint64_t)v115);
  sub_1C2C16A2C((uint64_t)v1, (uint64_t)v111);
  uint64_t v31 = swift_allocObject();
  memcpy((void *)(v31 + 16), v111, 0x151uLL);
  uint64_t v113 = v23;
  uint64_t v114 = MEMORY[0x1E4F71AC8];
  uint64_t v94 = v23;
  __swift_allocate_boxed_opaque_existential_1(v112);
  uint64_t v100 = v27;
  sub_1C2C267E8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v115);
  uint64_t v95 = *(void (**)(char *, uint64_t))(v109 + 8);
  v109 += 8;
  v95(v27, v23);
  sub_1C2C26C48();
  uint64_t v83 = sub_1C2C26C68();
  uint64_t v116 = v83;
  uint64_t v117 = MEMORY[0x1E4F71CA0];
  __swift_allocate_boxed_opaque_existential_1(v115);
  sub_1C2C26C78();
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v101, *MEMORY[0x1E4F71C80], v20);
  sub_1C2C267D8();
  CGRect v85 = v1 + 22;
  sub_1C2BF7C98((uint64_t)(v1 + 22), (uint64_t)v111);
  uint64_t v32 = *v1;
  uint64_t v33 = MEMORY[0x1E4FBC958];
  uint64_t v34 = MEMORY[0x1E4F71988];
  v19[3] = MEMORY[0x1E4FBC958];
  v19[4] = v34;
  *long long v19 = v32;
  uint64_t v35 = *MEMORY[0x1E4F71CB0];
  uint64_t v36 = *(void (**)(void))(v107 + 104);
  double v78 = v36;
  v107 += 104;
  unsigned int v81 = v35;
  uint64_t v37 = v99;
  ((void (*)(void *, uint64_t, uint64_t))v36)(v19, v35, v99);
  uint64_t v38 = v1[1];
  uint64_t v39 = v96;
  *((void *)v96 + 3) = v33;
  v39[4] = v34;
  void *v39 = v38;
  v36();
  unsigned int v82 = *MEMORY[0x1E4F71CB8];
  uint64_t v40 = v82;
  ((void (*)(char *, void, uint64_t))v36)(v97, v82, v37);
  ((void (*)(char *, uint64_t, uint64_t))v36)(v98, v40, v37);
  uint64_t v84 = sub_1C2C26CB8();
  uint64_t v113 = v84;
  uint64_t v114 = MEMORY[0x1E4F71CC8];
  __swift_allocate_boxed_opaque_existential_1(v112);
  sub_1C2C26CC8();
  sub_1C2C16A2C((uint64_t)v1, (uint64_t)v111);
  uint64_t v41 = swift_allocObject();
  memcpy((void *)(v41 + 16), v111, 0x151uLL);
  uint64_t v42 = (uint64_t)v80;
  sub_1C2C267E8();
  swift_release();
  v95((char *)v42, v94);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
  double v43 = v102;
  sub_1C2C266D8();
  uint64_t v80 = v2 + 27;
  sub_1C2BF7C98((uint64_t)(v2 + 27), (uint64_t)v112);
  sub_1C2C16A2C((uint64_t)v2, (uint64_t)v111);
  uint64_t v44 = swift_allocObject();
  memcpy((void *)(v44 + 16), v111, 0x151uLL);
  uint64_t v45 = v103;
  sub_1C2C266E8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
  uint64_t v47 = v108 + 8;
  uint64_t v46 = *(void (**)(char *, uint64_t))(v108 + 8);
  uint64_t v48 = v43;
  uint64_t v49 = v104;
  v46(v48, v104);
  uint64_t v77 = v46;
  uint64_t v108 = v47;
  uint64_t v79 = v2 + 32;
  sub_1C2BF7C98((uint64_t)(v2 + 32), (uint64_t)v112);
  sub_1C2C16A2C((uint64_t)v2, (uint64_t)v111);
  uint64_t v50 = swift_allocObject();
  memcpy((void *)(v50 + 16), v111, 0x151uLL);
  v110[3] = v49;
  v110[4] = MEMORY[0x1E4F71A38];
  __swift_allocate_boxed_opaque_existential_1(v110);
  sub_1C2C266E8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
  v46(v45, v49);
  uint64_t v51 = v94;
  uint64_t v113 = v94;
  uint64_t v114 = MEMORY[0x1E4F71AC8];
  __swift_allocate_boxed_opaque_existential_1(v112);
  uint64_t v52 = v100;
  sub_1C2C267E8();
  v95(v52, v51);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
  sub_1C2C26C58();
  v111[3] = v83;
  v111[4] = MEMORY[0x1E4F71CA0];
  __swift_allocate_boxed_opaque_existential_1(v111);
  sub_1C2C26C78();
  double v53 = v86;
  sub_1C2C26C38();
  uint64_t v54 = sub_1C2C16D4C(&qword_1EA3315B0, MEMORY[0x1E4F71C98]);
  MEMORY[0x1C8768470](v53, v87, v54);
  sub_1C2C266D8();
  sub_1C2BF7C98((uint64_t)v85, (uint64_t)v111);
  uint64_t v55 = *v2;
  uint64_t v56 = MEMORY[0x1E4FBC958];
  v19[3] = MEMORY[0x1E4FBC958];
  uint64_t v57 = MEMORY[0x1E4F71988];
  v19[4] = MEMORY[0x1E4F71988];
  *long long v19 = v55;
  uint64_t v58 = v99;
  uint64_t v59 = v78;
  ((void (*)(void *, void, uint64_t))v78)(v19, v81, v99);
  uint64_t v60 = v2[1];
  uint64_t v61 = v96;
  *((void *)v96 + 3) = v56;
  v61[4] = v57;
  void *v61 = v60;
  v59();
  uint64_t v62 = v82;
  ((void (*)(char *, void, uint64_t))v59)(v97, v82, v58);
  ((void (*)(char *, uint64_t, uint64_t))v59)(v98, v62, v58);
  uint64_t v116 = v84;
  uint64_t v117 = MEMORY[0x1E4F71CC8];
  __swift_allocate_boxed_opaque_existential_1(v115);
  sub_1C2C26CC8();
  sub_1C2C16A2C((uint64_t)v2, (uint64_t)v111);
  uint64_t v63 = swift_allocObject();
  memcpy((void *)(v63 + 16), v111, 0x151uLL);
  uint64_t v64 = v89;
  CGRect v65 = v105;
  sub_1C2C266E8();
  swift_release();
  uint64_t v66 = v104;
  CGRect v67 = v77;
  v77(v65, v104);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v115);
  sub_1C2BF7C98((uint64_t)v80, (uint64_t)v115);
  sub_1C2C16A2C((uint64_t)v2, (uint64_t)v111);
  uint64_t v68 = swift_allocObject();
  memcpy((void *)(v68 + 16), v111, 0x151uLL);
  uint64_t v69 = v90;
  sub_1C2C266E8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v115);
  v67(v64, v66);
  sub_1C2BF7C98((uint64_t)v79, (uint64_t)v115);
  sub_1C2C16A2C((uint64_t)v2, (uint64_t)v111);
  uint64_t v70 = swift_allocObject();
  memcpy((void *)(v70 + 16), v111, 0x151uLL);
  uint64_t v71 = v102;
  sub_1C2C266E8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v115);
  v67(v69, v66);
  sub_1C2BF7C98((uint64_t)v88, (uint64_t)v115);
  sub_1C2C16A2C((uint64_t)v2, (uint64_t)v111);
  uint64_t v72 = swift_allocObject();
  memcpy((void *)(v72 + 16), v111, 0x151uLL);
  uint64_t v73 = v103;
  sub_1C2C266E8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v115);
  v67(v71, v66);
  sub_1C2C16D4C(&qword_1EA3315B8, MEMORY[0x1E4F71A40]);
  uint64_t v74 = v106;
  sub_1C2C26CD8();
  v67(v73, v66);
  return (*(uint64_t (**)(char *, uint64_t))(v91 + 8))(v74, v92);
}

uint64_t sub_1C2C169E8(uint64_t a1, uint64_t a2)
{
  sub_1C2BF7C98(a2 + 136, (uint64_t)v3);
  sub_1C2C267A8();
  return sub_1C2C267C8();
}

uint64_t sub_1C2C16A2C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2C16A68(uint64_t a1)
{
  return sub_1C2C169E8(a1, v1 + 16);
}

uint64_t sub_1C2C16A70()
{
  return sub_1C2C267C8();
}

uint64_t sub_1C2C16A98(uint64_t a1, uint64_t a2)
{
  sub_1C2C267C8();
  sub_1C2BF7C98(a2 + 16, (uint64_t)v4);
  return sub_1C2C267B8();
}

uint64_t sub_1C2C16AE4(uint64_t a1)
{
  return sub_1C2C16A98(a1, v1 + 16);
}

uint64_t sub_1C2C16AEC()
{
  if (qword_1EA330858 != -1) {
    swift_once();
  }
  return sub_1C2C266A8();
}

uint64_t sub_1C2C16B50(uint64_t a1, uint64_t a2)
{
  sub_1C2BF7C98(a2 + 96, (uint64_t)v3);
  sub_1C2C26688();
  return sub_1C2C26678();
}

uint64_t sub_1C2C16B9C(uint64_t a1)
{
  return sub_1C2C16B50(a1, v1 + 16);
}

uint64_t sub_1C2C16BA4()
{
  return sub_1C2C266A8();
}

uint64_t sub_1C2C16BD0()
{
  sub_1C2BF7C98(v0 + 32, (uint64_t)v2);
  return sub_1C2C26698();
}

uint64_t sub_1C2C16C14()
{
  sub_1C2BF7C98(v0 + 72, (uint64_t)v2);
  return sub_1C2C26688();
}

uint64_t sub_1C2C16C58()
{
  sub_1C2BF7C98(v0 + 112, (uint64_t)v2);
  return sub_1C2C26688();
}

uint64_t objectdestroyTm()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1(v0 + 192);
  __swift_destroy_boxed_opaque_existential_1(v0 + 232);
  __swift_destroy_boxed_opaque_existential_1(v0 + 272);
  __swift_destroy_boxed_opaque_existential_1(v0 + 312);

  return MEMORY[0x1F4186498](v0, 353, 7);
}

uint64_t sub_1C2C16D0C()
{
  sub_1C2BF7C98(v0 + 152, (uint64_t)v2);
  return sub_1C2C26688();
}

uint64_t sub_1C2C16D4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C2C16D94()
{
  uint64_t result = sub_1C2C266B8();
  qword_1EA3315A8 = result;
  return result;
}

uint64_t destroy for MiniLockupLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 296);
}

uint64_t initializeWithCopy for MiniLockupLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 136, a2 + 136);
  long long v8 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 176, a2 + 176);
  long long v9 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 216, a2 + 216);
  uint64_t v10 = *(void *)(a2 + 280);
  uint64_t v11 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = v10;
  *(void *)(a1 + 288) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 256, a2 + 256);
  long long v12 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 296, a2 + 296);
  *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
  return a1;
}

uint64_t assignWithCopy for MiniLockupLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 136), (uint64_t *)(a2 + 136));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 176), (uint64_t *)(a2 + 176));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 216), (uint64_t *)(a2 + 216));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 256), (uint64_t *)(a2 + 256));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 296), (uint64_t *)(a2 + 296));
  *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
  return a1;
}

void *__swift_memcpy337_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x151uLL);
}

uint64_t assignWithTake for MiniLockupLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  long long v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v6;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  long long v7 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v7;
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  long long v8 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v8;
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
  return a1;
}

uint64_t getEnumTagSinglePayload for MiniLockupLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 337)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MiniLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 328) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 336) = 0;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 337) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 337) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MiniLockupLayout()
{
  return &type metadata for MiniLockupLayout;
}

uint64_t destroy for MiniLockupLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 136);
}

_OWORD *initializeWithCopy for MiniLockupLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  long long v4 = *(_OWORD *)((char *)a2 + 40);
  *(_OWORD *)((char *)a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 1));
  long long v5 = a2[5];
  a1[5] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 56, (uint64_t)a2 + 56);
  long long v6 = *(_OWORD *)((char *)a2 + 120);
  *(_OWORD *)((char *)a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 6), (uint64_t)(a2 + 6));
  long long v7 = a2[10];
  a1[10] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 136, (uint64_t)a2 + 136);
  return a1;
}

uint64_t *assignWithCopy for MiniLockupLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  return a1;
}

__n128 __swift_memcpy176_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

uint64_t assignWithTake for MiniLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  return a1;
}

uint64_t getEnumTagSinglePayload for MiniLockupLayout.Metrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 176)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MiniLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 176) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 176) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MiniLockupLayout.Metrics()
{
  return &type metadata for MiniLockupLayout.Metrics;
}

uint64_t sub_1C2C17710@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2C07750(v1, a1);
}

double sub_1C2C1771C()
{
  uint64_t v0 = sub_1C2C26CE8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2C15CAC((uint64_t)v3);
  sub_1C2C26D98();
  double v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t sub_1C2C17840()
{
  uint64_t v0 = sub_1C2C26CE8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2C15CAC((uint64_t)v3);
  sub_1C2C26D88();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1C2C17954(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1C2C17A20();

  return MEMORY[0x1F41295E0](a1, a2, v4);
}

unint64_t sub_1C2C179B0()
{
  unint64_t result = qword_1EA3315C0;
  if (!qword_1EA3315C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3315C0);
  }
  return result;
}

uint64_t sub_1C2C17A04(uint64_t a1)
{
  return MEMORY[0x1F4186618](a1, &unk_1C2C381CC, 1);
}

unint64_t sub_1C2C17A20()
{
  unint64_t result = qword_1EA3315C8;
  if (!qword_1EA3315C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3315C8);
  }
  return result;
}

uint64_t sub_1C2C17A74()
{
  return MEMORY[0x1E4F71D10];
}

uint64_t destroy for MiniProductPageLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 280);
}

uint64_t initializeWithCopy for MiniProductPageLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  long long v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  long long v9 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 200, a2 + 200);
  uint64_t v10 = *(void *)(a2 + 264);
  uint64_t v11 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = v10;
  *(void *)(a1 + 272) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 240, a2 + 240);
  long long v12 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 304) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 280, a2 + 280);
  return a1;
}

uint64_t *assignWithCopy for MiniProductPageLayout(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  __swift_assign_boxed_opaque_existential_1(a1 + 15, a2 + 15);
  __swift_assign_boxed_opaque_existential_1(a1 + 20, a2 + 20);
  __swift_assign_boxed_opaque_existential_1(a1 + 25, a2 + 25);
  __swift_assign_boxed_opaque_existential_1(a1 + 30, a2 + 30);
  __swift_assign_boxed_opaque_existential_1(a1 + 35, a2 + 35);
  return a1;
}

void *__swift_memcpy320_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x140uLL);
}

uint64_t assignWithTake for MiniProductPageLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  long long v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  long long v8 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v8;
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  long long v9 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v9;
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  return a1;
}

uint64_t getEnumTagSinglePayload for MiniProductPageLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 320)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 104);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MiniProductPageLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 312) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 320) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 104) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 320) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MiniProductPageLayout()
{
  return &type metadata for MiniProductPageLayout;
}

uint64_t sub_1C2C17F80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v111 = a1;
  uint64_t v2 = sub_1C2C26668();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v109 = v2;
  uint64_t v110 = v3;
  MEMORY[0x1F4188790](v2);
  uint64_t v108 = (char *)&v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_1C2C266F8();
  uint64_t v123 = *(void *)(v116 - 8);
  MEMORY[0x1F4188790](v116);
  id v106 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v107 = (char *)&v98 - v7;
  MEMORY[0x1F4188790](v8);
  uint64_t v121 = (char *)&v98 - v9;
  MEMORY[0x1F4188790](v10);
  uint64_t v122 = (char *)&v98 - v11;
  uint64_t v104 = sub_1C2C267F8();
  uint64_t v120 = *(void *)(v104 - 8);
  MEMORY[0x1F4188790](v104);
  long long v103 = (char *)&v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  unint64_t v115 = (char *)&v98 - v14;
  MEMORY[0x1F4188790](v15);
  int v105 = (char *)&v98 - v16;
  uint64_t v17 = sub_1C2C26CA8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v117 = (char *)&v98 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v112 = (uint64_t *)((char *)&v98 - v21);
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (uint64_t *)((char *)&v98 - v23);
  MEMORY[0x1F4188790](v25);
  uint64_t v27 = (uint64_t *)((char *)&v98 - v26);
  uint64_t v118 = (void *)sub_1C2C26CB8();
  long long v102 = (void (*)(char *, uint64_t))*(v118 - 1);
  MEMORY[0x1F4188790](v118);
  uint64_t v113 = (char *)&v98 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_1C2C26CE8();
  uint64_t v127 = *(void *)(v125 - 8);
  MEMORY[0x1F4188790](v125);
  uint64_t v114 = (char *)&v98 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v30);
  id v126 = (char *)&v98 - v31;
  MEMORY[0x1F4188790](v32);
  id v124 = (char *)&v98 - v33;
  uint64_t v101 = (void (*)(char *, uint64_t))(v1 + 10);
  sub_1C2BF7C98((uint64_t)(v1 + 10), (uint64_t)v130);
  uint64_t v34 = *v1;
  id v119 = v1;
  uint64_t v35 = MEMORY[0x1E4FBC958];
  uint64_t v36 = MEMORY[0x1E4F71988];
  void v27[3] = MEMORY[0x1E4FBC958];
  v27[4] = v36;
  uint64_t v37 = v36;
  char *v27 = v34;
  uint64_t v38 = *MEMORY[0x1E4F71CB0];
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 104);
  uint64_t v99 = v17;
  v39((char *)v27, v38, v17);
  uint64_t v40 = v1[1];
  v24[3] = v35;
  v24[4] = v37;
  char *v24 = v40;
  v39((char *)v24, v38, v17);
  uint64_t v41 = *MEMORY[0x1E4F71CB8];
  v39((char *)v112, v41, v17);
  v39(v117, v41, v17);
  uint64_t v42 = v113;
  sub_1C2C26CC8();
  uint64_t v100 = sub_1C2C193C4(&qword_1EA3315D8, MEMORY[0x1E4F71CD0]);
  MEMORY[0x1C8768470](v42, v118, v100);
  sub_1C2BF7C98((uint64_t)v101, (uint64_t)v130);
  uint64_t v43 = (uint64_t)v119;
  uint64_t v44 = v119[2];
  void v27[3] = MEMORY[0x1E4FBC958];
  uint64_t v45 = MEMORY[0x1E4F71988];
  v27[4] = MEMORY[0x1E4F71988];
  char *v27 = v44;
  uint64_t v46 = v99;
  v39((char *)v27, v38, v99);
  uint64_t v47 = *(void *)(v43 + 24);
  v24[3] = MEMORY[0x1E4FBC958];
  v24[4] = v45;
  char *v24 = v47;
  v39((char *)v24, v38, v46);
  v39((char *)v112, v41, v46);
  v39(v117, v41, v46);
  uint64_t v48 = v113;
  sub_1C2C26CC8();
  uint64_t v49 = v124;
  uint64_t v50 = v118;
  uint64_t v51 = v126;
  sub_1C2C26CD8();
  (*((void (**)(char *, void *))v102 + 1))(v48, v50);
  uint64_t v52 = v127;
  double v53 = *(void **)(v127 + 8);
  uint64_t v117 = (char *)(v127 + 8);
  uint64_t v118 = v53;
  uint64_t v54 = v51;
  uint64_t v55 = v125;
  ((void (*)(char *, uint64_t))v53)(v54, v125);
  uint64_t v56 = v103;
  sub_1C2C267D8();
  uint64_t v132 = v55;
  uint64_t v133 = MEMORY[0x1E4F71D10];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v131);
  uint64_t v113 = *(char **)(v52 + 16);
  uint64_t v127 = v52 + 16;
  ((void (*)(uint64_t *, char *, uint64_t))v113)(boxed_opaque_existential_1, v49, v55);
  uint64_t v58 = (uint64_t)v119;
  sub_1C2C08214((uint64_t)v119, (uint64_t)v130);
  uint64_t v59 = swift_allocObject();
  memcpy((void *)(v59 + 16), v130, 0x140uLL);
  sub_1C2C267E8();
  swift_release();
  uint64_t v60 = *(void (**)(char *, uint64_t))(v120 + 8);
  v120 += 8;
  uint64_t v101 = v60;
  uint64_t v61 = v104;
  v60(v56, v104);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v131);
  uint64_t v62 = v121;
  sub_1C2C266D8();
  uint64_t v112 = (void *)(v58 + 120);
  sub_1C2BF7C98(v58 + 120, (uint64_t)v131);
  sub_1C2C08214(v58, (uint64_t)v130);
  uint64_t v63 = swift_allocObject();
  memcpy((void *)(v63 + 16), v130, 0x140uLL);
  uint64_t v64 = v122;
  sub_1C2C266E8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v131);
  uint64_t v65 = v123 + 8;
  uint64_t v66 = *(void (**)(char *, uint64_t))(v123 + 8);
  uint64_t v67 = v116;
  v66(v62, v116);
  uint64_t v68 = v58;
  long long v103 = (char *)(v58 + 160);
  v130[3] = v67;
  v130[4] = MEMORY[0x1E4F71A38];
  __swift_allocate_boxed_opaque_existential_1(v130);
  sub_1C2C266E8();
  v66(v64, v67);
  uint64_t v69 = v105;
  uint64_t v70 = v115;
  sub_1C2C267E8();
  v101(v70, v61);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v130);
  uint64_t v71 = sub_1C2C193C4(&qword_1EA3315E0, MEMORY[0x1E4F71AD0]);
  MEMORY[0x1C8768470](v69, v61, v71);
  uint64_t v72 = v106;
  sub_1C2C266D8();
  uint64_t v73 = v125;
  v130[3] = v125;
  v130[4] = MEMORY[0x1E4F71D10];
  uint64_t v74 = __swift_allocate_boxed_opaque_existential_1(v130);
  ((void (*)(uint64_t *, char *, uint64_t))v113)(v74, v124, v73);
  uint64_t v75 = v107;
  sub_1C2C266E8();
  v66(v72, v67);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v130);
  sub_1C2BF7C98((uint64_t)v112, (uint64_t)v131);
  sub_1C2C08214(v68, (uint64_t)v130);
  uint64_t v76 = swift_allocObject();
  memcpy((void *)(v76 + 16), v130, 0x140uLL);
  uint64_t v77 = v121;
  sub_1C2C266E8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v131);
  v66(v75, v67);
  sub_1C2C266E8();
  v66(v77, v67);
  double v78 = v66;
  sub_1C2C193C4(&qword_1EA3315B8, MEMORY[0x1E4F71A40]);
  uint64_t v79 = v126;
  uint64_t v80 = v114;
  sub_1C2C26CD8();
  v78(v64, v67);
  unsigned int v81 = v80;
  uint64_t v82 = v125;
  ((void (*)(char *, uint64_t))v118)(v81, v125);
  sub_1C2C266D8();
  v130[3] = v82;
  v130[4] = MEMORY[0x1E4F71D10];
  uint64_t v83 = __swift_allocate_boxed_opaque_existential_1(v130);
  ((void (*)(uint64_t *, char *, uint64_t))v113)(v83, v79, v82);
  sub_1C2C266E8();
  uint64_t v84 = v67;
  v78(v72, v67);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v130);
  uint64_t v85 = (uint64_t)v119;
  sub_1C2BF7C98((uint64_t)(v119 + 25), (uint64_t)v131);
  sub_1C2C08214(v85, (uint64_t)v130);
  uint64_t v86 = swift_allocObject();
  memcpy((void *)(v86 + 16), v130, 0x140uLL);
  uint64_t v87 = v121;
  sub_1C2C266E8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v131);
  long long v102 = v78;
  uint64_t v123 = v65;
  v78(v75, v84);
  uint64_t v88 = v108;
  sub_1C2C26648();
  uint64_t v89 = v109;
  uint64_t v132 = v109;
  uint64_t v133 = MEMORY[0x1E4F71A28];
  __swift_allocate_boxed_opaque_existential_1(v131);
  sub_1C2C26658();
  (*(void (**)(char *, uint64_t))(v110 + 8))(v88, v89);
  sub_1C2C08214(v85, (uint64_t)v130);
  uint64_t v90 = swift_allocObject();
  memcpy((void *)(v90 + 16), v130, 0x140uLL);
  sub_1C2C266E8();
  swift_release();
  v78(v87, v84);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v131);
  sub_1C2BF7C98(v85 + 280, (uint64_t)v130);
  MEMORY[0x1C87680B0](0, 1, 0, 1);
  MEMORY[0x1C87680B0](0, 1, 0, 1);
  LOBYTE(v84) = v91;
  LOBYTE(v87) = v92;
  uint64_t v132 = sub_1C2C26D68();
  uint64_t v133 = MEMORY[0x1E4F71D58];
  __swift_allocate_boxed_opaque_existential_1(v131);
  char v129 = v84 & 1;
  char v128 = v87 & 1;
  sub_1C2C26D78();
  sub_1C2C08214(v85, (uint64_t)v130);
  uint64_t v93 = swift_allocObject();
  memcpy((void *)(v93 + 16), v130, 0x140uLL);
  uint64_t v94 = v122;
  sub_1C2C266E8();
  swift_release();
  v102(v94, v116);
  uint64_t v95 = v125;
  uint64_t v96 = (void (*)(char *, uint64_t))v118;
  ((void (*)(char *, uint64_t))v118)(v126, v125);
  v96(v124, v95);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v131);
}

uint64_t sub_1C2C18E3C()
{
  return sub_1C2C267C8();
}

uint64_t sub_1C2C18E64()
{
  uint64_t v0 = sub_1C2C26638();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (uint64_t *)((char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_1C2C26718();
  uint64_t v5 = MEMORY[0x1E4F71A48];
  v3[3] = v4;
  v3[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(v3);
  sub_1C2C26708();
  uint64_t v6 = *MEMORY[0x1E4F71A20];
  uint64_t v7 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v1 + 104);
  v7(v3, v6, v0);
  sub_1C2C26618();
  v3[3] = v4;
  v3[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(v3);
  sub_1C2C26708();
  v7(v3, v6, v0);
  return sub_1C2C26628();
}

__n128 sub_1C2C18FA8@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  __n128 result = *(__n128 *)(v1 + 64);
  *(__n128 *)(a1 + 64) = result;
  return result;
}

double sub_1C2C18FC4()
{
  uint64_t v0 = sub_1C2C266F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2C17F80((uint64_t)v3);
  sub_1C2C26D98();
  double v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t sub_1C2C190E8()
{
  uint64_t v0 = sub_1C2C266F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2C17F80((uint64_t)v3);
  sub_1C2C26D88();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1C2C191FC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1C2C19568();

  return MEMORY[0x1F41295E0](a1, a2, v4);
}

unint64_t sub_1C2C19258()
{
  unint64_t result = qword_1EA3315D0;
  if (!qword_1EA3315D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3315D0);
  }
  return result;
}

uint64_t sub_1C2C192AC(uint64_t a1)
{
  return MEMORY[0x1F4186618](a1, &unk_1C2C3822C, 1);
}

uint64_t sub_1C2C192CC()
{
  return sub_1C2C267B8();
}

uint64_t sub_1C2C19320()
{
  return sub_1C2C26688();
}

uint64_t sub_1C2C19374()
{
  return sub_1C2C26688();
}

uint64_t sub_1C2C193C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C2C19410()
{
  return sub_1C2C26688();
}

uint64_t sub_1C2C19464()
{
  return sub_1C2C26688();
}

uint64_t objectdestroyTm_0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  __swift_destroy_boxed_opaque_existential_1(v0 + 216);
  __swift_destroy_boxed_opaque_existential_1(v0 + 256);
  __swift_destroy_boxed_opaque_existential_1(v0 + 296);

  return MEMORY[0x1F4186498](v0, 336, 7);
}

uint64_t sub_1C2C19518()
{
  return sub_1C2C26688();
}

unint64_t sub_1C2C19568()
{
  unint64_t result = qword_1EA3315E8;
  if (!qword_1EA3315E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3315E8);
  }
  return result;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for MiniProductPageLayout.Metrics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MiniProductPageLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 80) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MiniProductPageLayout.Metrics()
{
  return &type metadata for MiniProductPageLayout.Metrics;
}

uint64_t sub_1C2C19648()
{
  return MEMORY[0x1E4F71A38];
}

Swift::String __swiftcall NSBundle.localizedString(forKey:in:with:)(Swift::String forKey, Swift::String_optional in, Swift::String with)
{
  object = with._object;
  uint64_t countAndFlagsBits = with._countAndFlagsBits;
  v20[1] = in.value._object;
  uint64_t v6 = forKey._object;
  uint64_t v7 = forKey._countAndFlagsBits;
  uint64_t v8 = sub_1C2C26DC8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681818);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1C2C2F760;
  *(void *)(v12 + 32) = countAndFlagsBits;
  *(void *)(v12 + 40) = object;
  id v13 = v3;
  swift_bridgeObjectRetain();
  sub_1C2C26DB8();
  uint64_t v14 = sub_1C2C26DA8();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v16)
  {
    uint64_t v7 = v14;
    uint64_t v6 = v16;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v17 = v7;
  uint64_t v18 = v6;
  result._object = v18;
  result._uint64_t countAndFlagsBits = v17;
  return result;
}

id sub_1C2C197CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = sub_1C2C26DC8();
  uint64_t v6 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2C26E08();
  if (a4) {
    sub_1C2C26E08();
  }
  uint64_t v9 = sub_1C2C26E08();
  uint64_t v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681818);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1C2C2F760;
  *(void *)(v12 + 32) = v9;
  *(void *)(v12 + 40) = v11;
  id v13 = a1;
  swift_bridgeObjectRetain();
  sub_1C2C26DB8();
  sub_1C2C26DA8();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  if (!v15) {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v16 = (void *)sub_1C2C26DD8();
  swift_bridgeObjectRelease();

  return v16;
}

uint64_t sub_1C2C199C0()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 80), *(void *)(v0 + 104));
  sub_1C2C264B8();

  return sub_1C2C26408();
}

uint64_t sub_1C2C19A5C()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 80), *(void *)(v0 + 104));
  return sub_1C2C264E8();
}

uint64_t sub_1C2C19AC4@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2C07554(v1, a1);
}

double sub_1C2C19AD0(void *a1, void *a2, double a3)
{
  uint64_t v6 = sub_1C2C26FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)&double v8 = MEMORY[0x1F4188790](v6).n128_u64[0];
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(a2, sel_traitCollection, v8);
  char v12 = sub_1C2C26EC8();

  if (v12) {
    __swift_project_boxed_opaque_existential_1(a1 + 5, a1[8]);
  }
  else {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  }
  sub_1C2C082FC();
  sub_1C2C265D8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return a3;
}

_OWORD *initializeWithCopy for OfferButtonLockupLayout(_OWORD *a1, _OWORD *a2)
{
  long long v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  long long v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  return a1;
}

uint64_t *assignWithCopy for OfferButtonLockupLayout(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for OfferButtonLockupLayout(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferButtonLockupLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferButtonLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferButtonLockupLayout()
{
  return &type metadata for OfferButtonLockupLayout;
}

uint64_t destroy for OfferButtonLockupLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
}

uint64_t initializeWithCopy for OfferButtonLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for OfferButtonLockupLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t assignWithTake for OfferButtonLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferButtonLockupLayout.Metrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferButtonLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferButtonLockupLayout.Metrics()
{
  return &type metadata for OfferButtonLockupLayout.Metrics;
}

unint64_t sub_1C2C1A120()
{
  unint64_t result = qword_1EA3315F0;
  if (!qword_1EA3315F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3315F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferButtonPlaceholder.Metrics()
{
  return &type metadata for OfferButtonPlaceholder.Metrics;
}

ValueMetadata *type metadata accessor for OfferButtonPlaceholder()
{
  return &type metadata for OfferButtonPlaceholder;
}

double sub_1C2C1A1A4(double a1)
{
  if (sub_1C2C26EC8()) {
    uint64_t v3 = v1 + 40;
  }
  else {
    uint64_t v3 = v1;
  }
  sub_1C2BF7C98(v3, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1C2C265E8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return a1;
}

uint64_t sub_1C2C1A240@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2C07C58(v1, a1);
}

uint64_t initializeWithCopy for OfferDisclosureLayout(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for OfferDisclosureLayout(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for OfferDisclosureLayout(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferDisclosureLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferDisclosureLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferDisclosureLayout()
{
  return &type metadata for OfferDisclosureLayout;
}

uint64_t sub_1C2C1A3C4()
{
  uint64_t v0 = sub_1C2C267F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2C267D8();
  sub_1C2C267E8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_1C2C1A4C0()
{
  uint64_t v0 = sub_1C2C267F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  long long v6 = (char *)&v11 - v5;
  sub_1C2C267D8();
  sub_1C2C267E8();
  long long v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v3, v0);
  sub_1C2C26D98();
  double v9 = v8;
  v7(v6, v0);
  return v9;
}

uint64_t sub_1C2C1A650()
{
  uint64_t v0 = sub_1C2C267F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  long long v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  long long v6 = (char *)&v9 - v5;
  sub_1C2C267D8();
  sub_1C2C267E8();
  long long v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v3, v0);
  sub_1C2C26D88();
  return ((uint64_t (*)(char *, uint64_t))v7)(v6, v0);
}

uint64_t sub_1C2C1A7D0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1C2C1A89C();

  return MEMORY[0x1F41295E0](a1, a2, v4);
}

unint64_t sub_1C2C1A82C()
{
  unint64_t result = qword_1EA3315F8;
  if (!qword_1EA3315F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3315F8);
  }
  return result;
}

uint64_t sub_1C2C1A880(uint64_t a1)
{
  return MEMORY[0x1F4186618](a1, &unk_1C2C382E0, 1);
}

unint64_t sub_1C2C1A89C()
{
  unint64_t result = qword_1EA331600;
  if (!qword_1EA331600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331600);
  }
  return result;
}

uint64_t sub_1C2C1A8F0()
{
  return MEMORY[0x1E4F71AC8];
}

uint64_t sub_1C2C1A8FC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1C2C1A968(v0 + 56);
  sub_1C2C1A968(v0 + 96);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OfferEmptyLayout.Storage()
{
  return self;
}

uint64_t sub_1C2C1A968(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6817E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for OfferEmptyLayout()
{
  return &type metadata for OfferEmptyLayout;
}

uint64_t sub_1C2C1A9D8(uint64_t a1, uint64_t a2)
{
  sub_1C2C26EF8();
  __swift_project_boxed_opaque_existential_1((void *)(a2 + 16), *(void *)(a2 + 40));
  sub_1C2C264B8();
  sub_1C2C1AB4C(a2 + 56, (uint64_t)v4);
  if (v5)
  {
    __swift_project_boxed_opaque_existential_1(v4, v5);
    sub_1C2C264B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    sub_1C2C1A968((uint64_t)v4);
  }
  sub_1C2C1AB4C(a2 + 96, (uint64_t)v4);
  if (v5)
  {
    __swift_project_boxed_opaque_existential_1(v4, v5);
    sub_1C2C264B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    sub_1C2C1A968((uint64_t)v4);
  }
  return sub_1C2C26438();
}

uint64_t sub_1C2C1AB30(uint64_t a1)
{
  return sub_1C2C1A9D8(a1, *v1);
}

double sub_1C2C1AB38()
{
  return *MEMORY[0x1E4F71DC0];
}

uint64_t sub_1C2C1AB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6817E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2C1ABB4()
{
  sub_1C2C08638(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  sub_1C2C1A968(v0 + 112);
  sub_1C2C1A968(v0 + 152);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OfferIconLayout.Storage()
{
  return self;
}

ValueMetadata *type metadata accessor for OfferIconLayout()
{
  return &type metadata for OfferIconLayout;
}

uint64_t destroy for OfferIconLayout.Metrics(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

_OWORD *initializeWithCopy for OfferIconLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  long long v3 = *(_OWORD *)((char *)a2 + 40);
  *(_OWORD *)((char *)a1 + 40) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 1));
  return a1;
}

void *assignWithCopy for OfferIconLayout.Metrics(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for OfferIconLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferIconLayout.Metrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferIconLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferIconLayout.Metrics()
{
  return &type metadata for OfferIconLayout.Metrics;
}

uint64_t sub_1C2C1ADEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C2C26FF8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  long long v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_1C2C0953C(a2 + 16, (uint64_t)v9);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  __swift_project_boxed_opaque_existential_1((void *)(a2 + 72), *(void *)(a2 + 96));
  return sub_1C2C264E8();
}

uint64_t sub_1C2C1AF90@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v12 = sub_1C2C26FF8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v24[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 72), *(void *)(a1 + 96));
  sub_1C2C264E8();
  double v17 = v16;
  v28.origin.CGFloat x = a3;
  v28.origin.CGFloat y = a4;
  v28.size.CGFloat width = a5;
  v28.size.CGFloat height = a6;
  if (v17 < CGRectGetHeight(v28) && *(unsigned char *)(a1 + 192) == 1)
  {
    v29.origin.CGFloat x = a3;
    v29.origin.CGFloat y = a4;
    v29.size.CGFloat width = a5;
    v29.size.CGFloat height = a6;
    CGRectGetMinY(v29);
    sub_1C2C0953C(a1 + 16, (uint64_t)v24);
    __swift_project_boxed_opaque_existential_1(&v25, v27);
    uint64_t v23 = a2;
    sub_1C2C082FC();
    sub_1C2C265D8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
  }
  else
  {
    v30.origin.CGFloat x = a3;
    v30.origin.CGFloat y = a4;
    v30.size.CGFloat width = a5;
    v30.size.CGFloat height = a6;
    CGRectGetMidY(v30);
  }
  CGFloat v18 = a3;
  CGFloat v19 = a4;
  CGFloat v20 = a5;
  CGFloat v21 = a6;
  if (*(unsigned char *)(a1 + 193) == 1) {
    CGRectGetMaxX(*(CGRect *)&v18);
  }
  else {
    CGRectGetMidX(*(CGRect *)&v18);
  }
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 72), *(void *)(a1 + 96));
  sub_1C2C26EF8();
  sub_1C2C264B8();
  sub_1C2C26EF8();
  sub_1C2C1AB4C(a1 + 112, (uint64_t)v24);
  if (v26)
  {
    __swift_project_boxed_opaque_existential_1(v24, v26);
    sub_1C2C264B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  }
  else
  {
    sub_1C2C1A968((uint64_t)v24);
  }
  sub_1C2C1AB4C(a1 + 152, (uint64_t)v24);
  if (v26)
  {
    __swift_project_boxed_opaque_existential_1(v24, v26);
    sub_1C2C264B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  }
  else
  {
    sub_1C2C1A968((uint64_t)v24);
  }
  return sub_1C2C26408();
}

uint64_t sub_1C2C1B32C@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  return sub_1C2C1AF90(*v5, a1, a2, a3, a4, a5);
}

uint64_t sub_1C2C1B334(uint64_t a1)
{
  return sub_1C2C1ADEC(a1, *v1);
}

uint64_t sub_1C2C1B354@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2C0953C(*v1 + 16, a1);
}

BOOL sub_1C2C1B364(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1C2C1B37C()
{
  return sub_1C2C27048();
}

uint64_t sub_1C2C1B3C4()
{
  return sub_1C2C27038();
}

uint64_t sub_1C2C1B3F0()
{
  return sub_1C2C27048();
}

uint64_t sub_1C2C1B434()
{
  sub_1C2C07B1C(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 256);
  __swift_destroy_boxed_opaque_existential_1(v0 + 296);
  sub_1C2C1C9E0(v0 + 336);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OfferTextLayout.Storage()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OfferTextLayout.BackgroundContentMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OfferTextLayout.BackgroundContentMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    void *result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1C2C1B610);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1C2C1B638(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C2C1B640(unsigned char *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OfferTextLayout.BackgroundContentMode()
{
  return &type metadata for OfferTextLayout.BackgroundContentMode;
}

ValueMetadata *type metadata accessor for OfferTextLayout()
{
  return &type metadata for OfferTextLayout;
}

uint64_t destroy for OfferTextLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 200);
}

_OWORD *initializeWithCopy for OfferTextLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  long long v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  long long v7 = a2[9];
  a1[9] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 120, (uint64_t)a2 + 120);
  long long v8 = *(_OWORD *)((char *)a2 + 184);
  *(_OWORD *)((char *)a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)(a1 + 10), (uint64_t)(a2 + 10));
  long long v9 = a2[14];
  a1[14] = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)a1 + 200, (uint64_t)a2 + 200);
  return a1;
}

uint64_t *assignWithCopy for OfferTextLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  __swift_assign_boxed_opaque_existential_1(a1 + 15, a2 + 15);
  __swift_assign_boxed_opaque_existential_1(a1 + 20, a2 + 20);
  __swift_assign_boxed_opaque_existential_1(a1 + 25, a2 + 25);
  return a1;
}

__n128 __swift_memcpy240_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  long long v7 = a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  __n128 result = (__n128)a2[11];
  long long v11 = a2[12];
  long long v12 = a2[14];
  *(_OWORD *)(a1 + 208) = a2[13];
  *(_OWORD *)(a1 + 224) = v12;
  *(__n128 *)(a1 + 176) = result;
  *(_OWORD *)(a1 + 192) = v11;
  return result;
}

uint64_t assignWithTake for OfferTextLayout.Metrics(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  long long v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferTextLayout.Metrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 240)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 104);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferTextLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 232) = 0;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 240) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 104) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 240) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferTextLayout.Metrics()
{
  return &type metadata for OfferTextLayout.Metrics;
}

void *sub_1C2C1BA94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C2C26FF8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  long long v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(a2 + 216), *(void *)(a2 + 240));
  sub_1C2C082FC();
  sub_1C2C265D8();
  v13[1] = v7;
  long long v8 = *(void (**)(char *, uint64_t))(v4 + 8);
  v8(v6, v3);
  __swift_project_boxed_opaque_existential_1((void *)(a2 + 296), *(void *)(a2 + 320));
  sub_1C2C264E8();
  sub_1C2C15B58(a2 + 336, (uint64_t)&v14);
  if (!v15) {
    return (void *)sub_1C2C1C9E0((uint64_t)&v14);
  }
  sub_1C2BF8100(&v14, (uint64_t)v16);
  __swift_project_boxed_opaque_existential_1(v16, v17);
  if ((sub_1C2C26488() & 1) == 0) {
    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  if (*(unsigned char *)(a2 + 376) == 1)
  {
    __swift_project_boxed_opaque_existential_1((void *)(a2 + 176), *(void *)(a2 + 200));
    sub_1C2C082FC();
    sub_1C2C265D8();
    v8(v6, v3);
    __swift_project_boxed_opaque_existential_1(v16, v17);
    sub_1C2C264E8();
    __swift_project_boxed_opaque_existential_1((void *)(a2 + 96), *(void *)(a2 + 120));
    sub_1C2C265F8();
    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  __swift_project_boxed_opaque_existential_1(v16, v17);
  if (sub_1C2C26748() != 1)
  {
    __swift_project_boxed_opaque_existential_1(v16, v17);
    sub_1C2C264E8();
    __swift_project_boxed_opaque_existential_1((void *)(a2 + 96), *(void *)(a2 + 120));
    sub_1C2C265F8();
    __swift_project_boxed_opaque_existential_1((void *)(a2 + 136), *(void *)(a2 + 160));
    sub_1C2C265A8();
    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  sub_1C2BF7C98(a2 + 96, (uint64_t)&v14);
  __swift_project_boxed_opaque_existential_1(&v14, v15);
  __swift_project_boxed_opaque_existential_1(v16, v17);
  __n128 result = (void *)sub_1C2C26768();
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v10 = result;
  sub_1C2C265B8();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  sub_1C2BF7C98(a2 + 136, (uint64_t)&v14);
  __swift_project_boxed_opaque_existential_1(&v14, v15);
  __swift_project_boxed_opaque_existential_1(v16, v17);
  __n128 result = (void *)sub_1C2C26768();
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  long long v11 = result;
  sub_1C2C265C8();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  __swift_project_boxed_opaque_existential_1(v16, v17);
  __n128 result = (void *)sub_1C2C26768();
  if (result)
  {
    long long v12 = result;
    objc_msgSend(result, sel_lineHeight);

    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
LABEL_15:
  __break(1u);
  return result;
}

void sub_1C2C1BFAC(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  sub_1C2C26F28();
  v12.origin.CGFloat x = a5;
  v12.origin.CGFloat y = a6;
  v12.size.CGFloat width = a7;
  v12.size.CGFloat height = a8;
  CGRectGetWidth(v12);
}

double sub_1C2C1C06C(uint64_t a1, double a2, double a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13, CGFloat a14)
{
  double v23 = a11;
  double v24 = fabs(a3);
  if (fabs(a2) >= COERCE_DOUBLE(1) && v24 >= COERCE_DOUBLE(1))
  {
    CGFloat v29 = a7;
    if (*(unsigned char *)(a1 + 376) == 1)
    {
      double v23 = CGRectGetMaxX(*(CGRect *)&v29) + a6;
      v34.origin.CGFloat x = a7;
      v34.origin.CGFloat y = a8;
      v34.size.CGFloat width = a9;
      v34.size.CGFloat height = a10;
      floor(CGRectGetMidY(v34) + a3 * -0.5);
    }
    else
    {
      if (CGRectGetWidth(*(CGRect *)&v29) >= a2)
      {
        v36.origin.CGFloat x = a7;
        v36.origin.CGFloat y = a8;
        v36.size.CGFloat width = a9;
        v36.size.CGFloat height = a10;
        double v23 = floor(CGRectGetMidX(v36) + a2 * -0.5);
      }
      else
      {
        v35.size.CGFloat width = a13;
        v35.size.CGFloat height = a14;
        v35.origin.CGFloat x = a11;
        v35.origin.CGFloat y = a12;
        double v23 = CGRectGetMaxX(v35) - a2;
      }
      v37.origin.CGFloat x = a7;
      v37.origin.CGFloat y = a8;
      v37.size.CGFloat width = a9;
      v37.size.CGFloat height = a10;
      CGRectGetMaxY(v37);
    }
  }
  return v23;
}

uint64_t sub_1C2C1C1B8@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  v67[1] = a3;
  uint64_t v13 = (char *)(a2 + 47);
  uint64_t v14 = sub_1C2C26FF8();
  uint64_t v15 = *(void *)(v14 - 8);
  *(void *)&double v16 = MEMORY[0x1F4188790](v14).n128_u64[0];
  CGFloat v18 = (char *)v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = objc_msgSend(a1, sel_traitCollection, v16);
  id v78 = objc_msgSend(v19, sel_layoutDirection);

  sub_1C2C26F18();
  uint64_t v20 = a2[40];
  uint64_t v76 = a2 + 37;
  __swift_project_boxed_opaque_existential_1(a2 + 37, v20);
  sub_1C2C264E8();
  double v22 = v21;
  double v24 = v23;
  CGFloat v25 = a5;
  CGFloat v83 = a7;
  sub_1C2C1BFAC(v21, v23, v26, v27, a4, a5, a6, a7);
  double v29 = v28;
  double v82 = v30;
  sub_1C2C15B58((uint64_t)(a2 + 42), (uint64_t)&v84);
  CGFloat v80 = v29;
  uint64_t v77 = a2 + 42;
  double v75 = v22;
  double v74 = v24;
  if (v85)
  {
    sub_1C2BF8100(&v84, (uint64_t)v86);
    __swift_project_boxed_opaque_existential_1(v86, v87);
    if (sub_1C2C26488())
    {
      if (*v13 == 1)
      {
        __swift_project_boxed_opaque_existential_1(a2 + 22, a2[25]);
        sub_1C2C082FC();
        sub_1C2C265D8();
        (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
        v88.origin.CGFloat x = a4;
        v88.origin.CGFloat y = a5;
        v88.size.CGFloat width = a6;
        v88.size.CGFloat height = v83;
        CGRectGetHeight(v88);
      }
      __swift_project_boxed_opaque_existential_1(v86, v87);
      sub_1C2C264E8();
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      __swift_project_boxed_opaque_existential_1(a2 + 12, a2[15]);
      sub_1C2C265F8();
      CGFloat v79 = v39;
      __swift_project_boxed_opaque_existential_1(a2 + 17, a2[20]);
      double v73 = v32;
      double v71 = v36;
      double v70 = v38;
      sub_1C2C265A8();
      double v41 = v40;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
      double v29 = v80;
      char v42 = *v13;
      if ((*v13 & 1) == 0) {
        goto LABEL_10;
      }
LABEL_14:
      BOOL v44 = 0;
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  }
  else
  {
    sub_1C2C1C9E0((uint64_t)&v84);
  }
  double v34 = *(double *)(MEMORY[0x1E4F71DC0] + 8);
  double v73 = *(double *)MEMORY[0x1E4F71DC0];
  double v71 = *(double *)(MEMORY[0x1E4F71DC0] + 16);
  double v70 = *(double *)(MEMORY[0x1E4F71DC0] + 24);
  double v41 = 0.0;
  CGFloat v79 = 0.0;
  char v42 = *v13;
  if (*v13) {
    goto LABEL_14;
  }
LABEL_10:
  if (v13[1]) {
    goto LABEL_14;
  }
  v89.size.CGFloat height = v83;
  CGFloat v43 = v41 + v82 + v79 + v34;
  v89.origin.CGFloat x = a4;
  v89.origin.CGFloat y = v25;
  v89.size.CGFloat width = a6;
  if (v43 < CGRectGetHeight(v89))
  {
    BOOL v44 = 1;
    goto LABEL_15;
  }
  if ((*(void *)&v34 & 0x7FF0000000000000) != 0) {
    goto LABEL_14;
  }
  BOOL v44 = (*(void *)&v34 & 0xFFFFFFFFFFFFFLL) == 0;
LABEL_15:
  double v72 = v34;
  __swift_project_boxed_opaque_existential_1(a2 + 27, a2[30]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  double v46 = v45;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  double v47 = a4;
  double v48 = v25;
  if ((v42 & 1) == 0)
  {
    CGFloat v49 = a4;
    CGFloat v50 = v25;
    CGFloat v51 = a6;
    CGFloat v52 = v83;
    if (v44) {
      double v48 = floor(CGRectGetMidY(*(CGRect *)&v49) + v82 * -0.5);
    }
    else {
      double v48 = v46 + CGRectGetMinY(*(CGRect *)&v49);
    }
    v90.origin.CGFloat x = a4;
    v90.origin.CGFloat y = v25;
    v90.size.CGFloat width = a6;
    v90.size.CGFloat height = v83;
    double v47 = floor(CGRectGetMidX(v90) + v29 * -0.5);
  }
  CGFloat v81 = v47;
  __swift_project_boxed_opaque_existential_1(a2 + 32, a2[35]);
  CGFloat v69 = a4;
  CGFloat v53 = v82;
  sub_1C2C26F08();
  sub_1C2C264B8();
  v91.origin.CGFloat x = v47;
  v91.origin.CGFloat y = v48;
  v91.size.CGFloat width = v29;
  v91.size.CGFloat height = v53;
  CGFloat MidX = CGRectGetMidX(v91);
  CGFloat v68 = v25;
  v92.size.CGFloat width = v29;
  double v55 = v48;
  _OWORD v67[2] = floor(MidX - v75 * 0.5);
  v92.origin.CGFloat x = v81;
  v92.origin.CGFloat y = v48;
  v92.size.CGFloat height = v53;
  CGRectGetMidY(v92);
  __swift_project_boxed_opaque_existential_1(v76, a2[40]);
  CGFloat v56 = v69;
  CGFloat v57 = v83;
  sub_1C2C26F08();
  sub_1C2C264B8();
  double v58 = v79;
  CGFloat v79 = v55;
  double v59 = sub_1C2C1C06C((uint64_t)a2, v73, v72, v71, v70, v58, v81, v55, v80, v82, v56, v68, a6, v57);
  CGFloat v61 = v60;
  CGFloat v63 = v62;
  CGFloat v65 = v64;
  sub_1C2C15B58((uint64_t)v77, (uint64_t)v86);
  if (v87)
  {
    __swift_project_boxed_opaque_existential_1(v86, v87);
    sub_1C2C26F08();
    sub_1C2C264B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  }
  else
  {
    sub_1C2C1C9E0((uint64_t)v86);
  }
  v93.origin.CGFloat y = v79;
  v94.size.CGFloat width = v63;
  v93.origin.CGFloat x = v81;
  v93.size.CGFloat height = v82;
  v93.size.CGFloat width = v80;
  v94.origin.CGFloat x = v59;
  v94.origin.CGFloat y = v61;
  v94.size.CGFloat height = v65;
  CGRectUnion(v93, v94);
  return sub_1C2C26408();
}

uint64_t sub_1C2C1C920@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  return sub_1C2C1C1B8(a1, *v6, a2, a3, a4, a5, a6);
}

void *sub_1C2C1C928(uint64_t a1)
{
  return sub_1C2C1BA94(a1, *v1);
}

void *sub_1C2C1C948()
{
  return sub_1C2C1CA40(*v0);
}

uint64_t sub_1C2C1C950@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2C09774(*v1 + 16, a1);
}

unint64_t sub_1C2C1C960(uint64_t a1)
{
  unint64_t result = sub_1C2C09694();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1C2C1C98C()
{
  unint64_t result = qword_1EA331608;
  if (!qword_1EA331608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331608);
  }
  return result;
}

uint64_t sub_1C2C1C9E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6817F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1C2C1CA40(uint64_t a1)
{
  sub_1C2BF7C98(a1 + 296, (uint64_t)v3);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  unint64_t result = (void *)sub_1C2C26768();
  if (result)
  {
    uint64_t v2 = result;
    objc_msgSend(result, sel_lineHeight);

    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlaceableLayoutProxy()
{
  return &type metadata for PlaceableLayoutProxy;
}

uint64_t sub_1C2C1CB14(void *a1)
{
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  id v3 = objc_msgSend(a1, sel_traitCollection);
  sub_1C2C26D88();

  return sub_1C2C26408();
}

double sub_1C2C1CBDC(void *a1)
{
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  id v3 = objc_msgSend(a1, sel_traitCollection);
  sub_1C2C26D98();
  double v5 = v4;

  return v5;
}

_OWORD *sub_1C2C1CC84(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  double v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *(void *)double v4 = *a2;
    double v4 = (_OWORD *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_OWORD *)a2;
    long long v7 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)((char *)a1 + 40) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 2));
    long long v8 = *((_OWORD *)a2 + 5);
    v4[5] = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)v4 + 56, (uint64_t)(a2 + 7));
    long long v9 = *(_OWORD *)(a2 + 15);
    *(_OWORD *)((char *)v4 + 120) = v9;
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)(v4 + 6), (uint64_t)(a2 + 12));
    long long v10 = *((_OWORD *)a2 + 10);
    v4[10] = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))((uint64_t)v4 + 136, (uint64_t)(a2 + 17));
    long long v11 = *(_OWORD *)(a2 + 25);
    *(_OWORD *)((char *)v4 + 200) = v11;
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))((uint64_t)(v4 + 11), (uint64_t)(a2 + 22));
    long long v12 = *((_OWORD *)a2 + 15);
    v4[15] = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))((uint64_t)v4 + 216, (uint64_t)(a2 + 27));
    uint64_t v13 = a2[35];
    uint64_t v14 = a2[36];
    *((void *)v4 + 35) = v13;
    *((void *)v4 + 36) = v14;
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))((uint64_t)(v4 + 16), (uint64_t)(a2 + 32));
    long long v15 = *((_OWORD *)a2 + 20);
    v4[20] = v15;
    (**(void (***)(uint64_t, uint64_t))(v15 - 8))((uint64_t)v4 + 296, (uint64_t)(a2 + 37));
    uint64_t v16 = a2[45];
    uint64_t v17 = a2[46];
    *((void *)v4 + 45) = v16;
    *((void *)v4 + 46) = v17;
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))((uint64_t)(v4 + 21), (uint64_t)(a2 + 42));
    long long v18 = *((_OWORD *)a2 + 25);
    v4[25] = v18;
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))((uint64_t)v4 + 376, (uint64_t)(a2 + 47));
    uint64_t v19 = a2[55];
    uint64_t v20 = a2[56];
    *((void *)v4 + 55) = v19;
    *((void *)v4 + 56) = v20;
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))((uint64_t)(v4 + 26), (uint64_t)(a2 + 52));
    long long v21 = *((_OWORD *)a2 + 30);
    v4[30] = v21;
    (**(void (***)(uint64_t, uint64_t))(v21 - 8))((uint64_t)v4 + 456, (uint64_t)(a2 + 57));
    uint64_t v22 = a2[65];
    *((void *)v4 + 65) = v22;
    *((void *)v4 + 66) = a2[66];
    (**(void (***)(uint64_t, uint64_t))(v22 - 8))((uint64_t)(v4 + 31), (uint64_t)(a2 + 62));
    long long v23 = *((_OWORD *)a2 + 35);
    v4[35] = v23;
    (**(void (***)(uint64_t, uint64_t))(v23 - 8))((uint64_t)v4 + 536, (uint64_t)(a2 + 67));
    uint64_t v24 = *(int *)(a3 + 76);
    CGFloat v25 = (char *)v4 + v24;
    uint64_t v26 = (uint64_t)a2 + v24;
    uint64_t v27 = sub_1C2C26B88();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return v4;
}

uint64_t sub_1C2C1D19C(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  uint64_t v4 = a1 + *(int *)(a2 + 76);
  uint64_t v5 = sub_1C2C26B88();
  long long v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_1C2C1D27C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 56, a2 + 56);
  long long v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 96, a2 + 96);
  long long v9 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 136, a2 + 136);
  long long v10 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 176, a2 + 176);
  long long v11 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 216, a2 + 216);
  uint64_t v12 = *(void *)(a2 + 280);
  uint64_t v13 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = v12;
  *(void *)(a1 + 288) = v13;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 256, a2 + 256);
  long long v14 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v14;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 296, a2 + 296);
  uint64_t v15 = *(void *)(a2 + 360);
  uint64_t v16 = *(void *)(a2 + 368);
  *(void *)(a1 + 360) = v15;
  *(void *)(a1 + 368) = v16;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 336, a2 + 336);
  long long v17 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 376, a2 + 376);
  uint64_t v18 = *(void *)(a2 + 440);
  uint64_t v19 = *(void *)(a2 + 448);
  *(void *)(a1 + 440) = v18;
  *(void *)(a1 + 448) = v19;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 416, a2 + 416);
  long long v20 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 480) = v20;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 456, a2 + 456);
  uint64_t v21 = *(void *)(a2 + 520);
  *(void *)(a1 + 520) = v21;
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 496, a2 + 496);
  long long v22 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 560) = v22;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 536, a2 + 536);
  uint64_t v23 = *(int *)(a3 + 76);
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = sub_1C2C26B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  return a1;
}

uint64_t *sub_1C2C1D73C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  __swift_assign_boxed_opaque_existential_1(a1 + 22, a2 + 22);
  __swift_assign_boxed_opaque_existential_1(a1 + 27, a2 + 27);
  __swift_assign_boxed_opaque_existential_1(a1 + 32, a2 + 32);
  __swift_assign_boxed_opaque_existential_1(a1 + 37, a2 + 37);
  __swift_assign_boxed_opaque_existential_1(a1 + 42, a2 + 42);
  __swift_assign_boxed_opaque_existential_1(a1 + 47, a2 + 47);
  __swift_assign_boxed_opaque_existential_1(a1 + 52, a2 + 52);
  __swift_assign_boxed_opaque_existential_1(a1 + 57, a2 + 57);
  __swift_assign_boxed_opaque_existential_1(a1 + 62, a2 + 62);
  __swift_assign_boxed_opaque_existential_1(a1 + 67, a2 + 67);
  uint64_t v6 = *(int *)(a3 + 76);
  long long v7 = (char *)a1 + v6;
  long long v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1C2C26B88();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_1C2C1D870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  long long v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v6;
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  long long v7 = *(_OWORD *)(a2 + 256);
  long long v8 = *(_OWORD *)(a2 + 272);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(_OWORD *)(a1 + 256) = v7;
  *(_OWORD *)(a1 + 272) = v8;
  long long v9 = *(_OWORD *)(a2 + 296);
  long long v10 = *(_OWORD *)(a2 + 312);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(_OWORD *)(a1 + 296) = v9;
  *(_OWORD *)(a1 + 312) = v10;
  long long v11 = *(_OWORD *)(a2 + 336);
  long long v12 = *(_OWORD *)(a2 + 352);
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  *(_OWORD *)(a1 + 336) = v11;
  *(_OWORD *)(a1 + 352) = v12;
  long long v13 = *(_OWORD *)(a2 + 376);
  long long v14 = *(_OWORD *)(a2 + 392);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  *(_OWORD *)(a1 + 376) = v13;
  *(_OWORD *)(a1 + 392) = v14;
  long long v15 = *(_OWORD *)(a2 + 416);
  long long v16 = *(_OWORD *)(a2 + 432);
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  *(_OWORD *)(a1 + 416) = v15;
  *(_OWORD *)(a1 + 432) = v16;
  long long v17 = *(_OWORD *)(a2 + 456);
  long long v18 = *(_OWORD *)(a2 + 472);
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  *(_OWORD *)(a1 + 456) = v17;
  *(_OWORD *)(a1 + 472) = v18;
  long long v19 = *(_OWORD *)(a2 + 496);
  long long v20 = *(_OWORD *)(a2 + 512);
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  *(_OWORD *)(a1 + 496) = v19;
  *(_OWORD *)(a1 + 512) = v20;
  long long v21 = *(_OWORD *)(a2 + 536);
  long long v22 = *(_OWORD *)(a2 + 552);
  *(void *)(a1 + 568) = *(void *)(a2 + 568);
  uint64_t v23 = *(int *)(a3 + 76);
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  *(_OWORD *)(a1 + 536) = v21;
  *(_OWORD *)(a1 + 552) = v22;
  uint64_t v26 = sub_1C2C26B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  return a1;
}

uint64_t sub_1C2C1DA04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  long long v8 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v8;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  long long v9 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v9;
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  long long v10 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v10;
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  long long v11 = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 352) = v11;
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  long long v12 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v12;
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  long long v13 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v13;
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  long long v14 = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  *(_OWORD *)(a1 + 472) = v14;
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  long long v15 = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 512) = v15;
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  long long v16 = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 536) = *(_OWORD *)(a2 + 536);
  *(_OWORD *)(a1 + 552) = v16;
  *(void *)(a1 + 568) = *(void *)(a2 + 568);
  uint64_t v17 = *(int *)(a3 + 76);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_1C2C26B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  return a1;
}

uint64_t sub_1C2C1DC14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C2C1DC28);
}

uint64_t sub_1C2C1DC28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1C2C26B88();
    long long v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 76);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1C2C1DCD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C2C1DCEC);
}

uint64_t sub_1C2C1DCEC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1C2C26B88();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 76);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for SmallLockupLayout.Metrics(uint64_t a1)
{
  return sub_1C2C10518(a1, (uint64_t *)&unk_1EB681928);
}

uint64_t sub_1C2C1DDB4()
{
  uint64_t result = sub_1C2C26B88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

double sub_1C2C1DE70(void *a1)
{
  uint64_t v2 = v1;
  id v49 = a1;
  uint64_t v45 = sub_1C2C26878();
  uint64_t v44 = *(void *)(v45 - 8);
  MEMORY[0x1F4188790](v45);
  unint64_t v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C2C268A8();
  uint64_t v46 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for SmallLockupLayout(0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  long long v13 = (char *)&v43 - v12;
  MEMORY[0x1F4188790](v14);
  long long v16 = (char *)&v43 - v15;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v43 - v18;
  sub_1C2BF7A70(v2 + *(int *)(v20 + 24), (uint64_t)v51, &qword_1EB6817F0);
  uint64_t v47 = v5;
  if (!v52)
  {
    sub_1C2BF9534((uint64_t)v51, &qword_1EB6817F0);
    sub_1C2C22E84(v2, (uint64_t)v19, type metadata accessor for SmallLockupLayout);
    goto LABEL_6;
  }
  __swift_project_boxed_opaque_existential_1(v51, v52);
  char v21 = sub_1C2C264C8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  sub_1C2C22E84(v2, (uint64_t)v19, type metadata accessor for SmallLockupLayout);
  if (v21)
  {
LABEL_6:
    sub_1C2C074F8((uint64_t)v19);
    goto LABEL_7;
  }
  sub_1C2BF7A70((uint64_t)&v19[v8[6]], (uint64_t)v51, &qword_1EB6817F0);
  if (v52)
  {
    __swift_project_boxed_opaque_existential_1(v51, v52);
    int v48 = sub_1C2C26488();
    sub_1C2C074F8((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    goto LABEL_8;
  }
  sub_1C2C074F8((uint64_t)v19);
  sub_1C2BF9534((uint64_t)v51, &qword_1EB6817F0);
LABEL_7:
  int v48 = 0;
LABEL_8:
  sub_1C2BF7A70(v2 + v8[9], (uint64_t)v51, &qword_1EB6817F0);
  if (v52)
  {
    __swift_project_boxed_opaque_existential_1(v51, v52);
    char v22 = sub_1C2C264C8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1C2C22E84(v2, (uint64_t)v16, type metadata accessor for SmallLockupLayout);
    if ((v22 & 1) == 0)
    {
      sub_1C2BF7A70((uint64_t)&v16[v8[9]], (uint64_t)v51, &qword_1EB6817F0);
      int v23 = v52;
      if (v52)
      {
        __swift_project_boxed_opaque_existential_1(v51, v52);
        int v23 = sub_1C2C26488();
        sub_1C2C074F8((uint64_t)v16);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      }
      else
      {
        sub_1C2C074F8((uint64_t)v16);
        sub_1C2BF9534((uint64_t)v51, &qword_1EB6817F0);
      }
      goto LABEL_14;
    }
  }
  else
  {
    sub_1C2BF9534((uint64_t)v51, &qword_1EB6817F0);
    sub_1C2C22E84(v2, (uint64_t)v16, type metadata accessor for SmallLockupLayout);
  }
  sub_1C2C074F8((uint64_t)v16);
  int v23 = 0;
LABEL_14:
  __swift_project_boxed_opaque_existential_1((void *)(v2 + v8[8]), *(void *)(v2 + v8[8] + 24));
  char v24 = sub_1C2C264C8();
  sub_1C2C22E84(v2, (uint64_t)v13, type metadata accessor for SmallLockupLayout);
  if (v24)
  {
    char v25 = 0;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(&v13[v8[8]], *(void *)&v13[v8[8] + 24]);
    char v25 = sub_1C2C26488();
  }
  sub_1C2C074F8((uint64_t)v13);
  sub_1C2BF7A70(v2 + v8[10], (uint64_t)v51, &qword_1EB6817E8);
  uint64_t v26 = v52;
  sub_1C2BF9534((uint64_t)v51, &qword_1EB6817E8);
  sub_1C2C22E84(v2, (uint64_t)v10, type metadata accessor for SmallLockupLayout);
  if (v26)
  {
    sub_1C2BF7A70((uint64_t)&v10[v8[10]], (uint64_t)v51, &qword_1EB6817E8);
    if (v52)
    {
      __swift_project_boxed_opaque_existential_1(v51, v52);
      char v27 = sub_1C2C264C8();
      sub_1C2C074F8((uint64_t)v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      char v28 = v27 ^ 1;
      goto LABEL_23;
    }
    sub_1C2C074F8((uint64_t)v10);
    sub_1C2BF9534((uint64_t)v51, &qword_1EB6817E8);
  }
  else
  {
    sub_1C2C074F8((uint64_t)v10);
  }
  char v28 = 0;
LABEL_23:
  (*(void (**)(char *, void, uint64_t))(v44 + 104))(v4, *MEMORY[0x1E4F71AD8], v45);
  sub_1C2C26888();
  uint64_t v29 = MEMORY[0x1E4F71C30];
  if (v48)
  {
    sub_1C2BF7C98(v2 + 56, (uint64_t)v50);
    uint64_t v30 = sub_1C2C26BC8();
    uint64_t v52 = v30;
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1C2BF7C98(v2 + 216, (uint64_t)v50);
    uint64_t v52 = v30;
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
  }
  else
  {
    if (v23) {
      uint64_t v31 = v2 + 176;
    }
    else {
      uint64_t v31 = v2 + 96;
    }
    sub_1C2BF7C98(v31, (uint64_t)v50);
    uint64_t v52 = sub_1C2C26BC8();
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
  }
  sub_1C2C26898();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  if ((v25 & 1) != 0
    || (id v32 = objc_msgSend(v49, sel_traitCollection),
        char v33 = sub_1C2C26EC8(),
        v32,
        (v33 & 1) != 0))
  {
    sub_1C2BF7C98(v2 + 296, (uint64_t)v50);
    uint64_t v52 = sub_1C2C26BC8();
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    if ((v28 & 1) == 0)
    {
LABEL_32:
      id v34 = v49;
      if ((v23 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  else if ((v28 & 1) == 0)
  {
    goto LABEL_32;
  }
  sub_1C2BF7C98(v2 + 376, (uint64_t)v50);
  uint64_t v52 = sub_1C2C26BC8();
  uint64_t v53 = v29;
  __swift_allocate_boxed_opaque_existential_1(v51);
  sub_1C2C26BD8();
  sub_1C2C26898();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  id v34 = v49;
  if (v23)
  {
LABEL_33:
    sub_1C2BF7C98(v2 + 336, (uint64_t)v50);
    uint64_t v52 = sub_1C2C26BC8();
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  }
LABEL_34:
  id v35 = objc_msgSend(v34, sel_traitCollection);
  char v36 = sub_1C2C26EC8();

  if (v36)
  {
    uint64_t v37 = *(void *)(v2 + 8);
    v50[3] = MEMORY[0x1E4FBC958];
    v50[4] = MEMORY[0x1E4F71988];
    v50[0] = v37;
    uint64_t v38 = sub_1C2C26BC8();
    uint64_t v52 = v38;
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
    sub_1C2C26858();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1C2BF7C98(v2 + 16, (uint64_t)v50);
    uint64_t v52 = v38;
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
    sub_1C2C26858();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1C2BF7C98(v2 + 456, (uint64_t)v50);
    uint64_t v52 = v38;
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1C2BF7C98(v2 + 496, (uint64_t)v50);
    uint64_t v52 = v38;
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1C2BF7C98(v2 + 416, (uint64_t)v50);
    uint64_t v52 = v38;
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1C2BF7C98(v2 + 536, (uint64_t)v50);
    uint64_t v52 = v38;
    uint64_t v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1C2C26868();
    double v40 = v39;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v47);
  }
  else
  {
    if (((v48 | v23) & 1) == 0)
    {
      sub_1C2BF7C98(v2 + 416, (uint64_t)v50);
      uint64_t v52 = sub_1C2C26BC8();
      uint64_t v53 = v29;
      __swift_allocate_boxed_opaque_existential_1(v51);
      sub_1C2C26BD8();
      sub_1C2C26898();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    }
    sub_1C2C26868();
    double v40 = v41;
    __swift_project_boxed_opaque_existential_1((void *)(v2 + v8[11]), *(void *)(v2 + v8[11] + 24));
    sub_1C2C264E8();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v47);
  }
  return v40;
}

uint64_t sub_1C2C1E908@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v154 = a1;
  uint64_t v171 = sub_1C2C269D8();
  uint64_t v169 = *(void *)(v171 - 8);
  MEMORY[0x1F4188790](v171);
  objc_super v163 = (char *)&v137 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_1C2C26968();
  uint64_t v168 = *(void *)(v164 - 8);
  MEMORY[0x1F4188790](v164);
  uint64_t v6 = (char *)&v137 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_1C2C269C8();
  uint64_t v170 = *(void *)(v160 - 8);
  MEMORY[0x1F4188790](v160);
  uint64_t v159 = (char *)&v137 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_1C2C26A08();
  uint64_t v165 = *(void (**)(void))(v167 - 8);
  MEMORY[0x1F4188790](v167);
  uint64_t v158 = (char *)&v137 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = sub_1C2C26A28();
  uint64_t v156 = *(void *)(v157 - 8);
  MEMORY[0x1F4188790](v157);
  uint64_t v10 = (char *)&v137 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SmallLockupLayout(0);
  MEMORY[0x1F4188790](v11);
  long long v13 = (char *)&v137 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  long long v16 = (char *)&v137 - v15;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v137 - v18;
  MEMORY[0x1F4188790](v20);
  char v22 = (char *)&v137 - v21;
  objc_super v172 = v23;
  uint64_t v24 = v2 + v23[6];
  sub_1C2BF7A70(v24, (uint64_t)&v183, &qword_1EB6817F0);
  uint64_t v173 = v2;
  if (!v184)
  {
    sub_1C2BF9534((uint64_t)&v183, &qword_1EB6817F0);
    sub_1C2C22E84(v2, (uint64_t)v22, type metadata accessor for SmallLockupLayout);
    goto LABEL_6;
  }
  __swift_project_boxed_opaque_existential_1(&v183, v184);
  char v25 = sub_1C2C264C8();
  uint64_t v2 = v173;
  char v26 = v25;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
  sub_1C2C22E84(v2, (uint64_t)v22, type metadata accessor for SmallLockupLayout);
  if (v26)
  {
LABEL_6:
    sub_1C2C074F8((uint64_t)v22);
    goto LABEL_7;
  }
  sub_1C2BF7A70((uint64_t)&v22[v172[6]], (uint64_t)&v183, &qword_1EB6817F0);
  if (v184)
  {
    __swift_project_boxed_opaque_existential_1(&v183, v184);
    int v27 = sub_1C2C26488();
    uint64_t v2 = v173;
    LODWORD(v166) = v27;
    sub_1C2C074F8((uint64_t)v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
    goto LABEL_8;
  }
  sub_1C2C074F8((uint64_t)v22);
  sub_1C2BF9534((uint64_t)&v183, &qword_1EB6817F0);
LABEL_7:
  LODWORD(v166) = 0;
LABEL_8:
  uint64_t v155 = v2 + v172[9];
  sub_1C2BF7A70(v155, (uint64_t)&v183, &qword_1EB6817F0);
  if (!v184)
  {
    sub_1C2BF9534((uint64_t)&v183, &qword_1EB6817F0);
    sub_1C2C22E84(v2, (uint64_t)v19, type metadata accessor for SmallLockupLayout);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(&v183, v184);
  uint64_t v28 = v2;
  char v29 = sub_1C2C264C8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
  sub_1C2C22E84(v28, (uint64_t)v19, type metadata accessor for SmallLockupLayout);
  if (v29)
  {
LABEL_13:
    sub_1C2C074F8((uint64_t)v19);
    int v30 = 0;
    goto LABEL_14;
  }
  sub_1C2BF7A70((uint64_t)&v19[v172[9]], (uint64_t)&v183, &qword_1EB6817F0);
  int v30 = v184;
  if (v184)
  {
    __swift_project_boxed_opaque_existential_1(&v183, v184);
    int v30 = sub_1C2C26488();
    sub_1C2C074F8((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
  }
  else
  {
    sub_1C2C074F8((uint64_t)v19);
    sub_1C2BF9534((uint64_t)&v183, &qword_1EB6817F0);
  }
LABEL_14:
  uint64_t v31 = (void *)(v173 + v172[7]);
  __swift_project_boxed_opaque_existential_1(v31, v31[3]);
  if ((sub_1C2C26488() & 1) == 0
    || (__swift_project_boxed_opaque_existential_1((void *)(v173 + v172[8]), *(void *)(v173 + v172[8] + 24)),
        (sub_1C2C26488() & 1) != 0))
  {
LABEL_23:
    if ((v166 | v30)) {
      goto LABEL_24;
    }
LABEL_35:
    __swift_project_boxed_opaque_existential_1(v31, v31[3]);
    char v96 = sub_1C2C26488();
    sub_1C2C22E84(v173, (uint64_t)v16, type metadata accessor for SmallLockupLayout);
    if (v96)
    {
      sub_1C2C074F8((uint64_t)v16);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(&v16[v172[8]], *(void *)&v16[v172[8] + 24]);
      char v97 = sub_1C2C26488();
      sub_1C2C074F8((uint64_t)v16);
      if (v97)
      {
        uint64_t v98 = (void *)(v173 + v172[8]);
        uint64_t v99 = v98[3];
        uint64_t v100 = v98[4];
LABEL_53:
        uint64_t v134 = __swift_project_boxed_opaque_existential_1(v98, v99);
        a2[3] = (uint64_t)&type metadata for CenteringLayout;
        a2[4] = sub_1C2C22D14();
        uint64_t v135 = (uint64_t *)swift_allocObject();
        *a2 = (uint64_t)v135;
        v135[5] = v99;
        v135[6] = *(void *)(v100 + 8);
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v135 + 2);
        uint64_t result = (*(uint64_t (**)(uint64_t *, void *, uint64_t))(*(void *)(v99 - 8) + 16))(boxed_opaque_existential_1, v134, v99);
        v135[7] = 2;
        return result;
      }
    }
    __swift_project_boxed_opaque_existential_1(v31, v31[3]);
    char v101 = sub_1C2C26488();
    sub_1C2C22E84(v173, (uint64_t)v13, type metadata accessor for SmallLockupLayout);
    if (v101)
    {
      __swift_project_boxed_opaque_existential_1(&v13[v172[8]], *(void *)&v13[v172[8] + 24]);
      char v102 = sub_1C2C26488();
      sub_1C2C074F8((uint64_t)v13);
      if ((v102 & 1) == 0)
      {
        sub_1C2BF7A70(v173 + v172[10], (uint64_t)&v180, &qword_1EB6817E8);
        if (*((void *)&v181 + 1))
        {
          long long v103 = v6;
          sub_1C2BF8100(&v180, (uint64_t)&v183);
          __swift_project_boxed_opaque_existential_1(&v183, v184);
          if ((sub_1C2C264C8() & 1) == 0)
          {
            __swift_project_boxed_opaque_existential_1(&v183, v184);
            if (sub_1C2C26488())
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3308B0);
              uint64_t v167 = *((void *)v165 + 9);
              unint64_t v104 = (*((unsigned __int8 *)v165 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v165 + 80);
              uint64_t v105 = swift_allocObject();
              objc_super v172 = (int *)v105;
              *(_OWORD *)(v105 + 16) = xmmword_1C2C2FF90;
              uint64_t v145 = v105 + v104;
              uint64_t v106 = v31[3];
              uint64_t v107 = v31[4];
              uint64_t v108 = __swift_project_boxed_opaque_existential_1(v31, v106);
              *((void *)&v181 + 1) = v106;
              uint64_t v182 = *(void *)(v107 + 8);
              uint64_t v109 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v180);
              (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v106 - 8) + 16))(v109, v108, v106);
              uint64_t v150 = (void (*)(char *, uint64_t))(v173 + 256);
              uint64_t v179 = 0;
              long long v177 = 0u;
              long long v178 = 0u;
              LODWORD(v166) = *MEMORY[0x1E4F71B18];
              uint64_t v138 = a2;
              uint64_t v110 = *(void (**)(void))(v168 + 104);
              uint64_t v162 = (char *)(v168 + 104);
              uint64_t v165 = v110;
              v110(v103);
              LODWORD(v158) = *MEMORY[0x1E4F71B40];
              uint64_t v111 = v169;
              uint64_t v156 = *(void *)(v169 + 104);
              uint64_t v112 = v163;
              ((void (*)(char *))v156)(v163);
              uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681158);
              uint64_t v113 = v170;
              uint64_t v114 = *(unsigned __int8 *)(v170 + 80);
              id v154 = (id)(((v114 + 32) & ~v114) + *(void *)(v170 + 72));
              uint64_t v152 = (v114 + 32) & ~v114;
              uint64_t v153 = (void (*)(char *, void, uint64_t))(v114 | 7);
              uint64_t v115 = swift_allocObject();
              long long v151 = xmmword_1C2C2F760;
              *(_OWORD *)(v115 + 16) = xmmword_1C2C2F760;
              sub_1C2C26998();
              *(void *)&v175[0] = v115;
              uint64_t v148 = sub_1C2C22DA0((unint64_t *)&qword_1EB681140, MEMORY[0x1E4F71B28]);
              uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681148);
              unint64_t v149 = sub_1C2BF9490();
              uint64_t v116 = v159;
              uint64_t v117 = v160;
              sub_1C2C26F58();
              sub_1C2C269F8();
              uint64_t v118 = *(void (**)(char *, uint64_t))(v113 + 8);
              uint64_t v170 = v113 + 8;
              uint64_t v150 = v118;
              v118(v116, v117);
              id v119 = *(void (**)(char *, uint64_t))(v111 + 8);
              uint64_t v169 = v111 + 8;
              long long v146 = v119;
              uint64_t v120 = v171;
              v119(v112, v171);
              uint64_t v168 = *(void *)(v168 + 8);
              uint64_t v121 = v164;
              ((void (*)(char *, uint64_t))v168)(v103, v164);
              sub_1C2BF9534((uint64_t)&v177, &qword_1EB681138);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
              v167 += v145;
              uint64_t v182 = 0;
              long long v180 = 0u;
              long long v181 = 0u;
              ((void (*)(char *, void, uint64_t))v165)(v103, v166, v121);
              ((void (*)(char *, void, uint64_t))v156)(v112, v158, v120);
              uint64_t v122 = swift_allocObject();
              *(_OWORD *)(v122 + 16) = v151;
              sub_1C2C26998();
              *(void *)&long long v177 = v122;
              sub_1C2C26F58();
              sub_1C2C269F8();
              v150(v116, v117);
              v146(v112, v120);
              ((void (*)(char *, uint64_t))v168)(v103, v164);
              sub_1C2BF9534((uint64_t)&v180, &qword_1EB681138);
              uint64_t v123 = MEMORY[0x1E4F71B58];
              id v124 = v138;
              v138[3] = v157;
              v124[4] = v123;
              __swift_allocate_boxed_opaque_existential_1(v124);
              sub_1C2C269E8();
              return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
            }
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
        }
        else
        {
          sub_1C2BF9534((uint64_t)&v180, &qword_1EB6817E8);
        }
        uint64_t v99 = v31[3];
        uint64_t v100 = v31[4];
        uint64_t v98 = v31;
        goto LABEL_53;
      }
    }
    else
    {
      sub_1C2C074F8((uint64_t)v13);
    }
    id v125 = objc_msgSend(v154, sel_traitCollection);
    id v126 = objc_msgSend(v125, sel_preferredContentSizeCategory);

    LOBYTE(v125) = sub_1C2C26EE8();
    sub_1C2BF7C98((uint64_t)v31, (uint64_t)&v183);
    if (v125)
    {
      uint64_t v127 = v173;
      sub_1C2BF7C98(v173 + v172[8], (uint64_t)&v180);
      sub_1C2BF7C98(v127 + 296, (uint64_t)&v177);
      uint64_t v128 = sub_1C2C26D38();
      uint64_t v129 = MEMORY[0x1E4F71D50];
      a2[3] = v128;
      a2[4] = v129;
      __swift_allocate_boxed_opaque_existential_1(a2);
      return sub_1C2C26D28();
    }
    else
    {
      uint64_t v130 = v173;
      sub_1C2BF7C98(v173 + v172[8], (uint64_t)&v180);
      sub_1C2BF7C98(v130 + 96, (uint64_t)&v177);
      sub_1C2BF7C98(v130 + 136, (uint64_t)v175);
      sub_1C2BF7C98(v130 + 296, (uint64_t)&v174);
      uint64_t v131 = sub_1C2C26D18();
      uint64_t v132 = MEMORY[0x1E4F71D28];
      a2[3] = v131;
      a2[4] = v132;
      __swift_allocate_boxed_opaque_existential_1(a2);
      return sub_1C2C26D08();
    }
  }
  sub_1C2BF7A70(v24, (uint64_t)&v180, &qword_1EB6817F0);
  if (!*((void *)&v181 + 1))
  {
    sub_1C2BF9534((uint64_t)&v180, &qword_1EB6817F0);
    goto LABEL_23;
  }
  sub_1C2BF8100(&v180, (uint64_t)&v183);
  if ((v166 & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
    if (v30) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }
  if (v30)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
LABEL_24:
    uint64_t v138 = a2;
    sub_1C2C269E8();
    sub_1C2BF7A70(v24, (uint64_t)&v180, &qword_1EB6817F0);
    uint64_t v162 = v10;
    uint64_t v161 = v6;
    if (*((void *)&v181 + 1))
    {
      sub_1C2BF8100(&v180, (uint64_t)&v183);
      __swift_project_boxed_opaque_existential_1(&v183, v184);
      sub_1C2C26758();
      __swift_project_boxed_opaque_existential_1(&v183, v184);
      sub_1C2C26738();
      uint64_t v32 = v184;
      uint64_t v33 = v185;
      id v34 = __swift_project_boxed_opaque_existential_1(&v183, v184);
      *((void *)&v181 + 1) = v32;
      uint64_t v182 = *(void *)(v33 + 8);
      id v35 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v180);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(v35, v34, v32);
      id v154 = (id)(v173 + 56);
      uint64_t v179 = 0;
      long long v177 = 0u;
      long long v178 = 0u;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681158);
      uint64_t v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = xmmword_1C2C2FF90;
      sub_1C2C269B8();
      sub_1C2C269A8();
      *(void *)&v175[0] = v36;
      sub_1C2C22DA0((unint64_t *)&qword_1EB681140, MEMORY[0x1E4F71B28]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681148);
      sub_1C2BF9490();
      uint64_t v37 = v159;
      uint64_t v38 = v160;
      sub_1C2C26F58();
      uint64_t v39 = v168;
      uint64_t v40 = v164;
      (*(void (**)(char *, void, uint64_t))(v168 + 104))(v6, *MEMORY[0x1E4F71B18], v164);
      double v41 = v6;
      uint64_t v42 = v169;
      uint64_t v43 = v163;
      uint64_t v44 = v171;
      (*(void (**)(char *, void, uint64_t))(v169 + 104))(v163, *MEMORY[0x1E4F71B40], v171);
      uint64_t v45 = v158;
      sub_1C2C269F8();
      uint64_t v46 = v44;
      uint64_t v47 = v39;
      (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v46);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v40);
      (*(void (**)(char *, uint64_t))(v170 + 8))(v37, v38);
      sub_1C2BF9534((uint64_t)&v177, &qword_1EB681138);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
      sub_1C2C26A18();
      (*((void (**)(char *, uint64_t))v165 + 1))(v45, v167);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
    }
    else
    {
      sub_1C2BF9534((uint64_t)&v180, &qword_1EB6817F0);
      uint64_t v42 = v169;
      uint64_t v47 = v168;
    }
    __swift_project_boxed_opaque_existential_1(v31, v31[3]);
    sub_1C2C26758();
    __swift_project_boxed_opaque_existential_1(v31, v31[3]);
    sub_1C2C26738();
    uint64_t v48 = 176;
    if (v166) {
      uint64_t v48 = 216;
    }
    sub_1C2BF7C98(v173 + v48, (uint64_t)&v183);
    uint64_t v49 = v31[3];
    uint64_t v50 = v31[4];
    CGFloat v51 = __swift_project_boxed_opaque_existential_1(v31, v49);
    *((void *)&v181 + 1) = v49;
    uint64_t v182 = *(void *)(v50 + 8);
    uint64_t v52 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v180);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v49 - 8) + 16))(v52, v51, v49);
    uint64_t v179 = 0;
    long long v177 = 0u;
    long long v178 = 0u;
    LODWORD(v154) = *MEMORY[0x1E4F71B18];
    uint64_t v53 = v47;
    uint64_t v54 = *(void (**)(void))(v47 + 104);
    uint64_t v166 = v47 + 104;
    uint64_t v153 = (void (*)(char *, void, uint64_t))v54;
    uint64_t v55 = v164;
    v54(v161);
    LODWORD(v151) = *MEMORY[0x1E4F71B40];
    uint64_t v56 = v42;
    CGFloat v57 = *(void (**)(char *, uint64_t))(v42 + 104);
    uint64_t v152 = v42 + 104;
    uint64_t v150 = v57;
    double v58 = v163;
    ((void (*)(char *))v57)(v163);
    uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681158);
    uint64_t v59 = v170;
    unint64_t v149 = *(void *)(v170 + 72);
    uint64_t v60 = *(unsigned __int8 *)(v170 + 80);
    uint64_t v148 = (v60 + 32) & ~v60;
    uint64_t v145 = v60 | 7;
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_1C2C2F760;
    sub_1C2C26998();
    *(void *)&v175[0] = v61;
    uint64_t v144 = sub_1C2C22DA0((unint64_t *)&qword_1EB681140, MEMORY[0x1E4F71B28]);
    uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681148);
    unint64_t v140 = sub_1C2BF9490();
    double v62 = v159;
    uint64_t v63 = v160;
    sub_1C2C26F58();
    double v64 = v158;
    CGFloat v65 = v161;
    sub_1C2C269F8();
    long long v146 = *(void (**)(char *, uint64_t))(v59 + 8);
    v146(v62, v63);
    uint64_t v66 = *(void (**)(char *, uint64_t))(v56 + 8);
    uint64_t v169 = v56 + 8;
    uint64_t v141 = v66;
    v66(v58, v171);
    uint64_t v67 = *(void (**)(char *, uint64_t))(v53 + 8);
    uint64_t v168 = v53 + 8;
    unint64_t v139 = v67;
    v67(v65, v55);
    sub_1C2BF9534((uint64_t)&v177, &qword_1EB681138);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
    sub_1C2C26A18();
    CGFloat v68 = (char *)v165 + 8;
    uint64_t v142 = (void (*)(char *, uint64_t))*((void *)v165 + 1);
    v142(v64, v167);
    CGFloat v69 = (void *)(v173 + v172[8]);
    __swift_project_boxed_opaque_existential_1(v69, v69[3]);
    sub_1C2C26758();
    __swift_project_boxed_opaque_existential_1(v69, v69[3]);
    sub_1C2C26738();
    uint64_t v70 = v69[3];
    uint64_t v71 = v69[4];
    double v72 = __swift_project_boxed_opaque_existential_1(v69, v70);
    *((void *)&v181 + 1) = v70;
    uint64_t v182 = *(void *)(v71 + 8);
    double v73 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v180);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v70 - 8) + 16))(v73, v72, v70);
    uint64_t v179 = 0;
    long long v177 = 0u;
    long long v178 = 0u;
    objc_super v172 = (int *)(v148 + 2 * v149);
    uint64_t v74 = swift_allocObject();
    long long v137 = xmmword_1C2C2FF90;
    *(_OWORD *)(v74 + 16) = xmmword_1C2C2FF90;
    sub_1C2C269B8();
    uint64_t v75 = v171;
    sub_1C2C269A8();
    *(void *)&v175[0] = v74;
    sub_1C2C26F58();
    uint64_t v76 = v161;
    uint64_t v77 = v164;
    v153(v161, v154, v164);
    id v78 = v163;
    ((void (*)(char *, void, uint64_t))v150)(v163, v151, v75);
    sub_1C2C269F8();
    v141(v78, v75);
    uint64_t v79 = v77;
    v139(v76, v77);
    uint64_t v170 = v59 + 8;
    v146(v62, v63);
    sub_1C2BF9534((uint64_t)&v177, &qword_1EB681138);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
    sub_1C2C26A18();
    v142(v64, v167);
    sub_1C2BF7A70(v155, (uint64_t)&v177, &qword_1EB6817F0);
    if (*((void *)&v178 + 1))
    {
      CGFloat v80 = (void (*)(void))v68;
      CGFloat v81 = v64;
      sub_1C2BF8100(&v177, (uint64_t)&v180);
      uint64_t v82 = v79;
      __swift_project_boxed_opaque_existential_1(&v180, *((uint64_t *)&v181 + 1));
      uint64_t v165 = v80;
      sub_1C2C26758();
      __swift_project_boxed_opaque_existential_1(&v180, *((uint64_t *)&v181 + 1));
      sub_1C2C26738();
      uint64_t v83 = *((void *)&v181 + 1);
      uint64_t v84 = v182;
      uint64_t v85 = __swift_project_boxed_opaque_existential_1(&v180, *((uint64_t *)&v181 + 1));
      *((void *)&v178 + 1) = v83;
      uint64_t v179 = *(void *)(v84 + 8);
      uint64_t v86 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v177);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v83 - 8) + 16))(v86, v85, v83);
      uint64_t v176 = 0;
      memset(v175, 0, sizeof(v175));
      uint64_t v87 = swift_allocObject();
      *(_OWORD *)(v87 + 16) = v137;
      sub_1C2C269B8();
      sub_1C2C269A8();
      uint64_t v174 = v87;
      sub_1C2C26F58();
      CGRect v88 = v161;
      v153(v161, v154, v82);
      uint64_t v89 = v171;
      ((void (*)(char *, void, uint64_t))v150)(v78, v151, v171);
      sub_1C2C269F8();
      v141(v78, v89);
      v139(v88, v82);
      v146(v62, v63);
      sub_1C2BF9534((uint64_t)v175, &qword_1EB681138);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v177);
      CGRect v90 = v162;
      sub_1C2C26A18();
      v142(v81, v167);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
    }
    else
    {
      sub_1C2BF9534((uint64_t)&v177, &qword_1EB6817F0);
      CGRect v90 = v162;
    }
    uint64_t v91 = MEMORY[0x1E4F71B58];
    CGRect v92 = v138;
    uint64_t v93 = v157;
    v138[3] = v157;
    v92[4] = v91;
    CGRect v94 = __swift_allocate_boxed_opaque_existential_1(v92);
    (*(void (**)(uint64_t *, char *, uint64_t))(v156 + 32))(v94, v90, v93);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v183);
  }
  a2[3] = (uint64_t)&type metadata for CenteredThreeLineReverseTextLayout;
  a2[4] = sub_1C2C22DE8();
  uint64_t v133 = swift_allocObject();
  *a2 = v133;
  sub_1C2BF7C98((uint64_t)v31, v133 + 16);
  sub_1C2BF8100(&v183, v133 + 56);
  uint64_t result = sub_1C2BF7C98(v173 + 216, v133 + 96);
  *(void *)(v133 + 136) = 2;
  return result;
}

uint64_t sub_1C2C20618()
{
  uint64_t v0 = sub_1C2C26B88();
  __swift_allocate_value_buffer(v0, qword_1EB6812D0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EB6812D0);
  uint64_t v2 = *MEMORY[0x1E4F71C08];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v3(v1, v2, v0);
}

uint64_t sub_1C2C206A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v41 = a2;
  uint64_t v36 = sub_1C2C26B88();
  uint64_t v35 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  uint64_t v39 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  id v34 = (char *)&v32 - v7;
  uint64_t v40 = sub_1C2C26BB8();
  uint64_t v38 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40);
  uint64_t v37 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C2C26B58();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v32 - v14;
  uint64_t v33 = sub_1C2C26B78();
  uint64_t v32 = *(void *)(v33 - 8);
  *(void *)&double v16 = MEMORY[0x1F4188790](v33).n128_u64[0];
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a1;
  id v20 = objc_msgSend(a1, sel_traitCollection, v16);
  char v21 = sub_1C2C26EC8();

  if (v21)
  {
    sub_1C2C1E908(v19, v46);
    uint64_t v22 = type metadata accessor for SmallLockupLayout(0);
    sub_1C2BF7C98(v3 + *(int *)(v22 + 20), (uint64_t)v45);
    sub_1C2BF7C98(v3 + 16, (uint64_t)v44);
    sub_1C2BF7C98(v3 + *(int *)(v22 + 44), (uint64_t)v43);
    sub_1C2BF7C98(v3 + 416, (uint64_t)v42);
    uint64_t v23 = *MEMORY[0x1E4F71BE8];
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
    v24(v15, v23, v9);
    v24(v12, v23, v9);
    sub_1C2C26B68();
    sub_1C2C26B48();
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v18, v33);
  }
  else
  {
    sub_1C2C1E908(v19, v46);
    uint64_t v26 = type metadata accessor for SmallLockupLayout(0);
    sub_1C2BF7C98(v3 + *(int *)(v26 + 20), (uint64_t)v45);
    sub_1C2BF7C98(v3 + 16, (uint64_t)v44);
    uint64_t v27 = type metadata accessor for SmallLockupLayout.Metrics(0);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    uint64_t v29 = v36;
    v28(v34, v3 + *(int *)(v27 + 76), v36);
    sub_1C2BF7C98(v3 + *(int *)(v26 + 44), (uint64_t)v43);
    sub_1C2BF7C98(v3 + 456, (uint64_t)v42);
    if (qword_1EB6812A8 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v29, (uint64_t)qword_1EB6812D0);
    v28(v39, v30, v29);
    uint64_t v31 = v37;
    sub_1C2C26BA8();
    sub_1C2C26B98();
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v31, v40);
  }
}

double sub_1C2C20C08(uint64_t a1, void *a2)
{
  swift_getObjectType();

  return sub_1C2C20C9C(a1, a2);
}

uint64_t sub_1C2C20C68@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2C22E84(v1, a1, type metadata accessor for SmallLockupLayout.Metrics);
}

double sub_1C2C20C9C(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_1C2C26878();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C2C268A8();
  uint64_t v9 = *(void *)(v8 - 8);
  __n128 v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v5 + 104))(v7, *MEMORY[0x1E4F71AD8], v4, v10);
  sub_1C2C26888();
  id v13 = objc_msgSend(a2, sel_traitCollection);
  LOBYTE(v7) = sub_1C2C26EC8();

  if (v7)
  {
    uint64_t v14 = *(void *)(a1 + 8);
    v20[3] = MEMORY[0x1E4FBC958];
    v20[4] = MEMORY[0x1E4F71988];
    v20[0] = v14;
    uint64_t v15 = sub_1C2C26BC8();
    uint64_t v16 = MEMORY[0x1E4F71C30];
    uint64_t v22 = v15;
    uint64_t v23 = MEMORY[0x1E4F71C30];
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 16, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 56, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 216, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 296, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 336, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 456, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 496, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 416, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 536, (uint64_t)v20);
  }
  else
  {
    sub_1C2BF7C98(a1 + 96, (uint64_t)v20);
    uint64_t v15 = sub_1C2C26BC8();
    uint64_t v16 = MEMORY[0x1E4F71C30];
    uint64_t v22 = v15;
    uint64_t v23 = MEMORY[0x1E4F71C30];
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 296, (uint64_t)v20);
    uint64_t v22 = v15;
    uint64_t v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1C2C26BD8();
    sub_1C2C26898();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1C2BF7C98(a1 + 416, (uint64_t)v20);
  }
  uint64_t v22 = v15;
  uint64_t v23 = v16;
  __swift_allocate_boxed_opaque_existential_1(v21);
  sub_1C2C26BD8();
  sub_1C2C26898();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  sub_1C2C26868();
  double v18 = v17;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return v18;
}

_OWORD *sub_1C2C211F8(_OWORD *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v35 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (_OWORD *)(v35 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_OWORD *)a2;
    long long v7 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)((char *)a1 + 40) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 2));
    long long v8 = *((_OWORD *)a2 + 5);
    v4[5] = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)v4 + 56, (uint64_t)(a2 + 7));
    long long v9 = *(_OWORD *)(a2 + 15);
    *(_OWORD *)((char *)v4 + 120) = v9;
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)(v4 + 6), (uint64_t)(a2 + 12));
    long long v10 = *((_OWORD *)a2 + 10);
    v4[10] = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))((uint64_t)v4 + 136, (uint64_t)(a2 + 17));
    long long v11 = *(_OWORD *)(a2 + 25);
    *(_OWORD *)((char *)v4 + 200) = v11;
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))((uint64_t)(v4 + 11), (uint64_t)(a2 + 22));
    long long v12 = *((_OWORD *)a2 + 15);
    v4[15] = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))((uint64_t)v4 + 216, (uint64_t)(a2 + 27));
    uint64_t v13 = a2[35];
    uint64_t v14 = a2[36];
    *((void *)v4 + 35) = v13;
    *((void *)v4 + 36) = v14;
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))((uint64_t)(v4 + 16), (uint64_t)(a2 + 32));
    long long v15 = *((_OWORD *)a2 + 20);
    v4[20] = v15;
    (**(void (***)(uint64_t, uint64_t))(v15 - 8))((uint64_t)v4 + 296, (uint64_t)(a2 + 37));
    uint64_t v16 = a2[45];
    uint64_t v17 = a2[46];
    *((void *)v4 + 45) = v16;
    *((void *)v4 + 46) = v17;
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))((uint64_t)(v4 + 21), (uint64_t)(a2 + 42));
    long long v18 = *((_OWORD *)a2 + 25);
    v4[25] = v18;
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))((uint64_t)v4 + 376, (uint64_t)(a2 + 47));
    uint64_t v19 = a2[55];
    uint64_t v20 = a2[56];
    *((void *)v4 + 55) = v19;
    *((void *)v4 + 56) = v20;
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))((uint64_t)(v4 + 26), (uint64_t)(a2 + 52));
    long long v21 = *((_OWORD *)a2 + 30);
    v4[30] = v21;
    (**(void (***)(uint64_t, uint64_t))(v21 - 8))((uint64_t)v4 + 456, (uint64_t)(a2 + 57));
    uint64_t v22 = a2[65];
    *((void *)v4 + 65) = v22;
    *((void *)v4 + 66) = a2[66];
    (**(void (***)(uint64_t, uint64_t))(v22 - 8))((uint64_t)(v4 + 31), (uint64_t)(a2 + 62));
    long long v23 = *((_OWORD *)a2 + 35);
    v4[35] = v23;
    (**(void (***)(uint64_t, uint64_t))(v23 - 8))((uint64_t)v4 + 536, (uint64_t)(a2 + 67));
    uint64_t v24 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
    char v25 = (char *)v4 + v24;
    uint64_t v26 = (uint64_t)a2 + v24;
    uint64_t v27 = sub_1C2C26B88();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    uint64_t v28 = a3[5];
    long long v29 = *(_OWORD *)((char *)a2 + v28 + 24);
    *(_OWORD *)((char *)v4 + v28 + 24) = v29;
    (**(void (***)(void))(v29 - 8))();
    uint64_t v30 = a3[6];
    uint64_t v31 = (char *)v4 + v30;
    uint64_t v32 = (uint64_t)a2 + v30;
    uint64_t v33 = *(uint64_t *)((char *)a2 + v30 + 24);
    if (v33)
    {
      uint64_t v34 = *(void *)(v32 + 32);
      *((void *)v31 + 3) = v33;
      *((void *)v31 + 4) = v34;
      (**(void (***)(void))(v33 - 8))();
    }
    else
    {
      long long v36 = *(_OWORD *)(v32 + 16);
      *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
      *((_OWORD *)v31 + 1) = v36;
      *((void *)v31 + 4) = *(void *)(v32 + 32);
    }
    uint64_t v37 = a3[7];
    long long v38 = *(_OWORD *)((char *)a2 + v37 + 24);
    *(_OWORD *)((char *)v4 + v37 + 24) = v38;
    (**(void (***)(void))(v38 - 8))();
    uint64_t v39 = a3[8];
    long long v40 = *(_OWORD *)((char *)a2 + v39 + 24);
    *(_OWORD *)((char *)v4 + v39 + 24) = v40;
    (**(void (***)(void))(v40 - 8))();
    uint64_t v41 = a3[9];
    uint64_t v42 = (char *)v4 + v41;
    uint64_t v43 = (uint64_t)a2 + v41;
    uint64_t v44 = *(uint64_t *)((char *)a2 + v41 + 24);
    if (v44)
    {
      uint64_t v45 = *(void *)(v43 + 32);
      *((void *)v42 + 3) = v44;
      *((void *)v42 + 4) = v45;
      (**(void (***)(void))(v44 - 8))();
    }
    else
    {
      long long v46 = *(_OWORD *)(v43 + 16);
      *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
      *((_OWORD *)v42 + 1) = v46;
      *((void *)v42 + 4) = *(void *)(v43 + 32);
    }
    uint64_t v47 = a3[10];
    uint64_t v48 = (char *)v4 + v47;
    uint64_t v49 = (uint64_t)a2 + v47;
    uint64_t v50 = *(uint64_t *)((char *)a2 + v47 + 24);
    if (v50)
    {
      uint64_t v51 = *(void *)(v49 + 32);
      *((void *)v48 + 3) = v50;
      *((void *)v48 + 4) = v51;
      (**(void (***)(void))(v50 - 8))();
    }
    else
    {
      long long v52 = *(_OWORD *)(v49 + 16);
      *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
      *((_OWORD *)v48 + 1) = v52;
      *((void *)v48 + 4) = *(void *)(v49 + 32);
    }
    uint64_t v53 = a3[11];
    long long v54 = *(_OWORD *)((char *)a2 + v53 + 24);
    *(_OWORD *)((char *)v4 + v53 + 24) = v54;
    (**(void (***)(void))(v54 - 8))();
  }
  return v4;
}

uint64_t sub_1C2C21950(uint64_t a1, int *a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  uint64_t v4 = a1 + *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  uint64_t v5 = sub_1C2C26B88();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[5]);
  uint64_t v6 = a1 + a2[6];
  if (*(void *)(v6 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v6);
  }
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[8]);
  uint64_t v7 = a1 + a2[9];
  if (*(void *)(v7 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v7);
  }
  uint64_t v8 = a1 + a2[10];
  if (*(void *)(v8 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v8);
  }
  uint64_t v9 = a1 + a2[11];

  return __swift_destroy_boxed_opaque_existential_1(v9);
}

uint64_t sub_1C2C21AAC(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 56, a2 + 56);
  long long v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 96, a2 + 96);
  long long v9 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 136, a2 + 136);
  long long v10 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 176, a2 + 176);
  long long v11 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 216, a2 + 216);
  uint64_t v12 = *(void *)(a2 + 280);
  uint64_t v13 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = v12;
  *(void *)(a1 + 288) = v13;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 256, a2 + 256);
  long long v14 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v14;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 296, a2 + 296);
  uint64_t v15 = *(void *)(a2 + 360);
  uint64_t v16 = *(void *)(a2 + 368);
  *(void *)(a1 + 360) = v15;
  *(void *)(a1 + 368) = v16;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 336, a2 + 336);
  long long v17 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 376, a2 + 376);
  uint64_t v18 = *(void *)(a2 + 440);
  uint64_t v19 = *(void *)(a2 + 448);
  *(void *)(a1 + 440) = v18;
  *(void *)(a1 + 448) = v19;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 416, a2 + 416);
  long long v20 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 480) = v20;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 456, a2 + 456);
  uint64_t v21 = *(void *)(a2 + 520);
  *(void *)(a1 + 520) = v21;
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 496, a2 + 496);
  long long v22 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 560) = v22;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 536, a2 + 536);
  uint64_t v23 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = sub_1C2C26B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  uint64_t v27 = a3[5];
  long long v28 = *(_OWORD *)(a2 + v27 + 24);
  *(_OWORD *)(a1 + v27 + 24) = v28;
  (**(void (***)(void))(v28 - 8))();
  uint64_t v29 = a3[6];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  uint64_t v32 = *(void *)(a2 + v29 + 24);
  if (v32)
  {
    uint64_t v33 = *(void *)(v31 + 32);
    *(void *)(v30 + 24) = v32;
    *(void *)(v30 + 32) = v33;
    (**(void (***)(void))(v32 - 8))();
  }
  else
  {
    long long v34 = *(_OWORD *)(v31 + 16);
    *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
    *(_OWORD *)(v30 + 16) = v34;
    *(void *)(v30 + 32) = *(void *)(v31 + 32);
  }
  uint64_t v35 = a3[7];
  long long v36 = *(_OWORD *)(a2 + v35 + 24);
  *(_OWORD *)(a1 + v35 + 24) = v36;
  (**(void (***)(void))(v36 - 8))();
  uint64_t v37 = a3[8];
  long long v38 = *(_OWORD *)(a2 + v37 + 24);
  *(_OWORD *)(a1 + v37 + 24) = v38;
  (**(void (***)(void))(v38 - 8))();
  uint64_t v39 = a3[9];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  uint64_t v42 = *(void *)(a2 + v39 + 24);
  if (v42)
  {
    uint64_t v43 = *(void *)(v41 + 32);
    *(void *)(v40 + 24) = v42;
    *(void *)(v40 + 32) = v43;
    (**(void (***)(void))(v42 - 8))();
  }
  else
  {
    long long v44 = *(_OWORD *)(v41 + 16);
    *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
    *(_OWORD *)(v40 + 16) = v44;
    *(void *)(v40 + 32) = *(void *)(v41 + 32);
  }
  uint64_t v45 = a3[10];
  uint64_t v46 = a1 + v45;
  uint64_t v47 = a2 + v45;
  uint64_t v48 = *(void *)(a2 + v45 + 24);
  if (v48)
  {
    uint64_t v49 = *(void *)(v47 + 32);
    *(void *)(v46 + 24) = v48;
    *(void *)(v46 + 32) = v49;
    (**(void (***)(void))(v48 - 8))();
  }
  else
  {
    long long v50 = *(_OWORD *)(v47 + 16);
    *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
    *(_OWORD *)(v46 + 16) = v50;
    *(void *)(v46 + 32) = *(void *)(v47 + 32);
  }
  uint64_t v51 = a3[11];
  long long v52 = *(_OWORD *)(a2 + v51 + 24);
  *(_OWORD *)(a1 + v51 + 24) = v52;
  (**(void (***)(void))(v52 - 8))();
  return a1;
}

uint64_t *sub_1C2C221AC(uint64_t *a1, uint64_t *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  __swift_assign_boxed_opaque_existential_1(a1 + 22, a2 + 22);
  __swift_assign_boxed_opaque_existential_1(a1 + 27, a2 + 27);
  __swift_assign_boxed_opaque_existential_1(a1 + 32, a2 + 32);
  __swift_assign_boxed_opaque_existential_1(a1 + 37, a2 + 37);
  __swift_assign_boxed_opaque_existential_1(a1 + 42, a2 + 42);
  __swift_assign_boxed_opaque_existential_1(a1 + 47, a2 + 47);
  __swift_assign_boxed_opaque_existential_1(a1 + 52, a2 + 52);
  __swift_assign_boxed_opaque_existential_1(a1 + 57, a2 + 57);
  __swift_assign_boxed_opaque_existential_1(a1 + 62, a2 + 62);
  __swift_assign_boxed_opaque_existential_1(a1 + 67, a2 + 67);
  uint64_t v6 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  long long v7 = (char *)a1 + v6;
  long long v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1C2C26B88();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]));
  uint64_t v10 = a3[6];
  uint64_t v11 = (uint64_t)a1 + v10;
  uint64_t v12 = (uint64_t *)((char *)a2 + v10);
  uint64_t v13 = *(uint64_t *)((char *)a2 + v10 + 24);
  if (*(uint64_t *)((char *)a1 + v10 + 24))
  {
    if (v13)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v11, v12);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(v11);
  }
  else if (v13)
  {
    *(void *)(v11 + 24) = v13;
    *(void *)(v11 + 32) = v12[4];
    (**(void (***)(uint64_t, char *))(v13 - 8))(v11, (char *)v12);
    goto LABEL_8;
  }
  long long v14 = *(_OWORD *)v12;
  long long v15 = *((_OWORD *)v12 + 1);
  *(void *)(v11 + 32) = v12[4];
  *(_OWORD *)uint64_t v11 = v14;
  *(_OWORD *)(v11 + 16) = v15;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[8]), (uint64_t *)((char *)a2 + a3[8]));
  uint64_t v16 = a3[9];
  uint64_t v17 = (uint64_t)a1 + v16;
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  uint64_t v19 = *(uint64_t *)((char *)a2 + v16 + 24);
  if (*(uint64_t *)((char *)a1 + v16 + 24))
  {
    if (v19)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v17, v18);
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1(v17);
  }
  else if (v19)
  {
    *(void *)(v17 + 24) = v19;
    *(void *)(v17 + 32) = v18[4];
    (**(void (***)(uint64_t, char *))(v19 - 8))(v17, (char *)v18);
    goto LABEL_15;
  }
  long long v20 = *(_OWORD *)v18;
  long long v21 = *((_OWORD *)v18 + 1);
  *(void *)(v17 + 32) = v18[4];
  *(_OWORD *)uint64_t v17 = v20;
  *(_OWORD *)(v17 + 16) = v21;
LABEL_15:
  uint64_t v22 = a3[10];
  uint64_t v23 = (uint64_t)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(uint64_t *)((char *)a2 + v22 + 24);
  if (!*(uint64_t *)((char *)a1 + v22 + 24))
  {
    if (v25)
    {
      *(void *)(v23 + 24) = v25;
      *(void *)(v23 + 32) = *((void *)v24 + 4);
      (**(void (***)(uint64_t, char *))(v25 - 8))(v23, v24);
      goto LABEL_22;
    }
LABEL_21:
    long long v26 = *(_OWORD *)v24;
    long long v27 = *((_OWORD *)v24 + 1);
    *(void *)(v23 + 32) = *((void *)v24 + 4);
    *(_OWORD *)uint64_t v23 = v26;
    *(_OWORD *)(v23 + 16) = v27;
    goto LABEL_22;
  }
  if (!v25)
  {
    __swift_destroy_boxed_opaque_existential_1(v23);
    goto LABEL_21;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v23, (uint64_t *)v24);
LABEL_22:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[11]), (uint64_t *)((char *)a2 + a3[11]));
  return a1;
}

uint64_t sub_1C2C224C8(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  long long v8 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v8;
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  long long v9 = *(_OWORD *)(a2 + 256);
  long long v10 = *(_OWORD *)(a2 + 272);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(_OWORD *)(a1 + 256) = v9;
  *(_OWORD *)(a1 + 272) = v10;
  long long v11 = *(_OWORD *)(a2 + 296);
  long long v12 = *(_OWORD *)(a2 + 312);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(_OWORD *)(a1 + 296) = v11;
  *(_OWORD *)(a1 + 312) = v12;
  long long v13 = *(_OWORD *)(a2 + 336);
  long long v14 = *(_OWORD *)(a2 + 352);
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  *(_OWORD *)(a1 + 336) = v13;
  *(_OWORD *)(a1 + 352) = v14;
  long long v15 = *(_OWORD *)(a2 + 376);
  long long v16 = *(_OWORD *)(a2 + 392);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  *(_OWORD *)(a1 + 376) = v15;
  *(_OWORD *)(a1 + 392) = v16;
  long long v17 = *(_OWORD *)(a2 + 416);
  long long v18 = *(_OWORD *)(a2 + 432);
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  *(_OWORD *)(a1 + 416) = v17;
  *(_OWORD *)(a1 + 432) = v18;
  long long v19 = *(_OWORD *)(a2 + 456);
  long long v20 = *(_OWORD *)(a2 + 472);
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  *(_OWORD *)(a1 + 456) = v19;
  *(_OWORD *)(a1 + 472) = v20;
  long long v21 = *(_OWORD *)(a2 + 496);
  long long v22 = *(_OWORD *)(a2 + 512);
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  *(_OWORD *)(a1 + 496) = v21;
  *(_OWORD *)(a1 + 512) = v22;
  long long v23 = *(_OWORD *)(a2 + 536);
  long long v24 = *(_OWORD *)(a2 + 552);
  *(void *)(a1 + 568) = *(void *)(a2 + 568);
  *(_OWORD *)(a1 + 536) = v23;
  *(_OWORD *)(a1 + 552) = v24;
  uint64_t v25 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = sub_1C2C26B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
  uint64_t v29 = a3[5];
  uint64_t v30 = a3[6];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = a2 + v29;
  *(void *)(v31 + 32) = *(void *)(v32 + 32);
  long long v33 = *(_OWORD *)(v32 + 16);
  *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
  *(_OWORD *)(v31 + 16) = v33;
  uint64_t v34 = a1 + v30;
  uint64_t v35 = a2 + v30;
  *(void *)(v34 + 32) = *(void *)(v35 + 32);
  long long v36 = *(_OWORD *)(v35 + 16);
  *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
  *(_OWORD *)(v34 + 16) = v36;
  uint64_t v37 = a3[7];
  uint64_t v38 = a3[8];
  uint64_t v39 = a1 + v37;
  uint64_t v40 = a2 + v37;
  long long v41 = *(_OWORD *)(v40 + 16);
  *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
  *(_OWORD *)(v39 + 16) = v41;
  *(void *)(v39 + 32) = *(void *)(v40 + 32);
  uint64_t v42 = a1 + v38;
  uint64_t v43 = (long long *)(a2 + v38);
  long long v44 = *v43;
  long long v45 = v43[1];
  *(void *)(v42 + 32) = *((void *)v43 + 4);
  *(_OWORD *)uint64_t v42 = v44;
  *(_OWORD *)(v42 + 16) = v45;
  uint64_t v46 = a3[9];
  uint64_t v47 = a3[10];
  uint64_t v48 = a1 + v46;
  uint64_t v49 = a2 + v46;
  *(void *)(v48 + 32) = *(void *)(v49 + 32);
  long long v50 = *(_OWORD *)(v49 + 16);
  *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
  *(_OWORD *)(v48 + 16) = v50;
  uint64_t v51 = a1 + v47;
  uint64_t v52 = a2 + v47;
  *(void *)(v51 + 32) = *(void *)(v52 + 32);
  long long v53 = *(_OWORD *)(v52 + 16);
  *(_OWORD *)uint64_t v51 = *(_OWORD *)v52;
  *(_OWORD *)(v51 + 16) = v53;
  uint64_t v54 = a3[11];
  uint64_t v55 = a1 + v54;
  uint64_t v56 = a2 + v54;
  long long v57 = *(_OWORD *)(v56 + 16);
  *(_OWORD *)uint64_t v55 = *(_OWORD *)v56;
  *(_OWORD *)(v55 + 16) = v57;
  *(void *)(v55 + 32) = *(void *)(v56 + 32);
  return a1;
}

uint64_t sub_1C2C2272C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  long long v8 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v8;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  long long v9 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v9;
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  long long v10 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v10;
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  long long v11 = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 352) = v11;
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  long long v12 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v12;
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  long long v13 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v13;
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  long long v14 = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  *(_OWORD *)(a1 + 472) = v14;
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  long long v15 = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 512) = v15;
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  long long v16 = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 536) = *(_OWORD *)(a2 + 536);
  *(_OWORD *)(a1 + 552) = v16;
  *(void *)(a1 + 568) = *(void *)(a2 + 568);
  uint64_t v17 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_1C2C26B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = a3[5];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  __swift_destroy_boxed_opaque_existential_1(a1 + v21);
  *(void *)(v22 + 32) = *(void *)(v23 + 32);
  long long v24 = *(_OWORD *)(v23 + 16);
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *(_OWORD *)(v22 + 16) = v24;
  uint64_t v25 = a3[6];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  if (*(void *)(a1 + v25 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v26);
  }
  long long v28 = *(_OWORD *)(v27 + 16);
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  *(_OWORD *)(v26 + 16) = v28;
  *(void *)(v26 + 32) = *(void *)(v27 + 32);
  uint64_t v29 = a3[7];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  __swift_destroy_boxed_opaque_existential_1(a1 + v29);
  long long v32 = *(_OWORD *)(v31 + 16);
  *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
  *(_OWORD *)(v30 + 16) = v32;
  *(void *)(v30 + 32) = *(void *)(v31 + 32);
  uint64_t v33 = a3[8];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  __swift_destroy_boxed_opaque_existential_1(a1 + v33);
  *(void *)(v34 + 32) = *(void *)(v35 + 32);
  long long v36 = *(_OWORD *)(v35 + 16);
  *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
  *(_OWORD *)(v34 + 16) = v36;
  uint64_t v37 = a3[9];
  uint64_t v38 = a1 + v37;
  uint64_t v39 = a2 + v37;
  if (*(void *)(a1 + v37 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v38);
  }
  long long v40 = *(_OWORD *)(v39 + 16);
  *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
  *(_OWORD *)(v38 + 16) = v40;
  *(void *)(v38 + 32) = *(void *)(v39 + 32);
  uint64_t v41 = a3[10];
  uint64_t v42 = a1 + v41;
  if (*(void *)(a1 + v41 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + v41);
  }
  long long v43 = *(_OWORD *)(a2 + v41 + 16);
  *(_OWORD *)uint64_t v42 = *(_OWORD *)(a2 + v41);
  *(_OWORD *)(v42 + 16) = v43;
  *(void *)(v42 + 32) = *(void *)(a2 + v41 + 32);
  uint64_t v44 = a3[11];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  __swift_destroy_boxed_opaque_existential_1(a1 + v44);
  long long v47 = *(_OWORD *)(v46 + 16);
  *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
  *(_OWORD *)(v45 + 16) = v47;
  *(void *)(v45 + 32) = *(void *)(v46 + 32);
  return a1;
}

uint64_t sub_1C2C22A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C2C22A6C);
}

uint64_t sub_1C2C22A6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SmallLockupLayout.Metrics(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    long long v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1C2C22B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C2C22B44);
}

uint64_t sub_1C2C22B44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SmallLockupLayout.Metrics(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for SmallLockupLayout(uint64_t a1)
{
  return sub_1C2C10518(a1, (uint64_t *)&unk_1EB681938);
}

uint64_t sub_1C2C22C24()
{
  uint64_t result = type metadata accessor for SmallLockupLayout.Metrics(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1C2C22CCC()
{
  return sub_1C2C22DA0(&qword_1EA331610, (void (*)(uint64_t))type metadata accessor for SmallLockupLayout);
}

unint64_t sub_1C2C22D14()
{
  unint64_t result = qword_1EA331618;
  if (!qword_1EA331618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331618);
  }
  return result;
}

uint64_t sub_1C2C22D68()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C2C22DA0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1C2C22DE8()
{
  unint64_t result = qword_1EA331620;
  if (!qword_1EA331620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA331620);
  }
  return result;
}

uint64_t sub_1C2C22E3C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  return MEMORY[0x1F4186498](v0, 144, 7);
}

uint64_t sub_1C2C22E84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t destroy for TVTextPillOverlayLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 72);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 112);
}

_OWORD *initializeWithCopy for TVTextPillOverlayLayout(_OWORD *a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = *(_OWORD *)((char *)a2 + 56);
  *(_OWORD *)((char *)a1 + 56) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  long long v6 = a2[6];
  a1[6] = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)a1 + 72, (uint64_t)a2 + 72);
  long long v7 = *(_OWORD *)((char *)a2 + 136);
  *(_OWORD *)((char *)a1 + 136) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)(a1 + 7), (uint64_t)(a2 + 7));
  return a1;
}

uint64_t *assignWithCopy for TVTextPillOverlayLayout(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  __swift_assign_boxed_opaque_existential_1(a1 + 4, a2 + 4);
  __swift_assign_boxed_opaque_existential_1(a1 + 9, a2 + 9);
  __swift_assign_boxed_opaque_existential_1(a1 + 14, a2 + 14);
  return a1;
}

__n128 __swift_memcpy152_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for TVTextPillOverlayLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  __swift_destroy_boxed_opaque_existential_1(a1 + 112);
  long long v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v6;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVTextPillOverlayLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 152)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TVTextPillOverlayLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 152) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 152) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TVTextPillOverlayLayout()
{
  return &type metadata for TVTextPillOverlayLayout;
}

uint64_t destroy for TVTextPillOverlayLayout.Metrics(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 32);
}

_OWORD *initializeWithCopy for TVTextPillOverlayLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  long long v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  long long v4 = *(_OWORD *)((char *)a2 + 56);
  *(_OWORD *)((char *)a1 + 56) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  return a1;
}

void *assignWithCopy for TVTextPillOverlayLayout.Metrics(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  __swift_assign_boxed_opaque_existential_1(a1 + 4, a2 + 4);
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for TVTextPillOverlayLayout.Metrics(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVTextPillOverlayLayout.Metrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TVTextPillOverlayLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TVTextPillOverlayLayout.Metrics()
{
  return &type metadata for TVTextPillOverlayLayout.Metrics;
}

uint64_t sub_1C2C233DC@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  CGFloat v30 = a2;
  CGFloat v31 = a3;
  v29[5] = a1;
  uint64_t v8 = sub_1C2C26FF8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  long long v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(v5 + 112), *(void *)(v5 + 136));
  sub_1C2C264E8();
  double v13 = v12;
  *(double *)&v29[3] = v12;
  double v15 = v14;
  double v16 = *(double *)(v5 + 8);
  double v17 = *(double *)(v5 + 24);
  sub_1C2C0A36C(v5, (uint64_t)v32);
  __swift_project_boxed_opaque_existential_1(v33, v33[3]);
  sub_1C2C082FC();
  sub_1C2C265D8();
  double v19 = v18;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  *(double *)&v29[4] = v15;
  if (v15 > v19) {
    double v20 = v15;
  }
  else {
    double v20 = v19;
  }
  CGFloat v21 = v13 + v16 + v17;
  CGFloat v23 = v30;
  CGFloat v22 = v31;
  v34.origin.CGFloat x = v30;
  v34.origin.CGFloat y = v31;
  CGFloat v24 = a4;
  v34.size.CGFloat width = a4;
  CGFloat v25 = a5;
  v34.size.CGFloat height = a5;
  CGFloat v26 = CGRectGetMaxX(v34) - v21;
  v35.origin.CGFloat x = v23;
  v35.origin.CGFloat y = v22;
  v35.size.CGFloat width = v24;
  *(CGFloat *)&v29[1] = v24;
  v35.size.CGFloat height = v25;
  *(CGFloat *)&v29[2] = v25;
  CGFloat v27 = CGRectGetMaxY(v35) - v20;
  __swift_project_boxed_opaque_existential_1((void *)(v5 + 72), *(void *)(v5 + 96));
  sub_1C2C26EF8();
  sub_1C2C264B8();
  v36.origin.CGFloat x = v26;
  v36.origin.CGFloat y = v27;
  v36.size.CGFloat width = v21;
  v36.size.CGFloat height = v20;
  CGRectGetMidX(v36);
  v37.origin.CGFloat x = v26;
  v37.origin.CGFloat y = v27;
  v37.size.CGFloat width = v21;
  v37.size.CGFloat height = v20;
  CGRectGetMidY(v37);
  __swift_project_boxed_opaque_existential_1((void *)(v5 + 112), *(void *)(v5 + 136));
  sub_1C2C26EF8();
  sub_1C2C264B8();
  return sub_1C2C26408();
}

uint64_t sub_1C2C236F0@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2C0A36C(v1, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void ASCAXLabelForElements_cold_1()
{
}

uint64_t __getSKStoreProductViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ASCLockupRequest initWithCoder:](v0);
}

void __ASCSignpostTagCreateForProcess_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = 136446466;
  long long v3 = "ASCSignpostTag ASCSignpostTagCreateForProcess(uint64_t, pid_t)_block_invoke";
  __int16 v4 = 2050;
  uint64_t v5 = v1;
  _os_log_fault_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** %{public}s: Value %{public}llul exceeds 47 bits, break on _ASCSignpostTag_valueTooLarge to debug", (uint8_t *)&v2, 0x16u);
}

void ASCLockupImageStringForName_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not find image %@ for lockup text", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_1C2C263D8()
{
  return MEMORY[0x1F4129450]();
}

uint64_t sub_1C2C263E8()
{
  return MEMORY[0x1F4129458]();
}

uint64_t sub_1C2C263F8()
{
  return MEMORY[0x1F4129470]();
}

uint64_t sub_1C2C26408()
{
  return MEMORY[0x1F4129478]();
}

uint64_t sub_1C2C26418()
{
  return MEMORY[0x1F4129480]();
}

uint64_t sub_1C2C26428()
{
  return MEMORY[0x1F4129490]();
}

uint64_t sub_1C2C26438()
{
  return MEMORY[0x1F4129498]();
}

uint64_t sub_1C2C26448()
{
  return MEMORY[0x1F41294A0]();
}

uint64_t sub_1C2C26458()
{
  return MEMORY[0x1F41294B8]();
}

uint64_t sub_1C2C26468()
{
  return MEMORY[0x1F41294C8]();
}

uint64_t sub_1C2C26478()
{
  return MEMORY[0x1F41294D0]();
}

uint64_t sub_1C2C26488()
{
  return MEMORY[0x1F41294D8]();
}

uint64_t sub_1C2C26498()
{
  return MEMORY[0x1F41294E8]();
}

uint64_t sub_1C2C264A8()
{
  return MEMORY[0x1F41294F0]();
}

uint64_t sub_1C2C264B8()
{
  return MEMORY[0x1F41294F8]();
}

uint64_t sub_1C2C264C8()
{
  return MEMORY[0x1F4129500]();
}

uint64_t sub_1C2C264D8()
{
  return MEMORY[0x1F4129518]();
}

uint64_t sub_1C2C264E8()
{
  return MEMORY[0x1F4129528]();
}

uint64_t sub_1C2C264F8()
{
  return MEMORY[0x1F4129530]();
}

uint64_t sub_1C2C26508()
{
  return MEMORY[0x1F4129540]();
}

uint64_t sub_1C2C26518()
{
  return MEMORY[0x1F4129548]();
}

uint64_t sub_1C2C26528()
{
  return MEMORY[0x1F4129550]();
}

uint64_t sub_1C2C26538()
{
  return MEMORY[0x1F4129558]();
}

uint64_t sub_1C2C26548()
{
  return MEMORY[0x1F4129560]();
}

uint64_t sub_1C2C26558()
{
  return MEMORY[0x1F4129568]();
}

uint64_t sub_1C2C26568()
{
  return MEMORY[0x1F4129578]();
}

uint64_t sub_1C2C26578()
{
  return MEMORY[0x1F4129580]();
}

uint64_t sub_1C2C26588()
{
  return MEMORY[0x1F4129588]();
}

uint64_t sub_1C2C26598()
{
  return MEMORY[0x1F41295A0]();
}

uint64_t sub_1C2C265A8()
{
  return MEMORY[0x1F41295B0]();
}

uint64_t sub_1C2C265B8()
{
  return MEMORY[0x1F41295B8]();
}

uint64_t sub_1C2C265C8()
{
  return MEMORY[0x1F41295C0]();
}

uint64_t sub_1C2C265D8()
{
  return MEMORY[0x1F41295C8]();
}

uint64_t sub_1C2C265E8()
{
  return MEMORY[0x1F41295D0]();
}

uint64_t sub_1C2C265F8()
{
  return MEMORY[0x1F41295D8]();
}

uint64_t sub_1C2C26618()
{
  return MEMORY[0x1F41295F8]();
}

uint64_t sub_1C2C26628()
{
  return MEMORY[0x1F4129600]();
}

uint64_t sub_1C2C26638()
{
  return MEMORY[0x1F4129618]();
}

uint64_t sub_1C2C26648()
{
  return MEMORY[0x1F4129620]();
}

uint64_t sub_1C2C26658()
{
  return MEMORY[0x1F4129628]();
}

uint64_t sub_1C2C26668()
{
  return MEMORY[0x1F4129630]();
}

uint64_t sub_1C2C26678()
{
  return MEMORY[0x1F4129638]();
}

uint64_t sub_1C2C26688()
{
  return MEMORY[0x1F4129640]();
}

uint64_t sub_1C2C26698()
{
  return MEMORY[0x1F4129648]();
}

uint64_t sub_1C2C266A8()
{
  return MEMORY[0x1F4129650]();
}

uint64_t sub_1C2C266B8()
{
  return MEMORY[0x1F4129668]();
}

uint64_t sub_1C2C266C8()
{
  return MEMORY[0x1F4129670]();
}

uint64_t sub_1C2C266D8()
{
  return MEMORY[0x1F4129680]();
}

uint64_t sub_1C2C266E8()
{
  return MEMORY[0x1F4129688]();
}

uint64_t sub_1C2C266F8()
{
  return MEMORY[0x1F4129690]();
}

uint64_t sub_1C2C26708()
{
  return MEMORY[0x1F4129698]();
}

uint64_t sub_1C2C26718()
{
  return MEMORY[0x1F41296A0]();
}

uint64_t sub_1C2C26728()
{
  return MEMORY[0x1F41296A8]();
}

uint64_t sub_1C2C26738()
{
  return MEMORY[0x1F41296C0]();
}

uint64_t sub_1C2C26748()
{
  return MEMORY[0x1F41296C8]();
}

uint64_t sub_1C2C26758()
{
  return MEMORY[0x1F41296D0]();
}

uint64_t sub_1C2C26768()
{
  return MEMORY[0x1F41296E0]();
}

uint64_t sub_1C2C26778()
{
  return MEMORY[0x1F41296F0]();
}

uint64_t sub_1C2C26788()
{
  return MEMORY[0x1F4129728]();
}

uint64_t sub_1C2C26798()
{
  return MEMORY[0x1F4129730]();
}

uint64_t sub_1C2C267A8()
{
  return MEMORY[0x1F4129790]();
}

uint64_t sub_1C2C267B8()
{
  return MEMORY[0x1F4129798]();
}

uint64_t sub_1C2C267C8()
{
  return MEMORY[0x1F41297A0]();
}

uint64_t sub_1C2C267D8()
{
  return MEMORY[0x1F41297B0]();
}

uint64_t sub_1C2C267E8()
{
  return MEMORY[0x1F41297B8]();
}

uint64_t sub_1C2C267F8()
{
  return MEMORY[0x1F41297C0]();
}

uint64_t sub_1C2C26808()
{
  return MEMORY[0x1F41297C8]();
}

uint64_t sub_1C2C26818()
{
  return MEMORY[0x1F41297D0]();
}

uint64_t sub_1C2C26828()
{
  return MEMORY[0x1F41297D8]();
}

uint64_t sub_1C2C26838()
{
  return MEMORY[0x1F41297E0]();
}

uint64_t sub_1C2C26848()
{
  return MEMORY[0x1F41297E8]();
}

uint64_t sub_1C2C26858()
{
  return MEMORY[0x1F41297F8]();
}

uint64_t sub_1C2C26868()
{
  return MEMORY[0x1F4129800]();
}

uint64_t sub_1C2C26878()
{
  return MEMORY[0x1F4129808]();
}

uint64_t sub_1C2C26888()
{
  return MEMORY[0x1F4129810]();
}

uint64_t sub_1C2C26898()
{
  return MEMORY[0x1F4129818]();
}

uint64_t sub_1C2C268A8()
{
  return MEMORY[0x1F4129820]();
}

uint64_t sub_1C2C268B8()
{
  return MEMORY[0x1F4129848]();
}

uint64_t sub_1C2C268C8()
{
  return MEMORY[0x1F4129850]();
}

uint64_t sub_1C2C268D8()
{
  return MEMORY[0x1F4129860]();
}

uint64_t sub_1C2C268E8()
{
  return MEMORY[0x1F4129868]();
}

uint64_t sub_1C2C268F8()
{
  return MEMORY[0x1F4129880]();
}

uint64_t sub_1C2C26908()
{
  return MEMORY[0x1F4129888]();
}

uint64_t sub_1C2C26918()
{
  return MEMORY[0x1F4129890]();
}

uint64_t sub_1C2C26928()
{
  return MEMORY[0x1F4129898]();
}

uint64_t sub_1C2C26938()
{
  return MEMORY[0x1F41298A8]();
}

uint64_t sub_1C2C26948()
{
  return MEMORY[0x1F41298B8]();
}

uint64_t sub_1C2C26958()
{
  return MEMORY[0x1F41298C0]();
}

uint64_t sub_1C2C26968()
{
  return MEMORY[0x1F4129900]();
}

uint64_t sub_1C2C26978()
{
  return MEMORY[0x1F4129908]();
}

uint64_t sub_1C2C26988()
{
  return MEMORY[0x1F4129910]();
}

uint64_t sub_1C2C26998()
{
  return MEMORY[0x1F4129918]();
}

uint64_t sub_1C2C269A8()
{
  return MEMORY[0x1F4129920]();
}

uint64_t sub_1C2C269B8()
{
  return MEMORY[0x1F4129928]();
}

uint64_t sub_1C2C269C8()
{
  return MEMORY[0x1F4129930]();
}

uint64_t sub_1C2C269D8()
{
  return MEMORY[0x1F4129938]();
}

uint64_t sub_1C2C269E8()
{
  return MEMORY[0x1F4129940]();
}

uint64_t sub_1C2C269F8()
{
  return MEMORY[0x1F4129948]();
}

uint64_t sub_1C2C26A08()
{
  return MEMORY[0x1F4129950]();
}

uint64_t sub_1C2C26A18()
{
  return MEMORY[0x1F4129958]();
}

uint64_t sub_1C2C26A28()
{
  return MEMORY[0x1F4129960]();
}

uint64_t sub_1C2C26A48()
{
  return MEMORY[0x1F41299A8]();
}

uint64_t sub_1C2C26A58()
{
  return MEMORY[0x1F41299B0]();
}

uint64_t sub_1C2C26A68()
{
  return MEMORY[0x1F41299B8]();
}

uint64_t sub_1C2C26A78()
{
  return MEMORY[0x1F41299D0]();
}

uint64_t sub_1C2C26A88()
{
  return MEMORY[0x1F41299D8]();
}

uint64_t sub_1C2C26A98()
{
  return MEMORY[0x1F41299F0]();
}

uint64_t sub_1C2C26AA8()
{
  return MEMORY[0x1F41299F8]();
}

uint64_t sub_1C2C26AB8()
{
  return MEMORY[0x1F4129A08]();
}

uint64_t sub_1C2C26AC8()
{
  return MEMORY[0x1F4129A10]();
}

uint64_t sub_1C2C26AD8()
{
  return MEMORY[0x1F4129A18]();
}

uint64_t sub_1C2C26AE8()
{
  return MEMORY[0x1F4129A38]();
}

uint64_t sub_1C2C26AF8()
{
  return MEMORY[0x1F4129A40]();
}

uint64_t sub_1C2C26B08()
{
  return MEMORY[0x1F4129A48]();
}

uint64_t sub_1C2C26B18()
{
  return MEMORY[0x1F4129A50]();
}

uint64_t sub_1C2C26B28()
{
  return MEMORY[0x1F4129A58]();
}

uint64_t sub_1C2C26B38()
{
  return MEMORY[0x1F4129A60]();
}

uint64_t sub_1C2C26B48()
{
  return MEMORY[0x1F4129A68]();
}

uint64_t sub_1C2C26B58()
{
  return MEMORY[0x1F4129A70]();
}

uint64_t sub_1C2C26B68()
{
  return MEMORY[0x1F4129A78]();
}

uint64_t sub_1C2C26B78()
{
  return MEMORY[0x1F4129A80]();
}

uint64_t sub_1C2C26B88()
{
  return MEMORY[0x1F4129AC0]();
}

uint64_t sub_1C2C26B98()
{
  return MEMORY[0x1F4129AD0]();
}

uint64_t sub_1C2C26BA8()
{
  return MEMORY[0x1F4129AE0]();
}

uint64_t sub_1C2C26BB8()
{
  return MEMORY[0x1F4129AF0]();
}

uint64_t sub_1C2C26BC8()
{
  return MEMORY[0x1F4129B18]();
}

uint64_t sub_1C2C26BD8()
{
  return MEMORY[0x1F4129B20]();
}

uint64_t sub_1C2C26BE8()
{
  return MEMORY[0x1F4129B68]();
}

uint64_t sub_1C2C26BF8()
{
  return MEMORY[0x1F4129B70]();
}

uint64_t sub_1C2C26C08()
{
  return MEMORY[0x1F4129B78]();
}

uint64_t sub_1C2C26C18()
{
  return MEMORY[0x1F4129BB8]();
}

uint64_t sub_1C2C26C28()
{
  return MEMORY[0x1F4129BC0]();
}

uint64_t sub_1C2C26C38()
{
  return MEMORY[0x1F4129BC8]();
}

uint64_t sub_1C2C26C48()
{
  return MEMORY[0x1F4129BD8]();
}

uint64_t sub_1C2C26C58()
{
  return MEMORY[0x1F4129BE0]();
}

uint64_t sub_1C2C26C68()
{
  return MEMORY[0x1F4129BE8]();
}

uint64_t sub_1C2C26C78()
{
  return MEMORY[0x1F4129BF0]();
}

uint64_t sub_1C2C26C88()
{
  return MEMORY[0x1F4129BF8]();
}

uint64_t sub_1C2C26C98()
{
  return MEMORY[0x1F4129C00]();
}

uint64_t sub_1C2C26CA8()
{
  return MEMORY[0x1F4129C08]();
}

uint64_t sub_1C2C26CB8()
{
  return MEMORY[0x1F4129C10]();
}

uint64_t sub_1C2C26CC8()
{
  return MEMORY[0x1F4129C18]();
}

uint64_t sub_1C2C26CD8()
{
  return MEMORY[0x1F4129C40]();
}

uint64_t sub_1C2C26CE8()
{
  return MEMORY[0x1F4129C48]();
}

uint64_t sub_1C2C26CF8()
{
  return MEMORY[0x1F4129C50]();
}

uint64_t sub_1C2C26D08()
{
  return MEMORY[0x1F4129C68]();
}

uint64_t sub_1C2C26D18()
{
  return MEMORY[0x1F4129C70]();
}

uint64_t sub_1C2C26D28()
{
  return MEMORY[0x1F4129CA0]();
}

uint64_t sub_1C2C26D38()
{
  return MEMORY[0x1F4129CA8]();
}

uint64_t sub_1C2C26D48()
{
  return MEMORY[0x1F4129CB8]();
}

uint64_t sub_1C2C26D58()
{
  return MEMORY[0x1F4129CF0]();
}

uint64_t sub_1C2C26D68()
{
  return MEMORY[0x1F4129CF8]();
}

uint64_t sub_1C2C26D78()
{
  return MEMORY[0x1F4129D00]();
}

uint64_t sub_1C2C26D88()
{
  return MEMORY[0x1F4129D08]();
}

uint64_t sub_1C2C26D98()
{
  return MEMORY[0x1F4129D10]();
}

uint64_t sub_1C2C26DA8()
{
  return MEMORY[0x1F41285E8]();
}

uint64_t sub_1C2C26DB8()
{
  return MEMORY[0x1F41285F0]();
}

uint64_t sub_1C2C26DC8()
{
  return MEMORY[0x1F4128600]();
}

uint64_t sub_1C2C26DD8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C2C26DE8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C2C26DF8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C2C26E08()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C2C26E18()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C2C26E28()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C2C26E38()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C2C26E48()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C2C26E58()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C2C26E68()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C2C26E78()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C2C26E88()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C2C26E98()
{
  return MEMORY[0x1F4129DA0]();
}

uint64_t sub_1C2C26EA8()
{
  return MEMORY[0x1F4129DA8]();
}

uint64_t sub_1C2C26EB8()
{
  return MEMORY[0x1F4129DB0]();
}

uint64_t sub_1C2C26EC8()
{
  return MEMORY[0x1F4129DB8]();
}

uint64_t sub_1C2C26ED8()
{
  return MEMORY[0x1F4129DC0]();
}

uint64_t sub_1C2C26EE8()
{
  return MEMORY[0x1F4166698]();
}

uint64_t sub_1C2C26EF8()
{
  return MEMORY[0x1F4129DE0]();
}

uint64_t sub_1C2C26F08()
{
  return MEMORY[0x1F4129DE8]();
}

uint64_t sub_1C2C26F18()
{
  return MEMORY[0x1F4129DF8]();
}

uint64_t sub_1C2C26F28()
{
  return MEMORY[0x1F4129E00]();
}

uint64_t sub_1C2C26F38()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C2C26F58()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C2C26F68()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C2C26F78()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1C2C26F88()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C2C26F98()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C2C26FA8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C2C26FB8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C2C26FC8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C2C26FD8()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1C2C26FF8()
{
  return MEMORY[0x1F41859C8]();
}

uint64_t sub_1C2C27008()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C2C27018()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1C2C27028()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C2C27038()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C2C27048()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AMSHashIfNeeded()
{
  return MEMORY[0x1F410A938]();
}

uint64_t AMSLogableError()
{
  return MEMORY[0x1F410A948]();
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextFillPath(CGContextRef c)
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

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGPathAddRelativeArc(CGMutablePathRef path, const CGAffineTransform *matrix, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat delta)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}