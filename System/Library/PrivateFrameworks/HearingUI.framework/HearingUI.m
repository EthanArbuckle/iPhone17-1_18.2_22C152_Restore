void sub_226B67818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B6C754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B6D05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_226B6D3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_226B6F1AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id colorForThreshold(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F825C8] colorWithRed:0.0156862745 green:0.870588235 blue:0.502222222 alpha:1.0];
  if (a1 == 100 || a1 == 80)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.8 blue:0.0 alpha:1.0];

    uint64_t v2 = (void *)v3;
  }
  return v2;
}

void sub_226B73004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B73910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B746BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B748F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B749FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226B75A8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_226B75F2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226B7729C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B77368(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226B78038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B788FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B78E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)FrontBoardServicesLibrary();
  result = dlsym(v2, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

uint64_t FrontBoardServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2647CD758;
    uint64_t v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = FrontBoardServicesLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)FrontBoardServicesLibrary();
  uint64_t result = dlsym(v2, "FBSOpenApplicationOptionKeyUnlockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)FrontBoardServicesLibrary();
  uint64_t result = dlsym(v2, "FBSOpenApplicationOptionKeyLaunchOrigin");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2647CD790;
    uint64_t v5 = 0;
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getLSApplicationWorkspaceClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("LSApplicationWorkspace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getLSApplicationWorkspaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_226B7B5A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_226B7B6D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226B7B918(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double AXHARoundToPixel(double a1)
{
  double v2 = *(double *)&AXHARoundToPixel_scale;
  if (*(double *)&AXHARoundToPixel_scale == -1.0)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", *(double *)&AXHARoundToPixel_scale);
    [v3 scale];
    AXHARoundToPixel_scale = v4;

    double v2 = *(double *)&AXHARoundToPixel_scale;
  }
  return round(v2 * a1) / v2;
}

double HUICCFooterHeight(int a1)
{
  if (a1) {
    double v1 = 540.0;
  }
  else {
    double v1 = 740.0;
  }
  if (a1) {
    double v2 = 340.0;
  }
  else {
    double v2 = 640.0;
  }
  if (a1) {
    double v3 = 340.0;
  }
  else {
    double v3 = 540.0;
  }
  if (a1) {
    double v4 = 0.0;
  }
  else {
    double v4 = 177.0;
  }
  if (a1) {
    double v5 = 0.0;
  }
  else {
    double v5 = 176.0;
  }
  if (a1) {
    double v6 = 0.0;
  }
  else {
    double v6 = 169.0;
  }
  if (a1) {
    double v7 = 0.0;
  }
  else {
    double v7 = 172.0;
  }
  v9.origin.x = HUIReferenceScreenBounds();
  if (CGRectGetWidth(v9) >= 1024.0
    && [MEMORY[0x263F472B0] deviceIsPad]
    && ([MEMORY[0x263F472B0] deviceHasHomeButton] & 1) != 0)
  {
    return v2;
  }
  v10.origin.x = HUIReferenceScreenBounds();
  if (CGRectGetWidth(v10) >= 1024.0
    && [MEMORY[0x263F472B0] deviceIsPad]
    && ![MEMORY[0x263F472B0] deviceHasHomeButton])
  {
    return v1;
  }
  v11.origin.x = HUIReferenceScreenBounds();
  if (CGRectGetWidth(v11) >= 834.0
    && [MEMORY[0x263F472B0] deviceIsPad]
    && ![MEMORY[0x263F472B0] deviceHasHomeButton])
  {
    return v2;
  }
  v12.origin.x = HUIReferenceScreenBounds();
  if (CGRectGetWidth(v12) < 834.0
    || ![MEMORY[0x263F472B0] deviceIsPad]
    || (double v1 = v2, ([MEMORY[0x263F472B0] deviceHasHomeButton] & 1) == 0))
  {
    double v1 = v3;
    if (([MEMORY[0x263F472B0] deviceIsPad] & 1) == 0)
    {
      v13.origin.x = HUIReferenceScreenBounds();
      double v1 = v4;
      if (CGRectGetWidth(v13) < 428.0)
      {
        v14.origin.x = HUIReferenceScreenBounds();
        if (CGRectGetWidth(v14) < 414.0 || [MEMORY[0x263F472B0] deviceHasHomeButton])
        {
          v15.origin.x = HUIReferenceScreenBounds();
          double v1 = v5;
          if (CGRectGetWidth(v15) < 414.0)
          {
            v16.origin.x = HUIReferenceScreenBounds();
            if (CGRectGetWidth(v16) >= 390.0)
            {
              return v7;
            }
            else
            {
              v17.origin.x = HUIReferenceScreenBounds();
              if (CGRectGetWidth(v17) < 375.0 || [MEMORY[0x263F472B0] deviceHasHomeButton])
              {
                v18.origin.x = HUIReferenceScreenBounds();
                if (CGRectGetWidth(v18) < 375.0) {
                  return v7;
                }
                else {
                  return v6;
                }
              }
              else
              {
                return v6;
              }
            }
          }
        }
        else
        {
          return v5;
        }
      }
    }
  }
  return v1;
}

double HUIReferenceScreenBounds()
{
  if (HUIReferenceScreenBounds_onceToken != -1) {
    dispatch_once(&HUIReferenceScreenBounds_onceToken, &__block_literal_global_3);
  }
  return *(double *)&HUIReferenceScreenBounds_ReferenceScreenBounds_0;
}

void __HUIReferenceScreenBounds_block_invoke()
{
  id v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 _referenceBounds];
  HUIReferenceScreenBounds_ReferenceScreenBounds_0 = v0;
  HUIReferenceScreenBounds_ReferenceScreenBounds_1 = v1;
  HUIReferenceScreenBounds_ReferenceScreenBounds_2 = v2;
  HUIReferenceScreenBounds_ReferenceScreenBounds_3 = v3;
}

id accessibilityHearingUIBundle()
{
  uint64_t v0 = (void *)accessibilityHearingUIBundle_AXBundle;
  if (!accessibilityHearingUIBundle_AXBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v2 = (void *)accessibilityHearingUIBundle_AXBundle;
    accessibilityHearingUIBundle_AXBundle = v1;

    uint64_t v0 = (void *)accessibilityHearingUIBundle_AXBundle;
  }
  return v0;
}

id AXHAHearingDevicesIconImage()
{
  return accessibilityHearingAidImageNamed(@"hearingDevicesIcon");
}

id accessibilityHearingAidImageNamed(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x263F827E8];
  uint64_t v3 = accessibilityHearingUIBundle();
  id v4 = [v2 imageNamed:v1 inBundle:v3];

  if (!v4)
  {
    id v4 = [MEMORY[0x263F827E8] systemImageNamed:v1];
  }

  return v4;
}

id attributedStringWithFeatureSettings(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  CGRect v12 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9];
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v9];
  }
  else
  {
    CGRect v14 = [v10 fontDescriptor];
    uint64_t v20 = *MEMORY[0x263F81748];
    v21[0] = v11;
    CGRect v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    CGRect v16 = [v14 fontDescriptorByAddingAttributes:v15];

    CGRect v17 = (void *)MEMORY[0x263F81708];
    [v16 pointSize];
    uint64_t v18 = objc_msgSend(v17, "fontWithDescriptor:size:", v16);

    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F814F0], v18, a4, a5);
    id v13 = v12;

    id v10 = (id)v18;
  }

  return v13;
}

void sub_226B7D000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B7DBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

void sub_226B7E3E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_226B7F718(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_226B7F8EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226B7FB6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226B7FDBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226B7FF44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226B80554(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_226B826E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226B829F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_226B85128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_226B85AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B86094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B86DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226B86EA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226B871E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HUICCViewTagForModule(uint64_t a1)
{
  return 2 * a1 + 95014;
}

id HUICCMenuTextLabel()
{
  uint64_t v0 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0]];
  id v1 = objc_alloc_init(MEMORY[0x263F828E0]);
  uint64_t v2 = (void *)MEMORY[0x263F81708];
  [v0 pointSize];
  uint64_t v3 = objc_msgSend(v2, "fontWithDescriptor:size:", v0);
  [v1 setFont:v3];

  [v1 setLineBreakMode:4];
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 setNumberOfLines:0];
  id v4 = [MEMORY[0x263F825C8] whiteColor];
  [v1 setTextColor:v4];

  [v1 setTextAlignment:1];
  return v1;
}

id HUICCImageViewWithImage(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F82828];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  [v3 setContentMode:1];
  [v3 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  id v4 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v4];

  double v5 = [MEMORY[0x263F825C8] systemWhiteColor];
  [v3 setTintColor:v5];

  [v3 setImage:v2];
  double v6 = [v3 heightAnchor];
  double v7 = [v6 constraintEqualToConstant:35.0];
  [v7 setActive:1];

  v8 = [v3 widthAnchor];
  id v9 = [v8 constraintEqualToConstant:35.0];
  [v9 setActive:1];

  return v3;
}

id HUICCButtonVCWithSystemImageName(void *a1)
{
  id v1 = (void *)MEMORY[0x263F82818];
  id v2 = a1;
  id v3 = [v1 configurationWithPointSize:4 weight:23.0];
  id v4 = [MEMORY[0x263F827E8] _systemImageNamed:v2 withConfiguration:v3];

  id v5 = objc_alloc(MEMORY[0x263F33CB8]);
  double v6 = [MEMORY[0x263F825C8] whiteColor];
  double v7 = (void *)[v5 initWithGlyphImage:v4 highlightColor:v6 useLightStyle:1];

  [v7 setLabelsVisible:0];
  [v7 setToggleStateOnTap:0];
  v8 = [v7 view];
  [v8 sizeToFit];

  id v9 = [v7 button];
  [v9 setHighlighted:0];

  id v10 = [v7 button];
  id v11 = [v10 widthAnchor];
  CGRect v12 = [v11 constraintEqualToConstant:54.0];
  [v12 setActive:1];

  id v13 = [v7 button];
  CGRect v14 = [v13 heightAnchor];
  CGRect v15 = [v14 constraintEqualToConstant:54.0];
  [v15 setActive:1];

  return v7;
}

uint64_t HUICCBackgroundMaterialView()
{
  return [MEMORY[0x263F33CA0] _moduleBackgroundMaterialView];
}

id HUICCBackgroundVisualStylingProviderForCategory(uint64_t a1)
{
  id v2 = [MEMORY[0x263F33CA0] _moduleBackgroundMaterialView];
  id v3 = [v2 visualStylingProviderForCategory:a1];

  return v3;
}

uint64_t HUICCLargeTextEnabled()
{
  uint64_t v0 = [MEMORY[0x263F82438] sharedApplication];
  id v1 = [v0 preferredContentSizeCategory];

  if (([v1 isEqualToString:*MEMORY[0x263F83420]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F83418]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F83410]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F83408]] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F83400]];
  }

  return v2;
}

void sub_226B8B0CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id attributedStringWithImage(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = (objc_class *)MEMORY[0x263F089B8];
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = a1;
  id v14 = objc_alloc_init(v9);
  CGRect v15 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v11];

  id v16 = objc_alloc_init(MEMORY[0x263F81678]);
  uint64_t v17 = [MEMORY[0x263F82818] configurationWithTextStyle:v10 scale:1];
  uint64_t v18 = [MEMORY[0x263F827E8] systemImageNamed:v13 withConfiguration:v17];

  v19 = [v18 imageWithTintColor:v12];

  uint64_t v20 = [v19 imageWithRenderingMode:1];

  v21 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v10 variant:a5];

  [v21 capHeight];
  double v23 = v22;
  [v20 size];
  float v25 = v23 - v24;
  double v26 = (float)(roundf(v25) * 0.5);
  [v20 size];
  double v28 = v27;
  [v20 size];
  objc_msgSend(v16, "setBounds:", 0.0, v26, v28, v29);
  [v16 setImage:v20];
  v30 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v16];
  [v14 appendAttributedString:v30];
  v31 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:@" "];
  [v14 appendAttributedString:v31];

  [v14 appendAttributedString:v15];
  return v14;
}

uint64_t sub_226B8BDDC()
{
  sub_226B96C48();
  sub_226B96C28();
  sub_226B96C58();
  swift_release();
  uint64_t v0 = sub_226B96C18();
  uint64_t result = swift_release();
  qword_268155C80 = v0;
  return result;
}

uint64_t sub_226B8BE34()
{
  sub_226B96C68();
  sub_226B96C38();
  uint64_t v0 = sub_226B96C58();
  uint64_t result = swift_release();
  qword_268155C88 = v0;
  return result;
}

uint64_t sub_226B8BE78()
{
  uint64_t v0 = sub_226B96B68();
  __swift_allocate_value_buffer(v0, qword_268155C90);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268155C90);
  uint64_t v2 = *MEMORY[0x263F199A0];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

void sub_226B8BF00(uint64_t a1)
{
}

void sub_226B8BF28(uint64_t a1)
{
}

void sub_226B8BF50(uint64_t a1)
{
}

void sub_226B8BF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  double v7 = (void *)sub_226B96DA8();
  id v8 = (id)hearingLocString();

  uint64_t v9 = sub_226B96DC8();
  uint64_t v11 = v10;

  *a4 = v9;
  *a5 = v11;
}

uint64_t sub_226B8BFEC(uint64_t a1)
{
  return sub_226B8C030(0.0156862745, 0.870588235, 0.502222222, a1, &qword_268155CD8);
}

uint64_t sub_226B8C014(uint64_t a1)
{
  return sub_226B8C030(1.0, 0.8, 0.0, a1, &qword_268155CE0);
}

uint64_t sub_226B8C030(double a1, double a2, double a3, uint64_t a4, uint64_t *a5)
{
  sub_226B96CF8();
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v11 + 104))(v10, *MEMORY[0x263F1B388]);
  uint64_t result = MEMORY[0x22A661EE0](v10, a1, a2, a3, 1.0);
  *a5 = result;
  return result;
}

uint64_t sub_226B8C124()
{
  id v0 = objc_msgSend(self, sel_darkGrayColor);
  uint64_t result = MEMORY[0x22A661EF0](v0);
  qword_268155CE8 = result;
  return result;
}

uint64_t sub_226B8C164@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  id v4 = (int *)type metadata accessor for SoundMeterView(0);
  sub_226B96938();
  id v5 = (void *)((char *)a2 + v4[7]);
  *id v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155568);
  swift_storeEnumTagMultiPayload();
  sub_226B92E58(a1, v13);
  double v6 = (char *)a2 + v4[8];
  long long v7 = v13[1];
  *(_OWORD *)double v6 = v13[0];
  *((_OWORD *)v6 + 1) = v7;
  *((void *)v6 + 4) = v14;
  double v8 = 5.0;
  if (!a1) {
    goto LABEL_4;
  }
  if (a1 == 1)
  {
    double v8 = 2.5;
LABEL_4:
    uint64_t v9 = (double *)((char *)a2 + v4[6]);
    *uint64_t v9 = 0.5;
    v9[1] = v8;
    v9[2] = 2.5;
    uint64_t v10 = (void *)((char *)a2 + v4[9]);
    type metadata accessor for SoundMeterData(0);
    sub_226B94438(&qword_2681557A8, (void (*)(uint64_t))type metadata accessor for SoundMeterData);
    uint64_t result = sub_226B969F8();
    *uint64_t v10 = result;
    v10[1] = v12;
    return result;
  }
  uint64_t result = sub_226B96E98();
  __break(1u);
  return result;
}

uint64_t sub_226B8C300@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v70 = a1;
  uint64_t v3 = sub_226B96B58();
  uint64_t v68 = *(void *)(v3 - 8);
  uint64_t v69 = v3;
  MEMORY[0x270FA5388](v3);
  v67 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226B96BD8();
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  MEMORY[0x270FA5388](v5);
  v58 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155598);
  MEMORY[0x270FA5388](v56);
  double v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681555A0);
  MEMORY[0x270FA5388](v57);
  uint64_t v53 = (uint64_t)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_226B96B68();
  uint64_t v54 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SoundMeterView(0);
  MEMORY[0x270FA5388](v13);
  CGRect v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681555A8);
  MEMORY[0x270FA5388](v55);
  uint64_t v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681555B0);
  uint64_t v18 = MEMORY[0x270FA5388](v72);
  uint64_t v20 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  double v22 = (char *)&v52 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681555B8);
  uint64_t v64 = *(void *)(v23 - 8);
  uint64_t v65 = v23;
  MEMORY[0x270FA5388](v23);
  v71 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681555C0);
  uint64_t v25 = MEMORY[0x270FA5388](v62);
  v63 = (char *)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v61 = (char *)&v52 - v27;
  uint64_t v28 = sub_226B96B88();
  uint64_t v29 = *(void *)(v1 + *(int *)(v13 + 24));
  *(void *)uint64_t v17 = v28;
  *((void *)v17 + 1) = v29;
  v17[16] = 0;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681555C8);
  sub_226B8CD60(v1, (uint64_t)&v17[*(int *)(v30 + 44)]);
  int v31 = *(unsigned __int8 *)(v1 + *(int *)(v13 + 32) + 26);
  uint64_t v66 = v2;
  sub_226B94304(v2, (uint64_t)v15, type metadata accessor for SoundMeterView);
  if (v31 == 1)
  {
    sub_226B91DC4((uint64_t)v12);
    if (qword_2681554E8 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v10, (uint64_t)qword_268155C90);
    BOOL v33 = sub_226B9310C((uint64_t)v12, v32);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v12, v10);
    sub_226B91AF4((uint64_t)v15);
    if (v33)
    {
      sub_226B96D68();
      uint64_t v34 = v53;
      sub_226B8EA08(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v53, 0.0, 1, INFINITY, 0);
      sub_226B9423C(v34, (uint64_t)v8, &qword_2681555A0);
      swift_storeEnumTagMultiPayload();
      sub_226B91B50();
      sub_226B941F8(&qword_2681555D8, &qword_2681555A8);
      sub_226B96B98();
      sub_226B942A0(v34, &qword_2681555A0);
      goto LABEL_8;
    }
  }
  else
  {
    sub_226B91AF4((uint64_t)v15);
  }
  sub_226B9423C((uint64_t)v17, (uint64_t)v8, &qword_2681555A8);
  swift_storeEnumTagMultiPayload();
  sub_226B91B50();
  sub_226B941F8(&qword_2681555D8, &qword_2681555A8);
  sub_226B96B98();
LABEL_8:
  sub_226B943D4((uint64_t)v20, (uint64_t)v22, &qword_2681555B0);
  sub_226B942A0((uint64_t)v17, &qword_2681555A8);
  v35 = v58;
  sub_226B96BC8();
  unint64_t v36 = sub_226B91C38();
  sub_226B96CE8();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v35, v60);
  sub_226B942A0((uint64_t)v22, &qword_2681555B0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  if (v75 == 80)
  {
    if (qword_2681554F8 != -1) {
      swift_once();
    }
    v37 = &qword_268155CB8;
    goto LABEL_16;
  }
  if (!v75)
  {
    if (qword_2681554F0 != -1) {
      swift_once();
    }
    v37 = &qword_268155CA8;
LABEL_16:
    uint64_t v39 = *v37;
    unint64_t v38 = v37[1];
    swift_bridgeObjectRetain();
    goto LABEL_18;
  }
  uint64_t v39 = 0;
  unint64_t v38 = 0xE000000000000000;
LABEL_18:
  uint64_t v75 = v39;
  unint64_t v76 = v38;
  swift_bridgeObjectRetain();
  sub_226B96DD8();
  swift_bridgeObjectRelease();
  uint64_t v41 = v75;
  unint64_t v40 = v76;
  if (qword_268155500 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681555E8);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_226B9A170;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v43 = sub_226B8F30C();
  uint64_t v45 = v44;
  *(void *)(v42 + 56) = MEMORY[0x263F8D310];
  *(void *)(v42 + 64) = sub_226B92060();
  *(void *)(v42 + 32) = v43;
  *(void *)(v42 + 40) = v45;
  sub_226B96DB8();
  swift_bridgeObjectRelease();
  uint64_t v75 = v41;
  unint64_t v76 = v40;
  swift_bridgeObjectRetain();
  sub_226B96DD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v73 = v72;
  unint64_t v74 = v36;
  swift_getOpaqueTypeConformance2();
  sub_226B920B4();
  uint64_t v46 = (uint64_t)v63;
  uint64_t v47 = v65;
  v48 = v71;
  sub_226B96CD8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v48, v47);
  v49 = v67;
  sub_226B96B48();
  uint64_t v50 = (uint64_t)v61;
  sub_226B96A08();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v49, v69);
  sub_226B942A0(v46, &qword_2681555C0);
  return sub_226B943D4(v50, v70, &qword_2681555C0);
}

uint64_t sub_226B8CD60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155610);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155618);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v49 = (uint64_t)&v33 - v12;
  uint64_t v13 = (uint64_t *)(a1 + *(int *)(type metadata accessor for SoundMeterView(0) + 24));
  sub_226B96D68();
  sub_226B969D8();
  uint64_t v48 = v50;
  int v47 = v51;
  uint64_t v46 = v52;
  int v45 = v53;
  uint64_t v43 = v55;
  uint64_t v44 = v54;
  uint64_t v42 = sub_226B96AF8();
  sub_226B8D20C(a1, (uint64_t)v62);
  *(_OWORD *)&v64[103] = v62[6];
  *(_OWORD *)&v64[119] = v62[7];
  *(_OWORD *)&v64[135] = v63[0];
  *(_OWORD *)&v64[146] = *(_OWORD *)((char *)v63 + 11);
  *(_OWORD *)&v64[39] = v62[2];
  *(_OWORD *)&v64[55] = v62[3];
  *(_OWORD *)&v64[71] = v62[4];
  *(_OWORD *)&v64[87] = v62[5];
  *(_OWORD *)&v64[7] = v62[0];
  char v65 = 1;
  *(_OWORD *)&v64[23] = v62[1];
  int v41 = 1;
  int v40 = sub_226B96BF8();
  char v66 = 1;
  uint64_t v14 = *v13;
  *(void *)uint64_t v6 = sub_226B96B78();
  *((void *)v6 + 1) = v14;
  v6[16] = 0;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155620);
  sub_226B8E5D8(a1, (uint64_t)&v6[*(int *)(v15 + 44)]);
  LOBYTE(a1) = sub_226B96BF8();
  sub_226B9423C((uint64_t)v6, (uint64_t)v11, &qword_268155610);
  uint64_t v16 = &v11[*(int *)(v8 + 44)];
  char *v16 = a1;
  *(_OWORD *)(v16 + 8) = 0u;
  *(_OWORD *)(v16 + 24) = 0u;
  v16[40] = 1;
  sub_226B942A0((uint64_t)v6, &qword_268155610);
  uint64_t v17 = v49;
  sub_226B943D4((uint64_t)v11, v49, &qword_268155618);
  sub_226B96D68();
  sub_226B969D8();
  uint64_t v39 = v56;
  int v38 = v57;
  uint64_t v37 = v58;
  int v36 = v59;
  uint64_t v34 = v61;
  uint64_t v35 = v60;
  LOBYTE(a1) = v66;
  sub_226B9423C(v17, (uint64_t)v11, &qword_268155618);
  *(_OWORD *)((char *)&v68[7] + 1) = *(_OWORD *)&v64[112];
  *(_OWORD *)((char *)&v68[8] + 1) = *(_OWORD *)&v64[128];
  *(_OWORD *)((char *)&v68[9] + 1) = *(_OWORD *)&v64[144];
  long long v18 = *(_OWORD *)&v64[32];
  *(_OWORD *)((char *)&v68[3] + 1) = *(_OWORD *)&v64[48];
  *(_OWORD *)((char *)&v68[4] + 1) = *(_OWORD *)&v64[64];
  *(_OWORD *)((char *)&v68[5] + 1) = *(_OWORD *)&v64[80];
  *(_OWORD *)((char *)&v68[6] + 1) = *(_OWORD *)&v64[96];
  long long v19 = *(_OWORD *)&v64[16];
  *(_OWORD *)((char *)v68 + 1) = *(_OWORD *)v64;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = v48;
  *(unsigned char *)(a2 + 24) = v47;
  *(void *)(a2 + 32) = v46;
  *(unsigned char *)(a2 + 40) = v45;
  uint64_t v21 = v42;
  uint64_t v20 = v43;
  *(void *)(a2 + 48) = v44;
  *(void *)(a2 + 56) = v20;
  long long v67 = (unint64_t)v21;
  LOBYTE(v13) = v40;
  LOBYTE(v17) = v41;
  LOBYTE(v68[0]) = v41;
  *(_WORD *)((char *)&v68[10] + 1) = *(_WORD *)&v64[160];
  *(_OWORD *)((char *)&v68[1] + 1) = v19;
  *(_OWORD *)((char *)&v68[2] + 1) = v18;
  BYTE8(v68[10]) = v40;
  long long v69 = 0u;
  long long v70 = 0u;
  char v71 = a1;
  *(unsigned char *)(a2 + 288) = a1;
  long long v22 = v68[8];
  *(_OWORD *)(a2 + 192) = v68[7];
  *(_OWORD *)(a2 + 208) = v22;
  long long v23 = v68[4];
  *(_OWORD *)(a2 + 128) = v68[3];
  *(_OWORD *)(a2 + 144) = v23;
  long long v24 = v68[6];
  *(_OWORD *)(a2 + 160) = v68[5];
  *(_OWORD *)(a2 + 176) = v24;
  long long v25 = v68[0];
  *(_OWORD *)(a2 + 64) = v67;
  *(_OWORD *)(a2 + 80) = v25;
  long long v26 = v68[2];
  *(_OWORD *)(a2 + 96) = v68[1];
  *(_OWORD *)(a2 + 112) = v26;
  long long v27 = v68[10];
  *(_OWORD *)(a2 + 224) = v68[9];
  *(_OWORD *)(a2 + 240) = v27;
  long long v28 = v70;
  *(_OWORD *)(a2 + 256) = v69;
  *(_OWORD *)(a2 + 272) = v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155628);
  sub_226B9423C((uint64_t)v11, a2 + *(int *)(v29 + 64), &qword_268155618);
  uint64_t v30 = a2 + *(int *)(v29 + 80);
  *(void *)uint64_t v30 = 0;
  *(unsigned char *)(v30 + 8) = 1;
  *(void *)(v30 + 16) = v39;
  *(unsigned char *)(v30 + 24) = v38;
  *(void *)(v30 + 32) = v37;
  *(unsigned char *)(v30 + 40) = v36;
  uint64_t v31 = v34;
  *(void *)(v30 + 48) = v35;
  *(void *)(v30 + 56) = v31;
  sub_226B93678((uint64_t)&v67);
  sub_226B942A0(v49, &qword_268155618);
  sub_226B942A0((uint64_t)v11, &qword_268155618);
  long long v81 = *(_OWORD *)&v64[112];
  long long v82 = *(_OWORD *)&v64[128];
  long long v83 = *(_OWORD *)&v64[144];
  long long v77 = *(_OWORD *)&v64[48];
  long long v78 = *(_OWORD *)&v64[64];
  long long v79 = *(_OWORD *)&v64[80];
  long long v80 = *(_OWORD *)&v64[96];
  long long v74 = *(_OWORD *)v64;
  long long v75 = *(_OWORD *)&v64[16];
  v72[0] = v21;
  v72[1] = 0;
  char v73 = v17;
  __int16 v84 = *(_WORD *)&v64[160];
  long long v76 = *(_OWORD *)&v64[32];
  char v85 = (char)v13;
  long long v86 = 0u;
  long long v87 = 0u;
  char v88 = a1;
  return sub_226B937D0((uint64_t)v72);
}

uint64_t sub_226B8D20C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_226B8D4BC(&v30);
  uint64_t v23 = v32;
  uint64_t v24 = v31;
  uint64_t v28 = v30;
  uint64_t v29 = v33;
  uint64_t v25 = v34;
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for SoundMeterView(0) + 32) + 25) == 1)
  {
    sub_226B8D798((uint64_t)&v30);
    uint64_t v4 = v30;
    uint64_t v5 = v31;
    uint64_t v6 = v32;
    uint64_t v7 = v33;
    uint64_t v8 = v34;
    uint64_t v27 = v35;
    uint64_t v21 = v36;
    sub_226B937C0(v30, v31, v32);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v9 = v4;
    uint64_t v19 = v6;
    uint64_t v20 = v5;
    sub_226B93918(v4, v5, v6);
    uint64_t v22 = v8;
    swift_release();
    uint64_t v26 = v7;
    swift_bridgeObjectRelease();
    char v18 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    char v18 = 0;
  }
  sub_226B8DA04(&v30);
  uint64_t v10 = v30;
  uint64_t v11 = v31;
  uint64_t v16 = v30;
  uint64_t v17 = v31;
  char v12 = v32;
  uint64_t v13 = v33;
  uint64_t KeyPath = swift_getKeyPath();
  LOBYTE(v30) = v12;
  *(void *)a2 = v28;
  *(void *)(a2 + 8) = v24;
  *(void *)(a2 + 16) = v23;
  *(void *)(a2 + 24) = v29;
  *(void *)(a2 + 32) = v25;
  *(void *)(a2 + 40) = v9;
  *(void *)(a2 + 48) = v20;
  *(void *)(a2 + 56) = v19;
  *(void *)(a2 + 64) = v26;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v27;
  *(void *)(a2 + 88) = v21;
  *(void *)(a2 + 96) = 0;
  *(unsigned char *)(a2 + 104) = v18;
  *(void *)(a2 + 112) = v10;
  *(void *)(a2 + 120) = v11;
  *(unsigned char *)(a2 + 128) = v12;
  *(void *)(a2 + 136) = v13;
  *(void *)(a2 + 144) = KeyPath;
  *(_WORD *)(a2 + 152) = 258;
  *(unsigned char *)(a2 + 154) = 1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_226B93770(v9, v20, v19, v26);
  sub_226B937C0(v16, v17, v12);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_226B93918(v16, v17, v12);
  swift_release();
  swift_bridgeObjectRelease();
  sub_226B938C8(v9, v20, v19, v26);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_226B8D4BC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SoundMeterView(0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  if (v9 >= 0.0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_226B969A8();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v2 = sub_226B96D28();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)&v9 == 80)
  {
    if (qword_268155510 != -1) {
      swift_once();
    }
    uint64_t v3 = &qword_268155CE0;
  }
  else if (v9 == 0.0)
  {
    if (qword_268155508 != -1) {
      swift_once();
    }
    uint64_t v3 = &qword_268155CD8;
  }
  else
  {
    if (qword_268155518 != -1) {
      swift_once();
    }
    uint64_t v3 = &qword_268155CE8;
  }
  uint64_t v4 = *v3;
  swift_retain();
  uint64_t KeyPath = swift_getKeyPath();
  if (qword_2681554D8 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_268155C80;
  uint64_t v7 = swift_getKeyPath();
  *a1 = v2;
  a1[1] = KeyPath;
  a1[2] = v4;
  a1[3] = v7;
  a1[4] = v6;
  return swift_retain();
}

uint64_t sub_226B8D798@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for SoundMeterView(0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  if (v15 >= 0.0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_226B969A8();
    swift_release();
    swift_release();
    swift_release();
    if (*(void *)&v15 == 80)
    {
      if (qword_2681554F8 == -1)
      {
LABEL_8:
        swift_bridgeObjectRetain();
        goto LABEL_9;
      }
LABEL_12:
      swift_once();
      goto LABEL_8;
    }
    if (v15 == 0.0)
    {
      if (qword_2681554F0 == -1) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
LABEL_9:
  sub_226B920B4();
  uint64_t v2 = sub_226B96C98();
  uint64_t v4 = v3;
  char v6 = v5;
  if (qword_2681554D8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226B96C88();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  sub_226B93918(v2, v4, v6 & 1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = 1;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_226B8DA04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  v129 = a1;
  uint64_t v3 = sub_226B96948();
  uint64_t v127 = *(void *)(v3 - 8);
  uint64_t v128 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v126 = (uint64_t)&v117 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v118 = (char *)&v117 - v6;
  uint64_t v7 = sub_226B968E8();
  uint64_t v123 = *(void *)(v7 - 8);
  uint64_t v124 = v7;
  MEMORY[0x270FA5388](v7);
  v125 = (char *)&v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_226B96B68();
  uint64_t v120 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  uint64_t v119 = (uint64_t)&v117 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SoundMeterView(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v122 = (uint64_t)&v117 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268155500 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681555E8);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_226B9A170;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v13 = sub_226B8F30C();
  uint64_t v15 = v14;
  *(void *)(v12 + 56) = MEMORY[0x263F8D310];
  *(void *)(v12 + 64) = sub_226B92060();
  *(void *)(v12 + 32) = v13;
  *(void *)(v12 + 40) = v15;
  *(double *)&uint64_t v16 = COERCE_DOUBLE(sub_226B96DB8());
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  double v132 = *(double *)&v16;
  unint64_t v133 = v18;
  uint64_t v130 = 32;
  unint64_t v131 = 0xE100000000000000;
  sub_226B920B4();
  uint64_t v19 = sub_226B96E38();
  swift_bridgeObjectRelease();
  if (*(void *)(v19 + 16) != 2)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = v2 + *(int *)(v10 + 20);
    uint64_t v22 = v126;
    uint64_t v23 = v127;
    uint64_t v24 = v128;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 16))(v126, v21, v128);
    uint64_t v25 = sub_226B96928();
    os_log_type_t v26 = sub_226B96DF8();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_226B65000, v25, v26, "Invalid string split.", v27, 2u);
      MEMORY[0x22A662A90](v27, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    goto LABEL_9;
  }
  uint64_t v126 = v10;
  swift_getKeyPath();
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  if (v132 < 0.0)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    double v132 = 0.0;
    unint64_t v133 = 0xE000000000000000;
    uint64_t result = sub_226B96C98();
    uint64_t v29 = result;
    uint64_t v31 = v30;
    char v33 = v32;
    uint64_t v35 = v34;
    goto LABEL_10;
  }
  uint64_t v37 = v2;
  int v38 = *(unsigned __int8 *)(v2 + *(int *)(v126 + 32) + 26);
  uint64_t v39 = v122;
  sub_226B94304(v2, v122, type metadata accessor for SoundMeterView);
  if (v38 != 1)
  {
    sub_226B91AF4(v39);
    uint64_t v41 = v123;
    uint64_t v40 = v124;
    goto LABEL_16;
  }
  uint64_t KeyPath = v119;
  sub_226B91DC4(v119);
  uint64_t v41 = v123;
  uint64_t v40 = v124;
  if (qword_2681554E8 != -1) {
    goto LABEL_34;
  }
  while (1)
  {
    uint64_t v42 = v121;
    uint64_t v43 = __swift_project_value_buffer(v121, (uint64_t)qword_268155C90);
    BOOL v44 = sub_226B9310C(KeyPath, v43);
    (*(void (**)(uint64_t, uint64_t))(v120 + 8))(KeyPath, v42);
    sub_226B91AF4(v39);
    if (v44) {
      uint64_t v45 = 10;
    }
    else {
LABEL_16:
    }
      uint64_t v45 = 32;
    if (*(void *)(v19 + 16)) {
      break;
    }
    __break(1u);
LABEL_34:
    swift_once();
  }
  uint64_t v124 = v45;
  unint64_t v46 = *(void *)(v19 + 40);
  double v132 = *(double *)(v19 + 32);
  unint64_t v133 = v46;
  swift_bridgeObjectRetain();
  int v47 = v125;
  sub_226B968D8();
  sub_226B96E48();
  char v49 = v48;
  uint64_t v50 = *(void (**)(char *, uint64_t))(v41 + 8);
  v50(v47, v40);
  swift_bridgeObjectRelease();
  if ((v49 & 1) == 0)
  {
    unint64_t v51 = *(void *)(v19 + 40);
    double v132 = *(double *)(v19 + 32);
    unint64_t v133 = v51;
    swift_bridgeObjectRetain_n();
    sub_226B96DD8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_226B96C98();
    uint64_t v54 = v53;
    char v56 = v55;
    uint64_t v58 = v57;
    if (qword_2681554D8 != -1) {
      swift_once();
    }
    char v59 = v56 & 1;
    uint64_t v60 = sub_226B96C88();
    uint64_t v127 = v61;
    uint64_t v128 = v60;
    char v63 = v62;
    uint64_t v65 = v64;
    sub_226B93918(v52, v54, v59);
    swift_bridgeObjectRelease();
    if (*(void *)(v19 + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      uint64_t v126 = v65;
      double v66 = *(double *)(v19 + 48);
      unint64_t v67 = *(void *)(v19 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      double v132 = v66;
      unint64_t v133 = v67;
      uint64_t v58 = sub_226B96C98();
      uint64_t v19 = v68;
      LOBYTE(v52) = v69;
      if (qword_2681554E0 == -1)
      {
LABEL_23:
        uint64_t v70 = sub_226B96C88();
        uint64_t v72 = v71;
        v125 = v73;
        LODWORD(v124) = v74 & 1;
        sub_226B93918(v58, v19, v52 & 1);
        swift_bridgeObjectRelease();
        char v75 = v63 & 1;
        uint64_t v76 = v127;
        uint64_t v77 = v128;
        uint64_t v29 = sub_226B96C78();
        uint64_t v31 = v78;
        char v33 = v79;
        uint64_t v35 = v80;
        sub_226B93918(v70, v72, v124);
        swift_bridgeObjectRelease();
        sub_226B93918(v77, v76, v75);
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    swift_once();
    goto LABEL_23;
  }
  if (*(void *)(v19 + 16) < 2uLL)
  {
    __break(1u);
LABEL_38:
    swift_once();
    goto LABEL_27;
  }
  unint64_t v81 = *(void *)(v19 + 56);
  double v132 = *(double *)(v19 + 48);
  unint64_t v133 = v81;
  swift_bridgeObjectRetain();
  long long v82 = v125;
  sub_226B968D8();
  sub_226B96E48();
  char v84 = v83;
  v50(v82, v40);
  swift_bridgeObjectRelease();
  if (v84)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v110 = v127;
    uint64_t v111 = v37 + *(int *)(v126 + 20);
    v112 = v118;
    uint64_t v113 = v128;
    (*(void (**)(char *, uint64_t, uint64_t))(v127 + 16))(v118, v111, v128);
    v114 = sub_226B96928();
    os_log_type_t v115 = sub_226B96DF8();
    if (os_log_type_enabled(v114, v115))
    {
      v116 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v116 = 0;
      _os_log_impl(&dword_226B65000, v114, v115, "Invalid string split -- no decimal value found.", v116, 2u);
      MEMORY[0x22A662A90](v116, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v110 + 8))(v112, v113);
    goto LABEL_9;
  }
  unint64_t v85 = *(void *)(v19 + 40);
  double v132 = *(double *)(v19 + 32);
  unint64_t v133 = v85;
  swift_bridgeObjectRetain_n();
  sub_226B96DD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v40 = sub_226B96C98();
  uint64_t v50 = v86;
  LOBYTE(v47) = v87;
  if (qword_2681554E0 != -1) {
    goto LABEL_38;
  }
LABEL_27:
  uint64_t v88 = sub_226B96C88();
  uint64_t v127 = v89;
  uint64_t v128 = v90;
  LODWORD(v126) = v91;
  sub_226B93918(v40, (uint64_t)v50, v47 & 1);
  swift_bridgeObjectRelease();
  double v92 = *(double *)(v19 + 48);
  unint64_t v93 = *(void *)(v19 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  double v132 = v92;
  unint64_t v133 = v93;
  uint64_t v94 = sub_226B96C98();
  uint64_t v96 = v95;
  char v98 = v97;
  if (qword_2681554D8 != -1) {
    swift_once();
  }
  uint64_t v99 = sub_226B96C88();
  uint64_t v101 = v100;
  v125 = v102;
  char v104 = v103 & 1;
  sub_226B93918(v94, v96, v98 & 1);
  swift_bridgeObjectRelease();
  char v105 = v126 & 1;
  uint64_t v106 = v127;
  uint64_t v126 = v88;
  uint64_t v29 = sub_226B96C78();
  uint64_t v31 = v107;
  char v33 = v108;
  uint64_t v35 = v109;
  sub_226B93918(v99, v101, v104);
  swift_bridgeObjectRelease();
  sub_226B93918(v126, v106, v105);
  uint64_t result = swift_bridgeObjectRelease();
LABEL_10:
  unsigned __int8 v36 = v129;
  uint64_t *v129 = v29;
  v36[1] = v31;
  *((unsigned char *)v36 + 16) = v33 & 1;
  v36[3] = v35;
  return result;
}

uint64_t sub_226B8E5D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155630);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155638);
  uint64_t v38 = *(void *)(v7 - 8);
  uint64_t v39 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v32 = (uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155640);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v37 = (uint64_t)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v32 - v12;
  uint64_t v14 = type metadata accessor for SoundMeterView(0);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = *(void *)(v14 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v14);
  sub_226B94304(a1, (uint64_t)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SoundMeterView);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_allocObject();
  sub_226B9436C((uint64_t)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, type metadata accessor for SoundMeterView);
  uint64_t v20 = *(int *)(v15 + 40);
  uint64_t v33 = a1;
  uint64_t v21 = a1 + v20;
  int v22 = *(unsigned __int8 *)(v21 + 24);
  if (*(void *)(*(void *)(v21 + 32) + 16)) {
    type metadata accessor for Pill();
  }
  sub_226B96D68();
  uint64_t v23 = 1;
  sub_226B969D8();
  uint64_t v36 = v40;
  char v24 = v41;
  uint64_t v25 = v42;
  int v35 = v43;
  uint64_t v26 = v45;
  uint64_t v34 = v44;
  if (v22)
  {
    *(void *)uint64_t v6 = sub_226B96B08();
    *((void *)v6 + 1) = 0;
    v6[16] = 1;
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155650);
    sub_226B8FC70(v33, (uint64_t *)&v6[*(int *)(v27 + 44)]);
    uint64_t v28 = v32;
    sub_226B9423C((uint64_t)v6, v32, &qword_268155630);
    *(void *)(v28 + *(int *)(v39 + 36)) = 0x3FE0000000000000;
    sub_226B942A0((uint64_t)v6, &qword_268155630);
    sub_226B943D4(v28, (uint64_t)v13, &qword_268155638);
    uint64_t v23 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v13, v23, 1, v39);
  uint64_t v29 = v37;
  sub_226B9423C((uint64_t)v13, v37, &qword_268155640);
  *(void *)a2 = sub_226B9392C;
  *(void *)(a2 + 8) = v19;
  *(void *)(a2 + 16) = v36;
  *(unsigned char *)(a2 + 24) = v24;
  *(void *)(a2 + 32) = v25;
  *(unsigned char *)(a2 + 40) = v35;
  *(void *)(a2 + 48) = v34;
  *(void *)(a2 + 56) = v26;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155648);
  sub_226B9423C(v29, a2 + *(int *)(v30 + 48), &qword_268155640);
  swift_retain();
  sub_226B942A0((uint64_t)v13, &qword_268155640);
  sub_226B942A0(v29, &qword_268155640);
  return swift_release();
}

__n128 sub_226B8EA08@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_226B96E08();
    uint64_t v23 = (void *)sub_226B96BE8();
    sub_226B96918();
  }
  sub_226B96A28();
  sub_226B9423C(v13, a9, &qword_2681555A8);
  char v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2681555A0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *char v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_226B8EBC8@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v19[1] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155720);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155738);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155710);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    a2(v4);
    sub_226B9423C((uint64_t)v15, (uint64_t)v12, &qword_268155710);
    swift_storeEnumTagMultiPayload();
    sub_226B93F6C();
    sub_226B941F8(&qword_268155718, &qword_268155720);
    sub_226B96B98();
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = &qword_268155710;
  }
  else
  {
    sub_226B9423C(v4, (uint64_t)v9, &qword_268155720);
    sub_226B9423C((uint64_t)v9, (uint64_t)v12, &qword_268155720);
    swift_storeEnumTagMultiPayload();
    sub_226B93F6C();
    sub_226B941F8(&qword_268155718, &qword_268155720);
    sub_226B96B98();
    uint64_t v16 = (uint64_t)v9;
    uint64_t v17 = &qword_268155720;
  }
  return sub_226B942A0(v16, v17);
}

uint64_t sub_226B8EE34@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v19[1] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155780);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155798);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155770);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    a2(v4);
    sub_226B9423C((uint64_t)v15, (uint64_t)v12, &qword_268155770);
    swift_storeEnumTagMultiPayload();
    sub_226B94038(&qword_268155768, &qword_268155770, (void (*)(void))sub_226B94158);
    sub_226B94158();
    sub_226B96B98();
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = &qword_268155770;
  }
  else
  {
    sub_226B9423C(v4, (uint64_t)v9, &qword_268155780);
    sub_226B9423C((uint64_t)v9, (uint64_t)v12, &qword_268155780);
    swift_storeEnumTagMultiPayload();
    sub_226B94038(&qword_268155768, &qword_268155770, (void (*)(void))sub_226B94158);
    sub_226B94158();
    sub_226B96B98();
    uint64_t v16 = (uint64_t)v9;
    uint64_t v17 = &qword_268155780;
  }
  return sub_226B942A0(v16, v17);
}

uint64_t sub_226B8F0A0@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v19[1] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155740);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155748);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155750);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    a2(v4);
    sub_226B9423C((uint64_t)v15, (uint64_t)v12, &qword_268155750);
    swift_storeEnumTagMultiPayload();
    sub_226B94038(&qword_268155758, &qword_268155750, (void (*)(void))sub_226B940B8);
    sub_226B940B8();
    sub_226B96B98();
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = &qword_268155750;
  }
  else
  {
    sub_226B9423C(v4, (uint64_t)v9, &qword_268155740);
    sub_226B9423C((uint64_t)v9, (uint64_t)v12, &qword_268155740);
    swift_storeEnumTagMultiPayload();
    sub_226B94038(&qword_268155758, &qword_268155750, (void (*)(void))sub_226B940B8);
    sub_226B940B8();
    sub_226B96B98();
    uint64_t v16 = (uint64_t)v9;
    uint64_t v17 = &qword_268155740;
  }
  return sub_226B942A0(v16, v17);
}

uint64_t sub_226B8F30C()
{
  sub_226B93638();
  id v0 = (void *)sub_226B96E18();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  objc_msgSend(v1, sel_setNumberStyle_, 1);
  objc_msgSend(v1, sel_setMaximumFractionDigits_, 0);
  uint64_t v2 = (void *)sub_226B96E28();
  id v3 = objc_msgSend(v1, sel_stringFromNumber_, v2);

  objc_msgSend(v1, sel_setNotANumberSymbol_, v3);
  id v4 = objc_msgSend(v1, sel_stringFromNumber_, v0);

  if (v4)
  {
    uint64_t v5 = sub_226B96DC8();
  }
  else
  {

    return 0;
  }
  return v5;
}

uint64_t sub_226B8F438@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SoundMeterView(0);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = sub_226B96B18();
  uint64_t v9 = (uint64_t *)(a1 + *(int *)(v5 + 40));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[4];
  sub_226B969E8();
  if (*(void *)(v11 + 16))
  {
    double v13 = v12;
    uint64_t v14 = type metadata accessor for Pill();
    double v15 = (v13
         - *(double *)(v11
                     + ((*(unsigned __int8 *)(*(void *)(v14 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80))
                     + *(int *)(v14 + 36))
         * (double)v10)
        / (double)v10;
  }
  else
  {
    double v15 = 0.0;
  }
  *(void *)a2 = v8;
  *(double *)(a2 + 8) = v15;
  *(unsigned char *)(a2 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681556E0);
  uint64_t v16 = swift_bridgeObjectRetain();
  size_t v17 = sub_226B9296C(v16);
  swift_bridgeObjectRelease();
  v22[1] = v17;
  swift_getKeyPath();
  sub_226B94304(a1, (uint64_t)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SoundMeterView);
  unint64_t v18 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = swift_allocObject();
  sub_226B9436C((uint64_t)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, type metadata accessor for SoundMeterView);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_226B93DAC;
  *(void *)(v20 + 24) = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681556E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681556F0);
  sub_226B941F8(&qword_2681556F8, &qword_2681556E8);
  sub_226B93ECC();
  return sub_226B96D48();
}

uint64_t sub_226B8F6EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155720);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (uint64_t *)&v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_226B8F820(a1);
  uint64_t v12 = v11;
  double v13 = sub_226B8F820(a1);
  swift_release();
  *uint64_t v10 = sub_226B96D68();
  v10[1] = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155730);
  sub_226B95608(a2, v12, (uint64_t)v10 + *(int *)(v15 + 44), v13);
  swift_release();
  char v16 = *(unsigned char *)(a2 + *(int *)(type metadata accessor for Pill() + 20));
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  sub_226B8EBC8(v16, (void (*)(uint64_t))sub_226B94030, a4);
  return sub_226B942A0((uint64_t)v10, &qword_268155720);
}

double sub_226B8F820(uint64_t a1)
{
  uint64_t v5 = type metadata accessor for SoundMeterView(0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = (void *)(v1 + *(int *)(v5 + 32));
  uint64_t v7 = v6[2];
  unint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_25;
  }
  double v9 = *(double *)(v7 + 32);
  if (v13 > v9)
  {
    if (v8 < 3)
    {
      __break(1u);
    }
    else
    {
      double v3 = *(double *)(v7 + 48);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_226B969A8();
      swift_release();
      swift_release();
      swift_release();
      if (*(void *)(v7 + 16))
      {
        if (!__OFSUB__(*v6, 1))
        {
          double v10 = (v13 - *(double *)(v7 + 32)) / (v3 - v9) * (double)(*v6 - 1) + 1.0;
          goto LABEL_9;
        }
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  if (!*(void *)(v7 + 16)) {
    goto LABEL_30;
  }
  double v10 = v13 / *(double *)(v7 + 32);
LABEL_9:
  double v11 = v10 - (double)a1;
  if (v11 <= 0.0) {
    double v11 = 0.0;
  }
  double v2 = 1.0;
  if (v11 <= 1.0) {
    double v3 = v11;
  }
  else {
    double v3 = 1.0;
  }
  if (v3 == 0.0)
  {
    if (qword_268155518 == -1) {
      goto LABEL_25;
    }
    goto LABEL_27;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_226B969A8();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)&v13 == 80)
  {
    if (qword_268155510 == -1) {
      goto LABEL_24;
    }
    goto LABEL_32;
  }
  if (v13 == 0.0)
  {
    if (qword_268155508 == -1) {
      goto LABEL_24;
    }
    goto LABEL_32;
  }
  if (qword_268155518 != -1) {
LABEL_32:
  }
    swift_once();
LABEL_24:
  double v2 = v3;
LABEL_25:
  swift_retain();
  return v2;
}

uint64_t sub_226B8FB80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_226B96D78();
  int v7 = sub_226B96BB8();
  sub_226B96D98();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268155710) + 36);
  uint64_t v13 = sub_226B96908();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v12, a2, v13);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681556C8);
  *(void *)(v12 + *(int *)(v14 + 36)) = v6;
  uint64_t v15 = v12 + *(int *)(v14 + 40);
  *(_DWORD *)uint64_t v15 = v7;
  *(void *)(v15 + 8) = v9;
  *(void *)(v15 + 16) = v11;
  *(unsigned char *)(v15 + 24) = 1;
  return sub_226B9423C(a1, a3, &qword_268155720);
}

uint64_t sub_226B8FC70@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v6 = type metadata accessor for SoundMeterView(0);
  uint64_t v7 = v6 - 8;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155658);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = a1 + *(int *)(v7 + 40);
  if (*(void *)(*(void *)(v16 + 16) + 16))
  {
    uint64_t v64 = v8;
    uint64_t v65 = &v54[-v14];
    uint64_t v61 = a2;
    char v62 = v15;
    uint64_t v58 = v11;
    uint64_t v63 = v13;
    uint64_t v67 = sub_226B8F30C();
    uint64_t v68 = v17;
    sub_226B920B4();
    uint64_t v8 = sub_226B96C98();
    uint64_t v2 = v18;
    char v3 = v19;
    if (qword_2681554E0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v20 = sub_226B96C88();
  uint64_t v59 = v21;
  uint64_t v60 = v20;
  LODWORD(v57) = v22;
  uint64_t v66 = v23;
  sub_226B93918(v8, v2, v3 & 1);
  swift_bridgeObjectRelease();
  uint64_t v67 = *(void *)(v16 + 32);
  sub_226B94304(a1, (uint64_t)&v54[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for SoundMeterView);
  unint64_t v24 = (*(unsigned __int8 *)(v64 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
  uint64_t v25 = swift_allocObject();
  sub_226B9436C((uint64_t)&v54[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)], v25 + v24, type metadata accessor for SoundMeterView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155660);
  sub_226B96908();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155668);
  sub_226B941F8(&qword_268155670, &qword_268155660);
  sub_226B93B80();
  sub_226B94438(&qword_2681556D0, (void (*)(uint64_t))type metadata accessor for Pill);
  long long v26 = v65;
  uint64_t result = sub_226B96D58();
  if (*(void *)(*(void *)(v16 + 16) + 16) < 3uLL)
  {
    __break(1u);
  }
  else
  {
    int v28 = v57 & 1;
    uint64_t v67 = sub_226B8F30C();
    uint64_t v68 = v29;
    uint64_t v30 = sub_226B96C98();
    uint64_t v32 = v31;
    char v34 = v33 & 1;
    uint64_t v35 = sub_226B96C88();
    uint64_t v56 = v36;
    uint64_t v57 = v35;
    uint64_t v64 = v37;
    char v39 = v38 & 1;
    sub_226B93918(v30, v32, v34);
    swift_bridgeObjectRelease();
    char v40 = v28;
    int v55 = v28;
    LOBYTE(v67) = v28;
    uint64_t v41 = v58;
    uint64_t v42 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v58 + 16);
    unsigned __int8 v43 = v62;
    uint64_t v44 = v63;
    v42((uint64_t)v62, v26, v63);
    uint64_t v46 = v60;
    uint64_t v45 = v61;
    uint64_t v47 = v59;
    uint64_t *v61 = v60;
    v45[1] = v47;
    *((unsigned char *)v45 + 16) = v40;
    v45[3] = v66;
    v45[4] = 0;
    *((unsigned char *)v45 + 40) = 1;
    char v48 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2681556D8);
    v42((uint64_t)v45 + v48[16], v43, v44);
    char v49 = (char *)v45 + v48[20];
    *(void *)char v49 = 0;
    v49[8] = 1;
    uint64_t v50 = (char *)v45 + v48[24];
    uint64_t v52 = v56;
    uint64_t v51 = v57;
    *(void *)uint64_t v50 = v57;
    *((void *)v50 + 1) = v52;
    v50[16] = v39;
    *((void *)v50 + 3) = v64;
    sub_226B937C0(v46, v47, v55);
    swift_bridgeObjectRetain();
    sub_226B937C0(v51, v52, v39);
    uint64_t v53 = *(void (**)(unsigned char *, uint64_t))(v41 + 8);
    swift_bridgeObjectRetain();
    v53(v65, v44);
    sub_226B93918(v51, v52, v39);
    swift_bridgeObjectRelease();
    v53(v43, v44);
    sub_226B93918(v46, v47, v67);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_226B901AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681556C8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155688);
  uint64_t v44 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for Pill() + 20)) == 1)
  {
    if (*(void *)(*(void *)(a2 + *(int *)(type metadata accessor for SoundMeterView(0) + 32) + 16) + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      uint64_t v45 = sub_226B8F30C();
      uint64_t v46 = v16;
      sub_226B920B4();
      uint64_t v17 = sub_226B96C98();
      uint64_t v41 = v18;
      uint64_t v42 = v17;
      int v40 = v19;
      uint64_t v43 = v20;
      int v39 = sub_226B96C08();
      sub_226B969C8();
      uint64_t v3 = v21;
      uint64_t v4 = v22;
      uint64_t v5 = v23;
      uint64_t v6 = v24;
      if (qword_2681554E0 == -1)
      {
LABEL_4:
        uint64_t v25 = qword_268155C88;
        uint64_t KeyPath = swift_getKeyPath();
        swift_retain();
        uint64_t v27 = sub_226B96D78();
        int v28 = sub_226B96BB8();
        sub_226B96D88();
        uint64_t v30 = v29;
        uint64_t v32 = v31;
        uint64_t v33 = sub_226B96908();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(v12, a1, v33);
        *(void *)&v12[*(int *)(v10 + 36)] = v27;
        char v34 = &v12[*(int *)(v10 + 40)];
        *(_DWORD *)char v34 = v28;
        *((void *)v34 + 1) = v30;
        *((void *)v34 + 2) = v32;
        v34[24] = 0;
        sub_226B9423C((uint64_t)v12, (uint64_t)&v15[*(int *)(v13 + 36)], &qword_2681556C8);
        uint64_t v35 = v41;
        *(void *)uint64_t v15 = v42;
        *((void *)v15 + 1) = v35;
        v15[16] = v40 & 1;
        *((void *)v15 + 3) = v43;
        v15[32] = v39;
        *((void *)v15 + 5) = v3;
        *((void *)v15 + 6) = v4;
        *((void *)v15 + 7) = v5;
        *((void *)v15 + 8) = v6;
        v15[72] = 0;
        *((void *)v15 + 10) = KeyPath;
        *((void *)v15 + 11) = v25;
        sub_226B942A0((uint64_t)v12, &qword_2681556C8);
        sub_226B943D4((uint64_t)v15, a3, &qword_268155688);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(a3, 0, 1, v13);
      }
    }
    swift_once();
    goto LABEL_4;
  }
  uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56);
  return v37(a3, 1, 1, v13);
}

uint64_t sub_226B9053C()
{
  return sub_226B96CC8();
}

double sub_226B9055C()
{
  return sub_226B90584();
}

double sub_226B90570()
{
  return sub_226B90584();
}

double sub_226B90584()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_226B969A8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_226B905F0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_226B969A8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SoundMeterData.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__slowLeq;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155528);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__fastLeq, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__thresholdLevel;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155540);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return v0;
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

uint64_t SoundMeterData.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__slowLeq;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155528);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__fastLeq, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__thresholdLevel;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155540);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v6, v7);
}

uint64_t sub_226B908C4()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_226B908D0()
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155540);
  uint64_t v1 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155528);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__slowLeq;
  unint64_t v15 = 0xBFF0000000000000;
  sub_226B96998();
  uint64_t v9 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v9(v8, v7, v4);
  uint64_t v10 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__fastLeq;
  unint64_t v15 = 0xBFF0000000000000;
  sub_226B96998();
  v9(v10, v7, v4);
  uint64_t v11 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__thresholdLevel;
  unint64_t v15 = 0;
  type metadata accessor for HCEDThresholdLevel(0);
  sub_226B96998();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v11, v3, v14);
  uint64_t v12 = OBJC_IVAR____TtC9HearingUI14SoundMeterData_didChange;
  sub_226B96988();
  swift_allocObject();
  *(void *)(v0 + v12) = sub_226B96978();
  return v0;
}

uint64_t sub_226B90B00@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SoundMeterData(0);
  uint64_t result = sub_226B96958();
  *a1 = result;
  return result;
}

uint64_t sub_226B90B40()
{
  return type metadata accessor for SoundMeterData(0);
}

uint64_t type metadata accessor for SoundMeterData(uint64_t a1)
{
  return sub_226B91918(a1, (uint64_t *)&unk_268155548);
}

void sub_226B90B68()
{
  sub_226B90CD0(319, &qword_268155558, MEMORY[0x263F8EF38], MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F)
  {
    sub_226B91A74(319, &qword_268155560, (uint64_t (*)(uint64_t))type metadata accessor for HCEDThresholdLevel, MEMORY[0x263EFDE58]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for SoundMeterData(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SoundMeterData);
}

void type metadata accessor for HCEDThresholdLevel(uint64_t a1)
{
}

void sub_226B90CD0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t *sub_226B90D1C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_226B96948();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = a3[7];
    uint64_t v13 = (char *)v4 + v11;
    uint64_t v14 = (char *)a2 + v11;
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    *((void *)v13 + 2) = *((void *)v14 + 2);
    unint64_t v15 = (uint64_t *)((char *)v4 + v12);
    uint64_t v16 = (uint64_t *)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268155568);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_226B96B68();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *unint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    uint64_t v21 = (char *)v4 + v19;
    uint64_t v22 = (char *)a2 + v19;
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
    *((void *)v21 + 2) = *((void *)v22 + 2);
    v21[24] = v22[24];
    *(_WORD *)(v21 + 25) = *(_WORD *)(v22 + 25);
    *((void *)v21 + 4) = *((void *)v22 + 4);
    uint64_t v23 = (uint64_t *)((char *)v4 + v20);
    uint64_t v24 = (uint64_t *)((char *)a2 + v20);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_226B90EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_226B96948();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_226B96B68();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *sub_226B91000(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226B96948();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  uint64_t v13 = (char *)a2 + v10;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((void *)v12 + 2) = *((void *)v13 + 2);
  uint64_t v14 = (void *)((char *)a1 + v11);
  unint64_t v15 = (void *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_226B96B68();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    void *v14 = *v15;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *((void *)v19 + 2) = *((void *)v20 + 2);
  v19[24] = v20[24];
  *(_WORD *)(v19 + 25) = *(_WORD *)(v20 + 25);
  *((void *)v19 + 4) = *((void *)v20 + 4);
  uint64_t v21 = (void *)((char *)a1 + v18);
  uint64_t v22 = (void *)((char *)a2 + v18);
  uint64_t v23 = v22[1];
  void *v21 = *v22;
  v21[1] = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_226B9118C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226B96948();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  if (a1 != a2)
  {
    uint64_t v13 = a3[7];
    uint64_t v14 = (void *)((char *)a1 + v13);
    unint64_t v15 = (void *)((char *)a2 + v13);
    sub_226B942A0((uint64_t)a1 + v13, &qword_268155568);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268155568);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_226B96B68();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      void *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(void *)uint64_t v18 = *(void *)((char *)a2 + v17);
  *((void *)v18 + 1) = *(void *)((char *)a2 + v17 + 8);
  *((void *)v18 + 2) = *(void *)((char *)a2 + v17 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18[24] = v19[24];
  v18[25] = v19[25];
  v18[26] = v19[26];
  *((void *)v18 + 4) = *((void *)v19 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  void *v21 = *v22;
  v21[1] = v22[1];
  swift_retain();
  swift_release();
  return a1;
}

void *sub_226B91374(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226B96948();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  uint64_t v13 = (char *)a2 + v10;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((void *)v12 + 2) = *((void *)v13 + 2);
  uint64_t v14 = (char *)a1 + v11;
  unint64_t v15 = (char *)a2 + v11;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_226B96B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = (char *)a1 + v18;
  uint64_t v21 = (char *)a2 + v18;
  long long v22 = *((_OWORD *)v21 + 1);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *((_OWORD *)v20 + 1) = v22;
  *((void *)v20 + 4) = *((void *)v21 + 4);
  *(_OWORD *)((char *)a1 + v19) = *(_OWORD *)((char *)a2 + v19);
  return a1;
}

void *sub_226B914DC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_226B96948();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *((void *)v11 + 2) = *((void *)v12 + 2);
  if (a1 != a2)
  {
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v13;
    unint64_t v15 = (char *)a2 + v13;
    sub_226B942A0((uint64_t)a1 + v13, &qword_268155568);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155568);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_226B96B68();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  *(_OWORD *)uint64_t v19 = *(_OWORD *)((char *)a2 + v18);
  *((void *)v19 + 2) = *(void *)((char *)a2 + v18 + 16);
  swift_bridgeObjectRelease();
  v19[24] = v20[24];
  v19[25] = v20[25];
  v19[26] = v20[26];
  *((void *)v19 + 4) = *((void *)v20 + 4);
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[9];
  long long v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *long long v22 = v25;
  v22[1] = v24;
  swift_release();
  return a1;
}

uint64_t sub_226B916A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226B916B8);
}

uint64_t sub_226B916B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_226B96948();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_5:
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v11(a1 + v9, a2, v7);
  }
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155570);
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[7];
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + a3[8] + 16);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_226B917D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226B917E4);
}

uint64_t sub_226B917E4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_226B96948();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268155570);
    if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
    {
      *(void *)(a1 + a4[8] + 16) = (a2 - 1);
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[7];
  }
  unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  return v13(a1 + v11, a2, a2, v9);
}

uint64_t type metadata accessor for SoundMeterView(uint64_t a1)
{
  return sub_226B91918(a1, (uint64_t *)&unk_268155578);
}

uint64_t sub_226B91918(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_226B91950()
{
  sub_226B96948();
  if (v0 <= 0x3F)
  {
    sub_226B91A74(319, &qword_268155588, MEMORY[0x263F19A00], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_226B91A74(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_226B91AD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_226B91AF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SoundMeterView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_226B91B50()
{
  unint64_t result = qword_2681555D0;
  if (!qword_2681555D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681555A0);
    sub_226B941F8(&qword_2681555D8, &qword_2681555A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681555D0);
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

unint64_t sub_226B91C38()
{
  unint64_t result = qword_2681555E0;
  if (!qword_2681555E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681555B0);
    sub_226B91B50();
    sub_226B941F8(&qword_2681555D8, &qword_2681555A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681555E0);
  }
  return result;
}

uint64_t sub_226B91CD8()
{
  return sub_226B96A38();
}

uint64_t sub_226B91CFC(uint64_t a1)
{
  uint64_t v2 = sub_226B96B68();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_226B96A48();
}

uint64_t sub_226B91DC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_226B96AE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155568);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226B9423C(v2, (uint64_t)v9, &qword_268155568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_226B96B68();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    os_log_type_t v12 = sub_226B96E08();
    unint64_t v13 = sub_226B96BE8();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      *(void *)(v14 + 4) = sub_226B923A8(0xD000000000000013, 0x8000000226B9CDE0, &v17);
      _os_log_impl(&dword_226B65000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A662A90](v15, -1, -1);
      MEMORY[0x22A662A90](v14, -1, -1);
    }

    sub_226B96AD8();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_226B92060()
{
  unint64_t result = qword_2681555F0;
  if (!qword_2681555F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681555F0);
  }
  return result;
}

unint64_t sub_226B920B4()
{
  unint64_t result = qword_2681555F8;
  if (!qword_2681555F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681555F8);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_226B92140(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681557B8);
  uint64_t v10 = *(void *)(type metadata accessor for Pill() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_226B96E78();
    __break(1u);
    return result;
  }
  _OWORD v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for Pill() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_226B92D00(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_226B923A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_226B9247C(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_226B935D8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_226B935D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_226B9247C(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_226B9257C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_226B96E68();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_226B9257C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_226B92614(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_226B92718(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_226B92718((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_226B92614(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_226B926B0(v2, 0);
      uint64_t result = sub_226B96E58();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_226B96DE8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_226B926B0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155600);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_226B92718(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268155600);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_226B92804@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_226B96A78();
  *a1 = result;
  return result;
}

uint64_t sub_226B92830()
{
  return sub_226B96A88();
}

uint64_t sub_226B92858@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_226B96A58();
  *a1 = result;
  return result;
}

uint64_t sub_226B92884()
{
  return sub_226B96A68();
}

uint64_t sub_226B928B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_226B96A98();
  *a1 = result;
  return result;
}

uint64_t sub_226B928DC()
{
  return sub_226B96AA8();
}

uint64_t sub_226B92908@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_226B96AB8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_226B9293C()
{
  return sub_226B96AC8();
}

size_t sub_226B9296C(uint64_t a1)
{
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155728);
  uint64_t v2 = MEMORY[0x270FA5388](v41);
  uint64_t v46 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v45 = (char *)v39 - v5;
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)v39 - v6;
  uint64_t v47 = v8;
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  size_t v11 = (void *)MEMORY[0x263F8EE78];
  uint64_t v44 = v10;
  v39[0] = a1;
  if (v10)
  {
    uint64_t v40 = (v9 + 32) & ~v9;
    uint64_t v12 = MEMORY[0x263F8EE78] + v40;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)(type metadata accessor for Pill() - 8);
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v42 = *(void *)(v15 + 72);
    uint64_t v43 = v7;
    v39[1] = v9 | 7;
    unint64_t v17 = v11;
    uint64_t v18 = v41;
    uint64_t v19 = v45;
    while (1)
    {
      uint64_t v20 = (uint64_t)&v46[*(int *)(v18 + 48)];
      sub_226B94304(v16, v20, (uint64_t (*)(void))type metadata accessor for Pill);
      uint64_t v21 = (uint64_t)v19 + *(int *)(v18 + 48);
      void *v19 = v13;
      sub_226B9436C(v20, v21, (uint64_t (*)(void))type metadata accessor for Pill);
      size_t result = sub_226B943D4((uint64_t)v19, (uint64_t)v7, &qword_268155728);
      if (v14)
      {
        size_t v11 = v17;
      }
      else
      {
        unint64_t v23 = v17[3];
        if ((uint64_t)((v23 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_34;
        }
        int64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
        if (v24 <= 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = v24;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681557A0);
        uint64_t v26 = *(void *)(v47 + 72);
        uint64_t v27 = v40;
        size_t v11 = (void *)swift_allocObject();
        size_t result = _swift_stdlib_malloc_size(v11);
        if (!v26) {
          goto LABEL_35;
        }
        int64_t v28 = result - v27;
        if (result - v27 == 0x8000000000000000 && v26 == -1) {
          goto LABEL_36;
        }
        uint64_t v30 = v28 / v26;
        v11[2] = v25;
        v11[3] = 2 * (v28 / v26);
        uint64_t v31 = (char *)v11 + v27;
        uint64_t v32 = v17[3] >> 1;
        uint64_t v33 = v32 * v26;
        if (v17[2])
        {
          if (v11 < v17 || v31 >= (char *)v17 + v40 + v33)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v11 != v17)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v17[2] = 0;
        }
        uint64_t v12 = (uint64_t)&v31[v33];
        uint64_t v14 = (v30 & 0x7FFFFFFFFFFFFFFFLL) - v32;
        size_t result = swift_release();
        uint64_t v18 = v41;
      }
      BOOL v35 = __OFSUB__(v14--, 1);
      int64_t v7 = v43;
      if (v35) {
        break;
      }
      ++v13;
      sub_226B943D4((uint64_t)v43, v12, &qword_268155728);
      v12 += *(void *)(v47 + 72);
      v16 += v42;
      unint64_t v17 = v11;
      if (v44 == v13) {
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v14 = 0;
LABEL_29:
  size_t result = swift_bridgeObjectRelease();
  unint64_t v36 = v11[3];
  if (v36 < 2) {
    return (size_t)v11;
  }
  unint64_t v37 = v36 >> 1;
  BOOL v35 = __OFSUB__(v37, v14);
  uint64_t v38 = v37 - v14;
  if (!v35)
  {
    v11[2] = v38;
    return (size_t)v11;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_226B92D00(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for Pill() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_226B96E88();
  __break(1u);
  return result;
}

uint64_t sub_226B92E58@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = (int *)type metadata accessor for Pill();
  uint64_t v5 = *((void *)v4 - 1);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681557B0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_226B9A180;
  *(_OWORD *)(v8 + 32) = xmmword_226B9A190;
  *(void *)(v8 + 48) = 0x405B800000000000;
  uint64_t v21 = v8;
  long long v22 = a2;
  if (a1)
  {
    if (a1 != 1)
    {
      uint64_t v25 = a1;
      uint64_t result = sub_226B96E98();
      __break(1u);
      return result;
    }
    int v20 = 0;
  }
  else
  {
    int v20 = 1;
  }
  unint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v10 = 18;
  long long v24 = xmmword_226B9A1A0;
  long long v23 = xmmword_226B9A1B0;
  do
  {
    sub_226B968F8();
    if (qword_268155518 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_268155CE8;
    v7[v4[5]] = v10 == 6;
    *(void *)&v7[v4[6]] = v11;
    *(void *)&v7[v4[7]] = 0x3FD3333333333333;
    *(void *)&v7[v4[8]] = a1;
    unint64_t v12 = (long long *)&v7[v4[9]];
    long long v13 = v23;
    *unint64_t v12 = v24;
    v12[1] = v13;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v9 = sub_226B92140(0, *(void *)(v9 + 16) + 1, 1, v9);
    }
    unint64_t v15 = *(void *)(v9 + 16);
    unint64_t v14 = *(void *)(v9 + 24);
    if (v15 >= v14 >> 1) {
      unint64_t v9 = sub_226B92140(v14 > 1, v15 + 1, 1, v9);
    }
    *(void *)(v9 + 16) = v15 + 1;
    uint64_t result = sub_226B9436C((uint64_t)v7, v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v15, (uint64_t (*)(void))type metadata accessor for Pill);
    --v10;
  }
  while (v10);
  uint64_t v18 = v21;
  unint64_t v17 = v22;
  *long long v22 = xmmword_226B9A1C0;
  *((void *)v17 + 2) = v18;
  LOBYTE(v18) = v20;
  *((unsigned char *)v17 + 24) = v20;
  *((unsigned char *)v17 + 25) = v18;
  *((unsigned char *)v17 + 26) = v18;
  *((void *)v17 + 4) = v9;
  return result;
}

BOOL sub_226B9310C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a2;
  uint64_t v3 = sub_226B96B68();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v18 - v8, a1, v3);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
  int v12 = v11(v9, v3);
  unint64_t v13 = 0;
  int v14 = *MEMORY[0x263F199C0];
  if (v12 != *MEMORY[0x263F199C0])
  {
    if (v12 == *MEMORY[0x263F199F0])
    {
      unint64_t v13 = 1;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199F8])
    {
      unint64_t v13 = 2;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199E8]) {
      goto LABEL_7;
    }
    if (v12 == *MEMORY[0x263F199B8])
    {
      unint64_t v13 = 4;
    }
    else if (v12 == *MEMORY[0x263F199C8])
    {
      unint64_t v13 = 5;
    }
    else if (v12 == *MEMORY[0x263F199A0])
    {
      unint64_t v13 = 6;
    }
    else if (v12 == *MEMORY[0x263F199D8])
    {
      unint64_t v13 = 7;
    }
    else if (v12 == *MEMORY[0x263F199D0])
    {
      unint64_t v13 = 8;
    }
    else if (v12 == *MEMORY[0x263F199E0])
    {
      unint64_t v13 = 9;
    }
    else if (v12 == *MEMORY[0x263F199A8])
    {
      unint64_t v13 = 10;
    }
    else
    {
      if (v12 != *MEMORY[0x263F199B0])
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_7:
        unint64_t v13 = 3;
        goto LABEL_24;
      }
      unint64_t v13 = 11;
    }
  }
LABEL_24:
  v10(v7, v19, v3);
  int v15 = v11(v7, v3);
  if (v15 == v14)
  {
    unint64_t v16 = 0;
  }
  else if (v15 == *MEMORY[0x263F199F0])
  {
    unint64_t v16 = 1;
  }
  else if (v15 == *MEMORY[0x263F199F8])
  {
    unint64_t v16 = 2;
  }
  else
  {
    if (v15 != *MEMORY[0x263F199E8])
    {
      if (v15 == *MEMORY[0x263F199B8])
      {
        unint64_t v16 = 4;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199C8])
      {
        unint64_t v16 = 5;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199A0])
      {
        unint64_t v16 = 6;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199D8])
      {
        unint64_t v16 = 7;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199D0])
      {
        unint64_t v16 = 8;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199E0])
      {
        unint64_t v16 = 9;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199A8])
      {
        unint64_t v16 = 10;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199B0])
      {
        unint64_t v16 = 11;
        return v13 >= v16;
      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    unint64_t v16 = 3;
  }
  return v13 >= v16;
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_226B935D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_226B93638()
{
  unint64_t result = qword_268155608;
  if (!qword_268155608)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268155608);
  }
  return result;
}

uint64_t sub_226B93678(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 144);
  uint64_t v9 = *(void *)(a1 + 136);
  char v7 = *(unsigned char *)(a1 + 152);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_226B93770(v6, v2, v3, v4);
  sub_226B937C0(v9, v8, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_226B93770(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_226B937C0(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_226B937C0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_226B937D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 144);
  uint64_t v9 = *(void *)(a1 + 136);
  char v7 = *(unsigned char *)(a1 + 152);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_226B938C8(v6, v2, v3, v4);
  sub_226B93918(v9, v8, v7);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_226B938C8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_226B93918(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_226B93918(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_226B9392C(uint64_t a1)
{
  return sub_226B93AEC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_226B8F438);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for SoundMeterView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v6 = sub_226B96948();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_226B96B68();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_226B93AD4(uint64_t a1)
{
  return sub_226B93AEC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_226B901AC);
}

uint64_t sub_226B93AEC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for SoundMeterView(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

unint64_t sub_226B93B80()
{
  unint64_t result = qword_268155678;
  if (!qword_268155678)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268155668);
    sub_226B93BF4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155678);
  }
  return result;
}

unint64_t sub_226B93BF4()
{
  unint64_t result = qword_268155680;
  if (!qword_268155680)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268155688);
    sub_226B93C94();
    sub_226B941F8(&qword_2681556C0, &qword_2681556C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155680);
  }
  return result;
}

unint64_t sub_226B93C94()
{
  unint64_t result = qword_268155690;
  if (!qword_268155690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268155698);
    sub_226B93D34();
    sub_226B941F8(&qword_2681556B0, &qword_2681556B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155690);
  }
  return result;
}

unint64_t sub_226B93D34()
{
  unint64_t result = qword_2681556A0;
  if (!qword_2681556A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681556A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681556A0);
  }
  return result;
}

uint64_t sub_226B93DAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for SoundMeterView(0) - 8);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_226B8F6EC(a1, a2, v8, a3);
}

uint64_t sub_226B93E34()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226B93E6C(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155728);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

unint64_t sub_226B93ECC()
{
  unint64_t result = qword_268155700;
  if (!qword_268155700)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681556F0);
    sub_226B93F6C();
    sub_226B941F8(&qword_268155718, &qword_268155720);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155700);
  }
  return result;
}

unint64_t sub_226B93F6C()
{
  unint64_t result = qword_268155708;
  if (!qword_268155708)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268155710);
    sub_226B941F8(&qword_268155718, &qword_268155720);
    sub_226B941F8(&qword_2681556C0, &qword_2681556C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155708);
  }
  return result;
}

uint64_t sub_226B94030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_226B8FB80(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_226B94038(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_226B940B8()
{
  unint64_t result = qword_268155760;
  if (!qword_268155760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268155740);
    sub_226B94038(&qword_268155768, &qword_268155770, (void (*)(void))sub_226B94158);
    sub_226B94158();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155760);
  }
  return result;
}

unint64_t sub_226B94158()
{
  unint64_t result = qword_268155778;
  if (!qword_268155778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268155780);
    sub_226B941F8(&qword_268155788, &qword_268155790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155778);
  }
  return result;
}

uint64_t sub_226B941F8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_226B9423C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_226B942A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_226B94304(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_226B9436C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_226B943D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_226B94438(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t initializeBufferWithCopyOfBuffer for PillMetrics(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SoundMeterConfiguration()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SoundMeterConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SoundMeterConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for SoundMeterConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SoundMeterConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SoundMeterConfiguration(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SoundMeterConfiguration()
{
  return &type metadata for SoundMeterConfiguration;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SoundMeterMetrics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SoundMeterMetrics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SoundMeterMetrics()
{
  return &type metadata for SoundMeterMetrics;
}

unint64_t sub_226B94764()
{
  unint64_t result = qword_2681557C0;
  if (!qword_2681557C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681555C0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681555B0);
    sub_226B91C38();
    swift_getOpaqueTypeConformance2();
    sub_226B94438(&qword_2681557C8, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681557C0);
  }
  return result;
}

id HUISoundMeterViewInterface.__allocating_init(configurationType:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return HUISoundMeterViewInterface.init(configurationType:)(a1);
}

id HUISoundMeterViewInterface.init(configurationType:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SoundMeterView(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (id *)((char *)&v19.receiver - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = v1;
  sub_226B96938();
  type metadata accessor for SoundMeterData(0);
  swift_allocObject();
  *(void *)&v6[OBJC_IVAR___HUISoundMeterViewInterfaceInternal_data] = sub_226B908D0();
  swift_retain();
  sub_226B8C164(a1, v5);
  uint64_t v7 = (uint64_t)&v6[OBJC_IVAR___HUISoundMeterViewInterfaceInternal_soundMeterView];
  sub_226B94B48((uint64_t)v5, (uint64_t)&v6[OBJC_IVAR___HUISoundMeterViewInterfaceInternal_soundMeterView]);
  sub_226B94BAC(v7, (uint64_t)v5);
  sub_226B94C10();
  sub_226B96D38();
  uint64_t v8 = (void *)sub_226B96BA8();
  swift_release();
  swift_getObjectType();
  id v9 = v8;
  sub_226B96B38();
  self;
  uint64_t v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {

    int v15 = sub_226B96928();
    os_log_type_t v16 = sub_226B96E08();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_226B65000, v15, v16, "Unable to cast SDK-provided hosting controller to UIViewController", v17, 2u);
      MEMORY[0x22A662A90](v17, -1, -1);
    }

    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
    goto LABEL_7;
  }
  id v11 = v10;
  id result = objc_msgSend(v10, sel_view);
  if (result)
  {
    unint64_t v13 = result;
    id v14 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v13, sel_setBackgroundColor_, v14);

LABEL_7:
    *(void *)&v6[OBJC_IVAR___HUISoundMeterViewInterfaceInternal_viewController] = v11;

    uint64_t v18 = (objc_class *)type metadata accessor for HUISoundMeterViewInterface();
    v19.receiver = v6;
    v19.super_class = v18;
    return objc_msgSendSuper2(&v19, sel_init);
  }
  __break(1u);
  return result;
}

uint64_t sub_226B94B48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SoundMeterView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226B94BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SoundMeterView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_226B94C10()
{
  unint64_t result = qword_2681557D8;
  if (!qword_2681557D8)
  {
    type metadata accessor for SoundMeterView(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681557D8);
  }
  return result;
}

uint64_t type metadata accessor for HUISoundMeterViewInterface()
{
  uint64_t result = qword_2681557F0;
  if (!qword_2681557F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_226B94CDC()
{
  return *(id *)(v0 + OBJC_IVAR___HUISoundMeterViewInterfaceInternal_viewController);
}

uint64_t sub_226B94CFC()
{
  return swift_release();
}

id HUISoundMeterViewInterface.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HUISoundMeterViewInterface.init()()
{
}

id HUISoundMeterViewInterface.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HUISoundMeterViewInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL SoundMeterConfigurationType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_226B95034(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_226B95048()
{
  return sub_226B96EC8();
}

uint64_t sub_226B95090()
{
  return sub_226B96EB8();
}

uint64_t sub_226B950BC()
{
  return sub_226B96EC8();
}

void *sub_226B95100@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

void sub_226B95130(void *a1@<X8>)
{
  *a1 = *v1;
}

double sub_226B9513C@<D0>(double *a1@<X8>)
{
  return sub_226B951C8(a1);
}

double sub_226B95150@<D0>(double *a1@<X8>)
{
  return sub_226B951C8(a1);
}

uint64_t sub_226B95178()
{
  return sub_226B95280();
}

uint64_t sub_226B9518C()
{
  return sub_226B95280();
}

double sub_226B951B4@<D0>(double *a1@<X8>)
{
  return sub_226B951C8(a1);
}

double sub_226B951C8@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_226B969A8();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

double sub_226B95244@<D0>(double *a1@<X8>)
{
  return sub_226B951C8(a1);
}

uint64_t sub_226B9526C()
{
  return sub_226B95280();
}

uint64_t sub_226B95280()
{
  return sub_226B969B8();
}

uint64_t sub_226B952F8()
{
  return sub_226B95280();
}

uint64_t sub_226B95320@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_226B969A8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_226B953A4()
{
  return sub_226B969B8();
}

unint64_t sub_226B95420()
{
  unint64_t result = qword_2681557E8;
  if (!qword_2681557E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681557E8);
  }
  return result;
}

uint64_t sub_226B95474()
{
  return type metadata accessor for HUISoundMeterViewInterface();
}

uint64_t sub_226B9547C()
{
  uint64_t result = type metadata accessor for SoundMeterView(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_226B96948();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for HUISoundMeterViewInterface(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HUISoundMeterViewInterface);
}

uint64_t dispatch thunk of HUISoundMeterViewInterface.__allocating_init(configurationType:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of HUISoundMeterViewInterface.soundMeterViewController()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of HUISoundMeterViewInterface.updateViewsWith(slowLeq:fastLeq:thresholdLevel:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

ValueMetadata *type metadata accessor for SoundMeterConfigurationType()
{
  return &type metadata for SoundMeterConfigurationType;
}

uint64_t sub_226B95608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v56 = a2;
  uint64_t v59 = a3;
  uint64_t v6 = sub_226B96A18();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155790);
  MEMORY[0x270FA5388](v54);
  uint64_t v10 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155780);
  MEMORY[0x270FA5388](v60);
  int v12 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155740);
  MEMORY[0x270FA5388](v13 - 8);
  int v15 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155800);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v58 = (uint64_t)v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v57 = (uint64_t)v49 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  long long v23 = (char *)v49 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v61 = (uint64_t)v49 - v24;
  uint64_t v25 = type metadata accessor for Pill();
  uint64_t v26 = a1;
  uint64_t v53 = a1 + *(int *)(v25 + 36);
  uint64_t v27 = *(void *)(v53 + 24);
  uint64_t v55 = v6;
  int64_t v28 = &v8[*(int *)(v6 + 20)];
  uint64_t v29 = *MEMORY[0x263F19860];
  uint64_t v30 = sub_226B96B28();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(void (**)(char *, void, uint64_t))(v31 + 104);
  unsigned int v52 = v29;
  uint64_t v50 = v32;
  uint64_t v51 = v30;
  v49[1] = v31 + 104;
  ((void (*)(char *, uint64_t))v32)(v28, v29);
  *(void *)uint64_t v8 = v27;
  *((void *)v8 + 1) = v27;
  if (qword_268155518 != -1) {
    swift_once();
  }
  uint64_t v33 = qword_268155CE8;
  sub_226B95C98((uint64_t)v8, (uint64_t)v10);
  uint64_t v34 = v54;
  *(void *)&v10[*(int *)(v54 + 52)] = v33;
  *(_WORD *)&v10[*(int *)(v34 + 56)] = 256;
  swift_retain();
  sub_226B95CFC((uint64_t)v8);
  sub_226B9423C((uint64_t)v10, (uint64_t)v12, &qword_268155790);
  *(void *)&v12[*(int *)(v60 + 36)] = 0x3FF0000000000000;
  sub_226B942A0((uint64_t)v10, &qword_268155790);
  BOOL v35 = (unsigned __int8 *)(v26 + *(int *)(v25 + 20));
  char v36 = MEMORY[0x270FA5388](*v35);
  v49[-2] = v26;
  sub_226B8EE34(v36, (void (*)(uint64_t))sub_226B96734, (uint64_t)v15);
  uint64_t v37 = sub_226B942A0((uint64_t)v12, &qword_268155780);
  MEMORY[0x270FA5388](v37);
  v49[-2] = v26;
  sub_226B8F0A0((v38 & 1) == 0, (void (*)(uint64_t))sub_226B95D58, (uint64_t)v23);
  sub_226B942A0((uint64_t)v15, &qword_268155740);
  sub_226B95D74((uint64_t)v23, v61);
  uint64_t v39 = *(void *)(v53 + 24);
  v50(&v8[*(int *)(v55 + 20)], v52, v51);
  *(void *)uint64_t v8 = v39;
  *((void *)v8 + 1) = v39;
  sub_226B95C98((uint64_t)v8, (uint64_t)v10);
  *(void *)&v10[*(int *)(v34 + 52)] = v56;
  *(_WORD *)&v10[*(int *)(v34 + 56)] = 256;
  swift_retain();
  sub_226B95CFC((uint64_t)v8);
  sub_226B9423C((uint64_t)v10, (uint64_t)v12, &qword_268155790);
  *(double *)&v12[*(int *)(v60 + 36)] = a4;
  sub_226B942A0((uint64_t)v10, &qword_268155790);
  char v40 = MEMORY[0x270FA5388](*v35);
  v49[-2] = v26;
  sub_226B8EE34(v40, (void (*)(uint64_t))sub_226B95E88, (uint64_t)v15);
  uint64_t v41 = sub_226B942A0((uint64_t)v12, &qword_268155780);
  MEMORY[0x270FA5388](v41);
  v49[-2] = v26;
  uint64_t v43 = v57;
  sub_226B8F0A0((v42 & 1) == 0, (void (*)(uint64_t))sub_226B96738, v57);
  sub_226B942A0((uint64_t)v15, &qword_268155740);
  sub_226B95D74(v43, (uint64_t)v23);
  uint64_t v44 = v61;
  sub_226B9423C(v61, v43, &qword_268155800);
  uint64_t v45 = v58;
  sub_226B9423C((uint64_t)v23, v58, &qword_268155800);
  uint64_t v46 = v59;
  sub_226B9423C(v43, v59, &qword_268155800);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155808);
  sub_226B9423C(v45, v46 + *(int *)(v47 + 48), &qword_268155800);
  sub_226B942A0((uint64_t)v23, &qword_268155800);
  sub_226B942A0(v44, &qword_268155800);
  sub_226B942A0(v45, &qword_268155800);
  return sub_226B942A0(v43, &qword_268155800);
}

uint64_t type metadata accessor for Pill()
{
  uint64_t result = qword_268155810;
  if (!qword_268155810) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_226B95C98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_226B96A18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226B95CFC(uint64_t a1)
{
  uint64_t v2 = sub_226B96A18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_226B95D58@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_226B95EA4(a1, a2);
}

uint64_t sub_226B95D74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_226B95DDC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for Pill();
  sub_226B96D68();
  sub_226B969D8();
  sub_226B9423C(a1, a2, &qword_268155780);
  uint64_t v4 = (_OWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268155770) + 36));
  *uint64_t v4 = v6;
  v4[1] = v7;
  double result = *(double *)&v8;
  v4[2] = v8;
  return result;
}

double sub_226B95E88@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_226B95DDC(a1, a2);
}

double sub_226B95EA4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for Pill();
  sub_226B96D68();
  sub_226B969D8();
  sub_226B9423C(a1, a2, &qword_268155740);
  uint64_t v4 = (_OWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268155750) + 36));
  *uint64_t v4 = v6;
  v4[1] = v7;
  double result = *(double *)&v8;
  v4[2] = v8;
  return result;
}

void *sub_226B95F4C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_226B96908();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[9];
    uint64_t v11 = (_OWORD *)((char *)a1 + v10);
    int v12 = (_OWORD *)((char *)a2 + v10);
    long long v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
  }
  swift_retain();
  return a1;
}

uint64_t sub_226B96048(uint64_t a1)
{
  uint64_t v2 = sub_226B96908();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_226B960BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_226B96908();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  uint64_t v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  swift_retain();
  return a1;
}

uint64_t sub_226B9616C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_226B96908();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  return a1;
}

uint64_t sub_226B96248(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_226B96908();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  uint64_t v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  return a1;
}

uint64_t sub_226B962F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_226B96908();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_release();
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  uint64_t v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  return a1;
}

uint64_t sub_226B963A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226B963BC);
}

uint64_t sub_226B963BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226B96908();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_226B9647C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226B96490);
}

uint64_t sub_226B96490(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_226B96908();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_226B9654C()
{
  uint64_t result = sub_226B96908();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_226B9660C()
{
  unint64_t result = qword_268155820;
  if (!qword_268155820)
  {
    sub_226B96908();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155820);
  }
  return result;
}

uint64_t sub_226B96664@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_226B96908();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for PillMetrics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PillMetrics(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PillMetrics()
{
  return &type metadata for PillMetrics;
}

uint64_t sub_226B9673C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
}

uint64_t sub_226B968D8()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_226B968E8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_226B968F8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_226B96908()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_226B96918()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_226B96928()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_226B96938()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_226B96948()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_226B96958()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_226B96968()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_226B96978()
{
  return MEMORY[0x270EE3CE8]();
}

uint64_t sub_226B96988()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_226B96998()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_226B969A8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_226B969B8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_226B969C8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_226B969D8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_226B969E8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_226B969F8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_226B96A08()
{
  return MEMORY[0x270F00138]();
}

uint64_t sub_226B96A18()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_226B96A28()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_226B96A38()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_226B96A48()
{
  return MEMORY[0x270F00980]();
}

uint64_t sub_226B96A58()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_226B96A68()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_226B96A78()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_226B96A88()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_226B96A98()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_226B96AA8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_226B96AB8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_226B96AC8()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_226B96AD8()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_226B96AE8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_226B96AF8()
{
  return MEMORY[0x270F01028]();
}

uint64_t sub_226B96B08()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_226B96B18()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_226B96B28()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_226B96B38()
{
  return MEMORY[0x270F013A8]();
}

uint64_t sub_226B96B48()
{
  return MEMORY[0x270F013F0]();
}

uint64_t sub_226B96B58()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_226B96B68()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_226B96B78()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_226B96B88()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_226B96B98()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_226B96BA8()
{
  return MEMORY[0x270F02258]();
}

uint64_t sub_226B96BB8()
{
  return MEMORY[0x270F022F8]();
}

uint64_t sub_226B96BC8()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_226B96BD8()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_226B96BE8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_226B96BF8()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_226B96C08()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_226B96C18()
{
  return MEMORY[0x270F02B08]();
}

uint64_t sub_226B96C28()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_226B96C38()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_226B96C48()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_226B96C58()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_226B96C68()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_226B96C78()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_226B96C88()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_226B96C98()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_226B96CA8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_226B96CB8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_226B96CC8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_226B96CD8()
{
  return MEMORY[0x270F039D0]();
}

uint64_t sub_226B96CE8()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_226B96CF8()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_226B96D08()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_226B96D18()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_226B96D28()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_226B96D38()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_226B96D48()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_226B96D58()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_226B96D68()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_226B96D78()
{
  return MEMORY[0x270F05238]();
}

uint64_t sub_226B96D88()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_226B96D98()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_226B96DA8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_226B96DB8()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_226B96DC8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_226B96DD8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_226B96DE8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_226B96DF8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_226B96E08()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_226B96E18()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_226B96E28()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_226B96E38()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_226B96E48()
{
  return MEMORY[0x270EF2448]();
}

uint64_t sub_226B96E58()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_226B96E68()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_226B96E78()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_226B96E88()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_226B96E98()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_226B96EA8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_226B96EB8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_226B96EC8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AXLogAggregate()
{
  return MEMORY[0x270F09298]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CCUIItemEdgeSize()
{
  return MEMORY[0x270F18868]();
}

uint64_t CCUILayoutGutter()
{
  return MEMORY[0x270F18870]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t HAInitializeLogging()
{
  return MEMORY[0x270F39078]();
}

uint64_t HCLogSoundMeter()
{
  return MEMORY[0x270F390A8]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x270F243A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

uint64_t PAInitializeLogging()
{
  return MEMORY[0x270F390C0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
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

uint64_t __AXStringForVariables()
{
  return MEMORY[0x270F099D8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint64_t accessibilityHearingAidSupportBundle()
{
  return MEMORY[0x270F39488]();
}

uint64_t compoundAttributeByAddingAttribute()
{
  return MEMORY[0x270F39490]();
}

uint64_t compoundAttributeByRemovingAttribute()
{
  return MEMORY[0x270F39498]();
}

uint64_t compoundAttributeContainsAttribute()
{
  return MEMORY[0x270F394A0]();
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

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t hearingAidReceivingAudio()
{
  return MEMORY[0x270F394A8]();
}

uint64_t hearingAidStreamAvailableAsync()
{
  return MEMORY[0x270F394B0]();
}

uint64_t hearingEarFromInputOption()
{
  return MEMORY[0x270F394C8]();
}

uint64_t hearingInputRouteStringForOption()
{
  return MEMORY[0x270F394D0]();
}

uint64_t hearingLocString()
{
  return MEMORY[0x270F394D8]();
}

uint64_t inputOptionFromHearingEar()
{
  return MEMORY[0x270F394E0]();
}

uint64_t liveListenStreamSelectedAsync()
{
  return MEMORY[0x270F394F0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t paBluetoothDeviceSupportsSSL()
{
  return MEMORY[0x270F53630]();
}

uint64_t paCurrentBluetoothDeviceSupportingTransparencyAccommodations()
{
  return MEMORY[0x270F53638]();
}

uint64_t paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync()
{
  return MEMORY[0x270F53640]();
}

uint64_t paCurrentRouteSupportsTransparencyAccommodations()
{
  return MEMORY[0x270F53648]();
}

uint64_t paLocString()
{
  return MEMORY[0x270F53650]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}