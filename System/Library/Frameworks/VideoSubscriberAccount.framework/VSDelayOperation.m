@interface VSDelayOperation
+ (VSDelayOperation)delayOperationWithDelay:(double)a3;
+ (VSDelayOperation)delayOperationWithFireDate:(id)a3;
- (BOOL)shouldIgnoreTolerance;
- (NSDate)fireDate;
- (VSDelayOperation)init;
- (VSDelayOperation)initWithDelay:(double)a3 tolerance:(double)a4;
- (VSDelayOperation)initWithFireDate:(id)a3 tolerance:(double)a4;
- (double)delay;
- (double)tolerance;
- (void)_cancelTimer;
- (void)cancel;
- (void)dealloc;
- (void)executionDidBegin;
- (void)setShouldIgnoreTolerance:(BOOL)a3;
@end

@implementation VSDelayOperation

+ (VSDelayOperation)delayOperationWithDelay:(double)a3
{
  v3 = [[VSDelayOperation alloc] initWithDelay:a3 tolerance:a3 / 10.0];

  return v3;
}

+ (VSDelayOperation)delayOperationWithFireDate:(id)a3
{
  id v3 = a3;
  v4 = [[VSDelayOperation alloc] initWithFireDate:v3 tolerance:0.0];

  [(VSDelayOperation *)v4 setShouldIgnoreTolerance:1];

  return v4;
}

- (VSDelayOperation)initWithDelay:(double)a3 tolerance:(double)a4
{
  if (a3 <= 0.0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The delay argument must be greater than zero."];
  }
  v8.receiver = self;
  v8.super_class = (Class)VSDelayOperation;
  result = [(VSDelayOperation *)&v8 init];
  if (result)
  {
    result->_delay = a3;
    result->_tolerance = a4;
  }
  return result;
}

- (VSDelayOperation)initWithFireDate:(id)a3 tolerance:(double)a4
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The fireDate parameter must not be nil."];
  }
  v11.receiver = self;
  v11.super_class = (Class)VSDelayOperation;
  v7 = [(VSDelayOperation *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    fireDate = v7->_fireDate;
    v7->_fireDate = (NSDate *)v8;

    v7->_tolerance = a4;
  }

  return v7;
}

- (VSDelayOperation)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (void)dealloc
{
  [(VSDelayOperation *)self _cancelTimer];
  v3.receiver = self;
  v3.super_class = (Class)VSDelayOperation;
  [(VSDelayOperation *)&v3 dealloc];
}

- (void)_cancelTimer
{
  timerSource = self->_timerSource;
  if (timerSource) {
    dispatch_source_cancel(timerSource);
  }
}

- (void)executionDidBegin
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.VSDelayOperation.%p", self);
  id v3 = objc_claimAutoreleasedReturnValue();
  uint64_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
  v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __37__VSDelayOperation_executionDidBegin__block_invoke;
  handler[3] = &unk_1E6BD35C8;
  objc_copyWeak(&v18, &location);
  dispatch_source_set_event_handler(v5, handler);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__VSDelayOperation_executionDidBegin__block_invoke_15;
  v15[3] = &unk_1E6BD35C8;
  objc_copyWeak(&v16, &location);
  dispatch_source_set_cancel_handler(v5, v15);
  [(VSDelayOperation *)self delay];
  double v7 = v6;
  [(VSDelayOperation *)self tolerance];
  double v9 = v8;
  v10 = [(VSDelayOperation *)self fireDate];
  objc_super v11 = v10;
  if (v10)
  {
    [v10 timeIntervalSinceNow];
    double v7 = v12;
    if ([(VSDelayOperation *)self shouldIgnoreTolerance]) {
      double v9 = v7 / 10.0;
    }
  }
  if (v7 <= 9223372040.0) {
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  }
  else {
    dispatch_time_t v13 = -1;
  }
  dispatch_source_set_timer(v5, v13, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v9 * 1000000000.0));
  v14 = VSDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_impl(&dword_1DA674000, v14, OS_LOG_TYPE_DEFAULT, "Delay operation timer will begin %@", buf, 0xCu);
  }

  dispatch_resume(v5);
  objc_storeStrong((id *)&self->_timerSource, v5);
  if ([(VSDelayOperation *)self isCancelled]) {
    [(VSDelayOperation *)self _cancelTimer];
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __37__VSDelayOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = VSDefaultLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Delay operation timer did fire %@", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained finishExecutionIfPossible];
  }
}

void __37__VSDelayOperation_executionDidBegin__block_invoke_15(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = VSDefaultLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Delay operation timer cancelled %@", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained finishExecutionIfPossible];
  }
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)VSDelayOperation;
  [(VSAsyncOperation *)&v3 cancel];
  [(VSDelayOperation *)self _cancelTimer];
}

- (double)delay
{
  return self->_delay;
}

- (double)tolerance
{
  return self->_tolerance;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (BOOL)shouldIgnoreTolerance
{
  return self->_shouldIgnoreTolerance;
}

- (void)setShouldIgnoreTolerance:(BOOL)a3
{
  self->_shouldIgnoreTolerance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);

  objc_storeStrong((id *)&self->_timerSource, 0);
}

@end