@interface _EKAlarmEngine
+ (_EKAlarmEngine)sharedInstance;
+ (id)requestedDarwinNotifications;
- (BOOL)_haveAlarmsChanged:(id)a3;
- (BOOL)_isAlarmAcknowledgedWithAcknowledgedDate:(id)a3 fireDate:(id)a4;
- (BOOL)_isDataProtected;
- (BOOL)_populateAlarmTable:(id)a3;
- (_EKAlarmEngine)init;
- (id)_alertInfoAlarmIDFromEKAlarm:(id)a3;
- (id)_alertInfoAlarmIDFromSideAlarm:(id)a3;
- (id)_dateFormatter;
- (id)_eventStore;
- (void)_calendarNotificationSettingChanged;
- (void)_databaseChanged;
- (void)_globalAlarmPreferencesChanged;
- (void)_installTimerWithFireDate:(id)a3;
- (void)_killSyncTimer;
- (void)_killTimer;
- (void)_notifyAlarmsFired:(id)a3;
- (void)_populateFinished;
- (void)_protectedDataDidBecomeAvailable;
- (void)_rescheduleTimer;
- (void)_resetSyncTimer;
- (void)_simulatedOffsetChanged:(id)a3;
- (void)_storeAlarms:(id)a3 nextScheduleLimit:(id)a4 eventStore:(id)a5;
- (void)_syncDidEnd;
- (void)_syncDidStart;
- (void)_syncTimerFired:(id)a3;
- (void)_timeDidChangeSignificantly;
- (void)_timeZoneChanged:(id)a3;
- (void)_timerFired;
- (void)_updateWithForceForAlarmTable:(BOOL)a3;
- (void)dealloc;
- (void)didRegisterForAlarms;
- (void)handleDarwinNotification:(id)a3;
- (void)receivedAlarmNamed:(id)a3;
- (void)start;
@end

@implementation _EKAlarmEngine

- (void)handleDarwinNotification:(id)a3
{
  id v8 = a3;
  if ([v8 isEqualToString:*MEMORY[0x263F2FE40]])
  {
    [(_EKAlarmEngine *)self _databaseChanged];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F2FF98]])
  {
    [(_EKAlarmEngine *)self _syncDidStart];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F2FFA0]])
  {
    [(_EKAlarmEngine *)self _syncDidEnd];
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F30108]])
  {
    [(_EKAlarmEngine *)self _timeDidChangeSignificantly];
  }
  else
  {
    v4 = [MEMORY[0x263F04B78] stateChangedNotificationName];
    int v5 = [v8 isEqualToString:v4];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F04B78]);
      int v7 = [v6 dataIsAccessible];

      if (v7) {
        [(_EKAlarmEngine *)self _protectedDataDidBecomeAvailable];
      }
    }
    else if ([v8 isEqualToString:@"com.apple.mobilecal.preference.notification.calendarsExcludedFromNotifications"])
    {
      [(_EKAlarmEngine *)self _calendarNotificationSettingChanged];
    }
    else if ([v8 isEqual:@"com.apple.calendar.defaultAlarmChangedNotification"])
    {
      [(_EKAlarmEngine *)self _globalAlarmPreferencesChanged];
    }
  }
}

+ (id)requestedDarwinNotifications
{
  v5[7] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263F04B78], "stateChangedNotificationName", *MEMORY[0x263F2FE40], *MEMORY[0x263F2FF98], *MEMORY[0x263F2FFA0], *MEMORY[0x263F30108]);
  v5[4] = v2;
  v5[5] = @"com.apple.mobilecal.preference.notification.calendarsExcludedFromNotifications";
  v5[6] = @"com.apple.calendar.defaultAlarmChangedNotification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:7];

  return v3;
}

+ (_EKAlarmEngine)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1) {
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance___shared;
  return (_EKAlarmEngine *)v2;
}

- (_EKAlarmEngine)init
{
  v6.receiver = self;
  v6.super_class = (Class)_EKAlarmEngine;
  v2 = [(_EKAlarmEngine *)&v6 init];
  if (v2)
  {
    v3 = (EKTimedEventStorePurger *)objc_alloc_init(MEMORY[0x263F04C00]);
    timedEventStorePurger = v2->_timedEventStorePurger;
    v2->_timedEventStorePurger = v3;

    [(EKTimedEventStorePurger *)v2->_timedEventStorePurger setTimeout:4.0];
    [(EKTimedEventStorePurger *)v2->_timedEventStorePurger setPurgingAllowed:1];
    [(EKTimedEventStorePurger *)v2->_timedEventStorePurger setCreationBlock:&__block_literal_global_19];
  }
  return v2;
}

- (void)dealloc
{
  [(_EKAlarmEngine *)self _killSyncTimer];
  v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Stopping", buf, 2u);
  }

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F30110] object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(_EKAlarmEngine *)self _killTimer];

  v6.receiver = self;
  v6.super_class = (Class)_EKAlarmEngine;
  [(_EKAlarmEngine *)&v6 dealloc];
}

- (void)start
{
  v3 = +[EKSideTableContext sideTableContext];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __23___EKAlarmEngine_start__block_invoke;
  v12 = &unk_2645C0DC0;
  id v13 = v3;
  v14 = self;
  id v4 = v3;
  [v4 performBlockAndWait:&v9];
  int v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  objc_super v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.calendar.notification.alarmengine", v5);
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v6;

  id v8 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v9, v10, v11, v12);
  [v8 addObserver:self selector:sel__timeZoneChanged_ name:*MEMORY[0x263F30110] object:0];
}

- (void)didRegisterForAlarms
{
  v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Alarm engine handling did register for alarms message", buf, 2u);
  }

  [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:0];
  if ([(_EKAlarmEngine *)self _isDataProtected])
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38___EKAlarmEngine_didRegisterForAlarms__block_invoke;
    block[3] = &unk_2645C0D98;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)receivedAlarmNamed:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = NSString;
  id v5 = a3;
  objc_super v6 = [v4 stringWithUTF8String:"com.apple.calaccessd.alarmEngine.alarm.name"];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = (void *)xpc_copy_event();
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(xpc_dictionary_get_date(v8, "com.apple.calaccessd.alarmEngine.alarm.context.date") / 0x3B9ACA00uLL));
    uint64_t v10 = (void *)MEMORY[0x223C89120](v8);
    v11 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = v10;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Received alarm notification. XPC Alarm context: %s. XPC Alarm context date: %@.", buf, 0x16u);
    }

    free(v10);
    dispatchQueue = self->_dispatchQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __37___EKAlarmEngine_receivedAlarmNamed___block_invoke;
    v14[3] = &unk_2645C0DC0;
    v14[4] = self;
    id v15 = v9;
    id v13 = v9;
    dispatch_async(dispatchQueue, v14);
  }
}

- (void)_protectedDataDidBecomeAvailable
{
  v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Protected data now available.", buf, 2u);
  }

  if (self->_pendingChanges)
  {
    self->_pendingChanges = 0;
    [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:1];
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50___EKAlarmEngine__protectedDataDidBecomeAvailable__block_invoke;
    block[3] = &unk_2645C0D98;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (BOOL)_isDataProtected
{
  id v2 = objc_alloc_init(MEMORY[0x263F04B78]);
  char v3 = [v2 dataIsAccessible] ^ 1;

  return v3;
}

- (id)_eventStore
{
  return (id)[(EKTimedEventStorePurger *)self->_timedEventStorePurger acquireCachedEventStoreOrCreate:1];
}

- (void)_updateWithForceForAlarmTable:(BOOL)a3
{
  id v5 = (void *)os_transaction_create();
  if ([(_EKAlarmEngine *)self _isDataProtected])
  {
    objc_super v6 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v7 = "Data protection enabled. Waiting for unlock before updating.";
LABEL_7:
      _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    if (!self->_syncTimer)
    {
      dispatchQueue = self->_dispatchQueue;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __48___EKAlarmEngine__updateWithForceForAlarmTable___block_invoke;
      v9[3] = &unk_2645C13C8;
      v9[4] = self;
      BOOL v10 = a3;
      dispatch_async(dispatchQueue, v9);
      goto LABEL_9;
    }
    objc_super v6 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v7 = "Sync running. Waiting for it to finish before updating.";
      goto LABEL_7;
    }
  }

  self->_pendingChanges = 1;
  self->_shouldUpdateWithForceForAlarmTable = a3;
LABEL_9:
}

- (void)_databaseChanged
{
  char v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Database changed.", v4, 2u);
  }

  [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:0];
}

- (BOOL)_haveAlarmsChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lastDBSequenceToken = self->_lastDBSequenceToken;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37___EKAlarmEngine__haveAlarmsChanged___block_invoke;
  v10[3] = &unk_2645C1478;
  v10[4] = &v11;
  [v4 changesSinceSequenceToken:lastDBSequenceToken completion:v10];
  objc_super v6 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v12 + 24)) {
      int v7 = "YES";
    }
    else {
      int v7 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    v16 = v7;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Alarms may have changed: %s", buf, 0xCu);
  }

  BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)_timeZoneChanged:(id)a3
{
  id v4 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Time zone changed.", v5, 2u);
  }

  [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:1];
}

- (void)_simulatedOffsetChanged:(id)a3
{
  id v4 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Simulated offset changed.", v5, 2u);
  }

  [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:1];
}

- (void)_storeAlarms:(id)a3 nextScheduleLimit:(id)a4 eventStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[EKSideTableContext sideTableContext];
  if (v11)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60___EKAlarmEngine__storeAlarms_nextScheduleLimit_eventStore___block_invoke;
    v20[3] = &unk_2645C14A0;
    v21 = v8;
    id v22 = v11;
    v23 = self;
    id v24 = v10;
    id v25 = v9;
    [v22 performBlockAndWait:v20];

    v12 = v21;
  }
  else
  {
    v12 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_EKAlarmEngine _storeAlarms:nextScheduleLimit:eventStore:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (BOOL)_populateAlarmTable:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL populating = self->_populating;
  if (!self->_populating)
  {
    self->_BOOL populating = 1;
    objc_super v6 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
    populateStart = self->_populateStart;
    self->_populateStart = v6;

    id v8 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Populating alarm table", buf, 2u);
    }

    id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v9 synchronize];

    id v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    CFStringRef v11 = (const __CFString *)*MEMORY[0x263F30248];
    v12 = [v10 persistentDomainForName:*MEMORY[0x263F30248]];

    v62 = v12;
    if (v12)
    {
      uint64_t v13 = *MEMORY[0x263F30118];
      uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F30118]];
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v17 = +[CALNLogSubsystem alarmEngine];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v69 = v20;
          id v21 = v20;
          _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, "Time Zone Support pref is suspect (%@)", buf, 0xCu);
        }
      }
      else
      {
        CFStringRef v60 = v11;
        BOOL v15 = populating;
        uint64_t v16 = [v12 objectForKey:v13];
        uint64_t v17 = v16;
        id v18 = v4;
        if (v16) {
          int v19 = [v16 BOOLValue];
        }
        else {
          int v19 = 1;
        }
        id v22 = (const void *)CalCopyTimeZone();
        v23 = (const void *)CalCopySystemTimeZone();
        id v24 = +[CALNLogSubsystem alarmEngine];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = (void *)MEMORY[0x223C88A40](v22);
          id v58 = v25;
          v26 = (void *)MEMORY[0x223C88A40](v23);
          v27 = @"OFF";
          *(_DWORD *)buf = 138412802;
          v69 = v25;
          __int16 v70 = 2112;
          if (!v19) {
            v27 = @"ON";
          }
          v71 = v26;
          __int16 v72 = 2112;
          v73 = v27;
          id v28 = v26;
          _os_log_impl(&dword_2216BB000, v24, OS_LOG_TYPE_DEFAULT, "Calendar TZ = %@; System TZ = %@; Time Zone Support = %@",
            buf,
            0x20u);
        }
        CFRelease(v22);
        CFRelease(v23);
        id v4 = v18;
        BOOL populating = v15;
        CFStringRef v11 = v60;
        v12 = v62;
      }
    }
    p_lastCheckpoint = (id *)&self->_lastCheckpoint;
    if (!self->_lastCheckpoint)
    {
      uint64_t v30 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
      id v31 = *p_lastCheckpoint;
      id *p_lastCheckpoint = (id)v30;
    }
    v32 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
    if ([*p_lastCheckpoint CalIsAfterDate:v32]) {
      objc_storeStrong((id *)&self->_lastCheckpoint, v32);
    }
    v33 = [v32 dateByAddingTimeInterval:-259200.0];
    if ([v33 CalIsAfterDate:*p_lastCheckpoint]) {
      objc_storeStrong((id *)&self->_lastCheckpoint, v33);
    }
    v34 = [v32 dateByAddingTimeInterval:1296000.0];
    if ([*p_lastCheckpoint CalIsBeforeDate:v34])
    {
      v57 = v32;
      BOOL v59 = populating;
      v35 = +[CALNLogSubsystem alarmEngine];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [(_EKAlarmEngine *)self _dateFormatter];
        v37 = [v36 stringFromDate:self->_lastCheckpoint];
        v38 = [(_EKAlarmEngine *)self _dateFormatter];
        v39 = [v38 stringFromDate:v34];
        *(_DWORD *)buf = 138412546;
        v69 = v37;
        __int16 v70 = 2112;
        v71 = v39;
        _os_log_impl(&dword_2216BB000, v35, OS_LOG_TYPE_DEFAULT, "Searching for alarms between [%@] and [%@]", buf, 0x16u);
      }
      v56 = v33;

      CFPreferencesAppSynchronize(v11);
      CFPropertyListRef v40 = CFPreferencesCopyAppValue(@"CalendarsExcludedFromNotifications", v11);
      if (v40)
      {
        v41 = (void *)v40;
        v42 = [MEMORY[0x263EFFA08] setWithArray:v40];
      }
      else
      {
        v42 = 0;
      }
      v61 = v4;
      v43 = objc_msgSend(v4, "calendarsForEntityType:", 0, v34);
      v44 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v43, "count"));
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v45 = v43;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v64 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            v51 = [v50 calendarIdentifier];
            char v52 = [v42 containsObject:v51];

            if ((v52 & 1) == 0) {
              [v44 addObject:v50];
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v63 objects:v67 count:16];
        }
        while (v47);
      }

      id v4 = v61;
      v53 = [v61 alarmOccurrencesFromAlarmCache];
      v34 = v55;
      [(_EKAlarmEngine *)self _storeAlarms:v53 nextScheduleLimit:v55 eventStore:v61];
      [(_EKAlarmEngine *)self _populateFinished];

      BOOL populating = v59;
      v12 = v62;
      v33 = v56;
      v32 = v57;
    }
    else
    {
      [(_EKAlarmEngine *)self _populateFinished];
    }
  }
  return !populating;
}

- (void)_populateFinished
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  self->_BOOL populating = 0;
  char v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
    [v4 timeIntervalSinceDate:self->_populateStart];
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = v5;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Alarm Table populated in %f", buf, 0xCu);
  }
  if (self->_needsAlarmTablePopulation)
  {
    self->_needsAlarmTablePopulation = 0;
    objc_super v6 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Retrying alarm table population due to previous request to do so.", buf, 2u);
    }

    [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:1];
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35___EKAlarmEngine__populateFinished__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_killTimer
{
  self->_nextFireDate = 0;
  MEMORY[0x270F9A758]();
}

- (id)_dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    uint64_t v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    [(NSDateFormatter *)self->_dateFormatter setDateStyle:3];
    [(NSDateFormatter *)self->_dateFormatter setTimeStyle:3];
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)_rescheduleTimer
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  char v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Rescheduling timer", buf, 2u);
  }

  [(_EKAlarmEngine *)self _killTimer];
  *(void *)buf = 0;
  int v19 = buf;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6;
  id v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  id v4 = +[EKSideTableContext sideTableContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __34___EKAlarmEngine__rescheduleTimer__block_invoke;
  v14[3] = &unk_2645C0E10;
  uint64_t v17 = buf;
  uint64_t v5 = v4;
  BOOL v15 = v5;
  uint64_t v16 = self;
  [v5 performBlockAndWait:v14];
  objc_super v6 = (void *)*((void *)v19 + 5);
  if (v6)
  {
    int v7 = (NSDate *)[v6 copy];
    nextFireDate = self->_nextFireDate;
    self->_nextFireDate = v7;

    id v9 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = self->_nextFireDate;
      *(_DWORD *)id v24 = 138412290;
      id v25 = (const char *)v10;
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Set _nextFireDate to [%@]", v24, 0xCu);
    }

    uint64_t v11 = [*((id *)v19 + 5) dateBySubtractingCalSimulatedOffset];
    v12 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (const char *)*((void *)v19 + 5);
      *(_DWORD *)id v24 = 138412546;
      id v25 = v13;
      __int16 v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, "Adjusted fire date from [%@] to [%@]", v24, 0x16u);
    }

    [(_EKAlarmEngine *)self _installTimerWithFireDate:v11];
  }
  else
  {
    uint64_t v11 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v24 = 136315394;
      id v25 = "-[_EKAlarmEngine _rescheduleTimer]";
      __int16 v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "%s - refire date was nil and a new timer won't be scheduled, context was %@", v24, 0x16u);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)_installTimerWithFireDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Installing timer with fire date: [%@]", (uint8_t *)&v13, 0xCu);
  }

  [v3 timeIntervalSinceNow];
  unint64_t v6 = (unint64_t)((ceil(v5) + (double)time(0)) * 1000000000.0);
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v7, (const char *)*MEMORY[0x263F300A8], v6);
  xpc_dictionary_set_date(v7, "com.apple.calaccessd.alarmEngine.alarm.context.date", v6);
  xpc_set_event();
  if (_installTimerWithFireDate__onceToken != -1) {
    dispatch_once(&_installTimerWithFireDate__onceToken, &__block_literal_global_60);
  }
  id v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(v6 / 0x3B9ACA00)];
  id v9 = [(id)_installTimerWithFireDate__dateFormatter stringFromDate:v8];
  uint64_t v10 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Formatted scheduled alarm trigger date: %@.", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v11 = (void *)MEMORY[0x223C89120](v7);
  v12 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = v11;
    _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, "Scheduled XPC alarm event: %s.", (uint8_t *)&v13, 0xCu);
  }

  free(v11);
}

- (void)_notifyAlarmsFired:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __37___EKAlarmEngine__notifyAlarmsFired___block_invoke;
    v5[3] = &unk_2645C0DC0;
    id v6 = v4;
    xpc_object_t v7 = self;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

- (void)_timerFired
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = (void *)os_transaction_create();
  id v4 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Timer Fired.", buf, 2u);
  }

  double v5 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
  id v6 = [v5 dateByAddingTimeInterval:30.0];

  xpc_object_t v7 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
  id v8 = [v7 dateByAddingTimeInterval:-60.0];
  if ([v8 CalIsAfterDate:self->_nextFireDate])
  {
    objc_storeStrong((id *)&self->_nextFireDate, v8);
    id v9 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Fire date suspiciously old. Resetting to one minute before now.", buf, 2u);
    }
  }
  uint64_t v10 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    nextFireDate = self->_nextFireDate;
    *(_DWORD *)buf = 138412546;
    id v21 = nextFireDate;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Looking for alarms between %@ and %@", buf, 0x16u);
  }

  v12 = +[EKSideTableContext sideTableContext];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __29___EKAlarmEngine__timerFired__block_invoke;
  v16[3] = &unk_2645C0E60;
  id v17 = v12;
  id v18 = self;
  id v19 = v6;
  id v13 = v6;
  id v14 = v12;
  [v14 performBlockAndWait:v16];
  uint64_t v15 = self->_nextFireDate;
  self->_nextFireDate = 0;

  [(_EKAlarmEngine *)self _rescheduleTimer];
}

- (id)_alertInfoAlarmIDFromSideAlarm:(id)a3
{
  id v3 = a3;
  id v4 = [v3 externalID];

  if (v4)
  {
    double v5 = [v3 externalID];
  }
  else
  {
    id v6 = NSString;
    xpc_object_t v7 = [v3 alarmID];

    double v5 = objc_msgSend(v6, "stringWithFormat:", @"%d", objc_msgSend(v7, "intValue"));
    id v3 = v7;
  }

  return v5;
}

- (id)_alertInfoAlarmIDFromEKAlarm:(id)a3
{
  id v3 = a3;
  id v4 = [v3 externalID];

  if (v4)
  {
    double v5 = [v3 externalID];
  }
  else
  {
    id v6 = NSString;
    xpc_object_t v7 = [v3 objectID];

    double v5 = objc_msgSend(v6, "stringWithFormat:", @"%d", objc_msgSend(v7, "rowID"));
    id v3 = v7;
  }

  return v5;
}

- (BOOL)_isAlarmAcknowledgedWithAcknowledgedDate:(id)a3 fireDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
      [v5 timeIntervalSinceDate:v6];
      if (v7 < 0.0) {
        double v7 = -v7;
      }
      BOOL v8 = v7 < 300.0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = v5 != 0;
  }

  return v8;
}

- (void)_resetSyncTimer
{
  syncTimer = self->_syncTimer;
  if (syncTimer)
  {
    id v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:240.0];
    -[NSTimer setFireDate:](syncTimer, "setFireDate:");
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263EFFA20]);
    id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:240.0];
    id v6 = (NSTimer *)[v4 initWithFireDate:v5 interval:self target:sel__syncTimerFired_ selector:0 userInfo:0 repeats:0.0];
    double v7 = self->_syncTimer;
    self->_syncTimer = v6;

    id v8 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v8 addTimer:self->_syncTimer forMode:*MEMORY[0x263EFF588]];
  }
}

- (void)_killSyncTimer
{
  [(NSTimer *)self->_syncTimer invalidate];
  syncTimer = self->_syncTimer;
  self->_syncTimer = 0;
}

- (void)_syncTimerFired:(id)a3
{
  id v4 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Sync timer fired.", v5, 2u);
  }

  [(_EKAlarmEngine *)self _syncDidEnd];
}

- (void)_syncDidStart
{
  id v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Sync started. Suppressing updates while it runs.", v4, 2u);
  }

  [(_EKAlarmEngine *)self _resetSyncTimer];
}

- (void)_syncDidEnd
{
  id v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Sync done.", v4, 2u);
  }

  [(_EKAlarmEngine *)self _killSyncTimer];
  if (self->_pendingChanges)
  {
    self->_pendingChanges = 0;
    [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:self->_shouldUpdateWithForceForAlarmTable];
  }
}

- (void)_timeDidChangeSignificantly
{
  id v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Significant time change.", buf, 2u);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45___EKAlarmEngine__timeDidChangeSignificantly__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:0];
}

- (void)_calendarNotificationSettingChanged
{
  id v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Per-calendar notification suppression setting changed.", v4, 2u);
  }

  [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:1];
}

- (void)_globalAlarmPreferencesChanged
{
  id v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "_globalAlarmPreferencesChanged called", v4, 2u);
  }

  [(_EKAlarmEngine *)self _updateWithForceForAlarmTable:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedEventStorePurger, 0);
  objc_storeStrong((id *)&self->_tomorrow, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_syncTimer, 0);
  objc_storeStrong((id *)&self->_populateStart, 0);
  objc_storeStrong((id *)&self->_lastCheckpoint, 0);
  objc_storeStrong((id *)&self->_nextFireDate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_lastDBSequenceToken, 0);
}

- (void)_storeAlarms:(uint64_t)a3 nextScheduleLimit:(uint64_t)a4 eventStore:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end