void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void DNDRegisterLogging()
{
  if (DNDRegisterLogging_onceToken != -1) {
    dispatch_once(&DNDRegisterLogging_onceToken, &__block_literal_global_1);
  }
}

void __DNDRemoteServiceServerInterface_block_invoke()
{
  id v6 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"com.apple.donotdisturb.service"];
  Class v0 = NSClassFromString(&cfstr_Lnaction.isa);
  v1 = (id *)&protocolRef_DNDRemoteServiceServerProtocolLinkUnavailable;
  if (v0) {
    v1 = (id *)&protocolRef_DNDRemoteServiceServerProtocol;
  }
  id v2 = *v1;
  v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:v2];
  [v6 setServer:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)DNDRemoteServiceServerInterface___serviceInterface;
  DNDRemoteServiceServerInterface___serviceInterface = v4;
}

void __DNDRemoteAppConfigurationServiceServerInterface_block_invoke()
{
  id v3 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"com.apple.donotdisturb.appconfiguration.service"];
  Class v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EEDE9FC8];
  [v3 setServer:v0];

  uint64_t v1 = [v3 copy];
  id v2 = (void *)DNDRemoteAppConfigurationServiceServerInterface___serviceInterface;
  DNDRemoteAppConfigurationServiceServerInterface___serviceInterface = v1;
}

void __DNDRemoteMonitorServerInterface_block_invoke()
{
  id v4 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"com.apple.donotdisturb.monitor"];
  Class v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EEDE94E0];
  [v4 setServer:v0];

  uint64_t v1 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EEDE7C20];
  [v4 setClient:v1];

  [v4 setClientMessagingExpectation:1];
  uint64_t v2 = [v4 copy];
  id v3 = (void *)DNDRemoteMonitorServerInterface___monitorInterface;
  DNDRemoteMonitorServerInterface___monitorInterface = v2;
}

void sub_19CC2F454(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __DNDRegisterLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.donotdisturb", "AuxiliaryState");
  uint64_t v1 = (void *)DNDLogAuxiliaryState;
  DNDLogAuxiliaryState = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.donotdisturb", "AppConfiguration");
  id v3 = (void *)DNDLogAppConfiguration;
  DNDLogAppConfiguration = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.donotdisturb", "BehaviorResolution");
  v5 = (void *)DNDLogBehaviorResolution;
  DNDLogBehaviorResolution = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.donotdisturb", "GlobalConfiguration");
  v7 = (void *)DNDLogGlobalConfiguration;
  DNDLogGlobalConfiguration = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.donotdisturb", "HearingTest");
  v9 = (void *)DNDLogHearingTest;
  DNDLogHearingTest = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.donotdisturb", "ModeAssertion");
  v11 = (void *)DNDLogModeAssertion;
  DNDLogModeAssertion = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.donotdisturb", "ModeConfiguration");
  v13 = (void *)DNDLogModeConfiguration;
  DNDLogModeConfiguration = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.donotdisturb", "ModeSelection");
  v15 = (void *)DNDLogModeSelection;
  DNDLogModeSelection = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.donotdisturb", "RemoteConnection");
  v17 = (void *)DNDLogRemoteConnection;
  DNDLogRemoteConnection = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.donotdisturb", "Settings");
  v19 = (void *)DNDLogSettings;
  DNDLogSettings = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.donotdisturb", "State");
  v21 = (void *)DNDLogState;
  DNDLogState = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.donotdisturb", "DNDMeDeviceService.client");
  v23 = (void *)DNDLogMeDeviceService;
  DNDLogMeDeviceService = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.donotdisturb", "Utilities");
  v25 = (void *)DNDLogUtilities;
  DNDLogUtilities = (uint64_t)v24;

  DNDLogXPCEventObserver = (uint64_t)os_log_create("com.apple.donotdisturb", "XPCEventObserver");
  return MEMORY[0x1F41817F8]();
}

void sub_19CC2FA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

__CFString *DNDStringFromModeAssertionLifetimeType(unint64_t a1)
{
  if (a1 > 5) {
    return @"<invalid>";
  }
  else {
    return off_1E5911408[a1];
  }
}

__CFString *DNDStringFromInterruptionSuppressionState(unint64_t a1)
{
  if (a1 > 2) {
    return @"<unknown>";
  }
  else {
    return off_1E5911718[a1];
  }
}

void sub_19CC308F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC30AE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC30CD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_19CC30F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
}

void sub_19CC31204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
}

void sub_19CC31F08(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC3281C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DNDRemoteMonitorServerInterface()
{
  if (DNDRemoteMonitorServerInterface_monitorOnceToken != -1) {
    dispatch_once(&DNDRemoteMonitorServerInterface_monitorOnceToken, &__block_literal_global_45);
  }
  os_log_t v0 = (void *)DNDRemoteMonitorServerInterface___monitorInterface;
  return v0;
}

id DNDRemoteAppConfigurationServiceServerInterface()
{
  if (DNDRemoteAppConfigurationServiceServerInterface_serviceOnceToken != -1) {
    dispatch_once(&DNDRemoteAppConfigurationServiceServerInterface_serviceOnceToken, &__block_literal_global_18);
  }
  os_log_t v0 = (void *)DNDRemoteAppConfigurationServiceServerInterface___serviceInterface;
  return v0;
}

id DNDRemoteServiceServerInterface()
{
  if (DNDRemoteServiceServerInterface_serviceOnceToken != -1) {
    dispatch_once(&DNDRemoteServiceServerInterface_serviceOnceToken, &__block_literal_global_141);
  }
  os_log_t v0 = (void *)DNDRemoteServiceServerInterface___serviceInterface;
  return v0;
}

__CFString *DNDModeLocalizedNameKeyForSemanticType(unint64_t a1)
{
  if (a1 > 9) {
    return 0;
  }
  else {
    return off_1E59111D8[a1];
  }
}

BOOL DNDSupportedSemanticType(uint64_t a1)
{
  return (unint64_t)(a1 + 1) < 0xB;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *DNDStringFromModeAssertionScheduleLifetimeBehavior(uint64_t a1)
{
  uint64_t v1 = @"<invalid>";
  if (a1 == 1) {
    uint64_t v1 = @"schedule end";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"match schedule";
  }
}

void sub_19CC34858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

__CFString *DNDStringFromSupportedAccountFeatures(char a1)
{
  os_log_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  if (a1) {
    [v2 addObject:@"SilenceLists"];
  }
  if ([v3 count])
  {
    uint64_t v4 = NSString;
    v5 = [v3 componentsJoinedByString:@"; "];
    os_log_t v6 = [v4 stringWithFormat:@"{ %@ }", v5];
  }
  else
  {
    os_log_t v6 = @"<none>";
  }

  return v6;
}

__CFString *DNDStringFromBreakthroughUrgency(uint64_t a1)
{
  uint64_t v1 = @"essential";
  if (a1 == 1) {
    uint64_t v1 = @"time-sensitive";
  }
  if (a1 == 2) {
    return @"all";
  }
  else {
    return v1;
  }
}

__CFString *DNDStringFromDeviceClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"<unknown>";
  }
  else {
    return off_1E5910F60[a1 - 1];
  }
}

uint64_t DNDDeviceClassFromMGDeviceClass(int a1)
{
  if ((a1 - 1) > 0xA) {
    return 0;
  }
  else {
    return qword_19CC79700[a1 - 1];
  }
}

__CFString *DNDModeAssertionInvalidationReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"<unknown>";
  }
  else {
    return off_1E5910F90[a1 - 1];
  }
}

__CFString *DNDStringFromContactType(uint64_t a1)
{
  uint64_t v1 = @"<unknown>";
  if (a1 == 1) {
    uint64_t v1 = @"Favorite";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Contact";
  }
}

void sub_19CC37318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_19CC38014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
}

__CFString *DNDModeSemanticTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 0xA) {
    return @"Unknown";
  }
  else {
    return off_1E59110F0[a1 + 1];
  }
}

__CFString *DNDSystemImageNameForModeSemanticType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"moon.fill";
  }
  else {
    return off_1E5911148[a1 - 1];
  }
}

__CFString *DNDSystemColorNameForModeSemanticType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"systemIndigoColor";
  }
  else {
    return off_1E5911190[a1 - 1];
  }
}

id DNDSystemColorNamesForModeSemanticType(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = @"systemIndigoColor";
  uint64_t v2 = a1 - 1;
  id v3 = &unk_1EEDE0108;
  switch(v2)
  {
    case 0:
    case 7:
      uint64_t v1 = @"systemMintColor";
      goto LABEL_8;
    case 2:
      uint64_t v1 = @"systemGreenColor";
      goto LABEL_8;
    case 3:
      uint64_t v1 = @"systemTealColor";
      goto LABEL_8;
    case 4:
      uint64_t v1 = @"systemPurpleColor";
      goto LABEL_8;
    case 5:
      uint64_t v1 = @"systemOrangeColor";
      goto LABEL_8;
    case 6:
      uint64_t v1 = @"systemBlueColor";
      goto LABEL_8;
    case 8:
      goto LABEL_9;
    default:
LABEL_8:
      v5[0] = v1;
      id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
LABEL_9:
      return v3;
  }
}

id DNDModeLocalizedNameForSemanticType(unint64_t a1)
{
  if (a1 > 9) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = off_1E59111D8[a1];
  }
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28B50], "dnd_doNotDisturbLocalizationBundle");
  id v3 = [v2 localizedStringForKey:v1 value:&stru_1EEDCFB98 table:0];

  return v3;
}

__CFString *DNDStringFromConfigurationType(uint64_t a1)
{
  uint64_t v1 = @"Inclusive";
  if (!a1) {
    uint64_t v1 = @"Exclusive";
  }
  if (a1 == 2) {
    return @"Unconfigured";
  }
  else {
    return v1;
  }
}

unint64_t DNDResolvedHideApplicationBadgesSetting(unint64_t result)
{
  if (result <= 1) {
    return 1;
  }
  return result;
}

unint64_t DNDResolvedIntelligentManagementSetting(unint64_t result)
{
  if (result <= 1) {
    return 1;
  }
  return result;
}

unint64_t DNDResolvedInterruptionSuppressionMode(unint64_t result)
{
  if (result <= 1) {
    return 1;
  }
  return result;
}

void sub_19CC3AF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *DNDMeDeviceStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E5911278[a1 - 1];
  }
}

__CFString *DNDEnabledSettingToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"<invalid>";
  }
  else {
    return off_1E5911290[a1];
  }
}

__CFString *DNDInterruptionSuppressionToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"<invalid>";
  }
  else {
    return off_1E59112A8[a1];
  }
}

__CFString *DNDStringFromInterruptionSuppression(unint64_t a1)
{
  if (a1 > 2) {
    return @"<invalid>";
  }
  else {
    return off_1E59112A8[a1];
  }
}

unint64_t DNDMostRestrictiveInterruptionSuppression(unint64_t result, unint64_t a2)
{
  if (result <= a2) {
    return a2;
  }
  return result;
}

__CFString *DNDStringFromInterruptionSuppressionMode(unint64_t a1)
{
  if (a1 >= 3)
  {
    uint64_t v2 = NSString;
    id v3 = [NSNumber numberWithUnsignedInteger:a1];
    uint64_t v1 = [v2 stringWithFormat:@"<invalid: %@>", v3];
  }
  else
  {
    uint64_t v1 = off_1E59112C0[a1];
  }
  return v1;
}

__CFString *DNDModeAssertionInvalidationReasonOverrideToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"<unknown>";
  }
  else {
    return off_1E59112D8[a1];
  }
}

uint64_t DNDResolvedModeAssertionInvalidationReason(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 == 1;
  if (a2 == 2) {
    uint64_t v2 = 2;
  }
  if (a2) {
    return v2;
  }
  return result;
}

__CFString *DNDCompatibilityVersionToString(uint64_t a1)
{
  switch(a1)
  {
    case 10:
      uint64_t v1 = @"Sydney";
      break;
    case 11:
      uint64_t v1 = @"SydneyE";
      break;
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
      goto LABEL_6;
    case 15:
      uint64_t v1 = @"Dawn";
      break;
    case 20:
      uint64_t v1 = @"Crystal";
      break;
    case 21:
      uint64_t v1 = @"max";
      break;
    default:
      if (a1 == 2)
      {
        uint64_t v1 = @"Sky";
      }
      else if (a1 == 3)
      {
        uint64_t v1 = @"SkyF";
      }
      else
      {
LABEL_6:
        uint64_t v2 = [NSNumber numberWithInteger:a1];
        uint64_t v1 = [v2 stringValue];
      }
      break;
  }
  return v1;
}

__CFString *DNDCompatibilityVersionStringify(uint64_t a1)
{
  switch(a1)
  {
    case 10:
      uint64_t v1 = @"DNDCompatibilityVersionSydney";
      break;
    case 11:
      uint64_t v1 = @"DNDCompatibilityVersionSydneyE";
      break;
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
      goto LABEL_6;
    case 15:
      uint64_t v1 = @"DNDCompatibilityVersionDawn";
      break;
    case 20:
      uint64_t v1 = @"DNDCompatibilityVersionCrystal";
      break;
    case 21:
      uint64_t v1 = @"DNDCompatibilityVersionMax";
      break;
    default:
      if (a1 == 2)
      {
        uint64_t v1 = @"DNDCompatibilityVersionSky";
      }
      else if (a1 == 3)
      {
        uint64_t v1 = @"DNDCompatibilityVersionSkyF";
      }
      else
      {
LABEL_6:
        uint64_t v2 = [NSNumber numberWithInteger:a1];
        uint64_t v1 = [v2 stringValue];
      }
      break;
  }
  return v1;
}

__CFString *DNDStringFromDeviceCapabilities(char a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  if (a1) {
    [v2 addObject:@"telephony"];
  }
  if ([v3 count])
  {
    uint64_t v4 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v4 = @"<none>";
  }

  return v4;
}

uint64_t DNDWeekdaysFromDay(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 9) {
    return 0;
  }
  else {
    return qword_19CC797B0[a1 + 2];
  }
}

uint64_t DNDDayForWeekdays(uint64_t result)
{
  if (result > 15)
  {
    if (result <= 63)
    {
      if (result == 16) {
        return 6;
      }
      if (result == 32) {
        return 7;
      }
    }
    else
    {
      switch(result)
      {
        case 0x40:
          return 1;
        case 0x7FLL:
          return -1;
        case 0xFFFFFFFFLL:
          return -2;
      }
    }
    return 0;
  }
  else
  {
    switch(result)
    {
      case 0:
      case 4:
        return result;
      case 1:
        uint64_t result = 2;
        break;
      case 2:
        uint64_t result = 3;
        break;
      case 8:
        uint64_t result = 5;
        break;
      default:
        return 0;
    }
  }
  return result;
}

uint64_t DNDNextDay(uint64_t a1)
{
  if (a1 == 7) {
    return 1;
  }
  else {
    return a1 + 1;
  }
}

uint64_t DNDPreviousDay(uint64_t a1)
{
  if (a1 == 1) {
    return 7;
  }
  else {
    return a1 - 1;
  }
}

uint64_t DNDEnumerateDaysOfWeekStartingOnDay(uint64_t a1, uint64_t a2, char a3)
{
  char v10 = 0;
  uint64_t v5 = 7;
  if (a3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 7;
  }
  if (a3) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
  if (a3) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 1;
  }
  do
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, a1, &v10);
    if (v10) {
      break;
    }
    if (a1 == v6) {
      a1 = v8;
    }
    else {
      a1 += v7;
    }
    --v5;
  }
  while (v5);
  return result;
}

__CFString *NSStringForDNDDay(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 9) {
    return @"M";
  }
  else {
    return off_1E5911318[a1 + 2];
  }
}

id DNDIdentifierStringForWeekdays(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v4 = [v3 firstWeekday];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = __DNDIdentifierStringForWeekdays_block_invoke;
  char v10 = &unk_1E59112F8;
  uint64_t v12 = a1;
  id v5 = v2;
  id v11 = v5;
  char v13 = 0;
  uint64_t v6 = 7;
  do
  {
    ((void (*)(void *, uint64_t, char *))v9)(v8, v4, &v13);
    if (v13) {
      break;
    }
    if (v4 == 7) {
      uint64_t v4 = 1;
    }
    else {
      ++v4;
    }
    --v6;
  }
  while (v6);

  return v5;
}

uint64_t __DNDIdentifierStringForWeekdays_block_invoke(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 + 2) > 9) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_19CC797B0[a2 + 2];
  }
  if ((v2 & *(void *)(result + 40)) != 0)
  {
    id v3 = *(void **)(result + 32);
    if ((unint64_t)(a2 + 2) > 9) {
      uint64_t v4 = @"M";
    }
    else {
      uint64_t v4 = off_1E5911318[a2 + 2];
    }
    return [v3 appendString:v4];
  }
  return result;
}

__CFString *NSStringFromDNDWeekdays(uint64_t a1)
{
  if (a1 == 127)
  {
    uint64_t v2 = @"Every Day";
  }
  else
  {
    DNDIdentifierStringForWeekdays(a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *DNDEventSourceTypeToString(unint64_t a1)
{
  if (a1 > 5) {
    return @"<invalid>";
  }
  else {
    return off_1E59113D8[a1];
  }
}

void sub_19CC44ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

__CFString *DNDStringFromInterruptionBehaviorSetting(unint64_t a1)
{
  if (a1 > 2) {
    return @"<invalid>";
  }
  else {
    return off_1E5911438[a1];
  }
}

uint64_t DNDResolvedInterruptionBehaviorSettingForDevice(uint64_t result, void *a2)
{
  if (!result)
  {
    if ((unint64_t)(objc_msgSend(a2, "deviceClass", v2, v3) - 1) >= 3) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

__CFString *DNDInterruptionBehaviorToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"<invalid>";
  }
  else {
    return off_1E5911438[a1];
  }
}

uint64_t DNDResolvedInterruptionBehaviorSetting(uint64_t a1)
{
  uint64_t v2 = +[DNDDevice currentDevice];
  uint64_t v3 = v2;
  if (!a1)
  {
    if ((unint64_t)([v2 deviceClass] - 1) >= 3) {
      a1 = 1;
    }
    else {
      a1 = 2;
    }
  }

  return a1;
}

void sub_19CC4803C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,os_activity_scope_state_s state)
{
}

void sub_19CC484AC(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC485EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC48884(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC48CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC49040(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC493A8(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC49708(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC49A48(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC49D88(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC4A110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC4A4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
}

void sub_19CC4A828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC4ABB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 128));
  _Unwind_Resume(a1);
}

void sub_19CC4AD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC4AE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC4B118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_19CC4B3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC4B750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC4BAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
}

void sub_19CC4BE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC4C16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC4C4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 128));
  _Unwind_Resume(a1);
}

void sub_19CC4C684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC4C748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC4C928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
}

void sub_19CC4CBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19CC4CF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19CC4D240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19CC4D5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC4D810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC4E058(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_19CC4E240(_Unwind_Exception *exception_object)
{
}

void sub_19CC4E3A0(_Unwind_Exception *exception_object)
{
}

void sub_19CC4E500(_Unwind_Exception *exception_object)
{
}

void sub_19CC4E674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC4E80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC4EB14(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC4EFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_19CC4F5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

__CFString *DNDStringFromExceptionType(uint64_t a1)
{
  uint64_t v1 = @"None";
  if (a1 == 1) {
    uint64_t v1 = @"Deny";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Allow";
  }
}

void sub_19CC513EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

__CFString *DNDStateUpdateReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"<unknown>";
  }
  else {
    return off_1E59116A0[a1 - 1];
  }
}

__CFString *DNDStateUpdateSourceToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"<unknown>";
  }
  else {
    return off_1E59116D0[a1 - 1];
  }
}

__CFString *DNDStateUpdateOptionsToString(char a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = v2;
  if ((a1 & 2) != 0) {
    [v2 addObject:@"ForceStatusUpdate"];
  }
  if ([v3 count])
  {
    uint64_t v4 = NSString;
    id v5 = [v3 componentsJoinedByString:@"; "];
    uint64_t v6 = [v4 stringWithFormat:@"{ %@ }", v5];
  }
  else
  {
    uint64_t v6 = @"<none>";
  }

  return v6;
}

__CFString *NSStringFromDNDPlatform(unint64_t a1)
{
  if (a1 > 5) {
    return @"iOS";
  }
  else {
    return off_1E59116E8[a1];
  }
}

uint64_t DNDPlatformForCurrentDevice()
{
  return 1;
}

uint64_t DNDResolvedImmediateBypassEventSourceType(uint64_t a1)
{
  uint64_t v2 = +[DNDDevice currentDevice];
  if (!a1) {
    a1 = 3;
  }

  return a1;
}

uint64_t DNDResolvedImmediateBypassEventSourceTypeForDevice(uint64_t result)
{
  if (!result) {
    return 3;
  }
  return result;
}

uint64_t DNDResolvedRepeatEventSourceBehaviorEnabledSetting(uint64_t a1)
{
  uint64_t v2 = +[DNDDevice currentDevice];
  if (!a1) {
    a1 = 2;
  }

  return a1;
}

uint64_t DNDResolvedRepeatEventSourceBehaviorEnabledSettingForDevice(uint64_t result)
{
  if (!result) {
    return 2;
  }
  return result;
}

void sub_19CC560F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
}

__CFString *DNDStringFromClientEventType(unint64_t a1)
{
  if (a1 > 4) {
    return @"<unknown>";
  }
  else {
    return off_1E5911798[a1];
  }
}

__CFString *DNDStringFromClientEventUrgency(unint64_t a1)
{
  if (a1 > 2) {
    return @"<unknown>";
  }
  else {
    return off_1E59117C0[a1];
  }
}

__CFString *DNDStringFromResolutionBehavior(uint64_t a1)
{
  uint64_t v1 = @"<unknown>";
  if (a1 == 1) {
    uint64_t v1 = @"Legacy";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Default";
  }
}

id DNDRemoteAvailabilityServiceServerInterface()
{
  if (DNDRemoteAvailabilityServiceServerInterface_serviceOnceToken != -1) {
    dispatch_once(&DNDRemoteAvailabilityServiceServerInterface_serviceOnceToken, &__block_literal_global_9);
  }
  os_log_t v0 = (void *)DNDRemoteAvailabilityServiceServerInterface___serviceInterface;
  return v0;
}

void __DNDRemoteAvailabilityServiceServerInterface_block_invoke()
{
  id v3 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"com.apple.donotdisturb.availability.service"];
  os_log_t v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EEDE6378];
  [v3 setServer:v0];

  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)DNDRemoteAvailabilityServiceServerInterface___serviceInterface;
  DNDRemoteAvailabilityServiceServerInterface___serviceInterface = v1;
}

uint64_t DNDResolvedImpactsAvailabilitySetting(uint64_t result)
{
  if (!result) {
    return 2;
  }
  return result;
}

unint64_t DNDResolvedDimsLockScreenSetting(unint64_t result)
{
  if (result <= 1) {
    return 1;
  }
  return result;
}

void sub_19CC5C794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

uint64_t DNDOperatingSystemVersionCompare(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return -1;
  }
  if (*a1 > *a2) {
    return 1;
  }
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  if (v2 < v3) {
    return -1;
  }
  if (v2 > v3) {
    return 1;
  }
  uint64_t v5 = a1[2];
  uint64_t v6 = a2[2];
  BOOL v8 = __OFSUB__(v5, v6);
  BOOL v7 = v5 - v6 < 0;
  BOOL v9 = v5 > v6;
  if (v7 != v8) {
    return -1;
  }
  else {
    return v9;
  }
}

void DNDOperatingSystemVersionFromString(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = [a1 componentsSeparatedByString:@"."];
  if ([v6 count])
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    if ([v6 count])
    {
      uint64_t v3 = [v6 objectAtIndexedSubscript:0];
      *a2 = [v3 integerValue];
    }
    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v4 = [v6 objectAtIndexedSubscript:1];
      a2[1] = [v4 integerValue];
    }
    if ((unint64_t)[v6 count] >= 3)
    {
      uint64_t v5 = [v6 objectAtIndexedSubscript:2];
      a2[2] = [v5 integerValue];
    }
  }
  else
  {
    a2[1] = -1;
    a2[2] = -1;
    *a2 = -1;
  }
}

id DNDStringFromOperatingSystemVersion(void *a1)
{
  uint64_t v2 = NSString;
  uint64_t v3 = [NSNumber numberWithInteger:*a1];
  uint64_t v4 = [NSNumber numberWithInteger:a1[1]];
  uint64_t v5 = [NSNumber numberWithInteger:a1[2]];
  id v6 = [v2 stringWithFormat:@"%@.%@.%@", v3, v4, v5];

  return v6;
}

unint64_t DNDResolvedScheduleEnabledSetting(unint64_t result)
{
  if (result <= 1) {
    return 1;
  }
  return result;
}

unint64_t DNDResolvedBedtimeBehaviorEnabledSetting(unint64_t result)
{
  if (result <= 1) {
    return 1;
  }
  return result;
}

void sub_19CC5FB88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC5FFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19CC603C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19CC6075C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19CC60AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19CC60E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC611CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19CC61444(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC61608(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC61768(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC61C84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC61E94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *DNDStringFromContactHandleType(uint64_t a1)
{
  uint64_t v1 = @"unknown";
  if (a1 == 2) {
    uint64_t v1 = @"phone";
  }
  if (a1 == 1) {
    return @"email";
  }
  else {
    return v1;
  }
}

void sub_19CC63148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  os_activity_scope_leave((os_activity_scope_state_t)(v9 - 128));
  _Unwind_Resume(a1);
}

void sub_19CC63214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC634FC(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_19CC635C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC638B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19CC63D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_19CC63DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC63FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC649BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *DNDModeAssertionReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"<unknown>";
  }
  else {
    return off_1E5911A30[a1 - 1];
  }
}

void sub_19CC64FE4(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_19CC65330(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC65634(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_19CC65980(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC6606C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19CC663C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC6695C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19CC66C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC66E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_19CC6714C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_19CC675BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_19CC677B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19CC6820C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_19CC6865C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
}

void sub_19CC68DB8(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC691F4(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC6AC48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC6B598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19CC6B720(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC6C434(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC6C5A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC6C71C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC6C88C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC6CA04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC6D680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19CC6D848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19CC6DA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19CC6DB84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC6E00C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *DNDResolutionReasonToString(unint64_t a1)
{
  if (a1 > 0x1A) {
    return @"<invalid>";
  }
  else {
    return off_1E5911FE0[a1];
  }
}

__CFString *DNDIntelligentInterruptionBehaviorToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"unused";
  }
  else {
    return off_1E59120B8[a1 - 1];
  }
}

void sub_19CC7114C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC714CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC71820(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19CC71BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_19CC72B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
}

uint64_t sub_19CC72FD8()
{
  uint64_t v0 = sub_19CC75190();
  __swift_allocate_value_buffer(v0, qword_1E942D038);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E942D038);
  return sub_19CC75180();
}

uint64_t sub_19CC73048()
{
  if (qword_1E942D030 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_19CC75190();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E942D038);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_19CC730E4@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E942D030 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_19CC75190();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1E942D038);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
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

uint64_t sub_19CC75180()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_19CC75190()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1F410C278]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1F410C678]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4114220]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F4114228]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
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

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
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

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1F40CF310](type);
}