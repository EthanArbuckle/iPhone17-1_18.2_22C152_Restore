@interface HRAtrialFibrillationNotificationManager
- (BOOL)_allowAtrialFibrillationDisableOrReEnableRemotelyAlertWithFeatureStatus:(id)a3;
- (BOOL)_isPairedSyncCompleted;
- (BOOL)_queue_isCompanionSoftwareVersionTooOld;
- (BOOL)_queue_isWatchSoftwareVersionTooOld;
- (BOOL)isCompanionSoftwareVersionTooOld;
- (BOOL)isWatchSoftwareVersionTooOld;
- (HDKeyValueDomain)localKeyValueDomain;
- (HDKeyValueDomain)syncedKeyValueDomain;
- (HRAtrialFibrillationAnalyticsCollector)analyticsCollector;
- (HRAtrialFibrillationNotificationManager)initWithProfile:(id)a3 availabilityManager:(id)a4;
- (HRAtrialFibrillationNotificationManager)initWithProfile:(id)a3 featureStatusManager:(id)a4;
- (id)_getProductVersionWithError:(id *)a3;
- (id)_queue_fakeHeartbeatSeriesSampleFromDate:(id)a3;
- (int64_t)_atrialFibrillationDetectionRescindedStatusForFeatureStatus:(id)a3;
- (void)_addNotificationRequestForCompanionSoftwareVersionIsTooOld;
- (void)_addNotificationRequestForWatchSoftwareVersionIsTooOld;
- (void)_presentAtrialFibrillationDetectionAlertWithRescindedStatus:(int64_t)a3;
- (void)_presentAtrialFibrillationDetectionReEnabledAlert;
- (void)_presentNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 defaultButtonTitle:(id)a6 otherButtonTitle:(id)a7 alertLevel:(int64_t)a8 responseHandler:(id)a9;
- (void)_queue_addNotificationRequestForAtrialFibrillationEvent:(id)a3;
- (void)_queue_fakeHeartbeatSeriesSamplesForEvent:(id)a3;
- (void)_queue_fakeNotificationWithData:(BOOL)a3;
- (void)_queue_isCompanionSoftwareVersionTooOld;
- (void)_queue_isWatchSoftwareVersionTooOld;
- (void)_queue_setAtrialFibrillationDetectionDisabledNotificationShownDate:(id)a3;
- (void)_subscribeToFakingNotifications;
- (void)_unsubscribeToFakingNotifications;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)notifyUserThatAntimonyIsUnavailableForWatchOSVersionIfNeeded;
- (void)notifyUserThatAntimonyIsUnavailableForiOSVersionIfNeeded;
- (void)presentAtrialFibrillationDetectionReEnabledAlertIfNeeded;
- (void)presentAtrialFibrillationDetectionRescindedAlertIfNeeded;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setAnalyticsCollector:(id)a3;
@end

@implementation HRAtrialFibrillationNotificationManager

- (HRAtrialFibrillationNotificationManager)initWithProfile:(id)a3 availabilityManager:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F2B068];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithFeatureAvailabilityProviding:v7 healthDataSource:v8];

  v10 = [(HRAtrialFibrillationNotificationManager *)self initWithProfile:v8 featureStatusManager:v9];
  return v10;
}

- (HRAtrialFibrillationNotificationManager)initWithProfile:(id)a3 featureStatusManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HRAtrialFibrillationNotificationManager;
  id v8 = [(HRAtrialFibrillationNotificationManager *)&v36 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_statusManager, a4);
    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F44680]);
    uint64_t v13 = [v12 initWithBundleIdentifier:*MEMORY[0x1E4F67D78]];
    userNotificationCenter = v9->_userNotificationCenter;
    v9->_userNotificationCenter = (UNUserNotificationCenter *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    fakingNotificationTokens = v9->_fakingNotificationTokens;
    v9->_fakingNotificationTokens = (NSMutableArray *)v15;

    v17 = (void *)MEMORY[0x1E4F65B28];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v19 = objc_msgSend(v17, "hdhr_heartRhythmProtectedLocalDomainForProfile:", WeakRetained);
    localKeyValueDomain = v9->_localKeyValueDomain;
    v9->_localKeyValueDomain = (HDKeyValueDomain *)v19;

    v21 = (void *)MEMORY[0x1E4F65B28];
    id v22 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v23 = objc_msgSend(v21, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", v22);
    syncedKeyValueDomain = v9->_syncedKeyValueDomain;
    v9->_syncedKeyValueDomain = (HDKeyValueDomain *)v23;

    v25 = v9->_userNotificationCenter;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __80__HRAtrialFibrillationNotificationManager_initWithProfile_featureStatusManager___block_invoke;
    v34[3] = &unk_1E69B45A8;
    v26 = v9;
    v35 = v26;
    [(UNUserNotificationCenter *)v25 requestAuthorizationWithOptions:6 completionHandler:v34];
    v27 = [HRAtrialFibrillationAnalyticsCollector alloc];
    id v28 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v29 = [(HRAtrialFibrillationAnalyticsCollector *)v27 initWithProfile:v28];
    analyticsCollector = v26->_analyticsCollector;
    v26->_analyticsCollector = (HRAtrialFibrillationAnalyticsCollector *)v29;

    [(HRAtrialFibrillationNotificationManager *)v26 _subscribeToFakingNotifications];
    id v31 = objc_loadWeakRetained((id *)&v9->_profile);
    v32 = [v31 daemon];
    [v32 registerForDaemonReady:v26];
  }
  return v9;
}

void __80__HRAtrialFibrillationNotificationManager_initWithProfile_featureStatusManager___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __80__HRAtrialFibrillationNotificationManager_initWithProfile_featureStatusManager___block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = [WeakRetained dataManager];
  id v5 = [MEMORY[0x1E4F2ACB8] atrialFibrillationEventType];
  [v4 removeObserver:self forDataType:v5];

  [(HRAtrialFibrillationNotificationManager *)self _unsubscribeToFakingNotifications];
  v6.receiver = self;
  v6.super_class = (Class)HRAtrialFibrillationNotificationManager;
  [(HRAtrialFibrillationNotificationManager *)&v6 dealloc];
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = [WeakRetained dataManager];
  id v5 = [MEMORY[0x1E4F2ACB8] atrialFibrillationEventType];
  [v4 addObserver:self forDataType:v5];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v7 = [v6 healthAppHiddenOrNotInstalled];

  if (v7)
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      uint64_t v10 = HRLogSensitiveClassName();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring event, health app is hidden or deleted.", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__HRAtrialFibrillationNotificationManager_samplesAdded_anchor___block_invoke;
    v12[3] = &unk_1E69B4578;
    id v13 = v5;
    v14 = self;
    dispatch_async(queue, v12);
  }
}

void __63__HRAtrialFibrillationNotificationManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v19;
    *(void *)&long long v3 = 138543618;
    long long v16 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "sourceRevision", v16);
        v9 = [v8 source];
        if ([v9 _isAppleWatch])
        {
          uint64_t v10 = [v7 sourceRevision];
          v11 = [v10 source];
          char v12 = [v11 _isLocalDevice];

          if (v12)
          {
            objc_msgSend(*(id *)(a1 + 40), "_queue_addNotificationRequestForAtrialFibrillationEvent:", v7);
            continue;
          }
        }
        else
        {
        }
        _HKInitializeLogging();
        id v13 = (void *)*MEMORY[0x1E4F29F50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          uint64_t v15 = HRLogSensitiveClassName();
          *(_DWORD *)buf = v16;
          uint64_t v23 = v15;
          __int16 v24 = 2112;
          v25 = v7;
          _os_log_impl(&dword_1D3AC6000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring event without first party / local device source: %@", buf, 0x16u);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)_queue_addNotificationRequestForAtrialFibrillationEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  objc_super v6 = HRLocalizedStringWithKey(@"ATRIAL_FIBRILLATION_NOTIFICATION_TITLE");
  [v5 setTitle:v6];

  int v7 = HRLocalizedStringWithKey(@"ATRIAL_FIBRILLATION_NOTIFICATION_BODY");
  [v5 setBody:v7];

  [v5 setCategoryIdentifier:@"IrregularHeartRhythm"];
  [v5 setThreadIdentifier:@"IrregularHeartRhythm"];
  id v8 = [MEMORY[0x1E4F445C0] soundWithAlertType:25];
  [v8 setAlertTopic:*MEMORY[0x1E4FAF618]];
  [v5 setSound:v8];
  v9 = (void *)MEMORY[0x1E4F44628];
  uint64_t v10 = [v4 UUID];
  v11 = [v10 UUIDString];
  char v12 = [v9 requestWithIdentifier:v11 content:v5 trigger:0];

  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v14 = [WeakRetained notificationManager];

  if (v14) {
    char v15 = [v14 areHealthNotificationsAuthorized];
  }
  else {
    char v15 = 0;
  }
  userNotificationCenter = self->_userNotificationCenter;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99__HRAtrialFibrillationNotificationManager__queue_addNotificationRequestForAtrialFibrillationEvent___block_invoke;
  v20[3] = &unk_1E69B4E98;
  objc_copyWeak(&v24, &location);
  id v17 = v12;
  id v21 = v17;
  id v18 = v5;
  id v22 = v18;
  id v19 = v4;
  id v23 = v19;
  char v25 = v15;
  [(UNUserNotificationCenter *)userNotificationCenter addNotificationRequest:v17 withCompletionHandler:v20];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __99__HRAtrialFibrillationNotificationManager__queue_addNotificationRequestForAtrialFibrillationEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29F50];
  id v5 = *MEMORY[0x1E4F29F50];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __99__HRAtrialFibrillationNotificationManager__queue_addNotificationRequestForAtrialFibrillationEvent___block_invoke_cold_1((id *)a1, v4, (uint64_t)v3);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      id v8 = HRLogSensitiveClassName();
      v9 = [*(id *)(a1 + 32) identifier];
      uint64_t v10 = [*(id *)(a1 + 40) categoryIdentifier];
      v11 = HKSensitiveLogItem();
      int v13 = 138543874;
      v14 = v8;
      __int16 v15 = 2114;
      long long v16 = v9;
      __int16 v17 = 2114;
      id v18 = v11;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested notification (%{public}@ - %{public}@)", (uint8_t *)&v13, 0x20u);
    }
    char v12 = [[HDHRNotificationAnalytics alloc] initWithEventSample:*(void *)(a1 + 48) areHealthNotificationsAuthorized:*(unsigned __int8 *)(a1 + 64)];
    [(HDHRNotificationAnalytics *)v12 submit];
  }
}

- (void)_addNotificationRequestForCompanionSoftwareVersionIsTooOld
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = HRLocalizedStringWithKey(@"ATRIAL_FIBRILLATION_DISABLED_NOTIFICATION_TITLE");
  id v4 = HRLocalizedStringWithKey(@"ATRIAL_FIBRILLATION_DISABLED_PHONE_NOTIFICATION_BODY");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke;
  v7[3] = &unk_1E69B4EC0;
  objc_copyWeak(&v8, &location);
  [(HRAtrialFibrillationNotificationManager *)self _presentNotificationWithTitle:v3 message:v4 cancelButtonTitle:0 defaultButtonTitle:0 otherButtonTitle:0 alertLevel:0 responseHandler:v7];

  _HKInitializeLogging();
  id v5 = (id)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = HRLogSensitiveClassName();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested companion software version is too old notification", buf, 0xCu);
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    objc_super v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)_addNotificationRequestForWatchSoftwareVersionIsTooOld
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = HRLocalizedStringWithKey(@"ATRIAL_FIBRILLATION_DISABLED_WATCH_NOTIFICATION_TITLE");
  id v4 = HRLocalizedStringWithKey(@"ATRIAL_FIBRILLATION_DISABLED_WATCH_NOTIFICATION_BODY");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__HRAtrialFibrillationNotificationManager__addNotificationRequestForWatchSoftwareVersionIsTooOld__block_invoke;
  v7[3] = &unk_1E69B4EC0;
  objc_copyWeak(&v8, &location);
  [(HRAtrialFibrillationNotificationManager *)self _presentNotificationWithTitle:v3 message:v4 cancelButtonTitle:0 defaultButtonTitle:0 otherButtonTitle:0 alertLevel:0 responseHandler:v7];

  _HKInitializeLogging();
  id v5 = (id)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = HRLogSensitiveClassName();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested Watch software version is too old notification", buf, 0xCu);
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __97__HRAtrialFibrillationNotificationManager__addNotificationRequestForWatchSoftwareVersionIsTooOld__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    objc_super v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(a1, v6);
    }
  }
}

- (BOOL)_queue_isCompanionSoftwareVersionTooOld
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  statusManager = self->_statusManager;
  id v12 = 0;
  id v4 = [(HKFeatureStatusManager *)statusManager featureStatusWithError:&v12];
  id v5 = v12;
  if (v4)
  {
    char v6 = [v4 isOnboardingRecordPresent];
    int v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F29C68]];
    char v9 = [v8 BOOLValue];

    char v10 = v6 & (v9 ^ 1);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationNotificationManager _queue_isCompanionSoftwareVersionTooOld]();
    }
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isCompanionSoftwareVersionTooOld
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__HRAtrialFibrillationNotificationManager_isCompanionSoftwareVersionTooOld__block_invoke;
  v5[3] = &unk_1E69B47D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__HRAtrialFibrillationNotificationManager_isCompanionSoftwareVersionTooOld__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isCompanionSoftwareVersionTooOld");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_isWatchSoftwareVersionTooOld
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  statusManager = self->_statusManager;
  id v12 = 0;
  id v4 = [(HKFeatureStatusManager *)statusManager featureStatusWithError:&v12];
  id v5 = v12;
  if (v4)
  {
    char v6 = [v4 isOnboardingRecordPresent];
    int v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F29C70]];
    char v9 = [v8 BOOLValue];

    char v10 = v6 & (v9 ^ 1);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationNotificationManager _queue_isWatchSoftwareVersionTooOld]();
    }
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isWatchSoftwareVersionTooOld
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationNotificationManager_isWatchSoftwareVersionTooOld__block_invoke;
  v5[3] = &unk_1E69B47D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__HRAtrialFibrillationNotificationManager_isWatchSoftwareVersionTooOld__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isWatchSoftwareVersionTooOld");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)notifyUserThatAntimonyIsUnavailableForiOSVersionIfNeeded
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  char v3 = [v5 objectForKey:@"OldCompanionVersionNotificationDate"];

  if (!v3)
  {
    [(HRAtrialFibrillationNotificationManager *)self _addNotificationRequestForCompanionSoftwareVersionIsTooOld];
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v5 setObject:v4 forKey:@"OldCompanionVersionNotificationDate"];
  }
}

- (void)notifyUserThatAntimonyIsUnavailableForWatchOSVersionIfNeeded
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  char v3 = [v5 objectForKey:@"OldWatchVersionNotificationDate"];

  if (!v3)
  {
    [(HRAtrialFibrillationNotificationManager *)self _addNotificationRequestForWatchSoftwareVersionIsTooOld];
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v5 setObject:v4 forKey:@"OldWatchVersionNotificationDate"];
  }
}

- (void)_presentNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 defaultButtonTitle:(id)a6 otherButtonTitle:(id)a7 alertLevel:(int64_t)a8 responseHandler:(id)a9
{
  __int16 v15 = (objc_class *)MEMORY[0x1E4F65D98];
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = objc_alloc_init(v15);
  [v22 setTitle:v21];

  [v22 setMessage:v20];
  [v22 setCancelButton:v19];

  [v22 setDefaultButton:v18];
  [v22 setOtherButton:v17];

  [v22 setAlertLevel:a8];
  [v22 presentWithResponseHandler:v16];
}

- (int64_t)_atrialFibrillationDetectionRescindedStatusForFeatureStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isOnboardingRecordPresent])
  {
    id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29CF8]];
    int v6 = [v5 BOOLValue];

    int v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29C88]];
    int v8 = [v7 BOOLValue];

    if (v6) {
      int64_t v9 = v8 ^ 1u;
    }
    else {
      int64_t v9 = 2;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_isPairedSyncCompleted
{
  return 1;
}

- (BOOL)_allowAtrialFibrillationDisableOrReEnableRemotelyAlertWithFeatureStatus:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(HRAtrialFibrillationNotificationManager *)self _isPairedSyncCompleted])
  {
    int v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = *MEMORY[0x1E4F29C88];
    v29[0] = *MEMORY[0x1E4F29CF8];
    v29[1] = v7;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    int64_t v9 = [v6 setWithArray:v8];

    char v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
    v11 = [v10 unsatisfiedRequirementIdentifiers];

    id v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    int v13 = (void *)[v12 isSubsetOfSet:v9];

    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = v14;
      id v16 = HRLogSensitiveClassName();
      id v17 = [NSNumber numberWithBool:v13];
      int v23 = 138543874;
      id v24 = v16;
      __int16 v25 = 2114;
      v26 = v17;
      __int16 v27 = 2114;
      id v28 = v11;
      _os_log_impl(&dword_1D3AC6000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Can present rescinded or re-enabled alert: %{public}@; unsatisfied requirements: %{public}@",
        (uint8_t *)&v23,
        0x20u);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v18 = (void *)*MEMORY[0x1E4F29F50];
    LOBYTE(v13) = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      id v20 = HRLogSensitiveClassName();
      int v13 = NSStringFromSelector(a2);
      id v21 = HKSensitiveLogItem();
      int v23 = 138543618;
      id v24 = v20;
      __int16 v25 = 2114;
      v26 = v21;
      _os_log_impl(&dword_1D3AC6000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> NO, paired sync not completed", (uint8_t *)&v23, 0x16u);

      LOBYTE(v13) = 0;
    }
  }

  return (char)v13;
}

- (void)presentAtrialFibrillationDetectionRescindedAlertIfNeeded
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to retrieve IRN's feature status; unable to check if rescinded: %{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void __99__HRAtrialFibrillationNotificationManager_presentAtrialFibrillationDetectionRescindedAlertIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(a1 + 32) _atrialFibrillationDetectionRescindedStatusForFeatureStatus:*(void *)(a1 + 40)];
  uint64_t v4 = *(void **)(*(void *)v2 + 56);
  uint64_t v5 = *MEMORY[0x1E4F2BCE8];
  id v29 = 0;
  uint64_t v6 = [v4 dateForKey:v5 error:&v29];
  id v7 = v29;
  _HKInitializeLogging();
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F29F50];
  uint64_t v9 = (void *)*MEMORY[0x1E4F29F50];
  uint8_t v10 = *MEMORY[0x1E4F29F50];
  if (v7)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    __int16 v15 = v9;
    id v18 = HRLogSensitiveClassName();
    __int16 v25 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v20 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    id v31 = v18;
    __int16 v32 = 2114;
    v33 = v20;
    __int16 v34 = 2114;
    id v35 = v7;
    _os_log_error_impl(&dword_1D3AC6000, v15, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Failed to load notification shown date with error: %{public}@", buf, 0x20u);

    goto LABEL_13;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    v26 = HRLogSensitiveClassName();
    __int16 v27 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = HKSensitiveLogItem();
    id v12 = NSStringFromHKFeatureAvailabilityRescindedStatus();
    int v13 = HKSensitiveLogItem();
    v14 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138544386;
    id v31 = v26;
    __int16 v32 = 2114;
    v33 = v11;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    v37 = v14;
    __int16 v38 = 2112;
    uint64_t v39 = 0;
    _os_log_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> IRN rescinded status: %@, IRN disabled notification shown date %@ with error: %@", buf, 0x34u);

    uint64_t v8 = (os_log_t *)MEMORY[0x1E4F29F50];
  }
  if (v3)
  {
    if (v6) {
      goto LABEL_3;
    }
    [*(id *)(a1 + 32) _presentAtrialFibrillationDetectionAlertWithRescindedStatus:v3];
    __int16 v15 = [MEMORY[0x1E4F1C9C8] date];
    objc_msgSend(*(id *)(a1 + 32), "_queue_setAtrialFibrillationDetectionDisabledNotificationShownDate:", v15);
    id v16 = [*(id *)(a1 + 40) onboardingRecord];
    id v17 = [v16 onboardingCompletion];
    id v18 = [v17 countryCode];

    [*(id *)(*(void *)(a1 + 32) + 64) collectAnalyticsForRemoteDisableMessageShownForOnboardingCountryCode:v18];
    _HKInitializeLogging();
    os_log_t v19 = *v8;
    if (!os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      goto LABEL_3;
    }
    id v20 = v19;
    id v21 = HRLogSensitiveClassName();
    id v22 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v23 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    id v31 = v21;
    __int16 v32 = 2114;
    v33 = v23;
    _os_log_impl(&dword_1D3AC6000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduling the IRN disabled notification", buf, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  _HKInitializeLogging();
  os_log_t v24 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT)) {
    __99__HRAtrialFibrillationNotificationManager_presentAtrialFibrillationDetectionRescindedAlertIfNeeded__block_invoke_cold_1(v2, v24);
  }
LABEL_3:
}

- (void)_presentAtrialFibrillationDetectionAlertWithRescindedStatus:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = &stru_1F2B36C98;
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      uint64_t v6 = @"ATRIAL_FIBRILLATION_DISABLED_REMOTELY_WATCH_NOTIFICATION_BODY";
      goto LABEL_6;
    case 2:
      uint64_t v6 = @"ATRIAL_FIBRILLATION_EXPIRED_SEED_WATCH_NOTIFICATION_BODY";
LABEL_6:
      HRLocalizedStringWithKey(v6);
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  objc_initWeak(&location, self);
  id v7 = HRLocalizedStringWithKey(@"ATRIAL_FIBRILLATION_DISABLED_REMOTELY_WATCH_NOTIFICATION_TITLE");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__HRAtrialFibrillationNotificationManager__presentAtrialFibrillationDetectionAlertWithRescindedStatus___block_invoke;
  v12[3] = &unk_1E69B4EC0;
  objc_copyWeak(&v13, &location);
  [(HRAtrialFibrillationNotificationManager *)self _presentNotificationWithTitle:v7 message:v3 cancelButtonTitle:0 defaultButtonTitle:0 otherButtonTitle:0 alertLevel:3 responseHandler:v12];

  _HKInitializeLogging();
  uint64_t v8 = (id)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HRLogSensitiveClassName();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint8_t v10 = NSStringFromSelector(a2);
    v11 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v11;
    _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduling IRN disabled notification and resetting IRN disabled notification shown date", buf, 0x16u);
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_10:
}

void __103__HRAtrialFibrillationNotificationManager__presentAtrialFibrillationDetectionAlertWithRescindedStatus___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)presentAtrialFibrillationDetectionReEnabledAlertIfNeeded
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to retrieve IRN's feature status; unable to check if no longer rescinded: %{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void __99__HRAtrialFibrillationNotificationManager_presentAtrialFibrillationDetectionReEnabledAlertIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _atrialFibrillationDetectionRescindedStatusForFeatureStatus:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v4 = *MEMORY[0x1E4F2BCE8];
  id v23 = 0;
  uint64_t v5 = [v3 dateForKey:v4 error:&v23];
  id v6 = v23;
  _HKInitializeLogging();
  uint64_t v7 = (void *)*MEMORY[0x1E4F29F50];
  uint64_t v8 = *MEMORY[0x1E4F29F50];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v7;
      uint8_t v10 = HRLogSensitiveClassName();
      v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v12 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      __int16 v25 = v10;
      __int16 v26 = 2114;
      __int16 v27 = v12;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_error_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Failed to load notification shown date with error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      log = v7;
      id v21 = HRLogSensitiveClassName();
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v14 = HKSensitiveLogItem();
      __int16 v15 = [NSNumber numberWithBool:v2 != 0];
      id v16 = HKSensitiveLogItem();
      __int16 v17 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138544130;
      __int16 v25 = v21;
      __int16 v26 = 2114;
      __int16 v27 = v14;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      _os_log_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> IRN disabled: %@, IRN disabled notification shown date: %@ ", buf, 0x2Au);
    }
    if (!v2 && v5)
    {
      [*(id *)(a1 + 32) _presentAtrialFibrillationDetectionReEnabledAlert];
      id v18 = [*(id *)(a1 + 40) onboardingRecord];
      uint64_t v19 = [v18 onboardingCompletion];
      id v20 = [v19 countryCode];

      [*(id *)(*(void *)(a1 + 32) + 64) collectAnalyticsForRemoteReEnableMessageShownForOnboardingCountryCode:v20];
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_setAtrialFibrillationDetectionDisabledNotificationShownDate:", 0);
  }
}

- (void)_presentAtrialFibrillationDetectionReEnabledAlert
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v4 = HRLocalizedStringWithKey(@"ATRIAL_FIBRILLATION_REENABLED_REMOTELY_WATCH_NOTIFICATION_TITLE");
  uint64_t v5 = HRLocalizedStringWithKey(@"ATRIAL_FIBRILLATION_REENABLED_REMOTELY_WATCH_NOTIFICATION_BODY");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__HRAtrialFibrillationNotificationManager__presentAtrialFibrillationDetectionReEnabledAlert__block_invoke;
  v10[3] = &unk_1E69B4EC0;
  objc_copyWeak(&v11, &location);
  [(HRAtrialFibrillationNotificationManager *)self _presentNotificationWithTitle:v4 message:v5 cancelButtonTitle:0 defaultButtonTitle:0 otherButtonTitle:0 alertLevel:3 responseHandler:v10];

  _HKInitializeLogging();
  id v6 = (id)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HRLogSensitiveClassName();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduling IRN re-enabled notification and resetting IRN disabled notification shown date", buf, 0x16u);
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __92__HRAtrialFibrillationNotificationManager__presentAtrialFibrillationDetectionReEnabledAlert__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)_queue_setAtrialFibrillationDetectionDisabledNotificationShownDate:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  localKeyValueDomain = self->_localKeyValueDomain;
  uint64_t v7 = *MEMORY[0x1E4F2BCE8];
  uint64_t v8 = 0;
  [(HDKeyValueDomain *)localKeyValueDomain setDate:v5 forKey:v7 error:&v8];
}

- (id)_getProductVersionWithError:(id *)a3
{
  uint64_t v4 = [(HKFeatureStatusManager *)self->_statusManager featureAvailabilityProviding];
  id v5 = [v4 pairedFeatureAttributesWithError:a3];
  id v6 = [v5 watchAttributes];
  uint64_t v7 = [v6 updateVersion];

  return v7;
}

- (void)_queue_fakeNotificationWithData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v5 = (os_log_t *)MEMORY[0x1E4F29F50];
  id v6 = (void *)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    uint64_t v8 = HRLogSensitiveClassName();
    uint64_t v9 = [NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 138543618;
    v43 = v8;
    __int16 v44 = 2112;
    v45 = v9;
    _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ faking atrial fibrillation notification, withData: %@", buf, 0x16u);
  }
  uint8_t v10 = [MEMORY[0x1E4F1C9C8] date];
  id v38 = 0;
  id v11 = [(HRAtrialFibrillationNotificationManager *)self _getProductVersionWithError:&v38];
  id v12 = v38;
  if (v11)
  {
    uint64_t v40 = *MEMORY[0x1E4F2BAC8];
    v41 = v11;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v14 = (void *)MEMORY[0x1E4F2ACB0];
    __int16 v15 = [MEMORY[0x1E4F2ACB8] atrialFibrillationEventType];
    id v16 = [v14 categorySampleWithType:v15 value:0 startDate:v10 endDate:v10 metadata:v13];

    if (v3)
    {
      id v35 = v13;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      uint64_t v17 = [WeakRetained dataManager];
      __int16 v36 = v16;
      uint64_t v39 = v16;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
      id location = (id *)&self->_profile;
      id v19 = objc_loadWeakRetained((id *)&self->_profile);
      id v20 = [v19 dataProvenanceManager];
      id v21 = [v20 defaultLocalDataProvenance];
      id v37 = v12;
      int v22 = [v17 insertDataObjects:v18 withProvenance:v21 creationDate:&v37 error:CFAbsoluteTimeGetCurrent()];
      id v33 = v37;

      id v23 = (NSObject **)MEMORY[0x1E4F29F50];
      _HKInitializeLogging();
      os_log_t v24 = *v23;
      __int16 v25 = *v23;
      if (v22)
      {
        id v26 = v33;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v27 = v24;
          __int16 v28 = HRLogSensitiveClassName();
          *(_DWORD *)buf = 138543618;
          v43 = v28;
          __int16 v44 = 2112;
          v45 = v36;
          _os_log_impl(&dword_1D3AC6000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ faking - saved event sample: %@", buf, 0x16u);
        }
      }
      else
      {
        id v26 = v33;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[HRAtrialFibrillationNotificationManager _queue_fakeNotificationWithData:]();
        }
      }
      id v16 = v36;
      [(HRAtrialFibrillationNotificationManager *)self _queue_fakeHeartbeatSeriesSamplesForEvent:v36];
      id v29 = [HDHRHealthKitSyncManager alloc];
      id v30 = objc_loadWeakRetained(location);
      id v31 = [(HDHRHealthKitSyncManager *)v29 initWithProfile:v30];

      [(HDHRHealthKitSyncManager *)v31 triggerImmediateSyncWithReason:@"New fake Atrial Fibrillation / Antimony Notification sample added" loggingCategory:*v23];
      id v12 = v26;
      id v13 = v35;
    }
    else
    {
      [(HRAtrialFibrillationNotificationManager *)self _queue_addNotificationRequestForAtrialFibrillationEvent:v16];
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationNotificationManager _queue_fakeNotificationWithData:]();
    }
  }
}

- (void)_queue_fakeHeartbeatSeriesSamplesForEvent:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v3 = 0;
  uint64_t v4 = 0;
  id location = (id *)&self->_profile;
  id v42 = a3;
  uint64_t v5 = -21600;
  *(void *)&long long v6 = 138543618;
  long long v39 = v6;
  do
  {
    uint64_t v7 = v4;
    uint64_t v8 = objc_msgSend(v42, "startDate", v39);
    uint64_t v9 = [v8 dateByAddingTimeInterval:(double)v5];

    __int16 v44 = (void *)v9;
    uint8_t v10 = [(HRAtrialFibrillationNotificationManager *)self _queue_fakeHeartbeatSeriesSampleFromDate:v9];
    uint64_t v45 = [v10 endDate];

    id WeakRetained = objc_loadWeakRetained(location);
    id v12 = [WeakRetained dataManager];
    v54[0] = v10;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    id v14 = objc_loadWeakRetained(location);
    __int16 v15 = [v14 dataProvenanceManager];
    id v16 = [v15 defaultLocalDataProvenance];
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    id v48 = v3;
    int v18 = [v12 insertDataObjects:v13 withProvenance:v16 creationDate:&v48 error:Current];
    id v43 = v48;

    _HKInitializeLogging();
    id v19 = (void *)*MEMORY[0x1E4F29F50];
    id v20 = *MEMORY[0x1E4F29F50];
    if (!v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v33 = v19;
        __int16 v34 = HRLogSensitiveClassName();
        *(_DWORD *)buf = v39;
        v51 = v34;
        __int16 v52 = 2114;
        id v3 = v43;
        id v53 = v43;
        _os_log_error_impl(&dword_1D3AC6000, v33, OS_LOG_TYPE_ERROR, "%{public}@ faking - failed to save heartbeat series with error: %{public}@", buf, 0x16u);
      }
      else
      {
        id v3 = v43;
      }
LABEL_10:
      id v30 = v44;
      uint64_t v4 = (void *)v45;
      goto LABEL_11;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v19;
      int v22 = HRLogSensitiveClassName();
      *(_DWORD *)buf = v39;
      v51 = v22;
      __int16 v52 = 2112;
      id v53 = v10;
      _os_log_impl(&dword_1D3AC6000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ faking - saved heartbeat series: %@", buf, 0x16u);
    }
    id v23 = objc_loadWeakRetained(location);
    os_log_t v24 = [v23 associationManager];
    __int16 v25 = [v10 UUID];
    v49 = v25;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    __int16 v27 = [v42 UUID];
    id v47 = v43;
    char v28 = [v24 associateObjectUUIDs:v26 objectUUID:v27 error:&v47];
    id v3 = v47;

    if (v28) {
      goto LABEL_10;
    }
    _HKInitializeLogging();
    id v29 = (void *)*MEMORY[0x1E4F29F50];
    id v30 = v44;
    uint64_t v4 = (void *)v45;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
    {
      id v31 = v29;
      uint64_t v32 = HRLogSensitiveClassName();
      *(_DWORD *)buf = v39;
      v51 = v32;
      __int16 v52 = 2114;
      id v53 = v3;
      _os_log_error_impl(&dword_1D3AC6000, v31, OS_LOG_TYPE_ERROR, "%{public}@ faking - failed to associate heartbeat series with error: %{public}@", buf, 0x16u);
    }
LABEL_11:

    v5 += 3600;
  }
  while (v5 != -3600);
  syncedKeyValueDomain = self->_syncedKeyValueDomain;
  uint64_t v36 = *MEMORY[0x1E4F2BEC0];
  id v46 = v3;
  char v37 = [(HDKeyValueDomain *)syncedKeyValueDomain setDate:v4 forKey:v36 error:&v46];
  id v38 = v46;

  if ((v37 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationNotificationManager _queue_fakeHeartbeatSeriesSamplesForEvent:]();
    }
  }
}

- (id)_queue_fakeHeartbeatSeriesSampleFromDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA58] dataWithCapacity:960];
  uint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    double v6 = v6 + (double)arc4random_uniform(0xC8u) / 1000.0 + -0.1 + 1.0;
    v10[1] = 0;
    *(double *)uint8_t v10 = v6;
    objc_msgSend(v4, "replaceBytesInRange:withBytes:", v5, 16, v10);
    v5 += 16;
  }
  while (v5 != 960);
  uint64_t v7 = [v3 dateByAddingTimeInterval:v6];
  uint64_t v8 = [MEMORY[0x1E4F2B108] heartbeatSequenceSampleWithData:v4 startDate:v3 endDate:v7 metadata:0];

  return v8;
}

- (void)_subscribeToFakingNotifications
{
  objc_initWeak(&location, self);
  int out_token = 0;
  id v3 = (const char *)[@"com.apple.HeartRhythm.AtrialFibrillation" UTF8String];
  queue = self->_queue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __74__HRAtrialFibrillationNotificationManager__subscribeToFakingNotifications__block_invoke;
  handler[3] = &unk_1E69B46A8;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch(v3, &out_token, queue, handler);
  fakingNotificationTokens = self->_fakingNotificationTokens;
  double v6 = [NSNumber numberWithInt:out_token];
  [(NSMutableArray *)fakingNotificationTokens addObject:v6];

  int v13 = 0;
  uint64_t v7 = (const char *)[@"com.apple.HeartRhythm.AtrialFibrillationWithData" UTF8String];
  uint64_t v8 = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__HRAtrialFibrillationNotificationManager__subscribeToFakingNotifications__block_invoke_2;
  v11[3] = &unk_1E69B46A8;
  objc_copyWeak(&v12, &location);
  notify_register_dispatch(v7, &v13, v8, v11);
  uint64_t v9 = self->_fakingNotificationTokens;
  uint8_t v10 = [NSNumber numberWithInt:v13];
  [(NSMutableArray *)v9 addObject:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __74__HRAtrialFibrillationNotificationManager__subscribeToFakingNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_fakeNotificationWithData:", 0);
    id WeakRetained = v2;
  }
}

void __74__HRAtrialFibrillationNotificationManager__subscribeToFakingNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_fakeNotificationWithData:", 1);
    id WeakRetained = v2;
  }
}

- (void)_unsubscribeToFakingNotifications
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_fakingNotificationTokens;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "intValue", (void)v8);
        if (notify_is_valid_token(v7)) {
          notify_cancel(v7);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (HDKeyValueDomain)syncedKeyValueDomain
{
  return self->_syncedKeyValueDomain;
}

- (HDKeyValueDomain)localKeyValueDomain
{
  return self->_localKeyValueDomain;
}

- (HRAtrialFibrillationAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setAnalyticsCollector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_syncedKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_fakingNotificationTokens, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_statusManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

void __80__HRAtrialFibrillationNotificationManager_initWithProfile_featureStatusManager___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] UNUserNotificationCenter authorization request not granted for 'com.apple.HeartRate', error: %@", v7, v8, v9, v10, 2u);
}

void __99__HRAtrialFibrillationNotificationManager__queue_addNotificationRequestForAtrialFibrillationEvent___block_invoke_cold_1(id *a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1 + 7;
  uint64_t v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = HRLogSensitiveClassName();
  uint64_t v9 = [a1[4] identifier];
  uint64_t v10 = [a1[5] categoryIdentifier];
  int v11 = 138544130;
  id v12 = v8;
  __int16 v13 = 2114;
  id v14 = v9;
  __int16 v15 = 2114;
  id v16 = v10;
  __int16 v17 = 2114;
  uint64_t v18 = a3;
  _os_log_error_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to request notification (%{public}@ - %{public}@): %{public}@)", (uint8_t *)&v11, 0x2Au);
}

void __101__HRAtrialFibrillationNotificationManager__addNotificationRequestForCompanionSoftwareVersionIsTooOld__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_3(a1, a2);
  id v3 = OUTLINED_FUNCTION_5_2();
  uint64_t v4 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Notification handler responded with error: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_queue_isCompanionSoftwareVersionTooOld
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to retrieve IRN's feature status; reporting 'onboarded country is supported on companion': %{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);
}

- (void)_queue_isWatchSoftwareVersionTooOld
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to retrieve IRN's feature status; reporting 'onboarded country is supported on this watch': %{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void __99__HRAtrialFibrillationNotificationManager_presentAtrialFibrillationDetectionRescindedAlertIfNeeded__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HRLogSensitiveClassName();
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_1D3AC6000, v2, OS_LOG_TYPE_FAULT, "[%{public}@] IRN does not meet usage requirements but is expected to", (uint8_t *)&v4, 0xCu);
}

- (void)_queue_fakeNotificationWithData:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] faking - failed to get version: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_fakeNotificationWithData:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "%{public}@ faking - failed to save event with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_fakeHeartbeatSeriesSamplesForEvent:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] faking - failed to set last analyzed sample date in protected key value store: %{public}@", v6, v7, v8, v9, v10);
}

@end