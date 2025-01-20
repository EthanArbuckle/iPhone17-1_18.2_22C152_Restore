@interface ATXDigestOnboardingSuggestionClient
+ (id)sharedInstance;
+ (void)changeNumPreviousDaysToCheckForNotificationProblemToNumDays:(unint64_t)a3;
+ (void)removeRandomizedSelectionForDigestOnboardingSuggestion;
+ (void)resetDigestOnboardingSuggestionsAtHour:(id)a3 minute:(id)a4;
+ (void)resetRandomizedSelectionForDigestOnboardingSuggestion;
- (ATXDigestOnboardingSuggestionClient)init;
- (BOOL)hasNotificationProblemForPreviousNumDays:(int64_t)a3;
- (id)_notificationStreamFilterBlock;
- (id)notificationStreamPublisherForStartDate:(id)a3;
- (void)_handleLocaleChange;
- (void)_invalidateTriggerOnMainQueue;
- (void)_registerForKVOChangesOnMainQueue;
- (void)_registerForLocaleChangeOnMainQueue;
- (void)_registerForOnboardingSuggestionOnMainQueueWithThresholdForShowingDigestOnboardingSuggestionToSeedUsers:(double)a3 thresholdForShowingDigestOnboardingSuggestion:(double)a4;
- (void)_registerForTriggerOnMainQueueAtHour:(int64_t)a3 minute:(int64_t)a4;
- (void)_setProbabilityOfShowingDigestOnboardingToUser;
- (void)_suggestDigestOnboardingIfApplicableOnMainQueue;
- (void)_suggestDigestOnboardingIfApplicableOnMainQueueGivenNumberOfActiveNotifications:(unint64_t)a3 numberOfUniqueBundleIds:(unint64_t)a4 minActive:(unint64_t)a5 minUnique:(unint64_t)a6;
- (void)_unregisterForKVOChangesOnMainQueue;
- (void)_unregisterForLocaleChangeOnMainQueue;
- (void)averageNumberOfNotifications:(id)a3;
- (void)clientDidRejectOnboardingSuggestion;
- (void)dealloc;
- (void)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerForOnboardingSuggestions;
- (void)registerObserver:(id)a3;
- (void)unregisterForOnboardingSuggestions;
@end

@implementation ATXDigestOnboardingSuggestionClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_0 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_0;

  return v2;
}

void __53__ATXDigestOnboardingSuggestionClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;
}

- (ATXDigestOnboardingSuggestionClient)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXDigestOnboardingSuggestionClient;
  v2 = [(ATXDigestOnboardingSuggestionClient *)&v13 init];
  if (v2)
  {
    v3 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ATXDigestOnboardingSuggestionClient init](v3);
    }

    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("ATXDigestOnboardingSuggestionClient.queue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v10 = [v9 initWithSuiteName:*MEMORY[0x1E4F936E0]];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v10;

    [(ATXDigestOnboardingSuggestionClient *)v2 _setProbabilityOfShowingDigestOnboardingToUser];
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__ATXDigestOnboardingSuggestionClient_registerObserver___block_invoke;
  v6[3] = &unk_1E5D04FC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __56__ATXDigestOnboardingSuggestionClient_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)registerForOnboardingSuggestions
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ATXDigestOnboardingSuggestionClient_registerForOnboardingSuggestions__block_invoke;
  block[3] = &unk_1E5D05300;
  block[4] = self;
  dispatch_async(queue, block);
}

void __71__ATXDigestOnboardingSuggestionClient_registerForOnboardingSuggestions__block_invoke(uint64_t a1)
{
  v2 = +[ATXNotificationManagementMAConstants sharedInstance];
  uint64_t v3 = [v2 digestOnboardingSuggestionHour];
  uint64_t v4 = [v2 digestOnboardingSuggestionMinute];
  uint64_t v5 = [v2 numPreviousDaysToCheckForNotificationProblemForDigestOnboardingSuggestion];
  [v2 thresholdForShowingDigestOnboardingSuggestionToSeedUsers];
  uint64_t v7 = v6;
  [v2 thresholdForShowingDigestOnboardingSuggestion];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ATXDigestOnboardingSuggestionClient_registerForOnboardingSuggestions__block_invoke_2;
  v9[3] = &unk_1E5D052D8;
  v9[4] = *(void *)(a1 + 32);
  v9[5] = v3;
  v9[6] = v4;
  v9[7] = v5;
  v9[8] = v7;
  v9[9] = v8;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __71__ATXDigestOnboardingSuggestionClient_registerForOnboardingSuggestions__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setInteger:*(void *)(a1 + 40) forKey:@"digestOnboardingSuggestionHour"];
  [*(id *)(*(void *)(a1 + 32) + 16) setInteger:*(void *)(a1 + 48) forKey:@"digestOnboardingSuggestionMinute"];
  [*(id *)(*(void *)(a1 + 32) + 16) setInteger:*(void *)(a1 + 56) forKey:@"numPreviousDaysToCheckForNotificationProblem"];
  [*(id *)(a1 + 32) _registerForKVOChangesOnMainQueue];
  [*(id *)(a1 + 32) _registerForLocaleChangeOnMainQueue];
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);

  return [v2 _registerForOnboardingSuggestionOnMainQueueWithThresholdForShowingDigestOnboardingSuggestionToSeedUsers:v3 thresholdForShowingDigestOnboardingSuggestion:v4];
}

- (void)_registerForOnboardingSuggestionOnMainQueueWithThresholdForShowingDigestOnboardingSuggestionToSeedUsers:(double)a3 thresholdForShowingDigestOnboardingSuggestion:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"probabilityOfShowingDigestOnboardingSuggestion"];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    double v15 = a3;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "Digest Onboarding Suggestion Threshold for seed user = %f", (uint8_t *)&v14, 0xCu);
  }

  v11 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    double v15 = a4;
    _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "Digest Onboarding Suggestion Threshold for GM = %f", (uint8_t *)&v14, 0xCu);
  }

  if ([MEMORY[0x1E4F93B08] isBetaBuild])
  {
    if (v9 >= a3)
    {
      v12 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134217984;
        double v15 = v9;
        objc_super v13 = "Not registering for digest onboarding suggestion for seed user since the random number %f assigned to devi"
              "ce is not less than threshold";
LABEL_13:
        _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
LABEL_10:
    [(ATXDigestOnboardingSuggestionClient *)self _registerForTriggerOnMainQueueAtHour:[(NSUserDefaults *)self->_userDefaults integerForKey:@"digestOnboardingSuggestionHour"] minute:[(NSUserDefaults *)self->_userDefaults integerForKey:@"digestOnboardingSuggestionMinute"]];
    return;
  }
  if (v9 < a4) {
    goto LABEL_10;
  }
  v12 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    double v15 = v9;
    objc_super v13 = "Not registering for digest onboarding suggestion since the random number %f assigned to device is not less than threshold";
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_registerForTriggerOnMainQueueAtHour:(int64_t)a3 minute:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_new();
  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v9 = [v8 components:60 fromDate:v7];
  if ([v9 hour] > a3)
  {
    uint64_t v10 = [v8 dateByAddingUnit:16 value:1 toDate:v7 options:2];
    uint64_t v11 = [v8 components:28 fromDate:v10];

    double v9 = (void *)v11;
  }
  [v9 setHour:a3];
  [v9 setMinute:a4];
  v12 = [v8 dateFromComponents:v9];
  objc_super v13 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v12;
    _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "ATXDigestOnboardingSuggestionClient: scheduling trigger for %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v14 = objc_alloc(MEMORY[0x1E4F1CB00]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__ATXDigestOnboardingSuggestionClient__registerForTriggerOnMainQueueAtHour_minute___block_invoke;
  v18[3] = &unk_1E5D05328;
  objc_copyWeak(&v19, (id *)buf);
  double v15 = (NSTimer *)[v14 initWithFireDate:v12 interval:1 repeats:v18 block:86400.0];
  trigger = self->_trigger;
  self->_trigger = v15;

  v17 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v17 addTimer:self->_trigger forMode:*MEMORY[0x1E4F1C3A0]];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __83__ATXDigestOnboardingSuggestionClient__registerForTriggerOnMainQueueAtHour_minute___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _suggestDigestOnboardingIfApplicableOnMainQueue];
}

- (void)_invalidateTriggerOnMainQueue
{
  trigger = self->_trigger;
  if (trigger && [(NSTimer *)trigger isValid])
  {
    double v4 = self->_trigger;
    [(NSTimer *)v4 invalidate];
  }
}

- (void)unregisterForOnboardingSuggestions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ATXDigestOnboardingSuggestionClient_unregisterForOnboardingSuggestions__block_invoke;
  block[3] = &unk_1E5D05300;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__ATXDigestOnboardingSuggestionClient_unregisterForOnboardingSuggestions__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _unregisterForLocaleChangeOnMainQueue];
  [*(id *)(a1 + 32) _unregisterForKVOChangesOnMainQueue];
  v2 = *(void **)(a1 + 32);

  return [v2 _invalidateTriggerOnMainQueue];
}

- (void)_suggestDigestOnboardingIfApplicableOnMainQueue
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "%@: No observers registered", (uint8_t *)&v5, 0xCu);
}

void __86__ATXDigestOnboardingSuggestionClient__suggestDigestOnboardingIfApplicableOnMainQueue__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = +[ATXNotificationManagementMAConstants sharedInstance];
  uint64_t v7 = [v6 digestOnboardingSuggestionMinimumActiveNotifications];
  uint64_t v8 = [v6 digestOnboardingSuggestionMinimumUniqueBundleIds];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__ATXDigestOnboardingSuggestionClient__suggestDigestOnboardingIfApplicableOnMainQueue__block_invoke_2;
  v10[3] = &unk_1E5D05350;
  double v9 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = v7;
  uint64_t v15 = v8;
  id v11 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

id __86__ATXDigestOnboardingSuggestionClient__suggestDigestOnboardingIfApplicableOnMainQueue__block_invoke_2(uint64_t a1)
{
  return self;
}

- (void)_suggestDigestOnboardingIfApplicableOnMainQueueGivenNumberOfActiveNotifications:(unint64_t)a3 numberOfUniqueBundleIds:(unint64_t)a4 minActive:(unint64_t)a5 minUnique:(unint64_t)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138413314;
    v39 = v13;
    __int16 v40 = 2048;
    unint64_t v41 = a3;
    __int16 v42 = 2048;
    unint64_t v43 = a5;
    __int16 v44 = 2048;
    unint64_t v45 = a4;
    __int16 v46 = 2048;
    unint64_t v47 = a6;
    _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "%@: Active notifications: %ld (min: %ld); unique apps: %ld (min: %ld)",
      buf,
      0x34u);
  }
  uint64_t v14 = __atxlog_handle_notification_management();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (a3 < a5 || a4 < a6)
  {
    if (v15)
    {
      v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412290;
      v39 = v22;
      _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "%@: We do not have the minimum active notifications and unique apps", buf, 0xCu);
    }
  }
  else
  {
    if (v15)
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412290;
      v39 = v17;
      _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "%@: We have the minimum active notifications and unique apps", buf, 0xCu);
    }
    uint64_t v14 = objc_opt_new();
    if ([v14 digestSetupComplete]) {
      [(NSUserDefaults *)self->_userDefaults setBool:1 forKey:@"hasSetUpDigestBefore"];
    }
    if ([(NSUserDefaults *)self->_userDefaults BOOLForKey:@"hasSetUpDigestBefore"]
      || [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"digestOnboardingSuggestionShown"])
    {
      v18 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138412290;
        v39 = v20;
        _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "%@: Digest Onboarding has already been suggested", buf, 0xCu);
      }
    }
    else
    {
      v23 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138412290;
        v39 = v25;
        _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "%@: Suggesting Digest Onboarding to client", buf, 0xCu);
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v26 = self->_observers;
      uint64_t v27 = [(NSHashTable *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v34;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v34 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v33 + 1) + 8 * v30);
            v32 = objc_opt_new();
            objc_msgSend(v31, "digestOnboardingSuggestionClient:didSuggestOnboarding:", self, v32, (void)v33);

            ++v30;
          }
          while (v28 != v30);
          uint64_t v28 = [(NSHashTable *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v28);
      }

      [(NSUserDefaults *)self->_userDefaults setBool:1 forKey:@"digestOnboardingSuggestionShown"];
      [(ATXDigestOnboardingSuggestionClient *)self unregisterForOnboardingSuggestions];
    }
  }
}

- (void)averageNumberOfNotifications:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ATXDigestOnboardingSuggestionClient_averageNumberOfNotifications___block_invoke;
  v7[3] = &unk_1E5D053E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __68__ATXDigestOnboardingSuggestionClient_averageNumberOfNotifications___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v3 = objc_opt_new();
  id v4 = [v2 dateByAddingUnit:16 value:-7 toDate:v3 options:2];

  int v5 = [*(id *)(a1 + 32) notificationStreamPublisherForStartDate:v4];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__ATXDigestOnboardingSuggestionClient_averageNumberOfNotifications___block_invoke_3;
  v13[3] = &unk_1E5D053C0;
  id v6 = v4;
  id v14 = v6;
  BOOL v15 = &v16;
  id v7 = (id)[v5 sinkWithCompletion:&__block_literal_global_21 receiveInput:v13];
  unint64_t v8 = v17[3];
  double v9 = __atxlog_handle_notification_management();
  unint64_t v10 = v8 / 7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v21 = v10;
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "Average Number of notifications being sent to client = %lu", buf, 0xCu);
  }

  (*(void (**)(void, unint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, v11, v12);
  _Block_object_dispose(&v16, 8);
}

void __68__ATXDigestOnboardingSuggestionClient_averageNumberOfNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  id v10 = [a2 eventBody];
  uint64_t v3 = [v10 bundleID];
  if (v3)
  {
    id v4 = (void *)v3;
    int v5 = [v10 absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;
    [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
    double v9 = v8;

    if (v7 >= v9) {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

- (BOOL)hasNotificationProblemForPreviousNumDays:(int64_t)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v6 = objc_opt_new();
  v31 = [v5 dateByAddingUnit:16 value:-a3 toDate:v6 options:0];

  uint64_t v30 = objc_opt_new();
  double v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v31;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Checking for notification problem from start date: %@", buf, 0x16u);
  }

  double v8 = objc_opt_new();
  if (a3 >= 1)
  {
    int64_t v9 = a3;
    do
    {
      id v10 = objc_opt_new();
      [v8 addObject:v10];

      --v9;
    }
    while (v9);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v48 = 0;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  uint64_t v12 = [(ATXDigestOnboardingSuggestionClient *)self notificationStreamPublisherForStartDate:v11];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __80__ATXDigestOnboardingSuggestionClient_hasNotificationProblemForPreviousNumDays___block_invoke_2;
  v38[3] = &unk_1E5D05410;
  id v29 = v5;
  id v39 = v29;
  __int16 v40 = buf;
  id v13 = (id)[v12 sinkWithCompletion:&__block_literal_global_26 shouldContinue:v38];

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v14 = [(ATXDigestOnboardingSuggestionClient *)self notificationStreamPublisherForStartDate:v31];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __80__ATXDigestOnboardingSuggestionClient_hasNotificationProblemForPreviousNumDays___block_invoke_2_32;
    v32[3] = &unk_1E5D05438;
    long long v33 = v31;
    id v34 = v29;
    id v35 = v30;
    int64_t v37 = a3;
    id v15 = v8;
    id v36 = v15;
    id v16 = (id)[v14 sinkWithCompletion:&__block_literal_global_31 receiveInput:v32];

    unint64_t v17 = 0;
    do
    {
      unint64_t v18 = [v15 count];
      BOOL v19 = v17 >= v18;
      if (v17 >= v18) {
        break;
      }
      v20 = [v15 objectAtIndexedSubscript:v17];
      unint64_t v21 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (char *)(id)objc_claimAutoreleasedReturnValue();
        v24 = [v15 objectAtIndexedSubscript:v17];
        uint64_t v25 = [v24 count];
        *(_DWORD *)unint64_t v41 = 138412802;
        __int16 v42 = v23;
        __int16 v43 = 2048;
        unint64_t v44 = v17 + 1;
        __int16 v45 = 2048;
        uint64_t v46 = v25;
        _os_log_impl(&dword_1A790D000, v21, OS_LOG_TYPE_DEFAULT, "%@: Number of apps receving notifications on day %lu: %lu", v41, 0x20u);
      }
      BOOL v26 = (unint64_t)[v20 count] > 5;

      ++v17;
    }
    while (v26);

    uint64_t v27 = v33;
  }
  else
  {
    uint64_t v27 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t v41 = 136315138;
      __int16 v42 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]";
      _os_log_impl(&dword_1A790D000, v27, OS_LOG_TYPE_DEFAULT, "%s: Not suggesting digest onboarding because there likely isn't enough data in the notification database.", v41, 0xCu);
    }
    BOOL v19 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v19;
}

BOOL __80__ATXDigestOnboardingSuggestionClient_hasNotificationProblemForPreviousNumDays___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 eventBody];
  id v4 = [v3 bundleID];

  if (v4)
  {
    int v5 = [v3 absoluteTimestamp];
    double v6 = *(void **)(a1 + 32);
    double v7 = objc_opt_new();
    double v8 = [v6 components:16 fromDate:v5 toDate:v7 options:0];

    uint64_t v9 = [v8 day];
    if (v9 >= 0) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = -v9;
    }
    uint64_t v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v3 bundleID];
      int v16 = 136315906;
      unint64_t v17 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]_block_invoke";
      __int16 v18 = 2048;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      unint64_t v21 = v5;
      __int16 v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "%s: First valid notification event in the stream occurred %ld days ago on %@ from %@", (uint8_t *)&v16, 0x2Au);
    }
    id v13 = __atxlog_handle_notification_management();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10 > 0xE)
    {
      if (v14)
      {
        int v16 = 136315138;
        unint64_t v17 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]_block_invoke";
        _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "%s: There's enough notification data on the device to show the digest onboarding suggestion.", (uint8_t *)&v16, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      if (v14)
      {
        int v16 = 136315394;
        unint64_t v17 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]_block_invoke";
        __int16 v18 = 2048;
        uint64_t v19 = 14;
        _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "%s: Not enough notification data to show digest onboarding suggestion since first valid notification event in the stream was less than %ld days old. This means we likely don't have enough data in the notification database to return a correct list of apps ranked by non-time-sensitive / non-message notification counts.", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
    int v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      unint64_t v17 = "-[ATXDigestOnboardingSuggestionClient hasNotificationProblemForPreviousNumDays:]_block_invoke_2";
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Event didn't have bundleId, continuing.", (uint8_t *)&v16, 0xCu);
    }
  }

  return v4 == 0;
}

void __80__ATXDigestOnboardingSuggestionClient_hasNotificationProblemForPreviousNumDays___block_invoke_2_32(uint64_t a1, void *a2)
{
  id v17 = [a2 eventBody];
  uint64_t v3 = [v17 bundleID];
  if (v3)
  {
    id v4 = (void *)v3;
    int v5 = [v17 absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;
    [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
    double v9 = v8;

    if (v7 >= v9)
    {
      unint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = [v17 absoluteTimestamp];
      uint64_t v12 = [v10 components:16 fromDate:v11 toDate:*(void *)(a1 + 48) options:0];

      uint64_t v13 = [v12 day];
      if (v13 >= 0) {
        unint64_t v14 = v13;
      }
      else {
        unint64_t v14 = -v13;
      }
      if (v14 < *(void *)(a1 + 64))
      {
        id v15 = objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:");
        int v16 = [v17 bundleID];
        [v15 addObject:v16];
      }
    }
  }
}

- (id)notificationStreamPublisherForStartDate:(id)a3
{
  id v4 = a3;
  int v5 = BiomeLibrary();
  double v6 = [v5 Notification];
  double v7 = [v6 Usage];
  double v8 = objc_msgSend(v7, "atx_publisherFromStartDate:", v4);

  double v9 = [(ATXDigestOnboardingSuggestionClient *)self _notificationStreamFilterBlock];
  unint64_t v10 = [v8 filterWithIsIncluded:v9];

  return v10;
}

- (id)_notificationStreamFilterBlock
{
  return &__block_literal_global_34;
}

uint64_t __69__ATXDigestOnboardingSuggestionClient__notificationStreamFilterBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 eventBody];

  if (v3)
  {
    id v4 = [v2 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      double v6 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __69__ATXDigestOnboardingSuggestionClient__notificationStreamFilterBlock__block_invoke_cold_1((uint64_t)v4, v6);
      }

      double v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3B8];
      double v9 = (objc_class *)objc_opt_class();
      unint64_t v10 = NSStringFromClass(v9);
      [v7 raise:v8, @"Encountered event in ATXDigestOnboardingSuggestionClient that was of unknown class. Expected BMNotificationUsage. Received: %@", v10 format];
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_unregisterForLocaleChangeOnMainQueue
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];
}

- (void)_registerForLocaleChangeOnMainQueue
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleLocaleChange name:*MEMORY[0x1E4F1C370] object:0];
}

- (void)_handleLocaleChange
{
  [(ATXDigestOnboardingSuggestionClient *)self unregisterForOnboardingSuggestions];

  [(ATXDigestOnboardingSuggestionClient *)self registerForOnboardingSuggestions];
}

- (void)_setProbabilityOfShowingDigestOnboardingToUser
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"probabilityOfShowingDigestOnboardingSuggestion"];

  if (!v3)
  {
    double v4 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0;
    int v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      double v9 = v4;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "Random number being assigned for digest onboarding suggestion = %f", (uint8_t *)&v8, 0xCu);
    }

    userDefaults = self->_userDefaults;
    double v7 = [NSNumber numberWithDouble:v4];
    [(NSUserDefaults *)userDefaults setObject:v7 forKey:@"probabilityOfShowingDigestOnboardingSuggestion"];
  }
}

+ (void)resetDigestOnboardingSuggestionsAtHour:(id)a3 minute:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F1CB18]);
  double v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  [v7 setBool:0 forKey:@"hasSetUpDigestBefore"];
  [v7 setBool:0 forKey:@"digestOnboardingSuggestionShown"];
  if (v8) {
    objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v8, "integerValue"), @"digestOnboardingSuggestionHour");
  }
  if (v5) {
    objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "integerValue"), @"digestOnboardingSuggestionMinute");
  }
}

+ (void)removeRandomizedSelectionForDigestOnboardingSuggestion
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  [v3 setObject:&unk_1EFDF4F68 forKey:@"probabilityOfShowingDigestOnboardingSuggestion"];
  double v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "Removed randomized selection for digest onboarding suggestion", v5, 2u);
  }
}

+ (void)resetRandomizedSelectionForDigestOnboardingSuggestion
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  [v3 removeObjectForKey:@"probabilityOfShowingDigestOnboardingSuggestion"];
  double v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "Resetting randomized selection for digest onboarding suggestion", v5, 2u);
  }
}

+ (void)changeNumPreviousDaysToCheckForNotificationProblemToNumDays:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  [v5 setInteger:a3 forKey:@"numPreviousDaysToCheckForNotificationProblem"];
  id v6 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    unint64_t v8 = a3;
    _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "Change number of previous days to check for notification problem to %lu", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_registerForKVOChangesOnMainQueue
{
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    if (!self->_hasRegisteredKVO)
    {
      [(NSUserDefaults *)self->_userDefaults addObserver:self forKeyPath:@"digestOnboardingSuggestionHour" options:0 context:0];
      [(NSUserDefaults *)self->_userDefaults addObserver:self forKeyPath:@"digestOnboardingSuggestionMinute" options:0 context:0];
      [(NSUserDefaults *)self->_userDefaults addObserver:self forKeyPath:@"probabilityOfShowingDigestOnboardingSuggestion" options:0 context:0];
      self->_hasRegisteredKVO = 1;
    }
  }
}

- (void)_unregisterForKVOChangesOnMainQueue
{
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    if (self->_hasRegisteredKVO)
    {
      [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"digestOnboardingSuggestionHour" context:0];
      [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"digestOnboardingSuggestionMinute" context:0];
      [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"probabilityOfShowingDigestOnboardingSuggestion" context:0];
      self->_hasRegisteredKVO = 0;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"digestOnboardingSuggestionHour"] & 1) != 0
    || ([v10 isEqualToString:@"digestOnboardingSuggestionMinute"] & 1) != 0
    || [v10 isEqualToString:@"probabilityOfShowingDigestOnboardingSuggestion"])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5D04FC8;
    id v15 = v10;
    int v16 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ATXDigestOnboardingSuggestionClient;
    [(ATXDigestOnboardingSuggestionClient *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"probabilityOfShowingDigestOnboardingSuggestion"])
  {
    id v2 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:@"probabilityOfShowingDigestOnboardingSuggestion"];

    if (!v2) {
      [*(id *)(a1 + 40) _setProbabilityOfShowingDigestOnboardingToUser];
    }
    id v3 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "registering for onboarding suggestions again, since the random number has been changed";
LABEL_8:
      _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
    }
  }
  else
  {
    id v3 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "registering for onboarding suggestions again, since the suggestion time has been changed";
      goto LABEL_8;
    }
  }

  [*(id *)(a1 + 40) _invalidateTriggerOnMainQueue];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(NSObject **)(v5 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke_44;
  block[3] = &unk_1E5D05300;
  void block[4] = v5;
  dispatch_async(v6, block);
}

void __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke_44(uint64_t a1)
{
  id v2 = +[ATXNotificationManagementMAConstants sharedInstance];
  [v2 thresholdForShowingDigestOnboardingSuggestionToSeedUsers];
  uint64_t v4 = v3;
  [v2 thresholdForShowingDigestOnboardingSuggestion];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  block[3] = &unk_1E5D05480;
  void block[4] = *(void *)(a1 + 32);
  void block[5] = v4;
  block[6] = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __86__ATXDigestOnboardingSuggestionClient_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForOnboardingSuggestionOnMainQueueWithThresholdForShowingDigestOnboardingSuggestionToSeedUsers:*(double *)(a1 + 40) thresholdForShowingDigestOnboardingSuggestion:*(double *)(a1 + 48)];
}

- (void)dealloc
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(ATXDigestOnboardingSuggestionClient *)self _unregisterForKVOChangesOnMainQueue];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__ATXDigestOnboardingSuggestionClient_dealloc__block_invoke;
    block[3] = &unk_1E5D05300;
    void block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  v3.receiver = self;
  v3.super_class = (Class)ATXDigestOnboardingSuggestionClient;
  [(ATXDigestOnboardingSuggestionClient *)&v3 dealloc];
}

uint64_t __46__ATXDigestOnboardingSuggestionClient_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterForKVOChangesOnMainQueue];
}

- (void)clientDidRejectOnboardingSuggestion
{
  objc_super v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "ATXDigestOnboardingSuggestionClient: client rejected onboarding suggestion", v4, 2u);
  }

  [(id)objc_opt_class() resetDigestOnboardingSuggestionsAtHour:0 minute:0];
  [(ATXDigestOnboardingSuggestionClient *)self unregisterForOnboardingSuggestions];
  [(ATXDigestOnboardingSuggestionClient *)self registerForOnboardingSuggestions];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)init
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A790D000, log, OS_LOG_TYPE_DEBUG, "Creating ATXDigestOnboardingSuggestionClient", v1, 2u);
}

void __69__ATXDigestOnboardingSuggestionClient__notificationStreamFilterBlock__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Encountered event in ATXDigestOnboardingSuggestionClient that was of unknown class. Expected BMNotificationUsage. Received: %@", (uint8_t *)&v5, 0xCu);
}

@end