@interface VCMediaStream
+ (BOOL)isSameSRTPKey:(id)a3 newKey:(id)a4;
- (AVCBasebandCongestionDetector)basebandCongestionDetector;
- (AVCRateControlFeedbackController)feedbackController;
- (BOOL)generateReceptionReportList:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4;
- (BOOL)handleEncryptionInfoChange:(id)a3;
- (BOOL)initializeTransportSessionWithIDSDestination:(id)a3 error:(id *)a4;
- (BOOL)initializeTransportSessionWithRTPNWConnectionID:(id)a3 rtcpNWConnectionID:(id)a4 error:(id *)a5 isConnectionStartDelayed:(BOOL)a6;
- (BOOL)initializeTransportSessionWithSocketDictionary:(id)a3 error:(id *)a4;
- (BOOL)initializeTransportSetupInfoWithIDSDestination:(id)a3 error:(id *)a4;
- (BOOL)initializeTransportSetupInfoWithTransportSession:(id *)a3;
- (BOOL)isDecryptionTimeoutEnabled;
- (BOOL)isRTCPSendEnabled;
- (BOOL)isRTCPTimeoutEnabled;
- (BOOL)isRTPTimeoutEnabled;
- (BOOL)isSendingMedia;
- (BOOL)isUplinkRetransmissionEnabled;
- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4;
- (BOOL)setStreamConfig:(id)a3 withError:(id *)a4;
- (BOOL)setupNWConnectionWithID:(id)a3;
- (BOOL)shouldReportNetworkInterfaceType;
- (BOOL)shouldStopReportingTimer;
- (BOOL)shouldUseNWConnectionBackingSocket;
- (BOOL)startMediaTransportsWithError:(id *)a3;
- (BOOL)updateRemoteAddressWithConfig:(id)a3 error:(id *)a4;
- (NSArray)compoundStreamIDs;
- (NSArray)transportArray;
- (RTCPReportProvider)rtcpReportProvider;
- (VCMediaStream)init;
- (VCMediaStream)initWithTransportSessionID:(unsigned int)a3;
- (VCMediaStream)initWithTransportSessionID:(unsigned int)a3 localSSRC:(unsigned int)a4 streamToken:(int64_t)a5;
- (VCMediaStreamConfig)defaultStreamConfig;
- (VCMediaStreamConfig)oneToOneStreamConfig;
- (VCMediaStreamDelegate)delegate;
- (VCMediaStreamNotification)notificationDelegate;
- (VCMomentsCollectorDelegate)momentsCollectorDelegate;
- (VCNetworkFeedbackController)networkFeedbackController;
- (char)streamStateToString:(int)a3;
- (double)computeNextTimoutWithEnabledTime:(double)a3 timeoutInterval:(double)a4 lastReceivedPacketTime:(double)a5 currentTime:(double)a6 lastTimeoutReportTime:(double)a7;
- (double)lastReceivedRTCPPacketTime;
- (double)lastReceivedRTPPacketTime;
- (double)rtcpHeartbeatLeeway;
- (id)copyDelegate;
- (id)createTransportWithStreamConfig:(id)a3 ssrc:(unsigned int)a4;
- (id)getInvalidParamErrorForSetPause:(BOOL)a3 didSucceed:(BOOL)a4;
- (id)getMediaStreamConfigForControlInfoGenerator:(id)a3;
- (id)getSharingGroupWithPolicy:(unsigned int)a3;
- (id)setLocalParticipantInfo:(id)a3 networkSockets:(id)a4 withError:(id *)a5;
- (id)setPause:(BOOL)a3;
- (id)setupRTPForIDS;
- (id)setupRTPWithIDSDestination:(id)a3 error:(id *)a4;
- (id)setupRTPWithIPInfo:(id)a3 error:(id *)a4;
- (id)setupRTPWithLocalParticipantInfo:(id)a3 error:(id *)a4;
- (id)setupRTPWithNWConnection:(id)a3 error:(id *)a4;
- (id)setupRTPWithSocketDictionary:(id)a3 error:(id *)a4;
- (id)start;
- (id)stop;
- (id)stopWithError:(id)a3;
- (id)supportedPayloads;
- (int)handleMediaCallbackNotification:(int)a3 inData:(void *)a4 outData:(void *)a5;
- (int)operatingMode;
- (int)registerStatisticsHandler:(id)a3 statisticType:(int)a4;
- (int)state;
- (int)updateConnectionWithConfig:(id)a3;
- (int64_t)streamDirection;
- (int64_t)streamToken;
- (int64_t)streamTokenDownlink;
- (int64_t)streamTokenUplink;
- (tagHANDLE)createRTPHandleWithStreamConfig:(id)a3 payloadType:(int)a4 localSSRC:(unsigned int)a5;
- (tagVCMediaQueue)mediaQueue;
- (tagVCMediaStreamDelegateRealtimeInstanceVTable)delegateFunctions;
- (unsigned)endReason;
- (unsigned)getExtendedSequenceNumberForSequenceNumber:(unsigned __int16)a3;
- (unsigned)getRTCPReportNTPTimeMiddle32ForReportId:(unsigned __int8)a3;
- (unsigned)localSSRC;
- (unsigned)mediaControlInfoGeneratorType;
- (void)applyClientSessionID:(int)a3 clientUserInfo:(id)a4;
- (void)checkRTCPPacketTimeoutAgainstTime:(double)a3 lastReceivedPacketTime:(double)a4;
- (void)checkRTPPacketTimeoutAgainstTime:(double)a3 lastReceivedPacketTime:(double)a4;
- (void)cleanupNWConnection:(id *)a3;
- (void)collectChannelSequenceMetrics:(id)a3;
- (void)collectRxChannelMetrics:(id *)a3;
- (void)collectRxChannelMetrics:(id *)a3 interval:(float)a4;
- (void)collectTxChannelMetrics:(id *)a3;
- (void)createLocalMediaControlInfoGeneratorWithType:(unsigned int)a3 version:(unsigned __int8)a4;
- (void)createNWMonitor;
- (void)dealloc;
- (void)decryptionStatusChanged:(BOOL)a3;
- (void)defaultStreamConfig;
- (void)deregisterAggregationHandlers;
- (void)destroyNWMonitor;
- (void)dupNWConnectionBackingSocket:(int *)a3;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleStartDidSucceed:(BOOL)a3 withError:(id)a4;
- (void)handleTransportSessionEvent:(unsigned int)a3 info:(id)a4;
- (void)initializeTransportSetupInfoWithRTPSocket:(int)a3 RTCPSocket:(int)a4;
- (void)initializeTransportSetupInfoWithSocketDictionary:(id)a3;
- (void)initializeWRMUsingRtpHandle:(tagHANDLE *)a3;
- (void)lock;
- (void)mediaControlInfoGenerator;
- (void)notifyDelegateDidReceiveRTCPPackets:(_RTCPPacketList *)a3;
- (void)onCallIDChanged;
- (void)onPauseWithCompletionHandler:(id)a3;
- (void)onRTCPTimeout;
- (void)onRTPTimeout;
- (void)onResumeWithCompletionHandler:(id)a3;
- (void)onSendRTCPPacket;
- (void)onStartWithCompletionHandler:(id)a3;
- (void)onStopWithCompletionHandler:(id)a3;
- (void)oneToOneStreamConfig;
- (void)processDecryptionTimeoutSettingChange;
- (void)processRTCPTimeoutSettingChange;
- (void)processRTPTimeoutSettingChange;
- (void)registerAggregationHandlers;
- (void)registerCallbacksForMediaControlInfoGenerator:(void *)a3 forDirection:(int64_t)a4 options:(unsigned int)a5;
- (void)registerMediaControlInfoGeneratorWithConfigs:(id)a3;
- (void)registerQoSReportingSource;
- (void)registerStatistics:(id)a3;
- (void)reportTransportInfo;
- (void)resetDecryptionTimeout;
- (void)resetRTCPSendHeartbeatTimer:(unint64_t)a3;
- (void)resetTimeoutHeartbeatTimer:(unint64_t)a3;
- (void)resetTimeoutHeartbeatWithRTPTimeout:(double)a3 rtcpTimeout:(double)a4 decryptionTimeout:(double)a5 currentTime:(double)a6;
- (void)rtcpSendHeartbeat;
- (void)sendControlPacketWithParameters:(_RTCP_SEND_CONTROL_PARAMETERS *)a3;
- (void)setBasebandCongestionDetector:(id)a3;
- (void)setCompoundStreamIDs:(id)a3;
- (void)setDecryptionTimeOutEnabled:(BOOL)a3;
- (void)setDecryptionTimeOutInterval:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateFunctions:(tagVCMediaStreamDelegateRealtimeInstanceVTable)a3;
- (void)setMediaQueue:(tagVCMediaQueue *)a3;
- (void)setMediaQueueInRateControlConfig:(id)a3;
- (void)setMediaQueueInStreamConfig:(id)a3;
- (void)setMomentsCollectorDelegate:(id)a3;
- (void)setNetworkFeedbackController:(id)a3;
- (void)setNotificationDelegate:(id)a3;
- (void)setOperatingMode:(int)a3;
- (void)setPause:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)setRtcpEnabled:(BOOL)a3;
- (void)setRtcpReportProvider:(id)a3;
- (void)setRtcpSendInterval:(double)a3;
- (void)setRtcpTimeOutEnabled:(BOOL)a3;
- (void)setRtcpTimeOutInterval:(double)a3;
- (void)setRtpTimeOutEnabled:(BOOL)a3;
- (void)setRtpTimeOutInterval:(double)a3;
- (void)setState:(int)a3;
- (void)setStreamDirection:(int64_t)a3;
- (void)setStreamIDs:(id)a3 repairStreamIDs:(id)a4;
- (void)setUplinkRetransmissionEnabled:(BOOL)a3;
- (void)setupCallbacksWithNWConnectionMonitor:(tagVCNWConnectionMonitor *)a3;
- (void)setupMediaStream;
- (void)setupRTPForIDS;
- (void)start;
- (void)startRTCPSendHeartbeat;
- (void)startTimeoutHeartbeat;
- (void)startWithCompletionHandler:(id)a3;
- (void)stopInternalWithHandler:(id)a3;
- (void)stopMediaTransports;
- (void)stopRTCPSendHeartbeat;
- (void)stopTimeoutHeartbeat;
- (void)timeoutHeartbeat;
- (void)unlock;
- (void)unregisterMediaControlInfoGenerator;
- (void)unregisterQoSReportingSource;
- (void)unregisterStatistics;
- (void)unregisterWRMCallback;
- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3;
- (void)updateTransportsWithConstantConnectionOverhead:(unsigned int)a3;
@end

@implementation VCMediaStream

+ (BOOL)isSameSRTPKey:(id)a3 newKey:(id)a4
{
  if (a3) {
    return [a3 isEqualToData:a4];
  }
  else {
    return a4 == 0;
  }
}

- (VCMediaStreamDelegate)delegate
{
  return (VCMediaStreamDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (id)copyDelegate
{
}

- (void)setDelegate:(id)a3
{
}

- (VCMomentsCollectorDelegate)momentsCollectorDelegate
{
  return (VCMomentsCollectorDelegate *)objc_loadWeak((id *)&self->_momentsCollectorDelegate);
}

- (void)setMomentsCollectorDelegate:(id)a3
{
}

- (VCMediaStreamConfig)defaultStreamConfig
{
  if ([(NSMutableArray *)self->_transportArray count])
  {
    v3 = (void *)[(NSMutableArray *)self->_transportArray objectAtIndexedSubscript:0];
    return (VCMediaStreamConfig *)[v3 streamConfig];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream defaultStreamConfig]();
      }
    }
    return 0;
  }
}

- (VCMediaStreamConfig)oneToOneStreamConfig
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  transportArray = self->_transportArray;
  uint64_t v3 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(transportArray);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "streamConfig"), "multiwayConfig"), "isOneToOne")) {
          return (VCMediaStreamConfig *)[v7 streamConfig];
        }
      }
      uint64_t v4 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v10 objects:v9 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaStream oneToOneStreamConfig]();
    }
  }
  return 0;
}

- (BOOL)isSendingMedia
{
  v2 = [(VCMediaStream *)self defaultStreamConfig];
  uint64_t v3 = [(VCMediaStreamConfig *)v2 direction];
  if (v3 != 1) {
    LOBYTE(v3) = [(VCMediaStreamConfig *)v2 direction] == 3;
  }
  return v3;
}

- (void)decryptionStatusChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  if (v3 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        v7 = "<nil>";
      }
      int v8 = 136316674;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      long long v11 = "-[VCMediaStream decryptionStatusChanged:]";
      __int16 v12 = 1024;
      int v13 = 165;
      __int16 v14 = 2080;
      v15 = v7;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2080;
      v19 = "-[VCMediaStream decryptionStatusChanged:]";
      __int16 v20 = 1024;
      BOOL v21 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s canDecrypt[%d]", (uint8_t *)&v8, 0x40u);
    }
  }
  if (v3) {
    self->_decryptionErrorStartTime = NAN;
  }
  pthread_mutex_unlock(&self->_streamLock);
}

- (id)setupRTPWithSocketDictionary:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v7;
        __int16 v14 = 2080;
        v15 = "-[VCMediaStream setupRTPWithSocketDictionary:error:]";
        __int16 v16 = 1024;
        int v17 = 183;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d UseTransportStreamsForSockets feature flag set", buf, 0x1Cu);
      }
    }
    if (![(VCMediaStream *)self initializeTransportSessionWithSocketDictionary:a3 error:a4])return 0; {
  }
    }
  else
  {
    [(VCMediaStream *)self initializeTransportSetupInfoWithSocketDictionary:a3];
  }
  v11[0] = [(VCMediaStream *)self supportedPayloads];
  v10[1] = @"avcKeyRTPLocalSSRC";
  v11[1] = [NSNumber numberWithUnsignedInt:self->_localSSRC];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
}

- (BOOL)initializeTransportSetupInfoWithTransportSession:(id *)a3
{
  v8[5] = *MEMORY[0x1E4F143B8];
  transportSession = self->_transportSession;
  if (transportSession)
  {
    uint64_t v5 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__VCMediaStream_initializeTransportSetupInfoWithTransportSession___block_invoke;
    v8[3] = &unk_1E6DB7A78;
    v8[4] = v5;
    [(VCTransportSession *)self->_transportSession setEventHandler:v8];
    self->_transportSetupInfo.setupType = 5;
    self->_transportSetupInfo.var0.transportStreamInfo.context = self->_transportSession;
    self->_transportSetupInfo.var0.transportStreamInfo.creationCallback = _VCMediaStream_TransportStreamCreationCallback;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream initializeTransportSetupInfoWithTransportSession:]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 203), @"Transport session creation failed", @"Invalid parameter");
  }
  return transportSession != 0;
}

void __66__VCMediaStream_initializeTransportSetupInfoWithTransportSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (id)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
  [v5 handleTransportSessionEvent:a2 info:a3];
}

- (void)handleTransportSessionEvent:(unsigned int)a3 info:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  if (a3 == 1)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_20;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)uint64_t v18 = 136315906;
      *(void *)&v18[4] = v11;
      *(_WORD *)&v18[12] = 2080;
      *(void *)&v18[14] = "-[VCMediaStream handleTransportSessionEvent:info:]";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 230;
      WORD2(v19) = 2112;
      *(void *)((char *)&v19 + 6) = a4;
      uint64_t v13 = "VCMediaStream [%s] %s:%d Attempting to connect link=%@";
      __int16 v14 = v12;
      uint32_t v15 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v10 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_20;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      int v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)uint64_t v18 = 136316418;
      *(void *)&v18[4] = v16;
      *(_WORD *)&v18[12] = 2080;
      *(void *)&v18[14] = "-[VCMediaStream handleTransportSessionEvent:info:]";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 230;
      WORD2(v19) = 2112;
      *(void *)((char *)&v19 + 6) = v10;
      HIWORD(v19) = 2048;
      __int16 v20 = self;
      LOWORD(v21) = 2112;
      *(void *)((char *)&v21 + 2) = a4;
      uint64_t v13 = "VCMediaStream [%s] %s:%d %@(%p) Attempting to connect link=%@";
      __int16 v14 = v17;
      uint32_t v15 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v18, v15);
LABEL_20:
    uint64_t v7 = self;
    uint64_t v8 = 1;
    id v9 = 0;
    goto LABEL_21;
  }
  if (a3 != 7) {
    goto LABEL_22;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaStream handleTransportSessionEvent:info:]();
    }
  }
  uint64_t v7 = self;
  uint64_t v8 = 0;
  id v9 = a4;
LABEL_21:
  -[VCMediaStream handleStartDidSucceed:withError:](v7, "handleStartDidSucceed:withError:", v8, v9, *(_OWORD *)v18, *(void *)&v18[16], v19, v20, v21);
LABEL_22:
  if (self) {
    pthread_mutex_unlock(&self->_streamLock);
  }
}

- (BOOL)initializeTransportSessionWithSocketDictionary:(id)a3 error:(id *)a4
{
  self->_transportSession = (VCTransportSession *)[[VCTransportSessionSocket alloc] initWithSocketDictionary:a3 notificationHandler:self->_notificationHandler eventHandler:self->_packetEventHandler handlerQueue:+[VCVTPWrapper targetQueue] context:self];

  return [(VCMediaStream *)self initializeTransportSetupInfoWithTransportSession:a4];
}

- (void)initializeTransportSetupInfoWithSocketDictionary:(id)a3
{
  uint64_t v5 = xpc_dictionary_dup_fd(a3, "avcKeySharedSocket");
  uint64_t v6 = v5;
  if (v5 == -1)
  {
    uint64_t v5 = xpc_dictionary_dup_fd(a3, "avcKeyRTPSocket");
    uint64_t v6 = xpc_dictionary_dup_fd(a3, "avcKeyRTCPSocket");
  }

  [(VCMediaStream *)self initializeTransportSetupInfoWithRTPSocket:v5 RTCPSocket:v6];
}

- (void)initializeTransportSetupInfoWithRTPSocket:(int)a3 RTCPSocket:(int)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_transportSetupInfo = &self->_transportSetupInfo;
  self->_transportSetupInfo.setupType = 1;
  self->_transportSetupInfo.var0.socketInfo.int rtpSocket = a3;
  self->_transportSetupInfo.var0.socketInfo.int rtcpSocket = a4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int rtpSocket = p_transportSetupInfo->var0.socketInfo.rtpSocket;
      int rtcpSocket = p_transportSetupInfo->var0.socketInfo.rtcpSocket;
      int v11 = 136316418;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      __int16 v14 = "-[VCMediaStream initializeTransportSetupInfoWithRTPSocket:RTCPSocket:]";
      __int16 v15 = 1024;
      int v16 = 266;
      __int16 v17 = 1024;
      BOOL v18 = a3 == a4;
      __int16 v19 = 1024;
      int v20 = rtpSocket;
      __int16 v21 = 1024;
      int v22 = rtcpSocket;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d isShared:%d sockets rtp(%d) rtcp(%d)", (uint8_t *)&v11, 0x2Eu);
    }
  }
}

- (void)cleanupNWConnection:(id *)a3
{
  if (a3)
  {
    if (*a3)
    {
      nw_connection_cancel((nw_connection_t)*a3);
      nw_connection_set_state_changed_handler((nw_connection_t)*a3, 0);
      nw_release(*a3);
      *a3 = 0;
    }
  }
}

- (BOOL)shouldUseNWConnectionBackingSocket
{
  return 1;
}

- (BOOL)initializeTransportSessionWithRTPNWConnectionID:(id)a3 rtcpNWConnectionID:(id)a4 error:(id *)a5 isConnectionStartDelayed:(BOOL)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  LOBYTE(v16) = a6;
  self->_transportSession = (VCTransportSession *)[[VCTransportSessionNW alloc] initWithRTPNWConnectionID:a3 RTCPNWConnectionID:a4 handlerQueue:+[VCVTPWrapper targetQueue] context:self notificationHandler:self->_notificationHandler eventHandler:self->_packetEventHandler isConnectionStartDelayed:v16];
  if ([(VCMediaStream *)self shouldUseNWConnectionBackingSocket])
  {
    uint64_t v8 = [(VCTransportSession *)self->_transportSession dupRTPNWConnectionBackingSocket];
    transportSession = self->_transportSession;
    if (transportSession && v8 != -1)
    {
      uint64_t v11 = [(VCTransportSession *)transportSession dupRTCPNWConnectionBackingSocket];

      uint64_t v12 = [[VCTransportSessionSocket alloc] initWithRTPSocket:v8 RTCPSocket:v11];
      self->_transportSession = &v12->super;
      if (!v12)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          __int16 v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v18 = v13;
            __int16 v19 = 2080;
            int v20 = "-[VCMediaStream initializeTransportSessionWithRTPNWConnectionID:rtcpNWConnectionID:error:isConnectionStartDelayed:]";
            __int16 v21 = 1024;
            int v22 = 296;
            __int16 v23 = 1024;
            int v24 = v8;
            __int16 v25 = 1024;
            int v26 = v11;
            _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d Failed to create VCTransportSessionSocket with backingRTPSocket=%d, backingRTCPSocket=%d", buf, 0x28u);
          }
        }
        VCCloseSocketIfValid(v8);
        VCCloseSocketIfValid(v11);
      }
    }
  }
  return [(VCMediaStream *)self initializeTransportSetupInfoWithTransportSession:a5];
}

- (id)setupRTPWithNWConnection:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamConnectionClientID"]) {
    uint64_t v7 = [a3 objectForKeyedSubscript:@"vcMediaStreamConnectionClientID"];
  }
  else {
    uint64_t v7 = 0;
  }
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamRTCPConnectionClientID"]) {
    uint64_t v8 = [a3 objectForKeyedSubscript:@"vcMediaStreamRTCPConnectionClientID"];
  }
  else {
    uint64_t v8 = 0;
  }
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamDelayNWConnectionStart"])
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDelayNWConnectionStart"), "BOOLValue");
    if (v7) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 324);
    __int16 v14 = @"Invalid Parameter";
    __int16 v15 = @"connectionID should not be nil";
    uint64_t v16 = a4;
    uint64_t v17 = 32016;
    uint64_t v18 = 105;
LABEL_21:
    +[GKVoiceChatError getNSError:v16 code:v17 detailedCode:v18 filePath:v13 description:v14 reason:v15];
    return 0;
  }
  uint64_t v9 = 0;
  if (!v7) {
    goto LABEL_17;
  }
LABEL_9:
  if (self->_transportSetupInfo.setupType == 4) {
    [(VCMediaStream *)self cleanupNWConnection:&self->_transportSetupInfo.var0];
  }
  if (_os_feature_enabled_impl())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v25 = v10;
        __int16 v26 = 2080;
        uint64_t v27 = "-[VCMediaStream setupRTPWithNWConnection:error:]";
        __int16 v28 = 1024;
        int v29 = 336;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d UseTransportStreamsForNW feature flag set", buf, 0x1Cu);
      }
    }
    BOOL v12 = [(VCMediaStream *)self initializeTransportSessionWithRTPNWConnectionID:v7 rtcpNWConnectionID:v8 error:a4 isConnectionStartDelayed:v9];
  }
  else
  {
    BOOL v12 = [(VCMediaStream *)self setupNWConnectionWithID:v7];
  }
  BOOL v19 = v12;
  v22[0] = @"avcKeySupportedCodecs";
  v23[0] = [(VCMediaStream *)self supportedPayloads];
  v22[1] = @"avcKeyRTPLocalSSRC";
  v23[1] = [NSNumber numberWithUnsignedInt:self->_localSSRC];
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  if (!v19)
  {
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 349);
    __int16 v14 = (__CFString *)[NSString stringWithFormat:@"Unable to retrieve NWConnection for clientID '%@'", v7];
    __int16 v15 = @"No NWConnection matching clientID found";
    uint64_t v16 = a4;
    uint64_t v17 = 32002;
    uint64_t v18 = 116;
    uint64_t v13 = v21;
    goto LABEL_21;
  }
  return result;
}

- (void)dupNWConnectionBackingSocket:(int *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  *a3 = -1;
  p_transportSetupInfo = &self->_transportSetupInfo;
  if (self->_transportSetupInfo.var0.transportStreamInfo.context)
  {
    int connected_socket = nw_connection_get_connected_socket();
    if (connected_socket == -1) {
      return;
    }
    int v6 = connected_socket;
    int v7 = dup(connected_socket);
    *a3 = v7;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v7 == -1)
    {
      if (ErrorLogLevelForModule >= 5)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          context = p_transportSetupInfo->var0.transportStreamInfo.context;
          int v19 = 136316162;
          uint64_t v20 = v16;
          __int16 v21 = 2080;
          int v22 = "-[VCMediaStream dupNWConnectionBackingSocket:]";
          __int16 v23 = 1024;
          int v24 = 367;
          __int16 v25 = 2048;
          __int16 v26 = context;
          __int16 v27 = 1024;
          int v28 = v6;
          uint64_t v13 = "VCMediaStream [%s] %s:%d nw_connection %p is backed by socket %d. Failed to dup";
          __int16 v14 = v17;
          uint32_t v15 = 44;
          goto LABEL_10;
        }
      }
    }
    else if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = p_transportSetupInfo->var0.transportStreamInfo.context;
        int v12 = *a3;
        int v19 = 136316418;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        int v22 = "-[VCMediaStream dupNWConnectionBackingSocket:]";
        __int16 v23 = 1024;
        int v24 = 365;
        __int16 v25 = 2048;
        __int16 v26 = v11;
        __int16 v27 = 1024;
        int v28 = v6;
        __int16 v29 = 1024;
        int v30 = v12;
        uint64_t v13 = "VCMediaStream [%s] %s:%d nw_connection %p is backed by socket %d duped to %d";
        __int16 v14 = v10;
        uint32_t v15 = 50;
LABEL_10:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaStream dupNWConnectionBackingSocket:]();
    }
  }
}

- (BOOL)setupNWConnectionWithID:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = -1;
  p_transportSetupInfo = &self->_transportSetupInfo;
  self->_transportSetupInfo.setupType = 4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:a3];
  int v6 = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream setupNWConnectionWithID:]();
      }
    }
    goto LABEL_20;
  }
  v24[0] = 0;
  v24[1] = 0;
  [v5 getUUIDBytes:v24];
  +[VCVTPWrapper connectionContext];
  int v7 = nw_connection_create_with_client_id();
  p_transportSetupInfo->var0.transportStreamInfo.context = v7;
  p_var0 = (nw_connection_t *)&p_transportSetupInfo->var0;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream setupNWConnectionWithID:]();
      }
    }
LABEL_20:
    BOOL v13 = 0;
    goto LABEL_10;
  }
  nw_connection_set_queue(v7, (dispatch_queue_t)+[VCVTPWrapper targetQueue]);
  uint64_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  uint64_t v11 = *p_var0;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __41__VCMediaStream_setupNWConnectionWithID___block_invoke;
  handler[3] = &unk_1E6DB8288;
  handler[6] = &v16;
  handler[7] = &v20;
  handler[4] = v10;
  handler[5] = v9;
  nw_connection_set_state_changed_handler(v11, handler);
  nw_connection_start(*p_var0);
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v9, v12))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream setupNWConnectionWithID:].cold.5();
      }
    }
LABEL_30:
    BOOL v13 = 0;
    if (!v9) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!*((unsigned char *)v21 + 24))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream setupNWConnectionWithID:]();
      }
    }
    goto LABEL_30;
  }
  if (*((_DWORD *)v17 + 6) != -1)
  {
    [(VCMediaStream *)self cleanupNWConnection:&p_transportSetupInfo->var0];
    [(VCMediaStream *)self initializeTransportSetupInfoWithRTPSocket:*((unsigned int *)v17 + 6) RTCPSocket:*((unsigned int *)v17 + 6)];
    goto LABEL_8;
  }
  if ((VTP_ScheduleReceiveForNWConnection() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream setupNWConnectionWithID:].cold.4();
      }
    }
    goto LABEL_30;
  }
LABEL_8:
  BOOL v13 = 1;
  if (v9) {
LABEL_9:
  }
    dispatch_release(v9);
LABEL_10:

  if (!v13 && p_transportSetupInfo->setupType == 4) {
    [(VCMediaStream *)self cleanupNWConnection:&p_transportSetupInfo->var0];
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v13;
}

void __41__VCMediaStream_setupNWConnectionWithID___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      uint32_t v15 = "-[VCMediaStream setupNWConnectionWithID:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 398;
      __int16 v18 = 1024;
      LODWORD(v19) = a2;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d Get nw connection state %d", (uint8_t *)&v12, 0x22u);
    }
  }
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316162;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        uint32_t v15 = "-[VCMediaStream setupNWConnectionWithID:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 400;
        __int16 v18 = 2112;
        uint64_t v19 = a3;
        __int16 v20 = 1024;
        int v21 = a2;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d Get error %@ from nw connection with state: %d!", (uint8_t *)&v12, 0x2Cu);
      }
    }
  }
  if (a2 != 4)
  {
    if (a2 != 3) {
      return;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
    if (v10)
    {
      uint64_t v11 = v10;
      [v10 dupNWConnectionBackingSocket:*(void *)(*(void *)(a1 + 48) + 8) + 24];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)setupCallbacksWithNWConnectionMonitor:(tagVCNWConnectionMonitor *)a3
{
  if (a3)
  {
    uint64_t v5 = VTP_NWConnectionQueue();
    VCNWConnectionMonitor_SetNotificationHandler(a3, v5, (uint64_t)self, (uint64_t)self->_notificationHandler);
    uint64_t v6 = VTP_NWConnectionQueue();
    packetEventHandler = self->_packetEventHandler;
    VCNWConnectionMonitor_SetPacketEventHandler(a3, v6, (uint64_t)self, (uint64_t)packetEventHandler);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaStream setupCallbacksWithNWConnectionMonitor:]();
    }
  }
}

- (id)setupRTPWithLocalParticipantInfo:(id)a3 error:(id *)a4
{
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamConnectionClientID"])
  {
    return [(VCMediaStream *)self setupRTPWithNWConnection:a3 error:a4];
  }
  else if ([a3 objectForKeyedSubscript:@"vcMediaStreamDestID"])
  {
    uint64_t v8 = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamDestID"];
    self->_idsDestination = v8;
    return [(VCMediaStream *)self setupRTPWithIDSDestination:v8 error:a4];
  }
  else if ([a3 objectForKeyedSubscript:@"vcMediaStreamSourceIP"])
  {
    return [(VCMediaStream *)self setupRTPWithIPInfo:a3 error:a4];
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 471), @"Invalid Parameter", @"No IDS destination or IP Address specified");
    return 0;
  }
}

- (id)setupRTPForIDS
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  if (!_os_feature_enabled_impl())
  {
    self->_transportSetupInfo.setupType = 2;
LABEL_11:
    v8[0] = @"avcKeySupportedCodecs";
    v9[0] = [(VCMediaStream *)self supportedPayloads];
    v8[1] = @"avcKeyRTPLocalSSRC";
    v9[1] = [NSNumber numberWithUnsignedInt:self->_localSSRC];
    return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = v3;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCMediaStream setupRTPForIDS]";
      __int16 v14 = 1024;
      int v15 = 483;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d UseTransportStreamsForProxy feature flag set", buf, 0x1Cu);
    }
  }
  self->_transportSession = (VCTransportSession *)[[VCTransportSessionProxy alloc] initWithTransportSessionID:self->_transportSessionID];
  if ([(VCMediaStream *)self initializeTransportSetupInfoWithTransportSession:&v7])
  {
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaStream setupRTPForIDS](v5);
    }
  }
  return 0;
}

- (id)setupRTPWithIDSDestination:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (_os_feature_enabled_impl())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v13 = v7;
          __int16 v14 = 2080;
          int v15 = "-[VCMediaStream setupRTPWithIDSDestination:error:]";
          __int16 v16 = 1024;
          int v17 = 512;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d UseTransportStreamsForIDS feature flag set", buf, 0x1Cu);
        }
      }
      if (![(VCMediaStream *)self initializeTransportSessionWithIDSDestination:a3 error:a4])return 0; {
LABEL_10:
      }
      v10[0] = @"avcKeySupportedCodecs";
      v11[0] = [(VCMediaStream *)self supportedPayloads];
      v10[1] = @"avcKeyRTPLocalSSRC";
      v11[1] = [NSNumber numberWithUnsignedInt:self->_localSSRC];
      return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    }
    if ([(VCMediaStream *)self initializeTransportSetupInfoWithIDSDestination:a3 error:a4])
    {
      goto LABEL_10;
    }
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 505), @"Invalid Parameter", @"No IDS destination");
  }
  return 0;
}

- (BOOL)initializeTransportSessionWithIDSDestination:(id)a3 error:(id *)a4
{
  uint64_t v7 = [[VCTransportSessionIDSSingleLink alloc] initWithNotificationQueue:0 reportingAgent:0];
  self->_transportSession = &v7->super.super;
  [(VCTransportSessionIDS *)v7 setDestination:a3];

  return [(VCMediaStream *)self initializeTransportSetupInfoWithTransportSession:a4];
}

- (BOOL)initializeTransportSetupInfoWithIDSDestination:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_transportSetupInfo = &self->_transportSetupInfo;
  self->_transportSetupInfo.setupType = 2;
  uint64_t v7 = (VCDatagramChannelIDS *)[+[VCDatagramChannelManager sharedInstance] addDatagramChannelWithDestination:a3 eventHandler:&__block_literal_global_62 error:a4];
  self->_datagramChannel = v7;
  if (!v7 || !VCDatagramChannelIDS_Token((uint64_t)v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      if (objc_opt_class()) {
        __int16 v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        __int16 v12 = "<nil>";
      }
      if (a4)
      {
        if (*a4) {
          __int16 v14 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
        }
        else {
          __int16 v14 = "<nil>";
        }
      }
      else
      {
        __int16 v14 = "nil";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]";
      __int16 v20 = 1024;
      int v21 = 550;
      __int16 v22 = 2080;
      char v23 = v12;
      __int16 v24 = 2048;
      __int16 v25 = self;
      __int16 v26 = 2080;
      __int16 v27 = v14;
      _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %s[%p]: Create datagram channel failed with error %s", buf, 0x3Au);
    }
LABEL_16:
    LOBYTE(v9) = 0;
    return v9;
  }
  int v8 = [(VCDatagramChannelIDS *)self->_datagramChannel start];
  if (v8 < 0)
  {
    int v13 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]();
      }
    }
    +[GKVoiceChatError getNSError:a4 code:32002 detailedCode:1301 returnCode:v13 filePath:0 description:@"Could not start setup RTP" reason:@"datagramChannel start failed"];
    goto LABEL_16;
  }
  p_transportSetupInfo->datagramChannelToken = VCDatagramChannelIDS_Token((uint64_t)self->_datagramChannel);
  LOBYTE(v9) = 1;
  return v9;
}

void __70__VCMediaStream_initializeTransportSetupInfoWithIDSDestination_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F6A718]];
  if (v2)
  {
    uint64_t v3 = v2;
    if ([v2 unsignedIntValue] == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315650;
          uint64_t v9 = v4;
          __int16 v10 = 2080;
          uint64_t v11 = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 542;
          uint64_t v6 = "VCMediaStream [%s] %s:%d IDS channel connected";
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0x1Cu);
        }
      }
    }
    else if ([v3 unsignedIntValue] == 2 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v7;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 544;
        uint64_t v6 = "VCMediaStream [%s] %s:%d IDS channel disconnected";
        goto LABEL_13;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __70__VCMediaStream_initializeTransportSetupInfoWithIDSDestination_error___block_invoke_cold_1();
    }
  }
}

- (id)setupRTPWithIPInfo:(id)a3 error:(id *)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"vcMediaStreamSourceIP"];
  if ([v7 length])
  {
    self->_transportSetupInfo.setupType = 3;
    int v8 = (void *)[a3 objectForKeyedSubscript:@"vcMediaStreamSourceInterfaceName"];
    [v7 UTF8String];
    MakeIPPORT();
    if ([v8 length])
    {
      [v8 UTF8String];
      __strlcpy_chk();
    }
    v10[0] = @"avcKeySourcePort";
    v11[0] = [NSNumber numberWithUnsignedShort:self->_transportSetupInfo.var0.ipInfo.srcRTPIPPort.wPort];
    v10[1] = @"avcKeySupportedCodecs";
    v11[1] = [(VCMediaStream *)self supportedPayloads];
    void v10[2] = @"avcKeyRTPLocalSSRC";
    void v11[2] = [NSNumber numberWithUnsignedInt:self->_localSSRC];
    return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 578), @"Invalid Parameter", @"No IP Address specified");
    return 0;
  }
}

- (void)reportTransportInfo
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if ([(VCMediaStream *)self shouldReportNetworkInterfaceType])
  {
    if ([(VCTransportSession *)self->_transportSession networkInterfaceType])
    {
      uint64_t v3 = @"TransportType";
      v4[0] = objc_msgSend(NSNumber, "numberWithInt:", -[VCTransportSession networkInterfaceType](self->_transportSession, "networkInterfaceType"));
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
      [(VCObject *)self reportingAgent];
      reportingGenericEvent();
    }
    else
    {
      [(VCObject *)self reportingAgent];
      reportingSymptom();
    }
  }
}

- (void)updateTransportsWithConstantConnectionOverhead:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!VCDefaults_GetBoolValueForKey(@"disableDynamicMediaPacketHeaderCalculations", 0))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    transportArray = self->_transportArray;
    uint64_t v6 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(transportArray);
          }
          RTPUpdateConstantTransportOverhead([*(id *)(*((void *)&v11 + 1) + 8 * v9++) rtpHandle], a3);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v7);
    }
  }
}

- (void)collectChannelSequenceMetrics:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(VCTransportSession *)self->_transportSession networkInterfaceType] == 4
    || [(VCTransportSession *)self->_transportSession networkInterfaceType] == 2)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    id v8 = 0;
    if (+[VCWiFiUtils copyAWDLChannelSequence:&v8 twoPtFourGhzChannelCount:&v10 fiveGhzChannelCount:(char *)&v10 + 4 dfsChannelCount:(char *)&v9 + 4 inactiveSlotCount:&v9])
    {
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(v8, "componentsJoinedByString:", @","), @"ChannelSequence");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", HIDWORD(v10)), @"Unique5GhzChannelCount");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v10), @"Unique2pt4GhzChannelCount");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", HIDWORD(v9)), @"UniqueDFSChannelCount");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v9), @"InactiveSlotCount");
      if (v9)
      {
        ++self->_channelSequenceCountWithInactiveSlots;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v5 = VRTraceErrorLogLevelToCSTR();
          uint64_t v6 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            if ([v8 componentsJoinedByString:@","]) {
              uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "componentsJoinedByString:", @","), "description"), "UTF8String");
            }
            else {
              uint64_t v7 = "<nil>";
            }
            *(_DWORD *)buf = 136315906;
            uint64_t v12 = v5;
            __int16 v13 = 2080;
            long long v14 = "-[VCMediaStream collectChannelSequenceMetrics:]";
            __int16 v15 = 1024;
            int v16 = 640;
            __int16 v17 = 2080;
            __int16 v18 = v7;
            _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d Channel sequence has inactive slots %s", buf, 0x26u);
          }
        }
        if (self->_channelSequenceCountWithInactiveSlots == 2)
        {
          [(VCObject *)self reportingAgent];
          reportingSymptom();
        }
      }
    }
  }
}

- (VCMediaStream)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaStream;
  v2 = [(VCObject *)&v4 init];
  if (v2)
  {
    v2->_localSSRC = RTPGenerateSSRC();
    v2->_streamToken = VCUniqueIDGenerator_GenerateID();
    [(VCMediaStream *)v2 setupMediaStream];
  }
  return v2;
}

- (VCMediaStream)initWithTransportSessionID:(unsigned int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaStream;
  objc_super v4 = [(VCObject *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_transportSessionID = a3;
    v4->_localSSRC = RTPGenerateSSRC();
    v5->_streamToken = VCUniqueIDGenerator_GenerateID();
    [(VCMediaStream *)v5 setupMediaStream];
  }
  return v5;
}

- (VCMediaStream)initWithTransportSessionID:(unsigned int)a3 localSSRC:(unsigned int)a4 streamToken:(int64_t)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCMediaStream;
  uint64_t v8 = [(VCObject *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_transportSessionID = a3;
    v8->_localSSRC = a4;
    v8->_streamToken = a5;
    v8->_isQoSReportingDisabled = 1;
    [(VCMediaStream *)v8 setupMediaStream];
  }
  return v9;
}

- (void)setupMediaStream
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self->_int64_t streamTokenUplink = VCUniqueIDGenerator_GenerateID();
  self->_int64_t streamTokenDownlink = VCUniqueIDGenerator_GenerateID();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      int64_t streamTokenUplink = self->_streamTokenUplink;
      int64_t streamTokenDownlink = self->_streamTokenDownlink;
      *(_DWORD *)buf = 136316674;
      uint64_t v13 = v3;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCMediaStream setupMediaStream]";
      __int16 v16 = 1024;
      int v17 = 685;
      __int16 v18 = 2048;
      uint64_t v19 = self;
      __int16 v20 = 1024;
      int v21 = streamToken;
      __int16 v22 = 1024;
      int v23 = streamTokenUplink;
      __int16 v24 = 1024;
      int v25 = streamTokenDownlink;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d (%p) Generated _streamToken=%u streamTokenUplink=%u streamTokenDownlink=%u", buf, 0x38u);
    }
  }
  v11.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(void *)v11.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v11);
  pthread_mutexattr_settype(&v11, 2);
  pthread_mutex_init(&self->_streamLock, &v11);
  pthread_mutexattr_destroy(&v11);
  self->_nwMonitorLock._os_unfair_lock_opaque = 0;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  self->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaStream.delegateNotificationQueue", 0, CustomRootQueue);
  self->_vcMediaCallback = VCMediaCallback;
  self->_transportArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_transportSetupInfo.isSessionIDValid = self->_transportSessionID != 0;
  if ((VCFeatureFlagManager_SkipNonInfraWiFiAssertion() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCMediaStream setupMediaStream]";
        __int16 v16 = 1024;
        int v17 = 701;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d NetworkAgent is being asserted by setupMediaStream", buf, 0x1Cu);
      }
    }
    [+[VCNetworkAgent sharedInstance] addAssertion];
  }
  +[VCVTPWrapper startVTP];
  [(VCMediaStream *)self setState:0];
  self->_useRandomTS = 1;
  self->_decryptionErrorStartTime = NAN;
  self->_decryptionTimeoutEnabledTime = NAN;
  self->_rtpTimeoutEnabledTime = NAN;
  self->_rtcpTimeoutEnabledTime = NAN;
  self->_isNWMonitorSignalEnabled = _os_feature_enabled_impl();
  self->_isRTTBasedFIRThrottlingEnabled = VCDefaults_GetBoolValueForKey(@"useRTTForFIRThrottling", 0);
  self->_nwMonitorHandlerIndex = -1;
  self->_rttMonitorHandlerIndex = -1;
  [(VCMediaStream *)self registerQoSReportingSource];
  self->_perfTimers = (TimingCollection *)objc_alloc_init(MEMORY[0x1E4F47A20]);
  [+[VCQoSMonitorManager sharedInstance] registerQoSReportingSourceForToken:self->_streamToken];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_transportSetupInfo.setupType == 4) {
    [(VCMediaStream *)self cleanupNWConnection:&self->_transportSetupInfo.var0];
  }
  [(VCMediaStream *)self destroyNWMonitor];

  [(VCMediaStream *)self unregisterWRMCallback];
  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_momentsCollectorDelegate, 0);
  [+[VCDatagramChannelManager sharedInstance] removeDatagramChannel:self->_datagramChannel];

  mediaQueue = self->_mediaQueue;
  if (mediaQueue) {
    CFRelease(mediaQueue);
  }

  pthread_mutex_destroy(&self->_streamLock);
  dispatch_release((dispatch_object_t)self->_delegateNotificationQueue);
  +[VCVTPWrapper stopVTP];
  if ((VCFeatureFlagManager_SkipNonInfraWiFiAssertion() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCMediaStream dealloc]";
        __int16 v13 = 1024;
        int v14 = 747;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d NetworkAgent is being un-asserted by VCMediaStream's dealloc", buf, 0x1Cu);
      }
    }
    [+[VCNetworkAgent sharedInstance] removeAssertion];
  }
  callID = self->_callID;
  if (callID) {

  }
  idsDestination = self->_idsDestination;
  if (idsDestination) {

  }
  [(VCTransportSession *)self->_transportSession stop];
  [+[VCRateControllerManager sharedInstance] cleanupRateControllerSharingGroupWithConnection:self->_connection usePolicy:1];

  [(VCMediaStream *)self unregisterQoSReportingSource];
  [(VCMediaStream *)self unregisterMediaControlInfoGenerator];
  if (self->_isReportingAgentOwner)
  {
    [(VCObject *)self reportingAgent];
    VCReporting_finalizeAggregation();
  }

  v8.receiver = self;
  v8.super_class = (Class)VCMediaStream;
  [(VCObject *)&v8 dealloc];
}

- (void)lock
{
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
}

- (void)unlock
{
  if (self) {
    pthread_mutex_unlock(&self->_streamLock);
  }
}

- (char)streamStateToString:(int)a3
{
  if ((a3 - 1) > 3) {
    return "kVCMediaStreamStateStopped";
  }
  else {
    return off_1E6DB83B8[a3 - 1];
  }
}

- (tagHANDLE)createRTPHandleWithStreamConfig:(id)a3 payloadType:(int)a4 localSSRC:(unsigned int)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0xFFFFFFFFLL;
  int v7 = RTPCreateHandle(&v25, a4, 1, self->_useRandomTS, self->_transportSessionID, (uint64_t)self->_vcMediaCallback, (uint64_t)self, a5);
  if (v7 < 0)
  {
    int v17 = v7;
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v18 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        __int16 v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v27 = v21;
          __int16 v28 = 2080;
          __int16 v29 = "-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]";
          __int16 v30 = 1024;
          int v31 = 826;
          __int16 v32 = 2112;
          v33 = v18;
          __int16 v34 = 2048;
          v35 = self;
          __int16 v36 = 1024;
          int v37 = v17;
          int v23 = "VCMediaStream [%s] %s:%d %@(%p) Failed to create RTP extension. Error=%d";
LABEL_34:
          _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x36u);
        }
      }
    }
  }
  else
  {
    int v8 = RTPSetSendTimestampRate(v25, [a3 rtpTimestampRate]);
    if ((v8 & 0x80000000) == 0)
    {
      if ([a3 rateControlConfig])
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "mediaQueue");
        if (v9 != 0xFFFFFFFFLL)
        {
          uint64_t v10 = v9;
          uint64_t v11 = v25;
          objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "mediaQueueThrottlingInterval");
          RTPSetMediaQueue(v12, v11, v10);
          goto LABEL_11;
        }
      }
      if (objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "vcMediaQueue"))
      {
        uint64_t v13 = v25;
        mediaQueue = (tagVCMediaQueue *)objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "vcMediaQueue");
        uint64_t v15 = v13;
      }
      else
      {
        mediaQueue = self->_mediaQueue;
        if (!mediaQueue) {
          goto LABEL_11;
        }
        uint64_t v15 = v25;
      }
      RTPSetVCMediaQueue(v15, mediaQueue);
LABEL_11:
      if ([a3 securityKeyHolder]) {
        RTPSetVCSecurityKeyHolder(v25, (const void *)[a3 securityKeyHolder]);
      }
      return (tagHANDLE *)v25;
    }
    int v19 = v8;
    RTPCloseHandle();
    uint64_t v25 = 0xFFFFFFFFLL;
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v20 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v20 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        __int16 v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v27 = v24;
          __int16 v28 = 2080;
          __int16 v29 = "-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]";
          __int16 v30 = 1024;
          int v31 = 829;
          __int16 v32 = 2112;
          v33 = v20;
          __int16 v34 = 2048;
          v35 = self;
          __int16 v36 = 1024;
          int v37 = v19;
          int v23 = "VCMediaStream [%s] %s:%d %@(%p) Failed to set rtp timestamp rate. Error=%d";
          goto LABEL_34;
        }
      }
    }
  }
  return (tagHANDLE *)v25;
}

- (id)createTransportWithStreamConfig:(id)a3 ssrc:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(VCMediaStream *)self createRTPHandleWithStreamConfig:a3 payloadType:1 localSSRC:*(void *)&a4];
  if (v6 == (tagHANDLE *)0xFFFFFFFFLL)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStream createTransportWithStreamConfig:ssrc:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v16 = 136316162;
          uint64_t v17 = v12;
          __int16 v18 = 2080;
          int v19 = "-[VCMediaStream createTransportWithStreamConfig:ssrc:]";
          __int16 v20 = 1024;
          int v21 = 850;
          __int16 v22 = 2112;
          int v23 = v10;
          __int16 v24 = 2048;
          uint64_t v25 = self;
          _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to create RTP handle", (uint8_t *)&v16, 0x30u);
        }
      }
    }
    goto LABEL_26;
  }
  int v7 = [[VCMediaStreamTransport alloc] initWithHandle:v6 localSSRC:v4];
  if (!v7)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStream createTransportWithStreamConfig:ssrc:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v16 = 136316162;
          uint64_t v17 = v14;
          __int16 v18 = 2080;
          int v19 = "-[VCMediaStream createTransportWithStreamConfig:ssrc:]";
          __int16 v20 = 1024;
          int v21 = 853;
          __int16 v22 = 2112;
          int v23 = v11;
          __int16 v24 = 2048;
          uint64_t v25 = self;
          _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to create media stream transport", (uint8_t *)&v16, 0x30u);
        }
      }
    }
    RTPCloseHandle();
LABEL_26:
    int v8 = 0;
    return v8;
  }
  int v8 = v7;
  [(NSMutableArray *)self->_transportArray addObject:v7];
  return v8;
}

- (void)unregisterStatistics
{
  statisticsCollector = self->_statisticsCollector;
  if (statisticsCollector)
  {
    if (self->_nwMonitorHandlerIndex < 0
      || (-[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", 11), (statisticsCollector = self->_statisticsCollector) != 0))
    {
      if ((self->_rttMonitorHandlerIndex & 0x80000000) == 0) {
        -[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", 3);
      }
    }
  }
  self->_areStatisticsRegistered = 0;
}

- (int)registerStatisticsHandler:(id)a3 statisticType:(int)a4
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = 0;
  v8[1] = v8;
  void v8[2] = 0x2020000000;
  v8[3] = self->_statisticsHandler;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = __Block_byref_object_copy__23;
  v7[4] = __Block_byref_object_dispose__23;
  v7[5] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__VCMediaStream_registerStatisticsHandler_statisticType___block_invoke;
  v6[3] = &unk_1E6DB82D0;
  v6[4] = v8;
  v6[5] = v7;
  int v4 = [a3 registerStatisticsChangeHandlerWithType:*(void *)&a4 handler:v6];
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v8, 8);
  return v4;
}

uint64_t __57__VCMediaStream_registerStatisticsHandler_statisticType___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(uint64_t (**)(uint64_t, _OWORD *))(*(void *)(*(void *)(result + 32) + 8) + 24);
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40);
    long long v4 = *(_OWORD *)(a2 + 176);
    v10[10] = *(_OWORD *)(a2 + 160);
    v10[11] = v4;
    uint64_t v11 = *(void *)(a2 + 192);
    long long v5 = *(_OWORD *)(a2 + 112);
    v10[6] = *(_OWORD *)(a2 + 96);
    v10[7] = v5;
    long long v6 = *(_OWORD *)(a2 + 144);
    v10[8] = *(_OWORD *)(a2 + 128);
    v10[9] = v6;
    long long v7 = *(_OWORD *)(a2 + 48);
    void v10[2] = *(_OWORD *)(a2 + 32);
    void v10[3] = v7;
    long long v8 = *(_OWORD *)(a2 + 80);
    v10[4] = *(_OWORD *)(a2 + 64);
    v10[5] = v8;
    long long v9 = *(_OWORD *)(a2 + 16);
    v10[0] = *(_OWORD *)a2;
    v10[1] = v9;
    return v2(v3, v10);
  }
  return result;
}

- (void)registerStatistics:(id)a3
{
  if (a3)
  {
    if (self->_areStatisticsRegistered) {
      [(VCMediaStream *)self unregisterStatistics];
    }
    if (self->_isNWMonitorSignalEnabled
      || self->_isRTTBasedFIRThrottlingEnabled
      || self->_isServerPacketRetransmissionEnabled)
    {

      self->_statisticsCollector = (AVCStatisticsCollector *)a3;
      if (self->_isNWMonitorSignalEnabled) {
        self->_nwMonitorHandlerIndex = [(VCMediaStream *)self registerStatisticsHandler:a3 statisticType:11];
      }
      if (self->_isRTTBasedFIRThrottlingEnabled || self->_isServerPacketRetransmissionEnabled) {
        self->_rttMonitorHandlerIndex = [(VCMediaStream *)self registerStatisticsHandler:a3 statisticType:3];
      }
      self->_areStatisticsRegistered = 1;
    }
  }
}

- (void)initializeWRMUsingRtpHandle:(tagHANDLE *)a3
{
  WRMInitialize((uint64_t)[(VCNetworkFeedbackController *)[(VCMediaStream *)self networkFeedbackController] wrmInfo], (uint64_t)a3);
  RTPSetWRMInfo((uint64_t)a3, (uint64_t)[(VCNetworkFeedbackController *)[(VCMediaStream *)self networkFeedbackController] wrmInfo]);
  RTPSetWRMMetricsCallback((uint64_t)a3, (uint64_t)_VCMediaStream_WRMReportMetricsCallback, (long long *)[(VCNetworkFeedbackController *)[(VCMediaStream *)self networkFeedbackController] wrmContext]);
  unsigned int v5 = [(VCNetworkFeedbackController *)[(VCMediaStream *)self networkFeedbackController] callID];

  RTPSetWRMCallId((uint64_t)a3, v5);
}

- (void)unregisterWRMCallback
{
  if (self->_isWRMinitialized
    && [(VCMediaStream *)self networkFeedbackController]
    && [(VCNetworkFeedbackController *)[(VCMediaStream *)self networkFeedbackController] wrmInfo])
  {
    uint64_t v3 = [(VCNetworkFeedbackController *)[(VCMediaStream *)self networkFeedbackController] wrmInfo];
    WRMSetReportingCallback((uint64_t)v3, 0, 0);
  }
}

- (BOOL)shouldStopReportingTimer
{
  return (self->_operatingMode > 6u) | (0x39u >> self->_operatingMode) & 1;
}

- (void)registerQoSReportingSource
{
  if (!self->_isQoSReportingDisabled)
  {
    uint64_t v3 = +[VCQoSMonitorManager sharedInstance];
    int64_t streamToken = self->_streamToken;
    [(VCQoSMonitorManager *)v3 registerQoSReportingSourceForToken:streamToken];
  }
}

- (void)unregisterQoSReportingSource
{
  if (!self->_isQoSReportingDisabled)
  {
    uint64_t v3 = +[VCQoSMonitorManager sharedInstance];
    int64_t streamToken = self->_streamToken;
    [(VCQoSMonitorManager *)v3 unregisterQoSReportingSourceForToken:streamToken];
  }
}

- (void)registerAggregationHandlers
{
  if (!self->_isQoSReportingDisabled)
  {
    [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    [(VCObject *)self reportingAgent];
    reportingSetPeriodicAggregationOccuredHandler();
    [(VCObject *)self reportingAgent];
    ReportingVC_SetEventDrivenAggregationOccurredHandler();
  }
}

uint64_t __44__VCMediaStream_registerAggregationHandlers__block_invoke(uint64_t a1, uint64_t a2)
{
  long long v4 = +[VCQoSMonitorManager sharedInstance];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "streamToken");

  return [(VCQoSMonitorManager *)v4 updateQoSReport:a2 toClientsWithToken:v5];
}

uint64_t __44__VCMediaStream_registerAggregationHandlers__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = +[VCQoSMonitorManager sharedInstance];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "streamToken");

  return [(VCQoSMonitorManager *)v5 updateEventDrivenQoSReport:a3 toClientsWithToken:v6];
}

- (void)deregisterAggregationHandlers
{
  if (!self->_isQoSReportingDisabled)
  {
    [(VCObject *)self reportingAgent];
    reportingSetPeriodicAggregationOccuredHandler();
    [(VCObject *)self reportingAgent];
    ReportingVC_SetEventDrivenAggregationOccurredHandler();
  }
}

- (void)registerMediaControlInfoGeneratorWithConfigs:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = -[VCMediaStream getMediaStreamConfigForControlInfoGenerator:](self, "getMediaStreamConfigForControlInfoGenerator:");
  id v50 = a3;
  if (!v5) {
    goto LABEL_31;
  }
  uint64_t v6 = v5;
  long long v7 = (const void *)objc_msgSend((id)objc_msgSend(v5, "rateControlConfig"), "mediaControlInfoGenerator");
  self->_mediaControlInfoGeneratorint Type = objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "mediaControlInfoGeneratorType");
  if (objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "shouldCreateMediaControlInfoGenerator"))
  {
    -[VCMediaStream createLocalMediaControlInfoGeneratorWithType:version:](self, "createLocalMediaControlInfoGeneratorWithType:version:", self->_mediaControlInfoGeneratorType, objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "mediaControlInfoVersion"));
  }
  else if (v7)
  {
    self->_mediaControlInfoGenerator = (void *)CFRetain(v7);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      long long v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class()) {
          uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          uint64_t v10 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v57 = v8;
        __int16 v58 = 2080;
        v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
        __int16 v60 = 1024;
        int v61 = 977;
        __int16 v62 = 2080;
        v63 = (void *)v10;
        __int16 v64 = 2048;
        *(void *)v65 = self;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] Using Media Control Info Generator from multiway config", buf, 0x30u);
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "feedbackController"))
  {
    self->_feedbackController = (AVCRateControlFeedbackController *)(id)objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "feedbackController");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class()) {
          uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          uint64_t v13 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v57 = v11;
        __int16 v58 = 2080;
        v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
        __int16 v60 = 1024;
        int v61 = 981;
        __int16 v62 = 2080;
        v63 = (void *)v13;
        __int16 v64 = 2048;
        *(void *)v65 = self;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] Using Feedback Controller from multiway config", buf, 0x30u);
      }
    }
  }
  a3 = v50;
  if (!objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "shouldRegisterMediaControlInfoGeneratorCallbacks"))goto LABEL_31; {
  -[VCMediaStream registerCallbacksForMediaControlInfoGenerator:forDirection:options:](self, "registerCallbacksForMediaControlInfoGenerator:forDirection:options:", self->_mediaControlInfoGenerator, [v6 direction], objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "mediaControlInfoGeneratorOptions"));
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_30;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
    int Type = VCMediaControlInfoGeneratorGetType(mediaControlInfoGenerator);
    uint64_t v19 = [v6 direction];
    *(_DWORD *)buf = 136316418;
    uint64_t v57 = v15;
    __int16 v58 = 2080;
    v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
    __int16 v60 = 1024;
    int v61 = 987;
    __int16 v62 = 2048;
    v63 = mediaControlInfoGenerator;
    __int16 v64 = 1024;
    *(_DWORD *)v65 = Type;
    *(_WORD *)&v65[4] = 2048;
    *(void *)&v65[6] = v19;
    __int16 v20 = "VCMediaStream [%s] %s:%d Registered callbacks for MediaControlInfoGenerator[%p], type=%d, direction=%ld";
    int v21 = v16;
    uint32_t v22 = 54;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_30;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    __int16 v24 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    uint64_t v25 = self->_mediaControlInfoGenerator;
    int v26 = VCMediaControlInfoGeneratorGetType(v25);
    uint64_t v27 = [v6 direction];
    *(_DWORD *)buf = 136316930;
    uint64_t v57 = v23;
    __int16 v58 = 2080;
    v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
    __int16 v60 = 1024;
    int v61 = 987;
    __int16 v62 = 2112;
    v63 = v14;
    __int16 v64 = 2048;
    *(void *)v65 = self;
    *(_WORD *)&v65[8] = 2048;
    *(void *)&v65[10] = v25;
    __int16 v66 = 1024;
    int v67 = v26;
    __int16 v68 = 2048;
    uint64_t v69 = v27;
    __int16 v20 = "VCMediaStream [%s] %s:%d %@(%p) Registered callbacks for MediaControlInfoGenerator[%p], type=%d, direction=%ld";
    int v21 = v24;
    uint32_t v22 = 74;
  }
  _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_30:
  self->_mediaControlInfoCallbacksRegistered = 1;
  a3 = v50;
LABEL_31:
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v28 = [a3 countByEnumeratingWithState:&v52 objects:v51 count:16];
  if (!v28) {
    return;
  }
  uint64_t v30 = v28;
  uint64_t v31 = *(void *)v53;
  *(void *)&long long v29 = 136316418;
  long long v49 = v29;
  do
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v53 != v31) {
        objc_enumerationMutation(a3);
      }
      v33 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v33, "multiwayConfig", v49), "isOneToOne")
        && objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "shouldRegisterMediaControlInfoGeneratorCallbacks"))
      {
        -[VCMediaStream registerCallbacksForMediaControlInfoGenerator:forDirection:options:](self, "registerCallbacksForMediaControlInfoGenerator:forDirection:options:", objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "mediaControlInfoGenerator"), objc_msgSend(v33, "direction"), objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "mediaControlInfoGeneratorOptions"));
        self->_oneToOneFeedbackController = (AVCRateControlFeedbackController *)(id)objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "feedbackController");
        __int16 v34 = objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "mediaControlInfoGenerator");
        if (v34) {
          __int16 v34 = (void *)CFRetain(v34);
        }
        self->_oneToOneControlInfoGenerator = v34;
        if ((VCMediaStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v44 = VRTraceErrorLogLevelToCSTR();
            v45 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              oneToOneControlInfoGenerator = self->_oneToOneControlInfoGenerator;
              int v47 = VCMediaControlInfoGeneratorGetType(oneToOneControlInfoGenerator);
              uint64_t v48 = [v33 direction];
              *(_DWORD *)buf = v49;
              uint64_t v57 = v44;
              __int16 v58 = 2080;
              v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
              __int16 v60 = 1024;
              int v61 = 998;
              __int16 v62 = 2048;
              v63 = oneToOneControlInfoGenerator;
              __int16 v64 = 1024;
              *(_DWORD *)v65 = v47;
              a3 = v50;
              *(_WORD *)&v65[4] = 2048;
              *(void *)&v65[6] = v48;
              v41 = v45;
              v42 = "VCMediaStream [%s] %s:%d Registered callbacks for oneToOne MediaControlInfoGenerator[%p], type=%d, direction=%ld";
              uint32_t v43 = 54;
LABEL_49:
              _os_log_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, v43);
            }
          }
        }
        else
        {
          v35 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            v35 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v36 = VRTraceErrorLogLevelToCSTR();
            int v37 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v38 = self->_oneToOneControlInfoGenerator;
              int v39 = VCMediaControlInfoGeneratorGetType(v38);
              uint64_t v40 = [v33 direction];
              *(_DWORD *)buf = 136316930;
              uint64_t v57 = v36;
              __int16 v58 = 2080;
              v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
              __int16 v60 = 1024;
              int v61 = 998;
              __int16 v62 = 2112;
              v63 = v35;
              __int16 v64 = 2048;
              *(void *)v65 = self;
              *(_WORD *)&v65[8] = 2048;
              *(void *)&v65[10] = v38;
              a3 = v50;
              __int16 v66 = 1024;
              int v67 = v39;
              __int16 v68 = 2048;
              uint64_t v69 = v40;
              v41 = v37;
              v42 = "VCMediaStream [%s] %s:%d %@(%p) Registered callbacks for oneToOne MediaControlInfoGenerator[%p], typ"
                    "e=%d, direction=%ld";
              uint32_t v43 = 74;
              goto LABEL_49;
            }
          }
        }
        self->_mediaControlInfoCallbacksRegistered = 1;
        continue;
      }
    }
    uint64_t v30 = [a3 countByEnumeratingWithState:&v52 objects:v51 count:16];
  }
  while (v30);
}

- (id)getMediaStreamConfigForControlInfoGenerator:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v12;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v12 != v6) {
      objc_enumerationMutation(a3);
    }
    uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
    if (objc_msgSend((id)objc_msgSend(v8, "rateControlConfig"), "mediaControlInfoGenerator")
      || (objc_msgSend((id)objc_msgSend(v8, "rateControlConfig"), "shouldCreateMediaControlInfoGenerator") & 1) != 0)
    {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      uint64_t v8 = 0;
      if (v5) {
        goto LABEL_3;
      }
      return v8;
    }
  }
}

- (void)createLocalMediaControlInfoGeneratorWithType:(unsigned int)a3 version:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_mediaControlInfoGenerator)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class()) {
          long long v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          long long v9 = "<nil>";
        }
        int v11 = 136316162;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        long long v14 = "-[VCMediaStream createLocalMediaControlInfoGeneratorWithType:version:]";
        __int16 v15 = 1024;
        int v16 = 1015;
        __int16 v17 = 2080;
        __int16 v18 = v9;
        __int16 v19 = 2048;
        __int16 v20 = self;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] Api usage error. Overriding generator from multiway config with a locally created generator", (uint8_t *)&v11, 0x30u);
      }
    }
    mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
    if (mediaControlInfoGenerator) {
      CFRelease(mediaControlInfoGenerator);
    }
  }
  self->_mediaControlInfoGenerator = 0;
  self->_mediaControlInfoGenerator = (void *)VCMediaControlInfoGeneratorCreateWithTypeAndVersion(v5, v4);
}

- (void)registerCallbacksForMediaControlInfoGenerator:(void *)a3 forDirection:(int64_t)a4 options:(unsigned int)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a5) {
      VCMediaControlInfoGeneratorAddOptions(a3, *(const char **)&a5);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      long long v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class()) {
          uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          uint64_t v10 = "<nil>";
        }
        int v15 = 136316418;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCMediaStream registerCallbacksForMediaControlInfoGenerator:forDirection:options:]";
        __int16 v19 = 1024;
        int v20 = 1031;
        __int16 v21 = 2080;
        uint32_t v22 = v10;
        __int16 v23 = 2048;
        __int16 v24 = self;
        __int16 v25 = 2048;
        int64_t v26 = a4;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] Registering Media Control Info Generator Callbacks for direction %ld", (uint8_t *)&v15, 0x3Au);
      }
    }
    switch(a4)
    {
      case 3:
        int v11 = VCMediaStreamFillMediaControlInfoCallback;
        long long v14 = VCMediaStreamProcessMediaControlInfoCallback;
        uint64_t v12 = a3;
        __int16 v13 = self;
        break;
      case 2:
        long long v14 = VCMediaStreamProcessMediaControlInfoCallback;
        uint64_t v12 = a3;
        __int16 v13 = self;
        int v11 = 0;
        break;
      case 1:
        int v11 = VCMediaStreamFillMediaControlInfoCallback;
        uint64_t v12 = a3;
        __int16 v13 = self;
        long long v14 = 0;
        break;
      default:
        return;
    }
    VCMediaControlInfoGeneratorRegisterCallbacks(v12, (const char *)v13, (uint64_t)v11, (uint64_t)v14);
  }
}

- (void)unregisterMediaControlInfoGenerator
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
  if (mediaControlInfoGenerator)
  {
    if (!self->_mediaControlInfoCallbacksRegistered)
    {
LABEL_15:
      CFRelease(mediaControlInfoGenerator);
      self->_mediaControlInfoGenerator = 0;
      goto LABEL_16;
    }
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = (__CFString *)self->_mediaControlInfoGenerator;
          int v27 = 136315906;
          uint64_t v28 = v5;
          __int16 v29 = 2080;
          uint64_t v30 = "-[VCMediaStream unregisterMediaControlInfoGenerator]";
          __int16 v31 = 1024;
          int v32 = 1050;
          __int16 v33 = 2048;
          __int16 v34 = v7;
          uint64_t v8 = "VCMediaStream [%s] %s:%d Deregistering callbacks for MediaControlInfoGenerator[%p]";
          long long v9 = v6;
          uint32_t v10 = 38;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v27, v10);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v13 = self->_mediaControlInfoGenerator;
          int v27 = 136316418;
          uint64_t v28 = v11;
          __int16 v29 = 2080;
          uint64_t v30 = "-[VCMediaStream unregisterMediaControlInfoGenerator]";
          __int16 v31 = 1024;
          int v32 = 1050;
          __int16 v33 = 2112;
          __int16 v34 = v4;
          __int16 v35 = 2048;
          uint64_t v36 = self;
          __int16 v37 = 2048;
          uint64_t v38 = v13;
          uint64_t v8 = "VCMediaStream [%s] %s:%d %@(%p) Deregistering callbacks for MediaControlInfoGenerator[%p]";
          long long v9 = v12;
          uint32_t v10 = 58;
          goto LABEL_13;
        }
      }
    }
    VCMediaControlInfoGeneratorDeregisterCallbacks(self->_mediaControlInfoGenerator, (const char *)self);
    mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
    if (!mediaControlInfoGenerator) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:
  oneToOneControlInfoGenerator = self->_oneToOneControlInfoGenerator;
  if (!oneToOneControlInfoGenerator) {
    goto LABEL_31;
  }
  if (self->_mediaControlInfoCallbacksRegistered)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        __int16 v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = (__CFString *)self->_oneToOneControlInfoGenerator;
          int v27 = 136315906;
          uint64_t v28 = v16;
          __int16 v29 = 2080;
          uint64_t v30 = "-[VCMediaStream unregisterMediaControlInfoGenerator]";
          __int16 v31 = 1024;
          int v32 = 1057;
          __int16 v33 = 2048;
          __int16 v34 = v18;
          __int16 v19 = "VCMediaStream [%s] %s:%d Deregistering callbacks for oneToOne MediaControlInfoGenerator[%p]";
          int v20 = v17;
          uint32_t v21 = 38;
LABEL_28:
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v27, v21);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v15 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        int v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        __int16 v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = self->_oneToOneControlInfoGenerator;
          int v27 = 136316418;
          uint64_t v28 = v22;
          __int16 v29 = 2080;
          uint64_t v30 = "-[VCMediaStream unregisterMediaControlInfoGenerator]";
          __int16 v31 = 1024;
          int v32 = 1057;
          __int16 v33 = 2112;
          __int16 v34 = v15;
          __int16 v35 = 2048;
          uint64_t v36 = self;
          __int16 v37 = 2048;
          uint64_t v38 = v24;
          __int16 v19 = "VCMediaStream [%s] %s:%d %@(%p) Deregistering callbacks for oneToOne MediaControlInfoGenerator[%p]";
          int v20 = v23;
          uint32_t v21 = 58;
          goto LABEL_28;
        }
      }
    }
    VCMediaControlInfoGeneratorDeregisterCallbacks(self->_oneToOneControlInfoGenerator, (const char *)self);
    oneToOneControlInfoGenerator = self->_oneToOneControlInfoGenerator;
    if (!oneToOneControlInfoGenerator) {
      goto LABEL_31;
    }
  }
  CFRelease(oneToOneControlInfoGenerator);
  self->_oneToOneControlInfoGenerator = 0;
LABEL_31:
  feedbackController = self->_feedbackController;
  if (feedbackController)
  {

    self->_feedbackController = 0;
  }
  oneToOneFeedbackController = self->_oneToOneFeedbackController;
  if (oneToOneFeedbackController)
  {

    self->_oneToOneFeedbackController = 0;
  }
  self->_mediaControlInfoCallbacksRegistered = 0;
}

- (BOOL)handleEncryptionInfoChange:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 objectForKeyedSubscript:@"SecurityKeyIndex"];
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  BOOL v5 = [(VCMediaKeyIndex *)self->_lastReceivedMKI isEqual:v4];
  int v6 = !v5;
  if (!v5) {
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&self->_lastReceivedMKI, v4);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obj = self->_transportArray;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v49, 16, 544);
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v51;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if ((v5 & [v12 encryptionInfoReceived] & 1) == 0)
        {
          if ((VCMediaStream *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v20 = VRTraceErrorLogLevelToCSTR();
              uint32_t v21 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                int v22 = [v12 idsStreamId];
                *(_DWORD *)buf = 136316162;
                uint64_t v38 = v20;
                __int16 v39 = 2080;
                uint64_t v40 = "-[VCMediaStream handleEncryptionInfoChange:]";
                __int16 v41 = 1024;
                int v42 = 1135;
                __int16 v43 = 2048;
                *(void *)uint64_t v44 = v12;
                *(_WORD *)&v44[8] = 1024;
                LODWORD(v45) = v22;
                __int16 v17 = v21;
                __int16 v18 = "VCMediaStream [%s] %s:%d Propagating MKM to transport=%p streamID=%d";
                uint32_t v19 = 44;
LABEL_20:
                _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
              }
            }
          }
          else
          {
            __int16 v13 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              __int16 v13 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v14 = VRTraceErrorLogLevelToCSTR();
              int v15 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                int v16 = [v12 idsStreamId];
                *(_DWORD *)buf = 136316674;
                uint64_t v38 = v14;
                __int16 v39 = 2080;
                uint64_t v40 = "-[VCMediaStream handleEncryptionInfoChange:]";
                __int16 v41 = 1024;
                int v42 = 1135;
                __int16 v43 = 2112;
                *(void *)uint64_t v44 = v13;
                *(_WORD *)&v44[8] = 2048;
                v45 = self;
                __int16 v46 = 2048;
                *(void *)int v47 = v12;
                *(_WORD *)&v47[8] = 1024;
                int v48 = v16;
                __int16 v17 = v15;
                __int16 v18 = "VCMediaStream [%s] %s:%d %@(%p) Propagating MKM to transport=%p streamID=%d";
                uint32_t v19 = 64;
                goto LABEL_20;
              }
            }
          }
          [v12 handleEncryptionInfoChange:a3];
          char v9 = 1;
          continue;
        }
      }
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v50 objects:v49 count:16];
      if (!v8)
      {
        int v6 = !v5;
        if ((v9 & 1) == 0) {
          break;
        }
LABEL_36:
        if (self) {
          goto LABEL_37;
        }
        return v6;
      }
    }
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_36;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    __int16 v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    int v26 = [*(id *)((char *)&self->super.super.isa + v34) count];
    *(_DWORD *)buf = 136316162;
    uint64_t v38 = v24;
    __int16 v39 = 2080;
    uint64_t v40 = "-[VCMediaStream handleEncryptionInfoChange:]";
    __int16 v41 = 1024;
    int v42 = 1141;
    __int16 v43 = 1024;
    *(_DWORD *)uint64_t v44 = v6;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v26;
    int v27 = "VCMediaStream [%s] %s:%d MKM not updated on media stream transports. shouldHandle=%d isTransportArrayCount=%u";
    uint64_t v28 = v25;
    uint32_t v29 = 40;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_36;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    __int16 v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    int v32 = [*(id *)((char *)&self->super.super.isa + v34) count];
    *(_DWORD *)buf = 136316674;
    uint64_t v38 = v30;
    __int16 v39 = 2080;
    uint64_t v40 = "-[VCMediaStream handleEncryptionInfoChange:]";
    __int16 v41 = 1024;
    int v42 = 1141;
    __int16 v43 = 2112;
    *(void *)uint64_t v44 = v23;
    *(_WORD *)&v44[8] = 2048;
    v45 = self;
    __int16 v46 = 1024;
    *(_DWORD *)int v47 = v6;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = v32;
    int v27 = "VCMediaStream [%s] %s:%d %@(%p) MKM not updated on media stream transports. shouldHandle=%d isTransportArrayCount=%u";
    uint64_t v28 = v31;
    uint32_t v29 = 60;
  }
  _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
LABEL_37:
  pthread_mutex_unlock(&self->_streamLock);
  return v6;
}

- (void)resetDecryptionTimeout
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v3;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCMediaStream resetDecryptionTimeout]";
      __int16 v19 = 1024;
      int v20 = 1148;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d Resetting decryption status", buf, 0x1Cu);
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  transportArray = self->_transportArray;
  uint64_t v6 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(transportArray);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) rtpHandle];
        RTPResetDecryptionStatus();
      }
      uint64_t v7 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
  [(VCMediaStream *)self decryptionStatusChanged:1];
}

- (int)updateConnectionWithConfig:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v49 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "localAddress"), "ip"), "UTF8String");
  objc_msgSend((id)objc_msgSend(a3, "localAddress"), "port");
  MakeIPPORT();
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "ip"), "UTF8String");
  objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "port");
  MakeIPPORT();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  memset(v29, 0, sizeof(v29));
  uint64_t v30 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v36 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v33 = 0;
  long long v37 = 0u;
  memset(v38, 0, sizeof(v38));

  BOOL v5 = [[VCConnectionLegacy alloc] initWithConnectionResult:v29 type:0];
  self->_connection = &v5->super;
  if (!v5)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStream updateConnectionWithConfig:]();
        }
      }
      return 1;
    }
    if (objc_opt_respondsToSelector()) {
      char v9 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
    }
    else {
      char v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 1;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    long long v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 1;
    }
    int v15 = 136316674;
    uint64_t v16 = v11;
    __int16 v17 = 2080;
    __int16 v18 = "-[VCMediaStream updateConnectionWithConfig:]";
    __int16 v19 = 1024;
    int v20 = 1175;
    __int16 v21 = 2112;
    int v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = [a3 localAddress];
    __int16 v27 = 2112;
    uint64_t v28 = [a3 remoteAddress];
    long long v13 = "VCMediaStream [%s] %s:%d %@(%p) Failed to create connection with localAddress=%@ and remoteAddress=%@";
    goto LABEL_26;
  }

  uint64_t v6 = [+[VCRateControllerManager sharedInstance] getRateControllerSharingGroupWithConnection:self->_connection usePolicy:1];
  self->_rateSharingGroup = v6;
  if (!v6)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStream updateConnectionWithConfig:]();
        }
      }
      return 1;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 1;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    long long v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 1;
    }
    int v15 = 136316674;
    uint64_t v16 = v14;
    __int16 v17 = 2080;
    __int16 v18 = "-[VCMediaStream updateConnectionWithConfig:]";
    __int16 v19 = 1024;
    int v20 = 1179;
    __int16 v21 = 2112;
    int v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = [a3 localAddress];
    __int16 v27 = 2112;
    uint64_t v28 = [a3 remoteAddress];
    long long v13 = "VCMediaStream [%s] %s:%d %@(%p) Failed to retrieve rate sharing group for connection with localAddress=%@ and "
          "remoteAddress=%@";
LABEL_26:
    _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x44u);
    return 1;
  }
  uint64_t v7 = v6;
  return 0;
}

- (BOOL)updateRemoteAddressWithConfig:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![a3 remoteAddress]) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = -[VCTransportSession setRemoteAddress:remoteRTCPPort:](self->_transportSession, "setRemoteAddress:remoteRTCPPort:", [a3 remoteAddress], objc_msgSend(a3, "rtcpRemotePort"));
LABEL_7:
      int v9 = v8;
      if ((v8 & 0x80000000) == 0) {
        return v9 >= 0;
      }
      goto LABEL_8;
    }
LABEL_13:
    int v9 = 0;
    return v9 >= 0;
  }
  int v7 = -[VCTransportSession setRemoteAddress:remoteRTCPPort:](self->_transportSession, "setRemoteAddress:remoteRTCPPort:", [a3 remoteAddress], objc_msgSend(a3, "rtcpRemotePort"));
  if ((v7 & 0x80000000) == 0)
  {
    int v8 = [(VCMediaStream *)self updateConnectionWithConfig:a3];
    goto LABEL_7;
  }
  int v9 = v7;
LABEL_8:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
    long long v12 = *MEMORY[0x1E4F47A50];
    if (IsOSFaultDisabled)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        if (objc_opt_class()) {
          long long v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          long long v13 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v10;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCMediaStream updateRemoteAddressWithConfig:error:]";
        __int16 v20 = 1024;
        int v21 = 1204;
        __int16 v22 = 2080;
        __int16 v23 = v13;
        __int16 v24 = 2048;
        __int16 v25 = self;
        __int16 v26 = 1024;
        int v27 = v9;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %s[%p] Failed to setRemoteAddress on transportSession %d", buf, 0x36u);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      if (objc_opt_class()) {
        int v15 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        int v15 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCMediaStream updateRemoteAddressWithConfig:error:]";
      __int16 v20 = 1024;
      int v21 = 1204;
      __int16 v22 = 2080;
      __int16 v23 = v15;
      __int16 v24 = 2048;
      __int16 v25 = self;
      __int16 v26 = 1024;
      int v27 = v9;
      _os_log_fault_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_FAULT, "VCMediaStream [%s] %s:%d %s[%p] Failed to setRemoteAddress on transportSession %d", buf, 0x36u);
    }
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1208), @"Stream configuration failed", @"Could not set remote address on transport session");
  return v9 >= 0;
}

- (id)getSharingGroupWithPolicy:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = +[VCRateControllerManager sharedInstance];
  connection = self->_connection;

  return [(VCRateControllerManager *)v5 getRateControllerSharingGroupWithConnection:connection usePolicy:v3];
}

- (void)setMediaQueueInRateControlConfig:(id)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(-[VCMediaStream getSharingGroupWithPolicy:](self, "getSharingGroupWithPolicy:", 1), "mediaQueue");
    [a3 setVcMediaQueue:v4];
  }
}

- (void)setMediaQueueInStreamConfig:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v5 = [a3 accessNetworkType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 audioStreamMode] != 9) {
      return;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [a3 type] != 5) {
      return;
    }
  }
  if (v5 != 2) {
    return;
  }
  if ([a3 rateControlConfig]) {
    goto LABEL_10;
  }
  uint64_t v6 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (v6)
  {
    int v7 = v6;
    [a3 setRateControlConfig:v6];

LABEL_10:
    uint64_t v8 = [a3 rateControlConfig];
    [(VCMediaStream *)self setMediaQueueInRateControlConfig:v8];
    return;
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v17 = 136315650;
    uint64_t v18 = v10;
    __int16 v19 = 2080;
    __int16 v20 = "-[VCMediaStream setMediaQueueInStreamConfig:]";
    __int16 v21 = 1024;
    int v22 = 1247;
    long long v12 = "VCMediaStream [%s] %s:%d Could not allocate memory for creating VCMediaStreamRateControlConfig object";
    long long v13 = v11;
    uint32_t v14 = 28;
LABEL_23:
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    int v9 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
  }
  else {
    int v9 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136316162;
      uint64_t v18 = v15;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCMediaStream setMediaQueueInStreamConfig:]";
      __int16 v21 = 1024;
      int v22 = 1247;
      __int16 v23 = 2112;
      __int16 v24 = v9;
      __int16 v25 = 2048;
      __int16 v26 = self;
      long long v12 = "VCMediaStream [%s] %s:%d %@(%p) Could not allocate memory for creating VCMediaStreamRateControlConfig object";
      long long v13 = v16;
      uint32_t v14 = 48;
      goto LABEL_23;
    }
  }
}

- (BOOL)setStreamConfig:(id)a3 withError:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v5 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v8 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v36 = v6;
      __int16 v37 = 2080;
      uint64_t v38 = "-[VCMediaStream setStreamConfig:withError:]";
      __int16 v39 = 1024;
      int v40 = 1259;
      __int16 v41 = 2080;
      long long v42 = (void *)v8;
      __int16 v43 = 2048;
      long long v44 = self;
      __int16 v45 = 2080;
      long long v46 = "-[VCMediaStream setStreamConfig:withError:]";
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s", buf, 0x3Au);
    }
  }
  if (self->_state)
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1264), @"Bad API usage", @"setStreamConfig called while media stream is running");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          if (objc_opt_class()) {
            long long v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
          }
          else {
            long long v12 = "<nil>";
          }
          if (*a4) {
            __int16 v26 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            __int16 v26 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v36 = v9;
          __int16 v37 = 2080;
          uint64_t v38 = "-[VCMediaStream setStreamConfig:withError:]";
          __int16 v39 = 1024;
          int v40 = 1267;
          __int16 v41 = 2080;
          long long v42 = (void *)v12;
          __int16 v43 = 2048;
          long long v44 = self;
          __int16 v45 = 2080;
          long long v46 = v26;
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %s[%p] error[%s]", buf, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        if (objc_opt_class()) {
          __int16 v25 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          __int16 v25 = "<nil>";
        }
        if (*a4) {
          uint64_t v27 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
        }
        else {
          uint64_t v27 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v36 = v9;
        __int16 v37 = 2080;
        uint64_t v38 = "-[VCMediaStream setStreamConfig:withError:]";
        __int16 v39 = 1024;
        int v40 = 1267;
        __int16 v41 = 2080;
        long long v42 = (void *)v25;
        __int16 v43 = 2048;
        long long v44 = self;
        __int16 v45 = 2080;
        long long v46 = v27;
        _os_log_fault_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_FAULT, "VCMediaStream [%s] %s:%d %s[%p] error[%s]", buf, 0x3Au);
      }
    }
    BOOL v23 = 0;
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v13 = [a3 countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(a3);
          }
          int v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v17 localSSRC]) {
            self->_localSSRC = [v17 localSSRC];
          }
          if (!self->_networkFeedbackController)
          {
            uint64_t v18 = (VCNetworkFeedbackController *)[v17 networkFeedbackController];
            self->_networkFeedbackController = v18;
            if (v18) {
              CFRetain(v18);
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v19 = VRTraceErrorLogLevelToCSTR();
              __int16 v20 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                networkFeedbackController = self->_networkFeedbackController;
                uint64_t v22 = objc_opt_class();
                *(_DWORD *)buf = 136316162;
                uint64_t v36 = v19;
                __int16 v37 = 2080;
                uint64_t v38 = "-[VCMediaStream setStreamConfig:withError:]";
                __int16 v39 = 1024;
                int v40 = 1277;
                __int16 v41 = 2048;
                long long v42 = networkFeedbackController;
                __int16 v43 = 2112;
                long long v44 = (VCMediaStream *)v22;
                _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d Setting stream config with networkFeedbackController=%p type=%@", buf, 0x30u);
              }
            }
          }
          if (![(VCMediaStream *)self updateRemoteAddressWithConfig:v17 error:a4])
          {
            BOOL v23 = 0;
            goto LABEL_37;
          }
          self->_isServerPacketRetransmissionEnabled |= [v17 isServerPacketRetransmissionEnabled];
          self->_isUplinkRetransmissionEnabled |= [v17 isUplinkRetransmissionEnabled];
          [(VCMediaStream *)self setMediaQueueInStreamConfig:v17];
        }
        uint64_t v14 = [a3 countByEnumeratingWithState:&v31 objects:v30 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    [(VCMediaStream *)self unregisterMediaControlInfoGenerator];
    BOOL v23 = [(VCMediaStream *)self onConfigureStreamWithConfiguration:a3 error:a4];
    if (v23)
    {
LABEL_37:
      int v5 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
    }
    else
    {
      int v5 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaStream setStreamConfig:withError:]();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[VCMediaStream setStreamConfig:withError:]();
        }
      }
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)self + v5[246]));
  return v23;
}

- (id)start
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  long long v12 = __Block_byref_object_copy__23;
  uint64_t v13 = __Block_byref_object_dispose__23;
  uint64_t v14 = 0;
  uint64_t v3 = dispatch_semaphore_create(0);
  [(TimingCollection *)self->_perfTimers startTimingForKey:19];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __22__VCMediaStream_start__block_invoke;
  v8[3] = &unk_1E6DB7D30;
  void v8[5] = v3;
  void v8[6] = &v9;
  v8[4] = self;
  [(VCMediaStream *)self startWithCompletionHandler:v8];
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream start]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v10 + 5, 32029, 0, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1319), @"Media stream start time out", @"Time out");
    VCUtil_GenerateDiagnostics(0, 1, "Media stream start time out", 1u);
    id v5 = (id)v10[5];
    [(VCMediaStream *)self stopWithError:v10[5]];
  }
  dispatch_release(v3);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

intptr_t __22__VCMediaStream_start__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v8 = "<nil>";
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 136316418;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCMediaStream start]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 1307;
      __int16 v17 = 2080;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCMediaStream start]_block_invoke";
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s", (uint8_t *)&v11, 0x3Au);
    }
  }
  if ((a2 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a3;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)startWithCompletionHandler:(id)a3
{
  *(void *)&v42[11] = *MEMORY[0x1E4F143B8];
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        int v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        int v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v32 = v5;
      __int16 v33 = 2080;
      long long v34 = "-[VCMediaStream startWithCompletionHandler:]";
      __int16 v35 = 1024;
      int v36 = 1333;
      __int16 v37 = 2080;
      uint64_t v38 = (void *)v7;
      __int16 v39 = 2048;
      int v40 = self;
      __int16 v41 = 2080;
      *(void *)long long v42 = "-[VCMediaStream startWithCompletionHandler:]";
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s", buf, 0x3Au);
    }
  }
  uint64_t v30 = 0;
  if (self->_state)
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v30, 32016, 6, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1340), @"Bad API usage", @"Start called while media stream is running or starting");
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_36;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      int state = self->_state;
      *(_DWORD *)buf = 136315906;
      uint64_t v32 = v10;
      __int16 v33 = 2080;
      long long v34 = "-[VCMediaStream startWithCompletionHandler:]";
      __int16 v35 = 1024;
      int v36 = 1343;
      __int16 v37 = 1024;
      LODWORD(v38) = state;
      __int16 v13 = "VCMediaStream [%s] %s:%d Start called while media stream is running (state=%d)";
      uint64_t v14 = v11;
      uint32_t v15 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_36;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      int v18 = self->_state;
      *(_DWORD *)buf = 136316418;
      uint64_t v32 = v16;
      __int16 v33 = 2080;
      long long v34 = "-[VCMediaStream startWithCompletionHandler:]";
      __int16 v35 = 1024;
      int v36 = 1343;
      __int16 v37 = 2112;
      uint64_t v38 = v8;
      __int16 v39 = 2048;
      int v40 = self;
      __int16 v41 = 1024;
      *(_DWORD *)long long v42 = v18;
      __int16 v13 = "VCMediaStream [%s] %s:%d %@(%p) Start called while media stream is running (state=%d)";
      uint64_t v14 = v17;
      uint32_t v15 = 54;
    }
LABEL_35:
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_36:
    pthread_mutex_unlock(&self->_streamLock);
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v30);
    return;
  }
  [(VCMediaStream *)self startMediaTransportsWithError:&v30];
  if (v30)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_36;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      __int16 v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v32 = v25;
      __int16 v33 = 2080;
      long long v34 = "-[VCMediaStream startWithCompletionHandler:]";
      __int16 v35 = 1024;
      int v36 = 1351;
      __int16 v13 = "VCMediaStream [%s] %s:%d Failed to start media stream transports";
      uint64_t v14 = v26;
      uint32_t v15 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_36;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      uint64_t v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v32 = v27;
      __int16 v33 = 2080;
      long long v34 = "-[VCMediaStream startWithCompletionHandler:]";
      __int16 v35 = 1024;
      int v36 = 1351;
      __int16 v37 = 2112;
      uint64_t v38 = v9;
      __int16 v39 = 2048;
      int v40 = self;
      __int16 v13 = "VCMediaStream [%s] %s:%d %@(%p) Failed to start media stream transports";
      uint64_t v14 = v28;
      uint32_t v15 = 48;
    }
    goto LABEL_35;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__VCMediaStream_startWithCompletionHandler___block_invoke;
  v29[3] = &unk_1E6DB5860;
  v29[4] = self;
  v29[5] = a3;
  [(VCMediaStream *)self setState:1];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCMediaStream-onStart");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      int64_t streamToken = self->_streamToken;
      int operatingMode = self->_operatingMode;
      *(_DWORD *)buf = 136316674;
      uint64_t v32 = v19;
      __int16 v33 = 2080;
      long long v34 = "-[VCMediaStream startWithCompletionHandler:]";
      __int16 v35 = 1024;
      int v36 = 1382;
      __int16 v37 = 2112;
      uint64_t v38 = v22;
      __int16 v39 = 2048;
      int v40 = self;
      __int16 v41 = 1024;
      *(_DWORD *)long long v42 = streamToken;
      v42[2] = 1024;
      *(_DWORD *)&v42[3] = operatingMode;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d @:@ VCMediaStream-onStart %@ (%p) streamToken=%d, operatingMode=%d", buf, 0x3Cu);
    }
  }
  [(VCMediaStream *)self registerQoSReportingSource];
  [(VCMediaStream *)self onStartWithCompletionHandler:v29];
  pthread_mutex_unlock(&self->_streamLock);
}

uint64_t __44__VCMediaStream_startWithCompletionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 176));
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(_DWORD *)(v6 + 408);
  if (v7 == 3 || v7 == 0)
  {
    uint64_t v9 = (pthread_mutex_t *)(v6 + 176);
    return pthread_mutex_unlock(v9);
  }
  else
  {
    if (a2)
    {
      if (*(void *)(v6 + 584))
      {
        [*(id *)(v6 + 584) start];
      }
      else
      {
        [(id)v6 createNWMonitor];
        [*(id *)(a1 + 32) handleStartDidSucceed:1 withError:0];
      }
      [*(id *)(a1 + 32) reportTransportInfo];
    }
    else
    {
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __44__VCMediaStream_startWithCompletionHandler___block_invoke_cold_1();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v11 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          int v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          __int16 v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = *(void *)(a1 + 32);
            int v16 = 136316162;
            uint64_t v17 = v12;
            __int16 v18 = 2080;
            uint64_t v19 = "-[VCMediaStream startWithCompletionHandler:]_block_invoke";
            __int16 v20 = 1024;
            int v21 = 1373;
            __int16 v22 = 2112;
            uint64_t v23 = v11;
            __int16 v24 = 2048;
            uint64_t v25 = v15;
            _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to start media", (uint8_t *)&v16, 0x30u);
          }
        }
      }
      [*(id *)(a1 + 32) handleStartDidSucceed:0 withError:a3];
    }
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      return pthread_mutex_unlock((pthread_mutex_t *)(v14 + 176));
    }
  }
  return result;
}

- (void)setState:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t state = self->_state;
  if (state != a3)
  {
    uint64_t v4 = *(void *)&a3;
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)uint64_t v14 = 136316162;
      *(void *)&v14[4] = v7;
      *(_WORD *)&v14[12] = 2080;
      *(void *)&v14[14] = "-[VCMediaStream setState:]";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 1393;
      WORD2(v15) = 2080;
      *(void *)((char *)&v15 + 6) = [(VCMediaStream *)self streamStateToString:state];
      HIWORD(v15) = 2080;
      int v16 = [(VCMediaStream *)self streamStateToString:v4];
      uint64_t v9 = "VCMediaStream [%s] %s:%d Exiting state:%s Entering state:%s";
      uint64_t v10 = v8;
      uint32_t v11 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)uint64_t v14 = 136316674;
      *(void *)&v14[4] = v12;
      *(_WORD *)&v14[12] = 2080;
      *(void *)&v14[14] = "-[VCMediaStream setState:]";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 1393;
      WORD2(v15) = 2112;
      *(void *)((char *)&v15 + 6) = v6;
      HIWORD(v15) = 2048;
      int v16 = (char *)self;
      *(_WORD *)uint64_t v17 = 2080;
      *(void *)&v17[2] = [(VCMediaStream *)self streamStateToString:state];
      *(_WORD *)&v17[10] = 2080;
      *(void *)&v17[12] = [(VCMediaStream *)self streamStateToString:v4];
      uint64_t v9 = "VCMediaStream [%s] %s:%d %@(%p) Exiting state:%s Entering state:%s";
      uint64_t v10 = v13;
      uint32_t v11 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v14, v11);
LABEL_13:
    -[VCMediaStream willExitState:newState:](self, "willExitState:newState:", state, v4, *(_OWORD *)v14, *(void *)&v14[16], v15, v16, *(_OWORD *)v17, *(void *)&v17[16], v18);
    self->_uint64_t state = v4;
    [(VCMediaStream *)self didEnterState:v4 oldState:state];
  }
}

- (void)handleStartDidSucceed:(BOOL)a3 withError:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_state != 1)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t state = (__CFString *)self->_state;
      int v17 = 136316162;
      uint64_t v18 = v8;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCMediaStream handleStartDidSucceed:withError:]";
      __int16 v21 = 1024;
      int v22 = 1411;
      __int16 v23 = 2048;
      __int16 v24 = state;
      __int16 v25 = 2112;
      uint64_t v26 = self;
      uint32_t v11 = "VCMediaStream [%s] %s:%d Ignoring Link connected event on stream with _state=%lu self=%@";
      uint64_t v12 = v9;
      uint32_t v13 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      long long v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v16 = self->_state;
      int v17 = 136316674;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCMediaStream handleStartDidSucceed:withError:]";
      __int16 v21 = 1024;
      int v22 = 1411;
      __int16 v23 = 2112;
      __int16 v24 = v7;
      __int16 v25 = 2048;
      uint64_t v26 = self;
      __int16 v27 = 2048;
      uint64_t v28 = v16;
      __int16 v29 = 2112;
      uint64_t v30 = self;
      uint32_t v11 = "VCMediaStream [%s] %s:%d %@(%p) Ignoring Link connected event on stream with _state=%lu self=%@";
      uint64_t v12 = v15;
      uint32_t v13 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
    return;
  }
  BOOL v6 = a3;

  if (v6)
  {
    [(VCMediaStream *)self startRTCPSendHeartbeat];
    [(VCMediaStream *)self startTimeoutHeartbeat];
    [(VCMediaStream *)self setState:2];
  }
  else
  {
    self->_stopError = (NSError *)a4;
    [(VCMediaStream *)self stopInternalWithHandler:0];
  }
}

- (void)notifyDelegateDidReceiveRTCPPackets:(_RTCPPacketList *)a3
{
  v11[7] = *MEMORY[0x1E4F143B8];
  id v5 = [(VCMediaStream *)self copyDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a3->var1)
    {
      int v7 = 0;
      do
      {
        uint64_t v8 = a3->var2[(char)v7];
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 length:RTCPPacketByteSize((uint64_t)v8)];
        [v6 addObject:v9];

        ++v7;
      }
      while (a3->var1 > (char)v7);
    }
    delegateNotificationQueue = self->_delegateNotificationQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __53__VCMediaStream_notifyDelegateDidReceiveRTCPPackets___block_invoke;
    v11[3] = &unk_1E6DB43D8;
    void v11[4] = v5;
    v11[5] = self;
    v11[6] = v6;
    dispatch_async(delegateNotificationQueue, v11);
  }
}

uint64_t __53__VCMediaStream_notifyDelegateDidReceiveRTCPPackets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) vcMediaStream:*(void *)(a1 + 40) didReceiveRTCPPackets:*(void *)(a1 + 48)];
}

- (BOOL)startMediaTransportsWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  transportArray = self->_transportArray;
  uint64_t v6 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(transportArray);
        }
        int v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) onStart];
        if (v10 < 0)
        {
          +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32013, v10, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1457), @"Unable to start media stream transport", @"Internal error");
          [(VCMediaStream *)self stopMediaTransports];
          return 0;
        }
      }
      uint64_t v7 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (void)stopMediaTransports
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  transportArray = self->_transportArray;
  uint64_t v3 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(transportArray);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) onStop];
      }
      uint64_t v4 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
}

- (id)stop
{
  return [(VCMediaStream *)self stopWithError:0];
}

- (id)stopWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3052000000;
  long long v13 = __Block_byref_object_copy__23;
  long long v14 = __Block_byref_object_dispose__23;
  uint64_t v15 = 0;
  self->_stopError = (NSError *)a3;
  uint64_t v4 = dispatch_semaphore_create(0);
  [(VCObject *)self startTimeoutTimer];
  pthread_mutex_lock(&self->_streamLock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __31__VCMediaStream_stopWithError___block_invoke;
  v9[3] = &unk_1E6DB7D30;
  v9[5] = v4;
  v9[6] = &v10;
  v9[4] = self;
  [(VCMediaStream *)self stopInternalWithHandler:v9];
  pthread_mutex_unlock(&self->_streamLock);
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream stopWithError:]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v11 + 5, 32037, 0, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1494), @"Media stream stop time out", @"Time out");
    VCUtil_GenerateDiagnostics(0, 1, "Media stream stop time out", 1u);
    id v6 = (id)v11[5];
  }
  dispatch_release(v4);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

intptr_t __31__VCMediaStream_stopWithError___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      long long v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class()) {
          long long v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          long long v9 = "<nil>";
        }
        uint64_t v18 = *(void *)(a1 + 32);
        int v20 = 136316674;
        uint64_t v21 = v7;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCMediaStream stopWithError:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 1483;
        __int16 v26 = 2080;
        __int16 v27 = (void *)v9;
        __int16 v28 = 2048;
        uint64_t v29 = v18;
        __int16 v30 = 1024;
        *(_DWORD *)uint64_t v31 = a2;
        *(_WORD *)&v31[4] = 2112;
        *(void *)&v31[6] = a3;
        uint64_t v15 = "VCMediaStream [%s] %s:%d %s[%p] Executing stop completion handler, succeeded=%d error=%@";
        uint64_t v16 = v8;
        uint32_t v17 = 64;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        if (objc_opt_class()) {
          long long v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          long long v13 = "<nil>";
        }
        uint64_t v14 = *(void *)(a1 + 32);
        int v20 = 136317186;
        uint64_t v21 = v10;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCMediaStream stopWithError:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 1483;
        __int16 v26 = 2112;
        __int16 v27 = v6;
        __int16 v28 = 2048;
        uint64_t v29 = v12;
        __int16 v30 = 2080;
        *(void *)uint64_t v31 = v13;
        *(_WORD *)&v31[8] = 2048;
        *(void *)&v31[10] = v14;
        __int16 v32 = 1024;
        int v33 = a2;
        __int16 v34 = 2112;
        __int16 v35 = a3;
        uint64_t v15 = "VCMediaStream [%s] %s:%d %@(%p) %s[%p] Executing stop completion handler, succeeded=%d error=%@";
        uint64_t v16 = v11;
        uint32_t v17 = 84;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)stopInternalWithHandler:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int state = self->_state;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        long long v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        long long v8 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v24 = v6;
      __int16 v25 = 2080;
      __int16 v26 = "-[VCMediaStream stopInternalWithHandler:]";
      __int16 v27 = 1024;
      int v28 = 1508;
      __int16 v29 = 2080;
      __int16 v30 = (void *)v8;
      __int16 v31 = 2048;
      __int16 v32 = self;
      __int16 v33 = 2080;
      __int16 v34 = "-[VCMediaStream stopInternalWithHandler:]";
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s", buf, 0x3Au);
    }
  }
  int v9 = self->_state;
  if (v9 != 3 && v9 != 0)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __41__VCMediaStream_stopInternalWithHandler___block_invoke;
    v21[3] = &unk_1E6DB8348;
    int v22 = state;
    v21[4] = self;
    v21[5] = a3;
    [(VCMediaStream *)self setState:3];
    [(VCMediaStream *)self stopRTCPSendHeartbeat];
    [(VCMediaStream *)self stopTimeoutHeartbeat];
    [(VCMediaStream *)self destroyNWMonitor];
    [(VCMediaStream *)self onStopWithCompletionHandler:v21];
    [(VCMediaStream *)self unregisterStatistics];
    return;
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_23;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    long long v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    int v14 = self->_state;
    *(_DWORD *)buf = 136315906;
    uint64_t v24 = v12;
    __int16 v25 = 2080;
    __int16 v26 = "-[VCMediaStream stopInternalWithHandler:]";
    __int16 v27 = 1024;
    int v28 = 1510;
    __int16 v29 = 1024;
    LODWORD(v30) = v14;
    uint64_t v15 = "VCMediaStream [%s] %s:%d Stop called while media stream is already stopped (state=%d)";
    uint64_t v16 = v13;
    uint32_t v17 = 34;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v11 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
    }
    else {
      long long v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_23;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    __int16 v19 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    int v20 = self->_state;
    *(_DWORD *)buf = 136316418;
    uint64_t v24 = v18;
    __int16 v25 = 2080;
    __int16 v26 = "-[VCMediaStream stopInternalWithHandler:]";
    __int16 v27 = 1024;
    int v28 = 1510;
    __int16 v29 = 2112;
    __int16 v30 = v11;
    __int16 v31 = 2048;
    __int16 v32 = self;
    __int16 v33 = 1024;
    LODWORD(v34) = v20;
    uint64_t v15 = "VCMediaStream [%s] %s:%d %@(%p) Stop called while media stream is already stopped (state=%d)";
    uint64_t v16 = v19;
    uint32_t v17 = 54;
  }
  _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_23:
  [(VCObject *)self stopTimeoutTimer];
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

uint64_t __41__VCMediaStream_stopInternalWithHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      long long v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class()) {
          int v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          int v9 = "<nil>";
        }
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)int v40 = 136316418;
        *(void *)&v40[4] = v7;
        *(_WORD *)&v40[12] = 2080;
        *(void *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
        *(_WORD *)&v40[22] = 1024;
        LODWORD(v41) = 1518;
        WORD2(v41) = 2080;
        *(void *)((char *)&v41 + 6) = v9;
        HIWORD(v41) = 2048;
        uint64_t v42 = v18;
        *(_WORD *)__int16 v43 = 1024;
        *(_DWORD *)&v43[2] = a2;
        uint64_t v15 = "VCMediaStream [%s] %s:%d %s[%p] Executing stop completion handler, stop succeeded[%d]";
        uint64_t v16 = v8;
        uint32_t v17 = 54;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        if (objc_opt_class()) {
          long long v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        }
        else {
          long long v13 = "<nil>";
        }
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)int v40 = 136316930;
        *(void *)&v40[4] = v10;
        *(_WORD *)&v40[12] = 2080;
        *(void *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
        *(_WORD *)&v40[22] = 1024;
        LODWORD(v41) = 1518;
        WORD2(v41) = 2112;
        *(void *)((char *)&v41 + 6) = v6;
        HIWORD(v41) = 2048;
        uint64_t v42 = v12;
        *(_WORD *)__int16 v43 = 2080;
        *(void *)&v43[2] = v13;
        *(_WORD *)&v43[10] = 2048;
        *(void *)&v43[12] = v14;
        *(_WORD *)&v43[20] = 1024;
        *(_DWORD *)&v43[22] = a2;
        uint64_t v15 = "VCMediaStream [%s] %s:%d %@(%p) %s[%p] Executing stop completion handler, stop succeeded[%d]";
        uint64_t v16 = v11;
        uint32_t v17 = 74;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, v40, v17);
      }
    }
  }
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    pthread_mutex_lock((pthread_mutex_t *)(v19 + 176));
  }
  if (a2)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_48;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_48;
      }
      if (objc_opt_class()) {
        uint64_t v24 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v24 = "<nil>";
      }
      uint64_t v36 = *(void *)(a1 + 32);
      *(_DWORD *)int v40 = 136316162;
      *(void *)&v40[4] = v22;
      *(_WORD *)&v40[12] = 2080;
      *(void *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
      *(_WORD *)&v40[22] = 1024;
      LODWORD(v41) = 1522;
      WORD2(v41) = 2080;
      *(void *)((char *)&v41 + 6) = v24;
      HIWORD(v41) = 2048;
      uint64_t v42 = v36;
      __int16 v33 = "VCMediaStream [%s] %s:%d %s[%p] Stopping stream transports";
      __int16 v34 = v23;
      uint32_t v35 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v20 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        int v20 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_48;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      __int16 v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_48;
      }
      uint64_t v27 = *(void *)(a1 + 32);
      if (objc_opt_class()) {
        int v28 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        int v28 = "<nil>";
      }
      uint64_t v32 = *(void *)(a1 + 32);
      *(_DWORD *)int v40 = 136316674;
      *(void *)&v40[4] = v25;
      *(_WORD *)&v40[12] = 2080;
      *(void *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
      *(_WORD *)&v40[22] = 1024;
      LODWORD(v41) = 1522;
      WORD2(v41) = 2112;
      *(void *)((char *)&v41 + 6) = v20;
      HIWORD(v41) = 2048;
      uint64_t v42 = v27;
      *(_WORD *)__int16 v43 = 2080;
      *(void *)&v43[2] = v28;
      *(_WORD *)&v43[10] = 2048;
      *(void *)&v43[12] = v32;
      __int16 v33 = "VCMediaStream [%s] %s:%d %@(%p) %s[%p] Stopping stream transports";
      __int16 v34 = v26;
      uint32_t v35 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, v33, v40, v35);
LABEL_48:
    objc_msgSend(*(id *)(a1 + 32), "stopMediaTransports", *(_OWORD *)v40, *(void *)&v40[16], v41, v42, *(_OWORD *)v43, *(_OWORD *)&v43[16]);
    [*(id *)(*(void *)(a1 + 32) + 584) stop];
    [*(id *)(a1 + 32) setState:0];
    goto LABEL_49;
  }
  [*(id *)(a1 + 32) setState:*(unsigned int *)(a1 + 48)];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __41__VCMediaStream_stopInternalWithHandler___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v21 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      __int16 v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(a1 + 32);
        *(_DWORD *)int v40 = 136316162;
        *(void *)&v40[4] = v29;
        *(_WORD *)&v40[12] = 2080;
        *(void *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
        *(_WORD *)&v40[22] = 1024;
        LODWORD(v41) = 1528;
        WORD2(v41) = 2112;
        *(void *)((char *)&v41 + 6) = v21;
        HIWORD(v41) = 2048;
        uint64_t v42 = v31;
        _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to stop media", v40, 0x30u);
      }
    }
  }
LABEL_49:
  uint64_t v37 = *(void *)(a1 + 32);
  if (v37)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(v37 + 176));
    uint64_t v38 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v38 = 0;
  }
  objc_msgSend(v38, "stopTimeoutTimer", *(void *)v40, *(_OWORD *)&v40[8], v41, v42);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  }
  return result;
}

- (id)setPause:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__23;
  uint64_t v16 = __Block_byref_object_dispose__23;
  uint64_t v17 = 0;
  dispatch_time_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __26__VCMediaStream_setPause___block_invoke;
  void v10[3] = &unk_1E6DB8370;
  BOOL v11 = v3;
  v10[5] = v5;
  v10[6] = &v12;
  v10[4] = self;
  [(VCMediaStream *)self setPause:v3 withCompletionHandler:v10];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream setPause:]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v13 + 5, 32037, 0, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1561), @"Media stream pause time out", @"Time out");
    VCUtil_GenerateDiagnostics(0, 1, "Media stream pause time out", 1u);
    id v7 = (id)v13[5];
  }
  dispatch_release(v5);
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v8;
}

intptr_t __26__VCMediaStream_setPause___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    id v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        id v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        id v8 = "<nil>";
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = *(unsigned __int8 *)(a1 + 56);
      int v12 = 136316930;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCMediaStream setPause:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1550;
      __int16 v18 = 2080;
      uint64_t v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = v9;
      __int16 v22 = 1024;
      int v23 = v10;
      __int16 v24 = 1024;
      int v25 = a2;
      __int16 v26 = 2112;
      uint64_t v27 = a3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] setPause=%d completed success=%d error=%@", (uint8_t *)&v12, 0x46u);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)getInvalidParamErrorForSetPause:(BOOL)a3 didSucceed:(BOOL)a4
{
  BOOL v4 = a3;
  *(void *)&v35[11] = *MEMORY[0x1E4F143B8];
  id v24 = 0;
  if (a4)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return v24;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v24;
      }
      int state = self->_state;
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = v15;
      __int16 v27 = 2080;
      uint64_t v28 = "-[VCMediaStream getInvalidParamErrorForSetPause:didSucceed:]";
      __int16 v29 = 1024;
      int v30 = 1574;
      __int16 v31 = 1024;
      *(_DWORD *)uint64_t v32 = v4;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = state;
      __int16 v18 = "VCMediaStream [%s] %s:%d setPause=%d called while in same state=%d already";
      uint64_t v19 = v16;
      uint32_t v20 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v14 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return v24;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v24;
      }
      int v23 = self->_state;
      *(_DWORD *)buf = 136316674;
      uint64_t v26 = v21;
      __int16 v27 = 2080;
      uint64_t v28 = "-[VCMediaStream getInvalidParamErrorForSetPause:didSucceed:]";
      __int16 v29 = 1024;
      int v30 = 1574;
      __int16 v31 = 2112;
      *(void *)uint64_t v32 = v14;
      *(_WORD *)&v32[8] = 2048;
      __int16 v33 = self;
      __int16 v34 = 1024;
      *(_DWORD *)uint32_t v35 = v4;
      v35[2] = 1024;
      *(_DWORD *)&v35[3] = v23;
      __int16 v18 = "VCMediaStream [%s] %s:%d %@(%p) setPause=%d called while in same state=%d already";
      uint64_t v19 = v22;
      uint32_t v20 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    return v24;
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1578);
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v24, 32016, 115, v6, @"Bad API usage", objc_msgSend(NSString, "stringWithFormat:", @"Trying to set pause=%d while the media stream is in state=%d", v4, self->_state));
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStream getInvalidParamErrorForSetPause:didSucceed:](v8, &v24, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v7 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
    }
    else {
      id v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      BOOL v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        if (v24) {
          uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(v24, "description"), "UTF8String");
        }
        else {
          uint64_t v13 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v26 = v10;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCMediaStream getInvalidParamErrorForSetPause:didSucceed:]";
        __int16 v29 = 1024;
        int v30 = 1581;
        __int16 v31 = 2112;
        *(void *)uint64_t v32 = v7;
        *(_WORD *)&v32[8] = 2048;
        __int16 v33 = self;
        __int16 v34 = 2080;
        *(void *)uint32_t v35 = v13;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) error=%s", buf, 0x3Au);
      }
    }
  }
  return v24;
}

- (void)setPause:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v5 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v9 = "<nil>";
      }
      BOOL v10 = self->_state == 4;
      *(_DWORD *)buf = 136316674;
      uint64_t v25 = v7;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCMediaStream setPause:withCompletionHandler:]";
      __int16 v28 = 1024;
      int v29 = 1588;
      __int16 v30 = 2080;
      __int16 v31 = v9;
      __int16 v32 = 2048;
      __int16 v33 = self;
      __int16 v34 = 1024;
      BOOL v35 = v10;
      __int16 v36 = 1024;
      BOOL v37 = v5;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] setPause (was %d is %d)", buf, 0x3Cu);
    }
  }
  int state = self->_state;
  if (v5)
  {
    if ((state - 1) < 2)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2;
      v20[3] = &unk_1E6DB5860;
      v20[4] = self;
      v20[5] = a4;
      [(VCMediaStream *)self onPauseWithCompletionHandler:v20];
LABEL_14:
      pthread_mutex_unlock(&self->_streamLock);
      return;
    }
    BOOL v12 = state == 4;
    pthread_mutex_unlock(&self->_streamLock);
    delegateNotificationQueue = self->_delegateNotificationQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __48__VCMediaStream_setPause_withCompletionHandler___block_invoke;
    v21[3] = &unk_1E6DB8398;
    BOOL v22 = v5;
    BOOL v23 = v12;
    v21[4] = self;
    v21[5] = a4;
    __int16 v14 = v21;
  }
  else
  {
    if (state == 4)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_176;
      v16[3] = &unk_1E6DB5860;
      v16[4] = self;
      v16[5] = a4;
      [(VCMediaStream *)self onResumeWithCompletionHandler:v16];
      goto LABEL_14;
    }
    BOOL v15 = state == 2;
    pthread_mutex_unlock(&self->_streamLock);
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_175;
    block[3] = &unk_1E6DB8398;
    char v18 = 0;
    BOOL v19 = v15;
    block[4] = self;
    block[5] = a4;
    __int16 v14 = block;
  }
  dispatch_async(delegateNotificationQueue, v14);
}

uint64_t __48__VCMediaStream_setPause_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) getInvalidParamErrorForSetPause:*(unsigned __int8 *)(a1 + 48) didSucceed:*(unsigned __int8 *)(a1 + 49)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 176));
  }
  if (a2)
  {
    [*(id *)(a1 + 32) setState:4];
  }
  else if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 136316162;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCMediaStream setPause:withCompletionHandler:]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 1604;
        __int16 v17 = 2112;
        char v18 = v5;
        __int16 v19 = 2048;
        uint64_t v20 = v10;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Error pausing media", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    pthread_mutex_unlock((pthread_mutex_t *)(v8 + 176));
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_175(uint64_t a1)
{
  [*(id *)(a1 + 32) getInvalidParamErrorForSetPause:*(unsigned __int8 *)(a1 + 48) didSucceed:*(unsigned __int8 *)(a1 + 49)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_176(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 176));
  }
  BOOL v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [v5 setState:2];
  }
  else
  {
    [v5 setState:4];
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_176_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          int v12 = 136316162;
          uint64_t v13 = v7;
          __int16 v14 = 2080;
          __int16 v15 = "-[VCMediaStream setPause:withCompletionHandler:]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 1627;
          __int16 v18 = 2112;
          __int16 v19 = v6;
          __int16 v20 = 2048;
          uint64_t v21 = v11;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Error resuming media", (uint8_t *)&v12, 0x30u);
        }
      }
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    pthread_mutex_unlock((pthread_mutex_t *)(v9 + 176));
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)setLocalParticipantInfo:(id)a3 networkSockets:(id)a4 withError:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  self->_callID = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamCallID"];
  [(VCMediaStream *)self onCallIDChanged];
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamClientPID"]) {
    self->_clientPID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamClientPID"), "intValue");
  }
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamRemoteEndpointInfo"]) {
    self->_remoteEndpointInfo = -[VCCallInfoBlob initWithData:]([VCCallInfoBlob alloc], "initWithData:", [a3 objectForKeyedSubscript:@"vcMediaStreamRemoteEndpointInfo"]);
  }
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamClientName"]) {
    self->_clientName = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamClientName"];
  }
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamClientSessionID"]) {
    self->_clientSessionID = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamClientSessionID"];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
      {
        uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        if (a3) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v11 = "<nil>";
        if (a3)
        {
LABEL_13:
          int v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
          if (a4)
          {
LABEL_14:
            uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_18:
            callID = self->_callID;
            if (callID) {
              __int16 v15 = [[(NSString *)callID description] UTF8String];
            }
            else {
              __int16 v15 = "<nil>";
            }
            int v17 = 136316930;
            uint64_t v18 = v9;
            __int16 v19 = 2080;
            __int16 v20 = "-[VCMediaStream setLocalParticipantInfo:networkSockets:withError:]";
            __int16 v21 = 1024;
            int v22 = 1659;
            __int16 v23 = 2080;
            id v24 = v11;
            __int16 v25 = 2048;
            __int16 v26 = self;
            __int16 v27 = 2080;
            __int16 v28 = v12;
            __int16 v29 = 2080;
            __int16 v30 = v13;
            __int16 v31 = 2080;
            __int16 v32 = v15;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] infoDict = %s networkSockets = %s callID = %s", (uint8_t *)&v17, 0x4Eu);
            goto LABEL_22;
          }
LABEL_17:
          uint64_t v13 = "<nil>";
          goto LABEL_18;
        }
      }
      int v12 = "<nil>";
      if (a4) {
        goto LABEL_14;
      }
      goto LABEL_17;
    }
  }
LABEL_22:
  if (a4) {
    return [(VCMediaStream *)self setupRTPWithSocketDictionary:a4 error:a5];
  }
  else {
    return [(VCMediaStream *)self setupRTPWithLocalParticipantInfo:a3 error:a5];
  }
}

- (void)setStreamDirection:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v19 = v5;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCMediaStream setStreamDirection:]";
      __int16 v22 = 1024;
      int v23 = 1672;
      __int16 v24 = 2080;
      __int16 v25 = v7;
      __int16 v26 = 2048;
      __int16 v27 = self;
      __int16 v28 = 2080;
      __int16 v29 = "-[VCMediaStream setStreamDirection:]";
      __int16 v30 = 1024;
      int v31 = [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] streamDirection];
      __int16 v32 = 1024;
      int v33 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s was[%d] now[%d]", buf, 0x46u);
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  transportArray = self->_transportArray;
  uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(transportArray);
      }
      [*(id *)(*((void *)&v14 + 1) + 8 * i) setStreamDirection:a3];
    }
    uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v14 objects:v13 count:16];
  }
  while (v10);
  if (self) {
LABEL_17:
  }
    pthread_mutex_unlock(&self->_streamLock);
}

- (int64_t)streamDirection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  int64_t v3 = [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] streamDirection];
  if (self) {
    pthread_mutex_unlock(&self->_streamLock);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v6 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v6 = "<nil>";
      }
      int v8 = 136316674;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCMediaStream streamDirection]";
      __int16 v12 = 1024;
      int v13 = 1688;
      __int16 v14 = 2080;
      long long v15 = v6;
      __int16 v16 = 2048;
      long long v17 = self;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCMediaStream streamDirection]";
      __int16 v20 = 2048;
      int64_t v21 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s streamDirection[%ld]", (uint8_t *)&v8, 0x44u);
    }
  }
  return v3;
}

- (void)sendControlPacketWithParameters:(_RTCP_SEND_CONTROL_PARAMETERS *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VCMediaStream *)self compoundStreamIDs];
  a3->uint64_t var18 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      unsigned __int16 v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) unsignedShortValue];
      uint64_t var18 = a3->var18;
      a3->uint64_t var18 = var18 + 1;
      a3->var17[var18] = v10;
      if ((var18 + 1) == 12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] sendControlPacketWithParameters:a3];
}

- (void)setRtcpEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v21 = v5;
      __int16 v22 = 2080;
      int v23 = "-[VCMediaStream setRtcpEnabled:]";
      __int16 v24 = 1024;
      int v25 = 1706;
      __int16 v26 = 2080;
      __int16 v27 = v7;
      __int16 v28 = 2048;
      __int16 v29 = self;
      __int16 v30 = 2080;
      int v31 = "-[VCMediaStream setRtcpEnabled:]";
      __int16 v32 = 1024;
      BOOL v33 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtcpEnabled[%d]", buf, 0x40u);
    }
  }
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  transportArray = self->_transportArray;
  uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(transportArray);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) setRtcpEnabled:v3];
      }
      uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v10);
  }
  int state = self->_state;
  if (state) {
    BOOL v14 = state == 3;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    if (v3) {
      [(VCMediaStream *)self startRTCPSendHeartbeat];
    }
    else {
      [(VCMediaStream *)self stopRTCPSendHeartbeat];
    }
  }
  pthread_mutex_unlock(&self->_streamLock);
}

- (BOOL)isRTPTimeoutEnabled
{
  v2 = [(VCMediaStream *)self defaultTransport];

  return [(VCMediaStreamTransport *)v2 isRTPTimeoutEnabled];
}

- (BOOL)isRTCPTimeoutEnabled
{
  v2 = [(VCMediaStream *)self defaultTransport];

  return [(VCMediaStreamTransport *)v2 isRTCPTimeoutEnabled];
}

- (BOOL)isDecryptionTimeoutEnabled
{
  v2 = [(VCMediaStream *)self defaultTransport];

  return [(VCMediaStreamTransport *)v2 isDecryptionTimeoutEnabled];
}

- (BOOL)isRTCPSendEnabled
{
  v2 = [(VCMediaStream *)self defaultTransport];

  return [(VCMediaStreamTransport *)v2 isRTCPSendEnabled];
}

- (void)processRTPTimeoutSettingChange
{
  BOOL v3 = [(VCMediaStream *)self isRTPTimeoutEnabled];
  int state = self->_state;
  if (state) {
    BOOL v5 = state == 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (v3)
    {
      [(VCMediaStream *)self startTimeoutHeartbeat];
    }
    else
    {
      [(VCMediaStream *)self stopTimeoutHeartbeat];
    }
  }
}

- (void)processRTCPTimeoutSettingChange
{
  BOOL v3 = [(VCMediaStream *)self isRTCPTimeoutEnabled];
  int state = self->_state;
  if (state) {
    BOOL v5 = state == 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (v3)
    {
      [(VCMediaStream *)self startTimeoutHeartbeat];
    }
    else
    {
      [(VCMediaStream *)self stopTimeoutHeartbeat];
    }
  }
}

- (void)processDecryptionTimeoutSettingChange
{
  BOOL v3 = [(VCMediaStream *)self isDecryptionTimeoutEnabled];
  int state = self->_state;
  if (state) {
    BOOL v5 = state == 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (v3)
    {
      [(VCMediaStream *)self startTimeoutHeartbeat];
    }
    else
    {
      [(VCMediaStream *)self stopTimeoutHeartbeat];
    }
  }
}

- (void)setRtpTimeOutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      int v25 = "-[VCMediaStream setRtpTimeOutEnabled:]";
      __int16 v26 = 1024;
      int v27 = 1774;
      __int16 v28 = 2080;
      __int16 v29 = v7;
      __int16 v30 = 2048;
      int v31 = self;
      __int16 v32 = 2080;
      BOOL v33 = "-[VCMediaStream setRtpTimeOutEnabled:]";
      __int16 v34 = 1024;
      BOOL v35 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtpTimeOutEnabled[%d]", buf, 0x40u);
    }
  }
  uint64_t v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  transportArray = self->_transportArray;
  uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (!v10)
  {
    [(VCMediaStream *)self processRTPTimeoutSettingChange];
LABEL_22:
    pthread_mutex_unlock((pthread_mutex_t *)((char *)self + v8[246]));
    return;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(transportArray);
      }
      BOOL v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      char v15 = [v14 isRTPTimeoutEnabled];
      [v14 setRtpTimeoutEnabled:v3];
      int v16 = [v14 isRTPTimeoutEnabled];
      if ((v15 & 1) == 0)
      {
        if (v16) {
          self->_rtpTimeoutEnabledTime = NAN;
        }
      }
    }
    uint64_t v11 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v18 objects:v17 count:16];
  }
  while (v11);
  [(VCMediaStream *)self processRTPTimeoutSettingChange];
  uint64_t v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
  if (self) {
    goto LABEL_22;
  }
}

- (void)setRtcpTimeOutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      int v25 = "-[VCMediaStream setRtcpTimeOutEnabled:]";
      __int16 v26 = 1024;
      int v27 = 1797;
      __int16 v28 = 2080;
      __int16 v29 = v7;
      __int16 v30 = 2048;
      int v31 = self;
      __int16 v32 = 2080;
      BOOL v33 = "-[VCMediaStream setRtcpTimeOutEnabled:]";
      __int16 v34 = 1024;
      BOOL v35 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtcpTimeOutEnabled[%d]", buf, 0x40u);
    }
  }
  uint64_t v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  transportArray = self->_transportArray;
  uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (!v10)
  {
    [(VCMediaStream *)self processRTCPTimeoutSettingChange];
LABEL_22:
    pthread_mutex_unlock((pthread_mutex_t *)((char *)self + v8[246]));
    return;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(transportArray);
      }
      BOOL v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      char v15 = [v14 isRTCPTimeoutEnabled];
      [v14 setRtcpTimeoutEnabled:v3];
      int v16 = [v14 isRTCPTimeoutEnabled];
      if ((v15 & 1) == 0)
      {
        if (v16) {
          self->_rtcpTimeoutEnabledTime = NAN;
        }
      }
    }
    uint64_t v11 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v18 objects:v17 count:16];
  }
  while (v11);
  [(VCMediaStream *)self processRTCPTimeoutSettingChange];
  uint64_t v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
  if (self) {
    goto LABEL_22;
  }
}

- (void)setDecryptionTimeOutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      int v25 = "-[VCMediaStream setDecryptionTimeOutEnabled:]";
      __int16 v26 = 1024;
      int v27 = 1820;
      __int16 v28 = 2080;
      __int16 v29 = v7;
      __int16 v30 = 2048;
      int v31 = self;
      __int16 v32 = 2080;
      BOOL v33 = "-[VCMediaStream setDecryptionTimeOutEnabled:]";
      __int16 v34 = 1024;
      BOOL v35 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s decryptionTimeOutEnabled[%d]", buf, 0x40u);
    }
  }
  uint64_t v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  transportArray = self->_transportArray;
  uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (!v10)
  {
    [(VCMediaStream *)self processDecryptionTimeoutSettingChange];
LABEL_22:
    pthread_mutex_unlock((pthread_mutex_t *)((char *)self + v8[246]));
    return;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(transportArray);
      }
      BOOL v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      char v15 = [v14 isDecryptionTimeoutEnabled];
      [v14 setDecryptionTimeoutEnabled:v3];
      int v16 = [v14 isDecryptionTimeoutEnabled];
      if ((v15 & 1) == 0)
      {
        if (v16) {
          self->_decryptionTimeoutEnabledTime = NAN;
        }
      }
    }
    uint64_t v11 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v18 objects:v17 count:16];
  }
  while (v11);
  [(VCMediaStream *)self processDecryptionTimeoutSettingChange];
  uint64_t v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
  if (self) {
    goto LABEL_22;
  }
}

- (void)setRtpTimeOutInterval:(double)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCMediaStream setRtpTimeOutInterval:]";
      __int16 v25 = 1024;
      int v26 = 1843;
      __int16 v27 = 2080;
      __int16 v28 = v7;
      __int16 v29 = 2048;
      __int16 v30 = self;
      __int16 v31 = 2080;
      __int16 v32 = "-[VCMediaStream setRtpTimeOutInterval:]";
      __int16 v33 = 2048;
      double v34 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtpTimeOutInterval[%f]", buf, 0x44u);
    }
  }
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  transportArray = self->_transportArray;
  uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (!v9)
  {
    [(VCMediaStream *)self processRTPTimeoutSettingChange];
LABEL_22:
    pthread_mutex_unlock(&self->_streamLock);
    return;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(transportArray);
      }
      long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      char v14 = [v13 isRTPTimeoutEnabled];
      [v13 setRtpTimeoutInterval:a3];
      int v15 = [v13 isRTPTimeoutEnabled];
      if ((v14 & 1) == 0)
      {
        if (v15) {
          self->_rtpTimeoutEnabledTime = NAN;
        }
      }
    }
    uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v17 objects:v16 count:16];
  }
  while (v10);
  [(VCMediaStream *)self processRTPTimeoutSettingChange];
  if (self) {
    goto LABEL_22;
  }
}

- (void)setRtcpTimeOutInterval:(double)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCMediaStream setRtcpTimeOutInterval:]";
      __int16 v25 = 1024;
      int v26 = 1866;
      __int16 v27 = 2080;
      __int16 v28 = v7;
      __int16 v29 = 2048;
      __int16 v30 = self;
      __int16 v31 = 2080;
      __int16 v32 = "-[VCMediaStream setRtcpTimeOutInterval:]";
      __int16 v33 = 2048;
      double v34 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtcpTimeOutInterval[%f]", buf, 0x44u);
    }
  }
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  transportArray = self->_transportArray;
  uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (!v9)
  {
    [(VCMediaStream *)self processRTCPTimeoutSettingChange];
LABEL_22:
    pthread_mutex_unlock(&self->_streamLock);
    return;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(transportArray);
      }
      long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      char v14 = [v13 isRTCPTimeoutEnabled];
      [v13 setRtcpTimeoutInterval:a3];
      int v15 = [v13 isRTCPTimeoutEnabled];
      if ((v14 & 1) == 0)
      {
        if (v15) {
          self->_rtcpTimeoutEnabledTime = NAN;
        }
      }
    }
    uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v17 objects:v16 count:16];
  }
  while (v10);
  [(VCMediaStream *)self processRTCPTimeoutSettingChange];
  if (self) {
    goto LABEL_22;
  }
}

- (void)setDecryptionTimeOutInterval:(double)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCMediaStream setDecryptionTimeOutInterval:]";
      __int16 v25 = 1024;
      int v26 = 1889;
      __int16 v27 = 2080;
      __int16 v28 = v7;
      __int16 v29 = 2048;
      __int16 v30 = self;
      __int16 v31 = 2080;
      __int16 v32 = "-[VCMediaStream setDecryptionTimeOutInterval:]";
      __int16 v33 = 2048;
      double v34 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s decryptionTimeOutInterval[%f]", buf, 0x44u);
    }
  }
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  transportArray = self->_transportArray;
  uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (!v9)
  {
    [(VCMediaStream *)self processDecryptionTimeoutSettingChange];
LABEL_22:
    pthread_mutex_unlock(&self->_streamLock);
    return;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(transportArray);
      }
      long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      char v14 = [v13 isDecryptionTimeoutEnabled];
      VCMediaStreamTransport_SetDecryptionTimeoutInterval((uint64_t)v13, a3);
      int v15 = [v13 isDecryptionTimeoutEnabled];
      if ((v14 & 1) == 0)
      {
        if (v15) {
          self->_decryptionTimeoutEnabledTime = NAN;
        }
      }
    }
    uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v17 objects:v16 count:16];
  }
  while (v10);
  [(VCMediaStream *)self processDecryptionTimeoutSettingChange];
  if (self) {
    goto LABEL_22;
  }
}

- (void)setRtcpSendInterval:(double)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class()) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v21 = v5;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCMediaStream setRtcpSendInterval:]";
      __int16 v24 = 1024;
      int v25 = 1911;
      __int16 v26 = 2080;
      __int16 v27 = v7;
      __int16 v28 = 2048;
      __int16 v29 = self;
      __int16 v30 = 2080;
      __int16 v31 = "-[VCMediaStream setRtcpSendInterval:]";
      __int16 v32 = 2048;
      double v33 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtcpSendInterval[%f]", buf, 0x44u);
    }
  }
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  transportArray = self->_transportArray;
  uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(transportArray);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) setRtcpSendInterval:a3];
      }
      uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v10);
  }
  int state = self->_state;
  if (state) {
    BOOL v14 = state == 3;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    if ([(VCMediaStream *)self isRTCPSendEnabled])
    {
      if (self->_rtcpSendHeartbeat) {
        [(VCMediaStream *)self resetRTCPSendHeartbeatTimer:0];
      }
      else {
        [(VCMediaStream *)self startRTCPSendHeartbeat];
      }
    }
    else
    {
      [(VCMediaStream *)self stopRTCPSendHeartbeat];
    }
  }
  pthread_mutex_unlock(&self->_streamLock);
}

- (void)setBasebandCongestionDetector:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];

  self->_basebandCongestionDetector = (AVCBasebandCongestionDetector *)a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  transportArray = self->_transportArray;
  uint64_t v6 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(transportArray);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) setBasebandCongestionDetector:self->_basebandCongestionDetector];
      }
      uint64_t v7 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
}

- (void)setMediaQueue:(tagVCMediaQueue *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  mediaQueue = self->_mediaQueue;
  if (mediaQueue) {
    CFRelease(mediaQueue);
  }
  if (a3) {
    uint64_t v6 = (tagVCMediaQueue *)CFRetain(a3);
  }
  else {
    uint64_t v6 = 0;
  }
  self->_mediaQueue = v6;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  transportArray = self->_transportArray;
  uint64_t v8 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(transportArray);
        }
        RTPSetVCMediaQueue([*(id *)(*((void *)&v13 + 1) + 8 * i) rtpHandle], self->_mediaQueue);
      }
      uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v9);
  }
}

- (void)applyClientSessionID:(int)a3 clientUserInfo:(id)a4
{
  if (a3 <= 0x16 && ((1 << a3) & 0x5CE100) != 0) {
    [a4 setObject:self->_clientSessionID forKeyedSubscript:@"CLID"];
  }
}

- (RTCPReportProvider)rtcpReportProvider
{
  return (RTCPReportProvider *)[(VCWeakObjectHolder *)self->_rtcpReportProvider strong];
}

- (void)setRtcpReportProvider:(id)a3
{
  self->_rtcpReportProvider = (VCWeakObjectHolder *)(id)[MEMORY[0x1E4F47A30] weakObjectHolderWithObject:a3];
}

- (BOOL)generateReceptionReportList:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  char v7 = *a4;
  *a4 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  transportArray = self->_transportArray;
  uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    BOOL v24 = 0;
    uint64_t v12 = *(void *)v38;
    *(void *)&long long v10 = 136315650;
    long long v22 = v10;
    __int16 v23 = transportArray;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(transportArray);
        }
        long long v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        unsigned __int8 v25 = v7;
        if (objc_msgSend(v14, "generateReceptionReport:reportCount:", a3, &v25, v22))
        {
          unsigned __int8 v15 = v25;
          a3 += v25;
          *a4 += v25;
          v7 -= v15;
          BOOL v24 = 1;
          continue;
        }
        if ((VCMediaStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            continue;
          }
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          long long v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            uint64_t v27 = v19;
            __int16 v28 = 2080;
            __int16 v29 = "-[VCMediaStream generateReceptionReportList:reportCount:]";
            __int16 v30 = 1024;
            int v31 = 2000;
            _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d Failed to generate reception report.", buf, 0x1Cu);
          }
          goto LABEL_18;
        }
        long long v16 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          long long v16 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          long long v18 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v27 = v17;
            __int16 v28 = 2080;
            __int16 v29 = "-[VCMediaStream generateReceptionReportList:reportCount:]";
            __int16 v30 = 1024;
            int v31 = 2000;
            __int16 v32 = 2112;
            double v33 = v16;
            __int16 v34 = 2048;
            uint64_t v35 = self;
            _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to generate reception report.", buf, 0x30u);
          }
LABEL_18:
          transportArray = v23;
          continue;
        }
      }
      uint64_t v11 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v37 objects:v36 count:16];
      if (!v11) {
        return v24;
      }
    }
  }
  return 0;
}

- (unsigned)getRTCPReportNTPTimeMiddle32ForReportId:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(VCMediaStream *)self defaultTransport];

  return [(VCMediaStreamTransport *)v4 getRTCPReportNTPTimeMiddle32ForReportId:v3];
}

- (unsigned)getExtendedSequenceNumberForSequenceNumber:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(VCMediaStream *)self defaultTransport];

  return [(VCMediaStreamTransport *)v4 getExtendedSequenceNumberForSequenceNumber:v3];
}

- (void)resetRTCPSendHeartbeatTimer:(unint64_t)a3
{
  rtcpSendHeartbeat = self->_rtcpSendHeartbeat;
  if (rtcpSendHeartbeat)
  {
    [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtcpSendInterval];
    uint64_t v7 = (unint64_t)(v6 * 1000000000.0);
    [(VCMediaStream *)self rtcpHeartbeatLeeway];
    dispatch_source_set_timer(rtcpSendHeartbeat, a3, v7, (unint64_t)(v8 * 1000000000.0));
  }
}

- (void)rtcpSendHeartbeat
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int state = self->_state;
  if (state == 3 || state == 0)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = v8;
      __int16 v26 = 2080;
      uint64_t v27 = "-[VCMediaStream rtcpSendHeartbeat]";
      __int16 v28 = 1024;
      int v29 = 2029;
      long long v10 = "VCMediaStream [%s] %s:%d RTCP send heartbeat called while the stream has already stopped.";
      uint64_t v11 = v9;
      uint32_t v12 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      long long v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v13;
      __int16 v26 = 2080;
      uint64_t v27 = "-[VCMediaStream rtcpSendHeartbeat]";
      __int16 v28 = 1024;
      int v29 = 2029;
      __int16 v30 = 2112;
      *(void *)int v31 = v5;
      *(_WORD *)&v31[8] = 2048;
      *(void *)&v31[10] = self;
      long long v10 = "VCMediaStream [%s] %s:%d %@(%p) RTCP send heartbeat called while the stream has already stopped.";
      uint64_t v11 = v14;
      uint32_t v12 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    return;
  }
  int v23 = 0;
  double v22 = NAN;
  if ([(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] sendIntervalDidElapse:&v23 remainingTime:&v22])
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_29;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      long long v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v15;
      __int16 v26 = 2080;
      uint64_t v27 = "-[VCMediaStream rtcpSendHeartbeat]";
      __int16 v28 = 1024;
      int v29 = 2040;
      __int16 v30 = 1024;
      *(_DWORD *)int v31 = v23;
      *(_WORD *)&v31[4] = 2048;
      *(double *)&v31[6] = v22;
      uint64_t v17 = "VCMediaStream [%s] %s:%d RTCP HeartBeat intervalElapsed:%d remainingInterval:%.5f";
      long long v18 = v16;
      uint32_t v19 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_29;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v25 = v20;
      __int16 v26 = 2080;
      uint64_t v27 = "-[VCMediaStream rtcpSendHeartbeat]";
      __int16 v28 = 1024;
      int v29 = 2040;
      __int16 v30 = 2112;
      *(void *)int v31 = v7;
      *(_WORD *)&v31[8] = 2048;
      *(void *)&v31[10] = self;
      __int16 v32 = 1024;
      int v33 = v23;
      __int16 v34 = 2048;
      double v35 = v22;
      uint64_t v17 = "VCMediaStream [%s] %s:%d %@(%p) RTCP HeartBeat intervalElapsed:%d remainingInterval:%.5f";
      long long v18 = v21;
      uint32_t v19 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_29:
    if (v23) {
      [(VCMediaStream *)self onSendRTCPPacket];
    }
    else {
      [(VCMediaStream *)self resetRTCPSendHeartbeatTimer:dispatch_time(0, (uint64_t)(v22 * 1000000000.0))];
    }
  }
}

- (void)startRTCPSendHeartbeat
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Error already started", v2, v3, v4, v5, v6);
}

unsigned char *__39__VCMediaStream_startRTCPSendHeartbeat__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 176));
    uint64_t result = *(unsigned char **)(a1 + 32);
  }
  else
  {
    uint64_t result = 0;
  }
  if (result[352] || ([result rtcpSendHeartbeat], (uint64_t result = *(unsigned char **)(a1 + 32)) != 0))
  {
    uint64_t v4 = (pthread_mutex_t *)(result + 176);
    return (unsigned char *)pthread_mutex_unlock(v4);
  }
  return result;
}

- (void)stopRTCPSendHeartbeat
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_rtcpSendHeartbeat)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v12 = 136315650;
      uint64_t v13 = v4;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCMediaStream stopRTCPSendHeartbeat]";
      __int16 v16 = 1024;
      int v17 = 2078;
      uint8_t v6 = "VCMediaStream [%s] %s:%d Tearing down rtcp heartbeat!";
      uint64_t v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v12 = 136316162;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCMediaStream stopRTCPSendHeartbeat]";
      __int16 v16 = 1024;
      int v17 = 2078;
      __int16 v18 = 2112;
      uint32_t v19 = v3;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      uint8_t v6 = "VCMediaStream [%s] %s:%d %@(%p) Tearing down rtcp heartbeat!";
      uint64_t v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v12, v8);
LABEL_13:
    self->_rtcpHeartbeatCancelled = 1;
    dispatch_source_cancel((dispatch_source_t)self->_rtcpSendHeartbeat);
    rtcpSendHeartbeat = self->_rtcpSendHeartbeat;
    if (rtcpSendHeartbeat)
    {
      dispatch_release(rtcpSendHeartbeat);
      self->_rtcpSendHeartbeat = 0;
    }
  }
}

- (void)createNWMonitor
{
  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  if (self->_transportSetupInfo.setupType == 4 && !self->_nwMonitor)
  {
    uint64_t v4 = (tagVCNWConnectionMonitor *)VCNWConnectionMonitor_Create(&self->_transportSetupInfo.var0.transportStreamInfo.context);
    self->_nwMonitor = v4;
    [(VCMediaStream *)self setupCallbacksWithNWConnectionMonitor:v4];
  }

  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (void)destroyNWMonitor
{
  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  nwMonitor = self->_nwMonitor;
  if (nwMonitor)
  {
    VCNWConnectionMonitor_Destroy((uint64_t)nwMonitor);
    self->_nwMonitor = 0;
  }

  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (void)setStreamIDs:(id)a3 repairStreamIDs:(id)a4
{
}

- (void)resetTimeoutHeartbeatTimer:(unint64_t)a3
{
  timeoutHeartbeat = self->_timeoutHeartbeat;
  if (timeoutHeartbeat) {
    dispatch_source_set_timer(timeoutHeartbeat, a3, 0x3B9ACA00uLL, 0x5F5E100uLL);
  }
}

- (void)resetTimeoutHeartbeatWithRTPTimeout:(double)a3 rtcpTimeout:(double)a4 decryptionTimeout:(double)a5 currentTime:(double)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v7 = fmin(fmin(a3, a4), a5);
  if ((VCMediaStream *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_17;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    int v17 = *MEMORY[0x1E4F47A50];
    __int16 v18 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136316674;
        uint64_t v23 = v16;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCMediaStream resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:]";
        __int16 v26 = 1024;
        int v27 = 2130;
        __int16 v28 = 2112;
        double v29 = *(double *)&v9;
        __int16 v30 = 2048;
        double v31 = *(double *)&self;
        __int16 v32 = 2048;
        double v33 = v7;
        __int16 v34 = 2048;
        double v35 = a6;
        uint64_t v13 = "VCMediaStream [%s] %s:%d %@(%p) Schedule next timeout @ %f currentTime:%f";
        __int16 v14 = v17;
        uint32_t v15 = 68;
        goto LABEL_13;
      }
      goto LABEL_17;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    int v22 = 136316674;
    uint64_t v23 = v16;
    __int16 v24 = 2080;
    uint64_t v25 = "-[VCMediaStream resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:]";
    __int16 v26 = 1024;
    int v27 = 2130;
    __int16 v28 = 2112;
    double v29 = *(double *)&v9;
    __int16 v30 = 2048;
    double v31 = *(double *)&self;
    __int16 v32 = 2048;
    double v33 = v7;
    __int16 v34 = 2048;
    double v35 = a6;
    uint32_t v19 = "VCMediaStream [%s] %s:%d %@(%p) Schedule next timeout @ %f currentTime:%f";
    __int16 v20 = v17;
    uint32_t v21 = 68;
LABEL_19:
    _os_log_debug_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v22, v21);
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
    goto LABEL_17;
  }
  uint64_t v10 = VRTraceErrorLogLevelToCSTR();
  uint64_t v11 = *MEMORY[0x1E4F47A50];
  int v12 = *MEMORY[0x1E4F47A50];
  if (!*MEMORY[0x1E4F47A40])
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    int v22 = 136316162;
    uint64_t v23 = v10;
    __int16 v24 = 2080;
    uint64_t v25 = "-[VCMediaStream resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:]";
    __int16 v26 = 1024;
    int v27 = 2130;
    __int16 v28 = 2048;
    double v29 = v7;
    __int16 v30 = 2048;
    double v31 = a6;
    uint32_t v19 = "VCMediaStream [%s] %s:%d Schedule next timeout @ %f currentTime:%f";
    __int16 v20 = v11;
    uint32_t v21 = 48;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136316162;
    uint64_t v23 = v10;
    __int16 v24 = 2080;
    uint64_t v25 = "-[VCMediaStream resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:]";
    __int16 v26 = 1024;
    int v27 = 2130;
    __int16 v28 = 2048;
    double v29 = v7;
    __int16 v30 = 2048;
    double v31 = a6;
    uint64_t v13 = "VCMediaStream [%s] %s:%d Schedule next timeout @ %f currentTime:%f";
    __int16 v14 = v11;
    uint32_t v15 = 48;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v22, v15);
  }
LABEL_17:
  [(VCMediaStream *)self resetTimeoutHeartbeatTimer:dispatch_time(0, (uint64_t)((v7 - a6) * 1000000000.0))];
}

- (double)computeNextTimoutWithEnabledTime:(double)a3 timeoutInterval:(double)a4 lastReceivedPacketTime:(double)a5 currentTime:(double)a6 lastTimeoutReportTime:(double)a7
{
  double v7 = a4 + a5;
  double v8 = fmax(a4 + a5, a7 + 1.0);
  if (a7 != 0.0) {
    double v7 = v8;
  }
  double result = v7;
  if (v7 <= a6) {
    return a6 + 1.0;
  }
  return result;
}

- (void)checkRTPPacketTimeoutAgainstTime:(double)a3 lastReceivedPacketTime:(double)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  double v7 = a3 - self->_rtpTimeoutEnabledTime;
  [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtpTimeoutInterval];
  if (v7 > v8 && a3 - self->_lastRTPTimeoutReportTime > 1.0)
  {
    [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtpTimeoutInterval];
    if (a3 - a4 > v9)
    {
      self->_lastRTPTimeoutReportTime = a3;
      if ((VCMediaStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_13;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v12 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        double rtpTimeoutEnabledTime = self->_rtpTimeoutEnabledTime;
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v11;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCMediaStream checkRTPPacketTimeoutAgainstTime:lastReceivedPacketTime:]";
        __int16 v26 = 1024;
        int v27 = 2174;
        __int16 v28 = 2048;
        double v29 = a4;
        __int16 v30 = 2048;
        double v31 = a3;
        __int16 v32 = 2048;
        double v33 = rtpTimeoutEnabledTime;
        __int16 v14 = "VCMediaStream [%s] %s:%d Last RTP packet receive time:%f now:%f rtpTimeoutEnabledTime=%f";
        uint32_t v15 = v12;
        uint32_t v16 = 58;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          *(double *)&uint64_t v10 = COERCE_DOUBLE([(VCMediaStream *)self performSelector:sel_logPrefix]);
        }
        else {
          *(double *)&uint64_t v10 = COERCE_DOUBLE(&stru_1F3D3E450);
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_13;
        }
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        __int16 v18 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        double v20 = self->_rtpTimeoutEnabledTime;
        *(_DWORD *)buf = 136316930;
        uint64_t v23 = v17;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCMediaStream checkRTPPacketTimeoutAgainstTime:lastReceivedPacketTime:]";
        __int16 v26 = 1024;
        int v27 = 2174;
        __int16 v28 = 2112;
        double v29 = *(double *)&v10;
        __int16 v30 = 2048;
        double v31 = *(double *)&self;
        __int16 v32 = 2048;
        double v33 = a4;
        __int16 v34 = 2048;
        double v35 = a3;
        __int16 v36 = 2048;
        double v37 = v20;
        __int16 v14 = "VCMediaStream [%s] %s:%d %@(%p) Last RTP packet receive time:%f now:%f rtpTimeoutEnabledTime=%f";
        uint32_t v15 = v18;
        uint32_t v16 = 78;
      }
      _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
LABEL_13:
      [(VCMediaStream *)self onRTPTimeout];
      delegateNotificationQueue = self->_delegateNotificationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__VCMediaStream_checkRTPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke;
      block[3] = &unk_1E6DB3DC8;
      block[4] = self;
      dispatch_async(delegateNotificationQueue, block);
    }
  }
}

uint64_t __73__VCMediaStream_checkRTPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 vcMediaStreamDidRTPTimeOut:v4];
  }
  return result;
}

- (void)checkRTCPPacketTimeoutAgainstTime:(double)a3 lastReceivedPacketTime:(double)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v7 = a3 - self->_rtcpTimeoutEnabledTime;
  [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtcpTimeoutInterval];
  if (v7 > v8 && a3 - self->_lastRTCPTimeoutReportTime > 1.0)
  {
    [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtcpTimeoutInterval];
    if (a3 - a4 > v9)
    {
      self->_lastRTCPTimeoutReportTime = a3;
      self->_rtcpDidTimeout = 1;
      if ((VCMediaStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_16;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        __int16 v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = v13;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCMediaStream checkRTCPPacketTimeoutAgainstTime:lastReceivedPacketTime:]";
        __int16 v26 = 1024;
        int v27 = 2196;
        __int16 v28 = 2048;
        double v29 = a4;
        __int16 v30 = 2048;
        double v31 = a3;
        uint32_t v15 = "VCMediaStream [%s] %s:%d Last RTCP packet receive time:%f now:%f";
        uint32_t v16 = v14;
        uint32_t v17 = 48;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v10 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v10 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_16;
        }
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint32_t v19 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v23 = v18;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCMediaStream checkRTCPPacketTimeoutAgainstTime:lastReceivedPacketTime:]";
        __int16 v26 = 1024;
        int v27 = 2196;
        __int16 v28 = 2112;
        double v29 = *(double *)&v10;
        __int16 v30 = 2048;
        double v31 = *(double *)&self;
        __int16 v32 = 2048;
        double v33 = a4;
        __int16 v34 = 2048;
        double v35 = a3;
        uint32_t v15 = "VCMediaStream [%s] %s:%d %@(%p) Last RTCP packet receive time:%f now:%f";
        uint32_t v16 = v19;
        uint32_t v17 = 68;
      }
      _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
LABEL_16:
      [(VCMediaStream *)self onRTCPTimeout];
      delegateNotificationQueue = self->_delegateNotificationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__VCMediaStream_checkRTCPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke;
      block[3] = &unk_1E6DB3DC8;
      block[4] = self;
      int v12 = block;
      goto LABEL_17;
    }
    if (self->_rtcpDidTimeout && self->_lastRTCPTimeoutReportTime < a4)
    {
      self->_rtcpDidTimeout = 0;
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __74__VCMediaStream_checkRTCPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke_2;
      v20[3] = &unk_1E6DB3DC8;
      v20[4] = self;
      int v12 = v20;
LABEL_17:
      dispatch_async(delegateNotificationQueue, v12);
    }
  }
}

uint64_t __74__VCMediaStream_checkRTCPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 vcMediaStreamDidRTCPTimeOut:v4];
  }
  return result;
}

uint64_t __74__VCMediaStream_checkRTCPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 vcMediaStreamDidRecoverFromRTCPTimeOut:v4];
  }
  return result;
}

uint64_t __VCMediaStream_CheckDecryptionTimeoutForMKMRecoveryAgainstTime_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 vcMediaStreamDidDecryptionTimeOutForMKMRecovery:v4];
  }
  return result;
}

- (void)timeoutHeartbeat
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  double v3 = micro();
  if (self) {
    pthread_mutex_lock(&self->_streamLock);
  }
  int state = self->_state;
  if (state == 3 || state == 0)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_21;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint32_t v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v30 = 136315650;
      uint64_t v31 = v15;
      __int16 v32 = 2080;
      double v33 = "-[VCMediaStream timeoutHeartbeat]";
      __int16 v34 = 1024;
      int v35 = 2289;
      uint32_t v17 = "VCMediaStream [%s] %s:%d RTCP send heartbeat called while the stream has already stopped.";
      uint64_t v18 = v16;
      uint32_t v19 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint8_t v6 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint8_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_21;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint32_t v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v30 = 136316162;
      uint64_t v31 = v20;
      __int16 v32 = 2080;
      double v33 = "-[VCMediaStream timeoutHeartbeat]";
      __int16 v34 = 1024;
      int v35 = 2289;
      __int16 v36 = 2112;
      double v37 = v6;
      __int16 v38 = 2048;
      long long v39 = self;
      uint32_t v17 = "VCMediaStream [%s] %s:%d %@(%p) RTCP send heartbeat called while the stream has already stopped.";
      uint64_t v18 = v21;
      uint32_t v19 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v30, v19);
LABEL_21:
    pthread_mutex_unlock(&self->_streamLock);
    return;
  }
  double v7 = (void *)_VCMediaStream_DefaultTransport((uint64_t)self);
  if ([(VCMediaStream *)self isRTPTimeoutEnabled])
  {
    [(VCMediaStream *)self lastReceivedRTPPacketTime];
    double v10 = v9;
    [(VCMediaStream *)self checkRTPPacketTimeoutAgainstTime:v3 lastReceivedPacketTime:v9];
    double rtpTimeoutEnabledTime = self->_rtpTimeoutEnabledTime;
    [v7 rtpTimeoutInterval];
    [(VCMediaStream *)self computeNextTimoutWithEnabledTime:rtpTimeoutEnabledTime timeoutInterval:v12 lastReceivedPacketTime:v10 currentTime:v3 lastTimeoutReportTime:self->_lastRTPTimeoutReportTime];
    double v14 = v13;
  }
  else
  {
    double v14 = NAN;
  }
  if ([(VCMediaStream *)self isRTCPTimeoutEnabled])
  {
    [(VCMediaStream *)self lastReceivedRTCPPacketTime];
    double v23 = v22;
    [(VCMediaStream *)self checkRTCPPacketTimeoutAgainstTime:v3 lastReceivedPacketTime:v22];
    double rtcpTimeoutEnabledTime = self->_rtcpTimeoutEnabledTime;
    [v7 rtcpTimeoutInterval];
    [(VCMediaStream *)self computeNextTimoutWithEnabledTime:rtcpTimeoutEnabledTime timeoutInterval:v25 lastReceivedPacketTime:v23 currentTime:v3 lastTimeoutReportTime:self->_lastRTCPTimeoutReportTime];
    double v27 = v26;
  }
  else
  {
    double v27 = NAN;
  }
  if ([(VCMediaStream *)self isDecryptionTimeoutEnabled])
  {
    _VCMediaStream_CheckDecryptionTimeoutAgainstTime((uint64_t)self, v3, self->_decryptionErrorStartTime);
    [(VCMediaStream *)self computeNextTimoutWithEnabledTime:self->_decryptionTimeoutEnabledTime timeoutInterval:VCMediaStreamTransport_DecryptionTimeoutInterval((uint64_t)v7) lastReceivedPacketTime:self->_decryptionErrorStartTime currentTime:v3 lastTimeoutReportTime:self->_lastDecryptionTimeoutReportTime];
    double v29 = v28;
  }
  else
  {
    double v29 = NAN;
  }
  [(VCMediaStream *)self resetTimeoutHeartbeatWithRTPTimeout:v14 rtcpTimeout:v27 decryptionTimeout:v29 currentTime:v3];

  pthread_mutex_unlock(&self->_streamLock);
}

- (void)startTimeoutHeartbeat
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create timeout heartbeat", v2, v3, v4, v5, v6);
}

uint64_t __38__VCMediaStream_startTimeoutHeartbeat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) timeoutHeartbeat];
}

- (void)stopTimeoutHeartbeat
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!self->_timeoutHeartbeat)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      double v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v23 = 136315650;
      uint64_t v24 = v13;
      __int16 v25 = 2080;
      double v26 = "-[VCMediaStream stopTimeoutHeartbeat]";
      __int16 v27 = 1024;
      int v28 = 2379;
      uint64_t v15 = "VCMediaStream [%s] %s:%d heartbeat is not active";
      uint32_t v16 = v14;
      uint32_t v17 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint8_t v6 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint8_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      double v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v23 = 136316162;
      uint64_t v24 = v21;
      __int16 v25 = 2080;
      double v26 = "-[VCMediaStream stopTimeoutHeartbeat]";
      __int16 v27 = 1024;
      int v28 = 2379;
      __int16 v29 = 2112;
      int v30 = v6;
      __int16 v31 = 2048;
      __int16 v32 = self;
      uint64_t v15 = "VCMediaStream [%s] %s:%d %@(%p) heartbeat is not active";
      uint32_t v16 = v22;
      uint32_t v17 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v23, v17);
    return;
  }
  int state = self->_state;
  if (state) {
    BOOL v4 = state == 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    BOOL v7 = [(VCMediaStream *)self isRTPTimeoutEnabled];
    if (v7
      || [(VCMediaStream *)self isRTCPTimeoutEnabled]
      || [(VCMediaStream *)self isDecryptionTimeoutEnabled])
    {
      [(VCMediaStream *)self resetTimeoutHeartbeatTimer:0];
      return;
    }
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_30;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    double v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    int v23 = 136315650;
    uint64_t v24 = v8;
    __int16 v25 = 2080;
    double v26 = "-[VCMediaStream stopTimeoutHeartbeat]";
    __int16 v27 = 1024;
    int v28 = 2391;
    double v10 = "VCMediaStream [%s] %s:%d Tearing down timeout heartbeat!";
    uint64_t v11 = v9;
    uint32_t v12 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCMediaStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_30;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint32_t v19 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    int v23 = 136316162;
    uint64_t v24 = v18;
    __int16 v25 = 2080;
    double v26 = "-[VCMediaStream stopTimeoutHeartbeat]";
    __int16 v27 = 1024;
    int v28 = 2391;
    __int16 v29 = 2112;
    int v30 = v5;
    __int16 v31 = 2048;
    __int16 v32 = self;
    double v10 = "VCMediaStream [%s] %s:%d %@(%p) Tearing down timeout heartbeat!";
    uint64_t v11 = v19;
    uint32_t v12 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v23, v12);
LABEL_30:
  dispatch_source_cancel((dispatch_source_t)self->_timeoutHeartbeat);
  timeoutHeartbeat = self->_timeoutHeartbeat;
  if (timeoutHeartbeat)
  {
    dispatch_release(timeoutHeartbeat);
    self->_timeoutHeartbeat = 0;
  }
  self->_double rtpTimeoutEnabledTime = NAN;
  self->_double rtcpTimeoutEnabledTime = NAN;
  self->_decryptionTimeoutEnabledTime = NAN;
}

- (VCMediaStreamNotification)notificationDelegate
{
  return (VCMediaStreamNotification *)[(VCWeakObjectHolder *)self->_notificationDelegate strong];
}

- (void)setNotificationDelegate:(id)a3
{
  self->_notificationDelegate = (VCWeakObjectHolder *)(id)[MEMORY[0x1E4F47A30] weakObjectHolderWithObject:a3];
}

- (void)onCallIDChanged
{
}

- (id)supportedPayloads
{
}

- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4
{
}

- (void)onStartWithCompletionHandler:(id)a3
{
}

- (void)onStopWithCompletionHandler:(id)a3
{
}

- (void)onPauseWithCompletionHandler:(id)a3
{
}

- (void)onResumeWithCompletionHandler:(id)a3
{
}

- (void)onSendRTCPPacket
{
}

- (void)onRTPTimeout
{
}

- (void)onRTCPTimeout
{
}

- (double)lastReceivedRTPPacketTime
{
}

- (double)lastReceivedRTCPPacketTime
{
}

- (double)rtcpHeartbeatLeeway
{
}

- (void)collectRxChannelMetrics:(id *)a3 interval:(float)a4
{
}

- (void)collectRxChannelMetrics:(id *)a3
{
}

- (void)collectTxChannelMetrics:(id *)a3
{
}

- (BOOL)shouldReportNetworkInterfaceType
{
  return 0;
}

- (void)handleActiveConnectionChange:(id)a3
{
}

- (int)handleMediaCallbackNotification:(int)a3 inData:(void *)a4 outData:(void *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_14;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      BOOL v7 = *MEMORY[0x1E4F47A50];
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[VCMediaStream handleMediaCallbackNotification:inData:outData:]();
        }
        goto LABEL_14;
      }
      int v9 = 0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v20 = v6;
        __int16 v21 = 2080;
        double v22 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]";
        __int16 v23 = 1024;
        int v24 = 2540;
        __int16 v25 = 1024;
        int v26 = a3;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d MediaCallback: call back is not supported for notification %d.", buf, 0x22u);
        goto LABEL_14;
      }
      return v9;
    case 3:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_2;
      v15[3] = &unk_1E6DB3E40;
      v15[4] = self;
      v15[5] = a4;
      uint64_t v11 = v15;
      goto LABEL_13;
    case 4:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke;
      v18[3] = &unk_1E6DB3E40;
      v18[4] = self;
      v18[5] = a4;
      uint64_t v11 = v18;
      goto LABEL_13;
    case 5:
      char v12 = *(unsigned char *)a4;
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_208;
      v16[3] = &unk_1E6DB3DF0;
      v16[4] = self;
      char v17 = v12;
      uint64_t v11 = v16;
      goto LABEL_13;
    case 6:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_3;
      v14[3] = &unk_1E6DB3E40;
      v14[4] = self;
      v14[5] = a4;
      uint64_t v11 = v14;
LABEL_13:
      dispatch_async(delegateNotificationQueue, v11);
LABEL_14:
      int v9 = 0;
      break;
    default:
      int v9 = -2146369535;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStream handleMediaCallbackNotification:inData:outData:]();
        }
      }
      break;
  }
  return v9;
}

uint64_t __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    BOOL v4 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v2;
        __int16 v8 = 2080;
        int v9 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 2510;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d MediaCallback: SRTP key needs update", (uint8_t *)&v6, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_cold_1();
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "notificationDelegate"), "mediaStream:didReceiveNewMediaKeyIndex:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_208(uint64_t a1)
{
  return [*(id *)(a1 + 32) decryptionStatusChanged:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) notificationDelegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) notificationDelegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 mediaStream:v4 didReceiveFlushRequestWithPayloads:v5];
  }
  return result;
}

uint64_t __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v2;
        __int16 v8 = 2080;
        int v9 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]_block_invoke_3";
        __int16 v10 = 1024;
        int v11 = 2533;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d MediaCallback: Gap in RTP sequence number detected", (uint8_t *)&v6, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_3_cold_1();
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "notificationDelegate"), "mediaStream:didReceiveRTPGapForMediaKeyIndex:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
}

- (unsigned)endReason
{
  if (self->_stopError) {
    return [(NSError *)self->_stopError code];
  }
  if (self->_lastRTCPTimeoutReportTime <= 0.0) {
    return 0;
  }
  return 32040;
}

- (unsigned)localSSRC
{
  return self->_localSSRC;
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_int operatingMode = a3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (AVCRateControlFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (void)mediaControlInfoGenerator
{
  return self->_mediaControlInfoGenerator;
}

- (unsigned)mediaControlInfoGeneratorType
{
  return self->_mediaControlInfoGeneratorType;
}

- (NSArray)transportArray
{
  return &self->_transportArray->super;
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (NSArray)compoundStreamIDs
{
  return (NSArray *)objc_getProperty(self, a2, 752, 1);
}

- (void)setCompoundStreamIDs:(id)a3
{
}

- (VCNetworkFeedbackController)networkFeedbackController
{
  return self->_networkFeedbackController;
}

- (void)setNetworkFeedbackController:(id)a3
{
}

- (BOOL)isUplinkRetransmissionEnabled
{
  return self->_isUplinkRetransmissionEnabled;
}

- (void)setUplinkRetransmissionEnabled:(BOOL)a3
{
  self->_isUplinkRetransmissionEnabled = a3;
}

- (int64_t)streamTokenUplink
{
  return self->_streamTokenUplink;
}

- (int64_t)streamTokenDownlink
{
  return self->_streamTokenDownlink;
}

- (int)state
{
  return self->_state;
}

- (tagVCMediaStreamDelegateRealtimeInstanceVTable)delegateFunctions
{
  return self->_delegateFunctions;
}

- (void)setDelegateFunctions:(tagVCMediaStreamDelegateRealtimeInstanceVTable)a3
{
  self->_delegateFunctions = a3;
}

uint64_t ___VCMediaStream_CheckDecryptionTimeoutAgainstTime_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    return [v2 vcMediaStreamDidDecryptionTimeOut:v4];
  }
  return result;
}

- (void)defaultStreamConfig
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d _transportArray is empty, and we are trying to get the default stream config, which does not exist.", v2, v3, v4, v5, v6);
}

- (void)oneToOneStreamConfig
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d _transportArray does not have a oneToOne stream configuration.", v2, v3, v4, v5, v6);
}

- (void)initializeTransportSetupInfoWithTransportSession:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d VCTransportSession init failed", v2, v3, v4, v5, v6);
}

- (void)handleTransportSessionEvent:info:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Connection Setup Failed error = %@");
}

- (void)dupNWConnectionBackingSocket:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d nwConnection must not be nil", v2, v3, v4, v5, v6);
}

- (void)setupNWConnectionWithID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create connectionClientID with %@");
}

- (void)setupNWConnectionWithID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create nw_connection", v2, v3, v4, v5, v6);
}

- (void)setupNWConnectionWithID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d nw_connection start failed", v2, v3, v4, v5, v6);
}

- (void)setupNWConnectionWithID:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d VTP_ScheduleReceiveForNWConnection failed", v2, v3, v4, v5, v6);
}

- (void)setupNWConnectionWithID:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d nw_connection ready timeout", v2, v3, v4, v5, v6);
}

- (void)setupCallbacksWithNWConnectionMonitor:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Setting callbacks for monitor that is nil", v2, v3, v4, v5, v6);
}

- (void)setupRTPForIDS
{
  LODWORD(v3) = 136315906;
  *(void *)((char *)&v3 + 4) = a1;
  WORD6(v3) = 2080;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v1, v2, "VCMediaStream [%s] %s:%d Failed with error %@", v3);
}

- (void)initializeTransportSetupInfoWithIDSDestination:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]";
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d DatagramChannel start failed with error %x", v2, *(const char **)v3, (unint64_t)"-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]" >> 16, v4);
}

- (void)initializeTransportSetupInfoWithIDSDestination:error:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  os_log_t v2 = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, "VCMediaStream [%s] %s:%d DatagramChannel start failed with error %x", v1, 0x22u);
}

void __70__VCMediaStream_initializeTransportSetupInfoWithIDSDestination_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d IDS eventHandler called without event type", v2, v3, v4, v5, v6);
}

- (void)createRTPHandleWithStreamConfig:payloadType:localSSRC:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create RTP extension. Error=%d", v2, *(const char **)v3, (unint64_t)"-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]" >> 16, v4);
}

- (void)createRTPHandleWithStreamConfig:payloadType:localSSRC:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Failed to set rtp timestamp rate. Error=%d", v2, *(const char **)v3, (unint64_t)"-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]" >> 16, v4);
}

- (void)createTransportWithStreamConfig:ssrc:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create RTP handle", v2, v3, v4, v5, v6);
}

- (void)createTransportWithStreamConfig:ssrc:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create media stream transport", v2, v3, v4, v5, v6);
}

- (void)updateConnectionWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_6_11();
  [v1 localAddress];
  [v0 remoteAddress];
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_11(&dword_1E1EA4000, v2, v3, "VCMediaStream [%s] %s:%d Failed to create connection with localAddress=%@ and remoteAddress=%@", v4, v5, v6, v7, v8);
}

- (void)updateConnectionWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_6_11();
  [v1 localAddress];
  [v0 remoteAddress];
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_11(&dword_1E1EA4000, v2, v3, "VCMediaStream [%s] %s:%d Failed to retrieve rate sharing group for connection with localAddress=%@ and remoteAddress=%@", v4, v5, v6, v7, v8);
}

- (void)setStreamConfig:withError:.cold.1()
{
  OUTLINED_FUNCTION_6_11();
  if (OUTLINED_FUNCTION_14_2(*MEMORY[0x1E4F143B8])) {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_9_7();
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %s[%p] %s error configuring stream", v1, 0x3Au);
}

- (void)setStreamConfig:withError:.cold.2()
{
  OUTLINED_FUNCTION_6_11();
  if (OUTLINED_FUNCTION_14_2(*MEMORY[0x1E4F143B8])) {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_9_7();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, "VCMediaStream [%s] %s:%d %s[%p] %s error configuring stream", v1, 0x3Au);
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d start timed out", v2, v3, v4, v5, v6);
}

void __44__VCMediaStream_startWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Failed to start media", v2, v3, v4, v5, v6);
}

- (void)stopWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d stop timed out", v2, v3, v4, v5, v6);
}

void __41__VCMediaStream_stopInternalWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Failed to stop media", v2, v3, v4, v5, v6);
}

- (void)setPause:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d pause timed out", v2, v3, v4, v5, v6);
}

- (void)getInvalidParamErrorForSetPause:(NSObject *)a3 didSucceed:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  int v7 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_8();
  int v10 = 1581;
  __int16 v11 = v5;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d error=%s", (uint8_t *)&v7, 0x26u);
}

void __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Error pausing media", v2, v3, v4, v5, v6);
}

void __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_176_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCMediaStream [%s] %s:%d Error resuming media", v2, v3, v4, v5, v6);
}

- (void)handleMediaCallbackNotification:inData:outData:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]";
  OUTLINED_FUNCTION_3();
  int v5 = 2543;
  __int16 v6 = v0;
  int v7 = 2543;
  __int16 v8 = v0;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m:%d: MediaCallback: notificaiton %d unknown, no action.", v3, 0x28u);
}

- (void)handleMediaCallbackNotification:inData:outData:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  os_log_t v2 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCMediaStream [%s] %s:%d MediaCallback: call back is not supported for notification %d.", v1, 0x22u);
}

void __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 2510;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCMediaStream [%s] %s:%d MediaCallback: SRTP key needs update", v1, 0x1Cu);
}

void __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_3_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 2533;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCMediaStream [%s] %s:%d MediaCallback: Gap in RTP sequence number detected", v1, 0x1Cu);
}

@end