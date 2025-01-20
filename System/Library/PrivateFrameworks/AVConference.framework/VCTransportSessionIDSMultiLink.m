@interface VCTransportSessionIDSMultiLink
- (VCIDSSessionInfoSynchronizer)sessionInfoSynchronizer;
- (VCTransportSessionIDSMultiLink)initWithCallID:(unsigned int)a3 reportingAgent:(id)a4;
- (VCTransportSessionIDSMultiLink)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6 isMultiwaySession:(BOOL)a7;
- (VCTransportSessionIDSMultiLink)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6 isMultiwaySession:(BOOL)a7 dataPath:(int)a8;
- (int)onStart;
- (void)VCIDSSessionInfoSynchronizer:(void *)a3 sendVCIDSSessionInfoRequest:(id)a4;
- (void)connectionCallback:(id)a3 isInitialConnection:(BOOL)a4;
- (void)dealloc;
- (void)didEnableDuplication:(BOOL)a3 activeConnection:(id)a4;
- (void)didLocalNetworkQualityChange:(BOOL)a3 isLocalNetworkQualityBad:(BOOL)a4 isRemoteNetworkQualityBad:(BOOL)a5;
- (void)didMediaQualityDegrade:(BOOL)a3;
- (void)didUpdatePreferredInterfaceForDuplication:(unsigned __int8)a3 notifyPeer:(BOOL)a4 enableDuplication:(BOOL)a5 isMediaUnrecoverableSignal:(BOOL)a6;
- (void)discardConnection:(id)a3;
- (void)flushLinkProbingStatusWithOptions:(id)a3;
- (void)handleLinkConnectedWithInfo:(id)a3;
- (void)handleLinkDisconnectedWithInfo:(id)a3;
- (void)handleProbingResponse:(id)a3;
- (void)handleSessionInfoResponse:(id)a3;
- (void)logSignalStrength;
- (void)onStop;
- (void)optIntoExistingSubscribedStreamsForConnection:(id)a3;
- (void)optOutAllStreamsForConnection:(id)a3;
- (void)primaryConnectionChanged:(id)a3 oldPrimaryConnection:(id)a4 activeConnection:(id)a5;
- (void)queryProbingResultsWithOptions:(id)a3;
- (void)requestStatsWithOptions:(id)a3;
- (void)resetActiveConnection;
- (void)resetParticipantGenerationCounter;
- (void)setDefaultLink:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3 isInitiator:(BOOL)a4;
- (void)setQuickRelayServerProvider:(int)a3;
- (void)setRemoteDeviceVersionIDS;
- (void)setWiFiAssist:(BOOL)a3;
- (void)startActiveProbingWithOptions:(id)a3;
- (void)stopActiveProbingWithOptions:(id)a3;
- (void)updateParticipantGenerationCounter:(unsigned __int8)a3;
@end

@implementation VCTransportSessionIDSMultiLink

- (VCTransportSessionIDSMultiLink)initWithCallID:(unsigned int)a3 reportingAgent:(id)a4
{
  return [(VCTransportSessionIDSMultiLink *)self initWithCallID:*(void *)&a3 requireEncryptionInfo:0 reportingAgent:a4 notificationQueue:0 isMultiwaySession:0];
}

- (VCTransportSessionIDSMultiLink)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6 isMultiwaySession:(BOOL)a7
{
  return [(VCTransportSessionIDSMultiLink *)self initWithCallID:*(void *)&a3 requireEncryptionInfo:a4 reportingAgent:a5 notificationQueue:a6 isMultiwaySession:a7 dataPath:0];
}

- (VCTransportSessionIDSMultiLink)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6 isMultiwaySession:(BOOL)a7 dataPath:(int)a8
{
  BOOL v8 = a7;
  uint64_t v10 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCTransportSessionIDSMultiLink;
  v11 = [(VCTransportSessionIDS *)&v14 initWithCallID:*(void *)&a3 requireEncryptionInfo:a4 reportingAgent:a5 notificationQueue:a6 dataPath:*(void *)&a8];
  if (v11)
  {
    connectionManager = [[VCConnectionManagerIDS alloc] initWithMultiwayEnabled:v8];
    v11->super.super._connectionManager = &connectionManager->super;
    if (!v8)
    {
      [(VCConnectionManager *)connectionManager setupConnectionHealthMonitor];
      connectionManager = (VCConnectionManagerIDS *)v11->super.super._connectionManager;
    }
    [(VCConnectionManager *)connectionManager setReportingAgent:a5];
    [(VCConnectionManager *)v11->super.super._connectionManager setCallID:v10];
    [(VCConnectionManager *)v11->super.super._connectionManager setDelegate:v11];
    [(VCConnectionManager *)v11->super.super._connectionManager setSupportDuplication:[(VCTransportSession *)v11 isHandoverSupported]];
    VTP_RegisterConnectionManagerWithCallID(v11->super.super._connectionManager, [(VCConnectionManager *)v11->super.super._connectionManager callID]);
    if (v8) {
      v11->_sessionInfoSynchronizer = [[VCIDSSessionInfoSynchronizer alloc] initWithDelegate:v11 connectionManager:v11->super.super._connectionManager reportingAgent:a5];
    }
  }
  return v11;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  VTP_DeregisterConnectionManagerWithCallID([(VCConnectionManager *)self->super.super._connectionManager callID]);

  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionIDSMultiLink;
  [(VCTransportSessionIDS *)&v3 dealloc];
}

- (int)onStart
{
  return 0;
}

- (void)onStop
{
}

- (void)handleLinkConnectedWithInfo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A6C0]];
  if (v4)
  {
    v5 = v4;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v29;
      *(void *)&long long v7 = 136315906;
      long long v18 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (!VCConnectionIDSIsKnownRATType(objc_msgSend(v11, "RATType", v18))
            || !VCConnectionIDSIsKnownRATType([v11 remoteRATType]))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v16 = VRTraceErrorLogLevelToCSTR();
              v17 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                [(VCTransportSessionIDSMultiLink *)v16 handleLinkConnectedWithInfo:v17];
              }
            }
            return;
          }
          if (VCConnectionIDSIsCellularRATType([v11 RATType])) {
            -[VCConnectionManager setRealRATType:](self->super.super._connectionManager, "setRealRATType:", [v11 RATType]);
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if (v11) {
                objc_super v14 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
              }
              else {
                objc_super v14 = "<nil>";
              }
              *(_DWORD *)buf = v18;
              uint64_t v20 = v12;
              __int16 v21 = 2080;
              v22 = "-[VCTransportSessionIDSMultiLink handleLinkConnectedWithInfo:]";
              __int16 v23 = 1024;
              int v24 = 104;
              __int16 v25 = 2080;
              v26 = v14;
              _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: new link established with link context %s", buf, 0x26u);
            }
          }
          uint64_t v15 = [[VCConnectionIDS alloc] initWithLinkContext:v11 dataChannelToken:VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel)];
          [(VCConnectionManager *)self->super.super._connectionManager addConnection:v15];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v27 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
}

- (void)handleLinkDisconnectedWithInfo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id obj = (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A6D0]];
  if (obj)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v9 = VRTraceErrorLogLevelToCSTR();
            uint64_t v10 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if (v8) {
                v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
              }
              else {
                v11 = "<nil>";
              }
              *(_DWORD *)buf = 136315906;
              uint64_t v15 = v9;
              __int16 v16 = 2080;
              v17 = "-[VCTransportSessionIDSMultiLink handleLinkDisconnectedWithInfo:]";
              __int16 v18 = 1024;
              int v19 = 122;
              __int16 v20 = 2080;
              __int16 v21 = v11;
              _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: link %s disconnected", buf, 0x26u);
            }
          }
          uint64_t v12 = [[VCConnectionIDS alloc] initWithLinkContext:v8 dataChannelToken:VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel)];
          [(VCConnectionManager *)self->super.super._connectionManager removeConnection:v12];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v22 count:16];
      }
      while (v5);
    }
  }
}

- (void)handleSessionInfoResponse:(id)a3
{
}

- (void)handleProbingResponse:(id)a3
{
  if (a3)
  {
    connectionManager = self->super.super._connectionManager;
    -[VCConnectionManager updateProbingResults:](connectionManager, "updateProbingResults:");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSessionIDSMultiLink handleProbingResponse:]();
    }
  }
}

- (void)setQuickRelayServerProvider:(int)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a3 == 2);
  }
  [(VCConnectionManager *)self->super.super._connectionManager setRelayServerProvider:v3];
}

- (void)resetActiveConnection
{
}

- (void)setWiFiAssist:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    long long v7 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v5;
        __int16 v13 = 2080;
        objc_super v14 = "-[VCTransportSessionIDSMultiLink setWiFiAssist:]";
        __int16 v15 = 1024;
        int v16 = 167;
        __int16 v17 = 1024;
        BOOL v18 = v3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d try to setWiFiAssist = %d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      [(VCTransportSessionIDSMultiLink *)v5 setWiFiAssist:v6];
    }
  }
  stateQueue = self->super.super._stateQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__VCTransportSessionIDSMultiLink_setWiFiAssist___block_invoke;
  v9[3] = &unk_1E6DB3DF0;
  v9[4] = self;
  BOOL v10 = v3;
  dispatch_async(stateQueue, v9);
}

uint64_t __48__VCTransportSessionIDSMultiLink_setWiFiAssist___block_invoke(uint64_t result)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 288) != v2)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 288) = v2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(*(void *)(v3 + 32) + 288);
        int v7 = 136315906;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        BOOL v10 = "-[VCTransportSessionIDSMultiLink setWiFiAssist:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 171;
        __int16 v13 = 1024;
        int v14 = v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _isWiFiAssistActive = %d", (uint8_t *)&v7, 0x22u);
      }
    }
    return [*(id *)(*(void *)(v3 + 32) + 232) setWiFiAssist:*(unsigned __int8 *)(*(void *)(v3 + 32) + 288)];
  }
  return result;
}

- (void)setDefaultLink:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCTransportSessionIDSMultiLink_setDefaultLink___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  block[5] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __49__VCTransportSessionIDSMultiLink_setDefaultLink___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VCConnectionIDS_LinkID(*(void *)(a1 + 32));
  uint64_t v18 = *MEMORY[0x1E4F6A798];
  v19[0] = [NSNumber numberWithUnsignedChar:v2];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = VCDatagramChannelIDS_Token(*(void *)(*(void *)(a1 + 40) + 232));
      int v8 = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "-[VCTransportSessionIDSMultiLink setDefaultLink:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 181;
      __int16 v14 = 1024;
      int v15 = v2;
      __int16 v16 = 1024;
      int v17 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: set default link %d on datagram channel %d", (uint8_t *)&v8, 0x28u);
    }
  }
  return [*(id *)(*(void *)(a1 + 40) + 232) setChannelPreferences:v3];
}

- (void)primaryConnectionChanged:(id)a3 oldPrimaryConnection:(id)a4 activeConnection:(id)a5
{
  *(void *)&v27[13] = *MEMORY[0x1E4F143B8];
  [(VCTransportSession *)self updateBasebandForConnection:a5];
  [(VCTransportSessionIDSMultiLink *)self setDefaultLink:a3];
  if ([+[VCDefaults sharedInstance] forceWiFiAssist])
  {
    if (!VCConnection_IsLocalOnCellular((uint64_t)a5)) {
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        datagramChannel = self->super._datagramChannel;
        *(_DWORD *)buf = 136315906;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        long long v23 = "-[VCTransportSessionIDSMultiLink primaryConnectionChanged:oldPrimaryConnection:activeConnection:]";
        __int16 v24 = 1024;
        int v25 = 199;
        __int16 v26 = 2048;
        *(void *)uint64_t v27 = datagramChannel;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Force wifi assist active always on cellular channel, _datagramChannel %p", buf, 0x26u);
      }
    }
    uint64_t v12 = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int IsLocalOnWiFiOrWired = VCConnection_IsLocalOnWiFiOrWired((uint64_t)a3);
        __int16 v16 = self->super._datagramChannel;
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v13;
        __int16 v22 = 2080;
        long long v23 = "-[VCTransportSessionIDSMultiLink primaryConnectionChanged:oldPrimaryConnection:activeConnection:]";
        __int16 v24 = 1024;
        int v25 = 203;
        __int16 v26 = 1024;
        *(_DWORD *)uint64_t v27 = IsLocalOnWiFiOrWired;
        v27[2] = 2048;
        *(void *)&v27[3] = v16;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setWiFiAssist = %d, _datagramChannel %p", buf, 0x2Cu);
      }
    }
    uint64_t v12 = VCConnection_IsLocalOnWiFiOrWired((uint64_t)a5);
  }
  [(VCTransportSessionIDSMultiLink *)self setWiFiAssist:v12];
LABEL_12:
  if (VCConnection_IsEndToEndLink((uint64_t)a3))
  {
    if (!self->_oneToOneModeEnabled && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionIDSMultiLink primaryConnectionChanged:oldPrimaryConnection:activeConnection:]();
      }
    }
  }
  else
  {
    sessionInfoSynchronizer = self->_sessionInfoSynchronizer;
    if (self->_oneToOneModeEnabled) {
      [(VCIDSSessionInfoSynchronizer *)sessionInfoSynchronizer optInAllStreamsForConnection:a3];
    }
    else {
      [(VCIDSSessionInfoSynchronizer *)sessionInfoSynchronizer optInStreamIDsForNewPrimaryConnection:a3 oldPrimaryConnection:a4];
    }
  }
  v18[0] = @"transportSessionEventInfoNewPrimary";
  v18[1] = @"transportSessionEventInfoOldPrimary";
  v19[0] = a3;
  v19[1] = a4;
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 3, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2]);
}

- (void)connectionCallback:(id)a3 isInitialConnection:(BOOL)a4
{
  BOOL v4 = a4;
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    [(VCTransportSession *)self updateBasebandForConnection:a3];
    [(TimingCollection *)self->super.super._perfTimings stopTimingForKey:26];
    [(VCTransportSessionIDS *)self setConnectionSetupTime];
    [(VCIDSSessionInfoSynchronizer *)self->_sessionInfoSynchronizer optInStreamIDsForConnection:a3];
  }
  else if (VCConnection_Priority((uint64_t)a3) != 2 {
         && ![(VCConnectionManager *)self->super.super._connectionManager optIntoExistingSubscribedStreams])
  }
  {
    int v7 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->super.super._connectionManager);
    [(VCIDSSessionInfoSynchronizer *)self->_sessionInfoSynchronizer optOutStreamIDsForNonPrimaryConnection:a3 sentOnConnection:v7];
    if (v7) {
      CFRelease(v7);
    }
  }
  v8[0] = @"transportSessionEventInfoNewLink";
  v8[1] = @"transportSessionEventInfoIsFirstLink";
  v9[0] = a3;
  v9[1] = [NSNumber numberWithBool:v4];
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 1, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2]);
}

- (void)discardConnection:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    stateQueue = self->super.super._stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__VCTransportSessionIDSMultiLink_discardConnection___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = a3;
    block[5] = self;
    dispatch_async(stateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSessionIDSMultiLink discardConnection:]();
    }
  }
}

uint64_t __52__VCTransportSessionIDSMultiLink_discardConnection___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VCConnectionIDS_LinkID(*(void *)(a1 + 32));
  v24[0] = [NSNumber numberWithUnsignedChar:v2];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v22 = *MEMORY[0x1E4F6A7A0];
  uint64_t v23 = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = VCDatagramChannelIDS_Token(*(void *)(*(void *)(a1 + 40) + 232));
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      int v15 = "-[VCTransportSessionIDSMultiLink discardConnection:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 254;
      __int16 v18 = 1024;
      int v19 = v2;
      __int16 v20 = 1024;
      int v21 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: discard link %d on datagram channel %d", buf, 0x28u);
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 232) setChannelPreferences:v4];
  uint64_t v8 = *(void *)(a1 + 32);
  __int16 v10 = @"transportSessionEventInfoDisconnectedLink";
  uint64_t v11 = v8;
  return objc_msgSend(*(id *)(a1 + 40), "callEventHandlerWithEvent:info:", 2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
}

- (void)didEnableDuplication:(BOOL)a3 activeConnection:(id)a4
{
  BOOL v5 = a3;
  v25[2] = *MEMORY[0x1E4F143B8];
  [(VCTransportSession *)self updateBasebandForConnection:a4];
  v24[0] = @"transportSessionEventInfoIsDuplicationEnabled";
  v24[1] = @"transportSessionEventInfoActiveConnection";
  v25[0] = [NSNumber numberWithBool:v5];
  v25[1] = a4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136316418;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      int v15 = "-[VCTransportSessionIDSMultiLink didEnableDuplication:activeConnection:]";
      __int16 v16 = 1024;
      int v17 = 268;
      __int16 v18 = 1024;
      BOOL v19 = v5;
      __int16 v20 = 1024;
      int v21 = IsLocalOnCellular;
      __int16 v22 = 1024;
      int IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a4);
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _datagramChannel. isDuplicationEnabled = %d, activeConnection: isLocalOnCellular = %d, isRemoteOnCellular = %d", (uint8_t *)&v12, 0x2Eu);
    }
  }
  if (![+[VCDefaults sharedInstance] forceWiFiAssist])
  {
    BOOL v11 = v5 & IsLocalOnCellular;
    if (v11) {
      goto LABEL_10;
    }
    if (v5)
    {
      if (!VCConnection_IsEndToEndLink((uint64_t)a4)) {
        goto LABEL_17;
      }
      goto LABEL_12;
    }
    if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)a4)) {
LABEL_10:
    }
      [(VCTransportSessionIDSMultiLink *)self setWiFiAssist:!v11];
  }
  if (VCConnection_IsEndToEndLink((uint64_t)a4))
  {
LABEL_12:
    if (!self->_oneToOneModeEnabled && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionIDSMultiLink didEnableDuplication:activeConnection:]();
      }
    }
    goto LABEL_21;
  }
  if (v5)
  {
LABEL_17:
    [(VCIDSSessionInfoSynchronizer *)self->_sessionInfoSynchronizer optInStreamIDsForConnection:a4];
    goto LABEL_21;
  }
  if ([(VCConnectionManager *)self->super.super._connectionManager secondaryConnection]
    && ![(VCConnectionManager *)self->super.super._connectionManager optIntoExistingSubscribedStreams])
  {
    [(VCIDSSessionInfoSynchronizer *)self->_sessionInfoSynchronizer optOutStreamIDsForNonPrimaryConnection:[(VCConnectionManager *)self->super.super._connectionManager secondaryConnection] sentOnConnection:a4];
  }
LABEL_21:
  [(VCTransportSession *)self callEventHandlerWithEvent:4 info:v7];
}

- (void)didUpdatePreferredInterfaceForDuplication:(unsigned __int8)a3 notifyPeer:(BOOL)a4 enableDuplication:(BOOL)a5 isMediaUnrecoverableSignal:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  uint64_t v8 = a3;
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"transportSessionEventInfoIsDuplicationEnabled";
  v11[0] = [NSNumber numberWithBool:a5];
  v10[1] = @"transportSessionEventInfoPreferredInterfaceForDuplication";
  v11[1] = [NSNumber numberWithUnsignedChar:v8];
  v10[2] = @"transportSessionEventInfoNotifyPeer";
  v11[2] = [NSNumber numberWithBool:v7];
  v10[3] = @"transportSessionEventInfoIsMediaUnrecoverableSignal";
  v11[3] = [NSNumber numberWithBool:v6];
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 15, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4]);
}

- (void)didMediaQualityDegrade:(BOOL)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"transportSessionEventInfoIsMediaQualityDegraded";
  v5[0] = [NSNumber numberWithBool:a3];
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 19, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

- (void)didLocalNetworkQualityChange:(BOOL)a3 isLocalNetworkQualityBad:(BOOL)a4 isRemoteNetworkQualityBad:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  void v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"transportSessionEventInfoDidLocalNetworkConditionChange";
  v9[0] = [NSNumber numberWithBool:a3];
  v8[1] = @"transportSessionEventInfoIsLocalNetworkQualityDegraded";
  v9[1] = [NSNumber numberWithBool:v6];
  void v8[2] = @"transportSessionEventInfoIsRemoteNetworkQualityDegraded";
  v9[2] = [NSNumber numberWithBool:v5];
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 20, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3]);
}

- (void)updateParticipantGenerationCounter:(unsigned __int8)a3
{
}

- (void)resetParticipantGenerationCounter
{
}

- (void)optOutAllStreamsForConnection:(id)a3
{
  if (VCConnection_Priority((uint64_t)a3) != 2)
  {
    BOOL v5 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->super.super._connectionManager);
    [(VCIDSSessionInfoSynchronizer *)self->_sessionInfoSynchronizer optOutStreamIDsForNonPrimaryConnection:a3 sentOnConnection:v5];
    if (v5)
    {
      CFRelease(v5);
    }
  }
}

- (void)optIntoExistingSubscribedStreamsForConnection:(id)a3
{
}

- (void)setOneToOneModeEnabled:(BOOL)a3 isInitiator:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = "disabled";
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v7;
      __int16 v16 = 2080;
      int v17 = "-[VCTransportSessionIDSMultiLink setOneToOneModeEnabled:isInitiator:]";
      if (v5) {
        uint64_t v9 = "enabled";
      }
      __int16 v18 = 1024;
      int v19 = 340;
      __int16 v20 = 2080;
      int v21 = v9;
      __int16 v22 = 1024;
      BOOL v23 = v4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: oneToOneMode %s for isInitiator: %d", buf, 0x2Cu);
    }
  }
  self->_oneToOneModeEnabled = v5;
  [(VCConnectionManager *)self->super.super._connectionManager setOptIntoExistingSubscribedStreams:v5];
  if (self->_oneToOneModeEnabled) {
    [(VCIDSSessionInfoSynchronizer *)self->_sessionInfoSynchronizer resetPeerSubscribedStreams];
  }
  stateQueue = self->super.super._stateQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__VCTransportSessionIDSMultiLink_setOneToOneModeEnabled_isInitiator___block_invoke;
  v11[3] = &unk_1E6DB4658;
  v11[4] = self;
  BOOL v12 = v5;
  BOOL v13 = v4;
  dispatch_async(stateQueue, v11);
}

void *__69__VCTransportSessionIDSMultiLink_setOneToOneModeEnabled_isInitiator___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 232) setOneToOneModeEnabled:*(unsigned __int8 *)(a1 + 40) isInitiator:*(unsigned __int8 *)(a1 + 41)];
  result = *(void **)(*(void *)(a1 + 32) + 168);
  if (result)
  {
    result = (void *)[result objectForKey:@"qrse_und2"];
    if (result)
    {
      int v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "objectForKeyedSubscript:", @"qrse_und2"), "BOOLValue");
      BOOL v4 = @"transportSessionEventInfoIsUplinkRetransmissionSupported";
      v5[0] = [NSNumber numberWithBool:v3 ^ 1u];
      return objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 21, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
    }
  }
  return result;
}

- (void)startActiveProbingWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VCTransportSessionIDSMultiLink_startActiveProbingWithOptions___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __64__VCTransportSessionIDSMultiLink_startActiveProbingWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = VCDatagramChannelIDS_Token(*(void *)(*(void *)(a1 + 32) + 232));
      uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F6A7D0]];
      uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F6A7C8]];
      uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F6A7E0]];
      int v9 = 136316674;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      BOOL v12 = "-[VCTransportSessionIDSMultiLink startActiveProbingWithOptions:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 360;
      __int16 v15 = 1024;
      int v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Start active probing on datagram channel %d on connections with link IDs: %@ with interval: %@ and timeout: %@", (uint8_t *)&v9, 0x40u);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 232) startActiveProbingWithOptions:*(void *)(a1 + 40)];
}

- (void)stopActiveProbingWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VCTransportSessionIDSMultiLink_stopActiveProbingWithOptions___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __63__VCTransportSessionIDSMultiLink_stopActiveProbingWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = VCDatagramChannelIDS_Token(*(void *)(*(void *)(a1 + 32) + 232));
      uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F6A7D0]];
      int v7 = 136316162;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCTransportSessionIDSMultiLink stopActiveProbingWithOptions:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 367;
      __int16 v13 = 1024;
      int v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Stop active probing on datagram channel %d on connections with link IDs: %@", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 232) stopActiveProbingWithOptions:*(void *)(a1 + 40)];
}

- (void)queryProbingResultsWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VCTransportSessionIDSMultiLink_queryProbingResultsWithOptions___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __65__VCTransportSessionIDSMultiLink_queryProbingResultsWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = VCDatagramChannelIDS_Token(*(void *)(*(void *)(a1 + 32) + 232));
      uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F6A7D0]];
      int v7 = 136316162;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCTransportSessionIDSMultiLink queryProbingResultsWithOptions:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 374;
      __int16 v13 = 1024;
      int v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Query probing results on datagram channel %d on connections with link IDs: %@", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 232) queryProbingResultsWithOptions:*(void *)(a1 + 40)];
}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCTransportSessionIDSMultiLink_flushLinkProbingStatusWithOptions___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __68__VCTransportSessionIDSMultiLink_flushLinkProbingStatusWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = VCDatagramChannelIDS_Token(*(void *)(*(void *)(a1 + 32) + 232));
      uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F6A7D0]];
      int v7 = 136316162;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCTransportSessionIDSMultiLink flushLinkProbingStatusWithOptions:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 381;
      __int16 v13 = 1024;
      int v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Flush link probing results on datagram channel %d on connections with link IDs: %@", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 232) flushLinkProbingStatusWithOptions:*(void *)(a1 + 40)];
}

- (void)setRemoteDeviceVersionIDS
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__VCTransportSessionIDSMultiLink_setRemoteDeviceVersionIDS__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __59__VCTransportSessionIDSMultiLink_setRemoteDeviceVersionIDS__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) remoteDeviceVersionIDS];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      __int16 v11 = "-[VCTransportSessionIDSMultiLink setRemoteDeviceVersionIDS]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 389;
      __int16 v14 = 1024;
      int v15 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting the remote device version=%d", buf, 0x22u);
    }
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v2, *MEMORY[0x1E4F6A7B8]);
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "setChannelPreferences:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
}

- (void)requestStatsWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VCTransportSessionIDSMultiLink_requestStatsWithOptions___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __58__VCTransportSessionIDSMultiLink_requestStatsWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = VCDatagramChannelIDS_Token(*(void *)(*(void *)(a1 + 32) + 232));
      uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F6A730]];
      uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F6A830]];
      int v8 = 136316418;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      __int16 v11 = "-[VCTransportSessionIDSMultiLink requestStatsWithOptions:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 397;
      __int16 v14 = 1024;
      int v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Request stats for datagram channel=%d on connection with link ID=%@ statsID=%@", (uint8_t *)&v8, 0x36u);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 232) requestStatsWithOptions:*(void *)(a1 + 40)];
}

- (void)logSignalStrength
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  int v4 = 0;
  [(VCTransportSessionIDS *)self getSignalStrengthBars:(char *)&v5 + 4 displayBars:&v5 maxDisplayBars:&v4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCTransportSessionIDSMultiLink logSignalStrength]";
      __int16 v10 = 1024;
      int v11 = 409;
      __int16 v12 = 1024;
      int v13 = HIDWORD(v5);
      __int16 v14 = 1024;
      int v15 = v5;
      __int16 v16 = 1024;
      int v17 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SignalStrength bars=%d displayBars=%d maxDisplayBars=%d", buf, 0x2Eu);
    }
  }
}

- (void)VCIDSSessionInfoSynchronizer:(void *)a3 sendVCIDSSessionInfoRequest:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    stateQueue = self->super.super._stateQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__VCTransportSessionIDSMultiLink_VCIDSSessionInfoSynchronizer_sendVCIDSSessionInfoRequest___block_invoke;
    void v9[3] = &unk_1E6DB3E40;
    void v9[4] = self;
    void v9[5] = a4;
    dispatch_async(stateQueue, v9);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    __int16 v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      int v13 = "-[VCTransportSessionIDSMultiLink VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:]";
      __int16 v14 = 1024;
      int v15 = 417;
      __int16 v16 = 2048;
      int v17 = a3;
      __int16 v18 = 2048;
      id v19 = a4;
      _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d synchronizer = %p, request = %p", buf, 0x30u);
    }
  }
}

uint64_t __91__VCTransportSessionIDSMultiLink_VCIDSSessionInfoSynchronizer_sendVCIDSSessionInfoRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) requestSessionInfoWithOptions:*(void *)(a1 + 40)];
}

- (VCIDSSessionInfoSynchronizer)sessionInfoSynchronizer
{
  return self->_sessionInfoSynchronizer;
}

- (void)handleLinkConnectedWithInfo:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = 136316162;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  __int16 v8 = "-[VCTransportSessionIDSMultiLink handleLinkConnectedWithInfo:]";
  __int16 v9 = 1024;
  int v10 = 99;
  __int16 v11 = 1024;
  int v12 = [a2 RATType];
  __int16 v13 = 1024;
  int v14 = [a2 remoteRATType];
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Discarding link with unknown RAT local %d remote %d", (uint8_t *)&v5, 0x28u);
}

- (void)handleProbingResponse:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Probing response received is invalid", v2, v3, v4, v5, v6);
}

- (void)setWiFiAssist:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint8_t v6 = "-[VCTransportSessionIDSMultiLink setWiFiAssist:]";
  __int16 v7 = 1024;
  int v8 = 167;
  __int16 v9 = 1024;
  int v10 = a2 & 1;
  _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d try to setWiFiAssist = %d", (uint8_t *)&v3, 0x22u);
}

- (void)primaryConnectionChanged:oldPrimaryConnection:activeConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Primary connection changed to an end-to-end connection in GFT", v2, v3, v4, v5, v6);
}

- (void)discardConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d got a nil connection, return", v2, v3, v4, v5, v6);
}

- (void)didEnableDuplication:activeConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Active connection is end-to-end when updating duplication state", v2, v3, v4, v5, v6);
}

@end