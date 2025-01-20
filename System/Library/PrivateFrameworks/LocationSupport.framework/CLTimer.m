@interface CLTimer
- (double)fireInterval;
- (double)nextFireDelay;
- (double)nextFireDelayRaw;
- (double)nextFireTime;
- (id)handler;
- (id)initInSilo:(id)a3 withScheduler:(id)a4;
- (void)dbgAssertInside;
- (void)invalidate;
- (void)setFireInterval:(double)a3;
- (void)setHandler:(id)a3;
- (void)setNextFireDelay:(double)a3;
- (void)setNextFireDelay:(double)a3 interval:(double)a4;
- (void)setNextFireTime:(double)a3;
- (void)setNextFireTime:(double)a3 interval:(double)a4;
- (void)shouldFire;
- (void)updateScheduler;
@end

@implementation CLTimer

- (void)setNextFireTime:(double)a3
{
  [(CLTimer *)self fireInterval];
  MEMORY[0x1F4181798](self, sel_setNextFireTime_interval_);
}

- (double)nextFireTime
{
  [(CLTimer *)self nextFireDelay];
  double v3 = v2;
  double result = 1.79769313e308;
  if (v3 != 1.79769313e308) {
    return v3 + CFAbsoluteTimeGetCurrent();
  }
  return result;
}

- (void)shouldFire
{
  [(CLTimer *)self dbgAssertInside];
  if (self->_fireInterval == 1.79769313e308) {
    self->_nextFireDelay = 1.79769313e308;
  }
  id handler = self->_handler;
  if (handler)
  {
    v4 = (void (**)(void))[handler copy];
    v4[2]();
  }
}

- (void)setNextFireDelay:(double)a3
{
  [(CLTimer *)self dbgAssertInside];
  [(CLTimer *)self fireInterval];
  MEMORY[0x1F4181798](self, sel_setNextFireDelay_interval_);
}

- (double)fireInterval
{
  return self->_fireInterval;
}

- (void)setNextFireDelay:(double)a3 interval:(double)a4
{
  [(CLTimer *)self dbgAssertInside];
  self->_nextFireDelay = fmax(a3, 0.0);
  double v7 = 1.79769313e308;
  if (a4 > 0.0) {
    double v7 = a4;
  }
  self->_fireInterval = v7;
  uint64_t v8 = mach_continuous_time();
  self->_delaySetAtTime = sub_1A45425EC(v8);
  [(CLTimer *)self updateScheduler];
}

- (double)nextFireDelay
{
  [(CLTimer *)self dbgAssertInside];
  double result = 1.79769313e308;
  if (self->_nextFireDelay != 1.79769313e308)
  {
    uint64_t v4 = mach_continuous_time();
    double v5 = sub_1A45425EC(v4);
    double nextFireDelay = self->_nextFireDelay;
    double v7 = v5 - self->_delaySetAtTime;
    if (v7 <= nextFireDelay)
    {
      return nextFireDelay - v7;
    }
    else
    {
      double fireInterval = self->_fireInterval;
      double result = 0.0;
      if (fireInterval != 1.79769313e308) {
        return fireInterval - fmod(v7 - nextFireDelay, self->_fireInterval);
      }
    }
  }
  return result;
}

- (void)dbgAssertInside
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_silo);
}

- (void)updateScheduler
{
}

- (void)setNextFireTime:(double)a3 interval:(double)a4
{
  if (a3 != 1.79769313e308) {
    CFAbsoluteTimeGetCurrent();
  }
  MEMORY[0x1F4181798](self, sel_setNextFireDelay_interval_);
}

- (void)setHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  [(CLTimer *)self dbgAssertInside];
  if (!v9)
  {
    v6 = sub_1A4557638();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = &unk_1A45670B7;
      __int16 v14 = 2082;
      v15 = "assert";
      __int16 v16 = 2081;
      v17 = "handler != ((void *)0)";
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Can't set nil handler for CLTimer.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    double v7 = sub_1A4557638();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = &unk_1A45670B7;
      __int16 v14 = 2082;
      v15 = "assert";
      __int16 v16 = 2081;
      v17 = "handler != ((void *)0)";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Can't set nil handler for CLTimer.", "{\"msg%{public}.0s\":\"Can't set nil handler for CLTimer.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v8 = sub_1A4557638();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = &unk_1A45670B7;
      __int16 v14 = 2082;
      v15 = "assert";
      __int16 v16 = 2081;
      v17 = "handler != ((void *)0)";
      _os_log_impl(&dword_1A4540000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Can't set nil handler for CLTimer.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  uint64_t v4 = (void *)[v9 copy];
  id handler = self->_handler;
  self->_id handler = v4;
}

- (id)initInSilo:(id)a3 withScheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLTimer;
  uint64_t v8 = [(CLTimer *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_silo, v6);
    [(CLTimer *)v9 dbgAssertInside];
    v9->_double nextFireDelay = 1.79769313e308;
    id handler = v9->_handler;
    v9->_id handler = 0;
    v9->_double fireInterval = 1.79769313e308;

    objc_storeStrong((id *)&v9->_scheduler, a4);
    [(CLTimerScheduler *)v9->_scheduler setTimer:v9];
    [(CLTimer *)v9 updateScheduler];
    int v11 = v9;
  }

  return v9;
}

- (id)handler
{
  return self->_handler;
}

- (void)setFireInterval:(double)a3
{
  [(CLTimer *)self dbgAssertInside];
  [(CLTimer *)self nextFireDelay];
  MEMORY[0x1F4181798](self, sel_setNextFireDelay_interval_);
}

- (double)nextFireDelayRaw
{
  return self->_nextFireDelay;
}

- (void)invalidate
{
  [(CLTimer *)self dbgAssertInside];
  id handler = self->_handler;
  self->_id handler = 0;

  self->_double nextFireDelay = 1.79769313e308;
  self->_double fireInterval = 1.79769313e308;
  [(CLTimer *)self updateScheduler];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_silo);
}

@end