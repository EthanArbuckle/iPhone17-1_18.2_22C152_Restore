@interface IPSettingsUtilities
+ (void)mirrorToWatchIfNecessary;
+ (void)runPostLanguageChangeOperationsWithNotifications:(BOOL)a3;
+ (void)setLanguage:(id)a3;
+ (void)setLanguage:(id)a3 postNotification:(BOOL)a4;
+ (void)setLanguageAndRegion:(id)a3;
+ (void)setLanguageAndRegion:(id)a3 postNotification:(BOOL)a4;
+ (void)setRegion:(id)a3;
+ (void)setRegion:(id)a3 changeLanguageVariant:(BOOL)a4 postNotification:(BOOL)a5;
+ (void)setRegion:(id)a3 postNotification:(BOOL)a4;
+ (void)writeLanguageAndLocaleConfigurationIfNeededWithCompletion:(id)a3;
@end

@implementation IPSettingsUtilities

+ (void)setLanguage:(id)a3
{
}

+ (void)setLanguage:(id)a3 postNotification:(BOOL)a4
{
  BOOL v4 = a4;
  [MEMORY[0x1E4F1CA20] setPreferredLanguageAndUpdateLocale:a3];
  [a1 runPostLanguageChangeOperationsWithNotifications:v4];
}

+ (void)setRegion:(id)a3
{
}

+ (void)setRegion:(id)a3 postNotification:(BOOL)a4
{
}

+ (void)setRegion:(id)a3 changeLanguageVariant:(BOOL)a4 postNotification:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v17 = +[IPLanguageListManager manager];
  [v17 setRegion:v8 updateFirstLanguage:v6];
  [MEMORY[0x1E4F1CA20] setLocaleAfterRegionChange:v8];

  v9 = (void *)MEMORY[0x1E4F1CA20];
  v10 = [v17 preferredLanguages];
  [v9 setPreferredLanguages:v10];

  v11 = (void *)MEMORY[0x1E4F1CA20];
  v12 = [v17 deviceLanguage];
  v13 = [MEMORY[0x1E4F1CA20] preferredLocale];
  v14 = [v13 localeIdentifier];
  LOBYTE(v11) = [v11 _language:v12 usesSameLocalizationAs:v14];

  if ((v11 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4F1CA20];
    v16 = [v17 deviceLanguage];
    [v15 setLocaleAfterLanguageChange:v16];
  }
  [a1 runPostLanguageChangeOperationsWithNotifications:v5];
}

+ (void)setLanguageAndRegion:(id)a3
{
}

+ (void)setLanguageAndRegion:(id)a3 postNotification:(BOOL)a4
{
  BOOL v4 = a4;
  [MEMORY[0x1E4F1CA20] setLanguageAndRegion:a3];
  [a1 runPostLanguageChangeOperationsWithNotifications:v4];
}

+ (void)runPostLanguageChangeOperationsWithNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v6 = [v5 bundleIdentifier];
  char v7 = [v6 isEqualToString:@"com.apple.purplebuddy"];

  if ((v7 & 1) == 0) {
    [MEMORY[0x1E4F1CA20] enableDefaultKeyboardForPreferredLanguages];
  }
  id v8 = [MEMORY[0x1E4F28F80] processInfo];
  v9 = [v8 beginActivityWithOptions:0xFFFFFFLL reason:@"com.apple.InternationalSettings.setLanguagesToIdMS"];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__IPSettingsUtilities_runPostLanguageChangeOperationsWithNotifications___block_invoke;
  v18[3] = &unk_1E63BFC78;
  id v10 = v9;
  id v19 = v10;
  [a1 writeLanguageAndLocaleConfigurationIfNeededWithCompletion:v18];
  [a1 mirrorToWatchIfNecessary];
  v11 = [MEMORY[0x1E4F1CA20] preferredLocale];
  id v12 = [v11 regionCode];
  xpc_object_t v13 = xpc_string_create((const char *)[v12 cStringUsingEncoding:1]);
  int v14 = os_eligibility_set_input();

  if (v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[IPSettingsUtilities runPostLanguageChangeOperationsWithNotifications:](v14);
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v3)
  {
LABEL_6:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleLanguagePreferencesChangedNotification", 0, 0, 1u);
    v16 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v16, @"AppleKeyboardsPreferencesChangedNotification", 0, 0, 1u);
    id v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v17, @"com.apple.language.changed", 0, 0, 1u);
  }
LABEL_7:
}

void __72__IPSettingsUtilities_runPostLanguageChangeOperationsWithNotifications___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  [v2 endActivity:*(void *)(a1 + 32)];
}

+ (void)writeLanguageAndLocaleConfigurationIfNeededWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(void))a3;
  BOOL v4 = [getUMUserManagerClass() sharedManager];
  char v5 = [v4 isMultiUser];

  if (v5)
  {
    BOOL v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__IPSettingsUtilities_writeLanguageAndLocaleConfigurationIfNeededWithCompletion___block_invoke;
    block[3] = &unk_1E63BFCC8;
    id v8 = v3;
    dispatch_async(v6, block);
  }
  else if (v3)
  {
    v3[2](v3);
  }
}

void __81__IPSettingsUtilities_writeLanguageAndLocaleConfigurationIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v2 = [getUMUserManagerClass() sharedManager];
  BOOL v3 = [v2 currentUser];
  BOOL v4 = [v3 alternateDSID];

  if (v4)
  {
    v20[0] = @"AppleLanguages";
    char v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v20[1] = @"AppleLocale";
    v21[0] = v5;
    BOOL v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    char v7 = [v6 localeIdentifier];
    v21[1] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v9 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
    uint64_t v19 = getAKAppleIDAuthenticationControllerClass_softClass;
    if (!getAKAppleIDAuthenticationControllerClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getAKAppleIDAuthenticationControllerClass_block_invoke;
      v15[3] = &unk_1E63BFCF0;
      v15[4] = &v16;
      __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)v15);
      v9 = (void *)v17[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v16, 8);
    v11 = objc_opt_new();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__IPSettingsUtilities_writeLanguageAndLocaleConfigurationIfNeededWithCompletion___block_invoke_2;
    v13[3] = &unk_1E63BFCA0;
    id v14 = *(id *)(a1 + 32);
    [v11 setConfigurationInfo:v8 forIdentifier:@"com.apple.idms.config.Language" forAltDSID:v4 completion:v13];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

uint64_t __81__IPSettingsUtilities_writeLanguageAndLocaleConfigurationIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)mirrorToWatchIfNecessary
{
  id v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  BOOL v3 = [MEMORY[0x1E4F79EF0] activePairedDeviceSelectorBlock];
  BOOL v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v8 = [v4 firstObject];

  char v5 = [v8 valueForProperty:*MEMORY[0x1E4F79DA0]];
  char v6 = [v5 BOOLValue];

  char v7 = objc_alloc_init(IPWatchLocaleController);
  if ([(IPWatchLocaleController *)v7 isMirroringEnabled] && (v6 & 1) == 0) {
    [(IPWatchLocaleController *)v7 mirrorLanguagesAndLocaleToWatch];
  }
}

+ (void)runPostLanguageChangeOperationsWithNotifications:(int)a1 .cold.1(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to set eligibility input: %d", (uint8_t *)v1, 8u);
}

@end