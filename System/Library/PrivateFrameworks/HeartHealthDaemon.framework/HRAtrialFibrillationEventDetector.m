@interface HRAtrialFibrillationEventDetector
- (BOOL)_queue_analyzeCurrentConfirmationCycleSamples:(id)a3 withAlgorithmVersion:(int64_t)a4;
- (BOOL)_queue_detectionDisabled;
- (BOOL)_queue_detectionDisabledWithFeatureStatus:(id)a3;
- (BOOL)_queue_inConfirmationCycle;
- (BOOL)_unitTest_detectionDisabled;
- (BOOL)_unitTesting;
- (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager)availabilityManager;
- (HRAtrialFibrillationEventDetector)initWithProfile:(id)a3 availabilityManager:(id)a4 featureStatusManager:(id)a5 notificationManager:(id)a6;
- (HRAtrialFibrillationEventDetector)initWithProfile:(id)a3 availabilityManager:(id)a4 notificationManager:(id)a5;
- (NSArray)_unitTest_confirmationCycleSamples;
- (NSDate)_unitTest_latestAnalyzedSampleDate;
- (NSNumber)_unitTest_lastAlgorithmVersionUsed;
- (NSNumber)_unitTest_lastAnalyzedSampleAnchor;
- (id)_getProductVersionWithError:(id *)a3;
- (id)_initWithAnalyticsCollector:(id)a3 availabilityManager:(id)a4 featureStatusManager:(id)a5 profile:(id)a6;
- (id)_processTachograms:(id)a3 withAlgorithmVersion:(int64_t)a4;
- (id)_queue_confirmationCycleSamples;
- (id)_queue_filterSamplesByDateThreshold:(id)a3;
- (id)_queue_lastAlgorithmVersionUsed;
- (id)_queue_lastAnalyzedSampleAnchor;
- (id)_queue_latestAnalyzedSampleDate;
- (id)_queue_orderedConfirmationCycleSamplesFromSamples:(id)a3 requestedUUIDs:(id)a4;
- (id)_queue_orderedConfirmationCycleSamplesFromUUIDs:(id)a3;
- (id)_unitTest_moreTachogramsRequestedHandler;
- (id)_unitTest_processTachograms;
- (id)_unitTest_userAlertedHandler;
- (id)diagnosticDescription;
- (int64_t)_currentAlgorithmVersion;
- (void)_currentAlgorithmVersion;
- (void)_queue_alertUserWithDate:(id)a3 positiveTachogramUUIDs:(id)a4;
- (void)_queue_analyzeFilteredSeriesSamples:(id)a3 lastAnchor:(id)a4;
- (void)_queue_analyzeTachogramsSinceLastAnchor;
- (void)_queue_confirmationCycleSamples;
- (void)_queue_detectionDisabled;
- (void)_queue_endConfirmationCycleIfNeeded;
- (void)_queue_enqueueMaintainanceOperationForMissedTachograms;
- (void)_queue_forceHealthKitSync;
- (void)_queue_lastAlgorithmVersionUsed;
- (void)_queue_lastAnalyzedSampleAnchor;
- (void)_queue_latestAnalyzedSampleDate;
- (void)_queue_requestAnotherTachogram;
- (void)_queue_seriesSamplesAdded:(id)a3 lastAnchor:(id)a4;
- (void)_queue_setConfirmationCycleSamples:(id)a3;
- (void)_queue_setLastAlgorithmVersionUsed:(id)a3;
- (void)_queue_setLastAnalyzedSampleAnchor:(id)a3;
- (void)_queue_setLatestAnalyzedSampleDate:(id)a3;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setAvailabilityManager:(id)a3;
- (void)set_unitTest_detectionDisabled:(BOOL)a3;
- (void)set_unitTest_moreTachogramsRequestedHandler:(id)a3;
- (void)set_unitTest_processTachograms:(id)a3;
- (void)set_unitTest_userAlertedHandler:(id)a3;
- (void)set_unitTesting:(BOOL)a3;
@end

@implementation HRAtrialFibrillationEventDetector

- (HRAtrialFibrillationEventDetector)initWithProfile:(id)a3 availabilityManager:(id)a4 notificationManager:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F2B068];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithFeatureAvailabilityProviding:v10 healthDataSource:v11];
  v13 = [(HRAtrialFibrillationEventDetector *)self initWithProfile:v11 availabilityManager:v10 featureStatusManager:v12 notificationManager:v9];

  return v13;
}

- (HRAtrialFibrillationEventDetector)initWithProfile:(id)a3 availabilityManager:(id)a4 featureStatusManager:(id)a5 notificationManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)HRAtrialFibrillationEventDetector;
  v14 = [(HRAtrialFibrillationEventDetector *)&v34 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_availabilityManager, a4);
    objc_storeStrong((id *)&v15->_notificationManager, a6);
    objc_storeStrong((id *)&v15->_statusManager, a5);
    uint64_t v16 = HKCreateSerialDispatchQueue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    v18 = (void *)MEMORY[0x1E4F65B28];
    id WeakRetained = objc_loadWeakRetained((id *)&v15->_profile);
    uint64_t v20 = objc_msgSend(v18, "hdhr_heartRhythmProtectedLocalDomainForProfile:", WeakRetained);
    localKeyValueDomain = v15->_localKeyValueDomain;
    v15->_localKeyValueDomain = (HDKeyValueDomain *)v20;

    v22 = (void *)MEMORY[0x1E4F65B28];
    id v23 = objc_loadWeakRetained((id *)&v15->_profile);
    uint64_t v24 = objc_msgSend(v22, "hdhr_heartRhythmProtectedSyncedDomainForProfile:", v23);
    syncedKeyValueDomain = v15->_syncedKeyValueDomain;
    v15->_syncedKeyValueDomain = (HDKeyValueDomain *)v24;

    v26 = [HRAtrialFibrillationAnalyticsCollector alloc];
    id v27 = objc_loadWeakRetained((id *)&v15->_profile);
    uint64_t v28 = [(HRAtrialFibrillationAnalyticsCollector *)v26 initWithProfile:v27];
    analyticsCollector = v15->_analyticsCollector;
    v15->_analyticsCollector = (HRAtrialFibrillationAnalyticsCollector *)v28;

    id v30 = objc_loadWeakRetained((id *)&v15->_profile);
    v31 = [v30 daemon];
    [v31 registerForDaemonReady:v15];

    v32 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v32 addObject:v15];
  }
  return v15;
}

- (void)dealloc
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained dataManager];
  v6 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
  [v5 removeObserver:self forDataType:v6];

  id v7 = objc_loadWeakRetained((id *)p_profile);
  v8 = [v7 database];
  [v8 removeProtectedDataObserver:self];

  id v9 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v9 removeObject:self];

  if (notify_is_valid_token(self->_settingDidUpdateNotificationToken)) {
    notify_cancel(self->_settingDidUpdateNotificationToken);
  }
  v10.receiver = self;
  v10.super_class = (Class)HRAtrialFibrillationEventDetector;
  [(HRAtrialFibrillationEventDetector *)&v10 dealloc];
}

- (id)_initWithAnalyticsCollector:(id)a3 availabilityManager:(id)a4 featureStatusManager:(id)a5 profile:(id)a6
{
  id v11 = a3;
  id v12 = [(HRAtrialFibrillationEventDetector *)self initWithProfile:a6 availabilityManager:a4 featureStatusManager:a5 notificationManager:0];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_analyticsCollector, a3);
    v13->__unitTesting = 1;
  }

  return v13;
}

- (NSArray)_unitTest_confirmationCycleSamples
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  objc_super v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationEventDetector__unitTest_confirmationCycleSamples__block_invoke;
  v5[3] = &unk_1E69B47D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __71__HRAtrialFibrillationEventDetector__unitTest_confirmationCycleSamples__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_confirmationCycleSamples");

  return MEMORY[0x1F41817F8]();
}

- (NSNumber)_unitTest_lastAlgorithmVersionUsed
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  objc_super v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationEventDetector__unitTest_lastAlgorithmVersionUsed__block_invoke;
  v5[3] = &unk_1E69B47D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

uint64_t __71__HRAtrialFibrillationEventDetector__unitTest_lastAlgorithmVersionUsed__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_lastAlgorithmVersionUsed");

  return MEMORY[0x1F41817F8]();
}

- (NSDate)_unitTest_latestAnalyzedSampleDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  objc_super v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationEventDetector__unitTest_latestAnalyzedSampleDate__block_invoke;
  v5[3] = &unk_1E69B47D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

uint64_t __71__HRAtrialFibrillationEventDetector__unitTest_latestAnalyzedSampleDate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_latestAnalyzedSampleDate");

  return MEMORY[0x1F41817F8]();
}

- (NSNumber)_unitTest_lastAnalyzedSampleAnchor
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  objc_super v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__HRAtrialFibrillationEventDetector__unitTest_lastAnalyzedSampleAnchor__block_invoke;
  v5[3] = &unk_1E69B47D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

uint64_t __71__HRAtrialFibrillationEventDetector__unitTest_lastAnalyzedSampleAnchor__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_lastAnalyzedSampleAnchor");

  return MEMORY[0x1F41817F8]();
}

- (void)daemonReady:(id)a3
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v6 = [WeakRetained dataManager];
  id v7 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
  [v6 addObserver:self forDataType:v7];

  id v8 = objc_loadWeakRetained((id *)p_profile);
  id v9 = [v8 database];
  [v9 addProtectedDataObserver:self];

  objc_super v10 = (const char *)[@"HKHeartRateSettingsDidChangeNotification" UTF8String];
  queue = self->_queue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __49__HRAtrialFibrillationEventDetector_daemonReady___block_invoke;
  handler[3] = &unk_1E69B4800;
  handler[4] = self;
  notify_register_dispatch(v10, &self->_settingDidUpdateNotificationToken, queue, handler);
}

uint64_t __49__HRAtrialFibrillationEventDetector_daemonReady___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_detectionDisabled");
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_enqueueMaintainanceOperationForMissedTachograms");
  }
  return result;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__HRAtrialFibrillationEventDetector_database_protectedDataDidBecomeAvailable___block_invoke;
    block[3] = &unk_1E69B41B8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __78__HRAtrialFibrillationEventDetector_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  char v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_detectionDisabled");
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = (void *)v3[2];
    return [v4 presentAtrialFibrillationDetectionRescindedAlertIfNeeded];
  }
  else
  {
    objc_msgSend(v3, "_queue_enqueueMaintainanceOperationForMissedTachograms");
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
    return [v6 presentAtrialFibrillationDetectionReEnabledAlertIfNeeded];
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  statusManager = self->_statusManager;
  id v23 = 0;
  id v7 = [(HKFeatureStatusManager *)statusManager featureStatusWithError:&v23];
  id v8 = v23;
  if (v7)
  {
    id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
    objc_super v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F29CA0]];
    char v11 = [v10 BOOLValue];

    if (v11)
    {
      id v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F29CF0]];
      char v13 = [v12 BOOLValue];

      if (v13)
      {
        queue = self->_queue;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __57__HRAtrialFibrillationEventDetector_samplesAdded_anchor___block_invoke;
        v20[3] = &unk_1E69B4528;
        v20[4] = self;
        id v21 = v7;
        id v22 = v5;
        dispatch_async(queue, v20);

LABEL_12:
        goto LABEL_13;
      }
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E4F29F50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      uint64_t v16 = v19;
      v17 = HRLogSensitiveClassName();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      v18 = "[%{public}@] Skipping analysis: this is a Family Setup watch";
    }
    else
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E4F29F50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      uint64_t v16 = v15;
      v17 = HRLogSensitiveClassName();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      v18 = "[%{public}@] Skipping analysis: Health app is hidden";
    }
    _os_log_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

    goto LABEL_12;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HRAtrialFibrillationEventDetector samplesAdded:anchor:]();
  }
LABEL_13:
}

void __57__HRAtrialFibrillationEventDetector_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 16) isCompanionSoftwareVersionTooOld];
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    [v3 notifyUserThatAntimonyIsUnavailableForiOSVersionIfNeeded];
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E4F29F50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    id v5 = v4;
    uint64_t v6 = HRLogSensitiveClassName();
    int v21 = 138543362;
    id v22 = v6;
    id v7 = "[%{public}@] companion device is too old to support watchOS version";
LABEL_7:
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v21, 0xCu);

LABEL_8:
    return;
  }
  int v8 = [v3 isWatchSoftwareVersionTooOld];
  id v9 = *(id **)(a1 + 32);
  if (v8)
  {
    [v9[2] notifyUserThatAntimonyIsUnavailableForWatchOSVersionIfNeeded];
    _HKInitializeLogging();
    objc_super v10 = (void *)*MEMORY[0x1E4F29F50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    id v5 = v10;
    uint64_t v6 = HRLogSensitiveClassName();
    int v21 = 138543362;
    id v22 = v6;
    id v7 = "[%{public}@] watch device is too old to support iOS version";
    goto LABEL_7;
  }
  int v11 = objc_msgSend(v9, "_queue_detectionDisabledWithFeatureStatus:", *(void *)(a1 + 40));
  id v12 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v11)
  {
    [v12 presentAtrialFibrillationDetectionRescindedAlertIfNeeded];
  }
  else
  {
    [v12 presentAtrialFibrillationDetectionReEnabledAlertIfNeeded];
    uint64_t v13 = [*(id *)(a1 + 48) integerValue];
    v14 = objc_msgSend(*(id *)(a1 + 32), "_queue_lastAnalyzedSampleAnchor");
    uint64_t v15 = [v14 integerValue];

    if (v13 >= v15)
    {
      uint64_t v20 = *(void **)(a1 + 32);
      objc_msgSend(v20, "_queue_analyzeTachogramsSinceLastAnchor");
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v16 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
      {
        id v5 = v16;
        v17 = HRLogSensitiveClassName();
        v18 = HKSensitiveLogItem();
        v19 = objc_msgSend(*(id *)(a1 + 32), "_queue_lastAnalyzedSampleAnchor");
        int v21 = 138543874;
        id v22 = v17;
        __int16 v23 = 2112;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        uint64_t v26 = v19;
        _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Samples added with anchor %@ below last analyzed anchor %@, ignoring", (uint8_t *)&v21, 0x20u);

        goto LABEL_8;
      }
    }
  }
}

- (void)_queue_enqueueMaintainanceOperationForMissedTachograms
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__HRAtrialFibrillationEventDetector__queue_enqueueMaintainanceOperationForMissedTachograms__block_invoke;
  v7[3] = &unk_1E69B4850;
  v7[4] = self;
  id v3 = [MEMORY[0x1E4F65B40] maintenanceOperationWithName:@"com.apple.HeartRhythm.AtrialFibrillationEventDetector" asynchronousBlock:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained daemon];
  uint64_t v6 = [v5 maintenanceWorkCoordinator];
  [v6 enqueueMaintenanceOperation:v3];
}

void __91__HRAtrialFibrillationEventDetector__queue_enqueueMaintainanceOperationForMissedTachograms__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__HRAtrialFibrillationEventDetector__queue_enqueueMaintainanceOperationForMissedTachograms__block_invoke_2;
  v7[3] = &unk_1E69B4828;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __91__HRAtrialFibrillationEventDetector__queue_enqueueMaintainanceOperationForMissedTachograms__block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_queue_detectionDisabled") & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeTachogramsSinceLastAnchor");
  }
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_queue_analyzeTachogramsSinceLastAnchor
{
  OUTLINED_FUNCTION_5_1((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Check for samples since last anchor failed: %@", v4, 0x16u);
}

uint64_t __76__HRAtrialFibrillationEventDetector__queue_analyzeTachogramsSinceLastAnchor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v29[3] = *MEMORY[0x1E4F143B8];
  os_log_t v5 = (void *)MEMORY[0x1E4F65A98];
  id v6 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v8 = [v5 maxAnchorForSamplesWithType:v6 profile:WeakRetained error:a3];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  objc_super v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  int v11 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v11 || ([v11 isEqualToNumber:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x1E4F65BE8];
    uint64_t v13 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
    id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v15 = [v12 entityEnumeratorWithType:v13 profile:v14];

    uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-172800.0];
    v17 = HDSampleEntityPredicateForStartDate();
    v18 = HDDataEntityPredicateForRowID();
    id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v20 = [v19 sourceManager];
    int v21 = [v20 localDeviceSourceWithError:a3];

    id v22 = HDDataEntityPredicateForSourceEntity();
    __int16 v23 = (void *)MEMORY[0x1E4F65D08];
    v29[0] = v17;
    v29[1] = v18;
    v29[2] = v22;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
    __int16 v25 = [v23 predicateMatchingAllPredicates:v24];

    [v15 setPredicate:v25];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __76__HRAtrialFibrillationEventDetector__queue_analyzeTachogramsSinceLastAnchor__block_invoke_2;
    v27[3] = &unk_1E69B4878;
    id v28 = *(id *)(a1 + 48);
    [v15 enumerateWithError:a3 handler:v27];
  }
  return 1;
}

uint64_t __76__HRAtrialFibrillationEventDetector__queue_analyzeTachogramsSinceLastAnchor__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

uint64_t __76__HRAtrialFibrillationEventDetector__queue_analyzeTachogramsSinceLastAnchor__block_invoke_313(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (void)_queue_seriesSamplesAdded:(id)a3 lastAnchor:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  int64_t v9 = [(HRAtrialFibrillationEventDetector *)self _currentAlgorithmVersion];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__HRAtrialFibrillationEventDetector__queue_seriesSamplesAdded_lastAnchor___block_invoke;
  v15[3] = &unk_1E69B48E8;
  v15[4] = self;
  v15[5] = v9;
  objc_super v10 = objc_msgSend(v8, "hk_filter:", v15);

  _HKInitializeLogging();
  int v11 = (void *)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    uint64_t v13 = HRLogSensitiveClassName();
    id v14 = objc_msgSend(v10, "hk_map:", &__block_literal_global_318);
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    __int16 v18 = 2112;
    id v19 = v14;
    _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Filtered to samples with background context: %@", buf, 0x16u);
  }
  if ([v10 count]) {
    [(HRAtrialFibrillationEventDetector *)self _queue_analyzeFilteredSeriesSamples:v10 lastAnchor:v6];
  }
  else {
    [(HRAtrialFibrillationEventDetector *)self _queue_setLastAnalyzedSampleAnchor:v6];
  }
}

uint64_t __74__HRAtrialFibrillationEventDetector__queue_seriesSamplesAdded_lastAnchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 metadata];
  os_log_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2BB50]];
  uint64_t v6 = [v5 integerValue];

  if (!v6)
  {
    int v11 = [v3 metadata];
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2BAB0]];

    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = v12;
    uint64_t v15 = v14;
    if (v13 == 1)
    {
      if (!v14)
      {
LABEL_14:
        uint64_t v8 = 1;
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v8 = [v14 integerValue];

      if (v8 == 1) {
        goto LABEL_15;
      }
    }
    else if (v13 == 2)
    {
      uint64_t v16 = [v14 integerValue];

      if (v16 == 2) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x1E4F29F50];
    uint64_t v8 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = v17;
      id v19 = HRLogSensitiveClassName();
      int v21 = 138543362;
      id v22 = v19;
      _os_log_impl(&dword_1D3AC6000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring sample from incompatible tachogram version", (uint8_t *)&v21, 0xCu);

      uint64_t v8 = 0;
    }
    goto LABEL_15;
  }
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x1E4F29F50];
  uint64_t v8 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    int64_t v9 = v7;
    objc_super v10 = HRLogSensitiveClassName();
    int v21 = 138543362;
    id v22 = v10;
    _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring sample from non-background context", (uint8_t *)&v21, 0xCu);

    uint64_t v8 = 0;
  }
LABEL_16:

  return v8;
}

uint64_t __74__HRAtrialFibrillationEventDetector__queue_seriesSamplesAdded_lastAnchor___block_invoke_316(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (id)_queue_filterSamplesByDateThreshold:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_log_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-172800.0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__HRAtrialFibrillationEventDetector__queue_filterSamplesByDateThreshold___block_invoke;
  v14[3] = &unk_1E69B4910;
  id v6 = v5;
  id v15 = v6;
  id v7 = objc_msgSend(v4, "hk_filter:", v14);
  unint64_t v8 = [v7 count];
  if (v8 < [v4 count])
  {
    _HKInitializeLogging();
    int64_t v9 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = v9;
      int v11 = HRLogSensitiveClassName();
      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count") - objc_msgSend(v7, "count"));
      *(_DWORD *)buf = 138543874;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D3AC6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping analysis of %@ samples earlier than threshold date %@", buf, 0x20u);
    }
  }

  return v7;
}

uint64_t __73__HRAtrialFibrillationEventDetector__queue_filterSamplesByDateThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 startDate];
  uint64_t v4 = objc_msgSend(v3, "hk_isAfterDate:", *(void *)(a1 + 32));

  return v4;
}

- (void)_queue_analyzeFilteredSeriesSamples:(id)a3 lastAnchor:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  int64_t v9 = [MEMORY[0x1E4F1CA48] array];
  [v9 addObjectsFromArray:v8];

  [v9 sortUsingComparator:&__block_literal_global_322];
  objc_super v10 = (void *)MEMORY[0x1E4F65A98];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [WeakRetained database];
  id v19 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__HRAtrialFibrillationEventDetector__queue_analyzeFilteredSeriesSamples_lastAnchor___block_invoke_2;
  v16[3] = &unk_1E69B4958;
  v16[4] = self;
  id v13 = v9;
  id v17 = v13;
  id v14 = v6;
  id v18 = v14;
  LOBYTE(v10) = [v10 performWriteTransactionWithHealthDatabase:v12 error:&v19 block:v16];
  id v15 = v19;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationEventDetector _queue_analyzeFilteredSeriesSamples:lastAnchor:]();
    }
  }
}

uint64_t __84__HRAtrialFibrillationEventDetector__queue_analyzeFilteredSeriesSamples_lastAnchor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  os_log_t v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __84__HRAtrialFibrillationEventDetector__queue_analyzeFilteredSeriesSamples_lastAnchor___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _currentAlgorithmVersion];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_lastAlgorithmVersionUsed");
  id v4 = v3;
  if (v3 && v2 != [v3 integerValue])
  {
    _HKInitializeLogging();
    os_log_t v5 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      uint64_t v7 = HRLogSensitiveClassName();
      int v13 = 138543874;
      id v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = [v4 integerValue];
      __int16 v17 = 2048;
      uint64_t v18 = v2;
      _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Algorithm version changed from %ld to %ld: resetting confirmation cycle", (uint8_t *)&v13, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_endConfirmationCycleIfNeeded");
  }
  if ([*(id *)(a1 + 40) count])
  {
    do
    {
      id v8 = objc_msgSend(*(id *)(a1 + 40), "hk_dequeue");
      int64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_queue_confirmationCycleSamples");
      objc_super v10 = [v9 arrayByAddingObject:v8];

      int v11 = objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeCurrentConfirmationCycleSamples:withAlgorithmVersion:", v10, v2);
    }
    while ([*(id *)(a1 + 40) count]);
    objc_msgSend(*(id *)(a1 + 32), "_queue_setLastAnalyzedSampleAnchor:", *(void *)(a1 + 48));
    if (v11) {
      objc_msgSend(*(id *)(a1 + 32), "_queue_requestAnotherTachogram");
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_setLastAnalyzedSampleAnchor:", *(void *)(a1 + 48));
  }

  return 1;
}

- (BOOL)_queue_analyzeCurrentConfirmationCycleSamples:(id)a3 withAlgorithmVersion:(int64_t)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  id v8 = [(HRAtrialFibrillationEventDetector *)self _queue_filterSamplesByDateThreshold:v7];

  if ([v8 count])
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__2;
    v51 = __Block_byref_object_dispose__2;
    int64_t v9 = [v8 firstObject];
    id v52 = [v9 startDate];

    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__2;
    v45 = __Block_byref_object_dispose__2;
    objc_super v10 = [v8 firstObject];
    id v46 = [v10 endDate];

    _HKInitializeLogging();
    int v11 = (id *)MEMORY[0x1E4F29F50];
    id v12 = (id)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HRLogSensitiveClassName();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __104__HRAtrialFibrillationEventDetector__queue_analyzeCurrentConfirmationCycleSamples_withAlgorithmVersion___block_invoke;
      v40[3] = &unk_1E69B4980;
      v40[4] = &v47;
      v40[5] = &v41;
      id v14 = objc_msgSend(v8, "hk_map:", v40);
      *(_DWORD *)buf = 138543618;
      id v54 = v13;
      __int16 v55 = 2112;
      v56 = v14;
      _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending sample(s) to analyzer: %@", buf, 0x16u);
    }
    __int16 v15 = [(HRAtrialFibrillationEventDetector *)self _processTachograms:v8 withAlgorithmVersion:a4];
    analyticsCollector = self->_analyticsCollector;
    id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v18 = (void *)[v17 initWithStartDate:v48[5] endDate:v42[5]];
    [(HRAtrialFibrillationAnalyticsCollector *)analyticsCollector collectAnalyticsForResult:v15 algorithmVersion:a4 samplesDateInterval:v18];

    -[HRAtrialFibrillationAnalyticsCollector updateCountAnalyzedTachogramsWithCount:keyValueDomain:](self->_analyticsCollector, "updateCountAnalyzedTachogramsWithCount:keyValueDomain:", [v8 count], self->_syncedKeyValueDomain);
    uint64_t v19 = [NSNumber numberWithInteger:a4];
    [(HRAtrialFibrillationEventDetector *)self _queue_setLastAlgorithmVersionUsed:v19];

    __int16 v20 = [v8 lastObject];
    id v21 = [v20 endDate];
    [(HRAtrialFibrillationEventDetector *)self _queue_setLatestAnalyzedSampleDate:v21];

    int v22 = [v15 userShouldBeAlerted];
    if (v22)
    {
      _HKInitializeLogging();
      uint64_t v23 = *v11;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HRLogSensitiveClassName();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v25 = [v15 uuidsForNextCycle];
        *(_DWORD *)buf = 138543618;
        id v54 = v24;
        __int16 v55 = 2112;
        v56 = v25;
        _os_log_impl(&dword_1D3AC6000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Result indicated user should be notified, UUIDs for next cycle: %@", buf, 0x16u);
      }
      uint64_t v26 = [v8 firstObject];
      uint64_t v27 = [v26 endDate];
      id v28 = objc_msgSend(v8, "hk_foldRightFrom:with:", v27, &__block_literal_global_331);

      v29 = [v15 positiveUUIDs];
      [(HRAtrialFibrillationEventDetector *)self _queue_alertUserWithDate:v28 positiveTachogramUUIDs:v29];

      [(HRAtrialFibrillationEventDetector *)self _queue_endConfirmationCycleIfNeeded];
    }
    else
    {
      if (![v15 tachogramShouldBeRequested])
      {
        _HKInitializeLogging();
        id v35 = *v11;
        if (os_log_type_enabled((os_log_t)*v11, OS_LOG_TYPE_DEBUG))
        {
          v36 = v35;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            HRLogSensitiveClassName();
            id v37 = (id)objc_claimAutoreleasedReturnValue();
            v38 = [v15 uuidsForNextCycle];
            -[HRAtrialFibrillationEventDetector _queue_analyzeCurrentConfirmationCycleSamples:withAlgorithmVersion:](v37, v38, (uint64_t)buf);
          }
        }
        [(HRAtrialFibrillationEventDetector *)self _queue_endConfirmationCycleIfNeeded];
        char v30 = 0;
        goto LABEL_19;
      }
      _HKInitializeLogging();
      v31 = *v11;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        HRLogSensitiveClassName();
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = [v15 uuidsForNextCycle];
        *(_DWORD *)buf = 138543618;
        id v54 = v32;
        __int16 v55 = 2112;
        v56 = v33;
        _os_log_impl(&dword_1D3AC6000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Result indicated more samples are needed, UUIDs for next cycle: %@", buf, 0x16u);
      }
      id v28 = [v15 uuidsForNextCycle];
      objc_super v34 = [(HRAtrialFibrillationEventDetector *)self _queue_orderedConfirmationCycleSamplesFromSamples:v8 requestedUUIDs:v28];
      [(HRAtrialFibrillationEventDetector *)self _queue_setConfirmationCycleSamples:v34];
    }
    char v30 = v22 ^ 1;
LABEL_19:

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);

    goto LABEL_20;
  }
  [(HRAtrialFibrillationEventDetector *)self _queue_endConfirmationCycleIfNeeded];
  char v30 = 0;
LABEL_20:

  return v30;
}

id __104__HRAtrialFibrillationEventDetector__queue_analyzeCurrentConfirmationCycleSamples_withAlgorithmVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  os_log_t v5 = [v4 startDate];
  uint64_t v6 = [v3 earlierDate:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  int64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_super v10 = [v4 endDate];
  uint64_t v11 = [v9 laterDate:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = NSString;
  __int16 v15 = [v4 UUID];
  uint64_t v16 = [v4 startDate];
  id v17 = [v4 endDate];

  uint64_t v18 = [v14 stringWithFormat:@"(UUID: %@, startDate: %@, endDate: %@)", v15, v16, v17];

  return v18;
}

id __104__HRAtrialFibrillationEventDetector__queue_analyzeCurrentConfirmationCycleSamples_withAlgorithmVersion___block_invoke_328(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  os_log_t v5 = [a3 endDate];
  uint64_t v6 = [v4 laterDate:v5];

  return v6;
}

- (id)_processTachograms:(id)a3 withAlgorithmVersion:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(HRAtrialFibrillationEventDetector *)self _unitTest_processTachograms];

  if (v7)
  {
    id v8 = [(HRAtrialFibrillationEventDetector *)self _unitTest_processTachograms];
    uint64_t v9 = ((void (**)(void, id))v8)[2](v8, v6);
  }
  else
  {
    _HKInitializeLogging();
    objc_super v10 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v10;
      uint64_t v12 = HRLogSensitiveClassName();
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      int64_t v18 = a4;
      _os_log_impl(&dword_1D3AC6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyzing tachograms with algorithm version %ld", (uint8_t *)&v15, 0x16u);
    }
    id v8 = (void (**)(void, void))objc_msgSend(objc_alloc(MEMORY[0x1E4F67E30]), "initWithIrregularRhythmVersion:", -[HRAtrialFibrillationEventDetector _currentAlgorithmVersion](self, "_currentAlgorithmVersion"));
    uint64_t v9 = [v8 processTachograms:v6];
  }
  id v13 = (void *)v9;

  return v13;
}

- (int64_t)_currentAlgorithmVersion
{
  availabilityManager = self->_availabilityManager;
  id v7 = 0;
  id v3 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)availabilityManager highestAvailableOnboardedAlgorithmVersionWithError:&v7];
  id v4 = v7;
  if (v3)
  {
    int64_t v5 = [v3 integerValue];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationEventDetector _currentAlgorithmVersion]();
    }
    int64_t v5 = 1;
  }

  return v5;
}

- (BOOL)_queue_detectionDisabled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HRAtrialFibrillationEventDetector *)self _unitTesting])
  {
    return [(HRAtrialFibrillationEventDetector *)self _unitTest_detectionDisabled];
  }
  else
  {
    statusManager = self->_statusManager;
    id v8 = 0;
    int64_t v5 = [(HKFeatureStatusManager *)statusManager featureStatusWithError:&v8];
    id v6 = v8;
    if (v5)
    {
      BOOL v7 = [(HRAtrialFibrillationEventDetector *)self _queue_detectionDisabledWithFeatureStatus:v5];
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HRAtrialFibrillationEventDetector _queue_detectionDisabled]();
      }
      BOOL v7 = 0;
    }

    return v7;
  }
}

- (BOOL)_queue_detectionDisabledWithFeatureStatus:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HRAtrialFibrillationEventDetector *)self _unitTesting])
  {
    char v5 = [(HRAtrialFibrillationEventDetector *)self _unitTest_detectionDisabled];
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F29C20];
    BOOL v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
    char v8 = [v7 areAllRequirementsSatisfied];

    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v9 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
      {
        objc_super v10 = v9;
        uint64_t v11 = HRLogSensitiveClassName();
        uint64_t v12 = [v4 objectForKeyedSubscript:v6];
        id v13 = [v12 unsatisfiedRequirementIdentifiers];
        int v15 = 138543618;
        uint64_t v16 = v11;
        __int16 v17 = 2114;
        int64_t v18 = v13;
        _os_log_impl(&dword_1D3AC6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detection is disabled, unsatisfied usage requirements: %{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
    char v5 = v8 ^ 1;
  }

  return v5;
}

- (BOOL)_queue_inConfirmationCycle
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(HRAtrialFibrillationEventDetector *)self _queue_confirmationCycleSamples];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_queue_endConfirmationCycleIfNeeded
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HRAtrialFibrillationEventDetector *)self _queue_inConfirmationCycle])
  {
    _HKInitializeLogging();
    id v3 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = v3;
      char v5 = HRLogSensitiveClassName();
      int v6 = 138543362;
      BOOL v7 = v5;
      _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending current confirmation cycle", (uint8_t *)&v6, 0xCu);
    }
    [(HRAtrialFibrillationEventDetector *)self _queue_setConfirmationCycleSamples:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_queue_requestAnotherTachogram
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(HRAtrialFibrillationEventDetector *)self _unitTest_moreTachogramsRequestedHandler];

  if (v3)
  {
    BOOL v7 = [(HRAtrialFibrillationEventDetector *)self _unitTest_moreTachogramsRequestedHandler];
    v7[2]();
  }
  else
  {
    _HKInitializeLogging();
    BOOL v4 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      char v5 = v4;
      int v6 = HRLogSensitiveClassName();
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting background sample", buf, 0xCu);
    }
  }
}

- (void)_queue_alertUserWithDate:(id)a3 positiveTachogramUUIDs:(id)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = [(HRAtrialFibrillationEventDetector *)self _unitTest_userAlertedHandler];

  if (v8)
  {
    uint64_t v9 = [(HRAtrialFibrillationEventDetector *)self _unitTest_userAlertedHandler];
    ((void (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    id v44 = 0;
    uint64_t v10 = [(HRAtrialFibrillationEventDetector *)self _getProductVersionWithError:&v44];
    id v11 = v44;
    if (v10)
    {
      uint64_t v48 = *MEMORY[0x1E4F2BAC8];
      v49[0] = v10;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
      id v13 = (void *)MEMORY[0x1E4F2ACB0];
      id v14 = [MEMORY[0x1E4F2ACB8] atrialFibrillationEventType];
      v39 = (void *)v12;
      int v15 = [v13 categorySampleWithType:v14 value:0 startDate:v6 endDate:v6 metadata:v12];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      __int16 v17 = [WeakRetained deviceManager];
      id v43 = 0;
      uint64_t v18 = [v17 currentDeviceEntityWithError:&v43];
      id v11 = v43;

      v40 = (void *)v18;
      if (v18)
      {
        v38 = v10;
        id v19 = objc_loadWeakRetained((id *)&self->_profile);
        __int16 v20 = [v19 dataProvenanceManager];
        uint64_t v21 = [v20 defaultLocalDataProvenanceWithDeviceEntity:v18];

        id v22 = objc_loadWeakRetained((id *)&self->_profile);
        uint64_t v23 = [v22 dataManager];
        uint64_t v47 = v15;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
        v25 = id v24 = v15;
        id v42 = 0;
        id v37 = (void *)v21;
        LODWORD(v21) = [v23 insertDataObjects:v25 withProvenance:v21 creationDate:&v42 error:CFAbsoluteTimeGetCurrent()];
        id v26 = v42;

        if (v21)
        {
          id v27 = objc_loadWeakRetained((id *)&self->_profile);
          id v28 = [v27 associationManager];
          v36 = v24;
          v29 = [v24 UUID];
          id v41 = v26;
          int v30 = [v28 associateObjectUUIDs:v7 objectUUID:v29 error:&v41];
          id v11 = v41;

          _HKInitializeLogging();
          v31 = (void *)*MEMORY[0x1E4F29F50];
          id v32 = *MEMORY[0x1E4F29F50];
          if (v30)
          {
            uint64_t v10 = v38;
            v33 = v39;
            int v15 = v36;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              objc_super v34 = v31;
              id v35 = HRLogSensitiveClassName();
              *(_DWORD *)buf = 138543362;
              id v46 = v35;
              _os_log_impl(&dword_1D3AC6000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saved event with associated positive samples", buf, 0xCu);

              int v15 = v36;
            }
          }
          else
          {
            uint64_t v10 = v38;
            v33 = v39;
            int v15 = v36;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              -[HRAtrialFibrillationEventDetector _queue_alertUserWithDate:positiveTachogramUUIDs:]();
            }
          }
          [(HRAtrialFibrillationEventDetector *)self _queue_forceHealthKitSync];
        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
            -[HRAtrialFibrillationEventDetector _queue_alertUserWithDate:positiveTachogramUUIDs:].cold.4();
          }
          id v11 = v26;
          int v15 = v24;
          uint64_t v10 = v38;
          v33 = v39;
        }
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
          -[HRAtrialFibrillationEventDetector _queue_alertUserWithDate:positiveTachogramUUIDs:]();
        }
        v33 = v39;
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HRAtrialFibrillationEventDetector _queue_alertUserWithDate:positiveTachogramUUIDs:]();
      }
    }
  }
}

- (id)_getProductVersionWithError:(id *)a3
{
  id v3 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)self->_availabilityManager pairedFeatureAttributesWithError:a3];
  BOOL v4 = [v3 watchAttributes];
  char v5 = [v4 updateVersion];

  return v5;
}

- (void)_queue_forceHealthKitSync
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [HDHRHealthKitSyncManager alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  char v5 = [(HDHRHealthKitSyncManager *)v3 initWithProfile:WeakRetained];

  [(HDHRHealthKitSyncManager *)v5 triggerImmediateSyncWithReason:@"New Atrial Fibrillation / Antimony Notification sample added" loggingCategory:*MEMORY[0x1E4F29F50]];
}

- (id)_queue_confirmationCycleSamples
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cachedConfirmationCycleSamples = self->_cachedConfirmationCycleSamples;
  if (cachedConfirmationCycleSamples) {
    goto LABEL_4;
  }
  localKeyValueDomain = self->_localKeyValueDomain;
  id v19 = 0;
  char v5 = [(HDKeyValueDomain *)localKeyValueDomain dataForKey:@"ConfirmationCycleUUIDs" error:&v19];
  id v6 = v19;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __68__HRAtrialFibrillationEventDetector__queue_confirmationCycleSamples__block_invoke;
    __int16 v17 = &unk_1E69B49C8;
    id v18 = v8;
    id v9 = v8;
    objc_msgSend(v5, "hk_enumerateUUIDsUsingBlock:", &v14);
    -[HRAtrialFibrillationEventDetector _queue_orderedConfirmationCycleSamplesFromUUIDs:](self, "_queue_orderedConfirmationCycleSamplesFromUUIDs:", v9, v14, v15, v16, v17);
    uint64_t v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v11 = self->_cachedConfirmationCycleSamples;
    self->_cachedConfirmationCycleSamples = v10;

    cachedConfirmationCycleSamples = self->_cachedConfirmationCycleSamples;
LABEL_4:
    uint64_t v12 = cachedConfirmationCycleSamples;
    goto LABEL_5;
  }
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationEventDetector _queue_confirmationCycleSamples]();
    }
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

LABEL_5:

  return v12;
}

uint64_t __68__HRAtrialFibrillationEventDetector__queue_confirmationCycleSamples__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_queue_orderedConfirmationCycleSamplesFromUUIDs:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = (void *)MEMORY[0x1E4F65BE8];
  id v7 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v9 = HDDataEntityPredicateForDataUUIDs();

  id v14 = 0;
  uint64_t v10 = [v6 samplesWithType:v7 profile:WeakRetained encodingOptions:0 predicate:v9 limit:0 anchor:0 error:&v14];
  id v11 = v14;

  if (!v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationEventDetector _queue_orderedConfirmationCycleSamplesFromUUIDs:]();
    }
  }
  uint64_t v12 = [v10 sortedArrayUsingComparator:&__block_literal_global_342];

  return v12;
}

uint64_t __85__HRAtrialFibrillationEventDetector__queue_orderedConfirmationCycleSamplesFromUUIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_queue_orderedConfirmationCycleSamplesFromSamples:(id)a3 requestedUUIDs:(id)a4
{
  id v5 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__HRAtrialFibrillationEventDetector__queue_orderedConfirmationCycleSamplesFromSamples_requestedUUIDs___block_invoke;
  v12[3] = &unk_1E69B4910;
  id v6 = v5;
  id v13 = v6;
  uint64_t v7 = objc_msgSend(a3, "hk_filter:", v12);
  uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_344];

  uint64_t v9 = [v8 count];
  if (v9 != [v6 count])
  {
    _HKInitializeLogging();
    uint64_t v10 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationEventDetector _queue_orderedConfirmationCycleSamplesFromSamples:requestedUUIDs:](v10);
    }
  }

  return v8;
}

uint64_t __102__HRAtrialFibrillationEventDetector__queue_orderedConfirmationCycleSamplesFromSamples_requestedUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __102__HRAtrialFibrillationEventDetector__queue_orderedConfirmationCycleSamplesFromSamples_requestedUUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_queue_setConfirmationCycleSamples:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([v5 isEqual:self->_cachedConfirmationCycleSamples] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F1CA58] data];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) UUID];
          objc_msgSend(v6, "hk_appendBytesWithUUID:", v12);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    localKeyValueDomain = self->_localKeyValueDomain;
    id v16 = 0;
    char v14 = [(HDKeyValueDomain *)localKeyValueDomain setData:v6 forKey:@"ConfirmationCycleUUIDs" error:&v16];
    id v15 = v16;
    if ((v14 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HRAtrialFibrillationEventDetector _queue_setConfirmationCycleSamples:]();
      }
    }
    objc_storeStrong((id *)&self->_cachedConfirmationCycleSamples, a3);
  }
}

- (void)_queue_setLastAlgorithmVersionUsed:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([v5 isEqual:self->_cachedLastAlgorithmVersionUsed] & 1) == 0)
  {
    localKeyValueDomain = self->_localKeyValueDomain;
    id v9 = 0;
    char v7 = [(HDKeyValueDomain *)localKeyValueDomain setNumber:v5 forKey:@"LastAlgorithmVersionUsed" error:&v9];
    id v8 = v9;
    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HRAtrialFibrillationEventDetector _queue_setLastAlgorithmVersionUsed:]();
      }
    }
    objc_storeStrong((id *)&self->_cachedLastAlgorithmVersionUsed, a3);
  }
}

- (id)_queue_lastAlgorithmVersionUsed
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cachedLastAlgorithmVersionUsed = self->_cachedLastAlgorithmVersionUsed;
  if (!cachedLastAlgorithmVersionUsed)
  {
    localKeyValueDomain = self->_localKeyValueDomain;
    id v11 = 0;
    id v5 = [(HDKeyValueDomain *)localKeyValueDomain numberForKey:@"LastAlgorithmVersionUsed" error:&v11];
    id v6 = v11;
    char v7 = v6;
    if (v5) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v6 == 0;
    }
    if (!v8)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HRAtrialFibrillationEventDetector _queue_lastAlgorithmVersionUsed]();
      }
    }
    id v9 = self->_cachedLastAlgorithmVersionUsed;
    self->_cachedLastAlgorithmVersionUsed = v5;

    cachedLastAlgorithmVersionUsed = self->_cachedLastAlgorithmVersionUsed;
  }

  return cachedLastAlgorithmVersionUsed;
}

- (void)_queue_setLatestAnalyzedSampleDate:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([v5 isEqual:self->_cachedLatestAnalyzedSampleDate] & 1) == 0)
  {
    syncedKeyValueDomain = self->_syncedKeyValueDomain;
    uint64_t v7 = *MEMORY[0x1E4F2BEC0];
    id v10 = 0;
    char v8 = [(HDKeyValueDomain *)syncedKeyValueDomain setDate:v5 forKey:v7 error:&v10];
    id v9 = v10;
    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HRAtrialFibrillationEventDetector _queue_setLatestAnalyzedSampleDate:]();
      }
    }
    objc_storeStrong((id *)&self->_cachedLatestAnalyzedSampleDate, a3);
  }
}

- (id)_queue_latestAnalyzedSampleDate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cachedLatestAnalyzedSampleDate = self->_cachedLatestAnalyzedSampleDate;
  if (!cachedLatestAnalyzedSampleDate)
  {
    syncedKeyValueDomain = self->_syncedKeyValueDomain;
    uint64_t v5 = *MEMORY[0x1E4F2BEC0];
    id v12 = 0;
    id v6 = [(HDKeyValueDomain *)syncedKeyValueDomain dateForKey:v5 error:&v12];
    id v7 = v12;
    char v8 = v7;
    if (v6) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0;
    }
    if (!v9)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HRAtrialFibrillationEventDetector _queue_latestAnalyzedSampleDate]();
      }
    }
    id v10 = self->_cachedLatestAnalyzedSampleDate;
    self->_cachedLatestAnalyzedSampleDate = v6;

    cachedLatestAnalyzedSampleDate = self->_cachedLatestAnalyzedSampleDate;
  }

  return cachedLatestAnalyzedSampleDate;
}

- (void)_queue_setLastAnalyzedSampleAnchor:(id)a3
{
  id v4 = (NSNumber *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  localKeyValueDomain = self->_localKeyValueDomain;
  id v10 = 0;
  char v6 = [(HDKeyValueDomain *)localKeyValueDomain setNumber:v4 forKey:@"LastAnalyzedSampleAnchor" error:&v10];
  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HRAtrialFibrillationEventDetector _queue_setLastAnalyzedSampleAnchor:]();
    }
  }
  cachedLastAnalyzedSampleAnchor = self->_cachedLastAnalyzedSampleAnchor;
  self->_cachedLastAnalyzedSampleAnchor = v4;
  BOOL v9 = v4;
}

- (id)_queue_lastAnalyzedSampleAnchor
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cachedLastAnalyzedSampleAnchor = self->_cachedLastAnalyzedSampleAnchor;
  if (cachedLastAnalyzedSampleAnchor) {
    goto LABEL_4;
  }
  localKeyValueDomain = self->_localKeyValueDomain;
  id v11 = 0;
  uint64_t v5 = [(HDKeyValueDomain *)localKeyValueDomain numberForKey:@"LastAnalyzedSampleAnchor" error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
LABEL_3:
    char v8 = self->_cachedLastAnalyzedSampleAnchor;
    self->_cachedLastAnalyzedSampleAnchor = v5;

    cachedLastAnalyzedSampleAnchor = self->_cachedLastAnalyzedSampleAnchor;
LABEL_4:
    BOOL v9 = cachedLastAnalyzedSampleAnchor;
    goto LABEL_5;
  }
  if (!v6)
  {
    uint64_t v5 = (NSNumber *)&unk_1F2B423D0;
    goto LABEL_3;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HRAtrialFibrillationEventDetector _queue_lastAnalyzedSampleAnchor]();
  }

  BOOL v9 = 0;
LABEL_5:

  return v9;
}

- (id)diagnosticDescription
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HRAtrialFibrillationEventDetector_diagnosticDescription__block_invoke;
  v5[3] = &unk_1E69B4A10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__HRAtrialFibrillationEventDetector_diagnosticDescription__block_invoke(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "hk_map:", &__block_literal_global_349);
  id v3 = [NSString stringWithFormat:@"Confirmation cycle samples: %@", v2];
  id v4 = [NSString stringWithFormat:@"Last algorithm version used: %@", *(void *)(*(void *)(a1 + 32) + 64), v3];
  v11[1] = v4;
  uint64_t v5 = [NSString stringWithFormat:@"Latest analyzed sample date: %@", *(void *)(*(void *)(a1 + 32) + 72)];
  v11[2] = v5;
  uint64_t v6 = [NSString stringWithFormat:@"Last analyzed sample anchor: %@", *(void *)(*(void *)(a1 + 32) + 80)];
  v11[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  uint64_t v8 = [v7 componentsJoinedByString:@"\n"];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

uint64_t __58__HRAtrialFibrillationEventDetector_diagnosticDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager)availabilityManager
{
  return self->_availabilityManager;
}

- (void)setAvailabilityManager:(id)a3
{
}

- (BOOL)_unitTesting
{
  return self->__unitTesting;
}

- (void)set_unitTesting:(BOOL)a3
{
  self->__unitTesting = a3;
}

- (BOOL)_unitTest_detectionDisabled
{
  return self->__unitTest_detectionDisabled;
}

- (void)set_unitTest_detectionDisabled:(BOOL)a3
{
  self->__unitTest_detectionDisabled = a3;
}

- (id)_unitTest_userAlertedHandler
{
  return self->__unitTest_userAlertedHandler;
}

- (void)set_unitTest_userAlertedHandler:(id)a3
{
}

- (id)_unitTest_moreTachogramsRequestedHandler
{
  return self->__unitTest_moreTachogramsRequestedHandler;
}

- (void)set_unitTest_moreTachogramsRequestedHandler:(id)a3
{
}

- (id)_unitTest_processTachograms
{
  return self->__unitTest_processTachograms;
}

- (void)set_unitTest_processTachograms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__unitTest_processTachograms, 0);
  objc_storeStrong(&self->__unitTest_moreTachogramsRequestedHandler, 0);
  objc_storeStrong(&self->__unitTest_userAlertedHandler, 0);
  objc_storeStrong((id *)&self->_availabilityManager, 0);
  objc_storeStrong((id *)&self->_syncedKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_cachedLastAnalyzedSampleAnchor, 0);
  objc_storeStrong((id *)&self->_cachedLatestAnalyzedSampleDate, 0);
  objc_storeStrong((id *)&self->_cachedLastAlgorithmVersionUsed, 0);
  objc_storeStrong((id *)&self->_cachedConfirmationCycleSamples, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_statusManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)samplesAdded:anchor:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to retrieve IRN's feature status; skipping analysis after samples added: %{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);
}

- (void)_queue_analyzeFilteredSeriesSamples:lastAnchor:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to perform write analysis write transaction: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_analyzeCurrentConfirmationCycleSamples:(uint64_t)a3 withAlgorithmVersion:.cold.1(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5_1((uint64_t)a1, (uint64_t)a2, a3, 5.8382e-34);
  _os_log_debug_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Result indicated no action is needed, UUIDs for next cycle: %@", v5, 0x16u);
}

- (void)_currentAlgorithmVersion
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Unable to determine current algorithm version, defaulting to 1.0: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_detectionDisabled
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to retrieve IRN's feature status; reporting 'detection disabled': %{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);
}

- (void)_queue_alertUserWithDate:positiveTachogramUUIDs:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to get version for product: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_alertUserWithDate:positiveTachogramUUIDs:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to get current device entity: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_alertUserWithDate:positiveTachogramUUIDs:.cold.3()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to associate samples: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_alertUserWithDate:positiveTachogramUUIDs:.cold.4()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to insert event: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_confirmationCycleSamples
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to read confirmation cycle UUIDs from protected key value store: %@", v6, v7, v8, v9, 2u);
}

- (void)_queue_orderedConfirmationCycleSamplesFromUUIDs:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  id v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to read confirmation cycle samples from UUIDs %@", v6, v7, v8, v9, 2u);
}

- (void)_queue_orderedConfirmationCycleSamplesFromSamples:(void *)a1 requestedUUIDs:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = HRLogSensitiveClassName();
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D3AC6000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected number of requested confirmation cycle UUIDs", (uint8_t *)&v3, 0xCu);
}

- (void)_queue_setConfirmationCycleSamples:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  int v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to set confirmation cycle UUIDs in protected key value store: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_setLastAlgorithmVersionUsed:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  int v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to set last used algorithm version in protected key value store: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_lastAlgorithmVersionUsed
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  int v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to read last algorithm version used from protected key value store: %@", v6, v7, v8, v9, 2u);
}

- (void)_queue_setLatestAnalyzedSampleDate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  int v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to set last analyzed sample date in protected key value store: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_latestAnalyzedSampleDate
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  int v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to read last analyzed sample date from protected key value store: %@", v6, v7, v8, v9, 2u);
}

- (void)_queue_setLastAnalyzedSampleAnchor:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  int v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to set last analyzed sample anchor in protected key value store: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_queue_lastAnalyzedSampleAnchor
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  OUTLINED_FUNCTION_2_0();
  int v3 = HRLogSensitiveClassName();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to read last analyzed sample anchor from protected key value store: %@", v6, v7, v8, v9, 2u);
}

@end