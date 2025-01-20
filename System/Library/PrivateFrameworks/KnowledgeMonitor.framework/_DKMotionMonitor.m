@interface _DKMotionMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_eventWithState:(id)a3 startDate:(id)a4 endDate:(id)a5;
+ (id)entitlements;
+ (id)eventStream;
+ (id)log;
+ (unint64_t)_activityTypeToMotionState:(id)a3;
- (BMSource)source;
- (BOOL)activateTimer;
- (BOOL)monitoringActivity;
- (BOOL)shouldRecordMotion;
- (CMMotionActivityManager)activityManager;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_source)motionStateProcessingTimer;
- (_DKMotionMonitor)init;
- (double)dominantActivityInterval;
- (id)classesForSecureStateDecoding;
- (id)initForUnitTest:(BOOL)a3;
- (int64_t)lastReportedMotionState;
- (unint64_t)currentDominantMotionState;
- (void)addMotionActivity:(id)a3;
- (void)addState:(id)a3;
- (void)computeDominantMotionState;
- (void)deactivate;
- (void)dealloc;
- (void)setActivityManager:(id)a3;
- (void)setLastReportedMotionState:(int64_t)a3;
- (void)setMonitoringActivity:(BOOL)a3;
- (void)setMotionStateProcessingTimer:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setShouldRecordMotion:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
- (void)update;
@end

@implementation _DKMotionMonitor

+ (id)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global);
  }
  v2 = (void *)log_log;
  return v2;
}

+ (id)eventStream
{
  return @"MotionState";
}

+ (id)entitlements
{
  return &unk_26D86D710;
}

+ (id)_eventWithState:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F350E0] unknown];
  if ([v7 unsignedIntValue] == 2)
  {
    uint64_t v11 = [MEMORY[0x263F350E0] walking];
  }
  else if ([v7 unsignedIntValue] == 1)
  {
    uint64_t v11 = [MEMORY[0x263F350E0] stationary];
  }
  else if ([v7 unsignedIntValue] == 3)
  {
    uint64_t v11 = [MEMORY[0x263F350E0] running];
  }
  else if ([v7 unsignedIntValue] == 4)
  {
    uint64_t v11 = [MEMORY[0x263F350E0] cycling];
  }
  else if ([v7 unsignedIntValue] == 5)
  {
    uint64_t v11 = [MEMORY[0x263F350E0] automotive];
  }
  else
  {
    if ([v7 unsignedIntValue] != 6) {
      goto LABEL_14;
    }
    uint64_t v11 = [MEMORY[0x263F350E0] stationaryAutomotive];
  }
  v12 = (void *)v11;

  v10 = v12;
LABEL_14:
  v13 = (void *)MEMORY[0x263F35088];
  v14 = [MEMORY[0x263F35148] motionStream];
  v15 = v8;
  if (v8)
  {
    if (v9) {
      goto LABEL_16;
    }
  }
  else
  {
    v15 = [MEMORY[0x263EFF910] date];
    if (v9)
    {
LABEL_16:
      v16 = [v13 eventWithStream:v14 startDate:v15 endDate:v9 value:v10];
      if (v8) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  v18 = [MEMORY[0x263EFF910] distantFuture];
  v16 = [v13 eventWithStream:v14 startDate:v15 endDate:v18 value:v10];

  if (!v8) {
LABEL_17:
  }

LABEL_18:
  return v16;
}

- (id)classesForSecureStateDecoding
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

- (_DKMotionMonitor)init
{
  return (_DKMotionMonitor *)[(_DKMotionMonitor *)self initForUnitTest:0];
}

- (id)initForUnitTest:(BOOL)a3
{
  v34.receiver = self;
  v34.super_class = (Class)_DKMotionMonitor;
  v4 = [(_DKMonitor *)&v34 init];
  v5 = v4;
  if (v4)
  {
    v6 = [(_DKMonitor *)v4 instantState];
    id v7 = [v6 objectForKeyedSubscript:@"kMotionStateBuffer"];

    if (!v7)
    {
      id v8 = [MEMORY[0x263EFF980] array];
      id v9 = [(_DKMonitor *)v5 instantState];
      [v9 setObject:v8 forKeyedSubscript:@"kMotionStateBuffer"];
    }
    if ([MEMORY[0x263F01780] isActivityAvailable])
    {
      v5->_monitoringActivity = 1;
      v5->_activateTimer = 1;
      v5->_currentDominantMotionState = 0;
      v10 = BiomeLibrary();
      uint64_t v11 = [v10 Motion];
      v12 = [v11 Activity];
      uint64_t v13 = [v12 source];
      source = v5->_source;
      v5->_source = (BMSource *)v13;

      if (a3)
      {
        v5->_dominantActivityInterval = 2.0;
      }
      else
      {
        v5->_dominantActivityInterval = 60.0;
        v15 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x263F01780]);
        activityManager = v5->_activityManager;
        v5->_activityManager = v15;

        if ([MEMORY[0x263F34F80] isRunningOnInternalBuild])
        {
          int v17 = 1;
        }
        else
        {
          v18 = [MEMORY[0x263F01880] defaultWorkspace];
          int v17 = [v18 applicationIsInstalled:@"com.appleuserstudies.flubber"];
        }
        v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
        v20 = v19;
        if (v17)
        {
          v21 = [v19 objectForKey:@"_DKCDisableMotionMonitor"];
          if (v21) {
            char v22 = [v20 BOOLForKey:@"_DKCDisableMotionMonitor"] ^ 1;
          }
          else {
            char v22 = 1;
          }
          v5->_shouldRecordMotion = v22;
        }
        else
        {
          v5->_shouldRecordMotion = 0;
        }
      }
      v23 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
      operationQueue = v5->_operationQueue;
      v5->_operationQueue = v23;

      v25 = v5->_operationQueue;
      v26 = [(_DKMonitor *)v5 queue];
      [(NSOperationQueue *)v25 setUnderlyingQueue:v26];

      v27 = [(_DKMonitor *)v5 queue];
      dispatch_source_t v28 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v27);
      motionStateProcessingTimer = v5->_motionStateProcessingTimer;
      v5->_motionStateProcessingTimer = (OS_dispatch_source *)v28;

      v30 = v5->_motionStateProcessingTimer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __36___DKMotionMonitor_initForUnitTest___block_invoke;
      handler[3] = &unk_264714788;
      v33 = v5;
      dispatch_source_set_event_handler(v30, handler);
      dispatch_source_set_timer((dispatch_source_t)v5->_motionStateProcessingTimer, 0, (unint64_t)(v5->_dominantActivityInterval * 1000000000.0), 0x3B9ACA00uLL);
      dispatch_activate((dispatch_object_t)v5->_motionStateProcessingTimer);
    }
  }
  return v5;
}

- (void)dealloc
{
  [(_DKMotionMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKMotionMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

- (void)start
{
  v14.receiver = self;
  v14.super_class = (Class)_DKMotionMonitor;
  if ([(_DKMonitor *)&v14 instantMonitorNeedsActivation])
  {
    objc_super v3 = (void *)MEMORY[0x22A629AA0]();
    if (self->_monitoringActivity)
    {
      objc_initWeak(&location, self);
      v4 = [MEMORY[0x263EFF910] date];
      activityManager = self->_activityManager;
      operationQueue = self->_operationQueue;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __25___DKMotionMonitor_start__block_invoke;
      v11[3] = &unk_2647147B0;
      objc_copyWeak(&v12, &location);
      [(CMMotionActivityManager *)activityManager queryActivityStartingFromDate:v4 toDate:v4 toQueue:operationQueue withHandler:v11];
      id v7 = self->_activityManager;
      id v8 = self->_operationQueue;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __25___DKMotionMonitor_start__block_invoke_2;
      v9[3] = &unk_264714800;
      objc_copyWeak(&v10, &location);
      v9[4] = self;
      [(CMMotionActivityManager *)v7 startActivityUpdatesToQueue:v8 withHandler:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);

      objc_destroyWeak(&location);
    }
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKMotionMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKMotionMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  objc_super v3 = (void *)MEMORY[0x22A629AA0](self, a2);
  if (self->_monitoringActivity)
  {
    dispatch_source_cancel((dispatch_source_t)self->_motionStateProcessingTimer);
    self->_monitoringActivity = 0;
    [(CMMotionActivityManager *)self->_activityManager stopActivityUpdates];
  }
}

- (void)synchronouslyReflectCurrentValue
{
  if ([MEMORY[0x263F01780] isActivityAvailable])
  {
    id v5 = [NSNumber numberWithUnsignedInteger:self->_currentDominantMotionState];
    objc_super v3 = [MEMORY[0x263F351B8] userContext];
    v4 = [MEMORY[0x263F351D0] keyPathForMotionState];
    [v3 setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)addMotionActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    id v5 = [v4 startDate];

    id v4 = v11;
    if (v5)
    {
      unint64_t v6 = +[_DKMotionMonitor _activityTypeToMotionState:v11];
      id v7 = [_DKTemporalNumericState alloc];
      id v8 = [NSNumber numberWithUnsignedLongLong:v6];
      id v9 = [v11 startDate];
      id v10 = [(_DKTemporalNumericState *)v7 initWithState:v8 timestamp:v9];

      [(_DKMotionMonitor *)self addState:v10];
      id v4 = v11;
    }
  }
}

- (void)addState:(id)a3
{
  id v10 = a3;
  id v4 = (void *)os_transaction_create();
  id v5 = (void *)MEMORY[0x22A629AA0]();
  unint64_t v6 = [(_DKMonitor *)self instantState];
  id v7 = [v6 objectForKeyedSubscript:@"kMotionStateBuffer"];

  if (self->_activateTimer)
  {
    self->_activateTimer = 0;
    motionStateProcessingTimer = self->_motionStateProcessingTimer;
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(self->_dominantActivityInterval * 1000000000.0));
    dispatch_source_set_timer(motionStateProcessingTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  [v7 addObject:v10];
}

- (void)computeDominantMotionState
{
  objc_super v3 = (void *)os_transaction_create();
  id v4 = (void *)MEMORY[0x22A629AA0]();
  id v5 = [(_DKMonitor *)self instantState];
  unint64_t v6 = [v5 objectForKeyedSubscript:@"kMotionStateBuffer"];

  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  id v28 = [MEMORY[0x263EFF910] date];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __46___DKMotionMonitor_computeDominantMotionState__block_invoke;
  v24[3] = &unk_264714828;
  v26 = v27;
  id v8 = v7;
  id v25 = v8;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v24];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0x10000000000000;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46___DKMotionMonitor_computeDominantMotionState__block_invoke_47;
  v18[3] = &unk_264714850;
  v18[4] = v23;
  v18[5] = &v19;
  [v8 enumerateKeysAndObjectsUsingBlock:v18];
  dispatch_time_t v9 = [NSNumber numberWithUnsignedInteger:v20[3]];
  id v10 = [MEMORY[0x263F351B8] userContext];
  id v11 = [MEMORY[0x263F351D0] keyPathForMotionState];
  [v10 setObject:v9 forKeyedSubscript:v11];

  self->_unint64_t currentDominantMotionState = v20[3];
  self->_activateTimer = 1;
  id v12 = [v6 lastObject];
  if ((unint64_t)[v6 count] < 2)
  {
    BOOL v15 = 0;
  }
  else
  {
    unint64_t currentDominantMotionState = self->_currentDominantMotionState;
    objc_super v14 = [v12 state];
    BOOL v15 = currentDominantMotionState != [v14 unsignedLongLongValue];
  }
  [v6 removeAllObjects];
  if (v15) {
    [(_DKMotionMonitor *)self addState:v12];
  }
  [(_DKMonitor *)self saveState];
  if (self->_shouldRecordMotion)
  {
    v16 = [NSNumber numberWithUnsignedInteger:v20[3]];
    int v17 = +[_DKMotionMonitor _eventWithState:v16 startDate:0 endDate:0];
    [(_DKMonitor *)self setCurrentEvent:v17 inferHistoricalState:1];
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v27, 8);
}

- (void)update
{
  objc_super v3 = +[_DKMotionMonitor log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_DEFAULT, "Periodic update starting", buf, 2u);
  }

  id v4 = (void *)os_transaction_create();
  id v5 = [(_DKMonitor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26___DKMotionMonitor_update__block_invoke;
  v7[3] = &unk_2647147D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (unint64_t)_activityTypeToMotionState:(id)a3
{
  id v3 = a3;
  if ([v3 walking])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 cycling])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 running])
  {
    unint64_t v4 = 3;
  }
  else
  {
    int v5 = [v3 automotive];
    unsigned int v6 = [v3 stationary];
    uint64_t v7 = 5;
    if (v6) {
      uint64_t v7 = 6;
    }
    if (v5) {
      unint64_t v4 = v7;
    }
    else {
      unint64_t v4 = v6;
    }
  }

  return v4;
}

- (BOOL)monitoringActivity
{
  return self->_monitoringActivity;
}

- (void)setMonitoringActivity:(BOOL)a3
{
  self->_monitoringActivity = a3;
}

- (BOOL)shouldRecordMotion
{
  return self->_shouldRecordMotion;
}

- (void)setShouldRecordMotion:(BOOL)a3
{
  self->_shouldRecordMotion = a3;
}

- (int64_t)lastReportedMotionState
{
  return self->_lastReportedMotionState;
}

- (void)setLastReportedMotionState:(int64_t)a3
{
  self->_lastReportedMotionState = a3;
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_source)motionStateProcessingTimer
{
  return self->_motionStateProcessingTimer;
}

- (void)setMotionStateProcessingTimer:(id)a3
{
}

- (BMSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (unint64_t)currentDominantMotionState
{
  return self->_currentDominantMotionState;
}

- (double)dominantActivityInterval
{
  return self->_dominantActivityInterval;
}

- (BOOL)activateTimer
{
  return self->_activateTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_motionStateProcessingTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end