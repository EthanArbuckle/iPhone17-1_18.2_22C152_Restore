@interface CARSessionChannel
- (BOOL)isOpened;
- (BOOL)openChannel;
- (BOOL)openChannelWithError:(id *)a3;
- (BOOL)sendChannelMessage:(id)a3;
- (BOOL)sendChannelMessage:(id)a3 withDescription:(id)a4;
- (BOOL)withoutReply;
- (CARSession)session;
- (CARSessionChannel)initWithSession:(id)a3 channelType:(id)a4;
- (CARSessionChannel)initWithSession:(id)a3 channelType:(id)a4 channelID:(id)a5 withoutReply:(BOOL)a6 qualityOfService:(id)a7 streamPriority:(id)a8;
- (CARSessionChannelDelegate)channelDelegate;
- (NSNumber)qualityOfService;
- (NSNumber)streamPriority;
- (NSString)channelID;
- (NSString)channelType;
- (OS_dispatch_queue)channelQueue;
- (id)_endpointValueForKey:(__CFString *)a3;
- (id)invalidationHandler;
- (id)shortChannelType;
- (unint64_t)payloadCount;
- (void)_channelInvalidated;
- (void)_channelQueue_closeChannel;
- (void)_channelQueue_invalidate;
- (void)_dataReceived:(id)a3;
- (void)_sendComplete;
- (void)closeChannel;
- (void)setChannelDelegate:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPayloadCount:(unint64_t)a3;
@end

@implementation CARSessionChannel

- (CARSessionChannel)initWithSession:(id)a3 channelType:(id)a4
{
  return [(CARSessionChannel *)self initWithSession:a3 channelType:a4 channelID:0 withoutReply:0 qualityOfService:0 streamPriority:0];
}

- (CARSessionChannel)initWithSession:(id)a3 channelType:(id)a4 channelID:(id)a5 withoutReply:(BOOL)a6 qualityOfService:(id)a7 streamPriority:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CARSessionChannel;
  v20 = [(CARSessionChannel *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_session, a3);
    uint64_t v22 = [v16 copy];
    channelType = v21->_channelType;
    v21->_channelType = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    channelID = v21->_channelID;
    v21->_channelID = (NSString *)v24;

    v21->_withoutReply = a6;
    objc_storeStrong((id *)&v21->_qualityOfService, a7);
    objc_storeStrong((id *)&v21->_streamPriority, a8);
    v26 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.carkit.SessionChannel", v26);
    channelQueue = v21->_channelQueue;
    v21->_channelQueue = (OS_dispatch_queue *)v27;

    v21->_payloadCount = 0;
  }

  return v21;
}

- (BOOL)openChannel
{
  return [(CARSessionChannel *)self openChannelWithError:0];
}

- (BOOL)openChannelWithError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  v5 = [(CARSessionChannel *)self channelQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CARSessionChannel_openChannelWithError___block_invoke;
  block[3] = &unk_1E5E3BA30;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  int v6 = *((unsigned __int8 *)v17 + 24);
  if (a3 && !*((unsigned char *)v17 + 24))
  {
    *a3 = (id) v11[5];
    int v6 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __42__CARSessionChannel_openChannelWithError___block_invoke(uint64_t a1)
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) shortChannelType];
    *(_DWORD *)buf = 138543362;
    v43 = v3;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to start remote control session for channel %{public}@", buf, 0xCu);
  }
  v4 = (id *)(a1 + 32);
  v5 = [*(id *)(a1 + 32) session];
  int v6 = [*(id *)(a1 + 32) channelType];
  BOOL v7 = [*(id *)(a1 + 32) channelID];
  uint64_t v8 = [*(id *)(a1 + 32) withoutReply];
  v9 = [*(id *)(a1 + 32) qualityOfService];
  uint64_t v10 = [*(id *)(a1 + 32) streamPriority];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v11 + 40);
  uint64_t v12 = [v5 createRemoteControlSession:v6 channelID:v7 withoutReply:v8 qualityOfService:v9 streamPriority:v10 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  if (v12)
  {
    id v13 = *v4;
    id v14 = *v4;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __42__CARSessionChannel_openChannelWithError___block_invoke_20;
    v40[3] = &unk_1E5E3A938;
    v40[4] = v13;
    [v14 setInvalidationHandler:v40];
    id v15 = *v4;
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    char v19 = *(uint64_t (**)(uint64_t, uint64_t (*)(uint64_t, const void *, uint64_t, void *), id))(v17 + 16);
    if (v19)
    {
      int v20 = v19(v12, _CRHandleRemoteControlEvent, v15);
      if (!v20)
      {
        uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v21) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = 0;
        }
        v33 = *(uint64_t (**)(uint64_t))(v22 + 32);
        if (v33)
        {
          int v34 = v33(v12);
          if (!v34)
          {
            *((void *)*v4 + 1) = v12;
            v35 = CarGeneralLogging();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = [*v4 shortChannelType];
              v37 = [*v4 channelID];
              *(_DWORD *)buf = 138543618;
              v43 = v36;
              __int16 v44 = 2114;
              v45 = v37;
              _os_log_impl(&dword_1ABB00000, v35, OS_LOG_TYPE_DEFAULT, "Successfully opened remote control session for channel %{public}@ with clientUUID %{public}@", buf, 0x16u);
            }
            char v32 = 1;
            goto LABEL_19;
          }
        }
        else
        {
          int v34 = -12782;
        }
        v38 = CarGeneralLogging();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          __42__CARSessionChannel_openChannelWithError___block_invoke_cold_3(a1 + 32);
        }

        v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v46 = *MEMORY[0x1E4F28A50];
        v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v34 userInfo:0];
        v47 = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        dispatch_queue_t v27 = v39;
        uint64_t v28 = 6;
LABEL_18:
        uint64_t v29 = [v27 errorWithDomain:@"com.apple.carkit.session" code:v28 userInfo:v26];
        uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
        v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;

        objc_msgSend(*v4, "_channelQueue_closeChannel");
        char v32 = 0;
LABEL_19:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v32;

        return;
      }
    }
    else
    {
      int v20 = -12782;
    }
    v23 = CarGeneralLogging();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __42__CARSessionChannel_openChannelWithError___block_invoke_cold_2(a1 + 32);
    }

    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v48 = *MEMORY[0x1E4F28A50];
    v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v20 userInfo:0];
    v49[0] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
    dispatch_queue_t v27 = v24;
    uint64_t v28 = 5;
    goto LABEL_18;
  }
  uint64_t v18 = CarGeneralLogging();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    __42__CARSessionChannel_openChannelWithError___block_invoke_cold_1(a1 + 32, a1 + 40, v18);
  }

  objc_msgSend(*(id *)(a1 + 32), "_channelQueue_closeChannel");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

uint64_t __42__CARSessionChannel_openChannelWithError___block_invoke_20(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) channelQueue];
  dispatch_assert_queue_V2(v2);

  v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "_channelQueue_invalidate");
}

- (BOOL)isOpened
{
  return self->_remoteControlSession != 0;
}

- (BOOL)sendChannelMessage:(id)a3
{
  return [(CARSessionChannel *)self sendChannelMessage:a3 withDescription:0];
}

- (BOOL)sendChannelMessage:(id)a3 withDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v8 = [(CARSessionChannel *)self channelQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke;
  v12[3] = &unk_1E5E3BA58;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v12);

  LOBYTE(self) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)self;
}

void __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke(void *a1)
{
  v3 = (id *)(a1 + 4);
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 8))
  {
    id v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_1(v10);
    }
    goto LABEL_14;
  }
  ++*(void *)(v2 + 80);
  v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_3(v3);
  }

  uint64_t v5 = a1[4];
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = a1[6];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, void *), uint64_t))(v9 + 8);
  if (!v11 || v11(v6, v7, _CRRemoteControlSendMessageCompletion, v5))
  {
    id v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_2((uint64_t)v3);
    }
LABEL_14:

    char v12 = 0;
    goto LABEL_15;
  }
  char v12 = 1;
LABEL_15:
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v12;
}

- (void)closeChannel
{
  v3 = [(CARSessionChannel *)self channelQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CARSessionChannel_closeChannel__block_invoke;
  block[3] = &unk_1E5E3A938;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __33__CARSessionChannel_closeChannel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_channelQueue_closeChannel");
}

- (void)_channelQueue_closeChannel
{
  v3 = [(CARSessionChannel *)self channelQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_remoteControlSession)
  {
    v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "tearing down remote control session", v9, 2u);
    }

    remoteControlSession = self->_remoteControlSession;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(OpaqueFigEndpointRemoteControlSession *))(v7 + 24);
    if (v8) {
      v8(remoteControlSession);
    }
  }
}

- (void)_channelQueue_invalidate
{
  v3 = [(CARSessionChannel *)self channelQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_remoteControlSession)
  {
    v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "invalidating remote control session", v10, 2u);
    }

    uint64_t CMBaseObject = FigEndpointRemoteControlSessionGetCMBaseObject();
    if (CMBaseObject)
    {
      uint64_t v6 = CMBaseObject;
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = *(void (**)(uint64_t))(v8 + 24);
      if (v9) {
        v9(v6);
      }
    }
    CFRelease(self->_remoteControlSession);
    self->_remoteControlSession = 0;
  }
}

- (id)shortChannelType
{
  uint64_t v2 = [(CARSessionChannel *)self channelType];
  v3 = [v2 substringToIndex:8];

  return v3;
}

- (id)_endpointValueForKey:(__CFString *)a3
{
  if (self->_remoteControlSession)
  {
    id v15 = 0;
    uint64_t CMBaseObject = FigEndpointRemoteControlSessionGetCMBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, __CFString *, void, id *))(v6 + 48);
    if (v9)
    {
      int v10 = v9(CMBaseObject, a3, *MEMORY[0x1E4F1CF80], &v15);
      if (v10 == -12787 || v10 == 0)
      {
LABEL_18:
        id v8 = v15;
        goto LABEL_19;
      }
      int v12 = v10;
    }
    else
    {
      int v12 = -12782;
    }
    id v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CARSessionChannel *)(uint64_t)a3 _endpointValueForKey:v13];
    }

    goto LABEL_18;
  }
  uint64_t v7 = CarGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CARSessionChannel _endpointValueForKey:]((uint64_t)a3, v7);
  }

  id v8 = 0;
LABEL_19:
  return v8;
}

- (void)_dataReceived:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CARSessionChannel *)self channelQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CARSessionChannel__dataReceived___block_invoke;
  v7[3] = &unk_1E5E3A800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __35__CARSessionChannel__dataReceived___block_invoke(uint64_t a1)
{
  uint64_t v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __35__CARSessionChannel__dataReceived___block_invoke_cold_1(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 32) channelDelegate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [*(id *)(a1 + 32) channelDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) channelDelegate];
      [v7 channel:*(void *)(a1 + 32) didReceiveMessage:*(void *)(a1 + 40)];
    }
  }
}

- (void)_sendComplete
{
  uint64_t v3 = [(CARSessionChannel *)self channelQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CARSessionChannel__sendComplete__block_invoke;
  block[3] = &unk_1E5E3A938;
  block[4] = self;
  dispatch_async(v3, block);
}

void __34__CARSessionChannel__sendComplete__block_invoke(uint64_t a1)
{
  uint64_t v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__CARSessionChannel__sendComplete__block_invoke_cold_1(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 32) channelDelegate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [*(id *)(a1 + 32) channelDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) channelDelegate];
      [v7 didSendMessageForChannel:*(void *)(a1 + 32)];
    }
  }
}

- (void)_channelInvalidated
{
  uint64_t v3 = [(CARSessionChannel *)self channelQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CARSessionChannel__channelInvalidated__block_invoke;
  block[3] = &unk_1E5E3A938;
  block[4] = self;
  dispatch_async(v3, block);
}

void __40__CARSessionChannel__channelInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) shortChannelType];
    int v11 = 138543362;
    int v12 = v3;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_DEFAULT, "Channel %{public}@ invalidated", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) invalidationHandler];
  uint64_t v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  uint64_t v6 = [*(id *)(a1 + 32) channelDelegate];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = [*(id *)(a1 + 32) channelDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      int v10 = [*(id *)(a1 + 32) channelDelegate];
      [v10 didCloseChannel:*(void *)(a1 + 32)];
    }
  }
}

- (CARSessionChannelDelegate)channelDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->channelDelegate);
  return (CARSessionChannelDelegate *)WeakRetained;
}

- (void)setChannelDelegate:(id)a3
{
}

- (CARSession)session
{
  return self->_session;
}

- (NSString)channelType
{
  return self->_channelType;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSNumber)qualityOfService
{
  return self->_qualityOfService;
}

- (NSNumber)streamPriority
{
  return self->_streamPriority;
}

- (BOOL)withoutReply
{
  return self->_withoutReply;
}

- (OS_dispatch_queue)channelQueue
{
  return self->_channelQueue;
}

- (unint64_t)payloadCount
{
  return self->_payloadCount;
}

- (void)setPayloadCount:(unint64_t)a3
{
  self->_payloadCount = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_channelQueue, 0);
  objc_storeStrong((id *)&self->_streamPriority, 0);
  objc_storeStrong((id *)&self->_qualityOfService, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_channelType, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->channelDelegate);
}

void __42__CARSessionChannel_openChannelWithError___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [(id)OUTLINED_FUNCTION_4(a1) shortChannelType];
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_1ABB00000, a3, OS_LOG_TYPE_ERROR, "Failed to create remote control session for channel %{public}@: %@", v5, 0x16u);
}

void __42__CARSessionChannel_openChannelWithError___block_invoke_cold_2(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_4(a1) shortChannelType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1ABB00000, v2, v3, "Failed to setup remote control session event handler for channel %{public}@: %d", v4, v5, v6, v7, v8);
}

void __42__CARSessionChannel_openChannelWithError___block_invoke_cold_3(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_4(a1) shortChannelType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1ABB00000, v2, v3, "Failed to start remote control session for channel %{public}@: %d", v4, v5, v6, v7, v8);
}

void __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "Attempted to send data without active remote control session", v1, 2u);
}

void __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_2(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_4(a1) shortChannelType];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1ABB00000, v2, v3, "Failed to send data on channel %{public}@: %d", v4, v5, v6, v7, v8);
}

void __56__CARSessionChannel_sendChannelMessage_withDescription___block_invoke_cold_3(id *a1)
{
  v1 = [*a1 shortChannelType];
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x20u);
}

- (void)_endpointValueForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "no endpoint available, failed to get endpoint value for key %@", (uint8_t *)&v2, 0xCu);
}

- (void)_endpointValueForKey:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "failed to get endpoint value for key %@, error: %i", (uint8_t *)&v3, 0x12u);
}

void __35__CARSessionChannel__dataReceived___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) shortChannelType];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);
}

void __34__CARSessionChannel__sendComplete__block_invoke_cold_1(uint64_t a1)
{
  int v6 = [*(id *)(a1 + 32) shortChannelType];
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0xCu);
}

@end