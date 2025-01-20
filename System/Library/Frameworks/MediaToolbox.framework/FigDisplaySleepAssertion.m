@interface FigDisplaySleepAssertion
- (FigDisplaySleepAssertion)initWithReason:(id)a3 queue:(id)a4 expirationHandler:(id)a5;
- (unsigned)resetIdleTimer;
- (void)dealloc;
@end

@implementation FigDisplaySleepAssertion

- (FigDisplaySleepAssertion)initWithReason:(id)a3 queue:(id)a4 expirationHandler:(id)a5
{
  if (initWithReason_queue_expirationHandler__onceToken != -1) {
    dispatch_once(&initWithReason_queue_expirationHandler__onceToken, &__block_literal_global_71);
  }
  v14.receiver = self;
  v14.super_class = (Class)FigDisplaySleepAssertion;
  id v9 = [(FigDisplaySleepAssertion *)&v14 init];
  if (v9)
  {
    *((void *)v9 + 2) = a3;
    v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)a4);
    *((void *)v9 + 1) = v10;
    *((void *)v9 + 3) = 0;
    *((void *)v9 + 4) = 0;
    if (v10)
    {
      dispatch_source_set_timer(v10, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      v11 = *((void *)v9 + 1);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __67__FigDisplaySleepAssertion_initWithReason_queue_expirationHandler___block_invoke_2;
      handler[3] = &unk_1E579CDB0;
      handler[4] = a5;
      dispatch_source_set_event_handler(v11, handler);
      dispatch_activate(*((dispatch_object_t *)v9 + 1));
    }
  }
  return (FigDisplaySleepAssertion *)v9;
}

uint64_t __67__FigDisplaySleepAssertion_initWithReason_queue_expirationHandler___block_invoke()
{
  uint64_t result = objc_opt_class();
  ITIdleTimerStateClass = result;
  return result;
}

uint64_t __67__FigDisplaySleepAssertion_initWithReason_queue_expirationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer) {
    dispatch_release(timer);
  }
  idleTimerAssertion = self->_idleTimerAssertion;
  if (idleTimerAssertion)
  {
    [(BSInvalidatable *)idleTimerAssertion invalidate];

    self->_idleTimerAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)FigDisplaySleepAssertion;
  [(FigDisplaySleepAssertion *)&v5 dealloc];
}

- (unsigned)resetIdleTimer
{
  if (self->_timer)
  {
    idleTimerAssertion = self->_idleTimerAssertion;
    if (idleTimerAssertion) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = ITIdleTimerStateClass == 0;
    }
    if (!v4)
    {
      idleTimerAssertion = (BSInvalidatable *)objc_msgSend((id)objc_msgSend((id)ITIdleTimerStateClass, "sharedInstance"), "newAssertionToDisableIdleTimerForReason:", self->_reason);
      self->_idleTimerAssertion = idleTimerAssertion;
    }
    if (idleTimerAssertion)
    {
      uint64_t v5 = mach_absolute_time();
      if ((unint64_t)FigHostTimeToNanoseconds() >= 0xFE502B)
      {
        timer = self->_timer;
        dispatch_time_t v7 = dispatch_time(0, 2000000000);
        dispatch_source_set_timer(timer, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
        self->_lastIdleTimerResetTime = v5;
      }
      LOBYTE(idleTimerAssertion) = 1;
    }
  }
  else
  {
    LOBYTE(idleTimerAssertion) = 0;
  }
  return idleTimerAssertion;
}

@end