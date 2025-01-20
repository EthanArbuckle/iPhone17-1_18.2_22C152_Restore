@interface CAMCaptureRequestIntervalometer
- (CAMCaptureRequest)prototypeRequest;
- (CAMCaptureRequestIntervalometer)init;
- (CAMCaptureRequestIntervalometer)initWithDelegate:(id)a3 interval:(double)a4 delay:(double)a5 maximumCount:(int64_t)a6;
- (CAMCaptureRequestIntervalometerDelegate)delegate;
- (CAMPreciseTimer)_timer;
- (double)delay;
- (double)interval;
- (int64_t)maximumCount;
- (int64_t)remaining;
- (void)_generateRequestForDelegate;
- (void)setPrototypeRequest:(id)a3;
- (void)setRemaining:(int64_t)a3;
- (void)startGeneratingRequests;
- (void)stopGeneratingRequests;
@end

@implementation CAMCaptureRequestIntervalometer

- (CAMCaptureRequestIntervalometer)init
{
  return [(CAMCaptureRequestIntervalometer *)self initWithDelegate:0 interval:0 delay:0.0 maximumCount:0.0];
}

- (CAMCaptureRequestIntervalometer)initWithDelegate:(id)a3 interval:(double)a4 delay:(double)a5 maximumCount:(int64_t)a6
{
  id v10 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CAMCaptureRequestIntervalometer;
  v11 = [(CAMCaptureRequestIntervalometer *)&v21 init];
  v12 = v11;
  if (v11)
  {
    if (!a6) {
      a6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_storeWeak((id *)&v11->_delegate, v10);
    v12->_interval = a4;
    v12->_delay = a5;
    v12->_maximumCount = a6;
    v12->_remaining = a6;
    objc_initWeak(&location, v12);
    v13 = [CAMPreciseTimer alloc];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__CAMCaptureRequestIntervalometer_initWithDelegate_interval_delay_maximumCount___block_invoke;
    v18[3] = &unk_263FA2158;
    objc_copyWeak(&v19, &location);
    uint64_t v14 = [(CAMPreciseTimer *)v13 initWithDelay:v18 interval:a5 handler:a4];
    timer = v12->__timer;
    v12->__timer = (CAMPreciseTimer *)v14;

    v16 = v12;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __80__CAMCaptureRequestIntervalometer_initWithDelegate_interval_delay_maximumCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _generateRequestForDelegate];
}

- (void)_generateRequestForDelegate
{
  id v7 = [(CAMCaptureRequestIntervalometer *)self prototypeRequest];
  v3 = [v7 distinctPersistenceCopy];
  v4 = [(CAMCaptureRequestIntervalometer *)self delegate];
  v5 = v4;
  if (v4)
  {
    if ([v4 intervalometer:self didGenerateCaptureRequest:v3])
    {
      int64_t v6 = [(CAMCaptureRequestIntervalometer *)self remaining] - 1;
      [(CAMCaptureRequestIntervalometer *)self setRemaining:v6];
      if (!v6)
      {
        [(CAMCaptureRequestIntervalometer *)self stopGeneratingRequests];
        if (objc_opt_respondsToSelector()) {
          [v5 intervalometer:self didReachMaximumCountWithRequest:v3];
        }
      }
    }
  }
  else
  {
    [(CAMCaptureRequestIntervalometer *)self stopGeneratingRequests];
  }
}

- (void)startGeneratingRequests
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Can't start generating requests from the intervalometer without a prototype request!", v1, 2u);
}

- (void)stopGeneratingRequests
{
  id v2 = [(CAMCaptureRequestIntervalometer *)self _timer];
  [v2 invalidate];
}

- (CAMCaptureRequest)prototypeRequest
{
  return self->_prototypeRequest;
}

- (void)setPrototypeRequest:(id)a3
{
}

- (CAMCaptureRequestIntervalometerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMCaptureRequestIntervalometerDelegate *)WeakRetained;
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

- (int64_t)remaining
{
  return self->_remaining;
}

- (void)setRemaining:(int64_t)a3
{
  self->_remaining = a3;
}

- (CAMPreciseTimer)_timer
{
  return self->__timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prototypeRequest, 0);
}

@end