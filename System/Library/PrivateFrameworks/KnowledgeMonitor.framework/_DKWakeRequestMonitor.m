@interface _DKWakeRequestMonitor
+ (id)entitlements;
+ (id)eventStream;
- (NSDate)nextUserVisibleWakeRequestDate;
- (NSString)nextUserVisibleWakeRequestor;
- (OS_dispatch_source)updateTimer;
- (id)loadState;
- (int)wakeRequestToken;
- (void)deactivate;
- (void)dealloc;
- (void)obtainNextUserVisibleWakeRequest;
- (void)setNextUserVisibleWakeRequestDate:(id)a3;
- (void)setNextUserVisibleWakeRequestor:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)setWakeRequestToken:(int)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKWakeRequestMonitor

- (void)dealloc
{
  [(_DKWakeRequestMonitor *)self deactivate];
  updateTimer = self->_updateTimer;
  if (updateTimer && !self->_updateTimerResumed)
  {
    dispatch_source_cancel(updateTimer);
    dispatch_resume((dispatch_object_t)self->_updateTimer);
    self->_updateTimerResumed = 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_DKWakeRequestMonitor;
  [(_DKMonitor *)&v4 dealloc];
}

+ (id)eventStream
{
  return @"WakeRequestMonitor";
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

- (void)start
{
  v12.receiver = self;
  v12.super_class = (Class)_DKWakeRequestMonitor;
  if ([(_DKMonitor *)&v12 instantMonitorNeedsActivation])
  {
    v3 = [(_DKMonitor *)self queue];
    objc_super v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
    updateTimer = self->_updateTimer;
    self->_updateTimer = v4;

    v6 = self->_updateTimer;
    dispatch_time_t v7 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v8 = self->_updateTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __30___DKWakeRequestMonitor_start__block_invoke;
    handler[3] = &unk_264714788;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    self->_updateTimerResumed = 1;
    dispatch_resume((dispatch_object_t)self->_updateTimer);
    v9 = [(_DKMonitor *)self queue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __30___DKWakeRequestMonitor_start__block_invoke_2;
    v10[3] = &unk_264714B68;
    v10[4] = self;
    notify_register_dispatch("com.apple.system.powermanagement.uservisiblepowerevent", &self->_wakeRequestToken, v9, v10);
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKWakeRequestMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation])
  {
    self->_updateTimerResumed = 0;
    dispatch_suspend((dispatch_object_t)self->_updateTimer);
    [(_DKWakeRequestMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  int wakeRequestToken = self->_wakeRequestToken;
  if (wakeRequestToken)
  {
    notify_cancel(wakeRequestToken);
    self->_int wakeRequestToken = 0;
  }
}

- (void)synchronouslyReflectCurrentValue
{
  objc_super v3 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57___DKWakeRequestMonitor_synchronouslyReflectCurrentValue__block_invoke;
  block[3] = &unk_264714788;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)obtainNextUserVisibleWakeRequest
{
  CFArrayRef v3 = IOPMCopyScheduledPowerEvents();
  if (!v3) {
    goto LABEL_23;
  }
  cf = v3;
  CFTypeID v4 = CFGetTypeID(v3);
  if (v4 != CFArrayGetTypeID())
  {
    CFRelease(cf);
LABEL_23:
    cf = [MEMORY[0x263EFF910] distantFuture];
    v14 = [MEMORY[0x263F351B8] userContext];
    v24 = [MEMORY[0x263F351D0] keyPathForNextUserVisibleWakeDate];
    [v14 setObject:cf forKeyedSubscript:v24];
    goto LABEL_42;
  }
  v5 = [MEMORY[0x263EFF910] date];
  p_nextUserVisibleWakeRequestDate = &self->_nextUserVisibleWakeRequestDate;
  dispatch_time_t v7 = self->_nextUserVisibleWakeRequestDate;
  nextUserVisibleWakeRequestor = self->_nextUserVisibleWakeRequestor;
  if (!nextUserVisibleWakeRequestor)
  {
    uint64_t v9 = [MEMORY[0x263EFF910] distantFuture];

    nextUserVisibleWakeRequestor = self->_nextUserVisibleWakeRequestor;
    dispatch_time_t v7 = (NSDate *)v9;
  }
  v41 = v7;
  v40 = nextUserVisibleWakeRequestor;
  if (*p_nextUserVisibleWakeRequestDate)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    if (v10 >= 120.0 || ([v5 timeIntervalSinceDate:*p_nextUserVisibleWakeRequestDate], v11 < 0.0))
    {
      objc_super v12 = *p_nextUserVisibleWakeRequestDate;
      *p_nextUserVisibleWakeRequestDate = 0;

      v13 = self->_nextUserVisibleWakeRequestor;
      self->_nextUserVisibleWakeRequestor = 0;
    }
  }
  v14 = v5;
  if ([cf count])
  {
    unint64_t v15 = 0;
    do
    {
      v16 = [cf objectAtIndexedSubscript:v15];
      v17 = [v16 objectForKeyedSubscript:@"UserVisible"];
      if ([v17 BOOLValue])
      {
        v18 = [v16 objectForKeyedSubscript:@"time"];
        if (!*p_nextUserVisibleWakeRequestDate
          || ([(NSDate *)*p_nextUserVisibleWakeRequestDate timeIntervalSinceDate:v18],
              v19 > 0.0))
        {
          [v5 timeIntervalSinceDate:v18];
          if (v20 < 120.0)
          {
            objc_storeStrong((id *)&self->_nextUserVisibleWakeRequestDate, v18);
            v21 = [v16 objectForKey:@"scheduledby"];
            v22 = self->_nextUserVisibleWakeRequestor;
            self->_nextUserVisibleWakeRequestor = v21;
          }
        }
      }
      ++v15;
    }
    while (v15 < [cf count]);
  }
  v23 = *p_nextUserVisibleWakeRequestDate;
  v24 = v41;
  if (v41)
  {
    if (v23)
    {
      -[NSDate timeIntervalSinceDate:](v41, "timeIntervalSinceDate:");
      if (fabs(v25) > 1.0) {
        goto LABEL_26;
      }
    }
  }
  else if (!v23)
  {
    double v32 = 900.0;
    v33 = v40;
    goto LABEL_33;
  }
  if (self->_nextUserVisibleWakeRequestor)
  {
LABEL_26:
    v26 = *p_nextUserVisibleWakeRequestDate;
    v27 = [MEMORY[0x263F351B8] userContext];
    v28 = [MEMORY[0x263F351D0] keyPathForNextUserVisibleWakeDate];
    [v27 setObject:v26 forKeyedSubscript:v28];

    v29 = *p_nextUserVisibleWakeRequestDate;
    goto LABEL_28;
  }
  v30 = [MEMORY[0x263F351B8] userContext];
  v31 = [MEMORY[0x263F351D0] keyPathForNextUserVisibleWakeDate];
  [v30 setObject:v41 forKeyedSubscript:v31];

  v29 = v41;
LABEL_28:
  [(NSDate *)v29 timeIntervalSinceDate:v14];
  v33 = v40;
  if (v32 > 900.0)
  {
    int64_t v34 = 900000000000;
    goto LABEL_34;
  }
  if (v32 <= 120.0)
  {
    int64_t v34 = 120000000000;
    goto LABEL_34;
  }
LABEL_33:
  int64_t v34 = llround(v32 * 1000000000.0);
LABEL_34:
  updateTimer = self->_updateTimer;
  if (updateTimer)
  {
    dispatch_time_t v36 = dispatch_walltime(0, v34);
    dispatch_source_set_timer(updateTimer, v36, 0xFFFFFFFFFFFFFFFFLL, 0x3CuLL);
  }
  v37 = self->_nextUserVisibleWakeRequestor;
  if (v33)
  {
    if (v37)
    {
      [(NSString *)v33 isEqual:self->_nextUserVisibleWakeRequestor];
      v37 = self->_nextUserVisibleWakeRequestor;
    }
    goto LABEL_40;
  }
  if (v37)
  {
LABEL_40:
    v38 = [MEMORY[0x263F351B8] userContext];
    v39 = [MEMORY[0x263F351F0] keyPathWithKey:@"/system/nextUserVisibleWakeRequestor"];
    [v38 setObject:v37 forKeyedSubscript:v39];
  }
LABEL_42:
}

- (NSDate)nextUserVisibleWakeRequestDate
{
  return self->_nextUserVisibleWakeRequestDate;
}

- (void)setNextUserVisibleWakeRequestDate:(id)a3
{
}

- (NSString)nextUserVisibleWakeRequestor
{
  return self->_nextUserVisibleWakeRequestor;
}

- (void)setNextUserVisibleWakeRequestor:(id)a3
{
}

- (int)wakeRequestToken
{
  return self->_wakeRequestToken;
}

- (void)setWakeRequestToken:(int)a3
{
  self->_int wakeRequestToken = a3;
}

- (OS_dispatch_source)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_nextUserVisibleWakeRequestor, 0);
  objc_storeStrong((id *)&self->_nextUserVisibleWakeRequestDate, 0);
}

@end