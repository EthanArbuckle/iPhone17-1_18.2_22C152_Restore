@interface SGPreferenceManager
+ (id)defaultManager;
- (SGPreferenceManager)init;
- (int)registerBlock:(id)a3;
- (void)_resumeNotificationQueue;
- (void)_suspendNotificationQueue;
@end

@implementation SGPreferenceManager

uint64_t __37__SGPreferenceManager_registerBlock___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) synchronize];
  pthread_mutex_lock(&syncHistoryToCloudLock);
  syncHistoryToCloud = -1;
  pthread_mutex_unlock(&syncHistoryToCloudLock);
  pthread_mutex_lock(&shouldShowPastEventsLock);
  shouldShowPastEvents = -1;
  pthread_mutex_unlock(&shouldShowPastEventsLock);
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (int)registerBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int out_token = 0;
  v5 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];
  settingsUpdateQueue = self->_settingsUpdateQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __37__SGPreferenceManager_registerBlock___block_invoke;
  handler[3] = &unk_1E5B902B0;
  handler[4] = self;
  id v14 = v4;
  v7 = (void (**)(void))v4;
  uint32_t v8 = notify_register_dispatch(v5, &out_token, settingsUpdateQueue, handler);
  if (v8)
  {
    uint32_t v9 = v8;
    v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v17 = v9;
      _os_log_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_DEFAULT, "notify_register_dispatch error: %i", buf, 8u);
    }
  }
  v7[2](v7);
  int v11 = out_token;

  return v11;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_7858);
  }
  v2 = (void *)defaultManager_sharedManager;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsUpdateQueue, 0);

  objc_storeStrong((id *)&self->_suggestionsDefaults, 0);
}

- (void)_resumeNotificationQueue
{
  dispatch_resume((dispatch_object_t)self->_settingsUpdateQueue);
  settingsUpdateQueue = self->_settingsUpdateQueue;

  dispatch_barrier_sync(settingsUpdateQueue, &__block_literal_global_17);
}

- (void)_suspendNotificationQueue
{
  settingsUpdateQueue = self->_settingsUpdateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SGPreferenceManager__suspendNotificationQueue__block_invoke;
  block[3] = &unk_1E5B90528;
  block[4] = self;
  dispatch_barrier_sync(settingsUpdateQueue, block);
}

void __48__SGPreferenceManager__suspendNotificationQueue__block_invoke(uint64_t a1)
{
}

- (SGPreferenceManager)init
{
  v16[33] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SGPreferenceManager;
  v2 = [(SGPreferenceManager *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.suggestions"];
    suggestionsDefaults = v2->_suggestionsDefaults;
    v2->_suggestionsDefaults = (NSUserDefaults *)v3;

    v5 = v2->_suggestionsDefaults;
    uint64_t v6 = MEMORY[0x1E4F1CC28];
    v15[0] = @"SuggestionsShowPastEvents";
    v15[1] = @"SuggestionsAlwaysShowCancelledEvents";
    v15[2] = @"SuggestionsShowSuggestionsCalendar";
    v15[3] = @"SuggestionsMessagesToProcessImmediately";
    v16[2] = MEMORY[0x1E4F1CC28];
    v16[3] = &unk_1EF92F730;
    uint64_t v7 = MEMORY[0x1E4F1CC38];
    v16[0] = MEMORY[0x1E4F1CC28];
    v16[1] = MEMORY[0x1E4F1CC28];
    v15[4] = @"SuggestionsOnlyShowSignificantPseudoContacts";
    v15[5] = @"SuggestionsOnlyShowSignificantNLEvents";
    v16[4] = MEMORY[0x1E4F1CC38];
    v16[5] = MEMORY[0x1E4F1CC38];
    v15[6] = @"SuggestionsAllowGeocode";
    v15[7] = @"SuggestionsAllowUnverifiedSourceForMarkup";
    v16[6] = MEMORY[0x1E4F1CC28];
    v16[7] = MEMORY[0x1E4F1CC28];
    v15[8] = @"SuggestionsAllowAnyDomainForMarkup";
    v15[9] = @"SuggestionsAllowAgeBasedPruning";
    v15[10] = @"SuggestionsUseMLModelForContacts";
    v15[11] = @"SuggestionsUseMLModelForSelfId";
    v16[8] = MEMORY[0x1E4F1CC28];
    v16[9] = MEMORY[0x1E4F1CC38];
    v15[12] = @"SuggestionsUseMLModelForContactSharing";
    v15[13] = @"SuggestionsContactSharingNegativeSamplingRate";
    v16[12] = MEMORY[0x1E4F1CC38];
    v16[13] = &unk_1EF92F8F8;
    v16[10] = MEMORY[0x1E4F1CC38];
    v16[11] = MEMORY[0x1E4F1CC38];
    v15[14] = @"SuggestionsDetectContacts";
    v15[15] = @"SuggestionsShowNLEvents";
    v16[14] = MEMORY[0x1E4F1CC38];
    v16[15] = MEMORY[0x1E4F1CC38];
    v15[16] = @"SuggestionsShowMessageEventsML";
    v15[17] = @"SuggestionsDetectStructuredEvents";
    v16[16] = MEMORY[0x1E4F1CC38];
    v16[17] = MEMORY[0x1E4F1CC38];
    v15[18] = @"SuggestionsDetectReminders";
    v15[19] = @"SuggestionsDetectStructuredsEventML";
    v16[18] = MEMORY[0x1E4F1CC38];
    v16[19] = MEMORY[0x1E4F1CC28];
    v15[20] = @"SuggestionsDetectRemindersInMail";
    v15[21] = @"SuggestionsHashedSessionsLogging";
    v16[20] = MEMORY[0x1E4F1CC38];
    v16[21] = &unk_1EF92F748;
    v15[22] = @"CloudKitPersistedState";
    uint32_t v8 = [MEMORY[0x1E4F1C9B8] data];
    v16[22] = v8;
    v16[23] = @"babar-siri-intl-intelligence-babar-prod.usspk05.app.apple.com";
    v15[23] = @"SuggestionsParsecFlightCachingAPIBaseURL";
    v15[24] = @"UseManateeSaltForHistory";
    v15[25] = @"ShowOperatingSystemVersionInSnippets";
    v15[26] = @"SuggestionsHarvestBudgetNumberOfOperations";
    v16[26] = &unk_1EF92F760;
    v16[27] = &unk_1EF92F908;
    v15[27] = @"SuggestionsHarvestBudgetCPUTimeSeconds";
    v15[28] = @"SuggestionsFollowUpTimeRangeForDebugging";
    v16[24] = v7;
    v16[25] = v6;
    v16[28] = MEMORY[0x1E4F1CC08];
    v16[29] = MEMORY[0x1E4F1CC08];
    v15[29] = @"SuggestionsFollowUpComputeCustomTimeRange";
    v15[30] = @"SuggestionsMailIntelligenceSPILogging";
    v16[30] = v6;
    v16[31] = v7;
    v15[31] = @"EnableDKIMEnforcement";
    v15[32] = @"SuggestionsEventsMLRegexEnsembleExtractionEnabled";
    v16[32] = v7;
    uint32_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:33];
    [(NSUserDefaults *)v5 registerDefaults:v9];

    [(NSUserDefaults *)v2->_suggestionsDefaults synchronize];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.suggestions.settingMonitorQueue", v10);
    settingsUpdateQueue = v2->_settingsUpdateQueue;
    v2->_settingsUpdateQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

uint64_t __37__SGPreferenceManager_defaultManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)defaultManager_sharedManager;
  defaultManager_sharedManager = v0;

  uint64_t result = os_variant_has_internal_diagnostics();
  if (result)
  {
    uint64_t v3 = (void *)defaultManager_sharedManager;
    return [v3 registerBlock:&__block_literal_global_14];
  }
  return result;
}

void __37__SGPreferenceManager_defaultManager__block_invoke_2()
{
  uint64_t v0 = sgLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v0, OS_LOG_TYPE_DEBUG, "Suggestions settings changed.", v1, 2u);
  }
}

@end