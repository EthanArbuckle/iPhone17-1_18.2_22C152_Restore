@interface CRKDeadmanScreenshotServiceProxy
- (CRKDeadmanScreenshotServiceProxy)initWithTimeout:(double)a3;
- (CRKScreenshotServiceInterface)underlyingProxy;
- (NSTimer)timer;
- (double)timeout;
- (unint64_t)countOfInFlightRequests;
- (void)dealloc;
- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4;
- (void)setCountOfInFlightRequests:(unint64_t)a3;
- (void)setTimer:(id)a3;
- (void)setUnderlyingProxy:(id)a3;
- (void)startTimer;
- (void)stopTimer;
@end

@implementation CRKDeadmanScreenshotServiceProxy

- (void)dealloc
{
  [(CRKDeadmanScreenshotServiceProxy *)self stopTimer];
  v3.receiver = self;
  v3.super_class = (Class)CRKDeadmanScreenshotServiceProxy;
  [(CRKDeadmanScreenshotServiceProxy *)&v3 dealloc];
}

- (CRKDeadmanScreenshotServiceProxy)initWithTimeout:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRKDeadmanScreenshotServiceProxy;
  result = [(CRKDeadmanScreenshotServiceProxy *)&v5 init];
  if (result) {
    result->_timeout = a3;
  }
  return result;
}

- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(CRKDeadmanScreenshotServiceProxy *)self setCountOfInFlightRequests:[(CRKDeadmanScreenshotServiceProxy *)self countOfInFlightRequests] + 1];
  [(CRKDeadmanScreenshotServiceProxy *)self stopTimer];
  v8 = [(CRKDeadmanScreenshotServiceProxy *)self underlyingProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__CRKDeadmanScreenshotServiceProxy_fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke;
  v10[3] = &unk_2646F5440;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  objc_msgSend(v8, "fetchScreenshotDataWithMaximumSizeInPixels:completion:", v10, width, height);
}

uint64_t __90__CRKDeadmanScreenshotServiceProxy_fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setCountOfInFlightRequests:", objc_msgSend(*(id *)(a1 + 32), "countOfInFlightRequests") - 1);
  uint64_t result = [*(id *)(a1 + 32) countOfInFlightRequests];
  if (!result)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 startTimer];
  }
  return result;
}

- (void)startTimer
{
  objc_super v3 = [(CRKDeadmanScreenshotServiceProxy *)self timer];

  if (!v3)
  {
    v4 = _CRKLogGeneral_14();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Starting ScreenshotService deadman timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    objc_super v5 = (void *)MEMORY[0x263EFFA20];
    [(CRKDeadmanScreenshotServiceProxy *)self timeout];
    double v7 = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__CRKDeadmanScreenshotServiceProxy_startTimer__block_invoke;
    v9[3] = &unk_2646F5468;
    objc_copyWeak(&v10, buf);
    v8 = [v5 scheduledTimerWithTimeInterval:0 repeats:v9 block:v7];
    [(CRKDeadmanScreenshotServiceProxy *)self setTimer:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

void __46__CRKDeadmanScreenshotServiceProxy_startTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _CRKLogGeneral_14();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v3 = 0;
      _os_log_impl(&dword_224C00000, v2, OS_LOG_TYPE_DEFAULT, "ScreenshotService deadman timer fired. Tearing down connection", v3, 2u);
    }

    [WeakRetained setUnderlyingProxy:0];
    [WeakRetained setTimer:0];
  }
}

- (void)stopTimer
{
  objc_super v3 = [(CRKDeadmanScreenshotServiceProxy *)self timer];

  if (v3)
  {
    v4 = _CRKLogGeneral_14();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating ScreenshotService deadman timer", v6, 2u);
    }

    objc_super v5 = [(CRKDeadmanScreenshotServiceProxy *)self timer];
    [v5 invalidate];

    [(CRKDeadmanScreenshotServiceProxy *)self setTimer:0];
  }
}

- (CRKScreenshotServiceInterface)underlyingProxy
{
  underlyingProxy = self->_underlyingProxy;
  if (!underlyingProxy)
  {
    v4 = (CRKScreenshotServiceInterface *)objc_opt_new();
    objc_super v5 = self->_underlyingProxy;
    self->_underlyingProxy = v4;

    underlyingProxy = self->_underlyingProxy;
  }

  return underlyingProxy;
}

- (void)setUnderlyingProxy:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)countOfInFlightRequests
{
  return self->_countOfInFlightRequests;
}

- (void)setCountOfInFlightRequests:(unint64_t)a3
{
  self->_countOfInFlightRequests = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_underlyingProxy, 0);
}

@end