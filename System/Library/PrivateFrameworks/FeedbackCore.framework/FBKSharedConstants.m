@interface FBKSharedConstants
+ (BOOL)currentIDMSEnvironmentMatchesCurrentFBKSEnvironment;
+ (BOOL)hasDifferentLanguageSinceLastLaunch;
+ (BOOL)isEnhancedLoggingEnabled;
+ (BOOL)isFormItemsDisabled;
+ (BOOL)isProductionEnvironment;
+ (BOOL)listsFormsFetchedByTat;
+ (BOOL)usesPersistentStore;
+ (BOOL)usesTemporaryDraftsDirectory;
+ (NSUserDefaults)sharedUserDefaults;
+ (id)_localizedAttachmentLegalTextKeyForDraftID:(id)a3;
+ (id)darkModeCSS;
+ (id)developerURL;
+ (id)localizedAttachmentLegalTextForDraftID:(id)a3;
+ (id)modelName;
+ (id)portalURL;
+ (int64_t)currentLegalVersion;
+ (void)deleteAttachmentLegalTextForDraftID:(id)a3;
+ (void)deleteStaleAttachmentLegalTextEntries;
+ (void)initialize;
+ (void)recordCurrentLanguagePreference;
+ (void)saveLocalizedAttachmentLegalText:(id)a3 draftID:(id)a4;
@end

@implementation FBKSharedConstants

+ (void)initialize
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 addSuiteNamed:*MEMORY[0x263F3C608]];

  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  [v6 setObject:@"production" forKey:*MEMORY[0x263F3C618]];
  [v6 setObject:&unk_26DE1E7B0 forKey:@"LastDraftID"];
  uint64_t v3 = MEMORY[0x263EFFA88];
  [v6 setObject:MEMORY[0x263EFFA88] forKey:@"Autogather"];
  [v6 setObject:v3 forKey:@"webViewOverride"];
  uint64_t v4 = MEMORY[0x263EFFA80];
  [v6 setObject:MEMORY[0x263EFFA80] forKey:@"showsAutoFillButton"];
  [v6 setObject:v4 forKey:@"NetworkLoggerData"];
  [v6 setObject:v4 forKey:@"NetworkLoggerSpam"];
  [v6 setObject:v4 forKey:@"allowCellUploads"];
  [v6 setObject:v4 forKey:@"FBKPushNotificationsEnabled"];
  [v6 setObject:v3 forKey:@"usesSystemAccount"];
  [v6 setObject:v4 forKey:@"FBKELEnabled"];
  [v6 setObject:v4 forKey:@"ListsFormsFetchedByTat"];
  [v6 setObject:&unk_26DE1E7C8 forKey:@"MaxInlineChoices"];
  [v6 setObject:v4 forKey:@"DisableFormItems"];
  [v6 setObject:v4 forKey:@"DisableAppleConnect"];
  v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 registerDefaults:v6];
}

+ (id)modelName
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = (void *)_modelName;
  if (!_modelName)
  {
    memset(&v7, 0, 512);
    uname(&v7);
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v7.machine);
    uint64_t v4 = (void *)_modelName;
    _modelName = v3;

    v2 = (void *)_modelName;
  }
  id v5 = v2;

  return v5;
}

+ (void)recordCurrentLanguagePreference
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 preferredLocalizations];
  uint64_t v4 = [v3 firstObject];

  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 setObject:v4 forKey:@"FBKLocalDataLanguage"];

  id v6 = +[FBKLog appHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "Saved local data language: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
}

+ (BOOL)hasDifferentLanguageSinceLastLaunch
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 stringForKey:@"FBKLocalDataLanguage"];

  uint64_t v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 preferredLocalizations];
  id v6 = [v5 firstObject];

  int v7 = [v3 isEqualToString:v6] ^ 1;
  uint64_t v8 = +[FBKLog appHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    v11 = v3;
    __int16 v12 = 2114;
    v13 = v6;
    __int16 v14 = 1024;
    int v15 = v7;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "language preference last used [%{public}@], current: [%{public}@], changed? [%i]", (uint8_t *)&v10, 0x1Cu);
  }

  return v7;
}

+ (id)portalURL
{
  return (id)[NSURL URLWithString:@"https://beta.apple.com/"];
}

+ (id)developerURL
{
  return (id)[NSURL URLWithString:@"https://developer.apple.com/bug-reporting/"];
}

+ (id)darkModeCSS
{
  return @":root { supported-color-schemes: light dark; } @media (prefers-color-scheme: dark) { body { -apple-color-filter: invert(1) hue-rotate(180deg) saturate(3); } html { -apple-color-filter: invert(1) hue-rotate(180deg) saturate(3);} h1, h2, h3, p { -apple-color-filter: invert(0.85) hue-rotate(180deg) saturate(4) brightness(1.5); }}";
}

+ (int64_t)currentLegalVersion
{
  return 10;
}

+ (BOOL)currentIDMSEnvironmentMatchesCurrentFBKSEnvironment
{
  if (!FBKSIsInternalInstall()
    || ([MEMORY[0x263F29270] sharedBag],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 IDMSEnvironment],
        v3,
        v4)
    || (int v5 = [a1 isProductionEnvironment]) != 0)
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

+ (BOOL)isProductionEnvironment
{
  return ([a1 environment] & 0xFFFFFFFB) == 0;
}

+ (NSUserDefaults)sharedUserDefaults
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___FBKSharedConstants;
  v2 = objc_msgSendSuper2(&v4, sel_sharedUserDefaults);

  return (NSUserDefaults *)v2;
}

+ (BOOL)usesPersistentStore
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 infoDictionary];

  objc_super v4 = [v3 valueForKey:@"FBKUsePersistentStore"];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (BOOL)usesTemporaryDraftsDirectory
{
  return [a1 isRunningInFBA] ^ 1;
}

+ (BOOL)isEnhancedLoggingEnabled
{
  if (isEnhancedLoggingEnabled_onceToken != -1) {
    dispatch_once(&isEnhancedLoggingEnabled_onceToken, &__block_literal_global_17);
  }
  return isEnhancedLoggingEnabled_isEnabled;
}

void __46__FBKSharedConstants_isEnhancedLoggingEnabled__block_invoke()
{
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v0 = [v1 BOOLForKey:@"FBKELEnabled"];
  if (v0) {
    LOBYTE(v0) = FBKSIsInternalInstall();
  }
  isEnhancedLoggingEnabled_isEnabled = v0;
}

+ (id)localizedAttachmentLegalTextForDraftID:(id)a3
{
  id v4 = a3;
  char v5 = [a1 sharedUserDefaults];
  id v6 = [a1 _localizedAttachmentLegalTextKeyForDraftID:v4];

  int v7 = [v5 objectForKey:v6];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 objectForKeyedSubscript:@"text"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v8 = 0;
LABEL_6:

  return v8;
}

+ (void)saveLocalizedAttachmentLegalText:(id)a3 draftID:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  v13[0] = @"dateCreated";
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 now];
  v13[1] = @"text";
  v14[0] = v9;
  v14[1] = v8;
  int v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  v11 = [a1 sharedUserDefaults];
  __int16 v12 = [a1 _localizedAttachmentLegalTextKeyForDraftID:v7];

  [v11 setObject:v10 forKey:v12];
}

+ (void)deleteAttachmentLegalTextForDraftID:(id)a3
{
  id v4 = a3;
  id v6 = [a1 sharedUserDefaults];
  char v5 = [a1 _localizedAttachmentLegalTextKeyForDraftID:v4];

  [v6 removeObjectForKey:v5];
}

+ (void)deleteStaleAttachmentLegalTextEntries
{
  uint64_t v3 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__FBKSharedConstants_deleteStaleAttachmentLegalTextEntries__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
}

void __59__FBKSharedConstants_deleteStaleAttachmentLegalTextEntries__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) sharedUserDefaults];
  uint64_t v3 = [v2 dictionaryRepresentation];
  id v4 = [v3 allKeys];
  char v5 = objc_msgSend(v4, "ded_selectItemsPassingTest:", &__block_literal_global_255);

  id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v6 setDay:-30];
  id v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  unint64_t v8 = 0x263EFF000uLL;
  uint64_t v9 = [MEMORY[0x263EFF910] now];
  v30 = v6;
  v31 = [v7 dateByAddingComponents:v6 toDate:v9 options:0];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v16 = [*(id *)(v1 + 32) sharedUserDefaults];
        v17 = [v16 valueForKey:v15];

        if (v17)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = [v17 objectForKeyedSubscript:@"dateCreated"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [MEMORY[0x263EFF8F0] currentCalendar];
              uint64_t v20 = [v19 compareDate:v31 toDate:v18 toUnitGranularity:128];
              v32 = v18;
              uint64_t v21 = v12;
              uint64_t v22 = v13;
              uint64_t v23 = v1;
              id v24 = v10;
              unint64_t v25 = v8;
              uint64_t v26 = v20;

              BOOL v27 = v26 == 1;
              unint64_t v8 = v25;
              id v10 = v24;
              uint64_t v1 = v23;
              uint64_t v13 = v22;
              uint64_t v12 = v21;
              v18 = v32;
              if (v27)
              {
                v28 = +[FBKLog appHandle];
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v38 = v17;
                  _os_log_impl(&dword_22A36D000, v28, OS_LOG_TYPE_DEFAULT, "Deleting stale localizedAttachmentLegalText %{public}@", buf, 0xCu);
                }

                v29 = [*(id *)(v1 + 32) sharedUserDefaults];
                [v29 removeObjectForKey:v15];
              }
            }
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v12);
  }
}

uint64_t __59__FBKSharedConstants_deleteStaleAttachmentLegalTextEntries__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"LocalizedAttachmentLegalTextKey"];
}

+ (id)_localizedAttachmentLegalTextKeyForDraftID:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@:%@", @"LocalizedAttachmentLegalTextKey", a3];
}

+ (BOOL)listsFormsFetchedByTat
{
  if (listsFormsFetchedByTat_onceToken != -1) {
    dispatch_once(&listsFormsFetchedByTat_onceToken, &__block_literal_global_262);
  }
  return listsFormsFetchedByTat_listsFormsFetchedByTatCached;
}

void __44__FBKSharedConstants_listsFormsFetchedByTat__block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  listsFormsFetchedByTat_listsFormsFetchedByTatCached = [v0 BOOLForKey:@"ListsFormsFetchedByTat"];
}

+ (BOOL)isFormItemsDisabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"DisableFormItems"];

  return v3;
}

@end