@interface AWAttentionAwarenessClient
+ (void)initialize;
- (AWAttentionAwarenessClient)init;
- (AWAttentionAwarenessConfiguration)configuration;
- (AWAttentionEvent)lastEvent;
- (BOOL)_invokeRequiringClient:(BOOL)a3 error:(id *)a4 block:(id)a5;
- (BOOL)cancelFaceDetectStreamWithError:(id *)a3;
- (BOOL)cancelPollForAttentionWithError:(id *)a3;
- (BOOL)invalidateRemoteClientWithError:(id *)a3;
- (BOOL)invalidateWithError:(id *)a3;
- (BOOL)invokeRequiringClient:(BOOL)a3 error:(id *)a4 block:(id)a5;
- (BOOL)pollForAttentionWithTimeout:(double)a3 event:(id *)a4 error:(id *)a5;
- (BOOL)pollForAttentionWithTimeout:(double)a3 queue:(id)a4 block:(id)a5 error:(id *)a6;
- (BOOL)resetAttentionLostTimeoutWithError:(id *)a3;
- (BOOL)resumeWithError:(id *)a3;
- (BOOL)setConfiguration:(id)a3 shouldReset:(BOOL)a4 error:(id *)a5;
- (BOOL)suspendWithError:(id *)a3;
- (id)connect:(BOOL)a3;
- (id)getEventMaskDescription:(unint64_t)a3;
- (id)startStream;
- (id)unitTestSampler;
- (void)notify:(unint64_t)a3;
- (void)notifyEvent:(id)a3;
- (void)notifyPollEventType:(unint64_t)a3 event:(id)a4;
- (void)notifyStreamingEvent:(id)a3;
- (void)serviceInterrupted;
- (void)setConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4;
- (void)setEventHandlerWithQueue:(id)a3 block:(id)a4;
- (void)setEventStreamerWithQueue:(id)a3 block:(id)a4;
- (void)setNotificationHandlerWithQueue:(id)a3 block:(id)a4;
- (void)setUnitTestMode:(BOOL)a3;
@end

@implementation AWAttentionAwarenessClient

uint64_t __42__AWAttentionAwarenessClient_notifyEvent___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (AWAttentionAwarenessClient)init
{
  v11.receiver = self;
  v11.super_class = (Class)AWAttentionAwarenessClient;
  v2 = [(AWAttentionAwarenessClient *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_suspensionCount = 1;
    uint64_t v4 = awQueue(0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(AWAttentionAwarenessConfiguration);
    configuration = v3->_configuration;
    v3->_configuration = v6;

    v3->_clientIndex = -1;
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    clientId = v3->_clientId;
    v3->_clientId = (NSUUID *)v8;
  }
  return v3;
}

uint64_t __61__AWAttentionAwarenessClient_setEventHandlerWithQueue_block___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 40))
  {
    uint64_t v1 = result;
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.AttentionAwareness.clientEventQueue", 0);
    uint64_t v3 = *(void *)(v1 + 32);
    uint64_t v4 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = v2;

    dispatch_set_target_queue(*(dispatch_object_t *)(*(void *)(v1 + 32) + 64), *(dispatch_queue_t *)(v1 + 40));
    *(void *)(*(void *)(v1 + 32) + 72) = [*(id *)(v1 + 48) copy];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

void __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v2;

    v5 = *(void **)(a1 + 32);
    if (v5[3])
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v6 + 40);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke_2;
      v12[3] = &unk_1E606A960;
      v12[4] = v5;
      char v13 = *(unsigned char *)(a1 + 64);
      char v7 = [v5 _invokeRequiringClient:1 error:&obj block:v12];
      objc_storeStrong((id *)(v6 + 40), obj);
      if (v7)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
      else if (currentLogLevel >= 3)
      {
        uint64_t v8 = _AALog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          unint64_t v9 = absTimeNS();
          if (v9 == -1) {
            double v10 = INFINITY;
          }
          else {
            double v10 = (double)v9 / 1000000000.0;
          }
          uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)buf = 134218242;
          double v16 = v10;
          __int16 v17 = 2112;
          uint64_t v18 = v11;
          _os_log_error_impl(&dword_1B3B4B000, v8, OS_LOG_TYPE_ERROR, "%13.5f: setClientConfig failed: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

void __42__AWAttentionAwarenessClient_notifyEvent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    [*(id *)(a1 + 40) updateWithConfig:*(void *)(v1 + 96)];
    uint64_t v3 = [*(id *)(a1 + 40) eventMask];
    BOOL v4 = v3 != 1;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 72) && *(void *)(v5 + 64) && (v3 == 1 || !*(unsigned char *)(v5 + 112)))
    {
      uint64_t v6 = (void *)MEMORY[0x1B3EC18C0]();
      char v7 = *(NSObject **)(*(void *)(a1 + 32) + 64);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __42__AWAttentionAwarenessClient_notifyEvent___block_invoke_2;
      v9[3] = &unk_1E606ABB0;
      id v11 = v6;
      id v10 = *(id *)(a1 + 40);
      id v8 = v6;
      dispatch_async(v7, v9);

      uint64_t v5 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v5 + 112) = v4;
  }
}

- (void)notifyEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AWAttentionAwarenessClient_notifyEvent___block_invoke;
  v7[3] = &unk_1E606AC98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setEventHandlerWithQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[AWAttentionAwarenessClient setEventHandlerWithQueue:block:]", "FrameworkClient.m", 248, "queue");
  }
  if (!v7) {
    __assert_rtn("-[AWAttentionAwarenessClient setEventHandlerWithQueue:block:]", "FrameworkClient.m", 249, "block");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AWAttentionAwarenessClient_setEventHandlerWithQueue_block___block_invoke;
  block[3] = &unk_1E606AA48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4
{
  id v6 = 0;
  BOOL v4 = [(AWAttentionAwarenessClient *)self setConfiguration:a3 shouldReset:a4 error:&v6];
  id v5 = v6;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"setConfiguration failed: %@", v5 format];
  }
}

- (BOOL)setConfiguration:(id)a3 shouldReset:(BOOL)a4 error:(id *)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2315;
  v29 = __Block_byref_object_dispose__2316;
  id v30 = 0;
  if (v8)
  {
    id obj = 0;
    int v10 = [v8 validateWithError:&obj];
    objc_storeStrong(&v30, obj);
    if (v10)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke;
      block[3] = &unk_1E606A988;
      block[4] = self;
      id v20 = v9;
      v21 = &v25;
      BOOL v23 = a4;
      v22 = &v31;
      dispatch_sync(queue, block);
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36[0] = @" NIL identifer not allowed";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    uint64_t v14 = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v13];
    v15 = (void *)v26[5];
    v26[5] = v14;
  }
  if (a5)
  {
    double v16 = (void *)v26[5];
    if (v16) {
      *a5 = v16;
    }
  }
  BOOL v17 = *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_clientStreamingBlock, 0);
  objc_storeStrong((id *)&self->_clientStreamingQueue, 0);
  objc_storeStrong(&self->_clientEventBlock, 0);
  objc_storeStrong((id *)&self->_clientEventQueue, 0);
  objc_storeStrong(&self->_clientNotifBlock, 0);
  objc_storeStrong((id *)&self->_clientNotifQueue, 0);
  objc_storeStrong((id *)&self->_remoteClientProxy, 0);
  objc_storeStrong((id *)&self->_pollWaiter, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)serviceInterrupted
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke;
  block[3] = &unk_1E606AC70;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = *(id *)(a1 + 32);
  id v10 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke_2;
  v8[3] = &unk_1E606AAC0;
  char v2 = [v9 _invokeRequiringClient:1 error:&v10 block:v8];
  id v3 = v10;
  if ((v2 & 1) == 0 && currentLogLevel >= 3)
  {
    BOOL v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = absTimeNS();
      if (v5 == -1) {
        double v6 = INFINITY;
      }
      else {
        double v6 = (double)v5 / 1000000000.0;
      }
      id v7 = [*(id *)(*(void *)(a1 + 32) + 96) identifier];
      *(_DWORD *)buf = 134218498;
      double v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl(&dword_1B3B4B000, v4, OS_LOG_TYPE_ERROR, "%13.5f: XPC interruption: %@ failed to ping remote client: %@", buf, 0x20u);
    }
  }
}

id __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2315;
  id v11 = __Block_byref_object_dispose__2316;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke_3;
  v6[3] = &unk_1E606AC28;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = &v7;
  [v3 pingWithReply:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0) {
    __assert_rtn("-[AWAttentionAwarenessClient serviceInterrupted]_block_invoke_3", "FrameworkClient.m", 711, "alive");
  }
  if (currentLogLevel == 5)
  {
    id v3 = _AALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = absTimeNS();
      if (v4 == -1) {
        double v5 = INFINITY;
      }
      else {
        double v5 = (double)v4 / 1000000000.0;
      }
      id v10 = [*(id *)(*(void *)(a1 + 32) + 96) identifier];
      *(_DWORD *)uint64_t v17 = 134218242;
      *(double *)&v17[4] = v5;
      *(_WORD *)&v17[12] = 2112;
      *(void *)&v17[14] = v10;
      id v11 = "%13.5f: %@ remote client is alive";
      id v12 = v3;
      uint32_t v13 = 22;
LABEL_20:
      _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, v17, v13);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_22;
    }
    id v3 = _AALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/FrameworkClient.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/FrameworkClient.m"; ; ++i)
      {
        if (*(i - 1) == 47)
        {
          double v6 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v8 = absTimeNS();
          if (v8 == -1) {
            double v9 = INFINITY;
          }
          else {
            double v9 = (double)v8 / 1000000000.0;
          }
          id v10 = [*(id *)(*(void *)(a1 + 32) + 96) identifier];
          *(_DWORD *)uint64_t v17 = 136315906;
          *(void *)&v17[4] = v6;
          *(_WORD *)&v17[12] = 1024;
          *(_DWORD *)&v17[14] = 713;
          *(_WORD *)&v17[18] = 2048;
          *(double *)&v17[20] = v9;
          *(_WORD *)&v17[28] = 2112;
          *(void *)&v17[30] = v10;
          id v11 = "%30s:%-4d: %13.5f: %@ remote client is alive";
          id v12 = v3;
          uint32_t v13 = 38;
          goto LABEL_20;
        }
      }
    }
  }

LABEL_22:
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "continuousFaceDetectMode", *(_OWORD *)v17, *(void *)&v17[16], *(_OWORD *)&v17[24], v18))
  {
    uint64_t v14 = [*(id *)(a1 + 32) startStream];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (id)unitTestSampler
{
  return +[AWUnitTestSampler sharedSampler];
}

- (void)setUnitTestMode:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AWAttentionAwarenessClient_setUnitTestMode___block_invoke;
  v4[3] = &unk_1E606AC00;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

uint64_t __46__AWAttentionAwarenessClient_setUnitTestMode___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 104)) {
    *(unsigned char *)(v2 + 104) = v1;
  }
  return result;
}

- (id)getEventMaskDescription:(unint64_t)a3
{
  return getEventMaskDescription(a3);
}

- (void)notifyStreamingEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (currentLogLevel < 7) {
    goto LABEL_14;
  }
  BOOL v5 = _AALog();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_13;
  }
  double v6 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/FrameworkClient.m";
  for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/FrameworkClient.m";
        *(i - 1) == 47;
        ++i)
  {
    double v6 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v8 = absTimeNS();
  if (v8 == -1) {
    double v9 = INFINITY;
  }
  else {
    double v9 = (double)v8 / 1000000000.0;
  }
  id v10 = [(AWAttentionAwarenessConfiguration *)self->_configuration identifier];
  *(_DWORD *)buf = 136315906;
  uint64_t v15 = v6;
  __int16 v16 = 1024;
  int v17 = 645;
  __int16 v18 = 2048;
  double v19 = v9;
  __int16 v20 = 2112;
  v21 = v10;
  _os_log_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: Delivering event to client %@", buf, 0x26u);

LABEL_13:
LABEL_14:
  if (![(AWAttentionAwarenessConfiguration *)self->_configuration unityStream] || !self->_eventDelivered)
  {
    if (self->_clientStreamingBlock)
    {
      queue = self->_queue;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __51__AWAttentionAwarenessClient_notifyStreamingEvent___block_invoke;
      v12[3] = &unk_1E606AC98;
      v12[4] = self;
      id v13 = v4;
      dispatch_async(queue, v12);
      self->_eventDelivered = 1;
    }
  }
}

void __51__AWAttentionAwarenessClient_notifyStreamingEvent___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 88))
  {
    uint64_t v2 = (void *)MEMORY[0x1B3EC18C0]();
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__AWAttentionAwarenessClient_notifyStreamingEvent___block_invoke_2;
    v5[3] = &unk_1E606ABB0;
    id v7 = v2;
    id v6 = *(id *)(a1 + 40);
    id v4 = v2;
    dispatch_async(v3, v5);
  }
}

uint64_t __51__AWAttentionAwarenessClient_notifyStreamingEvent___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)notifyPollEventType:(unint64_t)a3 event:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AWAttentionAwarenessClient_notifyPollEventType_event___block_invoke;
  block[3] = &unk_1E606ABD8;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __56__AWAttentionAwarenessClient_notifyPollEventType_event___block_invoke(void *a1)
{
  int v1 = *(void **)(a1[4] + 16);
  if (v1)
  {
    id v6 = v1;
    if (a1[6] == 1)
    {
      uint64_t v3 = 1;
    }
    else
    {
      uint64_t v4 = a1[4];
      BOOL v5 = *(void **)(v4 + 16);
      *(void *)(v4 + 16) = 0;

      uint64_t v3 = a1[6];
    }
    [v6 notifyPollEventType:v3 event:a1[5]];
  }
}

- (void)notify:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__AWAttentionAwarenessClient_notify___block_invoke;
  v4[3] = &unk_1E606AB88;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

void __37__AWAttentionAwarenessClient_notify___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 40) && *(void *)(v1 + 56))
  {
    if (*(void *)(v1 + 48))
    {
      uint64_t v3 = (void *)MEMORY[0x1B3EC18C0]();
      uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __37__AWAttentionAwarenessClient_notify___block_invoke_2;
      v7[3] = &unk_1E606AB60;
      uint64_t v5 = *(void *)(a1 + 40);
      id v8 = v3;
      uint64_t v9 = v5;
      id v6 = v3;
      dispatch_async(v4, v7);
    }
  }
}

uint64_t __37__AWAttentionAwarenessClient_notify___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (BOOL)invalidateWithError:(id *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__2315;
  id v13 = __Block_byref_object_dispose__2316;
  id v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__AWAttentionAwarenessClient_invalidateWithError___block_invoke;
  v8[3] = &unk_1E606AB38;
  void v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(queue, v8);
  uint64_t v5 = (void *)v10[5];
  if (a3 && v5)
  {
    *a3 = v5;
    uint64_t v5 = (void *)v10[5];
  }
  BOOL v6 = v5 == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __50__AWAttentionAwarenessClient_invalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v3 = *(void **)(v1 + 48);
    *(void *)(v1 + 48) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = 0;

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 72);
    *(void *)(v8 + 72) = 0;

    uint64_t v10 = *(void *)(a1 + 32);
    if (*(void *)(v10 + 32))
    {
      if (![*(id *)(v10 + 96) continuousFaceDetectMode])
      {
LABEL_6:
        *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
        return;
      }
      uint64_t v10 = *(void *)(a1 + 32);
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v11 + 40);
    [(id)v10 invalidateRemoteClientWithError:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    goto LABEL_6;
  }
}

- (BOOL)suspendWithError:(id *)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__AWAttentionAwarenessClient_suspendWithError___block_invoke;
  v4[3] = &unk_1E606AAC0;
  v4[4] = self;
  return [(AWAttentionAwarenessClient *)self invokeRequiringClient:0 error:a3 block:v4];
}

id __47__AWAttentionAwarenessClient_suspendWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 32);
  *(void *)(v1 + 32) = v2 + 1;
  if (v2)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v6 = 0;
    [v4 invalidateRemoteClientWithError:&v6];
    id v3 = v6;
  }

  return v3;
}

- (BOOL)invalidateRemoteClientWithError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__AWAttentionAwarenessClient_invalidateRemoteClientWithError___block_invoke;
  v6[3] = &unk_1E606AAC0;
  v6[4] = self;
  return [(AWAttentionAwarenessClient *)self _invokeRequiringClient:1 error:a3 block:v6];
}

uint64_t __62__AWAttentionAwarenessClient_invalidateRemoteClientWithError___block_invoke(uint64_t a1, void *a2)
{
  [a2 invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 108) = -1;
  +[AWServiceManager removeObserver:*(void *)(a1 + 32)];
  return 0;
}

- (BOOL)cancelFaceDetectStreamWithError:(id *)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__AWAttentionAwarenessClient_cancelFaceDetectStreamWithError___block_invoke;
  v4[3] = &unk_1E606AAC0;
  v4[4] = self;
  return [(AWAttentionAwarenessClient *)self invokeRequiringClient:1 error:a3 block:v4];
}

id __62__AWAttentionAwarenessClient_cancelFaceDetectStreamWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__2315;
  uint64_t v15 = __Block_byref_object_dispose__2316;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__AWAttentionAwarenessClient_cancelFaceDetectStreamWithError___block_invoke_2;
  v10[3] = &unk_1E606A938;
  v10[4] = &v11;
  [v3 cancelFaceDetectStreamWithReply:v10];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = 0;

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __62__AWAttentionAwarenessClient_cancelFaceDetectStreamWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)resumeWithError:(id *)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AWAttentionAwarenessClient_resumeWithError___block_invoke;
  v4[3] = &unk_1E606AAC0;
  v4[4] = self;
  return [(AWAttentionAwarenessClient *)self invokeRequiringClient:0 error:a3 block:v4];
}

id __46__AWAttentionAwarenessClient_resumeWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 96) continuousFaceDetectMode])
  {
    if (a2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 32) connect:0];
      if (!v4)
      {
        uint64_t v4 = [*(id *)(a1 + 32) startStream];
      }
    }
    id v8 = v4;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 32);
    if (v6)
    {
      uint64_t v7 = v6 - 1;
      *(void *)(v5 + 32) = v7;
      if (v7)
      {
        id v8 = 0;
      }
      else
      {
        id v8 = [*(id *)(a1 + 32) connect:0];
      }
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28798];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14[0] = @" Cannot resume client if it isn't already suspended";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v8 = [v9 errorWithDomain:v10 code:34 userInfo:v11];
    }
  }

  return v8;
}

- (id)startStream
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2315;
  id v14 = __Block_byref_object_dispose__2316;
  id v15 = 0;
  self->_eventDelivered = 0;
  remoteClientProxy = self->_remoteClientProxy;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__AWAttentionAwarenessClient_startStream__block_invoke;
  v9[3] = &unk_1E606A938;
  void v9[4] = &v10;
  id v3 = [(NSXPCProxyCreating *)remoteClientProxy synchronousRemoteObjectProxyWithErrorHandler:v9];
  uint64_t v4 = v3;
  uint64_t v5 = (void *)v11[5];
  if (!v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__AWAttentionAwarenessClient_startStream__block_invoke_2;
    v8[3] = &unk_1E606A938;
    void v8[4] = &v10;
    [v3 streamFaceDetectEventsWithReply:v8];
    uint64_t v5 = (void *)v11[5];
  }
  id v6 = v5;

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __41__AWAttentionAwarenessClient_startStream__block_invoke(uint64_t a1, void *a2)
{
}

void __41__AWAttentionAwarenessClient_startStream__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)connect:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__AWAttentionAwarenessClient_connect___block_invoke;
  v7[3] = &unk_1E606AB10;
  void v7[4] = self;
  BOOL v8 = a3;
  uint64_t v5 = +[AWServiceManager invokeWithService:v7];

  return v5;
}

id __38__AWAttentionAwarenessClient_connect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__2315;
  __int16 v18 = __Block_byref_object_dispose__2316;
  id v19 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 96);
  uint64_t v6 = *(unsigned int *)(v4 + 108);
  uint64_t v7 = *(void *)(v4 + 120);
  int v8 = *(unsigned __int8 *)(v4 + 104);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__AWAttentionAwarenessClient_connect___block_invoke_2;
  v12[3] = &unk_1E606AAE8;
  v12[4] = v4;
  void v12[5] = &v14;
  char v13 = *(unsigned char *)(a1 + 40);
  LOBYTE(v11) = [v5 continuousFaceDetectMode];
  [v3 addClient:v4 clientConfig:v5 clientIndex:v6 clientId:v7 unitTestMode:v8 != 0 reply:v12 subscribeForStreamingEvents:v11];
  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __38__AWAttentionAwarenessClient_connect___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  char v10 = [*(id *)(*(void *)(a1 + 32) + 96) continuousFaceDetectMode];
  if (v9 && (v10 & 1) != 0
    || (objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2), *(_DWORD *)(*(void *)(a1 + 32) + 108) = a3, v9))
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v11 = _AALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        unint64_t v12 = absTimeNS();
        if (v12 == -1) {
          double v13 = INFINITY;
        }
        else {
          double v13 = (double)v12 / 1000000000.0;
        }
        int v14 = 134218242;
        double v15 = v13;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_error_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_ERROR, "%13.5f: client resume failed: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  else if (!*(unsigned char *)(a1 + 48))
  {
    +[AWServiceManager addObserver:*(void *)(a1 + 32)];
  }
}

- (BOOL)cancelPollForAttentionWithError:(id *)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__AWAttentionAwarenessClient_cancelPollForAttentionWithError___block_invoke;
  v4[3] = &unk_1E606AAC0;
  v4[4] = self;
  return [(AWAttentionAwarenessClient *)self invokeRequiringClient:1 error:a3 block:v4];
}

id __62__AWAttentionAwarenessClient_cancelPollForAttentionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v4)
  {
    [v4 cancel];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__2315;
  int v14 = __Block_byref_object_dispose__2316;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__AWAttentionAwarenessClient_cancelPollForAttentionWithError___block_invoke_2;
  v9[3] = &unk_1E606A938;
  void v9[4] = &v10;
  [v3 pollWithTimeout:0 reply:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __62__AWAttentionAwarenessClient_cancelPollForAttentionWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)pollForAttentionWithTimeout:(double)a3 event:(id *)a4 error:(id *)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2315;
  id v30 = __Block_byref_object_dispose__2316;
  id v31 = 0;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.AttentionAwareness.clientSynchronousPollQueue", 0);
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __70__AWAttentionAwarenessClient_pollForAttentionWithTimeout_event_error___block_invoke;
  uint64_t v18 = &unk_1E606AA98;
  __int16 v20 = &v26;
  v21 = &v22;
  uint64_t v11 = v10;
  id v19 = v11;
  if (![(AWAttentionAwarenessClient *)self pollForAttentionWithTimeout:v9 queue:&v15 block:a5 error:a3])goto LABEL_5; {
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (*((unsigned char *)v23 + 24))
  {
    if (a5)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v33[0] = @" Polling was cancelled";
      double v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1, v15, v16, v17, v18);
      *a5 = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:89 userInfo:v13];

LABEL_5:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    if (a4) {
      *a4 = (id) v27[5];
    }
    LOBYTE(a5) = 1;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return (char)a5;
}

void __70__AWAttentionAwarenessClient_pollForAttentionWithTimeout_event_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ((unint64_t)(a2 - 2) < 2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (a2 == 1) {
      goto LABEL_7;
    }
    id v7 = v6;
    if (a2 == 4) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  id v6 = v7;
LABEL_7:
}

- (BOOL)pollForAttentionWithTimeout:(double)a3 queue:(id)a4 block:(id)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (!v10) {
    __assert_rtn("-[AWAttentionAwarenessClient pollForAttentionWithTimeout:queue:block:error:]", "FrameworkClient.m", 279, "queue");
  }
  uint64_t v12 = v11;
  if (!v11) {
    __assert_rtn("-[AWAttentionAwarenessClient pollForAttentionWithTimeout:queue:block:error:]", "FrameworkClient.m", 280, "block");
  }
  double v13 = 3153600000.0;
  if (a3 <= 3153600000.0) {
    double v13 = a3;
  }
  if (v13 > 1.84467441e19) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = (unint64_t)(v13 * 1000000000.0);
  }
  if (v14 <= 0)
  {
    if (!a6)
    {
      BOOL v17 = 0;
      goto LABEL_17;
    }
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @" Timeout less than 0 is invalid";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v19 errorWithDomain:*MEMORY[0x1E4F28798] code:34 userInfo:v16];
    BOOL v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = [[AWClientPollWaiter alloc] initWithClient:self timeout:v14 queue:v10 block:v11];
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke;
    v23[3] = &unk_1E606AA70;
    v23[4] = self;
    uint64_t v16 = v15;
    uint64_t v24 = v16;
    char v25 = &v27;
    uint64_t v26 = v14;
    BOOL v17 = [(AWAttentionAwarenessClient *)self invokeRequiringClient:1 error:a6 block:v23];
    if (!v17)
    {
      if (*((unsigned char *)v28 + 24))
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke_3;
        block[3] = &unk_1E606AC98;
        block[4] = self;
        uint64_t v22 = v16;
        dispatch_sync(queue, block);
      }
      [(AWClientPollWaiter *)v16 invalidate];
    }

    _Block_object_dispose(&v27, 8);
  }

LABEL_17:
  return v17;
}

id __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v5 = (id *)(v4 + 16);
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @" Polling already going on";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v9 = [v7 errorWithDomain:*MEMORY[0x1E4F28798] code:36 userInfo:v8];
  }
  else
  {
    objc_storeStrong(v5, *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__2315;
    BOOL v17 = __Block_byref_object_dispose__2316;
    id v18 = 0;
    uint64_t v10 = *(void *)(a1 + 56);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke_2;
    v12[3] = &unk_1E606A938;
    v12[4] = &v13;
    [v3 pollWithTimeout:v10 reply:v12];
    id v9 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }

  return v9;
}

void __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(v1 + 16);
  if (v3 == v2)
  {
    *(void *)(v1 + 16) = 0;
  }
}

void __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)setEventStreamerWithQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[AWAttentionAwarenessClient setEventStreamerWithQueue:block:]", "FrameworkClient.m", 263, "queue");
  }
  if (!v7) {
    __assert_rtn("-[AWAttentionAwarenessClient setEventStreamerWithQueue:block:]", "FrameworkClient.m", 264, "block");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AWAttentionAwarenessClient_setEventStreamerWithQueue_block___block_invoke;
  block[3] = &unk_1E606AA48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __62__AWAttentionAwarenessClient_setEventStreamerWithQueue_block___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.AttentionAwareness.clientStreamingQueue", 0);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  dispatch_set_target_queue(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80), *(dispatch_queue_t *)(a1 + 40));
  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 88);
  *(void *)(v6 + 88) = v5;

  return MEMORY[0x1F41817F8](v5, v7);
}

- (void)setNotificationHandlerWithQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[AWAttentionAwarenessClient setNotificationHandlerWithQueue:block:]", "FrameworkClient.m", 233, "queue");
  }
  if (!v7) {
    __assert_rtn("-[AWAttentionAwarenessClient setNotificationHandlerWithQueue:block:]", "FrameworkClient.m", 234, "block");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AWAttentionAwarenessClient_setNotificationHandlerWithQueue_block___block_invoke;
  block[3] = &unk_1E606AA48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __68__AWAttentionAwarenessClient_setNotificationHandlerWithQueue_block___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 40))
  {
    uint64_t v1 = result;
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.AttentionAwareness.clientNotificationQueue", 0);
    uint64_t v3 = *(void *)(v1 + 32);
    uint64_t v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    dispatch_set_target_queue(*(dispatch_object_t *)(*(void *)(v1 + 32) + 48), *(dispatch_queue_t *)(v1 + 40));
    uint64_t v5 = [*(id *)(v1 + 48) copy];
    uint64_t v6 = *(void *)(v1 + 32);
    uint64_t v7 = *(void *)(v6 + 56);
    *(void *)(v6 + 56) = v5;
    return MEMORY[0x1F41817F8](v5, v7);
  }
  return result;
}

- (BOOL)resetAttentionLostTimeoutWithError:(id *)a3
{
  return [(AWAttentionAwarenessClient *)self invokeRequiringClient:1 error:a3 block:&__block_literal_global_2347];
}

id __65__AWAttentionAwarenessClient_resetAttentionLostTimeoutWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2315;
  id v10 = __Block_byref_object_dispose__2316;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AWAttentionAwarenessClient_resetAttentionLostTimeoutWithError___block_invoke_2;
  v5[3] = &unk_1E606A938;
  void v5[4] = &v6;
  [v2 resetAttentionLostTimerWithReply:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __65__AWAttentionAwarenessClient_resetAttentionLostTimeoutWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (AWAttentionEvent)lastEvent
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__2315;
  id v9 = __Block_byref_object_dispose__2316;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__AWAttentionAwarenessClient_lastEvent__block_invoke;
  v4[3] = &unk_1E606AA00;
  v4[4] = self;
  void v4[5] = &v5;
  [(AWAttentionAwarenessClient *)self invokeRequiringClient:1 error:0 block:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (AWAttentionEvent *)v2;
}

uint64_t __39__AWAttentionAwarenessClient_lastEvent__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__AWAttentionAwarenessClient_lastEvent__block_invoke_2;
  v4[3] = &unk_1E606A9D8;
  v4[4] = *(void *)(a1 + 40);
  [a2 getLastEvent:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) updateWithConfig:*(void *)(*(void *)(a1 + 32) + 96)];
  return 0;
}

void __39__AWAttentionAwarenessClient_lastEvent__block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)invokeRequiringClient:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2315;
  BOOL v23 = __Block_byref_object_dispose__2316;
  id v24 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AWAttentionAwarenessClient_invokeRequiringClient_error_block___block_invoke;
  block[3] = &unk_1E606A9B0;
  uint64_t v16 = &v25;
  BOOL v17 = &v19;
  block[4] = self;
  BOOL v18 = a3;
  id v10 = v8;
  id v15 = v10;
  dispatch_sync(queue, block);
  if (a4)
  {
    id v11 = (void *)v20[5];
    if (v11) {
      *a4 = v11;
    }
  }
  char v12 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __64__AWAttentionAwarenessClient_invokeRequiringClient_error_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [*(id *)(a1 + 32) _invokeRequiringClient:v2 error:&obj block:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (BOOL)_invokeRequiringClient:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  BOOL v6 = a3;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48[0] = @" Client is already invalid";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    id v11 = [v9 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v10];

    goto LABEL_3;
  }
  if (!v6)
  {
    v8[2](v8, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2315;
  v39 = __Block_byref_object_dispose__2316;
  id v40 = 0;
  remoteClientProxy = self->_remoteClientProxy;
  if (remoteClientProxy)
  {
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v14 = (void *)*MEMORY[0x1E4F281F8];
    char v15 = 1;
    while (1)
    {
      v34[0] = v33;
      v34[1] = 3221225472;
      v34[2] = __65__AWAttentionAwarenessClient__invokeRequiringClient_error_block___block_invoke;
      v34[3] = &unk_1E606A938;
      v34[4] = &v35;
      uint64_t v16 = [(NSXPCProxyCreating *)remoteClientProxy synchronousRemoteObjectProxyWithErrorHandler:v34];
      ((void (**)(id, void *))v8)[2](v8, v16);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

        goto LABEL_44;
      }
      BOOL v17 = (void *)v36[5];
      if (!v17) {
        break;
      }
      if (currentLogLevel >= 3)
      {
        BOOL v18 = _AALog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          unint64_t v23 = absTimeNS();
          if (v23 == -1) {
            double v24 = INFINITY;
          }
          else {
            double v24 = (double)v23 / 1000000000.0;
          }
          uint64_t v27 = v36[5];
          *(_DWORD *)buf = 134218242;
          double v44 = v24;
          __int16 v45 = 2112;
          v46[0] = v27;
          _os_log_error_impl(&dword_1B3B4B000, v18, OS_LOG_TYPE_ERROR, "%13.5f: XPC proxy error: %@", buf, 0x16u);
        }

        BOOL v17 = (void *)v36[5];
      }
      uint64_t v19 = [v17 domain];
      if ((void *)v19 != v14)
      {
        uint64_t v14 = (void *)v19;
LABEL_39:

        break;
      }
      if ([(id)v36[5] code] != 4099) {
        goto LABEL_39;
      }

      if ((v15 & 1) == 0) {
        break;
      }
      __int16 v20 = [(AWAttentionAwarenessClient *)self connect:1];
      if (currentLogLevel >= 3)
      {
        uint64_t v21 = _AALog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          unint64_t v25 = absTimeNS();
          if (v25 == -1) {
            double v26 = INFINITY;
          }
          else {
            double v26 = (double)v25 / 1000000000.0;
          }
          char v28 = @"succeeded";
          if (v20)
          {
            uint64_t v32 = [NSString stringWithFormat:@"failed: %@", v20];
            char v28 = v32;
          }
          *(_DWORD *)buf = 134218498;
          double v44 = v26;
          __int16 v45 = 1024;
          LODWORD(v46[0]) = 1;
          WORD2(v46[0]) = 2112;
          *(void *)((char *)v46 + 6) = v28;
          _os_log_error_impl(&dword_1B3B4B000, v21, OS_LOG_TYPE_ERROR, "%13.5f: XPC proxy invalid: reconnect %u %@", buf, 0x1Cu);
          if (v20) {
        }
          }
      }

      uint64_t v22 = (void *)v36[5];
      v36[5] = 0;

      char v15 = 0;
      remoteClientProxy = self->_remoteClientProxy;
      if (!remoteClientProxy) {
        goto LABEL_35;
      }
    }

    goto LABEL_41;
  }
LABEL_35:
  uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v41 = *MEMORY[0x1E4F28568];
  v42 = @" Not connected to server";
  char v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  id v11 = [v29 errorWithDomain:*MEMORY[0x1E4F28798] code:57 userInfo:v30];

  if (!v11)
  {
LABEL_41:
    uint64_t v31 = (void *)v36[5];
    if (v31) {
      id v11 = v31;
    }
    else {
      id v11 = 0;
    }
  }
LABEL_44:
  _Block_object_dispose(&v35, 8);

LABEL_3:
  if (a4) {
LABEL_4:
  }
    *a4 = v11;
LABEL_5:

  return v11 == 0;
}

void __65__AWAttentionAwarenessClient__invokeRequiringClient_error_block___block_invoke(uint64_t a1, void *a2)
{
}

- (AWAttentionAwarenessConfiguration)configuration
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2315;
  id v10 = __Block_byref_object_dispose__2316;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AWAttentionAwarenessClient_configuration__block_invoke;
  v5[3] = &unk_1E606AB38;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AWAttentionAwarenessConfiguration *)v3;
}

uint64_t __43__AWAttentionAwarenessClient_configuration__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setConfiguration:(id)a3
{
}

id __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy__2315;
  id v13 = __Block_byref_object_dispose__2316;
  id v14 = 0;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke_3;
  v8[3] = &unk_1E606A938;
  void v8[4] = &v9;
  [v3 setClientConfig:v4 shouldReset:v5 reply:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke_3(uint64_t a1, void *a2)
{
}

+ (void)initialize
{
}

@end