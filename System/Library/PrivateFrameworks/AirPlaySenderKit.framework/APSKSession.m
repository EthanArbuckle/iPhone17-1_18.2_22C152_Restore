@interface APSKSession
- (APSKSession)init;
- (APSKSession)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (BOOL)active;
- (int)addAudioStream:(id)a3;
- (int)addVideoStream:(id)a3;
- (int)localSendAudioData:(id)a3;
- (int)localSendAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6;
- (int)localSendFrame:(__CVBuffer *)a3 forTime:(int64_t)a4;
- (int)localSetAuthString:(id)a3;
- (int)localStartToDestination:(id)a3 withOptions:(id)a4;
- (int)remoteSendAudioData:(id)a3;
- (int)remoteSendAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6;
- (int)remoteSendFrame:(__CVBuffer *)a3 forTime:(int64_t)a4;
- (int)remoteSetAuthString:(id)a3;
- (int)remoteStartToDestination:(id)a3 withOptions:(id)a4;
- (int)sendAudioData:(id)a3;
- (int)sendAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6;
- (int)sendFrame:(__CVBuffer *)a3 forTime:(int64_t)a4;
- (int)setAuthString:(id)a3;
- (unsigned)usageModes;
- (void)dealloc;
- (void)handleAuthRequired:(int)a3;
- (void)handleFailure:(int)a3;
- (void)handleStartCompletion:(int)a3;
- (void)handleUpdatedDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5;
- (void)handleVideoStreamErrorNotification:(int)a3;
- (void)localStop;
- (void)remoteStop;
- (void)startToDestination:(id)a3 withOptions:(id)a4;
- (void)stop;
@end

@implementation APSKSession

- (APSKSession)init
{
  return [(APSKSession *)self initWithDelegate:0 delegateQueue:0];
}

- (APSKSession)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)APSKSession;
  v8 = [(APSKSession *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    p_delegateQueue = (void **)&v9->_delegateQueue;
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v9->_state = 0;
    v9->_remote = 1;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.apsksession.stateq", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_delegate);
    if (WeakRetained)
    {
      v14 = *p_delegateQueue;

      if (!v14)
      {
        dispatch_queue_t v15 = dispatch_queue_create("com.apple.apsksession.delegateq", 0);
        v16 = *p_delegateQueue;
        *p_delegateQueue = v15;
      }
    }
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  return v9;
}

- (void)dealloc
{
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    v3 = self;
    LogPrintF();
  }
  [(APSKSession *)self stop];
  v4.receiver = self;
  v4.super_class = (Class)APSKSession;
  [(APSKSession *)&v4 dealloc];
}

- (BOOL)active
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __21__APSKSession_active__block_invoke;
  v5[3] = &unk_265222480;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__APSKSession_active__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 56) != 0;
  return result;
}

- (int)addVideoStream:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__APSKSession_addVideoStream___block_invoke;
  block[3] = &unk_265222550;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)queue;
}

void __30__APSKSession_addVideoStream___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -6709;
  }
  else
  {
    uint64_t v4 = *(void *)(v2 + 32);
    char v3 = (id *)(v2 + 32);
    if (!v4)
    {
      objc_storeStrong(v3, *(id *)(a1 + 40));
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -6719;
  }
  APSLogErrorAt();
}

- (int)addAudioStream:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__APSKSession_addAudioStream___block_invoke;
  block[3] = &unk_265222550;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)queue;
}

void __30__APSKSession_addAudioStream___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -6709;
  }
  else
  {
    uint64_t v4 = *(void *)(v2 + 40);
    char v3 = (id *)(v2 + 40);
    if (!v4)
    {
      objc_storeStrong(v3, *(id *)(a1 + 40));
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -6719;
  }
  APSLogErrorAt();
}

- (int)setAuthString:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  if (gLogCategory_AirPlaySenderKit <= 30
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__APSKSession_setAuthString___block_invoke;
  block[3] = &unk_265222578;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  int v7 = *((_DWORD *)v13 + 6);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __29__APSKSession_setAuthString___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  int v3 = *(_DWORD *)(v2 + 56);
  if (v3 == 1)
  {
    uint64_t v6 = a1[5];
    if (*(unsigned char *)(v2 + 60)) {
      int v7 = [(id)v2 remoteSetAuthString:v6];
    }
    else {
      int v7 = [(id)v2 localSetAuthString:v6];
    }
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = v7;
  }
  else if (v3)
  {
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -6709;
  }
  else
  {
    id v4 = (void *)a1[5];
    v5 = (id *)(v2 + 48);
    objc_storeStrong(v5, v4);
  }
}

- (void)startToDestination:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__APSKSession_startToDestination_withOptions___block_invoke;
  block[3] = &unk_2652225A0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __46__APSKSession_startToDestination_withOptions___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 32) + 56))
  {
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_UseLocal"];
    *(unsigned char *)(*(void *)(a1 + 32) + 60) = [v2 BOOLValue] ^ 1;

    int v3 = *(unsigned char **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    if (v3[60]) {
      int v6 = [v3 remoteStartToDestination:v5 withOptions:v4];
    }
    else {
      int v6 = [v3 localStartToDestination:v5 withOptions:v4];
    }
    int v7 = v6;
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 1;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(a1 + 48) value];
      LogPrintF();
    }
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(NSObject **)(v10 + 16);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __46__APSKSession_startToDestination_withOptions___block_invoke_2;
        block[3] = &unk_2652224F8;
        block[4] = v10;
        int v13 = v7;
        dispatch_async(v11, block);
      }
    }
  }
}

void __46__APSKSession_startToDestination_withOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained sessionDidFail:*(void *)(a1 + 32) withError:*(unsigned int *)(a1 + 40)];
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __19__APSKSession_stop__block_invoke;
  block[3] = &unk_2652224A8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __19__APSKSession_stop__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setFrameSender:0];
  [*(id *)(*(void *)(a1 + 32) + 40) setAudioSender:0];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[60]) {
    uint64_t result = [v2 remoteStop];
  }
  else {
    uint64_t result = [v2 localStop];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v4 + 56))
  {
    if (gLogCategory_AirPlaySenderKit <= 50)
    {
      if (gLogCategory_AirPlaySenderKit != -1
        || (result = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 32), result))
      {
        uint64_t result = LogPrintF();
        uint64_t v4 = *(void *)(a1 + 32);
      }
    }
    *(_DWORD *)(v4 + 56) = 0;
  }
  return result;
}

- (int)sendFrame:(__CVBuffer *)a3 forTime:(int64_t)a4
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__APSKSession_sendFrame_forTime___block_invoke;
  v7[3] = &unk_2652225C8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  int v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __33__APSKSession_sendFrame_forTime___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (!*(void *)(v1 + 32))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -6705;
    return APSLogErrorAt();
  }
  if (*(_DWORD *)(v1 + 56) != 2)
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[7];
  uint64_t v4 = (void *)a1[4];
  if (*(unsigned char *)(v1 + 60)) {
    return [v4 remoteSendFrame:v2 forTime:v3];
  }
  else {
    return [v4 localSendFrame:v2 forTime:v3];
  }
}

- (int)sendAudioData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__APSKSession_sendAudioData___block_invoke;
  block[3] = &unk_265222550;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)queue;
}

uint64_t __29__APSKSession_sendAudioData___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 40))
  {
    if (*(_DWORD *)(v2 + 56) == 2)
    {
      uint64_t v3 = a1[5];
      if (*(unsigned char *)(v2 + 60)) {
        uint64_t result = [(id)v2 remoteSendAudioData:v3];
      }
      else {
        uint64_t result = [(id)v2 localSendAudioData:v3];
      }
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = result;
      return result;
    }
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -6709;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -6705;
  }
  return APSLogErrorAt();
}

- (int)sendAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6
{
  id v10 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __86__APSKSession_sendAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke;
  v14[3] = &unk_2652225F0;
  v14[4] = self;
  id v15 = v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a4;
  v16 = &v20;
  unint64_t v17 = a5;
  BOOL v19 = a6;
  id v12 = v10;
  dispatch_sync(queue, v14);
  LODWORD(a5) = *((_DWORD *)v21 + 6);

  _Block_object_dispose(&v20, 8);
  return a5;
}

uint64_t __86__APSKSession_sendAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    if (*(_DWORD *)(v2 + 56) == 2)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      id v4 = (long long *)(a1 + 64);
      uint64_t v5 = *(void *)(a1 + 56);
      BOOL v6 = *(unsigned char *)(a1 + 88) != 0;
      if (*(unsigned char *)(v2 + 60))
      {
        long long v8 = *v4;
        uint64_t v9 = *(void *)(a1 + 80);
        uint64_t result = [(id)v2 remoteSendAudioDataWithTimestamps:v3 forHostTime:&v8 forSampleTime:v5 forDiscontinuity:v6];
      }
      else
      {
        long long v8 = *v4;
        uint64_t v9 = *(void *)(a1 + 80);
        uint64_t result = [(id)v2 localSendAudioDataWithTimestamps:v3 forHostTime:&v8 forSampleTime:v5 forDiscontinuity:v6];
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
      return result;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -6709;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -6705;
  }
  return APSLogErrorAt();
}

- (unsigned)usageModes
{
  if (self->_audioStream) {
    return (self->_videoStream != 0) | 2;
  }
  else {
    return self->_videoStream != 0;
  }
}

- (void)handleAuthRequired:(int)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = a3 == 1;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__APSKSession_handleAuthRequired___block_invoke;
    block[3] = &unk_265222618;
    block[4] = self;
    void block[5] = v7;
    dispatch_async(delegateQueue, block);
  }
}

void __34__APSKSession_handleAuthRequired___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained sessionAuthRequired:*(void *)(a1 + 32) forAuthType:*(void *)(a1 + 40)];
}

- (void)handleStartCompletion:(int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__APSKSession_handleStartCompletion___block_invoke;
  v4[3] = &unk_2652224F8;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(queue, v4);
}

void __37__APSKSession_handleStartCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56) == 1)
  {
    if (*(_DWORD *)(a1 + 40))
    {
      if (gLogCategory_AirPlaySenderKit <= 100)
      {
        if (gLogCategory_AirPlaySenderKit != -1 || (int v3 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v3))
        {
          LogPrintF();
          uint64_t v2 = *(void *)(a1 + 32);
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        BOOL v7 = *(NSObject **)(v6 + 16);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __37__APSKSession_handleStartCompletion___block_invoke_2;
        block[3] = &unk_2652224F8;
        block[4] = v6;
        int v12 = *(_DWORD *)(a1 + 40);
        dispatch_async(v7, block);
      }
    }
    else
    {
      if (gLogCategory_AirPlaySenderKit <= 50)
      {
        if (gLogCategory_AirPlaySenderKit != -1 || (int v8 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v8))
        {
          uint64_t v10 = v2;
          LogPrintF();
          uint64_t v2 = *(void *)(a1 + 32);
        }
      }
      *(_DWORD *)(v2 + 56) = 2;
      [*(id *)(*(void *)(a1 + 32) + 40) setAudioSender:v10];
      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 32);
      objc_msgSend(v9, "setFrameSender:");
    }
  }
  else if (gLogCategory_AirPlaySenderKit <= 50 {
         && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __37__APSKSession_handleStartCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained sessionDidFail:*(void *)(a1 + 32) withError:*(unsigned int *)(a1 + 40)];
}

- (void)handleFailure:(int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__APSKSession_handleFailure___block_invoke;
  v4[3] = &unk_2652224F8;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(queue, v4);
}

void __29__APSKSession_handleFailure___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56))
  {
    if (gLogCategory_AirPlaySenderKit <= 100)
    {
      if (gLogCategory_AirPlaySenderKit != -1 || (int v3 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v3))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      BOOL v7 = *(NSObject **)(v6 + 16);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __29__APSKSession_handleFailure___block_invoke_2;
      block[3] = &unk_2652224F8;
      block[4] = v6;
      int v9 = *(_DWORD *)(a1 + 40);
      dispatch_async(v7, block);
    }
  }
  else if (gLogCategory_AirPlaySenderKit <= 50 {
         && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __29__APSKSession_handleFailure___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained sessionDidFail:*(void *)(a1 + 32) withError:*(unsigned int *)(a1 + 40)];
}

- (void)handleUpdatedDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__APSKSession_handleUpdatedDisplayWidth_height_refreshRate___block_invoke;
  block[3] = &unk_265222520;
  block[4] = self;
  int v7 = a3;
  int v8 = a4;
  int v9 = a5;
  dispatch_sync(queue, block);
}

uint64_t __60__APSKSession_handleUpdatedDisplayWidth_height_refreshRate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setDisplayWidth:*(unsigned int *)(a1 + 40) height:*(unsigned int *)(a1 + 44) refreshRate:*(unsigned int *)(a1 + 48)];
}

- (void)handleVideoStreamErrorNotification:(int)a3
{
  if (gLogCategory_AirPlaySenderKit <= 90
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__APSKSession_handleVideoStreamErrorNotification___block_invoke;
  block[3] = &unk_2652224F8;
  block[4] = self;
  int v7 = a3;
  dispatch_sync(queue, block);
}

uint64_t __50__APSKSession_handleVideoStreamErrorNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setError:*(unsigned int *)(a1 + 40)];
}

- (int)localSetAuthString:(id)a3
{
  id v4 = a3;
  sender = self->_sender;
  if (!sender)
  {
    int v6 = -6709;
    goto LABEL_5;
  }
  int v6 = APMediaSenderSetAuthString((uint64_t)sender, v4);
  if (v6) {
LABEL_5:
  }
    APSLogErrorAt();

  return v6;
}

- (int)localStartToDestination:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(APSKSession *)self usageModes];
  int v9 = [v7 objectForKeyedSubscript:@"APSKSessionOptionsKeyTimeoutSeconds"];
  int v29 = [v9 intValue];

  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke;
  aBlock[3] = &unk_265222640;
  objc_copyWeak(&v41, location);
  v31 = _Block_copy(aBlock);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke_2;
  v38[3] = &unk_265222640;
  objc_copyWeak(&v39, location);
  uint64_t v10 = _Block_copy(v38);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke_3;
  v36[3] = &unk_265222640;
  objc_copyWeak(&v37, location);
  uint64_t v11 = _Block_copy(v36);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke_4;
  v34[3] = &unk_265222668;
  objc_copyWeak(&v35, location);
  v30 = _Block_copy(v34);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke_5;
  v32[3] = &unk_265222690;
  objc_copyWeak(&v33, location);
  int v12 = _Block_copy(v32);
  if (!v8)
  {
    int updated = -6705;
    APSLogErrorAt();
    goto LABEL_27;
  }
  if (self->_sender)
  {
    int updated = -6709;
    APSLogErrorAt();
    goto LABEL_27;
  }
  sender = (OpaqueAPMediaSender *)APMediaSenderCreate();
  self->_sender = sender;
  if (!sender)
  {
    int updated = -6762;
    APSLogErrorAt();
    goto LABEL_27;
  }
  if (gLogCategory_AirPlaySenderKit <= 50)
  {
    if (gLogCategory_AirPlaySenderKit != -1 || (int v14 = _LogCategory_Initialize(), sender = self->_sender, v14))
    {
      v27 = self;
      v28 = sender;
      LogPrintF();
      sender = self->_sender;
    }
  }
  passcode = self->_passcode;
  if (!passcode) {
    goto LABEL_11;
  }
  int updated = APMediaSenderSetAuthString((uint64_t)sender, passcode);
  if (!updated)
  {
    sender = self->_sender;
LABEL_11:
    int updated = APMediaSenderSetAuthBlock((uint64_t)sender, (uint64_t)v31);
    if (!updated)
    {
      int updated = APMediaSenderSetFailureBlock((uint64_t)self->_sender, (uint64_t)v11);
      if (!updated)
      {
        audioStream = self->_audioStream;
        if (!audioStream
          || (int updated = APMediaSenderSetAudioDescription((uint64_t)self->_sender, (uint64_t)[(APSKStreamAudio *)audioStream asbd], [(APSKStreamAudio *)self->_audioStream useVideoLatency])) == 0)
        {
          if (!self->_videoStream)
          {
LABEL_21:
            APMediaSenderStart((uint64_t)self->_sender, (CFTypeRef)objc_msgSend(v6, "value", v27, v28), objc_msgSend(v6, "destinationType"), v8, v29, (uint64_t)v10);
            int updated = 0;
            goto LABEL_22;
          }
          int updated = APMediaSenderSetDisplayInfoUpdateBlock((uint64_t)self->_sender, (uint64_t)v30);
          if (!updated)
          {
            $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = self->_sender;
            BOOL v19 = [v7 objectForKeyedSubscript:@"_VideoOverrides"];
            int updated = APMediaSenderSetVideoOverrides((uint64_t)v18, v19);

            if (!updated)
            {
              uint64_t v20 = [v7 objectForKeyedSubscript:@"_UseVideoPassthrough"];
              int v21 = [v20 BOOLValue];

              if (!v21 || (int updated = APMediaSenderSetVideoPassthroughMode((uint64_t)self->_sender)) == 0)
              {
                uint64_t v22 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v27, v28);
                int v23 = [v22 addObserverForName:0x26FBC4E08 object:self->_sender queue:0 usingBlock:v12];
                senderNotifObserver = self->_senderNotifObserver;
                self->_senderNotifObserver = v23;

                goto LABEL_21;
              }
            }
          }
        }
      }
    }
  }
  APSLogErrorAt();
LABEL_27:
  if (gLogCategory_AirPlaySenderKit <= 90
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v26 = self->_sender;
  if (v26)
  {
    CFRelease(v26);
    self->_sender = 0;
  }
LABEL_22:

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&v41);
  objc_destroyWeak(location);

  return updated;
}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleAuthRequired:a2];
}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleStartCompletion:a2];
}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleFailure:a2];
}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleUpdatedDisplayWidth:a2 height:a3 refreshRate:a4];
}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 userInfo];

  char v5 = [v4 objectForKeyedSubscript:0x26FBC4E28];
  uint64_t v6 = [v5 intValue];

  [WeakRetained handleVideoStreamErrorNotification:v6];
}

- (void)localStop
{
  if (self->_senderNotifObserver)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_senderNotifObserver];

    senderNotifObserver = self->_senderNotifObserver;
    self->_senderNotifObserver = 0;
  }
  sender = self->_sender;
  if (sender)
  {
    APMediaSenderStop((uint64_t)sender);
    uint64_t v6 = self->_sender;
    if (v6)
    {
      CFRelease(v6);
      self->_sender = 0;
    }
  }
}

- (int)localSendFrame:(__CVBuffer *)a3 forTime:(int64_t)a4
{
  sender = self->_sender;
  if (!sender)
  {
    int v5 = -6709;
    goto LABEL_5;
  }
  int v5 = APMediaSenderSubmitPixelBuffer((uint64_t)sender, (uint64_t)a3, a4);
  if (v5) {
LABEL_5:
  }
    APSLogErrorAt();
  return v5;
}

- (int)localSendAudioData:(id)a3
{
  id v4 = a3;
  sender = self->_sender;
  if (!sender)
  {
    int v6 = -6709;
    goto LABEL_5;
  }
  int v6 = APMediaSenderEnqueueAudioData((uint64_t)sender, (uint64_t)v4);
  if (v6) {
LABEL_5:
  }
    APSLogErrorAt();

  return v6;
}

- (int)localSendAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6
{
  id v10 = a3;
  sender = self->_sender;
  if (!sender)
  {
    int v12 = -6709;
    goto LABEL_5;
  }
  long long v14 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  int v12 = APMediaSenderEnqueueAudioDataWithTimestamps((uint64_t)sender, (uint64_t)v10, &v14, a5, a6);
  if (v12) {
LABEL_5:
  }
    APSLogErrorAt();

  return v12;
}

- (int)remoteSetAuthString:(id)a3
{
  id v4 = a3;
  if (self->_objectID && self->_client)
  {
    int v5 = FigXPCCreateBasicMessage();
    id v6 = 0;
    if (v5) {
      goto LABEL_9;
    }
    if (v4) {
      xpc_dictionary_set_string(v6, (const char *)kAPSKServiceMsgParamC2S_AuthString, (const char *)[v4 UTF8String]);
    }
    int v5 = FigXPCRemoteClientSendSyncMessageCreatingReply();
    if (v5) {
LABEL_9:
    }
      APSLogErrorAt();
  }
  else
  {
    int v5 = -6709;
    APSLogErrorAt();
    id v6 = 0;
  }
  FigXPCRelease();

  return v5;
}

- (int)remoteStartToDestination:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(APSKSession *)self usageModes];
  int v9 = [v7 objectForKeyedSubscript:@"APSKSessionOptionsKeyTimeoutSeconds"];
  int v10 = [v9 intValue];

  if (!v8)
  {
    int v12 = -6705;
LABEL_42:
    APSLogErrorAt();
    id v13 = 0;
    goto LABEL_44;
  }
  if (self->_objectID)
  {
    int v12 = -6709;
    goto LABEL_42;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sRemoteClientLock);
  if (sRemoteClient) {
    goto LABEL_4;
  }
  uint64_t v27 = FigXPCRemoteClientCreateWithXPCService();
  if (v27)
  {
    if (gLogCategory_AirPlaySenderKit <= 100)
    {
      uint64_t v28 = v27;
      if (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize())
      {
        uint64_t v30 = kAPSKServiceName;
        uint64_t v31 = v28;
LABEL_34:
        LogPrintF();
      }
    }
  }
  else if (gLogCategory_AirPlaySenderKit <= 50 {
         && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  }
  {
    uint64_t v30 = kAPSKServiceName;
    goto LABEL_34;
  }
LABEL_4:
  os_unfair_lock_unlock((os_unfair_lock_t)&sRemoteClientLock);
  uint64_t v11 = sRemoteClient;
  self->_client = (OpaqueFigXPCRemoteClient *)sRemoteClient;
  if (!v11)
  {
    int v12 = -6762;
    goto LABEL_42;
  }
  int v12 = FigXPCCreateBasicMessage();
  id v13 = 0;
  if (!v12)
  {
    int v12 = FigXPCRemoteClientSendSyncMessageCreatingReply();
    id v14 = 0;
    id v15 = v14;
    if (!v12)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v14, (const char *)*MEMORY[0x263F01168]);
      if (uint64)
      {
        unint64_t v17 = uint64;
        int v18 = FigXPCRemoteClientAssociateObject();
        if (v18)
        {
          int v12 = v18;
        }
        else
        {
          self->_objectID = v17;
          FigXPCRelease();

          int v12 = FigXPCCreateBasicMessage();
          id v13 = 0;
          if (!v12)
          {
            [v6 value];
            int v19 = FigXPCMessageSetCFObject();
            if (v19)
            {
              int v12 = v19;
            }
            else
            {
              xpc_dictionary_set_uint64(v13, (const char *)kAPSKServiceMsgParamC2S_DestinationType, (int)[v6 destinationType]);
              xpc_dictionary_set_uint64(v13, (const char *)kAPSKServiceMsgParamC2S_UsageModes, v8);
              xpc_dictionary_set_uint64(v13, (const char *)kAPSKServiceMsgParamC2S_TimeoutSecs, v10);
              passcode = self->_passcode;
              if (passcode) {
                xpc_dictionary_set_string(v13, (const char *)kAPSKServiceMsgParamC2S_AuthString, [(NSString *)passcode UTF8String]);
              }
              audioStream = self->_audioStream;
              if (audioStream)
              {
                xpc_dictionary_set_data(v13, (const char *)kAPSKServiceMsgParamC2S_ASBD, [(APSKStreamAudio *)audioStream asbd], 0x28uLL);
                xpc_dictionary_set_BOOL(v13, (const char *)kAPSKServiceMsgParamC2S_UseVideoLatency, [(APSKStreamAudio *)self->_audioStream useVideoLatency]);
              }
              if (!self->_videoStream) {
                goto LABEL_20;
              }
              uint64_t v22 = [v7 objectForKeyedSubscript:@"_VideoOverrides"];

              if (!v22 || (int v23 = FigXPCMessageSetCFDictionary()) == 0)
              {
                v24 = objc_msgSend(v7, "objectForKeyedSubscript:", @"_UseVideoPassthrough", v30, v31);
                int v25 = [v24 BOOLValue];

                if (v25) {
                  xpc_dictionary_set_BOOL(v13, (const char *)kAPSKServiceMsgParamC2S_VideoPassthru, 1);
                }
LABEL_20:
                int v26 = FigXPCRemoteClientSendSyncMessageCreatingReply();
                if (!v26)
                {
                  if (gLogCategory_AirPlaySenderKit <= 50
                    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                  }
                  int v12 = 0;
                  goto LABEL_30;
                }
                int v12 = v26;
                goto LABEL_52;
              }
              int v12 = v23;
            }
          }
        }
      }
      else
      {
        int v12 = -6762;
      }
    }
LABEL_52:
    APSLogErrorAt();
    goto LABEL_53;
  }
  APSLogErrorAt();
LABEL_44:
  id v15 = 0;
LABEL_53:
  if (gLogCategory_AirPlaySenderKit <= 90
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_30:
  FigXPCRelease();
  FigXPCRelease();

  return v12;
}

- (void)remoteStop
{
  if (self->_objectID)
  {
    if (self->_client)
    {
      int v3 = FigXPCCreateBasicMessage();
      id v4 = 0;
      if (v3 || FigXPCRemoteClientSendSyncMessageCreatingReply()) {
        APSLogErrorAt();
      }
    }
    else
    {
      APSLogErrorAt();
      id v4 = 0;
    }
    if (self->_objectID && self->_client) {
      FigXPCRemoteClientDisassociateObject();
    }
  }
  else
  {
    id v4 = 0;
  }
  self->_client = 0;
  self->_objectID = 0;
  FigXPCRelease();
}

- (int)remoteSendFrame:(__CVBuffer *)a3 forTime:(int64_t)a4
{
  if (!self->_objectID || !self->_client)
  {
    int v6 = -6709;
    APSLogErrorAt();
    id v7 = 0;
LABEL_9:
    id v8 = 0;
    goto LABEL_6;
  }
  v10[1] = 0;
  int v6 = FigXPCCreateBasicMessage();
  id v7 = 0;
  if (v6)
  {
    APSLogErrorAt();
    goto LABEL_9;
  }
  v10[0] = 0;
  int v6 = APSKServiceSerializeFrame(a3, a4, v10);
  id v8 = v10[0];
  if (v6
    || (xpc_dictionary_set_value(v7, (const char *)kAPSKServiceMsgParamC2S_Frame, v8),
        (int v6 = FigXPCRemoteClientSendSyncMessageCreatingReply()) != 0))
  {
    APSLogErrorAt();
  }
LABEL_6:
  FigXPCRelease();
  FigXPCRelease();

  return v6;
}

- (int)remoteSendAudioData:(id)a3
{
  id v4 = a3;
  if (self->_objectID && self->_client)
  {
    int v5 = FigXPCCreateBasicMessage();
    id v6 = 0;
    if (v5) {
      goto LABEL_9;
    }
    if (v4)
    {
      id v7 = (const char *)kAPSKServiceMsgParamC2S_AudioData;
      id v8 = v4;
      xpc_dictionary_set_data(v6, v7, (const void *)[v8 bytes], objc_msgSend(v8, "length"));
    }
    int v5 = FigXPCRemoteClientSendSyncMessageCreatingReply();
    if (v5) {
LABEL_9:
    }
      APSLogErrorAt();
  }
  else
  {
    int v5 = -6709;
    APSLogErrorAt();
    id v6 = 0;
  }
  FigXPCRelease();

  return v5;
}

- (int)remoteSendAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6
{
  id v9 = a3;
  if (!self->_objectID || !self->_client)
  {
    int v10 = -6709;
    APSLogErrorAt();
    id v11 = 0;
    goto LABEL_8;
  }
  int v10 = FigXPCCreateBasicMessage();
  id v11 = 0;
  if (v10)
  {
LABEL_13:
    APSLogErrorAt();
    goto LABEL_8;
  }
  if (!v9) {
    goto LABEL_7;
  }
  int v12 = (const char *)kAPSKServiceMsgParamC2S_AudioData;
  id v13 = v9;
  xpc_dictionary_set_data(v11, v12, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
  int v14 = FigXPCMessageSetCMTime();
  if (v14)
  {
    int v10 = v14;
    goto LABEL_13;
  }
  xpc_dictionary_set_uint64(v11, (const char *)kAPSKServiceMsgParamC2S_AudioSampleTime, a5);
  xpc_dictionary_set_BOOL(v11, (const char *)kAPSKServiceMsgParamC2S_AudioDiscontinuity, a6);
LABEL_7:
  int v10 = FigXPCRemoteClientSendSyncMessageCreatingReply();
  if (v10) {
    goto LABEL_13;
  }
LABEL_8:
  FigXPCRelease();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderNotifObserver, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_videoStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end