@interface HDHRNotificationManager
- (BOOL)_queue_fakeCardioFitnessNotificationWithData:(BOOL)a3 repeat:(BOOL)a4 error:(id *)a5;
- (HDHRNotificationManager)initWithProfile:(id)a3;
- (id)_userNotificationCenter;
- (void)_queue_fakeNotificationWithEventType:(id)a3 withData:(BOOL)a4;
- (void)_queue_showNotificationForHeartEvent:(id)a3;
- (void)_subscribeToFakingNotification:(id)a3 type:(id)a4 withData:(BOOL)a5;
- (void)_subscribeToFakingNotifications;
- (void)_unsubscribeToFakingNotifications;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
@end

@implementation HDHRNotificationManager

- (HDHRNotificationManager)initWithProfile:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDHRNotificationManager;
  v5 = [(HDHRNotificationManager *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = (const char *)HKDispatchQueueName();
    dispatch_queue_t v8 = dispatch_queue_create(v7, 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    [(HDHRNotificationManager *)v6 _subscribeToFakingNotifications];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v11 = [WeakRetained daemon];
    [v11 registerForDaemonReady:v6];

    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      id v15 = v14;
      _os_log_impl(&dword_1D3AC6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] was created", buf, 0xCu);
    }
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(HDHRNotificationManager *)self _unsubscribeToFakingNotifications];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v5 = v17;
    _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] stop observing heart rate events", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [WeakRetained dataManager];
  dispatch_queue_t v8 = [MEMORY[0x1E4F2ACB8] tachycardiaType];
  [v7 removeObserver:self forDataType:v8];

  id v9 = objc_loadWeakRetained((id *)&self->_profile);
  v10 = [v9 dataManager];
  v11 = [MEMORY[0x1E4F2ACB8] bradycardiaType];
  [v10 removeObserver:self forDataType:v11];

  id v12 = objc_loadWeakRetained((id *)&self->_profile);
  v13 = [v12 dataManager];
  v14 = [MEMORY[0x1E4F2ACB8] lowCardioFitnessEventType];
  [v13 removeObserver:self forDataType:v14];

  v15.receiver = self;
  v15.super_class = (Class)HDHRNotificationManager;
  [(HDHRNotificationManager *)&v15 dealloc];
}

- (void)daemonReady:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    int v16 = 138543362;
    id v17 = (id)objc_opt_class();
    id v6 = v17;
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] start observing heart rate events", (uint8_t *)&v16, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  dispatch_queue_t v8 = [WeakRetained dataManager];
  id v9 = [MEMORY[0x1E4F2ACB8] tachycardiaType];
  [v8 addObserver:self forDataType:v9];

  id v10 = objc_loadWeakRetained((id *)&self->_profile);
  v11 = [v10 dataManager];
  id v12 = [MEMORY[0x1E4F2ACB8] bradycardiaType];
  [v11 addObserver:self forDataType:v12];

  id v13 = objc_loadWeakRetained((id *)&self->_profile);
  v14 = [v13 dataManager];
  objc_super v15 = [MEMORY[0x1E4F2ACB8] lowCardioFitnessEventType];
  [v14 addObserver:self forDataType:v15];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    dispatch_queue_t v8 = (os_log_t *)MEMORY[0x1E4F29F48];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v11 = [v10 sourceRevision];
        id v12 = [v11 source];
        int v13 = [v12 _isLocalDevice];

        _HKInitializeLogging();
        os_log_t v14 = *v8;
        BOOL v15 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (v15) {
            [(HDHRNotificationManager *)&v25 samplesAdded:(uint64_t)self anchor:&v26];
          }
          queue = self->_queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __47__HDHRNotificationManager_samplesAdded_anchor___block_invoke;
          block[3] = &unk_1E69B4578;
          block[4] = self;
          block[5] = v10;
          dispatch_async(queue, block);
        }
        else if (v15)
        {
          [(HDHRNotificationManager *)&v23 samplesAdded:(uint64_t)self anchor:&v24];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v6);
  }
}

uint64_t __47__HDHRNotificationManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_showNotificationForHeartEvent:", *(void *)(a1 + 40));
}

- (id)_userNotificationCenter
{
  if (_userNotificationCenter_onceToken != -1) {
    dispatch_once(&_userNotificationCenter_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)_userNotificationCenter_userNotificationCenter;

  return v2;
}

uint64_t __50__HDHRNotificationManager__userNotificationCenter__block_invoke()
{
  _userNotificationCenter_userNotificationCenter = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.HeartRate"];

  return MEMORY[0x1F41817F8]();
}

- (void)_queue_showNotificationForHeartEvent:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [v4 endDate];
  uint64_t v7 = objc_msgSend(v5, "hk_dateByAddingDays:toDate:", 1, v6);

  dispatch_queue_t v8 = [MEMORY[0x1E4F1C9C8] date];
  LODWORD(v6) = objc_msgSend(v8, "hk_isAfterDate:", v7);

  _HKInitializeLogging();
  id v9 = (void *)*MEMORY[0x1E4F29F48];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v10)
    {
      int v13 = v9;
      *(_DWORD *)buf = 138543874;
      id v74 = (id)objc_opt_class();
      __int16 v75 = 2112;
      id v76 = v4;
      __int16 v77 = 2114;
      v78 = v7;
      id v14 = v74;
      _os_log_impl(&dword_1D3AC6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] showing notification for event: %@, expiration date: %{public}@", buf, 0x20u);
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v15 setDateStyle:0];
    [v15 setTimeStyle:1];
    int v16 = [v4 startDate];
    id v17 = [v15 stringFromDate:v16];

    uint64_t v18 = [v4 metadata];
    long long v19 = [v18 objectForKey:*MEMORY[0x1E4F2BB40]];

    v65 = v19;
    [v19 _beatsPerMinute];
    long long v21 = (void *)MEMORY[0x1E4F28EE0];
    long long v22 = [NSNumber numberWithInteger:llround(v20)];
    int v23 = [v21 localizedStringFromNumber:v22 numberStyle:1];

    uint64_t v24 = [v4 categoryType];
    int v25 = [MEMORY[0x1E4F2ACB8] tachycardiaType];
    int v26 = [v24 isEqual:v25];

    v66 = v23;
    if (v26)
    {
      id v63 = v15;
      v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      [v27 localizedStringForKey:@"HEART_RATE_TACHYCARDIA_TITLE" value:&stru_1F2B36C98 table:@"Localizable"];
      v29 = uint64_t v28 = v7;

      v30 = NSString;
      v64 = self;
      v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v32 = [v31 localizedStringForKey:@"HEART_RATE_TACHYCARDIA_MESSAGE_FORMAT" value:&stru_1F2B36C98 table:@"Localizable"];
      v62 = v17;
      v60 = v23;
      uint64_t v33 = v29;
      uint64_t v7 = v28;
      v34 = objc_msgSend(v30, "stringWithFormat:", v32, v60, v17);

      v35 = @"Tachycardia";
    }
    else
    {
      v36 = [v4 categoryType];
      v37 = [MEMORY[0x1E4F2ACB8] bradycardiaType];
      int v38 = [v36 isEqual:v37];

      if (v38)
      {
        id v63 = v15;
        v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v33 = [v39 localizedStringForKey:@"HEART_RATE_BRADYCARDIA_TITLE" value:&stru_1F2B36C98 table:@"Localizable"];

        v40 = NSString;
        v64 = self;
        v41 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v42 = [v41 localizedStringForKey:@"HEART_RATE_BRADYCARDIA_MESSAGE_FORMAT" value:&stru_1F2B36C98 table:@"Localizable"];
        v62 = v17;
        v34 = objc_msgSend(v40, "stringWithFormat:", v42, v66, v17);

        v35 = @"Bradycardia";
      }
      else
      {
        v43 = [v4 categoryType];
        v44 = [MEMORY[0x1E4F2ACB8] lowCardioFitnessEventType];
        int v45 = [v43 isEqual:v44];

        if (!v45)
        {
          _HKInitializeLogging();
          v59 = (void *)*MEMORY[0x1E4F29F48];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
            [(HDHRNotificationManager *)v59 _queue_showNotificationForHeartEvent:v4];
          }
          goto LABEL_17;
        }
        v62 = v17;
        id v63 = v15;
        v64 = self;
        uint64_t v33 = [NSString localizedUserNotificationStringForKey:@"HEART_RATE_LOW_CARDIO_FITNESS_TITLE" arguments:0];
        v34 = [NSString localizedUserNotificationStringForKey:@"HEART_RATE_LOW_CARDIO_FITNESS_MESSAGE" arguments:0];
        v35 = @"LowCardioFitness";
      }
    }
    id v46 = objc_alloc_init(MEMORY[0x1E4F445B0]);
    [v46 setTitle:v33];
    [v46 setBody:v34];
    [v46 setCategoryIdentifier:v35];
    [v46 setThreadIdentifier:v35];
    v47 = [MEMORY[0x1E4F445C0] soundWithAlertType:25];
    [v47 setAlertTopic:*MEMORY[0x1E4FAF618]];
    [v46 setSound:v47];
    v48 = [v4 endDate];
    [v46 setDate:v48];

    v61 = v7;
    [v46 setExpirationDate:v7];
    id v70 = 0;
    v49 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v70];
    id v50 = v70;
    v51 = (void *)v33;
    if (v49)
    {
      v71 = @"HeartRateEventData";
      v72 = v49;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      [v46 setUserInfo:v52];
    }
    else
    {
      _HKInitializeLogging();
      v53 = (void *)*MEMORY[0x1E4F29F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        -[HDHRNotificationManager _queue_showNotificationForHeartEvent:](v53);
      }
    }
    v54 = (void *)MEMORY[0x1E4F44628];
    v55 = [v4 UUID];
    v56 = [v55 UUIDString];
    v57 = [v54 requestWithIdentifier:v56 content:v46 trigger:0];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke;
    block[3] = &unk_1E69B4528;
    block[4] = v64;
    id v68 = v57;
    id v69 = v4;
    id v58 = v57;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v17 = v62;
    id v15 = v63;
    int v23 = v66;
    uint64_t v7 = v61;
LABEL_17:

    goto LABEL_18;
  }
  if (v10)
  {
    v11 = v9;
    *(_DWORD *)buf = 138543618;
    id v74 = (id)objc_opt_class();
    __int16 v75 = 2112;
    id v76 = v4;
    id v12 = v74;
    _os_log_impl(&dword_1D3AC6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] not showing expired notification for event: %@", buf, 0x16u);
  }
LABEL_18:
}

void __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _userNotificationCenter];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke_2;
  v4[3] = &unk_1E69B4B38;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 addNotificationRequest:v3 withCompletionHandler:v4];
}

void __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke_2_cold_1(a1, v4);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v6 = [WeakRetained notificationManager];

  if (v6) {
    uint64_t v7 = [v6 areHealthNotificationsAuthorized];
  }
  else {
    uint64_t v7 = 0;
  }
  dispatch_queue_t v8 = [[HDHRNotificationAnalytics alloc] initWithEventSample:*(void *)(a1 + 40) areHealthNotificationsAuthorized:v7];
  [(HDHRNotificationAnalytics *)v8 submit];
}

- (void)_queue_fakeNotificationWithEventType:(id)a3 withData:(BOOL)a4
{
  BOOL v4 = a4;
  v77[1] = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [v53 identifier];
    BOOL v10 = [NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v73 = v10;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking %{public}@ notification, withData: %@", buf, 0x20u);
  }
  v52 = [MEMORY[0x1E4F1C9C8] date];
  v54 = [v52 dateByAddingTimeInterval:-600.0];
  v11 = [MEMORY[0x1E4F2B370] _quantityWithBeatsPerMinute:120.0];
  id v12 = [MEMORY[0x1E4F2ACB8] bradycardiaType];
  int v13 = [v53 isEqual:v12];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F2B370] _quantityWithBeatsPerMinute:40.0];

    v11 = (void *)v14;
  }
  id v15 = (void *)MEMORY[0x1E4F2ACB0];
  uint64_t v76 = *MEMORY[0x1E4F2BB40];
  v77[0] = v11;
  v51 = v11;
  int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
  v57 = [v15 categorySampleWithType:v53 value:0 startDate:v54 endDate:v52 metadata:v16];

  if (v4)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v73 = __Block_byref_object_copy__3;
    id v74 = __Block_byref_object_dispose__3;
    id v75 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v18 = [WeakRetained dataManager];
    v71 = v57;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    id v20 = objc_loadWeakRetained((id *)&self->_profile);
    long long v21 = [v20 dataProvenanceManager];
    long long v22 = [v21 defaultLocalDataProvenance];
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v24 = *(void *)&buf[8];
    id obj = *(id *)(*(void *)&buf[8] + 40);
    int v25 = [v18 insertDataObjects:v19 withProvenance:v22 creationDate:&obj error:Current];
    objc_storeStrong((id *)(v24 + 40), obj);

    if (v25)
    {
      _HKInitializeLogging();
      int v26 = (id)*MEMORY[0x1E4F29F48];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_opt_class();
        *(_DWORD *)v67 = 138543618;
        id v68 = v27;
        __int16 v69 = 2112;
        id v70 = v57;
        id v28 = v27;
        _os_log_impl(&dword_1D3AC6000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking - saved event sample: %@", v67, 0x16u);
      }
    }
    else
    {
      _HKInitializeLogging();
      int v26 = (id)*MEMORY[0x1E4F29F48];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class();
        [(HDHRNotificationManager *)v29 _queue_fakeNotificationWithEventType:(uint64_t)v67 withData:v26];
      }
    }

    v30 = [MEMORY[0x1E4F2ACB8] bradycardiaType];
    int v31 = [v53 isEqual:v30];

    if (v31) {
      v32 = &unk_1F2B43118;
    }
    else {
      v32 = &unk_1F2B43100;
    }
    uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v34 = 0;
    uint64_t v35 = *MEMORY[0x1E4F2A828];
    while ([v32 count] > v34)
    {
      v36 = [&unk_1F2B430E8 objectAtIndexedSubscript:v34];
      [v36 doubleValue];
      v37 = objc_msgSend(v54, "dateByAddingTimeInterval:");

      int v38 = (void *)MEMORY[0x1E4F2B388];
      v39 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v35];
      v40 = (void *)MEMORY[0x1E4F2B370];
      v41 = [v32 objectAtIndexedSubscript:v34];
      [v41 doubleValue];
      v42 = objc_msgSend(v40, "_quantityWithBeatsPerMinute:");
      v43 = [v38 quantitySampleWithType:v39 quantity:v42 startDate:v37 endDate:v37];

      [v33 addObject:v43];
      ++v34;
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v55 = v33;
    uint64_t v44 = [v55 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v62;
      double v46 = 0.0;
      v47 = MEMORY[0x1E4F14428];
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v62 != v45) {
            objc_enumerationMutation(v55);
          }
          uint64_t v49 = *(void *)(*((void *)&v61 + 1) + 8 * v48);
          dispatch_time_t v50 = dispatch_time(0, (uint64_t)(v46 * 1000000000.0));
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke;
          block[3] = &unk_1E69B4B60;
          block[4] = self;
          void block[5] = v49;
          v60 = buf;
          id v59 = v57;
          dispatch_after(v50, v47, block);

          double v46 = v46 + 2.0;
          ++v48;
        }
        while (v44 != v48);
        uint64_t v44 = [v55 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v44);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(HDHRNotificationManager *)self _queue_showNotificationForHeartEvent:v57];
  }
}

void __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  BOOL v4 = [WeakRetained dataManager];

  v33[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v6 = objc_loadWeakRetained((id *)(*(void *)v2 + 8));
  uint64_t v7 = [v6 dataProvenanceManager];
  id v8 = [v7 defaultLocalDataProvenance];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v10 + 40);
  int v11 = [v4 insertDataObjects:v5 withProvenance:v8 creationDate:&obj error:Current];
  objc_storeStrong((id *)(v10 + 40), obj);

  _HKInitializeLogging();
  id v12 = (void *)*MEMORY[0x1E4F29F48];
  int v13 = *MEMORY[0x1E4F29F48];
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v12;
      id v15 = objc_opt_class();
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v30 = v15;
      __int16 v31 = 2112;
      uint64_t v32 = v16;
      id v17 = v15;
      _os_log_impl(&dword_1D3AC6000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking - saved heart rate sample: %@", buf, 0x16u);
    }
    id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    long long v19 = [v18 associationManager];
    id v20 = [*(id *)(a1 + 40) UUID];
    id v28 = v20;
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    long long v22 = [*(id *)(a1 + 48) UUID];
    uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
    id v26 = *(id *)(v23 + 40);
    char v24 = [v19 associateObjectUUIDs:v21 objectUUID:v22 error:&v26];
    objc_storeStrong((id *)(v23 + 40), v26);

    if ((v24 & 1) == 0)
    {
      _HKInitializeLogging();
      int v25 = (void *)*MEMORY[0x1E4F29F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
        __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke_cold_1(v2, v25);
      }
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke_cold_2(v2, v12);
  }
}

- (void)_subscribeToFakingNotifications
{
  id v3 = [MEMORY[0x1E4F2ACB8] tachycardiaType];
  [(HDHRNotificationManager *)self _subscribeToFakingNotification:@"com.apple.HeartRate.Tachycardia" type:v3 withData:0];

  BOOL v4 = [MEMORY[0x1E4F2ACB8] tachycardiaType];
  [(HDHRNotificationManager *)self _subscribeToFakingNotification:@"com.apple.HeartRate.TachycardiaWithData" type:v4 withData:1];

  id v5 = [MEMORY[0x1E4F2ACB8] bradycardiaType];
  [(HDHRNotificationManager *)self _subscribeToFakingNotification:@"com.apple.HeartRate.Bradycardia" type:v5 withData:0];

  id v6 = [MEMORY[0x1E4F2ACB8] bradycardiaType];
  [(HDHRNotificationManager *)self _subscribeToFakingNotification:@"com.apple.HeartRate.BradycardiaWithData" type:v6 withData:1];
}

- (void)_subscribeToFakingNotification:(id)a3 type:(id)a4 withData:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  int out_token = 0;
  id v10 = v8;
  int v11 = (const char *)[v10 UTF8String];
  queue = self->_queue;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __72__HDHRNotificationManager__subscribeToFakingNotification_type_withData___block_invoke;
  long long v19 = &unk_1E69B4B88;
  objc_copyWeak(&v21, &location);
  id v13 = v9;
  id v20 = v13;
  BOOL v22 = a5;
  notify_register_dispatch(v11, &out_token, queue, &v16);
  fakingNotifyTokens = self->_fakingNotifyTokens;
  id v15 = objc_msgSend(NSNumber, "numberWithInt:", out_token, v16, v17, v18, v19);
  [(NSMutableArray *)fakingNotifyTokens addObject:v15];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __72__HDHRNotificationManager__subscribeToFakingNotification_type_withData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_fakeNotificationWithEventType:withData:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
    id WeakRetained = v3;
  }
}

- (void)_unsubscribeToFakingNotifications
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = self->_fakingNotifyTokens;
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

- (BOOL)_queue_fakeCardioFitnessNotificationWithData:(BOOL)a3 repeat:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v7 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = v7;
    long long v9 = objc_opt_class();
    long long v10 = NSNumber;
    id v11 = v9;
    id v12 = [v10 numberWithBool:v6];
    uint64_t v13 = [NSNumber numberWithBool:v5];
    *(_DWORD *)buf = 138543874;
    v109 = v9;
    __int16 v110 = 2112;
    id v111 = v12;
    __int16 v112 = 2112;
    v113 = v13;
    _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking Cardio Fitness notification, withData: %@, repeat: %@", buf, 0x20u);
  }
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  id v15 = [v14 dateByAddingTimeInterval:-1641600.0];
  uint64_t v16 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v17 = [MEMORY[0x1E4F2B618] unitFromString:@"ml/(kg*min)"];
  id v18 = [v16 quantityWithUnit:v17 doubleValue:24.0];

  long long v19 = (void *)MEMORY[0x1E4F2B370];
  id v20 = [MEMORY[0x1E4F2B618] unitFromString:@"ml/(kg*min)"];
  uint64_t v21 = [v19 quantityWithUnit:v20 doubleValue:19.0];

  BOOL v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 endDate:v14];
  [v22 duration];
  double v24 = v23;

  int v25 = (void *)MEMORY[0x1E4F2ACB0];
  id v26 = [MEMORY[0x1E4F2ACB8] lowCardioFitnessEventType];
  uint64_t v27 = *MEMORY[0x1E4F2A190];
  v106[0] = *MEMORY[0x1E4F2A218];
  v106[1] = v27;
  v90 = (void *)v21;
  v107[0] = v21;
  v107[1] = v18;
  v106[2] = *MEMORY[0x1E4F2BBB8];
  id v28 = [NSNumber numberWithBool:v5];
  v107[2] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:3];
  v30 = [v25 categorySampleWithType:v26 value:1 startDate:v15 endDate:v14 metadata:v29];

  if (v6)
  {
    v85 = v18;
    v86 = v15;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v32 = [WeakRetained dataManager];
    v87 = v30;
    v105 = v30;
    uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
    id location = (id *)&self->_profile;
    id v34 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v35 = [v34 dataProvenanceManager];
    v36 = [v35 defaultLocalDataProvenance];
    id v102 = 0;
    int v37 = [v32 insertDataObjects:v33 withProvenance:v36 creationDate:&v102 error:CFAbsoluteTimeGetCurrent()];
    id v38 = v102;

    _HKInitializeLogging();
    v39 = (void *)*MEMORY[0x1E4F29F48];
    v89 = v14;
    v40 = *MEMORY[0x1E4F29F48];
    if (v37)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v39;
        v42 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v109 = v42;
        __int16 v110 = 2112;
        id v111 = v87;
        id v43 = v42;
        _os_log_impl(&dword_1D3AC6000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking - saved event sample: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      -[HDHRNotificationManager _queue_fakeCardioFitnessNotificationWithData:repeat:error:](v39);
    }
    id v84 = v38;
    uint64_t v45 = [&unk_1F2B43130 count];
    double v46 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v47 = 0x1E4F2B000uLL;
    if (v45 >= 1)
    {
      uint64_t v48 = 0;
      double v49 = -floor(v24 / (double)(v45 - 1));
      uint64_t v95 = *MEMORY[0x1E4F2A918];
      do
      {
        dispatch_time_t v50 = [v89 dateByAddingTimeInterval:v49 * (double)(int)v48];
        v51 = *(void **)(v47 + 880);
        v52 = [MEMORY[0x1E4F2B618] unitFromString:@"ml/(kg*min)"];
        [&unk_1F2B43130 objectAtIndexedSubscript:v48];
        v54 = unint64_t v53 = v47;
        [v54 doubleValue];
        id v55 = objc_msgSend(v51, "quantityWithUnit:doubleValue:", v52);

        v56 = (void *)MEMORY[0x1E4F2B388];
        v57 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v95];
        id v58 = [v56 quantitySampleWithType:v57 quantity:v55 startDate:v50 endDate:v50];

        [v46 addObject:v58];
        unint64_t v47 = v53;

        ++v48;
      }
      while (v45 != v48);
    }
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id obj = v46;
    uint64_t v96 = [obj countByEnumeratingWithState:&v98 objects:v104 count:16];
    if (v96)
    {
      uint64_t v93 = *(void *)v99;
      id v59 = v84;
      while (1)
      {
        uint64_t v60 = 0;
        do
        {
          if (*(void *)v99 != v93) {
            objc_enumerationMutation(obj);
          }
          long long v61 = *(void **)(*((void *)&v98 + 1) + 8 * v60);
          id v62 = objc_loadWeakRetained(location);
          long long v63 = [v62 dataManager];

          v103 = v61;
          long long v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
          id v65 = objc_loadWeakRetained(location);
          v66 = [v65 dataProvenanceManager];
          v67 = [v66 defaultLocalDataProvenance];
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          id v97 = v59;
          int v69 = [v63 insertDataObjects:v64 withProvenance:v67 creationDate:1 skipInsertionFilter:&v97 error:Current];
          id v70 = v97;

          _HKInitializeLogging();
          v71 = (void *)*MEMORY[0x1E4F29F48];
          v72 = *MEMORY[0x1E4F29F48];
          if (v69)
          {
            id v59 = v70;
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_23;
            }
            v73 = v71;
            id v74 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v109 = v74;
            __int16 v110 = 2112;
            id v111 = v61;
            id v75 = v74;
            _os_log_impl(&dword_1D3AC6000, v73, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking - saved VO2Max sample: %@", buf, 0x16u);
            goto LABEL_21;
          }
          id v59 = v70;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v73 = v71;
            uint64_t v76 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v109 = v76;
            __int16 v110 = 2114;
            id v111 = v70;
            id v75 = v76;
            _os_log_error_impl(&dword_1D3AC6000, v73, OS_LOG_TYPE_ERROR, "[%{public}@] faking - failed to save VO2Max with error: %{public}@", buf, 0x16u);
LABEL_21:
          }
LABEL_23:

          ++v60;
        }
        while (v96 != v60);
        uint64_t v77 = [obj countByEnumeratingWithState:&v98 objects:v104 count:16];
        uint64_t v96 = v77;
        if (!v77) {
          goto LABEL_29;
        }
      }
    }
    id v59 = v84;
LABEL_29:

    v78 = [HDHRHealthKitSyncManager alloc];
    id v79 = objc_loadWeakRetained(location);
    v80 = [(HDHRHealthKitSyncManager *)v78 initWithProfile:v79];

    [(HDHRHealthKitSyncManager *)v80 triggerImmediateSyncWithReason:@"New fake Cardio Fitness notification sample has been added" loggingCategory:*MEMORY[0x1E4F29F48]];
    id v81 = v59;
    if (v81)
    {
      id v82 = v81;
      uint64_t v14 = v89;
      id v18 = v85;
      id v15 = v86;
      v30 = v87;
      if (a5)
      {
        id v82 = v81;
        *a5 = v82;
      }
      else
      {
        _HKLogDroppedError();
      }

      BOOL v44 = 0;
    }
    else
    {
      BOOL v44 = 1;
      uint64_t v14 = v89;
      id v18 = v85;
      id v15 = v86;
      v30 = v87;
    }
  }
  else
  {
    [(HDHRNotificationManager *)self _queue_showNotificationForHeartEvent:v30];
    BOOL v44 = 1;
  }

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakingNotifyTokens, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)samplesAdded:(uint64_t)a3 anchor:(void *)a4 .cold.1(_DWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  int v7 = objc_opt_class();
  *a1 = 138543362;
  *a4 = v7;
  id v8 = v7;
  OUTLINED_FUNCTION_4_2(&dword_1D3AC6000, v9, v10, "[%{public}@] Detected sample inserted with local device source");
}

- (void)samplesAdded:(uint64_t)a3 anchor:(void *)a4 .cold.2(_DWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  int v7 = objc_opt_class();
  *a1 = 138543362;
  *a4 = v7;
  id v8 = v7;
  OUTLINED_FUNCTION_4_2(&dword_1D3AC6000, v9, v10, "[%{public}@] Detected sample inserted with non-local device source");
}

- (void)_queue_showNotificationForHeartEvent:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] error archiving event: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_queue_showNotificationForHeartEvent:(void *)a3 .cold.2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  id v6 = v5;
  uint64_t v7 = [a3 categoryType];
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = HKSensitiveLogItem();
  int v10 = 138543618;
  uint8_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v9;
  _os_log_error_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] trying to show notification for unsupported event: %@", (uint8_t *)&v10, 0x16u);
}

void __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_2();
  id v5 = OUTLINED_FUNCTION_0_0(v4);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v6, v7, "[%{public}@] error requesting notification: %{public}@)", v8, v9, v10, v11, v12);
}

- (void)_queue_fakeNotificationWithEventType:(uint64_t)a3 withData:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v6 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = v6;
  id v7 = a1;
  _os_log_error_impl(&dword_1D3AC6000, a4, OS_LOG_TYPE_ERROR, "[%{public}@] faking - failed to save event with error: %{public}@", (uint8_t *)a3, 0x16u);
}

void __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_2();
  id v5 = OUTLINED_FUNCTION_3_4(v4);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v6, v7, "[%{public}@] faking - failed to associate heart rate with error: %{public}@", v8, v9, v10, v11, v12);
}

void __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)OUTLINED_FUNCTION_2();
  id v5 = OUTLINED_FUNCTION_3_4(v4);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v6, v7, "[%{public}@] faking - failed to save heart rate with error: %{public}@", v8, v9, v10, v11, v12);
}

- (void)_queue_fakeCardioFitnessNotificationWithData:(void *)a1 repeat:error:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] faking - failed to save event with error: %{public}@", v7, v8, v9, v10, v11);
}

@end