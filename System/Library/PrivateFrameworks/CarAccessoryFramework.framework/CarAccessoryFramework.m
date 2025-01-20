void sub_249712124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2497121D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

__CFString *NSStringFromPlaybackState(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_2652632A0[(char)a1];
  }
}

void sub_249717940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromButtonAction(int a1)
{
  v1 = @"PerformAction";
  if (a1 != 1) {
    v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Ready";
  }
}

__CFString *NSStringFromEqualizerType(unsigned int a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_265263338[(char)a1];
  }
}

void sub_249720E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_249720EB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2497228E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

__CFString *NSStringFromMediaSourceSemanticType(unsigned int a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return off_265263450[(char)a1];
  }
}

__CFString *NSStringFromVolumeType(unsigned int a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return off_265263498[(char)a1];
  }
}

__CFString *NSStringFromUIInputDeviceButtonEvent(int a1)
{
  uint64_t v1 = @"ButtonDown";
  if (a1 != 1) {
    uint64_t v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"ButtonUp";
  }
}

__CFString *NSStringFromRotationalSpeedState(int a1)
{
  uint64_t v1 = @"Redline";
  if (a1 != 1) {
    uint64_t v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Normal";
  }
}

uint64_t CAFPreferencesGetBoolean(const __CFString *a1, unsigned int a2)
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v3 = CFPreferencesGetAppBooleanValue(a1, @"com.apple.CarAccessoryFramework", &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat) {
    return v3;
  }
  else {
    return a2;
  }
}

double CAFPreferencesGetDouble(void *a1, double a2)
{
  BOOL v3 = NSNumber;
  uint64_t v4 = a1;
  v5 = [v3 numberWithDouble:a2];
  v6 = CAFPreferencesGetNumber(v4, v5);

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

id CAFPreferencesGetNumber(const __CFString *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)CFPreferencesCopyAppValue(a1, @"com.apple.CarAccessoryFramework");
  objc_opt_class();
  id v5 = v4;
  if (!v5 || (id v6 = v5, (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v6 = v3;
  }

  return v6;
}

id CAFPreferencesGetArray(const __CFString *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)CFPreferencesCopyAppValue(a1, @"com.apple.CarAccessoryFramework");
  objc_opt_class();
  id v5 = v4;
  if (!v5 || (id v6 = v5, (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v6 = v3;
  }

  return v6;
}

BOOL CAFDefaultsHasValue(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263EFFA40];
  id v2 = a1;
  id v3 = [v1 standardUserDefaults];
  uint64_t v4 = [v3 valueForKey:v2];

  return v4 != 0;
}

uint64_t CAFDefaultsGetBoolean(void *a1, uint64_t a2)
{
  id v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a1;
  id v5 = [v3 standardUserDefaults];
  id v6 = [v5 valueForKey:v4];

  if (v6) {
    a2 = [v6 BOOLValue];
  }

  return a2;
}

__CFString *NSStringFromTargetSpeedState(unsigned int a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_2652634E8[(char)a1];
  }
}

__CFString *NSStringFromPairedDeviceState(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_265263510[(char)a1];
  }
}

__CFString *NSStringFromSettingsCategory(unsigned int a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_265263528[(char)a1];
  }
}

__CFString *NSStringFromAutoModeIntensity(unsigned int a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_265263548[(char)a1];
  }
}

__CFString *NSStringFromImageColor(unsigned int a1)
{
  if (a1 > 0xF) {
    return 0;
  }
  else {
    return off_265263CA8[(char)a1];
  }
}

__CFString *NSStringFromTemperatureState(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_265263D28[(char)a1];
  }
}

__CFString *NSStringFromLockState(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_265263D40[(char)a1];
  }
}

__CFString *NSStringFromCharacteristicMetadataFormat(unint64_t a1)
{
  if (a1 > 0xD) {
    return @"unknown";
  }
  else {
    return off_265263DD0[a1];
  }
}

void sub_2497543F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_14(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

__CFString *NSStringFromSeatBeltIndicator(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_265264108[(char)a1];
  }
}

void sub_2497617DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249761B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

__CFString *NSStringFromPressureState(unsigned int a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_265264198[(char)a1];
  }
}

void sub_249764C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
}

void sub_2497656E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249765A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2497678AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_15(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return [v0 count];
}

void OUTLINED_FUNCTION_20(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

__CFString *NSStringFromUISceneState(unsigned int a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_2652643C0[(char)a1];
  }
}

id CAFFrameworkBundle()
{
  uint64_t v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  uint64_t v1 = [v0 objectAtIndex:0];

  id v2 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:v1];
  id v3 = [v2 stringByAppendingPathComponent:@"PrivateFrameworks/CarAccessoryFramework.framework"];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithPath:v3];

  return v4;
}

id CAFAppIdentifier()
{
  if (CAFAppIdentifier_onceToken != -1) {
    dispatch_once(&CAFAppIdentifier_onceToken, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)CAFAppIdentifier_appIdentifier;
  return v0;
}

void __CAFAppIdentifier_block_invoke()
{
  id v6 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v0 = [v6 bundleIdentifier];
  uint64_t v1 = v0;
  if (v0)
  {
    id v2 = v0;
    id v3 = (void *)CAFAppIdentifier_appIdentifier;
    CAFAppIdentifier_appIdentifier = (uint64_t)v2;
  }
  else
  {
    id v3 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v4 = [v3 processName];
    uint64_t v5 = (void *)CAFAppIdentifier_appIdentifier;
    CAFAppIdentifier_appIdentifier = v4;
  }
}

id CAFAppInfo()
{
  if (CAFAppInfo_onceToken != -1) {
    dispatch_once(&CAFAppInfo_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)CAFAppInfo_appInfo;
  return v0;
}

void __CAFAppInfo_block_invoke()
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = [MEMORY[0x263F086E0] mainBundle];
  id v2 = [v1 bundleIdentifier];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];
    [v0 addObject:v5];
  }
  id v6 = [MEMORY[0x263F08AB0] processInfo];
  double v7 = [v6 processName];
  v15[0] = v7;
  double v8 = NSNumber;
  uint64_t v9 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v10 = objc_msgSend(v8, "numberWithInt:", objc_msgSend(v9, "processIdentifier"));
  v11 = [v10 description];
  v15[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  [v0 addObjectsFromArray:v12];

  uint64_t v13 = [v0 componentsJoinedByString:@"-"];
  v14 = (void *)CAFAppInfo_appInfo;
  CAFAppInfo_appInfo = v13;
}

void CAFSignpostEmit_Launched()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v0 = CARSignpostLogForCategory();
  if (os_signpost_enabled(v0))
  {
    uint64_t v1 = CAFAppInfo();
    int v4 = 138543362;
    uint64_t v5 = v1;
    _os_signpost_emit_with_name_impl(&dword_249710000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Launched", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  uint64_t v3 = (void *)CAFAppLaunchedDate;
  CAFAppLaunchedDate = v2;
}

void CAFSignpostEmit_Scene(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = CARSignpostLogForCategory();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = CAFAppInfo();
    int v6 = 138543618;
    id v7 = v1;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_signpost_emit_with_name_impl(&dword_249710000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Scene", "%{public}@ %{public}@", (uint8_t *)&v6, 0x16u);
  }
  if (([v1 isEqualToString:@"Center"] & 1) != 0
    || [v1 isEqualToString:@"UIWindowSceneSessionRoleCarPlay"])
  {
    uint64_t v4 = [MEMORY[0x263EFF910] date];
    uint64_t v5 = (void *)CAFAppSceneDate;
    CAFAppSceneDate = v4;
  }
}

void CAFSignpostEmit_InstantOn()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = CARSignpostLogForCategory();
  if (os_signpost_enabled(v0))
  {
    id v1 = CAFAppInfo();
    int v2 = 138543362;
    uint64_t v3 = v1;
    _os_signpost_emit_with_name_impl(&dword_249710000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InstantOn", "%{public}@", (uint8_t *)&v2, 0xCu);
  }
}

void CAFSignpostEmit_Rendered()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = CARSignpostLogForCategory();
  if (os_signpost_enabled(v0))
  {
    id v1 = CAFAppInfo();
    int v2 = 138543362;
    uint64_t v3 = v1;
    _os_signpost_emit_with_name_impl(&dword_249710000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Rendered", "%{public}@", (uint8_t *)&v2, 0xCu);
  }
}

void CAFSignpostEmit_Finalized(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v2 = CARSignpostLogForCategory();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = CAFAppInfo();
    LODWORD(v29) = 138543362;
    *(void *)((char *)&v29 + 4) = v3;
    _os_signpost_emit_with_name_impl(&dword_249710000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Finalized", "%{public}@", (uint8_t *)&v29, 0xCu);
  }
  if (v1)
  {
    uint64_t v4 = [v1 car];
    uint64_t v5 = [v4 sessionAnalytics];

    int v6 = [MEMORY[0x263EFF9A0] dictionary];
    id v7 = [v5 name];
    [v6 setObject:v7 forKeyedSubscript:@"name"];

    __int16 v8 = [v5 ppid];
    [v6 setObject:v8 forKeyedSubscript:@"ppid"];

    uint64_t v9 = [v5 firmwareVersion];
    [v6 setObject:v9 forKeyedSubscript:@"vehicleFirmwareVersion"];

    uint64_t v10 = [v5 hardwareVersion];
    [v6 setObject:v10 forKeyedSubscript:@"vehicleHardwareVersion"];

    v11 = [v5 manufacturer];
    [v6 setObject:v11 forKeyedSubscript:@"vehicleManufacturer"];

    v12 = [v5 model];
    [v6 setObject:v12 forKeyedSubscript:@"vehicleModel"];

    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "supportsBluetoothLE"));
    [v6 setObject:v13 forKeyedSubscript:@"supportsBluetoothLE"];

    if (!CAFAppLaunchedDate) {
      goto LABEL_6;
    }
    v14 = [MEMORY[0x263F086E0] mainBundle];
    v15 = [v14 bundleIdentifier];

    *(void *)&long long v29 = @"com.apple.CarClimate";
    *((void *)&v29 + 1) = @"com.apple.CarRadio";
    v30 = @"com.apple.AutoSettings";
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:3];
    int v17 = [v16 containsObject:v15];

    if (!v17)
    {
      uint64_t v19 = 1;
      v18 = &CAFAppLaunchedDate;
    }
    else
    {
LABEL_6:
      v18 = &CAFAppSceneDate;
      if (!CAFAppSceneDate)
      {
LABEL_11:
        AnalyticsSendEvent();

        goto LABEL_12;
      }
      uint64_t v19 = 0;
    }
    v20 = [MEMORY[0x263EFF910] date];
    [v20 timeIntervalSinceDate:*v18];
    double v22 = v21;

    v23 = (void *)*v18;
    uint64_t *v18 = 0;

    if (v22 > 0.0)
    {
      v24 = [NSNumber numberWithDouble:v22];
      v25 = [v24 stringValue];
      [v6 setObject:v25 forKeyedSubscript:@"launchTime"];

      v26 = [MEMORY[0x263F086E0] mainBundle];
      v27 = [v26 bundleIdentifier];
      [v6 setObject:v27 forKeyedSubscript:@"bundleIdentifier"];

      v28 = [NSNumber numberWithBool:v19];
      [v6 setObject:v28 forKeyedSubscript:@"isColdLaunch"];
    }
    goto LABEL_11;
  }
LABEL_12:
}

void sub_249771C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_249771FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_24977208C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_249773488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id NSStringFromSettingProminenceLevel(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  int v2 = NSString;
  BOOL v3 = +[CAFBitMaskUtilities bitmask:a1 hasOption:1];
  uint64_t v4 = @"NO";
  if (v3) {
    uint64_t v4 = @"YES";
  }
  uint64_t v5 = [v2 stringWithFormat:@"appHomeTile=%@", v4];
  v12[0] = v5;
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  id v7 = NSString;
  __int16 v8 = +[CAFBitMaskUtilities description:a1 optionCount:1];
  uint64_t v9 = [v6 componentsJoinedByString:@" "];
  uint64_t v10 = [v7 stringWithFormat:@"(%@) %@", v8, v9];

  return v10;
}

__CFString *NSStringFromUIInputDevicePurpose(int a1)
{
  id v1 = @"Back";
  if (a1 != 1) {
    id v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Select";
  }
}

id NSStringFromDefrostTypes(uint64_t a1)
{
  v14[2] = *MEMORY[0x263EF8340];
  int v2 = NSString;
  if (+[CAFBitMaskUtilities bitmask:a1 hasOption:1]) {
    BOOL v3 = @"YES";
  }
  else {
    BOOL v3 = @"NO";
  }
  uint64_t v4 = [v2 stringWithFormat:@"blownAir=%@", v3];
  v14[0] = v4;
  uint64_t v5 = NSString;
  if (+[CAFBitMaskUtilities bitmask:a1 hasOption:2]) {
    int v6 = @"YES";
  }
  else {
    int v6 = @"NO";
  }
  id v7 = [v5 stringWithFormat:@"filament=%@", v6];
  v14[1] = v7;
  __int16 v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  uint64_t v9 = NSString;
  uint64_t v10 = +[CAFBitMaskUtilities description:a1 optionCount:2];
  v11 = [v8 componentsJoinedByString:@" "];
  v12 = [v9 stringWithFormat:@"(%@) %@", v10, v11];

  return v12;
}

void sub_24978394C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_249783B04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromUnitType(int a1)
{
  result = 0;
  if (a1 > 600)
  {
    if (a1 > 880)
    {
      if (a1 > 1030)
      {
        if (a1 <= 1130)
        {
          if (a1 > 1080)
          {
            BOOL v3 = @"fahrenheit";
            uint64_t v4 = @"celsius";
            uint64_t v9 = @"kelvin";
            if (a1 != 1083) {
              uint64_t v9 = 0;
            }
            if (a1 != 1082) {
              uint64_t v4 = v9;
            }
            BOOL v6 = a1 == 1081;
            goto LABEL_62;
          }
          switch(a1)
          {
            case 1031:
              result = @"metersPerSecond";
              break;
            case 1032:
              result = @"kilometersPerHour";
              break;
            case 1033:
              result = @"milesPerHour";
              break;
            case 1034:
              result = @"metersPerHour";
              break;
            default:
              return result;
          }
        }
        else
        {
          if (a1 > 1204)
          {
            BOOL v3 = @"percent";
            uint64_t v4 = @"newtonMeter";
            __int16 v8 = @"footPound";
            if (a1 != 1252) {
              __int16 v8 = 0;
            }
            if (a1 != 1251) {
              uint64_t v4 = v8;
            }
            BOOL v6 = a1 == 1205;
            goto LABEL_62;
          }
          switch(a1)
          {
            case 1131:
              result = @"liters";
              break;
            case 1132:
              result = @"cubicMeters";
              break;
            case 1133:
              result = @"cubicFeet";
              break;
            case 1134:
              result = @"fluidOunces";
              break;
            case 1135:
              result = @"gallons";
              break;
            case 1136:
              result = @"milliliters";
              break;
            default:
              return result;
          }
        }
      }
      else if (a1 > 930)
      {
        switch(a1)
        {
          case 931:
            result = @"newtonsPerMetersSquared";
            break;
          case 932:
            result = @"kilopascals";
            break;
          case 933:
            result = @"poundsForcePerSquareInch";
            break;
          case 934:
            result = @"bars";
            break;
          default:
            BOOL v3 = @"revolutionsPerMinute";
            uint64_t v4 = @"degreesPerSecond";
            if (a1 != 982) {
              uint64_t v4 = 0;
            }
            BOOL v6 = a1 == 981;
            goto LABEL_62;
        }
      }
      else
      {
        switch(a1)
        {
          case 881:
            result = @"terawatts";
            break;
          case 882:
            result = @"gigawatts";
            break;
          case 883:
            result = @"megawatts";
            break;
          case 884:
            result = @"kilowatts";
            break;
          case 885:
            result = @"watts";
            break;
          case 886:
            result = @"milliwatts";
            break;
          case 887:
            result = @"microwatts";
            break;
          case 888:
            result = @"nanowatts";
            break;
          case 889:
            result = @"picowatts";
            break;
          case 890:
            result = @"femtowatts";
            break;
          case 891:
            result = @"horsepower";
            break;
          default:
            return result;
        }
      }
    }
    else if (a1 > 720)
    {
      switch(a1)
      {
        case 781:
          result = @"kilograms";
          break;
        case 782:
          result = @"grams";
          break;
        case 783:
          result = @"milligrams";
          break;
        case 784:
          result = @"ounces";
          break;
        case 785:
          result = @"poundsMass";
          break;
        case 786:
          result = @"metricTons";
          break;
        case 787:
          result = @"slugs";
          break;
        default:
          BOOL v10 = a1 == 721;
          v11 = @"lux";
LABEL_146:
          if (v10) {
            result = v11;
          }
          else {
            result = 0;
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 601:
          result = @"wattHoursPerKilometer";
          break;
        case 602:
          result = @"milliwattHoursPerKilometer";
          break;
        case 603:
          result = @"wattHoursPerMile";
          break;
        case 604:
          result = @"kilowattHoursPer100Kilometers";
          break;
        case 605:
          result = @"kilowattHoursPer100Miles";
          break;
        case 606:
          result = @"milesPerKilowattHour";
          break;
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
          return result;
        case 621:
          result = @"terahertz";
          break;
        case 622:
          result = @"gigahertz";
          break;
        case 623:
          result = @"megahertz";
          break;
        case 624:
          result = @"kilohertz";
          break;
        case 625:
          result = @"hertz";
          break;
        case 626:
          result = @"millihertz";
          break;
        case 627:
          result = @"microhertz";
          break;
        case 628:
          result = @"nanohertz";
          break;
        default:
          switch(a1)
          {
            case 671:
              result = @"litersPer100Kilometers";
              break;
            case 672:
              result = @"milesPerGallon";
              break;
            case 673:
              result = @"milesPerImperialGallon";
              break;
            case 674:
              result = @"millilitersPer100Kilometers";
              break;
            default:
              return result;
          }
          break;
      }
    }
  }
  else if (a1 > 225)
  {
    if (a1 <= 400)
    {
      if (a1 <= 252)
      {
        BOOL v3 = @"partsPerMillion";
        uint64_t v4 = @"seconds";
        uint64_t v5 = @"minutes";
        if (a1 != 252) {
          uint64_t v5 = 0;
        }
        if (a1 != 251) {
          uint64_t v4 = v5;
        }
        BOOL v6 = a1 == 226;
        goto LABEL_62;
      }
      switch(a1)
      {
        case 351:
          result = @"megaamperes";
          break;
        case 352:
          result = @"kiloamperes";
          break;
        case 353:
          result = @"amperes";
          break;
        case 354:
          result = @"milliamperes";
          break;
        case 355:
          result = @"microamperes";
          break;
        default:
          BOOL v10 = a1 == 253;
          v11 = @"hours";
          goto LABEL_146;
      }
    }
    else
    {
      switch(a1)
      {
        case 451:
          result = @"megaohms";
          break;
        case 452:
          result = @"kiloohms";
          break;
        case 453:
          result = @"ohms";
          break;
        case 454:
          result = @"milliohms";
          break;
        case 455:
          result = @"microohms";
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    if (a1 <= 120)
    {
      if (a1 > 25)
      {
        switch(a1)
        {
          case '.':
            result = @"degrees";
            break;
          case '/':
            result = @"arcMinutes";
            break;
          case '0':
            result = @"arcSeconds";
            break;
          case '1':
            result = @"radians";
            break;
          case '2':
            result = @"gradians";
            break;
          case '3':
            result = @"revolutions";
            break;
          case '4':
          case '5':
          case '6':
          case '7':
          case '8':
          case '9':
          case ':':
          case ';':
          case '<':
          case '=':
          case '>':
          case '?':
          case '@':
          case 'A':
          case 'B':
          case 'C':
          case 'D':
          case 'E':
          case 'F':
            return result;
          case 'G':
            result = @"squareKilometers";
            break;
          case 'H':
            result = @"squareMeters";
            break;
          case 'I':
            result = @"squareCentimeters";
            break;
          case 'J':
            result = @"squareMillimeters";
            break;
          case 'K':
            result = @"squareMicrometers";
            break;
          case 'L':
            result = @"squareNanometers";
            break;
          case 'M':
            result = @"squareInches";
            break;
          case 'N':
            result = @"squareFeet";
            break;
          case 'O':
            result = @"squareYards";
            break;
          case 'P':
            result = @"squareMiles";
            break;
          case 'Q':
            result = @"acres";
            break;
          case 'R':
            result = @"ares";
            break;
          case 'S':
            result = @"hectares";
            break;
          default:
            BOOL v10 = a1 == 26;
            v11 = @"aqi";
            goto LABEL_146;
        }
        return result;
      }
      BOOL v3 = @"undefined";
      uint64_t v4 = @"metersPerSecondSquared";
      id v7 = @"gravity";
      if (a1 != 2) {
        id v7 = 0;
      }
      if (a1 != 1) {
        uint64_t v4 = v7;
      }
      BOOL v6 = a1 == 0;
LABEL_62:
      if (v6) {
        return v3;
      }
      else {
        return v4;
      }
    }
    switch(a1)
    {
      case 151:
        result = @"kilometers";
        break;
      case 152:
        result = @"hectometers";
        break;
      case 153:
        result = @"decameters";
        break;
      case 154:
        result = @"meters";
        break;
      case 155:
        result = @"decimeters";
        break;
      case 156:
        result = @"centimeters";
        break;
      case 157:
        result = @"millimeters";
        break;
      case 158:
        result = @"micrometers";
        break;
      case 159:
        result = @"nanometers";
        break;
      case 160:
        result = @"picometers";
        break;
      case 161:
        result = @"inches";
        break;
      case 162:
        result = @"feet";
        break;
      case 163:
        result = @"yards";
        break;
      case 164:
        result = @"miles";
        break;
      default:
        BOOL v3 = @"gramsPerLiter";
        uint64_t v4 = @"milligramsPerDeciliter";
        if (a1 != 122) {
          uint64_t v4 = 0;
        }
        BOOL v6 = a1 == 121;
        goto LABEL_62;
    }
  }
  return result;
}

id NSUnitFromCAFUnitType(int a1)
{
  int v2 = 0;
  if (a1 > 600)
  {
    if (a1 > 880)
    {
      if (a1 > 1030)
      {
        if (a1 <= 1130)
        {
          if (a1 > 1080)
          {
            switch(a1)
            {
              case 1081:
                int v2 = [MEMORY[0x263F08D20] fahrenheit];
                break;
              case 1082:
                int v2 = [MEMORY[0x263F08D20] celsius];
                break;
              case 1083:
                int v2 = [MEMORY[0x263F08D20] kelvin];
                break;
            }
          }
          else
          {
            switch(a1)
            {
              case 1031:
                int v2 = [MEMORY[0x263F08D18] metersPerSecond];
                break;
              case 1032:
                int v2 = [MEMORY[0x263F08D18] kilometersPerHour];
                break;
              case 1033:
                int v2 = [MEMORY[0x263F08D18] milesPerHour];
                break;
              case 1034:
                int v2 = [MEMORY[0x263F08D18] metersPerHour];
                break;
              default:
                break;
            }
          }
        }
        else if (a1 > 1204)
        {
          switch(a1)
          {
            case 1205:
              int v2 = +[CAFUnitPercent percent];
              break;
            case 1251:
              int v2 = +[CAFUnitTorque newtonMeter];
              break;
            case 1252:
              int v2 = +[CAFUnitTorque footPound];
              break;
          }
        }
        else
        {
          switch(a1)
          {
            case 1131:
              int v2 = [MEMORY[0x263F08D30] liters];
              break;
            case 1132:
              int v2 = [MEMORY[0x263F08D30] cubicMeters];
              break;
            case 1133:
              int v2 = [MEMORY[0x263F08D30] cubicFeet];
              break;
            case 1134:
              int v2 = [MEMORY[0x263F08D30] fluidOunces];
              break;
            case 1135:
              int v2 = [MEMORY[0x263F08D30] gallons];
              break;
            case 1136:
              int v2 = [MEMORY[0x263F08D30] milliliters];
              break;
            default:
              break;
          }
        }
      }
      else if (a1 > 930)
      {
        switch(a1)
        {
          case 931:
            int v2 = [MEMORY[0x263F08D10] newtonsPerMetersSquared];
            break;
          case 932:
            int v2 = [MEMORY[0x263F08D10] kilopascals];
            break;
          case 933:
            int v2 = [MEMORY[0x263F08D10] poundsForcePerSquareInch];
            break;
          case 934:
            int v2 = [MEMORY[0x263F08D10] bars];
            break;
          default:
            if (a1 == 981)
            {
              int v2 = +[CAFUnitRotationalSpeed revolutionsPerMinute];
            }
            else if (a1 == 982)
            {
              int v2 = +[CAFUnitRotationalSpeed degreesPerSecond];
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 881:
            int v2 = [MEMORY[0x263F08D08] terawatts];
            break;
          case 882:
            int v2 = [MEMORY[0x263F08D08] gigawatts];
            break;
          case 883:
            int v2 = [MEMORY[0x263F08D08] megawatts];
            break;
          case 884:
            int v2 = [MEMORY[0x263F08D08] kilowatts];
            break;
          case 885:
            int v2 = [MEMORY[0x263F08D08] watts];
            break;
          case 886:
            int v2 = [MEMORY[0x263F08D08] milliwatts];
            break;
          case 887:
            int v2 = [MEMORY[0x263F08D08] microwatts];
            break;
          case 888:
            int v2 = [MEMORY[0x263F08D08] nanowatts];
            break;
          case 889:
            int v2 = [MEMORY[0x263F08D08] picowatts];
            break;
          case 890:
            int v2 = [MEMORY[0x263F08D08] femtowatts];
            break;
          case 891:
            int v2 = [MEMORY[0x263F08D08] horsepower];
            break;
          default:
            break;
        }
      }
    }
    else if (a1 > 720)
    {
      switch(a1)
      {
        case 781:
          int v2 = [MEMORY[0x263F08D00] kilograms];
          break;
        case 782:
          int v2 = [MEMORY[0x263F08D00] grams];
          break;
        case 783:
          int v2 = [MEMORY[0x263F08D00] milligrams];
          break;
        case 784:
          int v2 = [MEMORY[0x263F08D00] ounces];
          break;
        case 785:
          int v2 = [MEMORY[0x263F08D00] poundsMass];
          break;
        case 786:
          int v2 = [MEMORY[0x263F08D00] metricTons];
          break;
        case 787:
          int v2 = [MEMORY[0x263F08D00] slugs];
          break;
        default:
          if (a1 == 721)
          {
            int v2 = [MEMORY[0x263F08CD8] lux];
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 601:
          int v2 = +[CAFUnitEnergyEfficiency wattHoursPerKilometer];
          break;
        case 602:
          int v2 = +[CAFUnitEnergyEfficiency milliwattHoursPerKilometer];
          break;
        case 603:
          int v2 = +[CAFUnitEnergyEfficiency wattHoursPerMile];
          break;
        case 604:
          int v2 = +[CAFUnitEnergyEfficiency kilowattHoursPer100Kilometers];
          break;
        case 605:
          int v2 = +[CAFUnitEnergyEfficiency kilowattHoursPer100Miles];
          break;
        case 606:
          int v2 = +[CAFUnitEnergyEfficiency milesPerKilowattHour];
          break;
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
          break;
        case 621:
          int v2 = [MEMORY[0x263F08CC8] terahertz];
          break;
        case 622:
          int v2 = [MEMORY[0x263F08CC8] gigahertz];
          break;
        case 623:
          int v2 = [MEMORY[0x263F08CC8] megahertz];
          break;
        case 624:
          int v2 = [MEMORY[0x263F08CC8] kilohertz];
          break;
        case 625:
          int v2 = [MEMORY[0x263F08CC8] hertz];
          break;
        case 626:
          int v2 = [MEMORY[0x263F08CC8] millihertz];
          break;
        case 627:
          int v2 = [MEMORY[0x263F08CC8] microhertz];
          break;
        case 628:
          int v2 = [MEMORY[0x263F08CC8] nanohertz];
          break;
        default:
          switch(a1)
          {
            case 671:
              int v2 = [MEMORY[0x263F08CD0] litersPer100Kilometers];
              break;
            case 672:
              int v2 = [MEMORY[0x263F08CD0] milesPerGallon];
              break;
            case 673:
              int v2 = [MEMORY[0x263F08CD0] milesPerImperialGallon];
              break;
            case 674:
              int v2 = [MEMORY[0x263F08CD0] millilitersPer100Kilometers];
              break;
            default:
              goto LABEL_154;
          }
          break;
      }
    }
  }
  else if (a1 > 225)
  {
    if (a1 <= 400)
    {
      if (a1 > 252)
      {
        switch(a1)
        {
          case 351:
            int v2 = [MEMORY[0x263F08CA8] megaamperes];
            break;
          case 352:
            int v2 = [MEMORY[0x263F08CA8] kiloamperes];
            break;
          case 353:
            int v2 = [MEMORY[0x263F08CA8] amperes];
            break;
          case 354:
            int v2 = [MEMORY[0x263F08CA8] milliamperes];
            break;
          case 355:
            int v2 = [MEMORY[0x263F08CA8] microamperes];
            break;
          default:
            if (a1 == 253)
            {
              int v2 = [MEMORY[0x263F08C98] hours];
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 226:
            int v2 = [MEMORY[0x263F08C90] partsPerMillion];
            break;
          case 251:
            int v2 = [MEMORY[0x263F08C98] seconds];
            break;
          case 252:
            int v2 = [MEMORY[0x263F08C98] minutes];
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 451:
          int v2 = [MEMORY[0x263F08CB8] megaohms];
          break;
        case 452:
          int v2 = [MEMORY[0x263F08CB8] kiloohms];
          break;
        case 453:
          int v2 = [MEMORY[0x263F08CB8] ohms];
          break;
        case 454:
          int v2 = [MEMORY[0x263F08CB8] milliohms];
          break;
        case 455:
          int v2 = [MEMORY[0x263F08CB8] microohms];
          break;
        default:
          break;
      }
    }
  }
  else if (a1 > 120)
  {
    switch(a1)
    {
      case 151:
        int v2 = [MEMORY[0x263F08CE8] kilometers];
        break;
      case 152:
        int v2 = [MEMORY[0x263F08CE8] hectometers];
        break;
      case 153:
        int v2 = [MEMORY[0x263F08CE8] decameters];
        break;
      case 154:
        int v2 = [MEMORY[0x263F08CE8] meters];
        break;
      case 155:
        int v2 = [MEMORY[0x263F08CE8] decimeters];
        break;
      case 156:
        int v2 = [MEMORY[0x263F08CE8] centimeters];
        break;
      case 157:
        int v2 = [MEMORY[0x263F08CE8] millimeters];
        break;
      case 158:
        int v2 = [MEMORY[0x263F08CE8] micrometers];
        break;
      case 159:
        int v2 = [MEMORY[0x263F08CE8] nanometers];
        break;
      case 160:
        int v2 = [MEMORY[0x263F08CE8] picometers];
        break;
      case 161:
        int v2 = [MEMORY[0x263F08CE8] inches];
        break;
      case 162:
        int v2 = [MEMORY[0x263F08CE8] feet];
        break;
      case 163:
        int v2 = [MEMORY[0x263F08CE8] yards];
        break;
      case 164:
        int v2 = [MEMORY[0x263F08CE8] miles];
        break;
      default:
        if (a1 == 121)
        {
          int v2 = [MEMORY[0x263F08C80] gramsPerLiter];
        }
        else if (a1 == 122)
        {
          int v2 = [MEMORY[0x263F08C80] milligramsPerDeciliter];
        }
        break;
    }
  }
  else if (a1 <= 45)
  {
    switch(a1)
    {
      case 1:
        int v2 = [MEMORY[0x263F08C68] metersPerSecondSquared];
        break;
      case 2:
        int v2 = [MEMORY[0x263F08C68] gravity];
        break;
      case 26:
        int v2 = +[CAFUnitAirQuality aqi];
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case '.':
        int v2 = [MEMORY[0x263F08C70] degrees];
        break;
      case '/':
        int v2 = [MEMORY[0x263F08C70] arcMinutes];
        break;
      case '0':
        int v2 = [MEMORY[0x263F08C70] arcSeconds];
        break;
      case '1':
        int v2 = [MEMORY[0x263F08C70] radians];
        break;
      case '2':
        int v2 = [MEMORY[0x263F08C70] gradians];
        break;
      case '3':
        int v2 = [MEMORY[0x263F08C70] revolutions];
        break;
      case 'G':
        int v2 = [MEMORY[0x263F08C78] squareKilometers];
        break;
      case 'H':
        int v2 = [MEMORY[0x263F08C78] squareMeters];
        break;
      case 'I':
        int v2 = [MEMORY[0x263F08C78] squareCentimeters];
        break;
      case 'J':
        int v2 = [MEMORY[0x263F08C78] squareMillimeters];
        break;
      case 'K':
        int v2 = [MEMORY[0x263F08C78] squareMicrometers];
        break;
      case 'L':
        int v2 = [MEMORY[0x263F08C78] squareNanometers];
        break;
      case 'M':
        int v2 = [MEMORY[0x263F08C78] squareInches];
        break;
      case 'N':
        int v2 = [MEMORY[0x263F08C78] squareFeet];
        break;
      case 'O':
        int v2 = [MEMORY[0x263F08C78] squareYards];
        break;
      case 'P':
        int v2 = [MEMORY[0x263F08C78] squareMiles];
        break;
      case 'Q':
        int v2 = [MEMORY[0x263F08C78] acres];
        break;
      case 'R':
        int v2 = [MEMORY[0x263F08C78] ares];
        break;
      case 'S':
        int v2 = [MEMORY[0x263F08C78] hectares];
        break;
      default:
        break;
    }
  }
LABEL_154:
  return v2;
}

uint64_t CAFUnitTypeFromNSUnit(void *a1)
{
  id v1 = a1;
  int v2 = [MEMORY[0x263F08C68] metersPerSecondSquared];
  char v3 = [v1 isEqual:v2];

  if (v3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F08C68] gravity];
    char v6 = [v1 isEqual:v5];

    if (v6)
    {
      uint64_t v4 = 2;
    }
    else
    {
      id v7 = +[CAFUnitAirQuality aqi];
      char v8 = [v1 isEqual:v7];

      if (v8)
      {
        uint64_t v4 = 26;
      }
      else
      {
        uint64_t v9 = [MEMORY[0x263F08C70] degrees];
        char v10 = [v1 isEqual:v9];

        if (v10)
        {
          uint64_t v4 = 46;
        }
        else
        {
          v11 = [MEMORY[0x263F08C70] arcMinutes];
          char v12 = [v1 isEqual:v11];

          if (v12)
          {
            uint64_t v4 = 47;
          }
          else
          {
            uint64_t v13 = [MEMORY[0x263F08C70] arcSeconds];
            char v14 = [v1 isEqual:v13];

            if (v14)
            {
              uint64_t v4 = 48;
            }
            else
            {
              v15 = [MEMORY[0x263F08C70] radians];
              char v16 = [v1 isEqual:v15];

              if (v16)
              {
                uint64_t v4 = 49;
              }
              else
              {
                int v17 = [MEMORY[0x263F08C70] gradians];
                char v18 = [v1 isEqual:v17];

                if (v18)
                {
                  uint64_t v4 = 50;
                }
                else
                {
                  uint64_t v19 = [MEMORY[0x263F08C70] revolutions];
                  char v20 = [v1 isEqual:v19];

                  if (v20)
                  {
                    uint64_t v4 = 51;
                  }
                  else
                  {
                    double v21 = [MEMORY[0x263F08C78] squareKilometers];
                    char v22 = [v1 isEqual:v21];

                    if (v22)
                    {
                      uint64_t v4 = 71;
                    }
                    else
                    {
                      v23 = [MEMORY[0x263F08C78] squareMeters];
                      char v24 = [v1 isEqual:v23];

                      if (v24)
                      {
                        uint64_t v4 = 72;
                      }
                      else
                      {
                        v25 = [MEMORY[0x263F08C78] squareCentimeters];
                        char v26 = [v1 isEqual:v25];

                        if (v26)
                        {
                          uint64_t v4 = 73;
                        }
                        else
                        {
                          v27 = [MEMORY[0x263F08C78] squareMillimeters];
                          char v28 = [v1 isEqual:v27];

                          if (v28)
                          {
                            uint64_t v4 = 74;
                          }
                          else
                          {
                            long long v29 = [MEMORY[0x263F08C78] squareMicrometers];
                            char v30 = [v1 isEqual:v29];

                            if (v30)
                            {
                              uint64_t v4 = 75;
                            }
                            else
                            {
                              uint64_t v31 = [MEMORY[0x263F08C78] squareNanometers];
                              char v32 = [v1 isEqual:v31];

                              if (v32)
                              {
                                uint64_t v4 = 76;
                              }
                              else
                              {
                                v33 = [MEMORY[0x263F08C78] squareInches];
                                char v34 = [v1 isEqual:v33];

                                if (v34)
                                {
                                  uint64_t v4 = 77;
                                }
                                else
                                {
                                  v35 = [MEMORY[0x263F08C78] squareFeet];
                                  char v36 = [v1 isEqual:v35];

                                  if (v36)
                                  {
                                    uint64_t v4 = 78;
                                  }
                                  else
                                  {
                                    v37 = [MEMORY[0x263F08C78] squareYards];
                                    char v38 = [v1 isEqual:v37];

                                    if (v38)
                                    {
                                      uint64_t v4 = 79;
                                    }
                                    else
                                    {
                                      v39 = [MEMORY[0x263F08C78] squareMiles];
                                      char v40 = [v1 isEqual:v39];

                                      if (v40)
                                      {
                                        uint64_t v4 = 80;
                                      }
                                      else
                                      {
                                        v41 = [MEMORY[0x263F08C78] acres];
                                        char v42 = [v1 isEqual:v41];

                                        if (v42)
                                        {
                                          uint64_t v4 = 81;
                                        }
                                        else
                                        {
                                          v43 = [MEMORY[0x263F08C78] ares];
                                          char v44 = [v1 isEqual:v43];

                                          if (v44)
                                          {
                                            uint64_t v4 = 82;
                                          }
                                          else
                                          {
                                            v45 = [MEMORY[0x263F08C78] hectares];
                                            char v46 = [v1 isEqual:v45];

                                            if (v46)
                                            {
                                              uint64_t v4 = 83;
                                            }
                                            else
                                            {
                                              v47 = [MEMORY[0x263F08C80] gramsPerLiter];
                                              char v48 = [v1 isEqual:v47];

                                              if (v48)
                                              {
                                                uint64_t v4 = 121;
                                              }
                                              else
                                              {
                                                v49 = [MEMORY[0x263F08C80] milligramsPerDeciliter];
                                                char v50 = [v1 isEqual:v49];

                                                if (v50)
                                                {
                                                  uint64_t v4 = 122;
                                                }
                                                else
                                                {
                                                  v51 = [MEMORY[0x263F08CE8] kilometers];
                                                  char v52 = [v1 isEqual:v51];

                                                  if (v52)
                                                  {
                                                    uint64_t v4 = 151;
                                                  }
                                                  else
                                                  {
                                                    v53 = [MEMORY[0x263F08CE8] hectometers];
                                                    char v54 = [v1 isEqual:v53];

                                                    if (v54)
                                                    {
                                                      uint64_t v4 = 152;
                                                    }
                                                    else
                                                    {
                                                      v55 = [MEMORY[0x263F08CE8] decameters];
                                                      char v56 = [v1 isEqual:v55];

                                                      if (v56)
                                                      {
                                                        uint64_t v4 = 153;
                                                      }
                                                      else
                                                      {
                                                        v57 = [MEMORY[0x263F08CE8] meters];
                                                        char v58 = [v1 isEqual:v57];

                                                        if (v58)
                                                        {
                                                          uint64_t v4 = 154;
                                                        }
                                                        else
                                                        {
                                                          v59 = [MEMORY[0x263F08CE8] decimeters];
                                                          char v60 = [v1 isEqual:v59];

                                                          if (v60)
                                                          {
                                                            uint64_t v4 = 155;
                                                          }
                                                          else
                                                          {
                                                            v61 = [MEMORY[0x263F08CE8] centimeters];
                                                            char v62 = [v1 isEqual:v61];

                                                            if (v62)
                                                            {
                                                              uint64_t v4 = 156;
                                                            }
                                                            else
                                                            {
                                                              v63 = [MEMORY[0x263F08CE8] millimeters];
                                                              char v64 = [v1 isEqual:v63];

                                                              if (v64)
                                                              {
                                                                uint64_t v4 = 157;
                                                              }
                                                              else
                                                              {
                                                                v65 = [MEMORY[0x263F08CE8] micrometers];
                                                                char v66 = [v1 isEqual:v65];

                                                                if (v66)
                                                                {
                                                                  uint64_t v4 = 158;
                                                                }
                                                                else
                                                                {
                                                                  v67 = [MEMORY[0x263F08CE8] nanometers];
                                                                  char v68 = [v1 isEqual:v67];

                                                                  if (v68)
                                                                  {
                                                                    uint64_t v4 = 159;
                                                                  }
                                                                  else
                                                                  {
                                                                    v69 = [MEMORY[0x263F08CE8] picometers];
                                                                    char v70 = [v1 isEqual:v69];

                                                                    if (v70)
                                                                    {
                                                                      uint64_t v4 = 160;
                                                                    }
                                                                    else
                                                                    {
                                                                      v71 = [MEMORY[0x263F08CE8] inches];
                                                                      char v72 = [v1 isEqual:v71];

                                                                      if (v72)
                                                                      {
                                                                        uint64_t v4 = 161;
                                                                      }
                                                                      else
                                                                      {
                                                                        v73 = [MEMORY[0x263F08CE8] feet];
                                                                        char v74 = [v1 isEqual:v73];

                                                                        if (v74)
                                                                        {
                                                                          uint64_t v4 = 162;
                                                                        }
                                                                        else
                                                                        {
                                                                          v75 = [MEMORY[0x263F08CE8] yards];
                                                                          char v76 = [v1 isEqual:v75];

                                                                          if (v76)
                                                                          {
                                                                            uint64_t v4 = 163;
                                                                          }
                                                                          else
                                                                          {
                                                                            v77 = [MEMORY[0x263F08CE8] miles];
                                                                            char v78 = [v1 isEqual:v77];

                                                                            if (v78)
                                                                            {
                                                                              uint64_t v4 = 164;
                                                                            }
                                                                            else
                                                                            {
                                                                              v79 = [MEMORY[0x263F08C90] partsPerMillion];
                                                                              char v80 = [v1 isEqual:v79];

                                                                              if (v80)
                                                                              {
                                                                                uint64_t v4 = 226;
                                                                              }
                                                                              else
                                                                              {
                                                                                v81 = [MEMORY[0x263F08C98] seconds];
                                                                                char v82 = [v1 isEqual:v81];

                                                                                if (v82)
                                                                                {
                                                                                  uint64_t v4 = 251;
                                                                                }
                                                                                else
                                                                                {
                                                                                  v83 = [MEMORY[0x263F08C98] minutes];
                                                                                  char v84 = [v1 isEqual:v83];

                                                                                  if (v84)
                                                                                  {
                                                                                    uint64_t v4 = 252;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v85 = [MEMORY[0x263F08C98] hours];
                                                                                    char v86 = [v1 isEqual:v85];

                                                                                    if (v86)
                                                                                    {
                                                                                      uint64_t v4 = 253;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v87 = [MEMORY[0x263F08CA0] coulombs];
                                                                                      char v88 = [v1 isEqual:v87];

                                                                                      if (v88)
                                                                                      {
                                                                                        uint64_t v4 = 301;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v89 = [MEMORY[0x263F08CA0] megaampereHours];
                                                                                        char v90 = [v1 isEqual:v89];

                                                                                        if (v90)
                                                                                        {
                                                                                          uint64_t v4 = 302;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v91 = [MEMORY[0x263F08CA0] kiloampereHours];
                                                                                          char v92 = [v1 isEqual:v91];

                                                                                          if (v92)
                                                                                          {
                                                                                            uint64_t v4 = 303;
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v93 = [MEMORY[0x263F08CA0] ampereHours];
                                                                                            char v94 = [v1 isEqual:v93];

                                                                                            if (v94)
                                                                                            {
                                                                                              uint64_t v4 = 304;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v95 = [MEMORY[0x263F08CA0] milliampereHours];
                                                                                              char v96 = [v1 isEqual:v95];

                                                                                              if (v96)
                                                                                              {
                                                                                                uint64_t v4 = 305;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v97 = [MEMORY[0x263F08CA0] microampereHours];
                                                                                                char v98 = [v1 isEqual:v97];

                                                                                                if (v98)
                                                                                                {
                                                                                                  uint64_t v4 = 306;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v99 = [MEMORY[0x263F08CA8] megaamperes];
                                                                                                  char v100 = [v1 isEqual:v99];

                                                                                                  if (v100)
                                                                                                  {
                                                                                                    uint64_t v4 = 351;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v101 = [MEMORY[0x263F08CA8] kiloamperes];
                                                                                                    char v102 = [v1 isEqual:v101];

                                                                                                    if (v102)
                                                                                                    {
                                                                                                      uint64_t v4 = 352;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v103 = [MEMORY[0x263F08CA8] amperes];
                                                                                                      char v104 = [v1 isEqual:v103];

                                                                                                      if (v104)
                                                                                                      {
                                                                                                        uint64_t v4 = 353;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v105 = [MEMORY[0x263F08CA8] milliamperes];
                                                                                                        char v106 = [v1 isEqual:v105];

                                                                                                        if (v106)
                                                                                                        {
                                                                                                          uint64_t v4 = 354;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          v107 = [MEMORY[0x263F08CA8] microamperes];
                                                                                                          char v108 = [v1 isEqual:v107];

                                                                                                          if (v108)
                                                                                                          {
                                                                                                            uint64_t v4 = 355;
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v109 = [MEMORY[0x263F08CB0] megavolts];
                                                                                                            char v110 = [v1 isEqual:v109];

                                                                                                            if (v110)
                                                                                                            {
                                                                                                              uint64_t v4 = 401;
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v111 = [MEMORY[0x263F08CB0] kilovolts];
                                                                                                              char v112 = [v1 isEqual:v111];

                                                                                                              if (v112)
                                                                                                              {
                                                                                                                uint64_t v4 = 402;
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v113 = [MEMORY[0x263F08CB0] volts];
                                                                                                                char v114 = [v1 isEqual:v113];

                                                                                                                if (v114)
                                                                                                                {
                                                                                                                  uint64_t v4 = 403;
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  v115 = [MEMORY[0x263F08CB0] millivolts];
                                                                                                                  char v116 = [v1 isEqual:v115];

                                                                                                                  if (v116)
                                                                                                                  {
                                                                                                                    uint64_t v4 = 404;
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v117 = [MEMORY[0x263F08CB0] microvolts];
                                                                                                                    char v118 = [v1 isEqual:v117];

                                                                                                                    if (v118)
                                                                                                                    {
                                                                                                                      uint64_t v4 = 405;
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v119 = [MEMORY[0x263F08CB8] megaohms];
                                                                                                                      char v120 = [v1 isEqual:v119];

                                                                                                                      if (v120)
                                                                                                                      {
                                                                                                                        uint64_t v4 = 451;
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v121 = [MEMORY[0x263F08CB8] kiloohms];
                                                                                                                        char v122 = [v1 isEqual:v121];

                                                                                                                        if (v122)
                                                                                                                        {
                                                                                                                          uint64_t v4 = 452;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v123 = [MEMORY[0x263F08CB8] ohms];
                                                                                                                          char v124 = [v1 isEqual:v123];

                                                                                                                          if (v124)
                                                                                                                          {
                                                                                                                            uint64_t v4 = 453;
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            v125 = [MEMORY[0x263F08CB8] milliohms];
                                                                                                                            char v126 = [v1 isEqual:v125];

                                                                                                                            if (v126)
                                                                                                                            {
                                                                                                                              uint64_t v4 = 454;
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              v127 = [MEMORY[0x263F08CB8] microohms];
                                                                                                                              char v128 = [v1 isEqual:v127];

                                                                                                                              if (v128)
                                                                                                                              {
                                                                                                                                uint64_t v4 = 455;
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                v129 = [MEMORY[0x263F08CC0] kilojoules];
                                                                                                                                char v130 = [v1 isEqual:v129];

                                                                                                                                if (v130)
                                                                                                                                {
                                                                                                                                  uint64_t v4 = 551;
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  v131 = [MEMORY[0x263F08CC0] joules];
                                                                                                                                  char v132 = [v1 isEqual:v131];

                                                                                                                                  if (v132)
                                                                                                                                  {
                                                                                                                                    uint64_t v4 = 552;
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    v133 = [MEMORY[0x263F08CC0] kilocalories];
                                                                                                                                    char v134 = [v1 isEqual:v133];

                                                                                                                                    if (v134)
                                                                                                                                    {
                                                                                                                                      uint64_t v4 = 553;
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      v135 = [MEMORY[0x263F08CC0] calories];
                                                                                                                                      char v136 = [v1 isEqual:v135];

                                                                                                                                      if (v136)
                                                                                                                                      {
                                                                                                                                        uint64_t v4 = 554;
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        v137 = [MEMORY[0x263F08CC0] kilowattHours];
                                                                                                                                        char v138 = [v1 isEqual:v137];

                                                                                                                                        if (v138)
                                                                                                                                        {
                                                                                                                                          uint64_t v4 = 555;
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          v139 = [MEMORY[0x263F08CC0] wattHours];
                                                                                                                                          char v140 = [v1 isEqual:v139];

                                                                                                                                          if (v140)
                                                                                                                                          {
                                                                                                                                            uint64_t v4 = 556;
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            v141 = [MEMORY[0x263F08CC0] milliwattHours];
                                                                                                                                            char v142 = [v1 isEqual:v141];

                                                                                                                                            if (v142)
                                                                                                                                            {
                                                                                                                                              uint64_t v4 = 557;
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              v143 = +[CAFUnitEnergyEfficiency wattHoursPerKilometer];
                                                                                                                                              char v144 = [v1 isEqual:v143];

                                                                                                                                              if (v144)
                                                                                                                                              {
                                                                                                                                                uint64_t v4 = 601;
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                v145 = +[CAFUnitEnergyEfficiency milliwattHoursPerKilometer];
                                                                                                                                                char v146 = [v1 isEqual:v145];

                                                                                                                                                if (v146)
                                                                                                                                                {
                                                                                                                                                  uint64_t v4 = 602;
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  v147 = +[CAFUnitEnergyEfficiency wattHoursPerMile];
                                                                                                                                                  char v148 = [v1 isEqual:v147];

                                                                                                                                                  if (v148)
                                                                                                                                                  {
                                                                                                                                                    uint64_t v4 = 603;
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    v149 = +[CAFUnitEnergyEfficiency kilowattHoursPer100Kilometers];
                                                                                                                                                    char v150 = [v1 isEqual:v149];

                                                                                                                                                    if (v150)
                                                                                                                                                    {
                                                                                                                                                      uint64_t v4 = 604;
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      v151 = +[CAFUnitEnergyEfficiency kilowattHoursPer100Miles];
                                                                                                                                                      char v152 = [v1 isEqual:v151];

                                                                                                                                                      if (v152)
                                                                                                                                                      {
                                                                                                                                                        uint64_t v4 = 605;
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        v153 = +[CAFUnitEnergyEfficiency milesPerKilowattHour];
                                                                                                                                                        char v154 = [v1 isEqual:v153];

                                                                                                                                                        if (v154)
                                                                                                                                                        {
                                                                                                                                                          uint64_t v4 = 606;
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          v155 = [MEMORY[0x263F08CC8] terahertz];
                                                                                                                                                          char v156 = [v1 isEqual:v155];

                                                                                                                                                          if (v156)
                                                                                                                                                          {
                                                                                                                                                            uint64_t v4 = 621;
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            v157 = [MEMORY[0x263F08CC8] gigahertz];
                                                                                                                                                            char v158 = [v1 isEqual:v157];

                                                                                                                                                            if (v158)
                                                                                                                                                            {
                                                                                                                                                              uint64_t v4 = 622;
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              v159 = [MEMORY[0x263F08CC8] megahertz];
                                                                                                                                                              char v160 = [v1 isEqual:v159];

                                                                                                                                                              if (v160)
                                                                                                                                                              {
                                                                                                                                                                uint64_t v4 = 623;
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                v161 = [MEMORY[0x263F08CC8] kilohertz];
                                                                                                                                                                char v162 = [v1 isEqual:v161];

                                                                                                                                                                if (v162)
                                                                                                                                                                {
                                                                                                                                                                  uint64_t v4 = 624;
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  v163 = [MEMORY[0x263F08CC8] hertz];
                                                                                                                                                                  char v164 = [v1 isEqual:v163];

                                                                                                                                                                  if (v164)
                                                                                                                                                                  {
                                                                                                                                                                    uint64_t v4 = 625;
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    v165 = [MEMORY[0x263F08CC8] millihertz];
                                                                                                                                                                    char v166 = [v1 isEqual:v165];

                                                                                                                                                                    if (v166)
                                                                                                                                                                    {
                                                                                                                                                                      uint64_t v4 = 626;
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      v167 = [MEMORY[0x263F08CC8] microhertz];
                                                                                                                                                                      char v168 = [v1 isEqual:v167];

                                                                                                                                                                      if (v168)
                                                                                                                                                                      {
                                                                                                                                                                        uint64_t v4 = 627;
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        v169 = [MEMORY[0x263F08CC8] nanohertz];
                                                                                                                                                                        char v170 = [v1 isEqual:v169];

                                                                                                                                                                        if (v170)
                                                                                                                                                                        {
                                                                                                                                                                          uint64_t v4 = 628;
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          v171 = [MEMORY[0x263F08CD0] litersPer100Kilometers];
                                                                                                                                                                          char v172 = [v1 isEqual:v171];

                                                                                                                                                                          if (v172)
                                                                                                                                                                          {
                                                                                                                                                                            uint64_t v4 = 671;
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            v173 = [MEMORY[0x263F08CD0] milesPerGallon];
                                                                                                                                                                            char v174 = [v1 isEqual:v173];

                                                                                                                                                                            if (v174)
                                                                                                                                                                            {
                                                                                                                                                                              uint64_t v4 = 672;
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              v175 = [MEMORY[0x263F08CD0] milesPerImperialGallon];
                                                                                                                                                                              char v176 = [v1 isEqual:v175];

                                                                                                                                                                              if (v176)
                                                                                                                                                                              {
                                                                                                                                                                                uint64_t v4 = 673;
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                v177 = [MEMORY[0x263F08CD0] millilitersPer100Kilometers];
                                                                                                                                                                                char v178 = [v1 isEqual:v177];

                                                                                                                                                                                if (v178)
                                                                                                                                                                                {
                                                                                                                                                                                  uint64_t v4 = 674;
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  v179 = [MEMORY[0x263F08CD8] lux];
                                                                                                                                                                                  char v180 = [v1 isEqual:v179];

                                                                                                                                                                                  if (v180)
                                                                                                                                                                                  {
                                                                                                                                                                                    uint64_t v4 = 721;
                                                                                                                                                                                  }
                                                                                                                                                                                  else
                                                                                                                                                                                  {
                                                                                                                                                                                    v181 = [MEMORY[0x263F08CE0] kilobits];
                                                                                                                                                                                    char v182 = [v1 isEqual:v181];

                                                                                                                                                                                    if (v182)
                                                                                                                                                                                    {
                                                                                                                                                                                      uint64_t v4 = 741;
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      v183 = [MEMORY[0x263F08CE0] megabits];
                                                                                                                                                                                      char v184 = [v1 isEqual:v183];

                                                                                                                                                                                      if (v184)
                                                                                                                                                                                      {
                                                                                                                                                                                        uint64_t v4 = 742;
                                                                                                                                                                                      }
                                                                                                                                                                                      else
                                                                                                                                                                                      {
                                                                                                                                                                                        v185 = [MEMORY[0x263F08CE0] gigabits];
                                                                                                                                                                                        char v186 = [v1 isEqual:v185];

                                                                                                                                                                                        if (v186)
                                                                                                                                                                                        {
                                                                                                                                                                                          uint64_t v4 = 743;
                                                                                                                                                                                        }
                                                                                                                                                                                        else
                                                                                                                                                                                        {
                                                                                                                                                                                          v187 = [MEMORY[0x263F08CE0] terabits];
                                                                                                                                                                                          char v188 = [v1 isEqual:v187];

                                                                                                                                                                                          if (v188)
                                                                                                                                                                                          {
                                                                                                                                                                                            uint64_t v4 = 744;
                                                                                                                                                                                          }
                                                                                                                                                                                          else
                                                                                                                                                                                          {
                                                                                                                                                                                            v189 = [MEMORY[0x263F08CE0] kilobytes];
                                                                                                                                                                                            char v190 = [v1 isEqual:v189];

                                                                                                                                                                                            if (v190)
                                                                                                                                                                                            {
                                                                                                                                                                                              uint64_t v4 = 745;
                                                                                                                                                                                            }
                                                                                                                                                                                            else
                                                                                                                                                                                            {
                                                                                                                                                                                              v191 = [MEMORY[0x263F08CE0] megabytes];
                                                                                                                                                                                              char v192 = [v1 isEqual:v191];

                                                                                                                                                                                              if (v192)
                                                                                                                                                                                              {
                                                                                                                                                                                                uint64_t v4 = 746;
                                                                                                                                                                                              }
                                                                                                                                                                                              else
                                                                                                                                                                                              {
                                                                                                                                                                                                v193 = [MEMORY[0x263F08CE0] gigabytes];
                                                                                                                                                                                                char v194 = [v1 isEqual:v193];

                                                                                                                                                                                                if (v194)
                                                                                                                                                                                                {
                                                                                                                                                                                                  uint64_t v4 = 747;
                                                                                                                                                                                                }
                                                                                                                                                                                                else
                                                                                                                                                                                                {
                                                                                                                                                                                                  v195 = [MEMORY[0x263F08CE0] terabytes];
                                                                                                                                                                                                  char v196 = [v1 isEqual:v195];

                                                                                                                                                                                                  if (v196)
                                                                                                                                                                                                  {
                                                                                                                                                                                                    uint64_t v4 = 748;
                                                                                                                                                                                                  }
                                                                                                                                                                                                  else
                                                                                                                                                                                                  {
                                                                                                                                                                                                    v197 = [MEMORY[0x263F08D00] kilograms];
                                                                                                                                                                                                    char v198 = [v1 isEqual:v197];

                                                                                                                                                                                                    if (v198)
                                                                                                                                                                                                    {
                                                                                                                                                                                                      uint64_t v4 = 781;
                                                                                                                                                                                                    }
                                                                                                                                                                                                    else
                                                                                                                                                                                                    {
                                                                                                                                                                                                      v199 = [MEMORY[0x263F08D00] grams];
                                                                                                                                                                                                      char v200 = [v1 isEqual:v199];

                                                                                                                                                                                                      if (v200)
                                                                                                                                                                                                      {
                                                                                                                                                                                                        uint64_t v4 = 782;
                                                                                                                                                                                                      }
                                                                                                                                                                                                      else
                                                                                                                                                                                                      {
                                                                                                                                                                                                        v201 = [MEMORY[0x263F08D00] milligrams];
                                                                                                                                                                                                        char v202 = [v1 isEqual:v201];

                                                                                                                                                                                                        if (v202)
                                                                                                                                                                                                        {
                                                                                                                                                                                                          uint64_t v4 = 783;
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else
                                                                                                                                                                                                        {
                                                                                                                                                                                                          v203 = [MEMORY[0x263F08D00] ounces];
                                                                                                                                                                                                          char v204 = [v1 isEqual:v203];

                                                                                                                                                                                                          if (v204)
                                                                                                                                                                                                          {
                                                                                                                                                                                                            uint64_t v4 = 784;
                                                                                                                                                                                                          }
                                                                                                                                                                                                          else
                                                                                                                                                                                                          {
                                                                                                                                                                                                            v205 = [MEMORY[0x263F08D00] poundsMass];
                                                                                                                                                                                                            char v206 = [v1 isEqual:v205];

                                                                                                                                                                                                            if (v206)
                                                                                                                                                                                                            {
                                                                                                                                                                                                              uint64_t v4 = 785;
                                                                                                                                                                                                            }
                                                                                                                                                                                                            else
                                                                                                                                                                                                            {
                                                                                                                                                                                                              v207 = [MEMORY[0x263F08D00] metricTons];
                                                                                                                                                                                                              char v208 = [v1 isEqual:v207];

                                                                                                                                                                                                              if (v208)
                                                                                                                                                                                                              {
                                                                                                                                                                                                                uint64_t v4 = 786;
                                                                                                                                                                                                              }
                                                                                                                                                                                                              else
                                                                                                                                                                                                              {
                                                                                                                                                                                                                v209 = [MEMORY[0x263F08D00] slugs];
                                                                                                                                                                                                                char v210 = [v1 isEqual:v209];

                                                                                                                                                                                                                if (v210)
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  uint64_t v4 = 787;
                                                                                                                                                                                                                }
                                                                                                                                                                                                                else
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  v211 = [MEMORY[0x263F08D08] terawatts];
                                                                                                                                                                                                                  char v212 = [v1 isEqual:v211];

                                                                                                                                                                                                                  if (v212)
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    uint64_t v4 = 881;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  else
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    v213 = [MEMORY[0x263F08D08] gigawatts];
                                                                                                                                                                                                                    char v214 = [v1 isEqual:v213];

                                                                                                                                                                                                                    if (v214)
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      uint64_t v4 = 882;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      v215 = [MEMORY[0x263F08D08] megawatts];
                                                                                                                                                                                                                      char v216 = [v1 isEqual:v215];

                                                                                                                                                                                                                      if (v216)
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        uint64_t v4 = 883;
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                      else
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        v217 = [MEMORY[0x263F08D08] kilowatts];
                                                                                                                                                                                                                        char v218 = [v1 isEqual:v217];

                                                                                                                                                                                                                        if (v218)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          uint64_t v4 = 884;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          v219 = [MEMORY[0x263F08D08] watts];
                                                                                                                                                                                                                          char v220 = [v1 isEqual:v219];

                                                                                                                                                                                                                          if (v220)
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            uint64_t v4 = 885;
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                          else
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            v221 = [MEMORY[0x263F08D08] milliwatts];
                                                                                                                                                                                                                            char v222 = [v1 isEqual:v221];

                                                                                                                                                                                                                            if (v222)
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              uint64_t v4 = 886;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              v223 = [MEMORY[0x263F08D08] microwatts];
                                                                                                                                                                                                                              char v224 = [v1 isEqual:v223];

                                                                                                                                                                                                                              if (v224)
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                uint64_t v4 = 887;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              else
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                v225 = [MEMORY[0x263F08D08] nanowatts];
                                                                                                                                                                                                                                char v226 = [v1 isEqual:v225];

                                                                                                                                                                                                                                if (v226)
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  uint64_t v4 = 888;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  v227 = [MEMORY[0x263F08D08] picowatts];
                                                                                                                                                                                                                                  char v228 = [v1 isEqual:v227];

                                                                                                                                                                                                                                  if (v228)
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    uint64_t v4 = 889;
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    v229 = [MEMORY[0x263F08D08] femtowatts];
                                                                                                                                                                                                                                    char v230 = [v1 isEqual:v229];

                                                                                                                                                                                                                                    if (v230)
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      uint64_t v4 = 890;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      v231 = [MEMORY[0x263F08D08] horsepower];
                                                                                                                                                                                                                                      char v232 = [v1 isEqual:v231];

                                                                                                                                                                                                                                      if (v232)
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        uint64_t v4 = 891;
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        v233 = [MEMORY[0x263F08D10] newtonsPerMetersSquared];
                                                                                                                                                                                                                                        char v234 = [v1 isEqual:v233];

                                                                                                                                                                                                                                        if (v234)
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          uint64_t v4 = 931;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          v235 = [MEMORY[0x263F08D10] kilopascals];
                                                                                                                                                                                                                                          char v236 = [v1 isEqual:v235];

                                                                                                                                                                                                                                          if (v236)
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            uint64_t v4 = 932;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            v237 = [MEMORY[0x263F08D10] poundsForcePerSquareInch];
                                                                                                                                                                                                                                            char v238 = [v1 isEqual:v237];

                                                                                                                                                                                                                                            if (v238)
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              uint64_t v4 = 933;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              v239 = [MEMORY[0x263F08D10] bars];
                                                                                                                                                                                                                                              char v240 = [v1 isEqual:v239];

                                                                                                                                                                                                                                              if (v240)
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                uint64_t v4 = 934;
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                v241 = +[CAFUnitRotationalSpeed revolutionsPerMinute];
                                                                                                                                                                                                                                                char v242 = [v1 isEqual:v241];

                                                                                                                                                                                                                                                if (v242)
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  uint64_t v4 = 981;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  v243 = +[CAFUnitRotationalSpeed degreesPerSecond];
                                                                                                                                                                                                                                                  char v244 = [v1 isEqual:v243];

                                                                                                                                                                                                                                                  if (v244)
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    uint64_t v4 = 982;
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    v245 = [MEMORY[0x263F08D18] metersPerSecond];
                                                                                                                                                                                                                                                    char v246 = [v1 isEqual:v245];

                                                                                                                                                                                                                                                    if (v246)
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      uint64_t v4 = 1031;
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      v247 = [MEMORY[0x263F08D18] kilometersPerHour];
                                                                                                                                                                                                                                                      char v248 = [v1 isEqual:v247];

                                                                                                                                                                                                                                                      if (v248)
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        uint64_t v4 = 1032;
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        v249 = [MEMORY[0x263F08D18] milesPerHour];
                                                                                                                                                                                                                                                        char v250 = [v1 isEqual:v249];

                                                                                                                                                                                                                                                        if (v250)
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          uint64_t v4 = 1033;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          v251 = [MEMORY[0x263F08D18] metersPerHour];
                                                                                                                                                                                                                                                          char v252 = [v1 isEqual:v251];

                                                                                                                                                                                                                                                          if (v252)
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            uint64_t v4 = 1034;
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            v253 = [MEMORY[0x263F08D20] fahrenheit];
                                                                                                                                                                                                                                                            char v254 = [v1 isEqual:v253];

                                                                                                                                                                                                                                                            if (v254)
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              uint64_t v4 = 1081;
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              v255 = [MEMORY[0x263F08D20] celsius];
                                                                                                                                                                                                                                                              char v256 = [v1 isEqual:v255];

                                                                                                                                                                                                                                                              if (v256)
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                uint64_t v4 = 1082;
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                v257 = [MEMORY[0x263F08D20] kelvin];
                                                                                                                                                                                                                                                                char v258 = [v1 isEqual:v257];

                                                                                                                                                                                                                                                                if (v258)
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  uint64_t v4 = 1083;
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  v259 = [MEMORY[0x263F08D30] liters];
                                                                                                                                                                                                                                                                  char v260 = [v1 isEqual:v259];

                                                                                                                                                                                                                                                                  if (v260)
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    uint64_t v4 = 1131;
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    v261 = [MEMORY[0x263F08D30] cubicMeters];
                                                                                                                                                                                                                                                                    char v262 = [v1 isEqual:v261];

                                                                                                                                                                                                                                                                    if (v262)
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      uint64_t v4 = 1132;
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      v263 = [MEMORY[0x263F08D30] cubicFeet];
                                                                                                                                                                                                                                                                      char v264 = [v1 isEqual:v263];

                                                                                                                                                                                                                                                                      if (v264)
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        uint64_t v4 = 1133;
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        v265 = [MEMORY[0x263F08D30] fluidOunces];
                                                                                                                                                                                                                                                                        char v266 = [v1 isEqual:v265];

                                                                                                                                                                                                                                                                        if (v266)
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          uint64_t v4 = 1134;
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          v267 = [MEMORY[0x263F08D30] gallons];
                                                                                                                                                                                                                                                                          char v268 = [v1 isEqual:v267];

                                                                                                                                                                                                                                                                          if (v268)
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            uint64_t v4 = 1135;
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            v269 = [MEMORY[0x263F08D30] milliliters];
                                                                                                                                                                                                                                                                            char v270 = [v1 isEqual:v269];

                                                                                                                                                                                                                                                                            if (v270)
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              uint64_t v4 = 1136;
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              v271 = +[CAFUnitPercent percent];
                                                                                                                                                                                                                                                                              char v272 = [v1 isEqual:v271];

                                                                                                                                                                                                                                                                              if (v272)
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                uint64_t v4 = 1205;
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                v273 = +[CAFUnitTorque newtonMeter];
                                                                                                                                                                                                                                                                                char v274 = [v1 isEqual:v273];

                                                                                                                                                                                                                                                                                if (v274)
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  uint64_t v4 = 1251;
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  v275 = +[CAFUnitTorque footPound];
                                                                                                                                                                                                                                                                                  int v276 = [v1 isEqual:v275];

                                                                                                                                                                                                                                                                                  if (v276) {
                                                                                                                                                                                                                                                                                    uint64_t v4 = 1252;
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                  else {
                                                                                                                                                                                                                                                                                    uint64_t v4 = 0;
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                }
                                                                                                                                                                                                              }
                                                                                                                                                                                                            }
                                                                                                                                                                                                          }
                                                                                                                                                                                                        }
                                                                                                                                                                                                      }
                                                                                                                                                                                                    }
                                                                                                                                                                                                  }
                                                                                                                                                                                                }
                                                                                                                                                                                              }
                                                                                                                                                                                            }
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

__CFString *NSStringFromMediaCategory(unsigned int a1)
{
  if (a1 > 0x2B) {
    return 0;
  }
  else {
    return off_2652645B0[(char)a1];
  }
}

id CAFGeneralLogging()
{
  if (CAFGeneralLogging_onceToken != -1) {
    dispatch_once(&CAFGeneralLogging_onceToken, &__block_literal_global_14);
  }
  uint64_t v0 = (void *)CAFGeneralLogging_facility;
  return v0;
}

uint64_t __CAFGeneralLogging_block_invoke()
{
  CAFGeneralLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "General");
  return MEMORY[0x270F9A758]();
}

id CAFCarManagerLogging()
{
  if (CAFCarManagerLogging_onceToken != -1) {
    dispatch_once(&CAFCarManagerLogging_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)CAFCarManagerLogging_facility;
  return v0;
}

uint64_t __CAFCarManagerLogging_block_invoke()
{
  CAFCarManagerLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFCarManager");
  return MEMORY[0x270F9A758]();
}

id CAFDataClientLogging()
{
  if (CAFDataClientLogging_onceToken != -1) {
    dispatch_once(&CAFDataClientLogging_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)CAFDataClientLogging_facility;
  return v0;
}

uint64_t __CAFDataClientLogging_block_invoke()
{
  CAFDataClientLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "caf-dataclient");
  return MEMORY[0x270F9A758]();
}

id CAFRequestResponseLogging()
{
  if (CAFRequestResponseLogging_onceToken != -1) {
    dispatch_once(&CAFRequestResponseLogging_onceToken, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)CAFRequestResponseLogging_facility;
  return v0;
}

uint64_t __CAFRequestResponseLogging_block_invoke()
{
  CAFRequestResponseLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFRequestResponse");
  return MEMORY[0x270F9A758]();
}

id CAFRegistrationLogging()
{
  if (CAFRegistrationLogging_onceToken != -1) {
    dispatch_once(&CAFRegistrationLogging_onceToken, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)CAFRegistrationLogging_facility;
  return v0;
}

uint64_t __CAFRegistrationLogging_block_invoke()
{
  CAFRegistrationLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFRegistration");
  return MEMORY[0x270F9A758]();
}

id CAFCarLogging()
{
  if (CAFCarLogging_onceToken != -1) {
    dispatch_once(&CAFCarLogging_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)CAFCarLogging_facility;
  return v0;
}

uint64_t __CAFCarLogging_block_invoke()
{
  CAFCarLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFCar");
  return MEMORY[0x270F9A758]();
}

id CAFPositionManagerLogging()
{
  if (CAFPositionManagerLogging_onceToken != -1) {
    dispatch_once(&CAFPositionManagerLogging_onceToken, &__block_literal_global_18);
  }
  uint64_t v0 = (void *)CAFPositionManagerLogging_facility;
  return v0;
}

uint64_t __CAFPositionManagerLogging_block_invoke()
{
  CAFPositionManagerLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFPositionManager");
  return MEMORY[0x270F9A758]();
}

id CAFAccessoryLogging()
{
  if (CAFAccessoryLogging_onceToken != -1) {
    dispatch_once(&CAFAccessoryLogging_onceToken, &__block_literal_global_21);
  }
  uint64_t v0 = (void *)CAFAccessoryLogging_facility;
  return v0;
}

uint64_t __CAFAccessoryLogging_block_invoke()
{
  CAFAccessoryLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFAccessory");
  return MEMORY[0x270F9A758]();
}

id CAFServiceLogging()
{
  if (CAFServiceLogging_onceToken != -1) {
    dispatch_once(&CAFServiceLogging_onceToken, &__block_literal_global_24_0);
  }
  uint64_t v0 = (void *)CAFServiceLogging_facility;
  return v0;
}

uint64_t __CAFServiceLogging_block_invoke()
{
  CAFServiceLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFService");
  return MEMORY[0x270F9A758]();
}

id CAFCharacteristicLogging()
{
  if (CAFCharacteristicLogging_onceToken != -1) {
    dispatch_once(&CAFCharacteristicLogging_onceToken, &__block_literal_global_27);
  }
  uint64_t v0 = (void *)CAFCharacteristicLogging_facility;
  return v0;
}

uint64_t __CAFCharacteristicLogging_block_invoke()
{
  CAFCharacteristicLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFCharacteristic");
  return MEMORY[0x270F9A758]();
}

id CAFControlLogging()
{
  if (CAFControlLogging_onceToken != -1) {
    dispatch_once(&CAFControlLogging_onceToken, &__block_literal_global_30_0);
  }
  uint64_t v0 = (void *)CAFControlLogging_facility;
  return v0;
}

uint64_t __CAFControlLogging_block_invoke()
{
  CAFControlLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFControl");
  return MEMORY[0x270F9A758]();
}

id CAFCachedDescriptionLogging()
{
  if (CAFCachedDescriptionLogging_onceToken != -1) {
    dispatch_once(&CAFCachedDescriptionLogging_onceToken, &__block_literal_global_33);
  }
  uint64_t v0 = (void *)CAFCachedDescriptionLogging_facility;
  return v0;
}

uint64_t __CAFCachedDescriptionLogging_block_invoke()
{
  CAFCachedDescriptionLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFCachedDescription");
  return MEMORY[0x270F9A758]();
}

id CAFGroupRequestLogging()
{
  if (CAFGroupRequestLogging_onceToken != -1) {
    dispatch_once(&CAFGroupRequestLogging_onceToken, &__block_literal_global_36);
  }
  uint64_t v0 = (void *)CAFGroupRequestLogging_facility;
  return v0;
}

uint64_t __CAFGroupRequestLogging_block_invoke()
{
  CAFGroupRequestLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFGroupRequest");
  return MEMORY[0x270F9A758]();
}

id CAFValueMonitorLogging()
{
  if (CAFValueMonitorLogging_onceToken != -1) {
    dispatch_once(&CAFValueMonitorLogging_onceToken, &__block_literal_global_39);
  }
  uint64_t v0 = (void *)CAFValueMonitorLogging_facility;
  return v0;
}

uint64_t __CAFValueMonitorLogging_block_invoke()
{
  CAFValueMonitorLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFValueMonitor");
  return MEMORY[0x270F9A758]();
}

id CAFAssetVariantsLogging()
{
  if (CAFAssetVariantsLogging_onceToken != -1) {
    dispatch_once(&CAFAssetVariantsLogging_onceToken, &__block_literal_global_42);
  }
  uint64_t v0 = (void *)CAFAssetVariantsLogging_facility;
  return v0;
}

uint64_t __CAFAssetVariantsLogging_block_invoke()
{
  CAFAssetVariantsLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFAssetVariants");
  return MEMORY[0x270F9A758]();
}

id CAFDLogging()
{
  if (CAFDLogging_onceToken != -1) {
    dispatch_once(&CAFDLogging_onceToken, &__block_literal_global_45);
  }
  uint64_t v0 = (void *)CAFDLogging_facility;
  return v0;
}

uint64_t __CAFDLogging_block_invoke()
{
  CAFDLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "cafd");
  return MEMORY[0x270F9A758]();
}

id CAFDDataLogging()
{
  if (CAFDDataLogging_onceToken != -1) {
    dispatch_once(&CAFDDataLogging_onceToken, &__block_literal_global_48);
  }
  uint64_t v0 = (void *)CAFDDataLogging_facility;
  return v0;
}

uint64_t __CAFDDataLogging_block_invoke()
{
  CAFDDataLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "cafd-dataAgent");
  return MEMORY[0x270F9A758]();
}

id CAFDAssertionLogging()
{
  if (CAFDAssertionLogging_onceToken != -1) {
    dispatch_once(&CAFDAssertionLogging_onceToken, &__block_literal_global_51);
  }
  uint64_t v0 = (void *)CAFDAssertionLogging_facility;
  return v0;
}

uint64_t __CAFDAssertionLogging_block_invoke()
{
  CAFDAssertionLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "cafd-assertion");
  return MEMORY[0x270F9A758]();
}

id CAFDChannelLogging()
{
  if (CAFDChannelLogging_onceToken != -1) {
    dispatch_once(&CAFDChannelLogging_onceToken, &__block_literal_global_54);
  }
  uint64_t v0 = (void *)CAFDChannelLogging_facility;
  return v0;
}

uint64_t __CAFDChannelLogging_block_invoke()
{
  CAFDChannelLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "cafd-datachannel");
  return MEMORY[0x270F9A758]();
}

id CAFDClientLogging()
{
  if (CAFDClientLogging_onceToken != -1) {
    dispatch_once(&CAFDClientLogging_onceToken, &__block_literal_global_57);
  }
  uint64_t v0 = (void *)CAFDClientLogging_facility;
  return v0;
}

uint64_t __CAFDClientLogging_block_invoke()
{
  CAFDClientLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "cafd-dataclient");
  return MEMORY[0x270F9A758]();
}

id CAFToolLogging()
{
  if (CAFToolLogging_onceToken != -1) {
    dispatch_once(&CAFToolLogging_onceToken, &__block_literal_global_60);
  }
  uint64_t v0 = (void *)CAFToolLogging_facility;
  return v0;
}

uint64_t __CAFToolLogging_block_invoke()
{
  CAFToolLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "CAFTool");
  return MEMORY[0x270F9A758]();
}

id CAFNowPlayingLogging()
{
  if (CAFNowPlayingLogging_onceToken != -1) {
    dispatch_once(&CAFNowPlayingLogging_onceToken, &__block_literal_global_63);
  }
  uint64_t v0 = (void *)CAFNowPlayingLogging_facility;
  return v0;
}

uint64_t __CAFNowPlayingLogging_block_invoke()
{
  CAFNowPlayingLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "NowPlaying");
  return MEMORY[0x270F9A758]();
}

id CAFStateCaptureLogging()
{
  if (CAFStateCaptureLogging_onceToken != -1) {
    dispatch_once(&CAFStateCaptureLogging_onceToken, &__block_literal_global_66);
  }
  uint64_t v0 = (void *)CAFStateCaptureLogging_facility;
  return v0;
}

uint64_t __CAFStateCaptureLogging_block_invoke()
{
  CAFStateCaptureLogging_facility = (uint64_t)os_log_create("com.apple.caraccessoryframework", "StateCapture");
  return MEMORY[0x270F9A758]();
}

uint64_t NSStringFromPortSideIndicator(unsigned int a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_265264760 + (char)a1);
  }
}

__CFString *NSStringFromCharacteristicState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"Initialization";
  }
  else {
    return off_265264788[a1 - 1];
  }
}

uint64_t CAFCharacteristicStateFromString(void *a1)
{
  unint64_t v2 = -1;
  uint64_t v3 = 7;
  while (1)
  {
    uint64_t v4 = @"Initialization";
    if (v2 <= 5) {
      uint64_t v4 = off_2652647C0[v2];
    }
    if (![a1 caseInsensitiveCompare:v4]) {
      break;
    }
    if (++v2 == 6) {
      return v3;
    }
  }
  return v2 + 1;
}

uint64_t CAFCompareObjects(void *a1, void *a2)
{
  if (a1 == a2) {
    return 0;
  }
  if (a1 && a2) {
    return [a1 compare:a2];
  }
  if (a1) {
    return a2 == 0;
  }
  return -1;
}

uint64_t CAFEntityCompare(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if ([v3 conformsToProtocol:&unk_26FD95950]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = a2;
  if ([v5 conformsToProtocol:&unk_26FD95950]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  uint64_t v7 = 1;
  if (v4 && v6)
  {
    uint64_t v8 = [v4 baseCAFClass];
    if (v8 == [v6 baseCAFClass])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v9 = objc_msgSend(v4, "comparisonKeys", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v7 = 0;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            if (!v7)
            {
              uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              v15 = [v4 valueForKeyPath:v14];
              uint64_t v16 = [v6 valueForKeyPath:v14];
              int v17 = (void *)v16;
              if (v15 == (void *)v16)
              {
                uint64_t v7 = 0;
              }
              else
              {
                if (v15) {
                  BOOL v18 = v16 == 0;
                }
                else {
                  BOOL v18 = 1;
                }
                if (v18)
                {
                  if (v15) {
                    uint64_t v7 = v16 == 0;
                  }
                  else {
                    uint64_t v7 = -1;
                  }
                }
                else
                {
                  uint64_t v7 = [v15 compare:v16];
                }
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v11);
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

uint64_t CAFCharacteristicStateIsCurrent(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) < 3 || a1 == 0) {
    return 0;
  }
  if (a1 == 7) {
    CAFCharacteristicStateIsCurrent_cold_1();
  }
  return 1;
}

uint64_t CAFCharacteristicStateIsInitializing(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 5) {
    return 0;
  }
  if (a1 == 7) {
    CAFCharacteristicStateIsInitializing_cold_1();
  }
  return 1;
}

__CFString *NSStringFromFuelLevelState(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_265264A60[(char)a1];
  }
}

void sub_249795C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void sub_249796A60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromTransmissionMode(int a1)
{
  int v1 = a1 - 68;
  result = 0;
  switch(v1)
  {
    case 0:
      result = @"D";
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 11:
    case 13:
      return result;
    case 8:
      result = @"L";
      break;
    case 9:
      result = @"M";
      break;
    case 10:
      result = @"N";
      break;
    case 12:
      result = @"P";
      break;
    case 14:
      result = @"R";
      break;
    case 15:
      result = @"S";
      break;
    default:
      result = @"None";
      break;
  }
  return result;
}

__CFString *NSStringFromNotificationSeverity(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_265264AE8[(char)a1];
  }
}

void sub_2497A03BC(_Unwind_Exception *exception_object)
{
}

void sub_2497A0478(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2497A12AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2497A1D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromCableState(unsigned int a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_265264B58[(char)a1];
  }
}

id CAFCarDataServiceInterface()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDB27B8];
  int v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  id v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_fetchCurrentCarConfigWithReply_ argumentIndex:0 ofReply:1];

  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_addRegistrationToPluginID_instanceIDs_priority_withResponse_ argumentIndex:0 ofReply:0];

  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  [v0 setClasses:v7 forSelector:sel_addRegistrationToPluginID_instanceIDs_priority_withResponse_ argumentIndex:1 ofReply:0];

  uint64_t v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v8 forSelector:sel_addRegistrationToPluginID_instanceIDs_priority_withResponse_ argumentIndex:2 ofReply:0];

  uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v9 forSelector:sel_addRegistrationToPluginID_instanceIDs_priority_withResponse_ argumentIndex:0 ofReply:1];

  uint64_t v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel_removeRegistrationFromPluginID_instanceIDs_priority_withResponse_ argumentIndex:0 ofReply:0];

  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v0 setClasses:v13 forSelector:sel_removeRegistrationFromPluginID_instanceIDs_priority_withResponse_ argumentIndex:1 ofReply:0];

  uint64_t v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v14 forSelector:sel_removeRegistrationFromPluginID_instanceIDs_priority_withResponse_ argumentIndex:2 ofReply:0];

  v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v15 forSelector:sel_removeRegistrationFromPluginID_instanceIDs_priority_withResponse_ argumentIndex:0 ofReply:1];

  uint64_t v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v16 forSelector:sel_readFromPluginID_instanceIDs_priority_withResponse_ argumentIndex:0 ofReply:0];

  int v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  [v0 setClasses:v19 forSelector:sel_readFromPluginID_instanceIDs_priority_withResponse_ argumentIndex:1 ofReply:0];

  long long v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v20 forSelector:sel_readFromPluginID_instanceIDs_priority_withResponse_ argumentIndex:2 ofReply:0];

  long long v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v21 forSelector:sel_readFromPluginID_instanceIDs_priority_withResponse_ argumentIndex:0 ofReply:1];

  long long v22 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v22 forSelector:sel_writeToPluginID_values_priority_withResponse_ argumentIndex:0 ofReply:0];

  long long v23 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  long long v29 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, objc_opt_class(), 0);
  [v0 setClasses:v29 forSelector:sel_writeToPluginID_values_priority_withResponse_ argumentIndex:1 ofReply:0];

  char v30 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v30 forSelector:sel_writeToPluginID_values_priority_withResponse_ argumentIndex:2 ofReply:0];

  uint64_t v31 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v31 forSelector:sel_writeToPluginID_values_priority_withResponse_ argumentIndex:0 ofReply:1];

  char v32 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v32 forSelector:sel_requestPluginID_instanceID_value_priority_withResponse_ argumentIndex:0 ofReply:0];

  v33 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v33 forSelector:sel_requestPluginID_instanceID_value_priority_withResponse_ argumentIndex:1 ofReply:0];

  char v34 = (void *)MEMORY[0x263EFFA08];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  char v40 = objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, v39, objc_opt_class(), 0);
  [v0 setClasses:v40 forSelector:sel_requestPluginID_instanceID_value_priority_withResponse_ argumentIndex:2 ofReply:0];

  v41 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v41 forSelector:sel_requestPluginID_instanceID_value_priority_withResponse_ argumentIndex:3 ofReply:0];

  char v42 = (void *)MEMORY[0x263EFFA08];
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  v49 = objc_msgSend(v42, "setWithObjects:", v43, v44, v45, v46, v47, v48, objc_opt_class(), 0);
  [v0 setClasses:v49 forSelector:sel_requestPluginID_instanceID_value_priority_withResponse_ argumentIndex:0 ofReply:1];

  char v50 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v50 forSelector:sel_notifyPluginID_instanceID_value_priority_ argumentIndex:0 ofReply:0];

  v51 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v51 forSelector:sel_notifyPluginID_instanceID_value_priority_ argumentIndex:1 ofReply:0];

  char v52 = (void *)MEMORY[0x263EFFA08];
  uint64_t v53 = objc_opt_class();
  uint64_t v54 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  uint64_t v57 = objc_opt_class();
  char v58 = objc_msgSend(v52, "setWithObjects:", v53, v54, v55, v56, v57, objc_opt_class(), 0);
  [v0 setClasses:v58 forSelector:sel_notifyPluginID_instanceID_value_priority_ argumentIndex:2 ofReply:0];

  v59 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v59 forSelector:sel_notifyPluginID_instanceID_value_priority_ argumentIndex:3 ofReply:0];

  return v0;
}

id CAFCarDataClientInterface()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDA2218];
  int v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  id v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_didUpdateCurrentCarConfig_ argumentIndex:0 ofReply:0];

  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel_didUpdateConfig_ argumentIndex:0 ofReply:0];

  uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v11 forSelector:sel_didUpdatePluginID_values_ argumentIndex:0 ofReply:0];

  uint64_t v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
  [v0 setClasses:v18 forSelector:sel_didUpdatePluginID_values_ argumentIndex:1 ofReply:0];

  uint64_t v19 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v19 forSelector:sel_didNotifyPluginID_instanceID_value_ argumentIndex:0 ofReply:0];

  long long v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v20 forSelector:sel_didNotifyPluginID_instanceID_value_ argumentIndex:1 ofReply:0];

  long long v21 = (void *)MEMORY[0x263EFFA08];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_msgSend(v21, "setWithObjects:", v22, v23, v24, v25, v26, objc_opt_class(), 0);
  [v0 setClasses:v27 forSelector:sel_didNotifyPluginID_instanceID_value_ argumentIndex:2 ofReply:0];

  uint64_t v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v28 forSelector:sel_didRequestPluginID_instanceID_value_withResponse_ argumentIndex:0 ofReply:0];

  long long v29 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v29 forSelector:sel_didRequestPluginID_instanceID_value_withResponse_ argumentIndex:1 ofReply:0];

  char v30 = (void *)MEMORY[0x263EFFA08];
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_msgSend(v30, "setWithObjects:", v31, v32, v33, v34, v35, objc_opt_class(), 0);
  [v0 setClasses:v36 forSelector:sel_didRequestPluginID_instanceID_value_withResponse_ argumentIndex:2 ofReply:0];

  uint64_t v37 = (void *)MEMORY[0x263EFFA08];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_msgSend(v37, "setWithObjects:", v38, v39, v40, v41, v42, v43, objc_opt_class(), 0);
  [v0 setClasses:v44 forSelector:sel_didRequestPluginID_instanceID_value_withResponse_ argumentIndex:0 ofReply:1];

  return v0;
}

__CFString *NSStringFromSensorState(unsigned int a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_265264D90[(char)a1];
  }
}

__CFString *NSStringFromChargingState(unsigned int a1)
{
  if (a1 > 0xA) {
    return 0;
  }
  else {
    return off_265264DB8[(char)a1];
  }
}

__CFString *NSStringFromControlSender(uint64_t a1)
{
  int v1 = @"unknown";
  if (a1 == 1) {
    int v1 = @"accessory";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"device";
  }
}

__CFString *NSStringFromBatteryLevelState(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_265264E30[(char)a1];
  }
}

__CFString *NSStringFromSeatOccupancy(unsigned int a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_265264E48[(char)a1];
  }
}

id NSStringFromVentTypes(uint64_t a1)
{
  v23[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = NSString;
  if (+[CAFBitMaskUtilities bitmask:a1 hasOption:1]) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  id v4 = [v2 stringWithFormat:@"window=%@", v3];
  v23[0] = v4;
  uint64_t v5 = NSString;
  if (+[CAFBitMaskUtilities bitmask:a1 hasOption:2]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  uint64_t v7 = [v5 stringWithFormat:@"upper=%@", v6];
  v23[1] = v7;
  uint64_t v8 = NSString;
  if (+[CAFBitMaskUtilities bitmask:a1 hasOption:4]) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  uint64_t v10 = [v8 stringWithFormat:@"lower=%@", v9];
  v23[2] = v10;
  uint64_t v11 = NSString;
  if (+[CAFBitMaskUtilities bitmask:a1 hasOption:8]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  uint64_t v13 = [v11 stringWithFormat:@"neck=%@", v12];
  v23[3] = v13;
  uint64_t v14 = NSString;
  if (+[CAFBitMaskUtilities bitmask:a1 hasOption:16]) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  uint64_t v16 = [v14 stringWithFormat:@"middle=%@", v15];
  v23[4] = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];

  uint64_t v18 = NSString;
  uint64_t v19 = +[CAFBitMaskUtilities description:a1 optionCount:5];
  long long v20 = [v17 componentsJoinedByString:@" "];
  long long v21 = [v18 stringWithFormat:@"(%@) %@", v19, v20];

  return v21;
}

__CFString *NSStringFromFillLevelLabel(int a1)
{
  int v1 = @"ZeroToOne";
  if (a1 != 1) {
    int v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"EmptyToFull";
  }
}

void CAFCharacteristicStateIsCurrent_cold_1()
{
}

void CAFCharacteristicStateIsInitializing_cold_1()
{
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x270F10770]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t CARSignpostLogForCategory()
{
  return MEMORY[0x270F151B8]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x270F306A0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x270F24598]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
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

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}