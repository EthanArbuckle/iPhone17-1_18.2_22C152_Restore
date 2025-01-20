@interface VCIDSSessionInfoSynchronizer
- (NSNumber)duplicationLinkID;
- (NSNumber)primaryLinkID;
- (VCIDSSessionInfoSynchronizer)initWithDelegate:(id)a3 connectionManager:(id)a4 reportingAgent:(id)a5;
- (id)errorReponseCallback;
- (id)peerPublishedStreamCallback;
- (id)peerSubscribedStreamCallback;
- (id)reportingAgent;
- (id)sessionInfoSynchronizerDelegate;
- (void)checkVCIDSSessionInfoNeedUpdate:(unsigned __int8)a3;
- (void)dealloc;
- (void)deregisterPeriodicTask;
- (void)flushRealTimeReportingStats;
- (void)optInAllStreamsForConnection:(id)a3;
- (void)optInStreamIDsForConnection:(id)a3;
- (void)optInStreamIDsForNewPrimaryConnection:(id)a3 oldPrimaryConnection:(id)a4;
- (void)optOutStreamIDsForNonPrimaryConnection:(id)a3 sentOnConnection:(id)a4;
- (void)periodicTask:(void *)a3;
- (void)registerPeriodicTask;
- (void)resetParticipantGenerationCounter;
- (void)resetPeerSubscribedStreams;
- (void)retryVCIDSSessionInfoSubscribedStreamIDs;
- (void)sendVCIDSSessionInfoSubscribedStreamIDs:(id)a3;
- (void)setDuplicationLinkID:(id)a3;
- (void)setErrorReponseCallback:(id)a3;
- (void)setErrorResponseCallback:(id)a3;
- (void)setPeerPublishedStreamCallback:(id)a3;
- (void)setPeerSubscribedStreamCallback:(id)a3;
- (void)setPrimaryLinkID:(id)a3;
- (void)setVCIDSSessionInfoPublishedStreamIDs:(id)a3;
- (void)setVCIDSSessionInfoSubscribedStreamIDs:(id)a3;
- (void)updateVCIDSSessionInfoResponse:(id)a3;
@end

@implementation VCIDSSessionInfoSynchronizer

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_delegate, 0);
  [(VCIDSSessionInfoSynchronizer *)self deregisterPeriodicTask];
  objc_storeWeak(&self->_reportingAgentWeak, 0);

  _Block_release(self->_peerSubscribedStreamCallback);
  _Block_release(self->_peerPublishedStreamCallback);
  _Block_release(self->_errorReponseCallback);

  dispatch_release((dispatch_object_t)self->_stateQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCIDSSessionInfoSynchronizer;
  [(VCIDSSessionInfoSynchronizer *)&v3 dealloc];
}

- (void)setVCIDSSessionInfoSubscribedStreamIDs:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoSubscribedStreamIDs___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = a3;
    block[5] = self;
    dispatch_async(stateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoSubscribedStreamIDs:]();
    }
  }
}

void __71__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoSubscribedStreamIDs___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v2 = *(void **)(a1 + 32);
    objc_super v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "%s", v3);
    if (__str)
    {
      __lasts = 0;
      uint64_t v4 = strtok_r(__str, "\n", &__lasts);
      v5 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v13 = v6;
            __int16 v14 = 2080;
            v15 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoSubscribedStreamIDs:]_block_invoke";
            __int16 v16 = 1024;
            int v17 = 95;
            __int16 v18 = 2080;
            v19 = "streamIDsDictionary=";
            __int16 v20 = 2080;
            v21 = v4;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  if ([*(id *)(*(void *)(a1 + 40) + 32) isEqualToDictionary:*(void *)(a1 + 32)])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        v15 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoSubscribedStreamIDs:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 98;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d subscribedStreamIDs is the same. Don't subscribe again", buf, 0x1Cu);
      }
    }
  }
  else
  {

    *(void *)(*(void *)(a1 + 40) + 32) = [*(id *)(a1 + 32) mutableCopy];
    *(_DWORD *)(*(void *)(a1 + 40) + 168) = 0;
    [*(id *)(a1 + 40) sendVCIDSSessionInfoSubscribedStreamIDs:*(void *)(a1 + 32)];
  }
}

- (void)retryVCIDSSessionInfoSubscribedStreamIDs
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d streamIDsDictionary is nil", v2, v3, v4, v5, v6);
}

void __72__VCIDSSessionInfoSynchronizer_retryVCIDSSessionInfoSubscribedStreamIDs__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v3 = *(_DWORD *)(v1 + 168);
  if (v3 > 9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __72__VCIDSSessionInfoSynchronizer_retryVCIDSSessionInfoSubscribedStreamIDs__block_invoke_cold_1(v8, (uint64_t)v2, v9);
      }
    }
  }
  else
  {
    *(_DWORD *)(v1 + 168) = v3 + 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *((_DWORD *)*v2 + 42);
        uint64_t v7 = *((void *)*v2 + 4);
        int v10 = 136316162;
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCIDSSessionInfoSynchronizer retryVCIDSSessionInfoSubscribedStreamIDs]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 117;
        __int16 v16 = 1024;
        int v17 = v6;
        __int16 v18 = 2112;
        uint64_t v19 = v7;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d retry %d times subscribedStreamIDs equal: %@", (uint8_t *)&v10, 0x2Cu);
      }
    }
    [*v2 sendVCIDSSessionInfoSubscribedStreamIDs:*((void *)*v2 + 4)];
  }
}

- (void)sendVCIDSSessionInfoSubscribedStreamIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self->_connectionManager);
  if (v5)
  {
    int v6 = (const void *)v5;
    if (VCConnection_IsEndToEndLink(v5))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCIDSSessionInfoSynchronizer sendVCIDSSessionInfoSubscribedStreamIDs:]();
        }
      }
    }
    else
    {
      uint64_t v7 = VCConnectionIDS_LinkID((uint64_t)v6);
      uint64_t v8 = *MEMORY[0x1E4F6A730];
      v19[0] = *MEMORY[0x1E4F6A730];
      v20[0] = [NSNumber numberWithUnsignedChar:v7];
      uint64_t v9 = *MEMORY[0x1E4F6A738];
      v19[1] = *MEMORY[0x1E4F6A738];
      uint64_t v10 = [NSNumber numberWithUnsignedChar:v7];
      uint64_t v11 = *MEMORY[0x1E4F6A848];
      v20[1] = v10;
      v20[2] = a3;
      uint64_t v12 = *MEMORY[0x1E4F6A760];
      v19[2] = v11;
      v19[3] = v12;
      v20[3] = [NSNumber numberWithUnsignedInt:self->_currentParticipantGenerationCounter];
      objc_msgSend(-[VCIDSSessionInfoSynchronizer sessionInfoSynchronizerDelegate](self, "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
      if ([(VCConnectionManager *)self->_connectionManager isDuplicationEnabled])
      {
        uint64_t v13 = [(VCConnectionManager *)self->_connectionManager secondaryConnection];
        if (VCConnection_IsEndToEndLink((uint64_t)v13))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCIDSSessionInfoSynchronizer sendVCIDSSessionInfoSubscribedStreamIDs:]();
            }
          }
          return;
        }
        uint64_t v14 = VCConnectionIDS_LinkID((uint64_t)v13);
        v18[0] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", v14, v8);
        v17[1] = v9;
        v18[1] = [NSNumber numberWithUnsignedChar:v14];
        v18[2] = a3;
        v17[2] = v11;
        v17[3] = v12;
        v18[3] = [NSNumber numberWithUnsignedInt:self->_currentParticipantGenerationCounter];
        objc_msgSend(-[VCIDSSessionInfoSynchronizer sessionInfoSynchronizerDelegate](self, "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
      }
    }
    CFRelease(v6);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    __int16 v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = v15;
      __int16 v23 = 2080;
      v24 = "-[VCIDSSessionInfoSynchronizer sendVCIDSSessionInfoSubscribedStreamIDs:]";
      __int16 v25 = 1024;
      int v26 = 127;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d primary connection is nil", buf, 0x1Cu);
    }
  }
}

- (void)setVCIDSSessionInfoPublishedStreamIDs:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoPublishedStreamIDs___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = a3;
    block[5] = self;
    dispatch_async(stateQueue, block);
  }
}

void __70__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoPublishedStreamIDs___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    unsigned int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = v2;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoPublishedStreamIDs:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 159;
      __int16 v25 = 2112;
      uint64_t v26 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d set publishedStreamIDs: %@", buf, 0x26u);
    }
  }
  uint64_t v5 = (const void *)VCConnectionManager_CopyPrimaryConnection(*(void *)(*(void *)(a1 + 40) + 96));
  if ([*(id *)(*(void *)(a1 + 40) + 24) isEqualToArray:*(void *)(a1 + 32)])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315906;
        uint64_t v20 = v12;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoPublishedStreamIDs:]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 162;
        __int16 v25 = 2112;
        uint64_t v26 = v14;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d publishedStreamIDs equal: %@", buf, 0x26u);
      }
    }
    if (v5) {
      goto LABEL_8;
    }
  }
  else
  {

    *(void *)(*(void *)(a1 + 40) + 24) = [*(id *)(a1 + 32) mutableCopy];
    if (v5)
    {
      if (VCConnection_IsEndToEndLink((uint64_t)v5))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __70__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoPublishedStreamIDs___block_invoke_cold_1();
          }
        }
      }
      else
      {
        uint64_t v6 = VCConnectionIDS_LinkID((uint64_t)v5);
        v18[0] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", v6, *MEMORY[0x1E4F6A730]);
        v17[1] = *MEMORY[0x1E4F6A738];
        uint64_t v7 = [NSNumber numberWithUnsignedChar:v6];
        uint64_t v8 = *MEMORY[0x1E4F6A7E8];
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        v18[1] = v7;
        v18[2] = v9;
        uint64_t v11 = *MEMORY[0x1E4F6A760];
        v17[2] = v8;
        v17[3] = v11;
        v18[3] = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v10 + 72)];
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", *(void *)(a1 + 40), objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
      }
LABEL_8:
      CFRelease(v5);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v15;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoPublishedStreamIDs:]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 166;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d primary connection is nil", buf, 0x1Cu);
      }
    }
  }
}

- (id)reportingAgent
{
  return objc_loadWeak(&self->_reportingAgentWeak);
}

- (id)sessionInfoSynchronizerDelegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setErrorResponseCallback:(id)a3
{
  self->_errorReponseCallback = _Block_copy(a3);
}

- (void)deregisterPeriodicTask
{
  [(VCIDSSessionInfoSynchronizer *)self reportingAgent];

  reportingUnregisterPeriodicTask();
}

- (id)peerSubscribedStreamCallback
{
  return self->_peerSubscribedStreamCallback;
}

- (void)setPeerSubscribedStreamCallback:(id)a3
{
}

- (id)peerPublishedStreamCallback
{
  return self->_peerPublishedStreamCallback;
}

- (void)setPeerPublishedStreamCallback:(id)a3
{
}

- (id)errorReponseCallback
{
  return self->_errorReponseCallback;
}

- (void)setErrorReponseCallback:(id)a3
{
}

- (VCIDSSessionInfoSynchronizer)initWithDelegate:(id)a3 connectionManager:(id)a4 reportingAgent:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCIDSSessionInfoSynchronizer;
  uint64_t v8 = [(VCIDSSessionInfoSynchronizer *)&v11 init];
  if (v8)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v8->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCIDSSessionInfoSynchronizer.stateQueue", 0, CustomRootQueue);
    objc_storeWeak(&v8->_delegate, a3);
    objc_storeWeak(&v8->_reportingAgentWeak, a5);
    [(VCIDSSessionInfoSynchronizer *)v8 registerPeriodicTask];
    v8->_peerSubscribedStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_peerPublishedStreams = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_publishedStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_subscribedStreams = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_currentParticipantGenerationCounter = 0;
    v8->_primaryLinkID = (NSNumber *)[objc_alloc(NSNumber) initWithUnsignedInt:0];
    v8->_duplicationLinkID = (NSNumber *)[objc_alloc(NSNumber) initWithUnsignedInt:0];
    v8->_connectionManager = (VCConnectionManager *)a4;
  }
  return v8;
}

- (void)setPrimaryLinkID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_primaryLinkID = (NSNumber *)a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) setPrimaryLinkID:]";
      __int16 v10 = 1024;
      int v11 = 225;
      __int16 v12 = 2112;
      id v13 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d set primaryLinkID: %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (NSNumber)primaryLinkID
{
  return self->_primaryLinkID;
}

- (void)setDuplicationLinkID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_duplicationLinkID = (NSNumber *)a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) setDuplicationLinkID:]";
      __int16 v10 = 1024;
      int v11 = 234;
      __int16 v12 = 2112;
      id v13 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d set duplicationLinkID: %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (NSNumber)duplicationLinkID
{
  return self->_duplicationLinkID;
}

- (void)resetParticipantGenerationCounter
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int currentParticipantGenerationCounter = self->_currentParticipantGenerationCounter;
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) resetParticipantGenerationCounter]";
      __int16 v10 = 1024;
      int v11 = 242;
      __int16 v12 = 1024;
      unsigned int v13 = currentParticipantGenerationCounter;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reset participant generation counter from %d to 0", (uint8_t *)&v6, 0x22u);
    }
  }
  self->_unsigned int currentParticipantGenerationCounter = 0;
}

- (void)resetPeerSubscribedStreams
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__VCIDSSessionInfoSynchronizer_PrivateMethods__resetPeerSubscribedStreams__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __74__VCIDSSessionInfoSynchronizer_PrivateMethods__resetPeerSubscribedStreams__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(__CFString **)(*(void *)(a1 + 32) + 8);
      int v16 = 136315906;
      uint64_t v17 = v2;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) resetPeerSubscribedStreams]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 248;
      __int16 v22 = 2112;
      __int16 v23 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reset peer subscribed streams: current subscription=%@", (uint8_t *)&v16, 0x26u);
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
    [*(id *)(a1 + 32) resetParticipantGenerationCounter];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 40);
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, (id)[*(id *)(v5 + 8) copy]);
      return;
    }
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315650;
          uint64_t v17 = v8;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) resetPeerSubscribedStreams]_block_invoke";
          __int16 v20 = 1024;
          int v21 = 255;
          __int16 v10 = " [%s] %s:%d peerSubscribedStreamCallback is not set up";
          int v11 = v9;
          uint32_t v12 = 28;
LABEL_18:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          int v16 = 136316162;
          uint64_t v17 = v13;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) resetPeerSubscribedStreams]_block_invoke";
          __int16 v20 = 1024;
          int v21 = 255;
          __int16 v22 = 2112;
          __int16 v23 = v7;
          __int16 v24 = 2048;
          uint64_t v25 = v15;
          __int16 v10 = " [%s] %s:%d %@(%p) peerSubscribedStreamCallback is not set up";
          int v11 = v14;
          uint32_t v12 = 48;
          goto LABEL_18;
        }
      }
    }
  }
}

- (void)checkVCIDSSessionInfoNeedUpdate:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int currentParticipantGenerationCounter = self->_currentParticipantGenerationCounter;
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = v5;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) checkVCIDSSessionInfoNeedUpdate:]";
      __int16 v20 = 1024;
      int v21 = 262;
      __int16 v22 = 1024;
      int v23 = v3;
      __int16 v24 = 1024;
      unsigned int v25 = currentParticipantGenerationCounter;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d participantGenerationCounterLSByte = %d, %d", buf, 0x28u);
    }
  }
  if (LOBYTE(self->_currentParticipantGenerationCounter) != v3)
  {
    uint64_t v8 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self->_connectionManager);
    if (v8)
    {
      uint64_t v9 = (const void *)v8;
      uint64_t v10 = VCConnectionIDS_LinkID(v8);
      v15[0] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", v10, *MEMORY[0x1E4F6A730]);
      v14[1] = *MEMORY[0x1E4F6A738];
      v15[1] = [NSNumber numberWithUnsignedChar:v10];
      v14[2] = *MEMORY[0x1E4F6A760];
      v15[2] = [NSNumber numberWithUnsignedInt:self->_currentParticipantGenerationCounter];
      objc_msgSend(-[VCIDSSessionInfoSynchronizer sessionInfoSynchronizerDelegate](self, "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, v14, 3));
      CFRelease(v9);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint32_t v12 = *MEMORY[0x1E4F47A50];
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v17 = v11;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) checkVCIDSSessionInfoNeedUpdate:]";
          __int16 v20 = 1024;
          int v21 = 266;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d primary connection is nil", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[VCIDSSessionInfoSynchronizer(PrivateMethods) checkVCIDSSessionInfoNeedUpdate:]();
      }
    }
  }
}

- (void)updateVCIDSSessionInfoResponse:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v48 = v5;
      __int16 v49 = 2080;
      v50 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
      __int16 v51 = 1024;
      int v52 = 279;
      __int16 v53 = 2112;
      uint64_t v54 = (uint64_t)a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d eventInfo=%@", buf, 0x26u);
    }
  }
  uint64_t v7 = *MEMORY[0x1E4F6A6E0];
  if ([a3 objectForKey:*MEMORY[0x1E4F6A6E0]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = [a3 objectForKeyedSubscript:v7];
        *(_DWORD *)buf = 136315906;
        uint64_t v48 = v8;
        __int16 v49 = 2080;
        v50 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        __int16 v51 = 1024;
        int v52 = 282;
        __int16 v53 = 2112;
        uint64_t v54 = v36;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d eventInfo has IDSDataChannelError, ERROR = %@", buf, 0x26u);
      }
    }
    int v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "code");
    if ((v10 - 2) < 2 || v10 == 8)
    {
      [(VCIDSSessionInfoSynchronizer *)self reportingAgent];
      reportingSymptom();
    }
    else if (v10 == 7)
    {
      errorReponseCallback = (void (**)(id, uint64_t))self->_errorReponseCallback;
      if (errorReponseCallback) {
        errorReponseCallback[2](errorReponseCallback, 7);
      }
    }
    ++self->_countResponseFailure;
    return;
  }
  uint32_t v12 = (void (**)(id, void))self->_errorReponseCallback;
  if (v12) {
    v12[2](v12, 0);
  }
  uint64_t v13 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A708]];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *MEMORY[0x1E4F6A820];
    if ([v13 objectForKey:*MEMORY[0x1E4F6A820]]) {
      self->_sessionInfoRequestBytesUsed = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v15), "intValue");
    }
    uint64_t v16 = *MEMORY[0x1E4F6A828];
    if ([v14 objectForKey:*MEMORY[0x1E4F6A828]]) {
      self->_sessionInfoResponseBytesUsed = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v16), "intValue");
    }
    unsigned int v17 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F6A760]), "intValue");
    unsigned int v18 = v17;
    if (v17 == self->_currentParticipantGenerationCounter)
    {
      if ((VCIDSSessionInfoSynchronizer *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          return;
        }
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v48 = v27;
        __int16 v49 = 2080;
        v50 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        __int16 v51 = 1024;
        int v52 = 320;
        __int16 v53 = 1024;
        LODWORD(v54) = v18;
        v29 = " [%s] %s:%d Getting duplicated participantGenerationCounter=%u";
        v30 = v28;
        uint32_t v31 = 34;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v19 = (__CFString *)[(VCIDSSessionInfoSynchronizer *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v19 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          return;
        }
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v48 = v32;
        __int16 v49 = 2080;
        v50 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        __int16 v51 = 1024;
        int v52 = 320;
        __int16 v53 = 2112;
        uint64_t v54 = (uint64_t)v19;
        __int16 v55 = 2048;
        v56 = self;
        __int16 v57 = 1024;
        LODWORD(v58) = v18;
        v29 = " [%s] %s:%d %@(%p) Getting duplicated participantGenerationCounter=%u";
        v30 = v33;
        uint32_t v31 = 54;
      }
      goto LABEL_66;
    }
    self->_unsigned int currentParticipantGenerationCounter = v17;
    uint64_t v21 = *MEMORY[0x1E4F6A770];
    if ([v14 objectForKey:*MEMORY[0x1E4F6A770]])
    {
      uint64_t v22 = [v14 objectForKeyedSubscript:v21];
      stateQueue = self->_stateQueue;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __79__VCIDSSessionInfoSynchronizer_PrivateMethods__updateVCIDSSessionInfoResponse___block_invoke;
      v46[3] = &unk_1E6DB3E40;
      v46[4] = self;
      v46[5] = v22;
      dispatch_async(stateQueue, v46);
    }
    uint64_t v24 = *MEMORY[0x1E4F6A768];
    if ([v14 objectForKey:*MEMORY[0x1E4F6A768]])
    {
      unsigned int v25 = (void *)[v14 objectForKeyedSubscript:v24];
      if ([(NSMutableDictionary *)self->_peerPublishedStreams isEqualToDictionary:v25])
      {
        if ((VCIDSSessionInfoSynchronizer *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return;
          }
          uint64_t v37 = VRTraceErrorLogLevelToCSTR();
          v38 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          *(_DWORD *)buf = 136315906;
          uint64_t v48 = v37;
          __int16 v49 = 2080;
          v50 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
          __int16 v51 = 1024;
          int v52 = 354;
          __int16 v53 = 2112;
          uint64_t v54 = (uint64_t)v25;
          v29 = " [%s] %s:%d Ignoring identical peerPublishedStreams=%@";
          v30 = v38;
          uint32_t v31 = 38;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v26 = (__CFString *)[(VCIDSSessionInfoSynchronizer *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v26 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return;
          }
          uint64_t v40 = VRTraceErrorLogLevelToCSTR();
          v41 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v48 = v40;
          __int16 v49 = 2080;
          v50 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
          __int16 v51 = 1024;
          int v52 = 354;
          __int16 v53 = 2112;
          uint64_t v54 = (uint64_t)v26;
          __int16 v55 = 2048;
          v56 = self;
          __int16 v57 = 2112;
          v58 = v25;
          v29 = " [%s] %s:%d %@(%p) Ignoring identical peerPublishedStreams=%@";
          v30 = v41;
          uint32_t v31 = 58;
        }
      }
      else
      {

        v34 = (NSMutableDictionary *)[v25 mutableCopy];
        self->_peerPublishedStreams = v34;
        peerPublishedStreamCallback = (void (**)(id, NSMutableDictionary *))self->_peerPublishedStreamCallback;
        if (peerPublishedStreamCallback)
        {
          peerPublishedStreamCallback[2](peerPublishedStreamCallback, v34);
          return;
        }
        if ((VCIDSSessionInfoSynchronizer *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
            return;
          }
          uint64_t v42 = VRTraceErrorLogLevelToCSTR();
          v43 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          *(_DWORD *)buf = 136315650;
          uint64_t v48 = v42;
          __int16 v49 = 2080;
          v50 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
          __int16 v51 = 1024;
          int v52 = 351;
          v29 = " [%s] %s:%d peerPublishedStreamCallback is not set up";
          v30 = v43;
          uint32_t v31 = 28;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            v39 = (__CFString *)[(VCIDSSessionInfoSynchronizer *)self performSelector:sel_logPrefix];
          }
          else {
            v39 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
            return;
          }
          uint64_t v44 = VRTraceErrorLogLevelToCSTR();
          v45 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v48 = v44;
          __int16 v49 = 2080;
          v50 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
          __int16 v51 = 1024;
          int v52 = 351;
          __int16 v53 = 2112;
          uint64_t v54 = (uint64_t)v39;
          __int16 v55 = 2048;
          v56 = self;
          v29 = " [%s] %s:%d %@(%p) peerPublishedStreamCallback is not set up";
          v30 = v45;
          uint32_t v31 = 48;
        }
      }
LABEL_66:
      _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]();
    }
  }
}

void __79__VCIDSSessionInfoSynchronizer_PrivateMethods__updateVCIDSSessionInfoResponse___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 8) isEqualToArray:*(void *)(a1 + 40)])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = *(__CFString **)(a1 + 40);
          int v21 = 136315906;
          uint64_t v22 = v5;
          __int16 v23 = 2080;
          uint64_t v24 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]_block_invoke";
          __int16 v25 = 1024;
          int v26 = 338;
          __int16 v27 = 2112;
          v28 = v7;
          uint64_t v8 = " [%s] %s:%d Ignoring identical peerSubscribedStreams=%@";
          uint64_t v9 = v6;
          uint32_t v10 = 38;
LABEL_26:
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v21, v10);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v2 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          uint64_t v15 = *(void *)(a1 + 40);
          int v21 = 136316418;
          uint64_t v22 = v12;
          __int16 v23 = 2080;
          uint64_t v24 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]_block_invoke";
          __int16 v25 = 1024;
          int v26 = 338;
          __int16 v27 = 2112;
          v28 = v2;
          __int16 v29 = 2048;
          uint64_t v30 = v14;
          __int16 v31 = 2112;
          uint64_t v32 = v15;
          uint64_t v8 = " [%s] %s:%d %@(%p) Ignoring identical peerSubscribedStreams=%@";
          uint64_t v9 = v13;
          uint32_t v10 = 58;
          goto LABEL_26;
        }
      }
    }
  }
  else
  {

    *(void *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 40) mutableCopy];
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
    else if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        unsigned int v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 136315650;
          uint64_t v22 = v16;
          __int16 v23 = 2080;
          uint64_t v24 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]_block_invoke";
          __int16 v25 = 1024;
          int v26 = 335;
          uint64_t v8 = " [%s] %s:%d peerSubscribedStreamCallback is not set up";
          uint64_t v9 = v17;
          uint32_t v10 = 28;
          goto LABEL_26;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          int v21 = 136316162;
          uint64_t v22 = v18;
          __int16 v23 = 2080;
          uint64_t v24 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]_block_invoke";
          __int16 v25 = 1024;
          int v26 = 335;
          __int16 v27 = 2112;
          v28 = v11;
          __int16 v29 = 2048;
          uint64_t v30 = v20;
          uint64_t v8 = " [%s] %s:%d %@(%p) peerSubscribedStreamCallback is not set up";
          uint64_t v9 = v19;
          uint32_t v10 = 48;
          goto LABEL_26;
        }
      }
    }
  }
}

- (void)optInStreamIDsForConnection:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__VCIDSSessionInfoSynchronizer_PrivateMethods__optInStreamIDsForConnection___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    block[5] = a3;
    dispatch_async(stateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCIDSSessionInfoSynchronizer(PrivateMethods) optInStreamIDsForConnection:]();
    }
  }
}

uint64_t __76__VCIDSSessionInfoSynchronizer_PrivateMethods__optInStreamIDsForConnection___block_invoke(uint64_t a1)
{
  v21[4] = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (result)
  {
    uint64_t v3 = VCConnectionIDS_LinkID(*(void *)(a1 + 40));
    v20[0] = *MEMORY[0x1E4F6A730];
    v21[0] = [NSNumber numberWithUnsignedChar:v3];
    v20[1] = *MEMORY[0x1E4F6A738];
    uint64_t v4 = [NSNumber numberWithUnsignedChar:v3];
    uint64_t v5 = *MEMORY[0x1E4F6A848];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 32);
    v21[1] = v4;
    v21[2] = v7;
    uint64_t v8 = *MEMORY[0x1E4F6A760];
    v20[2] = v5;
    v20[3] = v8;
    v21[3] = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v6 + 72)];
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) optInStreamIDsForConnection:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 373;
        __int16 v18 = 2112;
        uint64_t v19 = v9;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Opt in for connection, request = %@", (uint8_t *)&v12, 0x26u);
      }
    }
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", *(void *)(a1 + 32), v9);
  }
  return result;
}

- (void)optInAllStreamsForConnection:(id)a3
{
  if (a3) {
    -[VCIDSSessionInfoSynchronizer optInStreamIDsForConnection:](self, "optInStreamIDsForConnection:");
  }
}

- (void)optInStreamIDsForNewPrimaryConnection:(id)a3 oldPrimaryConnection:(id)a4
{
  -[VCIDSSessionInfoSynchronizer optInStreamIDsForConnection:](self, "optInStreamIDsForConnection:");
  if (a4 != a3)
  {
    [(VCIDSSessionInfoSynchronizer *)self optOutStreamIDsForNonPrimaryConnection:a4 sentOnConnection:a3];
  }
}

- (void)optOutStreamIDsForNonPrimaryConnection:(id)a3 sentOnConnection:(id)a4
{
  void v20[4] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    v19[0] = *MEMORY[0x1E4F6A730];
    v20[0] = [NSNumber numberWithUnsignedChar:VCConnectionIDS_LinkID((uint64_t)a4)];
    v19[1] = *MEMORY[0x1E4F6A738];
    v20[1] = [NSNumber numberWithUnsignedChar:VCConnectionIDS_LinkID((uint64_t)a3)];
    v19[2] = *MEMORY[0x1E4F6A848];
    uint64_t v17 = *MEMORY[0x1E4F6A698];
    uint64_t v18 = *MEMORY[0x1E4F6A740];
    v20[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v19[3] = *MEMORY[0x1E4F6A760];
    v20[3] = [NSNumber numberWithUnsignedInt:self->_currentParticipantGenerationCounter];
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        int v12 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) optOutStreamIDsForNonPrimaryConnection:sentOnConnection:]";
        __int16 v13 = 1024;
        int v14 = 405;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Opt out for non primary connection, request = %@", (uint8_t *)&v9, 0x26u);
      }
    }
    objc_msgSend(-[VCIDSSessionInfoSynchronizer sessionInfoSynchronizerDelegate](self, "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", self, v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCIDSSessionInfoSynchronizer(PrivateMethods) optOutStreamIDsForNonPrimaryConnection:sentOnConnection:]();
    }
  }
}

- (void)periodicTask:(void *)a3
{
  double v5 = micro();
  double v6 = v5 - self->_lastUpdateTimestamp;
  self->_lastUpdateTimestamp = v5;
  int sessionInfoRequestBytesUsed = self->_sessionInfoRequestBytesUsed;
  int v8 = sessionInfoRequestBytesUsed - self->_lastProcessedBytesSent;
  self->_lastProcessedBytesSent = sessionInfoRequestBytesUsed;
  if (v6 == 0.0)
  {
    int v12 = 0;
    self->_double maxSentRate = 0;
  }
  else
  {
    int minSentRate = self->_minSentRate;
    double maxSentRate = (double)self->_maxSentRate;
    double v11 = (double)v8 / v6;
    if (v11 > maxSentRate) {
      double maxSentRate = (double)v8 / v6;
    }
    self->_double maxSentRate = (int)maxSentRate;
    if (v11 > (double)minSentRate) {
      double v11 = (double)minSentRate;
    }
    int v12 = (int)v11;
  }
  self->_bytesSentToReport += v8;
  int sessionInfoResponseBytesUsed = self->_sessionInfoResponseBytesUsed;
  int v14 = sessionInfoResponseBytesUsed - self->_lastProcessedBytesReceived;
  self->_int minSentRate = v12;
  self->_lastProcessedBytesReceived = sessionInfoResponseBytesUsed;
  if (v6 == 0.0)
  {
    int v19 = 0;
    self->_int maxReceivedRate = 0;
  }
  else
  {
    int maxReceivedRate = self->_maxReceivedRate;
    int minReceivedRate = self->_minReceivedRate;
    double v17 = (double)v14 / v6;
    if (v17 <= (double)maxReceivedRate) {
      double v18 = (double)maxReceivedRate;
    }
    else {
      double v18 = (double)v14 / v6;
    }
    self->_int maxReceivedRate = (int)v18;
    if (v17 > (double)minReceivedRate) {
      double v17 = (double)minReceivedRate;
    }
    int v19 = (int)v17;
  }
  self->_int minReceivedRate = v19;
  self->_bytesReceivedToReport += v14;
  if (a3)
  {
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"SIMinBytesSent");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_maxSentRate), @"SIMaxBytesSent");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_bytesSentToReport), @"SIRawBytesSent");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_minReceivedRate), @"SIMinBytesReceived");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_maxReceivedRate), @"SIMaxBytesReceived");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_bytesReceivedToReport), @"SIRawBytesReceived");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_countResponseFailure), @"SyncIDSFailure");
    [(VCIDSSessionInfoSynchronizer *)self flushRealTimeReportingStats];
  }
}

- (void)registerPeriodicTask
{
  [(VCIDSSessionInfoSynchronizer *)self reportingAgent];

  reportingRegisterPeriodicTaskWeak();
}

uint64_t __68__VCIDSSessionInfoSynchronizer_PrivateMethods__registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)flushRealTimeReportingStats
{
  self->_int minSentRate = 0x7FFFFFFF;
  self->_int minReceivedRate = 0x7FFFFFFF;
  *(void *)&self->_bytesSentToReport = 0;
  *(void *)&self->_bytesReceivedToReport = 0;
}

- (void)setVCIDSSessionInfoSubscribedStreamIDs:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d streamIDsDictionary is nil", v2, v3, v4, v5, v6);
}

void __72__VCIDSSessionInfoSynchronizer_retryVCIDSSessionInfoSubscribedStreamIDs__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(*(void *)a2 + 168);
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[VCIDSSessionInfoSynchronizer retryVCIDSSessionInfoSubscribedStreamIDs]_block_invoke";
  __int16 v8 = 1024;
  int v9 = 120;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Hit the retry limit=%d for subscribedStreamIDs", (uint8_t *)&v4, 0x22u);
}

- (void)sendVCIDSSessionInfoSubscribedStreamIDs:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Primary connection is end-to-end when subscribing to streams.", v2, v3, v4, v5, v6);
}

- (void)sendVCIDSSessionInfoSubscribedStreamIDs:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Secondary connection is end-to-end when subscribing to streams.", v2, v3, v4, v5, v6);
}

void __70__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoPublishedStreamIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Primary connection is end-to-end when publishing streams.", v2, v3, v4, v5, v6);
}

@end