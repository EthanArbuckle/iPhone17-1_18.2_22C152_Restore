@interface VCEffectsManager
+ (id)sharedManager;
- (BOOL)createAllocators;
- (BOOL)initializeReceiveQueue:(id)a3 error:(id *)a4;
- (BOOL)isFaceMeshTrackingEnabled;
- (NSMutableArray)effectsArray;
- (VCEffectsManager)init;
- (VCEffectsManagerDelegate)delegate;
- (id)reportingAgent;
- (opaqueVCRemoteImageQueue)senderQueue;
- (void)dealloc;
- (void)effectsRegistered:(BOOL)a3;
- (void)encodeProcessedPixelBuffer:(__CVBuffer *)a3 time:(id *)a4 imageData:(id)a5 processTime:(id)a6;
- (void)flushRemoteQueue;
- (void)registerBlocksForService;
- (void)releaseAllocators;
- (void)remoteQueueOperationHandlerWithError:(int)a3 operation:(FigRemoteOperation *)a4;
- (void)resetEffectsLogging;
- (void)setDelegate:(id)a3;
- (void)setEffectsArray:(id)a3;
- (void)setLastEffectsType:(int)a3;
- (void)setLastEffectsType:(int)a3 shouldReport:(BOOL)a4;
- (void)setReportingAgent:(id)a3;
- (void)tearDownRemoteQueues;
- (void)updateThermalLevel:(int)a3;
@end

@implementation VCEffectsManager

CFIndex __VCEffectsManager_IsEffectsOn_block_invoke(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(*(void *)(a1 + 32) + 32);
  CFIndex result = CFArrayGetCount(v2);
  if (result >= 1)
  {
    CFIndex v4 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v2, v4);
      CFIndex result = VCEffects_EffectsMode((uint64_t)ValueAtIndex);
      if (result) {
        break;
      }
      ++v4;
      CFIndex result = CFArrayGetCount(v2);
      if (v4 >= result) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

+ (id)sharedManager
{
  if (VCEffectsManager_SharedManager_onceToken != -1) {
    dispatch_once(&VCEffectsManager_SharedManager_onceToken, &__block_literal_global_104);
  }
  return (id)VCEffectsManager_SharedManager__vcEffectsManager;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFaceMeshTrackingEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCEffectsManager_isFaceMeshTrackingEnabled__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(xpcCommandQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__VCEffectsManager_isFaceMeshTrackingEnabled__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFArrayRef v2 = (void *)[*(id *)(a1 + 32) effectsArray];
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t result = [*(id *)(*((void *)&v8 + 1) + 8 * v6) faceMeshTrackingEnabled];
        if (result)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSMutableArray)effectsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (VCEffectsManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCEffectsManager;
  CFArrayRef v2 = [(VCEffectsManager *)&v5 init];
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCEffectsManager.xpc.commands", 0, CustomRootQueue);
    v2->_effectsArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_lastEffectsType = 0;
    pthread_mutex_init(&v2->_loggingLock, 0);
    [(VCEffectsManager *)v2 resetEffectsLogging];
    [(VCEffectsManager *)v2 createAllocators];
    v2->_consecutiveDroppedFrameCount = 0;
    v2->_forceDisableEffectsHealthCheck = [+[VCDefaults sharedInstance] forceDisableEffectsHealthCheck];
    v2->_lastReceivedPixelBuffer = 0;
    v2->_thermalPressureLevel = 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_receiverQueue);
  lastReceivedPixelBuffer = self->_lastReceivedPixelBuffer;
  if (lastReceivedPixelBuffer) {
    CVPixelBufferRelease(lastReceivedPixelBuffer);
  }
  [(VCEffectsManager *)self releaseAllocators];

  [(VCEffectsManager *)self setReportingAgent:0];
  pthread_mutex_destroy(&self->_loggingLock);
  objc_storeWeak(&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)VCEffectsManager;
  [(VCEffectsManager *)&v4 dealloc];
}

- (BOOL)initializeReceiveQueue:(id)a3 error:(id *)a4
{
  v11[5] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__VCEffectsManager_initializeReceiveQueue_error___block_invoke;
  v11[3] = &unk_1E6DB5690;
  v11[4] = v7;
  BOOL ReceiverQueue = VCRemoteImageQueue_CreateReceiverQueue((uint64_t)a3, (uint64_t)v11, (uint64_t)self->_xpcCommandQueue, &self->_receiverQueue);
  BOOL v9 = ReceiverQueue;
  if (a4 && !ReceiverQueue) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCEffectsManager" code:-2143682558 userInfo:0];
  }
  return v9;
}

void *__49__VCEffectsManager_initializeReceiveQueue_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (void *)[*(id *)(a1 + 32) strong];
  if (result)
  {
    return (void *)[result remoteQueueOperationHandlerWithError:a2 operation:a3];
  }
  return result;
}

- (BOOL)createAllocators
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12[0] = xmmword_1E25A2FC0;
  v12[1] = unk_1E25A2FD0;
  int v2 = VCAllocatorMultiQueue_Create((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (uint64_t)"EffectsManagerBufferAllocator", 4u, (unint64_t *)v12, &self->_bufferAllocator);
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      objc_super v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        BOOL v9 = "-[VCEffectsManager createAllocators]";
        __int16 v10 = 1024;
        int v11 = 128;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create stream input allocator", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  return v2 == 0;
}

- (void)releaseAllocators
{
  bufferAllocator = self->_bufferAllocator;
  if (bufferAllocator) {
    CFRelease(bufferAllocator);
  }
}

- (void)setLastEffectsType:(int)a3
{
}

- (void)setLastEffectsType:(int)a3 shouldReport:(BOOL)a4
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_lastEffectsType != a3)
  {
    self->_lastEffectsType = a3;
    goto LABEL_5;
  }
  if (a4)
  {
LABEL_5:
    uint64_t v5 = @"VCEMEffectsType";
    v6[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [(VCEffectsManager *)self reportingAgent];
    reportingGenericEvent();
  }
}

- (VCEffectsManagerDelegate)delegate
{
  return (VCEffectsManagerDelegate *)objc_loadWeak(&self->_delegate);
}

void __VCEffectsManager_SharedManager_block_invoke()
{
  if (!VCEffectsManager_SharedManager__vcEffectsManager) {
    VCEffectsManager_SharedManager__vcEffectsManager = objc_alloc_init(VCEffectsManager);
  }
}

- (void)registerBlocksForService
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__VCEffectsManager_registerBlocksForService__block_invoke;
  v8[3] = &unk_1E6DB5FF8;
  v8[4] = v3;
  v8[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcEffectsInitialize", v8, self->_xpcCommandQueue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__VCEffectsManager_registerBlocksForService__block_invoke_33;
  v7[3] = &unk_1E6DB5478;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcEffectsClientQueue", v7, self->_xpcCommandQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __44__VCEffectsManager_registerBlocksForService__block_invoke_35;
  v6[3] = &unk_1E6DB5FF8;
  v6[4] = v3;
  v6[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcEffectsTerminate", v6, self->_xpcCommandQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__VCEffectsManager_registerBlocksForService__block_invoke_38;
  v5[3] = &unk_1E6DB5FF8;
  v5[4] = v3;
  v5[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcEffectsSetMode", v5, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __44__VCEffectsManager_registerBlocksForService__block_invoke_2, &unk_1E6DB5FF8, v3, self), "registerBlockForService:block:queue:", "vcEffectsSetEffectType", &v4, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:eventLogLevel:", "vcEffectsClientReleasedVideoFrame", &__block_literal_global_48, self->_xpcCommandQueue, 8);
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    [a2 objectForKeyedSubscript:@"CONTEXT"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        int v6 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v20 = v4;
            __int16 v21 = 2080;
            v22 = "-[VCEffectsManager registerBlocksForService]_block_invoke";
            __int16 v23 = 1024;
            int v24 = 199;
            _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client has died. Cleaning up VCEffectsMananger by removing associated objects", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_3();
        }
      }
      uint64_t v13 = [a2 objectForKeyedSubscript:@"CONTEXT"];
      v14 = (void *)[*(id *)(a1 + 32) strong];
      if (objc_msgSend((id)objc_msgSend(v14, "effectsArray"), "containsObject:", v13)) {
        objc_msgSend((id)objc_msgSend(v14, "effectsArray"), "removeObject:", v13);
      }
      if (objc_msgSend((id)objc_msgSend(v14, "effectsArray"), "count"))
      {
        v15 = objc_msgSend((id)objc_msgSend(v14, "effectsArray"), "firstObject");
        v16 = *(void **)(a1 + 40);
        uint64_t v17 = [v15 effectsType];
        v18 = v16;
      }
      else
      {
        objc_msgSend((id)objc_msgSend(v14, "delegate"), "setFaceMeshTrackingEnabled:", 0);
        objc_msgSend((id)objc_msgSend(v14, "delegate"), "setEffectsApplied:", 0);
        [v14 tearDownRemoteQueues];
        v18 = *(void **)(a1 + 40);
        uint64_t v17 = 0;
      }
      [v18 setLastEffectsType:v17];
    }
  }
  else
  {
    uint64_t v7 = objc_alloc_init(VCEffects);
    [(VCEffects *)v7 setEffectsMode:0];
    [*(id *)(a1 + 40) setLastEffectsType:0 shouldReport:1];
    __int16 v8 = (void *)[a2 objectForKeyedSubscript:@"CLIENTPID"];
    if (v8)
    {
      VCRemoteImageQueue_CreateSenderQueue([v8 intValue], (void *)(*(void *)(a1 + 40) + 208));
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 208);
      if (v9)
      {
        QueueXPCObject = (void *)VCRemoteImageQueue_CreateQueueXPCObject(v9);
        uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"CONTEXT", QueueXPCObject, @"USERXPCARGUMENTS", 0);
        xpc_release(QueueXPCObject);

        return v11;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_2();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_33(uint64_t a1, void *a2, uint64_t a3)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v6 = [a2 objectForKeyedSubscript:@"USERXPCARGUMENTS"];
    if (v6)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "initializeReceiveQueue:error:", v6, a3);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __44__VCEffectsManager_registerBlocksForService__block_invoke_33_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v5 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
    uint64_t v6 = [a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v7 = (void *)[*(id *)(a1 + 32) strong];
    if (objc_msgSend((id)objc_msgSend(v7, "effectsArray"), "containsObject:", v6)) {
      objc_msgSend((id)objc_msgSend(v7, "effectsArray"), "removeObject:", v6);
    }
    if (objc_msgSend((id)objc_msgSend(v7, "effectsArray"), "count"))
    {
      __int16 v8 = objc_msgSend((id)objc_msgSend(v7, "effectsArray"), "firstObject");
      uint64_t v9 = *(void **)(a1 + 40);
      uint64_t v10 = [v8 effectsType];
      uint64_t v11 = v9;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v7, "delegate"), "setFaceMeshTrackingEnabled:", 0);
      objc_msgSend((id)objc_msgSend(v7, "delegate"), "setEffectsApplied:", 0);
      [v7 tearDownRemoteQueues];
      uint64_t v11 = *(void **)(a1 + 40);
      uint64_t v10 = 0;
    }
    [v11 setLastEffectsType:v10];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        v18 = "-[VCEffectsManager registerBlocksForService]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 273;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d context is not a class of VCEffects", buf, 0x1Cu);
      }
    }
    return 0;
  }
  return v5;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_38(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v6 = (void *)[*(id *)(a1 + 32) strong];
    objc_msgSend(v5, "setEffectsMode:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcEffectsSetEffectsMode"), "intValue"));
    if (![v5 effectsMode])
    {
      [*(id *)(a1 + 40) setLastEffectsType:0];
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)(v7 + 136) = *MEMORY[0x1E4F1F9F8];
      *(void *)(v7 + 152) = *(void *)(v8 + 16);
      objc_msgSend((id)objc_msgSend(v6, "effectsArray"), "removeObjectIdenticalTo:", v5);
      if (!objc_msgSend((id)objc_msgSend(v6, "effectsArray"), "count"))
      {
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "setFaceMeshTrackingEnabled:", 0);
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "setEffectsApplied:", 0);
        [*(id *)(a1 + 40) resetEffectsLogging];
        VCRemoteImageQueue_ReleaseIOSurfaces([v6 senderQueue]);
      }
    }
    if ([v5 effectsMode]
      && (objc_msgSend((id)objc_msgSend(v6, "effectsArray"), "containsObject:", v5) & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(v6, "effectsArray"), "insertObject:atIndex:", v5, 0);
      objc_msgSend(v5, "setEffectsType:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcEffectsEffectsType"), "intValue"));
      objc_msgSend(*(id *)(a1 + 40), "setLastEffectsType:", objc_msgSend(v5, "effectsType"));
      objc_msgSend((id)objc_msgSend(v6, "delegate"), "setFaceMeshTrackingEnabled:", objc_msgSend(v5, "faceMeshTrackingEnabled"));
      objc_msgSend((id)objc_msgSend(v6, "delegate"), "setEffectsApplied:", objc_msgSend(v5, "effectsApplied"));
    }
  }
  return 0;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    id v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
    if ([v4 effectsMode])
    {
      objc_msgSend(v4, "setEffectsType:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcEffectsEffectsType"), "intValue"));
      objc_msgSend(*(id *)(a1 + 40), "setLastEffectsType:", objc_msgSend(v4, "effectsType"));
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "setFaceMeshTrackingEnabled:", objc_msgSend(v4, "faceMeshTrackingEnabled"));
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "setEffectsApplied:", objc_msgSend(v4, "effectsApplied"));
    }
  }
  return 0;
}

uint64_t __44__VCEffectsManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "releaseFrameWithTime:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcEffectsFrameTime"), "unsignedIntegerValue"));
  }
  return 0;
}

- (void)updateThermalLevel:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCEffectsManager_updateThermalLevel___block_invoke;
  block[3] = &unk_1E6DB3F08;
  int v5 = a3;
  block[4] = self;
  dispatch_async(xpcCommandQueue, block);
}

void __39__VCEffectsManager_updateThermalLevel___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  uint64_t v3 = *(_DWORD **)(a1 + 32);
  unsigned int v4 = v3[62];
  if (v2 > 0x1D)
  {
    if (v4 <= 0x1D)
    {
      [v3 setLastEffectsType:0];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = *(id *)(*(void *)(a1 + 32) + 32);
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v25 count:16];
      if (v7)
      {
        uint64_t v9 = v7;
        uint64_t v10 = *(void *)v27;
        *(void *)&long long v8 = 136315906;
        long long v15 = v8;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              uint64_t v13 = VRTraceErrorLogLevelToCSTR();
              v14 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v15;
                uint64_t v18 = v13;
                __int16 v19 = 2080;
                int v20 = "-[VCEffectsManager updateThermalLevel:]_block_invoke";
                __int16 v21 = 1024;
                int v22 = 410;
                __int16 v23 = 2112;
                int v24 = v12;
                _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Turning off effect: %@", buf, 0x26u);
              }
            }
            objc_msgSend(v12, "setEffectsMode:", 0, v15);
            objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "setFaceMeshTrackingEnabled:", 0);
            [*(id *)(*(void *)(a1 + 32) + 32) removeObjectIdenticalTo:v12];
            objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcEffectsServerTimeOut", 0, v12);
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v25 count:16];
        }
        while (v9);
      }
    }
  }
  else if (v4 >= 0x1E && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = v5;
      __int16 v19 = 2080;
      int v20 = "-[VCEffectsManager updateThermalLevel:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 405;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Turning effects back on is not supported", buf, 0x1Cu);
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 248) = *(_DWORD *)(a1 + 40);
}

- (void)tearDownRemoteQueues
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    unsigned int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      long long v8 = "-[VCEffectsManager tearDownRemoteQueues]";
      __int16 v9 = 1024;
      int v10 = 426;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Tearing down queues", (uint8_t *)&v5, 0x1Cu);
    }
  }
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_receiverQueue);
}

- (void)flushRemoteQueue
{
  v3[5] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__VCEffectsManager_flushRemoteQueue__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(xpcCommandQueue, v3);
}

uint64_t __36__VCEffectsManager_flushRemoteQueue__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  VCRemoteImageQueue_ReleaseIOSurfaces(*(void *)(*(void *)(a1 + 32) + 208));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v23;
    *(void *)&long long v4 = 136315906;
    long long v12 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * v7);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          int v10 = *MEMORY[0x1E4F47A50];
          uint64_t v11 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v12;
              uint64_t v14 = v9;
              __int16 v15 = 2080;
              uint64_t v16 = "-[VCEffectsManager flushRemoteQueue]_block_invoke";
              __int16 v17 = 1024;
              int v18 = 439;
              __int16 v19 = 2112;
              uint64_t v20 = v8;
              _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Notifying effects[%@] client to flush remote queue", buf, 0x26u);
            }
          }
          else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v12;
            uint64_t v14 = v9;
            __int16 v15 = 2080;
            uint64_t v16 = "-[VCEffectsManager flushRemoteQueue]_block_invoke";
            __int16 v17 = 1024;
            int v18 = 439;
            __int16 v19 = 2112;
            uint64_t v20 = v8;
            _os_log_debug_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Notifying effects[%@] client to flush remote queue", buf, 0x26u);
          }
        }
        objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", v12), "sendMessageAsync:arguments:context:", "vcEffectsFlushRemoteQueue", 0, v8);
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v2 countByEnumeratingWithState:&v22 objects:v21 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

CFIndex __VCEffectsManager_CapturedPixelBuffer_block_invoke(void *a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1[4] + 32);
  CFIndex result = CFArrayGetCount(v2);
  if (result >= 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v2, 0);
    if (ValueAtIndex) {
      ValueAtIndex = CFRetain(ValueAtIndex);
    }
    *(void *)(*(void *)(a1[5] + 8) + 40) = ValueAtIndex;
    CFIndex result = VCEffects_EffectsMode(*(void *)(*(void *)(a1[5] + 8) + 40));
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = result;
  }
  return result;
}

- (void)resetEffectsLogging
{
  p_loggingLock = &self->_loggingLock;
  pthread_mutex_lock(&self->_loggingLock);
  uint64_t v4 = MEMORY[0x1E4F1F9F8];
  long long v5 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_lastPrintTimestamp.value = *MEMORY[0x1E4F1F9F8];
  int64_t v6 = *(void *)(v4 + 16);
  self->_lastPrintTimestamp.epoch = v6;
  *(_OWORD *)&self->_lastReceivedTimestamp.value = v5;
  self->_lastReceivedTimestamp.epoch = v6;
  *(_OWORD *)&self->_lastSentTimestamp.value = v5;
  self->_lastSentTimestamp.epoch = v6;
  *(void *)&self->_droppedFrameCount = 0;
  *(void *)&self->_sentFrameCount = 0;

  pthread_mutex_unlock(p_loggingLock);
}

- (void)encodeProcessedPixelBuffer:(__CVBuffer *)a3 time:(id *)a4 imageData:(id)a5 processTime:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  pthread_mutex_lock(&self->_loggingLock);
  ++self->_receivedFrameCount;
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime((CMTime *)&v13, HostTimeClock);
  self->_lastReceivedTimestamp = v13;
  pthread_mutex_unlock(&self->_loggingLock);
  long long v12 = [(VCEffectsManager *)self delegate];
  $95D729B680665BEAEFA1D6FCA8238556 v13 = *($95D729B680665BEAEFA1D6FCA8238556 *)a4;
  [(VCEffectsManagerDelegate *)v12 encodeProcessedPixelBuffer:a3 time:&v13 imageData:a5 processTime:a6];
}

- (void)remoteQueueOperationHandlerWithError:(int)a3 operation:(FigRemoteOperation *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]();
      }
    }
  }
  else if (a4->var0 == 1)
  {
    memset(v20, 170, sizeof(v20));
    var0 = a4->var4.var0.var0;
    FigCFDictionaryGetCMTimeIfPresent();
    FigCFDictionaryGetFloatIfPresent();
    Value = CFDictionaryGetValue(var0, @"vcEffectsImageData");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      $95D729B680665BEAEFA1D6FCA8238556 v13 = *MEMORY[0x1E4F47A50];
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          lastReceivedPixelBuffer = self->_lastReceivedPixelBuffer;
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v12;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
          *(_WORD *)&buf[22] = 1024;
          int v22 = 631;
          __int16 v23 = 2048;
          long long v24 = lastReceivedPixelBuffer;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _lastReceivedPixelBuffer=%p", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        -[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]();
      }
    }
    uint64_t v16 = self->_lastReceivedPixelBuffer;
    if (v16)
    {
      LODWORD(v11) = -1;
      uint64_t v17 = [NSNumber numberWithFloat:v11];
      *(_OWORD *)buf = *(_OWORD *)v20;
      *(void *)&buf[16] = *(void *)&v20[16];
      [(VCEffectsManager *)self encodeProcessedPixelBuffer:v16 time:buf imageData:Value processTime:v17];
      CVPixelBufferRelease(self->_lastReceivedPixelBuffer);
      self->_lastReceivedPixelBuffer = 0;
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
        *(_WORD *)&buf[22] = 1024;
        int v22 = 637;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Expected sample buffer, received dictionary payload", buf, 0x1Cu);
      }
    }
  }
  else if (a4->var0 == 3)
  {
    if (self->_lastReceivedPixelBuffer)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
          *(_WORD *)&buf[22] = 1024;
          int v22 = 617;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Expected dictionary payload, received sample buffer", buf, 0x1Cu);
        }
      }
      CVPixelBufferRelease(self->_lastReceivedPixelBuffer);
    }
    ImageBuffer = CMSampleBufferGetImageBuffer(a4->var4.var0.var0);
    self->_lastReceivedPixelBuffer = ImageBuffer;
    CVPixelBufferRetain(ImageBuffer);
  }
}

- (void)effectsRegistered:(BOOL)a3
{
  if (a3)
  {
    self->_effectsRegistered = 1;
    uint64_t v3 = [(VCEffectsManager *)self delegate];
    [(VCEffectsManagerDelegate *)v3 setFaceMeshTrackingEnabled:1];
  }
}

- (void)setEffectsArray:(id)a3
{
}

- (opaqueVCRemoteImageQueue)senderQueue
{
  return self->_senderQueue;
}

- (id)reportingAgent
{
  return self->_reportingAgent;
}

- (void)setReportingAgent:(id)a3
{
}

void ___VCEffectsManager_PixelBufferToClient_block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 208)) {
    goto LABEL_13;
  }
  uint64_t v3 = *(__CVBuffer **)(a1 + 56);
  CFAllocatorRef v4 = *(const __CFAllocator **)(v2 + 224);
  CMTime lhs = *(CMTime *)(a1 + 72);
  CMSampleBufferRef SampleBufferWithPixelBuffer = VideoUtil_CreateSampleBufferWithPixelBuffer(v3, (uint64_t)&lhs, v4, v4);
  if (SampleBufferWithPixelBuffer)
  {
    CMSampleBufferRef v6 = SampleBufferWithPixelBuffer;
    uint64_t v7 = (_OWORD *)(a1 + 72);
    VCRemoteImageQueue_EnqueueFrame(*(void *)(*(void *)(a1 + 32) + 208), (unint64_t)SampleBufferWithPixelBuffer);
    CFRelease(v6);
    uint64_t v8 = *(__CVBuffer **)(a1 + 64);
    if (!v8)
    {
LABEL_6:
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      *(_OWORD *)&lhs.value = *v7;
      lhs.epoch = *(void *)(a1 + 88);
      FigCFDictionarySetCMTime();
      $95D729B680665BEAEFA1D6FCA8238556 v13 = *(void **)(a1 + 40);
      if (v13)
      {
        CFDataRef v14 = CFDataCreate(0, (const UInt8 *)[v13 bytes], objc_msgSend(*(id *)(a1 + 40), "length"));
        FigCFDictionarySetValue();
        VCRemoteImageQueue_EnqueueAttributes(*(void *)(*(void *)(a1 + 32) + 208), (unint64_t)Mutable);
        CFRelease(v14);
      }
      else
      {
        VCRemoteImageQueue_EnqueueAttributes(*(void *)(*(void *)(a1 + 32) + 208), (unint64_t)Mutable);
      }
      CFRelease(Mutable);
      uint64_t v2 = *(void *)(a1 + 32);
LABEL_13:
      pthread_mutex_lock((pthread_mutex_t *)(v2 + 48));
      __int16 v15 = (_OWORD *)(v2 + 112);
      if ((*(unsigned char *)(v2 + 124) & 1) == 0)
      {
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&lhs, HostTimeClock);
        _OWORD *v15 = *(_OWORD *)&lhs.value;
        *(void *)(v2 + 128) = lhs.epoch;
      }
      memset(&v32, 170, sizeof(v32));
      uint64_t v17 = CMClockGetHostTimeClock();
      CMClockGetTime(&v32, v17);
      CMTime lhs = v32;
      *(_OWORD *)&v30.value = *v15;
      v30.epoch = *(void *)(v2 + 128);
      CMTimeSubtract(&time, &lhs, &v30);
      double Seconds = CMTimeGetSeconds(&time);
      if (Seconds > 5.0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          uint64_t v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v21 = *(_DWORD *)(v2 + 188);
            int v22 = *(_DWORD *)(v2 + 192);
            LODWORD(lhs.value) = 136317186;
            int v23 = *(_DWORD *)(v2 + 196);
            int v24 = *(_DWORD *)(v2 + 200);
            *(CMTimeValue *)((char *)&lhs.value + 4) = v19;
            LOWORD(lhs.flags) = 2080;
            *(void *)((char *)&lhs.flags + 2) = "_VCEffectsManager_CheckEffectsHealth";
            HIWORD(lhs.epoch) = 1024;
            int v34 = 573;
            __int16 v35 = 1024;
            int v36 = v21;
            __int16 v37 = 2048;
            double v38 = (double)v21 / Seconds;
            __int16 v39 = 1024;
            int v40 = v22;
            __int16 v41 = 2048;
            double v42 = (double)v22 / Seconds;
            __int16 v43 = 1024;
            int v44 = v23;
            __int16 v45 = 1024;
            int v46 = v24;
            _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCEffectsManager Frames Sent: %d (%f FPS) Frames Received: %d (%f FPS) Frames Dropped: %d Frames Failed: %d", (uint8_t *)&lhs, 0x48u);
          }
        }
        _OWORD *v15 = *(_OWORD *)&v32.value;
        *(void *)(v2 + 128) = v32.epoch;
        if (*(int *)(v2 + 184) >= 31)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_2();
            }
          }
LABEL_23:
          int v25 = *(unsigned __int8 *)(v2 + 204);
          *(void *)(v2 + 196) = 0;
          *(void *)(v2 + 188) = 0;
          pthread_mutex_unlock((pthread_mutex_t *)(v2 + 48));
          if (!v25)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_1();
              }
            }
            [*(id *)(a1 + 48) setEffectsMode:0];
            [*(id *)(*(void *)(a1 + 32) + 32) removeObjectIdenticalTo:*(void *)(a1 + 48)];
            objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcEffectsServerTimeOut", 0, *(void *)(a1 + 48));
          }
          goto LABEL_32;
        }
        if (*(int *)(v2 + 188) >= 11 && !*(_DWORD *)(v2 + 192))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v26 = VRTraceErrorLogLevelToCSTR();
            long long v27 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v28 = *(_DWORD *)(v2 + 188);
              int v29 = *(_DWORD *)(v2 + 192);
              LODWORD(lhs.value) = 136316162;
              *(CMTimeValue *)((char *)&lhs.value + 4) = v26;
              LOWORD(lhs.flags) = 2080;
              *(void *)((char *)&lhs.flags + 2) = "_VCEffectsManager_CheckEffectsHealth";
              HIWORD(lhs.epoch) = 1024;
              int v34 = 582;
              __int16 v35 = 1024;
              int v36 = v28;
              __int16 v37 = 1024;
              LODWORD(v38) = v29;
              _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d Have not received frames from AVCEffects. Sent Frames: %d Received Frames: %d", (uint8_t *)&lhs, 0x28u);
            }
          }
          goto LABEL_23;
        }
        *(void *)(v2 + 188) = 0;
        *(void *)(v2 + 196) = 0;
      }
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 48));
LABEL_32:
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 64));
      return;
    }
    CFAllocatorRef v9 = *(const __CFAllocator **)(*(void *)(a1 + 32) + 224);
    *(_OWORD *)&lhs.value = *v7;
    lhs.epoch = *(void *)(a1 + 88);
    CMSampleBufferRef v10 = VideoUtil_CreateSampleBufferWithPixelBuffer(v8, (uint64_t)&lhs, v9, v9);
    if (v10)
    {
      CMSampleBufferRef v11 = v10;
      VCRemoteImageQueue_EnqueueFrame(*(void *)(*(void *)(a1 + 32) + 208), (unint64_t)v10);
      CFRelease(v11);
      goto LABEL_6;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_4();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_3();
    }
  }
}

void __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error getting the client pid", v2, v3, v4, v5, v6);
}

void __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RemoteImageQueue could not be made", v2, v3, v4, v5, v6);
}

void __44__VCEffectsManager_registerBlocksForService__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Client has died. Cleaning up VCEffectsMananger by removing associated objects", v2, v3, v4, v5, v6);
}

void __44__VCEffectsManager_registerBlocksForService__block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d xpcClientQueue was null, cannot make the remote queue", v2, v3, v4, v5, v6);
}

- (void)remoteQueueOperationHandlerWithError:operation:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  uint64_t v3 = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
  __int16 v4 = 1024;
  int v5 = 631;
  __int16 v6 = 2048;
  uint64_t v7 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d _lastReceivedPixelBuffer=%p", v2, 0x26u);
}

- (void)remoteQueueOperationHandlerWithError:operation:.cold.2()
{
  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(void *)&v4[6] = "-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Error received from the remote Queue. error=%d", v3, *(const char **)v4, (unint64_t)"-[VCEffectsManager remoteQueueOperationHandlerWithError:operation:]" >> 16, 611);
}

void ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Disabling effects mode", v2, v3, v4, v5, v6);
}

void ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&void v3[6] = "_VCEffectsManager_CheckEffectsHealth";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot send frames to AVCEffects. Consecutive Dropped frames: %d", v2, *(const char **)v3, (unint64_t)"_VCEffectsManager_CheckEffectsHealth" >> 16, 579);
}

void ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create sample buffer", v2, v3, v4, v5, v6);
}

void ___VCEffectsManager_PixelBufferToClient_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create sample buffer", v2, v3, v4, v5, v6);
}

@end