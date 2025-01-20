@interface SHWatchdogTimer
- (OS_dispatch_source)watchdogTimerSource;
- (void)startWatchdogTimerForInterval:(double)a3 firedCompletion:(id)a4;
- (void)stopWatchdogTimer;
@end

@implementation SHWatchdogTimer

- (void)startWatchdogTimerForInterval:(double)a3 firedCompletion:(id)a4
{
  id v6 = a4;
  v7 = dispatch_get_global_queue(0, 0);
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);
  watchdogTimerSource = self->_watchdogTimerSource;
  self->_watchdogTimerSource = v8;

  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_watchdogTimerSource, v10, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v11 = self->_watchdogTimerSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004DEC;
  handler[3] = &unk_100074CF8;
  id v14 = v6;
  id v12 = v6;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume((dispatch_object_t)self->_watchdogTimerSource);
}

- (void)stopWatchdogTimer
{
  watchdogTimerSource = self->_watchdogTimerSource;
  if (watchdogTimerSource)
  {
    dispatch_source_cancel(watchdogTimerSource);
    v4 = self->_watchdogTimerSource;
    self->_watchdogTimerSource = 0;
  }
}

- (OS_dispatch_source)watchdogTimerSource
{
  return self->_watchdogTimerSource;
}

- (void).cxx_destruct
{
}

@end