@interface FCGoalProgressCoordinator
- (FCGoalProgressCoordinator)initWithDateProvider:(id)a3 debouncer:(id)a4 profile:(id)a5 scheduler:(id)a6 serviceQueue:(id)a7 store:(id)a8 typicalDayProvider:(id)a9;
- (FCGoalProgressCoordinatorDelegate)delegate;
- (id)_minimumActiveDaysOverride;
- (id)currentCalendar;
- (id)currentDate;
- (id)lastFiredDateForProgressEventIdentifier:(id)a3;
- (unint64_t)currentExperienceType;
- (void)_onqueue_handleGoalProgressConfiguration:(id)a3;
- (void)_onqueue_notificationPosted:(id)a3;
- (void)_onqueue_registerGoalProgressConfiguration:(id)a3 completion:(id)a4;
- (void)_onqueue_rescheduleEvents;
- (void)_onqueue_runEvaluation;
- (void)_onqueue_unscheduleEventIdentifiers:(id)a3;
- (void)_todayActivityChanged:(id)a3;
- (void)currentExperienceType;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)debouncerDidFinishDebounce:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)registerGoalProgressConfiguration:(id)a3 completion:(id)a4;
- (void)scheduler:(id)a3 performActivityWithName:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation FCGoalProgressCoordinator

- (FCGoalProgressCoordinator)initWithDateProvider:(id)a3 debouncer:(id)a4 profile:(id)a5 scheduler:(id)a6 serviceQueue:(id)a7 store:(id)a8 typicalDayProvider:(id)a9
{
  id v27 = a3;
  id v26 = a4;
  id v16 = a5;
  id v25 = a6;
  id v24 = a7;
  id v17 = a8;
  id v18 = a9;
  v28.receiver = self;
  v28.super_class = (Class)FCGoalProgressCoordinator;
  v19 = [(FCGoalProgressCoordinator *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dateProvider, a3);
    objc_storeStrong((id *)&v20->_debouncer, a4);
    objc_storeWeak((id *)&v20->_profile, v16);
    objc_storeStrong((id *)&v20->_scheduler, a6);
    objc_storeStrong((id *)&v20->_serviceQueue, a7);
    objc_storeStrong((id *)&v20->_store, a8);
    objc_storeStrong((id *)&v20->_typicalDayProvider, a9);
    progressEvents = v20->_progressEvents;
    v20->_progressEvents = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v20, v20->_serviceQueue, v24, v25, v26, v27);
  }
  return v20;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = [WeakRetained database];
  [v4 removeProtectedDataObserver:self];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_progressEvents;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        scheduler = self->_scheduler;
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) eventIdentifier];
        [(FCCXPCActivityScheduler *)scheduler cancelActivityWithName:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)FCGoalProgressCoordinator;
  [(FCGoalProgressCoordinator *)&v12 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  serviceQueue = self->_serviceQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  uint64_t v6 = [v5 database];

  [v6 addProtectedDataObserver:self];
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__todayActivityChanged_ name:*MEMORY[0x1E4F61C38] object:0];

  uint64_t v8 = [(FCGoalProgressStore *)self->_store currentConfiguration];
  _HKInitializeLogging();
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F29F08];
  v10 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1D3B3E000, v10, OS_LOG_TYPE_DEFAULT, "Loaded goal progress configuration %@", (uint8_t *)&v19, 0xCu);
  }
  v11 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  if (v8
    && ([v8 expirationDate],
        objc_super v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = objc_msgSend(v12, "hk_isAfterDate:", v11),
        v12,
        (v13 & 1) != 0))
  {
    [(FCGoalProgressCoordinator *)self _onqueue_handleGoalProgressConfiguration:v8];
    long long v14 = [(FCTypicalDayProvider *)self->_typicalDayProvider typicalDayModel];

    if (v14)
    {
      self->_typicalDayModelLoaded = 1;
      [(FCGoalProgressCoordinator *)self _onqueue_rescheduleEvents];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v18 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D3B3E000, v18, OS_LOG_TYPE_DEFAULT, "Typical day model has not loaded yet", (uint8_t *)&v19, 2u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = v15;
      id v17 = [v8 expirationDate];
      int v19 = 138412802;
      v20 = v8;
      __int16 v21 = 2112;
      v22 = v17;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_1D3B3E000, v16, OS_LOG_TYPE_DEFAULT, "Invalid loaded configuration %@, expiration %@, now %@", (uint8_t *)&v19, 0x20u);
    }
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    serviceQueue = self->_serviceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__FCGoalProgressCoordinator_database_protectedDataDidBecomeAvailable___block_invoke;
    block[3] = &unk_1E69B8500;
    block[4] = self;
    dispatch_async(serviceQueue, block);
  }
}

uint64_t __70__FCGoalProgressCoordinator_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) debounce];
}

- (void)_onqueue_runEvaluation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x1E4F29F08];
  v4 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v35) = 0;
    _os_log_impl(&dword_1D3B3E000, v4, OS_LOG_TYPE_DEFAULT, "Running goal progress evaluation", (uint8_t *)&v35, 2u);
  }
  if ([(FCGoalProgressDebouncer *)self->_debouncer inProgress])
  {
    _HKInitializeLogging();
    id v5 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v35) = 0;
    uint64_t v6 = "Debounce in progress, not evaluating goal progress";
    goto LABEL_15;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v8 = [WeakRetained database];
  char v9 = [v8 isProtectedDataAvailable];

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v35) = 0;
    uint64_t v6 = "Protected data unavailable, not evaluating goal progress";
    goto LABEL_15;
  }
  currentConfiguration = self->_currentConfiguration;
  if (currentConfiguration)
  {
    v11 = [(FCCGoalProgressConfiguration *)currentConfiguration expirationDate];
    objc_super v12 = [(FCCDateProvider *)self->_dateProvider coachingDate];
    int v13 = objc_msgSend(v11, "hk_isBeforeOrEqualToDate:", v12);

    if (v13)
    {
      _HKInitializeLogging();
      id v5 = *v3;
      if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v35) = 0;
      uint64_t v6 = "Not evaluating, goal progress configuration has expired";
      goto LABEL_15;
    }
    long long v14 = [(FCTypicalDayProvider *)self->_typicalDayProvider typicalDayModel];
    os_log_t v15 = [(FCGoalProgressCoordinator *)self _minimumActiveDaysOverride];
    long long v16 = v15;
    if (v15) {
      uint64_t v17 = [v15 integerValue];
    }
    else {
      uint64_t v17 = [(FCCGoalProgressConfiguration *)self->_currentConfiguration minimumNumberOfActiveDays];
    }
    uint64_t v18 = v17;
    uint64_t v19 = [v14 totalActiveDays];
    if (v19 < v18)
    {
      uint64_t v20 = v19;
      _HKInitializeLogging();
      __int16 v21 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 134218240;
        uint64_t v36 = v20;
        __int16 v37 = 2048;
        uint64_t v38 = v18;
        _os_log_impl(&dword_1D3B3E000, v21, OS_LOG_TYPE_DEFAULT, "User hasn't reached enough active days: %ld vs %ld", (uint8_t *)&v35, 0x16u);
      }
      goto LABEL_35;
    }
    v22 = +[FCGoalProgressEvaluator evaluateEvents:self->_progressEvents withModel:v14 evaluationDelegate:self];
    __int16 v23 = [v22 lastObject];
    id v24 = v23;
    if (!v23)
    {
      _HKInitializeLogging();
      v32 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35) = 0;
        _os_log_impl(&dword_1D3B3E000, v32, OS_LOG_TYPE_DEFAULT, "No event to show goal progress evaluation", (uint8_t *)&v35, 2u);
      }
      goto LABEL_34;
    }
    uint64_t v25 = [v23 goalProgressContentForModel:v14];
    id v26 = [(FCTypicalDayProvider *)self->_typicalDayProvider onServiceQueue_currentActivityCacheSummary];
    char v27 = [v26 isPaused];

    _HKInitializeLogging();
    os_log_t v28 = *v3;
    BOOL v29 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (!v29)
      {
LABEL_33:
        [(FCGoalProgressCoordinator *)self _onqueue_notificationPosted:v25];

LABEL_34:
LABEL_35:

        return;
      }
      v30 = v28;
      v31 = [v24 eventIdentifier];
      int v35 = 138412546;
      uint64_t v36 = (uint64_t)v31;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v22;
      _os_log_impl(&dword_1D3B3E000, v30, OS_LOG_TYPE_DEFAULT, "Goal progress not posting event %@ from fired events %@ because we are currently paused", (uint8_t *)&v35, 0x16u);
    }
    else
    {
      if (v29)
      {
        v33 = v28;
        v34 = [v24 eventIdentifier];
        int v35 = 138412546;
        uint64_t v36 = (uint64_t)v34;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v22;
        _os_log_impl(&dword_1D3B3E000, v33, OS_LOG_TYPE_DEFAULT, "Goal progress posting event %@ from fired events %@", (uint8_t *)&v35, 0x16u);
      }
      v30 = objc_loadWeakRetained((id *)&self->_delegate);
      [v30 coordinator:self eventFiredWithContent:v25];
    }

    goto LABEL_33;
  }
  _HKInitializeLogging();
  id v5 = *v3;
  if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
    return;
  }
  LOWORD(v35) = 0;
  uint64_t v6 = "Not evaluating, goal progress configuration doesn't exist";
LABEL_15:
  _os_log_impl(&dword_1D3B3E000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v35, 2u);
}

- (void)registerGoalProgressConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__FCGoalProgressCoordinator_registerGoalProgressConfiguration_completion___block_invoke;
  block[3] = &unk_1E69B85C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serviceQueue, block);
}

uint64_t __74__FCGoalProgressCoordinator_registerGoalProgressConfiguration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerGoalProgressConfiguration:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_onqueue_registerGoalProgressConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  serviceQueue = self->_serviceQueue;
  uint64_t v8 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2(serviceQueue);
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1D3B3E000, v9, OS_LOG_TYPE_DEFAULT, "Goal progress registering configuration: %@", (uint8_t *)&v10, 0xCu);
  }
  [(FCGoalProgressStore *)self->_store storeCurrentConfiguration:v6];
  [(FCGoalProgressCoordinator *)self _onqueue_handleGoalProgressConfiguration:v6];
  [(FCGoalProgressCoordinator *)self _onqueue_rescheduleEvents];
  v8[2](v8, 0);
}

- (void)_onqueue_handleGoalProgressConfiguration:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentConfiguration, a3);
  id v6 = [v5 userStartOfDay];
  [(FCTypicalDayProvider *)self->_typicalDayProvider setUserStartOfDay:v6];

  id v7 = [v5 userEndOfDay];
  [(FCTypicalDayProvider *)self->_typicalDayProvider setUserEndOfDay:v7];

  _HKInitializeLogging();
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F29F08];
  id v9 = (void *)*MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    typicalDayProvider = self->_typicalDayProvider;
    id v11 = v9;
    uint64_t v12 = [(FCTypicalDayProvider *)typicalDayProvider typicalDayModel];
    id v13 = [v12 userStartOfDay];
    long long v14 = [(FCTypicalDayProvider *)self->_typicalDayProvider typicalDayModel];
    os_log_t v15 = [v14 userEndOfDay];
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = v13;
    __int16 v39 = 2112;
    v40 = v15;
    _os_log_impl(&dword_1D3B3E000, v11, OS_LOG_TYPE_DEFAULT, "Goal progress using user start date: %@, user end date: %@", buf, 0x16u);
  }
  long long v16 = [FCAlmostThereEvent alloc];
  uint64_t v17 = [v5 almostThereConfiguration];
  uint64_t v18 = [(FCAlmostThereEvent *)v16 initWithConfiguration:v17];

  uint64_t v19 = [FCAtypicalDayEvent alloc];
  uint64_t v20 = [v5 atypicalDayConfiguration];
  __int16 v21 = [(FCAtypicalDayEvent *)v19 initWithConfiguration:v20];

  v22 = [FCCompletionOffTrackEvent alloc];
  __int16 v23 = [v5 completionOffTrackConfiguration];
  id v24 = [(FCCompletionOffTrackEvent *)v22 initWithConfiguration:v23];

  v36[0] = v21;
  v36[1] = v24;
  v36[2] = v18;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  progressEvents = self->_progressEvents;
  self->_progressEvents = v25;

  _HKInitializeLogging();
  os_log_t v27 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v28 = v27;
    BOOL v29 = [v5 almostThereConfiguration];
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v29;
    _os_log_impl(&dword_1D3B3E000, v28, OS_LOG_TYPE_DEFAULT, "Goal progress added almost there configuration %@", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v30 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    v32 = [v5 atypicalDayConfiguration];
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v32;
    _os_log_impl(&dword_1D3B3E000, v31, OS_LOG_TYPE_DEFAULT, "Goal progress added atypical day configuration %@", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v33 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v33;
    int v35 = [v5 completionOffTrackConfiguration];
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v35;
    _os_log_impl(&dword_1D3B3E000, v34, OS_LOG_TYPE_DEFAULT, "Goal progress added completion off track configuration %@", buf, 0xCu);
  }
}

- (void)_onqueue_rescheduleEvents
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x1E4F29F08];
  v4 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3B3E000, v4, OS_LOG_TYPE_DEFAULT, "Rescheduling goal progress if needed", buf, 2u);
  }
  id v5 = [(FCGoalProgressStore *)self->_store scheduledEventIdentifiers];
  currentConfiguration = self->_currentConfiguration;
  if (!currentConfiguration)
  {
    _HKInitializeLogging();
    int v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v11 = "Not scheduling, goal progress configuration doesn't exist";
      goto LABEL_15;
    }
LABEL_16:
    [(FCGoalProgressCoordinator *)self _onqueue_unscheduleEventIdentifiers:v5];
    [(FCGoalProgressStore *)self->_store clearScheduledEventIdentifiers];
    goto LABEL_17;
  }
  id v7 = [(FCCGoalProgressConfiguration *)currentConfiguration expirationDate];
  uint64_t v8 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  int v9 = objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v8);

  if (v9)
  {
    _HKInitializeLogging();
    int v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v11 = "Not scheduling, goal progress configuration has expired";
LABEL_15:
      _os_log_impl(&dword_1D3B3E000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!self->_progressEvents)
  {
    _HKInitializeLogging();
    int v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v11 = "Not scheduling, goal progress events don't exist";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  uint64_t v12 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  [v12 timeIntervalSinceReferenceDate];
  uint64_t v14 = v13;
  os_log_t v15 = [(FCTypicalDayProvider *)self->_typicalDayProvider typicalDayModel];
  long long v16 = +[FCGoalProgressEvaluator nextScheduledDatesByEventIdentifiersForEvents:self->_progressEvents model:v15 evaluationDelegate:self];
  _HKInitializeLogging();
  uint64_t v17 = *v3;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    BOOL v29 = v16;
    __int16 v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_1D3B3E000, v17, OS_LOG_TYPE_DEFAULT, "Goal progress generated scheduled dates %@, for current date %@", buf, 0x16u);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke;
  v27[3] = &__block_descriptor_40_e29_B24__0__NSString_8__NSDate_16l;
  v27[4] = v14;
  uint64_t v18 = objc_msgSend(v16, "hk_filter:", v27);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke_2;
  v26[3] = &unk_1E69B8610;
  v26[4] = self;
  [v18 enumerateKeysAndObjectsUsingBlock:v26];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke_295;
  v24[3] = &unk_1E69B8638;
  id v25 = v18;
  id v19 = v18;
  uint64_t v20 = objc_msgSend(v5, "hk_filter:", v24);
  [(FCGoalProgressCoordinator *)self _onqueue_unscheduleEventIdentifiers:v20];
  [(FCGoalProgressStore *)self->_store clearScheduledEventIdentifiers];
  __int16 v21 = (void *)MEMORY[0x1E4F1CAD0];
  v22 = [v19 allKeys];
  __int16 v23 = [v21 setWithArray:v22];

  [(FCGoalProgressStore *)self->_store storeScheduledEventIdentifiers:v23];
LABEL_17:
}

BOOL __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 timeIntervalSinceReferenceDate];
  return v4 > *(double *)(a1 + 32);
}

void __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(a1 + 32) + 48) scheduleActivityWithName:v5 scheduledDate:v6];
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1D3B3E000, v7, OS_LOG_TYPE_DEFAULT, "Scheduled date %{public}@ for progress event %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke_295(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  double v4 = [v2 allKeys];
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

- (void)_onqueue_unscheduleEventIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    id v9 = (os_log_t *)MEMORY[0x1E4F29F08];
    *(void *)&long long v6 = 138412290;
    long long v13 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        _HKInitializeLogging();
        uint64_t v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          uint64_t v19 = v11;
          _os_log_impl(&dword_1D3B3E000, v12, OS_LOG_TYPE_DEFAULT, "Canceling scheduled event identifier %@", buf, 0xCu);
        }
        -[FCCXPCActivityScheduler cancelActivityWithName:](self->_scheduler, "cancelActivityWithName:", v11, v13);
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)_onqueue_notificationPosted:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  serviceQueue = self->_serviceQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  long long v6 = [v5 eventIdentifier];

  uint64_t v7 = [NSString stringWithFormat:@"%@-%@", @"ProgressUpdate", v6];

  _HKInitializeLogging();
  uint64_t v8 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D3B3E000, v8, OS_LOG_TYPE_DEFAULT, "Storing date for fired event: %@", buf, 0xCu);
  }
  store = self->_store;
  uint64_t v10 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  [(FCGoalProgressStore *)store storeFiredEventDate:v10 identifier:v7];
}

- (void)scheduler:(id)a3 performActivityWithName:(id)a4 completion:(id)a5
{
  serviceQueue = self->_serviceQueue;
  uint64_t v7 = (void (**)(void))a5;
  dispatch_assert_queue_V2(serviceQueue);
  [(FCGoalProgressCoordinator *)self _onqueue_runEvaluation];
  v7[2]();
}

- (void)debouncerDidFinishDebounce:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D3B3E000, v4, OS_LOG_TYPE_DEFAULT, "Debounce on protected data change finished for goal progress", v5, 2u);
  }
  [(FCGoalProgressCoordinator *)self _onqueue_runEvaluation];
}

- (void)_todayActivityChanged:(id)a3
{
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__FCGoalProgressCoordinator__todayActivityChanged___block_invoke;
  block[3] = &unk_1E69B8500;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __51__FCGoalProgressCoordinator__todayActivityChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 72))
  {
    id v3 = [*(id *)(v2 + 80) typicalDayModel];

    uint64_t v2 = *(void *)(a1 + 32);
    if (v3)
    {
      *(unsigned char *)(v2 + 72) = 1;
      _HKInitializeLogging();
      id v4 = *MEMORY[0x1E4F29F08];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v6 = 0;
        _os_log_impl(&dword_1D3B3E000, v4, OS_LOG_TYPE_DEFAULT, "Rescheduling now that typical day model has loaded", v6, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_rescheduleEvents");
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  return objc_msgSend((id)v2, "_onqueue_runEvaluation");
}

- (id)currentDate
{
  return (id)[(FCCDateProvider *)self->_dateProvider coachingDate];
}

- (id)currentCalendar
{
  return (id)[(FCCDateProvider *)self->_dateProvider coachingCalendar];
}

- (id)lastFiredDateForProgressEventIdentifier:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@-%@", @"ProgressUpdate", a3];
  id v5 = [(FCGoalProgressStore *)self->_store lastFiredEventDateForIdentifier:v4];

  return v5;
}

- (unint64_t)currentExperienceType
{
  id v3 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained userCharacteristicsManager];
  id v13 = 0;
  long long v6 = [v5 userCharacteristicForType:v3 error:&v13];
  id v7 = v13;

  if (v6)
  {
    uint64_t v8 = [(FCGoalProgressCoordinator *)self currentCalendar];
    id v9 = [(FCGoalProgressCoordinator *)self currentDate];
    unint64_t v10 = FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar();
  }
  else
  {
    if (v7)
    {
      _HKInitializeLogging();
      uint64_t v11 = *MEMORY[0x1E4F29F08];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
        [(FCGoalProgressCoordinator *)(uint64_t)v7 currentExperienceType];
      }
    }
    unint64_t v10 = 1;
  }

  return v10;
}

- (id)_minimumActiveDaysOverride
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F61FC0]];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F61FC8]];

  return v4;
}

- (FCGoalProgressCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FCGoalProgressCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_typicalDayProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_progressEvents, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);

  objc_storeStrong((id *)&self->_currentConfiguration, 0);
}

- (void)currentExperienceType
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3B3E000, a2, OS_LOG_TYPE_ERROR, "FCGoalProgressCoordinator failed to get date of birth: %@", (uint8_t *)&v2, 0xCu);
}

@end