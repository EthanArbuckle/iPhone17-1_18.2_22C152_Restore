@interface HDMobilityNotificationManager
- (HDMobilityNotificationManager)initWithProfile:(id)a3 walkingSteadinessAvailabilityManager:(id)a4;
- (void)_queue_showNotificationForLocalSteadinessEvent:(id)a3 completion:(id)a4;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
@end

@implementation HDMobilityNotificationManager

- (HDMobilityNotificationManager)initWithProfile:(id)a3 walkingSteadinessAvailabilityManager:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HDMobilityNotificationManager;
  v8 = [(HDMobilityNotificationManager *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    v13 = [WeakRetained daemon];
    [v13 registerForDaemonReady:v9];

    v14 = (HKMobilityWalkingSteadinessAnalyticsManager *)objc_alloc_init(MEMORY[0x263F452C0]);
    analyticsManager = v9->_analyticsManager;
    v9->_analyticsManager = v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v7 healthDataSource:v6 countryCodeSource:0];
    walkingSteadinessFeatureStatusManager = v9->_walkingSteadinessFeatureStatusManager;
    v9->_walkingSteadinessFeatureStatusManager = (HKFeatureStatusManager *)v16;

    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      uint64_t v20 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v20;
      _os_log_impl(&dword_221A40000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] was created", buf, 0xCu);
    }
    v21 = v9;
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = objc_opt_class();
    _os_log_impl(&dword_221A40000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] stop observing walking steadiness events", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained dataManager];
  id v7 = HKMobilityWalkingSteadinessEventType();
  [v6 removeObserver:self forDataType:v7];

  v8.receiver = self;
  v8.super_class = (Class)HDMobilityNotificationManager;
  [(HDMobilityNotificationManager *)&v8 dealloc];
}

- (void)daemonReady:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    int v9 = 138543362;
    uint64_t v10 = objc_opt_class();
    _os_log_impl(&dword_221A40000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] start observing walking steadiness events", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained dataManager];
  objc_super v8 = HKMobilityWalkingSteadinessEventType();
  [v7 addObserver:self forDataType:v8];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = (os_log_t *)MEMORY[0x263F09940];
    *(void *)&long long v7 = 138543362;
    long long v22 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "_source", v22);
        char v14 = [v13 _isLocalDevice];

        _HKInitializeLogging();
        os_log_t v15 = *v10;
        BOOL v16 = os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            v17 = v15;
            uint64_t v18 = objc_opt_class();
            *(_DWORD *)buf = v22;
            uint64_t v29 = v18;
            _os_log_impl(&dword_221A40000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detected AppleWalkingSteadinessEvent added with local device source", buf, 0xCu);
          }
          queue = self->_queue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke;
          block[3] = &unk_2645D7B90;
          block[4] = self;
          block[5] = v12;
          dispatch_async(queue, block);
        }
        else if (v16)
        {
          uint64_t v20 = v15;
          uint64_t v21 = objc_opt_class();
          *(_DWORD *)buf = v22;
          uint64_t v29 = v21;
          _os_log_impl(&dword_221A40000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detected AppleWalkingSteadinessEvent added with non-local device source", buf, 0xCu);
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }
}

uint64_t __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke_2;
  v4[3] = &unk_2645D7B68;
  v4[4] = v2;
  return objc_msgSend(v2, "_queue_showNotificationForLocalSteadinessEvent:completion:", v1, v4);
}

void __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x263F09940];
  long long v7 = *MEMORY[0x263F09940];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v6;
      int v9 = 138543362;
      uint64_t v10 = objc_opt_class();
      _os_log_impl(&dword_221A40000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notified user for AppleWalkingSteadinessEvent successfully.", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke_2_cold_1(a1, v6, (uint64_t)v5);
  }
}

- (void)_queue_showNotificationForLocalSteadinessEvent:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDMobilityNotificationManager.m", 86, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  int v9 = [v7 _source];
  char v10 = [v9 _isLocalDevice];

  if ((v10 & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HDMobilityNotificationManager.m", 87, @"Invalid parameter not satisfying: %@", @"event._source._isLocalDevice" object file lineNumber description];
  }
  uint64_t v11 = [v7 categoryType];
  uint64_t v12 = [v11 code];

  if (v12 != 250)
  {
    long long v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDMobilityNotificationManager.m", 88, @"Invalid parameter not satisfying: %@", @"event.categoryType.code == _HKDataTypeAppleWalkingSteadinessEvent" object file lineNumber description];
  }
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
  {
    char v14 = v13;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_221A40000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] showing notification for event: %@", buf, 0x16u);
  }
  uint64_t v15 = [v7 value];
  BOOL v16 = HKMobilityNotificationCategoryForWalkingSteadinessEventValue();
  if (v16)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v35 = [WeakRetained notificationManager];

    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy_;
    v30[4] = __Block_byref_object_dispose_;
    uint64_t v31 = self->_analyticsManager;
    uint64_t v18 = *(void **)(*(void *)&buf[8] + 40);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __91__HDMobilityNotificationManager__queue_showNotificationForLocalSteadinessEvent_completion___block_invoke;
    v23[3] = &unk_2645D7BE0;
    v23[4] = self;
    id v24 = v16;
    long long v27 = buf;
    id v26 = v8;
    uint64_t v29 = v15;
    id v25 = v7;
    v28 = v30;
    [v18 removeDeliveredNotificationsWithCategoryIdentifier:v24 completionHandler:v23];

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v19 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 3, @"Unknown notification category for walking steadiness event value: %ld", v15);
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v19);
  }
}

void __91__HDMobilityNotificationManager__queue_showNotificationForLocalSteadinessEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v25 = 0;
  v3 = [v2 featureStatusWithError:&v25];
  id v4 = v25;
  id v5 = (os_log_t *)MEMORY[0x263F09940];
  if (!v3)
  {
    _HKInitializeLogging();
    os_log_t v6 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      uint64_t v8 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v8;
      __int16 v28 = 2114;
      id v29 = v4;
      _os_log_impl(&dword_221A40000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to get featureStatus. error: %{public}@", buf, 0x16u);
    }
  }
  int v9 = [v3 objectForKeyedSubscript:*MEMORY[0x263F45280]];
  uint64_t v10 = [v9 areAllRequirementsSatisfied];

  _HKInitializeLogging();
  os_log_t v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v13;
    __int16 v28 = 1024;
    LODWORD(v29) = v10;
    _os_log_impl(&dword_221A40000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Firing notification with shouldHidePregnancyContent: %d", buf, 0x12u);
  }
  char v14 = objc_msgSend(MEMORY[0x263F1DF48], "hkmobility_requestForCategory:shouldHidePregnancyContent:", *(void *)(a1 + 40), v10);
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) postNotificationWithRequest:v14 completion:*(void *)(a1 + 56)];
  uint64_t v15 = [HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v17 = *(void *)(a1 + 80);
  uint64_t v18 = *(void *)(a1 + 40);
  v19 = [*(id *)(a1 + 48) endDate];
  uint64_t v20 = [(HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource *)v15 initWithProfile:WeakRetained category:v18 value:v17 date:v19];

  uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __91__HDMobilityNotificationManager__queue_showNotificationForLocalSteadinessEvent_completion___block_invoke_307;
  v23[3] = &unk_2645D7BB8;
  long long v22 = *(void **)(a1 + 40);
  v23[4] = *(void *)(a1 + 32);
  id v24 = v22;
  [v21 submitNotificationEventWithDataSource:v20 resultHandler:v23];
}

void __91__HDMobilityNotificationManager__queue_showNotificationForLocalSteadinessEvent_completion___block_invoke_307(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 status] == 1)
  {
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = [v3 error];
      int v9 = 138543874;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      char v14 = v8;
      _os_log_impl(&dword_221A40000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to submit notification analytics for category: %@, error: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingSteadinessFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  int v5 = 138543618;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  _os_log_fault_impl(&dword_221A40000, v4, OS_LOG_TYPE_FAULT, "[%{public}@] Failed to notify user for AppleWalkingSteadinessEvent with error: %@", (uint8_t *)&v5, 0x16u);
}

@end