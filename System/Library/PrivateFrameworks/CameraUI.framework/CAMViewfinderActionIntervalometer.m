@interface CAMViewfinderActionIntervalometer
- (CAMPreciseTimer)_timer;
- (CAMViewfinderActionIntervalometer)init;
- (CAMViewfinderActionIntervalometer)initWithDelegate:(id)a3 interval:(double)a4 delay:(double)a5 maximumCount:(int64_t)a6 viewfinderViewController:(id)a7;
- (CAMViewfinderActionIntervalometerDelegate)delegate;
- (CAMViewfinderViewController)_viewfinderViewController;
- (double)delay;
- (double)interval;
- (int64_t)_remaining;
- (int64_t)maximumCount;
- (unint64_t)successfullActionCount;
- (void)_attemptViewfinderActions;
- (void)set_remaining:(int64_t)a3;
- (void)startGeneratingRequests;
- (void)stopAttemptingActions;
@end

@implementation CAMViewfinderActionIntervalometer

- (CAMViewfinderActionIntervalometer)init
{
  return [(CAMViewfinderActionIntervalometer *)self initWithDelegate:0 interval:0 delay:0 maximumCount:0.0 viewfinderViewController:0.0];
}

- (CAMViewfinderActionIntervalometer)initWithDelegate:(id)a3 interval:(double)a4 delay:(double)a5 maximumCount:(int64_t)a6 viewfinderViewController:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CAMViewfinderActionIntervalometer;
  v14 = [(CAMViewfinderActionIntervalometer *)&v24 init];
  v15 = v14;
  if (v14)
  {
    if (!a6) {
      a6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_storeWeak((id *)&v14->_delegate, v12);
    v15->_interval = a4;
    v15->_delay = a5;
    v15->_maximumCount = a6;
    v15->__remaining = a6;
    objc_storeStrong((id *)&v15->__viewfinderViewController, a7);
    objc_initWeak(&location, v15);
    v16 = [CAMPreciseTimer alloc];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __107__CAMViewfinderActionIntervalometer_initWithDelegate_interval_delay_maximumCount_viewfinderViewController___block_invoke;
    v21[3] = &unk_263FA2158;
    objc_copyWeak(&v22, &location);
    uint64_t v17 = [(CAMPreciseTimer *)v16 initWithDelay:v21 interval:a5 handler:a4];
    timer = v15->__timer;
    v15->__timer = (CAMPreciseTimer *)v17;

    v19 = v15;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __107__CAMViewfinderActionIntervalometer_initWithDelegate_interval_delay_maximumCount_viewfinderViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _attemptViewfinderActions];
}

- (void)startGeneratingRequests
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Can't start generating requests from the intervalometer without a reference to a CAMViewfinderViewController!", v1, 2u);
}

- (void)_attemptViewfinderActions
{
  v3 = [(CAMViewfinderActionIntervalometer *)self delegate];
  id v4 = v3;
  if (v3)
  {
    if ([v3 shouldAttemptAction])
    {
      if ([v4 executeAction])
      {
        [(CAMViewfinderActionIntervalometer *)self set_remaining:[(CAMViewfinderActionIntervalometer *)self _remaining] - 1];
        if (![(CAMViewfinderActionIntervalometer *)self _remaining])
        {
          [(CAMViewfinderActionIntervalometer *)self stopAttemptingActions];
          if (objc_opt_respondsToSelector()) {
            [v4 intervalometerDidReachMaximumCount:self];
          }
        }
      }
    }
  }
  else
  {
    [(CAMViewfinderActionIntervalometer *)self stopAttemptingActions];
  }
}

- (void)stopAttemptingActions
{
  id v2 = [(CAMViewfinderActionIntervalometer *)self _timer];
  [v2 invalidate];
}

- (unint64_t)successfullActionCount
{
  int64_t v3 = [(CAMViewfinderActionIntervalometer *)self maximumCount];
  return v3 - [(CAMViewfinderActionIntervalometer *)self _remaining];
}

- (CAMViewfinderActionIntervalometerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMViewfinderActionIntervalometerDelegate *)WeakRetained;
}

- (double)interval
{
  return self->_interval;
}

- (double)delay
{
  return self->_delay;
}

- (int64_t)maximumCount
{
  return self->_maximumCount;
}

- (int64_t)_remaining
{
  return self->__remaining;
}

- (void)set_remaining:(int64_t)a3
{
  self->__remaining = a3;
}

- (CAMPreciseTimer)_timer
{
  return self->__timer;
}

- (CAMViewfinderViewController)_viewfinderViewController
{
  return self->__viewfinderViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__viewfinderViewController, 0);
  objc_storeStrong((id *)&self->__timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end