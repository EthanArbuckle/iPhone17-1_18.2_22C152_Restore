@interface DMCMultiUserModeUtilities
+ (BOOL)_updateMultiUserConfigurationFileAtPath:(id)a3 key:(id)a4 value:(id)a5;
+ (BOOL)_updateMultiUserDeviceConfigurationFileWithKey:(id)a3 value:(id)a4;
+ (BOOL)_updateMultiUserUserConfigurationFileWithKey:(id)a3 value:(id)a4;
+ (BOOL)awaitUserConfigurationEnabled;
+ (BOOL)configureAwaitUserConfiguration:(id)a3;
+ (BOOL)configureMAIDDefaultDomains:(id)a3;
+ (BOOL)configureOnlineAuthenticationGracePeriod:(id)a3;
+ (BOOL)configureShouldSkipLanguageAndLocaleSetupForNewUsers:(BOOL)a3;
+ (BOOL)configureTemporarySessionOnly:(BOOL)a3 useDynamicQuotaSize:(BOOL)a4 restoreQuotaSizeWhenDisabled:(BOOL)a5 preferenceDomain:(__CFString *)a6;
+ (BOOL)configureTemporarySessionTimeout:(double)a3;
+ (BOOL)configureUserSessionTimeout:(double)a3;
+ (BOOL)deviceHasMultipleUsers;
+ (BOOL)inSharediPadUserSession;
+ (BOOL)isCurrentUserConfigured;
+ (BOOL)isEphemeralMultiUser;
+ (BOOL)isFirstSetupBuddyDone;
+ (BOOL)isPrimaryUserSession;
+ (BOOL)isSharediPad;
+ (BOOL)markCurrentUserAsConfigured;
+ (BOOL)shouldSkipLanguageAndLocaleSetupForNewUsers;
+ (BOOL)temporarySessionOnly;
+ (BOOL)useDynamicQuotaSize;
+ (double)temporarySessionTimeout;
+ (double)userSessionTimeout;
+ (id)_configureQuotaSizeForSharedDeviceImmediately:(id)a3;
+ (id)_configureResidentUsersNumberForSharedDeviceImmediately:(id)a3;
+ (id)configureQuotaSizeForSharedDevice:(id)a3 preferenceDomain:(__CFString *)a4;
+ (id)configureResidentUsersNumberForSharedDevice:(id)a3 preferenceDomain:(__CFString *)a4;
+ (id)configureToSharedDeviceWithPreferenceDomain:(__CFString *)a3;
+ (id)managedAppleIDDefaultDomains;
+ (id)onlineAuthenticationGracePeriod;
+ (unint64_t)_getDiskSize;
+ (unint64_t)_previousQuotaSize;
+ (unint64_t)getDiskAvailableSize;
@end

@implementation DMCMultiUserModeUtilities

+ (BOOL)isSharediPad
{
  v2 = (void *)MKBUserTypeDeviceMode();
  v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F78100]];
    v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F78150]];
    if ([v4 isEqualToString:*MEMORY[0x1E4F78110]]) {
      char v6 = [v5 isEqualToString:*MEMORY[0x1E4F78148]];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    v4 = 0;
    NSLog(&cfstr_Mkbusertypedev.isa, 0);
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isEphemeralMultiUser
{
  return +[DMCMultiUserModeUtilities isSharediPad];
}

+ (BOOL)inSharediPadUserSession
{
  if (![a1 isSharediPad])
  {
LABEL_7:
    LOBYTE(v6) = 0;
    return v6;
  }
  id v3 = DMCUMUserManagerClass();
  if (!v3)
  {
    v7 = DMCLogObjects()[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_ERROR, "Failed to load user manager class. Returning NO for inSharediPadUserSession.", v9, 2u);
    }
    goto LABEL_7;
  }
  v4 = [v3 sharedManager];
  v5 = [v4 currentUser];

  if ([a1 isSharediPad]) {
    int v6 = [v5 isLoginUser] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)deviceHasMultipleUsers
{
  id v2 = DMCUMUserManagerClass();
  if (v2)
  {
    id v3 = [v2 sharedManager];
    v4 = [v3 allUsers];
    BOOL v5 = (unint64_t)[v4 count] > 1;
  }
  else
  {
    int v6 = DMCLogObjects()[1];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A7863000, v6, OS_LOG_TYPE_ERROR, "Failed to load user manager class. Returning NO for deviceHasMultipleUsers.", v8, 2u);
    }
    return 0;
  }
  return v5;
}

+ (BOOL)isPrimaryUserSession
{
  if (isPrimaryUserSession_onceToken != -1) {
    dispatch_once(&isPrimaryUserSession_onceToken, &__block_literal_global_14);
  }
  return isPrimaryUserSession_result;
}

uint64_t __49__DMCMultiUserModeUtilities_isPrimaryUserSession__block_invoke()
{
  uint64_t result = +[DMCMultiUserModeUtilities isSharediPad];
  if (result)
  {
    BOOL v1 = 0;
  }
  else
  {
    uint64_t result = getuid();
    BOOL v1 = result == 501;
  }
  isPrimaryUserSession_uint64_t result = v1;
  return result;
}

+ (id)configureToSharedDeviceWithPreferenceDomain:(__CFString *)a3
{
  v4 = DMCLogObjects()[1];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEFAULT, "Configuring device to shared device", v11, 2u);
  }
  BOOL v5 = (void *)CFPreferencesCopyAppValue(@"MCSharedDeviceUserQuotaSize", a3);
  if (v5)
  {
    int v6 = +[DMCMultiUserModeUtilities _configureQuotaSizeForSharedDeviceImmediately:v5];
  }
  else
  {
    CFPropertyListRef v7 = CFPreferencesCopyAppValue(@"MCMaximumResidentUsers", a3);
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = &unk_1EFD88730;
    }
    int v6 = +[DMCMultiUserModeUtilities _configureResidentUsersNumberForSharedDeviceImmediately:v9];
  }
  return v6;
}

+ (id)configureQuotaSizeForSharedDevice:(id)a3 preferenceDomain:(__CFString *)a4
{
  id v5 = a3;
  if (+[DMCMultiUserModeUtilities isFirstSetupBuddyDone])
  {
    int v6 = +[DMCMultiUserModeUtilities _configureQuotaSizeForSharedDeviceImmediately:v5];
  }
  else
  {
    CFPropertyListRef v7 = DMCLogObjects()[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_DEFAULT, "We are in buddy, caching the user quota info", v9, 2u);
    }
    CFPreferencesSetAppValue(@"MCSharedDeviceUserQuotaSize", v5, a4);
    CFPreferencesAppSynchronize(a4);
    int v6 = 0;
  }

  return v6;
}

+ (id)configureResidentUsersNumberForSharedDevice:(id)a3 preferenceDomain:(__CFString *)a4
{
  id v5 = a3;
  if (+[DMCMultiUserModeUtilities isFirstSetupBuddyDone])
  {
    int v6 = +[DMCMultiUserModeUtilities _configureResidentUsersNumberForSharedDeviceImmediately:v5];
  }
  else
  {
    CFPropertyListRef v7 = DMCLogObjects()[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_DEFAULT, "We are in buddy, caching the maximum resident user info", v9, 2u);
    }
    CFPreferencesSetAppValue(@"MCMaximumResidentUsers", v5, a4);
    CFPreferencesAppSynchronize(a4);
    int v6 = 0;
  }

  return v6;
}

+ (BOOL)isFirstSetupBuddyDone
{
  return (DMCIsSetupBuddyDone() & 1) != 0 || getuid() != 501;
}

+ (BOOL)configureUserSessionTimeout:(double)a3
{
  if (a3 <= 0.0)
  {
    return +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:@"UserSessionTimeout" value:&unk_1EFD88748];
  }
  else
  {
    id v3 = objc_msgSend(NSNumber, "numberWithDouble:");
    BOOL v4 = +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:@"UserSessionTimeout" value:v3];

    return v4;
  }
}

+ (BOOL)configureTemporarySessionTimeout:(double)a3
{
  if (a3 <= 0.0)
  {
    return +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:@"TemporarySessionTimeout" value:&unk_1EFD88748];
  }
  else
  {
    id v3 = objc_msgSend(NSNumber, "numberWithDouble:");
    BOOL v4 = +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:@"TemporarySessionTimeout" value:v3];

    return v4;
  }
}

+ (BOOL)configureTemporarySessionOnly:(BOOL)a3 useDynamicQuotaSize:(BOOL)a4 restoreQuotaSizeWhenDisabled:(BOOL)a5 preferenceDomain:(__CFString *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  if (+[DMCMultiUserModeUtilities temporarySessionOnly](DMCMultiUserModeUtilities, "temporarySessionOnly") == a3&& +[DMCMultiUserModeUtilities useDynamicQuotaSize] == v8)
  {
    return 1;
  }
  if (v9)
  {
    v11 = [NSNumber numberWithBool:v8];
    +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:@"UseDynamicQuota" value:v11];

    if (v8)
    {
      if (+[DMCMultiUserModeUtilities isFirstSetupBuddyDone])
      {
        v12 = [DMCUMUserManagerClass() sharedManager];
        uint64_t v13 = [v12 userQuotaSize];
      }
      else
      {
        v12 = (void *)CFPreferencesCopyAppValue(@"MCSharedDeviceUserQuotaSize", a6);
        uint64_t v13 = [v12 unsignedLongValue];
      }
      uint64_t v18 = v13;

      if (v18)
      {
        v19 = [NSNumber numberWithUnsignedInteger:v18];
        +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:@"MCPreviousQuotaSize" value:v19];
      }
      id v20 = (id)[a1 configureResidentUsersNumberForSharedDevice:&unk_1EFD88760 preferenceDomain:a6];
    }
  }
  else if (v7)
  {
    unint64_t v14 = +[DMCMultiUserModeUtilities _previousQuotaSize];
    NSLog(&cfstr_SPreviousQuota.isa, "+[DMCMultiUserModeUtilities configureTemporarySessionOnly:useDynamicQuotaSize:restoreQuotaSizeWhenDisabled:preferenceDomain:]", v14);
    if (v14)
    {
      v15 = [NSNumber numberWithUnsignedInteger:v14];
      id v16 = (id)[a1 configureQuotaSizeForSharedDevice:v15 preferenceDomain:a6];
    }
  }
  v21 = [NSNumber numberWithBool:v9];
  BOOL v22 = +[DMCMultiUserModeUtilities _updateMultiUserDeviceConfigurationFileWithKey:@"TemporarySessionOnly" value:v21];

  return v22;
}

+ (double)userSessionTimeout
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = DMCMultiUserDeviceConfigurationFilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  double v5 = 0.0;
  if (v4)
  {
    int v6 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v7 = DMCMultiUserDeviceConfigurationFilePath();
    BOOL v8 = [v6 DMCDictionaryFromFile:v7];
    BOOL v9 = [v8 objectForKeyedSubscript:@"UserSessionTimeout"];
    [v9 floatValue];
    double v5 = v10;
  }
  return v5;
}

+ (double)temporarySessionTimeout
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = DMCMultiUserDeviceConfigurationFilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  double v5 = 0.0;
  if (v4)
  {
    int v6 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v7 = DMCMultiUserDeviceConfigurationFilePath();
    BOOL v8 = [v6 DMCDictionaryFromFile:v7];
    BOOL v9 = [v8 objectForKeyedSubscript:@"TemporarySessionTimeout"];
    [v9 floatValue];
    double v5 = v10;
  }
  return v5;
}

+ (BOOL)temporarySessionOnly
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = DMCMultiUserDeviceConfigurationFilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  if (!v4) {
    return 0;
  }
  double v5 = (void *)MEMORY[0x1E4F1C9E8];
  int v6 = DMCMultiUserDeviceConfigurationFilePath();
  BOOL v7 = [v5 DMCDictionaryFromFile:v6];
  BOOL v8 = [v7 objectForKeyedSubscript:@"TemporarySessionOnly"];
  char v9 = [v8 BOOLValue];

  return v9;
}

+ (BOOL)useDynamicQuotaSize
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = DMCMultiUserDeviceConfigurationFilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  if (!v4) {
    return 0;
  }
  double v5 = (void *)MEMORY[0x1E4F1C9E8];
  int v6 = DMCMultiUserDeviceConfigurationFilePath();
  BOOL v7 = [v5 DMCDictionaryFromFile:v6];
  BOOL v8 = [v7 objectForKeyedSubscript:@"UseDynamicQuota"];
  char v9 = [v8 BOOLValue];

  return v9;
}

+ (BOOL)configureMAIDDefaultDomains:(id)a3
{
  int v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  double v5 = [v4 allObjects];

  LOBYTE(a1) = [a1 _updateMultiUserDeviceConfigurationFileWithKey:@"ManagedAppleIDDefaultDomains" value:v5];
  return (char)a1;
}

+ (id)managedAppleIDDefaultDomains
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = DMCMultiUserDeviceConfigurationFilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    double v5 = (void *)MEMORY[0x1E4F1C9E8];
    int v6 = DMCMultiUserDeviceConfigurationFilePath();
    BOOL v7 = [v5 DMCDictionaryFromFile:v6];
    BOOL v8 = [v7 objectForKeyedSubscript:@"ManagedAppleIDDefaultDomains"];
  }
  else
  {
    BOOL v8 = 0;
  }
  return v8;
}

+ (BOOL)configureOnlineAuthenticationGracePeriod:(id)a3
{
  return [a1 _updateMultiUserDeviceConfigurationFileWithKey:@"OnlineAuthenticationGracePeriod" value:a3];
}

+ (id)onlineAuthenticationGracePeriod
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = DMCMultiUserDeviceConfigurationFilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    double v5 = (void *)MEMORY[0x1E4F1C9E8];
    int v6 = DMCMultiUserDeviceConfigurationFilePath();
    BOOL v7 = [v5 DMCDictionaryFromFile:v6];
    BOOL v8 = [v7 objectForKeyedSubscript:@"OnlineAuthenticationGracePeriod"];
  }
  else
  {
    BOOL v8 = 0;
  }
  return v8;
}

+ (BOOL)configureShouldSkipLanguageAndLocaleSetupForNewUsers:(BOOL)a3
{
  int v4 = [NSNumber numberWithBool:a3];
  LOBYTE(a1) = [a1 _updateMultiUserDeviceConfigurationFileWithKey:@"SkipLanguageAndLocaleSetupForNewUsers" value:v4];

  return (char)a1;
}

+ (BOOL)shouldSkipLanguageAndLocaleSetupForNewUsers
{
  if (!+[DMCMultiUserModeUtilities isSharediPad]) {
    return 0;
  }
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = DMCMultiUserDeviceConfigurationFilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  if (!v4) {
    return 0;
  }
  double v5 = (void *)MEMORY[0x1E4F1C9E8];
  int v6 = DMCMultiUserDeviceConfigurationFilePath();
  BOOL v7 = [v5 DMCDictionaryFromFile:v6];
  BOOL v8 = [v7 objectForKeyedSubscript:@"SkipLanguageAndLocaleSetupForNewUsers"];
  char v9 = [v8 BOOLValue];

  return v9;
}

+ (BOOL)configureAwaitUserConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"Enabled"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0) {
    [a1 markCurrentUserAsConfigured];
  }
  char v7 = [a1 _updateMultiUserDeviceConfigurationFileWithKey:@"AwaitUserConfiguration" value:v4];

  return v7;
}

+ (BOOL)awaitUserConfigurationEnabled
{
  if (!+[DMCMultiUserModeUtilities isSharediPad]) {
    return 0;
  }
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = DMCMultiUserDeviceConfigurationFilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  if (!v4) {
    return 0;
  }
  double v5 = (void *)MEMORY[0x1E4F1C9E8];
  char v6 = DMCMultiUserDeviceConfigurationFilePath();
  char v7 = [v5 DMCDictionaryFromFile:v6];
  BOOL v8 = [v7 objectForKeyedSubscript:@"AwaitUserConfiguration"];
  char v9 = [v8 objectForKeyedSubscript:@"Enabled"];
  char v10 = [v9 BOOLValue];

  return v10;
}

+ (BOOL)markCurrentUserAsConfigured
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!+[DMCMultiUserModeUtilities inSharediPadUserSession])goto LABEL_4; {
  id v2 = sem_open("dmc_isCurrentUserConfigured", 512, 256, 0);
  }
  if (v2 != (sem_t *)-1)
  {
    sem_close(v2);
    DMCSendUserSettingsChangedNotification();
LABEL_4:
    LOBYTE(v3) = 1;
    return v3;
  }
  int v4 = *DMCLogObjects();
  BOOL v3 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    double v5 = v4;
    char v6 = __error();
    char v7 = strerror(*v6);
    *(_DWORD *)buf = 136446466;
    char v10 = "dmc_isCurrentUserConfigured";
    __int16 v11 = 2082;
    v12 = v7;
    _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_ERROR, "Failed to create semaphore %{public}s: %{public}s", buf, 0x16u);

    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)isCurrentUserConfigured
{
  if (!+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession")|| ![a1 awaitUserConfigurationEnabled])
  {
    return 1;
  }
  BOOL v3 = sem_open("dmc_isCurrentUserConfigured", 0);
  if (v3 != (sem_t *)-1)
  {
    sem_close(v3);
    return 1;
  }
  return 0;
}

+ (BOOL)_updateMultiUserDeviceConfigurationFileWithKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DMCMultiUserDeviceConfigurationFilePath();
  LOBYTE(a1) = [a1 _updateMultiUserConfigurationFileAtPath:v8 key:v7 value:v6];

  DMCSendSettingsChangedNotification();
  return (char)a1;
}

+ (BOOL)_updateMultiUserUserConfigurationFileWithKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DMCMultiUserUserConfigurationFilePath();
  LOBYTE(a1) = [a1 _updateMultiUserConfigurationFileAtPath:v8 key:v7 value:v6];

  DMCSendUserSettingsChangedNotification();
  return (char)a1;
}

+ (BOOL)_updateMultiUserConfigurationFileAtPath:(id)a3 key:(id)a4 value:(id)a5
{
  id v7 = a3;
  BOOL v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  __int16 v11 = [v8 DMCDictionaryFromFile:v7];
  v12 = (void *)[v11 mutableCopy];
  uint64_t v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  v15 = v14;

  [v15 setObject:v9 forKeyedSubscript:v10];
  int v16 = [v15 DMCWriteToBinaryFile:v7];
  if (v16) {
    DMCSetSkipBackupAttributeToItemAtPath(v7, 1);
  }

  return v16;
}

+ (unint64_t)_previousQuotaSize
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v3 = DMCMultiUserDeviceConfigurationFilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  if (!v4) {
    return 0;
  }
  double v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = DMCMultiUserDeviceConfigurationFilePath();
  id v7 = [v5 DMCDictionaryFromFile:v6];
  BOOL v8 = [v7 objectForKeyedSubscript:@"MCPreviousQuotaSize"];
  unint64_t v9 = [v8 unsignedLongValue];

  return v9;
}

+ (id)_configureQuotaSizeForSharedDeviceImmediately:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  BOOL v5 = +[DMCMultiUserModeUtilities isFirstSetupBuddyDone];
  unint64_t v6 = [v4 unsignedLongLongValue];
  if (v5 || (unint64_t)[a1 _getDiskSize] > 0x800000000) {
    unint64_t v7 = 2000000000;
  }
  else {
    unint64_t v7 = 1000000000;
  }
  if (v6 <= v7) {
    unint64_t v6 = v7;
  }
  unint64_t v8 = [a1 getDiskAvailableSize];
  unint64_t v9 = v8 - 2000000000;
  if (v6 < v8 - 2000000000) {
    unint64_t v9 = v6;
  }
  if ((double)v8 * 0.98 <= (double)v9) {
    double v10 = (double)v8 * 0.98;
  }
  else {
    double v10 = (double)v9;
  }
  __int16 v11 = DMCUMUserSessionProvisionTypeKey();
  v30[0] = v11;
  v12 = DMCUMUserSessionProvisionTypeEducation();
  v31[0] = v12;
  uint64_t v13 = DMCUMEducationUserSizeKey();
  v30[1] = v13;
  id v14 = [NSNumber numberWithUnsignedLongLong:(unint64_t)v10 & 0xFFFFFFFFFFF00000];
  v31[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v17 = [DMCUMUserManagerClass() sharedManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__DMCMultiUserModeUtilities__configureQuotaSizeForSharedDeviceImmediately___block_invoke;
  v21[3] = &unk_1E5CFDF88;
  v23 = &v24;
  uint64_t v18 = v16;
  BOOL v22 = v18;
  [v17 setupUMUserSessionProvisioning:v15 WithCompletionHandler:v21];

  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  id v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
}

void __75__DMCMultiUserModeUtilities__configureQuotaSizeForSharedDeviceImmediately___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = DMCLogObjects()[1];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_DEFAULT, "Finished configuring quota size with result: %{public}@, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_configureResidentUsersNumberForSharedDeviceImmediately:(id)a3
{
  unsigned int v4 = [a3 unsignedIntValue];
  uint64_t v5 = [a1 getDiskAvailableSize];
  if (+[DMCMultiUserModeUtilities isFirstSetupBuddyDone])
  {
    unint64_t v6 = v5 - 2000000000;
  }
  else
  {
    unint64_t v7 = [a1 _getDiskSize];
    uint64_t v8 = -16000000000;
    if (v7 < 0x800000001) {
      uint64_t v8 = -8000000000;
    }
    unint64_t v6 = v8 + v5;
  }
  id v9 = [NSNumber numberWithUnsignedLongLong:(v6 / v4) & 0xFFFFFFFFFFF00000];
  __int16 v10 = +[DMCMultiUserModeUtilities _configureQuotaSizeForSharedDeviceImmediately:v9];

  return v10;
}

+ (unint64_t)getDiskAvailableSize
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(&v8, 0, 512);
  strcpy(v7, "/private/var");
  if (statfs(v7, &v8)) {
    unint64_t v2 = 0;
  }
  else {
    unint64_t v2 = v8.f_bavail * v8.f_bsize;
  }
  BOOL v3 = DMCLogObjects()[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134349056;
    unint64_t v6 = v2;
    _os_log_impl(&dword_1A7863000, v3, OS_LOG_TYPE_DEFAULT, "Available disk size: %{public}lld", (uint8_t *)&v5, 0xCu);
  }
  return v2;
}

+ (unint64_t)_getDiskSize
{
  unint64_t valuePtr = 0;
  unint64_t result = +[DMCMobileGestalt diskUsage];
  if (result)
  {
    BOOL v3 = (const void *)result;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x1E4FBA0F0]);
    if (Value)
    {
      CFNumberRef v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID()) {
        CFNumberGetValue(v5, kCFNumberLongLongType, &valuePtr);
      }
    }
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

@end