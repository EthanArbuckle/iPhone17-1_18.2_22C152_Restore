@interface ATSACCAClockDevice
- (ATSACCAClockDevice)initWithClockIdentifier:(unint64_t)a3 withPlugin:(id)a4;
- (ATSACCAClockDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4;
- (BOOL)changeSamplingRate:(double)a3;
- (id).cxx_construct;
- (int)performStartIO;
- (int)performStopIO;
- (int64_t)referenceCount;
- (unint64_t)clockIdentifier;
- (void)dealloc;
- (void)didBeginClockGrandmasterChangeForClock:(id)a3;
- (void)didChangeClockMasterForClock:(id)a3;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)didEndClockGrandmasterChangeForClock:(id)a3;
- (void)initializeFirstTimestamp:(id)a3;
- (void)setReferenceCount:(int64_t)a3;
@end

@implementation ATSACCAClockDevice

- (ATSACCAClockDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4
{
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[ATSACCAClockDevice initWithDeviceUID:withPlugin:]", a4);
  +[NSException raise:NSInvalidArgumentException, @"Do not call %@", v5 format];

  return 0;
}

- (ATSACCAClockDevice)initWithClockIdentifier:(unint64_t)a3 withPlugin:(id)a4
{
  id v6 = a4;
  if (TSNullClockIdentifier == a3)
  {

    v7 = 0;
  }
  else
  {
    v8 = +[TSClockManager timeSyncAudioClockDeviceUIDForClockIdentifier:a3];
    v41.receiver = self;
    v41.super_class = (Class)ATSACCAClockDevice;
    v9 = [(ATSACCAClockDevice *)&v41 initWithDeviceUID:v8 withPlugin:v6];
    v7 = v9;
    if (v9)
    {
      v9->_clockIdentifier = a3;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      id v12 = +[NSString stringWithFormat:@"com.apple.AppleTimeSyncAudioClock.%@.%@.workloop", v11, v8];
      inactive = dispatch_workloop_create_inactive((const char *)[v12 UTF8String]);

      dispatch_workloop_set_scheduler_priority();
      dispatch_activate(inactive);
      v14 = dispatch_queue_attr_make_initially_inactive(0);
      attr = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);

      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      id v17 = +[NSString stringWithFormat:@"com.apple.AppleTimeSyncAudioClock.%@.%@.timer", v16, v8];
      dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], attr);
      timerQueue = v7->_timerQueue;
      v7->_timerQueue = (OS_dispatch_queue *)v18;

      dispatch_set_target_queue((dispatch_object_t)v7->_timerQueue, inactive);
      dispatch_activate((dispatch_object_t)v7->_timerQueue);
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      id v22 = +[NSString stringWithFormat:@"com.apple.AppleTimeSyncAudioClock.%@.%@.logging", v21, v8];
      dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
      loggingQueue = v7->_loggingQueue;
      v7->_loggingQueue = (OS_dispatch_queue *)v23;

      v25 = +[NSString stringWithFormat:@"TimeSync Clock 0x%016llx", a3];
      [(ATSACCAClockDevice *)v7 setDeviceName:v25];

      [(ATSACCAClockDevice *)v7 setManufacturerName:@"Apple Inc."];
      [(ATSACCAClockDevice *)v7 setModelName:@"TimeSync Audio Clock"];
      [(ATSACCAClockDevice *)v7 setModelUID:@"ATSAC:TimeSyncClockDevice"];
      [(ATSACCAClockDevice *)v7 setCanChangeDeviceName:0];
      [(ATSACCAClockDevice *)v7 setTransportType:1635017059];
      [(ATSACCAClockDevice *)v7 setSamplingRates:&off_C9B8];
      [(ATSACCAClockDevice *)v7 setSamplingRate:48000.0];
      [(ATSACCAClockDevice *)v7 samplingRate];
      [(ATSACCAClockDevice *)v7 setTimestampPeriod:(v26 * 260.0 / 1000.0)];
      unsigned int v40 = 0;
      v27 = +[TSClockManager sharedClockManager];
      id v39 = 0;
      unsigned int v28 = [v27 addMappingFromClockID:a3 toCoreAudioClockDomain:&v40 error:&v39];
      id v29 = v39;

      if (v28)
      {
        uint64_t v30 = v40;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not create mapping between clock identifier and CoreAudio clock domain\n", buf, 2u);
        }
        uint64_t v30 = 0;
        unsigned int v40 = 0;
      }
      [(ATSACCAClockDevice *)v7 setClockDomain:v30];
      id v31 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.audio.AppleTimeSyncAudioClock"];
      [v31 registerDefaults:&off_C9D0];
      -[ATSACCAClockDevice setClockIsStable:](v7, "setClockIsStable:", [v31 BOOLForKey:@"ClockIsStable"]);
      if ([v31 BOOLForKey:@"ClockUsesRawAlgorithm"]) {
        [(ATSACCAClockDevice *)v7 setClockAlgorithm:1918990199];
      }
      id v32 = objc_alloc((Class)TSIntervalFilter);
      v33 = +[TSClockManager sharedClockManager];
      v34 = (TSIntervalFilter *)objc_msgSend(v32, "initWithExpectedInterval:multiIntervalCount:filterSize:", objc_msgSend(v33, "machAbsoluteNanosecondsToTicks:", 260000000), 1, 6);
      intervalFilter = v7->_intervalFilter;
      v7->_intervalFilter = v34;

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_4FC8;
      v38[3] = &unk_C470;
      v38[4] = &v7->_timestamp;
      [(ATSACCAClockDevice *)v7 setGetZeroTimestampBlock:v38];
      if (os_parse_boot_arg_int() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v43 = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "timesync_atsac_async boot-arg set to %lld, ignoring", buf, 0xCu);
      }
      v7->_forceOutOfSync = 0;
    }
  }

  return v7;
}

- (int)performStartIO
{
  self->_hasLastTimestamp = 0;
  if (self->_forceOutOfSync)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting clock IO, forced out of sync due to boot-arg", buf, 2u);
    }
    v3 = +[TSClockManager sharedClockManager];
    v4 = [v3 timeSyncClock];
    clock = self->_clock;
    self->_clock = v4;
  }
  else
  {
    id v6 = +[TSClockManager sharedClockManager];
    objc_msgSend(v6, "clockWithClockIdentifier:", -[ATSACCAClockDevice clockIdentifier](self, "clockIdentifier"));
    v7 = (TSClock *)objc_claimAutoreleasedReturnValue();
    v8 = self->_clock;
    self->_clock = v7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = [(ATSACCAClockDevice *)self clockIdentifier];
    *(_DWORD *)buf = 134217984;
    unint64_t v41 = v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%016llx: starting IO\n", buf, 0xCu);
  }
  v10 = self->_clock;
  if (!v10) {
    return 1937010544;
  }
  [(TSClock *)v10 addClient:self];
  intervalFilter = self->_intervalFilter;
  id v12 = +[TSClockManager sharedClockManager];
  -[TSIntervalFilter resetFilterWithNewExpectedInterval:](intervalFilter, "resetFilterWithNewExpectedInterval:", [v12 machAbsoluteNanosecondsToTicks:260000000]);

  dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, (dispatch_queue_t)self->_timerQueue);
  v14 = +[TSClockManager sharedClockManager];
  id v15 = [v14 machAbsoluteNanosecondsToTicks:30000000];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_5580;
  handler[3] = &unk_C560;
  handler[4] = self;
  v16 = v13;
  long long v38 = xmmword_A210;
  v37 = v16;
  id v39 = v15;
  dispatch_source_set_event_handler(v16, handler);
  id v17 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  startSemaphore = self->_startSemaphore;
  self->_startSemaphore = v17;

  p_timerSource = &self->_timerSource;
  objc_storeStrong((id *)&self->_timerSource, v13);
  timerQueue = self->_timerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_64C8;
  block[3] = &unk_C588;
  block[4] = self;
  v21 = v16;
  v35 = v21;
  dispatch_async((dispatch_queue_t)timerQueue, block);
  id v22 = self->_startSemaphore;
  dispatch_time_t v23 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v22, v23))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = [(ATSACCAClockDevice *)self clockIdentifier];
      *(_DWORD *)buf = 134217984;
      unint64_t v41 = v24;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%016llx: Failed to start the timer running, took too long to lock the clock.\n", buf, 0xCu);
    }
    [(TSClock *)self->_clock removeClient:self];
    dispatch_source_set_event_handler((dispatch_source_t)*p_timerSource, 0);
    dispatch_source_t v25 = (dispatch_source_t)*p_timerSource;
    *p_timerSource = 0;

    double v26 = self->_timerQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_654C;
    v32[3] = &unk_C5B0;
    v32[4] = self;
    dispatch_sync((dispatch_queue_t)v26, v32);
    v27 = self->_clock;
    self->_clock = 0;

    self->_lastLockState = 0;
    dispatch_source_set_event_handler(v21, &stru_C5D0);
    dispatch_resume(v21);
    int v28 = 2003329396;
  }
  else
  {
    dispatch_resume(v21);
    v33.receiver = self;
    v33.super_class = (Class)ATSACCAClockDevice;
    int v28 = [(ATSACCAClockDevice *)&v33 performStartIO];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v29 = [(ATSACCAClockDevice *)self clockIdentifier];
      *(_DWORD *)buf = 134218240;
      unint64_t v41 = v29;
      __int16 v42 = 1024;
      int v43 = v28;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%016llx: started IO 0x%08x\n", buf, 0x12u);
    }
  }
  uint64_t v30 = self->_startSemaphore;
  self->_startSemaphore = 0;

  return v28;
}

- (int)performStopIO
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v12 = [(ATSACCAClockDevice *)self clockIdentifier];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%016llx: stopping IO\n", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)ATSACCAClockDevice;
  int v3 = [(ATSACCAClockDevice *)&v10 performStopIO];
  [(TSClock *)self->_clock removeClient:self];
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timerSource, 0);
  timerSource = self->_timerSource;
  self->_timerSource = 0;

  timerQueue = self->_timerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6828;
  block[3] = &unk_C5B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)timerQueue, block);
  clock = self->_clock;
  self->_clock = 0;

  self->_lastLockState = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [(ATSACCAClockDevice *)self clockIdentifier];
    *(_DWORD *)buf = 134218240;
    unint64_t v12 = v7;
    __int16 v13 = 1024;
    int v14 = v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%016llx: stopped IO 0x%08x\n", buf, 0x12u);
  }
  return v3;
}

- (BOOL)changeSamplingRate:(double)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_68DC;
  v4[3] = &unk_C5F8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  [(ATSACCAClockDevice *)self requestConfigurationChange:v4];
  return 1;
}

- (void)didChangeClockMasterForClock:(id)a3
{
  id v4 = a3;
  timerQueue = self->_timerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_69FC;
  v7[3] = &unk_C588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)timerQueue, v7);
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  id v6 = a4;
  timerQueue = self->_timerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6C34;
  block[3] = &unk_C648;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)timerQueue, block);
}

- (void)didBeginClockGrandmasterChangeForClock:(id)a3
{
  id v4 = a3;
  timerQueue = self->_timerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6EE0;
  v7[3] = &unk_C588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)timerQueue, v7);
}

- (void)didEndClockGrandmasterChangeForClock:(id)a3
{
  id v4 = a3;
  timerQueue = self->_timerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_710C;
  v7[3] = &unk_C588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)timerQueue, v7);
}

- (void)initializeFirstTimestamp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  clock = self->_clock;
  if (isKindOfClass) {
    unint64_t v8 = (unint64_t)[(TSClock *)clock convertFromMachAbsoluteToDomainTime:v5 grandmasterUsed:&self->_lastGrandmasterIdentity portNumber:&self->_lastPortNumber];
  }
  else {
    unint64_t v8 = (unint64_t)[(TSClock *)clock convertFromMachAbsoluteToDomainTime:v5];
  }
  if (v8 == TSInvalidTime)
  {
    unint64_t v9 = self->_clock;
    loggingQueue = self->_loggingQueue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_7DD0;
    v35[3] = &unk_C588;
    v35[4] = self;
    v36 = v9;
    int v11 = v9;
    dispatch_async((dispatch_queue_t)loggingQueue, v35);
  }
  else
  {
    self->_unint64_t lastDomainTimestamp = 260000000 * (v8 / 0xF7F4900);
    objc_opt_class();
    unint64_t v12 = &OBJC_IVAR___ATSACCAClockDevice__clockIdentifier;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v53 = TSNullgPTPClockIdentity;
      v54[0] = TSNullgPTPClockIdentity;
      __int16 v52 = -1;
      __int16 v51 = -1;
      self->_unint64_t lastMachTimestamp = (unint64_t)[(TSClock *)self->_clock convertFromDomainToMachAbsoluteTime:self->_lastDomainTimestamp grandmasterUsed:v54 portNumber:&v52];
      id v13 = [(TSClock *)self->_clock convertFromDomainToMachAbsoluteTime:self->_lastDomainTimestamp + 290000000 grandmasterUsed:&v53 portNumber:&v51];
      uint64_t v14 = v54[0];
      if (v54[0] == v53 && v52 == v51)
      {
        id v15 = v13;
      }
      else
      {
        v16 = self->_loggingQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_798C;
        block[3] = &unk_C4B0;
        __int16 v49 = v52;
        block[4] = v54[0];
        void block[5] = v53;
        __int16 v50 = v51;
        dispatch_async((dispatch_queue_t)v16, block);
        self->_unint64_t lastMachTimestamp = (unint64_t)[(TSClock *)self->_clock convertFromDomainToMachAbsoluteTime:self->_lastDomainTimestamp grandmasterUsed:v54 portNumber:&v52];
        id v15 = [(TSClock *)self->_clock convertFromDomainToMachAbsoluteTime:self->_lastDomainTimestamp + 290000000 grandmasterUsed:&v53 portNumber:&v51];
        uint64_t v14 = v54[0];
        if (v54[0] != v53 || v52 != v51)
        {
          id v17 = self->_loggingQueue;
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_7A58;
          v45[3] = &unk_C4B0;
          __int16 v46 = v52;
          v45[4] = v54[0];
          v45[5] = v53;
          __int16 v47 = v51;
          dispatch_async((dispatch_queue_t)v17, v45);
          uint64_t v14 = v54[0];
        }
      }
      if (self->_lastGrandmasterIdentity != v14 || self->_lastPortNumber != v52)
      {
        self->_unint64_t lastDomainTimestamp = 260000000
                                   * ((unint64_t)-[TSClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:](self->_clock, "convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:", v5)/ 0xF7F4900);
        self->_unint64_t lastMachTimestamp = (unint64_t)-[TSClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:](self->_clock, "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:");
        id v18 = [(TSClock *)self->_clock convertFromDomainToMachAbsoluteTime:self->_lastDomainTimestamp + 290000000 grandmasterUsed:&v53 portNumber:&v51];
        if (v54[0] == v53 && v52 == v51)
        {
          id v15 = v18;
        }
        else
        {
          v19 = self->_loggingQueue;
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_7B24;
          v42[3] = &unk_C4B0;
          __int16 v43 = v52;
          v42[4] = v54[0];
          v42[5] = v53;
          __int16 v44 = v51;
          dispatch_async((dispatch_queue_t)v19, v42);
          self->_unint64_t lastMachTimestamp = (unint64_t)[(TSClock *)self->_clock convertFromDomainToMachAbsoluteTime:self->_lastDomainTimestamp grandmasterUsed:v54 portNumber:&v52];
          id v15 = [(TSClock *)self->_clock convertFromDomainToMachAbsoluteTime:self->_lastDomainTimestamp + 290000000 grandmasterUsed:&v53 portNumber:&v51];
          if (v54[0] != v53 || v52 != v51)
          {
            v20 = self->_loggingQueue;
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_7BF0;
            v39[3] = &unk_C4B0;
            __int16 v40 = v52;
            v39[4] = v54[0];
            v39[5] = v53;
            __int16 v41 = v51;
            dispatch_async((dispatch_queue_t)v20, v39);
          }
        }
      }
      unint64_t v12 = &OBJC_IVAR___ATSACCAClockDevice__clockIdentifier;
    }
    else
    {
      self->_unint64_t lastMachTimestamp = (unint64_t)[(TSClock *)self->_clock convertFromDomainToMachAbsoluteTime:self->_lastDomainTimestamp];
      id v15 = [(TSClock *)self->_clock convertFromDomainToMachAbsoluteTime:self->_lastDomainTimestamp + 290000000];
    }
    self->_unint64_t lastSampleTime = 0;
    self->_unint64_t lastFilteredTimestamp = (unint64_t)-[TSIntervalFilter addTimestamp:](self->_intervalFilter, "addTimestamp:", self->_lastMachTimestamp, self->_lastMachTimestamp);
    self->_lastFilteredInterval = 0;
    unint64_t lastSampleTime = self->_lastSampleTime;
    unint64_t lastFilteredTimestamp = self->_lastFilteredTimestamp;
    unint64_t lastSeed = self->_lastSeed;
    unint64_t v24 = atomic_load(&self->_timestamp.mTimestampIndex.__a_.__a_value);
    unint64_t v25 = (v24 + 1) % self->_timestamp.mNumberOfSlots;
    double v26 = (unint64_t *)((char *)self->_timestamp.mTimestamps.__begin_ + 24 * v25);
    *double v26 = lastSampleTime;
    v26[1] = lastFilteredTimestamp;
    v26[2] = lastSeed;
    atomic_store(v25, &self->_timestamp.mTimestampIndex.__a_.__a_value);
    unint64_t lastGrandmasterIdentity = self->_lastGrandmasterIdentity;
    LOWORD(lastSampleTime) = self->_lastPortNumber;
    unint64_t lastMachTimestamp = self->_lastMachTimestamp;
    unint64_t lastDomainTimestamp = self->_lastDomainTimestamp;
    unint64_t v30 = self->_lastSampleTime;
    unint64_t v31 = self->_lastFilteredTimestamp;
    id v32 = *(NSObject **)&self->ASDClockDevice_opaque[v12[2]];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_7CBC;
    v37[3] = &unk_C670;
    v37[4] = self;
    v37[5] = v30;
    v37[6] = v31;
    v37[7] = lastGrandmasterIdentity;
    __int16 v38 = lastSampleTime;
    v37[8] = lastDomainTimestamp;
    v37[9] = lastMachTimestamp;
    dispatch_async(v32, v37);
    [(ATSACCAClockDevice *)self clockIdentifier];
    kdebug_trace();
    self->_hasLastTimestamp = 1;
    objc_super v33 = +[TSClockManager sharedClockManager];
    self->_lastMachInterval = (unint64_t)[v33 machAbsoluteNanosecondsToTicks:260000000];

    self->_dispatchTime = (unint64_t)v15;
    dispatch_source_set_timer(v4, (dispatch_time_t)v15, 0xFFFFFFFFFFFFFFFFLL, 0);
    startSemaphore = self->_startSemaphore;
    if (startSemaphore) {
      dispatch_semaphore_signal((dispatch_semaphore_t)startSemaphore);
    }
  }
}

- (void)dealloc
{
  if ([(ATSACCAClockDevice *)self clockDomain])
  {
    int v3 = +[TSClockManager sharedClockManager];
    [v3 removeMappingFromClockIDToCoreAudioClockDomainForClockID:self->_clockIdentifier error:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)ATSACCAClockDevice;
  [(ATSACCAClockDevice *)&v4 dealloc];
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (int64_t)referenceCount
{
  return self->_referenceCount;
}

- (void)setReferenceCount:(int64_t)a3
{
  self->_referenceCount = a3;
}

- (void).cxx_destruct
{
  p_timestamp = &self->_timestamp;
  begin = self->_timestamp.mTimestamps.__begin_;
  if (begin)
  {
    p_timestamp->mTimestamps.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_intervalFilter, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_startSemaphore, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);

  objc_storeStrong((id *)&self->_timerQueue, 0);
}

- (id).cxx_construct
{
  p_timestamp = &self->_timestamp;
  self->_timestamp.mNumberOfSlots = 4;
  long long v5 = 0uLL;
  uint64_t v6 = 0;
  sub_8488(&self->_timestamp.mTimestamps.__begin_, 4uLL, &v5);
  p_timestamp->mTimestampIndex.__a_.__a_value = 0;
  return self;
}

@end