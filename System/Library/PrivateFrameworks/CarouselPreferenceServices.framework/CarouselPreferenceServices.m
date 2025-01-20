uint64_t DepthUnit.hash(into:)()
{
  return sub_22F5148F8();
}

uint64_t DepthUnit.hashValue.getter()
{
  return sub_22F514908();
}

uint64_t sub_22F4EC680()
{
  return sub_22F514908();
}

uint64_t sub_22F4EC6C8()
{
  return sub_22F5148F8();
}

uint64_t sub_22F4EC6F4()
{
  return sub_22F514908();
}

BOOL static DepthUnit.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_22F4EC754()
{
  unint64_t result = qword_2686CC498;
  if (!qword_2686CC498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686CC498);
  }
  return result;
}

BOOL sub_22F4EC7A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DepthUnit(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DepthUnit(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x22F4EC92CLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_22F4EC954(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22F4EC960(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DepthUnit()
{
  return &type metadata for DepthUnit;
}

uint64_t sub_22F4EC97C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t CSLPRFEqualAppBacklightPrivacySettingsValues(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 == v4)
  {
    uint64_t v9 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && (objc_opt_respondsToSelector() & 1) != 0
  }
         && (int v5 = [v3 privacyDuringAlwaysOnForApp],
             v5 == [v4 privacyDuringAlwaysOnForApp])
         && (objc_opt_respondsToSelector() & 1) != 0
         && (objc_opt_respondsToSelector() & 1) != 0
         && (int v6 = [v3 privacyDuringAlwaysOnForNotification],
             v6 == [v4 privacyDuringAlwaysOnForNotification])
         && (objc_opt_respondsToSelector() & 1) != 0
         && (objc_opt_respondsToSelector() & 1) != 0
         && (int v7 = [v3 privacyDuringAlwaysOnForLiveActivities],
             v7 == [v4 privacyDuringAlwaysOnForLiveActivities])
         && (objc_opt_respondsToSelector() & 1) != 0
         && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v8 = [v3 watchAppSupportsAlwaysOnDisplay];
    uint64_t v9 = v8 ^ [v4 watchAppSupportsAlwaysOnDisplay] ^ 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_22F4F0194(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F4F0314(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F4F0648(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F4F0E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22F4F0F80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F4F10E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F4F11AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22F4F1204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F4F158C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id CSLPRFCachedAppViewImageURL(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F57730] sharedInstance];
  id v3 = [MEMORY[0x263F57730] activeDeviceSelectorBlock];
  id v4 = [v2 getDevicesMatching:v3];
  int v5 = [v4 firstObject];

  int v6 = [v5 valueForProperty:*MEMORY[0x263F575E8]];
  int v7 = [v6 stringByAppendingPathComponent:@"com.apple.carousel"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, ">>>> CSLPRFPerDeviceAppViewImageCachePath: cachePath %@, device %@", buf, 0x16u);
  }
  int v8 = [MEMORY[0x263F08850] defaultManager];
  char v9 = [v8 fileExistsAtPath:v7];

  if ((v9 & 1) == 0)
  {
    v10 = [MEMORY[0x263F08850] defaultManager];
    id v18 = 0;
    char v11 = [v10 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v12 = v18;

    if ((v11 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v12;
      __int16 v21 = 2112;
      v22 = v7;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, ">>>> CSLPRFDeviceAppviewImageCachePath: Error creating cache directory %@ path %@", buf, 0x16u);
    }
  }
  if (a1 == 1)
  {
    v13 = @"AppViewGrid.png";
  }
  else
  {
    if (a1 != 2) {
      goto LABEL_14;
    }
    v13 = @"AppViewList.png";
  }
  uint64_t v14 = [v7 stringByAppendingPathComponent:v13];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [NSURL fileURLWithPath:v14];

    goto LABEL_15;
  }
LABEL_14:
  v16 = 0;
LABEL_15:

  return v16;
}

__CFString *CSLAppSwitcherEditingSourceToNSString(uint64_t a1)
{
  v1 = @"gizmoSettings";
  if (!a1) {
    v1 = @"gizmoSwitcher";
  }
  if (a1 == 2) {
    return @"companionSettings";
  }
  else {
    return v1;
  }
}

__CFString *CSLAppSwitcherEditingActionToNSString(uint64_t a1)
{
  v1 = @"remove";
  if (a1 == 1) {
    v1 = @"add";
  }
  if (a1 == 2) {
    return @"reorder";
  }
  else {
    return v1;
  }
}

__CFString *NSStringFromCSLPRFDepthAutoLaunchBehavior(unint64_t a1)
{
  if (a1 >= 3)
  {
    int v2 = NSString;
    id v3 = [NSNumber numberWithInteger:a1];
    v1 = [v2 stringWithFormat:@"<CSLPRFDepthAutoLaunchBehavior unknown: %@>", v3];
  }
  else
  {
    v1 = off_264A0AC10[a1];
  }
  return v1;
}

__CFString *NSStringFromCSLPRFDepthAutoLaunchThreshold(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      v1 = @"coremotion-deep";
    }
    else
    {
      int v2 = NSString;
      id v3 = [NSNumber numberWithInteger:a1];
      v1 = [v2 stringWithFormat:@"<CSLPRFDepthAutoLaunchThreshold unknown: %@>", v3];
    }
  }
  else
  {
    v1 = @"on-submersion";
  }
  return v1;
}

BOOL CSLPRFDepthAutoLaunchBehaviorIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL CSLPRFDepthAutoLaunchThresholdIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL CSLPRFLinkActionTypeIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0x29;
}

uint64_t CSLPRFLinkActionTypeIsStartAction(unint64_t a1)
{
  return (a1 < 0x2B) & (0x14422101276uLL >> a1);
}

BOOL CSLPRFLinkActionTypeIsWorkoutStartAction(uint64_t a1)
{
  return a1 == 6 || a1 == 9;
}

BOOL CSLPRFLinkActionTypeIsStartDiveAction(uint64_t a1)
{
  return a1 == 20;
}

__CFString *CSLPRFLinkActionTypeToIdentifier(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x28) {
    return 0;
  }
  else {
    return off_264A0AC28[a1 - 1];
  }
}

uint64_t CSLActionTypeToSettingsActionType(uint64_t a1)
{
  if (a1 > 33)
  {
    switch(a1)
    {
      case '""':
        return 12;
      case '&':
        return 14;
      case '(':
        return 15;
      default:
        return 7;
    }
  }
  else
  {
    uint64_t v1 = 11;
    uint64_t v2 = 8;
    switch(a1)
    {
      case 0:
        return v2;
      case 1:
        return 3;
      case 2:
        return 6;
      case 4:
        return 2;
      case 5:
        return 4;
      case 6:
      case 9:
        return 0;
      case 12:
        return 5;
      case 20:
        return 1;
      case 25:
        return 9;
      case 29:
        return v1;
      default:
        return 7;
    }
  }
}

uint64_t CSLSettingsActionTypeToLinkActionType(unint64_t a1)
{
  if (a1 > 0xF) {
    return 0;
  }
  else {
    return qword_22F5179A0[a1];
  }
}

uint64_t CSLIdentifierToLinkActionType(void *a1)
{
  uint64_t v1 = CSLIdentifierToLinkActionType_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&CSLIdentifierToLinkActionType_onceToken, &__block_literal_global_476);
  }
  id v3 = [(id)CSLIdentifierToLinkActionType___identifierToActionType objectForKeyedSubscript:v2];

  uint64_t v4 = [v3 integerValue];
  return v4;
}

void __CSLIdentifierToLinkActionType_block_invoke()
{
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  for (unint64_t i = -1; i != 41; ++i)
  {
    if (i >= 0x29 || (uint64_t v1 = off_264A0AC28[i], ((0x500C100004uLL >> i) & 1) != 0))
    {
      id v2 = 0;
    }
    else
    {
      id v2 = v1;
      id v3 = [NSNumber numberWithUnsignedInteger:i + 1];
      [v6 setObject:v3 forKeyedSubscript:v2];
    }
  }
  uint64_t v4 = [v6 copy];
  int v5 = (void *)CSLIdentifierToLinkActionType___identifierToActionType;
  CSLIdentifierToLinkActionType___identifierToActionType = v4;
}

uint64_t CSLHasChordActionInstructions(unint64_t a1)
{
  return (a1 < 0x23) & (0x400101050uLL >> a1);
}

uint64_t CSLChordAction(uint64_t result)
{
  if (result == 12) {
    return 13;
  }
  return result;
}

BOOL CSLPRFLinkActionTypeRequiresApp(uint64_t a1)
{
  return a1 != 38 && a1 != 2;
}

BOOL CSLPRFStingAccessibilityActionTypeIsAvailable(uint64_t a1)
{
  if (a1) {
    BOOL v1 = a1 == 14;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

uint64_t CSLPRFStingAccessibilityActionTypeTripleClickOption(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xB) {
    return 0;
  }
  else {
    return dword_22F517A20[a1 - 1];
  }
}

__CFString *CSLPRFStingAccessibilityActionTypeName(uint64_t a1)
{
  id v2 = &stru_26E2BF688;
  if (a1 && a1 != 14)
  {
    id AXTripleClickHelpersClass = getAXTripleClickHelpersClass();
    if ((unint64_t)(a1 - 1) > 0xB) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = dword_22F517A20[a1 - 1];
    }
    id v2 = [AXTripleClickHelpersClass titleForTripleClickOption:v4];
  }
  return v2;
}

id getAXTripleClickHelpersClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAXTripleClickHelpersClass_softClass;
  uint64_t v7 = getAXTripleClickHelpersClass_softClass;
  if (!getAXTripleClickHelpersClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXTripleClickHelpersClass_block_invoke;
    v3[3] = &unk_264A0AD78;
    v3[4] = &v4;
    __getAXTripleClickHelpersClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22F4F360C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXTripleClickHelpersClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264A0AD98;
    uint64_t v6 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AXTripleClickHelpers");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getAXTripleClickHelpersClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *CSLPRFStingAccessibilityActionTypeIdentifier(unint64_t a1)
{
  if (a1 > 0xC) {
    return 0;
  }
  else {
    return off_264A0ADB0[a1];
  }
}

uint64_t CSLPRFIdentifierToStingAccessibilityActionType(void *a1)
{
  uint64_t v1 = CSLPRFIdentifierToStingAccessibilityActionType_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&CSLPRFIdentifierToStingAccessibilityActionType_onceToken, &__block_literal_global_526);
  }
  id v3 = [(id)CSLPRFIdentifierToStingAccessibilityActionType___identifierToActionType objectForKeyedSubscript:v2];

  uint64_t v4 = [v3 integerValue];
  return v4;
}

void __CSLPRFIdentifierToStingAccessibilityActionType_block_invoke()
{
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  for (unint64_t i = 0; i != 14; ++i)
  {
    if (i >= 0xD)
    {
      uint64_t v1 = 0;
    }
    else
    {
      uint64_t v1 = off_264A0ADB0[i];
      id v2 = [NSNumber numberWithUnsignedInteger:i];
      [v5 setObject:v2 forKeyedSubscript:v1];
    }
  }
  uint64_t v3 = [v5 copy];
  uint64_t v4 = (void *)CSLPRFIdentifierToStingAccessibilityActionType___identifierToActionType;
  CSLPRFIdentifierToStingAccessibilityActionType___identifierToActionType = v3;
}

void CSLPRFPerformAccessibilityActionForIdentifier(void *a1)
{
  uint64_t v1 = CSLPRFIdentifierToStingAccessibilityActionType(a1);
  if (v1 == 9)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"HearingAidPresentAlertNotificationName" object:0];
  }
  else if ((unint64_t)(v1 - 1) <= 0xB)
  {
    uint64_t v2 = dword_22F517A20[v1 - 1];
    id AXTripleClickHelpersClass = getAXTripleClickHelpersClass();
    [AXTripleClickHelpersClass toggleTripleClickOption:v2 fromSource:1];
  }
}

void sub_22F4F73C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_22F4F79F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__875(uint64_t a1)
{
}

void sub_22F4F7E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22F4F85A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CDSNanoAppRegistryAppDataProviderAppsChanged(uint64_t a1, void *a2)
{
  return [a2 _appsDidChange];
}

void sub_22F4FCB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_22F4FE260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

_DWORD *CSLPRFStateDataWithTitleDescriptionAndHints(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  if (!v3 || ![(__CFString *)v3 length])
  {

    uint64_t v3 = @"<nil title>";
  }
  if (!v4
    || ![v4 length]
    || ![MEMORY[0x263F08AC0] propertyList:v4 isValidForFormat:200])
  {
    int v8 = [NSString stringWithFormat:@"no descriptive state data or state data is not in property list format, please file a radar, description = %@", v4];
    id v11 = 0;
    id v5 = [MEMORY[0x263F08AC0] dataWithPropertyList:v8 format:200 options:0 error:&v11];
    id v6 = v11;

    if (!v5) {
      goto LABEL_8;
    }
LABEL_10:
    size_t v9 = [v5 length];
    uint64_t v7 = malloc_type_calloc(1uLL, v9 + 200, 0xC328D9A1uLL);
    *uint64_t v7 = 1;
    v7[1] = v9;
    [(__CFString *)v3 UTF8String];
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)[v5 bytes], v9);
    goto LABEL_11;
  }
  id v12 = 0;
  id v5 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:200 options:0 error:&v12];
  id v6 = v12;
  if (v5) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v7 = malloc_type_calloc(1uLL, 0xC8uLL, 0x595FB742uLL);
LABEL_11:

  return v7;
}

void sub_22F500048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1950(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1951(uint64_t a1)
{
}

void sub_22F50031C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_22F5005D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_22F5007D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_22F5009D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

id cslprf_app_library_log()
{
  if (cslprf_app_library_log_onceToken != -1) {
    dispatch_once(&cslprf_app_library_log_onceToken, &__block_literal_global_2084);
  }
  uint64_t v0 = (void *)cslprf_app_library_log___logger;
  return v0;
}

uint64_t __cslprf_app_library_log_block_invoke()
{
  cslprf_app_library_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "app_library");
  return MEMORY[0x270F9A758]();
}

id cslprf_app_switcher_log()
{
  if (cslprf_app_switcher_log_onceToken != -1) {
    dispatch_once(&cslprf_app_switcher_log_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)cslprf_app_switcher_log___logger;
  return v0;
}

uint64_t __cslprf_app_switcher_log_block_invoke()
{
  cslprf_app_switcher_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "app_switcher");
  return MEMORY[0x270F9A758]();
}

id cslprf_dock_log()
{
  if (cslprf_dock_log_onceToken != -1) {
    dispatch_once(&cslprf_dock_log_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)cslprf_dock_log___logger;
  return v0;
}

uint64_t __cslprf_dock_log_block_invoke()
{
  cslprf_dock_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "dock");
  return MEMORY[0x270F9A758]();
}

id cslprf_sessions_log()
{
  if (cslprf_sessions_log_onceToken != -1) {
    dispatch_once(&cslprf_sessions_log_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)cslprf_sessions_log___logger;
  return v0;
}

uint64_t __cslprf_sessions_log_block_invoke()
{
  cslprf_sessions_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "sessions");
  return MEMORY[0x270F9A758]();
}

id cslprf_settings_log()
{
  if (cslprf_settings_log_onceToken != -1) {
    dispatch_once(&cslprf_settings_log_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)cslprf_settings_log___logger;
  return v0;
}

uint64_t __cslprf_settings_log_block_invoke()
{
  cslprf_settings_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "settings");
  return MEMORY[0x270F9A758]();
}

id cslprf_sting_log()
{
  if (cslprf_sting_log_onceToken != -1) {
    dispatch_once(&cslprf_sting_log_onceToken, &__block_literal_global_16);
  }
  uint64_t v0 = (void *)cslprf_sting_log___logger;
  return v0;
}

uint64_t __cslprf_sting_log_block_invoke()
{
  cslprf_sting_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "sting");
  return MEMORY[0x270F9A758]();
}

id cslprf_sting_settings_log()
{
  if (cslprf_sting_settings_log_onceToken != -1) {
    dispatch_once(&cslprf_sting_settings_log_onceToken, &__block_literal_global_19);
  }
  uint64_t v0 = (void *)cslprf_sting_settings_log___logger;
  return v0;
}

uint64_t __cslprf_sting_settings_log_block_invoke()
{
  cslprf_sting_settings_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "sting_settings");
  return MEMORY[0x270F9A758]();
}

id cslprf_systemstate_log()
{
  if (cslprf_systemstate_log_onceToken != -1) {
    dispatch_once(&cslprf_systemstate_log_onceToken, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)cslprf_systemstate_log___logger;
  return v0;
}

uint64_t __cslprf_systemstate_log_block_invoke()
{
  cslprf_systemstate_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "systemstate");
  return MEMORY[0x270F9A758]();
}

id cslprf_backlight_log()
{
  if (cslprf_backlight_log_onceToken != -1) {
    dispatch_once(&cslprf_backlight_log_onceToken, &__block_literal_global_25);
  }
  uint64_t v0 = (void *)cslprf_backlight_log___logger;
  return v0;
}

uint64_t __cslprf_backlight_log_block_invoke()
{
  cslprf_backlight_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "backlight");
  return MEMORY[0x270F9A758]();
}

id cslprf_diagnostics_log()
{
  if (cslprf_diagnostics_log_onceToken != -1) {
    dispatch_once(&cslprf_diagnostics_log_onceToken, &__block_literal_global_28);
  }
  uint64_t v0 = (void *)cslprf_diagnostics_log___logger;
  return v0;
}

uint64_t __cslprf_diagnostics_log_block_invoke()
{
  cslprf_diagnostics_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "diagnostics");
  return MEMORY[0x270F9A758]();
}

id cslprf_fluidui_log()
{
  if (cslprf_fluidui_log_onceToken != -1) {
    dispatch_once(&cslprf_fluidui_log_onceToken, &__block_literal_global_31);
  }
  uint64_t v0 = (void *)cslprf_fluidui_log___logger;
  return v0;
}

uint64_t __cslprf_fluidui_log_block_invoke()
{
  cslprf_fluidui_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "fluidui");
  return MEMORY[0x270F9A758]();
}

id cslprf_icon_log()
{
  if (cslprf_icon_log_onceToken != -1) {
    dispatch_once(&cslprf_icon_log_onceToken, &__block_literal_global_34);
  }
  uint64_t v0 = (void *)cslprf_icon_log___logger;
  return v0;
}

uint64_t __cslprf_icon_log_block_invoke()
{
  cslprf_icon_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "icon");
  return MEMORY[0x270F9A758]();
}

id cslprf_icon_field_log()
{
  if (cslprf_icon_field_log_onceToken != -1) {
    dispatch_once(&cslprf_icon_field_log_onceToken, &__block_literal_global_37);
  }
  uint64_t v0 = (void *)cslprf_icon_field_log___logger;
  return v0;
}

uint64_t __cslprf_icon_field_log_block_invoke()
{
  cslprf_icon_field_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "icon_field");
  return MEMORY[0x270F9A758]();
}

id cslprf_startup_log()
{
  if (cslprf_startup_log_onceToken != -1) {
    dispatch_once(&cslprf_startup_log_onceToken, &__block_literal_global_40);
  }
  uint64_t v0 = (void *)cslprf_startup_log___logger;
  return v0;
}

uint64_t __cslprf_startup_log_block_invoke()
{
  cslprf_startup_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "startup");
  return MEMORY[0x270F9A758]();
}

id cslprf_ui_log()
{
  if (cslprf_ui_log_onceToken != -1) {
    dispatch_once(&cslprf_ui_log_onceToken, &__block_literal_global_43);
  }
  uint64_t v0 = (void *)cslprf_ui_log___logger;
  return v0;
}

uint64_t __cslprf_ui_log_block_invoke()
{
  cslprf_ui_log___logger = (uint64_t)os_log_create("com.apple.Carousel", "ui");
  return MEMORY[0x270F9A758]();
}

double CSLPRFInterpolatedFloat(double a1, double a2, double a3)
{
  return a1 + a3 * (a2 - a1);
}

double CSLPRFInterpolatedPoint(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5 * (a3 - a1);
}

BOOL CSLPRFGreater(double a1, double a2)
{
  return a1 - a2 > 0.0001;
}

BOOL CSLPRFGreaterEqual(double a1, double a2)
{
  return a1 - a2 > -0.0001;
}

BOOL CSLPRFLess(double a1, double a2)
{
  return a1 - a2 < -0.0001;
}

BOOL CSLPRFLessEqual(double a1, double a2)
{
  return a1 - a2 < 0.0001;
}

BOOL CSLPRFEqual(double a1, double a2)
{
  return vabdd_f64(a2, a1) < 0.0001;
}

BOOL CSLPRFNear(double a1, double a2, double a3)
{
  return a2 - a3 < a1 && a2 + a3 > a1;
}

double CSLPRFClip(double result, double a2, double a3)
{
  if (result >= a3) {
    uint64_t result = a3;
  }
  if (result <= a2) {
    return a2;
  }
  return result;
}

double CSLPRFPercent(double a1, double a2, double a3)
{
  double v4 = a3 - a2;
  double result = 1.0;
  if (v4 != 0.0) {
    return (a1 - a2) / v4;
  }
  return result;
}

double CSLPRFSaturate(double a1)
{
  return fmax(fmin(a1, 1.0), 0.0);
}

double CSLPRFDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

BOOL CSLPRFFGreater(float a1, float a2)
{
  return (float)(a1 - a2) > 0.0001;
}

BOOL CSLPRFFLess(float a1, float a2)
{
  return (float)(a1 - a2) < -0.0001;
}

BOOL CSLPRFFEqual(float a1, float a2)
{
  return vabds_f32(a2, a1) < 0.0001;
}

void sub_22F506CDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _CSLPairingIsTinker()
{
  uint64_t v0 = [MEMORY[0x263F57730] sharedInstance];
  uint64_t v1 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  uint64_t v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  uint64_t v3 = [v2 firstObject];

  double v4 = [v3 valueForProperty:*MEMORY[0x263F575B0]];
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

uint64_t CSLPairingIsTinker()
{
  uint64_t v0 = +[CSLPRFPairing shared];
  uint64_t v1 = [v0 isTinker];

  return v1;
}

uint64_t CSLSAllowReturnToAppUntilCrownPress()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (CSLSAllowReturnToAppUntilCrownPress_onceToken != -1) {
    dispatch_once(&CSLSAllowReturnToAppUntilCrownPress_onceToken, &__block_literal_global_2927);
  }
  if (CSLSAllowReturnToAppUntilCrownPress___canControlReturnToAppUntilCrownPress)
  {
    LOBYTE(v5[0]) = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowReturnToAppUntilCrownPress", @"com.apple.nano", (Boolean *)v5);
    if (LOBYTE(v5[0])) {
      BOOL v1 = AppBooleanValue == 0;
    }
    else {
      BOOL v1 = 1;
    }
    uint64_t v2 = !v1;
  }
  else
  {
    uint64_t v2 = 1;
  }
  if (CSLSAllowReturnToAppUntilCrownPress_log == 1)
  {
    uint64_t v3 = cslprf_sessions_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109376;
      v5[1] = CSLSAllowReturnToAppUntilCrownPress___canControlReturnToAppUntilCrownPress;
      __int16 v6 = 1024;
      int v7 = v2;
      _os_log_impl(&dword_22F4EA000, v3, OS_LOG_TYPE_DEFAULT, "__canControlReturnToAppUntilCrownPress = %{BOOL}u, allowReturnToAppUntilCrownPress = %{BOOL}u", (uint8_t *)v5, 0xEu);
    }

    CSLSAllowReturnToAppUntilCrownPress_log = 0;
  }
  return v2;
}

void __CSLSAllowReturnToAppUntilCrownPress_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F57730] sharedInstance];
  id v2 = [v0 getActivePairedDevice];

  BOOL v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"27120128-3A0E-492A-8BBC-C57A70E362CA"];
  CSLSAllowReturnToAppUntilCrownPress___canControlReturnToAppUntilCrownPress = [v2 supportsCapability:v1];

  CSLSAllowReturnToAppUntilCrownPress_log = 1;
}

void sub_22F507A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22F507BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2983(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2984(uint64_t a1)
{
}

void sub_22F50964C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__3078(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3079(uint64_t a1)
{
}

void sub_22F509C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_22F50C160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22F50CAD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_22F50CC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22F50CF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22F50D07C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22F50DBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22F50DEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3789(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3790(uint64_t a1)
{
}

void sub_22F50E818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22F50EB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CSLPRFConfigurationSourceString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"setup";
  }
  else {
    return off_264A0B710[a1 - 1];
  }
}

void sub_22F50F2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3893(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3894(uint64_t a1)
{
}

uint64_t CSLAlertServiceIsApplePay(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.nanopassbook.alert"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.nanopassbook.transactioncompletealert"];
  }

  return v2;
}

uint64_t CSLAlertServiceIsSharingAuth(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.sharing.auth"];
}

uint64_t CSLAlertServiceOverControlCenter(void *a1)
{
  id v1 = a1;
  if (CSLAlertServiceIsApplePay(v1)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.sharing.auth"];
  }

  return v2;
}

uint64_t CSLAlertServiceIsNanoSharing(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.nanosharing.alert"];
}

void sub_22F50FF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4172(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4173(uint64_t a1)
{
}

void sub_22F51012C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CSLPRFEqualLiveActivitiesAppSettingsValues(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 == v4)
  {
    uint64_t v10 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && (objc_opt_respondsToSelector() & 1) != 0
  }
         && (int v5 = [v3 globalAllowLiveActivities],
             v5 == [v4 globalAllowLiveActivities])
         && (objc_opt_respondsToSelector() & 1) != 0
         && (objc_opt_respondsToSelector() & 1) != 0
         && (int v6 = [v3 globalAutoLaunchLiveActivities],
             v6 == [v4 globalAutoLaunchLiveActivities])
         && (objc_opt_respondsToSelector() & 1) != 0
         && (objc_opt_respondsToSelector() & 1) != 0
         && (int v7 = [v3 allowLiveActivitiesForApp],
             v7 == [v4 allowLiveActivitiesForApp])
         && (objc_opt_respondsToSelector() & 1) != 0
         && (objc_opt_respondsToSelector() & 1) != 0
         && (uint64_t v8 = [v3 autoLaunchBehaviorForApp], v8 == objc_msgSend(v4, "autoLaunchBehaviorForApp"))
         && (objc_opt_respondsToSelector() & 1) != 0
         && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v9 = [v3 supportsSmartStack];
    uint64_t v10 = v9 ^ [v4 supportsSmartStack] ^ 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

__CFString *CSLPRFLiveActivitiesAutoLaunchAppSettingToNSString(uint64_t a1)
{
  id v1 = @"Off";
  if (a1 == 1) {
    id v1 = @"Smart Stack";
  }
  if (a1 == 2) {
    return @"App";
  }
  else {
    return v1;
  }
}

void sub_22F513E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CSLAppSwitcherModeToNSString(uint64_t a1)
{
  if (a1) {
    return @"mru";
  }
  else {
    return @"favorites";
  }
}

void sub_22F5146B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_22F5147A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22F5148E8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22F5148F8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22F514908()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BPSGetActiveSetupCompletedDevice()
{
  return MEMORY[0x270F12840]();
}

uint64_t BPSIsNewsAllowed()
{
  return MEMORY[0x270F12848]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
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
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
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

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95C8](label);
}

void free(void *a1)
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}