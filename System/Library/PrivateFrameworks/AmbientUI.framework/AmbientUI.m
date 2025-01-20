void sub_247839AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24783D398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24783E59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPRMutablePosterTitleStyleConfigurationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PRMutablePosterTitleStyleConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRMutablePosterTitleStyleConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPRMutablePosterTitleStyleConfigurationClass_block_invoke_cold_1();
    PosterKitLibrary();
  }
}

void PosterKitLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __PosterKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265224910;
    uint64_t v3 = 0;
    PosterKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PosterKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterKitLibraryCore_frameworkLibrary = result;
  return result;
}

double __getPRPosterColorClass_block_invoke(uint64_t a1)
{
  PosterKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PRPosterColor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRPosterColorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (double *)__getPRPosterColorClass_block_invoke_cold_1();
    return AMUIConvertSpringDampingRatioAndResponseToTensionAndFriction(v3, v4, v5, v6);
  }
  return result;
}

double AMUIConvertSpringDampingRatioAndResponseToTensionAndFriction(double *a1, double *a2, double result, double a4)
{
  double v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1) {
    *a1 = v4;
  }
  if (a2)
  {
    double v5 = sqrt(v4);
    double result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

void sub_24783FA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getPRUISAmbientPosterViewControllerClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getPRUISAmbientPosterViewControllerClass_softClass;
  uint64_t v7 = getPRUISAmbientPosterViewControllerClass_softClass;
  if (!getPRUISAmbientPosterViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPRUISAmbientPosterViewControllerClass_block_invoke;
    v3[3] = &unk_2652248F0;
    v3[4] = &v4;
    __getPRUISAmbientPosterViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_247840480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2478409D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPRUISAmbientPosterViewControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PRUISAmbientPosterViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRUISAmbientPosterViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPRUISAmbientPosterViewControllerClass_block_invoke_cold_1();
    PosterBoardUIServicesLibrary();
  }
}

void PosterBoardUIServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!PosterBoardUIServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __PosterBoardUIServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265224998;
    uint64_t v3 = 0;
    PosterBoardUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!PosterBoardUIServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PosterBoardUIServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterBoardUIServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void __getPRUISPosterSnapshotControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PRUISPosterSnapshotController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPRUISPosterSnapshotControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPRUISPosterSnapshotControllerClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0();
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_247842B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

void sub_247843790(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_247846800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247846970(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_247846C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_247846DA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_247846F60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return objc_opt_class();
}

void sub_247847E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247849484(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_24784968C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_247849744(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2478498F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_24784AC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24784F5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AMUIRingColorForPowerStatus(void *a1)
{
  id v1 = a1;
  char v2 = [v1 powerStatus];
  BOOL v3 = UIAccessibilityDarkerSystemColorsEnabled();
  if ((v2 & 4) != 0)
  {
    double v5 = (void *)MEMORY[0x263F1C550];
    if (v3)
    {
      double v7 = 0.0431372549;
      double v8 = 1.0;
      double v6 = 1.0;
      goto LABEL_11;
    }
    uint64_t v9 = [MEMORY[0x263F1C550] systemYellowColor];
  }
  else if ((v2 & 2) != 0)
  {
    double v5 = (void *)MEMORY[0x263F1C550];
    if (v3)
    {
      double v8 = 0.984313725;
      double v7 = 0.0274509804;
      double v6 = 0.0;
      goto LABEL_11;
    }
    uint64_t v9 = [MEMORY[0x263F1C550] systemRedColor];
  }
  else
  {
    int v4 = [v1 chargeState];
    double v5 = (void *)MEMORY[0x263F1C550];
    if (((v2 & 1) != 0 || v4 == 2) && v3)
    {
      double v6 = 0.862745098;
      double v7 = 0.392156863;
      double v8 = 0.0;
LABEL_11:
      uint64_t v9 = [v5 colorWithRed:v8 green:v6 blue:v7 alpha:1.0];
      goto LABEL_15;
    }
    uint64_t v9 = [MEMORY[0x263F1C550] systemGreenColor];
  }
LABEL_15:
  v10 = (void *)v9;

  return v10;
}

AMUIPowerStatus *AMUIPowerStatusForBatteryState(char a1, unsigned int a2, double a3)
{
  double v6 = objc_alloc_init(AMUIPowerStatus);
  if (a1)
  {
    uint64_t v7 = 4;
  }
  else if ((double)[MEMORY[0x263F1C9C0] lowBatteryLevel] >= a3)
  {
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = a2;
  }
  [(AMUIPowerStatus *)v6 setPowerStatus:v7];
  [(AMUIPowerStatus *)v6 setPowerPercent:a3];

  return v6;
}

uint64_t AMUIRingPowerStatusForBatteryState(char a1, unsigned int a2, double a3)
{
  if (a1) {
    return 4;
  }
  if ((double)[MEMORY[0x263F1C9C0] lowBatteryLevel] >= a3) {
    return 2;
  }
  return a2;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id AMUILogGeneral()
{
  if (AMUILogGeneral_onceToken != -1) {
    dispatch_once(&AMUILogGeneral_onceToken, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)AMUILogGeneral___logObj;

  return v0;
}

uint64_t __AMUILogGeneral_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.AmbientUI", "General");
  uint64_t v1 = AMUILogGeneral___logObj;
  AMUILogGeneral___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id AMUILogDataLayer()
{
  if (AMUILogDataLayer_onceToken != -1) {
    dispatch_once(&AMUILogDataLayer_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)AMUILogDataLayer___logObj;

  return v0;
}

uint64_t __AMUILogDataLayer_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.AmbientUI", "DataLayer");
  uint64_t v1 = AMUILogDataLayer___logObj;
  AMUILogDataLayer___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id AMUILogInfograph()
{
  if (AMUILogInfograph_onceToken != -1) {
    dispatch_once(&AMUILogInfograph_onceToken, &__block_literal_global_7);
  }
  os_log_t v0 = (void *)AMUILogInfograph___logObj;

  return v0;
}

uint64_t __AMUILogInfograph_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.AmbientUI", "Infograph");
  uint64_t v1 = AMUILogInfograph___logObj;
  AMUILogInfograph___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id AMUILogWidgets()
{
  if (AMUILogWidgets_onceToken != -1) {
    dispatch_once(&AMUILogWidgets_onceToken, &__block_literal_global_10);
  }
  os_log_t v0 = (void *)AMUILogWidgets___logObj;

  return v0;
}

uint64_t __AMUILogWidgets_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.AmbientUI", "Widgets");
  uint64_t v1 = AMUILogWidgets___logObj;
  AMUILogWidgets___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id AMUILogSwitcher()
{
  if (AMUILogSwitcher_onceToken != -1) {
    dispatch_once(&AMUILogSwitcher_onceToken, &__block_literal_global_13);
  }
  os_log_t v0 = (void *)AMUILogSwitcher___logObj;

  return v0;
}

uint64_t __AMUILogSwitcher_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.AmbientUI", "Switcher");
  uint64_t v1 = AMUILogSwitcher___logObj;
  AMUILogSwitcher___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id AMUILogEditingSwitcher()
{
  if (AMUILogEditingSwitcher_onceToken != -1) {
    dispatch_once(&AMUILogEditingSwitcher_onceToken, &__block_literal_global_16);
  }
  os_log_t v0 = (void *)AMUILogEditingSwitcher___logObj;

  return v0;
}

uint64_t __AMUILogEditingSwitcher_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.AmbientUI", "EditingSwitcher");
  uint64_t v1 = AMUILogEditingSwitcher___logObj;
  AMUILogEditingSwitcher___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id AMUILogProactive()
{
  if (AMUILogProactive_onceToken != -1) {
    dispatch_once(&AMUILogProactive_onceToken, &__block_literal_global_19);
  }
  os_log_t v0 = (void *)AMUILogProactive___logObj;

  return v0;
}

uint64_t __AMUILogProactive_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.AmbientUI", "Proactive");
  uint64_t v1 = AMUILogProactive___logObj;
  AMUILogProactive___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_247852794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_247852C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_247854188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_24785469C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id AMUIAmbientUIFrameworkBundle()
{
  if (AMUIAmbientUIFrameworkBundle___once != -1) {
    dispatch_once(&AMUIAmbientUIFrameworkBundle___once, &__block_literal_global_10);
  }
  os_log_t v0 = (void *)AMUIAmbientUIFrameworkBundle___bundle;

  return v0;
}

uint64_t __AMUIAmbientUIFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = AMUIAmbientUIFrameworkBundle___bundle;
  AMUIAmbientUIFrameworkBundle___bundle = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_247857118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __BSSafeCast(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    if (objc_opt_isKindOfClass()) {
      int v4 = v3;
    }
    else {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void sub_24785945C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v22 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_24785AC44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24785C8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24785CCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24785CFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_247863530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247863828(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_247864D50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

uint64_t __getPRMutablePosterTitleStyleConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPRPosterColorClass_block_invoke_cold_1(v0);
}

uint64_t __getPRPosterColorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __47__AMUIPosterViewController__snapshotController__block_invoke_cold_1(v0);
}

uint64_t __getPRUISAmbientPosterViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPRUISPosterSnapshotControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPRUISPosterSnapshotControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AMUIPosterSwitcherViewController updatePosterConfiguration:withAnimationSettings:](v0);
}

uint64_t AMUIAmbientDisplayStyleIsRedMode()
{
  return MEMORY[0x270F0C158]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x270F10770]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x270F10778]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x270F10798]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

uint64_t BSFloatByLinearlyInterpolatingFloats()
{
  return MEMORY[0x270F107D8]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x270F107F8]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x270F10808]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x270F10810]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x270F10818]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x270F10820]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x270F10828]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x270F10960]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x270EFB850]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CHSWidgetFamilyForSBHIconGridSizeClass()
{
  return MEMORY[0x270F770A0]();
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x270EE9B00](name, matrix, options, size);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SBHGetScreenSpecification()
{
  return MEMORY[0x270F770A8]();
}

uint64_t SBHIconGridSizeClassForCHSWidgetFamily()
{
  return MEMORY[0x270F770B0]();
}

uint64_t SBHScreenTypeForCurrentDevice()
{
  return MEMORY[0x270F770B8]();
}

uint64_t SBHStringForScreenType()
{
  return MEMORY[0x270F770C0]();
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return MEMORY[0x270F77268]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F05EE8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x270F06200]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x270F06208]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F06258]();
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

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}