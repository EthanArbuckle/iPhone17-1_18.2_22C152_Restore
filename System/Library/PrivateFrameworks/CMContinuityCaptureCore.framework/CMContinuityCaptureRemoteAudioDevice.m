@interface CMContinuityCaptureRemoteAudioDevice
- (BOOL)_shouldPrintDroppedSampleBufferLog:(int64_t)a3;
- (BOOL)startAVConferenceStack:(unint64_t)a3;
- (BOOL)startCameraCaptureStack:(unint64_t)a3;
- (BOOL)stopAVConferenceStack;
- (BOOL)stopCameraCaptureStack:(unint64_t)a3;
- (CMContinuityCaptureAVCaptureAudioSession)captureSession;
- (CMContinuityCaptureRemoteAudioDevice)initWithCapabilities:(id)a3 compositeDelegate:(id)a4 captureSession:(id)a5;
- (id)createAVCAudioStream;
- (id)newAudioStreamCurrentConfiguration:(int64_t)a3;
- (opaqueCMSampleBuffer)_createSampleBufferForAudioData:(id)a3 dataRange:(_NSRange)a4 pts:(id *)a5 formatDescription:(opaqueCMFormatDescription *)a6;
- (void)_dispatchAudioFrame:(opaqueCMSampleBuffer *)a3;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_processIncomingAudioBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_resetNetworkSampleTime;
- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)createAVCAudioStream;
- (void)didStartStreamInput:(id)a3;
- (void)didStopStreamInput:(id)a3;
- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)handleSynchronizeAudioClockCompletion;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postAVCStreamInterruption;
- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5;
- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5;
- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)streamDidRTCPTimeOut:(id)a3;
- (void)streamDidRTPTimeOut:(id)a3;
- (void)streamDidServerDie:(id)a3;
- (void)streamDidStop:(id)a3;
@end

@implementation CMContinuityCaptureRemoteAudioDevice

- (CMContinuityCaptureRemoteAudioDevice)initWithCapabilities:(id)a3 compositeDelegate:(id)a4 captureSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 server];
  if (!v11) {
    goto LABEL_4;
  }
  v12 = [v9 server];
  v13 = [v12 localDevice];
  v14 = [v10 queue];
  v17.receiver = self;
  v17.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  self = [(CMContinuityCaptureDeviceBase *)&v17 initWithCapabilities:v8 compositeDelegate:v9 transportDevice:v13 queue:v14];

  if (self)
  {
    objc_storeStrong((id *)&self->_captureSession, a5);
    self->_disableBufferBlockSizeCheck = 0;
    self = self;
    v15 = self;
  }
  else
  {
LABEL_4:
    v15 = 0;
  }

  return v15;
}

- (CMContinuityCaptureAVCaptureAudioSession)captureSession
{
  return self->_captureSession;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13 = [(CMContinuityCaptureDeviceBase *)self queue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __87__CMContinuityCaptureRemoteAudioDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_264C99238;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  v21[1] = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __87__CMContinuityCaptureRemoteAudioDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _observeValueForKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) change:*(void *)(a1 + 48) context:*(void *)(a1 + 64)];
    id WeakRetained = v3;
  }
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v10);

  LODWORD(v10) = [v9 isEqualToString:@"active"];
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v11 = *MEMORY[0x263F081B8];
  id v12 = [v8 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  if ([v12 BOOLValue])
  {
  }
  else
  {
    v13 = [v8 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
    int v14 = [v13 BOOLValue];

    if (v14)
    {
      id v15 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        id v20 = self;
        _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ active 1 -> 0", (uint8_t *)&v19, 0xCu);
      }

      [(CMContinuityCaptureRemoteAudioDevice *)self stopCaptureStack:4 completion:&__block_literal_global_18];
      goto LABEL_13;
    }
  }
  id v16 = [v8 objectForKeyedSubscript:v11];
  if (([v16 BOOLValue] & 1) == 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  objc_super v17 = [v8 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
  char v18 = [v17 BOOLValue];

  if ((v18 & 1) == 0)
  {
    id v16 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = self;
      _os_log_impl(&dword_235FC2000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ active 0 -> 1", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)didStartStreamInput:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    int v8 = 138544130;
    id v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = [v6 currentSessionID];
    __int16 v12 = 2080;
    v13 = "-[CMContinuityCaptureRemoteAudioDevice didStartStreamInput:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] AVCInput setup complete %s %@", (uint8_t *)&v8, 0x2Au);
  }
  v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v7);

  self->_avcStreamInputActive = 1;
}

- (void)didStopStreamInput:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    v7 = self;
    __int16 v8 = 2080;
    id v9 = "-[CMContinuityCaptureRemoteAudioDevice didStopStreamInput:]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_avcStreamInputActive = 0;
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543874;
    id v9 = self;
    __int16 v10 = 2080;
    uint64_t v11 = "-[CMContinuityCaptureRemoteAudioDevice stream:didStart:error:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)streamDidStop:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    __int16 v10 = 2080;
    uint64_t v11 = "-[CMContinuityCaptureRemoteAudioDevice streamDidStop:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", buf, 0x20u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CMContinuityCaptureRemoteAudioDevice_streamDidStop___block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

uint64_t __54__CMContinuityCaptureRemoteAudioDevice_streamDidStop___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[43];
    v7 = v2;
    if (v3)
    {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      id v4 = (void *)v7[43];
      v7[43] = 0;

      v2 = v7;
    }
    v5 = (void *)v2[29];
    v2[29] = 0;

    *((unsigned char *)v7 + 336) = 0;
  }
  return MEMORY[0x270F9A758]();
}

- (void)streamDidServerDie:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    __int16 v10 = 2080;
    uint64_t v11 = "-[CMContinuityCaptureRemoteAudioDevice streamDidServerDie:]";
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v6 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureRemoteAudioDevice_streamDidServerDie___block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __59__CMContinuityCaptureRemoteAudioDevice_streamDidServerDie___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[29];
    WeakRetained[29] = 0;

    v2 = (void *)WeakRetained[28];
    WeakRetained[28] = 0;

    *((unsigned char *)WeakRetained + 336) = 0;
    uint64_t v3 = WeakRetained[43];
    if (v3)
    {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      id v4 = (void *)WeakRetained[43];
      WeakRetained[43] = 0;
    }
    [WeakRetained postAVCStreamInterruption];
  }
}

- (void)postAVCStreamInterruption
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    __int16 v8 = 2080;
    id v9 = "-[CMContinuityCaptureRemoteAudioDevice postAVCStreamInterruption]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v4 = [(CMContinuityCaptureDeviceBase *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CMContinuityCaptureRemoteAudioDevice_postAVCStreamInterruption__block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __65__CMContinuityCaptureRemoteAudioDevice_postAVCStreamInterruption__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained compositeDelegate];
    if (v2)
    {
      uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1007 userInfo:0];
      [v2 connectionInterrupted:v3 forDevice:0];
    }
    id WeakRetained = v4;
  }
}

- (void)streamDidRTPTimeOut:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543874;
    v7 = self;
    __int16 v8 = 2080;
    id v9 = "-[CMContinuityCaptureRemoteAudioDevice streamDidRTPTimeOut:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_INFO, "%{public}@ %s %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v12 = self;
    __int16 v13 = 2080;
    uint64_t v14 = "-[CMContinuityCaptureRemoteAudioDevice streamDidRTCPTimeOut:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_INFO, "%{public}@ %s %@", buf, 0x20u);
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2080;
    uint64_t v14 = "-[CMContinuityCaptureRemoteAudioDevice streamDidRTCPTimeOut:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_INFO, "%@ %s %@", buf, 0x20u);
  }

  v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__CMContinuityCaptureRemoteAudioDevice_streamDidRTCPTimeOut___block_invoke;
  v8[3] = &unk_264C990F8;
  objc_copyWeak(&v9, &location);
  dispatch_async(v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__CMContinuityCaptureRemoteAudioDevice_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained postAVCStreamInterruption];
    id WeakRetained = v2;
  }
}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  v7 = (void (**)(id, id))a5;
  __int16 v8 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v8);

  if (self->_avcStreamInputActive)
  {
    avcStreamInput = self->_avcStreamInput;
    id v14 = 0;
    char v10 = [(AVCStreamInput *)avcStreamInput pushSampleBuffer:a3 error:&v14];
    id v11 = v14;
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteVideoDevice dispatchFrame:entity:completion:]();
      }
    }
  }
  else
  {
    id v11 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1003 userInfo:0];
  }
  v13.receiver = self;
  v13.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  [(CMContinuityCaptureDeviceBase *)&v13 dispatchFrame:a3 entity:[(CMContinuityCaptureDeviceBase *)self entity] completion:&__block_literal_global_4];
  v7[2](v7, v11);
}

- (id)createAVCAudioStream
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CMContinuityCaptureDeviceBase *)self transportStream];
  id v4 = v3;
  if (!v3)
  {
    id v14 = 0;
    objc_super v13 = 0;
    v5 = 0;
LABEL_19:
    char v10 = 0;
    goto LABEL_16;
  }
  v5 = [v3 streamUUID];
  int v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    *(_DWORD *)buf = 138543874;
    v23 = self;
    __int16 v24 = 2048;
    uint64_t v25 = [v7 currentSessionID];
    __int16 v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCAudioStream StreamUUID %@", buf, 0x20u);
  }
  if (!v5)
  {
    id v14 = 0;
    objc_super v13 = 0;
    goto LABEL_19;
  }
  __int16 v8 = [(CMContinuityCaptureDeviceBase *)self avcStreamNegotiator];

  if (!v8)
  {
    id v11 = 0;
LABEL_9:
    uint64_t v12 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = self;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v11;
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid avcStreamInitOptions, error %@", buf, 0x16u);
    }

    id v11 = 0;
    char v10 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_12;
  }
  id v9 = [(CMContinuityCaptureDeviceBase *)self avcStreamNegotiator];
  id v21 = 0;
  char v10 = [v9 generateMediaStreamInitOptionsWithError:&v21];
  id v11 = v21;

  if (!v10) {
    goto LABEL_9;
  }
LABEL_12:
  id v20 = v11;
  objc_super v13 = (void *)[objc_alloc(MEMORY[0x263F20F80]) initWithRTPNWConnectionClientID:v5 rtcpNWConnectionClientID:0 options:v10 error:&v20];
  id v14 = v20;

  if (v13)
  {
    [v13 setDelegate:self];
    __int16 v15 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
      uint64_t v17 = [v16 currentSessionID];
      *(_DWORD *)buf = 138543874;
      v23 = self;
      __int16 v24 = 2048;
      uint64_t v25 = v17;
      __int16 v26 = 2048;
      v27 = v13;
      _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCAudioStream %p success", buf, 0x20u);
    }
  }
  else
  {
    __int16 v15 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteAudioDevice createAVCAudioStream]();
    }
    objc_super v13 = 0;
  }

LABEL_16:
  id v18 = v13;

  return v18;
}

- (id)newAudioStreamCurrentConfiguration:(int64_t)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v5 = [(CMContinuityCaptureDeviceBase *)self transportStream];
  int v6 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  v7 = v6;
  if (v6)
  {
    __int16 v8 = [v6 server];
    id v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v39 = self;
      __int16 v40 = 2080;
      v41 = "-[CMContinuityCaptureRemoteAudioDevice newAudioStreamCurrentConfiguration:]";
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
    }

    char v10 = 0;
    id v11 = 0;
    uint64_t v12 = 0;
    if (v5 && v8)
    {
      objc_super v13 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
      id v14 = [v13 sessionID];
      uint64_t v12 = [v5 cipherKeyforSessionID:v14];

      if (v12)
      {
        __int16 v15 = [(CMContinuityCaptureDeviceBase *)self avcStreamNegotiator];
        id v37 = 0;
        char v10 = [v15 generateMediaStreamConfigurationWithError:&v37];
        id v11 = v37;

        if (v10)
        {
          [v10 setRtcpSendInterval:1.0];
          [v10 setRtcpTimeOutEnabled:1];
          uint64_t v16 = [v8 currentTransport];
          double v17 = 12.0;
          if (v16 == 2) {
            double v17 = 8.0;
          }
          [v10 setRtcpTimeOutInterval:v17];
          [v10 setSRTPCipherSuite:5];
          [v10 setSRTCPCipherSuite:5];
          [v10 setSendMediaKey:v12];
          [v10 setReceiveMediaKey:v12];
          [v10 setStreamInputID:a3];
          [v10 setJitterBufferMode:2];
          [v10 setFixedJitterBufferSize:20];
          id v18 = [v8 timeSyncClock];

          if (v18)
          {
            int v19 = [v8 timeSyncClock];
            objc_msgSend(v10, "setNetworkClockID:", objc_msgSend(v19, "clockIdentifier"));
          }
          id v20 = [v10 audio];
          [v20 setPtime:10];

          id v21 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
          int v22 = [v21 audioDeviceMode];

          if (v22 == 1667329132)
          {
            v23 = [v10 audio];
            [v23 setCodecType:16];

            __int16 v24 = [v10 audio];
            [v24 setChannelCount:4];
          }
          uint64_t v25 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v36 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
            uint64_t v35 = [v36 currentSessionID];
            uint64_t v26 = [v10 networkClockID];
            v27 = v12;
            uint64_t v28 = v8;
            v29 = v7;
            v30 = v5;
            int v31 = [v10 localSSRC];
            int v32 = [v10 remoteSSRC];
            *(_DWORD *)buf = 138413314;
            v39 = self;
            __int16 v40 = 2048;
            v41 = (const char *)v35;
            __int16 v42 = 2048;
            uint64_t v43 = v26;
            __int16 v44 = 1024;
            int v45 = v31;
            v5 = v30;
            v7 = v29;
            __int16 v8 = v28;
            uint64_t v12 = v27;
            __int16 v46 = 1024;
            int v47 = v32;
            _os_log_impl(&dword_235FC2000, v25, OS_LOG_TYPE_DEFAULT, "%@ [sessionID:%llx] networkClockID %llu localSSRC %x remoteSSRC %x", buf, 0x2Cu);
          }
        }
        else
        {
          uint64_t v25 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[CMContinuityCaptureVideoDevice newVideoStreamCurrentConfiguration]();
          }
          char v10 = 0;
        }
      }
      else
      {
        char v10 = 0;
        id v11 = 0;
      }
    }
    id v33 = v10;
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

- (BOOL)startAVConferenceStack:(unint64_t)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  *(_OWORD *)&asbd.mSampleRate = ContinuityCaptureDefaultModeInputASBD;
  *(_OWORD *)&asbd.mBytesPerPacket = unk_2360594F0;
  *(void *)&asbd.mBitsPerChannel = 32;
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = self;
    __int16 v36 = 2080;
    id v37 = "-[CMContinuityCaptureRemoteAudioDevice startAVConferenceStack:]";
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  id stopCompletionBlock = self->_stopCompletionBlock;
  self->_id stopCompletionBlock = 0;

  self->_avcStreamInputActive = 0;
  if (!self->_avcAudioStream)
  {
    v7 = [(CMContinuityCaptureRemoteAudioDevice *)self createAVCAudioStream];
    avcAudioStream = self->_avcAudioStream;
    self->_avcAudioStream = v7;

    if (!self->_avcAudioStream)
    {
      BOOL v26 = 0;
      id v19 = 0;
      goto LABEL_17;
    }
  }
  id v9 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
  int v10 = [v9 audioDeviceMode];

  if (v10 == 1667329132)
  {
    *(_OWORD *)&asbd.mSampleRate = ContinuityCaptureTelephonyModeInputASBD;
    *(_OWORD *)&asbd.mBytesPerPacket = unk_236059540;
    *(void *)&asbd.mBitsPerChannel = 32;
  }
  OSStatus v11 = CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  CMAudioFormatDescriptionRef v12 = formatDescriptionOut;
  objc_super v13 = CMContinuityCaptureLog(2);
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = self->_avcAudioStream;
      *(_DWORD *)buf = 138543874;
      uint64_t v35 = self;
      __int16 v36 = 2048;
      id v37 = (const char *)v15;
      __int16 v38 = 2112;
      CMAudioFormatDescriptionRef v39 = formatDescriptionOut;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ AVCAudioStream %p setup for format %@", buf, 0x20u);
    }

    [(CMContinuityCaptureRemoteAudioDevice *)self _resetNetworkSampleTime];
    id v16 = objc_alloc(MEMORY[0x263F20FD8]);
    double v17 = [(CMContinuityCaptureDeviceBase *)self queue];
    id v31 = 0;
    id v18 = (AVCStreamInput *)[v16 initWithDelegate:self delegateQueue:v17 format:formatDescriptionOut options:0 error:&v31];
    id v19 = v31;
    avcStreamInput = self->_avcStreamInput;
    self->_avcStreamInput = v18;

    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    id v21 = self->_avcStreamInput;
    if (v21)
    {
      int v22 = [(CMContinuityCaptureRemoteAudioDevice *)self newAudioStreamCurrentConfiguration:[(AVCStreamInput *)v21 streamInputID]];
      if (!v22)
      {
        BOOL v26 = 0;
        goto LABEL_17;
      }
      id v14 = v22;
      v23 = self->_avcAudioStream;
      id v30 = v19;
      char v24 = [(AVCAudioStream *)v23 configure:v14 error:&v30];
      id v25 = v30;

      if (v24)
      {
        [(AVCAudioStream *)self->_avcAudioStream start];
        BOOL v26 = 1;
      }
      else
      {
        uint64_t v28 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureRemoteAudioDevice startAVConferenceStack:]();
        }

        BOOL v26 = 0;
      }
    }
    else
    {
      id v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteAudioDevice startAVConferenceStack:]();
      }
      BOOL v26 = 0;
      id v25 = v19;
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CMContinuityCaptureRemoteAudioDevice *)(uint64_t)self startAVConferenceStack:v14];
    }
    BOOL v26 = 0;
    id v25 = 0;
  }

  id v19 = v25;
LABEL_17:
  v29.receiver = self;
  v29.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  [(CMContinuityCaptureDeviceBase *)&v29 startAVConferenceStack:a3];

  return v26;
}

- (BOOL)stopAVConferenceStack
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = self;
    __int16 v10 = 2080;
    OSStatus v11 = "-[CMContinuityCaptureRemoteAudioDevice stopAVConferenceStack]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);
  }

  if (self->_avcStreamInput && (avcAudioStream = self->_avcAudioStream) != 0)
  {
    [(AVCAudioStream *)avcAudioStream stop];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  if (!self->_avcStreamInputActive)
  {
    avcStreamInput = self->_avcStreamInput;
    self->_avcStreamInput = 0;
  }
  return v5;
}

- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v6 = (void (**)(id, void *))a4;
  v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v7);

  if (self->_stopCompletionBlock)
  {
    int v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      __int16 v26 = 2080;
      v27 = "-[CMContinuityCaptureRemoteAudioDevice stopCaptureStack:completion:]";
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s already in progress", buf, 0x16u);
    }

    if ((a3 & 4) != 0)
    {
      avcAudioStream = self->_avcAudioStream;
      self->_avcAudioStream = 0;

      __int16 v10 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCAudio reference", buf, 0xCu);
      }
    }
    if (v6)
    {
      OSStatus v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:3 userInfo:0];
      v6[2](v6, v11);
    }
  }
  else
  {
    if (self->_avcStreamInputActive)
    {
      uint64_t v12 = (void *)MEMORY[0x237DFB780](v6);
      id stopCompletionBlock = self->_stopCompletionBlock;
      self->_id stopCompletionBlock = v12;

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      dispatch_time_t v14 = dispatch_time(0, 5000000000);
      __int16 v15 = [(CMContinuityCaptureDeviceBase *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__CMContinuityCaptureRemoteAudioDevice_stopCaptureStack_completion___block_invoke;
      block[3] = &unk_264C990F8;
      objc_copyWeak(&v24, (id *)buf);
      dispatch_after(v14, v15, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
    BOOL v16 = [(CMContinuityCaptureRemoteAudioDevice *)self stopAVConferenceStack];
    [(CMContinuityCaptureRemoteAudioDevice *)self stopCameraCaptureStack:a3];
    if ((a3 & 4) != 0)
    {
      double v17 = self->_avcAudioStream;
      if (v17) {
        [(AVCAudioStream *)v17 stop];
      }
      avcStreamInput = self->_avcStreamInput;
      self->_avcStreamInput = 0;

      id v19 = self->_avcAudioStream;
      self->_avcAudioStream = 0;

      self->_avcStreamInputActive = 0;
      id v20 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCAudio reference", buf, 0xCu);
      }
    }
    v22.receiver = self;
    v22.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
    [(CMContinuityCaptureDeviceBase *)&v22 stopCaptureStack:a3 completion:&__block_literal_global_13];
    if (!v16 || !self->_avcStreamInputActive)
    {
      id v21 = self->_stopCompletionBlock;
      self->_id stopCompletionBlock = 0;

      v6[2](v6, 0);
    }
  }
}

uint64_t __68__CMContinuityCaptureRemoteAudioDevice_stopCaptureStack_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[43];
    if (v3)
    {
      int v6 = v2;
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      id v4 = (void *)v6[43];
      v6[43] = 0;
    }
  }
  return MEMORY[0x270F9A758]();
}

- (BOOL)stopCameraCaptureStack:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  BOOL v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    int v23 = 138544130;
    id v24 = self;
    __int16 v25 = 2048;
    uint64_t v26 = [v7 currentSessionID];
    __int16 v27 = 2080;
    uint64_t v28 = "-[CMContinuityCaptureRemoteAudioDevice stopCameraCaptureStack:]";
    __int16 v29 = 1024;
    LODWORD(v30) = v3;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %s option %d", (uint8_t *)&v23, 0x26u);
  }
  if (self->_captureStackActive)
  {
    int v8 = [(CMContinuityCaptureRemoteAudioDevice *)self captureSession];
    [v8 stop];

    id v9 = [(CMContinuityCaptureRemoteAudioDevice *)self captureSession];
    __int16 v10 = [v9 captureSession];

    OSStatus v11 = [(CMContinuityCaptureRemoteAudioDevice *)self captureSession];
    [v11 willConfigure];

    if (self->_audioDataOutput) {
      objc_msgSend(v10, "removeOutput:");
    }
    if (self->_audioDeviceInput) {
      objc_msgSend(v10, "removeInput:");
    }
    uint64_t v12 = [(CMContinuityCaptureRemoteAudioDevice *)self captureSession];
    [v12 didConfigure];

    audioDataOutput = self->_audioDataOutput;
    self->_audioDataOutput = 0;

    audioDeviceInput = self->_audioDeviceInput;
    self->_audioDeviceInput = 0;

    audioDevice = self->_audioDevice;
    self->_audioDevice = 0;

    self->_captureStackActive = 0;
  }
  BOOL v16 = +[CMContinuityCaptureMSNExceptionMonitor sharedMonitor];
  objc_msgSend(v16, "decrementExceptionCountForEntity:", -[CMContinuityCaptureDeviceBase entity](self, "entity"));

  double v17 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
    uint64_t v19 = [v18 currentSessionID];
    cameraCaptureStreamSessionID = self->_cameraCaptureStreamSessionID;
    unint64_t audioBufferDropCounter = self->_audioBufferDropCounter;
    int v23 = 138544130;
    id v24 = self;
    __int16 v25 = 2048;
    uint64_t v26 = v19;
    __int16 v27 = 2114;
    uint64_t v28 = (const char *)cameraCaptureStreamSessionID;
    __int16 v29 = 2048;
    unint64_t v30 = audioBufferDropCounter;
    _os_log_impl(&dword_235FC2000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] #of frame drops for streamSessionID:%{public}@ %lld", (uint8_t *)&v23, 0x2Au);
  }
  return 1;
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  [(CMContinuityCaptureDeviceBase *)&v2 invalidate];
  +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:0];
}

- (BOOL)startCameraCaptureStack:(unint64_t)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  BOOL v5 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
  v7 = v6;
  if (v6)
  {
    int v8 = [v6 server];
    if (self->_captureStackActive || [(CMContinuityCaptureDeviceBase *)self invalidated])
    {
      BOOL v31 = 0;
      goto LABEL_28;
    }
    id v9 = (NSUUID *)objc_opt_new();
    cameraCaptureStreamSessionID = self->_cameraCaptureStreamSessionID;
    self->_cameraCaptureStreamSessionID = v9;

    OSStatus v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(CMContinuityCaptureDeviceBase *)self compositeDelegate];
      uint64_t v13 = [v12 currentSessionID];
      dispatch_time_t v14 = self->_cameraCaptureStreamSessionID;
      *(_DWORD *)buf = 138544386;
      v63 = self;
      __int16 v64 = 2048;
      uint64_t v65 = v13;
      __int16 v66 = 2080;
      v67 = "-[CMContinuityCaptureRemoteAudioDevice startCameraCaptureStack:]";
      __int16 v68 = 1024;
      int v69 = a3;
      __int16 v70 = 2114;
      v71 = v14;
      _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %s option:%d streamSessionID:%{public}@", buf, 0x30u);
    }
    __int16 v15 = +[CMContinuityCaptureMSNExceptionMonitor sharedMonitor];
    objc_msgSend(v15, "incrementExceptionCountForEntity:", -[CMContinuityCaptureDeviceBase entity](self, "entity"));

    BOOL v16 = [(CMContinuityCaptureRemoteAudioDevice *)self captureSession];
    [v16 willConfigure];

    double v17 = [MEMORY[0x263EFA598] defaultDeviceWithMediaType:*MEMORY[0x263EF9CE8]];
    audioDevice = self->_audioDevice;
    self->_audioDevice = v17;

    if (self->_audioDevice)
    {
      uint64_t v19 = [v8 timeSyncClock];
      id v20 = [v19 clockDeviceUID];
      [(AVCaptureDevice *)self->_audioDevice setClientAudioClockDeviceUID:v20];

      id v21 = self->_audioDevice;
      id v61 = 0;
      objc_super v22 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v21 error:&v61];
      int v23 = v61;
      audioDeviceInput = self->_audioDeviceInput;
      self->_audioDeviceInput = v22;

      if (self->_audioDeviceInput)
      {
        __int16 v25 = [(CMContinuityCaptureDeviceBase *)self activeConfiguration];
        uint64_t v26 = [v25 audioDeviceMode];

        __int16 v27 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = [NSNumber numberWithUnsignedInt:v26];
          *(_DWORD *)buf = 138543618;
          v63 = self;
          __int16 v64 = 2112;
          uint64_t v65 = (uint64_t)v28;
          _os_log_impl(&dword_235FC2000, v27, OS_LOG_TYPE_DEFAULT, " %{public}@ got mode %@", buf, 0x16u);
        }
        if (v26 == 1684434036)
        {
          uint64_t v29 = CMContinuityCaptureDevicePosition();
          if (v29)
          {
            if (v29 != 1)
            {
              if (v29 != 2)
              {
LABEL_22:
                uint64_t v40 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  v41 = self->_audioDeviceInput;
                  *(_DWORD *)buf = 138543618;
                  v63 = self;
                  __int16 v64 = 2112;
                  uint64_t v65 = (uint64_t)v41;
                  _os_log_impl(&dword_235FC2000, v40, OS_LOG_TYPE_DEFAULT, " %{public}@ input %@", buf, 0x16u);
                }

                __int16 v42 = (AVCaptureAudioDataOutput *)objc_alloc_init(MEMORY[0x263EFA550]);
                audioDataOutput = self->_audioDataOutput;
                self->_audioDataOutput = v42;

                __int16 v44 = self->_audioDataOutput;
                int v45 = [(CMContinuityCaptureDeviceBase *)self queue];
                [(AVCaptureAudioDataOutput *)v44 setSampleBufferDelegate:self queue:v45];

                __int16 v46 = [(CMContinuityCaptureRemoteAudioDevice *)self captureSession];
                [v46 configureSessionWithInput:self->_audioDeviceInput andOutput:self->_audioDataOutput];

                int v47 = [(CMContinuityCaptureRemoteAudioDevice *)self captureSession];
                [v47 didConfigure];

                self->_audioBufferOutputCounter = 0;
                self->_unint64_t audioBufferDropCounter = 0;
                self->_audioSampleRate = 0.0;
                self->_audioBytesPerSample = 0;
                [(CMContinuityCaptureRemoteAudioDevice *)self _resetNetworkSampleTime];
                uint64_t v48 = [(CMContinuityCaptureRemoteAudioDevice *)self captureSession];
                [v48 start];

                v49 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  v50 = [(CMContinuityCaptureRemoteAudioDevice *)self captureSession];
                  int v51 = [v50 state];
                  *(_DWORD *)buf = 138543618;
                  v63 = self;
                  __int16 v64 = 1024;
                  LODWORD(v65) = v51;
                  _os_log_impl(&dword_235FC2000, v49, OS_LOG_TYPE_DEFAULT, " %{public}@ state %d", buf, 0x12u);
                }
                self->_captureStackActive = 1;
                v60.receiver = self;
                v60.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
                BOOL v31 = [(CMContinuityCaptureDeviceBase *)&v60 startCameraCaptureStack:a3];
                goto LABEL_27;
              }
              uint64_t v30 = 4;
LABEL_21:
              [(AVCaptureDeviceInput *)self->_audioDeviceInput setAudioCaptureMode:v30];
              goto LABEL_22;
            }
          }
          else
          {
            int v32 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              -[CMContinuityCaptureRemoteAudioDevice startCameraCaptureStack:](v32, v33, v34, v35, v36, v37, v38, v39);
            }
          }
          uint64_t v30 = 3;
          goto LABEL_21;
        }
        uint64_t v30 = 5;
        goto LABEL_21;
      }
      v59 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteAudioDevice startCameraCaptureStack:]();
      }
    }
    else
    {
      int v23 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteAudioDevice startCameraCaptureStack:]((uint64_t)self, v23, v53, v54, v55, v56, v57, v58);
      }
    }
    BOOL v31 = 0;
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  BOOL v31 = 0;
LABEL_29:

  return v31;
}

- (void)handleSynchronizeAudioClockCompletion
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v3 = [(CMContinuityCaptureDeviceBase *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__CMContinuityCaptureRemoteAudioDevice_handleSynchronizeAudioClockCompletion__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __77__CMContinuityCaptureRemoteAudioDevice_handleSynchronizeAudioClockCompletion__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_loadWeakRetained(v1);
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Got SynchronizeAudioClockCompletion message", (uint8_t *)&v5, 0xCu);
    }
    WeakRetained[296] = 1;
  }
}

- (BOOL)_shouldPrintDroppedSampleBufferLog:(int64_t)a3
{
  return a3 < 5 || 0xEEEEEEEEEEEEEEEFLL * a3 < 0x1111111111111112;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v7);

  ++self->_audioBufferOutputCounter;
  if (self->_avcStreamInputActive)
  {
    [(CMContinuityCaptureRemoteAudioDevice *)self _processIncomingAudioBuffer:a4];
  }
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  p_unint64_t audioBufferDropCounter = &self->_audioBufferDropCounter;
  ++self->_audioBufferDropCounter;
  uint64_t v7 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([(CMContinuityCaptureRemoteAudioDevice *)self _shouldPrintDroppedSampleBufferLog:*p_audioBufferDropCounter])
  {
    int v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteAudioDevice captureOutput:didDropSampleBuffer:fromConnection:]((uint64_t)self, p_audioBufferDropCounter, v8);
    }
  }
}

- (void)_processIncomingAudioBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  dataPointerOut = 0;
  size_t totalLengthOut = 0;
  desc = CMSampleBufferGetFormatDescription(a3);
  if (!self->_audioBytesPerSample || (double mSampleRate = self->_audioSampleRate, mSampleRate == 0.0))
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(desc);
    unsigned int mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
    self->_unsigned int audioBytesPerSample = mBytesPerFrame;
    if ((StreamBasicDescription->mFormatFlags & 0x20) != 0) {
      self->_unsigned int audioBytesPerSample = StreamBasicDescription->mChannelsPerFrame * mBytesPerFrame;
    }
    double mSampleRate = StreamBasicDescription->mSampleRate;
    self->_double audioSampleRate = StreamBasicDescription->mSampleRate;
    self->_unint64_t requiredAudioSampleCountPerBuffer = (mSampleRate * 0.01);
    if (!self->_audioBytesPerSample) {
      goto LABEL_26;
    }
  }
  if (mSampleRate == 0.0)
  {
LABEL_26:
    uint64_t v34 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      double audioSampleRate = self->_audioSampleRate;
      unsigned int audioBytesPerSample = self->_audioBytesPerSample;
      LODWORD(v47.value) = 134218240;
      *(double *)((char *)&v47.value + 4) = audioSampleRate;
      LOWORD(v47.flags) = 1024;
      *(CMTimeFlags *)((char *)&v47.flags + 2) = audioBytesPerSample;
      _os_log_error_impl(&dword_235FC2000, v34, OS_LOG_TYPE_ERROR, "Trying to process audio buffer but couldn't retrieve valid audioSampleRate %f and audioBytesPerSample %d", (uint8_t *)&v47, 0x12u);
    }
  }
  else
  {
    DataBuffer = CMSampleBufferGetDataBuffer(a3);
    if (CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &dataPointerOut))
    {
      uint64_t v35 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteAudioDevice _processIncomingAudioBuffer:]();
      }
    }
    else
    {
      NSUInteger v9 = [(NSData *)self->_remainingAudioDataFromPreviousSbuf length];
      NSUInteger v10 = self->_audioBytesPerSample;
      uint64_t v11 = v9 / v10;
      unint64_t v12 = totalLengthOut / v10 + v9 / v10;
      if (v9 < v10 && v12 == self->_requiredAudioSampleCountPerBuffer)
      {
LABEL_15:
        [(CMContinuityCaptureRemoteAudioDevice *)self _dispatchAudioFrame:a3];
        return;
      }
      if (self->_disableBufferBlockSizeCheck
        || ([(CMContinuityCaptureDeviceBase *)self activeConfiguration],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            int v14 = [v13 audioDeviceMode],
            v13,
            v14 == 1667329132))
      {
        __int16 v15 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          [(CMContinuityCaptureRemoteAudioDevice *)v11 _processIncomingAudioBuffer:v15];
        }

        goto LABEL_15;
      }
      uint64_t v39 = [MEMORY[0x263EFF990] dataWithData:self->_remainingAudioDataFromPreviousSbuf];
      [v39 appendBytes:dataPointerOut length:totalLengthOut];
      unint64_t requiredAudioSampleCountPerBuffer = self->_requiredAudioSampleCountPerBuffer;
      unint64_t v38 = v12 / requiredAudioSampleCountPerBuffer;
      CMSampleBufferGetPresentationTimeStamp(&lhs, a3);
      CMTimeMake(&rhs, v11, (int)self->_audioSampleRate);
      CMTimeSubtract(&v47, &lhs, &rhs);
      if (v12 >= requiredAudioSampleCountPerBuffer)
      {
        uint64_t v17 = 0;
        CMTimeValue value = v47.value;
        uint64_t v19 = *(void *)&v47.timescale;
        CMTimeEpoch epoch = v47.epoch;
        if (v38 <= 1) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = v38;
        }
        do
        {
          unsigned int v22 = self->_requiredAudioSampleCountPerBuffer;
          memset(&v47, 170, sizeof(v47));
          CMTimeMake(&v42, v22 * v17, (int)self->_audioSampleRate);
          v41.CMTimeValue value = value;
          *(void *)&v41.timescale = v19;
          v41.CMTimeEpoch epoch = epoch;
          CMTimeAdd(&v47, &v41, &v42);
          uint64_t v23 = self->_audioBytesPerSample * self->_requiredAudioSampleCountPerBuffer;
          CMTime v41 = v47;
          id v24 = -[CMContinuityCaptureRemoteAudioDevice _createSampleBufferForAudioData:dataRange:pts:formatDescription:](self, "_createSampleBufferForAudioData:dataRange:pts:formatDescription:", v39, (v23 * v17), v23, &v41, desc);
          if (v24)
          {
            __int16 v25 = v24;
            [(CMContinuityCaptureRemoteAudioDevice *)self _dispatchAudioFrame:v24];
            CFRelease(v25);
          }
          ++v17;
        }
        while (v21 != v17);
      }
      unint64_t v26 = v38 * self->_requiredAudioSampleCountPerBuffer * self->_audioBytesPerSample;
      uint64_t v27 = [v39 length];
      unint64_t v28 = v27 - v26;
      if (v27 == v26)
      {
        remainingAudioDataFromPreviousSbuf = self->_remainingAudioDataFromPreviousSbuf;
        self->_remainingAudioDataFromPreviousSbuf = 0;
      }
      else
      {
        uint64_t v30 = (void *)MEMORY[0x263EFF8F8];
        id v31 = v39;
        objc_msgSend(v30, "dataWithBytes:length:", objc_msgSend(v31, "bytes") + v26, v28);
        int v32 = (NSData *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = self->_remainingAudioDataFromPreviousSbuf;
        self->_remainingAudioDataFromPreviousSbuf = v32;
      }
    }
  }
}

- (opaqueCMSampleBuffer)_createSampleBufferForAudioData:(id)a3 dataRange:(_NSRange)a4 pts:(id *)a5 formatDescription:(opaqueCMFormatDescription *)a6
{
  size_t length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  CMBlockBufferRef blockBufferOut = 0;
  CMSampleBufferRef v29 = 0;
  dataPointerOut = (char *)0xAAAAAAAAAAAAAAAALL;
  v26.decodeTimeStamp.CMTimeEpoch epoch = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v26.presentationTimeStamp.timescale = v12;
  *(_OWORD *)&v26.decodeTimeStamp.CMTimeValue value = v12;
  *(_OWORD *)&v26.duration.CMTimeValue value = v12;
  *(_OWORD *)&v26.duration.CMTimeEpoch epoch = v12;
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(a6);
  size_t sampleSizeArray = StreamBasicDescription->mBytesPerFrame;
  size_t v14 = length / sampleSizeArray;
  p_unint64_t requiredAudioSampleCountPerBuffer = &self->_requiredAudioSampleCountPerBuffer;
  uint64_t v16 = *p_requiredAudioSampleCountPerBuffer;
  BOOL v17 = length / sampleSizeArray == v16;
  if (length / sampleSizeArray == v16)
  {
    p_double mSampleRate = &StreamBasicDescription->mSampleRate;
    CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, length, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, length, 1u, &blockBufferOut))
    {
      uint64_t v23 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.5();
      }
    }
    else if (CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut))
    {
      uint64_t v23 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.4();
      }
    }
    else
    {
      memcpy(dataPointerOut, (const void *)([v11 bytes] + location), length);
      CMTimeMake(&v26.duration, 1, (int)*p_mSampleRate);
      v26.presentationTimeStamp = (CMTime)*a5;
      v26.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
      if (!CMSampleBufferCreate(v19, blockBufferOut, 1u, 0, 0, a6, v14, 1, &v26, 1, &sampleSizeArray, &v29))
      {
        BOOL v17 = 0;
        goto LABEL_7;
      }
      uint64_t v23 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureRemoteAudioDevice _createSampleBufferForAudioData:dataRange:pts:formatDescription:]();
      }
    }
  }
  else
  {
    uint64_t v23 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteAudioDevice _createSampleBufferForAudioData:dataRange:pts:formatDescription:].cold.4(v14, p_requiredAudioSampleCountPerBuffer, v23);
    }
  }

LABEL_7:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  id v20 = v29;
  if (v29) {
    BOOL v21 = v17;
  }
  else {
    BOOL v21 = 0;
  }
  if (v21)
  {
    CFRelease(v29);
    id v20 = 0;
  }

  return v20;
}

- (void)_resetNetworkSampleTime
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    uint64_t v7 = self;
    __int16 v8 = 2080;
    NSUInteger v9 = "-[CMContinuityCaptureRemoteAudioDevice _resetNetworkSampleTime]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  id v4 = [(CMContinuityCaptureDeviceBase *)self queue];
  dispatch_assert_queue_V2(v4);

  self->_audioClockIsSynchronized = 0;
  self->_networkAudioSampleTime = 0;
  self->_lastAudioSynchronizationNetworkSampleTime = 0;
  remainingAudioDataFromPreviousSbuf = self->_remainingAudioDataFromPreviousSbuf;
  self->_remainingAudioDataFromPreviousSbuf = 0;
}

- (void)_dispatchAudioFrame:(opaqueCMSampleBuffer *)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  NumSamples = (void *)CMSampleBufferGetNumSamples(a3);
  int64_t v6 = [(CMContinuityCaptureDeviceBase *)self entity];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke;
  v7[3] = &unk_264C9A7D0;
  objc_copyWeak(v8, &location);
  v7[4] = self;
  v8[1] = a3;
  v8[2] = NumSamples;
  [(CMContinuityCaptureRemoteAudioDevice *)self dispatchFrame:a3 entity:v6 completion:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    int64_t v6 = [WeakRetained queue];
    dispatch_assert_queue_V2(v6);

    uint64_t v7 = [*(id *)(a1 + 32) compositeDelegate];
    __int16 v8 = v7;
    if (!v7)
    {
LABEL_23:

      goto LABEL_24;
    }
    NSUInteger v9 = [v7 server];
    uint64_t v10 = v9;
    if (!v3)
    {
      uint64_t v20 = *(void *)(v5 + 304);
      if (!*(unsigned char *)(v5 + 296)
        && (!v20 || (double)(unint64_t)(v20 - *(void *)(v5 + 312)) / *(double *)(v5 + 272) > 0.05))
      {
        BOOL v21 = [v9 timeSyncClock];

        uint64_t v20 = *(void *)(v5 + 304);
        if (v21)
        {
          *(void *)(v5 + 312) = v20;
          CMClockRef HostTimeClock = CMClockGetHostTimeClock();
          uint64_t v23 = [(id)v5 captureSession];
          id v24 = (const void *)[v23 synchronizationClock];

          memset(&v41, 170, sizeof(v41));
          CMSampleBufferGetPresentationTimeStamp(&v41, *(CMSampleBufferRef *)(a1 + 48));
          memset(&v40, 170, sizeof(v40));
          CMTime time = v41;
          CMSyncConvertTime(&v40, &time, v24, HostTimeClock);
          __int16 v25 = [v10 timeSyncClock];
          CMTime time = v40;
          int64_t v26 = [v25 domainTimeForMachAbsoluteTime:CMClockConvertHostTimeToSystemUnits(&time)];

          uint64_t v27 = [v10 timeSyncClock];
          uint64_t v28 = [v27 grandMasterIdentifier];

          CMSampleBufferRef v29 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            CMTime time = v41;
            Float64 Seconds = CMTimeGetSeconds(&time);
            CMTime time = v40;
            Float64 v31 = CMTimeGetSeconds(&time);
            CMTime time = v40;
            uint64_t v37 = CMClockConvertHostTimeToSystemUnits(&time);
            [NSNumber numberWithUnsignedLongLong:v26];
            int v32 = v38 = v28;
            CMTimeMake(&v39, v26, 1000000000);
            Float64 v33 = CMTimeGetSeconds(&v39);
            uint64_t v34 = *MEMORY[0x263F7F270];
            BOOL v35 = v26 != *MEMORY[0x263F7F270];
            LODWORD(time.value) = 134219266;
            *(Float64 *)((char *)&time.value + 4) = Seconds;
            LOWORD(time.flags) = 2048;
            *(Float64 *)((char *)&time.flags + 2) = v31;
            HIWORD(time.epoch) = 2048;
            uint64_t v43 = v37;
            __int16 v44 = 2112;
            int v45 = v32;
            __int16 v46 = 2048;
            Float64 v47 = v33;
            __int16 v48 = 1024;
            BOOL v49 = v35;
            _os_log_impl(&dword_235FC2000, v29, OS_LOG_TYPE_DEFAULT, "Converted audio PTS %.4f to host time PTS %.4f, mach_absolute_time %llu networkTime %@ %.5f valid %d", (uint8_t *)&time, 0x3Au);

            uint64_t v28 = v38;
          }
          else
          {
            uint64_t v34 = *MEMORY[0x263F7F270];
          }

          if (v26 != v34)
          {
            uint64_t v36 = [(id)v5 transportDevice];
            [v36 synchronizeAudioClockWithSampleTime:*(void *)(v5 + 304) networkTime:v26 clockGrandMasterIdentifier:v28];
          }
          uint64_t v20 = *(void *)(v5 + 304);
        }
      }
      *(void *)(v5 + 304) = v20 + *(void *)(a1 + 56);
      goto LABEL_22;
    }
    id v11 = [v3 domain];
    int v12 = [v11 isEqualToString:@"ContinuityCapture"];

    if (v12)
    {
      uint64_t v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke_cold_1(v5, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    else
    {
      *(unsigned char *)(v5 + 296) = 0;
      if (!CMContinityCaptureDebugLogEnabled())
      {
LABEL_22:

        goto LABEL_23;
      }
      uint64_t v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke_cold_2();
      }
    }

    goto LABEL_22;
  }
LABEL_24:
}

- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5
{
  id v8 = a4;
  NSUInteger v9 = v8;
  if (a3 == 3)
  {
    uint64_t v10 = [v8 name];
    int v11 = [v10 isEqualToString:@"kCMContinuityCaptureEventStreamInterrupted"];

    if (v11) {
      -[CMContinuityCaptureDeviceBase postActionOfType:forEvent:option:](&v14, sel_postActionOfType_forEvent_option_, 13, v9, a5, v12.receiver, v12.super_class, v13.receiver, v13.super_class, self, CMContinuityCaptureRemoteAudioDevice);
    }
    else {
      -[CMContinuityCaptureDeviceBase postActionOfType:forEvent:option:](&v13, sel_postActionOfType_forEvent_option_, 12, v9, a5, v12.receiver, v12.super_class, self, CMContinuityCaptureRemoteAudioDevice, v14.receiver, v14.super_class);
    }
  }
  else
  {
    -[CMContinuityCaptureDeviceBase postActionOfType:forEvent:option:](&v12, sel_postActionOfType_forEvent_option_, a3, v8, a5, self, CMContinuityCaptureRemoteAudioDevice, v13.receiver, v13.super_class, v14.receiver, v14.super_class);
  }
}

- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = CMContinuityCaptureRemoteEventToBeRelayedList();
  objc_super v12 = CMContinuityCaptureRemoteEventToBeRelayedListEvenWhenDropped();
  if ([v11 containsObject:v8]
    && (!v10
     || [v10 code] != 1
     && ([v10 code] != 2 || objc_msgSend(v12, "containsObject:", v8))))
  {
    objc_super v13 = [(CMContinuityCaptureDeviceBase *)self transportDevice];
    objc_msgSend(v13, "postEvent:entity:data:", v8, -[CMContinuityCaptureDeviceBase entity](self, "entity"), v9);
  }
  v14.receiver = self;
  v14.super_class = (Class)CMContinuityCaptureRemoteAudioDevice;
  [(CMContinuityCaptureDeviceBase *)&v14 postActionCompletionForEventName:v8 eventData:v9 error:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraCaptureStreamSessionID, 0);
  objc_storeStrong((id *)&self->_audioDevice, 0);
  objc_storeStrong(&self->_stopCompletionBlock, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_remainingAudioDataFromPreviousSbuf, 0);
  objc_storeStrong((id *)&self->_audioDeviceInput, 0);
  objc_storeStrong((id *)&self->_audioDataOutput, 0);
  objc_storeStrong((id *)&self->_avcStreamInput, 0);
  objc_storeStrong((id *)&self->_avcAudioStream, 0);
}

- (void)createAVCAudioStream
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ AVCAudioStream create error %@");
}

- (void)startAVConferenceStack:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_235FC2000, log, OS_LOG_TYPE_ERROR, "%{public}@ CMAudioFormatDescriptionCreate returned err %d", (uint8_t *)&v3, 0x12u);
}

- (void)startAVConferenceStack:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ AVCAudioInput Error %@");
}

- (void)startAVConferenceStack:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ AVCAudioStream configure error %@");
}

- (void)startCameraCaptureStack:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startCameraCaptureStack:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ Error creating audio device input: %@");
}

- (void)startCameraCaptureStack:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)captureOutput:(uint64_t)a1 didDropSampleBuffer:(void *)a2 fromConnection:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2(&dword_235FC2000, (uint64_t)a2, a3, "%{public}@ Dropped %lld audio buffers", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_processIncomingAudioBuffer:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_4_0(&dword_235FC2000, a2, a3, "Buffer reconstruction for required block size is disabled, but received a buffer with unexpected block size. Remaining sample count:%d, buffer sample count:%d", 67109376, v3);
}

- (void)_processIncomingAudioBuffer:.cold.2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_235FC2000, v0, v1, "Failed to retrieve data bytes from incoming audio sample buffer. error: %d", v2, v3, v4, v5, v6);
}

- (void)_createSampleBufferForAudioData:dataRange:pts:formatDescription:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_235FC2000, v0, v1, "CMSampleBufferCreate(audio) failed (%d)", v2, v3, v4, v5, v6);
}

- (void)_createSampleBufferForAudioData:(NSObject *)a3 dataRange:pts:formatDescription:.cold.4(uint64_t a1, _DWORD *a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *a2;
  OUTLINED_FUNCTION_4_0(&dword_235FC2000, (uint64_t)a2, a3, "Failed to create audio sample buffer with invalid number of samples: %d. Requiring %d samples", 67109376, v3);
}

void __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__CMContinuityCaptureRemoteAudioDevice__dispatchAudioFrame___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_235FC2000, v0, OS_LOG_TYPE_DEBUG, "%@ Error pushing buffer %@", v1, 0x16u);
}

@end