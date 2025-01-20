@interface VCTransportSessionIDS
+ (int)transportTypeForConnectionType:(int)a3;
- (BOOL)getConnectionSetupData:(id *)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)isIPv6;
- (NSString)destination;
- (VCTransportSessionIDS)initWithCallID:(unsigned int)a3 reportingAgent:(id)a4;
- (VCTransportSessionIDS)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6;
- (VCTransportSessionIDS)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6 dataPath:(int)a7;
- (id)connectionSetupPiggybackBlob;
- (id)copyActiveConnection;
- (id)datagramChannel;
- (int)flushBasebandQueueForConnection:(id)a3 payloadInfoList:(id)a4;
- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5;
- (int)networkInterfaceType;
- (int)onStart;
- (int)registerBasebandNotificationsForConnection:(id)a3;
- (int)socket;
- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4;
- (unsigned)networkMTU;
- (unsigned)remoteDeviceVersionIDS;
- (void)cleanupDatagramChannel;
- (void)datagramChannelEventLogForInfo:(id)a3 eventInfo:(id)a4;
- (void)dealloc;
- (void)deregisterBasebandNotifications;
- (void)dispatchedProcessDatagramChannelEventInfo:(id)a3;
- (void)handleCellularMTUChanged:(id)a3;
- (void)handleCellularSoMaskChanged:(id)a3;
- (void)handleChannelInfoReport:(id)a3;
- (void)handleDefaultLinkUpdatedWithInfo:(id)a3;
- (void)handleEncryptionConfig:(id)a3;
- (void)handleIDSEncryptionInfoEvent:(id)a3;
- (void)handleIDSMembershipChangeInfoEvent:(id)a3;
- (void)handleLinkConnectedWithInfo:(id)a3;
- (void)handleLinkConstrainsChanged:(id)a3;
- (void)handleLinkDisconnectedWithInfo:(id)a3;
- (void)handleLinkPreferSuggestion:(id)a3;
- (void)handlePreConnectionDataReceived:(id)a3;
- (void)handleProbingResponse:(id)a3;
- (void)handleRATChanged:(id)a3;
- (void)handleReportingBlob:(id)a3;
- (void)handleStatResponse:(id)a3;
- (void)processDatagramChannelEventInfo:(id)a3;
- (void)processSessionBasedServerExperiments:(id)a3;
- (void)setConnectionSetupPiggybackBlob:(id)a3;
- (void)setConnectionSetupTime;
- (void)setDestination:(id)a3;
- (void)setPiggybackBlobPreference;
- (void)setSocket:(int)a3;
- (void)start;
- (void)startMKMRecoveryForParticipantIDs:(id)a3;
- (void)stop;
@end

@implementation VCTransportSessionIDS

- (VCTransportSessionIDS)initWithCallID:(unsigned int)a3 reportingAgent:(id)a4
{
  return [(VCTransportSessionIDS *)self initWithCallID:*(void *)&a3 requireEncryptionInfo:0 reportingAgent:a4 notificationQueue:0];
}

- (VCTransportSessionIDS)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6
{
  return [(VCTransportSessionIDS *)self initWithCallID:*(void *)&a3 requireEncryptionInfo:a4 reportingAgent:a5 notificationQueue:a6 dataPath:0];
}

- (VCTransportSessionIDS)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6 dataPath:(int)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VCTransportSessionIDS;
  v9 = [(VCTransportSession *)&v15 initWithNotificationQueue:a6 reportingAgent:a5];
  v10 = v9;
  if (v9)
  {
    v9->_socket = -1;
    v9->_requireEncryptionInfo = a4;
    v9->_dataPath = a7;
    v9->_BOOL useIDSLinkSuggestionFeatureFlag = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-ids-link-suggestion-enabled" userDefaultKey:@"idsLinkSuggestionEnabled" featureFlagDomain:"AVConference" featureFlagName:"UseIDSLinkSuggestion"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL useIDSLinkSuggestionFeatureFlag = v10->_useIDSLinkSuggestionFeatureFlag;
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v11;
        __int16 v18 = 2080;
        v19 = "-[VCTransportSessionIDS initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:dataPath:]";
        __int16 v20 = 1024;
        int v21 = 80;
        __int16 v22 = 1024;
        BOOL v23 = useIDSLinkSuggestionFeatureFlag;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d useIDSLinkSuggestionFeatureFlag=%d", buf, 0x22u);
      }
    }
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int socket = self->_socket;
  if (socket != -1) {
    close(socket);
  }

  v4.receiver = self;
  v4.super_class = (Class)VCTransportSessionIDS;
  [(VCTransportSession *)&v4 dealloc];
}

- (id)datagramChannel
{
  v2 = self->_datagramChannel;

  return v2;
}

- (BOOL)isIPv6
{
  id v2 = [(VCTransportSessionIDS *)self copyActiveConnection];
  BOOL v3 = VCConnection_ReportingIPVersion((uint64_t)v2) == 3;

  return v3;
}

- (unsigned)networkMTU
{
  id v2 = [(VCTransportSessionIDS *)self copyActiveConnection];
  unsigned int v3 = [v2 connectionMTU];

  return v3;
}

- (int)networkInterfaceType
{
  id v2 = [(VCTransportSessionIDS *)self copyActiveConnection];
  int v3 = +[VCTransportSessionIDS transportTypeForConnectionType:](VCTransportSessionIDS, "transportTypeForConnectionType:", [v2 localConnectionType]);

  return v3;
}

- (id)copyActiveConnection
{
}

- (BOOL)getConnectionSetupData:(id *)a3 withOptions:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)processDatagramChannelEventInfo:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCTransportSessionIDS_processDatagramChannelEventInfo___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __57__VCTransportSessionIDS_processDatagramChannelEventInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedProcessDatagramChannelEventInfo:*(void *)(a1 + 40)];
}

- (void)datagramChannelEventLogForInfo:(id)a3 eventInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v6 = [a3 unsignedIntValue];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6 == 10)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [a3 intValue];
        uint64_t v11 = *MEMORY[0x1E4F6A910];
        if ([a4 objectForKeyedSubscript:*MEMORY[0x1E4F6A910]]) {
          v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v11), "description"), "UTF8String");
        }
        else {
          v12 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v22 = v8;
        __int16 v23 = 2080;
        uint64_t v24 = "-[VCTransportSessionIDS datagramChannelEventLogForInfo:eventInfo:]";
        __int16 v25 = 1024;
        int v26 = 146;
        __int16 v27 = 1024;
        *(_DWORD *)v28 = v10;
        *(_WORD *)&v28[4] = 2080;
        *(void *)&v28[6] = v12;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received IDS data channel event=%d with keyIndex=%s", buf, 0x2Cu);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    __str = 0;
    int v13 = [a3 intValue];
    v14 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Received IDS data channel event=%d with payload=%s", v13, v14);
    if (__str)
    {
      __lasts = 0;
      objc_super v15 = strtok_r(__str, "\n", &__lasts);
      v16 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          __int16 v18 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v22 = v17;
            __int16 v23 = 2080;
            uint64_t v24 = "-[VCTransportSessionIDS datagramChannelEventLogForInfo:eventInfo:]";
            __int16 v25 = 1024;
            int v26 = 149;
            __int16 v27 = 2080;
            *(void *)v28 = "-[VCTransportSessionIDS datagramChannelEventLogForInfo:eventInfo:]";
            *(_WORD *)&v28[8] = 2080;
            *(void *)&v28[10] = v15;
            _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        objc_super v15 = strtok_r(0, "\n", &__lasts);
      }
      while (v15);
      free(__str);
    }
  }
}

- (void)dispatchedProcessDatagramChannelEventInfo:(id)a3
{
  v44[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A718]];
  if (v5)
  {
    int v6 = (void *)v5;
    [(VCTransportSessionIDS *)self datagramChannelEventLogForInfo:v5 eventInfo:a3];
    int v7 = [v6 unsignedIntValue];
    switch(v7)
    {
      case 1:
        unsigned __int8 v8 = +[VCDefaults integerValueForKey:@"idsLinkSuggestionKey" defaultValue:0];
        unsigned __int8 v9 = v8;
        if (self->_linkPreferSuggestionFromDefaults != v8)
        {
          self->_unsigned int linkPreferSuggestionFromDefaults = v8;
          int64_t v10 = +[VCDefaults integerValueForKey:@"idsLinkIPPreferenceKey" defaultValue:0];
          v43[0] = *MEMORY[0x1E4F6A8D8];
          uint64_t v11 = [NSNumber numberWithUnsignedChar:v9];
          uint64_t v12 = *MEMORY[0x1E4F6A8D0];
          v44[0] = v11;
          v44[1] = &unk_1F3DC4530;
          v43[1] = v12;
          v43[2] = @"lipp";
          v44[2] = [NSNumber numberWithInt:v10];
          uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            objc_super v15 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              unsigned int linkPreferSuggestionFromDefaults = self->_linkPreferSuggestionFromDefaults;
              *(_DWORD *)buf = 136316418;
              uint64_t v32 = v14;
              __int16 v33 = 2080;
              v34 = "-[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]";
              __int16 v35 = 1024;
              int v36 = 171;
              __int16 v37 = 1024;
              unsigned int v38 = linkPreferSuggestionFromDefaults;
              __int16 v39 = 1024;
              int v40 = 100;
              __int16 v41 = 1024;
              int v42 = v10;
              _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing link suggestion using defaults. IDSLinkSuggestionKey=%d IDSLinkScoreKey=%d IDSLinkIPPreferenceKey=%d", buf, 0x2Eu);
            }
          }
          [(VCTransportSessionIDS *)self handleLinkPreferSuggestion:v13];
        }
        [(VCTransportSessionIDS *)self handleLinkConnectedWithInfo:a3];
        if (!self->_sessionBasedServerExperimentsProcessed)
        {
          [(VCTransportSessionIDS *)self processSessionBasedServerExperiments:a3];
          self->_sessionBasedServerExperimentsProcessed = 1;
        }
        [(TimingCollection *)self->super._perfTimings stopTimingForKey:13];
        break;
      case 2:
        [(VCTransportSessionIDS *)self handleLinkDisconnectedWithInfo:a3];
        break;
      case 3:
        v19 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A818]];
        if (VCConnectionIDSIsCellularRATType([v19 intValue])) {
          -[VCConnectionManager setRealRATType:](self->super._connectionManager, "setRealRATType:", [v19 intValue]);
        }
        uint64_t v20 = [+[VCDefaults sharedInstance] localRATTypeOverride];
        if (v20 != -1)
        {
          uint64_t v21 = v20;
          if (VCConnectionIDSIsCellularRATType(v20)) {
            v19 = (void *)[NSNumber numberWithInt:v21];
          }
        }
        [(VCTransportSessionIDS *)self handleRATChanged:v19];
        break;
      case 4:
        [(VCTransportSessionIDS *)self handleDefaultLinkUpdatedWithInfo:a3];
        break;
      case 5:
        uint64_t v22 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A778]];
        [(VCTransportSessionIDS *)self handlePreConnectionDataReceived:v22];
        break;
      case 6:
      case 9:
      case 12:
        goto LABEL_19;
      case 7:
        uint64_t v23 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A6B0]];
        [(VCTransportSessionIDS *)self handleCellularMTUChanged:v23];
        break;
      case 8:
        uint64_t v24 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A728]];
        [(VCTransportSessionIDS *)self handleChannelInfoReport:v24];
        break;
      case 10:
        [(VCTransportSessionIDS *)self handleIDSEncryptionInfoEvent:a3];
        break;
      case 11:
        uint64_t v25 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A6F0]];
        [(VCTransportSessionIDS *)self handleIDSMembershipChangeInfoEvent:v25];
        break;
      case 13:
        uint64_t v26 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A710]];
        [(VCTransportSessionIDS *)self handleStatResponse:v26];
        break;
      case 14:
        [(VCTransportSessionIDS *)self handleSessionInfoResponse:a3];
        break;
      case 15:
        uint64_t v27 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A6F8]];
        [(VCTransportSessionIDS *)self handleProbingResponse:v27];
        break;
      case 16:
        uint64_t v28 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A6B8]];
        [(VCTransportSessionIDS *)self handleCellularSoMaskChanged:v28];
        break;
      case 17:
        [(VCTransportSessionIDS *)self handleLinkConstrainsChanged:a3];
        break;
      case 18:
        id v30 = (id)[a3 mutableCopy];
        [v30 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"transportSessionEventPayloadKey_IsCellular"];
        [(VCTransportSessionIDS *)self handleLinkConstrainsChanged:v30];

        break;
      case 19:
        [(VCTransportSessionIDS *)self handleLinkPreferSuggestion:a3];
        break;
      case 20:
        uint64_t v29 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A700]];
        [(VCTransportSessionIDS *)self handleReportingBlob:v29];
        break;
      case 21:
        [(VCTransportSessionIDS *)self handleEncryptionConfig:a3];
        break;
      default:
        if (v7 == 1001)
        {
          reportingSymptom();
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]();
            }
          }
        }
        else
        {
LABEL_19:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            uint64_t v17 = VRTraceErrorLogLevelToCSTR();
            __int16 v18 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v32 = v17;
              __int16 v33 = 2080;
              v34 = "-[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]";
              __int16 v35 = 1024;
              int v36 = 251;
              __int16 v37 = 1024;
              unsigned int v38 = [v6 unsignedIntValue];
              _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received unknown IDSDatagramChannelEvent %d", buf, 0x22u);
            }
          }
        }
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]();
    }
  }
}

- (unsigned)remoteDeviceVersionIDS
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  remoteFrameworkVersion = self->super._remoteFrameworkVersion;
  if (!remoteFrameworkVersion)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x1E4F47A50];
      unsigned int v4 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v4;
      }
      int v10 = 136315650;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCTransportSessionIDS remoteDeviceVersionIDS]";
      __int16 v14 = 1024;
      int v15 = 273;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote device framework version IDS is unknown", (uint8_t *)&v10, 0x1Cu);
    }
    return 0;
  }
  int v3 = [(NSString *)remoteFrameworkVersion intValue];
  if (v3 >= 1700)
  {
    if (v3 >= 0x71D)
    {
      if (v3 < 0x7AD) {
        unsigned int v4 = 3;
      }
      else {
        unsigned int v4 = 4;
      }
    }
    else
    {
      unsigned int v4 = 2;
    }
  }
  else
  {
    unsigned int v4 = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    unsigned __int8 v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCTransportSessionIDS remoteDeviceVersionIDS]";
      __int16 v14 = 1024;
      int v15 = 271;
      __int16 v16 = 1024;
      unsigned int v17 = v4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote device framework version IDS selected '%d'", (uint8_t *)&v10, 0x22u);
    }
  }
  return v4;
}

- (void)start
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__VCTransportSessionIDS_start__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __30__VCTransportSessionIDS_start__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = +[VCDatagramChannelManager sharedInstance];
  uint64_t v30 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 248) && *(_DWORD *)(v3 + 240) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __30__VCTransportSessionIDS_start__block_invoke_cold_1();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        __30__VCTransportSessionIDS_start__block_invoke_cold_2();
      }
    }
    +[GKVoiceChatError getNSError:&v30 code:32002 detailedCode:1101 filePath:0 description:@"Start VCTransportSessionIDS failed" reason:@"Destination/socket not set"];
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F47A30], "weakObjectHolderWithObject:");
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __30__VCTransportSessionIDS_start__block_invoke_38;
    uint64_t v28 = &unk_1E6DB6A90;
    uint64_t v29 = v4;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 72);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __30__VCTransportSessionIDS_start__block_invoke_2;
    uint64_t v23 = &unk_1E6DB6AB8;
    uint64_t v24 = v6;
    uint64_t v7 = *(void *)(v5 + 248);
    if (v7)
    {
      *(void *)(*(void *)(a1 + 32) + 232) = [(VCDatagramChannelManager *)v2 addDatagramChannelWithDestination:v7 eventHandler:&v25 writeCompletionHandler:&v20 dataPath:*(unsigned int *)(v5 + 260) error:&v30];
      if ([*(id *)(*(void *)(a1 + 32) + 248) hasPrefix:@"loopback:"])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          unsigned __int8 v9 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v32 = v8;
            __int16 v33 = 2080;
            v34 = "-[VCTransportSessionIDS start]_block_invoke_3";
            __int16 v35 = 1024;
            int v36 = 327;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: Setting mode at init for VCMockIDSDatagramChannel instead of IDSDatagramChannel", buf, 0x1Cu);
          }
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "setOneToOneModeEnabled:isInitiator:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "connectionManager"), "isOneToOneModeEnabled"), 0);
      }
    }
    else
    {
      uint64_t v10 = *(unsigned int *)(v5 + 240);
      if (v10 != -1) {
        *(void *)(*(void *)(a1 + 32) + 232) = [(VCDatagramChannelManager *)v2 addDatagramChannelWithDescriptor:v10 eventHandler:&v25 writeCompletionHandler:&v20 error:&v30];
      }
    }
    uint64_t v11 = *(void **)(a1 + 32);
    if (!v11[29]) {
      return [v11 callEventHandlerWithEvent:7 info:v30];
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "remoteDeviceVersionIDS")), @"preference-remote-device-version-key");
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v13 + 256))
    {
      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A7A8]];
      uint64_t v13 = *(void *)(a1 + 32);
    }
    [*(id *)(v13 + 232) setChannelPreferences:v12];

    int v14 = [*(id *)(*(void *)(a1 + 32) + 232) start];
    if (v14 < 0)
    {
      int v18 = v14;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __30__VCTransportSessionIDS_start__block_invoke_cold_3();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          __30__VCTransportSessionIDS_start__block_invoke_cold_4();
        }
      }
      +[GKVoiceChatError getNSError:&v30, 32002, 1102, v18, 0, @"Could not start transport session", @"datagramChannel start failed", v20, v21, v22, v23, v24, v25, v26, v27, v28, v29 code detailedCode returnCode filePath description reason];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 64) stopTimingForKey:12];
      [*(id *)(*(void *)(a1 + 32) + 64) startTimingForKey:13];
      [*(id *)(a1 + 32) setPiggybackBlobPreference];
      int v15 = *(_DWORD **)(a1 + 32);
      if (v15[60] != -1)
      {
        v15[60] = -1;
        [*(id *)(*(void *)(a1 + 32) + 232) readyToRead];
        int v15 = *(_DWORD **)(a1 + 32);
      }
      int v16 = [v15 onStart];
      if ((v16 & 0x80000000) == 0) {
        return [*(id *)(a1 + 32) addNetworkAssertionWithInterfaceType:3];
      }
      int v19 = v16;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __30__VCTransportSessionIDS_start__block_invoke_cold_5();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          __30__VCTransportSessionIDS_start__block_invoke_cold_6();
        }
      }
      +[GKVoiceChatError getNSError:&v30, 32002, 1103, v19, 0, @"Could not start transport session", @"onStart failed", v20, v21, v22, v23, v24, v25, v26, v27, v28, v29 code detailedCode returnCode filePath description reason];
    }
    [*(id *)(a1 + 32) cleanupDatagramChannel];
  }
  uint64_t v11 = *(void **)(a1 + 32);
  return [v11 callEventHandlerWithEvent:7 info:v30];
}

void __30__VCTransportSessionIDS_start__block_invoke_38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x1E4E589F0]();
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "processDatagramChannelEventInfo:", a2);
}

void __30__VCTransportSessionIDS_start__block_invoke_2(uint64_t a1, __CFString *a2, unint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __30__VCTransportSessionIDS_start__block_invoke_2_cold_1();
      }
    }
  }
  else
  {
    VTP_IncrementTotalBytesSent(a3);
  }
  if (v5) {
    VCConnectionManager_UpdatePacketSendStatus(v5, a2 == 0);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v9 = @"success";
        int v11 = 136316162;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        if (a2) {
          unsigned __int8 v9 = a2;
        }
        int v14 = "_VCTransportSessionIDS_writeCompletionHandler";
        __int16 v15 = 1024;
        int v16 = 289;
        __int16 v17 = 2048;
        unint64_t v18 = a3;
        __int16 v19 = 2112;
        uint64_t v20 = v9;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finished sending %zd bytes with error=%@", (uint8_t *)&v11, 0x30u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = @"success";
      int v11 = 136316162;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      if (a2) {
        uint64_t v10 = a2;
      }
      int v14 = "_VCTransportSessionIDS_writeCompletionHandler";
      __int16 v15 = 1024;
      int v16 = 289;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_debug_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Finished sending %zd bytes with error=%@", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (void)stop
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCTransportSessionIDS;
  [(VCTransportSession *)&v5 stop];
  stateQueue = self->super._stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__VCTransportSessionIDS_stop__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(stateQueue, v4);
}

uint64_t __29__VCTransportSessionIDS_stop__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) onStop];
  [*(id *)(a1 + 32) cleanupDatagramChannel];
  id v2 = *(void **)(a1 + 32);

  return [v2 removeNetworkAssertion];
}

- (void)cleanupDatagramChannel
{
  self->_datagramChannel = 0;
}

- (void)startMKMRecoveryForParticipantIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCTransportSessionIDS startMKMRecoveryForParticipantIDs:]";
      __int16 v11 = 1024;
      int v12 = 410;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Start MKM recovery for pariticipantIDs %@", (uint8_t *)&v7, 0x26u);
    }
  }
  [(VCDatagramChannelIDS *)self->_datagramChannel startMKMRecoveryForParticipantIDs:a3];
}

- (void)setConnectionSetupPiggybackBlob:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCTransportSessionIDS_setConnectionSetupPiggybackBlob___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __57__VCTransportSessionIDS_setConnectionSetupPiggybackBlob___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(const void **)(a1 + 40);
  uint64_t v4 = *(const void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
  if (v2) {
    CFRetain(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5[29])
  {
    [v5 setPiggybackBlobPreference];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 136315906;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      int v12 = "-[VCTransportSessionIDS setConnectionSetupPiggybackBlob:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 421;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Caching piggyback blob %p", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (void)setPiggybackBlobPreference
{
  v20[1] = *MEMORY[0x1E4F143B8];
  connectionSetupPiggybackBlob = self->super._connectionSetupPiggybackBlob;
  if (connectionSetupPiggybackBlob)
  {
    uint64_t v19 = *MEMORY[0x1E4F6A7B0];
    v20[0] = connectionSetupPiggybackBlob;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    if ((int)VRTraceGetErrorLogLevelForModule() > 5)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = self->super._connectionSetupPiggybackBlob;
        int v8 = VCDatagramChannelIDS_Token((uint64_t)self->_datagramChannel);
        int v9 = 136316162;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        int v12 = "-[VCTransportSessionIDS setPiggybackBlobPreference]";
        __int16 v13 = 1024;
        int v14 = 430;
        __int16 v15 = 2048;
        uint64_t v16 = v7;
        __int16 v17 = 1024;
        int v18 = v8;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set piggyback blob %p on datagram channel %d", (uint8_t *)&v9, 0x2Cu);
      }
    }
    [(VCDatagramChannelIDS *)self->_datagramChannel setChannelPreferences:v4];
  }
}

- (id)connectionSetupPiggybackBlob
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  uint64_t v11 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VCTransportSessionIDS_connectionSetupPiggybackBlob__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __53__VCTransportSessionIDS_connectionSetupPiggybackBlob__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 32);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int)onStart
{
  return 0;
}

- (void)handleLinkConnectedWithInfo:(id)a3
{
}

- (void)handleLinkDisconnectedWithInfo:(id)a3
{
}

- (void)handleDefaultLinkUpdatedWithInfo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A6C8]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      int v9 = "-[VCTransportSessionIDS handleDefaultLinkUpdatedWithInfo:]";
      __int16 v10 = 1024;
      int v11 = 463;
      __int16 v12 = 1024;
      int v13 = [v3 linkID];
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: default link updated to %d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)handlePreConnectionDataReceived:(id)a3
{
}

- (void)handleRATChanged:(id)a3
{
  id v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a3 intValue] == 8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v5;
        __int16 v10 = 2080;
        int v11 = "-[VCTransportSessionIDS handleRATChanged:]";
        __int16 v12 = 1024;
        int v13 = 474;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got 5G iRAT notification", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
  else
  {
    if ([(VCTransportSessionIDS *)self remoteDeviceVersionIDS] == 1
      && ([v3 intValue] == 1009 || objc_msgSend(v3, "intValue") == 1010))
    {
      id v3 = &unk_1F3DC4548;
    }
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", VCConnectionIDSCellTechForRATType(objc_msgSend(v3, "intValue")));
    [(VCTransportSession *)self callEventHandlerWithEvent:8 info:v7];
  }
}

- (void)handleCellularMTUChanged:(id)a3
{
}

- (void)handleIDSEncryptionInfoEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316418;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCTransportSessionIDS handleIDSEncryptionInfoEvent:]";
      __int16 v11 = 1024;
      int v12 = 493;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCTransportSessionIDS handleIDSEncryptionInfoEvent:]";
      __int16 v17 = 1024;
      int v18 = 493;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [(VCTransportSession*)%p %s]:%d IDS channel encryption info", (uint8_t *)&v7, 0x36u);
    }
  }
  [(VCTransportSession *)self callEventHandlerWithEvent:11 info:a3];
}

- (void)handleIDSMembershipChangeInfoEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316418;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCTransportSessionIDS handleIDSMembershipChangeInfoEvent:]";
      __int16 v11 = 1024;
      int v12 = 499;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCTransportSessionIDS handleIDSMembershipChangeInfoEvent:]";
      __int16 v17 = 1024;
      int v18 = 499;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [(VCTransportSession*)%p %s]:%d IDS channel membership change info", (uint8_t *)&v7, 0x36u);
    }
  }
  [(VCTransportSession *)self callEventHandlerWithEvent:12 info:a3];
}

- (void)handleProbingResponse:(id)a3
{
}

- (void)handleCellularSoMaskChanged:(id)a3
{
  if (a3)
  {
    char v4 = [a3 unsignedIntValue];
    if ((v4 & 4) != 0)
    {
      uint64_t v5 = &unk_1F3DC4560;
    }
    else if ((v4 & 8) != 0)
    {
      uint64_t v5 = &unk_1F3DC4578;
    }
    else
    {
      if ((v4 & 1) == 0) {
        return;
      }
      uint64_t v5 = &unk_1F3DC4548;
    }
    [(VCTransportSessionIDS *)self handleRATChanged:v5];
  }
}

- (void)handleLinkConstrainsChanged:(id)a3
{
}

- (void)setConnectionSetupTime
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__VCTransportSessionIDS_setConnectionSetupTime__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __47__VCTransportSessionIDS_setConnectionSetupTime__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) isValidTimingForKey:26];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 64) timingForKey:26];
    double v4 = v3;
    [*(id *)(*(void *)(a1 + 32) + 64) timingForKey:25];
    *(float *)&double v5 = v4 - v5;
    int v6 = *(void **)(*(void *)(a1 + 32) + 64);
    double v7 = *(float *)&v5;
    return [v6 setTiming:14 forKey:v7];
  }
  return result;
}

- (void)handleChannelInfoReport:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKeyedSubscript:&unk_1F3DC4590])
  {
    int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1F3DC4590), "integerValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      double v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315906;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        __int16 v11 = "-[VCTransportSessionIDS handleChannelInfoReport:]";
        __int16 v12 = 1024;
        int v13 = 550;
        __int16 v14 = 1024;
        int v15 = v5;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Callee's accept delay %d milliseconds", (uint8_t *)&v8, 0x22u);
      }
    }
    [(TimingCollection *)self->super._perfTimings setTiming:25 forKey:(double)v5 / 1000.0];
    [(VCTransportSessionIDS *)self setConnectionSetupTime];
  }
  if ([a3 objectForKeyedSubscript:&unk_1F3DC45A8]) {
    -[VCTransportSessionIDS setQuickRelayServerProvider:](self, "setQuickRelayServerProvider:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1F3DC45A8), "integerValue"));
  }
}

- (void)handleLinkPreferSuggestion:(id)a3
{
}

- (void)processSessionBasedServerExperiments:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = v8;
    __int16 v16 = 2080;
    __int16 v17 = "-[VCTransportSessionIDS processSessionBasedServerExperiments:]";
    __int16 v18 = 1024;
    int v19 = 571;
    __int16 v10 = " [%s] %s:%d Empty connnection info passed";
LABEL_16:
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x1Cu);
    return;
  }
  double v4 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A6C0]];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = v11;
    __int16 v16 = 2080;
    __int16 v17 = "-[VCTransportSessionIDS processSessionBasedServerExperiments:]";
    __int16 v18 = 1024;
    int v19 = 574;
    __int16 v10 = " [%s] %s:%d Empty link context list passed";
    goto LABEL_16;
  }
  int v5 = (void *)[v4 objectAtIndexedSubscript:0];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([v5 qrExperiments])
    {
      stateQueue = self->super._stateQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __62__VCTransportSessionIDS_processSessionBasedServerExperiments___block_invoke;
      v13[3] = &unk_1E6DB3E40;
      v13[4] = self;
      v13[5] = v6;
      dispatch_async(stateQueue, v13);
    }
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      __int16 v17 = "-[VCTransportSessionIDS processSessionBasedServerExperiments:]";
      __int16 v18 = 1024;
      int v19 = 577;
      __int16 v10 = " [%s] %s:%d Empty link context passed";
      goto LABEL_16;
    }
  }
}

uint64_t __62__VCTransportSessionIDS_processSessionBasedServerExperiments___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];

  *(void *)(*(void *)(a1 + 32) + 168) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "qrExperiments"), "copy");
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 168) objectForKey:@"qrse_und2"];
  if (result)
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "objectForKeyedSubscript:", @"qrse_und2"), "BOOLValue") ^ 1;
    double v4 = @"transportSessionEventInfoIsUplinkRetransmissionSupported";
    v5[0] = [NSNumber numberWithBool:v3];
    objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 21, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
    return [*(id *)(*(void *)(a1 + 32) + 72) setIsUplinkRetransmissionSupported:v3];
  }
  return result;
}

- (void)handleReportingBlob:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = @"IDSCB";
    v16[0] = a3;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    reportingGenericEvent();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315906;
          uint64_t v8 = v4;
          __int16 v9 = 2080;
          __int16 v10 = "-[VCTransportSessionIDS handleReportingBlob:]";
          __int16 v11 = 1024;
          int v12 = 600;
          __int16 v13 = 2112;
          id v14 = a3;
          _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received IDS reportingBlob=%@", (uint8_t *)&v7, 0x26u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[VCTransportSessionIDS handleReportingBlob:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSessionIDS handleReportingBlob:]();
    }
  }
}

- (void)handleStatResponse:(id)a3
{
  if (a3)
  {
    connectionManager = self->super._connectionManager;
    -[VCConnectionManager updateStatResponseResult:](connectionManager, "updateStatResponseResult:");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSessionIDS handleStatResponse:]();
    }
  }
}

- (void)handleEncryptionConfig:(id)a3
{
  if (a3)
  {
    connectionManager = self->super._connectionManager;
    -[VCConnectionManager updateEncryptionConfig:](connectionManager, "updateEncryptionConfig:");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSessionIDS handleEncryptionConfig:]();
    }
  }
}

+ (int)transportTypeForConnectionType:(int)a3
{
  if (a3 > 7) {
    return 0;
  }
  else {
    return dword_1E259F6C8[a3];
  }
}

- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5
{
  if (VCCTServiceMonitor_GetSignalStrength()) {
    return -2144665596;
  }
  else {
    return 0;
  }
}

- (int)flushBasebandQueueForConnection:(id)a3 payloadInfoList:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!VCConnection_IsLocalOnCellular((uint64_t)a3)) {
    return -2144665542;
  }
  uint64_t v22 = self;
  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v26 = *(void *)v42;
    uint64_t v25 = *MEMORY[0x1E4F6A800];
    uint64_t v24 = *MEMORY[0x1E4F6A7F8];
    uint64_t v9 = *MEMORY[0x1E4F6A810];
    uint64_t v10 = *MEMORY[0x1E4F6A808];
    uint64_t v11 = *MEMORY[0x1E4F6A7F0];
    id obj = a4;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v14 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushPayloadType"), v25);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushPayloadTypeFieldOffset"), v24);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushTransactionID"), v9);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushTimestamp"), v10);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", @"transportSessionBasebandQueueFlushCriterion"), v11);
        [v27 addObject:v14];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v40 count:16];
    }
    while (v8);
  }
  uint64_t v38 = *MEMORY[0x1E4F6A780];
  v36[0] = *MEMORY[0x1E4F6A730];
  uint64_t v15 = [NSNumber numberWithUnsignedChar:VCConnectionIDS_LinkID((uint64_t)a3)];
  v36[1] = *MEMORY[0x1E4F6A788];
  v37[0] = v15;
  v37[1] = v27;
  uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  __int16 v16 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  [(VCDatagramChannelIDS *)v22->_datagramChannel setChannelPreferences:v16];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    __int16 v18 = *MEMORY[0x1E4F47A50];
    BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    int result = 0;
    if (!v19) {
      return result;
    }
    if (v16) {
      uint64_t v21 = (const char *)objc_msgSend((id)objc_msgSend(v16, "description"), "UTF8String");
    }
    else {
      uint64_t v21 = "<nil>";
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v29 = v17;
    __int16 v30 = 2080;
    v31 = "-[VCTransportSessionIDS flushBasebandQueueForConnection:payloadInfoList:]";
    __int16 v32 = 1024;
    int v33 = 675;
    __int16 v34 = 2080;
    __int16 v35 = v21;
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Baseband flush preference %s", buf, 0x26u);
  }
  return 0;
}

- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4
{
  return 0;
}

- (int)registerBasebandNotificationsForConnection:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F6A790];
  uint64_t v5 = *MEMORY[0x1E4F6A6A0];
  v9[0] = &unk_1F3DC45C0;
  uint64_t v6 = *MEMORY[0x1E4F6A6A8];
  v8[0] = v5;
  v8[1] = v6;
  v9[1] = [NSNumber numberWithUnsignedInt:self->super._basebandNotificationRegistrationToken];
  v8[2] = *MEMORY[0x1E4F6A730];
  v9[2] = [NSNumber numberWithUnsignedChar:VCConnectionIDS_LinkID((uint64_t)a3)];
  v11[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  -[VCDatagramChannelIDS setChannelPreferences:](self->_datagramChannel, "setChannelPreferences:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1]);
  return 0;
}

- (void)deregisterBasebandNotifications
{
  v9[1] = *MEMORY[0x1E4F143B8];
  registeredConnection = self->super._registeredConnection;
  uint64_t v8 = *MEMORY[0x1E4F6A790];
  uint64_t v4 = *MEMORY[0x1E4F6A6A0];
  v7[0] = &unk_1F3DC45D8;
  uint64_t v5 = *MEMORY[0x1E4F6A6A8];
  v6[0] = v4;
  v6[1] = v5;
  v7[1] = [NSNumber numberWithUnsignedInt:self->super._basebandNotificationRegistrationToken];
  v6[2] = *MEMORY[0x1E4F6A730];
  v7[2] = [NSNumber numberWithUnsignedChar:VCConnectionIDS_LinkID((uint64_t)registeredConnection)];
  v9[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  -[VCDatagramChannelIDS setChannelPreferences:](self->_datagramChannel, "setChannelPreferences:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1]);
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (int)socket
{
  return self->_socket;
}

- (void)setSocket:(int)a3
{
  self->_int socket = a3;
}

- (void)dispatchedProcessDatagramChannelEventInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d IDS eventHandler called without event type", v2, v3, v4, v5, v6);
}

- (void)dispatchedProcessDatagramChannelEventInfo:.cold.2()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]";
  __int16 v4 = 1024;
  int v5 = 210;
  __int16 v6 = v0;
  uint64_t v7 = "-[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s, IDSDataChannelEventUsageError", v2, 0x26u);
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d IDS destination not set", v2, v3, v4, v5, v6);
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_10();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d IDS destination not set", v1, 0x1Cu);
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d DatagramChannel start failed with error %x", v2, v3, v4, v5);
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_10_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d DatagramChannel start failed with error %x", v2, v3, v4, v5);
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d onStart failed with error %x", v2, v3, v4, v5);
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_10_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d onStart failed with error %x", v2, v3, v4, v5);
}

void __30__VCTransportSessionIDS_start__block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "_VCTransportSessionIDS_writeCompletionHandler";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_8_1();
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCTransportSessionIDS: failed to send data with error=%@", v1, 0x26u);
}

- (void)handleReportingBlob:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[VCTransportSessionIDS handleReportingBlob:]";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_8_1();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Received IDS reportingBlob=%@", v1, 0x26u);
}

- (void)handleReportingBlob:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d IDS reporting blob must be a dictionary", v2, v3, v4, v5, v6);
}

- (void)handleStatResponse:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stat response received is invalid", v2, v3, v4, v5, v6);
}

- (void)handleEncryptionConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d eventInfo must not be nil", v2, v3, v4, v5, v6);
}

@end