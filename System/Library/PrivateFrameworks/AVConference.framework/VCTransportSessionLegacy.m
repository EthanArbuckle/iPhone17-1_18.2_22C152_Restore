@interface VCTransportSessionLegacy
- (BOOL)allowsRelay;
- (BOOL)createTCPTunnelForParticipantID:(id)a3 relayDictionary:(id)a4 didOriginateRequest:(BOOL)a5 relayType:(unsigned __int8)a6 error:(id *)a7;
- (BOOL)getConnectionSetupData:(id *)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)handleExchangedKey:(id)a3 result:(int)a4;
- (BOOL)initialSecondaryRelaySetupDone;
- (BOOL)isCaller;
- (BOOL)isConnectedAndAllowAdditionalConnection;
- (BOOL)isHandoverSupported;
- (BOOL)isRemoteOSPreLion;
- (BOOL)startConnectionWithBlob:(id)a3 useRelay:(BOOL)a4 isInitialRelay:(BOOL)a5 error:(id *)a6;
- (NSData)localConnectionData;
- (NSData)localRelayConnectionData;
- (NSData)remoteConnectionData;
- (NSData)remoteRelayConnectionData;
- (NSDictionary)localRelayUpdate;
- (NSDictionary)remoteRelayUpdate;
- (NSMutableDictionary)localRelayRequestResponse;
- (NSMutableDictionary)remoteRelayRequestResponse;
- (NSString)localParticipantID;
- (NSString)remoteParticipantID;
- (NSString)sessionID;
- (VCTransportSessionLegacy)initWithCallID:(unsigned int)a3 reportingAgent:(id)a4;
- (VCTransportSessionLegacyDelegate)delegate;
- (double)iceTimeoutInSeconds:(BOOL)a3;
- (id)connectionData:(char *)a3 connectionDataSizeInBytes:(int)a4 shouldUseRelay:(BOOL)a5;
- (id)connectionDataUsingRelay:(BOOL)a3 isInitialRelay:(BOOL)a4 nonCellularCandidateTimeout:(double)a5 error:(id *)a6;
- (id)createInitiateRelayDictionary;
- (id)createInitiateRelayDictionaryForCall:(unsigned int)a3 primaryConnection:(tagCONNRESULT *)a4;
- (id)createRelayUpdateDictionary:(id)a3;
- (int)NATType;
- (int)detailedErrorCode;
- (int)flushBasebandQueueForConnection:(id)a3 payloadInfoList:(id)a4;
- (int)generateConnectionData:(char *)a3 forCallID:(unsigned int)a4 connectionDataSize:(int *)a5 nonCellularCandidateTimeout:(double)a6;
- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5;
- (int)operatingMode;
- (int)pendingRelayCount;
- (int)registerBasebandNotificationsForConnection:(id)a3;
- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4;
- (tagIPPORT)IPPortForPrimaryConnectionOnLocalInterface:(SEL)a3;
- (unsigned)connectionSetupRTTEstimate;
- (unsigned)connectionTypeForConnectionResult:(tagCONNRESULT *)a3;
- (unsigned)remoteCallID;
- (unsigned)transportCallType;
- (void)connectionCallback:(id)a3 isInitialConnection:(BOOL)a4;
- (void)connectionResultCallback:(tagCONNRESULT *)a3 didReceiveICEPacket:(BOOL)a4 didUseRelay:(BOOL)a5 secretKey:(id)a6 skeResult:(int)a7;
- (void)createSecondaryRelayDispatchTimer:(float)a3 callID:(unsigned int)a4 callerRequired:(BOOL)a5;
- (void)dealloc;
- (void)deleteTCPTunnel;
- (void)deregisterBasebandNotifications;
- (void)destroySecondaryRelayDispatchTimer;
- (void)didEnableDuplication:(BOOL)a3 activeConnection:(id)a4;
- (void)getConnectionDataUsingRelay:(BOOL)a3 isInitialRelay:(BOOL)a4 nonCellularCandidateTimeout:(double)a5 queue:(id)a6 completionHandler:(id)a7;
- (void)handleConnectionSetupDataChangeMessageDelivered;
- (void)handleMediaReceivedOverPeerToPeerLinkWithConnectionId:(int)a3;
- (void)handleMediaReceivedOverRelayLinkWithConnectionId:(int)a3;
- (void)handleNewCandidates:(id)a3 version:(unsigned __int16)a4;
- (void)initiateRelayRequest;
- (void)loopbackSocketTunnel:(id)a3 receivedData:(id)a4 from:(tagIPPORT *)a5;
- (void)networkStateDidChange;
- (void)notifyDelegateToCancelRelay;
- (void)primaryConnectionChanged:(id)a3 oldPrimaryConnection:(id)a4 activeConnection:(id)a5;
- (void)processRelayRequestResponse:(id)a3 didOriginateRequest:(BOOL)a4;
- (void)processRelayUpdate:(id)a3 didOriginateRequest:(BOOL)a4;
- (void)processRemoteIPChange:(char *)a3 dataLength:(int)a4 remoteCandidateVersion:(unsigned __int16)a5;
- (void)processRemoteIPChange:(id)a3;
- (void)receivedRealTimeData:(id)a3 fromParticipantID:(id)a4;
- (void)reportNetworkConditionsDegraded;
- (void)resetICETimeoutToLongTimeout;
- (void)resetLoopback;
- (void)setAllowsRelay:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForceRelay;
- (void)setIdentity:(__SecIdentity *)a3;
- (void)setInitialSecondaryRelaySetupDone:(BOOL)a3;
- (void)setIsCaller:(BOOL)a3;
- (void)setLocalConnectionData:(id)a3;
- (void)setLocalParticipantID:(id)a3;
- (void)setLocalRelayConnectionData:(id)a3;
- (void)setLocalRelayRequestResponse:(id)a3;
- (void)setLocalRelayUpdate:(id)a3;
- (void)setNATType:(int)a3;
- (void)setOperatingMode:(int)a3;
- (void)setPendingRelayCount:(int)a3;
- (void)setRemoteCallID:(unsigned int)a3;
- (void)setRemoteConnectionData:(id)a3;
- (void)setRemoteParticipantID:(id)a3;
- (void)setRemoteRelayConnectionData:(id)a3;
- (void)setRemoteRelayRequestResponse:(id)a3;
- (void)setRemoteRelayUpdate:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setupInitialSecondaryRelayWithCallbackRelayFlag:(BOOL)a3 callID:(unsigned int)a4 connectionId:(int)a5;
- (void)setupLoopbackWithConnectionType:(unsigned int)a3;
- (void)setupPendingSecondaryRelayWithNewPrimary:(id)a3;
- (void)setupSecondaryRelayForCall:(unsigned int)a3 callerRequired:(BOOL)a4;
- (void)setupTransport;
- (void)start;
- (void)stop;
- (void)stopLoopback;
- (void)stopLoopbackProc:(id)a3;
@end

@implementation VCTransportSessionLegacy

- (VCTransportSessionLegacy)initWithCallID:(unsigned int)a3 reportingAgent:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCTransportSessionLegacy;
  v6 = -[VCTransportSession initWithNotificationQueue:reportingAgent:](&v14, sel_initWithNotificationQueue_reportingAgent_, 0);
  if (v6)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"enableRelay", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      v6->allowsRelay = AppBooleanValue != 0;
    }
    objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-pre-relay-timeout"), "doubleValue");
    float v9 = v8;
    if (v9 < 3.0) {
      float v9 = 6.0;
    }
    v6->callerPreEmptiveTimeoutInSecs = v9;
    v10 = objc_alloc_init(GKInterfaceListener);
    v6->_interfaceListener = v10;
    [(GKInterfaceListener *)v10 setInterfaceListenerDelegate:v6];
    v11 = objc_alloc_init(VCConnectionManagerLegacy);
    v6->super._connectionManager = &v11->super;
    [(VCConnectionManager *)v11 setupConnectionHealthMonitor];
    [(VCConnectionManager *)v6->super._connectionManager setReportingAgent:a4];
    [(VCTransport *)v6->transport setReportingAgent:a4];
    [(VCConnectionManager *)v6->super._connectionManager setCallID:v5];
    [(VCConnectionManager *)v6->super._connectionManager setDelegate:v6];
    VTP_RegisterConnectionManagerWithCallID(v6->super._connectionManager, v5);
    v6->_callID = v5;
    v6->super._requiresWiFi = 1;
    v6->_connectionDataTimeoutCondVar = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
    v6->super._useCompressedConnectionData = 1;
    v6->_localU8Version = 1;
    [(VCTransportSessionLegacy *)v6 setupTransport];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCTransport *)self->transport stopConnectivityCheckForCallID:self->_callID];
  [(VCTransport *)self->transport discardRelayBindingForCallID:self->_callID];

  VTP_DeregisterConnectionManagerWithCallID(self->_callID);
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  objc_storeWeak(&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)VCTransportSessionLegacy;
  [(VCTransportSession *)&v4 dealloc];
}

- (VCTransportSessionLegacyDelegate)delegate
{
  return (VCTransportSessionLegacyDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)start
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__VCTransportSessionLegacy_start__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __33__VCTransportSessionLegacy_start__block_invoke(uint64_t a1)
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 64) startTimingForKey:14];
  [*(id *)(*(void *)(a1 + 32) + 440) startRoutingChangeListener];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 263)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [*(id *)(v2 + 280) updateICERoleForCallID:*(unsigned int *)(v2 + 288) role:v3 remoteCallID:*(unsigned int *)(v2 + 292) sessionID:*(void *)(v2 + 384)];
  [*(id *)(a1 + 32) initiateRelayRequest];
  v6[0] = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "startConnectionWithBlob:useRelay:isInitialRelay:error:", objc_msgSend(*(id *)(a1 + 32), "remoteConnectionData"), 0, 0, v6))
  {
    [*(id *)(*(void *)(a1 + 32) + 72) start];
    uint64_t result = [*(id *)(a1 + 32) addNetworkAssertionWithInterfaceType:3];
    *(unsigned char *)(*(void *)(a1 + 32) + 267) = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __33__VCTransportSessionLegacy_start__block_invoke_cold_1(v5, v6);
      }
    }
    return [*(id *)(a1 + 32) callEventHandlerWithEvent:7 info:v6[0]];
  }
  return result;
}

- (BOOL)startConnectionWithBlob:(id)a3 useRelay:(BOOL)a4 isInitialRelay:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v20 = a4;
  uint64_t v11 = [self->super._connectionSetupPiggybackBlob pointerValue];
  [(TimingCollection *)self->super._perfTimings stopTimingForKey:12];
  if (!v8 || v7)
  {
    if (v8 && v7) {
      uint64_t v12 = 10;
    }
    else {
      uint64_t v12 = 0;
    }
    [(TimingCollection *)self->super._perfTimings startTimingForKey:v12];
  }
  if ([+[VCDefaults sharedInstance] forceIPv6]) {
    [(VCTransport *)self->transport setForceIPv6ForCallID:self->_callID];
  }
  transport = self->transport;
  uint64_t callID = self->_callID;
  uint64_t v15 = [(VCTransportSessionLegacy *)self remoteRelayUpdate];
  [(VCTransportSessionLegacy *)self iceTimeoutInSeconds:v8];
  int v16 = -[VCTransport startConnectionCheckForCallID:remoteConnectionDataBlob:relayDictionary:iceTimeout:securityIdentity:skeState:usedRelay:](transport, "startConnectionCheckForCallID:remoteConnectionDataBlob:relayDictionary:iceTimeout:securityIdentity:skeState:usedRelay:", callID, a3, v15, self->_identity, v11, &v20);
  if (v16 < 0)
  {
    uint64_t v17 = 207;
    if (v8) {
      uint64_t v17 = 250;
    }
    if (self->_tcpTunnelClient) {
      uint64_t v18 = 251;
    }
    else {
      uint64_t v18 = v17;
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a6, 32002, v18, v16, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 230), @"Could not connect", @"connection check returned error");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionLegacy startConnectionWithBlob:useRelay:isInitialRelay:error:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCTransportSessionLegacy startConnectionWithBlob:useRelay:isInitialRelay:error:]();
      }
    }
  }
  return v16 >= 0;
}

- (void)stop
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(VCTransport *)self->transport setSKEState:0 forCallID:self->_callID];
  v5.receiver = self;
  v5.super_class = (Class)VCTransportSessionLegacy;
  [(VCTransportSession *)&v5 stop];
  stateQueue = self->super._stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__VCTransportSessionLegacy_stop__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(stateQueue, v4);
}

uint64_t __32__VCTransportSessionLegacy_stop__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 267) = 0;
  [*(id *)(*(void *)(a1 + 32) + 72) stop];
  [*(id *)(*(void *)(a1 + 32) + 280) registerICEBlockForCallID:*(unsigned int *)(*(void *)(a1 + 32) + 288) connectedBlock:0 newCandidatesBlock:0 newNominationBlock:0 removeIPPortBlock:0];
  [*(id *)(*(void *)(a1 + 32) + 280) cleanup];
  [*(id *)(*(void *)(a1 + 32) + 440) stopRoutingChangeListener];
  [*(id *)(*(void *)(a1 + 32) + 440) setInterfaceListenerDelegate:0];
  [*(id *)(a1 + 32) stopLoopback];
  [*(id *)(a1 + 32) removeNetworkAssertion];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setDelegate:0];
}

- (void)setForceRelay
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int callID = self->_callID;
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      float v9 = "-[VCTransportSessionLegacy setForceRelay]";
      __int16 v10 = 1024;
      int v11 = 266;
      __int16 v12 = 1024;
      unsigned int v13 = callID;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Force Relay is set for call (%d)", (uint8_t *)&v6, 0x22u);
    }
  }
  [(VCTransport *)self->transport setForceRelayForCallID:self->_callID];
}

- (void)processRelayRequestResponse:(id)a3 didOriginateRequest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    __int16 v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        float v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        float v9 = "<nil>";
      }
      int64_t relayState = self->relayState;
      *(_DWORD *)buf = 136316418;
      uint64_t v15 = v7;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]";
      __int16 v18 = 1024;
      int v19 = 283;
      __int16 v20 = 2080;
      uint64_t v21 = v9;
      __int16 v22 = 1024;
      int v23 = relayState;
      __int16 v24 = 1024;
      BOOL v25 = v4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relay: processRelayRequestResponseDict:%s, %d, %d", buf, 0x32u);
    }
  }
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke;
  block[3] = &unk_1E6DB3E18;
  BOOL v13 = v4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 260))
  {
    unint64_t v3 = *(void *)(v1 + 240);
    if ((v3 > 3 || v3 == 2) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 240);
        *(_DWORD *)buf = 136316162;
        uint64_t v36 = v20;
        __int16 v37 = 2080;
        v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
        __int16 v39 = 1024;
        int v40 = 297;
        __int16 v41 = 1024;
        *(_DWORD *)v42 = 297;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v22;
        _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: processRelayRequestResponseDict bailing because relayState is %d", buf, 0x28u);
      }
    }
    id v34 = 0;
    int v5 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1 + 40)];
    uint64_t v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 setLocalRelayRequestResponse:v6];
      uint64_t v8 = [*(id *)(a1 + 32) localRelayRequestResponse];
    }
    else
    {
      [v7 setRemoteRelayRequestResponse:v6];
      uint64_t v8 = [*(id *)(a1 + 32) remoteRelayRequestResponse];
    }
    int v11 = (void *)v8;
    uint64_t v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"GKSRelayRemotePrimaryIdentifier"];
    uint64_t v13 = 3;
    if (!v12) {
      uint64_t v13 = 1;
    }
    *(void *)(*(void *)(a1 + 32) + 240) = v13;
    uint64_t v14 = (void *)[v11 objectForKeyedSubscript:@"GKSRelayType"];
    if (v14)
    {
      uint64_t v15 = [v14 unsignedCharValue];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = "TCP";
          uint64_t v36 = v16;
          *(_DWORD *)buf = 136315906;
          v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
          __int16 v37 = 2080;
          if (!v15) {
            __int16 v18 = "UDP";
          }
          __int16 v39 = 1024;
          int v40 = 321;
          __int16 v41 = 2080;
          *(void *)v42 = v18;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processRelayRequestResponseDict: %s relay.", buf, 0x26u);
        }
      }
      if (v15)
      {
        [*(id *)(a1 + 32) deleteTCPTunnel];
        if (([*(id *)(a1 + 32) createTCPTunnelForParticipantID:*(void *)(*(void *)(a1 + 32) + 368) relayDictionary:v11 didOriginateRequest:*(unsigned __int8 *)(a1 + 48) relayType:v15 error:&v34] & 1) == 0)
        {
          *(void *)(*(void *)(a1 + 32) + 240) = 6;
          if (objc_opt_class() == *(void *)(a1 + 32))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if (VRTraceIsOSFaultDisabled())
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_2();
                }
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
              {
                __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_3();
              }
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              int v19 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
            }
            else {
              int v19 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              uint64_t v23 = VRTraceErrorLogLevelToCSTR();
              char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
              BOOL v25 = *MEMORY[0x1E4F47A50];
              if (IsOSFaultDisabled)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                {
                  uint64_t v26 = *(void *)(a1 + 32);
                  if ([v34 userInfo]) {
                    v27 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "userInfo"), "description"), "UTF8String");
                  }
                  else {
                    v27 = "<nil>";
                  }
                  *(_DWORD *)buf = 136316418;
                  uint64_t v36 = v23;
                  __int16 v37 = 2080;
                  v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
                  __int16 v39 = 1024;
                  int v40 = 337;
                  __int16 v41 = 2112;
                  *(void *)v42 = v19;
                  *(_WORD *)&v42[8] = 2048;
                  uint64_t v43 = v26;
                  __int16 v44 = 2080;
                  v45 = v27;
                  _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to create TCPTunnel: %s", buf, 0x3Au);
                }
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
              {
                uint64_t v28 = *(void *)(a1 + 32);
                if ([v34 userInfo]) {
                  v29 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "userInfo"), "description"), "UTF8String");
                }
                else {
                  v29 = "<nil>";
                }
                *(_DWORD *)buf = 136316418;
                uint64_t v36 = v23;
                __int16 v37 = 2080;
                v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
                __int16 v39 = 1024;
                int v40 = 337;
                __int16 v41 = 2112;
                *(void *)v42 = v19;
                *(_WORD *)&v42[8] = 2048;
                uint64_t v43 = v28;
                __int16 v44 = 2080;
                v45 = v29;
                _os_log_fault_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Unable to create TCPTunnel: %s", buf, 0x3Au);
              }
            }
          }
        }
        return;
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_1();
      }
    }
    [*(id *)(a1 + 32) resetICETimeoutToLongTimeout];
    reportingLog();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_38;
    v30[3] = &unk_1E6DB7758;
    char v32 = *(unsigned char *)(a1 + 48);
    BOOL v33 = v12 != 0;
    long long v31 = *(_OWORD *)(a1 + 32);
    [(id)v31 getConnectionDataUsingRelay:1 isInitialRelay:v12 == 0 nonCellularCandidateTimeout:*(void *)(v31 + 16) queue:v30 completionHandler:0.0];
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v36 = v9;
      __int16 v37 = 2080;
      v38 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
      __int16 v39 = 1024;
      int v40 = 289;
      __int16 v41 = 1024;
      *(_DWORD *)v42 = 289;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: processRelayRequestResponseDict bailing because relay is not allowed.", buf, 0x22u);
    }
  }
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    BOOL v4 = *(char **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48)) {
      int v5 = &OBJC_IVAR___VCTransportSessionLegacy__localRelayRequestResponse;
    }
    else {
      int v5 = &OBJC_IVAR___VCTransportSessionLegacy__remoteRelayRequestResponse;
    }
    objc_msgSend(*(id *)(a1 + 32), "setLocalRelayUpdate:", objc_msgSend(v4, "createRelayUpdateDictionary:", *(void *)&v4[*v5]));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v6 + 24);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_39;
    v15[3] = &unk_1E6DB3DC8;
    v15[4] = v6;
    dispatch_async(v7, v15);
    uint64_t v8 = 4;
    if (!*(unsigned char *)(a1 + 49)) {
      uint64_t v8 = 2;
    }
    *(void *)(*(void *)(a1 + 32) + 240) = v8;
    if (*(void *)(*(void *)(a1 + 32) + 328)
      && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"GKSRelayConnectionID"), "isEqualToData:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 328), "objectForKeyedSubscript:", @"GKSRelayConnectionID")))
    {
      objc_msgSend(*(id *)(a1 + 32), "setRemoteRelayConnectionData:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 328), "objectForKeyedSubscript:", @"ClientData"));
      uint64_t v16 = 0;
      *(void *)(*(void *)(a1 + 32) + 240) = 0;
      if ((objc_msgSend(*(id *)(a1 + 32), "startConnectionWithBlob:useRelay:isInitialRelay:error:", objc_msgSend(*(id *)(a1 + 32), "remoteRelayConnectionData"), 1, *(unsigned char *)(a1 + 49) == 0, &v16) & 1) == 0)objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 7, v16); {
    }
      }
  }
  else if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_38_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      __int16 v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        if ([a3 userInfo]) {
          uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "description"), "UTF8String");
        }
        else {
          uint64_t v14 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v18 = v11;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 353;
        __int16 v23 = 2112;
        __int16 v24 = v10;
        __int16 v25 = 2048;
        uint64_t v26 = v13;
        __int16 v27 = 2080;
        uint64_t v28 = v14;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unabled to create UDP relay blob: %s", buf, 0x3Au);
      }
    }
  }
}

uint64_t __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_39(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 localRelayUpdate];

  return [v2 transportSession:v3 sendRelayResponse:v4];
}

- (void)processRelayUpdate:(id)a3 didOriginateRequest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v9 = "<nil>";
      }
      int64_t relayState = self->relayState;
      *(_DWORD *)buf = 136316418;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]";
      __int16 v17 = 1024;
      int v18 = 410;
      __int16 v19 = 2080;
      uint64_t v20 = v9;
      __int16 v21 = 1024;
      BOOL v22 = v4;
      __int16 v23 = 1024;
      int v24 = relayState;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relay: processRelayUpdateDict:%s, %d, %d", buf, 0x32u);
    }
  }
  stateQueue = self->super._stateQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__VCTransportSessionLegacy_processRelayUpdate_didOriginateRequest___block_invoke;
  v12[3] = &unk_1E6DB3E40;
  v12[4] = self;
  v12[5] = a3;
  dispatch_async(stateQueue, v12);
}

void __67__VCTransportSessionLegacy_processRelayUpdate_didOriginateRequest___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[260])
  {
    [v2 setRemoteRelayUpdate:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 240);
    if (v3 != 2 && v3 != 4)
    {
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        BOOL v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 240);
          *(_DWORD *)uint64_t v26 = 136316162;
          *(void *)&v26[4] = v21;
          __int16 v27 = 2080;
          uint64_t v28 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]_block_invoke";
          __int16 v29 = 1024;
          int v30 = 423;
          __int16 v31 = 1024;
          *(_DWORD *)char v32 = 423;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v23;
          __int16 v17 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportS"
                "essionLegacy.m:%d: processRelayUpdateDict: wait until allocation is finished %d";
          int v18 = v22;
          uint32_t v19 = 40;
          goto LABEL_25;
        }
      }
      return;
    }
    int v5 = (void *)[*(id *)(a1 + 40) objectForKeyedSubscript:@"GKSRelayType"];
    if (v5)
    {
      int v6 = [v5 unsignedCharValue];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = "TCP";
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 240);
          *(_DWORD *)uint64_t v26 = 136316162;
          if (!v6) {
            uint64_t v9 = "UDP";
          }
          *(void *)&v26[4] = v7;
          __int16 v27 = 2080;
          uint64_t v28 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]_block_invoke";
          __int16 v29 = 1024;
          int v30 = 433;
          __int16 v31 = 2080;
          *(void *)char v32 = v9;
          *(_WORD *)&v32[8] = 1024;
          int v33 = v10;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processRelayUpdateDict: %s relay, %d", v26, 0x2Cu);
        }
      }
      if (v6)
      {
        if (*(void *)(*(void *)(a1 + 32) + 240) != 2) {
          return;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          uint64_t v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = *(void **)(a1 + 40);
            if (v13) {
              uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
            }
            else {
              uint64_t v14 = "<nil>";
            }
            *(_DWORD *)uint64_t v26 = 136315906;
            *(void *)&v26[4] = v11;
            __int16 v27 = 2080;
            uint64_t v28 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]_block_invoke";
            __int16 v29 = 1024;
            int v30 = 440;
            __int16 v31 = 2080;
            *(void *)char v32 = v14;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: relayUpdateDict %s", v26, 0x26u);
          }
        }
        *(void *)uint64_t v26 = 0;
        if ([*(id *)(*(void *)(a1 + 32) + 400) sendChannelBindingMsgWithDict:*(void *)(a1 + 40) error:v26])return; {
        *(void *)(*(void *)(a1 + 32) + 240) = 6;
        }
LABEL_37:
        objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 7, *(void *)v26, *(void *)v26);
        return;
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __67__VCTransportSessionLegacy_processRelayUpdate_didOriginateRequest___block_invoke_cold_1();
      }
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "localRelayUpdate", *(void *)v26)) {
      return;
    }
    if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"GKSRelayConnectionID"), "isEqualToData:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "localRelayUpdate"), "objectForKeyedSubscript:", @"GKSRelayConnectionID")))return; {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteRelayConnectionData:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteRelayUpdate"), "objectForKeyedSubscript:", @"ClientData"));
    }
    *(void *)uint64_t v26 = 0;
    uint64_t v24 = *(void *)(a1 + 32);
    BOOL v25 = *(void *)(v24 + 240) == 2;
    *(void *)(v24 + 240) = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "startConnectionWithBlob:useRelay:isInitialRelay:error:", objc_msgSend(*(id *)(a1 + 32), "remoteRelayConnectionData"), 1, v25, v26))return; {
    goto LABEL_37;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v26 = 136315906;
      *(void *)&v26[4] = v15;
      __int16 v27 = 2080;
      uint64_t v28 = "-[VCTransportSessionLegacy processRelayUpdate:didOriginateRequest:]_block_invoke";
      __int16 v29 = 1024;
      int v30 = 416;
      __int16 v31 = 1024;
      *(_DWORD *)char v32 = 416;
      __int16 v17 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessi"
            "onLegacy.m:%d: processRelayUpdateDict bailing because relay is not allowed.";
      int v18 = v16;
      uint32_t v19 = 34;
LABEL_25:
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v26, v19);
    }
  }
}

- (void)createSecondaryRelayDispatchTimer:(float)a3 callID:(unsigned int)a4 callerRequired:(BOOL)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __84__VCTransportSessionLegacy_createSecondaryRelayDispatchTimer_callID_callerRequired___block_invoke;
  v6[3] = &unk_1E6DB45E0;
  v6[4] = self;
  float v7 = a3;
  unsigned int v8 = a4;
  BOOL v9 = a5;
  dispatch_async(stateQueue, v6);
}

void __84__VCTransportSessionLegacy_createSecondaryRelayDispatchTimer_callID_callerRequired___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) destroySecondaryRelayDispatchTimer];
  *(void *)(*(void *)(a1 + 32) + 272) = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 272);
  if (v2)
  {
    unint64_t v3 = (unint64_t)(float)(*(float *)(a1 + 40) * 1000000000.0);
    dispatch_time_t v4 = dispatch_time(0, v3);
    dispatch_source_set_timer(v2, v4, v3, 0x3B9ACA00uLL);
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(NSObject **)(v5 + 272);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__VCTransportSessionLegacy_createSecondaryRelayDispatchTimer_callID_callerRequired___block_invoke_2;
    v7[3] = &unk_1E6DB45E0;
    int v8 = *(_DWORD *)(a1 + 40);
    v7[4] = v5;
    int v9 = *(_DWORD *)(a1 + 44);
    char v10 = *(unsigned char *)(a1 + 48);
    dispatch_source_set_event_handler(v6, v7);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 272));
  }
}

uint64_t __84__VCTransportSessionLegacy_createSecondaryRelayDispatchTimer_callID_callerRequired___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    unint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double v4 = *(float *)(a1 + 40);
      int v6 = 136315906;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      int v9 = "-[VCTransportSessionLegacy createSecondaryRelayDispatchTimer:callID:callerRequired:]_block_invoke_2";
      __int16 v10 = 1024;
      int v11 = 487;
      __int16 v12 = 2048;
      double v13 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: secondary relay dispatch timed out after %5.2f sec. Start relay setup", (uint8_t *)&v6, 0x26u);
    }
  }
  [*(id *)(a1 + 32) destroySecondaryRelayDispatchTimer];
  return [*(id *)(a1 + 32) setupSecondaryRelayForCall:*(unsigned int *)(a1 + 44) callerRequired:*(unsigned __int8 *)(a1 + 48)];
}

- (void)destroySecondaryRelayDispatchTimer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  relaySetupTimer = self->relaySetupTimer;
  if (relaySetupTimer)
  {
    dispatch_source_cancel(relaySetupTimer);
    double v4 = self->relaySetupTimer;
    if (v4)
    {
      dispatch_release(v4);
      self->relaySetupTimer = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        __int16 v10 = "-[VCTransportSessionLegacy destroySecondaryRelayDispatchTimer]";
        __int16 v11 = 1024;
        int v12 = 504;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: secondary relay dispatch timer is deleted.", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
}

- (void)setupPendingSecondaryRelayWithNewPrimary:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VCTransportSessionLegacy_setupPendingSecondaryRelayWithNewPrimary___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __69__VCTransportSessionLegacy_setupPendingSecondaryRelayWithNewPrimary___block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(int *)(*(void *)(result + 32) + 248) >= 1)
  {
    uint64_t v1 = result;
    uint64_t result = VCConnection_Priority(*(void *)(result + 40));
    if (result == 3 && !*(unsigned char *)(*(void *)(v1 + 32) + 261))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v2 = VRTraceErrorLogLevelToCSTR();
        unint64_t v3 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 136315650;
          uint64_t v7 = v2;
          __int16 v8 = 2080;
          __int16 v9 = "-[VCTransportSessionLegacy setupPendingSecondaryRelayWithNewPrimary:]_block_invoke";
          __int16 v10 = 1024;
          int v11 = 511;
          _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: handlePrimaryConnChange, setup initial secondary relay", (uint8_t *)&v6, 0x1Cu);
        }
      }
      char IsRelay = VCConnection_IsRelay(*(void *)(v1 + 40));
      uint64_t v5 = *(unsigned int **)(v1 + 32);
      if ((IsRelay & 1) == 0)
      {
        [v5 notifyDelegateToCancelRelay];
        [*(id *)(*(void *)(v1 + 32) + 280) discardRelayBindingForCallID:*(unsigned int *)(*(void *)(v1 + 32) + 288)];
        uint64_t v5 = *(unsigned int **)(v1 + 32);
      }
      uint64_t result = [v5 setupSecondaryRelayForCall:v5[72] callerRequired:1];
      *(_DWORD *)(*(void *)(v1 + 32) + 248) = 0;
      *(unsigned char *)(*(void *)(v1 + 32) + 261) = 1;
    }
  }
  return result;
}

- (void)notifyDelegateToCancelRelay
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t relayState = self->relayState;
  BOOL v4 = relayState > 4;
  uint64_t v5 = (1 << relayState) & 0x19;
  if (v4 || v5 == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int64_t v12 = self->relayState;
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v10;
        __int16 v18 = 2080;
        uint32_t v19 = "-[VCTransportSessionLegacy notifyDelegateToCancelRelay]";
        __int16 v20 = 1024;
        int v21 = 541;
        __int16 v22 = 1024;
        int v23 = v12;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d notifyDelegateToCancelRelay: Resetting relay state from %d.", buf, 0x22u);
      }
    }
    self->unint64_t relayState = 0;
    uint64_t v13 = [(VCTransportSessionLegacy *)self localRelayRequestResponse];
    notificationQueue = self->super._notificationQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__VCTransportSessionLegacy_notifyDelegateToCancelRelay__block_invoke;
    v15[3] = &unk_1E6DB3E40;
    v15[4] = self;
    void v15[5] = v13;
    dispatch_async(notificationQueue, v15);
    [(VCTransportSessionLegacy *)self setLocalRelayRequestResponse:0];
    [(VCTransportSessionLegacy *)self setLocalRelayUpdate:0];
    [(VCTransportSessionLegacy *)self setRemoteRelayRequestResponse:0];
    [(VCTransportSessionLegacy *)self setRemoteRelayUpdate:0];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    __int16 v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t v9 = self->relayState;
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      uint32_t v19 = "-[VCTransportSessionLegacy notifyDelegateToCancelRelay]";
      __int16 v20 = 1024;
      int v21 = 537;
      __int16 v22 = 1024;
      int v23 = v9;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d notifyDelegateToCancelRelay: No need, relay state %d.", buf, 0x22u);
    }
  }
}

uint64_t __55__VCTransportSessionLegacy_notifyDelegateToCancelRelay__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 transportSession:v3 cancelRelayRequest:v4];
}

- (void)setupSecondaryRelayForCall:(unsigned int)a3 callerRequired:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self->super._connectionManager);
  if (v7)
  {
    __int16 v8 = (void *)v7;
    if (!v4 || self->_isCaller)
    {
      if (self->relayState
        || ![(VCTransportSessionLegacy *)self isConnectedAndAllowAdditionalConnection])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          uint64_t v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int64_t relayState = self->relayState;
            *(_DWORD *)buf = 136315906;
            uint64_t v18 = v13;
            __int16 v19 = 2080;
            __int16 v20 = "-[VCTransportSessionLegacy setupSecondaryRelayForCall:callerRequired:]";
            __int16 v21 = 1024;
            int v22 = 575;
            __int16 v23 = 1024;
            int v24 = relayState;
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: setupSecondaryRelay fail, relayState %d", buf, 0x22u);
          }
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v18 = v9;
            __int16 v19 = 2080;
            __int16 v20 = "-[VCTransportSessionLegacy setupSecondaryRelayForCall:callerRequired:]";
            __int16 v21 = 1024;
            int v22 = 565;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: setupSecondaryRelayForCall", buf, 0x1Cu);
          }
        }
        id v11 = -[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:](self, "createInitiateRelayDictionaryForCall:primaryConnection:", v5, [v8 connectionResult]);
        if (v11)
        {
          self->int64_t relayState = 3;
          notificationQueue = self->super._notificationQueue;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __70__VCTransportSessionLegacy_setupSecondaryRelayForCall_callerRequired___block_invoke;
          v16[3] = &unk_1E6DB3E40;
          v16[4] = self;
          v16[5] = v11;
          dispatch_async(notificationQueue, v16);
        }
      }
    }
    CFRelease(v8);
  }
}

uint64_t __70__VCTransportSessionLegacy_setupSecondaryRelayForCall_callerRequired___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 transportSession:v3 initiateRelayRequest:v4];
}

- (void)setupInitialSecondaryRelayWithCallbackRelayFlag:(BOOL)a3 callID:(unsigned int)a4 connectionId:(int)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __96__VCTransportSessionLegacy_setupInitialSecondaryRelayWithCallbackRelayFlag_callID_connectionId___block_invoke;
  v6[3] = &unk_1E6DB45E0;
  v6[4] = self;
  BOOL v9 = a3;
  int v7 = a5;
  unsigned int v8 = a4;
  dispatch_async(stateQueue, v6);
}

void __96__VCTransportSessionLegacy_setupInitialSecondaryRelayWithCallbackRelayFlag_callID_connectionId___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)VCConnectionManager_CopyPrimaryConnection(*(void *)(*(void *)(a1 + 32) + 72));
  uint64_t v3 = [v2 connectionResult];
  uint64_t v4 = v3;
  if (v2 && *(_DWORD *)(a1 + 40) == *(_DWORD *)(v3 + 4))
  {
    if (VCConnection_Priority((uint64_t)v2) == 3 && !*(unsigned char *)(a1 + 48))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        int v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v7 = *(_DWORD *)(a1 + 44);
          int v30 = 136315906;
          uint64_t v31 = v5;
          __int16 v32 = 2080;
          int v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
          __int16 v34 = 1024;
          int v35 = 592;
          __int16 v36 = 1024;
          int v37 = v7;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: call (%08X) has optimal P2P primary: cancel preemptive relay", (uint8_t *)&v30, 0x22u);
        }
      }
      [*(id *)(a1 + 32) notifyDelegateToCancelRelay];
      [*(id *)(*(void *)(a1 + 32) + 280) discardRelayBindingForCallID:*(unsigned int *)(a1 + 44)];
    }
    unsigned int v8 = *(unsigned char **)(a1 + 32);
    if (v8[261] || !v8[263]) {
      goto LABEL_20;
    }
    if (*(unsigned char *)(a1 + 48))
    {
      if (objc_msgSend((id)objc_msgSend(v8, "localRelayRequestResponse"), "objectForKeyedSubscript:", @"GKSRelayRemotePrimaryIdentifier"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v30 = 136315650;
            uint64_t v31 = v9;
            __int16 v32 = 2080;
            int v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
            __int16 v34 = 1024;
            int v35 = 616;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: not initial secondary relay, return, let ProcessRemoteIPChange setup secondary relay", (uint8_t *)&v30, 0x1Cu);
          }
        }
        goto LABEL_20;
      }
      int v20 = VCConnection_Priority((uint64_t)v2);
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v20 == 3)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          __int16 v23 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v24 = *(_DWORD *)(a1 + 44);
            int v30 = 136315906;
            uint64_t v31 = v22;
            __int16 v32 = 2080;
            int v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
            __int16 v34 = 1024;
            int v35 = 622;
            __int16 v36 = 1024;
            int v37 = v24;
            _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: call (%08X) has optimal relay primary: setup secondary relay", (uint8_t *)&v30, 0x22u);
          }
        }
        [*(id *)(a1 + 32) setupSecondaryRelayForCall:*(unsigned int *)(a1 + 44) callerRequired:1];
        *(_DWORD *)(*(void *)(a1 + 32) + 248) = 0;
LABEL_32:
        *(unsigned char *)(*(void *)(a1 + 32) + 261) = 1;
LABEL_20:
        CFRelease(v2);
        return;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v29 = *(unsigned __int8 *)(a1 + 48);
          int v30 = 136315906;
          uint64_t v31 = v28;
          __int16 v32 = 2080;
          int v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
          __int16 v34 = 1024;
          int v35 = 627;
          __int16 v36 = 1024;
          int v37 = v29;
          goto LABEL_39;
        }
      }
    }
    else
    {
      int v15 = VCConnection_Priority((uint64_t)v2);
      int v16 = VRTraceGetErrorLogLevelForModule();
      if (v15 == 3)
      {
        if (v16 >= 7)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          uint64_t v18 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v19 = *(_DWORD *)(a1 + 44);
            int v30 = 136315906;
            uint64_t v31 = v17;
            __int16 v32 = 2080;
            int v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
            __int16 v34 = 1024;
            int v35 = 605;
            __int16 v36 = 1024;
            int v37 = v19;
            _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: call (%08X) has optimal P2P primary: setup initial secondary relay", (uint8_t *)&v30, 0x22u);
          }
        }
        [*(id *)(a1 + 32) setupSecondaryRelayForCall:*(unsigned int *)(a1 + 44) callerRequired:1];
        goto LABEL_32;
      }
      if (v16 >= 7)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v27 = *(unsigned __int8 *)(a1 + 48);
          int v30 = 136315906;
          uint64_t v31 = v25;
          __int16 v32 = 2080;
          int v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
          __int16 v34 = 1024;
          int v35 = 609;
          __int16 v36 = 1024;
          int v37 = v27;
LABEL_39:
          _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: add a pending relay count = 1 relayFlag: %d, let handlePrimaryConnChange start initial secondary relay", (uint8_t *)&v30, 0x22u);
        }
      }
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 248) = 1;
    goto LABEL_20;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *(_DWORD *)(a1 + 40);
      int v14 = *(_DWORD *)(v4 + 4);
      int v30 = 136316162;
      uint64_t v31 = v11;
      __int16 v32 = 2080;
      int v33 = "-[VCTransportSessionLegacy setupInitialSecondaryRelayWithCallbackRelayFlag:callID:connectionId:]_block_invoke";
      __int16 v34 = 1024;
      int v35 = 587;
      __int16 v36 = 1024;
      int v37 = v13;
      __int16 v38 = 1024;
      int v39 = v14;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MediaCallback: link doesnot match(%d, %d)", (uint8_t *)&v30, 0x28u);
    }
  }
  if (v2) {
    goto LABEL_20;
  }
}

- (void)initiateRelayRequest
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_isCaller && self->allowsRelay)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double callerPreEmptiveTimeoutInSecs = self->callerPreEmptiveTimeoutInSecs;
        *(_DWORD *)buf = 136315906;
        uint64_t v10 = v3;
        __int16 v11 = 2080;
        int64_t v12 = "-[VCTransportSessionLegacy initiateRelayRequest]";
        __int16 v13 = 1024;
        int v14 = 641;
        __int16 v15 = 2048;
        double v16 = callerPreEmptiveTimeoutInSecs;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initiateRelayRequest: caller start relay in %f seconds", buf, 0x26u);
      }
    }
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(float)(self->callerPreEmptiveTimeoutInSecs * 1000000000.0));
    stateQueue = self->super._stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__VCTransportSessionLegacy_initiateRelayRequest__block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = self;
    dispatch_after(v6, stateQueue, block);
  }
}

void __48__VCTransportSessionLegacy_initiateRelayRequest__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)[*(id *)(*(void *)(a1 + 32) + 72) connectionCount] < 1)
  {
    int v7 = *(void **)(a1 + 32);
    if (v7[30] || [v7 remoteRelayUpdate])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 240);
          *(_DWORD *)buf = 136315906;
          uint64_t v18 = v8;
          __int16 v19 = 2080;
          int v20 = "-[VCTransportSessionLegacy initiateRelayRequest]_block_invoke";
          __int16 v21 = 1024;
          int v22 = 650;
          __int16 v23 = 1024;
          int v24 = v10;
          uint64_t v4 = " [%s] %s:%d initiateRelayRequest bailing because relay has already started %d";
          uint64_t v5 = v9;
          uint32_t v6 = 34;
          goto LABEL_11;
        }
      }
    }
    else
    {
      __int16 v11 = *(unsigned char **)(a1 + 32);
      if (v11[267])
      {
        uint64_t v12 = [v11 createInitiateRelayDictionary];
        *(void *)(*(void *)(a1 + 32) + 240) = 1;
        *(unsigned char *)(*(void *)(a1 + 32) + 262) = 1;
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = *(NSObject **)(v13 + 24);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __48__VCTransportSessionLegacy_initiateRelayRequest__block_invoke_41;
        v16[3] = &unk_1E6DB3E40;
        v16[4] = v13;
        v16[5] = v12;
        dispatch_async(v14, v16);
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v3 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v18 = v15;
          __int16 v19 = 2080;
          int v20 = "-[VCTransportSessionLegacy initiateRelayRequest]_block_invoke";
          __int16 v21 = 1024;
          int v22 = 655;
          uint64_t v4 = " [%s] %s:%d initiateRelayRequest bailing because transportSession has been stopped";
          goto LABEL_5;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = v2;
      __int16 v19 = 2080;
      int v20 = "-[VCTransportSessionLegacy initiateRelayRequest]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 644;
      uint64_t v4 = " [%s] %s:%d initiateRelayRequest bailing because already connected";
LABEL_5:
      uint64_t v5 = v3;
      uint32_t v6 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v4, buf, v6);
    }
  }
}

uint64_t __48__VCTransportSessionLegacy_initiateRelayRequest__block_invoke_41(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 transportSession:v3 initiateRelayRequest:v4];
}

- (int)flushBasebandQueueForConnection:(id)a3 payloadInfoList:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!VCConnection_IsLocalOnCellular((uint64_t)a3)) {
    return -2144665542;
  }
  uint64_t v31 = self;
  uint64_t v7 = [a3 connectionResult];
  unsigned int v8 = *(unsigned __int16 *)(v7 + 64);
  unsigned int v9 = *(unsigned __int16 *)(v7 + 184);
  IsIPuint32_t v6 = VCConnection_IsIPv6((uint64_t)a3);
  if (IsIPv6) {
    int v11 = 2;
  }
  else {
    int v11 = 1;
  }
  unsigned int v42 = v11;
  if (IsIPv6) {
    char v12 = 48;
  }
  else {
    char v12 = 28;
  }
  int IsRelay = VCConnection_IsRelay((uint64_t)a3);
  char v14 = v12 + 4;
  if (!IsRelay) {
    char v14 = v12;
  }
  char v41 = v14;
  uint64_t v43 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v15 = [a4 countByEnumeratingWithState:&v53 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    unsigned int v40 = bswap32(v8) >> 16;
    uint64_t v39 = *(void *)v54;
    unsigned int v38 = bswap32(v9) >> 16;
    uint64_t v37 = *MEMORY[0x1E4F23F18];
    uint64_t v36 = *MEMORY[0x1E4F23F58];
    uint64_t v35 = *MEMORY[0x1E4F23F08];
    uint64_t v34 = *MEMORY[0x1E4F23F48];
    uint64_t v33 = *MEMORY[0x1E4F23F40];
    uint64_t v17 = *MEMORY[0x1E4F23F68];
    uint64_t v18 = *MEMORY[0x1E4F23F60];
    uint64_t v19 = *MEMORY[0x1E4F23F10];
    id obj = a4;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v54 != v39) {
          objc_enumerationMutation(obj);
        }
        __int16 v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        int v22 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v42), v37);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v40), v36);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v38), v35);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(v21, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushPayloadType"), v34);
        char v23 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushPayloadTypeFieldOffset"), "unsignedCharValue");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", (v23 + v41)), v33);
        unsigned int v24 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushTransactionID"), "unsignedShortValue");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", __rev16(v24)), v17);
        unsigned int v25 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushTimestamp"), "unsignedLongValue");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", bswap32(v25)), v18);
        unsigned int v26 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushCriterion"), "unsignedShortValue");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", __rev16(v26)), v19);
        [v43 addObject:v22];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v53 objects:v52 count:16];
    }
    while (v16);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    uint64_t v28 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v43) {
        int v29 = (const char *)objc_msgSend((id)objc_msgSend(v43, "description"), "UTF8String");
      }
      else {
        int v29 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v45 = v27;
      __int16 v46 = 2080;
      v47 = "-[VCTransportSessionLegacy flushBasebandQueueForConnection:payloadInfoList:]";
      __int16 v48 = 1024;
      int v49 = 723;
      __int16 v50 = 2080;
      v51 = v29;
      _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Baseband flush dict %s", buf, 0x26u);
    }
  }
  return [(VCTransport *)v31->transport flushBasebandQueue:v43];
}

- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5
{
  return [(VCTransport *)self->transport getSignalStrengthBars:a3 displayBars:a4 maxDisplayBars:a5];
}

- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4
{
  return [(VCTransport *)self->transport updateQualityIndicator:*(void *)&a3 isIPv6:a4];
}

- (int)registerBasebandNotificationsForConnection:(id)a3
{
  transport = self->transport;
  uint64_t v5 = [a3 connectionResult];
  uint64_t basebandNotificationRegistrationToken = self->super._basebandNotificationRegistrationToken;
  uint64_t v7 = [(VCTransportSessionLegacy *)self transportCallType];

  return [(VCTransport *)transport updateBasebandForConnection:v5 notificationRegistrationToken:basebandNotificationRegistrationToken callType:v7];
}

- (void)deregisterBasebandNotifications
{
  transport = self->transport;
  uint64_t basebandNotificationRegistrationToken = self->super._basebandNotificationRegistrationToken;
  uint64_t v4 = [(VCTransportSessionLegacy *)self transportCallType];

  [(VCTransport *)transport updateBasebandForConnection:0 notificationRegistrationToken:basebandNotificationRegistrationToken callType:v4];
}

- (unsigned)transportCallType
{
  unint64_t operatingMode = self->_operatingMode;
  if (operatingMode >= 8) {
    char v3 = 0;
  }
  else {
    char v3 = 0x100000200010200uLL >> (8 * operatingMode);
  }
  return v3 & 3;
}

- (void)handleConnectionSetupDataChangeMessageDelivered
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__VCTransportSessionLegacy_handleConnectionSetupDataChangeMessageDelivered__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __75__VCTransportSessionLegacy_handleConnectionSetupDataChangeMessageDelivered__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) destroySecondaryRelayDispatchTimer];
  uint64_t v2 = *(unsigned int **)(a1 + 32);
  uint64_t v3 = v2[72];

  return [v2 setupSecondaryRelayForCall:v3 callerRequired:0];
}

- (BOOL)isHandoverSupported
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = 0;
  [(VCTransport *)self->transport getRemoteICEVersion:self->_callID remoteICEVersion:&v6];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = "NOT ";
      if (v6 > 0x3F1) {
        uint64_t v4 = "";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCTransportSessionLegacy isHandoverSupported]";
      __int16 v11 = 1024;
      int v12 = 771;
      __int16 v13 = 1024;
      unsigned int v14 = v6;
      __int16 v15 = 2080;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote ICE Version:%u, handover is %ssupported.", buf, 0x2Cu);
    }
  }
  return v6 > 0x3F1;
}

- (void)networkStateDidChange
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__VCTransportSessionLegacy_networkStateDidChange__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __49__VCTransportSessionLegacy_networkStateDidChange__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  reportingLog();
  [*(id *)(a1 + 32) callEventHandlerWithEvent:10 info:0];
  int v26 = 0;
  int v2 = [*(id *)(*(void *)(a1 + 32) + 280) updateInterfaceList:*(unsigned int *)(*(void *)(a1 + 32) + 288) shouldFilterCellInterface:*(unsigned __int8 *)(*(void *)(a1 + 32) + 9) isUpdateNeeded:&v26];
  if (v2 < 0)
  {
    int v13 = v2;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)unsigned int v38 = 136315906;
    *(void *)&v38[4] = v14;
    *(_WORD *)&v38[12] = 2080;
    *(void *)&v38[14] = "-[VCTransportSessionLegacy networkStateDidChange]_block_invoke";
    *(_WORD *)&v38[22] = 1024;
    *(_DWORD *)&v38[24] = 794;
    *(_WORD *)&v38[28] = 1024;
    *(_DWORD *)&v38[30] = v13;
    uint64_t v16 = " [%s] %s:%d networkStateDidChange: Failed updating interface list %x";
    uint64_t v17 = v38;
    uint64_t v18 = v15;
    uint32_t v19 = 34;
LABEL_27:
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v16, v17, v19);
    return;
  }
  if (v26 && ![*(id *)(a1 + 32) localConnectionData])
  {
    [*(id *)(*(void *)(a1 + 32) + 432) lock];
    [*(id *)(*(void *)(a1 + 32) + 432) signal];
    [*(id *)(*(void *)(a1 + 32) + 432) unlock];
    return;
  }
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (!v3[267]) {
    return;
  }
  *(void *)&v38[46] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v38[32] = v4;
  *(_OWORD *)unsigned int v38 = v4;
  *(_OWORD *)&v38[16] = v4;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  v36[0] = v4;
  v36[1] = v4;
  [v3 IPPortForPrimaryConnectionOnLocalInterface:1];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unsigned int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = IPPORTToStringWithSize();
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v5;
      __int16 v28 = 2080;
      int v29 = "-[VCTransportSessionLegacy networkStateDidChange]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 812;
      __int16 v32 = 2080;
      *(void *)uint64_t v33 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d networkStateDidChange: checking for %s.", buf, 0x26u);
    }
  }
  int v8 = [*(id *)(*(void *)(a1 + 32) + 280) ipPortStillExists:v36 requiresWifi:*(unsigned __int8 *)(*(void *)(a1 + 32) + 9)];
  if (!v26)
  {
    int v20 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    int v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v23 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 9);
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = v21;
    __int16 v28 = 2080;
    int v29 = "-[VCTransportSessionLegacy networkStateDidChange]_block_invoke";
    __int16 v30 = 1024;
    int v31 = 819;
    __int16 v32 = 1024;
    *(_DWORD *)uint64_t v33 = v20;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v26;
    __int16 v34 = 1024;
    int v35 = v23;
    uint64_t v16 = " [%s] %s:%d networkStateDidChange: no need to collect blob: %d, %d, %d.";
    uint64_t v17 = buf;
    uint64_t v18 = v22;
    uint32_t v19 = 46;
    goto LABEL_27;
  }
  *(void *)buf = 0;
  uint64_t v9 = *(unsigned int *)(*(void *)(a1 + 32) + 288);
  int v10 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-blob-size-max"), "intValue");
  if (v10) {
    int v11 = v10;
  }
  else {
    int v11 = 201;
  }
  int v25 = v11;
  LOBYTE(v24) = 1;
  if (([*(id *)(*(void *)(a1 + 32) + 280) getConnectionDataForCallID:v9 version:*(unsigned __int8 *)(*(void *)(a1 + 32) + 232) useCompressedData:*(unsigned __int8 *)(*(void *)(a1 + 32) + 10) pConnectionData:buf connectDataSizeInBytes:&v25 relayDictionary:0 interfaceUpdate:0.0 nonCellularCandidateTimeout:v24] & 0x80000000) == 0)
  {
    if (v25)
    {
      int v12 = *(void **)buf;
      if (*(void *)buf) {
        goto LABEL_19;
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __49__VCTransportSessionLegacy_networkStateDidChange__block_invoke_cold_1();
    }
  }
  int v12 = *(void **)buf;
  if (*(void *)buf) {
LABEL_19:
  }
    free(v12);
}

- (void)handleNewCandidates:(id)a3 version:(unsigned __int16)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v14 = a4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int relayState = self->relayState;
      if (a3) {
        uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v9 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCTransportSessionLegacy handleNewCandidates:version:]";
      __int16 v19 = 1024;
      int v20 = 859;
      __int16 v21 = 1024;
      int v22 = relayState;
      __int16 v23 = 2080;
      uint64_t v24 = v9;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Relay state: %d, local blob is updated %s", buf, 0x2Cu);
    }
  }
  *(_WORD *)buf = 1;
  int v10 = (void *)[MEMORY[0x1E4F1CA58] dataWithBytes:buf length:2];
  objc_msgSend(v10, "appendData:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v14, 2));
  [v10 appendData:a3];
  notificationQueue = self->super._notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCTransportSessionLegacy_handleNewCandidates_version___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = v10;
  dispatch_async(notificationQueue, block);
  LODWORD(v12) = 5.0;
  [(VCTransportSessionLegacy *)self createSecondaryRelayDispatchTimer:self->_callID callID:0 callerRequired:v12];
}

uint64_t __56__VCTransportSessionLegacy_handleNewCandidates_version___block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 transportSession:v3 connectionSetupDataDidChange:v4];
}

- (void)processRemoteIPChange:(char *)a3 dataLength:(int)a4 remoteCandidateVersion:(unsigned __int16)a5
{
  [(VCTransport *)self->transport processRemoteInterfaceChangeMessageWithLocalCallID:self->_callID remoteCallID:self->_remoteCallID remoteData:a3 remoteLen:*(void *)&a4 remoteCandidateVersion:a5];

  reportingLog();
}

- (void)processRemoteIPChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = [a3 length];
  uint64_t v6 = malloc_type_malloc(v5, 0x385DCB59uLL);
  [a3 getBytes:v6 length:v5];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int callID = self->_callID;
      int v10 = 136316162;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      int v13 = "-[VCTransportSessionLegacy processRemoteIPChange:]";
      __int16 v14 = 1024;
      int v15 = 891;
      __int16 v16 = 1024;
      unsigned int v17 = callID;
      __int16 v18 = 1024;
      int v19 = v5;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: processRemoteIPChange: callID:%u length:%d", (uint8_t *)&v10, 0x28u);
    }
  }
  if (v5 - 2 >= 0)
  {
    if (*v6 == 1)
    {
      if (v5 - 4 < 0) {
        return;
      }
      [(VCTransportSessionLegacy *)self processRemoteIPChange:v6 + 2 dataLength:(v5 - 4) remoteCandidateVersion:(unsigned __int16)v6[1]];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionLegacy processRemoteIPChange:]();
      }
    }
    free(v6);
  }
}

- (void)connectionResultCallback:(tagCONNRESULT *)a3 didReceiveICEPacket:(BOOL)a4 didUseRelay:(BOOL)a5 secretKey:(id)a6 skeResult:(int)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    __int16 v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        int iResultCount = a3->iResultCount;
      }
      else {
        int iResultCount = -1;
      }
      *(_DWORD *)buf = 136316930;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCTransportSessionLegacy connectionResultCallback:didReceiveICEPacket:didUseRelay:secretKey:skeResult:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)__int16 v23 = 929;
      *(_WORD *)&v23[4] = 2048;
      *(void *)&v23[6] = a3;
      __int16 v24 = 1024;
      BOOL v25 = v10;
      __int16 v26 = 1024;
      int v27 = iResultCount;
      __int16 v28 = 2048;
      id v29 = a6;
      __int16 v30 = 1024;
      int v31 = a7;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectionResultCallback: pConnResult = %p, didReceiveICEPacket = %d resultCount = %d, secretKey = %p, skeResult = %d", buf, 0x42u);
    }
  }
  if (v9) {
    uint64_t v16 = 10;
  }
  else {
    uint64_t v16 = 0;
  }
  [(TimingCollection *)self->super._perfTimings stopTimingForKey:v16];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)__int16 v23 = 0;
  if (a3)
  {
    unsigned int v17 = malloc_type_malloc(0x140uLL, 0x1020040A6FBA1A4uLL);
    uint64_t v18 = *(void *)&buf[8];
    *(void *)(*(void *)&buf[8] + 24) = v17;
    memcpy(v17, a3, 0x140uLL);
    *(void *)(*(void *)(v18 + 24) + 304) = 0;
  }
  stateQueue = self->super._stateQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__VCTransportSessionLegacy_connectionResultCallback_didReceiveICEPacket_didUseRelay_secretKey_skeResult___block_invoke;
  v20[3] = &unk_1E6DB6448;
  v20[4] = self;
  v20[5] = a6;
  int v21 = a7;
  v20[6] = buf;
  dispatch_async(stateQueue, v20);
  _Block_object_dispose(buf, 8);
}

void __105__VCTransportSessionLegacy_connectionResultCallback_didReceiveICEPacket_didUseRelay_secretKey_skeResult___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) handleExchangedKey:*(void *)(a1 + 40) result:*(unsigned int *)(a1 + 56)])
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v3)
    {
      LODWORD(v2) = *(_DWORD *)(v3 + 268);
      *(_DWORD *)(*(void *)(a1 + 32) + 256) = ((double)v2 * 0.0000152587891 * 1000.0);
      *(unsigned char *)(*(void *)(a1 + 32) + 266) = *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
                                                           + 8) == 0;
      uint64_t v4 = -[VCConnectionLegacy initWithConnectionResult:type:]([VCConnectionLegacy alloc], "initWithConnectionResult:type:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), [*(id *)(a1 + 32) connectionTypeForConnectionResult:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)]);
      [*(id *)(*(void *)(a1 + 32) + 72) addConnection:v4];
    }
  }
  int v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  free(v5);
}

- (BOOL)handleExchangedKey:(id)a3 result:(int)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!a3 || a4)
  {
    if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionLegacy handleExchangedKey:result:]();
        }
      }
      v9[0] = 0;
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v9, 32018, a4 + 700, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 982), @"Media Insecure", @"Optimized SKE failed");
      [(VCTransportSession *)self callEventHandlerWithEvent:7 info:v9[0]];
      BOOL v7 = 0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
    if (!self->_didReceivePiggybackBlob)
    {
      self->_didReceivePiggybackBlob = 1;
      [(VCTransportSession *)self callEventHandlerWithEvent:5 info:a3];
    }
  }

  return v7;
}

- (void)primaryConnectionChanged:(id)a3 oldPrimaryConnection:(id)a4 activeConnection:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    BOOL v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int callID = self->_callID;
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCTransportSessionLegacy primaryConnectionChanged:oldPrimaryConnection:activeConnection:]";
      __int16 v19 = 1024;
      int v20 = 997;
      __int16 v21 = 1024;
      unsigned int v22 = callID;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: handlePrimaryConnChange dwCallID(%u)", buf, 0x22u);
    }
  }
  [(VCTransportSession *)self updateBasebandForConnection:a3];
  if (VCConnection_IsRelay((uint64_t)a4) && [a3 isReplaceOnly])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCTransportSessionLegacy primaryConnectionChanged:oldPrimaryConnection:activeConnection:]";
        __int16 v19 = 1024;
        int v20 = 1005;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: handlePrimaryConnChange, old primary uses relay, now it is removed, tear relay down", buf, 0x1Cu);
      }
    }
    -[VCTransport discardRelayBindingForCallID:withChannelNumber:](self->transport, "discardRelayBindingForCallID:withChannelNumber:", self->_callID, [a4 relayChannelNumber]);
  }
  [(VCTransportSessionLegacy *)self setupPendingSecondaryRelayWithNewPrimary:a3];
  v13[0] = @"transportSessionEventInfoNewPrimary";
  v13[1] = @"transportSessionEventInfoOldPrimary";
  v14[0] = a3;
  v14[1] = a4;
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 3, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2]);
}

- (void)connectionCallback:(id)a3 isInitialConnection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    [(VCTransportSession *)self updateBasebandForConnection:a3];
    [(TimingCollection *)self->super._perfTimings stopTimingForKey:14];
    if (self->rtChannel)
    {
      if ((VCConnection_IsRelay((uint64_t)a3) & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v7 = VRTraceErrorLogLevelToCSTR();
          uint64_t v8 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v14 = v7;
            __int16 v15 = 2080;
            uint64_t v16 = "-[VCTransportSessionLegacy connectionCallback:isInitialConnection:]";
            __int16 v17 = 1024;
            int v18 = 1028;
            _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: P2P established, no need for TCP relay.", buf, 0x1Cu);
          }
        }
        stateQueue = self->super._stateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__VCTransportSessionLegacy_connectionCallback_isInitialConnection___block_invoke;
        block[3] = &unk_1E6DB3DC8;
        block[4] = self;
        dispatch_async(stateQueue, block);
      }
    }
  }
  v11[0] = @"transportSessionEventInfoNewLink";
  v11[1] = @"transportSessionEventInfoIsFirstLink";
  v12[0] = a3;
  v12[1] = [NSNumber numberWithBool:v4];
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 1, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2]);
}

uint64_t __67__VCTransportSessionLegacy_connectionCallback_isInitialConnection___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 240) = 6;
  return [*(id *)(a1 + 32) resetLoopback];
}

- (void)didEnableDuplication:(BOOL)a3 activeConnection:(id)a4
{
  BOOL v5 = a3;
  v8[2] = *MEMORY[0x1E4F143B8];
  [(VCTransportSession *)self updateBasebandForConnection:a4];
  v7[0] = @"transportSessionEventInfoIsDuplicationEnabled";
  v7[1] = @"transportSessionEventInfoActiveConnection";
  v8[0] = [NSNumber numberWithBool:v5];
  v8[1] = a4;
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 4, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2]);
}

- (BOOL)createTCPTunnelForParticipantID:(id)a3 relayDictionary:(id)a4 didOriginateRequest:(BOOL)a5 relayType:(unsigned __int8)a6 error:(id *)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v22 = 0;
  BOOL v10 = [[TCPTunnelClient alloc] initWithRelayRequestDictionary:a4 withCallID:self->_callID relayType:a6 errorCode:&v22];
  if (v10)
  {
    self->_tcpTunnelClient = v10;
    self->rtChannel = (VideoConferenceRealTimeChannel *)v10;
    [(TCPTunnelClient *)self->_tcpTunnelClient setParticipantID:a3];
    tcpTunnelClient = self->_tcpTunnelClient;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke;
    v21[3] = &unk_1E6DB7780;
    v21[4] = self;
    [(TCPTunnelClient *)tcpTunnelClient setAllocationResponseHandler:v21];
    __int16 v12 = self->_tcpTunnelClient;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_4;
    v20[3] = &unk_1E6DB77A8;
    v20[4] = self;
    [(TCPTunnelClient *)v12 setReceiveHandler:v20];
    uint64_t v13 = self->_tcpTunnelClient;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_5;
    v19[3] = &unk_1E6DB3E68;
    v19[4] = self;
    [(TCPTunnelClient *)v13 setBindingResponseHandler:v19];
    uint64_t v14 = self->_tcpTunnelClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_67;
    v18[3] = &unk_1E6DB5128;
    v18[4] = self;
    [(TCPTunnelClient *)v14 setTerminationHandler:v18];
    __int16 v15 = self->_tcpTunnelClient;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_3_70;
    v17[3] = &unk_1E6DB3DC8;
    v17[4] = self;
    [(TCPTunnelClient *)v15 setDestroyHandler:v17];
    [(TimingCollection *)self->super._perfTimings startTimingForKey:9];
    return [(TCPTunnelClient *)self->_tcpTunnelClient sendAllocateMsg:a7];
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a7, 32002, v22, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 1089), @"Creating TCPTunnel Client failed.", @"Error was encountered");
    return 0;
  }
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2;
  block[3] = &unk_1E6DB3E40;
  block[4] = v2;
  void block[5] = a2;
  dispatch_async(v3, block);
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[30] == 1)
  {
    v2[30] = 2;
    uint64_t v2 = *(void **)(a1 + 32);
  }
  if ([v2 remoteRelayUpdate])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      BOOL v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if ([*(id *)(a1 + 32) remoteRelayUpdate]) {
          BOOL v5 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteRelayUpdate"), "description"), "UTF8String");
        }
        else {
          BOOL v5 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v3;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCTransportSessionLegacy createTCPTunnelForParticipantID:relayDictionary:didOriginateRequest:relayType:e"
              "rror:]_block_invoke_2";
        __int16 v15 = 1024;
        int v16 = 1110;
        __int16 v17 = 2080;
        int v18 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: continue with ChannelBinding, %s.", buf, 0x26u);
      }
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_62;
    block[3] = &unk_1E6DB3DC8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(global_queue, block);
  }
  objc_msgSend(*(id *)(a1 + 32), "setLocalRelayConnectionData:", objc_msgSend(*(id *)(a1 + 32), "localConnectionData"));
  objc_msgSend(*(id *)(a1 + 32), "setLocalRelayUpdate:", objc_msgSend(*(id *)(a1 + 32), "createRelayUpdateDictionary:", *(void *)(a1 + 40)));
  [*(id *)(*(void *)(a1 + 32) + 64) stopTimingForKey:9];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_3;
  v9[3] = &unk_1E6DB3DC8;
  v9[4] = v7;
  dispatch_async(v8, v9);
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_62(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 400), "sendChannelBindingMsgWithDict:error:", objc_msgSend(*(id *)(a1 + 32), "remoteRelayUpdate"), v6);
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(NSObject **)(v3 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2_63;
    block[3] = &unk_1E6DB3DC8;
    block[4] = v3;
    dispatch_sync(v4, block);
    return [*(id *)(a1 + 32) callEventHandlerWithEvent:7 info:v6[0]];
  }
  return result;
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2_63(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 240) = 6;
  return result;
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 localRelayUpdate];

  return [v2 transportSession:v3 sendRelayResponse:v4];
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) receivedRealTimeData:a2 fromParticipantID:a3];
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_5(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_6;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = v1;
  dispatch_async(v2, v3);
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_6(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 240) != 5)
  {
    if (*(unsigned char *)(result + 267))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v5 = 136315650;
          uint64_t v6 = v3;
          __int16 v7 = 2080;
          uint64_t v8 = "-[VCTransportSessionLegacy createTCPTunnelForParticipantID:relayDictionary:didOriginateRequest:relayType:"
               "error:]_block_invoke_6";
          __int16 v9 = 1024;
          int v10 = 1160;
          _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCP Channel is set up, time out ICE right away.", (uint8_t *)&v5, 0x1Cu);
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 280) setICETimeout:0.0];
      [*(id *)(*(void *)(a1 + 32) + 64) stopTimingForKey:0];
      [*(id *)(a1 + 32) callEventHandlerWithEvent:6 info:0];
      uint64_t result = objc_msgSend(*(id *)(a1 + 32), "setupLoopbackWithConnectionType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 400), "connectionType"));
      *(void *)(*(void *)(a1 + 32) + 240) = 5;
    }
    else
    {
      return [(id)result deleteTCPTunnel];
    }
  }
  return result;
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_67(uint64_t a1, uint64_t a2)
{
  void block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2_68;
  block[3] = &unk_1E6DB3E40;
  block[4] = v2;
  void block[5] = a2;
  dispatch_async(v3, block);
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_2_68(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 240) = 6;
  [*(id *)(a1 + 32) resetLoopback];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) connectionCount];
  if (!result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 callEventHandlerWithEvent:7 info:v4];
  }
  return result;
}

void __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_3_70(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_4_71;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = v1;
  dispatch_sync(v2, v3);
}

uint64_t __112__VCTransportSessionLegacy_createTCPTunnelForParticipantID_relayDictionary_didOriginateRequest_relayType_error___block_invoke_4_71(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteTCPTunnel];
}

- (void)deleteTCPTunnel
{
  tcpTunnelClient = self->_tcpTunnelClient;
  if (tcpTunnelClient)
  {
    [(TCPTunnelClient *)tcpTunnelClient closeTunnelSocket];

    self->_tcpTunnelClient = 0;
  }
  self->rtChannel = 0;
}

- (void)loopbackSocketTunnel:(id)a3 receivedData:(id)a4 from:(tagIPPORT *)a5
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VCTransportSessionLegacy_loopbackSocketTunnel_receivedData_from___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a4;
  dispatch_sync(stateQueue, block);
}

void __67__VCTransportSessionLegacy_loopbackSocketTunnel_receivedData_from___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 265))
  {
    id v3 = *(id *)(v1 + 408);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "vcArg:sendRealTimeData:toParticipantID:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "optionalArg"));
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 408);
  }
}

- (void)resetLoopback
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(VCTransportSessionLegacy *)self deleteTCPTunnel];
  if (self->_useLoopback)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        loopbackConnection = self->_loopbackConnection;
        if (loopbackConnection) {
          uint64_t v6 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](loopbackConnection, "description"), "UTF8String");
        }
        else {
          uint64_t v6 = "<nil>";
        }
        int v7 = 136315906;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        int v10 = "-[VCTransportSessionLegacy resetLoopback]";
        __int16 v11 = 1024;
        int v12 = 1240;
        __int16 v13 = 2080;
        uint64_t v14 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Remove loopback connection %s", (uint8_t *)&v7, 0x26u);
      }
    }
    [(VCConnectionManager *)self->super._connectionManager removeConnection:self->_loopbackConnection];
    self->_useLoopback = 0;
    [(LoopbackSocketTunnel *)self->_tunnel shutdownSocket];

    self->_tunnel = 0;
    self->rtChannel = 0;
  }
}

- (void)setupLoopbackWithConnectionType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = 1253;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  self->_useLoopback = 1;
  unint64_t v42 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v41[0] = v7;
  v41[1] = v7;
  transport = self->transport;
  uint64_t callID = self->_callID;
  int v26 = 0;
  [(VCTransport *)transport updateInterfaceList:callID shouldFilterCellInterface:self->super._requiresWiFi isUpdateNeeded:&v26];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    __int16 v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = 1261;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d call [transport getLoopbackIP]...", buf, 0x1Cu);
    }
  }
  [(VCTransport *)self->transport getLoopbackIP:v41];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = 1263;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d done [transport getLoopbackIP]...", buf, 0x1Cu);
    }
  }
  IPPORTToStringWithSize();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = 1267;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = &setupLoopbackWithConnectionType__ip;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d vtpIP = %s", buf, 0x26u);
    }
  }
  self->_tunnel = [[LoopbackSocketTunnel alloc] initWithPort:55100 delegate:self error:&v27];
  if (v27)
  {
    -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 7);
  }
  else
  {
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    __int16 v17 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&unsigned char buf[24] = 1275;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d call tunnel setVTPIP...", buf, 0x1Cu);
      }
    }
    [(LoopbackSocketTunnel *)self->_tunnel setVTPIP:v41];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&unsigned char buf[24] = 1277;
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d done tunnel setVTPIP...", buf, 0x1Cu);
      }
    }
    [(LoopbackSocketTunnel *)self->_tunnel setOptionalArg:[(VCTransportSessionLegacy *)self remoteParticipantID]];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    memset(v38, 0, sizeof(v38));
    memset(buf, 0, sizeof(buf));
    [(LoopbackSocketTunnel *)self->_tunnel getIPPort:(char *)v38 + 4];
    [(LoopbackSocketTunnel *)self->_tunnel getIPPort:(char *)&v38[5] + 4];
    *(_DWORD *)&buf[20] = 1;
    DWORD2(v39) = 1;
    [(LoopbackSocketTunnel *)self->_tunnel getVTPIPPort:&buf[28]];
    [(LoopbackSocketTunnel *)self->_tunnel getVTPIPPort:(char *)&v38[2] + 12];
    self->_loopbackConnection = (VCConnectionProtocol *)[[VCConnectionLegacy alloc] initWithConnectionResult:buf type:v3];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        loopbackConnection = self->_loopbackConnection;
        if (loopbackConnection) {
          BOOL v25 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](loopbackConnection, "description"), "UTF8String");
        }
        else {
          BOOL v25 = "<nil>";
        }
        *(_DWORD *)__int16 v28 = 136315906;
        uint64_t v29 = v22;
        __int16 v30 = 2080;
        int v31 = "-[VCTransportSessionLegacy setupLoopbackWithConnectionType:]";
        __int16 v32 = 1024;
        int v33 = 1292;
        __int16 v34 = 2080;
        int v35 = v25;
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Add loopback connection %s", v28, 0x26u);
      }
    }
    [(VCConnectionManager *)self->super._connectionManager addConnection:self->_loopbackConnection];
  }
}

- (void)receivedRealTimeData:(id)a3 fromParticipantID:(id)a4
{
  v8[7] = *MEMORY[0x1E4F143B8];
  if (self->_useLoopback)
  {
    [(LoopbackSocketTunnel *)self->_tunnel setOptionalArg:a4];
    tunnel = self->_tunnel;
    [(LoopbackSocketTunnel *)tunnel sendPacketToVTP:a3];
  }
  else
  {
    stateQueue = self->super._stateQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__VCTransportSessionLegacy_receivedRealTimeData_fromParticipantID___block_invoke;
    void v8[3] = &unk_1E6DB43D8;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    dispatch_sync(stateQueue, v8);
  }
}

unsigned char *__67__VCTransportSessionLegacy_receivedRealTimeData_fromParticipantID___block_invoke(id *a1)
{
  uint64_t result = a1[4];
  if (!result[263])
  {
    uint64_t result = (unsigned char *)objc_msgSend(a1[5], "isEqualToString:", objc_msgSend(result, "remoteParticipantID"));
    if (result)
    {
      uint64_t v3 = (void *)[a1[6] bytes];
      uint64_t result = memchr(v3, 10, [a1[6] length]);
      if (result)
      {
        uint64_t result = strnstr((const char *)v3, "SIP/", result - (unsigned char *)v3);
        if (result)
        {
          [a1[4] setupLoopbackWithConnectionType:0];
          [*((id *)a1[4] + 52) sendPacketToVTP:a1[6]];
          uint64_t v4 = objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "resultQueue");
          uint64_t v5 = *((unsigned int *)a1[4] + 72);
          return (unsigned char *)[v4 addResult:0 forCallID:v5];
        }
      }
    }
  }
  return result;
}

- (void)stopLoopback
{
  if (self->_useLoopback)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F29060];
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:8.0];
    [v3 detachNewThreadSelector:sel_stopLoopbackProc_ toTarget:self withObject:v4];
  }
}

- (void)stopLoopbackProc:(id)a3
{
  void block[5] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [MEMORY[0x1E4F29060] sleepUntilDate:a3];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCTransportSessionLegacy_stopLoopbackProc___block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  [(TCPTunnelClient *)self->_tcpTunnelClient unbindChannel];
  int v7 = 4;
  while (![(TCPTunnelClient *)self->_tcpTunnelClient isTunnelSocketClosed])
  {
    sleep(1u);
    if (!--v7)
    {
      uint64_t v8 = self->super._stateQueue;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __45__VCTransportSessionLegacy_stopLoopbackProc___block_invoke_2;
      v9[3] = &unk_1E6DB3DC8;
      v9[4] = self;
      dispatch_sync(v8, v9);
      break;
    }
  }
}

void __45__VCTransportSessionLegacy_stopLoopbackProc___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 416) = 0;
  *(void *)(*(void *)(a1 + 32) + 408) = 0;
}

uint64_t __45__VCTransportSessionLegacy_stopLoopbackProc___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteTCPTunnel];
}

- (id)createInitiateRelayDictionary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned int v10 = -1431655766;
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  [(VCTransportSessionLegacy *)self localConnectionData];
  uint64_t v4 = ICEGetExtIPIndex();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[VCTransportSessionLegacy localConnectionData](self, "localConnectionData"), @"GKSRelaySelfBlob");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithShort:", v4), @"GKSRelaySelfAddrPointer");
  if (v4 == -1)
  {
    unsigned int v5 = 0;
  }
  else
  {
    -[NSData getBytes:range:]([(VCTransportSessionLegacy *)self localConnectionData], "getBytes:range:", &v10, (int)v4, 4);
    unsigned int v5 = bswap32(v10);
  }
  unsigned int v9 = v5;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v9, 4), @"GKSRelaySelfExternalAddr");
  [v3 setObject:&unk_1F3DC4950 forKeyedSubscript:@"GKSRelaySelfNatType"];
  [(VCTransportSessionLegacy *)self remoteConnectionData];
  uint64_t v6 = ICEGetExtIPIndex();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[VCTransportSessionLegacy remoteConnectionData](self, "remoteConnectionData"), @"GKSRelayPeerBlob");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithShort:", v6), @"GKSRelayPeerAddrPointer");
  if (v6 == -1)
  {
    unsigned int v7 = 0;
  }
  else
  {
    -[NSData getBytes:range:]([(VCTransportSessionLegacy *)self remoteConnectionData], "getBytes:range:", &v10, (int)v6, 4);
    unsigned int v7 = bswap32(v10);
  }
  unsigned int v9 = v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v9, 4), @"GKSRelayPeerExternalAddr");
  [v3 setObject:&unk_1F3DC4950 forKeyedSubscript:@"GKSRelayPeerNatType"];
  return v3;
}

- (id)createInitiateRelayDictionaryForCall:(unsigned int)a3 primaryConnection:(tagCONNRESULT *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int v54 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  int v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  if (a4->dwCallID != a3) {
    return 0;
  }
  uint64_t v5 = *(void *)&a3;
  memset(v24, 170, sizeof(v24));
  id v7 = [(VCTransport *)self->transport getRemoteCIDForDstIPPort:&a4->mbDst callID:*(void *)&a3];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v7)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:](v16, v17);
      }
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 5)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    unsigned int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      dwIPuint64_t v4 = a4->mbSrc.IP.dwIPv4;
      unsigned int v12 = a4->mbRemote.IP.dwIPv4;
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = v9;
      __int16 v27 = 2080;
      __int16 v28 = "-[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:]";
      __int16 v29 = 1024;
      int v30 = 1442;
      __int16 v31 = 1024;
      unsigned int v32 = dwIPv4;
      __int16 v33 = 1024;
      unsigned int v34 = v12;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCallSession: preparing for secondary connection, %x, %x", buf, 0x28u);
    }
  }
  [(VCTransport *)self->transport getNextBestCandidate:&v45 callID:v5 isLocal:1 IPPortToExclude:&a4->mbSrc];
  [(VCTransport *)self->transport getNextBestCandidate:&v35 callID:v5 isLocal:0 IPPortToExclude:&a4->mbRemote];
  if (((a4->mbSrc.iFlags ^ DWORD2(v46)) & 4) == 0 && ((a4->mbRemote.iFlags ^ DWORD2(v36)) & 4) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v26 = v13;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:]";
        __int16 v29 = 1024;
        int v30 = 1455;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d createInitiateRelayDictionaryForCall: No new candidate for secondary connection", buf, 0x1Cu);
      }
    }
    return 0;
  }
  if ((ICECompressCandidates() & 0x80000000) != 0)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v24[2] length:SHIDWORD(v24[0])];
    free(v24[2]);
  }
  if ((ICECompressCandidates() & 0x80000000) != 0)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = (NSData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:v24[1] length:SLODWORD(v24[0])];
    free(v24[1]);
  }
  uint64_t v18 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  if (v15)
  {
    *(_DWORD *)buf = bswap32(HIDWORD(v47));
    __int16 v20 = 1;
    __int16 v21 = (NSData *)v15;
  }
  else if (v19)
  {
    *(_DWORD *)buf = bswap32(HIDWORD(v37));
    __int16 v20 = 1;
    __int16 v21 = v19;
  }
  else
  {
    __int16 v21 = [(VCTransportSessionLegacy *)self localConnectionData];
    *(_DWORD *)buf = 0;
    __int16 v20 = -1;
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithShort:", v20), @"GKSRelaySelfAddrPointer");
  [v18 setObject:v21 forKeyedSubscript:@"GKSRelaySelfBlob"];
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", buf, 4), @"GKSRelaySelfExternalAddr");
  if (v19)
  {
    *(_DWORD *)buf = bswap32(HIDWORD(v37));
    __int16 v22 = 1;
  }
  else if (v15)
  {
    *(_DWORD *)buf = bswap32(HIDWORD(v47));
    __int16 v22 = 1;
    uint64_t v19 = (NSData *)v15;
  }
  else
  {
    uint64_t v19 = [(VCTransportSessionLegacy *)self remoteConnectionData];
    *(_DWORD *)buf = 0;
    __int16 v22 = -1;
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithShort:", v22), @"GKSRelayPeerAddrPointer");
  [v18 setObject:v19 forKeyedSubscript:@"GKSRelayPeerBlob"];
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", buf, 4), @"GKSRelayPeerExternalAddr");
  [v18 setObject:&unk_1F3DC4950 forKeyedSubscript:@"GKSRelaySelfNatType"];
  [v18 setObject:&unk_1F3DC4950 forKeyedSubscript:@"GKSRelayPeerNatType"];
  [v18 setObject:v7 forKeyedSubscript:@"GKSRelayRemotePrimaryIdentifier"];
  return v18;
}

- (id)createRelayUpdateDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"GKSRelayType"), "intValue")), @"GKSRelayType");
  uint64_t v6 = [a3 objectForKeyedSubscript:@"GKSRelayConnectionID"];
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:@"GKSRelayConnectionID"];
  }
  uint64_t v7 = [a3 objectForKeyedSubscript:@"GKRelayTransactionID"];
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"GKRelayTransactionID"];
  }
  uint64_t v8 = [a3 objectForKeyedSubscript:@"GKRelayToken"];
  if (v8) {
    [v5 setObject:v8 forKeyedSubscript:@"GKRelayToken"];
  }
  uint64_t v9 = [a3 objectForKeyedSubscript:@"GKSRelayPeerRelayPort"];
  if (v9) {
    [v5 setObject:v9 forKeyedSubscript:@"GKSRelayPeerRelayPort"];
  }
  uint64_t v10 = [a3 objectForKeyedSubscript:@"GKSRelayPeerRelayIP"];
  if (v10) {
    [v5 setObject:v10 forKeyedSubscript:@"GKSRelayPeerRelayIP"];
  }
  uint64_t v11 = [a3 objectForKeyedSubscript:@"GKSRelaySelfRelayIP"];
  if (v11) {
    [v5 setObject:v11 forKeyedSubscript:@"GKSRelaySelfRelayIP"];
  }
  uint64_t v12 = [a3 objectForKeyedSubscript:@"GKSRelaySelfRelayPort"];
  if (v12) {
    [v5 setObject:v12 forKeyedSubscript:@"GKSRelaySelfRelayPort"];
  }
  uint64_t v13 = [a3 objectForKeyedSubscript:@"GKSRelayRemotePrimaryIdentifier"];
  if (v13) {
    [v5 setObject:v13 forKeyedSubscript:@"GKSRelayRemotePrimaryIdentifier"];
  }
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v29 = v14;
  long long v30 = v14;
  if (GetIPPortFromDict())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(VCTransportSessionLegacy *)v15 createRelayUpdateDictionary:v16];
      }
    }
  }
  else
  {
    *(_DWORD *)__int16 v22 = -1431655766;
    if ((v29 & 1) == 0) {
      *(_DWORD *)__int16 v22 = bswap32(DWORD1(v30));
    }
    uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:4];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, @"GKSRelaySelfRelayNatIP", *(void *)v22);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", WORD2(v31)), @"GKSRelaySelfRelayNatPort");
  }
  if ([(VCTransportSessionLegacy *)self localRelayConnectionData]) {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", -[VCTransportSessionLegacy localRelayConnectionData](self, "localRelayConnectionData"), @"ClientData");
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        __int16 v20 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      }
      else {
        __int16 v20 = "<nil>";
      }
      *(_DWORD *)__int16 v22 = 136315906;
      *(void *)&v22[4] = v18;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCTransportSessionLegacy createRelayUpdateDictionary:]";
      __int16 v25 = 1024;
      int v26 = 1588;
      __int16 v27 = 2080;
      __int16 v28 = v20;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d createRelayUpdateDictionary: dict %s", v22, 0x26u);
    }
  }
  return v5;
}

- (BOOL)getConnectionSetupData:(id *)a3 withOptions:(id)a4 error:(id *)a5
{
  if (!a3) {
    return 0;
  }
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"transportSessionLegacyOptionNonCellularCandidateTimeout"), "doubleValue");
  id v8 = -[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:](self, "connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:", 0, 0, a5);
  *a3 = v8;
  return v8 != 0;
}

- (void)getConnectionDataUsingRelay:(BOOL)a3 isInitialRelay:(BOOL)a4 nonCellularCandidateTimeout:(double)a5 queue:(id)a6 completionHandler:(id)a7
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [a7 copy];
  global_queue = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __123__VCTransportSessionLegacy_getConnectionDataUsingRelay_isInitialRelay_nonCellularCandidateTimeout_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E6DB77D0;
  BOOL v15 = a3;
  BOOL v16 = a4;
  *(double *)&v14[7] = a5;
  v14[4] = self;
  v14[5] = a6;
  v14[6] = v12;
  dispatch_async(global_queue, v14);
}

void __123__VCTransportSessionLegacy_getConnectionDataUsingRelay_isInitialRelay_nonCellularCandidateTimeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  uint64_t v2 = [*(id *)(a1 + 32) connectionDataUsingRelay:*(unsigned __int8 *)(a1 + 64) isInitialRelay:*(unsigned __int8 *)(a1 + 65) nonCellularCandidateTimeout:v6 error:*(double *)(a1 + 56)];
  uint64_t v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __123__VCTransportSessionLegacy_getConnectionDataUsingRelay_isInitialRelay_nonCellularCandidateTimeout_queue_completionHandler___block_invoke_2;
      block[3] = &unk_1E6DB4F60;
      void block[6] = v4;
      block[4] = v2;
      void block[5] = v6[0];
      dispatch_async(v3, block);
    }
  }
}

uint64_t __123__VCTransportSessionLegacy_getConnectionDataUsingRelay_isInitialRelay_nonCellularCandidateTimeout_queue_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)connectionData:(char *)a3 connectionDataSizeInBytes:(int)a4 shouldUseRelay:(BOOL)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:a4];
  free(a3);
  if (a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (v8) {
          uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        }
        else {
          uint64_t v11 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v9;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCTransportSessionLegacy connectionData:connectionDataSizeInBytes:shouldUseRelay:]";
        __int16 v19 = 1024;
        int v20 = 1645;
        __int16 v21 = 2080;
        __int16 v22 = v11;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relayconnectiondata = %s", buf, 0x26u);
      }
    }
    [(VCTransportSessionLegacy *)self setLocalRelayConnectionData:v8];
    perfTimings = self->super._perfTimings;
    uint64_t v13 = 9;
  }
  else
  {
    [(VCTransportSessionLegacy *)self setLocalConnectionData:v8];
    perfTimings = self->super._perfTimings;
    uint64_t v13 = 8;
  }
  [(TimingCollection *)perfTimings stopTimingForKey:v13];
  *(_DWORD *)buf = -1431655766;
  snprintf((char *)buf, 4uLL, "%u", self->_NATType);
  reportingLog();
  return v8;
}

- (id)connectionDataUsingRelay:(BOOL)a3 isInitialRelay:(BOOL)a4 nonCellularCandidateTimeout:(double)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t callID = self->_callID;
  if (!a3 || a4)
  {
    if (a3 && a4) {
      uint64_t v10 = 9;
    }
    else {
      uint64_t v10 = 8;
    }
    [(TimingCollection *)self->super._perfTimings startTimingForKey:v10];
  }
  uint64_t v27 = 0;
  transport = self->transport;
  int v25 = 0;
  [(VCTransport *)transport updateInterfaceList:callID shouldFilterCellInterface:self->super._requiresWiFi isUpdateNeeded:&v25];
  int v12 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-blob-size-max"), "intValue");
  int v26 = v12;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    long long v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v29 = v13;
      __int16 v30 = 2080;
      unint64_t v31 = "-[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:]";
      __int16 v32 = 1024;
      int v33 = 1684;
      __int16 v34 = 1024;
      int v35 = v12;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The max blob size allowed = %d", buf, 0x22u);
    }
  }
  if (!v12) {
    int v26 = 201;
  }
  int v15 = [(VCTransportSessionLegacy *)self generateConnectionData:&v27 forCallID:callID connectionDataSize:&v26 nonCellularCandidateTimeout:a5];
  if (v15 == -2146107370)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v29 = v19;
        __int16 v30 = 2080;
        unint64_t v31 = "-[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:]";
        __int16 v32 = 1024;
        int v33 = 1714;
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ICE_E_NOTFOUND was received, using default connection data", buf, 0x1Cu);
      }
    }
  }
  else if (v15)
  {
    uint64_t v16 = v15;
    reportingLog();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:]();
      }
    }
    if ([(NSMutableDictionary *)[(VCTransportSessionLegacy *)self localRelayRequestResponse] count])
    {
      uint64_t v17 = [(VCTransport *)self->transport detailedErrorCodeForConnectionWithCallID:callID];
      uint64_t v18 = 32019;
    }
    else
    {
      uint64_t v17 = 210;
      uint64_t v18 = 32013;
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a6, v18, v17, v16, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 1707), @"No local connection data", @"Check network settings.");
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    __int16 v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = self->transport;
      *(_DWORD *)buf = 136316418;
      uint64_t v29 = v21;
      __int16 v30 = 2080;
      unint64_t v31 = "-[VCTransportSessionLegacy connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:]";
      __int16 v32 = 1024;
      int v33 = 1717;
      __int16 v34 = 1024;
      int v35 = v26;
      __int16 v36 = 2048;
      uint64_t v37 = v27;
      __int16 v38 = 2048;
      long long v39 = v23;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectDataSizeInBytes = %d, connectionData = %p, transport = %p", buf, 0x36u);
    }
  }
  if (v26 && v27) {
    return -[VCTransportSessionLegacy connectionData:connectionDataSizeInBytes:shouldUseRelay:](self, "connectionData:connectionDataSizeInBytes:shouldUseRelay:");
  }
  reportingLog();
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a6, 32013, 211, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m", 1724), @"No local connection data", @"Check network settings.");
  return 0;
}

- (int)generateConnectionData:(char *)a3 forCallID:(unsigned int)a4 connectionDataSize:(int *)a5 nonCellularCandidateTimeout:(double)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:10.0];
  [(NSCondition *)self->_connectionDataTimeoutCondVar lock];
  transport = self->transport;
  uint64_t localU8Version = self->_localU8Version;
  BOOL useCompressedConnectionData = self->super._useCompressedConnectionData;
  long long v14 = [(VCTransportSessionLegacy *)self localRelayRequestResponse];
  LOBYTE(v24) = 0;
  BOOL v15 = useCompressedConnectionData;
  uint64_t v16 = a5;
  int v17 = [(VCTransport *)transport getConnectionDataForCallID:v8 version:localU8Version useCompressedData:v15 pConnectionData:a3 connectDataSizeInBytes:a5 relayDictionary:v14 interfaceUpdate:a6 nonCellularCandidateTimeout:v24];
  if (v17 == -2146107370)
  {
    while (1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v28 = v18;
          __int16 v29 = 2080;
          __int16 v30 = "-[VCTransportSessionLegacy generateConnectionData:forCallID:connectionDataSize:nonCellularCandidateTimeout:]";
          __int16 v31 = 1024;
          int v32 = 1757;
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SIPGetConnectionData failed, retrying", buf, 0x1Cu);
        }
      }
      if (![(NSCondition *)self->_connectionDataTimeoutCondVar waitUntilDate:v26]) {
        break;
      }
      LOBYTE(v25) = 0;
      int v20 = [(VCTransport *)self->transport getConnectionDataForCallID:v8 version:self->_localU8Version useCompressedData:self->super._useCompressedConnectionData pConnectionData:a3 connectDataSizeInBytes:v16 relayDictionary:[(VCTransportSessionLegacy *)self localRelayRequestResponse] interfaceUpdate:a6 nonCellularCandidateTimeout:v25];
      if (v20 != -2146107370)
      {
        int v17 = v20;
        goto LABEL_12;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v28 = v21;
        __int16 v29 = 2080;
        __int16 v30 = "-[VCTransportSessionLegacy generateConnectionData:forCallID:connectionDataSize:nonCellularCandidateTimeout:]";
        __int16 v31 = 1024;
        int v32 = 1770;
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCallSession generateConnectionData: timed out", buf, 0x1Cu);
      }
    }
    int v17 = -2146107370;
  }
LABEL_12:
  [(NSCondition *)self->_connectionDataTimeoutCondVar unlock];

  return v17;
}

- (void)setupTransport
{
  v8[5] = *MEMORY[0x1E4F143B8];
  transport = self->transport;
  if (!transport)
  {
    transport = +[VCTransport sharedInstance];
    self->transport = transport;
  }
  uint64_t callID = self->_callID;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__VCTransportSessionLegacy_setupTransport__block_invoke;
  void v8[3] = &unk_1E6DB77F8;
  v8[4] = self;
  v6[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __42__VCTransportSessionLegacy_setupTransport__block_invoke_2;
  v7[3] = &unk_1E6DB7820;
  v7[4] = self;
  v5[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __42__VCTransportSessionLegacy_setupTransport__block_invoke_3;
  v6[3] = &unk_1E6DB7848;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__VCTransportSessionLegacy_setupTransport__block_invoke_4;
  v5[3] = &unk_1E6DB7870;
  [(VCTransport *)transport registerICEBlockForCallID:callID connectedBlock:v8 newCandidatesBlock:v7 newNominationBlock:v6 removeIPPortBlock:v5];
}

uint64_t __42__VCTransportSessionLegacy_setupTransport__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 32) connectionResultCallback:a2 didReceiveICEPacket:a3 didUseRelay:a4 secretKey:a5 skeResult:a6];
}

uint64_t __42__VCTransportSessionLegacy_setupTransport__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleNewCandidates:a2 version:a3];
}

uint64_t __42__VCTransportSessionLegacy_setupTransport__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = (void *)[*(id *)(a1 + 32) connectionManager];

  return [v13 shouldNominateCandidatePair:a2 interfaceMask:a3 nominated:a4 demote:a5 connectionPriority:a6 replaceOnly:a7];
}

uint64_t __42__VCTransportSessionLegacy_setupTransport__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) connectionManager];

  return [v5 removeConnectionWithIPPort:a2 isLocalInterface:a3];
}

- (void)resetICETimeoutToLongTimeout
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d [transport setICETimeout] timeout failed with %08x", v2, v3, v4, v5);
}

- (double)iceTimeoutInSeconds:(BOOL)a3
{
  if (self->allowsRelay)
  {
    double result = 60.0;
    if (self->_isCaller && !a3)
    {
      if (GKSConnectivitySettings_GetICETimeout() <= 0.0)
      {
        return 60.0;
      }
      else
      {
        return GKSConnectivitySettings_GetICETimeout();
      }
    }
  }
  else
  {
    double result = 1.0;
    if (!self->_tcpTunnelClient) {
      return 15.0;
    }
  }
  return result;
}

- (tagIPPORT)IPPortForPrimaryConnectionOnLocalInterface:(SEL)a3
{
  BOOL v4 = a4;
  *(void *)&retstr->IP.abIPv6[12] = 0;
  *(_OWORD *)&retstr->iFlags = 0u;
  *(_OWORD *)&retstr->szIfName[12] = 0u;
  double result = (tagIPPORT *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->super._connectionManager);
  if (result)
  {
    uint64_t v7 = result;
    if ([(tagIPPORT *)result connectionResult])
    {
      uint64_t v8 = [(tagIPPORT *)v7 connectionResult];
      uint64_t v9 = 148;
      if (v4) {
        uint64_t v9 = 28;
      }
      uint64_t v10 = v8 + v9;
      long long v11 = *(_OWORD *)(v10 + 16);
      *(_OWORD *)&retstr->iFlags = *(_OWORD *)v10;
      *(_OWORD *)&retstr->szIfName[12] = v11;
      *(void *)&retstr->IP.abIPv6[12] = *(void *)(v10 + 32);
    }
    CFRelease(v7);
  }
  return result;
}

- (unsigned)connectionTypeForConnectionResult:(tagCONNRESULT *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->bIfRelay)
  {
    if (self->requestedTimeoutRelay) {
      return 5;
    }
    else {
      return 2;
    }
  }
  else if (a3->bIfUpgrade)
  {
    return 6;
  }
  else
  {
    return 1;
  }
}

- (BOOL)isConnectedAndAllowAdditionalConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = [(VCConnectionManager *)self->super._connectionManager connectionCount];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    BOOL v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCTransportSessionLegacy isConnectedAndAllowAdditionalConnection]";
      __int16 v10 = 1024;
      int v11 = 1891;
      __int16 v12 = 1024;
      int v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d number of connection is %d", (uint8_t *)&v6, 0x22u);
    }
  }
  return (v2 - 1) < 2;
}

- (int)detailedErrorCode
{
  return [(VCTransport *)self->transport detailedErrorCodeForConnectionWithCallID:self->_callID];
}

- (void)reportNetworkConditionsDegraded
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v3 = v2;
  long long v4 = v2;
  if (self)
  {
    -[VCTransportSessionLegacy IPPortForPrimaryConnectionOnLocalInterface:](self, "IPPortForPrimaryConnectionOnLocalInterface:", 1, v3, v4, v5, v6);
  }
  else
  {
    unint64_t v5 = 0;
    long long v3 = 0u;
    long long v4 = 0u;
  }
  VTP_SetNetworkLogLevel((uint64_t)&v3, 6);
}

- (void)handleMediaReceivedOverPeerToPeerLinkWithConnectionId:(int)a3
{
}

- (void)handleMediaReceivedOverRelayLinkWithConnectionId:(int)a3
{
}

- (void)setIdentity:(__SecIdentity *)a3
{
  if (a3) {
    long long v4 = (__SecIdentity *)CFRetain(a3);
  }
  else {
    long long v4 = 0;
  }
  self->_identity = v4;
}

- (int)pendingRelayCount
{
  return self->pendingRelayCount;
}

- (void)setPendingRelayCount:(int)a3
{
  self->pendingRelayCount = a3;
}

- (BOOL)initialSecondaryRelaySetupDone
{
  return self->initialSecondaryRelaySetupDone;
}

- (void)setInitialSecondaryRelaySetupDone:(BOOL)a3
{
  self->initialSecondaryRelaySetupDone = a3;
}

- (BOOL)isCaller
{
  return self->_isCaller;
}

- (void)setIsCaller:(BOOL)a3
{
  self->_isCaller = a3;
}

- (NSString)localParticipantID
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setLocalParticipantID:(id)a3
{
}

- (NSString)remoteParticipantID
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setRemoteParticipantID:(id)a3
{
}

- (NSData)localConnectionData
{
  return (NSData *)objc_getProperty(self, a2, 336, 1);
}

- (void)setLocalConnectionData:(id)a3
{
}

- (NSData)remoteConnectionData
{
  return (NSData *)objc_getProperty(self, a2, 352, 1);
}

- (void)setRemoteConnectionData:(id)a3
{
}

- (NSData)localRelayConnectionData
{
  return (NSData *)objc_getProperty(self, a2, 344, 1);
}

- (void)setLocalRelayConnectionData:(id)a3
{
}

- (NSData)remoteRelayConnectionData
{
  return self->_remoteRelayConnectionData;
}

- (void)setRemoteRelayConnectionData:(id)a3
{
}

- (BOOL)allowsRelay
{
  return self->allowsRelay;
}

- (void)setAllowsRelay:(BOOL)a3
{
  self->allowsRelay = a3;
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setSessionID:(id)a3
{
}

- (unsigned)remoteCallID
{
  return self->_remoteCallID;
}

- (void)setRemoteCallID:(unsigned int)a3
{
  self->_remoteCallID = a3;
}

- (unsigned)connectionSetupRTTEstimate
{
  return self->_connectionSetupRTTEstimate;
}

- (BOOL)isRemoteOSPreLion
{
  return self->_isRemoteOSPreLion;
}

- (NSMutableDictionary)localRelayRequestResponse
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLocalRelayRequestResponse:(id)a3
{
}

- (NSMutableDictionary)remoteRelayRequestResponse
{
  return self->_remoteRelayRequestResponse;
}

- (void)setRemoteRelayRequestResponse:(id)a3
{
}

- (NSDictionary)localRelayUpdate
{
  return self->_localRelayUpdate;
}

- (void)setLocalRelayUpdate:(id)a3
{
}

- (NSDictionary)remoteRelayUpdate
{
  return self->_remoteRelayUpdate;
}

- (void)setRemoteRelayUpdate:(id)a3
{
}

- (int)NATType
{
  return self->_NATType;
}

- (void)setNATType:(int)a3
{
  self->_NATType = a3;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_unint64_t operatingMode = a3;
}

void __33__VCTransportSessionLegacy_start__block_invoke_cold_1(uint64_t a1, id *a2)
{
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d startConnectionWithBlob for P2P failed with error %s", v4, v5, v6, v7, 2u);
}

- (void)startConnectionWithBlob:useRelay:isInitialRelay:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_11();
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: VCCallSession: StartConnectionCheck failed(%X)", v1, 0x28u);
}

- (void)startConnectionWithBlob:useRelay:isInitialRelay:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_11();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: VCCallSession: StartConnectionCheck failed(%X)", v1, 0x28u);
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 323;
  __int16 v4 = v0;
  int v5 = 323;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: processRelayRequestResponseDict: can't find relay type info in the dictionary", v2, 0x22u);
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8_8();
  if ([*v1 userInfo]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v0, "userInfo"), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Unable to create TCPTunnel: %s", v4, v5, v6, v7, 2u);
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8_8();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*v3 userInfo]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v2, "userInfo"), "description"), "UTF8String");
  }
  int v4 = 136315906;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_5_1();
  uint64_t v6 = "-[VCTransportSessionLegacy processRelayRequestResponse:didOriginateRequest:]_block_invoke";
  __int16 v7 = 1024;
  OUTLINED_FUNCTION_7_8();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Unable to create TCPTunnel: %s", (uint8_t *)&v4, 0x26u);
}

void __76__VCTransportSessionLegacy_processRelayRequestResponse_didOriginateRequest___block_invoke_38_cold_1()
{
  OUTLINED_FUNCTION_8_8();
  if ([v1 userInfo]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v0, "userInfo"), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Unabled to create UDP relay blob: %s", v4, v5, v6, v7, 2u);
}

void __67__VCTransportSessionLegacy_processRelayUpdate_didOriginateRequest___block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 435;
  __int16 v4 = v0;
  int v5 = 435;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: processRelayUpdateDict: can't find relay type info in the dictionary", v2, 0x22u);
}

void __49__VCTransportSessionLegacy_networkStateDidChange__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d networkStateDidChange: Error %x getting connection data!", v2, v3, v4, v5);
}

- (void)processRemoteIPChange:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d HandoverReport: Bad blob version number: %d", v2, v3, v4, v5);
}

- (void)handleExchangedKey:result:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Key exchange failed with error: %d", v2, v3, v4, v5);
}

- (void)createInitiateRelayDictionaryForCall:(uint64_t)a1 primaryConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[VCTransportSessionLegacy createInitiateRelayDictionaryForCall:primaryConnection:]";
  __int16 v6 = 1024;
  int v7 = 1438;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Didn't find valid remote candidate ID, cannot create relay dictionary", (uint8_t *)&v2, 0x1Cu);
}

- (void)createRelayUpdateDictionary:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  int v8 = 136316162;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  int v10 = 1582;
  __int16 v11 = v5;
  int v12 = 1582;
  __int16 v13 = v6;
  uint64_t v14 = v7;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTransportSessionLegacy.m:%d: createRelayUpdateDictionary: requestResponse is %s", (uint8_t *)&v8, 0x2Cu);
}

- (void)connectionDataUsingRelay:isInitialRelay:nonCellularCandidateTimeout:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error %x getting sip connection data!", v2, v3, v4, v5);
}

@end