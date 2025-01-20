@interface PMSmartPowerNapPredictor
+ (PMSmartPowerNapPredictor)sharedInstance;
- (BOOL)ambient_state;
- (BOOL)backlight_state;
- (BOOL)feature_enabled;
- (BOOL)in_smartpowernap;
- (BOOL)isSleepSuppressionSupported;
- (BOOL)is_aod_enabled;
- (BOOL)motion_alarm_set;
- (BOOL)plugin_state;
- (BOOL)readSkipEndOfSessionTimerFromDefaults;
- (BOOL)readStateFromDefaults;
- (BOOL)session_interrupted;
- (BOOL)session_logged;
- (BOOL)should_reenter;
- (BOOL)skipEndOfSessionTimer;
- (BPSSink)sink;
- (CMMotionAlarmManager)motion_alarm_manager;
- (NSDate)cumulative_interruption_session_start;
- (NSDate)current_session_start_time;
- (NSDate)full_session_end_time;
- (NSDate)full_session_start_time;
- (NSDate)inactivity_end;
- (NSDate)inactivity_start;
- (NSDate)predicted_end_time;
- (NSMutableArray)interruptions;
- (NSString)last_session_end_reason;
- (NSString)session_end_reason;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)end_session_timer;
- (OS_dispatch_source)evaluation_timer;
- (OS_dispatch_source)requery_timer;
- (PMSmartPowerNapInterruption)current_interruption;
- (PMSmartPowerNapLocationMonitor)location_monitor;
- (PMSmartPowerNapPredictor)initWithQueue:(id)a3;
- (TRIClient)trial_client;
- (_OSInactivityPredictionClient)inactivity_predictor;
- (_OSInactivityPredictorOutput)predictor_output;
- (double)cumulative_interruption_session_duration;
- (double)delta_to_query;
- (double)duration_interruptions;
- (double)max_interruption_duration;
- (id)CAEventForEngagedSessionWhereUserInterrupted:(BOOL)a3;
- (id)CAEventForInactivityTooShortToQueryModel;
- (id)CAEventForInterruption:(id)a3;
- (id)CAEventForModelHesitancy;
- (id)readEndTimeFromDefaults;
- (id)readStartTimeFromDefaults;
- (id)sleepTimeBucketOfDate:(id)a3 AtResolution:(unint64_t)a4;
- (int)computeRequeryDeltaWithPluginState:(BOOL)a3 modelOutput:(int64_t)a4;
- (int)interruption_cooloff_end;
- (int)interruption_cooloff_start;
- (int)last_requery_delta;
- (int)max_interruptions;
- (int)motion_alarm_start_before;
- (int)motion_alarm_threshold;
- (int)num_interruptions;
- (int)reentry_delay;
- (int)requery_delta;
- (unint64_t)lock_state;
- (void)alarmDidFire:(id)a3 error:(id)a4;
- (void)alarmDidRegister:(id)a3 error:(id)a4;
- (void)alarmDidUnregister:(id)a3 error:(id)a4;
- (void)armQueryTimer;
- (void)cancelModelRequery;
- (void)enterSmartPowerNap;
- (void)evaluateInterruption:(BOOL)a3;
- (void)evaluateSmartPowerNap:(BOOL)a3;
- (void)exitSmartPowerNapWithReason:(id)a3;
- (void)handleRemoteDeviceIsNear;
- (void)handleUserInterruption:(BOOL)a3;
- (void)initMobileTimerMonitor;
- (void)initMotionAlarm;
- (void)initializeTrialClient;
- (void)logEndOfSessionWithReason:(id)a3;
- (void)logNotEngaging;
- (void)logTransientInterruptions;
- (void)postSPNDarwinNotification:(unint64_t)a3;
- (void)postSPNInterruptionNotification:(unint64_t)a3;
- (void)queryModelAndEngage;
- (void)reenterSmartPowerNap;
- (void)registerMotionAlarm;
- (void)restoreState;
- (void)saveInterruptions;
- (void)saveState:(BOOL)a3 withEndTime:(id)a4;
- (void)scheduleModelRequeryWithOutputReason:(int64_t)a3;
- (void)setAmbient_state:(BOOL)a3;
- (void)setBacklight_state:(BOOL)a3;
- (void)setCumulative_interruption_session_duration:(double)a3;
- (void)setCumulative_interruption_session_start:(id)a3;
- (void)setCurrent_interruption:(id)a3;
- (void)setCurrent_session_start_time:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDelta_to_query:(double)a3;
- (void)setDuration_interruptions:(double)a3;
- (void)setEnd_session_timer:(id)a3;
- (void)setEvaluation_timer:(id)a3;
- (void)setFeature_enabled:(BOOL)a3;
- (void)setFull_session_end_time:(id)a3;
- (void)setFull_session_start_time:(id)a3;
- (void)setIn_smartpowernap:(BOOL)a3;
- (void)setInactivity_end:(id)a3;
- (void)setInactivity_predictor:(id)a3;
- (void)setInactivity_start:(id)a3;
- (void)setInterruption_cooloff_end:(int)a3;
- (void)setInterruption_cooloff_start:(int)a3;
- (void)setInterruptions:(id)a3;
- (void)setIs_aod_enabled:(BOOL)a3;
- (void)setLast_requery_delta:(int)a3;
- (void)setLast_session_end_reason:(id)a3;
- (void)setLocation_monitor:(id)a3;
- (void)setLock_state:(unint64_t)a3;
- (void)setMax_interruption_duration:(double)a3;
- (void)setMax_interruptions:(int)a3;
- (void)setMotion_alarm_manager:(id)a3;
- (void)setMotion_alarm_set:(BOOL)a3;
- (void)setMotion_alarm_start_before:(int)a3;
- (void)setMotion_alarm_threshold:(int)a3;
- (void)setNum_interruptions:(int)a3;
- (void)setPlugin_state:(BOOL)a3;
- (void)setPredicted_end_time:(id)a3;
- (void)setPredictor_output:(id)a3;
- (void)setQueryDelta:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setReentry_delay:(int)a3;
- (void)setRequery_delta:(int)a3;
- (void)setRequery_timer:(id)a3;
- (void)setSession_end_reason:(id)a3;
- (void)setSession_interrupted:(BOOL)a3;
- (void)setSession_logged:(BOOL)a3;
- (void)setShould_reenter:(BOOL)a3;
- (void)setSink:(id)a3;
- (void)setSkipEndOfSessionTimer:(BOOL)a3;
- (void)setTrial_client:(id)a3;
- (void)unregisterMotionAlarm;
- (void)updateAODEnabledStatus:(BOOL)a3;
- (void)updateAmbientState:(BOOL)a3;
- (void)updateBacklightState:(BOOL)a3;
- (void)updateInterruptionsFromDefaults;
- (void)updateLockState:(unint64_t)a3;
- (void)updateMotionAlarmStartThreshold:(unsigned int)a3;
- (void)updateMotionAlarmThreshold:(unsigned int)a3;
- (void)updateMotionState:(BOOL)a3;
- (void)updatePluginState:(BOOL)a3;
- (void)updateReentryCoolOffPeriod:(unsigned int)a3;
- (void)updateReentryDelaySeconds:(unsigned int)a3;
- (void)updateRequeryDelta:(unsigned int)a3;
- (void)updateTrialFactors;
@end

@implementation PMSmartPowerNapPredictor

+ (PMSmartPowerNapPredictor)sharedInstance
{
  if (qword_1000A4658 != -1) {
    dispatch_once(&qword_1000A4658, &stru_100091430);
  }
  if (byte_1000A4650)
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1000A4640 != -1) {
      dispatch_once(&qword_1000A4640, &stru_100091308);
    }
    id v2 = (id)qword_1000A4638;
  }

  return (PMSmartPowerNapPredictor *)v2;
}

- (PMSmartPowerNapPredictor)initWithQueue:(id)a3
{
  id v4 = a3;
  if (qword_1000A4658 != -1) {
    dispatch_once(&qword_1000A4658, &stru_100091430);
  }
  if ((byte_1000A4650 & 1) != 0
    || (v33.receiver = self,
        v33.super_class = (Class)PMSmartPowerNapPredictor,
        v5 = [(PMSmartPowerNapPredictor *)&v33 init],
        (self = v5) == 0))
  {
    v14 = 0;
  }
  else
  {
    [(PMSmartPowerNapPredictor *)v5 setIn_smartpowernap:0];
    [(PMSmartPowerNapPredictor *)self setSession_interrupted:0];
    [(PMSmartPowerNapPredictor *)self setMax_interruptions:2];
    [(PMSmartPowerNapPredictor *)self setSkipEndOfSessionTimer:0];
    [(PMSmartPowerNapPredictor *)self setMax_interruption_duration:90.0];
    [(PMSmartPowerNapPredictor *)self setNum_interruptions:0];
    [(PMSmartPowerNapPredictor *)self setDuration_interruptions:0.0];
    [(PMSmartPowerNapPredictor *)self setInterruption_cooloff_start:3600];
    [(PMSmartPowerNapPredictor *)self setInterruption_cooloff_end:3600];
    [(PMSmartPowerNapPredictor *)self setReentry_delay:8];
    [(PMSmartPowerNapPredictor *)self setRequery_delta:dword_1000A2CC0];
    [(PMSmartPowerNapPredictor *)self setFeature_enabled:_os_feature_enabled_impl()];
    [(PMSmartPowerNapPredictor *)self setQueue:v4];
    [(PMSmartPowerNapPredictor *)self setSession_logged:0];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    [(PMSmartPowerNapPredictor *)self setInterruptions:v6];

    id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.powerd.smartpowernap.state"];
    [(PMSmartPowerNapPredictor *)self setDefaults:v7];

    [(PMSmartPowerNapPredictor *)self setPlugin_state:IOPSDrawingUnlimitedPower()];
    if ([(PMSmartPowerNapPredictor *)self feature_enabled])
    {
      if (MKBDeviceUnlockedSinceBoot())
      {
        sub_100007C80();
        if (objc_opt_class())
        {
          id v8 = objc_alloc_init((Class)sub_100007C80());
          [(PMSmartPowerNapPredictor *)self setInactivity_predictor:v8];

          if (_os_feature_enabled_impl())
          {
            v9 = [PMSmartPowerNapLocationMonitor alloc];
            v10 = [(PMSmartPowerNapPredictor *)self queue];
            v11 = [(PMSmartPowerNapLocationMonitor *)v9 initWithQueue:v10];
            [(PMSmartPowerNapPredictor *)self setLocation_monitor:v11];
          }
        }
        v12 = [(PMSmartPowerNapPredictor *)self queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100007D64;
        block[3] = &unk_1000911E8;
        v32 = self;
        dispatch_async(v12, block);

        v13 = v32;
      }
      else
      {
        v15 = qword_1000A34F0;
        if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: Device hasn't been unlocked since first boot", buf, 2u);
        }
        *(_DWORD *)buf = 0;
        v16 = [(PMSmartPowerNapPredictor *)self queue];
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100007D6C;
        handler[3] = &unk_1000911C0;
        v29 = self;
        notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", (int *)buf, v16, handler);

        v13 = v29;
      }
    }
    if (&_DMIsMigrationNeeded && (DMIsMigrationNeeded() & 1) != 0)
    {
      v17 = qword_1000A34F0;
      if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Defering Trial initializing due to pending data migration", buf, 2u);
      }
      dispatch_time_t v18 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 300000000000);
      v19 = [(PMSmartPowerNapPredictor *)self queue];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100007FD4;
      v26[3] = &unk_1000911E8;
      v27 = self;
      dispatch_after(v18, v19, v26);
    }
    else
    {
      [(PMSmartPowerNapPredictor *)self initializeTrialClient];
    }
    [(PMSmartPowerNapPredictor *)self initMotionAlarm];
    [(PMSmartPowerNapPredictor *)self initMobileTimerMonitor];
    dispatch_time_t v20 = dispatch_time(0, 1000000000);
    v21 = [(PMSmartPowerNapPredictor *)self queue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100007FDC;
    v24[3] = &unk_1000911E8;
    v22 = self;
    v25 = v22;
    dispatch_after(v20, v21, v24);

    self = v22;
    v14 = self;
  }

  return v14;
}

- (void)restoreState
{
  if ([(PMSmartPowerNapPredictor *)self readStateFromDefaults])
  {
    [(PMSmartPowerNapPredictor *)self setIn_smartpowernap:1];
    v3 = [(PMSmartPowerNapPredictor *)self readStartTimeFromDefaults];
    [(PMSmartPowerNapPredictor *)self setFull_session_start_time:v3];

    [(PMSmartPowerNapPredictor *)self setSkipEndOfSessionTimer:[(PMSmartPowerNapPredictor *)self readSkipEndOfSessionTimerFromDefaults]];
    id v4 = [(PMSmartPowerNapPredictor *)self readEndTimeFromDefaults];
    if (v4 && ![(PMSmartPowerNapPredictor *)self skipEndOfSessionTimer])
    {
      [(PMSmartPowerNapPredictor *)self setPredicted_end_time:v4];
      v5 = +[NSDate date];
      id v6 = [(PMSmartPowerNapPredictor *)self predicted_end_time];
      id v7 = [v5 compare:v6];

      if (v7 == (id)1)
      {
        id v8 = qword_1000A34F0;
        if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Past the predicted end. Sending exit notification", buf, 2u);
        }
        [(PMSmartPowerNapPredictor *)self exitSmartPowerNapWithReason:@"PredictedEndOfSession"];
      }
      else
      {
        v9 = [(PMSmartPowerNapPredictor *)self predicted_end_time];
        [v9 timeIntervalSinceDate:v5];
        double v11 = v10;

        v12 = [(PMSmartPowerNapPredictor *)self end_session_timer];

        if (v12)
        {
          v13 = [(PMSmartPowerNapPredictor *)self end_session_timer];
          dispatch_suspend(v13);
        }
        else
        {
          v14 = [(PMSmartPowerNapPredictor *)self queue];
          dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);
          [(PMSmartPowerNapPredictor *)self setEnd_session_timer:v15];

          v16 = [(PMSmartPowerNapPredictor *)self end_session_timer];
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_1000083DC;
          handler[3] = &unk_1000911E8;
          void handler[4] = self;
          dispatch_source_set_event_handler(v16, handler);

          v13 = [(PMSmartPowerNapPredictor *)self end_session_timer];
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_100008480;
          v24[3] = &unk_1000911E8;
          void v24[4] = self;
          dispatch_source_set_cancel_handler(v13, v24);
        }

        v17 = [(PMSmartPowerNapPredictor *)self end_session_timer];
        dispatch_time_t v18 = dispatch_walltime(0, (uint64_t)(v11 * 1000000000.0));
        dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0);

        v19 = [(PMSmartPowerNapPredictor *)self end_session_timer];
        dispatch_resume(v19);
      }
      [(PMSmartPowerNapPredictor *)self updateInterruptionsFromDefaults];
    }
  }
  if ([(PMSmartPowerNapPredictor *)self in_smartpowernap])
  {
    dispatch_time_t v20 = +[PMSmartPowerNapService sharedInstance];
    [v20 updateState:1];
  }
  dispatch_time_t v21 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  v22 = [(PMSmartPowerNapPredictor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000848C;
  block[3] = &unk_1000911E8;
  void block[4] = self;
  dispatch_after(v21, v22, block);
}

- (void)saveState:(BOOL)a3 withEndTime:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PMSmartPowerNapPredictor *)self defaults];
  id v8 = v7;
  if (v4)
  {
    [v7 setBool:1 forKey:@"state"];

    v9 = [(PMSmartPowerNapPredictor *)self defaults];
    double v10 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
    [v9 setObject:v10 forKey:@"startTime"];

    double v11 = [(PMSmartPowerNapPredictor *)self defaults];
    [v11 setObject:v6 forKey:@"predictedEndTime"];

    v12 = [(PMSmartPowerNapPredictor *)self defaults];
    BOOL v13 = [(PMSmartPowerNapPredictor *)self skipEndOfSessionTimer];
    CFStringRef v14 = @"skipEndOfSessionTimer";
    dispatch_source_t v15 = v12;
  }
  else
  {
    [v7 removeObjectForKey:@"predictedEndTime"];

    v16 = [(PMSmartPowerNapPredictor *)self defaults];
    [v16 removeObjectForKey:@"startTime"];

    v17 = [(PMSmartPowerNapPredictor *)self defaults];
    [v17 removeObjectForKey:@"interruptionCount"];

    dispatch_time_t v18 = [(PMSmartPowerNapPredictor *)self defaults];
    [v18 removeObjectForKey:@"interruptionDuration"];

    v19 = [(PMSmartPowerNapPredictor *)self defaults];
    [v19 removeObjectForKey:@"skipEndOfSessionTimer"];

    dispatch_source_t v15 = [(PMSmartPowerNapPredictor *)self defaults];
    v12 = v15;
    CFStringRef v14 = @"state";
    BOOL v13 = 0;
  }
  [v15 setBool:v13 forKey:v14];

  dispatch_time_t v20 = [(PMSmartPowerNapPredictor *)self defaults];
  [v20 synchronize];

  dispatch_time_t v21 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 67109378;
    v22[1] = v4;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: saved state %d with end time %@", (uint8_t *)v22, 0x12u);
  }
}

- (void)saveInterruptions
{
  v3 = [(PMSmartPowerNapPredictor *)self defaults];
  objc_msgSend(v3, "setInteger:forKey:", -[PMSmartPowerNapPredictor num_interruptions](self, "num_interruptions"), @"interruptionCount");

  id v4 = [(PMSmartPowerNapPredictor *)self defaults];
  [(PMSmartPowerNapPredictor *)self duration_interruptions];
  objc_msgSend(v4, "setDouble:forKey:", @"interruptionDuration");
}

- (BOOL)readStateFromDefaults
{
  v3 = [(PMSmartPowerNapPredictor *)self defaults];
  [v3 synchronize];

  id v4 = [(PMSmartPowerNapPredictor *)self defaults];
  v5 = [v4 valueForKey:@"state"];

  id v6 = qword_1000A34F0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = v6;
      v11[0] = 67109120;
      v11[1] = [v5 BOOLValue];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: Read defaults state=%d", (uint8_t *)v11, 8u);
    }
    unsigned __int8 v9 = [v5 BOOLValue];
  }
  else
  {
    if (v7)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: No previous defaults state saved", (uint8_t *)v11, 2u);
    }
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)readStartTimeFromDefaults
{
  id v2 = [(PMSmartPowerNapPredictor *)self defaults];
  v3 = [v2 objectForKey:@"startTime"];

  id v4 = qword_1000A34F0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      unsigned __int8 v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: Read defaults start time: %@", (uint8_t *)&v8, 0xCu);
    }
    id v6 = v3;
  }
  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: No previous start time found", (uint8_t *)&v8, 2u);
  }

  return v3;
}

- (BOOL)readSkipEndOfSessionTimerFromDefaults
{
  v3 = [(PMSmartPowerNapPredictor *)self defaults];
  [v3 synchronize];

  id v4 = [(PMSmartPowerNapPredictor *)self defaults];
  BOOL v5 = [v4 valueForKey:@"skipEndOfSessionTimer"];

  id v6 = qword_1000A34F0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = v6;
      v11[0] = 67109120;
      v11[1] = [v5 BOOLValue];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: Read defaults state=%d", (uint8_t *)v11, 8u);
    }
    unsigned __int8 v9 = [v5 BOOLValue];
  }
  else
  {
    if (v7)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: No defaults for skip timer", (uint8_t *)v11, 2u);
    }
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)readEndTimeFromDefaults
{
  id v2 = [(PMSmartPowerNapPredictor *)self defaults];
  v3 = [v2 objectForKey:@"predictedEndTime"];

  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    BOOL v5 = [v4 stringFromDate:v3];
    id v6 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      double v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: Read defaults date=%{public}@\n", (uint8_t *)&v10, 0xCu);
    }
    id v7 = v3;
  }
  else
  {
    int v8 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: No previous end time found", (uint8_t *)&v10, 2u);
    }
  }

  return v3;
}

- (void)updateInterruptionsFromDefaults
{
  v3 = [(PMSmartPowerNapPredictor *)self defaults];
  -[PMSmartPowerNapPredictor setNum_interruptions:](self, "setNum_interruptions:", [v3 integerForKey:@"interruptionCount"]);

  id v4 = [(PMSmartPowerNapPredictor *)self defaults];
  [v4 doubleForKey:@"interruptionDuration"];
  -[PMSmartPowerNapPredictor setDuration_interruptions:](self, "setDuration_interruptions:");

  BOOL v5 = (void *)qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    unsigned int v7 = [(PMSmartPowerNapPredictor *)self num_interruptions];
    [(PMSmartPowerNapPredictor *)self duration_interruptions];
    v9[0] = 67109376;
    v9[1] = v7;
    __int16 v10 = 2048;
    uint64_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updated interruptions from defaults: %d, %f", (uint8_t *)v9, 0x12u);
  }
}

- (void)evaluateInterruption:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PMSmartPowerNapPredictor *)self in_smartpowernap] && v3)
  {
    uint64_t v5 = 1;
    [(PMSmartPowerNapPredictor *)self setSession_interrupted:1];
    id v6 = +[NSDate date];
    unsigned int v7 = [[PMSmartPowerNapInterruption alloc] initWithStart:v6];
    uint64_t v8 = [(PMSmartPowerNapPredictor *)self interruptions];
    [v8 addObject:v7];

    [(PMSmartPowerNapPredictor *)self setCurrent_interruption:v7];
    unsigned __int8 v9 = [(PMSmartPowerNapPredictor *)self current_interruption];
    __int16 v10 = [v9 start];
    uint64_t v11 = [(PMSmartPowerNapPredictor *)self cumulative_interruption_session_start];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;
    [(PMSmartPowerNapPredictor *)self cumulative_interruption_session_duration];
    double v15 = v14;

    if (v13 < v15) {
      uint64_t v5 = [(PMSmartPowerNapPredictor *)self num_interruptions] + 1;
    }
    [(PMSmartPowerNapPredictor *)self setNum_interruptions:v5];
    [(PMSmartPowerNapPredictor *)self postSPNInterruptionNotification:1];
    [(PMSmartPowerNapPredictor *)self postSPNDarwinNotification:1];
  }
  if ([(PMSmartPowerNapPredictor *)self session_interrupted] && !v3)
  {
    v16 = +[NSDate date];
    v17 = [(PMSmartPowerNapPredictor *)self current_interruption];
    [v17 setEnd:v16];

    dispatch_time_t v18 = [(PMSmartPowerNapPredictor *)self current_interruption];
    v19 = [v18 end];
    dispatch_time_t v20 = [(PMSmartPowerNapPredictor *)self current_interruption];
    dispatch_time_t v21 = [v20 start];
    [v19 timeIntervalSinceDate:v21];
    double v23 = v22;

    id v24 = [(PMSmartPowerNapPredictor *)self current_interruption];
    v25 = [v24 start];
    v26 = [(PMSmartPowerNapPredictor *)self cumulative_interruption_session_start];
    [v25 timeIntervalSinceDate:v26];
    double v28 = v27;
    [(PMSmartPowerNapPredictor *)self cumulative_interruption_session_duration];
    double v30 = v29;

    if (v28 >= v30)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEBUG)) {
        sub_1000633C8();
      }
      v34 = +[NSDate date];
      [(PMSmartPowerNapPredictor *)self setCumulative_interruption_session_start:v34];

      objc_super v33 = self;
      double v32 = v23;
    }
    else
    {
      [(PMSmartPowerNapPredictor *)self duration_interruptions];
      double v32 = v23 + v31;
      objc_super v33 = self;
    }
    [(PMSmartPowerNapPredictor *)v33 setDuration_interruptions:v32];
    v35 = (void *)qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      unsigned int v37 = [(PMSmartPowerNapPredictor *)self num_interruptions];
      [(PMSmartPowerNapPredictor *)self duration_interruptions];
      *(_DWORD *)buf = 67109376;
      unsigned int v76 = v37;
      __int16 v77 = 2048;
      uint64_t v78 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: session interrupted, number of interruptions %d, duration of interruption %f", buf, 0x12u);
    }
    [(PMSmartPowerNapPredictor *)self postSPNInterruptionNotification:0];
    v39 = [(PMSmartPowerNapPredictor *)self current_interruption];
    v40 = [v39 start];
    v41 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
    [v40 timeIntervalSinceDate:v41];
    if (v42 < (double)[(PMSmartPowerNapPredictor *)self interruption_cooloff_start])
    {
    }
    else
    {
      v43 = [(PMSmartPowerNapPredictor *)self predicted_end_time];
      v44 = [(PMSmartPowerNapPredictor *)self current_interruption];
      v45 = [v44 start];
      [v43 timeIntervalSinceDate:v45];
      double v47 = v46;
      double v48 = (double)[(PMSmartPowerNapPredictor *)self interruption_cooloff_end];

      if (v47 >= v48)
      {
        int v49 = [(PMSmartPowerNapPredictor *)self num_interruptions];
        if (v49 <= [(PMSmartPowerNapPredictor *)self max_interruptions]
          && ([(PMSmartPowerNapPredictor *)self duration_interruptions],
              double v51 = v50,
              [(PMSmartPowerNapPredictor *)self max_interruption_duration],
              v51 <= v52))
        {
          v71 = [(PMSmartPowerNapPredictor *)self predicted_end_time];
          id v72 = [v16 compare:v71];

          if (v72 != (id)1)
          {
            uint64_t v55 = 1;
            goto LABEL_26;
          }
          v53 = qword_1000A34F0;
          BOOL v73 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
          uint64_t v55 = 0;
          if (v73)
          {
            *(_WORD *)buf = 0;
            v56 = "Already past the predictedDuration. Not re-entering";
            goto LABEL_21;
          }
        }
        else
        {
          v53 = qword_1000A34F0;
          BOOL v54 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
          uint64_t v55 = 0;
          if (v54)
          {
            *(_WORD *)buf = 0;
            v56 = "Max interruptions exceeded. Not re-entering";
LABEL_21:
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, v56, buf, 2u);
LABEL_25:
            uint64_t v55 = 0;
          }
        }
LABEL_26:
        [(PMSmartPowerNapPredictor *)self setShould_reenter:v55];
        if ([(PMSmartPowerNapPredictor *)self should_reenter])
        {
          v62 = (void *)qword_1000A34F0;
          if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
          {
            v63 = v62;
            unsigned int v64 = [(PMSmartPowerNapPredictor *)self reentry_delay];
            *(_DWORD *)buf = 67109120;
            unsigned int v76 = v64;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Setting timer to fire %u seconds to re-enter", buf, 8u);
          }
          dispatch_time_t v65 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000 * [(PMSmartPowerNapPredictor *)self reentry_delay]);
          v66 = [(PMSmartPowerNapPredictor *)self queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000956C;
          block[3] = &unk_1000911E8;
          void block[4] = self;
          dispatch_after(v65, v66, block);

          v67 = [(PMSmartPowerNapPredictor *)self current_interruption];
          objc_msgSend(v67, "setIs_transient:", 1);
        }
        else
        {
          v68 = [(PMSmartPowerNapPredictor *)self current_interruption];
          objc_msgSend(v68, "setIs_transient:", 0);

          [(PMSmartPowerNapPredictor *)self setDuration_interruptions:0.0];
          [(PMSmartPowerNapPredictor *)self setNum_interruptions:0];
          if (![(PMSmartPowerNapPredictor *)self session_logged])
          {
            v69 = qword_1000A34F0;
            if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Metrics: session hasn't been logged yet. Logging end of session", buf, 2u);
            }
            v70 = [(PMSmartPowerNapPredictor *)self session_end_reason];
            [(PMSmartPowerNapPredictor *)self logEndOfSessionWithReason:v70];

            [(PMSmartPowerNapPredictor *)self logTransientInterruptions];
            [(PMSmartPowerNapPredictor *)self setSession_logged:1];
            [(PMSmartPowerNapPredictor *)self setSession_end_reason:0];
          }
          [(PMSmartPowerNapPredictor *)self postSPNDarwinNotification:0];
        }
        [(PMSmartPowerNapPredictor *)self setSession_interrupted:0];
        [(PMSmartPowerNapPredictor *)self saveInterruptions];

        return;
      }
    }
    v57 = (void *)qword_1000A34F0;
    BOOL v58 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
    uint64_t v55 = 0;
    if (v58)
    {
      v59 = v57;
      unsigned int v60 = [(PMSmartPowerNapPredictor *)self interruption_cooloff_start];
      unsigned int v61 = [(PMSmartPowerNapPredictor *)self interruption_cooloff_end];
      *(_DWORD *)buf = 67109376;
      unsigned int v76 = v60;
      __int16 v77 = 1024;
      LODWORD(v78) = v61;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Interruption is within %u seconds of start or %u seconds of predicted session end", buf, 0xEu);

      goto LABEL_25;
    }
    goto LABEL_26;
  }
}

- (void)setQueryDelta:(BOOL)a3
{
  BOOL v3 = a3;
  [(PMSmartPowerNapPredictor *)self setDelta_to_query:10.0];
  [(PMSmartPowerNapPredictor *)self setLast_requery_delta:0];
  uint64_t v5 = [(PMSmartPowerNapPredictor *)self inactivity_predictor];

  if (v5)
  {
    if (qword_1000A4678 != -1) {
      dispatch_once(&qword_1000A4678, &stru_1000914B0);
    }
    if (byte_1000A4670)
    {
      if (self->_trial_client)
      {
        id v6 = [(PMSmartPowerNapPredictor *)self trial_client];
        unsigned int v7 = [v6 levelForFactor:@"onBatteryRecommendedWaitTime" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
        [v7 doubleValue];
        double v9 = v8;

        __int16 v10 = [(PMSmartPowerNapPredictor *)self trial_client];
        uint64_t v11 = [v10 levelForFactor:@"pluginRecommendedWaitTime" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
        [v11 doubleValue];
        double v13 = v12;
      }
      else
      {
        double v13 = 10.0;
        double v9 = 10.0;
      }
    }
    else
    {
      double v13 = 900.0;
      double v9 = 900.0;
    }
    if (v3) {
      double v14 = v13;
    }
    else {
      double v14 = v9;
    }
    [(PMSmartPowerNapPredictor *)self setDelta_to_query:v14];
    double v15 = (void *)qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEBUG)) {
      sub_1000633FC(v15, self);
    }
    v16 = [(PMSmartPowerNapPredictor *)self evaluation_timer];
    [(PMSmartPowerNapPredictor *)self delta_to_query];
    dispatch_time_t v18 = dispatch_walltime(0, 1000000000 * (int)v17);
    dispatch_source_set_timer(v16, v18, 0xFFFFFFFFFFFFFFFFLL, 0);

    v19 = [(PMSmartPowerNapPredictor *)self evaluation_timer];
    dispatch_resume(v19);
  }
}

- (void)armQueryTimer
{
  BOOL v3 = [(PMSmartPowerNapPredictor *)self evaluation_timer];

  if (v3)
  {
    id v4 = [(PMSmartPowerNapPredictor *)self evaluation_timer];
    dispatch_suspend(v4);
  }
  else
  {
    uint64_t v5 = [(PMSmartPowerNapPredictor *)self queue];
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
    [(PMSmartPowerNapPredictor *)self setEvaluation_timer:v6];

    unsigned int v7 = [(PMSmartPowerNapPredictor *)self evaluation_timer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000098B4;
    handler[3] = &unk_1000911E8;
    void handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    id v4 = [(PMSmartPowerNapPredictor *)self evaluation_timer];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000099B0;
    v8[3] = &unk_1000911E8;
    v8[4] = self;
    dispatch_source_set_cancel_handler(v4, v8);
  }

  [(PMSmartPowerNapPredictor *)self setQueryDelta:[(PMSmartPowerNapPredictor *)self plugin_state]];
}

- (void)evaluateSmartPowerNap:(BOOL)a3
{
  if ([(PMSmartPowerNapPredictor *)self feature_enabled]
    && ([(PMSmartPowerNapPredictor *)self inactivity_predictor],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if ([(PMSmartPowerNapPredictor *)self lock_state])
    {
      unsigned int v6 = [(PMSmartPowerNapPredictor *)self in_smartpowernap];
      unsigned int v7 = qword_1000A34F0;
      BOOL v8 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8) {
          sub_100063520();
        }
      }
      else
      {
        if (v8)
        {
          sub_1000635CC(a3, v7);
          if (a3) {
            return;
          }
        }
        else if (a3)
        {
          return;
        }
        double v9 = +[NSDate date];
        [(PMSmartPowerNapPredictor *)self setInactivity_start:v9];

        __int16 v10 = qword_1000A34F0;
        if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEBUG)) {
          sub_100063554(v10, v11, v12, v13, v14, v15, v16, v17);
        }
        PLLogRegisteredEvent();
        [(PMSmartPowerNapPredictor *)self armQueryTimer];
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEBUG))
    {
      sub_1000634EC();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR))
  {
    sub_1000634B8();
  }
}

- (void)queryModelAndEngage
{
  BOOL v3 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: queryModelAndEngage", buf, 2u);
  }
  id v4 = [(PMSmartPowerNapPredictor *)self location_monitor];

  if (v4)
  {
    uint64_t v5 = [(PMSmartPowerNapPredictor *)self location_monitor];
    unsigned __int8 v6 = [v5 areAllRemoteDevicesAway];
  }
  else
  {
    unsigned __int8 v6 = 1;
  }
  unsigned int v7 = [(PMSmartPowerNapPredictor *)self inactivity_predictor];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009C48;
  v8[3] = &unk_100091330;
  v8[4] = self;
  unsigned __int8 v9 = v6;
  [v7 longInactivityPredictionResultWithOptions:1 withHandler:v8];
}

- (void)enterSmartPowerNap
{
  BOOL v3 = +[NSDate date];
  [(PMSmartPowerNapPredictor *)self setCurrent_session_start_time:v3];

  [(PMSmartPowerNapPredictor *)self setIn_smartpowernap:1];
  id v4 = +[PMSmartPowerNapService sharedInstance];
  [v4 enterSmartPowerNap];

  [(PMSmartPowerNapPredictor *)self cancelModelRequery];
  [(PMSmartPowerNapPredictor *)self setSession_end_reason:0];
  [(PMSmartPowerNapPredictor *)self postSPNDarwinNotification:2];
  uint64_t v5 = [(PMSmartPowerNapPredictor *)self predicted_end_time];
  [(PMSmartPowerNapPredictor *)self saveState:1 withEndTime:v5];

  unsigned __int8 v6 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
  unsigned int v7 = [(PMSmartPowerNapPredictor *)self predictor_output];
  [v7 predictedDuration];
  unsigned __int8 v9 = [v6 dateByAddingTimeInterval:v8 * 3600.0];

  __int16 v10 = objc_msgSend(v9, "dateByAddingTimeInterval:", (double)--[PMSmartPowerNapPredictor motion_alarm_start_before](self, "motion_alarm_start_before"));
  uint64_t v11 = +[NSDate date];
  [v10 timeIntervalSinceDate:v11];
  unint64_t v13 = (unint64_t)v12;

  uint64_t v14 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting a timer to fire after %llu seconds to register for motion alarm", buf, 0xCu);
  }
  dispatch_time_t v15 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000 * v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A5A4;
  block[3] = &unk_1000911E8;
  void block[4] = self;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v16 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEBUG)) {
    sub_1000636B0(v16, v17, v18, v19, v20, v21, v22, v23);
  }
  PLLogRegisteredEvent();
}

- (void)exitSmartPowerNapWithReason:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = +[NSDate date];
  [(PMSmartPowerNapPredictor *)self setFull_session_end_time:v5];

  [(PMSmartPowerNapPredictor *)self setIn_smartpowernap:0];
  unsigned __int8 v6 = +[PMSmartPowerNapService sharedInstance];
  [v6 exitSmartPowerNap];

  [(PMSmartPowerNapPredictor *)self setSession_end_reason:v4];
  [(PMSmartPowerNapPredictor *)self setLast_session_end_reason:v4];
  unsigned int v7 = (void *)qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = v7;
    unsigned __int8 v9 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
    __int16 v10 = [(PMSmartPowerNapPredictor *)self full_session_end_time];
    uint64_t v11 = [(PMSmartPowerNapPredictor *)self predictor_output];
    id v12 = [v11 confidenceLevel];
    unint64_t v13 = [(PMSmartPowerNapPredictor *)self predictor_output];
    [v13 confidenceValue];
    uint64_t v15 = v14;
    uint64_t v16 = [(PMSmartPowerNapPredictor *)self predictor_output];
    [v16 predictedDuration];
    uint64_t v18 = v17;
    uint64_t v19 = [(PMSmartPowerNapPredictor *)self predictor_output];
    *(_DWORD *)buf = 138413826;
    double v27 = v9;
    __int16 v28 = 2112;
    double v29 = v10;
    __int16 v30 = 2112;
    double v31 = v4;
    __int16 v32 = 2048;
    id v33 = v12;
    __int16 v34 = 2048;
    uint64_t v35 = v15;
    __int16 v36 = 2048;
    uint64_t v37 = v18;
    __int16 v38 = 1024;
    unsigned int v39 = [v19 outputReason];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SmartPowerNap session end: start %@ end %@ reason %@, predicted confidence level %ld, confidence value %lf, predicted duration %lf, outputReason %d", buf, 0x44u);
  }
  if (v4 == @"MobileTimerFired" || v4 == @"PredictedEndOfSession" || v4 == @"MotionDetected")
  {
    [(PMSmartPowerNapPredictor *)self setNum_interruptions:0];
    [(PMSmartPowerNapPredictor *)self setDuration_interruptions:0.0];
    [(PMSmartPowerNapPredictor *)self postSPNDarwinNotification:0];
  }
  [(PMSmartPowerNapPredictor *)self saveState:0 withEndTime:0];
  [(PMSmartPowerNapPredictor *)self unregisterMotionAlarm];
  unsigned __int8 v20 = [(__CFString *)v4 isEqualToString:@"PredictedEndOfSession"];
  unsigned __int8 v21 = 0;
  if ((v20 & 1) == 0)
  {
    if ([(__CFString *)v4 isEqualToString:@"UserInterrupted"])
    {
      unsigned __int8 v21 = 1;
    }
    else if ([(__CFString *)v4 isEqualToString:@"RemoteDeviceIsNear"])
    {
      unsigned __int8 v21 = 2;
    }
    else if ([(__CFString *)v4 isEqualToString:@"MotionDetected"])
    {
      unsigned __int8 v21 = 3;
    }
    else if ([(__CFString *)v4 isEqualToString:@"MobileTimerFired"])
    {
      unsigned __int8 v21 = 5;
    }
    else
    {
      unsigned __int8 v21 = 4;
    }
  }
  uint64_t v22 = +[NSNumber numberWithUnsignedChar:v21, @"eventType", @"reason", &off_10009A440];
  v25[1] = v22;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:2];

  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEBUG)) {
    sub_100063728();
  }
  PLLogRegisteredEvent();
}

- (void)reenterSmartPowerNap
{
  if ([(PMSmartPowerNapPredictor *)self in_smartpowernap])
  {
    BOOL v3 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: re-entry: already in smartpowernap", v5, 2u);
    }
  }
  else
  {
    id v4 = [(PMSmartPowerNapPredictor *)self inactivity_predictor];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000AAC4;
    v6[3] = &unk_100091358;
    v6[4] = self;
    [v4 longInactivityPredictionResultWithOptions:2 withHandler:v6];
  }
}

- (int)computeRequeryDeltaWithPluginState:(BOOL)a3 modelOutput:(int64_t)a4
{
  if (a4 != 1 || a3)
  {
    double v8 = [(PMSmartPowerNapPredictor *)self inactivity_start];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 <= -150.0)
    {
      unsigned int v11 = 2 * [(PMSmartPowerNapPredictor *)self last_requery_delta];
      unsigned int v12 = [(PMSmartPowerNapPredictor *)self requery_delta];
      if ((int)v11 >= (int)v12) {
        uint64_t v7 = v12;
      }
      else {
        uint64_t v7 = v11;
      }
    }
    else
    {
      uint64_t v7 = 30;
    }
  }
  else
  {
    unsigned int v5 = [(PMSmartPowerNapPredictor *)self requery_delta];
    signed int v6 = 2 * [(PMSmartPowerNapPredictor *)self last_requery_delta];
    if (v6 <= 300) {
      signed int v6 = 300;
    }
    if ((int)v5 >= v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v5;
    }
  }
  [(PMSmartPowerNapPredictor *)self setLast_requery_delta:v7];

  return [(PMSmartPowerNapPredictor *)self last_requery_delta];
}

- (void)scheduleModelRequeryWithOutputReason:(int64_t)a3
{
  signed int v4 = [(PMSmartPowerNapPredictor *)self computeRequeryDeltaWithPluginState:[(PMSmartPowerNapPredictor *)self plugin_state] modelOutput:a3];
  unsigned int v5 = [(PMSmartPowerNapPredictor *)self requery_timer];

  if (v5)
  {
    signed int v6 = [(PMSmartPowerNapPredictor *)self requery_timer];
    dispatch_suspend(v6);
  }
  else
  {
    uint64_t v7 = [(PMSmartPowerNapPredictor *)self queue];
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);
    [(PMSmartPowerNapPredictor *)self setRequery_timer:v8];

    double v9 = [(PMSmartPowerNapPredictor *)self requery_timer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000AEF0;
    handler[3] = &unk_1000911E8;
    void handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);

    signed int v6 = [(PMSmartPowerNapPredictor *)self requery_timer];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000AF54;
    v14[3] = &unk_1000911E8;
    v14[4] = self;
    dispatch_source_set_cancel_handler(v6, v14);
  }

  double v10 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    signed int v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: Setting timer to re query in %u seconds", buf, 8u);
  }
  unsigned int v11 = [(PMSmartPowerNapPredictor *)self requery_timer];
  dispatch_time_t v12 = dispatch_walltime(0, 1000000000 * v4);
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0);

  unint64_t v13 = [(PMSmartPowerNapPredictor *)self requery_timer];
  dispatch_resume(v13);
}

- (void)cancelModelRequery
{
  BOOL v3 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)signed int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: Cancelling timer to re query model", v6, 2u);
  }
  signed int v4 = [(PMSmartPowerNapPredictor *)self requery_timer];

  if (v4)
  {
    unsigned int v5 = [(PMSmartPowerNapPredictor *)self requery_timer];
    dispatch_source_cancel(v5);
  }
}

- (void)handleRemoteDeviceIsNear
{
  BOOL v3 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)signed int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: remote device is near. Exit SmartPowerNap", v4, 2u);
  }
  if ([(PMSmartPowerNapPredictor *)self in_smartpowernap]) {
    [(PMSmartPowerNapPredictor *)self exitSmartPowerNapWithReason:@"RemoteDeviceIsNear"];
  }
}

- (void)updateLockState:(unint64_t)a3
{
  -[PMSmartPowerNapPredictor setLock_state:](self, "setLock_state:");
  unsigned int v5 = qword_1000A34F0;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
  if (a3 == 1)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Device is locked";
      dispatch_source_t v8 = buf;
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    LOWORD(v10) = 0;
    uint64_t v7 = "Device is unlocked";
    dispatch_source_t v8 = (uint8_t *)&v10;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
  }
  BOOL v9 = a3 != 1;
  -[PMSmartPowerNapPredictor handleUserInterruption:](self, "handleUserInterruption:", v9, v10);
  [(PMSmartPowerNapPredictor *)self evaluateSmartPowerNap:v9];
}

- (void)updateBacklightState:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PMSmartPowerNapPredictor *)self backlight_state];
  BOOL v6 = qword_1000A34F0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
  if (v5 == v3)
  {
    if (v7)
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignorning duplicate backlight notifications", (uint8_t *)v9, 2u);
    }
  }
  else
  {
    if (v7)
    {
      dispatch_source_t v8 = v6;
      v9[0] = 67109376;
      v9[1] = [(PMSmartPowerNapPredictor *)self backlight_state];
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Backlight state changed from %d to %d", (uint8_t *)v9, 0xEu);
    }
    [(PMSmartPowerNapPredictor *)self setBacklight_state:v3];
    [(PMSmartPowerNapPredictor *)self handleUserInterruption:v3];
    [(PMSmartPowerNapPredictor *)self evaluateSmartPowerNap:v3];
  }
}

- (void)updateAODEnabledStatus:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PMSmartPowerNapPredictor *)self is_aod_enabled];
  BOOL v6 = qword_1000A34F0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
  if (v5 == v3)
  {
    if (v7)
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AOD Enabled status is already in the same state. Ignoring notification", (uint8_t *)v9, 2u);
    }
  }
  else
  {
    if (v7)
    {
      dispatch_source_t v8 = v6;
      v9[0] = 67109376;
      v9[1] = [(PMSmartPowerNapPredictor *)self is_aod_enabled];
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AOD Enabled status changed from %d to %d", (uint8_t *)v9, 0xEu);
    }
    [(PMSmartPowerNapPredictor *)self setIs_aod_enabled:v3];
  }
}

- (void)updatePluginState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PMSmartPowerNapPredictor *)self plugin_state] != a3)
  {
    [(PMSmartPowerNapPredictor *)self setPlugin_state:v3];
    if ([(PMSmartPowerNapPredictor *)self plugin_state])
    {
      if ([(PMSmartPowerNapPredictor *)self lock_state])
      {
        if ([(PMSmartPowerNapPredictor *)self last_requery_delta] < 1)
        {
          [(PMSmartPowerNapPredictor *)self armQueryTimer];
        }
        else
        {
          [(PMSmartPowerNapPredictor *)self scheduleModelRequeryWithOutputReason:0];
        }
      }
    }
  }
}

- (void)updateAmbientState:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Update ambient state %d", (uint8_t *)v6, 8u);
  }
  [(PMSmartPowerNapPredictor *)self setAmbient_state:v3];
}

- (BOOL)isSleepSuppressionSupported
{
  if (qword_1000A4678 != -1) {
    dispatch_once(&qword_1000A4678, &stru_1000914B0);
  }
  if (byte_1000A4670 && [(PMSmartPowerNapPredictor *)self ambient_state]) {
    return 1;
  }

  return [(PMSmartPowerNapPredictor *)self is_aod_enabled];
}

- (void)initMobileTimerMonitor
{
  sub_10000B7E4();
  if (objc_opt_class())
  {
    sub_10000B7E4();
    BOOL v3 = [(id)objc_opt_class() alarmStream];
    sub_10000B8C8((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    uint64_t v11 = objc_opt_class();
    if (v11)
    {
      id v19 = objc_alloc((Class)sub_10000B8C8(v11, v12, v13, v14, v15, v16, v17, v18));
      unsigned __int8 v20 = [(PMSmartPowerNapPredictor *)self queue];
      id v21 = [v19 initWithIdentifier:@"com.apple.powerd.biomeAlarm" targetQueue:v20 waking:1];

      uint64_t v22 = [v3 publisher];
      uint64_t v23 = [v22 filterWithKeyPath:@"eventBody.eventType" value:&off_10009A458];

      objc_initWeak(location, self);
      uint64_t v24 = [v23 subscribeOn:v21];
      double v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      double v29 = sub_10000B9FC;
      __int16 v30 = &unk_1000913C0;
      objc_copyWeak(&v32, location);
      double v31 = self;
      v25 = [v24 sinkWithCompletion:&stru_100091398 receiveInput:&v27];

      -[PMSmartPowerNapPredictor setSink:](self, "setSink:", v25, v27, v28, v29, v30);
      objc_destroyWeak(&v32);
      objc_destroyWeak(location);

      unint64_t v26 = qword_1000A34F0;
      if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "registered for mobile timer updates", (uint8_t *)location, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR)) {
        sub_1000637F8();
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR))
  {
    sub_1000637F8();
  }
}

- (void)updateMotionState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Motion state changed %d. Exiting SmartPowerNap", (uint8_t *)v6, 8u);
  }
  if ([(PMSmartPowerNapPredictor *)self in_smartpowernap]) {
    [(PMSmartPowerNapPredictor *)self exitSmartPowerNapWithReason:@"MotionDetected"];
  }
}

- (void)initMotionAlarm
{
  id v3 = [objc_alloc((Class)CMMotionAlarmManager) initWithName:@"com.apple.powerd"];
  [(PMSmartPowerNapPredictor *)self setMotion_alarm_manager:v3];

  uint64_t v4 = [(PMSmartPowerNapPredictor *)self motion_alarm_manager];
  [v4 setDelegate:self];

  [(PMSmartPowerNapPredictor *)self setMotion_alarm_threshold:1800];
  [(PMSmartPowerNapPredictor *)self setMotion_alarm_start_before:3600];

  [(PMSmartPowerNapPredictor *)self setMotion_alarm_set:0];
}

- (void)registerMotionAlarm
{
  id v3 = [(PMSmartPowerNapPredictor *)self motion_alarm_manager];
  id v6 = 0;
  unsigned __int8 v4 = objc_msgSend(v3, "registerAlarmWithName:type:duration:repeats:error:", @"SPN motion alarm", 6, -[PMSmartPowerNapPredictor motion_alarm_threshold](self, "motion_alarm_threshold"), 0, &v6);
  id v5 = v6;

  if ((v4 & 1) != 0 || !v5)
  {
    [(PMSmartPowerNapPredictor *)self setMotion_alarm_set:1];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR))
  {
    sub_100063860();
  }
}

- (void)unregisterMotionAlarm
{
  id v3 = [(PMSmartPowerNapPredictor *)self motion_alarm_manager];
  id v6 = 0;
  unsigned __int8 v4 = [v3 unregisterAlarmWithName:@"SPN motion alarm" error:&v6];
  id v5 = v6;

  if ((v4 & 1) != 0 || !v5)
  {
    [(PMSmartPowerNapPredictor *)self setMotion_alarm_set:0];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR))
  {
    sub_1000638C8();
  }
}

- (void)alarmDidRegister:(id)a3 error:(id)a4
{
  unsigned __int8 v4 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: motion alarm did register", v5, 2u);
  }
}

- (void)alarmDidUnregister:(id)a3 error:(id)a4
{
  unsigned __int8 v4 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: motion alarm did unregister", v5, 2u);
  }
}

- (void)alarmDidFire:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: motion alarm did fire alarm %@, error %@", buf, 0x16u);
  }
  id v11 = 0;
  [v6 acknowledgeWithError:&v11];
  id v9 = v11;
  uint64_t v10 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: Motion detected", buf, 2u);
  }
  [(PMSmartPowerNapPredictor *)self updateMotionState:1];
}

- (void)handleUserInterruption:(BOOL)a3
{
  if (a3)
  {
    [(PMSmartPowerNapPredictor *)self evaluateInterruption:1];
    unsigned __int8 v4 = +[NSDate date];
    [(PMSmartPowerNapPredictor *)self setInactivity_end:v4];

    id v5 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEBUG)) {
      sub_100063964(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    PLLogRegisteredEvent();
    id v13 = [(PMSmartPowerNapPredictor *)self evaluation_timer];

    if (v13)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEBUG)) {
        sub_100063930();
      }
      __int16 v14 = [(PMSmartPowerNapPredictor *)self evaluation_timer];
      dispatch_source_cancel(v14);
    }
    if ([(PMSmartPowerNapPredictor *)self in_smartpowernap])
    {
      id v15 = qword_1000A34F0;
      if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: user interrupted. Exit SmartPowerNap", buf, 2u);
      }
      [(PMSmartPowerNapPredictor *)self exitSmartPowerNapWithReason:@"UserInterrupted"];
    }
    uint64_t v16 = [(PMSmartPowerNapPredictor *)self session_end_reason];

    if (v16)
    {
      uint64_t v17 = [(PMSmartPowerNapPredictor *)self session_end_reason];

      if (v17 == @"UserInterrupted")
      {
        [(PMSmartPowerNapPredictor *)self max_interruption_duration];
        dispatch_time_t v26 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)((v25 + 1.0) * 1000000000.0));
        double v27 = [(PMSmartPowerNapPredictor *)self queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000C2FC;
        block[3] = &unk_1000911E8;
        void block[4] = self;
        dispatch_after(v26, v27, block);
      }
      else
      {
        uint64_t v18 = [(PMSmartPowerNapPredictor *)self session_end_reason];
        [(PMSmartPowerNapPredictor *)self logEndOfSessionWithReason:v18];

        [(PMSmartPowerNapPredictor *)self logTransientInterruptions];
        [(PMSmartPowerNapPredictor *)self setSession_end_reason:0];
      }
    }
    else
    {
      uint64_t v19 = [(PMSmartPowerNapPredictor *)self inactivity_start];
      if (v19)
      {
        unsigned __int8 v20 = (void *)v19;
        uint64_t v21 = [(PMSmartPowerNapPredictor *)self inactivity_end];
        if (v21)
        {
          uint64_t v22 = (void *)v21;
          uint64_t v23 = [(PMSmartPowerNapPredictor *)self last_session_end_reason];
          unsigned __int8 v24 = [v23 isEqualToString:@"MotionDetected"];

          if ((v24 & 1) == 0) {
            [(PMSmartPowerNapPredictor *)self logNotEngaging];
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
    -[PMSmartPowerNapPredictor evaluateInterruption:](self, "evaluateInterruption:");
  }
}

- (void)postSPNDarwinNotification:(unint64_t)a3
{
  if (!notify_register_check("com.apple.powerd.smartpowernap", &dword_1000A4648))
  {
    notify_set_state(dword_1000A4648, a3);
    notify_post("com.apple.powerd.smartpowernap");
  }
}

- (void)postSPNInterruptionNotification:(unint64_t)a3
{
  if (!notify_register_check("com.apple.powerd.smartpowernap.interruption", &dword_1000A464C))
  {
    notify_set_state(dword_1000A464C, a3);
    notify_post("com.apple.powerd.smartpowernap.interruption");
  }
}

- (void)logEndOfSessionWithReason:(id)a3
{
  uint64_t v5 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
  if (v5)
  {
    id v14 = (id)v5;
    uint64_t v6 = [(PMSmartPowerNapPredictor *)self full_session_end_time];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = [(PMSmartPowerNapPredictor *)self predictor_output];

      if (v8)
      {
        BOOL v10 = a3 == @"UserInterrupted" || a3 == @"MotionDetected";
        uint64_t v11 = [(PMSmartPowerNapPredictor *)self CAEventForEngagedSessionWhereUserInterrupted:v10];
        uint64_t v12 = qword_1000A34F0;
        if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SmartPowerNap end-of-session metrics %@", buf, 0xCu);
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
  id v3 = [(PMSmartPowerNapPredictor *)self inactivity_end];
  unsigned __int8 v4 = [(PMSmartPowerNapPredictor *)self inactivity_start];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;
  [(PMSmartPowerNapPredictor *)self delta_to_query];
  double v8 = v7;

  if (v6 <= v8)
  {
    uint64_t v9 = [(PMSmartPowerNapPredictor *)self CAEventForInactivityTooShortToQueryModel];
    uint64_t v16 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SmartPowerNap session did not engage because inactivity was shorter than delta-to-query", buf, 2u);
    }
  }
  else
  {
    uint64_t v9 = [(PMSmartPowerNapPredictor *)self CAEventForModelHesitancy];
    BOOL v10 = (void *)qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v10;
      uint64_t v12 = [(PMSmartPowerNapPredictor *)self predictor_output];
      [v12 confidenceValue];
      uint64_t v14 = v13;
      id v15 = [(PMSmartPowerNapPredictor *)self predictor_output];
      *(_DWORD *)buf = 134218240;
      uint64_t v20 = v14;
      __int16 v21 = 2048;
      id v22 = [v15 confidenceLevel];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SmartPowerNap session did not engage model confidence: %lf:%ld", buf, 0x16u);
    }
  }
  uint64_t v18 = v9;
  id v17 = v9;
  AnalyticsSendEventLazy();
}

- (void)logTransientInterruptions
{
  id v3 = [(PMSmartPowerNapPredictor *)self interruptions];
  id v4 = [v3 count];

  if (v4)
  {
    unint64_t v6 = 0;
    *(void *)&long long v5 = 138412802;
    long long v28 = v5;
    do
    {
      double v7 = [(PMSmartPowerNapPredictor *)self interruptions];
      double v8 = [v7 objectAtIndexedSubscript:v6];

      uint64_t v9 = (void *)qword_1000A34F0;
      if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = v9;
        uint64_t v11 = [v8 start];
        uint64_t v12 = [v8 end];
        uint64_t v13 = [v8 end];
        uint64_t v14 = [v8 start];
        [v13 timeIntervalSinceDate:v14];
        *(_DWORD *)buf = v28;
        __int16 v30 = v11;
        __int16 v31 = 2112;
        id v32 = v12;
        __int16 v33 = 2048;
        uint64_t v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Metrics: interruption start: %@ end %@ duration %f", buf, 0x20u);
      }
      uint64_t v16 = [(PMSmartPowerNapPredictor *)self CAEventForInterruption:v8];
      [0 addEntriesFromDictionary:v16];

      if (objc_msgSend(v8, "is_transient"))
      {
        id v17 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
        [(PMSmartPowerNapPredictor *)self delta_to_query];
        uint64_t v19 = [v17 dateByAddingTimeInterval:-v18];

        if (v6)
        {
          uint64_t v20 = [(PMSmartPowerNapPredictor *)self interruptions];
          __int16 v21 = [v20 objectAtIndexedSubscript:(v6 - 1)];
          id v22 = [v21 end];
        }
        else
        {
          id v22 = v19;
        }
        uint64_t v23 = [v8 start];
        [v23 timeIntervalSinceDate:v22];
        double v25 = +[NSNumber numberWithDouble:v24 / 60.0];
        [0 setObject:v25 forKeyedSubscript:@"inactivityDuration"];
      }
      AnalyticsSendEventLazy();

      ++v6;
      dispatch_time_t v26 = [(PMSmartPowerNapPredictor *)self interruptions];
      id v27 = [v26 count];
    }
    while ((unint64_t)v27 > v6);
  }
}

- (id)sleepTimeBucketOfDate:(id)a3 AtResolution:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v6 = +[NSCalendar currentCalendar];
  double v7 = [v6 components:32 fromDate:v5];

  double v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((uint64_t)[v7 hour] + 4) % 24 / a4);

  return v8;
}

- (id)CAEventForEngagedSessionWhereUserInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PMSmartPowerNapPredictor *)self inactivity_predictor];
  unint64_t v6 = [v5 modelMetadata];

  double v7 = [(PMSmartPowerNapPredictor *)self full_session_end_time];
  double v8 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  uint64_t v11 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
  [(PMSmartPowerNapPredictor *)self delta_to_query];
  uint64_t v13 = [v11 dateByAddingTimeInterval:-v12];

  uint64_t v14 = [(PMSmartPowerNapPredictor *)self inactivity_end];
  v94 = (void *)v13;
  [v14 timeIntervalSinceDate:v13];
  double v16 = v15 / 3600.0;

  id v17 = [(PMSmartPowerNapPredictor *)self inactivity_end];
  double v18 = [(PMSmartPowerNapPredictor *)self inactivity_start];
  [v17 timeIntervalSinceDate:v18];
  double v20 = v19 / 3600.0;

  if (v6)
  {
    [v6 longThreshold];
    BOOL v22 = v16 * 3600.0 > v21;
  }
  else
  {
    BOOL v22 = 0;
  }
  uint64_t v23 = [(PMSmartPowerNapPredictor *)self predictor_output];
  [v23 predictedDuration];
  double v25 = v24;

  [(PMSmartPowerNapPredictor *)self delta_to_query];
  double v27 = v26 / 3600.0;
  double v28 = v25 + v26 / 3600.0;
  double v29 = [(PMSmartPowerNapPredictor *)self trial_client];
  __int16 v30 = [v29 treatmentIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  v96 = [v30 description];

  __int16 v31 = [(PMSmartPowerNapPredictor *)self trial_client];
  id v32 = [v31 rolloutIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  v95 = [v32 description];

  __int16 v33 = [(PMSmartPowerNapPredictor *)self trial_client];
  uint64_t v34 = [v33 experimentIdentifiersWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  uint64_t v35 = [v34 description];

  v92 = objc_opt_new();
  v103[0] = @"userInterrupted";
  v90 = +[NSNumber numberWithBool:v3];
  v104[0] = v90;
  v103[1] = @"modelConfidence";
  v89 = [(PMSmartPowerNapPredictor *)self predictor_output];
  [v89 confidenceValue];
  v88 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v104[1] = v88;
  v104[2] = &__kCFBooleanTrue;
  v103[2] = @"modelEngaged";
  v103[3] = @"confusionMatrixResult";
  CFStringRef v36 = @"TP";
  if (!v22) {
    CFStringRef v36 = @"FP";
  }
  v104[3] = v36;
  v103[4] = @"falsePositive";
  BOOL v91 = v22;
  v87 = +[NSNumber numberWithInt:!v22];
  v104[4] = v87;
  v103[5] = @"truePositive";
  v86 = +[NSNumber numberWithBool:v22];
  v104[5] = v86;
  v103[6] = @"isFalseEngageInt";
  v85 = +[NSNumber numberWithInt:!v22];
  v104[6] = v85;
  v103[7] = @"predictedDuration";
  v84 = +[NSNumber numberWithDouble:v28];
  v104[7] = v84;
  v103[8] = @"inactivityDuration";
  v83 = +[NSNumber numberWithDouble:v20 * 60.0];
  v104[8] = v83;
  v103[9] = @"underPredicted";
  v82 = +[NSNumber numberWithInt:v3 ^ 1];
  v104[9] = v82;
  v103[10] = @"overPredicted";
  BOOL v93 = v3;
  v81 = +[NSNumber numberWithBool:v3];
  v104[10] = v81;
  v103[11] = @"durationDelta";
  v80 = +[NSNumber numberWithDouble:(v28 - v16) * 60.0];
  v104[11] = v80;
  v103[12] = @"eligibleTimeout";
  [(PMSmartPowerNapPredictor *)self delta_to_query];
  __int16 v38 = +[NSNumber numberWithDouble:v37 / 60.0];
  v104[12] = v38;
  v103[13] = @"longThreshold";
  double v39 = 0.0;
  double v40 = 0.0;
  if (v6)
  {
    objc_msgSend(v6, "longThreshold", 0.0);
    double v40 = v41 / 60.0;
  }
  double v42 = +[NSNumber numberWithDouble:v40];
  v104[13] = v42;
  v103[14] = @"modelVersion";
  uint64_t v43 = [v6 modelVersion];
  v44 = (void *)v43;
  if (v43) {
    CFStringRef v45 = (const __CFString *)v43;
  }
  else {
    CFStringRef v45 = @"None";
  }
  v104[14] = v45;
  v103[15] = @"predictorType";
  uint64_t v46 = [v6 predictorType];
  double v47 = (void *)v46;
  if (v46) {
    CFStringRef v48 = (const __CFString *)v46;
  }
  else {
    CFStringRef v48 = @"None";
  }
  v104[15] = v48;
  v103[16] = @"queryType";
  uint64_t v49 = [v6 queryingMechanism];
  double v50 = (void *)v49;
  if (v49) {
    CFStringRef v51 = (const __CFString *)v49;
  }
  else {
    CFStringRef v51 = @"None";
  }
  v104[16] = v51;
  v103[17] = @"confidentThreshold";
  if (v6)
  {
    [v6 confidenceThresholdStrict];
    double v39 = v52;
  }
  double v53 = v10 / 3600.0;
  uint64_t v54 = +[NSNumber numberWithDouble:v39];
  uint64_t v55 = (void *)v54;
  if (v35) {
    CFStringRef v56 = v35;
  }
  else {
    CFStringRef v56 = @"None";
  }
  v104[17] = v54;
  v104[18] = v56;
  v103[18] = @"experimentId";
  v103[19] = @"rolloutId";
  v103[20] = @"treatmentId";
  if (v95) {
    CFStringRef v57 = v95;
  }
  else {
    CFStringRef v57 = @"None";
  }
  CFStringRef v58 = v96;
  if (!v96) {
    CFStringRef v58 = @"None";
  }
  v104[19] = v57;
  v104[20] = v58;
  v59 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:21];
  [v92 addEntriesFromDictionary:v59];

  if (v91)
  {
    unsigned int v60 = +[NSNumber numberWithDouble:v53];
    [v92 setObject:v60 forKeyedSubscript:@"actualCapturedDuration"];

    unsigned int v61 = +[NSNumber numberWithDouble:v16 - v27];
    [v92 setObject:v61 forKeyedSubscript:@"idealUsableDuration"];

    v62 = +[NSNumber numberWithDouble:v16 - v27 - v53];
    [v92 setObject:v62 forKeyedSubscript:@"missedSuppressionDuration"];
  }
  v63 = [v92 objectForKeyedSubscript:@"durationDelta"];
  [v63 doubleValue];
  double v65 = v64;

  if (v93)
  {
    if (v65 < 0.0 && os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR)) {
      sub_100063A54();
    }
  }
  else if (v65 > 0.0)
  {
    v66 = (void *)qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v78 = v66;
      v79 = [v92 objectForKeyedSubscript:@"durationDelta"];
      *(_DWORD *)buf = 134218498;
      double v98 = v28;
      __int16 v99 = 2048;
      double v100 = v16;
      __int16 v101 = 2112;
      v102 = v79;
      _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "Session ended naturally but predicted duration (%.2f hours) > inactivity duration (%.2f hours), %@", buf, 0x20u);
    }
  }
  v67 = [v92 objectForKeyedSubscript:@"idealUsableDuration"];
  [v67 doubleValue];
  double v69 = v68;

  if (v69 < 0.0 && os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR)) {
    sub_1000639DC();
  }
  v70 = [v92 objectForKeyedSubscript:@"missedSuppressionDuration"];
  [v70 doubleValue];
  double v72 = v71;

  if (v72 < 0.0)
  {
    BOOL v73 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      double v98 = v16;
      __int16 v99 = 2048;
      double v100 = v53 + v27;
      _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "Inactivity duration (%.2f hours) < recommended wait time + session duration (%.2f hours)", buf, 0x16u);
    }
  }
  v74 = qword_1000A34F0;
  BOOL v75 = os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT);
  if (v93)
  {
    if (!v75) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 138412290;
    double v98 = *(double *)&v92;
    unsigned int v76 = "User interrupted session. Reporting over-prediction event to CA: %@";
  }
  else
  {
    if (!v75) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 138412290;
    double v98 = *(double *)&v92;
    unsigned int v76 = "Session ended naturally. Reporting under-prediction event to CA: %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, v76, buf, 0xCu);
LABEL_48:

  return v92;
}

- (id)CAEventForModelHesitancy
{
  BOOL v3 = [(PMSmartPowerNapPredictor *)self inactivity_predictor];
  id v4 = [v3 modelMetadata];

  id v5 = [(PMSmartPowerNapPredictor *)self inactivity_end];
  unint64_t v6 = [(PMSmartPowerNapPredictor *)self inactivity_start];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7 / 3600.0;

  if (v4)
  {
    [v4 longThreshold];
    BOOL v10 = v8 * 3600.0 > v9;
  }
  else
  {
    BOOL v10 = 0;
  }
  [(PMSmartPowerNapPredictor *)self delta_to_query];
  double v12 = v11;
  uint64_t v13 = objc_opt_new();
  v59[0] = @"modelConfidence";
  uint64_t v55 = [(PMSmartPowerNapPredictor *)self predictor_output];
  [v55 confidenceValue];
  uint64_t v54 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v60[0] = v54;
  v60[1] = &__kCFBooleanFalse;
  v59[1] = @"modelEngaged";
  v59[2] = @"confusionMatrixResult";
  CFStringRef v14 = @"TN";
  if (v10) {
    CFStringRef v14 = @"FN";
  }
  v60[2] = v14;
  v59[3] = @"falseNegative";
  double v53 = +[NSNumber numberWithBool:v10];
  v60[3] = v53;
  v59[4] = @"trueNegative";
  BOOL v56 = v10;
  double v52 = +[NSNumber numberWithInt:!v10];
  v60[4] = v52;
  v60[5] = &off_10009A488;
  v59[5] = @"isFalseEngageInt";
  v59[6] = @"inactivityDuration";
  CFStringRef v51 = +[NSNumber numberWithDouble:v8 * 60.0];
  v60[6] = v51;
  v59[7] = @"eligibleTimeout";
  [(PMSmartPowerNapPredictor *)self delta_to_query];
  double v16 = +[NSNumber numberWithDouble:v15 / 60.0];
  v60[7] = v16;
  v59[8] = @"longThreshold";
  double v17 = 0.0;
  double v18 = 0.0;
  if (v4)
  {
    objc_msgSend(v4, "longThreshold", 0.0);
    double v18 = v19 / 60.0;
  }
  double v20 = +[NSNumber numberWithDouble:v18];
  v60[8] = v20;
  v59[9] = @"modelVersion";
  uint64_t v21 = [v4 modelVersion];
  BOOL v22 = (void *)v21;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  else {
    CFStringRef v23 = @"None";
  }
  v60[9] = v23;
  v59[10] = @"predictorType";
  uint64_t v24 = [v4 predictorType];
  double v25 = (void *)v24;
  if (v24) {
    CFStringRef v26 = (const __CFString *)v24;
  }
  else {
    CFStringRef v26 = @"None";
  }
  v60[10] = v26;
  v59[11] = @"queryType";
  uint64_t v27 = [v4 queryingMechanism];
  double v28 = (void *)v27;
  if (v27) {
    CFStringRef v29 = (const __CFString *)v27;
  }
  else {
    CFStringRef v29 = @"None";
  }
  v60[11] = v29;
  v59[12] = @"confidentThreshold";
  if (v4)
  {
    [v4 confidenceThresholdStrict];
    double v17 = v30;
  }
  __int16 v31 = +[NSNumber numberWithDouble:v17];
  v60[12] = v31;
  id v32 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:13];
  [v13 addEntriesFromDictionary:v32];

  if (v56)
  {
    [v13 setObject:&off_10009A488 forKeyedSubscript:@"actualCapturedDuration"];
    double v33 = v8 - v12 / 3600.0;
    uint64_t v34 = +[NSNumber numberWithDouble:v33];
    [v13 setObject:v34 forKeyedSubscript:@"idealUsableDuration"];

    uint64_t v35 = +[NSNumber numberWithDouble:v33];
    [v13 setObject:v35 forKeyedSubscript:@"missedSuppressionDuration"];
  }
  CFStringRef v36 = [(PMSmartPowerNapPredictor *)self trial_client];
  double v37 = [v36 treatmentIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  __int16 v38 = [v37 description];

  double v39 = [(PMSmartPowerNapPredictor *)self trial_client];
  double v40 = [v39 rolloutIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  double v41 = [v40 description];

  double v42 = [(PMSmartPowerNapPredictor *)self trial_client];
  uint64_t v43 = [v42 experimentIdentifiersWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  v44 = [v43 description];

  if (v44) {
    CFStringRef v45 = v44;
  }
  else {
    CFStringRef v45 = @"None";
  }
  [v13 setObject:v45 forKeyedSubscript:@"experimentId"];
  if (v41) {
    CFStringRef v46 = v41;
  }
  else {
    CFStringRef v46 = @"None";
  }
  [v13 setObject:v46 forKeyedSubscript:@"rolloutId"];
  if (v38) {
    CFStringRef v47 = v38;
  }
  else {
    CFStringRef v47 = @"None";
  }
  [v13 setObject:v47 forKeyedSubscript:@"treatmentId"];
  CFStringRef v48 = [v13 objectForKeyedSubscript:@"idealUsableDuration"];
  [v13 objectForKeyedSubscript:@"missedSuppressionDuration"];

  uint64_t v49 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v58 = v13;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Model was not confident to engage for this inactivity. Reporting hesitancy event to CA: %@", buf, 0xCu);
  }

  return v13;
}

- (id)CAEventForInactivityTooShortToQueryModel
{
  BOOL v3 = [(PMSmartPowerNapPredictor *)self inactivity_end];
  id v4 = [(PMSmartPowerNapPredictor *)self inactivity_start];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5 / 3600.0;

  double v7 = objc_opt_new();
  double v8 = +[NSNumber numberWithDouble:v6 * 60.0];
  [v7 setObject:v8 forKeyedSubscript:@"inactivityDuration"];

  double v9 = [(PMSmartPowerNapPredictor *)self trial_client];
  BOOL v10 = [v9 treatmentIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  double v11 = [v10 description];

  double v12 = [(PMSmartPowerNapPredictor *)self trial_client];
  uint64_t v13 = [v12 rolloutIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  CFStringRef v14 = [v13 description];

  double v15 = [(PMSmartPowerNapPredictor *)self trial_client];
  double v16 = [v15 experimentIdentifiersWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  double v17 = [v16 description];

  if (v17) {
    CFStringRef v18 = v17;
  }
  else {
    CFStringRef v18 = @"None";
  }
  [v7 setObject:v18 forKeyedSubscript:@"experimentId"];
  if (v14) {
    CFStringRef v19 = v14;
  }
  else {
    CFStringRef v19 = @"None";
  }
  [v7 setObject:v19 forKeyedSubscript:@"rolloutId"];
  if (v11) {
    CFStringRef v20 = v11;
  }
  else {
    CFStringRef v20 = @"None";
  }
  [v7 setObject:v20 forKeyedSubscript:@"treatmentId"];
  uint64_t v21 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    uint64_t v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Inactivity was too short to even consult the model. Reporting very short inactivity event to CA: %@", (uint8_t *)&v23, 0xCu);
  }

  return v7;
}

- (id)CAEventForInterruption:(id)a3
{
  id v4 = a3;
  double v5 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
  [(PMSmartPowerNapPredictor *)self delta_to_query];
  double v7 = [v5 dateByAddingTimeInterval:-v6];

  double v8 = [(PMSmartPowerNapPredictor *)self full_session_start_time];
  double v9 = [(PMSmartPowerNapPredictor *)self predictor_output];
  [v9 predictedDuration];
  double v11 = [v8 dateByAddingTimeInterval:v10 * 3600.0];

  double v12 = objc_opt_new();
  uint64_t v13 = [v4 start];
  [v13 timeIntervalSinceDate:v7];
  double v15 = +[NSNumber numberWithDouble:v14 / 3600.0];
  [v12 setObject:v15 forKeyedSubscript:@"intrTimeSinceInactivityStart"];

  double v16 = [v4 start];
  [v11 timeIntervalSinceDate:v16];
  CFStringRef v18 = +[NSNumber numberWithDouble:v17 / 3600.0];
  [v12 setObject:v18 forKeyedSubscript:@"intrTimeUntilPredictionEnd"];

  CFStringRef v19 = [v4 start];
  CFStringRef v20 = [(PMSmartPowerNapPredictor *)self sleepTimeBucketOfDate:v19 AtResolution:2];
  [v12 setObject:v20 forKeyedSubscript:@"intrStartTimeBucket_2"];

  uint64_t v21 = [v4 start];
  BOOL v22 = [(PMSmartPowerNapPredictor *)self sleepTimeBucketOfDate:v21 AtResolution:4];
  [v12 setObject:v22 forKeyedSubscript:@"intrStartTimeBucket_4"];

  int v23 = [(PMSmartPowerNapPredictor *)self trial_client];
  uint64_t v24 = [v23 treatmentIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  double v25 = [v24 description];

  CFStringRef v26 = [(PMSmartPowerNapPredictor *)self trial_client];
  uint64_t v27 = [v26 rolloutIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  double v28 = [v27 description];

  CFStringRef v29 = [(PMSmartPowerNapPredictor *)self trial_client];
  double v30 = [v29 experimentIdentifiersWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  __int16 v31 = [v30 description];

  if (v31) {
    CFStringRef v32 = v31;
  }
  else {
    CFStringRef v32 = @"None";
  }
  [v12 setObject:v32 forKeyedSubscript:@"experimentId"];
  if (v28) {
    CFStringRef v33 = v28;
  }
  else {
    CFStringRef v33 = @"None";
  }
  [v12 setObject:v33 forKeyedSubscript:@"rolloutId"];
  if (v25) {
    CFStringRef v34 = v25;
  }
  else {
    CFStringRef v34 = @"None";
  }
  [v12 setObject:v34 forKeyedSubscript:@"treatmentId"];
  [v12 objectForKeyedSubscript:@"intrTimeSinceInactivityStart"];

  [v12 objectForKeyedSubscript:@"intrTimeUntilPredictionEnd"];
  uint64_t v35 = (void *)qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v36 = v35;
    unsigned int v37 = objc_msgSend(v4, "is_transient");
    CFStringRef v38 = &stru_100093D08;
    if (v37) {
      CFStringRef v38 = @"transient ";
    }
    int v40 = 138412546;
    CFStringRef v41 = v38;
    __int16 v42 = 2112;
    uint64_t v43 = v12;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Logging metrics for %@interruption: %@", (uint8_t *)&v40, 0x16u);
  }

  return v12;
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
    double v5 = self->_trial_client;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000E390;
    v7[3] = &unk_100091410;
    objc_copyWeak(&v8, &location);
    id v6 = [(TRIClient *)v5 addUpdateHandlerForNamespaceName:@"COREOS_PREDICTION_INACTIVITY" usingBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)updateTrialFactors
{
  BOOL v3 = [(PMSmartPowerNapPredictor *)self trial_client];

  if (v3)
  {
    id v4 = [(PMSmartPowerNapPredictor *)self trial_client];
    double v5 = [v4 levelForFactor:@"maxInterruptionCountPerSession" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];

    -[PMSmartPowerNapPredictor setMax_interruptions:](self, "setMax_interruptions:", [v5 longValue]);
    id v6 = [(PMSmartPowerNapPredictor *)self trial_client];
    double v7 = [v6 levelForFactor:@"maxInterruptionDurationSecondsPerSession" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];

    [v7 doubleValue];
    -[PMSmartPowerNapPredictor setMax_interruption_duration:](self, "setMax_interruption_duration:");
    id v8 = [(PMSmartPowerNapPredictor *)self trial_client];
    double v9 = [v8 levelForFactor:@"maxInterruptionSessionDuration" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];

    [v9 doubleValue];
    -[PMSmartPowerNapPredictor setCumulative_interruption_session_duration:](self, "setCumulative_interruption_session_duration:");
    double v10 = [(PMSmartPowerNapPredictor *)self trial_client];
    double v11 = [v10 levelForFactor:@"reentryDelay" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];

    -[PMSmartPowerNapPredictor setReentry_delay:](self, "setReentry_delay:", [v11 longValue]);
    double v12 = [(PMSmartPowerNapPredictor *)self trial_client];
    uint64_t v13 = [v12 levelForFactor:@"requeryDelta" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];

    -[PMSmartPowerNapPredictor setRequery_delta:](self, "setRequery_delta:", [v13 longValue]);
    double v14 = [(PMSmartPowerNapPredictor *)self trial_client];
    double v15 = [v14 levelForFactor:@"reentryCoolOffStart" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];

    -[PMSmartPowerNapPredictor setInterruption_cooloff_start:](self, "setInterruption_cooloff_start:", [v15 longValue]);
    double v16 = [(PMSmartPowerNapPredictor *)self trial_client];
    double v17 = [v16 levelForFactor:@"reentryCoolOffEnd" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];

    __int16 v31 = v17;
    -[PMSmartPowerNapPredictor setInterruption_cooloff_end:](self, "setInterruption_cooloff_end:", [v17 longValue]);
    CFStringRef v18 = [(PMSmartPowerNapPredictor *)self trial_client];
    CFStringRef v19 = [v18 levelForFactor:@"motionAlarmThreshold" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];

    -[PMSmartPowerNapPredictor setMotion_alarm_threshold:](self, "setMotion_alarm_threshold:", [v19 longValue]);
    CFStringRef v20 = [(PMSmartPowerNapPredictor *)self trial_client];
    uint64_t v21 = [v20 levelForFactor:@"motionAlarmStartThreshold" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];

    -[PMSmartPowerNapPredictor setMotion_alarm_start_before:](self, "setMotion_alarm_start_before:", [v21 longValue]);
    BOOL v22 = (void *)qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v29 = v22;
      double v30 = v13;
      int v23 = v9;
      uint64_t v24 = v5;
      unsigned int v25 = [(PMSmartPowerNapPredictor *)self max_interruptions];
      [(PMSmartPowerNapPredictor *)self max_interruption_duration];
      uint64_t v27 = v26;
      [(PMSmartPowerNapPredictor *)self cumulative_interruption_session_duration];
      *(_DWORD *)buf = 67110144;
      unsigned int v33 = v25;
      double v5 = v24;
      double v9 = v23;
      __int16 v34 = 2048;
      uint64_t v35 = v27;
      __int16 v36 = 2048;
      uint64_t v37 = v28;
      __int16 v38 = 1024;
      unsigned int v39 = [(PMSmartPowerNapPredictor *)self reentry_delay];
      __int16 v40 = 1024;
      unsigned int v41 = [(PMSmartPowerNapPredictor *)self requery_delta];
      uint64_t v13 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "SmartPowerNap: updated Trial factors to num %d, duration %f, interruption session %f, reentry delay %d requery_delta %d", buf, 0x28u);
    }
  }
}

- (void)updateReentryCoolOffPeriod:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating re-entry cooloff period to %u\n", (uint8_t *)v6, 8u);
  }
  [(PMSmartPowerNapPredictor *)self setInterruption_cooloff_start:v3];
  [(PMSmartPowerNapPredictor *)self setInterruption_cooloff_end:v3];
}

- (void)updateReentryDelaySeconds:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating re-entry delay to %u seconds\n", (uint8_t *)v6, 8u);
  }
  [(PMSmartPowerNapPredictor *)self setReentry_delay:v3];
}

- (void)updateRequeryDelta:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating requery delta to %u seconds", (uint8_t *)v6, 8u);
  }
  [(PMSmartPowerNapPredictor *)self setRequery_delta:v3];
}

- (void)updateMotionAlarmThreshold:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating motion alarm threshold to %u seconds", (uint8_t *)v6, 8u);
  }
  [(PMSmartPowerNapPredictor *)self setMotion_alarm_threshold:v3];
}

- (void)updateMotionAlarmStartThreshold:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = qword_1000A34F0;
  if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating motion alarm start threshold to %u seconds", (uint8_t *)v6, 8u);
  }
  [(PMSmartPowerNapPredictor *)self setMotion_alarm_start_before:v3];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)evaluation_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEvaluation_timer:(id)a3
{
}

- (OS_dispatch_source)end_session_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEnd_session_timer:(id)a3
{
}

- (OS_dispatch_source)requery_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRequery_timer:(id)a3
{
}

- (_OSInactivityPredictionClient)inactivity_predictor
{
  return (_OSInactivityPredictionClient *)objc_getProperty(self, a2, 88, 1);
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

- (BOOL)in_smartpowernap
{
  return self->_in_smartpowernap;
}

- (void)setIn_smartpowernap:(BOOL)a3
{
  self->_in_smartpowernap = a3;
}

- (_OSInactivityPredictorOutput)predictor_output
{
  return (_OSInactivityPredictorOutput *)objc_getProperty(self, a2, 104, 1);
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

- (unint64_t)lock_state
{
  return self->_lock_state;
}

- (void)setLock_state:(unint64_t)a3
{
  self->_lock_state = a3;
}

- (BOOL)backlight_state
{
  return self->_backlight_state;
}

- (void)setBacklight_state:(BOOL)a3
{
  self->_backlight_state = a3;
}

- (BOOL)is_aod_enabled
{
  return self->_is_aod_enabled;
}

- (void)setIs_aod_enabled:(BOOL)a3
{
  self->_is_aod_enabled = a3;
}

- (BOOL)plugin_state
{
  return self->_plugin_state;
}

- (void)setPlugin_state:(BOOL)a3
{
  self->_plugin_state = a3;
}

- (BOOL)ambient_state
{
  return self->_ambient_state;
}

- (void)setAmbient_state:(BOOL)a3
{
  self->_ambient_state = a3;
}

- (NSDate)full_session_start_time
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFull_session_start_time:(id)a3
{
}

- (NSDate)full_session_end_time
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFull_session_end_time:(id)a3
{
}

- (NSDate)predicted_end_time
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPredicted_end_time:(id)a3
{
}

- (NSDate)inactivity_start
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInactivity_start:(id)a3
{
}

- (NSDate)inactivity_end
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInactivity_end:(id)a3
{
}

- (NSString)session_end_reason
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSession_end_reason:(id)a3
{
}

- (NSString)last_session_end_reason
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
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

- (int)num_interruptions
{
  return self->_num_interruptions;
}

- (void)setNum_interruptions:(int)a3
{
  self->_num_interruptions = a3;
}

- (double)duration_interruptions
{
  return self->_duration_interruptions;
}

- (void)setDuration_interruptions:(double)a3
{
  self->_duration_interruptions = a3;
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
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCurrent_session_start_time:(id)a3
{
}

- (BOOL)should_reenter
{
  return self->_should_reenter;
}

- (void)setShould_reenter:(BOOL)a3
{
  self->_should_reenter = a3;
}

- (int)max_interruptions
{
  return self->_max_interruptions;
}

- (void)setMax_interruptions:(int)a3
{
  self->_max_interruptions = a3;
}

- (BOOL)skipEndOfSessionTimer
{
  return self->_skipEndOfSessionTimer;
}

- (void)setSkipEndOfSessionTimer:(BOOL)a3
{
  self->_skipEndOfSessionTimer = a3;
}

- (double)max_interruption_duration
{
  return self->_max_interruption_duration;
}

- (void)setMax_interruption_duration:(double)a3
{
  self->_max_interruption_duration = a3;
}

- (int)interruption_cooloff_start
{
  return self->_interruption_cooloff_start;
}

- (void)setInterruption_cooloff_start:(int)a3
{
  self->_interruption_cooloff_start = a3;
}

- (int)interruption_cooloff_end
{
  return self->_interruption_cooloff_end;
}

- (void)setInterruption_cooloff_end:(int)a3
{
  self->_interruption_cooloff_end = a3;
}

- (int)reentry_delay
{
  return self->_reentry_delay;
}

- (void)setReentry_delay:(int)a3
{
  self->_reentry_delay = a3;
}

- (double)cumulative_interruption_session_duration
{
  return self->_cumulative_interruption_session_duration;
}

- (void)setCumulative_interruption_session_duration:(double)a3
{
  self->_cumulative_interruption_session_duration = a3;
}

- (NSDate)cumulative_interruption_session_start
{
  return (NSDate *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCumulative_interruption_session_start:(id)a3
{
}

- (NSMutableArray)interruptions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setInterruptions:(id)a3
{
}

- (PMSmartPowerNapInterruption)current_interruption
{
  return (PMSmartPowerNapInterruption *)objc_getProperty(self, a2, 224, 1);
}

- (void)setCurrent_interruption:(id)a3
{
}

- (int)requery_delta
{
  return self->_requery_delta;
}

- (void)setRequery_delta:(int)a3
{
  self->_requery_delta = a3;
}

- (int)last_requery_delta
{
  return self->_last_requery_delta;
}

- (void)setLast_requery_delta:(int)a3
{
  self->_last_requery_delta = a3;
}

- (PMSmartPowerNapLocationMonitor)location_monitor
{
  return (PMSmartPowerNapLocationMonitor *)objc_getProperty(self, a2, 232, 1);
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
  return (BPSSink *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSink:(id)a3
{
}

- (TRIClient)trial_client
{
  return (TRIClient *)objc_getProperty(self, a2, 256, 1);
}

- (void)setTrial_client:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 264, 1);
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_trial_client, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_motion_alarm_manager, 0);
  objc_storeStrong((id *)&self->_location_monitor, 0);
  objc_storeStrong((id *)&self->_current_interruption, 0);
  objc_storeStrong((id *)&self->_interruptions, 0);
  objc_storeStrong((id *)&self->_cumulative_interruption_session_start, 0);
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