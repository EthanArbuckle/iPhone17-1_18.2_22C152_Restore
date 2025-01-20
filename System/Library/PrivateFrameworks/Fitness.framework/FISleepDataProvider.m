@interface FISleepDataProvider
- (BOOL)_isDate:(id)a3 within24HoursOfDate:(id)a4;
- (BOOL)_updateGoodMorningAlertNotificationEnabledIfNeeded:(BOOL)a3;
- (BOOL)_updateLastAlarmWakeUpDateIfNeeded:(id)a3;
- (BOOL)_updateLastGoodMorningDismissedDateIfNeeded:(id)a3;
- (BOOL)isGoodMorningAlertNotificationEnabled;
- (BOOL)isUserAwake;
- (FISleepDataProvider)initWithSleepStore:(id)a3 delegate:(id)a4;
- (FISleepUserDay)sleepUserDay;
- (NSDate)lastAlarmWakeUpDate;
- (NSDate)lastGoodMorningDismissedDate;
- (id)_fetchCachedSleepUserDay;
- (void)_cacheSleepUserDay:(id)a3;
- (void)_clearCurrentSleepScheduleState;
- (void)_clearSleepUserDay;
- (void)_fetchCachedSleepUserDay;
- (void)_fetchGoodMorningAlertNotificationEnabled;
- (void)_fetchLastAlarmWakeUpDate;
- (void)_fetchLastGoodMorningDismissedDate;
- (void)_initialLoadSleepUserDay;
- (void)_setEmptySleepUserDay:(id)a3;
- (void)_setSleepUserDay:(id)a3;
- (void)_setSleepUserDayWithStartOfDay:(id)a3 endOfDay:(id)a4;
- (void)_setUserDefaults:(id)a3;
- (void)_updateCurrentSleepScheduleState;
- (void)_updateSleepUserDay;
- (void)_updateSleepUserDayFromWakeUp:(id)a3 currentDate:(id)a4;
- (void)_updateSleepUserDayFromWindDownOrBedtime:(id)a3 currentDate:(id)a4;
- (void)activate;
- (void)dealloc;
- (void)setIsGoodMorningAlertNotificationEnabled:(BOOL)a3;
- (void)setIsUserAwake:(BOOL)a3;
- (void)setLastAlarmWakeUpDate:(id)a3;
- (void)setLastGoodMorningDismissedDate:(id)a3;
- (void)setSleepUserDay:(id)a3;
- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepModeOnDidChange:(BOOL)a4;
- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepScheduleStateDidChange:(unint64_t)a4;
- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4;
@end

@implementation FISleepDataProvider

- (FISleepDataProvider)initWithSleepStore:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FISleepDataProvider;
  v9 = [(FISleepDataProvider *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sleepStore, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    id v11 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v12 = [v11 initWithSuiteName:*MEMORY[0x263F0ADA0]];
    userDefaults = v10->_userDefaults;
    v10->_userDefaults = (NSUserDefaults *)v12;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)activate
{
  [(FISleepDataProvider *)self _fetchGoodMorningAlertNotificationEnabled];
  [(FISleepDataProvider *)self _fetchLastGoodMorningDismissedDate];
  [(FISleepDataProvider *)self _fetchLastAlarmWakeUpDate];
  [(FISleepDataProvider *)self _updateCurrentSleepScheduleState];
  [(FISleepDataProvider *)self _initialLoadSleepUserDay];
  sleepStore = self->_sleepStore;
  [(HKSPSleepStore *)sleepStore addObserver:self];
}

- (void)dealloc
{
  [(HKSPSleepStore *)self->_sleepStore removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)FISleepDataProvider;
  [(FISleepDataProvider *)&v3 dealloc];
}

- (FISleepUserDay)sleepUserDay
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sleepUserDay;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDate)lastGoodMorningDismissedDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastGoodMorningDismissedDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isGoodMorningAlertNotificationEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isGoodMorningAlertNotificationEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDate)lastAlarmWakeUpDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastAlarmWakeUpDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isUserAwake
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_currentSleepScheduleState == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_initialLoadSleepUserDay
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  objc_super v3 = (os_log_t *)MEMORY[0x263F098D8];
  v4 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_21C74B000, v4, OS_LOG_TYPE_DEFAULT, "Sleep data provider - initial load sleep user day", (uint8_t *)&v24, 2u);
  }
  v5 = [(FISleepDataProvider *)self _fetchCachedSleepUserDay];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained currentDate];
  id v8 = [v7 dateByAddingTimeInterval:-600.0];

  v9 = [v5 creationDate];
  int v10 = objc_msgSend(v9, "hk_isAfterOrEqualToDate:", v8);

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v12 = [v11 currentCalendar];
  v13 = [v5 creationDate];
  int v14 = [v12 isDateInToday:v13];

  if (v5) {
    int v15 = v10;
  }
  else {
    int v15 = 0;
  }
  int v16 = v15 & v14;
  _HKInitializeLogging();
  os_log_t v17 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = [v5 creationDate];
    int v24 = 138412546;
    v25 = v19;
    __int16 v26 = 1024;
    LODWORD(v27) = v16;
    _os_log_impl(&dword_21C74B000, v18, OS_LOG_TYPE_DEFAULT, "Sleep data provider - cached sleep user day creation date %@; is valid %d",
      (uint8_t *)&v24,
      0x12u);
  }
  if (v16)
  {
    _HKInitializeLogging();
    os_log_t v20 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = [v5 startOfDay];
      v23 = [v5 endOfDay];
      int v24 = 138412546;
      v25 = v22;
      __int16 v26 = 2112;
      v27 = v23;
      _os_log_impl(&dword_21C74B000, v21, OS_LOG_TYPE_DEFAULT, "Sleep data provider - cached sleep user day start of day (%@) end of day (%@)", (uint8_t *)&v24, 0x16u);
    }
    if ([v5 isEmpty]) {
      [(FISleepDataProvider *)self _setEmptySleepUserDay:v5];
    }
    else {
      [(FISleepDataProvider *)self _setSleepUserDay:v5];
    }
  }
  else
  {
    [(FISleepDataProvider *)self _updateSleepUserDay];
  }
}

- (void)_updateSleepUserDay
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  objc_super v3 = (os_log_t *)MEMORY[0x263F098D8];
  v4 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C74B000, v4, OS_LOG_TYPE_DEFAULT, "Sleep data provider - updating sleep user day", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = [WeakRetained currentDate];

  sleepStore = self->_sleepStore;
  id v20 = 0;
  id v8 = [(HKSPSleepStore *)sleepStore nextEventDueAfterDate:v6 error:&v20];
  id v9 = v20;
  int v10 = v9;
  if (!v8 || v9)
  {
    _HKInitializeLogging();
    os_log_t v15 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = v15;
      os_log_t v17 = [v10 localizedDescription];
      *(_DWORD *)buf = 138412546;
      v22 = v8;
      __int16 v23 = 2112;
      int v24 = v17;
      v18 = "Sleep data provider - did not find sleep event (%@) error (%@)";
LABEL_16:
      _os_log_impl(&dword_21C74B000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
    }
LABEL_17:
    [(FISleepDataProvider *)self _clearSleepUserDay];
    goto LABEL_20;
  }
  id v11 = [v8 dueDate];
  BOOL v12 = [(FISleepDataProvider *)self _isDate:v11 within24HoursOfDate:v6];

  if (!v12)
  {
    _HKInitializeLogging();
    os_log_t v19 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = v19;
      os_log_t v17 = [v8 dueDate];
      *(_DWORD *)buf = 138412546;
      v22 = v17;
      __int16 v23 = 2112;
      int v24 = v6;
      v18 = "Sleep data provider - next event (%@) > 24 hours from current date (%@)";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v13 = [v8 identifier];
  _HKInitializeLogging();
  int v14 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_21C74B000, v14, OS_LOG_TYPE_DEFAULT, "Sleep data provider - updating with identifier %@", buf, 0xCu);
  }
  if (v13 == (void *)*MEMORY[0x263F75C40])
  {
    [(FISleepDataProvider *)self _updateSleepUserDayFromWakeUp:v8 currentDate:v6];
  }
  else if (v13 == (void *)*MEMORY[0x263F75C50] || v13 == (void *)*MEMORY[0x263F75C18])
  {
    [(FISleepDataProvider *)self _updateSleepUserDayFromWindDownOrBedtime:v8 currentDate:v6];
  }

LABEL_20:
}

- (void)_updateSleepUserDayFromWakeUp:(id)a3 currentDate:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  sleepStore = self->_sleepStore;
  id v9 = [v6 dueDate];
  id v22 = 0;
  int v10 = [(HKSPSleepStore *)sleepStore nextEventDueAfterDate:v9 error:&v22];
  id v11 = v22;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = v13;
      os_log_t v15 = [v11 localizedDescription];
      *(_DWORD *)buf = 138412546;
      int v24 = v10;
      __int16 v25 = 2112;
      id v26 = v15;
      int v16 = "Sleep data provider - error fetching next event after wake up (%@) error (%@)";
LABEL_11:
      _os_log_impl(&dword_21C74B000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  os_log_t v17 = [v10 dueDate];
  BOOL v18 = [(FISleepDataProvider *)self _isDate:v17 within24HoursOfDate:v7];

  if (!v18)
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = v21;
      os_log_t v15 = [v10 dueDate];
      *(_DWORD *)buf = 138412546;
      int v24 = v15;
      __int16 v25 = 2112;
      id v26 = v7;
      int v16 = "Sleep data provider - next event after wake up (%@) > 24 hours from current date (%@)";
      goto LABEL_11;
    }
LABEL_12:
    [(FISleepDataProvider *)self _clearSleepUserDay];
    goto LABEL_13;
  }
  os_log_t v19 = [v6 dueDate];
  id v20 = [v10 dueDate];
  [(FISleepDataProvider *)self _setSleepUserDayWithStartOfDay:v19 endOfDay:v20];

LABEL_13:
}

- (void)_updateSleepUserDayFromWindDownOrBedtime:(id)a3 currentDate:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a4;
  sleepStore = self->_sleepStore;
  id v25 = 0;
  id v7 = [(HKSPSleepStore *)sleepStore sleepScheduleModelWithError:&v25];
  id v8 = v25;
  if (!v8)
  {
    v13 = [v7 previousEventWithIdentifier:*MEMORY[0x263F75C40] dueBeforeDate:v5];
    if (v13)
    {
      if ([(FISleepDataProvider *)self _isDate:v13 within24HoursOfDate:v5])
      {
        int v14 = self->_sleepStore;
        id v24 = 0;
        os_log_t v15 = [(HKSPSleepStore *)v14 nextEventDueAfterDate:v13 error:&v24];
        id v9 = v24;
        if (v9)
        {
          _HKInitializeLogging();
          int v16 = (void *)*MEMORY[0x263F098D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
          {
            os_log_t v17 = v16;
            BOOL v18 = [v9 localizedDescription];
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = v18;
            _os_log_impl(&dword_21C74B000, v17, OS_LOG_TYPE_DEFAULT, "Sleep data provider - error fetching next event after previous wake up event (%@)", buf, 0xCu);
          }
          [(FISleepDataProvider *)self _clearSleepUserDay];
        }
        else
        {
          __int16 v23 = [v15 dueDate];
          [(FISleepDataProvider *)self _setSleepUserDayWithStartOfDay:v13 endOfDay:v23];
        }
        goto LABEL_17;
      }
      _HKInitializeLogging();
      id v22 = *MEMORY[0x263F098D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v13;
        __int16 v28 = 2112;
        id v29 = v5;
        _os_log_impl(&dword_21C74B000, v22, OS_LOG_TYPE_DEFAULT, "Sleep data provider - previous wake up event before wind down or bedtime (%@) > 24 hours from current date (%@)", buf, 0x16u);
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v19 = (void *)*MEMORY[0x263F098D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
      {
        id v20 = v19;
        v21 = [0 localizedDescription];
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = 0;
        __int16 v28 = 2112;
        id v29 = v21;
        _os_log_impl(&dword_21C74B000, v20, OS_LOG_TYPE_DEFAULT, "Sleep data provider - error fetching next event after 24 hours before wind down or bedtime (%@) error (%@)", buf, 0x16u);
      }
    }
    [(FISleepDataProvider *)self _clearSleepUserDay];
    id v9 = 0;
LABEL_17:

    goto LABEL_18;
  }
  id v9 = v8;
  _HKInitializeLogging();
  int v10 = (void *)*MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    BOOL v12 = [v9 localizedDescription];
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v12;
    _os_log_impl(&dword_21C74B000, v11, OS_LOG_TYPE_DEFAULT, "Sleep data provider - error fetching sleep model for wind down or bedtime event error (%@)", buf, 0xCu);
  }
LABEL_18:
}

- (void)_clearSleepUserDay
{
  _HKInitializeLogging();
  objc_super v3 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21C74B000, v3, OS_LOG_TYPE_DEFAULT, "Sleep data provider - clearing sleep user start of day", v5, 2u);
  }
  id v4 = [[FISleepUserDay alloc] initEmptySleepUserDay];
  [(FISleepDataProvider *)self _setEmptySleepUserDay:v4];
}

- (void)_setEmptySleepUserDay:(id)a3
{
  p_lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  sleepUserDay = self->_sleepUserDay;
  self->_sleepUserDay = 0;

  os_unfair_lock_unlock(p_lock);
  [(FISleepDataProvider *)self _cacheSleepUserDay:v6];
}

- (void)_setSleepUserDayWithStartOfDay:(id)a3 endOfDay:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_21C74B000, v8, OS_LOG_TYPE_DEFAULT, "Sleep data provider - setting sleep user start of day (%@) end of day (%@)", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [[FISleepUserDay alloc] initWithStartOfDay:v6 endOfDay:v7];
  [(FISleepDataProvider *)self _setSleepUserDay:v9];
}

- (void)_setSleepUserDay:(id)a3
{
  id v4 = (FISleepUserDay *)a3;
  os_unfair_lock_lock(&self->_lock);
  sleepUserDay = self->_sleepUserDay;
  self->_sleepUserDay = v4;
  id v6 = v4;

  os_unfair_lock_unlock(&self->_lock);
  [(FISleepDataProvider *)self _cacheSleepUserDay:v6];
}

- (void)_fetchLastGoodMorningDismissedDate
{
  id v2 = a1;
  objc_super v3 = [(id)OUTLINED_FUNCTION_2_0() localizedDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_21C74B000, v4, v5, "Sleep data provider - failed to fetch current sleep event record (%@)", v6, v7, v8, v9, v10);
}

- (BOOL)_updateLastGoodMorningDismissedDateIfNeeded:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastGoodMorningDismissedDate = self->_lastGoodMorningDismissedDate;
  p_lastGoodMorningDismissedDate = (id *)&self->_lastGoodMorningDismissedDate;
  BOOL v9 = [(NSDate *)lastGoodMorningDismissedDate isEqualToDate:v5];
  if (!v9)
  {
    _HKInitializeLogging();
    uint8_t v10 = *MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *p_lastGoodMorningDismissedDate;
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_21C74B000, v10, OS_LOG_TYPE_DEFAULT, "Sleep data provider - last good morning dismissed date (%@ -> %@)", (uint8_t *)&v13, 0x16u);
    }
    objc_storeStrong(p_lastGoodMorningDismissedDate, a3);
  }
  os_unfair_lock_unlock(p_lock);

  return !v9;
}

- (void)_fetchGoodMorningAlertNotificationEnabled
{
  id v2 = a1;
  objc_super v3 = [(id)OUTLINED_FUNCTION_2_0() localizedDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_21C74B000, v4, v5, "Sleep data provider - failed to fetch current sleep schedule model (%@)", v6, v7, v8, v9, v10);
}

- (BOOL)_updateGoodMorningAlertNotificationEnabledIfNeeded:(BOOL)a3
{
  int v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int isGoodMorningAlertNotificationEnabled = self->_isGoodMorningAlertNotificationEnabled;
  if (isGoodMorningAlertNotificationEnabled != v3)
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = self->_isGoodMorningAlertNotificationEnabled;
      v10[0] = 67109376;
      v10[1] = v8;
      __int16 v11 = 1024;
      int v12 = v3;
      _os_log_impl(&dword_21C74B000, v7, OS_LOG_TYPE_DEFAULT, "Sleep data provider - updated good morning alert notification enabled (%d -> %d)", (uint8_t *)v10, 0xEu);
    }
    self->_int isGoodMorningAlertNotificationEnabled = v3;
  }
  os_unfair_lock_unlock(p_lock);
  return isGoodMorningAlertNotificationEnabled != v3;
}

- (void)_fetchLastAlarmWakeUpDate
{
  id v2 = a1;
  int v3 = [(id)OUTLINED_FUNCTION_2_0() localizedDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_21C74B000, v4, v5, "Sleep data provider - failed to fetch current sleep event record for wake up date (%@)", v6, v7, v8, v9, v10);
}

- (BOOL)_updateLastAlarmWakeUpDateIfNeeded:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastAlarmWakeUpDate = self->_lastAlarmWakeUpDate;
  p_lastAlarmWakeUpDate = (id *)&self->_lastAlarmWakeUpDate;
  BOOL v9 = [(NSDate *)lastAlarmWakeUpDate isEqualToDate:v5];
  if (!v9)
  {
    _HKInitializeLogging();
    uint8_t v10 = *MEMORY[0x263F098D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *p_lastAlarmWakeUpDate;
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_21C74B000, v10, OS_LOG_TYPE_DEFAULT, "Sleep data provider - updated last alarm wake up date (%@ -> %@)", (uint8_t *)&v13, 0x16u);
    }
    objc_storeStrong(p_lastAlarmWakeUpDate, a3);
  }
  os_unfair_lock_unlock(p_lock);

  return !v9;
}

- (void)_updateCurrentSleepScheduleState
{
  id v2 = a1;
  int v3 = [(id)OUTLINED_FUNCTION_2_0() localizedDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_21C74B000, v4, v5, "Sleep data provider - failed to fetch current sleep schedule state update, setting state to disabled (%@)", v6, v7, v8, v9, v10);
}

- (void)_clearCurrentSleepScheduleState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_currentSleepScheduleState = 0;
  os_unfair_lock_unlock(p_lock);
}

- (id)_fetchCachedSleepUserDay
{
  _DWORD v10[2] = *MEMORY[0x263EF8340];
  id v2 = [(NSUserDefaults *)self->_userDefaults valueForKey:@"cachedSleepUserDay"];
  if (v2)
  {
    int v3 = (void *)MEMORY[0x263EFFA08];
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    uint64_t v5 = [v3 setWithArray:v4];

    id v9 = 0;
    uint64_t v6 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v5 fromData:v2 error:&v9];
    id v7 = v9;
    if (v7)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
        -[FISleepDataProvider _fetchCachedSleepUserDay]();
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_cacheSleepUserDay:(id)a3
{
  id v6 = 0;
  uint64_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  id v5 = v6;
  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
      -[FISleepDataProvider _cacheSleepUserDay:]();
    }
  }
  [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"cachedSleepUserDay"];
}

- (BOOL)_isDate:(id)a3 within24HoursOfDate:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4)
    {
      [a3 timeIntervalSinceDate:a4];
      return fabs(v5) <= 86400.0;
    }
  }
  return result;
}

- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4
{
  _HKInitializeLogging();
  double v5 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEFAULT, "Sleep store schedule did change; updating sleep data provider and notifying observers",
      v7,
      2u);
  }
  [(FISleepDataProvider *)self _updateSleepUserDay];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sleepDataProviderUserDayDidUpdate];
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  _HKInitializeLogging();
  double v5 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEFAULT, "Sleep store settings did change; updating sleep data provider and notifying observers",
      v7,
      2u);
  }
  [(FISleepDataProvider *)self _updateSleepUserDay];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sleepDataProviderUserDayDidUpdate];
}

- (void)sleepStore:(id)a3 sleepScheduleStateDidChange:(unint64_t)a4
{
  _HKInitializeLogging();
  double v5 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEFAULT, "Sleep store state did change; updating sleep data provider and notifying observers",
      v7,
      2u);
  }
  [(FISleepDataProvider *)self _updateCurrentSleepScheduleState];
  [(FISleepDataProvider *)self _updateSleepUserDay];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sleepDataProviderUserDayDidUpdate];
}

- (void)sleepStore:(id)a3 sleepModeOnDidChange:(BOOL)a4
{
  _HKInitializeLogging();
  double v5 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEFAULT, "Sleep store mode did change; updating sleep data provider and notifying observers",
      v7,
      2u);
  }
  [(FISleepDataProvider *)self _updateSleepUserDay];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sleepDataProviderUserDayDidUpdate];
}

- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = (os_log_t *)MEMORY[0x263F098D8];
  id v7 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C74B000, v7, OS_LOG_TYPE_DEFAULT, "Sleep store record did change; updating sleep data provider and notifying observers",
      buf,
      2u);
  }
  uint64_t v8 = [v5 wakeUpAlarmDismissedDate];
  BOOL v9 = [(FISleepDataProvider *)self _updateLastAlarmWakeUpDateIfNeeded:v8];

  uint8_t v10 = [v5 goodMorningDismissedDate];

  BOOL v11 = [(FISleepDataProvider *)self _updateLastGoodMorningDismissedDateIfNeeded:v10];
  if (v9)
  {
    _HKInitializeLogging();
    int v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_21C74B000, v12, OS_LOG_TYPE_DEFAULT, "Most recent alarm wake up date did change; notifying observers",
        v17,
        2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sleepDataProviderLastAlarmWakeUpDateDidChange];
  }
  if (v11)
  {
    _HKInitializeLogging();
    id v14 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_21C74B000, v14, OS_LOG_TYPE_DEFAULT, "Last good morning dismissed date did change; notifying observers",
        v16,
        2u);
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 sleepDataProviderLastGoodMorningDismissedDateDidChange];
  }
}

- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x263F098D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v18 = 0;
    _os_log_impl(&dword_21C74B000, v6, OS_LOG_TYPE_DEFAULT, "Sleep store model did change; updating sleep data provider and notifying observers",
      v18,
      2u);
  }
  id v7 = [v5 sleepEventRecord];
  uint64_t v8 = [v7 wakeUpAlarmDismissedDate];
  BOOL v9 = [(FISleepDataProvider *)self _updateLastAlarmWakeUpDateIfNeeded:v8];

  BOOL v10 = -[FISleepDataProvider _updateGoodMorningAlertNotificationEnabledIfNeeded:](self, "_updateGoodMorningAlertNotificationEnabledIfNeeded:", [v5 goodMorningAlertNotificationEnabled]);
  BOOL v11 = [v5 sleepEventRecord];

  int v12 = [v11 goodMorningDismissedDate];
  BOOL v13 = [(FISleepDataProvider *)self _updateLastGoodMorningDismissedDateIfNeeded:v12];

  [(FISleepDataProvider *)self _updateSleepUserDay];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained sleepDataProviderUserDayDidUpdate];

  if (v9)
  {
    id v16 = objc_loadWeakRetained((id *)p_delegate);
    [v16 sleepDataProviderLastAlarmWakeUpDateDidChange];
  }
  if (v10 || v13)
  {
    id v17 = objc_loadWeakRetained((id *)p_delegate);
    [v17 sleepDataProviderLastGoodMorningDismissedDateDidChange];
  }
}

- (void)_setUserDefaults:(id)a3
{
}

- (void)setSleepUserDay:(id)a3
{
}

- (void)setLastGoodMorningDismissedDate:(id)a3
{
}

- (void)setIsGoodMorningAlertNotificationEnabled:(BOOL)a3
{
  self->_int isGoodMorningAlertNotificationEnabled = a3;
}

- (void)setLastAlarmWakeUpDate:(id)a3
{
}

- (void)setIsUserAwake:(BOOL)a3
{
  self->_isUserAwake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAlarmWakeUpDate, 0);
  objc_storeStrong((id *)&self->_lastGoodMorningDismissedDate, 0);
  objc_storeStrong((id *)&self->_sleepUserDay, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sleepStore, 0);
}

- (void)_fetchCachedSleepUserDay
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21C74B000, v0, OS_LOG_TYPE_ERROR, "Sleep data provider - failed to fetch cached sleep user day %@", v1, 0xCu);
}

- (void)_cacheSleepUserDay:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21C74B000, v0, OS_LOG_TYPE_ERROR, "Sleep data provider - failed to cache sleep user day %@", v1, 0xCu);
}

@end