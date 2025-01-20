id MDMAppManagementFilePath()
{
  void *v0;
  uint64_t vars8;

  if (MDMAppManagementFilePath_once != -1) {
    dispatch_once(&MDMAppManagementFilePath_once, &__block_literal_global_91);
  }
  v0 = (void *)MDMAppManagementFilePath_str;
  return v0;
}

void __MDMCloudConfigurationDetailsFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"CloudConfigurationDetails.plist"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)MDMCloudConfigurationDetailsFilePath_str;
  MDMCloudConfigurationDetailsFilePath_str = v1;
}

void __MDMCloudConfigurationSetAsideDetailsFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"CloudConfigurationSetAsideDetails.plist"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)MDMCloudConfigurationSetAsideDetailsFilePath_str;
  MDMCloudConfigurationSetAsideDetailsFilePath_str = v1;
}

id MDMCloudConfigurationSetAsideDetailsFilePath()
{
  if (MDMCloudConfigurationSetAsideDetailsFilePath_once != -1) {
    dispatch_once(&MDMCloudConfigurationSetAsideDetailsFilePath_once, &__block_literal_global_111);
  }
  id v0 = (void *)MDMCloudConfigurationSetAsideDetailsFilePath_str;
  return v0;
}

id MDMCloudConfigurationDetailsFilePath()
{
  if (MDMCloudConfigurationDetailsFilePath_once != -1) {
    dispatch_once(&MDMCloudConfigurationDetailsFilePath_once, &__block_literal_global_106_0);
  }
  id v0 = (void *)MDMCloudConfigurationDetailsFilePath_str;
  return v0;
}

void __MDMAppManagementFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMAppManagement.plist"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)MDMAppManagementFilePath_str;
  MDMAppManagementFilePath_str = v1;
}

void __MCConfigurationProfilesSystemGroupContainer_block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (+[DMCMultiUserModeUtilities isSharediPad])
  {
    id v0 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
    MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = @"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles";
  }
  uint64_t v1 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  if (MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath
    || (DMCSystemGroupContainerPathWithGroupIdentifier(@"systemgroup.com.apple.configurationprofiles"),
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        id v3 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath,
        MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = v2,
        v3,
        (uint64_t v1 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath) != 0))
  {
    if ([v1 isEqualToString:@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles"])return; {
    v4 = *DMCLogObjects();
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v11 = 138543618;
      *(void *)&v11[4] = @"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles";
      *(_WORD *)&v11[12] = 2114;
      *(void *)&v11[14] = MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
      v5 = "Received a profile system group container path we weren't expecting\n"
           "Expected: %{public}@\n"
           "Actual: %{public}@\n"
           "Overriding MCM with expected path";
      v6 = v4;
      uint32_t v7 = 22;
LABEL_10:
      _os_log_impl(&dword_1A7863000, v6, OS_LOG_TYPE_FAULT, v5, v11, v7);
    }
  }
  else
  {
    v8 = *DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v11 = 138543362;
      *(void *)&v11[4] = @"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles";
      v5 = "Failed to get profile system group container path. Overriding with expected path: %{public}@";
      v6 = v8;
      uint32_t v7 = 12;
      goto LABEL_10;
    }
  }
  uint64_t v9 = objc_msgSend(@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles", "copy", *(_OWORD *)v11, *(void *)&v11[16]);
  v10 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = v9;
}

uint64_t __DMCLogObjects_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.devicemanagementclient", "DMC");
  uint64_t v1 = (void *)DMCLogObjects__DMCLogObjects;
  DMCLogObjects__DMCLogObjects = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.devicemanagementclient", "MDM");
  id v3 = (void *)qword_1EB220D38;
  qword_1EB220D38 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.devicemanagementclient", "Assertion");
  v5 = (void *)qword_1EB220D40;
  qword_1EB220D40 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.devicemanagementclient", "File");
  uint32_t v7 = (void *)qword_1EB220D48;
  qword_1EB220D48 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.devicemanagementclient", "Restore");
  uint64_t v9 = (void *)qword_1EB220D50;
  qword_1EB220D50 = (uint64_t)v8;

  qword_1EB220D58 = (uint64_t)os_log_create("com.apple.devicemanagementclient", "Tether");
  return MEMORY[0x1F41817F8]();
}

void __MCSystemProfileStorageDirectory_block_invoke()
{
  if (MCSystemProfileLibraryDirectory_once != -1) {
    dispatch_once(&MCSystemProfileLibraryDirectory_once, &__block_literal_global_210);
  }
  id v0 = (id)MCSystemProfileLibraryDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"ConfigurationProfiles"];
  uint64_t v1 = [v3 copy];
  os_log_t v2 = (void *)MCSystemProfileStorageDirectory_str;
  MCSystemProfileStorageDirectory_str = v1;
}

void __MCSystemProfileLibraryDirectory_block_invoke()
{
  MCConfigurationProfilesSystemGroupContainer();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v3 stringByAppendingPathComponent:@"Library"];
  uint64_t v1 = [v0 copy];
  os_log_t v2 = (void *)MCSystemProfileLibraryDirectory_str;
  MCSystemProfileLibraryDirectory_str = v1;
}

id MCConfigurationProfilesSystemGroupContainer()
{
  if (MCConfigurationProfilesSystemGroupContainer_onceToken != -1) {
    dispatch_once(&MCConfigurationProfilesSystemGroupContainer_onceToken, &__block_literal_global_199);
  }
  id v0 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  return v0;
}

id _assertionQueue()
{
  if (_assertionQueue_onceToken != -1) {
    dispatch_once(&_assertionQueue_onceToken, &__block_literal_global_80);
  }
  id v0 = (void *)_assertionQueue_queue;
  return v0;
}

void sub_1A786594C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id DMCSystemGroupContainerPathWithGroupIdentifier(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  [v1 UTF8String];
  os_log_t v2 = (void *)container_system_group_path_for_identifier();
  id v3 = *DMCLogObjects();
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v7 = v1;
      __int16 v8 = 2082;
      uint64_t v9 = (uint64_t)v2;
      _os_log_impl(&dword_1A7863000, v3, OS_LOG_TYPE_DEFAULT, "Got system group container path from MCM for %{public}@: %{public}s", buf, 0x16u);
    }
    os_log_t v4 = [NSString stringWithCString:v2 encoding:4];
    free(v2);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v7 = v1;
      __int16 v8 = 2048;
      uint64_t v9 = 1;
      _os_log_impl(&dword_1A7863000, v3, OS_LOG_TYPE_ERROR, "Error getting system group container for %{public}@: %llu", buf, 0x16u);
    }
    os_log_t v4 = 0;
  }

  return v4;
}

void _releasePowerAssertion()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v0 = DMCLogObjects()[2];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 67109376;
    int v4 = powerAssertionRetainCount;
    __int16 v5 = 1024;
    int v6 = powerAssertionRetainCount - 1;
    _os_log_impl(&dword_1A7863000, v0, OS_LOG_TYPE_DEFAULT, "Releasing power assertion. Count: %d -> %d.", (uint8_t *)&v3, 0xEu);
  }
  IOPMAssertionRelease(assertionID);
  BOOL v1 = __OFSUB__(powerAssertionRetainCount--, 1);
  if ((powerAssertionRetainCount < 0) ^ v1 | (powerAssertionRetainCount == 0))
  {
    os_log_t v2 = DMCLogObjects()[2];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 67109120;
      int v4 = assertionID;
      _os_log_impl(&dword_1A7863000, v2, OS_LOG_TYPE_DEFAULT, "IOPMAssertion released %d.", (uint8_t *)&v3, 8u);
    }
  }
}

void _retainPowerAssertion()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v0 = DMCLogObjects()[2];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v8 = powerAssertionRetainCount;
    __int16 v9 = 1024;
    int v10 = powerAssertionRetainCount + 1;
    _os_log_impl(&dword_1A7863000, v0, OS_LOG_TYPE_DEFAULT, "Retaining power assertion. Count: %d -> %d", buf, 0xEu);
  }
  if (powerAssertionRetainCount)
  {
    IOPMAssertionRetain(assertionID);
  }
  else
  {
    BOOL v1 = DMCLogObjects()[2];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v1, OS_LOG_TYPE_DEFAULT, "Creating new IOPMAssertion.", buf, 2u);
    }
    v6[0] = @"PreventUserIdleSystemSleep";
    v6[1] = @"MC activity";
    os_log_t v2 = objc_msgSend(NSNumber, "numberWithDouble:", 3600.0, @"AssertType", @"AssertName", @"TimeoutSeconds");
    v6[2] = v2;
    v6[3] = @"TimeoutActionTurnOff";
    v5[3] = @"TimeoutAction";
    v5[4] = @"AllowsDeviceRestart";
    v6[4] = *MEMORY[0x1E4F1CFD0];
    CFDictionaryRef v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];

    IOPMAssertionCreateWithProperties(v3, (IOPMAssertionID *)&assertionID);
    int v4 = DMCLogObjects()[2];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = assertionID;
      _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEFAULT, "IOPMAssertion created %d", buf, 8u);
    }
  }
  ++powerAssertionRetainCount;
}

uint64_t *DMCLogObjects()
{
  if (DMCLogObjects_onceToken != -1) {
    dispatch_once(&DMCLogObjects_onceToken, &__block_literal_global_11);
  }
  return &DMCLogObjects__DMCLogObjects;
}

void sub_1A78662E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id MDMManagedNonStoreBooksDirectory()
{
  if (MDMManagedNonStoreBooksDirectory_once != -1) {
    dispatch_once(&MDMManagedNonStoreBooksDirectory_once, &__block_literal_global_149);
  }
  id v0 = (void *)MDMManagedNonStoreBooksDirectory_str;
  return v0;
}

void AppleAccountLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppleAccountLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5CFD400;
    uint64_t v3 = 0;
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_1A786713C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 64), 8);
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

void sub_1A7867400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t __AppleAccountLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleAccountLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAAQuotaInfoRequestClass_block_invoke(uint64_t a1)
{
  AppleAccountLibrary();
  Class result = objc_getClass("AAQuotaInfoRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAAQuotaInfoRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAAQuotaInfoRequestClass_block_invoke_cold_1();
    return __getAAQuotaInfoResponseClass_block_invoke(v3);
  }
  return result;
}

Class __getAAQuotaInfoResponseClass_block_invoke(uint64_t a1)
{
  AppleAccountLibrary();
  Class result = objc_getClass("AAQuotaInfoResponse");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAAQuotaInfoResponseClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAAQuotaInfoResponseClass_block_invoke_cold_1();
    return (Class)__77__ACAccountStore_DeviceManagementClient__dmc_visibleRemoteManagementAccounts__block_invoke(v3);
  }
  return result;
}

void sub_1A7869204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
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

void sub_1A786ABC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
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

void sub_1A786AEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A786B330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

Class __getCDPUIControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreCDPUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreCDPUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5CFD6C8;
    uint64_t v6 = 0;
    CoreCDPUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!CoreCDPUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CDPUIController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getCDPUIControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCDPUIControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreCDPUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreCDPUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A786C2DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DMCActivationUtilitiesWaitingForReady()
{
  id v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1A7863000, v0, OS_LOG_TYPE_INFO, "Activation state changed.", v3, 2u);
  }
  BOOL v1 = +[DMCActivationUtilities sharedInstance];
  [v1 _clearCache];

  long long v2 = +[DMCActivationUtilities sharedInstance];
  [v2 setIsReady:1];
}

void DMCActivationUtilitiesDeactivated()
{
  id v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v2 = 0;
    _os_log_impl(&dword_1A7863000, v0, OS_LOG_TYPE_INFO, "Device deactivated. Clearing activation record cache.", v2, 2u);
  }
  BOOL v1 = +[DMCActivationUtilities sharedInstance];
  [v1 _clearCache];
}

void sub_1A786C83C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A786C9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id syncQueue()
{
  if (syncQueue_onceToken != -1) {
    dispatch_once(&syncQueue_onceToken, &__block_literal_global_1);
  }
  id v0 = (void *)syncQueue_queue;
  return v0;
}

id syncQueueAlertQueue()
{
  if (syncQueueAlertQueue_onceToken != -1) {
    dispatch_once(&syncQueueAlertQueue_onceToken, &__block_literal_global_12);
  }
  id v0 = (void *)syncQueueAlertQueue_queue;
  return v0;
}

void syncQueueShowNextAlert()
{
  *(void *)((char *)&v37[3] + 4) = *MEMORY[0x1E4F143B8];
  if (!syncQueueCurrentAlert)
  {
    id v0 = syncQueueAlertQueue();
    BOOL v1 = [v0 firstObject];

    if (v1)
    {
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D410];
      *(void *)&long long v2 = 134217984;
      long long v32 = v2;
      do
      {
        SInt32 error = 0;
        CFOptionFlags flags = 0;
        objc_msgSend(v1, "notificationParametersOutFlags:", &flags, v32);
        CFDictionaryRef v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = CFUserNotificationCreate(v3, 0.0, flags, &error, v5);
        if (!v6)
        {
          uint64_t v13 = *DMCLogObjects();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            SInt32 v14 = error;
            uint64_t v15 = v13;
            uint64_t v16 = [v1 summary];
            *(_DWORD *)buf = 67109378;
            LODWORD(v37[0]) = v14;
            WORD2(v37[0]) = 2114;
            *(void *)((char *)v37 + 6) = v16;
            _os_log_impl(&dword_1A7863000, v15, OS_LOG_TYPE_ERROR, "DMCAlertManager cannot create alert with error: %d. Alert: '%{public}@'", buf, 0x12u);
          }
          goto LABEL_21;
        }
        uint64_t v7 = v6;
        CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v6, (CFUserNotificationCallBack)mainQueueAlertCallback, 0);
        if (RunLoopSource)
        {
          __int16 v9 = RunLoopSource;
          uint64_t v10 = syncQueueAlertQueue();
          uint64_t v11 = [v10 count];

          if (v11)
          {
            uint64_t v12 = syncQueueAlertQueue();
            [v12 removeObjectAtIndex:0];
          }
          else
          {
            v20 = *DMCLogObjects();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A7863000, v20, OS_LOG_TYPE_ERROR, "DMCAlertManager missing alert in sync alert queue", buf, 2u);
            }
          }
          objc_storeStrong((id *)&syncQueueCurrentAlert, v1);
          [v1 setNotification:v7];
          Main = CFRunLoopGetMain();
          CFRunLoopAddSource(Main, v9, v4);
          CFRelease(v9);
          v22 = *DMCLogObjects();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            v24 = [v1 summary];
            *(_DWORD *)buf = 138543362;
            v37[0] = v24;
            _os_log_impl(&dword_1A7863000, v23, OS_LOG_TYPE_DEFAULT, "Displaying alert: '%{public}@'", buf, 0xCu);
          }
          [v1 dismissAfterTimeInterval];
          if (v25 > 0.0)
          {
            v26 = *DMCLogObjects();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = v26;
              [v1 dismissAfterTimeInterval];
              *(_DWORD *)buf = v32;
              v37[0] = v28;
              _os_log_impl(&dword_1A7863000, v27, OS_LOG_TYPE_DEFAULT, "Scheduling automatic alert dismissal after %0.0f seconds.", buf, 0xCu);
            }
            CFRetain(v7);
            [v1 dismissAfterTimeInterval];
            dispatch_time_t v30 = dispatch_time(0, (uint64_t)(v29 * 1000000000.0));
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __syncQueueShowNextAlert_block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0l;
            block[4] = v7;
            dispatch_after(v30, MEMORY[0x1E4F14428], block);
            goto LABEL_21;
          }
        }
        else
        {
          v17 = *DMCLogObjects();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            v19 = [v1 summary];
            *(_DWORD *)buf = 138543362;
            v37[0] = v19;
            _os_log_impl(&dword_1A7863000, v18, OS_LOG_TYPE_ERROR, "DMCAlertManager cannot create run loop source to display alert: '%{public}@'", buf, 0xCu);
          }
        }
        CFRelease(v7);
LABEL_21:

        v31 = syncQueueAlertQueue();
        BOOL v1 = [v31 firstObject];
      }
      while (v1);
    }
  }
}

id syncQueueiTunesLoginCompletionBlocks()
{
  if (syncQueueiTunesLoginCompletionBlocks_onceToken != -1) {
    dispatch_once(&syncQueueiTunesLoginCompletionBlocks_onceToken, &__block_literal_global_33);
  }
  id v0 = (void *)syncQueueiTunesLoginCompletionBlocks_blocks;
  return v0;
}

uint64_t __syncQueue_block_invoke()
{
  syncQueue_queue = (uint64_t)dispatch_queue_create("com.apple.devicemanagementclient.DMCAlertManager.syncQueue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __syncQueueAlertQueue_block_invoke()
{
  syncQueueAlertQueue_queue = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void mainQueueAlertCallback(uint64_t a1, unint64_t a2)
{
  int v2 = a2;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2 >= 4)
  {
    CFAllocatorRef v3 = objc_msgSend(NSString, "stringWithFormat:", @"unknown (%lu)", a2);
    int v2 = 5;
  }
  else
  {
    CFAllocatorRef v3 = *(&off_1E5CFD7C8 + a2);
  }
  CFStringRef v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v9 = v3;
    _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEFAULT, "DMCAlert dismissed with response: %{public}@", buf, 0xCu);
  }
  CFDictionaryRef v5 = syncQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __mainQueueAlertCallback_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v7 = v2;
  dispatch_sync(v5, block);
}

void __syncQueueShowNextAlert_block_invoke(uint64_t a1)
{
  int v2 = *DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFAllocatorRef v3 = 0;
    _os_log_impl(&dword_1A7863000, v2, OS_LOG_TYPE_DEFAULT, "Automatically dismissing alert.", v3, 2u);
  }
  CFUserNotificationCancel(*(CFUserNotificationRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __mainQueueAlertCallback_block_invoke(uint64_t a1)
{
  id v2 = (id)syncQueueCurrentAlert;
  CFAllocatorRef v3 = (void *)syncQueueCurrentAlert;
  syncQueueCurrentAlert = 0;

  CFStringRef v4 = [v2 completionBlock];

  if (v4)
  {
    __int16 v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __mainQueueAlertCallback_block_invoke_2;
    v10[3] = &unk_1E5CFD738;
    id v11 = v2;
    int v12 = *(_DWORD *)(a1 + 32);
    dispatch_async(v9, v10);
  }
  syncQueueShowNextAlert(v5, v6, v7, v8);
}

void __mainQueueAlertCallback_block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionBlock];
  v2[2](v2, *(unsigned int *)(a1 + 40));
}

uint64_t __syncQueueiTunesLoginCompletionBlocks_block_invoke()
{
  syncQueueiTunesLoginCompletionBlocks_blocks = [MEMORY[0x1E4F1CA48] array];
  return MEMORY[0x1F41817F8]();
}

void sub_1A786E1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAMSProcessInfoClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AMSProcessInfo");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSProcessInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSProcessInfoClass_block_invoke_cold_1();
    AppleMediaServicesLibrary();
  }
}

void AppleMediaServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppleMediaServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E5CFD7E8;
    uint64_t v3 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAMSUserAgentClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  Class result = objc_getClass("AMSUserAgent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSUserAgentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSUserAgentClass_block_invoke_cold_1();
    return (Class)+[DMCAuthKitUtilities midWithError:v5];
  }
  return result;
}

uint64_t DMCHCUCreateCSR(void *a1)
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v2 = (void *)*MEMORY[0x1E4F3B708];
  keys[0] = *(void **)MEMORY[0x1E4F3B718];
  keys[1] = v2;
  values[0] = *(void **)MEMORY[0x1E4F3B760];
  values[1] = @"1024";
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  int valuePtr = 5;
  CFTypeRef cf = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
  CFDictionaryRef v5 = CFDictionaryCreate(v3, MEMORY[0x1E4F3B970], &cf, 1, 0, 0);
  if (cf) {
    CFRelease(cf);
  }
  RandomKey = SecKeyCreateRandomKey(v4, 0);
  SecKeyRef v7 = SecKeyCopyPublicKey(RandomKey);
  if (v4) {
    CFRelease(v4);
  }
  if (RandomKey) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    __int16 v9 = *DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v9, OS_LOG_TYPE_ERROR, "Could not create public/private key pair for CSR.", buf, 2u);
    }
    if (v5) {
      CFRelease(v5);
    }
    if (RandomKey) {
      CFRelease(RandomKey);
    }
    if (v7) {
      CFRelease(v7);
    }
    uint64_t CertificateRequestWithParameters = 0;
  }
  else
  {
    memset(cStr, 0, 37);
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    uuid_unparse(out, cStr);
    CFStringRef v11 = CFStringCreateWithCString(v3, cStr, 0x600u);
    *(void *)buf = *MEMORY[0x1E4F3BB98];
    char v18 = *MEMORY[0x1E4F3B470];
    CFStringRef v19 = v11;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v15 = buf;
    uint64_t v16 = 0;
    [v1 setObject:v7 forKey:@"PublicKey"];
    [v1 setObject:RandomKey forKey:@"PrivateKey"];
    uint64_t CertificateRequestWithParameters = SecGenerateCertificateRequestWithParameters();
    if (v5) {
      CFRelease(v5);
    }
    CFRelease(RandomKey);
    CFRelease(v7);
    if (v11) {
      CFRelease(v11);
    }
  }

  return CertificateRequestWithParameters;
}

id DMCHCUSetCertificateDataForMappedLabel(const __CFData *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  SecCertificateRef v9 = SecCertificateCreateWithData(0, a1);
  uint64_t v10 = [v8 objectForKey:@"PrivateKey"];

  CFStringRef v11 = 0;
  if (a1 && v10)
  {
    uint64_t v12 = SecIdentityCreate();
    if (v12)
    {
      uint64_t v13 = (const void *)v12;
      id v14 = v7;
      if (v14)
      {
        CFStringRef v11 = +[DMCKeychain saveItem:v13 withLabel:v14 group:@"apple" useSystemKeychain:1 enforcePersonalPersona:a4];
        if (v11)
        {
          uint64_t v15 = _persistentKeyMapTable();
          [v15 setObject:v11 forKey:v14];
          id v16 = v15;
          v17 = MTiPCUKeychainMapPath();
          [v16 DMCWriteToBinaryFile:v17];
        }
      }
      else
      {
        CFStringRef v11 = 0;
      }

      CFRelease(v13);
    }
    else
    {
      CFStringRef v11 = 0;
    }
  }
  if (v9) {
    CFRelease(v9);
  }

  return v11;
}

SecCertificateRef DMCHCUCopyCertificateFromKeychainForMappedLabel(void *a1, uint64_t a2)
{
  SecCertificateRef certificateRef = 0;
  long long v2 = _copyObjectFromKeychainForLabel(a1, a2);
  CFAllocatorRef v3 = v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 != SecCertificateGetTypeID())
    {
      CFTypeID v5 = CFGetTypeID(v3);
      if (v5 == SecIdentityGetTypeID())
      {
        SecIdentityCopyCertificate((SecIdentityRef)v3, &certificateRef);
        CFRelease(v3);
        return certificateRef;
      }
      else
      {
        CFRelease(v3);
        return 0;
      }
    }
  }
  return (SecCertificateRef)v3;
}

void *_copyObjectFromKeychainForLabel(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  id v3 = a1;
  CFTypeID v4 = _persistentKeyMapTable();
  CFTypeID v5 = [v4 objectForKey:v3];

  if (v5) {
    uint64_t v6 = +[DMCKeychain copyItemWithPersistentID:v5 useSystemKeychain:1 enforcePersonalPersona:a2];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

void *DMCHCUCopyHostCertificateForMappedLabel(void *a1, uint64_t a2)
{
  id v3 = [a1 stringByAppendingString:@"-HostCert"];
  CFTypeID v4 = _copyObjectFromKeychainForLabel(v3, a2);

  return v4;
}

id certificatesFromDERCertificateDataArray(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v2 = v1;
  if (v1)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v5) {
      goto LABEL_15;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        SecCertificateRef v9 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((void *)&v18 + 1) + 8 * i));
        if (v9)
        {
          SecCertificateRef v10 = v9;
          [v3 addObject:v9];

          CFStringRef v11 = *DMCLogObjects();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
            continue;
          }
          *(_WORD *)v17 = 0;
          uint64_t v12 = v11;
          os_log_type_t v13 = OS_LOG_TYPE_INFO;
          id v14 = "SecCertificateCreateWithData succeed";
        }
        else
        {
          uint64_t v15 = *DMCLogObjects();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            continue;
          }
          *(_WORD *)v17 = 0;
          uint64_t v12 = v15;
          os_log_type_t v13 = OS_LOG_TYPE_ERROR;
          id v14 = "Could not parse anchor certificate data. Ignoring.";
        }
        _os_log_impl(&dword_1A7863000, v12, v13, v14, v17, 2u);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (!v6)
      {
LABEL_15:

        goto LABEL_17;
      }
    }
  }
  id v3 = 0;
LABEL_17:

  return v3;
}

id _persistentKeyMapTable()
{
  id v0 = (void *)MEMORY[0x1E4F1CA60];
  id v1 = MTiPCUKeychainMapPath();
  long long v2 = [v0 dictionaryWithContentsOfFile:v1];

  if (!v2)
  {
    long long v2 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  return v2;
}

BOOL DMCCTHasTelephony()
{
  return +[DMCMobileGestalt hasTelephonyCapability];
}

BOOL DMCCTHasCellular()
{
  return +[DMCMobileGestalt hasCellularDataCapability];
}

id DMCCTIMEI()
{
  if (DMCCTIMEI_once != -1) {
    dispatch_once(&DMCCTIMEI_once, &__block_literal_global_4);
  }
  id v0 = (void *)DMCCTIMEI_imei;
  return v0;
}

uint64_t __DMCCTIMEI_block_invoke()
{
  id v0 = _EquipmentInfo();
  id v4 = [v0 IMEI];

  if ([v4 length])
  {
    id v1 = [MEMORY[0x1E4F28E78] stringWithString:v4];
    if ((unint64_t)[v1 length] >= 3) {
      [v1 insertString:@" " atIndex:2];
    }
    if ((unint64_t)[v1 length] >= 0xA) {
      [v1 insertString:@" " atIndex:9];
    }
    if ((unint64_t)[v1 length] >= 0x11) {
      [v1 insertString:@" " atIndex:16];
    }
    long long v2 = (void *)DMCCTIMEI_imei;
    DMCCTIMEI_imeuint64_t i = (uint64_t)v1;
  }
  return MEMORY[0x1F4181820]();
}

id _EquipmentInfo()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v0 = _CoreTelephonyClient();
  id v1 = _DataServiceSubscriptionContextFromClient(v0);
  if (v1)
  {
    id v7 = 0;
    long long v2 = [v0 getMobileEquipmentInfoFor:v1 error:&v7];
    id v3 = v7;
    if (v2)
    {
      id v4 = v2;
    }
    else
    {
      uint64_t v5 = *DMCLogObjects();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v9 = v3;
        _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_DEFAULT, "getMobileEquipmentInfoFor:error: failed: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v2 = 0;
  }

  return v2;
}

id DMCCTMEID()
{
  if (DMCCTMEID_once != -1) {
    dispatch_once(&DMCCTMEID_once, &__block_literal_global_2_0);
  }
  id v0 = (void *)DMCCTMEID_meid;
  return v0;
}

void __DMCCTMEID_block_invoke()
{
  id v0 = _EquipmentInfo();
  id obj = [v0 MEID];

  if ([obj length]) {
    objc_storeStrong((id *)&DMCCTMEID_meid, obj);
  }
}

uint64_t DMCCTSupportsVoiceRoaming()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!+[DMCMobileGestalt hasTelephonyCapability])
  {
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  id v0 = _CoreTelephonyClient();
  id v1 = _DataServiceSubscriptionContextFromClient(v0);
  long long v2 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
  id v12 = 0;
  id v3 = (void *)[v0 copyCarrierBundleValue:v1 key:@"ShowVoiceRoamingSwitch" bundleType:v2 error:&v12];
  id v4 = (__CFString *)v12;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v3 BOOLValue];
      int v6 = 1;
      goto LABEL_12;
    }
    id v7 = *DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v4;
      id v8 = "voice roaming switch value from carrier bundle is not a BOOLean, assuming NO: %{public}@";
      goto LABEL_10;
    }
  }
  else
  {
    id v7 = *DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v4;
      id v8 = "could not get voice roaming switch from carrier bundle, assuming NO: %{public}@";
LABEL_10:
      _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
    }
  }
  int v6 = 0;
  uint64_t v5 = 0;
LABEL_12:

  if (!v6) {
    return 0;
  }
LABEL_13:
  id v9 = *DMCLogObjects();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = @"NO";
    if (v5) {
      uint64_t v10 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    id v14 = v10;
    _os_log_impl(&dword_1A7863000, v9, OS_LOG_TYPE_INFO, "device supports voice roaming: %{public}@", buf, 0xCu);
  }
  return v5;
}

id _CoreTelephonyClient()
{
  if (_CoreTelephonyClient_onceToken != -1) {
    dispatch_once(&_CoreTelephonyClient_onceToken, &__block_literal_global_17);
  }
  id v0 = (void *)_CoreTelephonyClient_coreTelephonyClient;
  return v0;
}

id _DataServiceSubscriptionContextFromClient(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v2 = v1;
  if (v1)
  {
    id v18 = 0;
    id v3 = [v1 getPreferredDataSubscriptionContextSync:&v18];
    id v4 = v18;
    uint64_t v5 = v4;
    if (!v3)
    {
      id v14 = *DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v5;
        _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_DEFAULT, "getPreferredDataSubscriptionContextSync failed: %{public}@", buf, 0xCu);
      }
      id v13 = 0;
      id v7 = v5;
      goto LABEL_19;
    }
    id v17 = v4;
    int v6 = [v2 getSIMStatus:v3 error:&v17];
    id v7 = v17;

    if (v6)
    {
      if (![v6 isEqualToString:*MEMORY[0x1E4F241F0]])
      {
        id v13 = v3;
        goto LABEL_18;
      }
      id v8 = *DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v9 = "rejecting data SIM that isn't inserted";
        uint64_t v10 = v8;
        uint32_t v11 = 2;
LABEL_15:
        _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else
    {
      uint64_t v15 = *DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v7;
        id v9 = "getSIMStatus failed: %{public}@";
        uint64_t v10 = v15;
        uint32_t v11 = 12;
        goto LABEL_15;
      }
    }
    id v13 = 0;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  id v12 = *DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "nil client passed to _DataServiceSubscriptionContextFromClient", buf, 2u);
  }
  id v13 = 0;
LABEL_20:

  return v13;
}

BOOL DMCCTHasGSM()
{
  id v0 = DMCCTIMEI();
  BOOL v1 = v0 != 0;

  return v1;
}

BOOL DMCCTHasCDMA()
{
  id v0 = DMCCTMEID();
  BOOL v1 = v0 != 0;

  return v1;
}

BOOL DMCCTSetManagedCellularProfile(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = _CTServerConnectionCreate();
  if (v4)
  {
    id v12 = (const void *)v4;
    uint64_t ManagedCellularProfile = _CTServerConnectionLoadManagedCellularProfile();
    BOOL v14 = ManagedCellularProfile == 0;
    if (a2 && ManagedCellularProfile)
    {
      errorFromCTError(ManagedCellularProfile);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v12);
  }
  else if (a2)
  {
    cannotConnectError(0, v5, v6, v7, v8, v9, v10, v11);
    BOOL v14 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

id errorFromCTError(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a1 == 2)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F285A8];
    uint64_t v9 = [NSNumber numberWithInt:HIDWORD(a1)];
    id v17 = DMCErrorArray(@"MACH_ERROR_P_CODE_%@", v10, v11, v12, v13, v14, v15, v16, v9);
    uint64_t v6 = [v7 DMCErrorWithDomain:v8 code:a1 >> 32 descriptionArray:v17 errorType:@"DMCFatalError"];
  }
  else if (a1 == 1)
  {
    long long v2 = [NSString stringWithUTF8String:strerror(SHIDWORD(a1))];
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F28798];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = v2;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v6 = [v3 errorWithDomain:v4 code:a1 >> 32 userInfo:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

id cannotConnectError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = DMCErrorArray(@"CELLULAR_CANNOT_CONNECT", a2, a3, a4, a5, a6, a7, a8, 0);
  uint64_t v10 = [v8 DMCErrorWithDomain:@"DMCCellularErrorDomain" code:36001 descriptionArray:v9 errorType:@"DMCFatalError"];

  return v10;
}

BOOL DMCCTClearManagedCellularProfile(void *a1)
{
  uint64_t v2 = _CTServerConnectionCreate();
  if (v2)
  {
    uint64_t v10 = (const void *)v2;
    uint64_t v11 = _CTServerConnectionUnloadManagedCellularProfile();
    BOOL v12 = v11 == 0;
    if (a1 && v11)
    {
      errorFromCTError(v11);
      *a1 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v10);
  }
  else if (a1)
  {
    cannotConnectError(0, v3, v4, v5, v6, v7, v8, v9);
    BOOL v12 = 0;
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v12;
}

BOOL DMCCTGetManagedCellularProfile(void *a1, void *a2)
{
  uint64_t v4 = _CTServerConnectionCreate();
  if (v4)
  {
    BOOL v12 = (const void *)v4;
    uint64_t ManagedCellularProfile = _CTServerConnectionGetManagedCellularProfile();
    if (a1) {
      *a1 = 0;
    }
    BOOL v14 = ManagedCellularProfile == 0;
    if (a2 && ManagedCellularProfile)
    {
      errorFromCTError(ManagedCellularProfile);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v12);
  }
  else if (a2)
  {
    cannotConnectError(0, v5, v6, v7, v8, v9, v10, v11);
    BOOL v14 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v14;
}

uint64_t ___queue_verifyThresholdAndAddDateRecord_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) timeIntervalSinceDate:a2];
  if (v7 <= 3.0
    && *(double *)(a1 + 48) <= (double)(unint64_t)++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  return result;
}

void ___scheduleCleanup_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  for (i = v2; [v2 count]; uint64_t v2 = i)
  {
    uint64_t v3 = [i firstObject];
    uint64_t v4 = [v3 compare:*(void *)(a1 + 48)];

    if (v4 == 1) {
      break;
    }
    [i removeObjectAtIndex:0];
  }
}

id DMCLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _bundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"DMCLocalizable"];

  return v3;
}

id _bundle()
{
  if (_bundle_once != -1) {
    dispatch_once(&_bundle_once, &__block_literal_global_6);
  }
  id v0 = (void *)_bundle_bundle;
  return v0;
}

id DMCLocalizedStringByDevice(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[DMCMobileGestalt deviceClass];
  uint64_t v3 = DMCLocalizedStringForDevice(v1, v2);

  return v3;
}

id DMCLocalizedStringForDevice(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [a2 uppercaseString];
    double v7 = [v5 stringWithFormat:@"%@_%@", v4, v6];

    uint64_t v8 = DMCLocalizedString(v7);
    if ([v8 isEqualToString:v7])
    {
      DMCLocalizedString(v4);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = v8;
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = DMCLocalizedString(v3);
  }

  return v10;
}

id DMCLocalizedFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = [v9 alloc];
  BOOL v12 = DMCLocalizedString(v10);

  uint64_t v13 = (void *)[v11 initWithFormat:v12 arguments:&a9];
  return v13;
}

id DMCUSEnglishString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _bundle();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"DMCLocalizable" localization:@"en"];

  return v3;
}

id DMCErrorArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  id v9 = a1;
  id v10 = objc_opt_new();
  _DMCStashFormattedStringInArray(v10, v9, 0, (uint64_t)&a9);
  _DMCStashFormattedStringInArray(v10, v9, 1, (uint64_t)&a9);

  _DMCStashArgumentsInArray(v10, &a9);
  return v10;
}

void _DMCStashFormattedStringInArray(void *a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a2;
  id v8 = a1;
  id v9 = [v6 alloc];
  if (a3)
  {
    id v10 = DMCUSEnglishString(v7);

    DMCUSEnglishLocale();
  }
  else
  {
    id v10 = DMCLocalizedString(v7);

    [MEMORY[0x1E4F1CA20] currentLocale];
  id v11 = };
  BOOL v12 = objc_msgSend(v9, "initWithFormat:locale:arguments:", v10, v11, a4, a4, a4);
  [v8 addObject:v12];
}

void _DMCStashArgumentsInArray(void *a1, id *a2)
{
  id v3 = a1;
  id v10 = a2;
  id v8 = a2 + 1;
  id v4 = *a2;
  if (v4)
  {
    uint64_t v5 = v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5, v8, v10);
      uint64_t v6 = v9;
      id v8 = v9 + 1;
      id v7 = *v6;

      uint64_t v5 = v7;
    }
    while (v7);
  }
}

id DMCUnformattedErrorArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  id v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = a1;
  id v11 = DMCLocalizedString(v10);
  BOOL v12 = DMCUSEnglishString(v10);

  uint64_t v13 = objc_msgSend(v9, "arrayWithObjects:", v11, v12, 0);

  _DMCStashArgumentsInArray(v13, &a9);
  return v13;
}

uint64_t ___bundle_block_invoke()
{
  _bundle_bundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

BOOL DMCFixPermissionOfSystemGroupContainerFileFM(void *a1, void *a2, int a3, void *a4)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v30 = 0;
  id v9 = [v7 attributesOfItemAtPath:v8 error:&v30];
  id v10 = v30;
  uint64_t v11 = *MEMORY[0x1E4F28330];
  BOOL v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28330]];
  if (a3) {
    uint64_t v13 = 511;
  }
  else {
    uint64_t v13 = 438;
  }
  BOOL v14 = [NSNumber numberWithUnsignedLong:v13];
  if (([v12 isEqualToNumber:v14] & 1) == 0)
  {
    uint64_t v37 = v11;
    v38[0] = v14;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v29 = v10;
    [v7 setAttributes:v22 ofItemAtPath:v8 error:&v29];
    id v23 = v29;

    id v10 = v23;
  }
  if (v10)
  {
    v35[0] = *MEMORY[0x1E4F28568];
    v24 = DMCLocalizedFormat(@"ERROR_FAILED_TO_FIX_PERMISSIONS_%@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v8);
    v35[1] = *MEMORY[0x1E4F28A50];
    v36[0] = v24;
    v36[1] = v10;
    double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

    v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DMCInternalErrorDomain" code:2 userInfo:v25];
    v27 = *DMCLogObjects();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v8;
      __int16 v33 = 2114;
      v34 = v26;
      _os_log_impl(&dword_1A7863000, v27, OS_LOG_TYPE_ERROR, "Failed to fix permissions of file at path %{public}@. Error: %{public}@", buf, 0x16u);
    }
    if (a4) {
      *a4 = v26;
    }
  }
  return v10 == 0;
}

BOOL DMCFixPermissionsOfSystemGroupContainerDirectoryAndContents(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a1;
  uint64_t v5 = [v3 defaultManager];
  BOOL v6 = DMCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM(v5, v4, a2);

  return v6;
}

BOOL DMCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM(void *a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  char v32 = 0;
  if ([v5 fileExistsAtPath:v6 isDirectory:&v32] && v32)
  {
    id v31 = 0;
    BOOL v8 = DMCFixPermissionOfSystemGroupContainerFileFM(v5, v6, 1, &v31);
    id v9 = v31;
    if (!v8) {
      [v7 addObject:v9];
    }

    id v10 = [v5 enumeratorAtPath:v6];
    uint64_t v11 = (void *)MEMORY[0x1AD0D2000]();
    uint64_t v12 = [v10 nextObject];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      do
      {
        BOOL v14 = [v6 stringByAppendingPathComponent:v13];
        buf[0] = 0;
        [v5 fileExistsAtPath:v14 isDirectory:buf];
        id v30 = 0;
        BOOL v15 = DMCFixPermissionOfSystemGroupContainerFileFM(v5, v14, buf[0], &v30);
        id v16 = v30;
        if (!v15) {
          [v7 addObject:v16];
        }

        uint64_t v11 = (void *)MEMORY[0x1AD0D2000]();
        uint64_t v13 = [v10 nextObject];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v17 = *DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v6;
      _os_log_impl(&dword_1A7863000, v17, OS_LOG_TYPE_ERROR, "Path %{public}@ does not refer to a directory.", buf, 0xCu);
    }
    uint64_t v37 = *MEMORY[0x1E4F28568];
    double v25 = DMCLocalizedFormat(@"ERROR_NOT_A_DIRECTORY_P_PATH_%@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v6);
    v38[0] = v25;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];

    v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DMCInternalErrorDomain" code:1 userInfo:v10];
    [v7 addObject:v26];
  }
  uint64_t v27 = [v7 count];
  if (v27)
  {
    uint64_t v28 = *DMCLogObjects();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v34 = v6;
      __int16 v35 = 2114;
      v36 = v7;
      _os_log_impl(&dword_1A7863000, v28, OS_LOG_TYPE_ERROR, "Failed to change ownership of directory and contents at %{public}@. Errors: %{public}@", buf, 0x16u);
    }
    if (a3) {
      *a3 = v7;
    }
  }

  return v27 == 0;
}

uint64_t DMCSafelyCopyItemAtPathToDestinationPath(void *a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a2;
  id v7 = a1;
  BOOL v8 = [v5 defaultManager];
  uint64_t v9 = DMCSafelyCopyItemAtPathToDestinationPathFM(v8, v7, v6, a3);

  return v9;
}

uint64_t DMCSafelyCopyItemAtPathToDestinationPathFM(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if ([v7 fileExistsAtPath:v8])
  {
    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    uint64_t v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v42 = v10;
      __int16 v43 = 2114;
      v44 = v11;
      _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_DEFAULT, "Moving %{public}@ to %{public}@...", buf, 0x16u);
    }
    id v40 = 0;
    uint64_t v13 = [v7 URLForDirectory:99 inDomain:1 appropriateForURL:v11 create:1 error:&v40];
    id v14 = v40;
    if (!v13)
    {
      id v29 = *DMCLogObjects();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v10;
        _os_log_impl(&dword_1A7863000, v29, OS_LOG_TYPE_ERROR, "Failed to get temporary directory path for item %{public}@", buf, 0xCu);
      }
      uint64_t v21 = 0;
      goto LABEL_35;
    }
    __int16 v35 = a4;
    BOOL v15 = [v10 lastPathComponent];
    id v16 = [v13 URLByAppendingPathComponent:v15];

    if (!v16)
    {
      id v30 = *DMCLogObjects();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v10;
        _os_log_impl(&dword_1A7863000, v30, OS_LOG_TYPE_ERROR, "Failed to create temporary URL for moving item %{public}@", buf, 0xCu);
      }
      uint64_t v21 = 0;
      goto LABEL_34;
    }
    id v39 = v14;
    int v17 = [v7 copyItemAtURL:v10 toURL:v16 error:&v39];
    id v18 = v39;

    if (!v17 || v18)
    {
      id v31 = *DMCLogObjects();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v42 = v10;
        __int16 v43 = 2114;
        v44 = v16;
        __int16 v45 = 2114;
        id v46 = v18;
        _os_log_impl(&dword_1A7863000, v31, OS_LOG_TYPE_ERROR, "Copying of item %{public}@ to temporary %{public}@ failed with error %{public}@", buf, 0x20u);
      }
      uint64_t v21 = 0;
      id v14 = v18;
      goto LABEL_34;
    }
    id v37 = 0;
    id v38 = 0;
    unsigned int v19 = [v7 replaceItemAtURL:v11 withItemAtURL:v16 backupItemName:0 options:1 resultingItemURL:&v38 error:&v37];
    id v34 = v38;
    id v20 = v37;
    if (v20) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = v19;
    }
    if ((v21 & 1) == 0)
    {
      id v14 = v20;
      char v32 = *DMCLogObjects();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v42 = v11;
        __int16 v43 = 2114;
        v44 = v16;
        __int16 v45 = 2114;
        id v46 = v14;
        _os_log_impl(&dword_1A7863000, v32, OS_LOG_TYPE_ERROR, "Replacement of item %{public}@ with %{public}@ failed with error %{public}@", buf, 0x20u);
      }
      goto LABEL_33;
    }
    uint64_t v22 = [v16 absoluteString];
    int v23 = [v7 fileExistsAtPath:v22];

    if (v23)
    {
      id v36 = 0;
      int v24 = [v7 removeItemAtURL:v16 error:&v36];
      id v25 = v36;
      v26 = v25;
      if (v24)
      {
        id v14 = 0;
        if (!v25) {
          goto LABEL_33;
        }
      }
      uint64_t v27 = *DMCLogObjects();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v42 = v16;
        __int16 v43 = 2114;
        v44 = v26;
        _os_log_impl(&dword_1A7863000, v27, OS_LOG_TYPE_ERROR, "Removal of temporary item %{public}@ failed with error %{public}@", buf, 0x16u);
      }
    }
    id v14 = 0;
LABEL_33:

LABEL_34:
    a4 = v35;
LABEL_35:

    if (a4 && v14)
    {
      id v14 = v14;
      *a4 = v14;
    }
    goto LABEL_38;
  }
  uint64_t v28 = *DMCLogObjects();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v42 = v8;
    _os_log_impl(&dword_1A7863000, v28, OS_LOG_TYPE_ERROR, "Item does not exist at %{public}@", buf, 0xCu);
  }
  uint64_t v21 = 0;
  id v14 = 0;
LABEL_38:

  return v21;
}

uint64_t DMCSetSkipBackupAttributeToItemAtPath(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  if (v4
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 path],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 fileExistsAtPath:v6],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v22 = 0;
    uint64_t v8 = *MEMORY[0x1E4F1C630];
    uint64_t v9 = [v4 getResourceValue:&v22 forKey:*MEMORY[0x1E4F1C630] error:0];
    id v10 = v22;
    uint64_t v11 = v10;
    if (v9 && [v10 BOOLValue] == a2)
    {
      BOOL v15 = 0;
    }
    else
    {
      uint64_t v12 = [NSNumber numberWithBool:a2];
      id v21 = 0;
      int v13 = [v4 setResourceValue:v12 forKey:v8 error:&v21];
      id v14 = v21;

      if (!v13 || (BOOL v15 = 0, v14))
      {
        id v16 = *DMCLogObjects();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = v16;
          id v18 = [v4 path];
          *(_DWORD *)buf = 138543618;
          id v24 = v18;
          __int16 v25 = 2114;
          id v26 = v14;
          _os_log_impl(&dword_1A7863000, v17, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup %{public}@", buf, 0x16u);
        }
        BOOL v15 = v14;
      }
    }
  }
  else
  {
    unsigned int v19 = *DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v3;
      _os_log_impl(&dword_1A7863000, v19, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup. Path does not exist.", buf, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_1A787770C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A7877C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7877DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DMCHTTPAuthStringWithAuthToken(uint64_t a1)
{
  return [NSString stringWithFormat:@"%@ %@", @"Bearer", a1];
}

id DMCIOModelPrefixString()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService
    && (io_object_t v3 = MatchingService,
        CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"model-number", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0), IOObjectRelease(v3), CFProperty))
  {
    id v5 = NSString;
    id v6 = CFProperty;
    char v7 = objc_msgSend(v5, "stringWithCString:encoding:", objc_msgSend(v6, "bytes"), 4);
  }
  else
  {
    char v7 = 0;
  }
  return v7;
}

id DMCIOModelString()
{
  mach_port_t v0 = DMCIOModelPrefixString();
  if (v0)
  {
    CFDictionaryRef v1 = +[DMCMobileGestalt regionCode];
    uint64_t v2 = [NSString stringWithFormat:@"%@%@", v0, v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id DMCIOSerialString()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"IOPlatformSerialNumber", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    IOObjectRelease(v3);
  }
  else
  {
    CFProperty = 0;
  }
  return CFProperty;
}

id DMCIOBluetoothMAC()
{
  mach_port_t v8 = 0;
  if (!MEMORY[0x1AD0D18D0](0, &v8)
    && (CFDictionaryRef v2 = IOServiceNameMatching("bluetooth")) != 0
    && (io_service_t MatchingService = IOServiceGetMatchingService(v8, v2)) != 0)
  {
    io_object_t v4 = MatchingService;
    CFDataRef v5 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", @"local-mac-address", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1u);
    if (v5)
    {
      CFDataRef v6 = v5;
      v10.location = 0;
      v10.length = 6;
      CFDataGetBytes(v5, v10, buffer);
      mach_port_t v0 = objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x", buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5]);
      CFRelease(v6);
    }
    else
    {
      mach_port_t v0 = 0;
    }
    IOObjectRelease(v4);
  }
  else
  {
    mach_port_t v0 = 0;
  }
  return v0;
}

void sub_1A787E0E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A787E608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A787E9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1A787F330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A787F610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id URLForCanonicalFilePath(void *a1)
{
  id v1 = a1;
  CFDictionaryRef v2 = DMCSystemRootDirectory();
  io_object_t v3 = [v2 stringByAppendingPathComponent:v1];

  io_object_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];

  return v4;
}

id DMCLKLogoutSupportClass()
{
  if (DMCLKLogoutSupportClass_onceToken != -1) {
    dispatch_once(&DMCLKLogoutSupportClass_onceToken, &__block_literal_global_90);
  }
  mach_port_t v0 = (void *)DMCLKLogoutSupportClass_LKLogoutSupportClass;
  return v0;
}

uint64_t __DMCLKLogoutSupportClass_block_invoke()
{
  if (LoginKitBundle_onceToken != -1) {
    dispatch_once(&LoginKitBundle_onceToken, &__block_literal_global_151);
  }
  uint64_t result = [(id)LoginKitBundle_retval classNamed:@"LKLogoutSupport"];
  DMCLKLogoutSupportClass_LKLogoutSupportClass = result;
  return result;
}

uint64_t DMCBYSetupAssistantNeedsToRun()
{
  +[DMCLazyInitializationUtilities initSetupAssistant];
  mach_port_t v0 = (uint64_t (*)(void))_BYSetupAssistantNeedsToRun;
  return v0();
}

id DMCBYSetupAssistantFinishedDarwinNotification()
{
  +[DMCLazyInitializationUtilities initSetupAssistant];
  mach_port_t v0 = (void *)_BYSetupAssistantFinishedDarwinNotification;
  return v0;
}

uint64_t DMCSBUserNotificationDismissOnLock()
{
  return _SBUserNotificationDismissOnLock;
}

uint64_t DMCSBUserNotificationDontDismissOnUnlock()
{
  return _SBUserNotificationDontDismissOnUnlock;
}

id DMCUMUserManagerClass()
{
  if (DMCUMUserManagerClass_onceToken != -1) {
    dispatch_once(&DMCUMUserManagerClass_onceToken, &__block_literal_global_96);
  }
  mach_port_t v0 = (void *)DMCUMUserManagerClass_theClass;
  return v0;
}

void __DMCUMUserManagerClass_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  mach_port_t v0 = UserManagementBundle();
  DMCUMUserManagerClass_theClass = [v0 classNamed:@"UMUserManager"];

  if (!DMCUMUserManagerClass_theClass)
  {
    id v1 = *DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v2 = 138543362;
      io_object_t v3 = @"UMUserManager";
      _os_log_impl(&dword_1A7863000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v2, 0xCu);
    }
  }
}

id UserManagementBundle()
{
  if (UserManagementBundle_onceToken != -1) {
    dispatch_once(&UserManagementBundle_onceToken, &__block_literal_global_156);
  }
  mach_port_t v0 = (void *)UserManagementBundle_retval;
  return v0;
}

id DMCUMUserSwitchBlockingTaskClass()
{
  if (DMCUMUserSwitchBlockingTaskClass_onceToken != -1) {
    dispatch_once(&DMCUMUserSwitchBlockingTaskClass_onceToken, &__block_literal_global_101);
  }
  mach_port_t v0 = (void *)DMCUMUserSwitchBlockingTaskClass_theClass;
  return v0;
}

void __DMCUMUserSwitchBlockingTaskClass_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  mach_port_t v0 = UserManagementBundle();
  DMCUMUserSwitchBlockingTaskClass_theClass = [v0 classNamed:@"UMUserSwitchBlockingTask"];

  if (!DMCUMUserSwitchBlockingTaskClass_theClass)
  {
    id v1 = *DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v2 = 138543362;
      io_object_t v3 = @"UMUserSwitchBlockingTask";
      _os_log_impl(&dword_1A7863000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v2, 0xCu);
    }
  }
}

id DMCUMUserManagerErrorDomain()
{
  +[DMCLazyInitializationUtilities initUserManagement];
  mach_port_t v0 = (void *)_UMUserManagerErrorDomain;
  return v0;
}

id DMCUMUserSessionProvisionTypeKey()
{
  +[DMCLazyInitializationUtilities initUserManagement];
  mach_port_t v0 = (void *)_kUMUserSessionProvisionTypeKey;
  return v0;
}

id DMCUMUserSessionProvisionTypeEducation()
{
  +[DMCLazyInitializationUtilities initUserManagement];
  mach_port_t v0 = (void *)_kUMUserSessionProvisionTypeEducation;
  return v0;
}

id DMCUMEducationUserSizeKey()
{
  +[DMCLazyInitializationUtilities initUserManagement];
  mach_port_t v0 = (void *)_kUMEducationUserSizeKey;
  return v0;
}

id DMCAKAppleIDSession()
{
  if (DMCAKAppleIDSession_onceToken != -1) {
    dispatch_once(&DMCAKAppleIDSession_onceToken, &__block_literal_global_106);
  }
  mach_port_t v0 = (void *)DMCAKAppleIDSession_theClass;
  return v0;
}

void __DMCAKAppleIDSession_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  mach_port_t v0 = AuthKitBundle();
  DMCAKAppleIDSession_theClass = [v0 classNamed:@"AKAppleIDSession"];

  if (!DMCAKAppleIDSession_theClass)
  {
    id v1 = *DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v2 = 138543362;
      io_object_t v3 = @"AKAppleIDSession";
      _os_log_impl(&dword_1A7863000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v2, 0xCu);
    }
  }
}

id AuthKitBundle()
{
  if (AuthKitBundle_onceToken != -1) {
    dispatch_once(&AuthKitBundle_onceToken, &__block_literal_global_160);
  }
  mach_port_t v0 = (void *)AuthKitBundle_retval;
  return v0;
}

id DMCAKAuthenticationUsernameKey()
{
  +[DMCLazyInitializationUtilities initAuthKit];
  mach_port_t v0 = (void *)_AKAuthenticationUsernameKey;
  return v0;
}

id DMCAKAuthenticationPasswordKey()
{
  +[DMCLazyInitializationUtilities initAuthKit];
  mach_port_t v0 = (void *)_AKAuthenticationPasswordKey;
  return v0;
}

id DMCAKAuthenticationAlternateDSIDKey()
{
  +[DMCLazyInitializationUtilities initAuthKit];
  mach_port_t v0 = (void *)_AKAuthenticationAlternateDSIDKey;
  return v0;
}

id DMCAKAuthenticationDSIDKey()
{
  +[DMCLazyInitializationUtilities initAuthKit];
  mach_port_t v0 = (void *)_AKAuthenticationDSIDKey;
  return v0;
}

id DMCAKAuthenticationIDMSTokenKey()
{
  +[DMCLazyInitializationUtilities initAuthKit];
  mach_port_t v0 = (void *)_AKAuthenticationIDMSTokenKey;
  return v0;
}

id DMCAKAnisetteProvisioningControllerClass()
{
  mach_port_t v0 = AuthKitBundle();
  id v1 = [v0 classNamed:@"AKAnisetteProvisioningController"];

  return v1;
}

id DMCAIDAMutableServiceContextClass()
{
  mach_port_t v0 = AppleIDSSOAuthenticationBundle();
  id v1 = [v0 classNamed:@"AIDAMutableServiceContext"];

  return v1;
}

id AppleIDSSOAuthenticationBundle()
{
  if (AppleIDSSOAuthenticationBundle_onceToken != -1) {
    dispatch_once(&AppleIDSSOAuthenticationBundle_onceToken, &__block_literal_global_164);
  }
  mach_port_t v0 = (void *)AppleIDSSOAuthenticationBundle_retval;
  return v0;
}

id DMCAIDAServiceOwnersManagerClass()
{
  mach_port_t v0 = AppleIDSSOAuthenticationBundle();
  id v1 = [v0 classNamed:@"AIDAServiceOwnersManager"];

  return v1;
}

id DMCAIDAServiceTypeCloud()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication];
  mach_port_t v0 = (void *)_AIDAServiceTypeCloud;
  return v0;
}

id DMCAIDAServiceTypeMessages()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication];
  mach_port_t v0 = (void *)_AIDAServiceTypeMessages;
  return v0;
}

id DMCAIDAServiceTypeFaceTime()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication];
  mach_port_t v0 = (void *)_AIDAServiceTypeFaceTime;
  return v0;
}

id DMCAIDAServiceTypeStore()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication];
  mach_port_t v0 = (void *)_AIDAServiceTypeStore;
  return v0;
}

id DMCAIDAServiceTypeGameCenter()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication];
  mach_port_t v0 = (void *)_AIDAServiceTypeGameCenter;
  return v0;
}

uint64_t DMCAMSAuthenticateOptionsClass()
{
  if (AppleMediaServicesBundle_onceToken != -1) {
    dispatch_once(&AppleMediaServicesBundle_onceToken, &__block_literal_global_168);
  }
  mach_port_t v0 = (void *)AppleMediaServicesBundle_retval;
  return [v0 classNamed:@"AMSAuthenticateOptions"];
}

uint64_t DMCAMSUIAuthenticateTaskClass()
{
  if (AppleMediaServicesUIBundle_onceToken != -1) {
    dispatch_once(&AppleMediaServicesUIBundle_onceToken, &__block_literal_global_172);
  }
  mach_port_t v0 = (void *)AppleMediaServicesUIBundle_retval;
  return [v0 classNamed:@"AMSUIAuthenticateTask"];
}

id DMCkMAActivationStateActivated()
{
  +[DMCLazyInitializationUtilities initMobileActivation];
  mach_port_t v0 = (void *)_kMAActivationStateActivated;
  return v0;
}

id DMCkNotificationActivationStateChanged()
{
  +[DMCLazyInitializationUtilities initMobileActivation];
  mach_port_t v0 = (void *)_kNotificationActivationStateChanged;
  return v0;
}

uint64_t DMCMAEGetActivationStateWithError(uint64_t a1)
{
  +[DMCLazyInitializationUtilities initMobileActivation];
  int v2 = (uint64_t (*)(uint64_t))_MAEGetActivationStateWithError;
  return v2(a1);
}

uint64_t DMCMAECopyActivationRecordWithError(uint64_t a1)
{
  +[DMCLazyInitializationUtilities initMobileActivation];
  int v2 = (uint64_t (*)(uint64_t))_MAECopyActivationRecordWithError;
  return v2(a1);
}

void __LoginKitBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/LoginKit.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DMCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_154];
}

void __LoginKitBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __UserManagementBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/UserManagement.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DMCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_158];
}

void __UserManagementBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __AuthKitBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AuthKit.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DMCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_162];
}

void __AuthKitBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __AppleIDSSOAuthenticationBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AppleIDSSOAuthentication.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DMCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_166];
}

void __AppleIDSSOAuthenticationBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __AppleMediaServicesBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AppleMediaServices.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DMCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_170];
}

void __AppleMediaServicesBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __AppleMediaServicesUIBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DMCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_174];
}

void __AppleMediaServicesUIBundle_block_invoke_2(int a1, int a2, id obj)
{
}

BOOL DMCIsDeviceLocked()
{
  int v0 = MKBGetDeviceLockState();
  return v0 != 3 && v0 != 0;
}

uint64_t DMCLockdownSetDeviceName(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (![v1 length])
  {
LABEL_6:
    uint64_t v2 = 0;
    goto LABEL_7;
  }
  uint64_t v2 = lockdown_connect();
  if (v2)
  {
    int v3 = lockdown_set_value();
    lockdown_disconnect();
    if (!v3)
    {
      uint64_t v2 = 1;
      goto LABEL_7;
    }
    uint64_t v4 = *DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_ERROR, "Unable to set device name with error %d", (uint8_t *)v6, 8u);
    }
    goto LABEL_6;
  }
LABEL_7:

  return v2;
}

uint64_t DMCHasMDMMigrated()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  char v6 = 0;
  if (migrationCheckQueue_onceToken != -1) {
    dispatch_once(&migrationCheckQueue_onceToken, &__block_literal_global_12);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __DMCHasMDMMigrated_block_invoke;
  block[3] = &unk_1E5CFD440;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)migrationCheckQueue_queue, block);
  uint64_t v0 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v0;
}

void __DMCHasMDMMigrated_block_invoke(uint64_t a1)
{
  if (kMDMMetaLastMigratedBuildKey_block_invoke_migrationCheckQueueHasMDMMigrated)
  {
    char v2 = 1;
    goto LABEL_12;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v4 = MCSystemMetadataFilePath();
  uint64_t v5 = [v3 dataWithContentsOfFile:v4];

  if (!v5) {
    goto LABEL_7;
  }
  char v6 = [MEMORY[0x1E4F28F98] DMCSafePropertyListWithData:v5 options:0 format:0 error:0];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_7:
      char v6 = 0;
    }
  }
  uint64_t v7 = [v6 objectForKey:@"LastMDMMigratedBuild"];
  mach_port_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = MCLegacyMetadataFilePath();
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    kMDMMetaLastMigratedBuildKey_block_invoke_migrationCheckQueueHasMDMMigrated = 0;
  }
  else
  {
    uint64_t v11 = +[DMCMobileGestalt buildVersion];
    kMDMMetaLastMigratedBuildKey_block_invoke_migrationCheckQueueHasMDMMigrated = [v7 isEqualToString:v11];
  }
  char v2 = kMDMMetaLastMigratedBuildKey_block_invoke_migrationCheckQueueHasMDMMigrated;
LABEL_12:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
}

void __migrationCheckQueue_block_invoke()
{
  char v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("DMC migration check queue", v2);
  id v1 = (void *)migrationCheckQueue_queue;
  migrationCheckQueue_queue = (uint64_t)v0;
}

void sub_1A78878E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
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

uint64_t DMCDeviceIsNetworkTethered()
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v0 = SCPreferencesCreate(0, @"MCNetworkTetherUtilities", 0);
  if (!v0) {
    return 0;
  }
  id v1 = v0;
  char v2 = SCNetworkSetCopyCurrent(v0);
  if (!v2)
  {
    v81 = DMCLogObjects()[5];
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v81, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: No network set!", buf, 2u);
    }
    uint64_t v80 = 0;
    goto LABEL_131;
  }
  uint64_t v3 = v2;
  SCNetworkSetGetServiceOrder(v2);
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v115 = [obj countByEnumeratingWithState:&v116 objects:v124 count:16];
  if (!v115)
  {
    uint64_t v80 = 0;
    goto LABEL_130;
  }
  v94 = v3;
  uint64_t v114 = *(void *)v117;
  uint64_t v4 = (const void *)*MEMORY[0x1E4F41B50];
  CFStringRef domain = (const __CFString *)*MEMORY[0x1E4F41AC8];
  CFStringRef v110 = (const __CFString *)*MEMORY[0x1E4F41B28];
  v107 = (const void *)*MEMORY[0x1E4F1CFD0];
  key = (void *)*MEMORY[0x1E4F41D30];
  CFStringRef protocolType = (const __CFString *)*MEMORY[0x1E4F41B88];
  uint64_t v95 = *MEMORY[0x1E4F420A0];
  uint64_t v96 = *MEMORY[0x1E4F41C70];
  CFStringRef v91 = (const __CFString *)*MEMORY[0x1E4F41B10];
  CFStringRef v92 = (const __CFString *)*MEMORY[0x1E4F41AB8];
  CFStringRef v98 = (const __CFString *)*MEMORY[0x1E4F41B90];
  v112 = v1;
LABEL_5:
  uint64_t v5 = 0;
  while (1)
  {
    if (*(void *)v117 != v114) {
      objc_enumerationMutation(obj);
    }
    char v6 = *(__CFString **)(*((void *)&v116 + 1) + 8 * v5);
    uint64_t v7 = DMCLogObjects()[5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v6;
      _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Checking service ID %{public}@", buf, 0xCu);
    }
    SCNetworkServiceRef v8 = SCNetworkServiceCopy(v1, v6);
    if (v8) {
      break;
    }
    uint64_t v16 = DMCLogObjects()[5];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v6;
      _os_log_impl(&dword_1A7863000, v16, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Cannot get service ref for service ID %{public}@", buf, 0xCu);
    }
LABEL_58:
    if (++v5 == v115)
    {
      uint64_t v79 = [obj countByEnumeratingWithState:&v116 objects:v124 count:16];
      uint64_t v115 = v79;
      if (!v79)
      {
        uint64_t v80 = 0;
        uint64_t v3 = v94;
        goto LABEL_130;
      }
      goto LABEL_5;
    }
  }
  SCNetworkServiceRef v9 = v8;
  int v10 = v6;
  if (!SCNetworkServiceGetEnabled(v9))
  {
    int v17 = DMCLogObjects()[5];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      id v18 = v17;
      unsigned int v19 = "DMCDeviceIsNetworkTethered: service ID %{public}@ is not enabled";
LABEL_56:
      _os_log_impl(&dword_1A7863000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0xCu);
    }
LABEL_57:

    CFRelease(v9);
    goto LABEL_58;
  }
  SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(v9);
  uint64_t v12 = DMCLogObjects()[5];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v126 = (__CFString *)v9;
    _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_DEBUG, "_getBaseInterfaceForService(%{public}@)", buf, 0xCu);
  }
  for (id i = Interface; ; id i = v14)
  {
    uint64_t v14 = Interface;
    uint64_t v15 = DMCLogObjects()[5];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = (__CFString *)v14;
      _os_log_impl(&dword_1A7863000, v15, OS_LOG_TYPE_DEBUG, "_getBaseInterfaceForService: Candidate interface %{public}@", buf, 0xCu);
    }
    if (!v14)
    {
      if (i) {
        goto LABEL_30;
      }
      id v20 = DMCLogObjects()[5];
      id v1 = v112;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_57;
      }
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      id v18 = v20;
      unsigned int v19 = "DMCDeviceIsNetworkTethered: cannot get interface for service ID %{public}@";
      goto LABEL_56;
    }
    if (CFEqual(v14, v4)) {
      break;
    }
    SCNetworkInterfaceRef Interface = SCNetworkInterfaceGetInterface(v14);
  }
  id v21 = DMCLogObjects()[5];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7863000, v21, OS_LOG_TYPE_DEBUG, "_getBaseInterfaceForService: Candidate interface is a good IPv4 interface", buf, 2u);
  }
  id i = v14;
LABEL_30:
  id v22 = DMCLogObjects()[5];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v23 = v22;
    IOInterfaceType = (__CFString *)_SCNetworkInterfaceGetIOInterfaceType();
    *(_DWORD *)buf = 138543362;
    v126 = IOInterfaceType;
    __int16 v25 = IOInterfaceType;
    _os_log_impl(&dword_1A7863000, v23, OS_LOG_TYPE_DEBUG, "Interface type: %{public}@", buf, 0xCu);
  }
  id v26 = DMCLogObjects()[5];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = v26;
    FamilyType = (__CFString *)_SCNetworkInterfaceGetFamilyType();
    *(_DWORD *)buf = 138543362;
    v126 = FamilyType;
    id v29 = FamilyType;
    _os_log_impl(&dword_1A7863000, v27, OS_LOG_TYPE_DEBUG, "Interface family: %{public}@", buf, 0xCu);
  }
  id v30 = DMCLogObjects()[5];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    id v31 = v30;
    FamilySubType = (__CFString *)_SCNetworkInterfaceGetFamilySubType();
    *(_DWORD *)buf = 138543362;
    v126 = FamilySubType;
    __int16 v33 = FamilySubType;
    _os_log_impl(&dword_1A7863000, v31, OS_LOG_TYPE_DEBUG, "Interface family sub-type: %{public}@", buf, 0xCu);
  }
  if ([(id)_SCNetworkInterfaceGetIOInterfaceType() intValue] != 6)
  {
    v49 = DMCLogObjects()[5];
    id v1 = v112;
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 138543362;
    v126 = v10;
    id v18 = v49;
    unsigned int v19 = "DMCDeviceIsNetworkTethered: service ID %{public}@ is not USB Ethernet";
    goto LABEL_56;
  }
  CFStringRef BSDName = SCNetworkInterfaceGetBSDName(i);
  __int16 v35 = DMCLogObjects()[5];
  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
  if (!BSDName)
  {
    id v1 = v112;
    if (!v36) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 138543362;
    v126 = v10;
    id v18 = v35;
    unsigned int v19 = "DMCDeviceIsNetworkTethered: could not get BSD name from service ID %{public}@";
    goto LABEL_56;
  }
  if (v36)
  {
    *(_DWORD *)buf = 138543618;
    v126 = v10;
    __int16 v127 = 2114;
    v128 = (void *)BSDName;
    _os_log_impl(&dword_1A7863000, v35, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: BSD name from service ID %{public}@ is: %{public}@", buf, 0x16u);
  }
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, domain, BSDName, v110);
  if (!NetworkInterfaceEntity)
  {
    v50 = DMCLogObjects()[5];
    id v1 = v112;
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 138543362;
    v126 = v10;
    id v18 = v50;
    unsigned int v19 = "DMCDeviceIsNetworkTethered: could not network link from service ID %{public}@";
    goto LABEL_56;
  }
  CFStringRef v38 = NetworkInterfaceEntity;
  id v39 = SCDynamicStoreCreate(0, @"MCNetworkTetherUtilities", 0, 0);
  if (!v39)
  {
    v51 = DMCLogObjects()[5];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v51, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: could not create dynamic store!", buf, 2u);
    }
LABEL_62:
    CFStringRef v52 = v38;
LABEL_66:
    CFRelease(v52);

    goto LABEL_67;
  }
  id v40 = v39;
  CFStringRef cf = v38;
  CFDictionaryRef v41 = (const __CFDictionary *)SCDynamicStoreCopyValue(v39, v38);
  id v42 = DMCLogObjects()[5];
  BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG);
  CFDictionaryRef theDict = v41;
  if (!v41)
  {
    if (v43)
    {
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      _os_log_impl(&dword_1A7863000, v42, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: could not get network link info from service ID %{public}@", buf, 0xCu);
    }
    CFRelease(v40);
    CFStringRef v52 = cf;
    goto LABEL_66;
  }
  if (v43)
  {
    *(_DWORD *)buf = 138543618;
    v126 = v10;
    __int16 v127 = 2114;
    v128 = v41;
    _os_log_impl(&dword_1A7863000, v42, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: service ID %{public}@ has netlink info: %{public}@", buf, 0x16u);
  }
  Value = CFDictionaryGetValue(v41, key);
  CFStringRef v38 = cf;
  if (v107 != Value)
  {
    __int16 v45 = v40;
    id v46 = DMCLogObjects()[5];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      uint64_t v47 = v46;
      v48 = "DMCDeviceIsNetworkTethered: netlink for service ID %{public}@ is not active";
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  SCNetworkProtocolRef v53 = SCNetworkServiceCopyProtocol(v9, protocolType);
  if (!v53)
  {
    __int16 v45 = v40;
    v63 = DMCLogObjects()[5];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      uint64_t v47 = v63;
      v48 = "DMCDeviceIsNetworkTethered: could not get IPv4 info for service ID %{public}@";
LABEL_48:
      _os_log_impl(&dword_1A7863000, v47, OS_LOG_TYPE_DEBUG, v48, buf, 0xCu);
    }
LABEL_49:
    CFRelease(theDict);
    CFRelease(v45);
    goto LABEL_62;
  }
  v54 = v53;
  store = v40;
  v55 = v10;
  SCNetworkProtocolGetConfiguration(v54);
  v57 = v56 = v54;
  v101 = v56;
  if (!v57 || !SCNetworkProtocolGetEnabled(v56))
  {
    v62 = DMCLogObjects()[5];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v129 = 0;
      _os_log_impl(&dword_1A7863000, v62, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Unable to get IPv4 info and/or it's disabled", v129, 2u);
    }

    v61 = v55;
    goto LABEL_105;
  }
  v58 = DMCLogObjects()[5];
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v129 = 138543362;
    CFArrayRef v130 = (CFArrayRef)v57;
    _os_log_impl(&dword_1A7863000, v58, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: IPv4 info: %{public}@", v129, 0xCu);
  }
  v97 = v57;
  objc_msgSend(v57, "objectForKey:", v96, v90);
  CFArrayRef v59 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v60 = DMCLogObjects()[5];
  v61 = v55;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v129 = 138543362;
    CFArrayRef v130 = v59;
    _os_log_impl(&dword_1A7863000, v60, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: IPv4 config method: %{public}@", v129, 0xCu);
  }
  if (![(__CFArray *)v59 isEqualToString:v95])
  {
    uint64_t v64 = _isIPv4ConfigMethodAutomatic_onceToken;
    CFArrayRef v93 = v59;
    if (v64 != -1) {
      dispatch_once(&_isIPv4ConfigMethodAutomatic_onceToken, &__block_literal_global_15);
    }
    int v65 = [(id)_isIPv4ConfigMethodAutomatic_ipv4DynamicConfigMethods containsObject:v93];

    if (v65)
    {
      CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, domain, v92, v91);
      if (NetworkServiceEntity)
      {
        v104 = v55;
        CFStringRef v90 = NetworkServiceEntity;
        CFArrayRef v67 = SCDynamicStoreCopyKeyList(store, NetworkServiceEntity);
        v68 = DMCLogObjects()[5];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v129 = 138543362;
          CFArrayRef v130 = v67;
          _os_log_impl(&dword_1A7863000, v68, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv4 keys: %{public}@", v129, 0xCu);
        }
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        CFArrayRef v99 = v67;
        uint64_t v103 = [(__CFArray *)v99 countByEnumeratingWithState:&v120 objects:buf count:16];
        if (v103)
        {
          uint64_t v102 = *(void *)v121;
          while (2)
          {
            for (uint64_t j = 0; j != v103; ++j)
            {
              if (*(void *)v121 != v102) {
                objc_enumerationMutation(v99);
              }
              CFStringRef v70 = *(const __CFString **)(*((void *)&v120 + 1) + 8 * j);
              v71 = _serviceIDFromDynamicStoreKey((uint64_t)v70);
              if ([v71 isEqualToString:v104])
              {
                CFArrayRef v72 = (const __CFArray *)SCDynamicStoreCopyValue(store, v70);
                v73 = DMCLogObjects()[5];
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v129 = 138543362;
                  CFArrayRef v130 = v72;
                  _os_log_impl(&dword_1A7863000, v73, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv4 service dict: %{public}@", v129, 0xCu);
                }
                if (_isIPv4ConfigInfoUseful(v72))
                {
                  v82 = DMCLogObjects()[5];
                  uint64_t v3 = v94;
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)v129 = 0;
                    _os_log_impl(&dword_1A7863000, v82, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got useful dynamic IPv4 config!", v129, 2u);
                  }

                  CFRelease(v90);
                  v61 = v104;

                  goto LABEL_122;
                }
              }
            }
            uint64_t v103 = -[__CFArray countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v120, buf, 16, v90);
            if (v103) {
              continue;
            }
            break;
          }
        }

        CFRelease(v90);
        v61 = v104;
        goto LABEL_105;
      }
      v74 = DMCLogObjects()[5];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v129 = 0;
        _os_log_impl(&dword_1A7863000, v74, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Unable to create network service entry", v129, 2u);
      }
    }
    goto LABEL_104;
  }
  if (!_isIPv4ConfigInfoUseful(v97))
  {
LABEL_104:

LABEL_105:
    v75 = SCNetworkServiceCopyProtocol(v9, v98);
    if (v75)
    {
      v76 = v75;
      if (_isUsefulIPv6Protocol(v75, store, v61))
      {
        v85 = DMCLogObjects()[5];
        uint64_t v3 = v94;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v126 = v61;
          _os_log_impl(&dword_1A7863000, v85, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: got useful IPv6 info for service ID %{public}@!", buf, 0xCu);
        }
        CFRelease(v76);
        v84 = v101;
        goto LABEL_127;
      }
      CFRelease(v76);
      CFRelease(v101);
      CFRelease(theDict);
      v77 = store;
    }
    else
    {
      v78 = DMCLogObjects()[5];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v126 = v61;
        _os_log_impl(&dword_1A7863000, v78, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: could not get IPv6 info for service ID %{public}@", buf, 0xCu);
      }
      CFRelease(v101);
      CFRelease(theDict);
      v77 = store;
    }
    CFRelease(v77);
    CFRelease(cf);

LABEL_67:
    CFRelease(v9);
    id v1 = v112;
    goto LABEL_58;
  }
  v88 = DMCLogObjects()[5];
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v129 = 0;
    _os_log_impl(&dword_1A7863000, v88, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got useful manual config of IPv4!", v129, 2u);
  }

  uint64_t v3 = v94;
LABEL_122:
  v83 = DMCLogObjects()[5];
  v84 = v101;
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v126 = v61;
    _os_log_impl(&dword_1A7863000, v83, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: got useful IPv4 info for service ID %{public}@!", buf, 0xCu);
  }
LABEL_127:
  CFRelease(v84);
  CFRelease(theDict);
  CFRelease(store);
  CFRelease(cf);

  CFRelease(v9);
  v86 = DMCLogObjects()[5];
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v126 = v61;
    _os_log_impl(&dword_1A7863000, v86, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Found tethered Ethernet at Service ID %{public}@!!", buf, 0xCu);
  }
  uint64_t v80 = 1;
  id v1 = v112;
LABEL_130:

  CFRelease(v3);
LABEL_131:
  CFRelease(v1);
  return v80;
}

BOOL _isIPv4ConfigInfoUseful(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  char v2 = [v1 objectForKey:*MEMORY[0x1E4F41C60]];
  uint64_t v3 = [v1 objectForKey:*MEMORY[0x1E4F41CB0]];
  uint64_t v4 = DMCLogObjects()[5];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    int v17 = v2;
    _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv4 addresses: %{public}@", buf, 0xCu);
  }
  uint64_t v5 = DMCLogObjects()[5];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    int v17 = v3;
    _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv4 netmasks: %{public}@", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___isIPv4ConfigInfoUseful_block_invoke;
  v9[3] = &unk_1E5CFDFB0;
  id v6 = v3;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v2 enumerateObjectsUsingBlock:v9];
  BOOL v7 = *((unsigned char *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_1A7888E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___isIPv4ConfigInfoUseful_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  SCNetworkServiceRef v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
  id v9 = v7;
  if ([v9 length] && objc_msgSend(v8, "length"))
  {
    HIDWORD(v12[0]) = 0;
    v12[1] = 0;
    id v10 = v9;
    if (inet_pton(2, (const char *)[v10 UTF8String], (char *)v12 + 4) >= 1
      && BYTE4(v12[0])
      && BYTE4(v12[0]) != 127)
    {
      int v11 = WORD2(v12[0]);

      if (v11 != 65193)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
    else
    {
    }
  }
  else
  {
  }
}

BOOL _isIPv6ConfigInfoUseful(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  char v2 = [v1 objectForKey:*MEMORY[0x1E4F41CC0]];
  uint64_t v3 = [v1 objectForKey:*MEMORY[0x1E4F41CE8]];
  uint64_t v4 = DMCLogObjects()[5];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    int v17 = v2;
    _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv6 addresses: %{public}@", buf, 0xCu);
  }
  uint64_t v5 = DMCLogObjects()[5];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    int v17 = v3;
    _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv6 netmasks: %{public}@", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___isIPv6ConfigInfoUseful_block_invoke;
  v9[3] = &unk_1E5CFDFB0;
  id v6 = v3;
  id v10 = v6;
  int v11 = &v12;
  [v2 enumerateObjectsUsingBlock:v9];
  BOOL v7 = *((unsigned char *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_1A7889134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___isIPv6ConfigInfoUseful_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  SCNetworkServiceRef v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
  id v9 = v7;
  uint64_t v10 = [v9 length];
  if (v8) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    long long v14 = 0uLL;
    int v15 = 0;
    id v12 = v9;
    if (inet_pton(30, (const char *)objc_msgSend(v12, "UTF8String", 0), &v14) >= 1)
    {
      if (v14)
      {
        if (v14 == 254)
        {
          int v13 = v14 & 0xC000;

          if (v13 == 0x8000) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
LABEL_14:

LABEL_15:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_17;
      }
      if (*(void *)((char *)&v14 + 4) || (HIDWORD(v14) & 0xFEFFFFFF) != 0) {
        goto LABEL_14;
      }
    }

    goto LABEL_17;
  }

LABEL_17:
}

BOOL _isUsefulIPv6Protocol(const __SCNetworkProtocol *a1, const __SCDynamicStore *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  SCNetworkProtocolGetConfiguration(a1);
  CFArrayRef v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (v6 && SCNetworkProtocolGetEnabled(a1))
  {
    id v7 = DMCLogObjects()[5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFArrayRef v34 = v6;
      _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv6 info: %{public}@", buf, 0xCu);
    }
    SCNetworkServiceRef v8 = [(__CFArray *)v6 objectForKey:*MEMORY[0x1E4F41CC8]];
    if ([v8 isEqualToString:*MEMORY[0x1E4F420C0]])
    {
      if (_isIPv6ConfigInfoUseful(v6))
      {
        id v9 = DMCLogObjects()[5];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7863000, v9, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got useful IPv6 manual config!", buf, 2u);
        }
        CFStringRef v10 = 0;
        int v11 = 1;
        goto LABEL_37;
      }
    }
    else if ([v8 isEqualToString:*MEMORY[0x1E4F420B0]])
    {
      CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41B18]);
      if (NetworkServiceEntity)
      {
        CFStringRef v10 = NetworkServiceEntity;
        CFArrayRef v15 = SCDynamicStoreCopyKeyList(a2, NetworkServiceEntity);
        uint64_t v16 = DMCLogObjects()[5];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          CFArrayRef v34 = v15;
          _os_log_impl(&dword_1A7863000, v16, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv6 keys: %{public}@", buf, 0xCu);
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        CFArrayRef v17 = v15;
        uint64_t v18 = [(__CFArray *)v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v27 = v8;
          uint64_t v20 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v29 != v20) {
                objc_enumerationMutation(v17);
              }
              _serviceIDFromDynamicStoreKey(*(void *)(*((void *)&v28 + 1) + 8 * i));
              id v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if ([(__CFString *)v22 isEqualToString:v5])
              {
                int v23 = (void *)SCDynamicStoreCopyValue(a2, v22);
                if (_isIPv6ConfigInfoUseful(v23))
                {
                  __int16 v25 = DMCLogObjects()[5];
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1A7863000, v25, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got useful dynamic IPv6 config!", buf, 2u);
                  }

                  int v11 = 1;
                  goto LABEL_34;
                }
              }
            }
            uint64_t v19 = [(__CFArray *)v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v19) {
              continue;
            }
            break;
          }
          int v11 = 0;
LABEL_34:
          SCNetworkServiceRef v8 = v27;
        }
        else
        {
          int v11 = 0;
        }

        goto LABEL_37;
      }
      id v24 = DMCLogObjects()[5];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7863000, v24, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Unable to create network service entry", buf, 2u);
      }
    }
    CFStringRef v10 = 0;
    int v11 = 0;
LABEL_37:

    BOOL v13 = v11 != 0;
    if (v10) {
      CFRelease(v10);
    }
    goto LABEL_39;
  }
  id v12 = DMCLogObjects()[5];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Unable to get IPv6 info and/or it's disabled", buf, 2u);
  }

  BOOL v13 = 0;
LABEL_39:

  return v13;
}

id _serviceIDFromDynamicStoreKey(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F28FE8] scannerWithString:a1];
  char v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/"];
  uint64_t v3 = 0;
  if ([v1 scanUpToString:@"/Network/Service/" intoString:0])
  {
    uint64_t v3 = 0;
    if ([v1 scanString:@"/Network/Service/" intoString:0])
    {
      id v7 = 0;
      char v4 = [v1 scanUpToCharactersFromSet:v2 intoString:&v7];
      id v5 = v7;
      uint64_t v3 = v5;
      if ((v4 & 1) == 0)
      {

        uint64_t v3 = 0;
      }
    }
  }

  return v3;
}

void ___isIPv4ConfigMethodAutomatic_block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F42098];
  v6[0] = *MEMORY[0x1E4F42090];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F420A8];
  _DWORD v6[2] = *MEMORY[0x1E4F42088];
  v6[3] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  id v5 = (void *)_isIPv4ConfigMethodAutomatic_ipv4DynamicConfigMethods;
  _isIPv4ConfigMethodAutomatic_ipv4DynamicConfigMethods = v4;
}

uint64_t DMCSendSettingsChangedNotification()
{
  dispatch_queue_t v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1A7863000, v0, OS_LOG_TYPE_DEFAULT, "Sending settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.settingschanged" cStringUsingEncoding:4]);
}

uint64_t DMCSendUserSettingsChangedNotification()
{
  dispatch_queue_t v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1A7863000, v0, OS_LOG_TYPE_DEFAULT, "Sending user settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.usersettingschanged" cStringUsingEncoding:4]);
}

uint64_t DMCSendUPPTrustFailedNotification()
{
  dispatch_queue_t v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1A7863000, v0, OS_LOG_TYPE_DEFAULT, "Sending UPP trust failed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.devicemanagementclient.uppTrustFailed" cStringUsingEncoding:4]);
}

uint64_t DMCSendUPPVerificationOfflineNotification()
{
  dispatch_queue_t v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1A7863000, v0, OS_LOG_TYPE_DEFAULT, "Sending UPP verification offline notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.devicemanagementclient.uppVerificationOffline" cStringUsingEncoding:4]);
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

__CFString *DMCSystemRootDirectory()
{
  return @"/";
}

id DMCSystemContainerPathWithBundleIdentifier(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 UTF8String];
  uint64_t v1 = (void *)container_system_path_for_identifier();
  uint64_t v2 = *DMCLogObjects();
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v6 = (uint64_t)v1;
      _os_log_impl(&dword_1A7863000, v2, OS_LOG_TYPE_DEFAULT, "Got system container path from MCM: %{public}s", buf, 0xCu);
    }
    uint64_t v3 = [NSString stringWithCString:v1 encoding:4];
    free(v1);
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = 1;
      _os_log_impl(&dword_1A7863000, v2, OS_LOG_TYPE_ERROR, "Error getting system container: %llu", buf, 0xCu);
    }
    uint64_t v3 = 0;
  }
  return v3;
}

id MCSystemMetadataFilePath()
{
  if (MCSystemMetadataFilePath_once != -1) {
    dispatch_once(&MCSystemMetadataFilePath_once, &__block_literal_global_16);
  }
  dispatch_queue_t v0 = (void *)MCSystemMetadataFilePath_str;
  return v0;
}

void __MCSystemMetadataFilePath_block_invoke()
{
  if (MCSystemPublicInfoDirectory_once != -1) {
    dispatch_once(&MCSystemPublicInfoDirectory_once, &__block_literal_global_184);
  }
  id v0 = (id)MCSystemPublicInfoDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MCMeta.plist"];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)MCSystemMetadataFilePath_str;
  MCSystemMetadataFilePath_str = v1;
}

id MCUserMetadataFilePath()
{
  if (MCUserMetadataFilePath_once != -1) {
    dispatch_once(&MCUserMetadataFilePath_once, &__block_literal_global_6_0);
  }
  id v0 = (void *)MCUserMetadataFilePath_str;
  return v0;
}

void __MCUserMetadataFilePath_block_invoke()
{
  if (MCUserPublicInfoDirectory_once != -1) {
    dispatch_once(&MCUserPublicInfoDirectory_once, &__block_literal_global_189);
  }
  id v0 = (id)MCUserPublicInfoDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MCMeta.plist"];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)MCUserMetadataFilePath_str;
  MCUserMetadataFilePath_str = v1;
}

id MCLegacyMetadataFilePath()
{
  if (MCLegacyMetadataFilePath_once != -1) {
    dispatch_once(&MCLegacyMetadataFilePath_once, &__block_literal_global_8);
  }
  id v0 = (void *)MCLegacyMetadataFilePath_str;
  return v0;
}

void __MCLegacyMetadataFilePath_block_invoke()
{
  if (MCLegacyPublicInfoDirectory_once != -1) {
    dispatch_once(&MCLegacyPublicInfoDirectory_once, &__block_literal_global_191);
  }
  id v0 = (id)MCLegacyPublicInfoDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MCMeta.plist"];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)MCLegacyMetadataFilePath_str;
  MCLegacyMetadataFilePath_str = v1;
}

id DMCConfigurationProfilesSystemGroupContainerMetadataFilePath()
{
  if (DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_once != -1) {
    dispatch_once(&DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_once, &__block_literal_global_10);
  }
  id v0 = (void *)DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_str;
  return v0;
}

void __DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_block_invoke()
{
  MCConfigurationProfilesSystemGroupContainer();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v3 stringByAppendingPathComponent:@".com.apple.mobile_container_manager.metadata.plist"];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_str;
  DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_str = v1;
}

id DMCMultiUserDeviceConfigurationFilePath()
{
  if (DMCMultiUserDeviceConfigurationFilePath_once != -1) {
    dispatch_once(&DMCMultiUserDeviceConfigurationFilePath_once, &__block_literal_global_15);
  }
  id v0 = (void *)DMCMultiUserDeviceConfigurationFilePath_str;
  return v0;
}

void __DMCMultiUserDeviceConfigurationFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MultiUserDeviceConfiguration.plist"];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)DMCMultiUserDeviceConfigurationFilePath_str;
  DMCMultiUserDeviceConfigurationFilePath_str = v1;
}

id DMCMultiUserUserConfigurationFilePath()
{
  if (DMCMultiUserUserConfigurationFilePath_once != -1) {
    dispatch_once(&DMCMultiUserUserConfigurationFilePath_once, &__block_literal_global_20);
  }
  id v0 = (void *)DMCMultiUserUserConfigurationFilePath_str;
  return v0;
}

void __DMCMultiUserUserConfigurationFilePath_block_invoke()
{
  if (MCUserProfileStorageDirectory_once != -1) {
    dispatch_once(&MCUserProfileStorageDirectory_once, &__block_literal_global_212);
  }
  id v0 = (id)MCUserProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MultiUserUserConfiguration.plist"];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)DMCMultiUserUserConfigurationFilePath_str;
  DMCMultiUserUserConfigurationFilePath_str = v1;
}

id DMCHangTracerDirectory()
{
  if (DMCHangTracerDirectory_once != -1) {
    dispatch_once(&DMCHangTracerDirectory_once, &__block_literal_global_25);
  }
  id v0 = (void *)DMCHangTracerDirectory_str;
  return v0;
}

void __DMCHangTracerDirectory_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"HangTrace"];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)DMCHangTracerDirectory_str;
  DMCHangTracerDirectory_str = v1;
}

id DMCLoggingDirectory()
{
  if (DMCLoggingDirectory_once != -1) {
    dispatch_once(&DMCLoggingDirectory_once, &__block_literal_global_30);
  }
  id v0 = (void *)DMCLoggingDirectory_str;
  return v0;
}

void __DMCLoggingDirectory_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"Logging"];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)DMCLoggingDirectory_str;
  DMCLoggingDirectory_str = v1;
}

id DMCEventsFilePath()
{
  if (DMCEventsFilePath_once != -1) {
    dispatch_once(&DMCEventsFilePath_once, &__block_literal_global_35);
  }
  id v0 = (void *)DMCEventsFilePath_str;
  return v0;
}

void __DMCEventsFilePath_block_invoke()
{
  DMCLoggingDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v3 stringByAppendingPathComponent:@"DMCEvents.plist"];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)DMCEventsFilePath_str;
  DMCEventsFilePath_str = v1;
}

uint64_t DMCDiskManagementDirectory()
{
  return 0;
}

id DMCDiskRestrictionFilePath()
{
  if (DMCDiskRestrictionFilePath_once != -1) {
    dispatch_once(&DMCDiskRestrictionFilePath_once, &__block_literal_global_40);
  }
  id v0 = (void *)DMCDiskRestrictionFilePath_str;
  return v0;
}

void __DMCDiskRestrictionFilePath_block_invoke()
{
  id v2 = [0 stringByAppendingPathComponent:@"DiskManagement_Settings.plist"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)DMCDiskRestrictionFilePath_str;
  DMCDiskRestrictionFilePath_str = v0;
}

id DMCManagedEventsDaemonKeepAliveFilePath()
{
  if (DMCManagedEventsDaemonKeepAliveFilePath_once != -1) {
    dispatch_once(&DMCManagedEventsDaemonKeepAliveFilePath_once, &__block_literal_global_45);
  }
  uint64_t v0 = (void *)DMCManagedEventsDaemonKeepAliveFilePath_str;
  return v0;
}

void __DMCManagedEventsDaemonKeepAliveFilePath_block_invoke()
{
  id v2 = [0 stringByAppendingPathComponent:@"managedeventsd_alive_token"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)DMCManagedEventsDaemonKeepAliveFilePath_str;
  DMCManagedEventsDaemonKeepAliveFilePath_str = v0;
}

id DMCDeviceManagementDaemonSetupOptionDirectoryPath()
{
  if (DMCDeviceManagementDaemonSetupOptionDirectoryPath_once != -1) {
    dispatch_once(&DMCDeviceManagementDaemonSetupOptionDirectoryPath_once, &__block_literal_global_50);
  }
  uint64_t v0 = (void *)DMCDeviceManagementDaemonSetupOptionDirectoryPath_str;
  return v0;
}

uint64_t __DMCDeviceManagementDaemonSetupOptionDirectoryPath_block_invoke()
{
  DMCDeviceManagementDaemonSetupOptionDirectoryPath_str = [@"/private/var/mobile/Library/Application Support/com.apple.dmd-setup-option" copy];
  return MEMORY[0x1F41817F8]();
}

id MTiPCUKeychainMapPath()
{
  if (MTiPCUKeychainMapPath_once != -1) {
    dispatch_once(&MTiPCUKeychainMapPath_once, &__block_literal_global_55);
  }
  uint64_t v0 = (void *)MTiPCUKeychainMapPath_str;
  return v0;
}

void __MTiPCUKeychainMapPath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"KeyMapTable"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MTiPCUKeychainMapPath_str;
  MTiPCUKeychainMapPath_str = v1;
}

id DMCSystemLostModeRequestPath()
{
  if (DMCSystemLostModeRequestPath_once != -1) {
    dispatch_once(&DMCSystemLostModeRequestPath_once, &__block_literal_global_60);
  }
  id v0 = (void *)DMCSystemLostModeRequestPath_str;
  return v0;
}

void __DMCSystemLostModeRequestPath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"LostModeRequest.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)DMCSystemLostModeRequestPath_str;
  DMCSystemLostModeRequestPath_str = v1;
}

id MDMFilePath()
{
  if (MDMFilePath_once != -1) {
    dispatch_once(&MDMFilePath_once, &__block_literal_global_65);
  }
  id v0 = (void *)MDMFilePath_str;
  return v0;
}

void __MDMFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDM.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMFilePath_str;
  MDMFilePath_str = v1;
}

id MDMUserFilePath()
{
  if (MDMUserFilePath_once != -1) {
    dispatch_once(&MDMUserFilePath_once, &__block_literal_global_70);
  }
  id v0 = (void *)MDMUserFilePath_str;
  return v0;
}

void __MDMUserFilePath_block_invoke()
{
  if (MCUserProfileStorageDirectory_once != -1) {
    dispatch_once(&MCUserProfileStorageDirectory_once, &__block_literal_global_212);
  }
  id v0 = (id)MCUserProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDM.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMUserFilePath_str;
  MDMUserFilePath_str = v1;
}

id MDMPropertiesFilePath()
{
  if (MDMPropertiesFilePath_once != -1) {
    dispatch_once(&MDMPropertiesFilePath_once, &__block_literal_global_72);
  }
  id v0 = (void *)MDMPropertiesFilePath_str;
  return v0;
}

void __MDMPropertiesFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMProperties.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMPropertiesFilePath_str;
  MDMPropertiesFilePath_str = v1;
}

id MDMPropertiesUserFilePath()
{
  if (MDMPropertiesUserFilePath_once != -1) {
    dispatch_once(&MDMPropertiesUserFilePath_once, &__block_literal_global_77);
  }
  id v0 = (void *)MDMPropertiesUserFilePath_str;
  return v0;
}

void __MDMPropertiesUserFilePath_block_invoke()
{
  if (MCUserProfileStorageDirectory_once != -1) {
    dispatch_once(&MCUserProfileStorageDirectory_once, &__block_literal_global_212);
  }
  id v0 = (id)MCUserProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMProperties.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMPropertiesUserFilePath_str;
  MDMPropertiesUserFilePath_str = v1;
}

id MDMOutstandingActivitiesFilePath()
{
  if (MDMOutstandingActivitiesFilePath_once != -1) {
    dispatch_once(&MDMOutstandingActivitiesFilePath_once, &__block_literal_global_79);
  }
  id v0 = (void *)MDMOutstandingActivitiesFilePath_str;
  return v0;
}

void __MDMOutstandingActivitiesFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMOutstandingActivities.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMOutstandingActivitiesFilePath_str;
  MDMOutstandingActivitiesFilePath_str = v1;
}

id MDMDEPTokenSyncActivitiesFilePath()
{
  if (MDMDEPTokenSyncActivitiesFilePath_once != -1) {
    dispatch_once(&MDMDEPTokenSyncActivitiesFilePath_once, &__block_literal_global_84);
  }
  id v0 = (void *)MDMDEPTokenSyncActivitiesFilePath_str;
  return v0;
}

void __MDMDEPTokenSyncActivitiesFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMDEPTokenSyncActivities.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMDEPTokenSyncActivitiesFilePath_str;
  MDMDEPTokenSyncActivitiesFilePath_str = v1;
}

id MDMUserOutstandingActivitiesFilePath()
{
  if (MDMUserOutstandingActivitiesFilePath_once != -1) {
    dispatch_once(&MDMUserOutstandingActivitiesFilePath_once, &__block_literal_global_89);
  }
  id v0 = (void *)MDMUserOutstandingActivitiesFilePath_str;
  return v0;
}

void __MDMUserOutstandingActivitiesFilePath_block_invoke()
{
  if (MCUserProfileStorageDirectory_once != -1) {
    dispatch_once(&MCUserProfileStorageDirectory_once, &__block_literal_global_212);
  }
  id v0 = (id)MCUserProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMOutstandingActivities.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMUserOutstandingActivitiesFilePath_str;
  MDMUserOutstandingActivitiesFilePath_str = v1;
}

id MDMEventsFilePath()
{
  if (MDMEventsFilePath_once != -1) {
    dispatch_once(&MDMEventsFilePath_once, &__block_literal_global_96_0);
  }
  id v0 = (void *)MDMEventsFilePath_str;
  return v0;
}

void __MDMEventsFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMEvents.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMEventsFilePath_str;
  MDMEventsFilePath_str = v1;
}

id MDMDirtyEnrollmentStateFilePath()
{
  if (MDMDirtyEnrollmentStateFilePath_once != -1) {
    dispatch_once(&MDMDirtyEnrollmentStateFilePath_once, &__block_literal_global_101_0);
  }
  id v0 = (void *)MDMDirtyEnrollmentStateFilePath_str;
  return v0;
}

void __MDMDirtyEnrollmentStateFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMDirtyEnrollmentState.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMDirtyEnrollmentStateFilePath_str;
  MDMDirtyEnrollmentStateFilePath_str = v1;
}

id MDMPostSetupAutoInstallProfilePath()
{
  if (MDMPostSetupAutoInstallProfilePath_once != -1) {
    dispatch_once(&MDMPostSetupAutoInstallProfilePath_once, &__block_literal_global_116);
  }
  id v0 = (void *)MDMPostSetupAutoInstallProfilePath_str;
  return v0;
}

void __MDMPostSetupAutoInstallProfilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"PostSetupProfile.mobileconfig"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMPostSetupAutoInstallProfilePath_str;
  MDMPostSetupAutoInstallProfilePath_str = v1;
}

id MDMPostSetupAutoInstallSetAsideProfilePath()
{
  if (MDMPostSetupAutoInstallSetAsideProfilePath_once != -1) {
    dispatch_once(&MDMPostSetupAutoInstallSetAsideProfilePath_once, &__block_literal_global_121);
  }
  id v0 = (void *)MDMPostSetupAutoInstallSetAsideProfilePath_str;
  return v0;
}

void __MDMPostSetupAutoInstallSetAsideProfilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"PostSetupSetAsideProfile.mobileconfig"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMPostSetupAutoInstallSetAsideProfilePath_str;
  MDMPostSetupAutoInstallSetAsideProfilePath_str = v1;
}

id MDMSystemRestartLogPath()
{
  if (MDMSystemRestartLogPath_once != -1) {
    dispatch_once(&MDMSystemRestartLogPath_once, &__block_literal_global_126_0);
  }
  id v0 = (void *)MDMSystemRestartLogPath_str;
  return v0;
}

void __MDMSystemRestartLogPath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMRequestedRestart"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMSystemRestartLogPath_str;
  MDMSystemRestartLogPath_str = v1;
}

id MDMSystemShutDownLogPath()
{
  if (MDMSystemShutDownLogPath_once != -1) {
    dispatch_once(&MDMSystemShutDownLogPath_once, &__block_literal_global_131);
  }
  id v0 = (void *)MDMSystemShutDownLogPath_str;
  return v0;
}

void __MDMSystemShutDownLogPath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMRequestedShutDown"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMSystemShutDownLogPath_str;
  MDMSystemShutDownLogPath_str = v1;
}

id MDMSetupAssistantSettingsFilePath()
{
  if (MDMSetupAssistantSettingsFilePath_once != -1) {
    dispatch_once(&MDMSetupAssistantSettingsFilePath_once, &__block_literal_global_136);
  }
  id v0 = (void *)MDMSetupAssistantSettingsFilePath_str;
  return v0;
}

void __MDMSetupAssistantSettingsFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"SetupAssistantSettings.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMSetupAssistantSettingsFilePath_str;
  MDMSetupAssistantSettingsFilePath_str = v1;
}

id MDMManagedStoreBooksManifestPath()
{
  if (MDMManagedStoreBooksManifestPath_once != -1) {
    dispatch_once(&MDMManagedStoreBooksManifestPath_once, &__block_literal_global_141);
  }
  id v0 = (void *)MDMManagedStoreBooksManifestPath_str;
  return v0;
}

void __MDMManagedStoreBooksManifestPath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"ManagedBooks.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMManagedStoreBooksManifestPath_str;
  MDMManagedStoreBooksManifestPath_str = v1;
}

id MDMManagedNonStoreBooksSystemGroupContainer()
{
  id v0 = (void *)MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath;
  if (!MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath)
  {
    uint64_t v1 = DMCSystemGroupContainerPathWithGroupIdentifier(@"systemgroup.com.apple.media.books.managed");
    id v2 = (void *)MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath;
    MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath = v1;

    id v0 = (void *)MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath;
    if (!MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath)
    {
      id v3 = *DMCLogObjects();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_1A7863000, v3, OS_LOG_TYPE_ERROR, "Failed to get managed books system group container", v5, 2u);
      }
      id v0 = (void *)MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath;
    }
  }
  return v0;
}

void __MDMManagedNonStoreBooksDirectory_block_invoke()
{
  MDMManagedNonStoreBooksSystemGroupContainer();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v3 stringByAppendingPathComponent:@"Library"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MDMManagedNonStoreBooksDirectory_str;
  MDMManagedNonStoreBooksDirectory_str = v1;
}

id MDMManagedNonStoreBooksManifestPath()
{
  if (MDMManagedNonStoreBooksManifestPath_once != -1) {
    dispatch_once(&MDMManagedNonStoreBooksManifestPath_once, &__block_literal_global_154_0);
  }
  id v0 = (void *)MDMManagedNonStoreBooksManifestPath_str;
  return v0;
}

void __MDMManagedNonStoreBooksManifestPath_block_invoke()
{
  MDMManagedNonStoreBooksDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v3 stringByAppendingPathComponent:@"Managed.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MDMManagedNonStoreBooksManifestPath_str;
  MDMManagedNonStoreBooksManifestPath_str = v1;
}

id MDMLegacyManagedNonStoreBooksDirectory()
{
  if (MDMLegacyManagedNonStoreBooksDirectory_once != -1) {
    dispatch_once(&MDMLegacyManagedNonStoreBooksDirectory_once, &__block_literal_global_159);
  }
  id v0 = (void *)MDMLegacyManagedNonStoreBooksDirectory_str;
  return v0;
}

uint64_t __MDMLegacyManagedNonStoreBooksDirectory_block_invoke()
{
  MDMLegacyManagedNonStoreBooksDirectory_str = [@"/var/mobile/Media/Books/Managed" copy];
  return MEMORY[0x1F41817F8]();
}

id MDMAuthenticationResultsCacheFilePath()
{
  if (MDMAuthenticationResultsCacheFilePath_once != -1) {
    dispatch_once(&MDMAuthenticationResultsCacheFilePath_once, &__block_literal_global_164_0);
  }
  id v0 = (void *)MDMAuthenticationResultsCacheFilePath_str;
  return v0;
}

void __MDMAuthenticationResultsCacheFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"AuthenticationResultsCache.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMAuthenticationResultsCacheFilePath_str;
  MDMAuthenticationResultsCacheFilePath_str = v1;
}

id MDMUserReturnToServiceStorageDirectory()
{
  if (MDMUserReturnToServiceStorageDirectory_once != -1) {
    dispatch_once(&MDMUserReturnToServiceStorageDirectory_once, &__block_literal_global_169);
  }
  id v0 = (void *)MDMUserReturnToServiceStorageDirectory_str;
  return v0;
}

void __MDMUserReturnToServiceStorageDirectory_block_invoke()
{
  id v2 = [@"/var/mobile/" stringByAppendingPathComponent:@"Library/MDM_ReturnToService"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)MDMUserReturnToServiceStorageDirectory_str;
  MDMUserReturnToServiceStorageDirectory_str = v0;
}

id MDMSystemReturnToServiceStorageDirectory()
{
  if (MDMSystemReturnToServiceStorageDirectory_once != -1) {
    dispatch_once(&MDMSystemReturnToServiceStorageDirectory_once, &__block_literal_global_174_0);
  }
  uint64_t v0 = (void *)MDMSystemReturnToServiceStorageDirectory_str;
  return v0;
}

void __MDMSystemReturnToServiceStorageDirectory_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"Stash"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMSystemReturnToServiceStorageDirectory_str;
  MDMSystemReturnToServiceStorageDirectory_str = v1;
}

id MDMDirtyPersonaFilePath()
{
  if (MDMDirtyPersonaFilePath_once != -1) {
    dispatch_once(&MDMDirtyPersonaFilePath_once, &__block_literal_global_179);
  }
  id v0 = (void *)MDMDirtyPersonaFilePath_str;
  return v0;
}

void __MDMDirtyPersonaFilePath_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"MDMDirtyPersona.plist"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MDMDirtyPersonaFilePath_str;
  MDMDirtyPersonaFilePath_str = v1;
}

void __MCSystemPublicInfoDirectory_block_invoke()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_205);
  }
  id v0 = (id)MCSystemProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"PublicInfo"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MCSystemPublicInfoDirectory_str;
  MCSystemPublicInfoDirectory_str = v1;
}

void __MCUserPublicInfoDirectory_block_invoke()
{
  if (MCUserProfileStorageDirectory_once != -1) {
    dispatch_once(&MCUserProfileStorageDirectory_once, &__block_literal_global_212);
  }
  id v0 = (id)MCUserProfileStorageDirectory_str;
  id v3 = [v0 stringByAppendingPathComponent:@"PublicInfo"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)MCUserPublicInfoDirectory_str;
  MCUserPublicInfoDirectory_str = v1;
}

void __MCLegacyPublicInfoDirectory_block_invoke()
{
  id v2 = [@"/var/mobile/" stringByAppendingPathComponent:@"Library/ConfigurationProfiles/PublicInfo"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)MCLegacyPublicInfoDirectory_str;
  MCLegacyPublicInfoDirectory_str = v0;
}

void __MCUserProfileStorageDirectory_block_invoke()
{
  id v2 = [@"/var/mobile/" stringByAppendingPathComponent:@"Library/UserConfigurationProfiles"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)MCUserProfileStorageDirectory_str;
  MCUserProfileStorageDirectory_str = v0;
}

void sub_1A788D448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A788D8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___assertionQueue_block_invoke()
{
  _assertionQueue_queue = (uint64_t)dispatch_queue_create("Power assertion queue", 0);
  return MEMORY[0x1F41817F8]();
}

id getLARatchetManagerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getLARatchetManagerClass_softClass;
  uint64_t v7 = getLARatchetManagerClass_softClass;
  if (!getLARatchetManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLARatchetManagerClass_block_invoke;
    v3[3] = &unk_1E5CFD440;
    v3[4] = &v4;
    __getLARatchetManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A788FC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLARatchetClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getLARatchetClass_softClass;
  uint64_t v7 = getLARatchetClass_softClass;
  if (!getLARatchetClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLARatchetClass_block_invoke;
    v3[3] = &unk_1E5CFD440;
    v3[4] = &v4;
    __getLARatchetClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A78900E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getLARatchetMaxEnablementGracePeriod()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getLARatchetMaxEnablementGracePeriodSymbolLoc_ptr;
  uint64_t v6 = getLARatchetMaxEnablementGracePeriodSymbolLoc_ptr;
  if (!getLARatchetMaxEnablementGracePeriodSymbolLoc_ptr)
  {
    id v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "LARatchetMaxEnablementGracePeriod");
    getLARatchetMaxEnablementGracePeriodSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    getLARatchetMaxEnablementGracePeriod_cold_1();
  }
  return *(void *)v0;
}

void sub_1A78901D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLARatchetManagerClass_block_invoke(uint64_t a1)
{
  LocalAuthenticationLibrary();
  Class result = objc_getClass("LARatchetManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLARatchetManagerClass_block_invoke_cold_1();
  }
  getLARatchetManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t LocalAuthenticationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __LocalAuthenticationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5CFE108;
    uint64_t v5 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = LocalAuthenticationLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLARatchetClass_block_invoke(uint64_t a1)
{
  LocalAuthenticationLibrary();
  Class result = objc_getClass("LARatchet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLARatchetClass_block_invoke_cold_1();
  }
  getLARatchetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getLARatchetMaxEnablementGracePeriodSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)LocalAuthenticationLibrary();
  Class result = dlsym(v2, "LARatchetMaxEnablementGracePeriod");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLARatchetMaxEnablementGracePeriodSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DMCIsSetupBuddyDone()
{
  if (DMCBYSetupAssistantNeedsToRun()) {
    return 0;
  }
  else {
    return DMCIsBundleIDRunning(@"com.apple.purplebuddy") ^ 1;
  }
}

uint64_t DMCIsGreenTea()
{
  if (DMCIsGreenTea_once != -1) {
    dispatch_once(&DMCIsGreenTea_once, &__block_literal_global_18);
  }
  return DMCIsGreenTea_isGreenTea;
}

void __DMCIsGreenTea_block_invoke()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v1 = IOServiceMatching("AppleBaseband");
  mach_port_name_t MatchingService = IOServiceGetMatchingService(v0, v1);
  unsigned int v3 = MatchingService - 1;
  if (MatchingService - 1 <= 0xFFFFFFFD) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], MatchingService);
  }
  id v6 = +[DMCMobileGestalt regionCode];
  char v4 = [v6 isEqualToString:@"CH"];
  if (v3 < 0xFFFFFFFE) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  DMCIsGreenTea_isGreenTea = v5;
}

uint64_t DMCIsBundleIDRunning(uint64_t a1)
{
  CFDictionaryRef v1 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:a1];
  id v2 = [MEMORY[0x1E4F963E8] handleForPredicate:v1 error:0];
  unsigned int v3 = [v2 currentState];
  uint64_t v4 = [v3 isRunning];

  return v4;
}

__CFString *DMCStringForBool(int a1)
{
  if (a1) {
    return @"Yes";
  }
  else {
    return @"No";
  }
}

id DMCUSEnglishLocale()
{
  if (DMCUSEnglishLocale_once != -1) {
    dispatch_once(&DMCUSEnglishLocale_once, &__block_literal_global_19);
  }
  mach_port_t v0 = (void *)DMCUSEnglishLocale_locale;
  return v0;
}

uint64_t __DMCUSEnglishLocale_block_invoke()
{
  DMCUSEnglishLocale_locale = [objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  return MEMORY[0x1F41817F8]();
}

id DMCUSEnglishNumberFormatter()
{
  if (DMCUSEnglishNumberFormatter_once != -1) {
    dispatch_once(&DMCUSEnglishNumberFormatter_once, &__block_literal_global_14);
  }
  mach_port_t v0 = (void *)DMCUSEnglishNumberFormatter_formatter;
  return v0;
}

uint64_t __DMCUSEnglishNumberFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  CFDictionaryRef v1 = (void *)DMCUSEnglishNumberFormatter_formatter;
  DMCUSEnglishNumberFormatter_formatter = (uint64_t)v0;

  id v2 = (void *)DMCUSEnglishNumberFormatter_formatter;
  unsigned int v3 = DMCUSEnglishLocale();
  [v2 setLocale:v3];

  uint64_t v4 = (void *)DMCUSEnglishNumberFormatter_formatter;
  return [v4 setNumberStyle:0];
}

void sub_1A7891290(_Unwind_Exception *a1)
{
}

uint64_t __getAAQuotaInfoRequestClass_block_invoke_cold_1()
{
  return __getAAQuotaInfoResponseClass_block_invoke_cold_1();
}

uint64_t __getAAQuotaInfoResponseClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCDPUIControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPUIControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSProcessInfoClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSProcessInfoClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAMSUserAgentClass_block_invoke_cold_1(v0);
}

void __getAMSUserAgentClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke_cold_1(v0, v1);
}

void getLARatchetMaxEnablementGracePeriod_cold_1()
{
}

void __getLARatchetManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getLARatchetClass_block_invoke_cold_1(v0);
}

void __getLARatchetClass_block_invoke_cold_1()
{
  uint64_t v0 = (const void *)abort_report_np();
  CC_SHA256(v0, v1, v2);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

void *__cdecl CFBundleGetDataPointerForName(CFBundleRef bundle, CFStringRef symbolName)
{
  return (void *)MEMORY[0x1F40D7548](bundle, symbolName);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1F40D7558](bundle, functionName);
}

Boolean CFBundleLoadExecutableAndReturnError(CFBundleRef bundle, CFErrorRef *error)
{
  return MEMORY[0x1F40D75F8](bundle, error);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A80](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1F40E8EF0](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F88](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

void IOPMAssertionRetain(IOPMAssertionID theAssertion)
{
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9278](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1F412FA18]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

CFArrayRef SCDynamicStoreCopyKeyList(SCDynamicStoreRef store, CFStringRef pattern)
{
  return (CFArrayRef)MEMORY[0x1F4101D88](store, pattern);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DE8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DF0](allocator, domain, serviceID, entity);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101E78](interface);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return (SCNetworkInterfaceRef)MEMORY[0x1F4101E98](interface);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x1F4101EB8](protocol);
}

Boolean SCNetworkProtocolGetEnabled(SCNetworkProtocolRef protocol)
{
  return MEMORY[0x1F4101EC0](protocol);
}

SCNetworkServiceRef SCNetworkServiceCopy(SCPreferencesRef prefs, CFStringRef serviceID)
{
  return (SCNetworkServiceRef)MEMORY[0x1F4101F40](prefs, serviceID);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x1F4101F58](service, protocolType);
}

Boolean SCNetworkServiceGetEnabled(SCNetworkServiceRef service)
{
  return MEMORY[0x1F4101F70](service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x1F4101F78](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x1F4101FC0](prefs);
}

CFArrayRef SCNetworkSetGetServiceOrder(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x1F4101FD0](set);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1F4101FF8](allocator, name, prefsID);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1F40F6A18](allocator, protection, flags, error);
}

uint64_t SecCMSCreateSignedData()
{
  return MEMORY[0x1F40F6A80]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1F40F6B68](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x1F40F6BB8]();
}

uint64_t SecGenerateCertificateRequestWithParameters()
{
  return MEMORY[0x1F40F6DA8]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1F40F6DC8]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1F40F6DD0]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1F40F6E70](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6EE0](parameters, error);
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x1F40F7078](revocationFlags);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x1F40F7088](server, hostname);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1F40F7190](trust);
}

uint64_t SecTrustDeserialize()
{
  return MEMORY[0x1F40F71E8]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1F40F7228](trust);
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x1F40F7250]();
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x1F40F7258](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x1F40F7260](trust, anchorCertificatesOnly);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1F40F7290](trust, policies);
}

uint64_t WriteStackshotReport()
{
  return MEMORY[0x1F4116EB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1F40DF0B0]();
}

uint64_t _CTServerConnectionGetManagedCellularProfile()
{
  return MEMORY[0x1F40DF148]();
}

uint64_t _CTServerConnectionLoadManagedCellularProfile()
{
  return MEMORY[0x1F40DF1B8]();
}

uint64_t _CTServerConnectionUnloadManagedCellularProfile()
{
  return MEMORY[0x1F40DF228]();
}

uint64_t _SCNetworkInterfaceGetFamilySubType()
{
  return MEMORY[0x1F41020D0]();
}

uint64_t _SCNetworkInterfaceGetFamilyType()
{
  return MEMORY[0x1F41020D8]();
}

uint64_t _SCNetworkInterfaceGetIOInterfaceType()
{
  return MEMORY[0x1F41020E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1F40CB7F8]();
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1F40CB800]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
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

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CC680](*(void *)&a1, a2, a3);
}

uint64_t lockdown_connect()
{
  return MEMORY[0x1F4180930]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x1F4180968]();
}

uint64_t lockdown_set_value()
{
  return MEMORY[0x1F4180990]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1F40CDEE8](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1F40CDEF0](a1, *(void *)&a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t thread_get_state(thread_read_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return MEMORY[0x1F40CE528](*(void *)&target_act, *(void *)&flavor, old_state, old_stateCnt);
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_read_overwrite(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_address_t data, vm_size_t *outsize)
{
  return MEMORY[0x1F40CE6F0](*(void *)&target_task, address, size, data, outsize);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}