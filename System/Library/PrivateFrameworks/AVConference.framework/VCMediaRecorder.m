@interface VCMediaRecorder
+ (BOOL)deviceHasSufficientFreeSpace;
+ (BOOL)validateIncomingRequest:(id)a3;
+ (BOOL)validateNonzeroAudioRecordingLengthURL:(id)a3 error:(id *)a4;
+ (int)typeForRequest:(id)a3;
+ (unint64_t)countForRequestType:(int)a3 requestMode:(unsigned __int8)a4;
+ (unint64_t)deviceFreeDiskSpace;
- (BOOL)dispatchedAssertAudioStackStartedIfNeededForRequest:(id)a3;
- (BOOL)dispatchedProcessClientRequest:(id)a3 error:(id *)a4;
- (BOOL)isActive;
- (BOOL)isHistorySupported;
- (BOOL)processClientRequest:(id)a3 error:(id *)a4;
- (BOOL)usesClientToken;
- (BOOL)validateNumberOfRequestsWithError:(id *)a3;
- (VCMediaRecorder)initWithStreamToken:(unsigned int)a3 delegate:(id)a4 reportingAgent:(opaqueRTCReporting *)a5;
- (VideoAttributes)targetScreenAttributes;
- (id)dispatchedMediaRecorderDelegate;
- (id)dispatchedTransportDelegate;
- (id)endCompletionHandlerForRequest:(id)a3;
- (int)imageType;
- (int)videoCodec;
- (unsigned)capabilities;
- (void)addOrAmendRequest:(id)a3;
- (void)dealloc;
- (void)deregisterClient;
- (void)dispatchedCleanUpAllOutstandingRequests;
- (void)dispatchedProcessRequest:(id)a3;
- (void)dispatchedRemoveAsynchronousAudioAssertionIfNeeded;
- (void)dispatchedSetCapabilities:(unsigned int)a3;
- (void)handleInsufficientFreeSpaceWithRequest:(id)a3 delegate:(id)a4;
- (void)invalidate;
- (void)notifyFinishWithRequest:(id)a3 didSucceed:(BOOL)a4 fileSize:(int64_t)a5;
- (void)notifyLocalFinishWithRequest:(id)a3 didSucceed:(BOOL)a4 fileSize:(int64_t)a5;
- (void)notifyRemoteFinishWithRequest:(id)a3 didSucceed:(BOOL)a4 fileSize:(int64_t)a5;
- (void)printEndRecordingCheckpointWithMediaType:(unsigned __int8)a3;
- (void)processRemoteLivePhotoRequest:(id)a3;
- (void)processRemotePhotoRequest:(id)a3;
- (void)processRemoteRequest:(id)a3 withMediaType:(unsigned __int8)a4;
- (void)processRequest:(id)a3;
- (void)registerClient;
- (void)removeRequest:(id)a3;
- (void)reportingMediaRecorderLivePhotoWithRequest:(id)a3;
- (void)reportingMediaRecorderWithRequest:(id)a3 fileLength:(double)a4 fileSize:(unint64_t)a5;
- (void)setCapabilities:(unsigned int)a3;
- (void)setFrameRate:(float)a3;
- (void)setImageType:(int)a3;
- (void)setInitialRemoteScreenAttributes:(id)a3;
- (void)setMediaRecorderDelegate:(id)a3;
- (void)setTransportDelegate:(id)a3;
- (void)setUpReportingAgent;
- (void)setVideoCodec:(int)a3;
- (void)updateActiveStatus;
@end

@implementation VCMediaRecorder

- (VCMediaRecorder)initWithStreamToken:(unsigned int)a3 delegate:(id)a4 reportingAgent:(opaqueRTCReporting *)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCMediaRecorder;
  v8 = [(VCObject *)&v13 init];
  if (v8)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v8->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorder.stateQueue", 0, CustomRootQueue);
    v8->_streamToken = a3;
    [(VCMediaRecorder *)v8 setTransportDelegate:a4];
    v10 = VCDispatchQueue_GetCustomRootQueue(37);
    v8->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorder.notificationQueue", 0, v10);
    v8->_mode = 0;
    v8->_requests = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8->_transactionIDToRequestMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_mediaRecorderHistory = [[VCMediaRecorderHistory alloc] initWithDelegateQueue:v8->_stateQueue];
    v8->_isActive = 0;
    v8->_currentTimestamp = 0;
    if (a5)
    {
      v11 = (void *)CFRetain(a5);
      v8->super._reportingAgent = v11;
      if (v11)
      {
LABEL_7:
        v8->_lastHealthPrintCallAbsoluteSeconds = NAN;
        return v8;
      }
    }
    else
    {
      v8->super._reportingAgent = 0;
    }
    [(VCMediaRecorder *)v8 setUpReportingAgent];
    goto LABEL_7;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_transportDelegate, 0);
  delegateNotificationQueue = self->_delegateNotificationQueue;
  if (delegateNotificationQueue) {
    dispatch_release(delegateNotificationQueue);
  }
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)VCMediaRecorder;
  [(VCObject *)&v5 dealloc];
}

- (int)videoCodec
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 128;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__VCMediaRecorder_videoCodec__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__VCMediaRecorder_videoCodec__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 192) videoCodec];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setVideoCodec:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__VCMediaRecorder_setVideoCodec___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  int v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __33__VCMediaRecorder_setVideoCodec___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) setVideoCodec:*(unsigned int *)(a1 + 40)];
}

- (int)imageType
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__VCMediaRecorder_imageType__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(stateQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__VCMediaRecorder_imageType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 192) imageType];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setImageType:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__VCMediaRecorder_setImageType___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  int v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __32__VCMediaRecorder_setImageType___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) setImageType:*(unsigned int *)(a1 + 40)];
}

- (VideoAttributes)targetScreenAttributes
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCMediaRecorder_targetScreenAttributes__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(stateQueue, block);
  int v3 = (VideoAttributes *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __41__VCMediaRecorder_targetScreenAttributes__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 232);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setInitialRemoteScreenAttributes:(id)a3
{
  if (![a3 orientation])
  {
    VCMediaRecorder_UpdateTargetScreenAttributes((uint64_t)self, (uint64_t)a3);
  }
}

void __VCMediaRecorder_UpdateTargetScreenAttributes_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(const void **)(v3 + 232);
  if (v2 != v4)
  {
    if (v4)
    {
      CFRelease(v4);
      v2 = *(void **)(a1 + 32);
    }
    if (v2) {
      CFTypeRef v5 = CFRetain(v2);
    }
    else {
      CFTypeRef v5 = 0;
    }
    *(void *)(*(void *)(a1 + 40) + 232) = v5;
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
  }
  uint64_t v6 = *(void *)(v3 + 192);

  VCMediaRecorderHistory_UpdateTargetScreenAttributes(v6, v2);
}

- (void)addOrAmendRequest:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v5 = [a3 objectForKeyedSubscript:@"vcMomentsTransactionID"];
  transactionIDToRequestMap = self->_transactionIDToRequestMap;

  [(NSMutableDictionary *)transactionIDToRequestMap setObject:a3 forKeyedSubscript:v5];
}

- (void)removeRequest:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v5 = [a3 objectForKeyedSubscript:@"vcMomentsTransactionID"];
  transactionIDToRequestMap = self->_transactionIDToRequestMap;

  [(NSMutableDictionary *)transactionIDToRequestMap setObject:0 forKeyedSubscript:v5];
}

+ (BOOL)validateIncomingRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!+[VCHardwareSettings isMediaRecordingSupported])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      +[VCMediaRecorder validateIncomingRequest:]2();
    }
    goto LABEL_17;
  }
  uint64_t v4 = +[VCMediaRecorder typeForRequest:a3];
  uint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"vcMomentsRequestMode"];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      +[VCMediaRecorder validateIncomingRequest:]();
    }
    goto LABEL_17;
  }
  unsigned __int8 v6 = [v5 intValue];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      +[VCMediaRecorder validateIncomingRequest:]();
    }
    goto LABEL_17;
  }
  unsigned __int8 v7 = v6;
  unint64_t v8 = [a3 count];
  if (v8 > +[VCMediaRecorder countForRequestType:v4 requestMode:v7])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      int v13 = 136316418;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      v16 = "+[VCMediaRecorder validateIncomingRequest:]";
      __int16 v17 = 1024;
      int v18 = 254;
      __int16 v19 = 2048;
      uint64_t v20 = [a3 count];
      __int16 v21 = 1024;
      int v22 = v4;
      __int16 v23 = 1024;
      int v24 = v7;
      _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid count=%lu requestType=%u requestMode=%hhu", (uint8_t *)&v13, 0x32u);
    }
    goto LABEL_17;
  }
  if (![a3 objectForKeyedSubscript:@"vcMomentsTransactionID"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      +[VCMediaRecorder validateIncomingRequest:]();
    }
    goto LABEL_17;
  }
  if (![a3 objectForKeyedSubscript:@"vcMomentsRequestState"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      +[VCMediaRecorder validateIncomingRequest:].cold.4();
    }
    goto LABEL_17;
  }
  if (![a3 objectForKeyedSubscript:@"vcMomentsRequestTimestamp"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      +[VCMediaRecorder validateIncomingRequest:].cold.5();
    }
    goto LABEL_17;
  }
  if (![a3 objectForKeyedSubscript:@"vcMomentsMediaType"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      +[VCMediaRecorder validateIncomingRequest:].cold.6();
    }
    goto LABEL_17;
  }
  if (v4 != 1)
  {
    if ((v4 & 0xFFFFFFFE) == 4)
    {
      if (v7 != 1 && ![a3 objectForKeyedSubscript:@"vcMomentsRequesteeID"])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v9) {
            return v9;
          }
          +[VCMediaRecorder validateIncomingRequest:]1();
        }
        goto LABEL_17;
      }
      if (![a3 objectForKeyedSubscript:@"vcMomentsRequesterID"])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v9) {
            return v9;
          }
          +[VCMediaRecorder validateIncomingRequest:].cold.8();
        }
        goto LABEL_17;
      }
    }
    if (v4 == 5 || v4 == 3)
    {
      if (![a3 objectForKeyedSubscript:@"vcMomentsFileSize"])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v9) {
            return v9;
          }
          +[VCMediaRecorder validateIncomingRequest:].cold.9();
        }
        goto LABEL_17;
      }
      if (![a3 objectForKeyedSubscript:@"vcMomentsRequestDidSucceed"])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v9) {
            return v9;
          }
          +[VCMediaRecorder validateIncomingRequest:]0();
        }
        goto LABEL_17;
      }
    }
LABEL_26:
    LOBYTE(v9) = 1;
    return v9;
  }
  if ([a3 objectForKeyedSubscript:@"vcMomentsInitiatorID"]) {
    goto LABEL_26;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v9) {
      return v9;
    }
    +[VCMediaRecorder validateIncomingRequest:].cold.7();
  }
LABEL_17:
  LOBYTE(v9) = 0;
  return v9;
}

- (void)processRequest:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__VCMediaRecorder_processRequest___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __34__VCMediaRecorder_processRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedProcessRequest:*(void *)(a1 + 40)];
}

- (void)dispatchedProcessRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[VCMediaRecorder dispatchedProcessRequest:]");
  if (+[VCMediaRecorder validateIncomingRequest:a3])
  {
    self->_mode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestMode"), "intValue");
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
    unsigned __int8 v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(v5, "objectForKeyedSubscript:", @"vcMomentsTransactionID"));
    if (v6)
    {
      unsigned __int8 v7 = v6;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v6, "UUIDString"), @"vcMomentsTransactionID");

      if ([(NSMutableSet *)self->_requests containsObject:v5])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          BOOL v9 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 136315906;
            uint64_t v14 = v8;
            __int16 v15 = 2080;
            v16 = "-[VCMediaRecorder dispatchedProcessRequest:]";
            __int16 v17 = 1024;
            int v18 = 318;
            __int16 v19 = 2112;
            uint64_t v20 = [v5 objectForKeyedSubscript:@"vcMomentsTransactionID"];
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaRecorder request %@ is processed, ignoring the duplicate", (uint8_t *)&v13, 0x26u);
          }
        }
      }
      else
      {
        [(NSMutableSet *)self->_requests addObject:v5];
        unsigned __int8 v12 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"vcMomentsMediaType"), "intValue");
        switch(v12)
        {
          case 1u:
            [(VCMediaRecorder *)self processRemotePhotoRequest:v5];
            break;
          case 2u:
          case 4u:
          case 5u:
            [(VCMediaRecorder *)self processRemoteRequest:v5 withMediaType:v12];
            break;
          case 3u:
            [(VCMediaRecorder *)self processRemoteLivePhotoRequest:v5];
            break;
          default:
            return;
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(VCMediaRecorder *)v10 dispatchedProcessRequest:v11];
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaRecorder dispatchedProcessRequest:]();
    }
  }
}

- (unsigned)capabilities
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__VCMediaRecorder_capabilities__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(stateQueue, block);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__VCMediaRecorder_capabilities__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 200);
  return result;
}

- (void)setCapabilities:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__VCMediaRecorder_setCapabilities___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __35__VCMediaRecorder_setCapabilities___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetCapabilities:*(unsigned int *)(a1 + 40)];
}

- (void)dispatchedSetCapabilities:(unsigned int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  unsigned int capabilities = self->_capabilities;
  if (+[VCMediaRecorder deviceHasSufficientFreeSpace]) {
    unsigned int v6 = a3;
  }
  else {
    unsigned int v6 = 0;
  }
  self->_unsigned int capabilities = v6;
  if (v6 != capabilities)
  {
    id v7 = [(VCMediaRecorder *)self dispatchedMediaRecorderDelegate];
    uint64_t streamToken = self->_streamToken;
    unsigned int v9 = self->_capabilities;
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__VCMediaRecorder_dispatchedSetCapabilities___block_invoke;
    block[3] = &unk_1E6DB3F58;
    block[4] = v7;
    void block[5] = streamToken;
    unsigned int v15 = v9;
    dispatch_async(delegateNotificationQueue, block);
  }
  [(VCMediaRecorder *)self updateActiveStatus];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    unsigned __int8 v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = self->_capabilities;
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v11;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCMediaRecorder dispatchedSetCapabilities:]";
      __int16 v20 = 1024;
      int v21 = 371;
      __int16 v22 = 1024;
      unsigned int v23 = v13;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaRecorder set capabilities %d", buf, 0x22u);
    }
  }
}

uint64_t __45__VCMediaRecorder_dispatchedSetCapabilities___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 40) didUpdateCapabilities:*(unsigned int *)(a1 + 48)];
}

- (void)setFrameRate:(float)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__VCMediaRecorder_setFrameRate___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  float v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __32__VCMediaRecorder_setFrameRate___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 192) setFrameRate:a2];
}

- (id)dispatchedTransportDelegate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);

  return objc_loadWeak(&self->_transportDelegate);
}

- (void)setTransportDelegate:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VCMediaRecorder_setTransportDelegate___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(stateQueue, block);
}

id __40__VCMediaRecorder_setTransportDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 176), *(id *)(a1 + 40));
}

- (id)dispatchedMediaRecorderDelegate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);

  return objc_loadWeak(&self->_delegate);
}

- (void)setMediaRecorderDelegate:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCMediaRecorder_setMediaRecorderDelegate___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(stateQueue, block);
}

void __44__VCMediaRecorder_setMediaRecorderDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 168), *(id *)(a1 + 40));
  if (!*(void *)(a1 + 40))
  {
    v2 = *(NSObject **)(*(void *)(a1 + 32) + 216);
    dispatch_sync(v2, &__block_literal_global_31);
  }
}

- (BOOL)processClientRequest:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCMediaRecorder_processClientRequest_error___block_invoke;
  block[3] = &unk_1E6DB64C0;
  block[4] = self;
  void block[5] = a3;
  void block[6] = &v8;
  void block[7] = a4;
  dispatch_sync(stateQueue, block);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __46__VCMediaRecorder_processClientRequest_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dispatchedProcessClientRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)dispatchedProcessClientRequest:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  self->_int mode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestMode"), "intValue");
  uint64_t v6 = (void *)[a3 mutableCopy];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_currentTimestamp), @"vcMomentsRequestTimestamp");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int mode = self->_mode;
      unsigned int currentTimestamp = self->_currentTimestamp;
      *(_DWORD *)buf = 136316418;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCMediaRecorder dispatchedProcessClientRequest:error:]";
      __int16 v20 = 1024;
      int v21 = 425;
      __int16 v22 = 1024;
      int v23 = mode;
      __int16 v24 = 1024;
      unsigned int v25 = currentTimestamp;
      __int16 v26 = 2112;
      id v27 = a3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%d, timestamp=%d, request=%@", buf, 0x32u);
    }
  }
  int v11 = self->_mode;
  if (v11 == 1)
  {
    [(VCMediaRecorder *)self dispatchedProcessRequest:v6];
  }
  else if (v11 == 2)
  {
    id v12 = [(VCMediaRecorder *)self dispatchedTransportDelegate];
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__VCMediaRecorder_dispatchedProcessClientRequest_error___block_invoke;
    block[3] = &unk_1E6DB43D8;
    block[4] = v12;
    void block[5] = self;
    void block[6] = a3;
    dispatch_async(delegateNotificationQueue, block);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue") == 3)-[VCMediaRecorderHistory cancelRequestWithTransactionID:](self->_mediaRecorderHistory, "cancelRequestWithTransactionID:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsTransactionID")); {

  }
  return 0;
}

uint64_t __56__VCMediaRecorder_dispatchedProcessClientRequest_error___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  unsigned int v3 = (void *)a1[6];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"vcMomentsRequesteeID"];

  return [v1 mediaRecorder:v2 shouldProcessRequest:v3 recipientID:v4];
}

- (void)printEndRecordingCheckpointWithMediaType:(unsigned __int8)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFStringRef v4 = VCMediaRecorderUtil_CopyDescriptionForMediaType((const __CFAllocator *)*MEMORY[0x1E4F1CF80], a3);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCMediaRecorder-endRecording");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCMediaRecorder printEndRecordingCheckpointWithMediaType:]";
      __int16 v11 = 1024;
      int v12 = 454;
      __int16 v13 = 2112;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      CFStringRef v16 = v4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorder-endRecording instance=%@, mediaType=%@", (uint8_t *)&v7, 0x30u);
    }
  }
  if (v4) {
    CFRelease(v4);
  }
}

- (void)dispatchedCleanUpAllOutstandingRequests
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_currentActiveRequestsCount)
  {
    self->_lastRequest = 1;
    unsigned int currentTimestamp = self->_currentTimestamp;
    transactionIDToRequestMap = self->_transactionIDToRequestMap;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__VCMediaRecorder_dispatchedCleanUpAllOutstandingRequests__block_invoke_2;
    v18[3] = &unk_1E6DB64E8;
    v18[4] = self;
    unsigned int v19 = currentTimestamp;
    [(NSMutableDictionary *)transactionIDToRequestMap enumerateKeysAndObjectsUsingBlock:v18];
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
    VCMediaRecorderHistory_StopProcessingAllRequests((uint64_t)self->_mediaRecorderHistory);
    return;
  }
  if ((VCMediaRecorder *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_14;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    unsigned int streamToken = self->_streamToken;
    *(_DWORD *)buf = 136315906;
    uint64_t v22 = v6;
    __int16 v23 = 2080;
    __int16 v24 = "-[VCMediaRecorder dispatchedCleanUpAllOutstandingRequests]";
    __int16 v25 = 1024;
    int v26 = 467;
    __int16 v27 = 1024;
    LODWORD(v28) = streamToken;
    __int16 v9 = " [%s] %s:%d No active requests for token=%d";
    uint64_t v10 = v7;
    uint32_t v11 = 34;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCMediaRecorder *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_14;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    unsigned int v14 = self->_streamToken;
    *(_DWORD *)buf = 136316418;
    uint64_t v22 = v12;
    __int16 v23 = 2080;
    __int16 v24 = "-[VCMediaRecorder dispatchedCleanUpAllOutstandingRequests]";
    __int16 v25 = 1024;
    int v26 = 467;
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    __int16 v29 = 2048;
    v30 = self;
    __int16 v31 = 1024;
    unsigned int v32 = v14;
    __int16 v9 = " [%s] %s:%d %@(%p) No active requests for token=%d";
    uint64_t v10 = v13;
    uint32_t v11 = 54;
  }
  _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_14:
  id v15 = [(VCMediaRecorder *)self dispatchedMediaRecorderDelegate];
  uint64_t v16 = self->_streamToken;
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VCMediaRecorder_dispatchedCleanUpAllOutstandingRequests__block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = v15;
  void block[5] = v16;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __58__VCMediaRecorder_dispatchedCleanUpAllOutstandingRequests__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamTokenDidCleanupAllRequests:*(void *)(a1 + 40)];
}

void __58__VCMediaRecorder_dispatchedCleanUpAllOutstandingRequests__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  char v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue");
  unsigned __int8 v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsMediaType"), "intValue");
  if (v6 == 1)
  {
    unsigned __int8 v8 = v7;
    id v9 = (id)[a3 mutableCopy];
    [v9 setObject:&unk_1F3DC4110 forKeyedSubscript:@"vcMomentsRequestState"];
    [*(id *)(a1 + 32) printEndRecordingCheckpointWithMediaType:v8];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 192), "endRecording:timestamp:completionHandler:", a2, *(unsigned int *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "endCompletionHandlerForRequest:", v9));
  }
}

- (void)dispatchedRemoveAsynchronousAudioAssertionIfNeeded
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  int currentActiveRequestsCount = self->_currentActiveRequestsCount;
  CFStringRef v4 = [(VCMediaRecorder *)self dispatchedTransportDelegate];
  unsigned int streamToken = (__CFString *)self->_streamToken;
  v16[0] = 0xAAAAAAAAAAAAAA01;
  v16[1] = &streamToken;
  id v15 = 0;
  if (currentActiveRequestsCount) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5) {
    return;
  }
  char v6 = v4;
  if ([(VCMediaRecorder *)v4 actionDidFinishForContext:v16 withError:&v15])
  {
    if (!v15) {
      return;
    }
  }
  if ((VCMediaRecorder *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    id v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v19 = v8;
    __int16 v20 = 2080;
    int v21 = "-[VCMediaRecorder dispatchedRemoveAsynchronousAudioAssertionIfNeeded]";
    __int16 v22 = 1024;
    int v23 = 514;
    __int16 v24 = 2048;
    __int16 v25 = streamToken;
    __int16 v26 = 2112;
    __int16 v27 = v6;
    __int16 v28 = 2112;
    __int16 v29 = v15;
    uint64_t v10 = " [%s] %s:%d Failed to remove assertion on audio for token=%ld on transportDelegate=%@ with error=%@";
    uint32_t v11 = v9;
    uint32_t v12 = 58;
LABEL_18:
    _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v7 = (__CFString *)[(VCMediaRecorder *)self performSelector:sel_logPrefix];
  }
  else {
    unsigned __int8 v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    unsigned int v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316930;
      uint64_t v19 = v13;
      __int16 v20 = 2080;
      int v21 = "-[VCMediaRecorder dispatchedRemoveAsynchronousAudioAssertionIfNeeded]";
      __int16 v22 = 1024;
      int v23 = 514;
      __int16 v24 = 2112;
      __int16 v25 = v7;
      __int16 v26 = 2048;
      __int16 v27 = self;
      __int16 v28 = 2048;
      __int16 v29 = streamToken;
      __int16 v30 = 2112;
      __int16 v31 = v6;
      __int16 v32 = 2112;
      uint64_t v33 = v15;
      uint64_t v10 = " [%s] %s:%d %@(%p) Failed to remove assertion on audio for token=%ld on transportDelegate=%@ with error=%@";
      uint32_t v11 = v14;
      uint32_t v12 = 78;
      goto LABEL_18;
    }
  }
}

- (id)endCompletionHandlerForRequest:(id)a3
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__VCMediaRecorder_endCompletionHandlerForRequest___block_invoke;
  v4[3] = &unk_1E6DB6538;
  v4[4] = self;
  v4[5] = a3;
  return (id)[v4 copy];
}

uint64_t __50__VCMediaRecorder_endCompletionHandlerForRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 208));
  uint64_t v6 = [*(id *)(a1 + 32) dispatchedMediaRecorderDelegate];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(unsigned int *)(v7 + 184);
  if (*(unsigned char *)(v7 + 256)) {
    BOOL v9 = (*(_DWORD *)(v7 + 224))-- == 1;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"vcMediaRecorderDirectoryURL"];
  unint64_t v11 = +[VCFileUtil sizeOfFile:a3];
  +[VCFileUtil contentLengthOfFile:a3];
  double v13 = v12;
  if (!+[VCMediaRecorder validateNonzeroAudioRecordingLengthURL:a3 error:&v21]&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    id v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = v14;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCMediaRecorder endCompletionHandlerForRequest:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 528;
      __int16 v28 = 2112;
      uint64_t v29 = a3;
      __int16 v30 = 2112;
      uint64_t v31 = v21;
      _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed audio recording length validation movieURL=%@, error=%@", buf, 0x30u);
    }
  }
  [*(id *)(a1 + 32) reportingMediaRecorderWithRequest:*(void *)(a1 + 40) fileLength:v11 fileSize:v13];
  uint64_t v16 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCMediaRecorder_endCompletionHandlerForRequest___block_invoke_51;
  block[3] = &unk_1E6DB6510;
  BOOL v19 = v10 == 0;
  block[4] = a3;
  void block[5] = v6;
  void block[6] = *(void *)(a1 + 40);
  void block[7] = v21;
  void block[8] = v8;
  BOOL v20 = v9;
  dispatch_async(v16, block);
  [*(id *)(a1 + 32) notifyFinishWithRequest:*(void *)(a1 + 40) didSucceed:v21 == 0 fileSize:v11];
  [*(id *)(a1 + 32) removeRequest:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) dispatchedRemoveAsynchronousAudioAssertionIfNeeded];
}

uint64_t __50__VCMediaRecorder_endCompletionHandlerForRequest___block_invoke_51(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v5[0] = 0;
  v5[1] = v3;
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  LOBYTE(v6) = *(unsigned char *)(a1 + 72);
  uint64_t result = [v2 streamToken:*(void *)(a1 + 64) didEndProcessingRequest:*(void *)(a1 + 48) urlContext:v5 error:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 73)) {
    return [*(id *)(a1 + 40) streamTokenDidCleanupAllRequests:*(void *)(a1 + 64)];
  }
  return result;
}

void __VCMediaRecorder_StopProcessingAllRequests_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 208));
  uint64_t v2 = *(void *)(v1 + 192);

  VCMediaRecorderHistory_StopProcessingAllRequests(v2);
}

void __VCMediaRecorder_ClearHistoryBuffer_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 208));
  ++*(void *)(v1 + 320);
  *(void *)(v1 + 280) = *(void *)(v1 + 272);
  *(void *)(v1 + 296) = *(void *)(v1 + 288);
  *(void *)(v1 + 312) = *(void *)(v1 + 304);
  uint64_t v2 = *(void *)(v1 + 192);

  VCMediaRecorderHistory_ClearHistoryBuffer(v2);
}

- (void)registerClient
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    CFStringRef v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCMediaRecorder registerClient]";
      __int16 v11 = 1024;
      int v12 = 588;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__VCMediaRecorder_registerClient__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __33__VCMediaRecorder_registerClient__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 229) = 1;
  return [*(id *)(a1 + 32) updateActiveStatus];
}

- (void)deregisterClient
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    CFStringRef v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCMediaRecorder deregisterClient]";
      __int16 v9 = 1024;
      int v10 = 597;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  self->_isClientRegistered = 0;
  [(VCMediaRecorder *)self updateActiveStatus];
}

- (void)invalidate
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__VCMediaRecorder_invalidate__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(stateQueue, v3);
}

uint64_t __29__VCMediaRecorder_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) deregisterClient];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 dispatchedCleanUpAllOutstandingRequests];
}

- (BOOL)usesClientToken
{
  return 1;
}

- (void)updateActiveStatus
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  BOOL isActive = self->_isActive;
  LOBYTE(capabilities) = self->_isClientRegistered;
  if ((_BYTE)capabilities)
  {
    if ([(VCMediaRecorder *)self isHistorySupported])
    {
      unsigned int capabilities = self->_capabilities;
      if (capabilities)
      {
        VCMediaRecorderHistory_UpdateTargetScreenAttributes((uint64_t)self->_mediaRecorderHistory, self->_targetScreenAttributes);
        LOBYTE(capabilities) = 1;
      }
    }
    else
    {
      LOBYTE(capabilities) = 0;
    }
  }
  self->_BOOL isActive = capabilities;
  if (self->_isActive != isActive)
  {
    if ((VCMediaRecorder *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        __int16 v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL v8 = self->_isActive;
          int v15 = 136315906;
          uint64_t v16 = v6;
          __int16 v17 = 2080;
          __int16 v18 = "-[VCMediaRecorder updateActiveStatus]";
          __int16 v19 = 1024;
          int v20 = 625;
          __int16 v21 = 1024;
          LODWORD(v22) = v8;
          __int16 v9 = " [%s] %s:%d isActive=%{BOOL}d";
          int v10 = v7;
          uint32_t v11 = 34;
LABEL_17:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v5 = (__CFString *)[(VCMediaRecorder *)self performSelector:sel_logPrefix];
      }
      else {
        int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL v14 = self->_isActive;
          int v15 = 136316418;
          uint64_t v16 = v12;
          __int16 v17 = 2080;
          __int16 v18 = "-[VCMediaRecorder updateActiveStatus]";
          __int16 v19 = 1024;
          int v20 = 625;
          __int16 v21 = 2112;
          __int16 v22 = v5;
          __int16 v23 = 2048;
          __int16 v24 = self;
          __int16 v25 = 1024;
          BOOL v26 = v14;
          __int16 v9 = " [%s] %s:%d %@(%p) isActive=%{BOOL}d";
          int v10 = v13;
          uint32_t v11 = 54;
          goto LABEL_17;
        }
      }
    }
  }
}

- (void)setUpReportingAgent
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((VCMediaRecorder *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCMediaRecorder *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v13 = v9;
    LOWORD(v14) = 2080;
    *(void *)((char *)&v14 + 2) = "-[VCMediaRecorder setUpReportingAgent]";
    WORD5(v14) = 1024;
    HIDWORD(v14) = 630;
    *(_WORD *)int v15 = 2112;
    *(void *)&v15[2] = v3;
    *(_WORD *)&v15[10] = 2048;
    *(void *)&v15[12] = self;
    uint64_t v6 = " [%s] %s:%d %@(%p) Register Reporting Agent";
    __int16 v7 = v10;
    uint32_t v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    int v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = v4;
      LOWORD(v14) = 2080;
      *(void *)((char *)&v14 + 2) = "-[VCMediaRecorder setUpReportingAgent]";
      WORD5(v14) = 1024;
      HIDWORD(v14) = 630;
      uint64_t v6 = " [%s] %s:%d Register Reporting Agent";
      __int16 v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  *(_DWORD *)buf = VCUniqueIDGenerator_GenerateID();
  *(void *)&long long v14 = 0;
  uint64_t v13 = 0;
  *((void *)&v14 + 1) = 0x700000000;
  memset(v15, 0, sizeof(v15));
  Agent = (const void *)reportingCreateAgent();
  [(VCObject *)self setReportingAgent:Agent];
  if (Agent) {
    CFRelease(Agent);
  }
  [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  [(VCObject *)self reportingAgent];
  reportingSetUserInfo();
}

void __38__VCMediaRecorder_setUpReportingAgent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![a2 count])
  {
    [*(id *)(a1 + 32) strong];
    uint64_t v3 = objc_opt_class();
    if (v3 == [*(id *)(a1 + 32) strong])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __38__VCMediaRecorder_setUpReportingAgent__block_invoke_cold_1();
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) strong];
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = [*(id *)(a1 + 32) strong];
          int v8 = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          uint32_t v11 = "-[VCMediaRecorder setUpReportingAgent]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 642;
          __int16 v14 = 2112;
          int v15 = v4;
          __int16 v16 = 2048;
          uint64_t v17 = v7;
          _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Reporting not available (no backends)", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
}

- (void)reportingMediaRecorderLivePhotoWithRequest:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  unsigned __int8 v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue");
  unsigned __int8 v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsMediaType"), "intValue");
  uint64_t v6 = [a3 objectForKeyedSubscript:@"vcMomentsRequesteeID"];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsFileSize"), "longLongValue");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestDidSucceed"), "BOOLValue");
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v4), @"VCMRState");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v5), @"VCMRMediaType");
  if (v6) {
    uint64_t v9 = (__CFString *)v6;
  }
  else {
    uint64_t v9 = &stru_1F3D3E450;
  }
  [v10 setObject:v9 forKeyedSubscript:@"VCMRRecipientUUID"];
  [v10 setObject:&unk_1F3DC4128 forKeyedSubscript:@"VCMRMode"];
  if ([a3 objectForKeyedSubscript:@"vcMomentsFileSize"]) {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v7), @"VCMRFileSize");
  }
  if ([a3 objectForKeyedSubscript:@"vcMomentsRequestDidSucceed"]) {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v8), @"VCMRFinishDidSucceed");
  }
  reportingMediaRecorderEvents();
}

- (void)reportingMediaRecorderWithRequest:(id)a3 fileLength:(double)a4 fileSize:(unint64_t)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  unsigned __int8 v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue");
  unsigned __int8 v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsMediaType"), "intValue");
  uint64_t v10 = [a3 objectForKeyedSubscript:@"vcMomentsRequesteeID"];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v8), @"VCMRState");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v9), @"VCMRMediaType");
  if (v10) {
    uint32_t v11 = (__CFString *)v10;
  }
  else {
    uint32_t v11 = &stru_1F3D3E450;
  }
  [v15 setObject:v11 forKeyedSubscript:@"VCMRRecipientUUID"];
  [v15 setObject:&unk_1F3DC4140 forKeyedSubscript:@"VCMRMode"];
  if (v8 == 4)
  {
    uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestDidSucceed"), "BOOLValue");
    uint64_t v12 = [NSNumber numberWithBool:v14];
    int v13 = @"VCMRFinishDidSucceed";
  }
  else
  {
    if (v8 != 2) {
      goto LABEL_9;
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a5), @"VCMRFileSize");
    uint64_t v12 = [NSNumber numberWithDouble:a4];
    int v13 = @"VCMRFileLength";
  }
  [v15 setObject:v12 forKeyedSubscript:v13];
LABEL_9:
  reportingMediaRecorderEvents();
}

- (BOOL)dispatchedAssertAudioStackStartedIfNeededForRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v21 = 0;
  unsigned __int8 v5 = [(VCMediaRecorder *)self dispatchedTransportDelegate];
  unsigned int streamToken = (__CFString *)self->_streamToken;
  BOOL result = 1;
  v19[0] = 0xAAAAAAAAAAAAAA01;
  v19[1] = &streamToken;
  if (self->_currentActiveRequestsCount <= 0 && v5 != 0)
  {
    if ([(VCMediaRecorder *)v5 actionWillBeginForContext:v19 withError:&v21]&& !v21)
    {
      return 1;
    }
    id v8 = [(VCMediaRecorder *)self dispatchedMediaRecorderDelegate];
    if ((VCMediaRecorder *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_17;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint32_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = v10;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCMediaRecorder dispatchedAssertAudioStackStartedIfNeededForRequest:]";
      __int16 v26 = 1024;
      int v27 = 722;
      __int16 v28 = 2048;
      uint64_t v29 = streamToken;
      __int16 v30 = 2112;
      uint64_t v31 = v5;
      uint64_t v12 = " [%s] %s:%d Failed to assert audio stack with token=%ld for delegate=%@";
      int v13 = v11;
      uint32_t v14 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned __int8 v9 = (__CFString *)[(VCMediaRecorder *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned __int8 v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_17;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v15;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCMediaRecorder dispatchedAssertAudioStackStartedIfNeededForRequest:]";
      __int16 v26 = 1024;
      int v27 = 722;
      __int16 v28 = 2112;
      uint64_t v29 = v9;
      __int16 v30 = 2048;
      uint64_t v31 = self;
      __int16 v32 = 2048;
      uint64_t v33 = streamToken;
      __int16 v34 = 2112;
      v35 = v5;
      uint64_t v12 = " [%s] %s:%d %@(%p) Failed to assert audio stack with token=%ld for delegate=%@";
      int v13 = v16;
      uint32_t v14 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_17:
    delegateNotificationQueue = self->_delegateNotificationQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__VCMediaRecorder_dispatchedAssertAudioStackStartedIfNeededForRequest___block_invoke;
    v18[3] = &unk_1E6DB6560;
    v18[4] = v8;
    void v18[5] = a3;
    v18[6] = v21;
    v18[7] = streamToken;
    dispatch_async(delegateNotificationQueue, v18);
    return 0;
  }
  return result;
}

uint64_t __71__VCMediaRecorder_dispatchedAssertAudioStackStartedIfNeededForRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 56) didStartProcessingRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)processRemoteRequest:(id)a3 withMediaType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = [a3 objectForKeyedSubscript:@"vcMomentsTransactionID"];
  char v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue");
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestTimestamp"), "intValue");
  uint64_t streamToken = self->_streamToken;
  id v11 = [(VCMediaRecorder *)self dispatchedMediaRecorderDelegate];
  switch(v8)
  {
    case 1:
      if (+[VCMediaRecorder deviceHasSufficientFreeSpace])
      {
        if ([(VCMediaRecorder *)self dispatchedAssertAudioStackStartedIfNeededForRequest:a3])
        {
          uint64_t v12 = [[VCMediaRecorderHistoryRequestContext alloc] initWithSerializedRequest:a3];
          MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCMediaRecorder-startRecording");
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            uint32_t v14 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v24 = v13;
              __int16 v25 = 2080;
              __int16 v26 = "-[VCMediaRecorder processRemoteRequest:withMediaType:]";
              __int16 v27 = 1024;
              int v28 = 747;
              __int16 v29 = 2112;
              __int16 v30 = self;
              __int16 v31 = 2112;
              __int16 v32 = v12;
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorder-startRecording instance=%@, requestContext=%@", buf, 0x30u);
            }
          }
          mediaRecorderHistory = self->_mediaRecorderHistory;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke;
          v22[3] = &unk_1E6DB6588;
          v22[4] = self;
          v22[5] = a3;
          v22[6] = v11;
          v22[7] = streamToken;
          [(VCMediaRecorderHistory *)mediaRecorderHistory startRecordingWithContext:v12 completionHandler:v22];
        }
      }
      else
      {
        [(VCMediaRecorder *)self handleInsufficientFreeSpaceWithRequest:a3 delegate:v11];
      }
      break;
    case 2:
      [(VCMediaRecorder *)self printEndRecordingCheckpointWithMediaType:v4];
      [(VCMediaRecorder *)self addOrAmendRequest:a3];
      __int16 v16 = self->_mediaRecorderHistory;
      id v17 = [(VCMediaRecorder *)self endCompletionHandlerForRequest:a3];
      [(VCMediaRecorderHistory *)v16 endRecording:v7 timestamp:v9 completionHandler:v17];
      break;
    case 3:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_4;
      v20[3] = &unk_1E6DB5450;
      v20[5] = a3;
      v20[6] = streamToken;
      v20[4] = v11;
      __int16 v19 = v20;
      goto LABEL_13;
    case 4:
      [(VCMediaRecorder *)self reportingMediaRecorderWithRequest:a3 fileLength:0 fileSize:0.0];
      delegateNotificationQueue = self->_delegateNotificationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_3;
      block[3] = &unk_1E6DB5450;
      block[4] = a3;
      void block[5] = v11;
      void block[6] = streamToken;
      __int16 v19 = block;
LABEL_13:
      dispatch_async(delegateNotificationQueue, v19);
      break;
    default:
      return;
  }
}

void __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 208));
  if (!a2)
  {
    ++*(_DWORD *)(*(void *)(a1 + 32) + 224);
    [*(id *)(a1 + 32) addOrAmendRequest:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) reportingMediaRecorderWithRequest:*(void *)(a1 + 40) fileLength:0 fileSize:0.0];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_2;
  block[3] = &unk_1E6DB6560;
  uint64_t v5 = *(void *)(a1 + 56);
  int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  uint64_t v8 = a2;
  uint64_t v9 = v5;
  dispatch_async(v4, block);
}

uint64_t __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 56) didStartProcessingRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"vcMomentsRequestDidSucceed"), "BOOLValue");
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);

  return [v3 streamToken:v4 didFinishRequest:v5 didSucceed:v2];
}

uint64_t __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 48) didFinishRequest:*(void *)(a1 + 40) didSucceed:0];
}

- (void)processRemoteLivePhotoRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[VCMediaRecorder processRemoteLivePhotoRequest:]");
  uint64_t streamToken = self->_streamToken;
  id v6 = [(VCMediaRecorder *)self dispatchedMediaRecorderDelegate];
  uint64_t v25 = 0;
  int v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue");
  switch(v7)
  {
    case 4:
      [(VCMediaRecorder *)self reportingMediaRecorderLivePhotoWithRequest:a3];
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2_88;
      v20[3] = &unk_1E6DB5450;
      v20[4] = a3;
      v20[5] = v6;
      v20[6] = streamToken;
      uint64_t v15 = v20;
      goto LABEL_12;
    case 3:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_3;
      v19[3] = &unk_1E6DB5450;
      v19[5] = a3;
      v19[6] = streamToken;
      v19[4] = v6;
      uint64_t v15 = v19;
LABEL_12:
      dispatch_async(delegateNotificationQueue, v15);
      return;
    case 1:
      if (+[VCMediaRecorder deviceHasSufficientFreeSpace])
      {
        uint64_t v8 = self->_delegateNotificationQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke;
        block[3] = &unk_1E6DB5450;
        void block[5] = a3;
        void block[6] = streamToken;
        void block[4] = v6;
        dispatch_async(v8, block);
        if ([(VCMediaRecorder *)self validateNumberOfRequestsWithError:&v25])
        {
          ++self->_currentActiveRequestsCount;
          uint64_t v9 = [[VCMediaRecorderHistoryRequestContext alloc] initWithSerializedRequest:a3];
          MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCMediaRecorder-startRecording");
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            id v11 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v27 = v10;
              __int16 v28 = 2080;
              __int16 v29 = "-[VCMediaRecorder processRemoteLivePhotoRequest:]";
              __int16 v30 = 1024;
              int v31 = 815;
              __int16 v32 = 2112;
              uint64_t v33 = self;
              __int16 v34 = 2112;
              v35 = v9;
              _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorder-startRecording instance=%@, requestContext=%@", buf, 0x30u);
            }
          }
          BOOL v12 = [(VCMediaRecorderHistoryRequestContext *)v9 hasDirectoryURL];
          mediaRecorderHistory = self->_mediaRecorderHistory;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_85;
          v22[3] = &unk_1E6DB65D8;
          BOOL v23 = !v12;
          v22[4] = self;
          v22[5] = v6;
          v22[6] = a3;
          v22[7] = streamToken;
          [(VCMediaRecorderHistory *)mediaRecorderHistory takeLivePhotoWithContext:v9 completionHandler:v22];
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v16 = VRTraceErrorLogLevelToCSTR();
            id v17 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              [(VCMediaRecorder *)v16 processRemoteLivePhotoRequest:v17];
            }
          }
          uint64_t v18 = self->_delegateNotificationQueue;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_87;
          v21[3] = &unk_1E6DB6560;
          v21[4] = v6;
          v21[5] = a3;
          v21[6] = v25;
          v21[7] = streamToken;
          dispatch_async(v18, v21);
          [(VCMediaRecorder *)self notifyFinishWithRequest:a3 didSucceed:0 fileSize:0];
        }
      }
      else
      {
        [(VCMediaRecorder *)self handleInsufficientFreeSpaceWithRequest:a3 delegate:v6];
      }
      break;
  }
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 48) didStartProcessingRequest:*(void *)(a1 + 40) error:0];
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_85(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 208));
  --*(_DWORD *)(*(void *)(a1 + 32) + 224);
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 256)) {
    BOOL v9 = *(_DWORD *)(v8 + 224) == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (a2) {
    BOOL v10 = a3 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  char v11 = !v10;
  if (v10)
  {
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v12 = +[VCFileUtil sizeOfFile:a2];
    unint64_t v13 = +[VCFileUtil sizeOfFile:a3] + v12;
    uint64_t v8 = *(void *)(a1 + 32);
  }
  uint32_t v14 = *(NSObject **)(v8 + 216);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2;
  v17[3] = &unk_1E6DB65B0;
  char v21 = v11;
  v17[4] = a2;
  v17[5] = a3;
  char v22 = *(unsigned char *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 56);
  long long v18 = *(_OWORD *)(a1 + 40);
  uint64_t v19 = a4;
  uint64_t v20 = v15;
  BOOL v23 = v9;
  dispatch_async(v14, v17);
  return [*(id *)(a1 + 32) notifyFinishWithRequest:*(void *)(a1 + 48) didSucceed:a4 == 0 fileSize:v13];
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 80))
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
    long long v5 = *(_OWORD *)(a1 + 32);
    LOBYTE(v6) = *(unsigned char *)(a1 + 81);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2_cold_1(v2, (void *)a1, v3);
      }
    }
    long long v5 = 0uLL;
    unint64_t v6 = 0;
  }
  uint64_t result = [*(id *)(a1 + 48) streamToken:*(void *)(a1 + 72) didEndProcessingRequest:*(void *)(a1 + 56) urlContext:&v5 error:*(void *)(a1 + 64)];
  if (*(unsigned char *)(a1 + 82)) {
    return objc_msgSend(*(id *)(a1 + 48), "streamTokenDidCleanupAllRequests:", *(void *)(a1 + 72), v5, v6, v7);
  }
  return result;
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_87(uint64_t a1)
{
  v2[3] = *MEMORY[0x1E4F143B8];
  memset(v2, 0, 24);
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 56) didEndProcessingRequest:*(void *)(a1 + 40) urlContext:v2 error:*(void *)(a1 + 48)];
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2_88(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"vcMomentsRequestDidSucceed"), "BOOLValue");
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);

  return [v3 streamToken:v4 didFinishRequest:v5 didSucceed:v2];
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 48) didFinishRequest:*(void *)(a1 + 40) didSucceed:0];
}

- (void)processRemotePhotoRequest:(id)a3
{
  void block[7] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[VCMediaRecorder processRemotePhotoRequest:]");
  uint64_t streamToken = self->_streamToken;
  id v6 = [(VCMediaRecorder *)self dispatchedMediaRecorderDelegate];
  int v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue");
  switch(v7)
  {
    case 4:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_4;
      v15[3] = &unk_1E6DB5450;
      v15[4] = a3;
      v15[5] = v6;
      v15[6] = streamToken;
      unint64_t v13 = v15;
      goto LABEL_8;
    case 3:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_5;
      v14[3] = &unk_1E6DB5450;
      v14[5] = a3;
      v14[6] = streamToken;
      v14[4] = v6;
      unint64_t v13 = v14;
LABEL_8:
      dispatch_async(delegateNotificationQueue, v13);
      return;
    case 1:
      if (+[VCMediaRecorder deviceHasSufficientFreeSpace])
      {
        uint64_t v8 = self->_delegateNotificationQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke;
        block[3] = &unk_1E6DB5450;
        void block[5] = a3;
        void block[6] = streamToken;
        void block[4] = v6;
        dispatch_async(v8, block);
        BOOL v9 = [[VCMediaRecorderHistoryRequestContext alloc] initWithSerializedRequest:a3];
        BOOL v10 = [(VCMediaRecorderHistoryRequestContext *)v9 hasDirectoryURL];
        mediaRecorderHistory = self->_mediaRecorderHistory;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        void v16[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_2;
        v16[3] = &unk_1E6DB65D8;
        BOOL v17 = !v10;
        v16[4] = self;
        v16[5] = v6;
        v16[6] = a3;
        v16[7] = streamToken;
        [(VCMediaRecorderHistory *)mediaRecorderHistory takePhotoWithContext:v9 completionHandler:v16];
      }
      else
      {
        [(VCMediaRecorder *)self handleInsufficientFreeSpaceWithRequest:a3 delegate:v6];
      }
      break;
  }
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 48) didStartProcessingRequest:*(void *)(a1 + 40) error:0];
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = +[VCFileUtil sizeOfFile:a2];
  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_3;
  block[3] = &unk_1E6DB6600;
  void block[4] = a2;
  char v15 = *(unsigned char *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 40);
  uint64_t v13 = a4;
  uint64_t v14 = v9;
  dispatch_async(v8, block);
  return [*(id *)(a1 + 32) notifyFinishWithRequest:*(void *)(a1 + 48) didSucceed:a4 == 0 fileSize:v7];
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3[1] = 0;
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v1 = *(void **)(a1 + 40);
  v3[0] = *(void *)(a1 + 32);
  LOBYTE(v4) = *(unsigned char *)(a1 + 72);
  return [v1 streamToken:*(void *)(a1 + 64) didEndProcessingRequest:*(void *)(a1 + 48) urlContext:v3 error:*(void *)(a1 + 56)];
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"vcMomentsRequestDidSucceed"), "BOOLValue");
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);

  return [v3 streamToken:v4 didFinishRequest:v5 didSucceed:v2];
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 48) didFinishRequest:*(void *)(a1 + 40) didSucceed:0];
}

- (void)notifyFinishWithRequest:(id)a3 didSucceed:(BOOL)a4 fileSize:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    BOOL v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int mode = self->_mode;
      int v13 = 136316418;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCMediaRecorder notifyFinishWithRequest:didSucceed:fileSize:]";
      __int16 v17 = 1024;
      int v18 = 929;
      __int16 v19 = 1024;
      int v20 = mode;
      __int16 v21 = 1024;
      BOOL v22 = v6;
      __int16 v23 = 2048;
      int64_t v24 = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%d, didSucceed=%d, fileSize=%ld", (uint8_t *)&v13, 0x32u);
    }
  }
  int v12 = self->_mode;
  if (v12 == 1)
  {
    [(VCMediaRecorder *)self notifyLocalFinishWithRequest:a3 didSucceed:v6 fileSize:a5];
  }
  else if (v12 == 2)
  {
    [(VCMediaRecorder *)self notifyRemoteFinishWithRequest:a3 didSucceed:v6 fileSize:a5];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaRecorder notifyFinishWithRequest:didSucceed:fileSize:]();
    }
  }
}

- (void)notifyRemoteFinishWithRequest:(id)a3 didSucceed:(BOOL)a4 fileSize:(int64_t)a5
{
  BOOL v6 = a4;
  v12[7] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v9 = (void *)[a3 mutableCopy];
  [v9 setObject:&unk_1F3DC4158 forKeyedSubscript:@"vcMomentsRequestState"];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v6), @"vcMomentsRequestDidSucceed");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLong:", a5), @"vcMomentsFileSize");
  id v10 = [(VCMediaRecorder *)self dispatchedTransportDelegate];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__VCMediaRecorder_notifyRemoteFinishWithRequest_didSucceed_fileSize___block_invoke;
  v12[3] = &unk_1E6DB43D8;
  v12[4] = v10;
  v12[5] = self;
  v12[6] = v9;
  dispatch_async(delegateNotificationQueue, v12);
}

uint64_t __69__VCMediaRecorder_notifyRemoteFinishWithRequest_didSucceed_fileSize___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"vcMomentsRequesterID"];

  return [v1 mediaRecorder:v2 shouldProcessRequest:v3 recipientID:v4];
}

- (void)notifyLocalFinishWithRequest:(id)a3 didSucceed:(BOOL)a4 fileSize:(int64_t)a5
{
  BOOL v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v9 = (id)[a3 mutableCopy];
  [v9 setObject:&unk_1F3DC4158 forKeyedSubscript:@"vcMomentsRequestState"];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v6), @"vcMomentsRequestDidSucceed");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLong:", a5), @"vcMomentsFileSize");
  [(VCMediaRecorder *)self dispatchedProcessRequest:v9];
}

- (BOOL)validateNumberOfRequestsWithError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  int currentActiveRequestsCount = self->_currentActiveRequestsCount;
  if (a3 && currentActiveRequestsCount >= 100000) {
    *a3 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderError" code:-1 userInfo:0];
  }
  return currentActiveRequestsCount < 100000;
}

- (BOOL)isHistorySupported
{
  return [+[VCVideoRuleCollectionsMediaRecorder sharedInstance] mediaRecorderCapabilities] != 0;
}

- (void)handleInsufficientFreeSpaceWithRequest:(id)a3 delegate:(id)a4
{
  void block[8] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  [(VCMediaRecorder *)self notifyFinishWithRequest:a3 didSucceed:0 fileSize:0];
  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderError" code:-2 userInfo:0];
  uint64_t streamToken = self->_streamToken;
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VCMediaRecorder_handleInsufficientFreeSpaceWithRequest_delegate___block_invoke;
  block[3] = &unk_1E6DB6560;
  void block[4] = a4;
  void block[5] = a3;
  void block[6] = v7;
  void block[7] = streamToken;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __67__VCMediaRecorder_handleInsufficientFreeSpaceWithRequest_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamToken:*(void *)(a1 + 56) didStartProcessingRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

+ (BOOL)validateNonzeroAudioRecordingLengthURL:(id)a3 error:(id *)a4
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      +[VCMediaRecorder validateNonzeroAudioRecordingLengthURL:error:]();
    }
    goto LABEL_9;
  }
  +[VCFileUtil audioContentLengthOfFile:](VCFileUtil, "audioContentLengthOfFile:");
  LOBYTE(v6) = v5 > 0.0;
  if (a4 && v5 <= 0.0)
  {
    if (!*a4)
    {
      uint64_t v7 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderError" code:-3 userInfo:0];
      LOBYTE(v6) = 0;
      *a4 = v7;
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)deviceHasSufficientFreeSpace
{
  return +[VCMediaRecorder deviceFreeDiskSpace] > 0x989680;
}

+ (unint64_t)deviceFreeDiskSpace
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfFileSystemForPath:error:", NSTemporaryDirectory(), 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F283A0]);

  return [v2 unsignedLongValue];
}

+ (int)typeForRequest:(id)a3
{
  uint64_t v4 = (void *)[a3 objectForKeyedSubscript:@"vcMomentsRequestState"];
  if (v4)
  {
    int v5 = [v4 intValue];
    if ([a3 objectForKeyedSubscript:@"vcMomentsRequesterID"])
    {
      if (v5 == 4) {
        return 5;
      }
      else {
        return 4;
      }
    }
    else
    {
      uint64_t v7 = [a3 objectForKeyedSubscript:@"vcMomentsInitiatorID"];
      if (v5 == 4) {
        int v8 = 3;
      }
      else {
        int v8 = 2;
      }
      if (v7) {
        return 1;
      }
      else {
        return v8;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      +[VCMediaRecorder typeForRequest:]();
    }
    return 0;
  }
}

+ (unint64_t)countForRequestType:(int)a3 requestMode:(unsigned __int8)a4
{
  unint64_t result = 6;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      if (a4 == 1) {
        unint64_t result = 7;
      }
      else {
        unint64_t result = 5;
      }
      break;
    case 3:
      unint64_t result = 7;
      break;
    case 4:
      BOOL v5 = a4 == 1;
      unint64_t v6 = 6;
      goto LABEL_9;
    case 5:
      BOOL v5 = a4 == 1;
      unint64_t v6 = 8;
LABEL_9:
      if (v5) {
        unint64_t result = v6;
      }
      else {
        unint64_t result = v6 + 1;
      }
      break;
    default:
      unint64_t result = -1;
      break;
  }
  return result;
}

- (BOOL)isActive
{
  return self->_isActive;
}

+ (void)validateIncomingRequest:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RequestMode is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid request!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TransactionID is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RequestState is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RequestTimestamp is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d MediaType is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d InitiatorID is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RequesterID is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FileSize is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RequestDidSucceed is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RequesteeID is nil!", v2, v3, v4, v5, v6);
}

+ (void)validateIncomingRequest:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Media recording is not supported on this platform!", v2, v3, v4, v5, v6);
}

- (void)dispatchedProcessRequest:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [a2 objectForKeyedSubscript:@"vcMomentsTransactionID"];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v9 = 312;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCMediaRecorder request %@ invalid transactionID!", (uint8_t *)&v6, 0x26u);
}

- (void)dispatchedProcessRequest:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaRecorder request %@ has unexpected contents!");
}

void __38__VCMediaRecorder_setUpReportingAgent__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
}

- (void)processRemoteLivePhotoRequest:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(a2 + 224);
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[VCMediaRecorder processRemoteLivePhotoRequest:]";
  __int16 v8 = 1024;
  int v9 = 851;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d The number of requests exceeds the max %d", (uint8_t *)&v4, 0x22u);
}

void __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2_cold_1(uint64_t a1, void *a2, os_log_t log)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2[4];
  uint64_t v4 = a2[5];
  uint64_t v5 = a2[8];
  int v6 = 136316418;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  int v9 = "-[VCMediaRecorder processRemoteLivePhotoRequest:]_block_invoke_2";
  __int16 v10 = 1024;
  int v11 = 838;
  __int16 v12 = 2112;
  uint64_t v13 = v3;
  __int16 v14 = 2112;
  uint64_t v15 = v4;
  __int16 v16 = 2112;
  uint64_t v17 = v5;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d getLivePhotoWithTransactionID failed! stillImageURL:%@ movieURL:%@ error:%@", (uint8_t *)&v6, 0x3Au);
}

- (void)notifyFinishWithRequest:didSucceed:fileSize:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCMomentsRequestMode invalid", v2, v3, v4, v5, v6);
}

+ (void)validateNonzeroAudioRecordingLengthURL:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get audio recording length for null movieURL", v2, v3, v4, v5, v6);
}

+ (void)typeForRequest:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing state in recording request %@");
}

@end