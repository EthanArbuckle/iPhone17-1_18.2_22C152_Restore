@interface CMContinuityCaptureAVCaptureBaseSession
- (AVCaptureSession)captureSession;
- (CMContinuityCaptureAVCaptureBaseSession)initWithCaptureSession:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (OpaqueCMClock)synchronizationClock;
- (int64_t)clientDeviceModel;
- (int64_t)state;
- (int64_t)transport;
- (void)dealloc;
- (void)didConfigure;
- (void)handleCaptureSessionNotification:(id)a3;
- (void)setClientDeviceModel:(int64_t)a3;
- (void)setTransport:(int64_t)a3;
- (void)start;
- (void)stop;
- (void)willConfigure;
@end

@implementation CMContinuityCaptureAVCaptureBaseSession

- (CMContinuityCaptureAVCaptureBaseSession)initWithCaptureSession:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CMContinuityCaptureAVCaptureBaseSession;
  v9 = [(CMContinuityCaptureAVCaptureBaseSession *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureSession, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v10->_state = 0;
    v10->_transport = 0;
    v10->_clientDeviceModel = 0;
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v10 selector:sel_handleCaptureSessionNotification_ name:*MEMORY[0x263EF9798] object:v10->_captureSession];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v10 selector:sel_handleCaptureSessionNotification_ name:*MEMORY[0x263EF9700] object:v10->_captureSession];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v10 selector:sel_handleCaptureSessionNotification_ name:*MEMORY[0x263EF9708] object:v10->_captureSession];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v10 selector:sel_handleCaptureSessionNotification_ name:*MEMORY[0x263EF97A0] object:v10->_captureSession];

    v15 = v10;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl(&dword_235FC2000, log, OS_LOG_TYPE_ERROR, "%@ ContinuityCapture error : invalid avcapture session state %d", (uint8_t *)&v4, 0x12u);
}

- (void)handleCaptureSessionNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    captureSession = self->_captureSession;
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = self;
    __int16 v13 = 2112;
    v14 = captureSession;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ avcapture session %@ notification %@", buf, 0x20u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  int v7 = [v4 name];
  int v8 = [v7 isEqualToString:*MEMORY[0x263EF9798]];

  if (v8)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__CMContinuityCaptureAVCaptureBaseSession_handleCaptureSessionNotification___block_invoke;
    block[3] = &unk_264C990F8;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v11);
  }
  objc_destroyWeak((id *)buf);
}

void __76__CMContinuityCaptureAVCaptureBaseSession_handleCaptureSessionNotification___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained willChangeValueForKey:@"state"];
    v2[3] = 3;
    [v2 didChangeValueForKey:@"state"];
    WeakRetained = v2;
  }
}

- (OpaqueCMClock)synchronizationClock
{
  return [(AVCaptureSession *)self->_captureSession synchronizationClock];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)transport
{
  return self->_transport;
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setTransport:(int64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CMContinuityCaptureAVCaptureBaseSession_setTransport___block_invoke;
  block[3] = &unk_264C9A320;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __56__CMContinuityCaptureAVCaptureBaseSession_setTransport___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *((void *)WeakRetained + 4) = v3;
    id v4 = WeakRetained;
    [*((id *)WeakRetained + 1) setContinuityCameraIsWired:v3 == 2];
    id WeakRetained = v4;
  }
}

- (int64_t)clientDeviceModel
{
  return self->_clientDeviceModel;
}

- (void)setClientDeviceModel:(int64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CMContinuityCaptureAVCaptureBaseSession_setClientDeviceModel___block_invoke;
  block[3] = &unk_264C9A320;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __64__CMContinuityCaptureAVCaptureBaseSession_setClientDeviceModel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((void *)WeakRetained + 5) = *(void *)(a1 + 40);
    id v3 = WeakRetained;
    [*((id *)WeakRetained + 1) setContinuityCameraClientDeviceClass:CMContinuityCaptureDeviceClassFromDeviceModel(*(void *)(a1 + 40))];
    id WeakRetained = v3;
  }
}

- (void)willConfigure
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 1)
  {
    id v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int64_t state = self->_state;
      int v7 = 138412546;
      int v8 = self;
      __int16 v9 = 1024;
      int v10 = state;
      uint64_t v5 = "%@ skip will configure, state %d";
LABEL_6:
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0x12u);
    }
  }
  else
  {
    [(AVCaptureSession *)self->_captureSession beginConfiguration];
    [(CMContinuityCaptureAVCaptureBaseSession *)self willChangeValueForKey:@"state"];
    self->_int64_t state = 1;
    [(CMContinuityCaptureAVCaptureBaseSession *)self didChangeValueForKey:@"state"];
    id v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v6 = self->_state;
      int v7 = 138412546;
      int v8 = self;
      __int16 v9 = 1024;
      int v10 = v6;
      uint64_t v5 = "%@ done will configure, state %d";
      goto LABEL_6;
    }
  }
}

- (void)didConfigure
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 1)
  {
    [(AVCaptureSession *)self->_captureSession commitConfiguration];
    [(CMContinuityCaptureAVCaptureBaseSession *)self willChangeValueForKey:@"state"];
    if ([(AVCaptureSession *)self->_captureSession isRunning])
    {
      int64_t v3 = 2;
    }
    else
    {
      BOOL v7 = [(AVCaptureSession *)self->_captureSession isInterrupted];
      int64_t v3 = 2;
      if (!v7) {
        int64_t v3 = 0;
      }
    }
    self->_int64_t state = v3;
    [(CMContinuityCaptureAVCaptureBaseSession *)self didChangeValueForKey:@"state"];
    id v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t state = self->_state;
      int v9 = 138412546;
      int v10 = self;
      __int16 v11 = 1024;
      int v12 = state;
      int64_t v6 = "%@ done did configure, state %d";
      goto LABEL_10;
    }
  }
  else
  {
    id v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v5 = self->_state;
      int v9 = 138412546;
      int v10 = self;
      __int16 v11 = 1024;
      int v12 = v5;
      int64_t v6 = "%@ skip did configure, state %d";
LABEL_10:
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:1];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(AVCaptureSession *)self->_captureSession startRunning];
  [(CMContinuityCaptureAVCaptureBaseSession *)self willChangeValueForKey:@"state"];
  if ([(AVCaptureSession *)self->_captureSession isRunning]
    || [(AVCaptureSession *)self->_captureSession isInterrupted])
  {
    self->_int64_t state = 2;
  }
  [(CMContinuityCaptureAVCaptureBaseSession *)self didChangeValueForKey:@"state"];
  int64_t v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t state = self->_state;
    int v5 = 138412802;
    int64_t v6 = self;
    __int16 v7 = 2080;
    int v8 = "-[CMContinuityCaptureAVCaptureBaseSession start]";
    __int16 v9 = 1024;
    int v10 = state;
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s RunningState %d", (uint8_t *)&v5, 0x1Cu);
  }
}

- (void)stop
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(AVCaptureSession *)self->_captureSession stopRunning];
  if (![(AVCaptureSession *)self->_captureSession isRunning])
  {
    [(CMContinuityCaptureAVCaptureBaseSession *)self willChangeValueForKey:@"state"];
    self->_int64_t state = 0;
    [(CMContinuityCaptureAVCaptureBaseSession *)self didChangeValueForKey:@"state"];
  }
  int64_t v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t state = self->_state;
    int v5 = 138412802;
    int64_t v6 = self;
    __int16 v7 = 2080;
    int v8 = "-[CMContinuityCaptureAVCaptureBaseSession stop]";
    __int16 v9 = 1024;
    int v10 = state;
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s RunningState %d", (uint8_t *)&v5, 0x1Cu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end