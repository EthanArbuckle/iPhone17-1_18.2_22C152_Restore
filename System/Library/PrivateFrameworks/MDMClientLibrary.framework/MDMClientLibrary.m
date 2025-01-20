void sub_1DD342188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD343628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
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

void sub_1DD343DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1DD343FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD344434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD344B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD345DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __LocalAuthenticationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6CBC980;
    uint64_t v5 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getLAContextClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("LAContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getLAContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1DD34A898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1DD34B460(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD34C130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD34D1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD34D4F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
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

void sub_1DD34DE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD34EF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
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

void sub_1DD34FE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD350218(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DD35057C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DD350B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DD350F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD3512BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _alwaysAllowedQueries()
{
  if (_alwaysAllowedQueries_onceToken != -1) {
    dispatch_once(&_alwaysAllowedQueries_onceToken, &__block_literal_global_9_0);
  }
  v0 = (void *)_alwaysAllowedQueries_set;

  return v0;
}

id _deviceInformationQueries()
{
  if (_deviceInformationQueries_onceToken != -1) {
    dispatch_once(&_deviceInformationQueries_onceToken, &__block_literal_global_12);
  }
  v0 = [MEMORY[0x1E4F5E758] sharedInstance];
  int v1 = [v0 hrnMode];

  if (v1 == 2)
  {
LABEL_6:
    [(id)_deviceInformationQueries_set unionSet:_deviceInformationQueries_hrnSet];
    goto LABEL_8;
  }
  if (v1 != 1)
  {
    if (v1) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  [(id)_deviceInformationQueries_set removeObject:@"AppStoreUserAgent"];
  [(id)_deviceInformationQueries_set removeObject:@"MID"];
  [(id)_deviceInformationQueries_set removeObject:@"VIDSeed"];
LABEL_8:
  uint64_t v2 = (void *)_deviceInformationQueries_set;

  return v2;
}

id _appInstallationQueries()
{
  if (_appInstallationQueries_onceToken != -1) {
    dispatch_once(&_appInstallationQueries_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)_appInstallationQueries_set;

  return v0;
}

id _networkInformationQueries()
{
  if (_networkInformationQueries_onceToken != -1) {
    dispatch_once(&_networkInformationQueries_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)_networkInformationQueries_set;

  return v0;
}

uint64_t ___alwaysAllowedQueries_block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CA80];
  v5[0] = @"UDID";
  v5[1] = @"OrganizationInfo";
  v5[2] = @"MDMOptions";
  v5[3] = @"LastCloudBackupDate";
  int v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)_alwaysAllowedQueries_set;
  _alwaysAllowedQueries_set = v2;

  return [(id)_alwaysAllowedQueries_set addObject:@"AwaitingConfiguration"];
}

void ___deviceInformationQueries_block_invoke()
{
  v21[13] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CA80];
  v21[0] = @"DeviceName";
  v21[1] = @"DevicePropertiesAttestation";
  v21[2] = @"OSVersion";
  v21[3] = @"BuildVersion";
  v21[4] = @"ModelName";
  v21[5] = @"ModelNumber";
  v21[6] = @"ProductName";
  v21[7] = @"Model";
  v21[8] = @"SerialNumber";
  v21[9] = @"IsSupervised";
  v21[10] = @"TimeZone";
  v21[11] = @"SupplementalBuildVersion";
  v21[12] = @"SupplementalOSVersionExtra";
  int v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:13];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)_deviceInformationQueries_set;
  _deviceInformationQueries_set = v2;

  int v4 = [MEMORY[0x1E4F5E7A0] isAppleTV];
  uint64_t v5 = (void *)_deviceInformationQueries_set;
  if (v4)
  {
    [(id)_deviceInformationQueries_set addObject:@"DeviceID"];
  }
  else
  {
    v20[0] = @"DeviceCapacity";
    v20[1] = @"AvailableDeviceCapacity";
    v20[2] = @"BatteryLevel";
    v20[3] = @"IsDeviceLocatorServiceEnabled";
    v20[4] = @"IsDoNotDisturbInEffect";
    v20[5] = @"EASDeviceIdentifier";
    v20[6] = @"IsCloudBackupEnabled";
    v20[7] = @"DiagnosticSubmissionEnabled";
    v20[8] = @"AppAnalyticsEnabled";
    v20[9] = @"SoftwareUpdateDeviceID";
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:10];
    [v5 addObjectsFromArray:v6];

    if (([MEMORY[0x1E4F5E7A0] isVisionDevice] & 1) == 0
      && ([MEMORY[0x1E4F5E7A0] isAppleTV] & 1) == 0)
    {
      v7 = (void *)_deviceInformationQueries_set;
      v19[0] = @"IMEI";
      v19[1] = @"MEID";
      v19[2] = @"ModemFirmwareVersion";
      v19[3] = @"CellularTechnology";
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
      [v7 addObjectsFromArray:v8];
    }
    if (([MEMORY[0x1E4F5E7A0] isVisionDevice] & 1) == 0
      && ([MEMORY[0x1E4F5E7A0] isAppleTV] & 1) == 0)
    {
      [(id)_deviceInformationQueries_set addObject:@"IsMDMLostModeEnabled"];
    }
    [(id)_deviceInformationQueries_set addObject:@"IsMultiUser"];
    if (([MEMORY[0x1E4F5E7A0] isVisionDevice] & 1) == 0
      && ([MEMORY[0x1E4F5E7A0] isAppleTV] & 1) == 0)
    {
      [(id)_deviceInformationQueries_set addObject:@"IsActivationLockEnabled"];
    }
    if (([MEMORY[0x1E4F5E7A0] isVisionDevice] & 1) == 0) {
      [(id)_deviceInformationQueries_set addObject:@"SoftwareUpdateSettings"];
    }
    uint64_t v9 = +[MDMCloudConfiguration sharedConfiguration];
    if ([v9 userMode] == 1)
    {
      int v10 = [MEMORY[0x1E4F5E7A8] isSharediPad];

      if (v10)
      {
        uint64_t v11 = (void *)_deviceInformationQueries_set;
        v18[0] = @"MaximumResidentUsers";
        v18[1] = @"QuotaSize";
        v18[2] = @"ResidentUsers";
        v18[3] = @"EstimatedResidentUsers";
        v18[4] = @"UserSessionTimeout";
        v18[5] = @"TemporarySessionTimeout";
        v18[6] = @"TemporarySessionOnly";
        v18[7] = @"ManagedAppleIDDefaultDomains";
        v18[8] = @"OnlineAuthenticationGracePeriod";
        v18[9] = @"SkipLanguageAndLocaleSetupForNewUsers";
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:10];
        [v11 addObjectsFromArray:v12];
      }
    }
    else
    {
    }
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = @"AppStoreUserAgent";
  v17[1] = @"MID";
  v17[2] = @"VIDSeed";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  uint64_t v15 = [v13 setWithArray:v14];
  v16 = (void *)_deviceInformationQueries_hrnSet;
  _deviceInformationQueries_hrnSet = v15;
}

void ___appInstallationQueries_block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F5E7A0] isVisionDevice])
  {
    _appInstallationQueries_set = [MEMORY[0x1E4F1CAD0] set];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v4[0] = @"iTunesStoreAccountIsActive";
    v4[1] = @"iTunesStoreAccountHash";
    int v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
    uint64_t v2 = [v0 initWithArray:v1];
    uint64_t v3 = (void *)_appInstallationQueries_set;
    _appInstallationQueries_set = v2;
  }
}

void ___networkInformationQueries_block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CA80];
  v7[0] = @"BluetoothMAC";
  v7[1] = @"WiFiMAC";
  int v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)_networkInformationQueries_set;
  _networkInformationQueries_set = v2;

  if (([MEMORY[0x1E4F5E7A0] isVisionDevice] & 1) == 0
    && ([MEMORY[0x1E4F5E7A0] isAppleTV] & 1) == 0)
  {
    int v4 = (void *)_networkInformationQueries_set;
    v6[0] = @"ICCID";
    v6[1] = @"CurrentCarrierNetwork";
    v6[2] = @"SIMCarrierNetwork";
    v6[3] = @"SubscriberCarrierNetwork";
    v6[4] = @"CarrierSettingsVersion";
    v6[5] = @"PhoneNumber";
    v6[6] = @"DataRoamingEnabled";
    v6[7] = @"VoiceRoamingEnabled";
    v6[8] = @"PersonalHotspotEnabled";
    v6[9] = @"SubscriberMCC";
    v6[10] = @"SubscriberMNC";
    v6[11] = @"IsRoaming";
    v6[12] = @"CurrentMCC";
    v6[13] = @"CurrentMNC";
    v6[14] = @"ServiceSubscriptions";
    v6[15] = @"IsNetworkTethered";
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:16];
    [v4 addObjectsFromArray:v5];
  }
}

void ___unavailableAppInstallationQueriesWithDataSeparation_block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"iTunesStoreAccountIsActive";
  v4[1] = @"iTunesStoreAccountHash";
  int v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 initWithArray:v1];
  uint64_t v3 = (void *)_unavailableAppInstallationQueriesWithDataSeparation_set;
  _unavailableAppInstallationQueriesWithDataSeparation_set = v2;
}

void ___alwaysAllowedUserQueries_block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CA80];
  v4[0] = @"PushToken";
  v4[1] = @"AwaitingConfiguration";
  int v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)_alwaysAllowedUserQueries_set;
  _alwaysAllowedUserQueries_set = v2;
}

uint64_t ___validDeviceQueriesWithUserEnrollment_block_invoke()
{
  v5[21] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CA80];
  v5[0] = @"AppAnalyticsEnabled";
  v5[1] = @"AvailableDeviceCapacity";
  v5[2] = @"BatteryLevel";
  v5[3] = @"BuildVersion";
  v5[4] = @"DeviceCapacity";
  void v5[5] = @"DeviceName";
  v5[6] = @"DevicePropertiesAttestation";
  v5[7] = @"DiagnosticSubmissionEnabled";
  v5[8] = @"EASDeviceIdentifier";
  v5[9] = @"IsDeviceLocatorServiceEnabled";
  v5[10] = @"IsNetworkTethered";
  v5[11] = @"IsSupervised";
  v5[12] = @"Model";
  v5[13] = @"ModelName";
  v5[14] = @"ModelNumber";
  v5[15] = @"OSVersion";
  v5[16] = @"OrganizationInfo";
  v5[17] = @"ProductName";
  v5[18] = @"TimeZone";
  v5[19] = @"SupplementalBuildVersion";
  v5[20] = @"SupplementalOSVersionExtra";
  int v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:21];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)_validDeviceQueriesWithUserEnrollment_validMCKeys;
  _validDeviceQueriesWithUserEnrollment_validMCKeys = v2;

  if (([MEMORY[0x1E4F5E7A0] isVisionDevice] & 1) == 0
    && ([MEMORY[0x1E4F5E7A0] isAppleTV] & 1) == 0)
  {
    [(id)_validDeviceQueriesWithUserEnrollment_validMCKeys addObject:@"CellularTechnology"];
  }
  return [(id)_validDeviceQueriesWithUserEnrollment_validMCKeys addObject:@"IsMultiUser"];
}

void sub_1DD354F64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __sortKeysAndMakeCommaSeparatedString_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (([v14 isEqualToString:*MEMORY[0x1E4F5E708]] & 1) != 0
    || [v14 isEqualToString:*MEMORY[0x1E4F5E6E8]])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = v14;
    id v8 = v5;
    uint64_t v9 = NSString;
    id v10 = v8;
    if (coerceIntoString_onceToken != -1) {
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_81);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v10 stringValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [(id)coerceIntoString_dateFormatter stringFromDate:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 base64EncodedStringWithOptions:0];
          }
          else {
          id v11 = [v10 description];
          }
        }
      }
    }
    uint64_t v12 = v11;

    uint64_t v13 = [v9 stringWithFormat:@"%@=\"%@\"", v7, v12];

    [v6 addObject:v13];
  }
}

uint64_t __coerceIntoString_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  int v1 = (void *)coerceIntoString_dateFormatter;
  coerceIntoString_dateFormatter = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)coerceIntoString_dateFormatter setTimeZone:v2];

  uint64_t v3 = (void *)coerceIntoString_dateFormatter;

  return [v3 setFormatOptions:1907];
}

void sub_1DD355C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
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

uint64_t MDMSendManagedBooksChangedNotification()
{
  uint64_t v0 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1DD340000, v0, OS_LOG_TYPE_DEFAULT, "Sending Managed Books changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"MCManagedBooksChanged" UTF8String]);
}

uint64_t MDMSendTriggerRollKeybagsNotification()
{
  uint64_t v0 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1DD340000, v0, OS_LOG_TYPE_DEFAULT, "Sending rolld notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.rolld" UTF8String]);
}

uint64_t MDMSendManagingOrgInfoChangedNotification()
{
  uint64_t v0 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1DD340000, v0, OS_LOG_TYPE_DEFAULT, "Sending MDM settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.managedorginfochanged" UTF8String]);
}

uint64_t MDMSendDevicePostureChangedNotification()
{
  uint64_t v0 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1DD340000, v0, OS_LOG_TYPE_DEFAULT, "Sending device posture changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.devicemanagementclient.devicePostureChanged" UTF8String]);
}

void sub_1DD3580B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1DD359C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDEDASEPOSVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DeviceIdentityLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DeviceIdentityLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __DeviceIdentityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6CBD740;
    uint64_t v5 = 0;
    DeviceIdentityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = DeviceIdentityLibraryCore_frameworkLibrary;
  int v1 = (void *)v3[0];
  if (!DeviceIdentityLibraryCore_frameworkLibrary)
  {
    int v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DeviceIdentityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DeviceIdentityLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDEDAFirmwareVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDEDAOSVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDEDAProductType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDEDASerialNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAOIDEDAUDIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDEDAUDID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDEDAUDIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDEDAAttestationPublicKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAOIDEDANonceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDEDANonce");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDEDANonceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void MDMSharedXPCProtocolInitialize(void *a1)
{
  id v1 = a1;
  allowedDataClasses();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setClasses:v2 forSelector:sel_notifyNewConfigurationWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_scheduleTokenUpdateWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_scheduleTokenUpdateIfNecessaryWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_simulatePushWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_simulatePushIfNetworkTetheredWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_retryNotNowWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_reauthenticationCompleteWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_pushTokenWithCompletion_ argumentIndex:1 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_touchWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_getAssertionDescriptionsWithCompletion_ argumentIndex:1 ofReply:1];
}

id allowedDataClasses()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:11];
  id v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);

  return v2;
}

void MDMXPCProtocolInitialize(void *a1)
{
  id v1 = a1;
  MDMSharedXPCProtocolInitialize(v1);
  allowedDataClasses();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setClasses:v2 forSelector:sel_migrateMDMWithContext_completion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_uprootMDMWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_processDeviceRequest_encodeResponse_completion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_processDeviceRequest_encodeResponse_completion_ argumentIndex:1 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_requestInstallOfAppsInRestoreWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_blockAppInstallsWithCompletion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_unblockAppInstallsWithCompletion_ argumentIndex:0 ofReply:1];
}

void MDMUserXPCProtocolInitialize(void *a1)
{
  id v1 = a1;
  MDMSharedXPCProtocolInitialize(v1);
  allowedDataClasses();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setClasses:v2 forSelector:sel_processUserRequest_encodeResponse_completion_ argumentIndex:0 ofReply:1];
  [v1 setClasses:v2 forSelector:sel_processUserRequest_encodeResponse_completion_ argumentIndex:1 ofReply:1];
}

void __getLAContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:](v0);
}

uint64_t AMFIMDMModeEnroll()
{
  return MEMORY[0x1F410AA08]();
}

uint64_t AMFIMDMModeRemove()
{
  return MEMORY[0x1F410AA10]();
}

uint64_t AMFIProfileRemoveTrust()
{
  return MEMORY[0x1F410AA18]();
}

uint64_t AMFIProfileRequiresReboot()
{
  return MEMORY[0x1F410AA20]();
}

uint64_t AMFIProfileScheduleTrust()
{
  return MEMORY[0x1F410AA28]();
}

uint64_t AMFIProfileSetTrust()
{
  return MEMORY[0x1F410AA30]();
}

uint64_t AMFISupervisedModeSetState()
{
  return MEMORY[0x1F410AA38]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

uint64_t DMCAKAppleIDSession()
{
  return MEMORY[0x1F4116FE0]();
}

uint64_t DMCAKAuthenticationIDMSTokenKey()
{
  return MEMORY[0x1F4116FE8]();
}

uint64_t DMCCTIMEI()
{
  return MEMORY[0x1F4116FF0]();
}

uint64_t DMCCTMEID()
{
  return MEMORY[0x1F4116FF8]();
}

uint64_t DMCDeviceManagementDaemonSetupOptionDirectoryPath()
{
  return MEMORY[0x1F4117000]();
}

uint64_t DMCErrorArray()
{
  return MEMORY[0x1F4117008]();
}

uint64_t DMCHTTPAuthStringWithAuthToken()
{
  return MEMORY[0x1F4117010]();
}

uint64_t DMCIOSerialString()
{
  return MEMORY[0x1F4117020]();
}

uint64_t DMCIsSetupBuddyDone()
{
  return MEMORY[0x1F4117028]();
}

uint64_t DMCLKLogoutSupportClass()
{
  return MEMORY[0x1F4117030]();
}

uint64_t DMCLocalizedFormat()
{
  return MEMORY[0x1F4117038]();
}

uint64_t DMCLocalizedString()
{
  return MEMORY[0x1F4117040]();
}

uint64_t DMCLocalizedStringByDevice()
{
  return MEMORY[0x1F4117048]();
}

uint64_t DMCLogObjects()
{
  return MEMORY[0x1F4117050]();
}

uint64_t DMCSendUPPTrustFailedNotification()
{
  return MEMORY[0x1F4117058]();
}

uint64_t DMCSendUPPVerificationOfflineNotification()
{
  return MEMORY[0x1F4117060]();
}

uint64_t DMCUMUserManagerClass()
{
  return MEMORY[0x1F4117068]();
}

uint64_t DMCUSEnglishNumberFormatter()
{
  return MEMORY[0x1F4117070]();
}

uint64_t DMCUSEnglishString()
{
  return MEMORY[0x1F4117078]();
}

uint64_t MDMAppManagementFilePath()
{
  return MEMORY[0x1F4117080]();
}

uint64_t MDMCloudConfigurationDetailsFilePath()
{
  return MEMORY[0x1F4117090]();
}

uint64_t MDMCloudConfigurationSetAsideDetailsFilePath()
{
  return MEMORY[0x1F4117098]();
}

uint64_t MDMFilePath()
{
  return MEMORY[0x1F41170A0]();
}

uint64_t MDMManagedNonStoreBooksManifestPath()
{
  return MEMORY[0x1F41170A8]();
}

uint64_t MDMManagedStoreBooksManifestPath()
{
  return MEMORY[0x1F41170B0]();
}

uint64_t MDMPropertiesFilePath()
{
  return MEMORY[0x1F41170C0]();
}

uint64_t MDMPropertiesUserFilePath()
{
  return MEMORY[0x1F41170C8]();
}

uint64_t MDMSetupAssistantSettingsFilePath()
{
  return MEMORY[0x1F41170D0]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x1F4180DA0]();
}

uint64_t MISEnumerateInstalledProvisioningProfiles()
{
  return MEMORY[0x1F4180DB0]();
}

uint64_t MISEnumerateTrustedUPPs()
{
  return MEMORY[0x1F4180DC0]();
}

uint64_t MISProfileGetValue()
{
  return MEMORY[0x1F4180DE0]();
}

uint64_t MISProvisioningProfileGetEntitlements()
{
  return MEMORY[0x1F4180DF0]();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return MEMORY[0x1F4180DF8]();
}

uint64_t MISProvisioningProfileGrantsEntitlement()
{
  return MEMORY[0x1F4180E00]();
}

uint64_t MISProvisioningProfileIsAppleInternalProfile()
{
  return MEMORY[0x1F4180E08]();
}

uint64_t MISProvisioningProfileIsForLocalProvisioning()
{
  return MEMORY[0x1F4180E10]();
}

uint64_t MISProvisioningProfileProvisionsAllDevices()
{
  return MEMORY[0x1F4180E18]();
}

uint64_t MISValidateUPP()
{
  return MEMORY[0x1F4180E40]();
}

uint64_t MISXMLProvisioningProfileGetDeveloperCertificates()
{
  return MEMORY[0x1F4180E50]();
}

void NSLog(NSString *format, ...)
{
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1F40F6B68](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
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

void objc_enumerationMutation(id obj)
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}