void sub_1D30559EC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3055B64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3055CDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _DNDSPrimaryBundleIdentifier(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v1 allowPlaceholder:0 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 containingBundleRecord];
    v4 = [v3 bundleIdentifier];

    v5 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v1;
      __int16 v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_INFO, "Mapping extension bundle %@ to containing bundle %@.", (uint8_t *)&v7, 0x16u);
    }

    v2 = v3;
  }
  else
  {
    v4 = v1;
  }

  return v4;
}

void sub_1D3056778(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3056C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3056EC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

void sub_1D305FC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1D30600D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3060964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1D30645DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D306498C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3064CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D30653E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *DNDSStringFromUILockState(uint64_t a1)
{
  uint64_t v1 = @"<invalid>";
  if (a1 == 1) {
    uint64_t v1 = @"UI unlocked";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"UI locked";
  }
}

void sub_1D3066F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D30670FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1D306A44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_S_s0_s8_s16_S_s24_s32_s40_s48_S_s56_s64_s72_s80_s88_s96_S_s104_s112_s120_s128_s136_s144_s152_s160_s168_s176_s184_s192_S_s200_s208_S_s216_s224_s232_s240_s248_s256_S_s264_S_s272_s280_s288_s296_s304_s312_s320_S_s328_s336_s344_s352(void *a1, id *a2)
{
  __copy_constructor_8_8_s0_s8_s16(a1, a2);
  __copy_constructor_8_8_s0_s8_s16_s24(a1 + 3, a2 + 3);
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40(a1 + 7, a2 + 7);
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_s56_s64_s72_s80_s88(a1 + 13, a2 + 13);
  a1[25] = a2[25];
  a1[26] = a2[26];
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40(a1 + 27, a2 + 27);
  a1[33] = a2[33];
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48(a1 + 34, a2 + 34);
  return __copy_constructor_8_8_s0_s8_s16_s24(a1 + 41, a2 + 41);
}

id __copy_constructor_8_8_s0_s8_s16(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  id result = a2[2];
  a1[2] = result;
  return result;
}

id __copy_constructor_8_8_s0_s8_s16_s24(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  id result = a2[3];
  a1[3] = result;
  return result;
}

id __copy_constructor_8_8_s0_s8_s16_s24_s32_s40(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  id result = a2[5];
  a1[5] = result;
  return result;
}

id __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_s56_s64_s72_s80_s88(void *a1, id *a2)
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
  a1[10] = a2[10];
  id result = a2[11];
  a1[11] = result;
  return result;
}

id __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  id result = a2[6];
  a1[6] = result;
  return result;
}

void sub_1D306BB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *DNDOverrideSettingToString(uint64_t a1)
{
  uint64_t v1 = @"default";
  if (!a1) {
    uint64_t v1 = @"NO";
  }
  if (a1 == 1) {
    return @"YES";
  }
  else {
    return v1;
  }
}

void sub_1D306E870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1D3070810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

__CFString *DNDSStringFromLostModeState(uint64_t a1)
{
  uint64_t v1 = @"<invalid>";
  if (a1 == 1) {
    uint64_t v1 = @"Active";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Inactive";
  }
}

void sub_1D307C218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
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

void sub_1D3085E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *currentDevicePlatformString()
{
  v0 = [MEMORY[0x1E4F5F5C8] currentDevice];
  uint64_t v1 = [v0 deviceClass];
  uint64_t v2 = @"unknown";
  if (v1 == 3) {
    uint64_t v2 = @"ipados";
  }
  if (v1 == 1) {
    v3 = @"iphoneos";
  }
  else {
    v3 = v2;
  }

  return v3;
}

unint64_t DNDResolvedPreventAutoReplySetting(unint64_t result)
{
  if (result <= 1) {
    return 1;
  }
  return result;
}

uint64_t DNDResolvedModesCanImpactAvailabilitySetting(uint64_t result)
{
  if (!result) {
    return 2;
  }
  return result;
}

void sub_1D308FB78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
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

void sub_1D3090148(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

uint64_t DNDGrantedUserNotificationsAuthorizationForBundleIdentifier(void *a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t v1 = (void *)MEMORY[0x1E4FB3840];
  id v2 = a1;
  v3 = [v1 currentNotificationSettingsCenter];
  uint64_t v4 = [v3 notificationSourceWithIdentifier:v2];

  v5 = [v4 sourceSettings];
  uint64_t v6 = [v5 notificationSettings];
  BOOL v7 = [v6 authorizationStatus] == 2;

  return v7;
}

void DNDWorkoutStateObserverCallback(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = DNDSLogWorkoutTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Requesting workout trigger refresh due to nano preferences change", v4, 2u);
  }
  [v2 _refreshForNanoPreferenceChange];
}

void sub_1D30976C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
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

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t DNDSyncStateChanged(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = a3;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "NPS has sent notification, name=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  return [a2 _updateForReason:0];
}

uint64_t DNDAssertionStateChanged(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = DNDSLogLegacyAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacyAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = a3;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "NPS has sent notification, name=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  return [a2 _updateGizmoAssertionSync];
}

void sub_1D309B46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1D309B664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DNDSModeConfigurationsVersionSupported()
{
  return [NSNumber numberWithInteger:*MEMORY[0x1E4F5F500]];
}

void *DNDSModeConfigurationsMinimumRequiredVersionForConfigurationVersion(void *a1)
{
  if ([a1 integerValue] >= 4) {
    return &unk_1F2A5D940;
  }
  else {
    return &unk_1F2A5D928;
  }
}

void DNDDrivingTriggerObserverCallback(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Requestig driving trigger refresh due to CarKit preferences notification", v4, 2u);
    }
    [v2 refresh];
  }
}

void DNDEffectiveOverridesChanged(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 date];
  [v3 _updateScheduleSettingsWithDate:v4];
}

uint64_t DNDPrivilegedSenderChanged(uint64_t a1, void *a2)
{
  return [a2 _updateBypassSettings];
}

void sub_1D30A1A44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1D30A41E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D30A619C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void DNDSMigrateLegacySettings()
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_legacySettingsFileURL");
  id v2 = [v1 path];
  int v3 = [v0 fileExistsAtPath:v2];

  if (!v3) {
    goto LABEL_46;
  }
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v1];
  id v71 = 0;
  v5 = +[DNDSSettingsRecord recordWithEncodedInfo:v4 error:&v71];
  id v6 = v71;
  int v7 = v6;
  if (!v5)
  {
    v19 = DNDSLogDataMigrator;
    BOOL v20 = os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v20) {
        DNDSMigrateLegacySettings_cold_4((uint64_t)v7, v19, v21, v22, v23, v24, v25, v26);
      }
      _DNDSRequestRadar(@"Error loading legacy settings", v7, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLegacySettingsMigration.m", 68);
    }
    else if (v20)
    {
      DNDSMigrateLegacySettings_cold_3(v19);
    }
    goto LABEL_21;
  }
  id v62 = v6;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_settingsBackingStoreFileURL");
  uint64_t v9 = +[DNDSSettingsRecord backingStoreWithFileURL:v8];
  v10 = [v9 readRecordWithError:0];
  uint64_t v11 = [v10 scheduleSettings];
  if (v11)
  {
    uint64_t v12 = (void *)[v5 mutableCopy];
    [v12 setScheduleSettings:v11];

    v5 = v12;
  }
  id v70 = 0;
  uint64_t v13 = [v9 writeRecord:v5 error:&v70];
  id v14 = v70;
  if (!v13)
  {
    v27 = DNDSLogDataMigrator;
    if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_ERROR)) {
      DNDSMigrateLegacySettings_cold_5((uint64_t)v14, v27, v28, v29, v30, v31, v32, v33);
    }
    _DNDSRequestRadar(@"Error writing migrated settings", v14, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLegacySettingsMigration.m", 63);
    goto LABEL_20;
  }
  if (v13 != 1)
  {
    if (v13 != 2) {
      goto LABEL_20;
    }
    uint64_t v15 = DNDSLogDataMigrator;
    if (!os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "Successfully wrote migrated settings";
    uint64_t v17 = v15;
    uint32_t v18 = 2;
    goto LABEL_19;
  }
  uint64_t v34 = DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v73 = v14;
    uint64_t v16 = "Error writing migrated settings, but error can be ignored; error=%{public}@";
    uint64_t v17 = v34;
    uint32_t v18 = 12;
LABEL_19:
    _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
  }
LABEL_20:

  int v7 = v62;
LABEL_21:
  v35 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"overrideStatus", objc_opt_class());
  uint64_t v36 = [v35 integerValue];
  if (v36)
  {
    uint64_t v37 = v36;
    v38 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_localAssertionBackingStoreFileURL");
    v39 = [v38 path];
    char v40 = [v0 fileExistsAtPath:v39];

    if ((v40 & 1) == 0)
    {
      v41 = DNDSLogDataMigrator;
      if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v41, OS_LOG_TYPE_DEFAULT, "Legacy override status present with no pre-existing assertion store, will create", buf, 2u);
      }
      v42 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"overrideStatusLastCalculatedTime", objc_opt_class());
      [v42 timeIntervalSinceNow];
      if (v43 >= 0.0)
      {
        v49 = DNDSLogDataMigrator;
        if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_ERROR)) {
          DNDSMigrateLegacySettings_cold_2(v49);
        }
      }
      else
      {
        v63 = v7;
        v61 = objc_alloc_init(DNDSClientDetailsProvider);
        v44 = [[DNDSModeAssertionManager alloc] initWithBackingStoreURL:v38 clientDetailsProvider:v61];
        v45 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:@"com.apple.donotdisturb.legacy-migration" deviceIdentifier:0];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __DNDSMigrateLegacySettings_block_invoke;
        v66[3] = &unk_1E69748E8;
        uint64_t v69 = v37;
        id v60 = v45;
        id v67 = v60;
        id v68 = v42;
        id v65 = 0;
        v46 = [(DNDSModeAssertionManager *)v44 updateModeAssertionsWithContextHandler:v66 error:&v65];
        id v47 = v65;
        v48 = DNDSLogDataMigrator;
        if (v46)
        {
          if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D3052000, v48, OS_LOG_TYPE_DEFAULT, "Successfully wrote migrated assertions", buf, 2u);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_ERROR)) {
            DNDSMigrateLegacySettings_cold_1((uint64_t)v47, v48, v50, v51, v52, v53, v54, v55);
          }
          _DNDSRequestRadar(@"Error writing migrated assertions", v47, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLegacySettingsMigration.m", 109);
        }

        int v7 = v63;
      }
    }
  }
  id v64 = 0;
  int v56 = [v0 removeItemAtURL:v1 error:&v64];
  id v57 = v64;
  v58 = DNDSLogDataMigrator;
  BOOL v59 = os_log_type_enabled((os_log_t)DNDSLogDataMigrator, OS_LOG_TYPE_DEFAULT);
  if (v56)
  {
    if (v59)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v58, OS_LOG_TYPE_DEFAULT, "Successfully removed legacy settings", buf, 2u);
    }
  }
  else
  {
    if (v59)
    {
      *(_DWORD *)buf = 138543362;
      id v73 = v57;
      _os_log_impl(&dword_1D3052000, v58, OS_LOG_TYPE_DEFAULT, "Error removing legacy settings, will request radar: error=%{public}@", buf, 0xCu);
    }
    _DNDSRequestRadar(@"Error removing legacy settings", v57, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLegacySettingsMigration.m", 123);
  }

LABEL_46:
}

uint64_t __DNDSMigrateLegacySettings_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (a1[6] == 1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F5F700]);
    [v4 setIdentifier:@"legacy-toggle"];
    v5 = [MEMORY[0x1E4F5F638] lifetimeUntilEndOfScheduleWithIdentifier:*MEMORY[0x1E4F5F520]];
    [v4 setLifetime:v5];

    [v4 setReason:1];
    id v6 = (id)[v3 takeAssertionWithDetails:v4 source:a1[4] startDate:a1[5]];
  }
  else
  {
    id v4 = +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion];
    int v7 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v4 requestDate:a1[5] source:a1[4] reason:2];
    id v8 = (id)[v3 invalidateAssertionsForRequest:v7];
  }
  return 1;
}

void sub_1D30ABC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

uint64_t BMUserFocusModeComputedUpdateReasonForStateUpdateReason(unint64_t a1)
{
  if (a1 > 6) {
    return 1;
  }
  else {
    return dword_1D3122010[a1];
  }
}

unint64_t BMUserFocusModeComputedUpdateSourceForStateUpdateSource(unint64_t result)
{
  if (result >= 4) {
    return 2;
  }
  else {
    return result;
  }
}

uint64_t BMUserFocusModeComputedSemanticTypeForDNDModeSemanticType(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) < 0xB) {
    return (a1 + 2);
  }
  else {
    return 0;
  }
}

__CFString *DNDSStringFromPairedDeviceClass(unint64_t a1)
{
  if (a1 > 4) {
    return @"<unhandled>";
  }
  else {
    return off_1E6974930[a1];
  }
}

__CFString *DNDSStringFromSyncServiceType(uint64_t a1)
{
  uint64_t v1 = @"<unhandled>";
  if (a1 == 2) {
    uint64_t v1 = @"cloud";
  }
  if (a1 == 1) {
    return @"local";
  }
  else {
    return v1;
  }
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_1D30B39F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D30B5FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void sub_1D30BC45C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D30BC770(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D30BCD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

uint64_t DNDSMinorBuildVersionFromBuildVersion(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  id v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
  v5 = [v4 invertedSet];
  id v6 = objc_msgSend(v2, "substringFromIndex:", objc_msgSend(v2, "rangeOfCharacterFromSet:", v3));

  int v7 = [v6 stringByRemovingCharactersFromSet:v5];

  uint64_t v8 = [v7 unsignedIntValue];
  return v8;
}

uint64_t DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion(uint64_t *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = DNDSMinorBuildVersionFromBuildVersion(v5);
  switch(a3)
  {
    case 1:
      if (*a1 < 15)
      {
        if (*a1 <= 12) {
          goto LABEL_32;
        }
        goto LABEL_29;
      }
      if (![v5 hasPrefix:@"19"]) {
        goto LABEL_24;
      }
      if (![v5 hasPrefix:@"19A"])
      {
        if (([v5 hasPrefix:@"19B"] & 1) == 0
          && ([v5 hasPrefix:@"19C"] & 1) == 0
          && ([v5 hasPrefix:@"19D"] & 1) == 0)
        {
          uint64_t v13 = @"19E";
          goto LABEL_45;
        }
        goto LABEL_43;
      }
      uint64_t v7 = 9;
      if (v6 >= 0x110 && v6 - 5261 >= 0x14)
      {
        uint64_t v8 = -5281;
        goto LABEL_22;
      }
      goto LABEL_33;
    case 2:
      if (*a1 < 12)
      {
        uint64_t v10 = (void *)DNDSLogPairedDeviceState;
        if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR)) {
          DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion_cold_1(a1, v10);
        }
        goto LABEL_32;
      }
      if (![v5 hasPrefix:@"21"]) {
        goto LABEL_24;
      }
      if (![v5 hasPrefix:@"21A"])
      {
        if (([v5 hasPrefix:@"21B"] & 1) != 0
          || ([v5 hasPrefix:@"21C"] & 1) != 0
          || ([v5 hasPrefix:@"21D"] & 1) != 0)
        {
          goto LABEL_43;
        }
        uint64_t v13 = @"21E";
LABEL_45:
        BOOL v12 = [v5 hasPrefix:v13] == 0;
        goto LABEL_46;
      }
      uint64_t v7 = 9;
      if (v6 >= 0xF9 && v6 - 5248 >= 0x14)
      {
        uint64_t v8 = -5268;
        goto LABEL_22;
      }
      goto LABEL_33;
    case 3:
      uint64_t v9 = *a1;
      if (*a1 < 8)
      {
        if (v9 > 5)
        {
LABEL_29:
          uint64_t v7 = 8;
        }
        else
        {
          if (v9 <= 3) {
            goto LABEL_32;
          }
          uint64_t v7 = 1;
        }
      }
      else
      {
        if (![v5 hasPrefix:@"19"]) {
          goto LABEL_24;
        }
        if ([v5 hasPrefix:@"19R"])
        {
          uint64_t v7 = 9;
          if (v6 >= 0x115 && v6 - 5266 >= 0x14)
          {
            uint64_t v8 = -5286;
LABEL_22:
            if (v6 + v8 >= 0xFFFFFFFFFFFFFFECLL) {
              goto LABEL_32;
            }
            goto LABEL_43;
          }
        }
        else
        {
          if ([v5 hasPrefix:@"19S"])
          {
LABEL_43:
            uint64_t v7 = 10;
            goto LABEL_33;
          }
          BOOL v12 = ([v5 hasPrefix:@"19T"] & (v6 < 0x217)) == 0;
LABEL_46:
          if (v12) {
            uint64_t v7 = 11;
          }
          else {
            uint64_t v7 = 10;
          }
        }
      }
LABEL_33:

      return v7;
    case 4:
      if (*a1 <= 0) {
        goto LABEL_32;
      }
LABEL_24:
      uint64_t v7 = 11;
      goto LABEL_33;
    default:
LABEL_32:
      uint64_t v7 = 0;
      goto LABEL_33;
  }
}

uint64_t DNDSConfigurationSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion(uint64_t *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = DNDSMajorBuildVersionFromBuildVersion(v5);
  switch(a3)
  {
    case 1:
      BOOL v7 = *a1 < 15;
      goto LABEL_10;
    case 2:
      if (*a1 < 12 || v6 <= 0x15) {
        goto LABEL_14;
      }
      goto LABEL_16;
    case 3:
      BOOL v7 = *a1 < 8;
LABEL_10:
      if (!v7 && v6 > 0x13) {
        goto LABEL_16;
      }
LABEL_14:
      long long v12 = *(_OWORD *)a1;
      uint64_t v13 = a1[2];
      uint64_t v10 = DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion((uint64_t *)&v12, v5, a3);
      break;
    case 4:
      if (*a1 <= 0) {
        goto LABEL_17;
      }
LABEL_16:
      uint64_t v10 = 12;
      break;
    default:
LABEL_17:
      uint64_t v10 = 0;
      break;
  }

  return v10;
}

BOOL DNDSisIOS14EraOSFromOperatingSystemVersionAndDeviceClass(void *a1, uint64_t a2)
{
  if (a2 == 1)
  {
    if (*a1 == 14) {
      return 1;
    }
  }
  else
  {
    if (a2 != 3) {
      return a2 == 2 && *a1 == 10 && a1[1] == 18;
    }
    if (*a1 == 7) {
      return 1;
    }
  }
  return 0;
}

uint64_t DNDSsupportsSilenceListsSFromOperatingSystemVersionAndDeviceClass(uint64_t *a1, uint64_t a2)
{
  switch(a2)
  {
    case 1:
      if (*a1 <= 15) {
        goto LABEL_7;
      }
      goto LABEL_9;
    case 2:
      if (*a1 > 12) {
        goto LABEL_9;
      }
      goto LABEL_7;
    case 3:
      if (*a1 <= 8) {
        goto LABEL_7;
      }
      goto LABEL_9;
    case 4:
      if (*a1 <= 0) {
        goto LABEL_7;
      }
LABEL_9:
      uint64_t result = 1;
      break;
    default:
LABEL_7:
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_1D30BEDDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DNDSMajorBuildVersionFromBuildVersion(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  id v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
  id v5 = [v4 invertedSet];
  unint64_t v6 = objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "rangeOfCharacterFromSet:", v3));

  BOOL v7 = [v6 stringByRemovingCharactersFromSet:v5];

  uint64_t v8 = [v7 unsignedIntValue];
  return v8;
}

void sub_1D30C3C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_1D30C4704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DNDSRegisterSysdiagnose()
{
  return _DNDSSysdiagnoseDataProviders();
}

id _DNDSSysdiagnoseDataProviders()
{
  if (_DNDSSysdiagnoseDataProviders_onceToken != -1) {
    dispatch_once(&_DNDSSysdiagnoseDataProviders_onceToken, &__block_literal_global_23);
  }
  uint64_t v0 = (void *)_DNDSSysdiagnoseDataProviders_sysdiagnoseDataProviders;
  return v0;
}

void DNDSRegisterSysdiagnoseDataProvider(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_dataProvidersLock);
  id v2 = _DNDSSysdiagnoseDataProviders();
  id v3 = [v2 objectForKey:v1];
  id v4 = v3;
  if (v3)
  {
    [v3 unsignedLongValue];
    os_state_remove_handler();
  }
  BOOL v7 = v1;
  id v5 = v1;
  unint64_t v6 = [NSNumber numberWithUnsignedLongLong:os_state_add_handler()];
  [v2 setObject:v6 forKey:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&_dataProvidersLock);
}

_DWORD *__DNDSRegisterSysdiagnoseDataProvider_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    atomic_fetch_add(&_sysdiagnoseInProgress, 1u);
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = [*(id *)(a1 + 32) sysdiagnoseDataIdentifier];
    id v5 = DNDSLogSysdiagnose;
    if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      BOOL v20 = v4;
      __int16 v21 = 2114;
      uint64_t v22 = v3;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Capturing state from %{public}@; date=%{public}@",
        buf,
        0x16u);
    }
    unint64_t v6 = [*(id *)(a1 + 32) sysdiagnoseDataForDate:v3 redacted:DNDSRedactSysdiagnose()];
    BOOL v7 = DNDSLogSysdiagnose;
    if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      BOOL v20 = v4;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Packing sysdiagnose state data from %{public}@...", buf, 0xCu);
    }
    id v18 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v18];
    id v9 = v18;
    uint64_t v10 = [v8 length];
    if (v8)
    {
      uint64_t v11 = v10;
      if ((unint64_t)(v10 + 200) <= 0x8000)
      {
        long long v12 = malloc_type_calloc(1uLL, v10 + 200, 0x6D348980uLL);
        id v13 = [*(id *)(a1 + 32) sysdiagnoseDataIdentifier];
        [v13 cStringUsingEncoding:1];
        __strlcpy_chk();

        *long long v12 = 1;
        v12[1] = v11;
        [v8 getBytes:v12 + 50 length:v11];
        uint64_t v14 = DNDSLogSysdiagnose;
        if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          BOOL v20 = v4;
          _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Sysdiagnose captured from %{public}@", buf, 0xCu);
        }
        goto LABEL_17;
      }
      uint64_t v16 = DNDSLogSysdiagnose;
      if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_ERROR)) {
        __DNDSRegisterSysdiagnoseDataProvider_block_invoke_cold_2((uint64_t)v4, v16);
      }
    }
    else
    {
      uint64_t v15 = DNDSLogSysdiagnose;
      if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_ERROR)) {
        __DNDSRegisterSysdiagnoseDataProvider_block_invoke_cold_1((uint64_t)v4, (uint64_t)v9, v15);
      }
    }
    long long v12 = 0;
LABEL_17:
    atomic_fetch_add(&_sysdiagnoseInProgress, 0xFFFFFFFF);

    return v12;
  }
  return 0;
}

uint64_t DNDSRedactSysdiagnose()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"DNDSAllowUnredactedSysdiagnose"];

  return (v1 | os_variant_has_internal_diagnostics()) ^ 1;
}

void DNDSUnregisterSysdiagnoseDataProvider(void *a1)
{
  id v4 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_dataProvidersLock);
  int v1 = _DNDSSysdiagnoseDataProviders();
  id v2 = [v1 objectForKey:v4];
  id v3 = v2;
  if (v2)
  {
    [v2 unsignedLongValue];
    os_state_remove_handler();
    [v1 removeObjectForKey:v4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_dataProvidersLock);
}

id DNDSCollectSysdiagnoseState(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_dataProvidersLock);
  id v2 = _DNDSSysdiagnoseDataProviders();
  os_unfair_lock_unlock((os_unfair_lock_t)&_dataProvidersLock);
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 138543362;
    long long v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "sysdiagnoseDataIdentifier", v15, (void)v16);
        long long v12 = DNDSLogSysdiagnose;
        if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          __int16 v21 = v11;
          _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Capturing statedump from %{public}@", buf, 0xCu);
        }
        id v13 = [v10 sysdiagnoseDataForDate:v1 redacted:DNDSRedactSysdiagnose()];
        [v3 setObject:v13 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  return v3;
}

BOOL DNDSIsSysdiagnoseBeingCaptured()
{
  unsigned int v0 = atomic_load((unsigned int *)&_sysdiagnoseInProgress);
  return v0 != 0;
}

unsigned char *OUTLINED_FUNCTION_0_2(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_1_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void DNDSRegisterLogging()
{
  DNDRegisterLogging();
  if (DNDSRegisterLogging_onceToken != -1)
  {
    dispatch_once(&DNDSRegisterLogging_onceToken, &__block_literal_global_24);
  }
}

uint64_t __DNDSRegisterLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.donotdisturb", "ServerGeneral");
  id v1 = (void *)DNDSLogGeneral;
  DNDSLogGeneral = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.donotdisturb", "Resolver");
  id v3 = (void *)DNDSLogResolver;
  DNDSLogResolver = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.donotdisturb", "ServiceProvider");
  uint64_t v5 = (void *)DNDSLogServiceProvider;
  DNDSLogServiceProvider = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.donotdisturb", "AppConfiguration");
  uint64_t v7 = (void *)DNDSLogAppConfigurationServiceProvider;
  DNDSLogAppConfigurationServiceProvider = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.donotdisturb", "AppFocusConfigurationTask");
  id v9 = (void *)DNDSLogAppFocusConfigurationTask;
  DNDSLogAppFocusConfigurationTask = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.donotdisturb", "AppFocusConfiguration");
  uint64_t v11 = (void *)DNDSLogAppFocusConfiguration;
  DNDSLogAppFocusConfiguration = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.donotdisturb", "SystemFocusConfiguration");
  id v13 = (void *)DNDSLogSystemFocusConfiguration;
  DNDSLogSystemFocusConfiguration = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.donotdisturb", "AppSpecificSettingsManager");
  long long v15 = (void *)DNDSLogAppSpecificSettingsManager;
  DNDSLogAppSpecificSettingsManager = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.donotdisturb", "AvailabilityProvider");
  long long v17 = (void *)DNDSLogAvailabilityProvider;
  DNDSLogAvailabilityProvider = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.donotdisturb", "StateProvider");
  long long v19 = (void *)DNDSLogStateProvider;
  DNDSLogStateProvider = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.donotdisturb", "AssertionManager");
  __int16 v21 = (void *)DNDSLogAssertionManager;
  DNDSLogAssertionManager = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.donotdisturb", "AssertionStore");
  uint64_t v23 = (void *)DNDSLogAssertionStore;
  DNDSLogAssertionStore = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.donotdisturb", "IDSTransport");
  uint64_t v25 = (void *)DNDSLogIDSTransport;
  DNDSLogIDSTransport = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.donotdisturb", "Schedule");
  v27 = (void *)DNDSLogSchedule;
  DNDSLogSchedule = (uint64_t)v26;

  os_log_t v28 = os_log_create("com.apple.donotdisturb", "AppForegroundTrigger");
  uint64_t v29 = (void *)DNDSLogAppForegroundTrigger;
  DNDSLogAppForegroundTrigger = (uint64_t)v28;

  os_log_t v30 = os_log_create("com.apple.donotdisturb", "BiomeDonation");
  uint64_t v31 = (void *)DNDSLogBiomeDonation;
  DNDSLogBiomeDonation = (uint64_t)v30;

  os_log_t v32 = os_log_create("com.apple.donotdisturb", "DrivingTrigger");
  uint64_t v33 = (void *)DNDSLogDrivingTrigger;
  DNDSLogDrivingTrigger = (uint64_t)v32;

  os_log_t v34 = os_log_create("com.apple.donotdisturb", "MindfulnessTrigger");
  v35 = (void *)DNDSLogMindfulnessTrigger;
  DNDSLogMindfulnessTrigger = (uint64_t)v34;

  os_log_t v36 = os_log_create("com.apple.donotdisturb", "GamingTrigger");
  uint64_t v37 = (void *)DNDSLogGamingTrigger;
  DNDSLogGamingTrigger = (uint64_t)v36;

  os_log_t v38 = os_log_create("com.apple.donotdisturb", "HearingTestTrigger");
  v39 = (void *)DNDSLogHearingTestTrigger;
  DNDSLogHearingTestTrigger = (uint64_t)v38;

  os_log_t v40 = os_log_create("com.apple.donotdisturb", "SleepingTrigger");
  v41 = (void *)DNDSLogSleepingTrigger;
  DNDSLogSleepingTrigger = (uint64_t)v40;

  os_log_t v42 = os_log_create("com.apple.donotdisturb", "SmartTrigger");
  double v43 = (void *)DNDSLogSmartTrigger;
  DNDSLogSmartTrigger = (uint64_t)v42;

  os_log_t v44 = os_log_create("com.apple.donotdisturb", "WorkoutTrigger");
  v45 = (void *)DNDSLogWorkoutTrigger;
  DNDSLogWorkoutTrigger = (uint64_t)v44;

  os_log_t v46 = os_log_create("com.apple.donotdisturb", "Settings");
  id v47 = (void *)DNDSLogSettings;
  DNDSLogSettings = (uint64_t)v46;

  os_log_t v48 = os_log_create("com.apple.donotdisturb", "AuxiliaryState");
  v49 = (void *)DNDSLogAuxiliaryState;
  DNDSLogAuxiliaryState = (uint64_t)v48;

  os_log_t v50 = os_log_create("com.apple.donotdisturb", "SystemState");
  uint64_t v51 = (void *)DNDSLogSystemState;
  DNDSLogSystemState = (uint64_t)v50;

  os_log_t v52 = os_log_create("com.apple.donotdisturb", "MeDeviceService");
  uint64_t v53 = (void *)DNDSLogMeDeviceService;
  DNDSLogMeDeviceService = (uint64_t)v52;

  os_log_t v54 = os_log_create("com.apple.donotdisturb", "LegacyAssertionSync");
  uint64_t v55 = (void *)DNDSLogLegacyAssertionSync;
  DNDSLogLegacyAssertionSync = (uint64_t)v54;

  os_log_t v56 = os_log_create("com.apple.donotdisturb", "LegacySettingsSync");
  id v57 = (void *)DNDSLogLegacySettingsSync;
  DNDSLogLegacySettingsSync = (uint64_t)v56;

  os_log_t v58 = os_log_create("com.apple.donotdisturb", "ModernAssertionSync");
  BOOL v59 = (void *)DNDSLogModernAssertionSync;
  DNDSLogModernAssertionSync = (uint64_t)v58;

  os_log_t v60 = os_log_create("com.apple.donotdisturb", "PairedDeviceState");
  v61 = (void *)DNDSLogPairedDeviceState;
  DNDSLogPairedDeviceState = (uint64_t)v60;

  os_log_t v62 = os_log_create("com.apple.donotdisturb", "DateIntervalLifetimeMonitor");
  v63 = (void *)DNDSLogDateIntervalLifetimeMonitor;
  DNDSLogDateIntervalLifetimeMonitor = (uint64_t)v62;

  os_log_t v64 = os_log_create("com.apple.donotdisturb", "LocationLifetimeMonitor");
  id v65 = (void *)DNDSLogLocationLifetimeMonitor;
  DNDSLogLocationLifetimeMonitor = (uint64_t)v64;

  os_log_t v66 = os_log_create("com.apple.donotdisturb", "CalendarEventLifetimeMonitor");
  id v67 = (void *)DNDSLogCalendarEventLifetimeMonitor;
  DNDSLogCalendarEventLifetimeMonitor = (uint64_t)v66;

  os_log_t v68 = os_log_create("com.apple.donotdisturb", "ScheduleLifetimeMonitor");
  uint64_t v69 = (void *)DNDSLogScheduleLifetimeMonitor;
  DNDSLogScheduleLifetimeMonitor = (uint64_t)v68;

  os_log_t v70 = os_log_create("com.apple.donotdisturb", "DefaultLifetimeMonitor");
  id v71 = (void *)DNDSLogDefaultLifetimeMonitor;
  DNDSLogDefaultLifetimeMonitor = (uint64_t)v70;

  os_log_t v72 = os_log_create("com.apple.donotdisturb", "DataMigrator");
  id v73 = (void *)DNDSLogDataMigrator;
  DNDSLogDataMigrator = (uint64_t)v72;

  os_log_t v74 = os_log_create("com.apple.donotdisturb", "Sysdiagnose");
  v75 = (void *)DNDSLogSysdiagnose;
  DNDSLogSysdiagnose = (uint64_t)v74;

  os_log_t v76 = os_log_create("com.apple.donotdisturb", "Metrics");
  v77 = (void *)DNDSLogMetrics;
  DNDSLogMetrics = (uint64_t)v76;

  os_log_t v78 = os_log_create("com.apple.donotdisturb", "Keybag");
  v79 = (void *)DNDSLogKeybag;
  DNDSLogKeybag = (uint64_t)v78;

  os_log_t v80 = os_log_create("com.apple.donotdisturb", "CloudSync");
  v81 = (void *)DNDSLogCloudSync;
  DNDSLogCloudSync = (uint64_t)v80;

  os_log_t v82 = os_log_create("com.apple.donotdisturb", "ModeConfigurations");
  v83 = (void *)DNDSLogModeConfigurations;
  DNDSLogModeConfigurations = (uint64_t)v82;

  os_log_t v84 = os_log_create("com.apple.donotdisturb", "GlobalConfiguration");
  v85 = (void *)DNDSLogGlobalConfiguration;
  DNDSLogGlobalConfiguration = (uint64_t)v84;

  os_log_t v86 = os_log_create("com.apple.donotdisturb", "IDSSyncEngine");
  v87 = (void *)DNDSLogIDSSyncEngine;
  DNDSLogIDSSyncEngine = (uint64_t)v86;

  os_log_t v88 = os_log_create("com.apple.donotdisturb", "XPCEventPublisher");
  uint64_t v89 = DNDSLogXPCEventPublisher;
  DNDSLogXPCEventPublisher = (uint64_t)v88;
  return MEMORY[0x1F41817F8](v88, v89);
}

void sub_1D30CA5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D30CF91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_1D30D01E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D30D0828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1D30D0F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1D30D1704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D30D1DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D30D2974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D30D3410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D30D3B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1D30D4514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t DNDMirrorStateChanged(uint64_t a1, void *a2)
{
  return [a2 _updatePairSyncPreferences];
}

void sub_1D30DDD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_1D30DDFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D30DE274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D30DE444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D30DE6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D30DE984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D30DEC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___intersect_clientIdentifier_modeIdentifier_priority_block_invoke()
{
  v6[29] = *MEMORY[0x1E4F143B8];
  v5[0] = @"com.apple.private.SpringBoard.focus.intents";
  v5[1] = @"com.apple.donotdisturb.control-center.module";
  v6[0] = &unk_1F2A5DB00;
  v6[1] = &unk_1F2A5DB28;
  v5[2] = @"com.apple.donotdisturb.siri.assistant";
  v5[3] = @"com.apple.donotdisturb.preferences";
  v6[2] = &unk_1F2A5DB50;
  v6[3] = &unk_1F2A5DB78;
  v5[4] = @"com.apple.siri.Settings";
  v5[5] = @"com.apple.springboard.donotdisturb.hid";
  v6[4] = &unk_1F2A5DBA0;
  v6[5] = &unk_1F2A5DBC8;
  v5[6] = @"com.apple.donotdisturb.DoNotDisturbAppIntents";
  v5[7] = @"com.apple.DoNotDisturb.Intents";
  v6[6] = &unk_1F2A5DBF0;
  v6[7] = &unk_1F2A5DC18;
  v5[8] = @"com.apple.donotdisturb.private.intents";
  v5[9] = @"com.apple.donotdisturb.private.intents.user-interactive";
  v6[8] = &unk_1F2A5DC40;
  v6[9] = &unk_1F2A5DC68;
  v5[10] = @"com.apple.private.dndtool";
  v5[11] = @"com.apple.private.dndtool.user-requested";
  v6[10] = &unk_1F2A5DC90;
  v6[11] = &unk_1F2A5DCB8;
  v5[12] = @"com.apple.carkitd.assertion-service";
  v5[13] = @"com.apple.donotdisturb.private.driving-trigger";
  v6[12] = &unk_1F2A5DCE0;
  v6[13] = &unk_1F2A5DD08;
  v5[14] = @"com.apple.private.Carousel.school-mode.DND.state";
  v5[15] = @"com.apple.donotdisturb.private.app-launch";
  v6[14] = &unk_1F2A5DD30;
  v6[15] = &unk_1F2A5DD58;
  v5[16] = @"com.apple.donotdisturb.private.gaming-trigger";
  v5[17] = @"com.apple.donotdisturb.private.hearing-trigger";
  v6[16] = &unk_1F2A5DD80;
  v6[17] = &unk_1F2A5DDA8;
  v5[18] = @"com.apple.donotdisturb.private.mindfulness-trigger";
  v5[19] = @"com.apple.donotdisturb.private.workout-trigger";
  v6[18] = &unk_1F2A5DDD0;
  v6[19] = &unk_1F2A5DDF8;
  v5[20] = @"com.apple.HealthDaemon.assertion-service";
  v5[21] = @"com.apple.sleep.sleep-mode";
  v6[20] = &unk_1F2A5DE20;
  v6[21] = &unk_1F2A5DE48;
  v5[22] = @"com.apple.donotdisturb.private.sleeping-trigger";
  v5[23] = @"com.apple.sleep.sleep-mode-legacy";
  v6[22] = &unk_1F2A5DE70;
  v6[23] = &unk_1F2A5DE98;
  v6[24] = &unk_1F2A5DEC0;
  v5[24] = @"com.apple.mobiletimer.bedtime-mode";
  v5[25] = @"com.apple.donotdisturb.private.schedule";
  v3[0] = *MEMORY[0x1E4F5F550];
  v3[1] = @"*";
  v4[0] = &unk_1F2A5DA30;
  v4[1] = &unk_1F2A5DA48;
  os_log_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  v6[25] = v0;
  v6[26] = &unk_1F2A5DEE8;
  v5[26] = @"com.apple.donotdisturb.private.region";
  v5[27] = @"com.apple.donotdisturb.private.smart-trigger";
  v5[28] = @"*";
  v6[27] = &unk_1F2A5DF10;
  v6[28] = &unk_1F2A5DF38;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:29];
  os_log_t v2 = (void *)_intersect_clientIdentifier_modeIdentifier_priority_dict;
  _intersect_clientIdentifier_modeIdentifier_priority_dict = v1;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t DNDSPowerLogFocusUpdateReasonForDNDStateUpdateReason(uint64_t a1)
{
  uint64_t v1 = 1;
  if (a1 == 5) {
    uint64_t v1 = 2;
  }
  if (a1 == 1) {
    return 0;
  }
  else {
    return v1;
  }
}

BOOL DNDSPowerLogFocusUpdateSourceForDNDStateUpdateSource(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

unint64_t DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType(unint64_t result)
{
  if (result >= 0xA) {
    return -1;
  }
  return result;
}

void DNDSPowerLogFocusStatusChangeEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v20[6] = *MEMORY[0x1E4F143B8];
  v20[0] = a1;
  v19[0] = @"timestamp";
  v19[1] = @"Available";
  uint64_t v11 = NSNumber;
  id v12 = a1;
  uint64_t v13 = [v11 numberWithInteger:a2];
  v20[1] = v13;
  v19[2] = @"Source";
  uint64_t v14 = [NSNumber numberWithInteger:a3];
  v20[2] = v14;
  v19[3] = @"Reason";
  uint64_t v15 = [NSNumber numberWithInteger:a4];
  v20[3] = v15;
  v19[4] = @"SemanticType";
  uint64_t v16 = [NSNumber numberWithInteger:a5];
  v20[4] = v16;
  v19[5] = @"ExtensionCount";
  uint64_t v17 = [NSNumber numberWithInteger:a6];
  v20[5] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];

  PLLogRegisteredEvent();
}

BOOL DNDSPowerLogInterruptionSuppressionForDNDInterruptionSuppression(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

void DNDSPowerLogFocusInterruptionSuppresionEvent(void *a1, uint64_t a2)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a2 - 1) <= 1)
  {
    v8[0] = a1;
    v7[0] = @"BundleID";
    v7[1] = @"InterruptionSuppression";
    id v3 = NSNumber;
    id v4 = a1;
    uint64_t v5 = [v3 numberWithInteger:a2];
    v7[2] = @"Count";
    v8[1] = v5;
    v8[2] = &unk_1F2A5DAA8;
    os_log_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

    PLLogRegisteredEvent();
  }
}

void DNDSPowerLogFocusFilterPerformEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v17[0] = a1;
  v16[0] = @"timestamp";
  v16[1] = @"Source";
  uint64_t v9 = NSNumber;
  id v10 = a1;
  uint64_t v11 = [v9 numberWithInteger:a2];
  v17[1] = v11;
  v16[2] = @"Reason";
  id v12 = [NSNumber numberWithInteger:a3];
  v17[2] = v12;
  v16[3] = @"SemanticType";
  uint64_t v13 = [NSNumber numberWithInteger:a4];
  v17[3] = v13;
  v16[4] = @"ExtensionCount";
  uint64_t v14 = [NSNumber numberWithInteger:a5];
  v17[4] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];

  PLLogRegisteredEvent();
}

void sub_1D30E1F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DNDSSyncEngineStateIsAvailable(unint64_t a1)
{
  uint64_t v1 = HIDWORD(a1) & 1;
  if ((~a1 & 0x1010100) != 0) {
    LODWORD(v1) = 0;
  }
  if ((a1 & 0x10000000000) != 0) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t DNDSSyncEngineStateIsEnabled(unint64_t a1)
{
  uint64_t v1 = HIDWORD(a1) & 1;
  if ((~a1 & 0x1010101) != 0) {
    LODWORD(v1) = 0;
  }
  if ((a1 & 0x10000000000) != 0) {
    return 1;
  }
  else {
    return v1;
  }
}

BOOL DNDSSyncEngineStatePreferenceIsEnabled(uint64_t a1)
{
  return (a1 & 0x10000000001) != 0;
}

__CFString *DNDSResolutionOutcomeToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"<invalid>";
  }
  else {
    return off_1E6975400[a1];
  }
}

id _DNDSContainingBundleIdentifier(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  os_log_t v2 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v1 allowPlaceholder:0 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 containingBundleRecord];
    id v4 = [v3 bundleIdentifier];

    uint64_t v5 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v1;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_INFO, "Mapping extension bundle %@ to containing bundle %@.", (uint8_t *)&v7, 0x16u);
    }

    os_log_t v2 = v3;
  }
  else
  {
    id v4 = v1;
  }

  return v4;
}

void sub_1D30F7B20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D30F7C94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return v0;
}

void _DNDSRequestRadar(void *a1, void *a2, int a3, void *a4, uint64_t a5)
{
  v55[10] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  if (os_variant_has_internal_content() && !DNDSIsSysdiagnoseBeingCaptured())
  {
    os_log_t v40 = [MEMORY[0x1E4F1C9C8] date];
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
    v41 = [v12 lastPathComponent];

    uint64_t v13 = NSString;
    if (v10)
    {
      uint64_t v14 = [v10 domain];
      uint64_t v15 = [v13 stringWithFormat:@" -- %@:%lu", v14, objc_msgSend(v10, "code")];
      os_log_t v42 = [v13 stringWithFormat:@"[AUTO GENERATED] %@ (%@:%lu%@)", v9, v41, a5, v15];
    }
    else
    {
      os_log_t v42 = [NSString stringWithFormat:@"[AUTO GENERATED] %@ (%@:%lu%@)", v9, v41, a5, &stru_1F2A2D288];
    }
    v39 = [NSString stringWithFormat:@"Please describe what you were doing:\n\n\n--- Do not edit below this line ---\n\nError: %@\n\nOriginal title: %@", v10, v42];
    id v16 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v16 setDateFormat:@"yyyy.MM.dd_HH-mm-ss"];
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA60];
    v54[0] = @"Title";
    v54[1] = @"Description";
    v54[2] = @"Classification";
    v54[3] = @"ComponentID";
    v55[2] = @"Serious Bug";
    v55[3] = @"960036";
    v54[4] = @"ComponentName";
    v54[5] = @"ComponentVersion";
    v55[4] = @"Do Not Disturb (iOS)";
    v55[5] = @"New Bugs";
    v54[6] = @"Reproducibility";
    v54[7] = @"IncludeDevicePrefixInTitle";
    v55[0] = v42;
    v55[1] = v39;
    v55[6] = @"Not Applicable";
    v55[7] = @"1";
    v54[8] = @"TimeOfIssue";
    uint64_t v18 = [v16 stringFromDate:v40];
    v55[8] = v18;
    v54[9] = @"DeviceClasses";
    if (a3) {
      long long v19 = @"iPhone,iPad,Watch,Mac";
    }
    else {
      long long v19 = &stru_1F2A2D288;
    }
    v55[9] = v19;
    os_log_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:10];
    __int16 v21 = [v17 dictionaryWithDictionary:v20];

    os_log_t v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = ___DNDSRequestRadar_block_invoke;
    v43[3] = &unk_1E69755A0;
    id v23 = v22;
    id v44 = v23;
    objc_msgSend(v21, "bs_each:", v43);
    id v24 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v24 setScheme:@"tap-to-radar"];
    [v24 setHost:@"new"];
    [v24 setQueryItems:v23];
    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x2050000000;
    uint64_t v25 = (void *)getUNUserNotificationCenterClass_softClass;
    uint64_t v53 = getUNUserNotificationCenterClass_softClass;
    if (!getUNUserNotificationCenterClass_softClass)
    {
      uint64_t v45 = MEMORY[0x1E4F143A8];
      uint64_t v46 = 3221225472;
      id v47 = __getUNUserNotificationCenterClass_block_invoke;
      os_log_t v48 = &unk_1E69755C8;
      v49 = &v50;
      __getUNUserNotificationCenterClass_block_invoke((uint64_t)&v45);
      uint64_t v25 = (void *)v51[3];
    }
    os_log_t v26 = v25;
    _Block_object_dispose(&v50, 8);
    v27 = (void *)[[v26 alloc] initWithBundleIdentifier:@"com.apple.donotdisturb"];
    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x2050000000;
    os_log_t v28 = (void *)getUNMutableNotificationContentClass_softClass;
    uint64_t v53 = getUNMutableNotificationContentClass_softClass;
    if (!getUNMutableNotificationContentClass_softClass)
    {
      uint64_t v45 = MEMORY[0x1E4F143A8];
      uint64_t v46 = 3221225472;
      id v47 = __getUNMutableNotificationContentClass_block_invoke;
      os_log_t v48 = &unk_1E69755C8;
      v49 = &v50;
      __getUNMutableNotificationContentClass_block_invoke((uint64_t)&v45);
      os_log_t v28 = (void *)v51[3];
    }
    uint64_t v29 = v28;
    _Block_object_dispose(&v50, 8);
    id v30 = objc_alloc_init(v29);
    [v30 setTitle:@"Focus Radar Request (internal)"];
    [v30 setBody:@"Focus encountered an unexpected state. Please file a Radar to help us diagnose this issue!"];
    [v30 setThreadIdentifier:@"com.apple.donotdisturbd"];
    [v30 setInterruptionLevel:1];
    uint64_t v31 = [v24 URL];
    [v30 setDefaultActionURL:v31];

    os_log_t v32 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:36000.0];
    [v30 setExpirationDate:v32];

    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x2050000000;
    uint64_t v33 = (void *)getUNNotificationIconClass_softClass;
    uint64_t v53 = getUNNotificationIconClass_softClass;
    if (!getUNNotificationIconClass_softClass)
    {
      uint64_t v45 = MEMORY[0x1E4F143A8];
      uint64_t v46 = 3221225472;
      id v47 = __getUNNotificationIconClass_block_invoke;
      os_log_t v48 = &unk_1E69755C8;
      v49 = &v50;
      __getUNNotificationIconClass_block_invoke((uint64_t)&v45);
      uint64_t v33 = (void *)v51[3];
    }
    id v34 = v33;
    _Block_object_dispose(&v50, 8);
    v35 = [v34 iconForApplicationIdentifier:@"com.apple.TapToRadar"];
    [v30 setIcon:v35];

    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x2050000000;
    os_log_t v36 = (void *)getUNNotificationRequestClass_softClass;
    uint64_t v53 = getUNNotificationRequestClass_softClass;
    if (!getUNNotificationRequestClass_softClass)
    {
      uint64_t v45 = MEMORY[0x1E4F143A8];
      uint64_t v46 = 3221225472;
      id v47 = __getUNNotificationRequestClass_block_invoke;
      os_log_t v48 = &unk_1E69755C8;
      v49 = &v50;
      __getUNNotificationRequestClass_block_invoke((uint64_t)&v45);
      os_log_t v36 = (void *)v51[3];
    }
    id v37 = v36;
    _Block_object_dispose(&v50, 8);
    os_log_t v38 = [v37 requestWithIdentifier:@"com.apple.donotdisturbd.blah" content:v30 trigger:0];
    [v27 addNotificationRequest:v38 withCompletionHandler:&__block_literal_global_38];
  }
}

void sub_1D30FB920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void __getUNUserNotificationCenterClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UNUserNotificationCenter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUNUserNotificationCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUNUserNotificationCenterClass_block_invoke_cold_1();
    UserNotificationsLibrary();
  }
}

void UserNotificationsLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!UserNotificationsLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __UserNotificationsLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E69755E8;
    uint64_t v3 = 0;
    UserNotificationsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!UserNotificationsLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __UserNotificationsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserNotificationsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getUNMutableNotificationContentClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  Class result = objc_getClass("UNMutableNotificationContent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUNMutableNotificationContentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUNMutableNotificationContentClass_block_invoke_cold_1();
    return (Class)__getUNNotificationIconClass_block_invoke(v3);
  }
  return result;
}

Class __getUNNotificationIconClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  Class result = objc_getClass("UNNotificationIcon");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUNNotificationIconClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUNNotificationIconClass_block_invoke_cold_1();
    return (Class)__getUNNotificationRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getUNNotificationRequestClass_block_invoke(uint64_t a1)
{
  UserNotificationsLibrary();
  Class result = objc_getClass("UNNotificationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUNNotificationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUNNotificationRequestClass_block_invoke_cold_1();
    return (Class)DNDSGetLifetimePhase(v3);
  }
  return result;
}

uint64_t DNDSGetLifetimePhase(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if ([v5 compare:a2] == -1)
  {
    uint64_t v7 = 0;
  }
  else if ([v5 compare:v6] == -1)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 2;
  }

  return v7;
}

void sub_1D30FC5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DNDHandleSignificantTimeChange(uint64_t a1, void *a2)
{
  return [a2 _handleSignificantTimeChange];
}

void DNDSHandleLostModeStateChange(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v2 = (void *)MEMORY[0x1E4F61A48];
  id v3 = a2;
  uint64_t v4 = [v2 sharedInstance];
  unsigned int v5 = [v4 lostModeIsActive];

  uint64_t v6 = v5;
  uint64_t v7 = (void *)DNDSLogSystemState;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemState, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = DNDSStringFromLostModeState(v6);
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Received new lost mode state: state=%@", (uint8_t *)&v10, 0xCu);
  }
  [v3 _setLostModeState:v6 error:0];
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_1D3104F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DNDSRunServer()
{
  if (DNDSRunServer_onceToken != -1) {
    dispatch_once(&DNDSRunServer_onceToken, &__block_literal_global_42);
  }
  return 0;
}

void __DNDSRunServer_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1D9430630]();
  DNDSRegisterLogging();
  DNDSRegisterSysdiagnose();
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v1 = dispatch_source_create(MEMORY[0x1E4F14480], 0xFuLL, 0, 0);
  long long v2 = (void *)_block_invoke_sigterm_source;
  _block_invoke_sigterm_source = (uint64_t)v1;

  dispatch_source_set_event_handler((dispatch_source_t)_block_invoke_sigterm_source, &__block_literal_global_2);
  dispatch_activate((dispatch_object_t)_block_invoke_sigterm_source);
  DNDSMigrateLegacySettings();
  id v3 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Starting up...", v6, 2u);
  }
  uint64_t v4 = objc_alloc_init(DNDSServer);
  unsigned int v5 = (void *)server;
  server = (uint64_t)v4;

  [(id)server resume];
}

uint64_t __DNDSRunServer_block_invoke_2()
{
  uint64_t v0 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v2 = 0;
    _os_log_impl(&dword_1D3052000, v0, OS_LOG_TYPE_DEFAULT, "Received SIGTERM", v2, 2u);
  }
  return xpc_transaction_exit_clean();
}

uint64_t sub_1D31090A8()
{
  uint64_t v0 = sub_1D3118188();
  __swift_allocate_value_buffer(v0, qword_1EBD693E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBD693E0);
  return sub_1D3118178();
}

uint64_t sub_1D310912C()
{
  if (qword_1EBD69258 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1D3118188();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EBD693E0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1D31091C8@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBD69258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1D3118188();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBD693E0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

DNDSPlatformEligibility __swiftcall DNDSPlatformEligibility.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (DNDSPlatformEligibility)objc_msgSend(v0, sel_init);
}

id DNDSPlatformEligibility.init()()
{
  v1.super_class = (Class)DNDSPlatformEligibility;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_1D3109338(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1D310940C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1D310A140((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1D310A140((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1D310940C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1D3118268();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1D31095C8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1D3118288();
  if (!v8)
  {
    sub_1D3118298();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1D31182A8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1D31095C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1D3109660(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1D3109840(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1D3109840(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1D3109660(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
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
      unint64_t v3 = sub_1D31097D8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1D3118278();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1D3118298();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1D31181B8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1D31182A8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1D3118298();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1D31097D8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A40B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1D3109840(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A40B8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1D31182A8();
  __break(1u);
  return result;
}

uint64_t sub_1D3109990()
{
  if (MEMORY[0x1E4F63D48]) {
    BOOL v2 = MEMORY[0x1E4F63D58] == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || MEMORY[0x1E4F63D50] == 0) {
    return 0;
  }
  v49[11] = v0;
  v49[12] = v1;
  uint64_t v4 = sub_1D3118158();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  int64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1D3118128();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  size_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3118118();
  sub_1D3118148();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = sub_1D3118108();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3118138();
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
  if (MEMORY[0x1E4F63C50] && v16 == *MEMORY[0x1E4F63C50])
  {
    uint64_t v46 = &v40;
    id v47 = (char *)&v40;
    (*(void (**)(char *, uint64_t))(v13 + 96))(v15, v12);
    uint64_t v17 = sub_1D31180F8();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(void *)(v18 + 64);
    MEMORY[0x1F4188790]();
    unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
    __int16 v21 = (char *)&v40 - v20;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))((char *)&v40 - v20, v15, v17);
    if (qword_1EBD69258 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1D3118188();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EBD693E0);
    uint64_t v45 = &v40;
    MEMORY[0x1F4188790]();
    id v23 = (char *)&v40 - v20;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v23, v21, v17);
    id v24 = sub_1D3118168();
    os_log_type_t v25 = sub_1D3118238();
    id v44 = v21;
    os_log_type_t v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      v49[0] = v42;
      double v43 = &v40;
      *(_DWORD *)v27 = 136315138;
      os_log_t v40 = v27 + 4;
      v41 = v27;
      sub_1D310A0A4();
      uint64_t v28 = sub_1D31182B8();
      uint64_t v48 = sub_1D3109338(v28, v29, v49);
      sub_1D3118258();
      swift_bridgeObjectRelease();
      id v30 = *(void (**)(char *, uint64_t))(v18 + 8);
      v30(v23, v17);
      uint64_t v31 = v41;
      _os_log_impl(&dword_1D3052000, v24, v26, "Generative models unavailable. Info: %s", v41, 0xCu);
      uint64_t v32 = v42;
      swift_arrayDestroy();
      MEMORY[0x1D9430C80](v32, -1, -1);
      MEMORY[0x1D9430C80](v31, -1, -1);

      v30(v44, v17);
    }
    else
    {

      v39 = *(void (**)(char *, uint64_t))(v18 + 8);
      v39(v23, v17);
      v39(v44, v17);
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    if (MEMORY[0x1E4F63D30] && v16 == *MEMORY[0x1E4F63D30])
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return 1;
    }
    if (qword_1EBD69258 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1D3118188();
    __swift_project_value_buffer(v34, (uint64_t)qword_1EBD693E0);
    v35 = sub_1D3118168();
    os_log_type_t v36 = sub_1D3118228();
    if (os_log_type_enabled(v35, v36))
    {
      id v37 = (uint8_t *)swift_slowAlloc();
      id v47 = v7;
      os_log_t v38 = v37;
      *(_WORD *)id v37 = 0;
      _os_log_impl(&dword_1D3052000, v35, v36, "Received unknown generative models availability state", v37, 2u);
      int64_t v7 = v47;
      MEMORY[0x1D9430C80](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  return 0;
}

unint64_t type metadata accessor for DNDSPlatformEligibility()
{
  unint64_t result = qword_1EA6A4228[0];
  if (!qword_1EA6A4228[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_1EA6A4228);
  }
  return result;
}

unint64_t sub_1D310A0A4()
{
  unint64_t result = qword_1EBD69058;
  if (!qword_1EBD69058)
  {
    sub_1D31180F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBD69058);
  }
  return result;
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

uint64_t sub_1D310A140(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t DNDFMDevice.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DNDFMDevice.deviceName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_deviceName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DNDFMDevice.isThisDevice.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_isThisDevice);
}

id sub_1D310A340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  size_t v11 = objc_allocWithZone(v5);
  uint64_t v12 = &v11[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_identifier];
  *uint64_t v12 = a1;
  v12[1] = a2;
  uint64_t v13 = &v11[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_deviceName];
  *uint64_t v13 = a3;
  v13[1] = a4;
  v11[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_isThisDevice] = a5;
  v15.receiver = v11;
  v15.super_class = v5;
  return objc_msgSendSuper2(&v15, sel_init);
}

id sub_1D310A3D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = &v5[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_identifier];
  *uint64_t v12 = a1;
  v12[1] = a2;
  uint64_t v13 = &v5[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_deviceName];
  *uint64_t v13 = a3;
  v13[1] = a4;
  v5[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_isThisDevice] = a5;
  v15.receiver = v5;
  v15.super_class = ObjectType;
  return objc_msgSendSuper2(&v15, sel_init);
}

id sub_1D310A460(uint64_t a1)
{
  BOOL v2 = v1;
  uint64_t v4 = objc_allocWithZone(v2);
  uint64_t v5 = sub_1D3118098();
  uint64_t v6 = (uint64_t *)&v4[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_identifier];
  *uint64_t v6 = v5;
  v6[1] = v7;
  uint64_t v8 = sub_1D3118088();
  uint64_t v9 = (uint64_t *)&v4[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_deviceName];
  *uint64_t v9 = v8;
  v9[1] = v10;
  v4[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_isThisDevice] = sub_1D3118078() & 1;

  v14.receiver = v4;
  v14.super_class = v2;
  id v11 = objc_msgSendSuper2(&v14, sel_init);
  uint64_t v12 = sub_1D31180A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  return v11;
}

id sub_1D310A538(uint64_t a1)
{
  BOOL v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = v2;
  uint64_t v6 = sub_1D3118098();
  uint64_t v7 = (uint64_t *)&v5[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_identifier];
  *uint64_t v7 = v6;
  v7[1] = v8;
  uint64_t v9 = sub_1D3118088();
  uint64_t v10 = (uint64_t *)&v5[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_deviceName];
  uint64_t *v10 = v9;
  v10[1] = v11;
  v5[OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_isThisDevice] = sub_1D3118078() & 1;

  v15.receiver = v5;
  v15.super_class = ObjectType;
  id v12 = objc_msgSendSuper2(&v15, sel_init);
  uint64_t v13 = sub_1D31180A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
  return v12;
}

id DNDFMDevice.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void DNDFMDevice.init()()
{
}

id DNDFMDevice.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DNDFMDevice()
{
  return self;
}

uint64_t method lookup function for DNDFMDevice(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DNDFMDevice);
}

void *sub_1D310A770()
{
  return &unk_1E6975A00;
}

unint64_t sub_1D310A77C()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_1D310A798()
{
  uint64_t v0 = sub_1D3118188();
  __swift_allocate_value_buffer(v0, qword_1EBD693F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBD693F8);
  return sub_1D3118178();
}

uint64_t sub_1D310A81C()
{
  return sub_1D310B084(&qword_1EBD69270, (uint64_t)qword_1EBD693F8);
}

uint64_t sub_1D310A840@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBD69270 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1D3118188();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBD693F8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_1D310A8E8()
{
  return 1;
}

uint64_t sub_1D310A8F0()
{
  return sub_1D3118318();
}

uint64_t sub_1D310A918()
{
  return sub_1D3118328();
}

uint64_t sub_1D310A95C()
{
  return sub_1D3118328();
}

uint64_t sub_1D310A9AC()
{
  return 0;
}

uint64_t sub_1D310AA94()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_meDeviceUpdateCallback);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_1D310AAF0(*v1);
  return v2;
}

uint64_t sub_1D310AAF0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_1D310AB00(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1D310AC10(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_meDeviceUpdateCallback);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  return sub_1D310AC70(v6);
}

uint64_t sub_1D310AC70(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1D310AC80@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x78))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    uint64_t v7 = sub_1D310F5C4;
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t sub_1D310AD20(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1D310F58C;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t (*)(uint64_t), uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x80);
  sub_1D310AAF0(v3);
  return v7(v6, v5);
}

uint64_t (*sub_1D310ADE8())()
{
  return j__swift_endAccess;
}

uint64_t sub_1D310AE48()
{
  uint64_t v0 = sub_1D3118028();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3118038();
  MEMORY[0x1F4188790]();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F61AA0], v0);
  sub_1D3118048();
  sub_1D31180D8();
  swift_allocObject();
  return sub_1D31180E8();
}

uint64_t sub_1D310AF7C()
{
  return 0;
}

uint64_t sub_1D310AF84()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1D310AF90()
{
  return 0;
}

uint64_t sub_1D310AF98()
{
  uint64_t v0 = sub_1D3118188();
  __swift_allocate_value_buffer(v0, qword_1EBD69410);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EBD69410);
  if (qword_1EBD69270 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EBD693F8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_1D310B060()
{
  return sub_1D310B084(&qword_1EBD69268, (uint64_t)qword_1EBD69410);
}

uint64_t sub_1D310B084(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D3118188();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1D310B0D8@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBD69268 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1D3118188();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBD69410);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_1D310B180()
{
  v1[2] = v0;
  v1[3] = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690B0);
  v1[4] = swift_task_alloc();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690D0);
  v1[5] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  void v1[6] = v3;
  v1[7] = *(void *)(v3 + 64);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D310B298, 0, 0);
}

uint64_t sub_1D310B298()
{
  v0[10] = *(void *)(v0[2] + OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_session);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[11] = v1;
  void *v1 = v0;
  v1[1] = sub_1D310B350;
  uint64_t v2 = v0[9];
  return MEMORY[0x1F41194D0](v2);
}

uint64_t sub_1D310B350()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1D310B688;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1D310B46C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D310B46C()
{
  uint64_t v1 = (char *)v0[2];
  uint64_t v18 = OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_preferenceChangesTask;
  uint64_t v2 = v1;
  if (*(void *)&v1[OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_preferenceChangesTask])
  {
    swift_retain();
    sub_1D3118218();
    swift_release();
    uint64_t v2 = (void *)v0[2];
  }
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v6 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[5];
  uint64_t v16 = v4;
  uint64_t v17 = v0[3];
  uint64_t v9 = sub_1D31181E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v3, v4, v8);
  unint64_t v10 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v11 = (v5 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))(v12 + v10, v3, v8);
  *(void *)(v12 + v11) = v2;
  *(void *)(v12 + ((v11 + 15) & 0xFFFFFFFFFFFFFFF8)) = v17;
  id v13 = v2;
  *(void *)&v1[v18] = sub_1D310C490(v7, (uint64_t)&unk_1EA6A4100, v12);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v16, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  objc_super v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_1D310B688()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D310B714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = sub_1D31180A8();
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  v5[7] = swift_task_alloc();
  v5[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690C0);
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  uint64_t v7 = sub_1D3118068();
  v5[13] = v7;
  v5[14] = *(void *)(v7 - 8);
  v5[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690B8);
  v5[16] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690C8);
  v5[17] = v8;
  v5[18] = *(void *)(v8 - 8);
  v5[19] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D310B92C, 0, 0);
}

uint64_t sub_1D310B92C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690D0);
  sub_1D31181F8();
  int v1 = *MEMORY[0x1E4F61B00];
  *(_DWORD *)(v0 + 168) = *MEMORY[0x1E4F61B18];
  *(_DWORD *)(v0 + 172) = v1;
  int v2 = *MEMORY[0x1E4F61B08];
  *(_DWORD *)(v0 + 176) = *MEMORY[0x1E4F61B10];
  *(_DWORD *)(v0 + 180) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v3;
  void *v3 = v0;
  v3[1] = sub_1D310BA24;
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 136);
  return MEMORY[0x1F4187D58](v4, 0, 0, v5);
}

uint64_t sub_1D310BA24()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D310BB20, 0, 0);
}

uint64_t sub_1D310BB20()
{
  uint64_t v62 = v0;
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 144) + 8))(*(void *)(v0 + 152), *(void *)(v0 + 136));
    if (qword_1EBD69268 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1D3118188();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EBD69410);
    uint64_t v5 = sub_1D3118168();
    os_log_type_t v6 = sub_1D3118248();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D3052000, v5, v6, "Successfully startMonitoringPreferencesChange", v7, 2u);
      MEMORY[0x1D9430C80](v7, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  else
  {
    int v10 = *(_DWORD *)(v0 + 168);
    uint64_t v11 = *(void *)(v0 + 120);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v11, v1, v2);
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v11, v2);
    if (v12 == v10)
    {
      uint64_t v13 = *(void *)(v0 + 120);
      uint64_t v14 = *(void *)(v0 + 96);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 112) + 96))(v13, *(void *)(v0 + 104));
      sub_1D310F6A8(v13, v14);
      if (qword_1EBD69268 != -1) {
        swift_once();
      }
      uint64_t v15 = *(void *)(v0 + 88);
      uint64_t v16 = *(void *)(v0 + 96);
      uint64_t v17 = sub_1D3118188();
      __swift_project_value_buffer(v17, (uint64_t)qword_1EBD69410);
      sub_1D310F710(v16, v15);
      uint64_t v18 = sub_1D3118168();
      os_log_type_t v19 = sub_1D3118248();
      BOOL v20 = os_log_type_enabled(v18, v19);
      uint64_t v21 = *(void *)(v0 + 88);
      if (v20)
      {
        uint64_t v22 = *(void *)(v0 + 80);
        uint64_t v23 = swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        uint64_t v61 = v24;
        *(_DWORD *)uint64_t v23 = 136315138;
        sub_1D310F710(v21, v22);
        uint64_t v25 = sub_1D31181A8();
        *(void *)(v23 + 4) = sub_1D3109338(v25, v26, &v61);
        swift_bridgeObjectRelease();
        sub_1D310F778(v21, &qword_1EBD690C0);
        _os_log_impl(&dword_1D3052000, v18, v19, "Preferences stream receive meDevice updated: %s", (uint8_t *)v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D9430C80](v24, -1, -1);
        MEMORY[0x1D9430C80](v23, -1, -1);
      }
      else
      {
        sub_1D310F778(*(void *)(v0 + 88), &qword_1EBD690C0);
      }

      uint64_t v33 = *(void *)(v0 + 72);
      uint64_t v34 = *(void *)(v0 + 32);
      uint64_t v35 = *(void *)(v0 + 40);
      sub_1D310F710(*(void *)(v0 + 96), v33);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34) == 1)
      {
        os_log_type_t v36 = *(void **)(v0 + 24);
        uint64_t v37 = sub_1D310F778(*(void *)(v0 + 72), &qword_1EBD690C0);
        os_log_t v38 = (void (*)(void))(*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v36) + 0x78))(v37);
        if (v38)
        {
          uint64_t v39 = (uint64_t)v38;
          v38(0);
          sub_1D310AC70(v39);
        }
        uint64_t v40 = *(void *)(v0 + 96);
      }
      else
      {
        uint64_t v48 = *(void **)(v0 + 24);
        uint64_t v49 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 40) + 32))(*(void *)(v0 + 56), *(void *)(v0 + 72), *(void *)(v0 + 32));
        uint64_t v50 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v48) + 0x78))(v49);
        if (v50)
        {
          uint64_t v51 = (void (*)(void))v50;
          uint64_t v53 = *(void *)(v0 + 48);
          uint64_t v52 = *(void *)(v0 + 56);
          uint64_t v54 = *(void *)(v0 + 32);
          uint64_t v55 = *(void *)(v0 + 40);
          type metadata accessor for DNDFMDevice();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v53, v52, v54);
          id v56 = sub_1D310A460(v53);
          v51();

          sub_1D310AC70((uint64_t)v51);
        }
        uint64_t v57 = *(void *)(v0 + 96);
        (*(void (**)(void, void))(*(void *)(v0 + 40) + 8))(*(void *)(v0 + 56), *(void *)(v0 + 32));
        uint64_t v40 = v57;
      }
      sub_1D310F778(v40, &qword_1EBD690C0);
    }
    else if (v12 == *(_DWORD *)(v0 + 172) || v12 == *(_DWORD *)(v0 + 176) || v12 == *(_DWORD *)(v0 + 180))
    {
      if (qword_1EBD69268 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_1D3118188();
      __swift_project_value_buffer(v29, (uint64_t)qword_1EBD69410);
      id v30 = sub_1D3118168();
      os_log_type_t v31 = sub_1D3118248();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl(&dword_1D3052000, v30, v31, "Preferences stream, update received but meDevice did not change", v32, 2u);
        MEMORY[0x1D9430C80](v32, -1, -1);
      }
    }
    else
    {
      if (qword_1EBD69268 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_1D3118188();
      __swift_project_value_buffer(v41, (uint64_t)qword_1EBD69410);
      uint64_t v42 = sub_1D3118168();
      os_log_type_t v43 = sub_1D3118238();
      if (os_log_type_enabled(v42, v43))
      {
        id v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v44 = 0;
        _os_log_impl(&dword_1D3052000, v42, v43, "Unknown update type, meDevice did not change", v44, 2u);
        MEMORY[0x1D9430C80](v44, -1, -1);
      }
      uint64_t v46 = *(void *)(v0 + 112);
      uint64_t v45 = *(void *)(v0 + 120);
      uint64_t v47 = *(void *)(v0 + 104);

      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    }
    os_log_t v58 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v58;
    void *v58 = v0;
    v58[1] = sub_1D310BA24;
    uint64_t v59 = *(void *)(v0 + 128);
    uint64_t v60 = *(void *)(v0 + 136);
    return MEMORY[0x1F4187D58](v59, 0, 0, v60);
  }
}

uint64_t sub_1D310C29C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690D0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_1D310C390()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690D0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unint64_t v6 = v1;
  v6[1] = sub_1D310F7EC;
  return sub_1D310B714((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_1D310C490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D31181E8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D31181D8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1D310F778(a1, &qword_1EBD690B0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D31181C8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D310C7A4(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_1D310F7E8;
  return sub_1D310B180();
}

uint64_t sub_1D310C84C()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x1F4188298](sub_1D310C86C, 0, 0);
}

uint64_t sub_1D310C86C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_preferenceChangesTask;
  if (*(void *)(v1 + OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_preferenceChangesTask))
  {
    swift_retain();
    sub_1D3118218();
    swift_release();
  }
  *(void *)(v1 + v2) = 0;
  swift_release();
  if (qword_1EBD69268 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D3118188();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBD69410);
  uint64_t v4 = sub_1D3118168();
  os_log_type_t v5 = sub_1D3118248();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D3052000, v4, v5, "FindMyLocateSession: Successfully stopMonitoringPreferencesChange", v6, 2u);
    MEMORY[0x1D9430C80](v6, -1, -1);
  }

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1D310CB44(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  os_log_type_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_1D310CC04;
  v5[2] = v4;
  return MEMORY[0x1F4188298](sub_1D310C86C, 0, 0);
}

uint64_t sub_1D310CC04()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  os_log_type_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_1D3118018();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_1D310CD88()
{
  void v1[6] = v0;
  uint64_t v2 = sub_1D3118058();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  uint64_t v3 = sub_1D31180A8();
  v1[10] = v3;
  v1[11] = *(void *)(v3 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D310CED8, 0, 0);
}

uint64_t sub_1D310CED8()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_session;
  v0[17] = OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_session;
  v0[18] = *(void *)(v1 + v2);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[19] = v3;
  void *v3 = v0;
  v3[1] = sub_1D310CF98;
  uint64_t v4 = v0[16];
  return MEMORY[0x1F41194B0](v4, 1);
}

uint64_t sub_1D310CF98()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1D310D384;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1D310D0B4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D310D0B4()
{
  uint64_t v25 = v0;
  if (qword_1EBD69268 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[11];
  uint64_t v5 = sub_1D3118188();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBD69410);
  uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v23(v1, v2, v3);
  uint64_t v6 = sub_1D3118168();
  os_log_type_t v7 = sub_1D3118248();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[15];
  uint64_t v10 = v0[10];
  uint64_t v11 = v0[11];
  if (v8)
  {
    int v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v24 = v22;
    *(_DWORD *)int v12 = 136315138;
    sub_1D310E838();
    uint64_t v13 = sub_1D31182B8();
    v0[5] = sub_1D3109338(v13, v14, &v24);
    sub_1D3118258();
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v9, v10);
    _os_log_impl(&dword_1D3052000, v6, v7, "Successfully got active location sharing device: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9430C80](v22, -1, -1);
    MEMORY[0x1D9430C80](v12, -1, -1);
  }
  else
  {
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v0[15], v0[10]);
  }

  uint64_t v16 = v0[16];
  uint64_t v17 = v0[14];
  uint64_t v18 = v0[10];
  type metadata accessor for DNDFMDevice();
  v23(v17, v16, v18);
  id v19 = sub_1D310A460(v17);
  v15(v16, v18);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v20 = (uint64_t (*)(id))v0[1];
  return v20(v19);
}

uint64_t sub_1D310D384()
{
  uint64_t v1 = *(void **)(v0 + 160);
  swift_release();
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD69100);
  if (swift_dynamicCast())
  {
    if ((*(unsigned int (**)(void, void))(*(void *)(v0 + 64) + 88))(*(void *)(v0 + 72), *(void *)(v0 + 56)) == *MEMORY[0x1E4F61AA8])
    {

      if (qword_1EBD69268 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_1D3118188();
      *(void *)(v0 + 168) = __swift_project_value_buffer(v3, (uint64_t)qword_1EBD69410);
      uint64_t v4 = sub_1D3118168();
      os_log_type_t v5 = sub_1D3118248();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1D3052000, v4, v5, "Error getting cached location sharing device, trying not cached.", v6, 2u);
        MEMORY[0x1D9430C80](v6, -1, -1);
      }
      uint64_t v7 = *(void *)(v0 + 136);
      uint64_t v8 = *(void *)(v0 + 48);

      *(void *)(v0 + 176) = *(void *)(v8 + v7);
      swift_retain();
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 184) = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_1D310D794;
      uint64_t v10 = *(void *)(v0 + 104);
      return MEMORY[0x1F41194B0](v10, 0);
    }
    (*(void (**)(void, void))(*(void *)(v0 + 64) + 8))(*(void *)(v0 + 72), *(void *)(v0 + 56));
  }

  if (qword_1EBD69268 != -1) {
    swift_once();
  }
  uint64_t v11 = *(void **)(v0 + 160);
  uint64_t v12 = sub_1D3118188();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EBD69410);
  id v13 = v11;
  unint64_t v14 = sub_1D3118168();
  os_log_type_t v15 = sub_1D3118238();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v17 = *(void **)(v0 + 160);
  if (v16)
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    id v19 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138543362;
    uint64_t v20 = sub_1D3118018();
    *(void *)(v0 + 24) = v20;
    sub_1D3118258();
    void *v19 = v20;

    _os_log_impl(&dword_1D3052000, v14, v15, "Error getting active location sharing device: %{public}@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA6A4118);
    swift_arrayDestroy();
    MEMORY[0x1D9430C80](v19, -1, -1);
    MEMORY[0x1D9430C80](v18, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_1D310D794()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_1D310DB30;
  }
  else
  {
    swift_release();
    id v2 = sub_1D310D8B0;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D310D8B0()
{
  uint64_t v20 = v0;
  uint64_t v1 = *(void (**)(void, void, void))(*(void *)(v0 + 88) + 16);
  v1(*(void *)(v0 + 96), *(void *)(v0 + 104), *(void *)(v0 + 80));
  id v2 = sub_1D3118168();
  os_log_type_t v3 = sub_1D3118248();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v18 = v1;
    uint64_t v5 = *(void *)(v0 + 88);
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v16 = *(void *)(v0 + 80);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v6 = 136315138;
    sub_1D310E838();
    uint64_t v7 = sub_1D31182B8();
    *(void *)(v0 + 32) = sub_1D3109338(v7, v8, &v19);
    sub_1D3118258();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v9(v4, v16);
    uint64_t v1 = v18;
    _os_log_impl(&dword_1D3052000, v2, v3, "Successfully got non-cached active location sharing device: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9430C80](v17, -1, -1);
    MEMORY[0x1D9430C80](v6, -1, -1);
  }
  else
  {
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 88) + 8);
    v9(*(void *)(v0 + 96), *(void *)(v0 + 80));
  }

  uint64_t v10 = *(void *)(v0 + 104);
  uint64_t v11 = *(void *)(v0 + 112);
  uint64_t v12 = *(void *)(v0 + 80);
  type metadata accessor for DNDFMDevice();
  v1(v11, v10, v12);
  id v13 = sub_1D310A460(v11);
  v9(v10, v12);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v14 = *(uint64_t (**)(id))(v0 + 8);
  return v14(v13);
}

uint64_t sub_1D310DB30()
{
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D310DD50(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_1D310DDF8;
  return sub_1D310CD88();
}

uint64_t sub_1D310DDF8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  unint64_t v8 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v9 = (void *)sub_1D3118018();

    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
    _Block_release(v8);
  }
  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0);
    _Block_release(v8);
  }
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

id FindMyLocateSession.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id FindMyLocateSession.init()()
{
  id v1 = v0;
  uint64_t v2 = sub_1D3118028();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3118038();
  MEMORY[0x1F4188790]();
  uint64_t v6 = &v1[OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_meDeviceUpdateCallback];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_session;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F61AA0], v2);
  unint64_t v8 = v1;
  sub_1D3118048();
  sub_1D31180D8();
  swift_allocObject();
  *(void *)&v1[v7] = sub_1D31180E8();
  v8[OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_isInitialized] = 0;
  *(void *)&v8[OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_initContinuations] = MEMORY[0x1E4FBC860];
  *(void *)&v8[OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_preferenceChangesTask] = 0;

  Session = (objc_class *)type metadata accessor for FindMyLocateSession();
  v11.receiver = v8;
  v11.super_class = Session;
  return objc_msgSendSuper2(&v11, sel_init);
}

id FindMyLocateSession.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FindMyLocateSession();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D310E244(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1D310E320;
  return v6(a1);
}

uint64_t sub_1D310E320()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1D310E418(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_1D310F7EC;
  return v6();
}

uint64_t sub_1D310E4E4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1D310F7EC;
  return v7();
}

uint64_t sub_1D310E5B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D31181E8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D31181D8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1D310F778(a1, &qword_1EBD690B0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D31181C8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D310E75C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1D310F7FC;
  return v6(a1);
}

unint64_t sub_1D310E838()
{
  unint64_t result = qword_1EA6A4120;
  if (!qword_1EA6A4120)
  {
    sub_1D31180A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6A4120);
  }
  return result;
}

uint64_t type metadata accessor for FindMyLocateSession()
{
  return self;
}

unint64_t sub_1D310E8B8()
{
  unint64_t result = qword_1EA6A4138;
  if (!qword_1EA6A4138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA6A4138);
  }
  return result;
}

ValueMetadata *type metadata accessor for FindMyLogger()
{
  return &type metadata for FindMyLogger;
}

uint64_t getEnumTagSinglePayload for FMLSessionError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for FMLSessionError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1D310EA10);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMLSessionError()
{
  return &type metadata for FMLSessionError;
}

uint64_t method lookup function for FindMyLocateSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FindMyLocateSession);
}

uint64_t dispatch thunk of FindMyLocateSession.meDeviceUpdateCallback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of FindMyLocateSession.meDeviceUpdateCallback.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FindMyLocateSession.meDeviceUpdateCallback.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of FindMyLocateSession.startMonitoringPreferencesChanges()()
{
  int v2 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1D310F7EC;
  return v5();
}

uint64_t dispatch thunk of FindMyLocateSession.stopMonitoringPreferenceChanges()()
{
  int v2 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1D310ED08;
  return v5();
}

uint64_t sub_1D310ED08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of FindMyLocateSession.getActiveLocationSharingDevice()()
{
  int v2 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1D310EF08;
  return v5();
}

uint64_t sub_1D310EF08(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1D310F008()
{
  int v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_1D310ED08;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1EA6A4158 + dword_1EA6A4158);
  return v5(v2, v3);
}

uint64_t sub_1D310F0B8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_1D310F7EC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EA6A4168 + dword_1EA6A4168);
  return v6(v2, v3, v4);
}

uint64_t sub_1D310F17C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1D310F7EC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EA6A4178 + dword_1EA6A4178);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1D310F248()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D310F280(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1D310F7EC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA6A4188 + dword_1EA6A4188);
  return v6(a1, v4);
}

uint64_t sub_1D310F33C()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_1D310F7EC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1EA6A4198 + dword_1EA6A4198);
  return v5(v2, v3);
}

uint64_t objectdestroy_28Tm()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D310F434()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_1D310F7EC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1EA6A41B8 + dword_1EA6A41B8);
  return v5(v2, v3);
}

uint64_t objectdestroy_32Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1D310F528()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D310F560()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
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

uint64_t sub_1D310F58C(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_1D310F5C4(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1D310F5F0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1D310F7EC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA6A41D8 + dword_1EA6A41D8);
  return v6(a1, v4);
}

uint64_t sub_1D310F6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D310F710(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D310F778(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1D310F7D4()
{
}

void DNDSMigrateLegacySettings_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D3052000, a2, a3, "Error writing migrated assertions, will request radar: error=%{public}@", a5, a6, a7, a8, 2u);
}

void DNDSMigrateLegacySettings_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Legacy override status' effective time is in the future. Ignoring...", v1, 2u);
}

void DNDSMigrateLegacySettings_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Error loading legacy settings but there was no error. Will ignore.", v1, 2u);
}

void DNDSMigrateLegacySettings_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D3052000, a2, a3, "Error loading legacy settings, will request radar: error=%{public}@", a5, a6, a7, a8, 2u);
}

void DNDSMigrateLegacySettings_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D3052000, a2, a3, "Error writing migrated settings, will request radar: error=%{public}@", a5, a6, a7, a8, 2u);
}

void DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion_cold_1(uint64_t *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSNumber;
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  uint64_t v6 = [v3 numberWithInteger:v4];
  uint64_t v7 = [NSNumber numberWithInteger:a1[1]];
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  objc_super v11 = v7;
  _os_log_error_impl(&dword_1D3052000, v5, OS_LOG_TYPE_ERROR, "Unexpected macOS version: %@.%@", (uint8_t *)&v8, 0x16u);
}

void __DNDSRegisterSysdiagnoseDataProvider_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Could not capture sysdiagnose from %{public}@ due to unable to make Plist: error=%{public}@", (uint8_t *)&v3, 0x16u);
}

void __DNDSRegisterSysdiagnoseDataProvider_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Could not capture sysdiagnose from %{public}@ due to too much data", (uint8_t *)&v2, 0xCu);
}

uint64_t __getUNUserNotificationCenterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUNMutableNotificationContentClass_block_invoke_cold_1(v0);
}

uint64_t __getUNMutableNotificationContentClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUNNotificationIconClass_block_invoke_cold_1(v0);
}

uint64_t __getUNNotificationIconClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUNNotificationRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getUNNotificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[DNDSServer pairedCloudDevicesForSyncManager:](v0);
}

uint64_t sub_1D3118018()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t sub_1D3118028()
{
  return MEMORY[0x1F4119360]();
}

uint64_t sub_1D3118038()
{
  return MEMORY[0x1F4119368]();
}

uint64_t sub_1D3118048()
{
  return MEMORY[0x1F4119370]();
}

uint64_t sub_1D3118058()
{
  return MEMORY[0x1F4119390]();
}

uint64_t sub_1D3118068()
{
  return MEMORY[0x1F41193C0]();
}

uint64_t sub_1D3118078()
{
  return MEMORY[0x1F41193E8]();
}

uint64_t sub_1D3118088()
{
  return MEMORY[0x1F41193F0]();
}

uint64_t sub_1D3118098()
{
  return MEMORY[0x1F41193F8]();
}

uint64_t sub_1D31180A8()
{
  return MEMORY[0x1F4119400]();
}

uint64_t sub_1D31180D8()
{
  return MEMORY[0x1F41194E8]();
}

uint64_t sub_1D31180E8()
{
  return MEMORY[0x1F41194F0]();
}

uint64_t sub_1D31180F8()
{
  return MEMORY[0x1F411BD00]();
}

uint64_t sub_1D3118108()
{
  return MEMORY[0x1F411BD20]();
}

uint64_t sub_1D3118118()
{
  return MEMORY[0x1F411BD30]();
}

uint64_t sub_1D3118128()
{
  return MEMORY[0x1F411BD50]();
}

uint64_t sub_1D3118138()
{
  return MEMORY[0x1F411BD68]();
}

uint64_t sub_1D3118148()
{
  return MEMORY[0x1F411BD70]();
}

uint64_t sub_1D3118158()
{
  return MEMORY[0x1F411BDA0]();
}

uint64_t sub_1D3118168()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1D3118178()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1D3118188()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1D3118198()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1D31181A8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1D31181B8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1D31181C8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1D31181D8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1D31181E8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1D31181F8()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1D3118218()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1D3118228()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1D3118238()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D3118248()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1D3118258()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D3118268()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1D3118278()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1D3118288()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1D3118298()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1D31182A8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D31182B8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D31182C8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1D31182D8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1D31182E8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1D31182F8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1D3118308()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D3118318()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D3118328()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BSCurrentUserDirectory()
{
  return MEMORY[0x1F410C1E8]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x1F410C290]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1F410C2B8]();
}

uint64_t BSExecutablePathForPID()
{
  return MEMORY[0x1F410C308]();
}

uint64_t BSPIDForAuditToken()
{
  return MEMORY[0x1F410C4A8]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1F410C678]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7480](bundleURL);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CKStringFromAccountStatus()
{
  return MEMORY[0x1F40D6490]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t DNDCompatibilityVersionToString()
{
  return MEMORY[0x1F41175A0]();
}

uint64_t DNDEnabledSettingToString()
{
  return MEMORY[0x1F41175A8]();
}

uint64_t DNDEnumerateDaysOfWeekStartingOnDay()
{
  return MEMORY[0x1F41175B0]();
}

uint64_t DNDIntelligentInterruptionBehaviorToString()
{
  return MEMORY[0x1F41175B8]();
}

uint64_t DNDMeDeviceStatusToString()
{
  return MEMORY[0x1F41175C0]();
}

uint64_t DNDModeAssertionInvalidationReasonOverrideToString()
{
  return MEMORY[0x1F41175C8]();
}

uint64_t DNDModeAssertionInvalidationReasonToString()
{
  return MEMORY[0x1F41175D0]();
}

uint64_t DNDMostRestrictiveInterruptionSuppression()
{
  return MEMORY[0x1F41175E8]();
}

uint64_t DNDOperatingSystemVersionCompare()
{
  return MEMORY[0x1F41175F0]();
}

uint64_t DNDOperatingSystemVersionFromString()
{
  return MEMORY[0x1F41175F8]();
}

uint64_t DNDPlatformForCurrentDevice()
{
  return MEMORY[0x1F4117600]();
}

uint64_t DNDRegisterLogging()
{
  return MEMORY[0x1F4117608]();
}

uint64_t DNDRemoteAppConfigurationServiceServerInterface()
{
  return MEMORY[0x1F4117610]();
}

uint64_t DNDRemoteAvailabilityServiceServerInterface()
{
  return MEMORY[0x1F4117618]();
}

uint64_t DNDRemoteMonitorServerInterface()
{
  return MEMORY[0x1F4117620]();
}

uint64_t DNDRemoteServiceServerInterface()
{
  return MEMORY[0x1F4117628]();
}

uint64_t DNDResolutionReasonToString()
{
  return MEMORY[0x1F4117630]();
}

uint64_t DNDResolvedBedtimeBehaviorEnabledSetting()
{
  return MEMORY[0x1F4117638]();
}

uint64_t DNDResolvedImmediateBypassEventSourceType()
{
  return MEMORY[0x1F4117648]();
}

uint64_t DNDResolvedImpactsAvailabilitySetting()
{
  return MEMORY[0x1F4117650]();
}

uint64_t DNDResolvedInterruptionBehaviorSetting()
{
  return MEMORY[0x1F4117658]();
}

uint64_t DNDResolvedModeAssertionInvalidationReason()
{
  return MEMORY[0x1F4117660]();
}

uint64_t DNDResolvedRepeatEventSourceBehaviorEnabledSetting()
{
  return MEMORY[0x1F4117668]();
}

uint64_t DNDResolvedScheduleEnabledSetting()
{
  return MEMORY[0x1F4117670]();
}

uint64_t DNDStateUpdateReasonToString()
{
  return MEMORY[0x1F4117678]();
}

uint64_t DNDStateUpdateSourceToString()
{
  return MEMORY[0x1F4117680]();
}

uint64_t DNDStringFromBreakthroughUrgency()
{
  return MEMORY[0x1F4117688]();
}

uint64_t DNDStringFromClientEventType()
{
  return MEMORY[0x1F4117690]();
}

uint64_t DNDStringFromClientEventUrgency()
{
  return MEMORY[0x1F4117698]();
}

uint64_t DNDStringFromConfigurationType()
{
  return MEMORY[0x1F41176A0]();
}

uint64_t DNDStringFromDeviceCapabilities()
{
  return MEMORY[0x1F41176A8]();
}

uint64_t DNDStringFromDeviceClass()
{
  return MEMORY[0x1F41176B0]();
}

uint64_t DNDStringFromInterruptionBehaviorSetting()
{
  return MEMORY[0x1F41176B8]();
}

uint64_t DNDStringFromInterruptionSuppression()
{
  return MEMORY[0x1F41176C0]();
}

uint64_t DNDStringFromInterruptionSuppressionMode()
{
  return MEMORY[0x1F41176C8]();
}

uint64_t DNDStringFromOperatingSystemVersion()
{
  return MEMORY[0x1F41176D0]();
}

uint64_t DNDSystemColorNameForModeSemanticType()
{
  return MEMORY[0x1F41176D8]();
}

uint64_t DNDSystemColorNamesForModeSemanticType()
{
  return MEMORY[0x1F41176E0]();
}

uint64_t DNDSystemImageNameForModeSemanticType()
{
  return MEMORY[0x1F41176E8]();
}

uint64_t DNDWeekdaysFromDay()
{
  return MEMORY[0x1F41176F0]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1F4122BD0]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x1F4122C08]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x1F412F960]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x1F412F968]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromDNDPlatform()
{
  return MEMORY[0x1F41176F8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x1F415CB60]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x1F415CB70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
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

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
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

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1F40F3858]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1F40F3880]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1F40F39A8]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x1F40CF048]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x1F40CF060]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x1F40CF068]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x1F40CF090]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x1F40CF0A8]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1F40CF250]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1F40CF2F0]();
}