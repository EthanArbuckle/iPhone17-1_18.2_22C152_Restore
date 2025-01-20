@interface EMInternalPreferences
+ (BOOL)_hasUserDefaultValueForKey:(id)a3 expectedValue:(id)a4;
+ (BOOL)_preferenceEnabled:(unint64_t)a3;
+ (BOOL)_userDefaultEnabledForKey:(id)a3 defaultValue:(BOOL)a4;
+ (BOOL)preferenceEnabled:(unint64_t)a3;
+ (OS_os_log)log;
+ (id)defaultForPreference:(unint64_t)a3;
+ (id)observeChangesForPreference:(unint64_t)a3 autoCancelToken:(BOOL)a4 usingBlock:(id)a5;
+ (id)observeChangesForPreference:(unint64_t)a3 usingBlock:(id)a4;
+ (void)_registerForDefaultChanges;
+ (void)_setUserDefaultEnabled:(BOOL)a3 forKey:(id)a4;
+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
+ (void)setPreference:(unint64_t)a3 enabled:(BOOL)a4;
@end

@implementation EMInternalPreferences

+ (BOOL)preferenceEnabled:(unint64_t)a3
{
  char v3 = a3;
  v5 = [MEMORY[0x1E4F60D58] currentDevice];
  char v6 = [v5 isInternal];

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__EMInternalPreferences_preferenceEnabled___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (preferenceEnabled__onceToken != -1) {
      dispatch_once(&preferenceEnabled__onceToken, block);
    }
    unint64_t v7 = atomic_load(&cachedFlags);
    if (!v7)
    {
      unint64_t v7 = 1;
      for (uint64_t i = 1; i != 62; ++i)
      {
        BOOL v9 = +[EMInternalPreferences _preferenceEnabled:i];
        uint64_t v10 = 1 << i;
        if (!v9) {
          uint64_t v10 = 0;
        }
        v7 |= v10;
      }
      atomic_store(v7, &cachedFlags);
    }
    return (v7 >> v3) & 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

+ (id)observeChangesForPreference:(unint64_t)a3 autoCancelToken:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  BOOL v9 = [MEMORY[0x1E4F60D58] currentDevice];
  char v10 = [v9 isInternal];

  if (v10)
  {
    BOOL v11 = [a1 defaultForPreference:a3];
    v12 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__EMInternalPreferences_observeChangesForPreference_autoCancelToken_usingBlock___block_invoke;
    v15[3] = &unk_1E63E4188;
    id v17 = a1;
    unint64_t v18 = a3;
    id v16 = v8;
    v13 = objc_msgSend(v12, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v11, 1, v5, v15);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EMInternalPreferences_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_21 != -1) {
    dispatch_once(&log_onceToken_21, block);
  }
  v2 = (void *)log_log_21;
  return (OS_os_log *)v2;
}

void __28__EMInternalPreferences_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_21;
  log_log_21 = (uint64_t)v1;
}

uint64_t __43__EMInternalPreferences_preferenceEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForDefaultChanges];
}

+ (void)_registerForDefaultChanges
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v4 = 1;
  *(void *)&long long v5 = 134218242;
  long long v9 = v5;
  do
  {
    char v6 = +[EMInternalPreferences defaultForPreference:](EMInternalPreferences, "defaultForPreference:", v4, v9);
    if (v6)
    {
      [v3 addObserver:a1 forKeyPath:v6 options:0 context:&kvoContext];
      unint64_t v7 = +[EMInternalPreferences log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v9;
        id v11 = a1;
        __int16 v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "EMInternalPreferences (%p) adding observer for key path %@ on defaults", buf, 0x16u);
      }
    }
    ++v4;
  }
  while (v4 != 62);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_userDefaultsDidChange, @"com.apple.mail.EMUserDefaultsDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &kvoContext)
  {
    atomic_store(0, &cachedFlags);
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___EMInternalPreferences;
    objc_msgSendSuper2(&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
}

+ (id)observeChangesForPreference:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v4 = +[EMInternalPreferences observeChangesForPreference:a3 autoCancelToken:0 usingBlock:a4];
  return v4;
}

void __80__EMInternalPreferences_observeChangesForPreference_autoCancelToken_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 BOOLValue];
  }
  else {
    [*(id *)(a1 + 40) preferenceEnabled:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)_preferenceEnabled:(unint64_t)a3
{
  long long v5 = objc_msgSend(a1, "defaultForPreference:");
  char v6 = 0;
  uint64_t v7 = 1;
  switch(a3)
  {
    case 0uLL:
    case 0x3EuLL:
      goto LABEL_6;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3CuLL:
    case 0x3DuLL:
      uint64_t v7 = 0;
      goto LABEL_3;
    case 0x1CuLL:
      char v6 = [a1 _userDefaultEnabledForKey:v5 defaultValue:_os_feature_enabled_impl()];
LABEL_6:
      long long v9 = +[EMInternalPreferences log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[EMInternalPreferences _preferenceEnabled:](a3, v9);
      }

      break;
    case 0x2CuLL:
LABEL_3:
      char v6 = [a1 _userDefaultEnabledForKey:v5 defaultValue:v7];
      break;
    default:
      break;
  }

  return v6;
}

+ (void)setPreference:(unint64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a1 defaultForPreference:a3];
  if (v6) {
    [a1 _setUserDefaultEnabled:v4 forKey:v6];
  }
}

+ (id)defaultForPreference:(unint64_t)a3
{
  BOOL v4 = [MEMORY[0x1E4F60D58] currentDevice];
  char v5 = [v4 isInternal];

  if (v5)
  {
    id v6 = 0;
    switch(a3)
    {
      case 0uLL:
      case 0x3EuLL:
        uint64_t v7 = +[EMInternalPreferences log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          +[EMInternalPreferences defaultForPreference:](v7);
        }

        goto LABEL_6;
      case 2uLL:
        id v8 = EMUserDefaultForceInMemoryThreading;
        goto LABEL_67;
      case 3uLL:
        id v8 = EMUserDefaultQueryResultComparison;
        goto LABEL_67;
      case 4uLL:
        id v8 = EMUserDefaultNewQueryResults;
        goto LABEL_67;
      case 5uLL:
        id v8 = EMUserDefaultSharingFromSafariUI;
        goto LABEL_67;
      case 6uLL:
        id v8 = EMUserDefaultForceAccountIsManaged;
        goto LABEL_67;
      case 7uLL:
        id v8 = EMUserDefaultShowDebugInfo;
        goto LABEL_67;
      case 8uLL:
        id v8 = EMUserDefaultSearchFlagColors;
        goto LABEL_67;
      case 9uLL:
        id v8 = EMUserDefaultFavoriteFlagColorMailbox;
        goto LABEL_67;
      case 0xAuLL:
        id v8 = EMUserDefaultAdditionalPointerInteractions;
        goto LABEL_67;
      case 0xBuLL:
        id v8 = EMUserDefaultRemoteContentRequestShortInterval;
        goto LABEL_67;
      case 0xCuLL:
        id v8 = EMUserDefaultAlwaysVerifyServerProvidedRemoteContentLinks;
        goto LABEL_67;
      case 0xDuLL:
        id v8 = EMUserDefaultLogRemoteContentLinksUnredacted;
        goto LABEL_67;
      case 0xEuLL:
        id v8 = EMUserDefaultDisableSnapshotInvalidation;
        goto LABEL_67;
      case 0xFuLL:
        id v8 = EMUserDefaultDisableInitialMessageSelection;
        goto LABEL_67;
      case 0x10uLL:
        id v8 = EMUserDefaultDisableStateRestoration;
        goto LABEL_67;
      case 0x11uLL:
        id v8 = EMUserDefaultEnableThreadedMessagesInWidget;
        goto LABEL_67;
      case 0x12uLL:
        id v8 = EMUserDefaultDisableServerSideSearch;
        goto LABEL_67;
      case 0x13uLL:
        id v8 = EMUserDefaultRemindMeDebugDate;
        goto LABEL_67;
      case 0x14uLL:
        id v8 = EMUserDefaultSuggestionsFollowUpDebugStartDate;
        goto LABEL_67;
      case 0x15uLL:
        id v8 = EMUserDefaultSuggestionsFollowUpDebugEndDate;
        goto LABEL_67;
      case 0x16uLL:
        id v8 = EMUserDefaultIgnoreBIMIAllowlist;
        goto LABEL_67;
      case 0x17uLL:
        id v8 = EMUserDefaultAllowBIMIWithDKIMSignature;
        goto LABEL_67;
      case 0x18uLL:
        id v8 = EMUserDefaultAlertOnBlankCell;
        goto LABEL_67;
      case 0x19uLL:
        id v8 = EMUserDefaultShouldBlockXPCQueue;
        goto LABEL_67;
      case 0x1AuLL:
        id v8 = EMUserDefaultShouldBlockSQLQueries;
        goto LABEL_67;
      case 0x1BuLL:
        id v8 = EMUserDefaultIndexingTurboMode;
        goto LABEL_67;
      case 0x1CuLL:
        id v8 = EMUserDefaultAdoptMessageSecurity;
        goto LABEL_67;
      case 0x1DuLL:
        id v8 = EMUserDefaultEncryptedMailMostSecure;
        goto LABEL_67;
      case 0x1EuLL:
        id v8 = EMUserDefaultSignUsingPKCS7MIME;
        goto LABEL_67;
      case 0x1FuLL:
        id v8 = EMUserDefaultSkipEncryptedMailDeviceCheck;
        goto LABEL_67;
      case 0x20uLL:
        id v8 = EMUserDefaultForceAdvertiseGCMCapability;
        goto LABEL_67;
      case 0x21uLL:
        id v8 = EMUserDefaultForceAdvertiseSubjectEncryptionCapability;
        goto LABEL_67;
      case 0x22uLL:
        id v8 = EMUserDefaultForceEncryptWithGCM;
        goto LABEL_67;
      case 0x23uLL:
        id v8 = EMUserDefaultForceEncryptSubject;
        goto LABEL_67;
      case 0x24uLL:
        id v8 = EMUserDefaultForceMiniTip;
        goto LABEL_67;
      case 0x25uLL:
        id v8 = EMUserDefaultDisableIndexing;
        goto LABEL_67;
      case 0x26uLL:
        id v8 = EMUserDefaultDisableQueryLogSubmission;
        goto LABEL_67;
      case 0x27uLL:
        id v8 = EMUserDefaultVerifyMessageBodyWithDKIM;
        goto LABEL_67;
      case 0x28uLL:
        id v8 = EMUserDefaultShouldIgnoreLocaleRestrictions;
        goto LABEL_67;
      case 0x29uLL:
        id v8 = EMUserDefaultIgnoreCommerceMessageRemovalFromInbox;
        goto LABEL_67;
      case 0x2AuLL:
        id v8 = EMUserDefaultShowCategorizationState;
        goto LABEL_67;
      case 0x2BuLL:
        id v8 = EMUserDefaultDisableGroupingInCommerceMailbox;
        goto LABEL_67;
      case 0x2CuLL:
        id v8 = EMUserDefaultEnableHighImpactRegex;
        goto LABEL_67;
      case 0x2DuLL:
        id v8 = EMUserDefaultShouldIgnoreBlackPearlRestrictions;
        goto LABEL_67;
      case 0x2EuLL:
        id v8 = EMUserDefaultForceCollapsedSenderHeader;
        goto LABEL_67;
      case 0x2FuLL:
        id v8 = EMUserDefaultDigestScrollsToNewest;
        goto LABEL_67;
      case 0x30uLL:
        id v8 = EMUserDefaultAllowFindInDigestView;
        goto LABEL_67;
      case 0x31uLL:
        id v8 = EMUserDefaultSimulateDelayedFreeSpaceStatus;
        goto LABEL_67;
      case 0x32uLL:
        id v8 = EMUserDefaultUseFlaggedForCYUInsteadOfUrgent;
        goto LABEL_67;
      case 0x33uLL:
        id v8 = EMUserDefaultRemoveTimeLimitForHighlights;
        goto LABEL_67;
      case 0x34uLL:
        id v8 = EMUserDefaultDynamicallyUpdateGeneratedSummaries;
        goto LABEL_67;
      case 0x35uLL:
        id v8 = EMUserDefaultHideMaildIndexedResults;
        goto LABEL_67;
      case 0x36uLL:
        id v8 = EMUserDefaultHideSearchIndexerResults;
        goto LABEL_67;
      case 0x37uLL:
        id v8 = EMUserDefaultGenerateFakeSummaries;
        goto LABEL_67;
      case 0x38uLL:
        id v8 = EMUserDefaultGenerateFakeManualSummaries;
        goto LABEL_67;
      case 0x39uLL:
        id v8 = EMUserDefaultOverrideAsGreymatterSupportedDevice;
        goto LABEL_67;
      case 0x3AuLL:
        id v8 = EMUserDefaultOverrideGreymatterAvailability;
        goto LABEL_67;
      case 0x3BuLL:
        id v8 = EMUserDefaultAllowFilterBySender;
        goto LABEL_67;
      case 0x3CuLL:
        id v8 = EMUserDefaultShowFCSFeedbackOptions;
        goto LABEL_67;
      case 0x3DuLL:
        id v8 = EMUserDefaultShimmerHighlightsWhenAppearing;
LABEL_67:
        id v6 = *v8;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_6:
    id v6 = 0;
  }
  return v6;
}

+ (BOOL)_userDefaultEnabledForKey:(id)a3 defaultValue:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v7 = [v6 valueForKey:v5];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    a4 = [v7 BOOLValue];
  }

  return a4;
}

+ (void)_setUserDefaultEnabled:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  [v5 setBool:v4 forKey:v6];
}

+ (BOOL)_hasUserDefaultValueForKey:(id)a3 expectedValue:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v8 = [v7 stringForKey:v5];

  if (v6 | v8) {
    char v9 = [(id)v6 isEqual:v8];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

+ (void)_preferenceEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Reading invalid preference: %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)defaultForPreference:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Getting default for invalid preference", v1, 2u);
}

@end