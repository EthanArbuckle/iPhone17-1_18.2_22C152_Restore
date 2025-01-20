@interface FCMoveModeCoordinator
- (BOOL)_queue_loadBirthDateComponents;
- (BOOL)_queue_loadMoveModeChangeSample;
- (BOOL)_queue_loadWheelchairUse;
- (FCMoveModeCoordinator)initWithDateProvider:(id)a3 profile:(id)a4 serviceQueue:(id)a5;
- (FCMoveModeCoordinatorDelegate)delegate;
- (double)_delay;
- (id)_birthdayForAge:(int64_t)a3;
- (id)_dateByAddingNumberOfWeeks:(int64_t)a3 toDate:(id)a4;
- (id)_dateForKey:(id)a3;
- (id)_lastGraduationNotificationDate;
- (id)_lastModeChangeNotificationDate;
- (id)_lastWheelchairModeChangeNotificationDate;
- (id)_nextActivityMoveModeStartDateForNotificationType:(int64_t)a3;
- (id)_tuesdayAfterDate:(id)a3;
- (id)_tuesdayBeforeDate:(id)a3;
- (id)_upgradeToMoveTimeNotificationDate;
- (id)keyValueDomain;
- (int64_t)_nextActivityMoveModeForNotificationType:(int64_t)a3;
- (int64_t)_queue_determineActivityMoveModeNotificationType;
- (void)_queue_loadBirthDateComponents;
- (void)_queue_loadMoveModeChangeSample;
- (void)_queue_loadWheelchairUse;
- (void)_queue_scheduleNotificationIfNeeded;
- (void)_saveMoveModeChangeSampleForActivityMoveMode:(int64_t)a3 date:(id)a4;
- (void)_setBirthDateComponents:(id)a3;
- (void)_setDate:(id)a3 forKey:(id)a4;
- (void)_setLastGraduationNotificationDate:(id)a3;
- (void)_setLastModeChangeNotificationDate:(id)a3;
- (void)_setLastWheelchairModeChangeNotificationDate:(id)a3;
- (void)_setMostRecentActivityMoveModeChangeSample:(id)a3;
- (void)_setUpgradeToMoveTimeNotificationDate:(id)a3;
- (void)_setisWheelchairUser:(BOOL)a3;
- (void)_significantTimeChangeOccurred;
- (void)_userCharacteristicsDidChange;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)notificationPosted:(id)a3 error:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FCMoveModeCoordinator

- (FCMoveModeCoordinator)initWithDateProvider:(id)a3 profile:(id)a4 serviceQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)FCMoveModeCoordinator;
  v12 = [(FCMoveModeCoordinator *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dateProvider, a3);
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v13->_serviceQueue, a5);
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_profile);
    v15 = [WeakRetained database];
    [v15 addProtectedDataObserver:v13 queue:v13->_serviceQueue];

    id v16 = objc_loadWeakRetained((id *)&v13->_profile);
    [v16 registerProfileReadyObserver:v13 queue:v13->_serviceQueue];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v13 selector:sel__userCharacteristicsDidChange name:*MEMORY[0x1E4F65A10] object:0];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v13 selector:sel__significantTimeChangeOccurred name:*MEMORY[0x1E4F1C2E0] object:0];

    id v19 = objc_loadWeakRetained((id *)&v13->_profile);
    v20 = [v19 dataManager];
    v21 = [MEMORY[0x1E4F2B2C0] activityMoveModeChangeType];
    [v20 addObserver:v13 forDataType:v21];
  }
  return v13;
}

- (void)notificationPosted:(id)a3 error:(id)a4
{
  id v5 = a3;
  v6 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  switch([v5 notificationType])
  {
    case 0:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_FAULT)) {
        -[FCMoveModeCoordinator notificationPosted:error:]();
      }
      break;
    case 1:
      [(FCMoveModeCoordinator *)self _setUpgradeToMoveTimeNotificationDate:v6];
      break;
    case 2:
      [(FCMoveModeCoordinator *)self _setLastGraduationNotificationDate:v6];
      break;
    case 3:
      [(FCMoveModeCoordinator *)self _setLastGraduationNotificationDate:v6];
      uint64_t v7 = [v5 nextActivityMoveMode];
      v8 = [v5 nextActivityMoveModeStartDate];
      [(FCMoveModeCoordinator *)self _saveMoveModeChangeSampleForActivityMoveMode:v7 date:v8];

      break;
    case 4:
    case 5:
      [(FCMoveModeCoordinator *)self _setLastModeChangeNotificationDate:v6];
      break;
    case 6:
      uint64_t v9 = [v5 nextActivityMoveMode];
      id v10 = [v5 nextActivityMoveModeStartDate];
      [(FCMoveModeCoordinator *)self _saveMoveModeChangeSampleForActivityMoveMode:v9 date:v10];

      [(FCMoveModeCoordinator *)self _setLastWheelchairModeChangeNotificationDate:v6];
      break;
    default:
      break;
  }
}

- (void)dealloc
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained database];
  [v5 removeProtectedDataObserver:self];

  id v6 = objc_loadWeakRetained((id *)p_profile);
  uint64_t v7 = [v6 dataManager];
  v8 = [MEMORY[0x1E4F2B2C0] activityMoveModeChangeType];
  [v7 removeObserver:self forDataType:v8];

  v9.receiver = self;
  v9.super_class = (Class)FCMoveModeCoordinator;
  [(FCMoveModeCoordinator *)&v9 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  v4 = [a3 database];
  int v5 = [v4 isProtectedDataAvailable];

  if (v5)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D3B3E000, v6, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator received daemon ready and protected data is available; scheduling notification if needed",
        v7,
        2u);
    }
    [(FCMoveModeCoordinator *)self _queue_scheduleNotificationIfNeeded];
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _HKInitializeLogging();
  int v5 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D3B3E000, v5, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator protected data did become available; scheduling notification if needed",
      v6,
      2u);
  }
  [(FCMoveModeCoordinator *)self _queue_scheduleNotificationIfNeeded];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  _HKInitializeLogging();
  int v5 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3B3E000, v5, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator received new activity move mode change sample", buf, 2u);
  }
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FCMoveModeCoordinator_samplesAdded_anchor___block_invoke;
  block[3] = &unk_1E69B8500;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __45__FCMoveModeCoordinator_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleNotificationIfNeeded");
}

- (BOOL)_queue_loadBirthDateComponents
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  if (self->_birthDateComponents) {
    return 1;
  }
  v4 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained userCharacteristicsManager];
  id v18 = 0;
  uint64_t v7 = [v6 userCharacteristicForType:v4 error:&v18];
  id v8 = v18;

  BOOL v3 = v7 != 0;
  if (v7)
  {
    birthDateComponents = self->_birthDateComponents;
    self->_birthDateComponents = v7;
    uint64_t v7 = birthDateComponents;
  }
  else
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      [(FCMoveModeCoordinator *)(uint64_t)v8 _queue_loadBirthDateComponents];
    }
  }

  return v3;
}

- (BOOL)_queue_loadMoveModeChangeSample
{
  v29[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F2B2C0] activityMoveModeChangeType];
  v4 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  int v5 = HDSampleEntityPredicateForStartDate();

  id v6 = (void *)MEMORY[0x1E4F65BC8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [v6 entityEnumeratorWithType:v3 profile:WeakRetained];

  objc_super v9 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65A08] entityClass:objc_opt_class() ascending:0];
  v29[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  [v8 setOrderingTerms:v10];

  [v8 setPredicate:v5];
  [v8 setLimitCount:1];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  v21[4] = &v23;
  id v22 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__FCMoveModeCoordinator__queue_loadMoveModeChangeSample__block_invoke;
  v21[3] = &unk_1E69B8528;
  char v11 = [v8 enumerateWithError:&v22 handler:v21];
  id v12 = v22;
  if (!v12) {
    char v11 = 1;
  }
  if (v11)
  {
    objc_storeStrong((id *)&self->_mostRecentActivityMoveModeChangeSample, (id)v24[5]);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      [(FCMoveModeCoordinator *)(uint64_t)v12 _queue_loadMoveModeChangeSample];
    }
  }

  _Block_object_dispose(&v23, 8);
  return v11;
}

uint64_t __56__FCMoveModeCoordinator__queue_loadMoveModeChangeSample__block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (void)_saveMoveModeChangeSampleForActivityMoveMode:(int64_t)a3 date:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  dateProvider = self->_dateProvider;
  id v6 = a4;
  uint64_t v7 = [(FCCDateProvider *)dateProvider coachingCalendar];
  id v8 = objc_msgSend(v7, "hk_startOfDateByAddingDays:toDate:", 1, v6);

  objc_super v9 = [v7 components:*MEMORY[0x1E4F2BC40] fromDate:v8];
  id v10 = FIActivityMoveModeChangeSampleForDateComponents();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [WeakRetained dataManager];
  v14[0] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v12 insertDataObjects:v13 error:0];
}

- (BOOL)_queue_loadWheelchairUse
{
  BOOL v3 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298C8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v5 = [WeakRetained userCharacteristicsManager];
  id v17 = 0;
  id v6 = [v5 userCharacteristicForType:v3 error:&v17];
  id v7 = v17;

  if (v7)
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      [(FCMoveModeCoordinator *)(uint64_t)v7 _queue_loadWheelchairUse];
    }
  }
  else
  {
    unint64_t v15 = [v6 integerValue];
    if (v15 >= 2)
    {
      if (v15 == 2) {
        self->_isWheelchairUser = 1;
      }
    }
    else
    {
      self->_isWheelchairUser = 0;
    }
  }

  return v7 == 0;
}

- (void)_queue_scheduleNotificationIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  BOOL v3 = [(FCMoveModeCoordinator *)self _queue_loadBirthDateComponents];
  BOOL v4 = [(FCMoveModeCoordinator *)self _queue_loadMoveModeChangeSample];
  BOOL v5 = [(FCMoveModeCoordinator *)self _queue_loadWheelchairUse];
  if (v3 && v4 && v5)
  {
    int64_t v6 = [(FCMoveModeCoordinator *)self _queue_determineActivityMoveModeNotificationType];
    if (v6)
    {
      int64_t v7 = v6;
      int64_t v8 = [(FCMoveModeCoordinator *)self _nextActivityMoveModeForNotificationType:v6];
      uint64_t v9 = [(FCMoveModeCoordinator *)self _nextActivityMoveModeStartDateForNotificationType:v7];
      [(FCMoveModeCoordinator *)self _delay];
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F620F8]) initWithNotificationType:v7 nextActivityMoveMode:v8 nextActivityMoveModeStartDate:v9 delay:v10];
      _HKInitializeLogging();
      uint64_t v12 = *MEMORY[0x1E4F29F08];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1D3B3E000, v12, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator scheduling notification %@", (uint8_t *)&v15, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained coordinator:self postMoveModeNotification:v11];
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D3B3E000, v14, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator failed to load data", (uint8_t *)&v15, 2u);
    }
  }
}

- (int64_t)_queue_determineActivityMoveModeNotificationType
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  BOOL v3 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  BOOL v4 = [(FCCDateProvider *)self->_dateProvider coachingCalendar];
  uint64_t v5 = FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar();
  int64_t v6 = (os_log_t *)MEMORY[0x1E4F29F08];
  if (!v5)
  {
    _HKInitializeLogging();
    v21 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44) = 0;
      id v22 = "FCMoveModeCoordinator - age unknown for move mode notification";
LABEL_64:
      _os_log_impl(&dword_1D3B3E000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v44, 2u);
    }
LABEL_65:
    int64_t v28 = 0;
    goto LABEL_78;
  }
  unint64_t v7 = v5;
  mostRecentActivityMoveModeChangeSample = self->_mostRecentActivityMoveModeChangeSample;
  if (!mostRecentActivityMoveModeChangeSample)
  {
    int v23 = 0;
    uint64_t v9 = 1;
    goto LABEL_34;
  }
  uint64_t v9 = [(HKCategorySample *)mostRecentActivityMoveModeChangeSample value];
  double v10 = [(HKCategorySample *)self->_mostRecentActivityMoveModeChangeSample startDate];
  [v10 timeIntervalSinceReferenceDate];

  uint64_t v11 = _HKActivityCacheDateComponentsFromCacheIndex();
  uint64_t v12 = [v4 dateFromComponents:v11];
  uint64_t v13 = [(FCMoveModeCoordinator *)self _lastModeChangeNotificationDate];
  _HKInitializeLogging();
  uint64_t v14 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    int v44 = 138543618;
    uint64_t v45 = (uint64_t)v12;
    __int16 v46 = 2114;
    unint64_t v47 = (unint64_t)v13;
    _os_log_impl(&dword_1D3B3E000, v14, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - mostRecentMoveModeChangeDate (%{public}@) lastChangeNotificationDate (%{public}@)", (uint8_t *)&v44, 0x16u);
  }
  [v12 timeIntervalSinceReferenceDate];
  double v16 = v15;
  [v13 timeIntervalSinceReferenceDate];
  if (v16 <= v17)
  {

    if (v9 == 2)
    {
      if (self->_isWheelchairUser)
      {
        uint64_t v18 = [(FCMoveModeCoordinator *)self _lastWheelchairModeChangeNotificationDate];
        if (!v18 || ![v4 isDateInToday:v18])
        {
          _HKInitializeLogging();
          v29 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v44) = 0;
            _os_log_impl(&dword_1D3B3E000, v29, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user switched to wheelchair mode and needs a move mode change notification", (uint8_t *)&v44, 2u);
          }
          int64_t v28 = 6;
          goto LABEL_77;
        }
        _HKInitializeLogging();
        uint64_t v19 = *v6;
        if (!os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
LABEL_57:
          int64_t v28 = 0;
LABEL_77:

          goto LABEL_78;
        }
        int v44 = 138543362;
        uint64_t v45 = (uint64_t)v18;
        v20 = "FCMoveModeCoordinator - user switched to wheelchair mode but has already been notified about mode change (%{public}@)";
LABEL_56:
        _os_log_impl(&dword_1D3B3E000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v44, 0xCu);
        goto LABEL_57;
      }
      int v23 = 1;
      uint64_t v9 = 2;
    }
    else
    {
      int v23 = 0;
    }
LABEL_34:
    _HKInitializeLogging();
    v30 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = 134218240;
      uint64_t v45 = v9;
      __int16 v46 = 2048;
      unint64_t v47 = v7;
      _os_log_impl(&dword_1D3B3E000, v30, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - activityMoveModeForToday (%ld) ageInYears (%lu)", (uint8_t *)&v44, 0x16u);
    }
    if (v7 <= *MEMORY[0x1E4F61C90]) {
      int v31 = v23;
    }
    else {
      int v31 = 0;
    }
    if ((v7 <= *MEMORY[0x1E4F61C90] || v9 == 2) && v31 == 0)
    {
      if (v7 == 17 || v7 == 13)
      {
        _HKInitializeLogging();
        v34 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v44) = 0;
          _os_log_impl(&dword_1D3B3E000, v34, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user is in activity move mode graduation year", (uint8_t *)&v44, 2u);
        }
        uint64_t v18 = [(FCMoveModeCoordinator *)self _lastGraduationNotificationDate];
        if (!v18 || !objc_msgSend(v4, "hk_isDate:withinNumberOfCalendarDays:ofDate:", v18, 366, v3))
        {
          if (v7 == 17)
          {
            v35 = [(FCMoveModeCoordinator *)self _birthdayForAge:18];
            v36 = [(FCMoveModeCoordinator *)self _tuesdayBeforeDate:v35];
            v37 = @"a mandatory";
            int64_t v28 = 3;
            v38 = @"before";
          }
          else
          {
            v35 = [(FCMoveModeCoordinator *)self _birthdayForAge:13];
            v36 = [(FCMoveModeCoordinator *)self _tuesdayAfterDate:v35];
            v37 = @"an";
            int64_t v28 = 2;
            v38 = @"after";
          }

          _HKInitializeLogging();
          v39 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            int v44 = 138543362;
            uint64_t v45 = (uint64_t)v36;
            _os_log_impl(&dword_1D3B3E000, v39, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - expected notificationDate (%{public}@)", (uint8_t *)&v44, 0xCu);
          }
          if (v36 && objc_msgSend(v3, "hk_isBeforeDate:", v36))
          {
            _HKInitializeLogging();
            v40 = *v6;
            if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
            {
              int v44 = 138543362;
              uint64_t v45 = (uint64_t)v38;
              _os_log_impl(&dword_1D3B3E000, v40, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - not enough days %{public}@ birthday to notify about activity move mode graduation", (uint8_t *)&v44, 0xCu);
            }
            int64_t v28 = 0;
          }
          else
          {
            _HKInitializeLogging();
            v41 = *v6;
            if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
            {
              int v44 = 138543362;
              uint64_t v45 = (uint64_t)v37;
              _os_log_impl(&dword_1D3B3E000, v41, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user needs a notification about %{public}@ activity move mode graduation", (uint8_t *)&v44, 0xCu);
            }
          }

          goto LABEL_77;
        }
        _HKInitializeLogging();
        uint64_t v19 = *v6;
        if (!os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_57;
        }
        int v44 = 138543362;
        uint64_t v45 = (uint64_t)v18;
        v20 = "FCMoveModeCoordinator - user has already been notified for move mode for this graduation year (%{public}@)";
        goto LABEL_56;
      }
      if (v7 <= *MEMORY[0x1E4F61C90] && !self->_isWheelchairUser)
      {
        uint64_t v18 = [(FCMoveModeCoordinator *)self _upgradeToMoveTimeNotificationDate];
        _HKInitializeLogging();
        uint64_t v19 = *v6;
        BOOL v43 = os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT);
        if (!v18)
        {
          if (v43)
          {
            LOWORD(v44) = 0;
            _os_log_impl(&dword_1D3B3E000, v19, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user is an upgrade user and needs to be notified to upgrade to move time", (uint8_t *)&v44, 2u);
          }
          int64_t v28 = 1;
          goto LABEL_77;
        }
        if (!v43) {
          goto LABEL_57;
        }
        int v44 = 138543362;
        uint64_t v45 = (uint64_t)v18;
        v20 = "FCMoveModeCoordinator - user is an upgrade to move time user but has already been notified (%{public}@)";
        goto LABEL_56;
      }
      _HKInitializeLogging();
      v21 = *v6;
      if (!os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_65;
      }
      LOWORD(v44) = 0;
      id v22 = "FCMoveModeCoordinator - user does not need to be notified";
      goto LABEL_64;
    }
    _HKInitializeLogging();
    v21 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44) = 0;
      id v22 = "FCMoveModeCoordinator - user activity move mode and age in combination that doesn't require any notifying";
      goto LABEL_64;
    }
    goto LABEL_65;
  }
  BOOL v25 = v7 > 0x11 && v9 == 1;
  _HKInitializeLogging();
  v26 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v27 = &stru_1F2B435C0;
    if (v25) {
      v27 = @"mandatory ";
    }
    int v44 = 138543362;
    uint64_t v45 = (uint64_t)v27;
    _os_log_impl(&dword_1D3B3E000, v26, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user needs a %{public}@move mode change notification", (uint8_t *)&v44, 0xCu);
  }
  if (v25) {
    int64_t v28 = 5;
  }
  else {
    int64_t v28 = 4;
  }

LABEL_78:
  return v28;
}

- (int64_t)_nextActivityMoveModeForNotificationType:(int64_t)a3
{
  int64_t result = 2;
  switch(a3)
  {
    case 0:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_FAULT)) {
        -[FCMoveModeCoordinator _nextActivityMoveModeForNotificationType:]();
      }
      goto LABEL_7;
    case 1:
      return result;
    case 2:
    case 3:
    case 5:
    case 6:
      goto LABEL_2;
    case 4:
      mostRecentActivityMoveModeChangeSample = self->_mostRecentActivityMoveModeChangeSample;
      if (mostRecentActivityMoveModeChangeSample)
      {
        int64_t result = [(HKCategorySample *)mostRecentActivityMoveModeChangeSample value];
      }
      else
      {
LABEL_2:
        int64_t result = 1;
      }
      break;
    default:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_FAULT)) {
        -[FCMoveModeCoordinator _nextActivityMoveModeForNotificationType:]();
      }
LABEL_7:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)_nextActivityMoveModeStartDateForNotificationType:(int64_t)a3
{
  BOOL v4 = 0;
  switch(a3)
  {
    case 0:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_FAULT)) {
        -[FCMoveModeCoordinator _nextActivityMoveModeForNotificationType:]();
      }
      goto LABEL_6;
    case 1:
    case 2:
    case 4:
    case 5:
      break;
    case 3:
      uint64_t v5 = [(FCMoveModeCoordinator *)self _birthdayForAge:18];
      int64_t v6 = [(FCCDateProvider *)self->_dateProvider coachingCalendar];
      unint64_t v7 = [(FCCDateProvider *)self->_dateProvider coachingDate];
      int64_t v8 = [v6 startOfDayForDate:v5];
      uint64_t v9 = objc_msgSend(v6, "hk_startOfDateByAddingDays:toDate:", 1, v7);
      BOOL v4 = [v8 laterDate:v9];

      goto LABEL_9;
    case 6:
      uint64_t v5 = [(FCCDateProvider *)self->_dateProvider coachingCalendar];
      double v10 = [(FCCDateProvider *)self->_dateProvider coachingDate];
      BOOL v4 = objc_msgSend(v5, "hk_startOfDateByAddingDays:toDate:", 1, v10);

LABEL_9:
      break;
    default:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_FAULT)) {
        -[FCMoveModeCoordinator _nextActivityMoveModeForNotificationType:]();
      }
LABEL_6:
      BOOL v4 = 0;
      break;
  }
  return v4;
}

- (double)_delay
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"FCMoveModeCoordinatorNotificationDelayOverrideKey"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 600.0;
  }

  return v5;
}

- (void)_userCharacteristicsDidChange
{
  _HKInitializeLogging();
  BOOL v3 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3B3E000, v3, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator received user characteristics change notification", buf, 2u);
  }
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FCMoveModeCoordinator__userCharacteristicsDidChange__block_invoke;
  block[3] = &unk_1E69B8500;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __54__FCMoveModeCoordinator__userCharacteristicsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  double v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_queue_scheduleNotificationIfNeeded");
}

- (void)_significantTimeChangeOccurred
{
  _HKInitializeLogging();
  BOOL v3 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3B3E000, v3, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator\x1B did receive significant time change notification", buf, 2u);
  }
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FCMoveModeCoordinator__significantTimeChangeOccurred__block_invoke;
  block[3] = &unk_1E69B8500;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __55__FCMoveModeCoordinator__significantTimeChangeOccurred__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleNotificationIfNeeded");
}

- (id)_lastGraduationNotificationDate
{
  return [(FCMoveModeCoordinator *)self _dateForKey:@"lastGraduationAlertDate"];
}

- (void)_setLastGraduationNotificationDate:(id)a3
{
}

- (id)_upgradeToMoveTimeNotificationDate
{
  return [(FCMoveModeCoordinator *)self _dateForKey:@"upgradeToMoveTimeAlertDate"];
}

- (void)_setUpgradeToMoveTimeNotificationDate:(id)a3
{
}

- (id)_lastModeChangeNotificationDate
{
  return [(FCMoveModeCoordinator *)self _dateForKey:@"lastModeChangeAlertDate"];
}

- (void)_setLastModeChangeNotificationDate:(id)a3
{
}

- (id)_lastWheelchairModeChangeNotificationDate
{
  return [(FCMoveModeCoordinator *)self _dateForKey:@"lastWheelchairModeChangeAlertDate"];
}

- (void)_setLastWheelchairModeChangeNotificationDate:(id)a3
{
}

- (id)_dateForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(FCMoveModeCoordinator *)self keyValueDomain];
  id v10 = 0;
  int64_t v6 = [v5 dateForKey:v4 error:&v10];
  id v7 = v10;
  if (v7)
  {
    int64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      -[FCMoveModeCoordinator _dateForKey:]();
    }
  }
  else
  {
    int64_t v8 = v6;
  }

  return v8;
}

- (void)_setDate:(id)a3 forKey:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(FCMoveModeCoordinator *)self keyValueDomain];
  id v12 = 0;
  [v8 setDate:v6 forKey:v7 error:&v12];
  id v9 = v12;
  _HKInitializeLogging();
  id v10 = *MEMORY[0x1E4F29F08];
  uint64_t v11 = *MEMORY[0x1E4F29F08];
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FCMoveModeCoordinator _setDate:forKey:]();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_1D3B3E000, v10, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator successfully saved data to key value domain for key %{public}@ date: %{public}@", buf, 0x16u);
  }
}

- (id)keyValueDomain
{
  keyValueDomain = self->_keyValueDomain;
  if (!keyValueDomain)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F65B28]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v6 = (HDKeyValueDomain *)[v4 initWithCategory:1 domainName:@"com.apple.nanolifestyle.coaching.activityMoveMode" profile:WeakRetained];
    id v7 = self->_keyValueDomain;
    self->_keyValueDomain = v6;

    keyValueDomain = self->_keyValueDomain;
  }
  return keyValueDomain;
}

- (id)_dateByAddingNumberOfWeeks:(int64_t)a3 toDate:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  id v9 = [(FCCDateProvider *)self->_dateProvider coachingCalendar];
  [v8 setCalendar:v9];

  [v8 setWeekOfMonth:1];
  id v10 = objc_msgSend(v8, "hk_dateByAddingInterval:toDate:", a3, v7);

  return v10;
}

- (id)_tuesdayBeforeDate:(id)a3
{
  dateProvider = self->_dateProvider;
  id v5 = a3;
  id v6 = [(FCCDateProvider *)dateProvider coachingCalendar];
  id v7 = objc_msgSend(v6, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", 3, v5, 0);
  int v8 = [v6 isDate:v5 inSameDayAsDate:v7];

  if (v8)
  {
    uint64_t v9 = [(FCMoveModeCoordinator *)self _dateByAddingNumberOfWeeks:-1 toDate:v7];

    id v7 = (void *)v9;
  }

  return v7;
}

- (id)_tuesdayAfterDate:(id)a3
{
  dateProvider = self->_dateProvider;
  id v5 = a3;
  id v6 = [(FCCDateProvider *)dateProvider coachingCalendar];
  id v7 = objc_msgSend(v6, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", 3, v5, 0);

  int v8 = [(FCMoveModeCoordinator *)self _dateByAddingNumberOfWeeks:1 toDate:v7];

  return v8;
}

- (id)_birthdayForAge:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  id v6 = [(FCCDateProvider *)self->_dateProvider coachingCalendar];
  [v5 setCalendar:v6];

  [v5 setYear:1];
  id v7 = [(NSDateComponents *)self->_birthDateComponents date];
  int v8 = objc_msgSend(v5, "hk_dateByAddingInterval:toDate:", a3, v7);

  return v8;
}

- (void)_setBirthDateComponents:(id)a3
{
}

- (void)_setMostRecentActivityMoveModeChangeSample:(id)a3
{
}

- (void)_setisWheelchairUser:(BOOL)a3
{
  self->_isWheelchairUser = a3;
}

- (FCMoveModeCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCMoveModeCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_mostRecentActivityMoveModeChangeSample, 0);
  objc_storeStrong((id *)&self->_birthDateComponents, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)notificationPosted:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3B3E000, v0, v1, "FCMoveModeCoordinator - attempted to process notification request with undefined notification type", v2, v3, v4, v5, v6);
}

- (void)_queue_loadBirthDateComponents
{
}

- (void)_queue_loadMoveModeChangeSample
{
}

- (void)_queue_loadWheelchairUse
{
}

- (void)_nextActivityMoveModeForNotificationType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3B3E000, v0, v1, "FCMoveModeCoordinator attempted to present with unknown notification type", v2, v3, v4, v5, v6);
}

- (void)_nextActivityMoveModeForNotificationType:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3B3E000, v0, v1, "FCMoveModeCoordinator attempted to present with undefined notification type", v2, v3, v4, v5, v6);
}

- (void)_dateForKey:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D3B3E000, v0, v1, "FCMoveModeCoordinator failed to read data from key value domain for key %{public}@. Error: %{public}@");
}

- (void)_setDate:forKey:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D3B3E000, v0, v1, "FCMoveModeCoordinator failed to save data to value domain for key %{public}@. Error: %{public}@");
}

@end