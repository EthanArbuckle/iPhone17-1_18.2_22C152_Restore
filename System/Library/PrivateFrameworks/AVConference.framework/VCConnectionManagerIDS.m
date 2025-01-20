@interface VCConnectionManagerIDS
- ($85B13D066EE34EC5DDC86B20300AB7FA)getConnectionSelectionPolicy;
- (BOOL)addConnectionToConnectionArray:(id)a3;
- (BOOL)canOptOutAllStreamsForConnection:(id)a3;
- (BOOL)isEndToEndLinkAvailable;
- (BOOL)isEndToEndLinkWithCellAvailable:(BOOL)a3;
- (BOOL)optIntoExistingSubscribedStreams;
- (BOOL)shouldAcceptDataFromSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3;
- (BOOL)shouldDropCurrentPrimaryConnectionWithConnectionStats:(id *)a3;
- (BOOL)shouldKeepAllConnections;
- (BOOL)shouldPreferWiredConnections;
- (BOOL)shouldReplaceConnection:(id)a3 withConnection:(id)a4;
- (BOOL)shouldUpdateServerBasedConnection:(id)a3;
- (VCConnectionManagerIDS)initWithMultiwayEnabled:(BOOL)a3;
- (id)connectionForDuplication;
- (id)getPrimaryConnectionToBeCompared;
- (id)lastPrimaryConnectionInUse;
- (id)secondaryConnection;
- (int)addConnection:(id)a3;
- (int)removeConnection:(id)a3;
- (unsigned)downlinkBitrateCapForConnection:(id)a3;
- (unsigned)getByteCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4;
- (unsigned)getPacketCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4;
- (unsigned)oneToOneBitrateCapForConnectionWithType:(unsigned int)a3;
- (unsigned)uplinkAudioOnlyBitrateCapOneToOne:(id)a3;
- (unsigned)uplinkBitrateCapForConnection:(id)a3;
- (unsigned)uplinkBitrateCapOneToOne:(id)a3;
- (void)addDuplicationConnectionUpdateTelemetryWithSuggestedLinkTypeCombo:(id)a3 payload:(id)a4;
- (void)applyConstrainWithThreshold:(id)a3 inBandwidth:(unsigned int *)a4 thredshold:(unsigned int)a5;
- (void)dealloc;
- (void)didLinkProbingLockdownEnd;
- (void)didReceiveStatsResponse:(BOOL)a3;
- (void)didUpdateLinkPreferenceOrder:(id)a3;
- (void)flushLinkProbingStatusWithOptions:(id)a3;
- (void)handleSecondaryConnectionRemoved;
- (void)internalUpdateOneToOneBitrateCapsForConnection:(id)a3;
- (void)optOutAllStreamsForNonPrimaryConnections;
- (void)queryProbingResultsWithOptions:(id)a3;
- (void)removeFromConnectionArray:(id)a3;
- (void)reportActiveConnectionOneToOne:(id)a3 isAudioOnly:(BOOL)a4;
- (void)reportConnection:(id)a3 isInitialConnection:(BOOL)a4;
- (void)reportCurrentPrimaryConnection;
- (void)reportFirstActiveConnectionOneToOne:(id)a3 remoteOSVersion:(id)a4 redState:(BOOL)a5 isAudioOnly:(BOOL)a6;
- (void)requestStatsWithOptions:(id)a3;
- (void)reselectPrimaryConnection;
- (void)resetPacketCountAndByteCountWithConnection:(id)a3;
- (void)resetParticipantGenerationCounter;
- (void)setConnectionForDuplication:(id)a3;
- (void)setLastPrimaryConnectionInUse:(id)a3;
- (void)setOptIntoExistingSubscribedStreams:(BOOL)a3;
- (void)setPreferredLocalInterfaceForDuplication:(unsigned __int8)a3;
- (void)setPreferredRemoteInterfaceForDuplication:(unsigned __int8)a3;
- (void)setSecondaryConnection:(id)a3;
- (void)setUpVTable;
- (void)startActiveProbingWithOptions:(id)a3;
- (void)stopActiveProbingWithOptions:(id)a3;
- (void)updateAllBitrateCapsForConnection:(id)a3;
- (void)updateAllBitrateCapsForConnectionInternal:(id)a3;
- (void)updateCellularMTU:(int)a3;
- (void)updateCellularTech:(int)a3 forLocalInterface:(BOOL)a4;
- (void)updateConnectionSelectionPolicyWithPreferE2E:(BOOL)a3;
- (void)updateDuplicationStateWithConnectionOperation:(int)a3 isLocalOnWiFi:(BOOL)a4 isRemoteOnWiFi:(BOOL)a5;
- (void)updateEncryptionConfig:(id)a3;
- (void)updateNegotiatedSettingsOnetoOne:(id)a3;
- (void)updateOneToOneBitrateCapsForConnection:(id)a3;
- (void)updateSessionStats:(unsigned __int16)a3;
- (void)updateStatResponseResult:(id)a3;
- (void)useConnectionAsPrimary:(id)a3;
@end

@implementation VCConnectionManagerIDS

- (void)setUpVTable
{
  self->super._vTable.copyConnection = _VCConnectionManagerIDS_CopyConnection;
  self->super._vTable.updateConnectionForDuplication = _VCConnectionManagerIDS_UpdateConnectionForDuplication;
  self->super._vTable.synchronizeParticipantGenerationCounter = _VCConnectionManagerIDS_SynchronizeParticipantGenerationCounter;
  self->super._vTable.isSourceOnCellularIPv6 = _VCConnectionManagerIDS_IsSourceOnCellularIPv6;
  self->super._vTable.copyPrimaryConnection = _VCConnectionManagerIDS_CopyPrimaryConnection;
  self->super._vTable.setPrimaryConnection = _VCConnectionManagerIDS_SetPrimaryConnection;
  self->super._vTable.updatePacketAndByteCount = _VCConnectionManagerIDS_UpdatePacketAndByteCount;
  self->super._vTable.updatePersistentPacketCounts = _VCConnectionManagerIDS_UpdatePersistentPacketCounts;
  self->super._vTable.addLinkProbingTelemetry = _VCConnectionManagerIDS_AddLinkProbingTelemetry_0;
}

- (VCConnectionManagerIDS)initWithMultiwayEnabled:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCConnectionManagerIDS;
  v4 = [(VCConnectionManager *)&v11 init];
  if (v4)
  {
    v4->super._statsRecorder = objc_alloc_init(VCStatsRecorder);
    v4->_multiwayBitrateArbiter = objc_alloc_init(VCSessionBitrateArbiter);
    v4->_oneToOneBitrateArbiter = [[VCBitrateArbiter alloc] initWithDeviceRole:0 callLogFile:0];
    v4->_isMultiwaySession = a3;
    v4->super._connectionSelector = [[VCConnectionSelector alloc] initWithMultiwayEnabled:v4->_isMultiwaySession];
    BOOL v5 = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-core-motion-detection-enabled" userDefaultKey:@"coreMotionDetectionEnabled" featureFlagDomain:"AVConference" featureFlagName:"UseCoreMotionDetection"];
    v4->_BOOL enableCoreMotionDetection = v5;
    if (v5) {
      v4->super._coreMotionManager = [[VCCoreMotionManager alloc] initWithDelegate:v4];
    }
    v4->super._BOOL enableMotionBasedDuplication = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-motion-based-duplication-enabled" userDefaultKey:@"motionBasedDuplicationEnabled" featureFlagDomain:"AVConference" featureFlagName:"EnableMotionBasedDuplication"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL enableCoreMotionDetection = v4->_enableCoreMotionDetection;
        BOOL enableMotionBasedDuplication = v4->super._enableMotionBasedDuplication;
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v6;
        __int16 v14 = 2080;
        v15 = "-[VCConnectionManagerIDS initWithMultiwayEnabled:]";
        __int16 v16 = 1024;
        int v17 = 76;
        __int16 v18 = 1024;
        BOOL v19 = enableCoreMotionDetection;
        __int16 v20 = 1024;
        BOOL v21 = enableMotionBasedDuplication;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enableCoreMotionDetection=%d enableMotionBasedDuplication=%d", buf, 0x28u);
      }
    }
    v4->super._isRTXSupported = 1;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCConnectionManagerIDS;
  [(VCConnectionManager *)&v3 dealloc];
}

- (void)reportActiveConnectionOneToOne:(id)a3 isAudioOnly:(BOOL)a4
{
  v10[3] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    unsigned int v6 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", [a3 localConnectionType]);
    unsigned int v7 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", [a3 remoteConnectionType]);
  }
  else
  {
    unsigned int v6 = [(VCBitrateArbiter *)self->_oneToOneBitrateArbiter maxAllowedBitrateForVCConnection:a3 forLocalInterface:1];
    unsigned int v7 = [(VCBitrateArbiter *)self->_oneToOneBitrateArbiter maxAllowedBitrateForVCConnection:a3 forLocalInterface:0];
  }
  unsigned int v8 = v7;
  v9[0] = @"localBitrateCap";
  v10[0] = [NSNumber numberWithUnsignedInt:1000 * v6];
  v9[1] = @"remoteBitrateCap";
  v10[1] = [NSNumber numberWithUnsignedInt:1000 * v8];
  v9[2] = @"connectionDataMode";
  v10[2] = [NSNumber numberWithUnsignedChar:VCConnection_GetDataMode((uint64_t)a3)];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  reportingGenericEvent();
}

- (void)reportFirstActiveConnectionOneToOne:(id)a3 remoteOSVersion:(id)a4 redState:(BOOL)a5 isAudioOnly:(BOOL)a6
{
  BOOL v6 = a5;
  v16[5] = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    unsigned int v10 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", [a3 localConnectionType]);
    unsigned int v11 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", [a3 remoteConnectionType]);
  }
  else
  {
    unsigned int v10 = [(VCBitrateArbiter *)self->_oneToOneBitrateArbiter maxAllowedBitrateForVCConnection:a3 forLocalInterface:1];
    unsigned int v11 = [(VCBitrateArbiter *)self->_oneToOneBitrateArbiter maxAllowedBitrateForVCConnection:a3 forLocalInterface:0];
  }
  unsigned int v12 = v11;
  v15[0] = @"RedState";
  v16[0] = [NSNumber numberWithBool:v6];
  v15[1] = @"WAState";
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[VCWifiAssistManager wifiAssistState](+[VCWifiAssistManager sharedInstance](VCWifiAssistManager, "sharedInstance"), "wifiAssistState"));
  __int16 v14 = @"unknown";
  if (a4) {
    __int16 v14 = (__CFString *)a4;
  }
  v16[1] = v13;
  v16[2] = v14;
  v15[2] = @"REMBUILD";
  v15[3] = @"localBitrateCap";
  v16[3] = [NSNumber numberWithUnsignedInt:1000 * v10];
  v15[4] = @"remoteBitrateCap";
  v16[4] = [NSNumber numberWithUnsignedInt:1000 * v12];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  reportingGenericEvent();
}

- (unsigned)uplinkAudioOnlyBitrateCapOneToOne:(id)a3
{
  unsigned int v5 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", [a3 localConnectionType]);
  unsigned int v6 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", [a3 remoteConnectionType]);
  if (v6) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = 40;
  }
  if (v5 < v7) {
    unsigned int v7 = v5;
  }
  return 1000 * v7;
}

- (unsigned)uplinkBitrateCapOneToOne:(id)a3
{
  unsigned int v5 = [(VCBitrateArbiter *)self->_oneToOneBitrateArbiter maxAllowedBitrateForVCConnection:a3 forLocalInterface:1];
  unsigned int v6 = [(VCBitrateArbiter *)self->_oneToOneBitrateArbiter maxAllowedBitrateForVCConnection:a3 forLocalInterface:0];
  if (v6) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = 100;
  }
  if (v5 < v7) {
    unsigned int v7 = v5;
  }
  unsigned int v8 = 1000 * v7;
  unsigned int v9 = 1000
     * -[VCConnectionManagerIDS oneToOneBitrateCapForConnectionWithType:](self, "oneToOneBitrateCapForConnectionWithType:", [a3 type]);
  if (v8 >= v9) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = v8;
  }
  if (v9) {
    return v10;
  }
  else {
    return v8;
  }
}

- (unsigned)oneToOneBitrateCapForConnectionWithType:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 - 3 > 1) {
    return 0;
  }
  unsigned int v4 = [(VCBitrateArbiter *)self->_oneToOneBitrateArbiter maxAllowedBitrateTCPRelay];
  if (v4)
  {
    unsigned int v5 = v4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      unsigned int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCConnectionManagerIDS oneToOneBitrateCapForConnectionWithType:]";
        __int16 v15 = 1024;
        int v16 = 149;
        __int16 v17 = 1024;
        unsigned int v18 = v5;
        unsigned int v8 = " [%s] %s:%d TCP connectionLimitedBitrate=%u";
LABEL_10:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x22u);
      }
    }
  }
  else
  {
    unsigned int v5 = [(VCBitrateArbiter *)self->_oneToOneBitrateArbiter maxAllowedBitrateWifi];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      unsigned int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCConnectionManagerIDS oneToOneBitrateCapForConnectionWithType:]";
        __int16 v15 = 1024;
        int v16 = 152;
        __int16 v17 = 1024;
        unsigned int v18 = v5;
        unsigned int v8 = " [%s] %s:%d Use general wifi relay connectionLimitedBitrate=%u for TCP";
        goto LABEL_10;
      }
    }
  }
  return v5;
}

- (void)applyConstrainWithThreshold:(id)a3 inBandwidth:(unsigned int *)a4 thredshold:(unsigned int)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if ((VCConnectionManagerIDS *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v19 = 136315650;
      uint64_t v20 = v12;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCConnectionManagerIDS applyConstrainWithThreshold:inBandwidth:thredshold:]";
      __int16 v23 = 1024;
      int v24 = 162;
      __int16 v14 = " [%s] %s:%d inBandwidth is null";
      __int16 v15 = v13;
      uint32_t v16 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v11 = (__CFString *)[(VCConnectionManagerIDS *)self performSelector:sel_logPrefix];
      }
      else {
        int v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      unsigned int v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v19 = 136316162;
      uint64_t v20 = v17;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCConnectionManagerIDS applyConstrainWithThreshold:inBandwidth:thredshold:]";
      __int16 v23 = 1024;
      int v24 = 162;
      __int16 v25 = 2112;
      *(void *)v26 = v11;
      *(_WORD *)&v26[8] = 2048;
      v27 = self;
      __int16 v14 = " [%s] %s:%d %@(%p) inBandwidth is null";
      __int16 v15 = v18;
      uint32_t v16 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
    return;
  }
  if ([(VCConnectionManager *)self shouldLimitMultiwayBandwidthWhenConstrained]&& *a4 > a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = *a4;
        int v19 = 136316162;
        uint64_t v20 = v8;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCConnectionManagerIDS applyConstrainWithThreshold:inBandwidth:thredshold:]";
        __int16 v23 = 1024;
        int v24 = 164;
        __int16 v25 = 1024;
        *(_DWORD *)v26 = v10;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = a5;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isConstrained, limit from inBandwidth=%u to threshold=%u", (uint8_t *)&v19, 0x28u);
      }
    }
    *a4 = a5;
  }
}

- (unsigned)uplinkBitrateCapForConnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned int v10 = 0;
  switch([a3 localConnectionType])
  {
    case 0xFFFFFFFF:
    case 3u:
    case 4u:
    case 5u:
    case 7u:
      unsigned int v5 = [(VCSessionBitrateArbiter *)self->_multiwayBitrateArbiter maxBitrateWiFiUplink];
      goto LABEL_3;
    case 0u:
      unsigned int v5 = [(VCSessionBitrateArbiter *)self->_multiwayBitrateArbiter maxBitrate2GUplink];
      goto LABEL_3;
    case 1u:
      unsigned int v5 = [(VCSessionBitrateArbiter *)self->_multiwayBitrateArbiter maxBitrate3GUplink];
      goto LABEL_3;
    case 2u:
    case 6u:
      int IsLocalExpensive = VCConnection_IsLocalExpensive((uint64_t)a3);
      multiwayBitrateArbiter = self->_multiwayBitrateArbiter;
      if (IsLocalExpensive) {
        unsigned int v5 = [(VCSessionBitrateArbiter *)multiwayBitrateArbiter maxBitrateExpensiveUplink];
      }
      else {
        unsigned int v5 = [(VCSessionBitrateArbiter *)multiwayBitrateArbiter maxBitrateNonExpensiveUplink];
      }
LABEL_3:
      unsigned int v6 = v5;
      unsigned int v10 = v5;
      break;
    default:
      unsigned int v6 = 0;
      break;
  }
  if (VCConnection_IsLocalConstrained((uint64_t)a3))
  {
    [(VCConnectionManagerIDS *)self applyConstrainWithThreshold:a3 inBandwidth:&v10 thredshold:[(VCSessionBitrateArbiter *)self->_multiwayBitrateArbiter maxBitrateExpensiveUplink]];
    return v10;
  }
  return v6;
}

- (unsigned)downlinkBitrateCapForConnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned int v10 = 0;
  switch([a3 localConnectionType])
  {
    case 0xFFFFFFFF:
    case 3u:
    case 4u:
    case 5u:
    case 7u:
      unsigned int v5 = [(VCSessionBitrateArbiter *)self->_multiwayBitrateArbiter maxBitrateWiFiDownlink];
      goto LABEL_3;
    case 0u:
      unsigned int v5 = [(VCSessionBitrateArbiter *)self->_multiwayBitrateArbiter maxBitrate2GDownlink];
      goto LABEL_3;
    case 1u:
      unsigned int v5 = [(VCSessionBitrateArbiter *)self->_multiwayBitrateArbiter maxBitrate3GDownlink];
      goto LABEL_3;
    case 2u:
    case 6u:
      int IsLocalExpensive = VCConnection_IsLocalExpensive((uint64_t)a3);
      multiwayBitrateArbiter = self->_multiwayBitrateArbiter;
      if (IsLocalExpensive) {
        unsigned int v5 = [(VCSessionBitrateArbiter *)multiwayBitrateArbiter maxBitrateExpensiveDownlink];
      }
      else {
        unsigned int v5 = [(VCSessionBitrateArbiter *)multiwayBitrateArbiter maxBitrateNonExpensiveDownlink];
      }
LABEL_3:
      unsigned int v6 = v5;
      unsigned int v10 = v5;
      break;
    default:
      unsigned int v6 = 0;
      break;
  }
  if (VCConnection_IsLocalConstrained((uint64_t)a3))
  {
    [(VCConnectionManagerIDS *)self applyConstrainWithThreshold:a3 inBandwidth:&v10 thredshold:[(VCSessionBitrateArbiter *)self->_multiwayBitrateArbiter maxBitrateExpensiveDownlink]];
    return v10;
  }
  return v6;
}

- (int)addConnection:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    p_stateRWlock = &self->super._stateRWlock;
    pthread_rwlock_wrlock(&self->super._stateRWlock);
    if ([(VCConnectionManagerIDS *)self addConnectionToConnectionArray:a3])
    {
      [(VCConnectionManagerIDS *)self updateAllBitrateCapsForConnectionInternal:a3];
      id v6 = [(VCConnectionManagerIDS *)self lastPrimaryConnectionInUse];
      BOOL v7 = !self->_isMultiwaySession || [(VCConnectionManager *)self isOneToOneModeEnabled];
      BOOL v9 = [(VCConnectionSelector *)self->super._connectionSelector selectPrimaryAndSecondaryWithConnection:a3 isEndToEnd:v7];
      VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
      if ([(VCConnectionManagerIDS *)self shouldUpdateServerBasedConnection:a3])
      {
        [(VCConnectionSelector *)self->super._connectionSelector updateSelectedConnectionsForGroupType:0 connectionAdded:a3];
        if (self->_optIntoExistingSubscribedStreams) {
          [(VCConnectionManagerDelegate *)[(VCConnectionManager *)self delegate] optIntoExistingSubscribedStreamsForConnection:a3];
        }
        id v10 = [(VCConnectionSelector *)self->super._connectionSelector connectionForGroupType:0 isPrimary:1];
        if (v10) {
          -[VCLinkProbingHandler setQRLinkID:](self->super._linkProbingHandler, "setQRLinkID:", [NSNumber numberWithUnsignedChar:VCConnectionIDS_LinkID((uint64_t)v10)]);
        }
      }
      if (v9)
      {
        BOOL isInitialConnectionEstablished = self->super._isInitialConnectionEstablished;
        if (self->super._isInitialConnectionEstablished
          && [(NSMutableArray *)self->super._connectionArray count] == 1
          && [(VCConnectionManager *)self isOneToOneModeEnabled])
        {
          delegateQueue = self->super._delegateQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __40__VCConnectionManagerIDS_addConnection___block_invoke_2;
          block[3] = &unk_1E6DB3DC8;
          block[4] = self;
          dispatch_async(delegateQueue, block);
        }
        __int16 v13 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        int v14 = VCConnection_Priority((uint64_t)a3);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          uint32_t v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = "SECONDARY";
            if (v14 == 2) {
              uint64_t v17 = "PRIMARY";
            }
            v39 = v17;
            uint64_t v38 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
            if (v13) {
              v37 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
            }
            else {
              v37 = "<nil>";
            }
            if ([(VCConnectionManagerIDS *)self secondaryConnection]) {
              v26 = (const char *)objc_msgSend((id)objc_msgSend(-[VCConnectionManagerIDS secondaryConnection](self, "secondaryConnection"), "description"), "UTF8String");
            }
            else {
              v26 = "<nil>";
            }
            *(_DWORD *)buf = 136316674;
            uint64_t v45 = v15;
            __int16 v46 = 2080;
            v47 = "-[VCConnectionManagerIDS addConnection:]";
            __int16 v48 = 1024;
            int v49 = 288;
            __int16 v50 = 2080;
            uint64_t v51 = (uint64_t)v39;
            __int16 v52 = 2080;
            uint64_t v53 = v38;
            __int16 v54 = 2080;
            v55 = v37;
            __int16 v56 = 2080;
            v57 = v26;
            _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: add result %s IDS connection %s. Primary: %s, secondary: %s", buf, 0x44u);
          }
        }
        if (v13) {
          CFRelease(v13);
        }
        [(VCConnectionManager *)self checkpointPrimaryConnection:a3];
        if (v14 == 2)
        {
          if (v6)
          {
            [(VCConnectionManager *)self primaryConnectionChanged:a3 oldPrimaryConnection:v6];
          }
          else
          {
            [(VCConnectionManager *)self configureNWConnectionMonitor:a3];
            int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
            self->super._isPrimaryLocalUsingCell = IsLocalOnCellular;
            VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, IsLocalOnCellular);
          }
        }
        v30 = self->super._delegateQueue;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __40__VCConnectionManagerIDS_addConnection___block_invoke_48;
        v40[3] = &unk_1E6DB3E18;
        v40[4] = self;
        v40[5] = a3;
        BOOL v41 = !isInitialConnectionEstablished;
        dispatch_async(v30, v40);
        if (!self->super._isInitialConnectionEstablished) {
          self->super._BOOL isInitialConnectionEstablished = 1;
        }
        if (self->super._duplicationPending
          && (int)VCConnectionManager_GetNumberOfConnectionsInternal((uint64_t (**)(void))self) >= 2)
        {
          VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, 1);
        }

        [(VCConnectionManagerIDS *)self reportConnection:a3 isInitialConnection:!isInitialConnectionEstablished];
        [(VCConnectionManager *)self reportConnectionUpdateWithRespCode:0];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            connectionArray = self->super._connectionArray;
            if (connectionArray)
            {
              v34 = (const char *)objc_msgSend((id)-[NSMutableArray description](connectionArray, "description"), "UTF8String");
              connectionArray = self->super._connectionArray;
            }
            else
            {
              v34 = "<nil>";
            }
            uint64_t v35 = [(NSMutableArray *)connectionArray count];
            *(_DWORD *)buf = 136316162;
            uint64_t v45 = v31;
            __int16 v46 = 2080;
            v47 = "-[VCConnectionManagerIDS addConnection:]";
            __int16 v48 = 1024;
            int v49 = 322;
            __int16 v50 = 2080;
            uint64_t v51 = (uint64_t)v34;
            __int16 v52 = 2048;
            uint64_t v53 = v35;
            _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection array %s has %lu connections", buf, 0x30u);
          }
        }
      }
      else
      {
        VCConnection_SetPriority((uint64_t)a3, -1);

        int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        int v19 = (os_log_t *)MEMORY[0x1E4F47A50];
        if (ErrorLogLevelForModule >= 6)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          __int16 v21 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v45 = v20;
            __int16 v46 = 2080;
            v47 = "-[VCConnectionManagerIDS addConnection:]";
            __int16 v48 = 1024;
            int v49 = 263;
            __int16 v50 = 2080;
            uint64_t v51 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: add result backup IDS connection %s", buf, 0x26u);
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          __int16 v23 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = self->super._connectionArray;
            if (v24)
            {
              __int16 v25 = (const char *)objc_msgSend((id)-[NSMutableArray description](v24, "description"), "UTF8String");
              int v24 = self->super._connectionArray;
            }
            else
            {
              __int16 v25 = "<nil>";
            }
            uint64_t v27 = [(NSMutableArray *)v24 count];
            *(_DWORD *)buf = 136316162;
            uint64_t v45 = v22;
            __int16 v46 = 2080;
            v47 = "-[VCConnectionManagerIDS addConnection:]";
            __int16 v48 = 1024;
            int v49 = 264;
            __int16 v50 = 2080;
            uint64_t v51 = (uint64_t)v25;
            __int16 v52 = 2048;
            uint64_t v53 = v27;
            _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection array %s has %lu connections", buf, 0x30u);
          }
        }
        if ([(VCConnectionManagerIDS *)self canOptOutAllStreamsForConnection:a3])
        {
          uint64_t v28 = self->super._delegateQueue;
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __40__VCConnectionManagerIDS_addConnection___block_invoke;
          v43[3] = &unk_1E6DB3E40;
          v43[4] = self;
          v43[5] = a3;
          dispatch_async(v28, v43);
        }
        [(VCConnectionManager *)self reportConnectionUpdateWithRespCode:0];
      }
    }
    pthread_rwlock_unlock(p_stateRWlock);
    return 0;
  }
  else
  {
    int v8 = -2144796671;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCConnectionManagerIDS addConnection:]();
      }
    }
  }
  return v8;
}

uint64_t __40__VCConnectionManagerIDS_addConnection___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 optOutAllStreamsForConnection:v3];
}

uint64_t __40__VCConnectionManagerIDS_addConnection___block_invoke_2(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) delegate];

  return [v1 setRemoteDeviceVersionIDS];
}

uint64_t __40__VCConnectionManagerIDS_addConnection___block_invoke_48(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);

  return [v2 connectionCallback:v3 isInitialConnection:v4];
}

- (void)reselectPrimaryConnection
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 354;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d HandoverReport: no connection available after link is removed!", v1, 0x1Cu);
}

- (void)handleSecondaryConnectionRemoved
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 395;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d HandoverReport: no secondary connection available after link is removed!", v1, 0x1Cu);
}

- (int)removeConnection:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = a3;
    pthread_rwlock_wrlock(&self->super._stateRWlock);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    connectionArray = self->super._connectionArray;
    uint64_t v7 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v32 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(connectionArray);
          }
          uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (VCConnection_Equal((uint64_t)v11, (uint64_t)a3))
          {
            id v12 = v11;
            [(VCConnectionManagerIDS *)self removeFromConnectionArray:v11];
            unsigned int v13 = VCConnection_Priority((uint64_t)v11);
            if ((v13 & 0xFFFFFFFE) == 2)
            {
              [(VCConnectionManagerIDS *)self handlePrimaryConnectionRemoved];
            }
            else if (v13 <= 1)
            {
              [(VCConnectionManagerIDS *)self handleSecondaryConnectionRemoved];
            }

            goto LABEL_19;
          }
        }
        uint64_t v8 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v32 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_19:
    if ([(VCConnectionManagerIDS *)self shouldUpdateServerBasedConnection:a3])
    {
      [(VCConnectionSelector *)self->super._connectionSelector updateSelectedConnectionsForGroupType:0 connectionRemoved:a3 connectionArray:self->super._connectionArray];
      if (self->_optIntoExistingSubscribedStreams) {
        [(VCConnectionManagerDelegate *)[(VCConnectionManager *)self delegate] optOutAllStreamsForConnection:a3];
      }
      id v15 = [(VCConnectionSelector *)self->super._connectionSelector connectionForGroupType:0 isPrimary:1];
      if (v15) {
        -[VCLinkProbingHandler setQRLinkID:](self->super._linkProbingHandler, "setQRLinkID:", [NSNumber numberWithUnsignedChar:VCConnectionIDS_LinkID((uint64_t)v15)]);
      }
    }
    VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
    [(VCConnectionManagerIDS *)self resetPacketCountAndByteCountWithConnection:a3];
    [(VCConnectionManager *)self reportConnectionUpdateWithResponseCode:1 delay:2.0];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v18 = self->super._connectionArray;
        if (v18)
        {
          int v19 = (const char *)objc_msgSend((id)-[NSMutableArray description](v18, "description"), "UTF8String");
          unsigned int v18 = self->super._connectionArray;
        }
        else
        {
          int v19 = "<nil>";
        }
        int v21 = 136316162;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        int v24 = "-[VCConnectionManagerIDS removeConnection:]";
        __int16 v25 = 1024;
        int v26 = 442;
        __int16 v27 = 2080;
        uint64_t v28 = v19;
        __int16 v29 = 2048;
        uint64_t v30 = [(NSMutableArray *)v18 count];
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection array %s has %lu connections", (uint8_t *)&v21, 0x30u);
      }
    }
    pthread_rwlock_unlock(&self->super._stateRWlock);

    return 0;
  }
  else
  {
    int v14 = -2144796671;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCConnectionManagerIDS removeConnection:]();
      }
    }
  }
  return v14;
}

- (void)resetParticipantGenerationCounter
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->super._delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__VCConnectionManagerIDS_resetParticipantGenerationCounter__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __59__VCConnectionManagerIDS_resetParticipantGenerationCounter__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) delegate];

  return [v1 resetParticipantGenerationCounter];
}

- (void)optOutAllStreamsForNonPrimaryConnections
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self->_optIntoExistingSubscribedStreams)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = v3;
        __int16 v20 = 2080;
        int v21 = "-[VCConnectionManagerIDS optOutAllStreamsForNonPrimaryConnections]";
        __int16 v22 = 1024;
        int v23 = 503;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Opting out all streams for non primary connections!", buf, 0x1Cu);
      }
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    connectionArray = self->super._connectionArray;
    uint64_t v6 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(connectionArray);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (VCConnection_Priority(v10) != 2)
          {
            delegateQueue = self->super._delegateQueue;
            v12[0] = MEMORY[0x1E4F143A8];
            v12[1] = 3221225472;
            v12[2] = __66__VCConnectionManagerIDS_optOutAllStreamsForNonPrimaryConnections__block_invoke;
            v12[3] = &unk_1E6DB3E40;
            v12[4] = self;
            v12[5] = v10;
            dispatch_async(delegateQueue, v12);
          }
        }
        uint64_t v7 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v7);
    }
  }
}

uint64_t __66__VCConnectionManagerIDS_optOutAllStreamsForNonPrimaryConnections__block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 optOutAllStreamsForConnection:v3];
}

- (unsigned)getPacketCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v5 = a3;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  uint64_t v8 = &OBJC_IVAR___VCConnectionManagerIDS__receivedPacketCount;
  if (v4) {
    uint64_t v8 = &OBJC_IVAR___VCConnectionManagerIDS__sentPacketCount;
  }
  unsigned int v9 = *(_DWORD *)((char *)&self->super.super.isa + 4 * v5 + *v8);
  pthread_rwlock_unlock(p_stateRWlock);
  return v9;
}

- (unsigned)getByteCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v5 = a3;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  uint64_t v8 = &OBJC_IVAR___VCConnectionManagerIDS__receivedByteCount;
  if (v4) {
    uint64_t v8 = &OBJC_IVAR___VCConnectionManagerIDS__sentByteCount;
  }
  unsigned int v9 = *(_DWORD *)((char *)&self->super.super.isa + 4 * v5 + *v8);
  pthread_rwlock_unlock(p_stateRWlock);
  return v9;
}

- (id)getPrimaryConnectionToBeCompared
{
  int v2 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);

  return v2;
}

- (void)updateCellularMTU:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  connectionArray = self->super._connectionArray;
  uint64_t v7 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(connectionArray);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) setConnectionMTU:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v8);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)updateAllBitrateCapsForConnection:(id)a3
{
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  [(VCConnectionManagerIDS *)self updateAllBitrateCapsForConnectionInternal:a3];

  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)updateAllBitrateCapsForConnectionInternal:(id)a3
{
  objc_msgSend(a3, "setUplinkBitrateCap:", -[VCConnectionManagerIDS uplinkBitrateCapForConnection:](self, "uplinkBitrateCapForConnection:"));
  objc_msgSend(a3, "setDownlinkBitrateCap:", -[VCConnectionManagerIDS downlinkBitrateCapForConnection:](self, "downlinkBitrateCapForConnection:", a3));
  objc_msgSend(a3, "setUplinkAudioBitrateCapOneToOne:", -[VCConnectionManagerIDS uplinkAudioOnlyBitrateCapOneToOne:](self, "uplinkAudioOnlyBitrateCapOneToOne:", a3));
  uint64_t v5 = [(VCConnectionManagerIDS *)self uplinkBitrateCapOneToOne:a3];

  [a3 setUplinkBitrateCapOneToOne:v5];
}

- (void)updateCellularTech:(int)a3 forLocalInterface:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  connectionArray = self->super._connectionArray;
  uint64_t v8 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(connectionArray);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4)
        {
          VCConnection_SetLocalCellTech(v12);
          [(VCConnectionManagerIDS *)self updateAllBitrateCapsForConnectionInternal:v12];
        }
        else
        {
          VCConnection_SetRemoteCellTech(v12);
          [(VCConnectionManagerIDS *)self internalUpdateOneToOneBitrateCapsForConnection:v12];
        }
      }
      uint64_t v9 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v9);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)updateOneToOneBitrateCapsForConnection:(id)a3
{
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  [(VCConnectionManagerIDS *)self internalUpdateOneToOneBitrateCapsForConnection:a3];

  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)internalUpdateOneToOneBitrateCapsForConnection:(id)a3
{
  objc_msgSend(a3, "setUplinkAudioBitrateCapOneToOne:", -[VCConnectionManagerIDS uplinkAudioOnlyBitrateCapOneToOne:](self, "uplinkAudioOnlyBitrateCapOneToOne:"));
  uint64_t v5 = [(VCConnectionManagerIDS *)self uplinkBitrateCapOneToOne:a3];

  [a3 setUplinkBitrateCapOneToOne:v5];
}

- (void)setPreferredLocalInterfaceForDuplication:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  if (self->super._preferredLocalInterfaceForDuplication == v3)
  {
    pthread_rwlock_unlock(p_stateRWlock);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = "Cellular";
        uint64_t v10 = v6;
        int v9 = 136315906;
        uint64_t v12 = "-[VCConnectionManagerIDS setPreferredLocalInterfaceForDuplication:]";
        __int16 v11 = 2080;
        if (!v3) {
          uint64_t v8 = "WiFi";
        }
        __int16 v13 = 1024;
        int v14 = 598;
        __int16 v15 = 2080;
        long long v16 = v8;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: updated preferred local interface for duplication to %s", (uint8_t *)&v9, 0x26u);
      }
    }
    self->super._preferredLocalInterfaceForDuplication = v3;
    VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
    pthread_rwlock_unlock(p_stateRWlock);
  }
}

- (void)setPreferredRemoteInterfaceForDuplication:(unsigned __int8)a3
{
}

- (BOOL)shouldAcceptDataFromSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  uint64_t v6 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    BOOL v8 = VCConnectionIDS_MatchesChannelTokenWithSourceDestinationInfo(v6, (uint64_t)a3);
    CFRelease(v7);
  }
  else
  {
    BOOL v8 = 0;
  }
  pthread_rwlock_unlock(p_stateRWlock);
  return v8;
}

- (void)updateSessionStats:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = VCConnectionManager_CopyConnectionForQuality((uint64_t)self, 1);
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    uint64_t v7 = VCConnectionIDS_LinkID(v5);
    [(VCStatsRecorder *)self->super._statsRecorder updateSessionStats:v3 connection:v6 totalPacketSent:[(VCConnectionManagerIDS *)self getPacketCountWithIndex:v7 isOutgoing:1] totalPacketReceived:[(VCConnectionManagerIDS *)self getPacketCountWithIndex:v7 isOutgoing:0]];
    CFRelease(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionManagerIDS updateSessionStats:]();
    }
  }
}

- (void)updateStatResponseResult:(id)a3
{
}

- (void)updateEncryptionConfig:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  -[VCConnectionManager setGecoVersion:](self, "setGecoVersion:", [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A900]]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      gecoVersion = self->super._gecoVersion;
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCConnectionManagerIDS updateEncryptionConfig:]";
      __int16 v11 = 1024;
      int v12 = 725;
      __int16 v13 = 2112;
      int v14 = gecoVersion;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reported GECO version=%@", (uint8_t *)&v7, 0x26u);
    }
  }
}

- (void)addDuplicationConnectionUpdateTelemetryWithSuggestedLinkTypeCombo:(id)a3 payload:(id)a4
{
  if ([(VCConnectionManagerIDS *)self connectionForDuplication])
  {
    id v7 = [(VCConnectionManagerIDS *)self connectionForDuplication];
    VCConnectionManager_AddDuplicationSelectionLogicTelemetryForConnection((uint64_t)self, (uint64_t)v7, (uint64_t)a3, a4);
  }
}

- (void)resetPacketCountAndByteCountWithConnection:(id)a3
{
  int v4 = VCConnectionIDS_LinkID((uint64_t)a3);
  self->_sentPacketCount[v4] = 0;
  self->_sentByteCount[v4] = 0;
  self->_receivedPacketCount[v4] = 0;
  self->_receivedByteCount[v4] = 0;
}

- (BOOL)shouldKeepAllConnections
{
  return (self->super._connectionSelectionVersion - 3) < 0xFFFFFFFE;
}

- (BOOL)shouldPreferWiredConnections
{
  return (self->super._connectionSelectionVersion - 1) >= 4
      && objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-prefer-wired-over-wifi", @"preferWiredOverWiFiEnabled", &unk_1F3DC51D8, 0), "intValue") != 0;
}

- (BOOL)shouldReplaceConnection:(id)a3 withConnection:(id)a4
{
  int IsRelay = VCConnection_IsRelay((uint64_t)a4);
  if (IsRelay != VCConnection_IsRelay((uint64_t)a3)
    || (int IsRelay = VCConnection_IsIPv6((uint64_t)a4), IsRelay != VCConnection_IsIPv6((uint64_t)a3)))
  {
    LOBYTE(v8) = IsRelay ^ 1;
    return v8;
  }
  int connectionSelectionVersion = self->super._connectionSelectionVersion;
  if ((connectionSelectionVersion - 3) < 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[VCConnectionManagerIDS shouldReplaceConnection:withConnection:]();
    }
    goto LABEL_11;
  }
  if (connectionSelectionVersion != 2)
  {
LABEL_11:
    LOBYTE(v8) = 0;
    return v8;
  }
  LOBYTE(v8) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "connectionUUID"), "UUIDString"), "compare:", objc_msgSend((id)objc_msgSend(a4, "connectionUUID"), "UUIDString")) == 1;
  return v8;
}

- (BOOL)addConnectionToConnectionArray:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  connectionArray = self->super._connectionArray;
  uint64_t v6 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v50 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(connectionArray);
        }
        uint64_t v10 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        if (!VCConnectionIDS_LinkID(v10))
        {
          __int16 v11 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
          if (VCConnection_Equal((uint64_t)v11, v10))
          {
            VCConnectionManager_SetPrimaryConnection((uint64_t)self);
          }
          else if (VCConnection_Equal((uint64_t)[(VCConnectionManagerIDS *)self secondaryConnection], v10))
          {
            [(VCConnectionManagerIDS *)self setSecondaryConnection:0];
          }
          if (v11) {
            CFRelease(v11);
          }
          [(VCConnectionManagerIDS *)self removeFromConnectionArray:v10];
          goto LABEL_17;
        }
      }
      uint64_t v7 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v50 objects:v49 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  int v12 = self->super._connectionArray;
  uint64_t v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v45, v44, 16, 336);
  if (!v13)
  {
    unsigned __int8 v15 = 0;
    goto LABEL_35;
  }
  uint64_t v14 = v13;
  unsigned __int8 v15 = 0;
  uint64_t v16 = *(void *)v46;
LABEL_19:
  uint64_t v17 = 0;
  while (1)
  {
    if (*(void *)v46 != v16) {
      objc_enumerationMutation(v12);
    }
    uint64_t v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
    if (VCConnection_Equal((uint64_t)a3, (uint64_t)v18)) {
      return 0;
    }
    if (self->_isMultiwaySession) {
      goto LABEL_31;
    }
    int v19 = self->super._duplicationEnhancementEnabled
        ? [a3 isOnSameInterfacesAndQRSessionWithConnection:v18]
        : VCConnection_IsOnSameInterfacesWithConnection((uint64_t)a3);
    int v20 = v19;
    if (![(VCConnectionManagerIDS *)self shouldKeepAllConnections])
    {
      if (v20) {
        break;
      }
    }
    if (objc_msgSend(a3, "compare:isPrimary:selectionPolicy:", v18, 1, -[VCConnectionManagerIDS getConnectionSelectionPolicy](self, "getConnectionSelectionPolicy")) != 1)++v15; {
LABEL_31:
    }
    if (v14 == ++v17)
    {
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v45 objects:v44 count:16];
      if (v14) {
        goto LABEL_19;
      }
      goto LABEL_35;
    }
  }
  BOOL v24 = [(VCConnectionManagerIDS *)self shouldReplaceConnection:v18 withConnection:a3];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v24)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      long long v32 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          long long v33 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          long long v33 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v37 = v31;
        __int16 v38 = 2080;
        v39 = "-[VCConnectionManagerIDS addConnectionToConnectionArray:]";
        __int16 v40 = 1024;
        int v41 = 909;
        __int16 v42 = 2080;
        v43 = v33;
        _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: new connection %s is not added, stop keep alive", buf, 0x26u);
      }
    }
    [(VCConnectionManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(VCConnectionManagerDelegate *)[(VCConnectionManager *)self delegate] discardConnection:a3];
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v18) {
        uint64_t v28 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
      }
      else {
        uint64_t v28 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v37 = v26;
      __int16 v38 = 2080;
      v39 = "-[VCConnectionManagerIDS addConnectionToConnectionArray:]";
      __int16 v40 = 1024;
      int v41 = 915;
      __int16 v42 = 2080;
      v43 = v28;
      _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection %s is replaced, stop keep alive", buf, 0x26u);
    }
  }
  [(VCConnectionManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(VCConnectionManagerDelegate *)[(VCConnectionManager *)self delegate] discardConnection:v18];
  }
  [(VCConnectionManagerIDS *)self removeFromConnectionArray:v18];
LABEL_35:
  uint64_t v21 = VCConnectionIDS_LinkID((uint64_t)a3);
  __int16 v22 = objc_msgSend((id)objc_msgSend(a3, "connectionUUID"), "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mapLinkIDToLinkUUID, "setObject:forKeyedSubscript:", v22, [NSNumber numberWithUnsignedChar:v21]);

  [*(id *)((char *)&self->super.super.isa + v34) insertObject:a3 atIndex:v15];
  if (VCConnectionManager_IsDuplicationConnectionCandidate((uint64_t)self, (uint64_t)a3))
  {
    if ([(VCLinkProbingHandler *)self->super._linkProbingHandler isLinkProbingActive])
    {
      linkProbingHandler = self->super._linkProbingHandler;
      uint64_t v35 = [NSNumber numberWithInt:VCConnection_ConnectionID((uint64_t)a3)];
      -[VCLinkProbingHandler startActiveProbingOnLinks:](linkProbingHandler, "startActiveProbingOnLinks:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1]);
    }
    else if (!VCConnectionManager_AreAllLinkProbingTriggersInactive((uint64_t)self))
    {
      VCConnectionManager_SetActiveLinkProbingEnabled((uint64_t)self, 1);
    }
  }
  IsLocalOnWiFuint64_t i = VCConnection_IsLocalOnWiFi((uint64_t)a3);
  [(VCConnectionManagerIDS *)self updateDuplicationStateWithConnectionOperation:0 isLocalOnWiFi:IsLocalOnWiFi isRemoteOnWiFi:VCConnection_IsRemoteOnWiFi((uint64_t)a3)];
  return 1;
}

- (void)removeFromConnectionArray:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(VCLinkProbingHandler *)self->super._linkProbingHandler isLinkProbingActive])
  {
    linkProbingHandler = self->super._linkProbingHandler;
    v7[0] = [NSNumber numberWithInt:VCConnection_ConnectionID((uint64_t)a3)];
    -[VCLinkProbingHandler stopActiveProbingOnLinks:resetStats:](linkProbingHandler, "stopActiveProbingOnLinks:resetStats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1], 1);
  }
  IsLocalOnWiFuint64_t i = VCConnection_IsLocalOnWiFi((uint64_t)a3);
  [(VCConnectionManagerIDS *)self updateDuplicationStateWithConnectionOperation:1 isLocalOnWiFi:IsLocalOnWiFi isRemoteOnWiFi:VCConnection_IsRemoteOnWiFi((uint64_t)a3)];
  [(NSMutableArray *)self->super._connectionArray removeObject:a3];
}

- (void)updateDuplicationStateWithConnectionOperation:(int)a3 isLocalOnWiFi:(BOOL)a4 isRemoteOnWiFi:(BOOL)a5
{
  uint64_t v6 = 0x100000000;
  if (!a4) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v6 | a3;
  uint64_t v8 = 0x10000000000;
  if (!a5) {
    uint64_t v8 = 0;
  }
  if (VCDuplicationHandler_HandleDuplicationStateUpdateEvent(self->super._duplicationHandler, 13, v7 | v8))
  {
    int v9 = [(VCConnectionManager *)self isDuplicationEnabled];
    VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, v9);
  }
}

- (void)updateNegotiatedSettingsOnetoOne:(id)a3
{
}

- (void)reportConnection:(id)a3 isInitialConnection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)a3);
  if (![(VCConnectionManager *)self isOneToOneModeEnabled] || IsEndToEndLink)
  {
    int v8 = VCConnection_Priority((uint64_t)a3);
    if (self->super._reportingAgent)
    {
      unsigned int v27 = v8 & 0xFFFFFFFE;
      if (VCConnection_IsRelay((uint64_t)a3)) {
        int v9 = "relay";
      }
      else {
        int v9 = "p2p";
      }
      uint64_t v10 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a3, 1);
      uint64_t v11 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a3, 0);
      if (v4)
      {
        int relayServerProvider = self->super._relayServerProvider;
        uint64_t v13 = "QRSUN";
        if (relayServerProvider == 2) {
          uint64_t v13 = "QRSAP";
        }
        if (relayServerProvider == 1) {
          uint64_t v14 = "QRSAK";
        }
        else {
          uint64_t v14 = v13;
        }
      }
      else
      {
        uint64_t v14 = "";
      }
      [a3 sharedDigestKey];
      reportingSetDigestKey();
      uint64_t v17 = [a3 relaySessionToken];
      BOOL EyeContactEnabledBoolValue = VCDefaults_GetEyeContactEnabledBoolValue(1);
      v29[0] = @"ConnectionType";
      v30[0] = [NSString stringWithUTF8String:v9];
      v30[1] = &stru_1F3D3E450;
      v29[1] = @"LocalCandidate";
      v29[2] = @"RemoteCandidate";
      v30[2] = [NSString stringWithUTF8String:v14];
      v29[3] = @"LocalInterfaceType";
      v30[3] = [NSString stringWithUTF8String:v10];
      v29[4] = @"RemoteInterfaceType";
      v30[4] = [NSString stringWithUTF8String:v11];
      v29[5] = @"relayServer";
      v30[5] = [NSString stringWithUTF8String:v14];
      v29[6] = @"relayType";
      v30[6] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "type"));
      v29[7] = @"VPN";
      int v19 = [a3 isVPN];
      int v20 = &unk_1F3DC51F0;
      if (v19) {
        int v20 = &unk_1F3DC51D8;
      }
      uint64_t v21 = @"Unknown";
      if (v17) {
        uint64_t v21 = (__CFString *)v17;
      }
      v30[7] = v20;
      v30[8] = v21;
      v29[8] = @"IDSToken";
      v29[9] = @"VPCENABLED";
      v30[9] = [NSNumber numberWithBool:EyeContactEnabledBoolValue];
      v29[10] = @"EndToEnd";
      if (IsEndToEndLink) {
        __int16 v22 = "1";
      }
      else {
        __int16 v22 = "0";
      }
      v30[10] = [NSString stringWithUTF8String:v22];
      v29[11] = @"QuicPod";
      v30[11] = [NSNumber numberWithBool:VCConnectionIDS_IsQUICPod((uint64_t)a3)];
      v29[12] = @"Rpsd";
      v30[12] = +[VCConnectionIDS VCConnectionIDS_RPS:a3];
      v29[13] = @"Cpsd";
      v30[13] = +[VCConnectionIDS VCConnectionIDS_CDBPS:a3];
      v29[14] = @"ConnProtocolType";
      v30[14] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "linkConnectionType"));
      v29[15] = @"MaxMTU";
      v30[15] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "maxConnectionMTU"));
      v29[16] = @"sliceStatus";
      v30[16] = [NSNumber numberWithUnsignedChar:VCConnection_ReportingSliceStatus((uint64_t)a3)];
      v29[17] = @"RemoteSliceStatus";
      v30[17] = [NSNumber numberWithUnsignedChar:VCConnection_ReportingSliceStatus((uint64_t)a3)];
      int v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v30, v29, 18), "mutableCopy");
      CFStringRef v24 = VCConnectionManager_CopySuggestedLinkTypeCombo((uint64_t)self);
      if (v24)
      {
        CFStringRef v25 = v24;
        [v23 setObject:v24 forKeyedSubscript:@"SLTS"];
        CFRelease(v25);
      }
      if (v27 == 2) {
        VCConnectionManager_AddTelemetryForPacketHistoryInternal((uint64_t)self, (uint64_t)v23);
      }
      uint64_t v26 = [NSString stringWithFormat:@"%@_ABT", @"QuicPod"];
      objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->super._gftTLEEnabled), v26);
      [v23 setObject:self->super._gecoVersion forKeyedSubscript:@"GECO_ABT"];
      VCConnectionManager_AddTelemetryForConnection((uint64_t)self, (uint64_t)a3, v23);
      VCConnection_ReportingQRServerConfig((uint64_t)a3);
      reportingGenericEvent();

      v28.receiver = self;
      v28.super_class = (Class)VCConnectionManagerIDS;
      [(VCConnectionManager *)&v28 reportConnection:a3 isInitialConnection:v4];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v32 = v15;
        __int16 v33 = 2080;
        uint64_t v34 = "-[VCConnectionManagerIDS reportConnection:isInitialConnection:]";
        __int16 v35 = 1024;
        int v36 = 1012;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d reportConnection: reportingAgent is nil, can not report connections", buf, 0x1Cu);
      }
    }
  }
}

- (void)reportCurrentPrimaryConnection
{
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  [(VCConnectionManagerIDS *)self reportConnection:(id)VCConnectionManager_CopyPrimaryConnection((uint64_t)self) isInitialConnection:1];

  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)useConnectionAsPrimary:(id)a3
{
}

- (BOOL)shouldDropCurrentPrimaryConnectionWithConnectionStats:(id *)a3
{
  if ((self->super._connectionSelectionVersion - 1) < 2
    || self->super._localConnectionStats.isConnectionPaused
    || self->super._remoteConnectionStats.isConnectionPaused)
  {
    goto LABEL_4;
  }
  id v6 = (id)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  int v4 = [v6 isVPN];
  if (!v4) {
    return v4;
  }
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  if ((unint64_t)[(NSMutableArray *)self->super._connectionArray count] < 2
    || ((uint64_t v7 = [(NSMutableArray *)self->super._connectionArray objectAtIndex:1],
         int IsEndToEndLink = VCConnection_IsEndToEndLink(v7),
         ![(VCConnectionManager *)self isOneToOneModeEnabled])
     || (IsEndToEndLink & 1) == 0)
    && (([(VCConnectionManager *)self isOneToOneModeEnabled] | IsEndToEndLink) & 1) != 0)
  {
    pthread_rwlock_unlock(&self->super._stateRWlock);
LABEL_4:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (self->super._connectionSelectionVersion == 3)
  {
    char v9 = [v6 isOnSameInterfacesAndQRSessionWithConnection:v7];
    pthread_rwlock_unlock(&self->super._stateRWlock);
    if ((v9 & 1) == 0) {
      goto LABEL_4;
    }
  }
  else
  {
    int v10 = VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v6);
    pthread_rwlock_unlock(&self->super._stateRWlock);
    if (!v10) {
      goto LABEL_4;
    }
  }
  if (a3->var4 <= 5.0) {
    goto LABEL_4;
  }
  LOBYTE(v4) = !self->super._enableDuplication;
  return v4;
}

- (BOOL)shouldUpdateServerBasedConnection:(id)a3
{
  if (self->_isMultiwaySession) {
    return VCConnection_IsEndToEndLink((uint64_t)a3) ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)canOptOutAllStreamsForConnection:(id)a3
{
  if (self->_isMultiwaySession && !self->_optIntoExistingSubscribedStreams) {
    return VCConnection_IsEndToEndLink((uint64_t)a3) ^ 1;
  }
  else {
    return 0;
  }
}

- (void)startActiveProbingWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if ([(VCConnectionManager *)self delegate])
  {
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__VCConnectionManagerIDS_startActiveProbingWithOptions___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __56__VCConnectionManagerIDS_startActiveProbingWithOptions___block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 startActiveProbingWithOptions:v3];
}

- (void)stopActiveProbingWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if ([(VCConnectionManager *)self delegate])
  {
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__VCConnectionManagerIDS_stopActiveProbingWithOptions___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __55__VCConnectionManagerIDS_stopActiveProbingWithOptions___block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 stopActiveProbingWithOptions:v3];
}

- (void)queryProbingResultsWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if ([(VCConnectionManager *)self delegate])
  {
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__VCConnectionManagerIDS_queryProbingResultsWithOptions___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __57__VCConnectionManagerIDS_queryProbingResultsWithOptions___block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 queryProbingResultsWithOptions:v3];
}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if ([(VCConnectionManager *)self delegate])
  {
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__VCConnectionManagerIDS_flushLinkProbingStatusWithOptions___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __60__VCConnectionManagerIDS_flushLinkProbingStatusWithOptions___block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 flushLinkProbingStatusWithOptions:v3];
}

- (void)didUpdateLinkPreferenceOrder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCConnectionManagerIDS didUpdateLinkPreferenceOrder:]";
      __int16 v12 = 1024;
      int v13 = 1175;
      __int16 v14 = 2112;
      uint64_t v15 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"description"), "componentsJoinedByString:", @",");
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Updated link preference order: %@", (uint8_t *)&v8, 0x26u);
    }
  }
  [(VCConnectionSelector *)self->super._connectionSelector setLinkPreferenceOrder:a3];
  VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)didLinkProbingLockdownEnd
{
  if (!VCConnectionManager_AreAllLinkProbingTriggersInactive((uint64_t)self))
  {
    VCConnectionManager_SetActiveLinkProbingEnabled((uint64_t)self, 1);
  }
}

- (void)requestStatsWithOptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->super._delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCConnectionManagerIDS_requestStatsWithOptions___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __50__VCConnectionManagerIDS_requestStatsWithOptions___block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 requestStatsWithOptions:v3];
}

- (void)didReceiveStatsResponse:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  callbackQueue = self->super._callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCConnectionManagerIDS_didReceiveStatsResponse___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  BOOL v5 = a3;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __50__VCConnectionManagerIDS_didReceiveStatsResponse___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1) {
    int v3 = 3;
  }
  else {
    int v3 = 2;
  }
  VCConnectionManager_UpdateNetworkOutageStatus(v2, v3);
}

- ($85B13D066EE34EC5DDC86B20300AB7FA)getConnectionSelectionPolicy
{
  return [(VCConnectionSelector *)self->super._connectionSelector getConnectionSelectionPolicy];
}

- (void)updateConnectionSelectionPolicyWithPreferE2E:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  v6[0] = self->super._preferRelayOverP2PEnabled;
  v6[1] = 0;
  v6[2] = [(VCConnectionManagerIDS *)self shouldKeepAllConnections];
  v6[3] = self->_isMultiwaySession;
  v6[4] = a3;
  v6[5] = [(VCConnectionManagerIDS *)self shouldPreferWiredConnections];
  [(VCConnectionSelector *)self->super._connectionSelector updateConnectionSelectionPolicy:v6];
  pthread_rwlock_unlock(p_stateRWlock);
}

- (id)secondaryConnection
{
  return [(VCConnectionSelector *)self->super._connectionSelector secondaryConnection];
}

- (id)connectionForDuplication
{
  uint64_t v2 = (void *)VCConnectionSelector_CopyConnectionForDuplication((uint64_t)self->super._connectionSelector);

  return v2;
}

- (id)lastPrimaryConnectionInUse
{
  return [(VCConnectionSelector *)self->super._connectionSelector lastPrimaryConnectionInUse];
}

- (void)setSecondaryConnection:(id)a3
{
}

- (void)setConnectionForDuplication:(id)a3
{
}

- (void)setLastPrimaryConnectionInUse:(id)a3
{
}

- (void)setOptIntoExistingSubscribedStreams:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  self->_optIntoExistingSubscribedStreams = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  connectionArray = self->super._connectionArray;
  uint64_t v6 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(connectionArray);
        }
        __int16 v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((VCConnection_IsEndToEndLink((uint64_t)v10) & 1) == 0)
        {
          id v11 = v10;
          delegateQueue = self->super._delegateQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __62__VCConnectionManagerIDS_setOptIntoExistingSubscribedStreams___block_invoke;
          block[3] = &unk_1E6DB3E40;
          block[4] = v10;
          void block[5] = self;
          dispatch_async(delegateQueue, block);
        }
      }
      uint64_t v7 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v7);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

void __62__VCConnectionManagerIDS_setOptIntoExistingSubscribedStreams___block_invoke(uint64_t a1)
{
  int v2 = VCConnection_Priority(*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v3 + 7706)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 2;
  }
  if (v4)
  {
    if (!*(unsigned char *)(v3 + 7706)) {
      goto LABEL_13;
    }
    goto LABEL_7;
  }
  if (v2
    || (BOOL IsDuplicationEnabled = VCDuplicationHandler_IsDuplicationEnabled(*(void *)(v3 + 632)),
        uint64_t v3 = *(void *)(a1 + 40),
        !IsDuplicationEnabled))
  {
    objc_msgSend((id)objc_msgSend((id)v3, "delegate"), "optOutAllStreamsForConnection:", *(void *)(a1 + 32));
    goto LABEL_13;
  }
  if (*(unsigned char *)(v3 + 7706)) {
LABEL_7:
  }
    objc_msgSend((id)objc_msgSend((id)v3, "delegate"), "optIntoExistingSubscribedStreamsForConnection:", *(void *)(a1 + 32));
LABEL_13:
  uint64_t v6 = *(void **)(a1 + 32);
}

- (BOOL)isEndToEndLinkAvailable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  connectionArray = self->super._connectionArray;
  uint64_t v5 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(connectionArray);
        }
        if (VCConnection_IsEndToEndLink(*(void *)(*((void *)&v12 + 1) + 8 * i)))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v12 objects:v11 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:
  pthread_rwlock_unlock(p_stateRWlock);
  return v9;
}

- (BOOL)isEndToEndLinkWithCellAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  connectionArray = self->super._connectionArray;
  uint64_t v7 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(connectionArray);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (VCConnection_IsEndToEndLink(v11)
          && (v3 && (VCConnection_IsLocalOnCellular(v11) & 1) != 0 || (VCConnection_IsRemoteOnCellular(v11) & 1) != 0))
        {
          BOOL v12 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v15 objects:v14 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_14:
  pthread_rwlock_unlock(p_stateRWlock);
  return v12;
}

- (BOOL)optIntoExistingSubscribedStreams
{
  return self->_optIntoExistingSubscribedStreams;
}

uint64_t ___VCConnectionManagerIDS_SynchronizeParticipantGenerationCounter_block_invoke(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 updateParticipantGenerationCounter:v3];
}

void ___VCConnectionManagerIDS_UpdateConnectionForDuplication_block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEnableDuplication:activeConnection:", *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
  if (*(unsigned char *)(a1 + 57) != 4)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(*(id *)(a1 + 32), "addDuplicationConnectionUpdateTelemetryWithSuggestedLinkTypeCombo:payload:", *(void *)(a1 + 48));
    int v2 = *(const void **)(a1 + 48);
    if (v2) {
      CFRelease(v2);
    }
    VCConnectionManager_AddLinkProbingTelemetry(*(void *)(a1 + 32));
    reportingGenericEvent();
  }
}

- (void)addConnection:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  id v3 = "-[VCConnectionManagerIDS addConnection:]";
  __int16 v4 = 1024;
  int v5 = 228;
  __int16 v6 = v0;
  uint64_t v7 = "-[VCConnectionManagerIDS addConnection:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d HandoverReport: %s received a nil VCConnection!", v2, 0x26u);
}

- (void)removeConnection:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  id v3 = "-[VCConnectionManagerIDS removeConnection:]";
  __int16 v4 = 1024;
  int v5 = 404;
  __int16 v6 = v0;
  uint64_t v7 = "-[VCConnectionManagerIDS removeConnection:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d HandoverReport: %s received a nil VCConnection!", v2, 0x26u);
}

- (void)updateSessionStats:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 707;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d Connection is NIL", v1, 0x1Cu);
}

- (void)shouldReplaceConnection:withConnection:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 864;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d HandoverReport: Should not call this to choose one of the connections!", v1, 0x1Cu);
}

@end