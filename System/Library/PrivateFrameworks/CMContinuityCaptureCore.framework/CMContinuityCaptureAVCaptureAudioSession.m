@interface CMContinuityCaptureAVCaptureAudioSession
- (CMContinuityCaptureAVCaptureAudioSession)initWithQueue:(id)a3;
- (void)configureSessionWithInput:(id)a3 andOutput:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation CMContinuityCaptureAVCaptureAudioSession

- (CMContinuityCaptureAVCaptureAudioSession)initWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFA638]);
  if (!v5) {
    goto LABEL_6;
  }
  v9.receiver = self;
  v9.super_class = (Class)CMContinuityCaptureAVCaptureAudioSession;
  v6 = [(CMContinuityCaptureAVCaptureBaseSession *)&v9 initWithCaptureSession:v5 queue:v4];
  if (!v6)
  {
    self = 0;
LABEL_6:
    v7 = 0;
    goto LABEL_4;
  }
  self = v6;
  v7 = self;
LABEL_4:

  return v7;
}

- (void)configureSessionWithInput:(id)a3 andOutput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CMContinuityCaptureAVCaptureBaseSession *)self queue];
  dispatch_assert_queue_V2(v8);

  objc_super v9 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
  int v10 = [v9 canAddInput:v6];

  if (v10)
  {
    v11 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
    [v11 addInput:v6];
  }
  else
  {
    v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureAVCaptureAudioSession configureSessionWithInput:andOutput:](self);
    }
  }

  v12 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
  int v13 = [v12 canAddOutput:v7];

  if (v13)
  {
    v14 = [(CMContinuityCaptureAVCaptureBaseSession *)self captureSession];
    [v14 addOutput:v7];
  }
  else
  {
    v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureAVCaptureAudioSession configureSessionWithInput:andOutput:](self);
    }
  }
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = [(CMContinuityCaptureAVCaptureBaseSession *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(CMContinuityCaptureAVCaptureBaseSession *)self state])
  {
    id v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v7 = [(CMContinuityCaptureAVCaptureBaseSession *)self state];
      __int16 v8 = 2080;
      objc_super v9 = "-[CMContinuityCaptureAVCaptureAudioSession start]";
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "Invalid state %d for %s", buf, 0x12u);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CMContinuityCaptureAVCaptureAudioSession;
    [(CMContinuityCaptureAVCaptureBaseSession *)&v5 start];
  }
}

- (void)stop
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = [(CMContinuityCaptureAVCaptureBaseSession *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(CMContinuityCaptureAVCaptureBaseSession *)self state] == 2)
  {
    v5.receiver = self;
    v5.super_class = (Class)CMContinuityCaptureAVCaptureAudioSession;
    [(CMContinuityCaptureAVCaptureBaseSession *)&v5 stop];
  }
  else
  {
    id v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v7 = [(CMContinuityCaptureAVCaptureBaseSession *)self state];
      __int16 v8 = 2080;
      objc_super v9 = "-[CMContinuityCaptureAVCaptureAudioSession stop]";
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "Invalid state %d for %s", buf, 0x12u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)configureSessionWithInput:(void *)a1 andOutput:.cold.1(void *a1)
{
  v1 = [a1 captureSession];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_0(&dword_235FC2000, v2, v3, "%{public}@ Cannot add AVCaptureAudioDataOutput (%p) to AVCaptureSession (%p)", v4, v5, v6, v7, v8);
}

- (void)configureSessionWithInput:(void *)a1 andOutput:.cold.2(void *a1)
{
  v1 = [a1 captureSession];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_0(&dword_235FC2000, v2, v3, "%{public}@ Cannot add AVCaptureDeviceInput (%p) to AVCaptureSession (%p)", v4, v5, v6, v7, v8);
}

@end