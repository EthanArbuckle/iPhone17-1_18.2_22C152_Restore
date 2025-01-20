uint64_t UNIsInternalInstall()
{
  return os_variant_has_internal_content();
}

void UNRegisterUserNotificationsLogging()
{
  if (UNRegisterUserNotificationsLogging_onceToken != -1) {
    dispatch_once(&UNRegisterUserNotificationsLogging_onceToken, &__block_literal_global_1);
  }
}

uint64_t UNEqualStrings(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqualToString:a2];
  }
  else {
    return a1 == a2;
  }
}

uint64_t UNEqualObjects(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqual:a2];
  }
  else {
    return a1 == a2;
  }
}

BOOL UNSimilarStrings(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    if ([v3 isEqualToString:v4])
    {
LABEL_4:
      BOOL v6 = 1;
      goto LABEL_9;
    }
  }
  else if (v3 == v4)
  {
    goto LABEL_4;
  }
  if ([v3 length]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = [v5 length] == 0;
  }
LABEL_9:

  return v6;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
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

__CFString *UNFormatLocalizedStringInBundleWithDefaultValue(void *a1, void *a2, __CFBundle *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  v10 = (__CFString *)v7;
  v11 = (__CFString *)v9;
  uint64_t v12 = [(__CFString *)v10 length];
  if (a3 && v12)
  {
    CFStringRef v13 = CFBundleCopyLocalizedString(a3, v10, v11, 0);
  }
  else if (v11)
  {
    CFStringRef v13 = v11;
  }
  else
  {
    if (!v10)
    {
      v14 = 0;
      goto LABEL_9;
    }
    CFStringRef v13 = v10;
  }
  v14 = (__CFString *)v13;
LABEL_9:

  if (-[__CFString length](v14, "length") && [v8 count])
  {
    UNFormatLocalizedString(v14, v8);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v14;
  }
  v16 = v15;

  return v16;
}

id UNSafeCast(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void sub_1AE7315E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

uint64_t __UNRegisterUserNotificationsLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)UNLogSubsystem, "AppLaunching");
  v1 = (void *)UNLogAppLaunching;
  UNLogAppLaunching = (uint64_t)v0;

  os_log_t v2 = os_log_create((const char *)UNLogSubsystem, "AttachmentsService");
  id v3 = (void *)UNLogAttachmentsService;
  UNLogAttachmentsService = (uint64_t)v2;

  os_log_t v4 = os_log_create((const char *)UNLogSubsystem, "AttachmentsRepository");
  v5 = (void *)UNLogAttachmentsRepository;
  UNLogAttachmentsRepository = (uint64_t)v4;

  os_log_t v6 = os_log_create((const char *)UNLogSubsystem, "Categories");
  id v7 = (void *)UNLogCategories;
  UNLogCategories = (uint64_t)v6;

  os_log_t v8 = os_log_create((const char *)UNLogSubsystem, "CommunicationNotifications");
  id v9 = (void *)UNLogCommunicationNotifications;
  UNLogCommunicationNotifications = (uint64_t)v8;

  os_log_t v10 = os_log_create((const char *)UNLogSubsystem, "Connections");
  v11 = (void *)UNLogConnections;
  UNLogConnections = (uint64_t)v10;

  os_log_t v12 = os_log_create((const char *)UNLogSubsystem, "ContentProtection");
  CFStringRef v13 = (void *)UNLogContentProtection;
  UNLogContentProtection = (uint64_t)v12;

  os_log_t v14 = os_log_create((const char *)UNLogSubsystem, "DataProvider");
  v15 = (void *)UNLogDataProvider;
  UNLogDataProvider = (uint64_t)v14;

  os_log_t v16 = os_log_create((const char *)UNLogSubsystem, "DataProviderFactory");
  v17 = (void *)UNLogDataProviderFactory;
  UNLogDataProviderFactory = (uint64_t)v16;

  os_log_t v18 = os_log_create((const char *)UNLogSubsystem, "DataStore");
  v19 = (void *)UNLogDataStore;
  UNLogDataStore = (uint64_t)v18;

  os_log_t v20 = os_log_create((const char *)UNLogSubsystem, "LocalNotifications");
  v21 = (void *)UNLogLocalNotifications;
  UNLogLocalNotifications = (uint64_t)v20;

  os_log_t v22 = os_log_create((const char *)UNLogSubsystem, "Migration");
  v23 = (void *)UNLogMigration;
  UNLogMigration = (uint64_t)v22;

  os_log_t v24 = os_log_create((const char *)UNLogSubsystem, "Persistence");
  uint64_t v25 = (void *)UNLogPersistence;
  UNLogPersistence = (uint64_t)v24;

  os_log_t v26 = os_log_create((const char *)UNLogSubsystem, "RemoteNotifications");
  v27 = (void *)UNLogRemoteNotifications;
  UNLogRemoteNotifications = (uint64_t)v26;

  os_log_t v28 = os_log_create((const char *)UNLogSubsystem, "ServiceExtension");
  v29 = (void *)UNLogServiceExtension;
  UNLogServiceExtension = (uint64_t)v28;

  os_log_t v30 = os_log_create((const char *)UNLogSubsystem, "Settings");
  v31 = (void *)UNLogSettings;
  UNLogSettings = (uint64_t)v30;

  os_log_t v32 = os_log_create((const char *)UNLogSubsystem, "Spotlight");
  v33 = (void *)UNLogSpotlight;
  UNLogSpotlight = (uint64_t)v32;

  os_log_t v34 = os_log_create((const char *)UNLogSubsystem, "SystemService");
  v35 = (void *)UNLogSystemService;
  UNLogSystemService = (uint64_t)v34;

  os_log_t v36 = os_log_create((const char *)UNLogSubsystem, "Utilities");
  v37 = (void *)UNLogUtilities;
  UNLogUtilities = (uint64_t)v36;

  UNLogPipelineAdapter = (uint64_t)os_log_create((const char *)UNLogSubsystem, "PipelineAdapter");

  return MEMORY[0x1F41817F8]();
}

__CFString *UNStringFromNotificationAttachmentDisplayLocation(unint64_t a1)
{
  if (a1 > 2) {
    return @"<invalid>";
  }
  else {
    return off_1E5F05EE0[a1];
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1AE738228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *UNShowPreviewsSettingString(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E5F05FE8[a1];
  }
}

__CFString *UNNotificationSettingString(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E5F05FD0[a1];
  }
}

__CFString *UNNotificationGroupingSettingString(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E5F06018[a1];
  }
}

__CFString *UNAuthorizationStatusString(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_1E5F05FA8[a1];
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL UNSimilarArrays(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    if ([v3 isEqual:v4])
    {
LABEL_4:
      BOOL v6 = 1;
      goto LABEL_9;
    }
  }
  else if (v3 == v4)
  {
    goto LABEL_4;
  }
  if ([v3 count]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = [v5 count] == 0;
  }
LABEL_9:

  return v6;
}

BOOL UNSimilarSets(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    if ([v3 isEqual:v4])
    {
LABEL_4:
      BOOL v6 = 1;
      goto LABEL_9;
    }
  }
  else if (v3 == v4)
  {
    goto LABEL_4;
  }
  if ([v3 count]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = [v5 count] == 0;
  }
LABEL_9:

  return v6;
}

uint64_t UNEqualBools(int a1, int a2)
{
  return a1 ^ a2 ^ 1u;
}

BOOL UNEqualIntegers(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL UNEqualDoubles(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

BOOL UNDoubleIsZero(double a1)
{
  return fabs(a1) < 2.22044605e-16;
}

BOOL UNEqualFloats(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.00000011921;
}

BOOL UNFloatIsZero(float a1)
{
  return fabsf(a1) < 0.00000011921;
}

void UNLogToDeveloper(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = [NSString stringWithFormat:@"%@: %@", a1, a2];
  NSLog((NSString *)@"%@", v2);
  id v3 = UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1AE729000, v3, OS_LOG_TYPE_DEFAULT, "Logged to developer: %{public}@", buf, 0xCu);
  }
}

id UNNotificationDestinationStrings(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = v2;
  if ((a1 & 4) != 0)
  {
    [v2 addObject:@"NotificationCenter"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"LockScreen"];
  if ((a1 & 1) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v3 addObject:@"Alert"];
  if ((a1 & 8) != 0) {
LABEL_5:
  }
    [v3 addObject:@"CarPlay"];
LABEL_6:

  return v3;
}

uint64_t UNNotificationAttachmentFamilyFromTypeIdentifier(void *a1)
{
  CFStringRef v1 = a1;
  id v2 = (__CFString *)v1;
  if (!v1) {
    goto LABEL_32;
  }
  if (UTTypeConformsTo(v1, (CFStringRef)*MEMORY[0x1E4F22538]) != 1)
  {
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F225F8];
    if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F225F8]) == 1)
    {
      if (UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22610])
        || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F225D8])
        || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22678])
        || UTTypeEqual(v2, @"public.heic")
        || UTTypeEqual(v2, v4))
      {
        uint64_t v3 = 2;
        goto LABEL_33;
      }
    }
    else if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22660]) == 1 {
           && (UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F226A0])
    }
            || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22638])
            || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22640])
            || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22648])
            || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22510])
            || UTTypeEqual(v2, @"com.apple.m4v-video")
            || UTTypeEqual(v2, @"public.3gpp")
            || UTTypeEqual(v2, @"public.3gpp2")))
    {
      uint64_t v3 = 3;
      goto LABEL_33;
    }
LABEL_32:
    uint64_t v3 = 0;
    goto LABEL_33;
  }
  if (!UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22540])
    && !UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22728])
    && !UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22630])
    && !UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E4F22650])
    && !UTTypeEqual(v2, @"com.apple.m4a-audio")
    && !UTTypeEqual(v2, @"com.apple.coreaudio-format")
    && !UTTypeEqual(v2, @"public.aifc-audio")
    && !UTTypeEqual(v2, @"org.3gpp.adaptive-multi-rate-audio")
    && !UTTypeEqual(v2, @"public.au-audio")
    && !UTTypeEqual(v2, @"public.ac3-audio")
    && !UTTypeEqual(v2, @"public.enhanced-ac3-audio"))
  {
    goto LABEL_32;
  }
  uint64_t v3 = 1;
LABEL_33:

  return v3;
}

uint64_t UNNotificationAttachmentFamilyMaximumSize(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1AE75E7A0[a1 - 1];
  }
}

__CFString *UNNotificationAttachmentFamilyToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"<Invalid>";
  }
  else {
    return off_1E5F06160[a1 - 1];
  }
}

void sub_1AE73D0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

Class __getINSendMessageIntentClass_block_invoke(uint64_t a1)
{
  IntentsLibrary();
  Class result = objc_getClass("INSendMessageIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINSendMessageIntentClass_block_invoke_cold_1();
  }
  getINSendMessageIntentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void IntentsLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!IntentsLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __IntentsLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5F061C8;
    uint64_t v2 = 0;
    IntentsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntentsLibraryCore_frameworkLibrary) {
    IntentsLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __IntentsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntentsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getINStartCallIntentClass_block_invoke(uint64_t a1)
{
  IntentsLibrary();
  Class result = objc_getClass("INStartCallIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINStartCallIntentClass_block_invoke_cold_1();
  }
  getINStartCallIntentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id UNSafeCastAny(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = UNSafeCast(*(void *)(*((void *)&v13 + 1) + 8 * i), v4);
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

id UNSafeConforms(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:a1]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

__CFString *_UNNotificationCommunicationContextCapabilitiesDescription(uint64_t a1)
{
  long long v1 = &stru_1F062A810;
  if (!a1) {
    long long v1 = @"Unspecified";
  }
  if (a1) {
    return @"Video";
  }
  else {
    return v1;
  }
}

id UNBundle()
{
  if (UNBundle___onceToken != -1) {
    dispatch_once(&UNBundle___onceToken, &__block_literal_global_3);
  }
  os_log_t v0 = (void *)UNBundle___userNotificationBundle;

  return v0;
}

uint64_t __UNBundle_block_invoke()
{
  UNBundle___userNotificationBundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

id UNLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = UNBundle();
  id v3 = [v2 localizedStringForKey:v1 value:&stru_1F062A810 table:0];

  return v3;
}

id UNLocalizedFormatStringForKey(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = UNBundle();
  id v4 = [v3 localizedStringForKey:v2 value:&stru_1F062A810 table:0];

  return v4;
}

void sub_1AE746788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t UNCOneness()
{
  return _os_feature_enabled_impl();
}

uint64_t UNCCatchMe()
{
  return _os_feature_enabled_impl();
}

uint64_t UNCCatchMeHighlights()
{
  return _os_feature_enabled_impl();
}

uint64_t UNCDaemonEnabled()
{
  if (_os_feature_enabled_impl())
  {
    if (os_variant_has_internal_content() && _os_feature_enabled_impl())
    {
      os_log_t v0 = UNLogUtilities;
      if (os_log_type_enabled((os_log_t)UNLogUtilities, OS_LOG_TYPE_ERROR)) {
        UNCDaemonEnabled_cold_1(v0);
      }
    }
    return 0;
  }
  else
  {
    return _os_feature_enabled_impl();
  }
}

uint64_t UNCUseGroupService()
{
  uint64_t result = UNCUsePipeline();
  if (result)
  {
    return _os_feature_enabled_impl();
  }
  return result;
}

uint64_t UNCUsePipeline()
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }

  return _os_feature_enabled_impl();
}

uint64_t UNCRemoteServicesNeeded()
{
  if (_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl()) {
    return 1;
  }

  return UNCDaemonEnabled();
}

void sub_1AE748DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINSendMessageIntentClass_block_invoke_0(uint64_t a1)
{
  IntentsLibrary_0();
  Class result = objc_getClass("INSendMessageIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINSendMessageIntentClass_block_invoke_cold_1_0();
  }
  getINSendMessageIntentClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void IntentsLibrary_0()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!IntentsLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __IntentsLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5F06458;
    uint64_t v2 = 0;
    IntentsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!IntentsLibraryCore_frameworkLibrary_0) {
    IntentsLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __IntentsLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  IntentsLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getINStartCallIntentClass_block_invoke_0(uint64_t a1)
{
  IntentsLibrary_0();
  Class result = objc_getClass("INStartCallIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINStartCallIntentClass_block_invoke_cold_1_0();
  }
  getINStartCallIntentClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getINReadAnnouncementIntentClass_block_invoke(uint64_t a1)
{
  IntentsLibrary_0();
  Class result = objc_getClass("INReadAnnouncementIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINReadAnnouncementIntentClass_block_invoke_cold_1();
  }
  getINReadAnnouncementIntentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id UNFormatLocalizedString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [MEMORY[0x1E4F1CA58] data];
  id v6 = v3;
  uint64_t v7 = (unsigned char *)[v6 UTF8String];
  uint64_t v8 = (uint64_t)v7;
  if (v7)
  {
    int v9 = *v7;
    if (*v7)
    {
      unint64_t v10 = 0;
      v11 = 0;
      do
      {
        char v24 = v9;
        os_log_t v12 = v11 + 1;
        long long v13 = &v11[v8 + 1];
        int v14 = *v13;
        char v23 = *v13;
        if (v9 == 37)
        {
          if (v14 == 64)
          {
            if (v10 >= [v4 count]) {
              [MEMORY[0x1E4F1CA98] null];
            }
            else {
            v17 = [v4 objectAtIndex:v10];
            }
            uint64_t v18 = [v17 description];
            v19 = [v18 dataUsingEncoding:4];

            [v5 appendData:v19];
            ++v10;
LABEL_17:

            goto LABEL_18;
          }
          if ((v14 - 48) <= 9)
          {
            os_log_t v22 = 0;
            uint64_t v15 = strtol(v13, &v22, 10);
            os_log_t v12 = &v22[~v8];
            if (*v22 != 36 || v22[1] != 64) {
              goto LABEL_18;
            }
            uint64_t v16 = v15 - 1;
            if (v15 - 1 >= (unint64_t)[v4 count]) {
              [MEMORY[0x1E4F1CA98] null];
            }
            else {
            v17 = [v4 objectAtIndex:v16];
            }
            os_log_t v20 = [v17 description];
            v19 = [v20 dataUsingEncoding:4];

            [v5 appendData:v19];
            v12 += 2;
            goto LABEL_17;
          }
          if (v14)
          {
            if (v14 == 37) {
              [v5 appendBytes:&v23 length:1];
            }
            goto LABEL_18;
          }
        }
        else
        {
          [v5 appendBytes:&v24 length:1];
        }
        os_log_t v12 = v11;
LABEL_18:
        v11 = v12 + 1;
        int v9 = v12[v8 + 1];
      }
      while (v12[v8 + 1]);
    }
    uint64_t v8 = [[NSString alloc] initWithData:v5 encoding:4];
  }

  return (id)v8;
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id OUTLINED_FUNCTION_3(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void __getINSendMessageIntentClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getINSendMessageIntentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_UNNotificationCommunicationContext+INIntent.m", 27, @"Unable to find class %s", "INSendMessageIntent");

  __break(1u);
}

void IntentsLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *IntentsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"_UNNotificationCommunicationContext+INIntent.m", 22, @"%s", *a1);

  __break(1u);
}

void __getINStartCallIntentClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getINStartCallIntentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_UNNotificationCommunicationContext+INIntent.m", 28, @"Unable to find class %s", "INStartCallIntent");

  __break(1u);
}

void UNCDaemonEnabled_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AE729000, log, OS_LOG_TYPE_ERROR, "UserNotificationsDaemon forced OFF. If you intended to enable this, see UNFeatureFlags.m.", v1, 2u);
}

void __getINSendMessageIntentClass_block_invoke_cold_1_0()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getINSendMessageIntentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UNNotificationContent.m", 39, @"Unable to find class %s", "INSendMessageIntent");

  __break(1u);
}

void IntentsLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *IntentsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UNNotificationContent.m", 38, @"%s", *a1);

  __break(1u);
}

void __getINStartCallIntentClass_block_invoke_cold_1_0()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getINStartCallIntentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UNNotificationContent.m", 40, @"Unable to find class %s", "INStartCallIntent");

  __break(1u);
}

void __getINReadAnnouncementIntentClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getINReadAnnouncementIntentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UNNotificationContent.m", 41, @"Unable to find class %s", "INReadAnnouncementIntent");

  __break(1u);
}

uint64_t BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C248]();
}

uint64_t BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5B8]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1F410C678]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

void CFRelease(CFTypeRef cf)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x1F40DEE68](inUTI1, inUTI2);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1F40D92B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
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

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}