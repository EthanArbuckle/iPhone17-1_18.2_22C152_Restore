@interface PMCoreSmartPowerNapPredictor
+ (id)sharedInstance;
- (BOOL)feature_enabled;
- (BOOL)in_coresmartpowernap;
- (BOOL)motion_alarm_set;
- (BOOL)readStateFromDefaults;
- (BOOL)session_interrupted;
- (BOOL)session_logged;
- (BPSSink)sink;
- (CMMotionAlarmManager)motion_alarm_manager;
- (NSDate)current_session_start_time;
- (NSDate)full_session_end_time;
- (NSDate)full_session_start_time;
- (NSDate)inactivity_end;
- (NSDate)inactivity_start;
- (NSDate)predicted_end_time;
- (NSString)last_session_end_reason;
- (NSString)session_end_reason;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)end_session_timer;
- (OS_dispatch_source)evaluation_timer;
- (OS_dispatch_source)requery_timer;
- (PMCoreSmartPowerNapLocationMonitor)location_monitor;
- (PMCoreSmartPowerNapPredictor)initWithQueue:(id)a3;
- (TRIClient)trial_client;
- (TRIExperimentIdentifiers)current_experiment_ids;
- (_OSInactivityPredictionClient)inactivity_predictor;
- (_OSInactivityPredictorOutput)predictor_output;
- (double)delta_to_query;
- (id)CAEventForEngagedSessionWhereUserInterrupted:(BOOL)a3;
- (id)CAEventForInactivityTooShortToQueryModel;
- (id)CAEventForModelHesitancy;
- (id)convertTimeToNumberFromDate:(id)a3;
- (id)getCustomizedDayOfWeekFromDate:(id)a3;
- (id)parseDeviceUsageFrequencyFromDiagnosis;
- (id)readEndTimeFromDefaults;
- (id)readStartTimeFromDefaults;
- (id)sleepTimeBucketOfDate:(id)a3 AtResolution:(unint64_t)a4;
- (int)motion_alarm_start_before;
- (int)motion_alarm_threshold;
- (int)requery_delta;
- (unint64_t)user_inactive;
- (void)alarmDidFire:(id)a3 error:(id)a4;
- (void)alarmDidRegister:(id)a3 error:(id)a4;
- (void)alarmDidUnregister:(id)a3 error:(id)a4;
- (void)armQueryTimer;
- (void)cancelModelQuery;
- (void)cancelModelRequery;
- (void)enterCoreSmartPowerNap;
- (void)evaluateCoreSmartPowerNap:(BOOL)a3;
- (void)evaluateInterruption:(BOOL)a3;
- (void)exitCoreSmartPowerNapWithReason:(id)a3;
- (void)handlePredictedEndTimer;
- (void)handleRemoteDeviceIsNear;
- (void)handleUserInterruption:(BOOL)a3;
- (void)initMobileTimerMonitor;
- (void)initMotionAlarm;
- (void)initializePredictor;
- (void)initializeTrialClient;
- (void)logEndOfSessionWithReason:(id)a3;
- (void)logNotEngaging;
- (void)postCSPNDarwinNotification:(unint64_t)a3;
- (void)queryModelAndEngage;
- (void)registerMotionAlarm;
- (void)restoreState;
- (void)saveState:(BOOL)a3 withEndTime:(id)a4;
- (void)scheduleModelRequeryWithOutputReason:(int64_t)a3;
- (void)setCurrent_experiment_ids:(id)a3;
- (void)setCurrent_session_start_time:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDelta_to_query:(double)a3;
- (void)setEnd_session_timer:(id)a3;
- (void)setEvaluation_timer:(id)a3;
- (void)setFeature_enabled:(BOOL)a3;
- (void)setFull_session_end_time:(id)a3;
- (void)setFull_session_start_time:(id)a3;
- (void)setIn_coresmartpowernap:(BOOL)a3;
- (void)setInactivity_end:(id)a3;
- (void)setInactivity_predictor:(id)a3;
- (void)setInactivity_start:(id)a3;
- (void)setLast_session_end_reason:(id)a3;
- (void)setLocation_monitor:(id)a3;
- (void)setMotion_alarm_manager:(id)a3;
- (void)setMotion_alarm_set:(BOOL)a3;
- (void)setMotion_alarm_start_before:(int)a3;
- (void)setMotion_alarm_threshold:(int)a3;
- (void)setPredicted_end_time:(id)a3;
- (void)setPredictor_output:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequery_delta:(int)a3;
- (void)setRequery_timer:(id)a3;
- (void)setSession_end_reason:(id)a3;
- (void)setSession_interrupted:(BOOL)a3;
- (void)setSession_logged:(BOOL)a3;
- (void)setSink:(id)a3;
- (void)setTrial_client:(id)a3;
- (void)setUser_inactive:(unint64_t)a3;
- (void)unregisterMotionAlarm;
- (void)updateInactiveState:(unint64_t)a3;
- (void)updateMotionAlarmStartThreshold:(unsigned int)a3;
- (void)updateMotionAlarmThreshold:(unsigned int)a3;
- (void)updateMotionState:(BOOL)a3;
- (void)updateQueryDelta:(unsigned int)a3;
- (void)updateRequeryDelta:(unsigned int)a3;
- (void)updateTrialFactors;
@end

@implementation PMCoreSmartPowerNapPredictor

+ (id)sharedInstance
{
  if (qword_1000A4798 != -1) {
    dispatch_once(&qword_1000A4798, &stru_100091AE0);
  }
  if (byte_1000A4794)
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1000A4788 != -1) {
      dispatch_once(&qword_1000A4788, &stru_100091AA0);
    }
    id v2 = (id)qword_1000A4780;
  }

  return v2;
}

- (PMCoreSmartPowerNapPredictor)initWithQueue:(id)a3
{
  id v4 = a3;
  if (qword_1000A4798 != -1) {
    dispatch_once(&qword_1000A4798, &stru_100091AE0);
  }
  if ((byte_1000A4794 & 1) != 0
    || (v27.receiver = self,
        v27.super_class = (Class)PMCoreSmartPowerNapPredictor,
        v5 = [(PMCoreSmartPowerNapPredictor *)&v27 init],
        (self = v5) == 0))
  {
    v9 = 0;
  }
  else
  {
    [(PMCoreSmartPowerNapPredictor *)v5 setIn_coresmartpowernap:0];
    [(PMCoreSmartPowerNapPredictor *)self setSession_interrupted:0];
    [(PMCoreSmartPowerNapPredictor *)self setRequery_delta:450];
    [(PMCoreSmartPowerNapPredictor *)self setDelta_to_query:*(double *)&qword_1000A2E70];
    [(PMCoreSmartPowerNapPredictor *)self setFeature_enabled:_os_feature_enabled_impl()];
    [(PMCoreSmartPowerNapPredictor *)self setQueue:v4];
    [(PMCoreSmartPowerNapPredictor *)self setSession_logged:0];
    id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.powerd.coresmartpowernap.state"];
    [(PMCoreSmartPowerNapPredictor *)self setDefaults:v6];

    if ([(PMCoreSmartPowerNapPredictor *)self feature_enabled])
    {
      if (MKBDeviceUnlockedSinceBoot())
      {
        [(PMCoreSmartPowerNapPredictor *)self initializePredictor];
        v7 = [(PMCoreSmartPowerNapPredictor *)self queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001BC38;
        block[3] = &unk_1000911E8;
        v26 = self;
        dispatch_async(v7, block);

        v8 = v26;
      }
      else
      {
        v11 = qword_1000A36C8;
        if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Device hasn't been unlocked since first boot", buf, 2u);
        }
        *(_DWORD *)buf = 0;
        v12 = [(PMCoreSmartPowerNapPredictor *)self queue];
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10001BC40;
        handler[3] = &unk_1000911C0;
        v23 = self;
        notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", (int *)buf, v12, handler);

        v8 = v23;
      }
    }
    else
    {
      v10 = qword_1000A36C8;
      if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Feature is disabled.", buf, 2u);
      }
    }
    if (&_DMIsMigrationNeeded && (DMIsMigrationNeeded() & 1) != 0)
    {
      v13 = qword_1000A36C8;
      if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Defering Trial initializing due to pending data migration", buf, 2u);
      }
      dispatch_time_t v14 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 300000000000);
      v15 = [(PMCoreSmartPowerNapPredictor *)self queue];
      v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      v19 = sub_10001BD4C;
      v20 = &unk_1000911E8;
      v21 = self;
      dispatch_after(v14, v15, &v17);
    }
    else
    {
      [(PMCoreSmartPowerNapPredictor *)self initializeTrialClient];
    }
    [(PMCoreSmartPowerNapPredictor *)self initMotionAlarm];
    [(PMCoreSmartPowerNapPredictor *)self initMobileTimerMonitor];
    self = self;
    v9 = self;
  }

  return v9;
}

- (void)initializePredictor
{
  sub_10001BE20();
  if (objc_opt_class())
  {
    id v3 = objc_alloc_init((Class)sub_10001BE20());
    [(PMCoreSmartPowerNapPredictor *)self setInactivity_predictor:v3];

    if (_os_feature_enabled_impl())
    {
      id v4 = [PMCoreSmartPowerNapLocationMonitor alloc];
      id v6 = [(PMCoreSmartPowerNapPredictor *)self queue];
      v5 = [(PMCoreSmartPowerNapLocationMonitor *)v4 initWithQueue:v6];
      [(PMCoreSmartPowerNapPredictor *)self setLocation_monitor:v5];
    }
  }
}

- (void)restoreState
{
  if ([(PMCoreSmartPowerNapPredictor *)self readStateFromDefaults])
  {
    [(PMCoreSmartPowerNapPredictor *)self setIn_coresmartpowernap:1];
    id v3 = [(PMCoreSmartPowerNapPredictor *)self readStartTimeFromDefaults];
    [(PMCoreSmartPowerNapPredictor *)self setFull_session_start_time:v3];

    id v4 = [(PMCoreSmartPowerNapPredictor *)self readEndTimeFromDefaults];
    if (v4)
    {
      [(PMCoreSmartPowerNapPredictor *)self setPredicted_end_time:v4];
      v5 = +[NSDate date];
      id v6 = [(PMCoreSmartPowerNapPredictor *)self predicted_end_time];
      id v7 = [v5 compare:v6];

      if (v7 == (id)1)
      {
        v8 = qword_1000A36C8;
        if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Past the predicted end.", buf, 2u);
        }
        [(PMCoreSmartPowerNapPredictor *)self handlePredictedEndTimer];
      }
      else
      {
        v9 = [(PMCoreSmartPowerNapPredictor *)self predicted_end_time];
        [v9 timeIntervalSinceDate:v5];
        double v11 = v10;

        v12 = [(PMCoreSmartPowerNapPredictor *)self end_session_timer];

        if (v12)
        {
          v13 = [(PMCoreSmartPowerNapPredictor *)self end_session_timer];
          dispatch_suspend(v13);
        }
        else
        {
          dispatch_time_t v14 = [(PMCoreSmartPowerNapPredictor *)self queue];
          dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);
          [(PMCoreSmartPowerNapPredictor *)self setEnd_session_timer:v15];

          v16 = [(PMCoreSmartPowerNapPredictor *)self end_session_timer];
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_10001C280;
          handler[3] = &unk_1000911E8;
          void handler[4] = self;
          dispatch_source_set_event_handler(v16, handler);

          v13 = [(PMCoreSmartPowerNapPredictor *)self end_session_timer];
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10001C288;
          v24[3] = &unk_1000911E8;
          v24[4] = self;
          dispatch_source_set_cancel_handler(v13, v24);
        }

        v17 = [(PMCoreSmartPowerNapPredictor *)self end_session_timer];
        dispatch_time_t v18 = dispatch_walltime(0, (uint64_t)(v11 * 1000000000.0));
        dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0);

        v19 = [(PMCoreSmartPowerNapPredictor *)self end_session_timer];
        dispatch_resume(v19);

        [(PMCoreSmartPowerNapPredictor *)self updateNextFireTime:v11];
      }
    }
  }
  if ([(PMCoreSmartPowerNapPredictor *)self in_coresmartpowernap])
  {
    v20 = +[PMCoreSmartPowerNapService sharedInstance];
    [v20 updateState:1];
  }
  dispatch_time_t v21 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  v22 = [(PMCoreSmartPowerNapPredictor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C294;
  block[3] = &unk_1000911E8;
  void block[4] = self;
  dispatch_after(v21, v22, block);
}

- (void)saveState:(BOOL)a3 withEndTime:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PMCoreSmartPowerNapPredictor *)self defaults];
  v8 = v7;
  if (v4)
  {
    [v7 setBool:1 forKey:@"state"];

    v9 = [(PMCoreSmartPowerNapPredictor *)self defaults];
    double v10 = [(PMCoreSmartPowerNapPredictor *)self full_session_start_time];
    [v9 setObject:v10 forKey:@"startTime"];

    double v11 = [(PMCoreSmartPowerNapPredictor *)self defaults];
    [v11 setObject:v6 forKey:@"predictedEndTime"];
  }
  else
  {
    [v7 removeObjectForKey:@"predictedEndTime"];

    v12 = [(PMCoreSmartPowerNapPredictor *)self defaults];
    [v12 removeObjectForKey:@"startTime"];

    double v11 = [(PMCoreSmartPowerNapPredictor *)self defaults];
    [v11 setBool:0 forKey:@"state"];
  }

  v13 = [(PMCoreSmartPowerNapPredictor *)self defaults];
  [v13 synchronize];

  dispatch_time_t v14 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: saved state %d with end time %@", (uint8_t *)v15, 0x12u);
  }
}

- (BOOL)readStateFromDefaults
{
  id v3 = [(PMCoreSmartPowerNapPredictor *)self defaults];
  [v3 synchronize];

  BOOL v4 = [(PMCoreSmartPowerNapPredictor *)self defaults];
  v5 = [v4 valueForKey:@"state"];

  id v6 = qword_1000A36C8;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = v6;
      v11[0] = 67109120;
      v11[1] = [v5 BOOLValue];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Read defaults state=%d", (uint8_t *)v11, 8u);
    }
    unsigned __int8 v9 = [v5 BOOLValue];
  }
  else
  {
    if (v7)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: No previous defaults state saved", (uint8_t *)v11, 2u);
    }
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)readStartTimeFromDefaults
{
  id v2 = [(PMCoreSmartPowerNapPredictor *)self defaults];
  id v3 = [v2 objectForKey:@"startTime"];

  BOOL v4 = qword_1000A36C8;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      unsigned __int8 v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Read defaults start time: %@", (uint8_t *)&v8, 0xCu);
    }
    id v6 = v3;
  }
  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: No previous start time found", (uint8_t *)&v8, 2u);
  }

  return v3;
}

- (id)readEndTimeFromDefaults
{
  id v2 = [(PMCoreSmartPowerNapPredictor *)self defaults];
  id v3 = [v2 objectForKey:@"predictedEndTime"];

  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    BOOL v5 = [v4 stringFromDate:v3];
    id v6 = qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      double v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Read defaults date=%{public}@\n", (uint8_t *)&v10, 0xCu);
    }
    id v7 = v3;
  }
  else
  {
    int v8 = qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: No previous end time found", (uint8_t *)&v10, 2u);
    }
  }

  return v3;
}

- (void)evaluateInterruption:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PMCoreSmartPowerNapPredictor *)self in_coresmartpowernap])
  {
    if (v3)
    {
      [(PMCoreSmartPowerNapPredictor *)self setSession_interrupted:1];
      BOOL v5 = qword_1000A36C8;
      if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Session Interruption started - now active/unlocked.", buf, 2u);
      }
    }
  }
  if ([(PMCoreSmartPowerNapPredictor *)self session_interrupted] && !v3)
  {
    [(PMCoreSmartPowerNapPredictor *)self setSession_interrupted:0];
    id v6 = qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Session Interruption ended - now inactive/locked.", v7, 2u);
    }
  }
}

- (void)armQueryTimer
{
  BOOL v3 = [(PMCoreSmartPowerNapPredictor *)self evaluation_timer];

  if (v3)
  {
    id v4 = [(PMCoreSmartPowerNapPredictor *)self evaluation_timer];
    dispatch_suspend(v4);
  }
  else
  {
    BOOL v5 = [(PMCoreSmartPowerNapPredictor *)self queue];
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
    [(PMCoreSmartPowerNapPredictor *)self setEvaluation_timer:v6];

    id v7 = [(PMCoreSmartPowerNapPredictor *)self evaluation_timer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001CB60;
    handler[3] = &unk_1000911E8;
    void handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    id v4 = [(PMCoreSmartPowerNapPredictor *)self evaluation_timer];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001CC38;
    v14[3] = &unk_1000911E8;
    v14[4] = self;
    dispatch_source_set_cancel_handler(v4, v14);
  }

  int v8 = [(PMCoreSmartPowerNapPredictor *)self inactivity_predictor];

  if (v8)
  {
    unsigned __int8 v9 = (void *)qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEBUG)) {
      sub_100065AA0(v9, self);
    }
    int v10 = [(PMCoreSmartPowerNapPredictor *)self evaluation_timer];
    [(PMCoreSmartPowerNapPredictor *)self delta_to_query];
    dispatch_time_t v12 = dispatch_walltime(0, 1000000000 * (int)v11);
    dispatch_source_set_timer(v10, v12, 0xFFFFFFFFFFFFFFFFLL, 0);

    v13 = [(PMCoreSmartPowerNapPredictor *)self evaluation_timer];
    dispatch_resume(v13);

    [(PMCoreSmartPowerNapPredictor *)self delta_to_query];
    -[PMCoreSmartPowerNapPredictor updateNextFireTime:](self, "updateNextFireTime:");
  }
}

- (void)evaluateCoreSmartPowerNap:(BOOL)a3
{
  if ([(PMCoreSmartPowerNapPredictor *)self feature_enabled]
    && ([(PMCoreSmartPowerNapPredictor *)self inactivity_predictor],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if ([(PMCoreSmartPowerNapPredictor *)self user_inactive])
    {
      unsigned int v6 = [(PMCoreSmartPowerNapPredictor *)self in_coresmartpowernap];
      id v7 = qword_1000A36C8;
      BOOL v8 = os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEBUG);
      if (!v6)
      {
        if (v8)
        {
          sub_100065BD8(a3, v7);
          if (a3) {
            return;
          }
        }
        else if (a3)
        {
          return;
        }
        unsigned __int8 v9 = +[NSDate date];
        [(PMCoreSmartPowerNapPredictor *)self setInactivity_start:v9];

        [(PMCoreSmartPowerNapPredictor *)self armQueryTimer];
        return;
      }
      if (v8) {
        sub_100065BA4();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEBUG))
    {
      sub_100065B70();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR))
  {
    sub_100065B3C();
  }
}

- (void)queryModelAndEngage
{
  BOOL v3 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: queryModelAndEngage", buf, 2u);
  }
  id v4 = [(PMCoreSmartPowerNapPredictor *)self location_monitor];

  if (v4)
  {
    BOOL v5 = [(PMCoreSmartPowerNapPredictor *)self location_monitor];
    unsigned __int8 v6 = [v5 areAllRemoteDevicesAway];
  }
  else
  {
    unsigned __int8 v6 = 1;
  }
  [(PMCoreSmartPowerNapPredictor *)self raiseAssertionForEvaluation];
  id v7 = [(PMCoreSmartPowerNapPredictor *)self inactivity_predictor];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001CE9C;
  v8[3] = &unk_100091330;
  v8[4] = self;
  unsigned __int8 v9 = v6;
  [v7 longInactivityPredictionResultWithOptions:0 withHandler:v8];

  [(PMCoreSmartPowerNapPredictor *)self releaseAssertion];
}

- (void)enterCoreSmartPowerNap
{
  BOOL v3 = +[NSDate date];
  [(PMCoreSmartPowerNapPredictor *)self setCurrent_session_start_time:v3];

  [(PMCoreSmartPowerNapPredictor *)self setIn_coresmartpowernap:1];
  id v4 = +[PMCoreSmartPowerNapService sharedInstance];
  [v4 enterCoreSmartPowerNap];

  [(PMCoreSmartPowerNapPredictor *)self cancelModelRequery];
  [(PMCoreSmartPowerNapPredictor *)self setSession_end_reason:0];
  [(PMCoreSmartPowerNapPredictor *)self postCSPNDarwinNotification:2];
  BOOL v5 = [(PMCoreSmartPowerNapPredictor *)self predicted_end_time];
  [(PMCoreSmartPowerNapPredictor *)self saveState:1 withEndTime:v5];

  unsigned __int8 v6 = [(PMCoreSmartPowerNapPredictor *)self full_session_start_time];
  id v7 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
  [v7 predictedDuration];
  unsigned __int8 v9 = [v6 dateByAddingTimeInterval:v8 * 3600.0];

  int v10 = objc_msgSend(v9, "dateByAddingTimeInterval:", (double)--[PMCoreSmartPowerNapPredictor motion_alarm_start_before](self, "motion_alarm_start_before"));
  double v11 = +[NSDate date];
  [v10 timeIntervalSinceDate:v11];
  unint64_t v13 = (unint64_t)v12;

  dispatch_time_t v14 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting a timer to fire after %llu seconds to register for motion alarm", buf, 0xCu);
  }
  dispatch_time_t v15 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000 * v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D62C;
  block[3] = &unk_1000911E8;
  void block[4] = self;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
  __int16 v16 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEBUG)) {
    sub_100065CC0(v16);
  }
  PLLogRegisteredEvent();
}

- (void)exitCoreSmartPowerNapWithReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSDate date];
  [(PMCoreSmartPowerNapPredictor *)self setFull_session_end_time:v5];

  [(PMCoreSmartPowerNapPredictor *)self setIn_coresmartpowernap:0];
  unsigned __int8 v6 = +[PMCoreSmartPowerNapService sharedInstance];
  [v6 exitCoreSmartPowerNap];

  [(PMCoreSmartPowerNapPredictor *)self setSession_end_reason:v4];
  [(PMCoreSmartPowerNapPredictor *)self setLast_session_end_reason:v4];
  id v7 = (void *)qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = v7;
    unsigned __int8 v9 = [(PMCoreSmartPowerNapPredictor *)self full_session_start_time];
    int v10 = [(PMCoreSmartPowerNapPredictor *)self full_session_end_time];
    double v11 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
    id v12 = [v11 confidenceLevel];
    unint64_t v13 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
    [v13 confidenceValue];
    uint64_t v15 = v14;
    __int16 v16 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
    [v16 predictedDuration];
    uint64_t v18 = v17;
    unint64_t v19 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
    *(_DWORD *)buf = 138413826;
    objc_super v27 = v9;
    __int16 v28 = 2112;
    v29 = v10;
    __int16 v30 = 2112;
    id v31 = v4;
    __int16 v32 = 2048;
    id v33 = v12;
    __int16 v34 = 2048;
    uint64_t v35 = v15;
    __int16 v36 = 2048;
    uint64_t v37 = v18;
    __int16 v38 = 1024;
    unsigned int v39 = [v19 outputReason];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap session end: start %@ end %@ reason %@, predicted confidence level %ld, confidence value %lf, predicted duration %lf, outputReason %d", buf, 0x44u);
  }
  [(PMCoreSmartPowerNapPredictor *)self postCSPNDarwinNotification:0];
  [(PMCoreSmartPowerNapPredictor *)self saveState:0 withEndTime:0];
  [(PMCoreSmartPowerNapPredictor *)self unregisterMotionAlarm];
  unsigned __int8 v20 = [v4 isEqualToString:@"PredictedEndOfSession"];
  unsigned __int8 v21 = 0;
  if ((v20 & 1) == 0)
  {
    if ([v4 isEqualToString:@"UserInterrupted"])
    {
      unsigned __int8 v21 = 1;
    }
    else if ([v4 isEqualToString:@"RemoteDeviceIsNear"])
    {
      unsigned __int8 v21 = 2;
    }
    else if ([v4 isEqualToString:@"MotionDetected"])
    {
      unsigned __int8 v21 = 3;
    }
    else if ([v4 isEqualToString:@"MobileTimerFired"])
    {
      unsigned __int8 v21 = 5;
    }
    else
    {
      unsigned __int8 v21 = 4;
    }
  }
  v22 = +[NSNumber numberWithUnsignedChar:v21, @"eventType", @"reason", &off_10009A530];
  v25[1] = v22;
  v23 = +[NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:2];

  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEBUG)) {
    sub_100065D44();
  }
  PLLogRegisteredEvent();
  [(PMCoreSmartPowerNapPredictor *)self logEndOfSessionWithReason:v4];
}

- (void)handlePredictedEndTimer
{
  if ([(PMCoreSmartPowerNapPredictor *)self in_coresmartpowernap])
  {
    BOOL v3 = [(PMCoreSmartPowerNapPredictor *)self full_session_start_time];

    if (!v3 && os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
      sub_100065DB8();
    }
    [(PMCoreSmartPowerNapPredictor *)self exitCoreSmartPowerNapWithReason:@"PredictedEndOfSession"];
  }
  else
  {
    id v4 = qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Not in CoreSmartPowerNap at end of predicted inactivity", v5, 2u);
    }
  }
}

- (void)scheduleModelRequeryWithOutputReason:(int64_t)a3
{
  id v4 = [(PMCoreSmartPowerNapPredictor *)self requery_timer];

  if (v4)
  {
    BOOL v5 = [(PMCoreSmartPowerNapPredictor *)self requery_timer];
    dispatch_suspend(v5);
  }
  else
  {
    unsigned __int8 v6 = [(PMCoreSmartPowerNapPredictor *)self queue];
    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
    [(PMCoreSmartPowerNapPredictor *)self setRequery_timer:v7];

    double v8 = [(PMCoreSmartPowerNapPredictor *)self requery_timer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001DD78;
    handler[3] = &unk_1000911E8;
    void handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    BOOL v5 = [(PMCoreSmartPowerNapPredictor *)self requery_timer];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    _DWORD v15[2] = sub_10001DDC4;
    v15[3] = &unk_1000911E8;
    v15[4] = self;
    dispatch_source_set_cancel_handler(v5, v15);
  }

  if ([(PMCoreSmartPowerNapPredictor *)self requery_delta] <= 3599) {
    [(PMCoreSmartPowerNapPredictor *)self setRequery_delta:2 * [(PMCoreSmartPowerNapPredictor *)self requery_delta]];
  }
  unsigned __int8 v9 = (void *)qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = v9;
    unsigned int v11 = [(PMCoreSmartPowerNapPredictor *)self requery_delta];
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Setting timer to re query in %u seconds", buf, 8u);
  }
  id v12 = [(PMCoreSmartPowerNapPredictor *)self requery_timer];
  dispatch_time_t v13 = dispatch_walltime(0, 1000000000 * [(PMCoreSmartPowerNapPredictor *)self requery_delta]);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);

  uint64_t v14 = [(PMCoreSmartPowerNapPredictor *)self requery_timer];
  dispatch_resume(v14);

  [(PMCoreSmartPowerNapPredictor *)self updateNextFireTime:(double)[(PMCoreSmartPowerNapPredictor *)self requery_delta]];
}

- (void)cancelModelQuery
{
  BOOL v3 = [(PMCoreSmartPowerNapPredictor *)self evaluation_timer];

  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEBUG)) {
      sub_100065DEC();
    }
    id v4 = [(PMCoreSmartPowerNapPredictor *)self evaluation_timer];
    dispatch_source_cancel(v4);
  }
}

- (void)cancelModelRequery
{
  BOOL v3 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Cancelling timer to re query model", v6, 2u);
  }
  id v4 = [(PMCoreSmartPowerNapPredictor *)self requery_timer];

  if (v4)
  {
    BOOL v5 = [(PMCoreSmartPowerNapPredictor *)self requery_timer];
    dispatch_source_cancel(v5);
  }
}

- (void)handleRemoteDeviceIsNear
{
  BOOL v3 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: remote device is near. Exit CoreSmartPowerNap", v4, 2u);
  }
  if ([(PMCoreSmartPowerNapPredictor *)self in_coresmartpowernap]) {
    [(PMCoreSmartPowerNapPredictor *)self exitCoreSmartPowerNapWithReason:@"RemoteDeviceIsNear"];
  }
}

- (void)updateInactiveState:(unint64_t)a3
{
  if ([(PMCoreSmartPowerNapPredictor *)self user_inactive] != a3)
  {
    [(PMCoreSmartPowerNapPredictor *)self setUser_inactive:a3];
    BOOL v5 = qword_1000A36C8;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT);
    if (a3 == 1)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        dispatch_source_t v7 = "Device is locked/inactive";
        double v8 = buf;
        goto LABEL_7;
      }
    }
    else if (v6)
    {
      LOWORD(v10) = 0;
      dispatch_source_t v7 = "Device is unlocked/active";
      double v8 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
    BOOL v9 = a3 != 1;
    -[PMCoreSmartPowerNapPredictor handleUserInterruption:](self, "handleUserInterruption:", v9, v10);
    [(PMCoreSmartPowerNapPredictor *)self evaluateCoreSmartPowerNap:v9];
  }
}

- (void)initMobileTimerMonitor
{
  sub_10001E2A4();
  if (objc_opt_class())
  {
    sub_10001E2A4();
    BOOL v3 = [(id)objc_opt_class() alarmStream];
    sub_10001E388();
    if (objc_opt_class())
    {
      id v4 = objc_alloc((Class)sub_10001E388());
      BOOL v5 = [(PMCoreSmartPowerNapPredictor *)self queue];
      id v6 = [v4 initWithIdentifier:@"com.apple.powerd.cspn.biomeAlarm" targetQueue:v5 waking:1];

      dispatch_source_t v7 = [v3 publisher];
      double v8 = [v7 filterWithKeyPath:@"eventBody.eventType" value:&off_10009A548];

      objc_initWeak(location, self);
      BOOL v9 = [v8 subscribeOn:v6];
      id v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      uint64_t v14 = sub_10001E4BC;
      uint64_t v15 = &unk_1000913C0;
      objc_copyWeak(&v17, location);
      __int16 v16 = self;
      uint64_t v10 = [v9 sinkWithCompletion:&stru_100091AC0 receiveInput:&v12];

      -[PMCoreSmartPowerNapPredictor setSink:](self, "setSink:", v10, v12, v13, v14, v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(location);

      unsigned int v11 = qword_1000A36C8;
      if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "registered for mobile timer updates", (uint8_t *)location, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
        sub_1000637F8();
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR))
  {
    sub_1000637F8();
  }
}

- (void)updateMotionState:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Motion state changed %d. Exiting CoreSmartPowerNap", (uint8_t *)v6, 8u);
  }
  if ([(PMCoreSmartPowerNapPredictor *)self in_coresmartpowernap]) {
    [(PMCoreSmartPowerNapPredictor *)self exitCoreSmartPowerNapWithReason:@"MotionDetected"];
  }
}

- (void)initMotionAlarm
{
  id v3 = [objc_alloc((Class)CMMotionAlarmManager) initWithName:@"com.apple.powerd.cspn"];
  [(PMCoreSmartPowerNapPredictor *)self setMotion_alarm_manager:v3];

  id v4 = [(PMCoreSmartPowerNapPredictor *)self motion_alarm_manager];
  [v4 setDelegate:self];

  [(PMCoreSmartPowerNapPredictor *)self setMotion_alarm_threshold:1800];
  [(PMCoreSmartPowerNapPredictor *)self setMotion_alarm_start_before:3600];

  [(PMCoreSmartPowerNapPredictor *)self setMotion_alarm_set:0];
}

- (void)registerMotionAlarm
{
  id v3 = [(PMCoreSmartPowerNapPredictor *)self motion_alarm_manager];
  id v6 = 0;
  unsigned __int8 v4 = objc_msgSend(v3, "registerAlarmWithName:type:duration:repeats:error:", @"CSPN motion alarm", 6, -[PMCoreSmartPowerNapPredictor motion_alarm_threshold](self, "motion_alarm_threshold"), 0, &v6);
  id v5 = v6;

  if ((v4 & 1) != 0 || !v5)
  {
    [(PMCoreSmartPowerNapPredictor *)self setMotion_alarm_set:1];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR))
  {
    sub_100065E20();
  }
}

- (void)unregisterMotionAlarm
{
  id v3 = [(PMCoreSmartPowerNapPredictor *)self motion_alarm_manager];
  id v6 = 0;
  unsigned __int8 v4 = [v3 unregisterAlarmWithName:@"CSPN motion alarm" error:&v6];
  id v5 = v6;

  if ((v4 & 1) != 0 || !v5)
  {
    [(PMCoreSmartPowerNapPredictor *)self setMotion_alarm_set:0];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR))
  {
    sub_100065E8C();
  }
}

- (void)alarmDidRegister:(id)a3 error:(id)a4
{
  unsigned __int8 v4 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: motion alarm did register", v5, 2u);
  }
}

- (void)alarmDidUnregister:(id)a3 error:(id)a4
{
  unsigned __int8 v4 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: motion alarm did unregister", v5, 2u);
  }
}

- (void)alarmDidFire:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: motion alarm did fire alarm %@, error %@", buf, 0x16u);
  }
  id v11 = 0;
  [v6 acknowledgeWithError:&v11];
  id v9 = v11;
  uint64_t v10 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: Motion detected", buf, 2u);
  }
  [(PMCoreSmartPowerNapPredictor *)self updateMotionState:1];
}

- (void)handleUserInterruption:(BOOL)a3
{
  if (a3)
  {
    [(PMCoreSmartPowerNapPredictor *)self evaluateInterruption:1];
    unsigned __int8 v4 = +[NSDate date];
    [(PMCoreSmartPowerNapPredictor *)self setInactivity_end:v4];

    [(PMCoreSmartPowerNapPredictor *)self cancelModelQuery];
    [(PMCoreSmartPowerNapPredictor *)self cancelModelRequery];
    if ([(PMCoreSmartPowerNapPredictor *)self in_coresmartpowernap])
    {
      id v5 = qword_1000A36C8;
      if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap: user interrupted. Exit CoreSmartPowerNap", buf, 2u);
      }
      [(PMCoreSmartPowerNapPredictor *)self exitCoreSmartPowerNapWithReason:@"UserInterrupted"];
      [(PMCoreSmartPowerNapPredictor *)self setSession_logged:1];
      [(PMCoreSmartPowerNapPredictor *)self setSession_end_reason:0];
    }
    else
    {
      uint64_t v6 = [(PMCoreSmartPowerNapPredictor *)self inactivity_start];
      if (v6)
      {
        id v11 = (id)v6;
        uint64_t v7 = [(PMCoreSmartPowerNapPredictor *)self inactivity_end];
        if (v7)
        {
          double v8 = (void *)v7;
          id v9 = [(PMCoreSmartPowerNapPredictor *)self last_session_end_reason];
          unsigned __int8 v10 = [v9 isEqualToString:@"MotionDetected"];

          if ((v10 & 1) == 0)
          {
            [(PMCoreSmartPowerNapPredictor *)self logNotEngaging];
          }
        }
        else
        {
        }
      }
    }
  }
  else
  {
    -[PMCoreSmartPowerNapPredictor evaluateInterruption:](self, "evaluateInterruption:");
  }
}

- (void)postCSPNDarwinNotification:(unint64_t)a3
{
  if (!notify_register_check("com.apple.powerd.coresmartpowernap", &dword_1000A4790))
  {
    notify_set_state(dword_1000A4790, a3);
    notify_post("com.apple.powerd.coresmartpowernap");
  }
}

- (void)logEndOfSessionWithReason:(id)a3
{
  uint64_t v5 = [(PMCoreSmartPowerNapPredictor *)self full_session_start_time];
  if (v5)
  {
    id v14 = (id)v5;
    uint64_t v6 = [(PMCoreSmartPowerNapPredictor *)self full_session_end_time];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      double v8 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];

      if (v8)
      {
        BOOL v10 = a3 == @"UserInterrupted" || a3 == @"MotionDetected";
        id v11 = [(PMCoreSmartPowerNapPredictor *)self CAEventForEngagedSessionWhereUserInterrupted:v10];
        id v12 = qword_1000A36C8;
        if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap end-of-session metrics %@", buf, 0xCu);
        }
        id v15 = v11;
        id v13 = v11;
        AnalyticsSendEventLazy();
      }
    }
    else
    {
    }
  }
}

- (void)logNotEngaging
{
  id v3 = [(PMCoreSmartPowerNapPredictor *)self inactivity_end];
  unsigned __int8 v4 = [(PMCoreSmartPowerNapPredictor *)self inactivity_start];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;
  [(PMCoreSmartPowerNapPredictor *)self delta_to_query];
  double v8 = v7;

  if (v6 <= v8)
  {
    id v9 = [(PMCoreSmartPowerNapPredictor *)self CAEventForInactivityTooShortToQueryModel];
    __int16 v16 = qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap session did not engage because inactivity was shorter than delta-to-query", buf, 2u);
    }
  }
  else
  {
    id v9 = [(PMCoreSmartPowerNapPredictor *)self CAEventForModelHesitancy];
    BOOL v10 = (void *)qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      id v12 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
      [v12 confidenceValue];
      uint64_t v14 = v13;
      id v15 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
      *(_DWORD *)buf = 134218240;
      uint64_t v20 = v14;
      __int16 v21 = 2048;
      id v22 = [v15 confidenceLevel];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CoreSmartPowerNap session did not engage model confidence: %lf:%ld", buf, 0x16u);
    }
  }
  unsigned int v18 = v9;
  id v17 = v9;
  AnalyticsSendEventLazy();
}

- (id)parseDeviceUsageFrequencyFromDiagnosis
{
  id v2 = [(PMCoreSmartPowerNapPredictor *)self inactivity_predictor];
  id v3 = [v2 deviceUsageDiagnosis];

  if ([v3 containsString:@"is NOT frequently"])
  {
    CFStringRef v4 = @"rare";
  }
  else if ([v3 containsString:@"is frequently"])
  {
    CFStringRef v4 = @"frequent";
  }
  else
  {
    CFStringRef v4 = @"unknown";
  }

  return (id)v4;
}

- (id)sleepTimeBucketOfDate:(id)a3 AtResolution:(unint64_t)a4
{
  id v5 = a3;
  double v6 = +[NSCalendar currentCalendar];
  double v7 = [v6 components:32 fromDate:v5];

  double v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((uint64_t)[v7 hour] + 4) % 24 / a4);

  return v8;
}

- (id)getCustomizedDayOfWeekFromDate:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = v3;
  if (v3)
  {
    id v5 = v3;
    double v6 = +[NSCalendar currentCalendar];
    double v7 = [v6 components:544 fromDate:v5];
    if ((uint64_t)[v7 hour] >= 21)
    {
      uint64_t v8 = [v5 dateByAddingTimeInterval:86400.0];

      uint64_t v9 = [v6 components:512 fromDate:v8];

      id v5 = (id)v8;
      double v7 = (void *)v9;
    }
    id v10 = [v7 weekday];
    if (v10 == (id)1) {
      uint64_t v11 = 7;
    }
    else {
      uint64_t v11 = (uint64_t)v10 - 1;
    }
    id v12 = +[NSNumber numberWithInteger:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)convertTimeToNumberFromDate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    CFStringRef v4 = +[NSCalendar currentCalendar];
    id v5 = [v4 components:96 fromDate:v3];

    id v6 = [v5 hour];
    *(float *)&double v7 = (float)((float)(uint64_t)[v5 minute] / 60.0) + (float)(uint64_t)v6;
    uint64_t v8 = +[NSNumber numberWithFloat:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)CAEventForEngagedSessionWhereUserInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PMCoreSmartPowerNapPredictor *)self inactivity_predictor];
  id v6 = [v5 modelMetadata];

  double v7 = [(PMCoreSmartPowerNapPredictor *)self full_session_end_time];
  uint64_t v8 = [(PMCoreSmartPowerNapPredictor *)self full_session_start_time];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  v55 = objc_opt_new();
  v65[0] = &off_10009A560;
  v64[0] = @"eventIsSessionInt";
  v64[1] = @"sessionDurationHrFloat";
  v60 = +[NSNumber numberWithDouble:v10 / 3600.0];
  v65[1] = v60;
  v64[2] = @"sessionStartTimeFloat";
  v59 = [(PMCoreSmartPowerNapPredictor *)self full_session_start_time];
  v58 = [(PMCoreSmartPowerNapPredictor *)self convertTimeToNumberFromDate:v59];
  v65[2] = v58;
  v64[3] = @"deviceUsageFrequencyStr";
  v57 = [(PMCoreSmartPowerNapPredictor *)self parseDeviceUsageFrequencyFromDiagnosis];
  v65[3] = v57;
  v64[4] = @"entryConfidenceLevelEnum";
  v56 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
  v54 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v56 confidenceLevel]);
  v65[4] = v54;
  v64[5] = @"entryConfidenceValueInt";
  v53 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
  [v53 confidenceValue];
  v52 = +[NSNumber numberWithDouble:round(v11 * 100.0)];
  v65[5] = v52;
  v64[6] = @"isInterruptedBool";
  v51 = +[NSNumber numberWithBool:v3];
  v65[6] = v51;
  v64[7] = @"isPPE30MinBool";
  double v12 = v10 / 60.0;
  v50 = +[NSNumber numberWithInt:v12 < 30.0];
  v65[7] = v50;
  v64[8] = @"isPPE60MinBool";
  uint64_t v13 = +[NSNumber numberWithInt:v12 < 60.0];
  v65[8] = v13;
  v64[9] = @"isPPE90MinBool";
  uint64_t v14 = +[NSNumber numberWithInt:v12 < 90.0];
  v65[9] = v14;
  v64[10] = @"predictedDurationHrFloat";
  id v15 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
  [v15 predictedDuration];
  __int16 v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v65[10] = v16;
  v64[11] = @"predictorTypeStr";
  v61 = v6;
  uint64_t v17 = [v6 predictorType];
  unsigned int v18 = (void *)v17;
  CFStringRef v19 = @"None";
  if (v17) {
    CFStringRef v19 = (const __CFString *)v17;
  }
  v65[11] = v19;
  v64[12] = @"sessionStartDayOfWeekBI";
  uint64_t v20 = [(PMCoreSmartPowerNapPredictor *)self full_session_start_time];
  __int16 v21 = [(PMCoreSmartPowerNapPredictor *)self getCustomizedDayOfWeekFromDate:v20];
  v65[12] = v21;
  id v22 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:13];
  [v55 addEntriesFromDictionary:v22];

  current_experiment_ids = self->_current_experiment_ids;
  if (current_experiment_ids)
  {
    uint64_t v24 = [(TRIExperimentIdentifiers *)current_experiment_ids experimentId];
    [v55 setObject:v24 forKeyedSubscript:@"trialDeploymentId"];

    v25 = +[NSNumber numberWithInt:[(TRIExperimentIdentifiers *)self->_current_experiment_ids deploymentId]];
    v26 = [v25 stringValue];
    [v55 setObject:v26 forKeyedSubscript:@"trialExperimentId"];

    objc_super v27 = [(TRIExperimentIdentifiers *)self->_current_experiment_ids treatmentId];
    [v55 setObject:v27 forKeyedSubscript:@"trialTreatmentId"];
  }
  if (!v61 && os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
    sub_100066144();
  }
  __int16 v28 = [v55 objectForKeyedSubscript:@"sessionDurationHrFloat"];
  [v28 doubleValue];
  if (v29 <= 0.0)
  {
  }
  else
  {
    __int16 v30 = [v55 objectForKeyedSubscript:@"sessionDurationHrFloat"];
    [v30 doubleValue];
    double v32 = v31;

    if (v32 <= 12.0) {
      goto LABEL_14;
    }
  }
  id v33 = (void *)qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
    sub_100066098(v33, v55);
  }
LABEL_14:
  __int16 v34 = [v55 objectForKeyedSubscript:@"predictedDurationHrFloat"];
  [v34 doubleValue];
  if (v35 <= 0.0)
  {
  }
  else
  {
    __int16 v36 = [v55 objectForKeyedSubscript:@"predictedDurationHrFloat"];
    [v36 doubleValue];
    double v38 = v37;

    if (v38 <= 12.0) {
      goto LABEL_20;
    }
  }
  unsigned int v39 = (void *)qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
    sub_100065FEC(v39, v55);
  }
LABEL_20:
  if (!v3)
  {
    v47 = qword_1000A36C8;
    if (!os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 138412290;
    v63 = v55;
    v48 = "Session ended naturally. Reporting under-prediction event to CA: %@";
    goto LABEL_28;
  }
  v40 = [v55 objectForKeyedSubscript:@"predictedDurationHrFloat"];
  [v40 doubleValue];
  double v42 = v41;
  v43 = [v55 objectForKeyedSubscript:@"sessionDurationHrFloat"];
  [v43 doubleValue];
  double v45 = v44;

  if (v42 < v45)
  {
    v46 = (void *)qword_1000A36C8;
    if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
      sub_100065EF8(v46, v55);
    }
  }
  v47 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v55;
    v48 = "User interrupted session. Reporting over-prediction event to CA: %@";
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v48, buf, 0xCu);
  }
LABEL_29:

  return v55;
}

- (id)CAEventForModelHesitancy
{
  BOOL v3 = [(PMCoreSmartPowerNapPredictor *)self inactivity_predictor];
  CFStringRef v4 = [v3 modelMetadata];

  id v5 = objc_opt_new();
  v36[0] = @"eventIsSessionInt";
  v36[1] = @"sessionDurationHrFloat";
  v37[0] = &off_10009A578;
  v37[1] = &off_10009A578;
  v36[2] = @"deviceUsageFrequencyStr";
  double v32 = [(PMCoreSmartPowerNapPredictor *)self parseDeviceUsageFrequencyFromDiagnosis];
  v37[2] = v32;
  v36[3] = @"entryConfidenceLevelEnum";
  id v6 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
  double v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 confidenceLevel]);
  v37[3] = v7;
  v36[4] = @"entryConfidenceValueInt";
  uint64_t v8 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
  [v8 confidenceValue];
  double v10 = +[NSNumber numberWithDouble:round(v9 * 100.0)];
  v37[4] = v10;
  v36[5] = @"predictedDurationHrFloat";
  double v11 = [(PMCoreSmartPowerNapPredictor *)self predictor_output];
  [v11 predictedDuration];
  double v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v37[5] = v12;
  v36[6] = @"predictorTypeStr";
  id v33 = v4;
  uint64_t v13 = [v4 predictorType];
  uint64_t v14 = (void *)v13;
  CFStringRef v15 = @"None";
  if (v13) {
    CFStringRef v15 = (const __CFString *)v13;
  }
  v37[6] = v15;
  __int16 v16 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:7];
  [v5 addEntriesFromDictionary:v16];

  current_experiment_ids = self->_current_experiment_ids;
  if (current_experiment_ids)
  {
    unsigned int v18 = [(TRIExperimentIdentifiers *)current_experiment_ids experimentId];
    [v5 setObject:v18 forKeyedSubscript:@"trialDeploymentId"];

    CFStringRef v19 = +[NSNumber numberWithInt:[(TRIExperimentIdentifiers *)self->_current_experiment_ids deploymentId]];
    uint64_t v20 = [v19 stringValue];
    [v5 setObject:v20 forKeyedSubscript:@"trialExperimentId"];

    __int16 v21 = [(TRIExperimentIdentifiers *)self->_current_experiment_ids treatmentId];
    [v5 setObject:v21 forKeyedSubscript:@"trialTreatmentId"];
  }
  id v22 = [v5 objectForKeyedSubscript:@"entryConfidenceLevelEnum"];
  id v23 = [v22 integerValue];

  if (v23 == (id)2 && os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
    sub_100066260();
  }
  uint64_t v24 = [v5 objectForKeyedSubscript:@"entryConfidenceValueInt"];
  if (([v24 intValue] & 0x80000000) != 0)
  {
  }
  else
  {
    v25 = [v5 objectForKeyedSubscript:@"entryConfidenceValueInt"];
    int v26 = [v25 intValue];

    if (v26 < 101) {
      goto LABEL_14;
    }
  }
  objc_super v27 = (void *)qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
    sub_1000661AC(v27, v5);
  }
LABEL_14:
  [v5 objectForKeyedSubscript:@"predictedDurationHrFloat"];

  __int16 v28 = [v5 objectForKeyedSubscript:@"predictorTypeStr"];
  unsigned int v29 = [v28 isEqualToString:@"None"];

  if (v29 && os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_ERROR)) {
    sub_100066178();
  }
  __int16 v30 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Model was not confident to engage for this inactivity. Reporting hesitancy event to CA: %@", buf, 0xCu);
  }

  return v5;
}

- (id)CAEventForInactivityTooShortToQueryModel
{
  BOOL v3 = objc_opt_new();
  [v3 addEntriesFromDictionary:&off_10009AA88];
  current_experiment_ids = self->_current_experiment_ids;
  if (current_experiment_ids)
  {
    id v5 = [(TRIExperimentIdentifiers *)current_experiment_ids experimentId];
    [v3 setObject:v5 forKeyedSubscript:@"trialDeploymentId"];

    id v6 = +[NSNumber numberWithInt:[(TRIExperimentIdentifiers *)self->_current_experiment_ids deploymentId]];
    double v7 = [v6 stringValue];
    [v3 setObject:v7 forKeyedSubscript:@"trialExperimentId"];

    uint64_t v8 = [(TRIExperimentIdentifiers *)self->_current_experiment_ids treatmentId];
    [v3 setObject:v8 forKeyedSubscript:@"trialTreatmentId"];
  }
  double v9 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    double v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Inactivity was too short to even consult the model. Reporting very short inactivity event to CA: %@", (uint8_t *)&v11, 0xCu);
  }

  return v3;
}

- (void)initializeTrialClient
{
  +[NSError _setFileNameLocalizationEnabled:0];
  if (objc_opt_class())
  {
    BOOL v3 = +[TRIClient clientWithIdentifier:293];
    trial_client = self->_trial_client;
    self->_trial_client = v3;

    objc_initWeak(&location, self);
    id v5 = self->_trial_client;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000201E8;
    v7[3] = &unk_100091410;
    objc_copyWeak(&v8, &location);
    id v6 = [(TRIClient *)v5 addUpdateHandlerForNamespaceName:@"COREOS_PREDICTION_INACTIVITY" usingBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)updateTrialFactors
{
  BOOL v3 = [(PMCoreSmartPowerNapPredictor *)self trial_client];
  [v3 refresh];

  id v5 = [(PMCoreSmartPowerNapPredictor *)self trial_client];
  CFStringRef v4 = [v5 experimentIdentifiersWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [(PMCoreSmartPowerNapPredictor *)self setCurrent_experiment_ids:v4];
}

- (void)updateQueryDelta:(unsigned int)a3
{
  id v5 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating query delta to %u seconds", (uint8_t *)v6, 8u);
  }
  [(PMCoreSmartPowerNapPredictor *)self setDelta_to_query:(double)a3];
}

- (void)updateRequeryDelta:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating requery delta to %u seconds", (uint8_t *)v6, 8u);
  }
  [(PMCoreSmartPowerNapPredictor *)self setRequery_delta:v3];
}

- (void)updateMotionAlarmThreshold:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating motion alarm threshold to %u seconds", (uint8_t *)v6, 8u);
  }
  [(PMCoreSmartPowerNapPredictor *)self setMotion_alarm_threshold:v3];
}

- (void)updateMotionAlarmStartThreshold:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = qword_1000A36C8;
  if (os_log_type_enabled((os_log_t)qword_1000A36C8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating motion alarm start threshold to %u seconds", (uint8_t *)v6, 8u);
  }
  [(PMCoreSmartPowerNapPredictor *)self setMotion_alarm_start_before:v3];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)evaluation_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEvaluation_timer:(id)a3
{
}

- (OS_dispatch_source)end_session_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnd_session_timer:(id)a3
{
}

- (OS_dispatch_source)requery_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequery_timer:(id)a3
{
}

- (_OSInactivityPredictionClient)inactivity_predictor
{
  return (_OSInactivityPredictionClient *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInactivity_predictor:(id)a3
{
}

- (double)delta_to_query
{
  return self->_delta_to_query;
}

- (void)setDelta_to_query:(double)a3
{
  self->_delta_to_query = a3;
}

- (int)requery_delta
{
  return self->_requery_delta;
}

- (void)setRequery_delta:(int)a3
{
  self->_requery_delta = a3;
}

- (BOOL)in_coresmartpowernap
{
  return self->_in_coresmartpowernap;
}

- (void)setIn_coresmartpowernap:(BOOL)a3
{
  self->_in_coresmartpowernap = a3;
}

- (_OSInactivityPredictorOutput)predictor_output
{
  return (_OSInactivityPredictorOutput *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPredictor_output:(id)a3
{
}

- (BOOL)feature_enabled
{
  return self->_feature_enabled;
}

- (void)setFeature_enabled:(BOOL)a3
{
  self->_feature_enabled = a3;
}

- (unint64_t)user_inactive
{
  return self->_user_inactive;
}

- (void)setUser_inactive:(unint64_t)a3
{
  self->_user_inactive = a3;
}

- (NSDate)full_session_start_time
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFull_session_start_time:(id)a3
{
}

- (NSDate)full_session_end_time
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFull_session_end_time:(id)a3
{
}

- (NSDate)predicted_end_time
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPredicted_end_time:(id)a3
{
}

- (NSDate)inactivity_start
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInactivity_start:(id)a3
{
}

- (NSDate)inactivity_end
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInactivity_end:(id)a3
{
}

- (NSString)session_end_reason
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSession_end_reason:(id)a3
{
}

- (NSString)last_session_end_reason
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLast_session_end_reason:(id)a3
{
}

- (BOOL)session_logged
{
  return self->_session_logged;
}

- (void)setSession_logged:(BOOL)a3
{
  self->_session_logged = a3;
}

- (BOOL)session_interrupted
{
  return self->_session_interrupted;
}

- (void)setSession_interrupted:(BOOL)a3
{
  self->_session_interrupted = a3;
}

- (NSDate)current_session_start_time
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCurrent_session_start_time:(id)a3
{
}

- (PMCoreSmartPowerNapLocationMonitor)location_monitor
{
  return (PMCoreSmartPowerNapLocationMonitor *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLocation_monitor:(id)a3
{
}

- (CMMotionAlarmManager)motion_alarm_manager
{
  return self->_motion_alarm_manager;
}

- (void)setMotion_alarm_manager:(id)a3
{
}

- (int)motion_alarm_threshold
{
  return self->_motion_alarm_threshold;
}

- (void)setMotion_alarm_threshold:(int)a3
{
  self->_motion_alarm_threshold = a3;
}

- (int)motion_alarm_start_before
{
  return self->_motion_alarm_start_before;
}

- (void)setMotion_alarm_start_before:(int)a3
{
  self->_motion_alarm_start_before = a3;
}

- (BOOL)motion_alarm_set
{
  return self->_motion_alarm_set;
}

- (void)setMotion_alarm_set:(BOOL)a3
{
  self->_motion_alarm_set = a3;
}

- (BPSSink)sink
{
  return (BPSSink *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSink:(id)a3
{
}

- (TRIClient)trial_client
{
  return (TRIClient *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTrial_client:(id)a3
{
}

- (TRIExperimentIdentifiers)current_experiment_ids
{
  return (TRIExperimentIdentifiers *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCurrent_experiment_ids:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_current_experiment_ids, 0);
  objc_storeStrong((id *)&self->_trial_client, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_motion_alarm_manager, 0);
  objc_storeStrong((id *)&self->_location_monitor, 0);
  objc_storeStrong((id *)&self->_current_session_start_time, 0);
  objc_storeStrong((id *)&self->_last_session_end_reason, 0);
  objc_storeStrong((id *)&self->_session_end_reason, 0);
  objc_storeStrong((id *)&self->_inactivity_end, 0);
  objc_storeStrong((id *)&self->_inactivity_start, 0);
  objc_storeStrong((id *)&self->_predicted_end_time, 0);
  objc_storeStrong((id *)&self->_full_session_end_time, 0);
  objc_storeStrong((id *)&self->_full_session_start_time, 0);
  objc_storeStrong((id *)&self->_predictor_output, 0);
  objc_storeStrong((id *)&self->_inactivity_predictor, 0);
  objc_storeStrong((id *)&self->_requery_timer, 0);
  objc_storeStrong((id *)&self->_end_session_timer, 0);
  objc_storeStrong((id *)&self->_evaluation_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end