@interface RPAppAudioCaptureManager
+ ($966F72C73C657EC8069F9357E961626F)audioCaptureConfigForSystemRecording:(BOOL)a3 processID:(int)a4 contextID:(id)a5;
+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3;
- (BOOL)handleStartAudioQueueFailed:(int)a3 didFailHandler:(id)a4;
- (RPAppAudioCaptureManager)init;
- (id)newAudioTapForAudioCaptureConfig:(id)a3;
- (void)resumeWithConfig:(id)a3;
- (void)startWithConfig:(id)a3 outputHandler:(id)a4 didStartHandler:(id)a5;
- (void)stop;
@end

@implementation RPAppAudioCaptureManager

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3
{
  retstr->mSampleRate = 44100.0;
  *(void *)&retstr->mFormatID = 0xE6C70636DLL;
  if (a4) {
    UInt32 v4 = 4;
  }
  else {
    UInt32 v4 = 2;
  }
  if (a4) {
    UInt32 v5 = 2;
  }
  else {
    UInt32 v5 = 1;
  }
  retstr->mBytesPerFrame = v4;
  retstr->mChannelsPerFrame = v5;
  retstr->mBytesPerPacket = v4;
  retstr->mFramesPerPacket = 1;
  *(void *)&retstr->mBitsPerChannel = 16;
  return result;
}

- (RPAppAudioCaptureManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)RPAppAudioCaptureManager;
  v2 = [(RPAppAudioCaptureManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ReplayKit.AppAudioCaptureQueue", 0);
    UInt32 v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    UInt32 v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = 0;

    +[RPAppAudioCaptureManager audioStreamBasicDescriptionWithStereo:1];
    *(_OWORD *)(v2 + 56) = v7;
    *(_OWORD *)(v2 + 72) = v8;
    *((void *)v2 + 11) = v9;
  }
  return (RPAppAudioCaptureManager *)v2;
}

- (BOOL)handleStartAudioQueueFailed:(int)a3 didFailHandler:(id)a4
{
  UInt32 v5 = (void (**)(id, void *))a4;
  if (a3)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[RPAppAudioCaptureManager handleStartAudioQueueFailed:didFailHandler:]();
      if (!v5) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if (v5)
    {
LABEL_5:
      v6 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5803 userInfo:0];
      v5[2](v5, v6);
    }
  }
LABEL_6:

  return a3 != 0;
}

- (void)startWithConfig:(id)a3 outputHandler:(id)a4 didStartHandler:(id)a5
{
  id var2 = a3.var2;
  uint64_t v7 = *(void *)&a3.var0;
  id v9 = a4;
  id v10 = a5;
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3254779904;
  block[2] = __74__RPAppAudioCaptureManager_startWithConfig_outputHandler_didStartHandler___block_invoke;
  block[3] = &unk_26D1175E8;
  block[4] = self;
  id v16 = v9;
  id v17 = v10;
  uint64_t v18 = v7;
  id v19 = var2;
  id v12 = var2;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(audioDispatchQueue, block);
}

void __74__RPAppAudioCaptureManager_startWithConfig_outputHandler_didStartHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
    __int16 v26 = 1024;
    int v27 = 267;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  uint64_t v2 = MEMORY[0x223C515A0](*(void *)(a1 + 40));
  UInt32 v4 = (id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  UInt32 v5 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  *((void *)*v4 + 4) = malloc_type_malloc(0xA0uLL, 0x1020040115CD000uLL);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
  long long v7 = *(_OWORD *)(*(void *)(a1 + 32) + 72);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 88);
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(*(void *)(a1 + 32) + 56);
  *(void *)(v6 + 40) = v8;
  *(_OWORD *)(v6 + 24) = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = MEMORY[0x263F01090];
  *(_OWORD *)(v9 + 96) = *MEMORY[0x263F01090];
  *(void *)(v9 + 112) = *(void *)(v10 + 16);
  if ((objc_msgSend(*v4, "handleStartAudioQueueFailed:didFailHandler:", AudioQueueNewInput((const AudioStreamBasicDescription *)(*((void *)*v4 + 4) + 8), (AudioQueueInputCallback)handleInputBuffer, *v4, 0, 0, 0x800u, *((AudioQueueRef **)*v4 + 4)), *(void *)(a1 + 48)) & 1) == 0)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 287;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Created Audio Queue Input", buf, 0x12u);
    }
    v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    if (v11)
    {
      id v14 = objc_msgSend(v11, "newAudioTapForAudioCaptureConfig:", v12, v13);
      if (v14)
      {
        v15 = v14;
        if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueSetProperty(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 0x71746F62u, v14, 8u), *(void *)(a1 + 48)) & 1) == 0)
        {
          if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
            __int16 v26 = 1024;
            int v27 = 299;
            _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully set Audio Queue Process Tap", buf, 0x12u);
          }
          UInt32 ioDataSize = 40;
          if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueGetProperty(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 0x61716674u, (void *)(*(void *)(*(void *)(a1 + 32) + 32) + 8), &ioDataSize), *(void *)(a1 + 48)) & 1) == 0)
          {
            *(_DWORD *)(*((void *)*v4 + 4) + 136) = 4096;
            for (uint64_t i = 48; i != 128; i += 8)
            {
              AudioQueueAllocateBuffer(**((AudioQueueRef **)*v4 + 4), *(_DWORD *)(*((void *)*v4 + 4) + 136), (AudioQueueBufferRef *)(*((void *)*v4 + 4) + i));
              AudioQueueEnqueueBuffer(**((AudioQueueRef **)*v4 + 4), *(AudioQueueBufferRef *)(*((void *)*v4 + 4) + i), 0, 0);
            }
            *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 144) = 0;
            *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 32) + 152) = 1;
            if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueAddPropertyListener(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 0x6171726Eu, (AudioQueuePropertyListenerProc)isRunningListenerCallback, *(void **)(a1 + 32)), *(void *)(a1 + 48)) & 1) == 0)
            {
              uint64_t v17 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0);
              if (v17 == -66665)
              {
                if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  __int16 v26 = 1024;
                  int v27 = 330;
                  _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AudioQueueStart retry after can not start yet error", buf, 0x12u);
                }
                sleep(1u);
                uint64_t v17 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0);
              }
              if (([*(id *)(a1 + 32) handleStartAudioQueueFailed:v17 didFailHandler:*(void *)(a1 + 48)] & 1) == 0)
              {
                if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v25 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  __int16 v26 = 1024;
                  int v27 = 338;
                  _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully started Audio Queue Recording", buf, 0x12u);
                }
                uint64_t v18 = MEMORY[0x223C515A0](*(void *)(a1 + 48));
                uint64_t v19 = *(void *)(a1 + 32);
                v20 = *(void **)(v19 + 24);
                *(void *)(v19 + 24) = v18;
              }
            }
          }
        }
LABEL_33:

        return;
      }
    }
    else
    {
    }
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __74__RPAppAudioCaptureManager_startWithConfig_outputHandler_didStartHandler___block_invoke_cold_1((uint64_t *)(a1 + 32));
    }
    uint64_t v21 = *(void *)(a1 + 48);
    v22 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5803 userInfo:0];
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

    v15 = 0;
    goto LABEL_33;
  }
}

- (void)resumeWithConfig:(id)a3
{
  self->_resumed = 1;
  -[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:](self, "startWithConfig:outputHandler:didStartHandler:", *(void *)&a3.var0, a3.var2, self->_appAudioOutputHandler, &__block_literal_global_1);
}

void __45__RPAppAudioCaptureManager_resumeWithConfig___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2 && __RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5833 userInfo:0];
    int v4 = 136446722;
    UInt32 v5 = "-[RPAppAudioCaptureManager resumeWithConfig:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 356;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

- (void)stop
{
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__RPAppAudioCaptureManager_stop__block_invoke;
  block[3] = &unk_26451D7F0;
  block[4] = self;
  dispatch_sync(audioDispatchQueue, block);
}

void __32__RPAppAudioCaptureManager_stop__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPAppAudioCaptureManager stop]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 363;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 32);
  if (v5)
  {
    if (*(_DWORD *)(v5 + 152))
    {
      *(_DWORD *)(v5 + 152) = 0;
      if (AudioQueueStop(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 1u))
      {
        if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __32__RPAppAudioCaptureManager_stop__block_invoke_cold_2();
        }
      }
      else
      {
        if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          id v13 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 378;
          _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Audio Queue successfully stopped", buf, 0x12u);
        }
        uint64_t v6 = 48;
        int v7 = &_os_log_internal;
        do
        {
          OSStatus v8 = AudioQueueFreeBuffer(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), *(AudioQueueBufferRef *)(*(void *)(*(void *)(a1 + 32) + 32) + v6));
          if (v8) {
            BOOL v9 = __RPLogLevel > 2;
          }
          else {
            BOOL v9 = 1;
          }
          if (!v9)
          {
            OSStatus v10 = v8;
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              id v13 = "-[RPAppAudioCaptureManager stop]_block_invoke";
              __int16 v14 = 1024;
              int v15 = 385;
              __int16 v16 = 1024;
              OSStatus v17 = v10;
              _os_log_error_impl(&dword_21F69F000, v7, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d AudioQueueFreeBuffer error: %i", buf, 0x18u);
            }
          }
          v6 += 8;
        }
        while (v6 != 128);
        if (AudioQueueDispose(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 1u))
        {
          if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            __32__RPAppAudioCaptureManager_stop__block_invoke_cold_1();
          }
        }
        else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          id v13 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 391;
          _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Audio Queue has been disposed", buf, 0x12u);
        }
      }
    }
    AudioQueueRemovePropertyListener(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 0x6171726Eu, (AudioQueuePropertyListenerProc)isRunningListenerCallback, *(void **)(a1 + 32));
    free(*(void **)(*(void *)(a1 + 32) + 32));
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  v11 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;
}

+ ($966F72C73C657EC8069F9357E961626F)audioCaptureConfigForSystemRecording:(BOOL)a3 processID:(int)a4 contextID:(id)a5
{
  uint64_t v5 = *(void *)&a4 << 32;
  uint64_t v6 = 0;
  result.id var2 = v6;
  result.var0 = v5;
  result.var1 = HIDWORD(v5);
  return result;
}

- (id)newAudioTapForAudioCaptureConfig:(id)a3
{
  id var2 = a3.var2;
  unint64_t v4 = *(void *)&a3.var0;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:&self->_audioBasicDescription];
  if (!v5)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPAppAudioCaptureManager newAudioTapForAudioCaptureConfig:]();
    }
    goto LABEL_15;
  }
  if (v4 == 2)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFC0A0]) initScreenSharingTapWithFormat:v5];
  }
  else if (v4 == 1)
  {
    if (!var2)
    {
      if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[RPAppAudioCaptureManager newAudioTapForAudioCaptureConfig:].cold.4();
      }
      goto LABEL_15;
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFC0A0]) initPreSpatialSceneIdentifierTapWithFormat:v5 sceneIdentifier:var2];
  }
  else
  {
    if (v4)
    {
LABEL_12:
      if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[RPAppAudioCaptureManager newAudioTapForAudioCaptureConfig:]();
      }
LABEL_15:
      int v7 = 0;
LABEL_16:
      id v10 = 0;
      goto LABEL_17;
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFC0A0]) initProcessTapWithFormat:v5 PID:HIDWORD(v4)];
  }
  int v7 = (void *)v6;
  if (!v6) {
    goto LABEL_12;
  }
  OSStatus v8 = (void *)[objc_alloc(MEMORY[0x263EFC098]) initWithTapDescription:v6];
  BOOL v9 = v8;
  if (!v8)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPAppAudioCaptureManager newAudioTapForAudioCaptureConfig:]();
    }
    goto LABEL_16;
  }
  [v8 setScreenSharingHost:1];
  id v10 = v9;
LABEL_17:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong(&self->_appTapDidStartHandler, 0);
  objc_storeStrong(&self->_appAudioOutputHandler, 0);

  objc_storeStrong((id *)&self->_audioDispatchQueue, 0);
}

- (void)handleStartAudioQueueFailed:didFailHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d AudioQueue start error: %i", v1, v2, v3, v4, 2u);
}

void __74__RPAppAudioCaptureManager_startWithConfig_outputHandler_didStartHandler___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 136446722;
  uint64_t v3 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 291;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d (%p) Failed to create audio tap", (uint8_t *)&v2, 0x1Cu);
}

void __32__RPAppAudioCaptureManager_stop__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d error: %i", v1, v2, v3, v4, 2u);
}

void __32__RPAppAudioCaptureManager_stop__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d error: %i", v1, v2, v3, v4, 2u);
}

- (void)newAudioTapForAudioCaptureConfig:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d allocate audioFormat error", v1, v2, v3, v4, 2u);
}

- (void)newAudioTapForAudioCaptureConfig:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Failed to create audio tap description", v1, v2, v3, v4, 2u);
}

- (void)newAudioTapForAudioCaptureConfig:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Failed to create audio tap", v1, v2, v3, v4, 2u);
}

- (void)newAudioTapForAudioCaptureConfig:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d contextID is nil", v1, v2, v3, v4, 2u);
}

@end