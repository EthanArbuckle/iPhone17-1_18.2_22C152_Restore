@interface VCRemoteVideoManager
- (BOOL)doesQueueExistForStreamToken:(id)a3;
- (BOOL)setLayerBoundsForStreamTokenWithArguments:(id)a3 error:(id *)a4;
- (BOOL)setTransformForRemoteVideoOrientationEnabledWithArguments:(id)a3 error:(id *)a4;
- (VCRemoteVideoManager)init;
- (id)contextIdForStreamTokenWithArguments:(id)a3 error:(id *)a4;
- (id)newQueueForStreamToken:(int64_t)a3 videoMode:(int)a4;
- (id)newQueueForStreamToken:(int64_t)a3 videoMode:(int)a4 imageQueueProtected:(BOOL)a5;
- (unsigned)slotForStreamToken:(int64_t)a3 videoMode:(int)a4;
- (void)cleanupDictionaries;
- (void)connectionDidChangeWithLocalInterfaceType:(id)a3 remoteInterfaceType:(id)a4 streamToken:(int64_t)a5;
- (void)dealloc;
- (void)dispatchNetworkQualityDidDegrade:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4 streamToken:(int64_t)a5;
- (void)dispatchedConnectionDidChangeWithLocalInterfaceType:(id)a3 remoteInterfaceType:(id)a4 streamToken:(int64_t)a5;
- (void)dispatchedNotifyCachedStateForStreamToken:(id)a3;
- (void)dispatchedRemoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4;
- (void)dispatchedRemoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4;
- (void)dispatchedRemoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4;
- (void)dispatchedRemoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4;
- (void)networkQualityDidDegrade:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4 streamToken:(int64_t)a5;
- (void)notifyCachedStateForStreamToken:(id)a3;
- (void)registerBlocksForService;
- (void)releaseQueueForStreamToken:(int64_t)a3;
- (void)remoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4;
- (void)remoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4;
- (void)remoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4;
- (void)remoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4;
- (void)resetDidReceiveFirstFrameForStreamToken:(int64_t)a3;
@end

@implementation VCRemoteVideoManager

void __VCRemoteVideoManager_DefaultManager_block_invoke()
{
  if (!_vcRemoteVideoManager) {
    _vcRemoteVideoManager = objc_alloc_init(VCRemoteVideoManager);
  }
}

- (VCRemoteVideoManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCRemoteVideoManager;
  v2 = [(VCRemoteVideoManager *)&v5 init];
  if (v2)
  {
    v2->_queuesForStreamTokenDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_stateCacheForStreamTokenDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCRemoteVideoManager.XPCCommandQueue", 0, CustomRootQueue);
    v2->_xpcCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCRemoteVideoManager.XPCNotificationQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  dispatch_release((dispatch_object_t)self->_xpcCallbackQueue);
  [(VCRemoteVideoManager *)self cleanupDictionaries];

  v3.receiver = self;
  v3.super_class = (Class)VCRemoteVideoManager;
  [(VCRemoteVideoManager *)&v3 dealloc];
}

- (id)newQueueForStreamToken:(int64_t)a3 videoMode:(int)a4
{
  return [(VCRemoteVideoManager *)self newQueueForStreamToken:a3 videoMode:*(void *)&a4 imageQueueProtected:0];
}

- (id)newQueueForStreamToken:(int64_t)a3 videoMode:(int)a4 imageQueueProtected:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__21;
  v21 = __Block_byref_object_dispose__21;
  uint64_t v22 = 0;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCRemoteVideoManager-newQueueForStreamToken");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v24 = v9;
      __int16 v25 = 2080;
      v26 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]";
      __int16 v27 = 1024;
      int v28 = 155;
      __int16 v29 = 2048;
      int64_t v30 = a3;
      __int16 v31 = 1024;
      int v32 = a4;
      __int16 v33 = 1024;
      BOOL v34 = v5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCRemoteVideoManager-newQueueForStreamToken streamToken=%ld mode=%d imageQueueProtected=%d", buf, 0x32u);
    }
  }
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__VCRemoteVideoManager_newQueueForStreamToken_videoMode_imageQueueProtected___block_invoke;
  v14[3] = &unk_1E6DB81E8;
  v14[4] = self;
  v14[5] = &v17;
  v14[6] = a3;
  int v15 = a4;
  BOOL v16 = v5;
  dispatch_sync(dispatchQueue, v14);
  v12 = (void *)v18[5];
  _Block_object_dispose(&v17, 8);
  return v12;
}

void __77__VCRemoteVideoManager_newQueueForStreamToken_videoMode_imageQueueProtected___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 48);
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48))))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      BOOL v5 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *v2;
          *(_DWORD *)buf = 136315906;
          uint64_t v39 = v3;
          __int16 v40 = 2080;
          v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
          __int16 v42 = 1024;
          int v43 = 166;
          __int16 v44 = 2048;
          *(void *)v45 = v6;
          _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d queuesForStreamToken exists for streamToken %ld", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __77__VCRemoteVideoManager_newQueueForStreamToken_videoMode_imageQueueProtected___block_invoke_cold_1(v3, v2, v4);
      }
    }
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v7, objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));

    v8 = objc_opt_new();
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v8, objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
  }
  uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(v9, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)));
  v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v10)
  {
    id v11 = v10;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 48);
          int v16 = *(_DWORD *)(a1 + 56);
          *(_DWORD *)buf = 136316162;
          uint64_t v39 = v12;
          __int16 v40 = 2080;
          v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
          __int16 v42 = 1024;
          int v43 = 172;
          __int16 v44 = 1024;
          *(_DWORD *)v45 = v15;
          *(_WORD *)&v45[4] = 1024;
          *(_DWORD *)&v45[6] = v16;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Queue exists for streamToken %u, videoMode %d", buf, 0x28u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = *(void *)(a1 + 48);
        int v35 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)buf = 136316162;
        uint64_t v39 = v12;
        __int16 v40 = 2080;
        v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 172;
        __int16 v44 = 1024;
        *(_DWORD *)v45 = v34;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = v35;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Queue exists for streamToken %u, videoMode %d", buf, 0x28u);
      }
    }
  }
  else
  {
    int v17 = *(_DWORD *)(a1 + 56);
    v18 = [VCImageQueue alloc];
    if (v17 == 2) {
      uint64_t v19 = 60;
    }
    else {
      uint64_t v19 = 30;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(VCImageQueue *)v18 initWithFrameRate:v19 imageQueueProtected:*(unsigned __int8 *)(a1 + 60)];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)));
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setStreamToken:*(void *)(a1 + 48)];
    [+[VCStreamOutputManager sharedInstance] registerStreamOutputSource:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forStreamToken:*(void *)(a1 + 48)];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v20 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v21 = *(_DWORD *)(a1 + 48);
    int v22 = *(_DWORD *)(a1 + 56);
    v23 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys]
        ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "allKeys"), "description"), "UTF8String"): "<nil>";
    asprintf(&__str, "Returning queue %p for streamToken %u, video mode %d, _queuesForStreamTokenDict %s", v20, v21, v22, v23);
    if (__str)
    {
      __lasts = 0;
      uint64_t v24 = strtok_r(__str, "\n", &__lasts);
      __int16 v25 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          __int16 v27 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v39 = v26;
            __int16 v40 = 2080;
            v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
            __int16 v42 = 1024;
            int v43 = 180;
            __int16 v44 = 2080;
            *(void *)v45 = "";
            *(_WORD *)&v45[8] = 2080;
            v46 = v24;
            _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v24 = strtok_r(0, "\n", &__lasts);
      }
      while (v24);
      free(__str);
    }
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCRemoteVideoManager-newQueueForStreamToken");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    __int16 v29 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t v30 = *(char **)(a1 + 48);
      uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v32 = *(_DWORD *)(a1 + 56);
      int v33 = *(unsigned __int8 *)(a1 + 60);
      *(_DWORD *)buf = 136316674;
      uint64_t v39 = v28;
      __int16 v40 = 2080;
      v41 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
      __int16 v42 = 1024;
      int v43 = 181;
      __int16 v44 = 2048;
      *(void *)v45 = v31;
      *(_WORD *)&v45[8] = 2048;
      v46 = v30;
      __int16 v47 = 1024;
      int v48 = v32;
      __int16 v49 = 1024;
      int v50 = v33;
      _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCRemoteVideoManager-newQueueForStreamToken queue=%p streamToken=%ld mode=%d imageQueueProtected=%d", buf, 0x3Cu);
    }
  }
}

- (void)resetDidReceiveFirstFrameForStreamToken:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCRemoteVideoManager-resetDidReceiveFirstFrame");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCRemoteVideoManager resetDidReceiveFirstFrameForStreamToken:]";
      __int16 v13 = 1024;
      int v14 = 189;
      __int16 v15 = 2048;
      int64_t v16 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCRemoteVideoManager-resetDidReceiveFirstFrame streamToken=%ld", buf, 0x26u);
    }
  }
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__VCRemoteVideoManager_resetDidReceiveFirstFrameForStreamToken___block_invoke;
  v8[3] = &unk_1E6DB4568;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(dispatchQueue, v8);
}

uint64_t __64__VCRemoteVideoManager_resetDidReceiveFirstFrameForStreamToken___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));

  return [v1 setHasReceivedFirstFrame:0];
}

- (BOOL)doesQueueExistForStreamToken:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__VCRemoteVideoManager_doesQueueExistForStreamToken___block_invoke;
  v6[3] = &unk_1E6DB43B0;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = self;
  dispatch_sync(dispatchQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __53__VCRemoteVideoManager_doesQueueExistForStreamToken___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result != 0;
  return result;
}

- (void)releaseQueueForStreamToken:(int64_t)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCRemoteVideoManager_releaseQueueForStreamToken___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

void __51__VCRemoteVideoManager_releaseQueueForStreamToken___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v2];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v3)
  {
    uint64_t v5 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v6;
        __int16 v20 = 2080;
        int v21 = "-[VCRemoteVideoManager releaseQueueForStreamToken:]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 236;
        __int16 v24 = 1024;
        int v25 = v8;
        __int16 v26 = 2048;
        uint64_t v27 = [v3 count];
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d will release queues for streamToken=%u, [queuesForVideoMode count]=%lu", buf, 0x2Cu);
      }
    }
    [v3 removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v2];
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v2];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      char v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) count];
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v9;
        __int16 v20 = 2080;
        int v21 = "-[VCRemoteVideoManager releaseQueueForStreamToken:]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 240;
        __int16 v24 = 1024;
        int v25 = v11;
        __int16 v26 = 2048;
        uint64_t v27 = v12;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d did release for streamToken=%u, [queueDict count]=%lu", buf, 0x2Cu);
      }
    }
    [+[VCStreamOutputManager sharedInstance] deregisterStreamOutputSourceForStreamToken:*(void *)(a1 + 40)];
    __int16 v13 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VCRemoteVideoManager_releaseQueueForStreamToken___block_invoke_80;
    block[3] = &unk_1E6DB3DC8;
    block[4] = v2;
    dispatch_async(v13, block);
  }
  else if (ErrorLogLevelForModule >= 5)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      int v21 = "-[VCRemoteVideoManager releaseQueueForStreamToken:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 232;
      __int16 v24 = 1024;
      int v25 = v16;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d queue doesn't exist for streamToken=%u", buf, 0x22u);
    }
  }
}

uint64_t __51__VCRemoteVideoManager_releaseQueueForStreamToken___block_invoke_80(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"vcRemoteVideoDidReleaseRemoteVideoQueue" arguments:0 toAllClientsWithContext:v3];
}

void __VCRemoteVideoManager_DidReceiveFirstRemoteFrameForStreamToken_block_invoke(uint64_t a1)
{
}

void __VCRemoteVideoManager_RemoteScreenAttributesDidChange_block_invoke(uint64_t a1)
{
}

void __VCRemoteVideoManager_RemoteVideoAttributesDidChange_block_invoke(uint64_t a1)
{
}

- (void)dispatchedRemoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v7;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCRemoteVideoManager dispatchedRemoteVideoDidPause:streamToken:]";
      __int16 v18 = 1024;
      int v19 = 361;
      __int16 v20 = 1024;
      int v21 = a4;
      __int16 v22 = 1024;
      BOOL v23 = v5;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken[%u] didPause[%d]", buf, 0x28u);
    }
  }
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a4];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v9), "setIsVideoPaused:", v5);
  [+[VCStreamOutputManager sharedInstance] remoteVideoDidPause:v5 streamToken:a4];
  char v10 = (void *)[objc_alloc(NSNumber) initWithBool:v5];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"conferenceVideoPause", 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VCRemoteVideoManager_dispatchedRemoteVideoDidPause_streamToken___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = v11;
  void block[5] = v9;
  dispatch_async(xpcCallbackQueue, block);
}

uint64_t __66__VCRemoteVideoManager_dispatchedRemoteVideoDidPause_streamToken___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 sendMessageAsync:"vcRemoteVideoDidRemoteVideoPause" arguments:v3 toAllClientsWithContext:v4];
}

- (void)remoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__VCRemoteVideoManager_remoteVideoDidPause_streamToken___block_invoke;
  v5[3] = &unk_1E6DB45E0;
  BOOL v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __56__VCRemoteVideoManager_remoteVideoDidPause_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRemoteVideoDidPause:*(unsigned __int8 *)(a1 + 48) streamToken:*(void *)(a1 + 40)];
}

- (void)dispatchedRemoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v7;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCRemoteVideoManager dispatchedRemoteMediaDidStall:streamToken:]";
      __int16 v18 = 1024;
      int v19 = 394;
      __int16 v20 = 1024;
      int v21 = a4;
      __int16 v22 = 1024;
      BOOL v23 = v5;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken[%u] didStall[%d]", buf, 0x28u);
    }
  }
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a4];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v9), "setIsMediaStalled:", v5);
  [+[VCStreamOutputManager sharedInstance] remoteMediaDidStall:v5 streamToken:a4];
  char v10 = (void *)[objc_alloc(NSNumber) initWithBool:v5];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"conferenceIsRemoteMediaStalled", 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VCRemoteVideoManager_dispatchedRemoteMediaDidStall_streamToken___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = v11;
  void block[5] = v9;
  dispatch_async(xpcCallbackQueue, block);
}

uint64_t __66__VCRemoteVideoManager_dispatchedRemoteMediaDidStall_streamToken___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 sendMessageAsync:"vcRemoteVideoDidRemoteMediaStall" arguments:v3 toAllClientsWithContext:v4];
}

- (void)remoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__VCRemoteVideoManager_remoteMediaDidStall_streamToken___block_invoke;
  v5[3] = &unk_1E6DB45E0;
  BOOL v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __56__VCRemoteVideoManager_remoteMediaDidStall_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRemoteMediaDidStall:*(unsigned __int8 *)(a1 + 48) streamToken:*(void *)(a1 + 40)];
}

- (void)dispatchedRemoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v7;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCRemoteVideoManager dispatchedRemoteVideoDidDegrade:streamToken:]";
      __int16 v18 = 1024;
      int v19 = 428;
      __int16 v20 = 1024;
      int v21 = a4;
      __int16 v22 = 1024;
      BOOL v23 = v5;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken[%u] isDegraded[%d]", buf, 0x28u);
    }
  }
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a4];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v9), "setIsVideoDegraded:", v5);
  [+[VCStreamOutputManager sharedInstance] remoteVideoDidDegrade:v5 streamToken:a4];
  char v10 = (void *)[objc_alloc(NSNumber) initWithBool:v5];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"conferenceIsVideoDegraded", 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCRemoteVideoManager_dispatchedRemoteVideoDidDegrade_streamToken___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = v11;
  void block[5] = v9;
  dispatch_async(xpcCallbackQueue, block);
}

uint64_t __68__VCRemoteVideoManager_dispatchedRemoteVideoDidDegrade_streamToken___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 sendMessageAsync:"vcRemoteVideoDidVideoDegrade" arguments:v3 toAllClientsWithContext:v4];
}

- (void)remoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__VCRemoteVideoManager_remoteVideoDidDegrade_streamToken___block_invoke;
  v5[3] = &unk_1E6DB45E0;
  BOOL v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __58__VCRemoteVideoManager_remoteVideoDidDegrade_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRemoteVideoDidDegrade:*(unsigned __int8 *)(a1 + 48) streamToken:*(void *)(a1 + 40)];
}

- (void)dispatchNetworkQualityDidDegrade:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4 streamToken:(int64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    char v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      int v21 = "-[VCRemoteVideoManager dispatchNetworkQualityDidDegrade:isLocalNetworkQualityDegraded:streamToken:]";
      __int16 v22 = 1024;
      int v23 = 463;
      __int16 v24 = 1024;
      int v25 = a5;
      __int16 v26 = 1024;
      BOOL v27 = v7;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%u isDegraded=%d", buf, 0x28u);
    }
  }
  uint64_t v11 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a5];
  uint64_t v12 = (void *)[(NSMutableDictionary *)self->_stateCacheForStreamTokenDict objectForKeyedSubscript:v11];
  [v12 setIsNetworkDegraded:v7];
  [v12 setIsLocalNetworkDegraded:v6];
  __int16 v13 = (void *)[objc_alloc(NSNumber) initWithBool:v7];
  uint64_t v14 = (void *)[objc_alloc(NSNumber) initWithBool:v6];
  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v13, @"conferenceIsNetworkDegraded", v14, @"conferenceIsNetworkDegradedLocal", 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__VCRemoteVideoManager_dispatchNetworkQualityDidDegrade_isLocalNetworkQualityDegraded_streamToken___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = v15;
  void block[5] = v11;
  dispatch_async(xpcCallbackQueue, block);
}

uint64_t __99__VCRemoteVideoManager_dispatchNetworkQualityDidDegrade_isLocalNetworkQualityDegraded_streamToken___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 sendMessageAsync:"vcRemoteVideoDidNetworkDegrade" arguments:v3 toAllClientsWithContext:v4];
}

- (void)networkQualityDidDegrade:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4 streamToken:(int64_t)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__VCRemoteVideoManager_networkQualityDidDegrade_isLocalNetworkQualityDegraded_streamToken___block_invoke;
  v6[3] = &unk_1E6DB6EB0;
  BOOL v7 = a3;
  BOOL v8 = a4;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(dispatchQueue, v6);
}

uint64_t __91__VCRemoteVideoManager_networkQualityDidDegrade_isLocalNetworkQualityDegraded_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchNetworkQualityDidDegrade:*(unsigned __int8 *)(a1 + 48) isLocalNetworkQualityDegraded:*(unsigned __int8 *)(a1 + 49) streamToken:*(void *)(a1 + 40)];
}

- (void)dispatchedRemoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    BOOL v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v7;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCRemoteVideoManager dispatchedRemoteVideoDidSuspend:streamToken:]";
      __int16 v18 = 1024;
      int v19 = 493;
      __int16 v20 = 1024;
      int v21 = a4;
      __int16 v22 = 1024;
      BOOL v23 = v5;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken[%u] isSuspended[%d]", buf, 0x28u);
    }
  }
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a4];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateCacheForStreamTokenDict, "objectForKeyedSubscript:", v9), "setIsVideoSuspended:", v5);
  [+[VCStreamOutputManager sharedInstance] remoteVideoDidSuspend:v5 streamToken:a4];
  char v10 = (void *)[objc_alloc(NSNumber) initWithBool:v5];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"conferenceIsVideoSuspended", 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCRemoteVideoManager_dispatchedRemoteVideoDidSuspend_streamToken___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = v11;
  void block[5] = v9;
  dispatch_async(xpcCallbackQueue, block);
}

uint64_t __68__VCRemoteVideoManager_dispatchedRemoteVideoDidSuspend_streamToken___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 sendMessageAsync:"vcRemoteVideoDidVideoSuspend" arguments:v3 toAllClientsWithContext:v4];
}

- (void)remoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__VCRemoteVideoManager_remoteVideoDidSuspend_streamToken___block_invoke;
  v5[3] = &unk_1E6DB45E0;
  BOOL v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __58__VCRemoteVideoManager_remoteVideoDidSuspend_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRemoteVideoDidSuspend:*(unsigned __int8 *)(a1 + 48) streamToken:*(void *)(a1 + 40)];
}

- (void)dispatchedConnectionDidChangeWithLocalInterfaceType:(id)a3 remoteInterfaceType:(id)a4 streamToken:(int64_t)a5
{
  void block[6] = *MEMORY[0x1E4F143B8];
  BOOL v8 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a5];
  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_stateCacheForStreamTokenDict objectForKeyedSubscript:v8];
  [v9 setLocalInterfaceType:a3];
  [v9 setRemoteInterfaceType:a4];
  char v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a3, @"conferenceConnectionTypeLocal", a4, @"conferenceConnectionTypeRemote", 0);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__VCRemoteVideoManager_dispatchedConnectionDidChangeWithLocalInterfaceType_remoteInterfaceType_streamToken___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = v10;
  void block[5] = v8;
  dispatch_async(xpcCallbackQueue, block);
}

uint64_t __108__VCRemoteVideoManager_dispatchedConnectionDidChangeWithLocalInterfaceType_remoteInterfaceType_streamToken___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 sendMessageAsync:"vcRemoteVideoDidConnectionChange" arguments:v3 toAllClientsWithContext:v4];
}

- (void)connectionDidChangeWithLocalInterfaceType:(id)a3 remoteInterfaceType:(id)a4 streamToken:(int64_t)a5
{
  block[8] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCRemoteVideoManager_connectionDidChangeWithLocalInterfaceType_remoteInterfaceType_streamToken___block_invoke;
  block[3] = &unk_1E6DB6560;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  dispatch_async(dispatchQueue, block);
}

uint64_t __98__VCRemoteVideoManager_connectionDidChangeWithLocalInterfaceType_remoteInterfaceType_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedConnectionDidChangeWithLocalInterfaceType:*(void *)(a1 + 40) remoteInterfaceType:*(void *)(a1 + 48) streamToken:*(void *)(a1 + 56)];
}

- (unsigned)slotForStreamToken:(int64_t)a3 videoMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (VCRemoteVideoManager_DefaultManager_onceToken != -1) {
    dispatch_once(&VCRemoteVideoManager_DefaultManager_onceToken, &__block_literal_global_59);
  }
  QueueForStreamToken = (void *)_VCRemoteVideoManager_GetQueueForStreamToken(_vcRemoteVideoManager, a3, v4);
  unsigned int v7 = [QueueForStreamToken setVideoDestination:0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (QueueForStreamToken) {
        char v10 = (const char *)objc_msgSend((id)objc_msgSend(QueueForStreamToken, "description"), "UTF8String");
      }
      else {
        char v10 = "<nil>";
      }
      int v12 = 136316674;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCRemoteVideoManager slotForStreamToken:videoMode:]";
      __int16 v16 = 1024;
      int v17 = 566;
      __int16 v18 = 2080;
      int v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      __int16 v22 = 1024;
      int v23 = a3;
      __int16 v24 = 1024;
      int v25 = v4;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: queue %s --> get slot# %lu for streamToken %u(%d)", (uint8_t *)&v12, 0x3Cu);
    }
  }
  return v7;
}

- (void)cleanupDictionaries
{
  [(NSMutableDictionary *)self->_queuesForStreamTokenDict removeAllObjects];
  stateCacheForStreamTokenDict = self->_stateCacheForStreamTokenDict;

  [(NSMutableDictionary *)stateCacheForStreamTokenDict removeAllObjects];
}

- (id)contextIdForStreamTokenWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = (void *)[a3 objectForKeyedSubscript:@"conferenceCallID"];
  uint64_t v8 = [a3 objectForKeyedSubscript:@"conferenceVisualRectangle"];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRemoteVideoManager contextIdForStreamTokenWithArguments:error:]();
      }
    }
    uint64_t v21 = -1;
    goto LABEL_22;
  }
  char v10 = (NSString *)v8;
  if (![(NSMutableDictionary *)self->_queuesForStreamTokenDict objectForKeyedSubscript:v7])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      int v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRemoteVideoManager contextIdForStreamTokenWithArguments:error:](v22, v7, v23);
      }
    }
    uint64_t v21 = -2;
LABEL_22:
    if (a4)
    {
      __int16 v24 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCRemoteVideoManager" code:v21 userInfo:0];
      int v19 = 0;
      *a4 = v24;
    }
    else
    {
      int v19 = 0;
    }
    return v19;
  }
  uint64_t v11 = [v7 unsignedIntValue];
  int v12 = v11;
  QueueForStreamToken = (void *)_VCRemoteVideoManager_GetQueueForStreamToken((uint64_t)self, v11, 0);
  NSRect v42 = NSRectFromString(v10);
  uint64_t v14 = objc_msgSend(QueueForStreamToken, "createCAContextWithSize:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    __int16 v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (QueueForStreamToken) {
        int v17 = (const char *)objc_msgSend((id)objc_msgSend(QueueForStreamToken, "description"), "UTF8String");
      }
      else {
        int v17 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v28 = v15;
      __int16 v29 = 2080;
      int64_t v30 = "-[VCRemoteVideoManager contextIdForStreamTokenWithArguments:error:]";
      __int16 v31 = 1024;
      int v32 = 594;
      __int16 v33 = 2080;
      uint64_t v34 = v17;
      __int16 v35 = 2048;
      uint64_t v36 = v14;
      __int16 v37 = 1024;
      int v38 = v12;
      __int16 v39 = 1024;
      int v40 = 0;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: queue=%s --> get context=%lu for streamToken=%u(mode=%d)", buf, 0x3Cu);
    }
  }
  v25[0] = [&unk_1F3DC4C80 stringValue];
  v26[0] = [NSNumber numberWithUnsignedInt:v14];
  v25[1] = [&unk_1F3DC4C98 stringValue];
  v26[1] = &unk_1F3DC4C80;
  v25[2] = [&unk_1F3DC4CB0 stringValue];
  v26[2] = &unk_1F3DC4C80;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  int v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"CONTEXT", v18, @"vcRemoteVideoSlotsForModes", 0);
  return v19;
}

- (BOOL)setLayerBoundsForStreamTokenWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = (void *)[a3 objectForKeyedSubscript:@"conferenceCallID"];
  uint64_t v8 = [a3 objectForKeyedSubscript:@"conferenceVisualRectangle"];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:]();
      }
    }
    goto LABEL_40;
  }
  char v10 = (NSString *)v8;
  uint64_t v11 = [v7 unsignedIntValue];
  unint64_t v12 = v11;
  if ([(NSMutableDictionary *)self->_queuesForStreamTokenDict objectForKeyedSubscript:v7])
  {
    QueueForStreamToken = (void *)_VCRemoteVideoManager_GetQueueForStreamToken((uint64_t)self, v11, 0);
    NSRect v50 = NSRectFromString(v10);
    CGFloat x = v50.origin.x;
    CGFloat y = v50.origin.y;
    CGFloat width = v50.size.width;
    CGFloat height = v50.size.height;
    if (VideoUtil_LayerBoundsAreValid(v50.origin.x, v50.origin.y, v50.size.width, v50.size.height))
    {
      uint64_t v18 = [a3 objectForKeyedSubscript:@"USERXPCARGUMENTS"];
      uint64_t v19 = [MEMORY[0x1E4F39BB8] handleFromXPCRepresentation:v18];
      if (v19)
      {
        __int16 v20 = (void *)v19;
        int v21 = VCImageQueue_setCALayerSize((uint64_t)QueueForStreamToken, v19, x, y, width, height);
        if (v21)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v22 = VRTraceErrorLogLevelToCSTR();
            int v23 = *MEMORY[0x1E4F47A50];
            __int16 v24 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                if (QueueForStreamToken) {
                  int v25 = (const char *)objc_msgSend((id)objc_msgSend(QueueForStreamToken, "description"), "UTF8String");
                }
                else {
                  int v25 = "<nil>";
                }
                int v33 = 136316930;
                uint64_t v34 = v22;
                __int16 v35 = 2080;
                uint64_t v36 = "-[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:]";
                __int16 v37 = 1024;
                int v38 = 627;
                __int16 v39 = 2080;
                int v40 = (void *)v25;
                __int16 v41 = 2112;
                NSRect v42 = (VCRemoteVideoManager *)v10;
                __int16 v43 = 2048;
                unint64_t v44 = (unint64_t)v20;
                __int16 v45 = 1024;
                int v46 = v11;
                __int16 v47 = 1024;
                int v48 = 0;
                _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: queue=%s --> set layer bounds=%@ caFenceHandle=%p for streamToken=%u(mode=%d)", (uint8_t *)&v33, 0x46u);
              }
            }
            else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              if (QueueForStreamToken) {
                uint64_t v26 = (const char *)objc_msgSend((id)objc_msgSend(QueueForStreamToken, "description"), "UTF8String");
              }
              else {
                uint64_t v26 = "<nil>";
              }
              int v33 = 136316930;
              uint64_t v34 = v22;
              __int16 v35 = 2080;
              uint64_t v36 = "-[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:]";
              __int16 v37 = 1024;
              int v38 = 627;
              __int16 v39 = 2080;
              int v40 = (void *)v26;
              __int16 v41 = 2112;
              NSRect v42 = (VCRemoteVideoManager *)v10;
              __int16 v43 = 2048;
              unint64_t v44 = (unint64_t)v20;
              __int16 v45 = 1024;
              int v46 = v11;
              __int16 v47 = 1024;
              int v48 = 0;
              _os_log_debug_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCRemoteVideoManager: queue=%s --> set layer bounds=%@ caFenceHandle=%p for streamToken=%u(mode=%d)", (uint8_t *)&v33, 0x46u);
            }
          }
          uint64_t v27 = 0;
        }
        else
        {
          if ((VCRemoteVideoManager *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:].cold.4();
              }
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              int64_t v30 = (__CFString *)[(VCRemoteVideoManager *)self performSelector:sel_logPrefix];
            }
            else {
              int64_t v30 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v31 = VRTraceErrorLogLevelToCSTR();
              int v32 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                int v33 = 136316418;
                uint64_t v34 = v31;
                __int16 v35 = 2080;
                uint64_t v36 = "-[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:]";
                __int16 v37 = 1024;
                int v38 = 626;
                __int16 v39 = 2112;
                int v40 = v30;
                __int16 v41 = 2048;
                NSRect v42 = self;
                __int16 v43 = 2048;
                unint64_t v44 = v12;
                _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid CALayer for queue wiht streamToken=%ld", (uint8_t *)&v33, 0x3Au);
              }
            }
          }
          uint64_t v27 = -3;
        }
        int v28 = v21 ^ 1;
        [v20 invalidate];
        goto LABEL_21;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:].cold.5();
      }
    }
LABEL_40:
    LOBYTE(v21) = 0;
    int v28 = 1;
    uint64_t v27 = -1;
    goto LABEL_21;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRemoteVideoManager setLayerBoundsForStreamTokenWithArguments:error:]();
    }
  }
  LOBYTE(v21) = 0;
  int v28 = 1;
  uint64_t v27 = -2;
LABEL_21:
  if (a4 && v28) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCRemoteVideoManager" code:v27 userInfo:0];
  }
  return v21;
}

- (BOOL)setTransformForRemoteVideoOrientationEnabledWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = (void *)[a3 objectForKeyedSubscript:@"conferenceCallID"];
  uint64_t v8 = [a3 objectForKeyedSubscript:@"conferenceTransformForRemoteVideoOrientationEnabled"];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRemoteVideoManager setTransformForRemoteVideoOrientationEnabledWithArguments:error:]();
      }
    }
    uint64_t v16 = -1;
    goto LABEL_18;
  }
  char v10 = (void *)v8;
  uint64_t v11 = [v7 unsignedIntValue];
  if (![(NSMutableDictionary *)self->_queuesForStreamTokenDict objectForKeyedSubscript:v7])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRemoteVideoManager setTransformForRemoteVideoOrientationEnabledWithArguments:error:]();
      }
    }
    uint64_t v16 = -2;
LABEL_18:
    if (!a4) {
      return 0;
    }
    int v17 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCRemoteVideoManager" code:v16 userInfo:0];
    BOOL result = 0;
    *a4 = v17;
    return result;
  }
  QueueForStreamToken = (void *)_VCRemoteVideoManager_GetQueueForStreamToken((uint64_t)self, v11, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136316162;
      uint64_t v19 = v13;
      __int16 v20 = 2080;
      int v21 = "-[VCRemoteVideoManager setTransformForRemoteVideoOrientationEnabledWithArguments:error:]";
      __int16 v22 = 1024;
      int v23 = 651;
      __int16 v24 = 2112;
      int v25 = v10;
      __int16 v26 = 2048;
      uint64_t v27 = v11;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting transformForRemoteVideoOrientationEnabled=%@ for streamToken=%ld", (uint8_t *)&v18, 0x30u);
    }
  }
  objc_msgSend(QueueForStreamToken, "setTransformForRemoteVideoOrientationEnabled:", objc_msgSend(v10, "BOOLValue"));
  return 1;
}

- (void)notifyCachedStateForStreamToken:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCRemoteVideoManager_notifyCachedStateForStreamToken___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __56__VCRemoteVideoManager_notifyCachedStateForStreamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedNotifyCachedStateForStreamToken:*(void *)(a1 + 40)];
}

- (void)dispatchedNotifyCachedStateForStreamToken:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v5 = (void *)[(NSMutableDictionary *)self->_stateCacheForStreamTokenDict objectForKeyedSubscript:a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    unsigned int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [a3 unsignedIntegerValue];
      if (v5) {
        BOOL v9 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      }
      else {
        BOOL v9 = "<nil>";
      }
      int v11 = 136316418;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCRemoteVideoManager dispatchedNotifyCachedStateForStreamToken:]";
      __int16 v15 = 1024;
      int v16 = 671;
      __int16 v17 = 1024;
      int v18 = 671;
      __int16 v19 = 2048;
      uint64_t v20 = v8;
      __int16 v21 = 2080;
      __int16 v22 = v9;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCRemoteVideoManager.m:%d: token[%ld] state[%s]", (uint8_t *)&v11, 0x36u);
    }
  }
  if (v5)
  {
    uint64_t v10 = [a3 unsignedIntegerValue];
    if ([v5 isMediaStalled]) {
      -[VCRemoteVideoManager dispatchedRemoteMediaDidStall:streamToken:](self, "dispatchedRemoteMediaDidStall:streamToken:", [v5 isMediaStalled], v10);
    }
    if ([v5 isVideoPaused]) {
      -[VCRemoteVideoManager dispatchedRemoteVideoDidPause:streamToken:](self, "dispatchedRemoteVideoDidPause:streamToken:", [v5 isVideoPaused], v10);
    }
    if ([v5 isVideoDegraded]) {
      -[VCRemoteVideoManager dispatchedRemoteVideoDidDegrade:streamToken:](self, "dispatchedRemoteVideoDidDegrade:streamToken:", [v5 isVideoDegraded], v10);
    }
    if ([v5 isVideoSuspended]) {
      -[VCRemoteVideoManager dispatchedRemoteVideoDidSuspend:streamToken:](self, "dispatchedRemoteVideoDidSuspend:streamToken:", [v5 isVideoSuspended], v10);
    }
    if ([v5 isNetworkDegraded] && objc_msgSend(v5, "isLocalNetworkDegraded")) {
      -[VCRemoteVideoManager dispatchNetworkQualityDidDegrade:isLocalNetworkQualityDegraded:streamToken:](self, "dispatchNetworkQualityDidDegrade:isLocalNetworkQualityDegraded:streamToken:", [v5 isNetworkDegraded], objc_msgSend(v5, "isLocalNetworkDegraded"), v10);
    }
    if ([v5 remoteVideoAttributes]) {
      _VCRemoteVideoManager_DispatchedRemoteVideoAttributesDidChange((uint64_t)self, (void *)[v5 remoteVideoAttributes], v10);
    }
    if ([v5 remoteScreenAttributes]) {
      _VCRemoteVideoManager_DispatchedRemoteScreenAttributesDidChange((uint64_t)self, (void *)[v5 remoteScreenAttributes], v10);
    }
    if ([v5 hasReceivedFirstFrame]) {
      _VCRemoteVideoManager_DispatchedDidReceiveFirstRemoteFrameForStreamToken((uint64_t)self, v10);
    }
    if ([v5 localInterfaceType])
    {
      if ([v5 remoteInterfaceType]) {
        -[VCRemoteVideoManager dispatchedConnectionDidChangeWithLocalInterfaceType:remoteInterfaceType:streamToken:](self, "dispatchedConnectionDidChangeWithLocalInterfaceType:remoteInterfaceType:streamToken:", [v5 localInterfaceType], objc_msgSend(v5, "remoteInterfaceType"), v10);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRemoteVideoManager dispatchedNotifyCachedStateForStreamToken:]();
    }
  }
}

- (void)registerBlocksForService
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__VCRemoteVideoManager_registerBlocksForService__block_invoke;
  v8[3] = &unk_1E6DB5478;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoInitializeRemoteVideoForStreamToken", v8, self->_dispatchQueue);
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_156;
  v7[3] = &unk_1E6DB5478;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoGetContextIdForStreamToken", v7, self->_dispatchQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_2;
  v6[3] = &unk_1E6DB5478;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoSetLayerBoundsForStreamToken", v6, self->_dispatchQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_3;
  v5[3] = &unk_1E6DB5478;
  v5[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoSetTransformForRemoteVideoOrientationEnabled", v5, self->_dispatchQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcRemoteVideoTerminate", &__block_literal_global_161, self->_dispatchQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_164, &unk_1E6DB5478, self), "registerBlockForService:block:queue:", "vcRemoteVideoGetCachedNotifications", &v4, self->_dispatchQueue);
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  unsigned int v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  uint64_t v8 = [v7 unsignedIntValue];
  uint64_t v9 = [a2 objectForKeyedSubscript:@"USERXPCARGUMENTS"];
  if (![*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v7])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_cold_1();
      if (a3) {
        goto LABEL_17;
      }
    }
    else if (a3)
    {
LABEL_17:
      uint64_t v6 = 0;
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCRemoteVideoManager" code:-2 userInfo:0];
      return v6;
    }
    return 0;
  }
  if (v9)
  {
    QueueForStreamToken = (void *)_VCRemoteVideoManager_GetQueueForStreamToken(*(void *)(a1 + 32), v8, 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v25 = v11;
        __int16 v26 = 2080;
        uint64_t v27 = "-[VCRemoteVideoManager registerBlocksForService]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 725;
        __int16 v30 = 2048;
        uint64_t v31 = v8;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting EndpointID for streamToken=%ld", buf, 0x26u);
      }
    }
    [QueueForStreamToken setEndpointID:v9];
    id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v14 = objc_msgSend(v13, "initWithObjectsAndKeys:", v7, @"CONTEXT", MEMORY[0x1E4F1CC38], @"vcRemoteVideoInitialized", 0, v20, v21);
  }
  else
  {
    v22[0] = [&unk_1F3DC4C80 stringValue];
    v23[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "slotForStreamToken:videoMode:", v8, 0));
    v22[1] = [&unk_1F3DC4C98 stringValue];
    v23[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "slotForStreamToken:videoMode:", v8, 1));
    v22[2] = [&unk_1F3DC4CB0 stringValue];
    v23[2] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "slotForStreamToken:videoMode:", v8, 2));
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v14 = objc_msgSend(v16, "initWithObjectsAndKeys:", v7, @"CONTEXT", v15, @"vcRemoteVideoSlotsForModes", MEMORY[0x1E4F1CC38], @"vcRemoteVideoInitialized", 0);
  }
  uint64_t v6 = v14;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    int v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = v17;
      __int16 v26 = 2080;
      uint64_t v27 = "-[VCRemoteVideoManager registerBlocksForService]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 737;
      __int16 v30 = 2048;
      uint64_t v31 = v8;
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: new client initialized for streamToken=%ld", buf, 0x26u);
    }
  }
  return v6;
}

id __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_156(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  unsigned int v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "contextIdForStreamTokenWithArguments:error:", a2, a3);

  return v7;
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "setLayerBoundsForStreamTokenWithArguments:error:", a2, a3);
  }
  return 0;
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "setTransformForRemoteVideoOrientationEnabledWithArguments:error:", a2, a3);
  }
  return 0;
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v3 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  BOOL v5 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    unsigned int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCRemoteVideoManager registerBlocksForService]_block_invoke_4";
      __int16 v13 = 1024;
      int v14 = 787;
      __int16 v15 = 1024;
      int v16 = [v5 unsignedIntValue];
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: Terminate connection for streamToken=%u", buf, 0x22u);
    }
  }
  return v3;
}

uint64_t __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_164(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend(*(id *)(a1 + 32), "dispatchedNotifyCachedStateForStreamToken:", objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceCallID"));
  }
  return 0;
}

uint64_t ___VCRemoteVideoManager_DispatchedDidReceiveFirstRemoteFrameForStreamToken_block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"vcRemoteVideoDidReceiveRemoteFrame" arguments:0 toAllClientsWithContext:v3];
}

uint64_t ___VCRemoteVideoManager_DispatchedRemoteScreenAttributesDidChange_block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 sendMessageAsync:"vcRemoteVideoDidRemoteScreenAttributesChange" arguments:v3 toAllClientsWithContext:v4];
}

uint64_t ___VCRemoteVideoManager_DispatchedRemoteVideoAttributesDidChange_block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 sendMessageAsync:"vcRemoteVideoDidRemoteAttributesChange" arguments:v3 toAllClientsWithContext:v4];
}

void __77__VCRemoteVideoManager_newQueueForStreamToken_videoMode_imageQueueProtected___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  unsigned int v7 = "-[VCRemoteVideoManager newQueueForStreamToken:videoMode:imageQueueProtected:]_block_invoke";
  __int16 v8 = 1024;
  int v9 = 166;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d queuesForStreamToken exists for streamToken %ld", (uint8_t *)&v4, 0x26u);
}

- (void)contextIdForStreamTokenWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid streamToken and frameRect arguments", v2, v3, v4, v5, v6);
}

- (void)contextIdForStreamTokenWithArguments:(NSObject *)a3 error:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a2 unsignedIntValue];
  int v7 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v10 = 586;
  __int16 v11 = v5;
  int v12 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCRemoteVideoManager: video queue does not exist for streamToken=%u", (uint8_t *)&v7, 0x22u);
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid streamToken and frameRect arguments", v2, v3, v4, v5, v6);
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCRemoteVideoManager: video queue does not exist for streamToken=%ld", v2, v3, v4, v5);
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid fenceHandle value", v2, v3, v4, v5, v6);
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid CALayer for queue wiht streamToken=%ld", v2, v3, v4, v5);
}

- (void)setLayerBoundsForStreamTokenWithArguments:error:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid frameRect value", v2, v3, v4, v5, v6);
}

- (void)setTransformForRemoteVideoOrientationEnabledWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid streamToken and transformEnabled arguments", v2, v3, v4, v5, v6);
}

- (void)setTransformForRemoteVideoOrientationEnabledWithArguments:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCRemoteVideoManager: video queue does not exist for streamToken=%ld", v2, v3, v4, v5);
}

- (void)dispatchedNotifyCachedStateForStreamToken:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCRemoteVideoManager dispatchedNotifyCachedStateForStreamToken:]";
  __int16 v4 = 1024;
  int v5 = 707;
  __int16 v6 = 1024;
  int v7 = 707;
  __int16 v8 = v0;
  __int16 v9 = "-[VCRemoteVideoManager dispatchedNotifyCachedStateForStreamToken:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCRemoteVideoManager.m:%d: %s Error no VCRemoteVideoState for this stream token", v2, 0x2Cu);
}

void __48__VCRemoteVideoManager_registerBlocksForService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Video queue does not exist for streamToken=%ld", v2, v3, v4, v5);
}

@end