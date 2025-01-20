@interface IDSUTunController
+ (IDSUTunController)sharedInstance;
- (BOOL)handleIncomingPacket:(id *)a3 fromDeviceToken:(id)a4;
- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (BOOL)setupIPsecLinkForDeviceConnectionInfo:(id)a3;
- (BOOL)setupUTunForDeviceConnectionInfo:(id)a3;
- (IDSLinkManager)linkManager;
- (IDSUTunController)init;
- (IDSUTunController)initWithName:(id)a3 address:(id)a4 andTestTransport:(id)a5;
- (id)_prepareConnectionInfoWithCBUUID:(id)a3 deviceUniqueID:(id)a4 shouldUseIPsecLink:(BOOL)a5 identityPair:(id)a6 remoteDeviceEncryptionInfo:(id)a7;
- (id)controlChannelVersionForCbuuid:(id)a3;
- (id)copyLinkStatsDict;
- (id)defaultPairedDeviceIdentityPair;
- (id)onTransportThread_PerServiceDataTransferredForDevice:(id)a3 services:(id)a4;
- (id)perServiceDataReceivedForDevice:(id)a3 services:(id)a4;
- (id)perServiceDataSentForDevice:(id)a3 services:(id)a4;
- (id)perServiceDataTransferredForDevice:(id)a3 services:(id)a4;
- (id)setupNewDeviceConnectionInfoForCbuuid:(id)a3 deviceUniqueID:(id)a4 identityPair:(id)a5 remoteDeviceEncryptionInfo:(id)a6 shouldUseIPsecLink:(BOOL)a7;
- (id)stringComponentsForServiceConnectorService:(id)a3;
- (int)processCompressionRequest:(id)a3 fromDeviceConnectionInfo:(id)a4;
- (int)processCompressionResponse:(id)a3 fromDeviceConnectionInfo:(id)a4;
- (unint64_t)onTransportThread_SendToGlobalLinkWithSessionID:(id)a3 packetBuffer:(id *)a4;
- (unint64_t)onTransportThread_SendToGlobalLinkWithSessionID:(id)a3 packetBufferArray:(id *)a4 arraySize:(int)a5;
- (unint64_t)onTransportThread_SendWithConnectionContext:(id)a3 packetBuffer:(id *)a4;
- (unint64_t)onTransportThread_createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5;
- (unint64_t)onTransportThread_getLinkType:(id)a3;
- (unint64_t)onTransportThread_participantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5;
- (unint64_t)totalPacketsReceivedForDevice:(id)a3 services:(id)a4;
- (unint64_t)totalPacketsSentForDevice:(id)a3 services:(id)a4;
- (unsigned)handleUtunChannelWrite:(id)a3 source:(sockaddr *)a4 destination:(sockaddr *)a5 upperProtocol:(unsigned __int8)a6 bytes:(const void *)a7 bytesLen:(unint64_t)a8;
- (void)_getStallDetectorForConnection:(id)a3 deviceConnecionInfo:(id)a4;
- (void)_reloadSettings;
- (void)addPairedDevice:(id)a3;
- (void)addPairedDevice:(id)a3 shouldPairDirectlyOverIPsec:(BOOL)a4;
- (void)checkSuspendTrafficForDevice:(id)a3 wait:(BOOL)a4;
- (void)cleanupSocketsForClient:(id)a3;
- (void)clearCellInterfaceName:(id)a3;
- (void)clearIDSContextBlob:(id)a3;
- (void)clearPluginCacheForSession:(id)a3;
- (void)clearReliableUnicastStateForSession:(id)a3;
- (void)clearSharedSessionHasJoinedForIDSSession:(id)a3;
- (void)clearStats;
- (void)closeDataConnectionWithDeviceConnectionInfo:(id)a3 options:(id)a4;
- (void)closeSocketWithOptions:(id)a3;
- (void)closeSocketWithOptions:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)connectGlobalLinkForDevice:(id)a3 sessionInfo:(id)a4 connectReadyHandler:(id)a5 withLocalInterfacePreference:(int)a6;
- (void)connectPairedDevice:(id)a3;
- (void)createConnectionDataForDevice:(id)a3 localPartyID:(id)a4 dataReadyHandler:(id)a5;
- (void)deletePairedDevice:(id)a3;
- (void)didConnectControlChannelForDeviceConnectionInfo:(id)a3 connection:(id)a4 error:(id)a5;
- (void)didUpdatePairedDevice:(id)a3;
- (void)disconnectGlobalLinkForDevice:(id)a3 isReinitiating:(BOOL)a4 completionHandler:(id)a5;
- (void)doCheckSuspendTrafficForDevice:(id)a3;
- (void)getLinkInformationForDevice:(id)a3 completionHandler:(id)a4;
- (void)handleAllocateRequestFailureForDevice:(id)a3 requestID:(id)a4 errorCode:(int)a5;
- (void)handleIPPayload:(const void *)a3 bytesLength:(unint64_t)a4 source:(sockaddr *)a5 destination:(sockaddr *)a6 upperProtocol:(unsigned __int8)a7 forDeviceConnectionInfo:(id)a8 flush:(BOOL)a9 callerShouldStop:(BOOL *)a10;
- (void)handleUtunChannelRead:(id)a3 limit:(unsigned int)a4;
- (void)internalOpenSocketWithDestination:(id)a3 localSA:(id)a4 remoteSA:(id)a5 protocol:(int)a6 trafficClass:(int)a7 completionHandler:(id)a8;
- (void)internalStartConnectionWithEndpoint:(id)a3 service:(const char *)a4 parameters:(id)a5 serviceConnector:(id)a6 completionHandler:(id)a7;
- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 hasSpaceAvailable:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)obliterateConnectionInfoForCBUUID:(id)a3;
- (void)obliterateConnectionInfoForCBUUID:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5;
- (void)obliterateConnectionInfoWithCompletionBlock:(id)a3 completionQueue:(id)a4;
- (void)onTransportThread_CurrentCellularSignalStrength:(id)a3 signalRaw:(int *)a4 signalStrength:(int *)a5 signalGrade:(int *)a6;
- (void)onTransportThread_DropIPPackets:(id)a3 linkID:(char)a4 payloadArray:(id)a5;
- (void)onTransportThread_SendKeyMaterialMessage:(id)a3 relayGroupID:(id)a4 keyMaterialMessageData:(id)a5 destinationURIs:(id)a6 completionHandler:(id)a7;
- (void)onTransportThread_SendSKEData:(id)a3 skeData:(id)a4 completionHandler:(id)a5;
- (void)onTransportThread_SetDefaultUnderlyingLink:(id)a3 linkID:(char)a4;
- (void)onTransportThread_SetPacketNotificationFilter:(id)a3 linkID:(char)a4 uniqueTag:(unsigned int)a5 isEnabled:(BOOL)a6;
- (void)onTransportThread_StopBTDatagramLinkForDefaultPairedDevice;
- (void)onTransportThread_StopKeepAlive:(id)a3 linkIDs:(id)a4;
- (void)onTransportThread_UpdateProtocolQualityOfService:(id)a3 linkID:(char)a4 isGood:(BOOL)a5;
- (void)onTransportThread_flushLinkProbingStatus:(id)a3 options:(id)a4;
- (void)onTransportThread_getSessionInfo:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 options:(id)a6;
- (void)onTransportThread_manageDesignatedDestinationsWithSessionID:(id)a3 destinations:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6;
- (void)onTransportThread_queryLinkProbingStatus:(id)a3 options:(id)a4;
- (void)onTransportThread_receiveJoinNotificationFromAParticipant:(id)a3;
- (void)onTransportThread_registerPluginForGroup:(id)a3 relayGroupID:(id)a4 options:(id)a5;
- (void)onTransportThread_removeParticipantIDsWithSessionID:(id)a3 participantIDs:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)onTransportThread_reportLinkEventForSessionID:(id)a3 eventName:(id)a4 linkID:(unsigned __int8)a5;
- (void)onTransportThread_reportLinkMetricsForSessionID:(id)a3 linkID:(unsigned __int8)a4 lastPacketReceivedTime:(double)a5 lastPacketSentTime:(double)a6;
- (void)onTransportThread_requestChildConnectionIDForLinkID:(char)a3 sessionID:(id)a4;
- (void)onTransportThread_requestMaterialsForSession:(id)a3 participantIDs:(id)a4 materialType:(int)a5;
- (void)onTransportThread_sendConnectedLinkInfoToAVCForSessionID:(id)a3;
- (void)onTransportThread_sendStatsRequest:(id)a3 options:(id)a4;
- (void)onTransportThread_sendStatsRequestWithOptions:(id)a3 options:(id)a4;
- (void)onTransportThread_setClientUniquePID:(unint64_t)a3 sessionID:(id)a4;
- (void)onTransportThread_setRemoteDeviceVersion:(id)a3 version:(unsigned int)a4;
- (void)onTransportThread_setServerDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5;
- (void)onTransportThread_setUPlusOneModeForSessionID:(id)a3 isUPlusOneEnabled:(BOOL)a4;
- (void)onTransportThread_setWiFiAssistState:(id)a3 isWiFiAssistEnabled:(BOOL)a4;
- (void)onTransportThread_startLinkProbing:(id)a3 options:(id)a4;
- (void)onTransportThread_stopLinkProbing:(id)a3 options:(id)a4;
- (void)onTransportThread_updateParticipantType:(unsigned __int16)a3 forSessionID:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)onTransportThread_updateSessionParticipants:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 participants:(id)a6;
- (void)onTransportThread_updateSessionURIToParticipantIDs:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 sessionInfo:(id)a6;
- (void)openSocketWithOptions:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)prepareControlChannelForDeviceConnectionInfo:(id)a3 genericConnection:(id)a4;
- (void)prepareDefaultPairedConnectionInfoWithDeviceUniqueID:(id)a3 shouldUseIPsecLink:(BOOL)a4;
- (void)processRemoteConnectionDataForDevice:(id)a3 remoteConnectionData:(id)a4 completionHandler:(id)a5;
- (void)receiveControlChannelMessage:(id)a3 fromCbuuid:(id)a4 deviceUniqueID:(id)a5;
- (void)releasePortIfNecessary:(IDSPortMap *)a3 port:(unsigned __int16)a4;
- (void)reloadSettings;
- (void)removeConnection:(id)a3 fromDeviceConnectionInfo:(id)a4 removeCode:(int64_t)a5 removeReason:(id)a6;
- (void)resetAllConnectionsForDevice:(id)a3;
- (void)resetIPsecTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4;
- (void)resetTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4;
- (void)resetUTunTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4;
- (void)resumeSocketWithOptions:(id)a3 shouldLogCall:(BOOL)a4;
- (void)sendOTRNegotiationMessage:(id)a3 negotiationCount:(unsigned int)a4 negotiationData:(id)a5;
- (void)sendSuspendOTRNegotiationMessage:(id)a3;
- (void)setAcceptedRelaySession:(id)a3 relaySessionID:(id)a4 options:(id)a5;
- (void)setAllowP2PforIDSSession:(id)a3 isEnabled:(BOOL)a4;
- (void)setCellInterfaceName:(id)a3 forIDSSession:(id)a4;
- (void)setForceTCPFallbackOnCell:(id)a3 forceTCPFallbackOnCell:(BOOL)a4;
- (void)setForceTCPFallbackOnWiFi:(id)a3 forceTCPFallbackOnWiFi:(BOOL)a4;
- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4;
- (void)setIDSContextBlob:(id)a3 forIDSSession:(id)a4;
- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4 forIDSSession:(id)a5;
- (void)setLinkPreferences:(id)a3;
- (void)setPreferInfraWiFi:(BOOL)a3;
- (void)setSharedSessionHasJoined:(BOOL)a3 forIDSSession:(id)a4;
- (void)setTimeBase:(id)a3 forIDSSession:(id)a4;
- (void)setupDataConnectionWithDeviceConnectionInfo:(id)a3 options:(id)a4;
- (void)startCompressionForConnection:(id)a3 deviceConnectionInfo:(id)a4;
- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6;
- (void)startControlChannelWithDevice:(id)a3 endpoint:(id)a4;
- (void)startDataChannelWithDevice:(id)a3 genericConnection:(id)a4 serviceConnectorService:(id)a5 endpoint:(id)a6;
- (void)startGlobalLinkForDevice:(id)a3;
- (void)startLocalSetup;
- (void)startUDPGlobalLinkForDevice:(id)a3;
- (void)stopGlobalLinkForDevice:(id)a3;
- (void)stopUDPGlobalLinkForDevice:(id)a3;
- (void)suspendSocketWithOptions:(id)a3;
- (void)tearDownEncryptionForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
@end

@implementation IDSUTunController

- (void)disconnectGlobalLinkForDevice:(id)a3 isReinitiating:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  IDSTransportThreadAddBlock();
}

+ (IDSUTunController)sharedInstance
{
  if (qword_100A4C838 != -1) {
    dispatch_once(&qword_100A4C838, &stru_100989E50);
  }
  v2 = (void *)qword_100A4C840;

  return (IDSUTunController *)v2;
}

- (void)reloadSettings
{
}

- (void)_reloadSettings
{
  IMSyncronizeAppPreferences();
  self->_BOOL logPackets = IMGetDomainBoolForKey();
  v3 = +[IMLockdownManager sharedInstance];
  unsigned int v4 = [v3 isInternalInstall];

  if (v4)
  {
    self->_BOOL encryptionEnabled = IMGetDomainBoolForKeyWithDefaultValue();
    self->_BOOL encryptionEnabled = IMGetDomainBoolForKeyWithDefaultValue() ^ 1;
    self->_BOOL controlChannelEncryptionDisabled = IMGetDomainBoolForKeyWithDefaultValue();
    self->_BOOL vifShouldReadMultiple = IMGetDomainBoolForKeyWithDefaultValue();
    v5 = IMGetDomainValueForKey();
    unsigned int v6 = [v5 unsignedIntValue];
    if (v6) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = 16;
    }
    self->_unsigned int vifMaxPendingPackets = v7;

    if (self->_vifMaxPendingPackets >= 0x41) {
      self->_unsigned int vifMaxPendingPackets = 64;
    }
    id v8 = +[IMUserDefaults fixedInterface];
    if (v8)
    {
      id v9 = +[IMUserDefaults fixedInterfaceDestination];
      self->_hasFixedDestination = v9 != 0;
    }
    else
    {
      self->_hasFixedDestination = 0;
    }

    self->_ignoreUTunChannelWriteSignal = IMGetDomainBoolForKeyWithDefaultValue();
  }
  else
  {
    *(_WORD *)&self->_BOOL encryptionEnabled = 1;
  }
  self->_BOOL vifUseChannel = IMGetDomainBoolForKey() ^ 1;
  v10 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL logPackets = self->_logPackets;
    BOOL encryptionEnabled = self->_encryptionEnabled;
    BOOL controlChannelEncryptionDisabled = self->_controlChannelEncryptionDisabled;
    BOOL vifUseChannel = self->_vifUseChannel;
    BOOL vifShouldReadMultiple = self->_vifShouldReadMultiple;
    unsigned int vifMaxPendingPackets = self->_vifMaxPendingPackets;
    CFStringRef v17 = @"YES";
    if (!self->_ignoreUTunChannelWriteSignal) {
      CFStringRef v17 = @"NO";
    }
    int elementCount = self->_deviceConnectionInfoTableByCbuuid.elementCount;
    *(_DWORD *)buf = 67110914;
    BOOL v21 = logPackets;
    __int16 v22 = 1024;
    BOOL v23 = encryptionEnabled;
    __int16 v24 = 1024;
    BOOL v25 = controlChannelEncryptionDisabled;
    __int16 v26 = 1024;
    BOOL v27 = vifUseChannel;
    __int16 v28 = 1024;
    BOOL v29 = vifShouldReadMultiple;
    __int16 v30 = 1024;
    unsigned int v31 = vifMaxPendingPackets;
    __int16 v32 = 2112;
    CFStringRef v33 = v17;
    __int16 v34 = 1024;
    int v35 = elementCount;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Loaded settings: utunLogPackets:%d dataChannelEncryptionEnabled:%d controlChannelEncryptionDisabled:%d utunChannel:%d readmultiple:%d/%d ignoreUTunChannelWriteSignal:%@ (devices:%d)", buf, 0x36u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10035744C;
  v19[3] = &unk_100989E98;
  v19[4] = self;
  sub_1003F23AC((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v19);
}

- (void)_getStallDetectorForConnection:(id)a3 deviceConnecionInfo:(id)a4
{
  id v6 = a3;
  unsigned int v7 = [a4 cbuuid];
  unsigned int v8 = [v7 isEqualToString:kIDSDefaultPairedDeviceID];

  if (!v8) {
    goto LABEL_18;
  }
  id v9 = +[IMLockdownManager sharedInstance];
  unsigned int v10 = [v9 isInternalInstall];

  if (!v10) {
    goto LABEL_18;
  }
  v11 = [v6 connectionID];

  if (v11)
  {
    v12 = [v6 connectionID];
    v13 = [v12 service];
    unsigned int v14 = [v13 isEqualToString:@"localdelivery"];

    if (!v14) {
      goto LABEL_18;
    }
    v15 = [v6 connectionID];
    v16 = [v15 name];
    unsigned int v17 = [v16 isEqualToString:@"UTunDelivery-Default-Urgent"];

    if (v17)
    {
      CFStringRef v18 = @"kUTunConnectionDefaultUrgentOutgoingDetectorName";
    }
    else
    {
      __int16 v24 = [v6 connectionID];
      BOOL v25 = [v24 name];
      unsigned int v26 = [v25 isEqualToString:@"UTunDelivery-Default-Default"];

      if (!v26) {
        goto LABEL_14;
      }
      CFStringRef v18 = @"kUTunConnectionDefaultDefaultOutgoingDetectorName";
    }
  }
  else
  {
    v19 = [v6 addressPair];
    v20 = [v19 localAddress];
    if ([v20 saPortHostOrder] != 1024)
    {

      goto LABEL_14;
    }
    BOOL v21 = [v6 addressPair];
    __int16 v22 = [v21 remoteAddress];
    unsigned int v23 = [v22 saPortHostOrder];

    if (!v23) {
      goto LABEL_14;
    }
    CFStringRef v18 = @"kUTunConnectionControlChannelOutgoingDetectorName";
  }
  [v6 setOutgoingStallDetectorName:v18];
  [v6 _createStallDetectorWithName:v18];
LABEL_14:
  BOOL v27 = [v6 outgoingStallDetectorName];

  if (v27)
  {
    __int16 v28 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v29 = [v6 outgoingStallDetectorName];
      int v30 = 138412546;
      unsigned int v31 = self;
      __int16 v32 = 2112;
      CFStringRef v33 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: created the stall detector for %@", (uint8_t *)&v30, 0x16u);
    }
  }
LABEL_18:
}

- (void)handleIPPayload:(const void *)a3 bytesLength:(unint64_t)a4 source:(sockaddr *)a5 destination:(sockaddr *)a6 upperProtocol:(unsigned __int8)a7 forDeviceConnectionInfo:(id)a8 flush:(BOOL)a9 callerShouldStop:(BOOL *)a10
{
  int v10 = a7;
  unsigned int v14 = a8;
  if (a10) {
    *a10 = 0;
  }
  if (v10 == 17) {
    kdebug_trace();
  }
  v180 = self;
  if (a4 > 7)
  {
    if (v10 != 6 && v10 != 17)
    {
      __int16 v22 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = [v14 vifName];
        __int16 v24 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
        LODWORD(buf[0]) = 138412802;
        *(void *)((char *)buf + 4) = v23;
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = v10;
        WORD1(buf[1]) = 2112;
        *(void *)((char *)&buf[1] + 4) = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@: dropping unknown proto[%u] packet [%@]", (uint8_t *)buf, 0x1Cu);
      }
      if (a9) {
        goto LABEL_64;
      }
      goto LABEL_240;
    }
    if (self->_logPackets && v10 == 17 && byte_100A4C848)
    {
      if (qword_100A4C8A8 != -1) {
        dispatch_once(&qword_100A4C8A8, &stru_10098A438);
      }
      uint64_t v18 = mach_continuous_time();
      if (a4 <= 0x27)
      {
        v19 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v14 vifName];
          BOOL v21 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
          LODWORD(buf[0]) = 138412802;
          *(void *)((char *)buf + 4) = v20;
          WORD6(buf[0]) = 2112;
          *(void *)((char *)buf + 14) = v21;
          WORD3(buf[1]) = 2048;
          *((void *)&buf[1] + 1) = a4;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: dropping packet %@ of length %zu", (uint8_t *)buf, 0x20u);
        }
        if (a9) {
          goto LABEL_64;
        }
        goto LABEL_240;
      }
      if ((void)xmmword_100A4C858 == *((void *)a3 + 1)
        && *((void *)&xmmword_100A4C858 + 1) == *((void *)a3 + 2)
        && qword_100A4C868 == *((void *)a3 + 3)
        && unk_100A4C870 == *((void *)a3 + 4))
      {
        byte_100A4C848 = 0;
        *(double *)&qword_100A4C850 = *(double *)&qword_100A4C830 * (double)v18;
        v45 = (void *)qword_100A531F0;
        v46 = +[IDSUTunTimingLogger kernelTestEventWithTimestamp:kernelTime:bytes:](IDSUTunTimingLogger, "kernelTestEventWithTimestamp:kernelTime:bytes:", a4 - 8);
        [v45 addEvent:v46];

        goto LABEL_240;
      }
      if (*(double *)&qword_100A4C830 * (double)v18 - (double)(unint64_t)qword_100A4C878 > 5.0)
      {
        byte_100A4C848 = 0;
        *(double *)&qword_100A4C850 = *(double *)&qword_100A4C830 * (double)v18;
        __int16 v28 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "udp timing test: kernel test timed out", (uint8_t *)buf, 2u);
        }

        self = v180;
      }
    }
    if (v10 == 17 && self->_logPackets)
    {
      qword_100A4C888 = mach_continuous_time();
      qword_100A4C880 = qword_100A4C888;
      self = v180;
    }
    if (v10 == 6)
    {
      if (a4 <= 0x13)
      {
        BOOL v29 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = [v14 vifName];
          unsigned int v31 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
          LODWORD(buf[0]) = 138412802;
          *(void *)((char *)buf + 4) = v30;
          WORD6(buf[0]) = 2112;
          *(void *)((char *)buf + 14) = v31;
          WORD3(buf[1]) = 1024;
          DWORD2(buf[1]) = a4;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: dropping packet %@ of length %u", (uint8_t *)buf, 0x1Cu);
        }
        if (a9) {
          goto LABEL_64;
        }
        goto LABEL_240;
      }
      int v173 = (*((unsigned __int8 *)a3 + 12) >> 2) & 0x3C;
      LODWORD(v174) = bswap32(*((_DWORD *)a3 + 1));
      HIDWORD(v174) = *((unsigned __int8 *)a3 + 13);
    }
    else
    {
      uint64_t v174 = 0;
      int v173 = 0;
    }
    unsigned int v175 = __rev16(*((unsigned __int16 *)a3 + 1));
    unsigned int v177 = __rev16(*(unsigned __int16 *)a3);
    if (self->_logPackets)
    {
      __int16 v32 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        if (a4 >= 0x28) {
          unint64_t v33 = 40;
        }
        else {
          unint64_t v33 = a4;
        }
        id v34 = [v14 vifName];
        id v35 = +[NSData dataWithBytesNoCopy:a3 length:v33 freeWhenDone:0];
        v36 = v35;
        LODWORD(buf[0]) = 138413826;
        v37 = " ...";
        *(void *)((char *)buf + 4) = v34;
        if (a4 < 0x29) {
          v37 = "";
        }
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = v177;
        WORD1(buf[1]) = 1024;
        DWORD1(buf[1]) = v175;
        WORD4(buf[1]) = 1024;
        *(_DWORD *)((char *)&buf[1] + 10) = v10;
        HIWORD(buf[1]) = 2048;
        *(void *)&buf[2] = a4;
        WORD4(buf[2]) = 2112;
        *(void *)((char *)&buf[2] + 10) = v35;
        WORD1(buf[3]) = 2080;
        *(void *)((char *)&buf[3] + 4) = v37;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@: Payload Handler! %u => %u proto:%d (len=%ld)\n\t\t=> data[%@%s]", (uint8_t *)buf, 0x3Cu);
      }
    }
    if ([v14 suspendTraffic])
    {
      v38 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = [v14 vifName];
        uint64_t v40 = v14[1];
        LODWORD(buf[0]) = 138412546;
        *(void *)((char *)buf + 4) = v39;
        WORD6(buf[0]) = 2112;
        *(void *)((char *)buf + 14) = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@: device %@ is suspending traffic", (uint8_t *)buf, 0x16u);
      }
      if (a9) {
        goto LABEL_64;
      }
      goto LABEL_240;
    }
    v179 = sub_1003F1964((uint64_t)[v14 connectionsTableByLocalRemotePortKey], v175 | (v177 << 16));
    if (v179)
    {
      uint64_t v44 = 0;
      if (v10 == 17 && v180->_logPackets) {
        uint64_t v44 = mach_continuous_time();
      }
    }
    else
    {
      if (v10 != 6 || (v174 & 0x400000000) == 0)
      {
        v58 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = [v14 vifName];
          LODWORD(buf[0]) = 138413058;
          *(void *)((char *)buf + 4) = v59;
          WORD6(buf[0]) = 1024;
          *(_DWORD *)((char *)buf + 14) = v177;
          WORD1(buf[1]) = 1024;
          DWORD1(buf[1]) = v175;
          WORD4(buf[1]) = 2112;
          *(void *)((char *)&buf[1] + 10) = v14;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%@: cannot find connection for outgoing packet [%u => %u] in [%@]", (uint8_t *)buf, 0x22u);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v171 = [v14 vifName];
          _IDSLogV();
        }
        if (v10 == 6)
        {
          memset(__n_4, 170, sizeof(__n_4));
          unsigned int v60 = *((_DWORD *)a3 + 2);
          v61 = +[IDSFoundationLog utunController];
          int v62 = bswap32(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf[0]) = 67109376;
            DWORD1(buf[0]) = v174;
            WORD4(buf[0]) = 1024;
            *(_DWORD *)((char *)buf + 10) = v62;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "reset TCP using seq:%08x ack:%08x", (uint8_t *)buf, 0xEu);
          }

          if ((v174 & 0x200000000) != 0) {
            int v63 = v174;
          }
          else {
            int v63 = v174 + 1;
          }
          sub_100358F18((uint64_t)__n_4, v175, v177, v62, v63);
          v64 = [v14 remoteSA];
          v65 = (char *)[v64 sa6];
          v66 = [v14 localSA];
          tcp6checksum((int8x16_t *)(v65 + 8), (int8x16_t *)((char *)[v66 sa6] + 8), (int8x16_t *)__n_4, 0x14uLL);

          if (v14[2079])
          {
            v67 = [v14 remoteSA];
            id v68 = [v67 sa];
            v69 = [v14 localSA];
            unsigned int v70 = -[IDSUTunController handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:](v180, "handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:", v14, v68, [v69 sa], 6, __n_4, 20);
          }
          else
          {
            [v14 vifRef];
            v67 = [v14 remoteSA];
            [v67 sa];
            v69 = [v14 localSA];
            [v69 sa];
            unsigned int v70 = NEVirtualInterfaceWriteIPPayload();
          }
          unsigned int v156 = v70;

          v157 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
          {
            v158 = [v14 vifName];
            v159 = [v14 localSA];
            v160 = [v14 remoteSA];
            v161 = +[NSData dataWithBytesNoCopy:__n_4 length:20 freeWhenDone:0];
            LODWORD(buf[0]) = 138413314;
            *(void *)((char *)buf + 4) = v158;
            WORD6(buf[0]) = 2112;
            *(void *)((char *)buf + 14) = v159;
            WORD3(buf[1]) = 2112;
            *((void *)&buf[1] + 1) = v160;
            LOWORD(buf[2]) = 1024;
            *(_DWORD *)((char *)&buf[2] + 2) = v156;
            WORD3(buf[2]) = 2112;
            *((void *)&buf[2] + 1) = v161;
            _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_DEFAULT, "%@: write generated reset %@ <= %@ neRet=%d\n\t\t<= data[%@]", (uint8_t *)buf, 0x30u);
          }
        }
        if (a9)
        {
          linkManager = v180->_linkManager;
          v163 = [v14 deviceUniqueID];
          v164 = [v14 cbuuid];
          [(IDSLinkManager *)linkManager flushBuffer:0 toDeviceUniqueID:v163 cbuuid:v164];
        }
        goto LABEL_239;
      }
      uint64_t v44 = 0;
    }
    v47 = [v179 compressionInfo];
    if ((uint64_t)[v47 state] <= 1)
    {
    }
    else
    {
      v48 = [v179 compressionInfo];
      BOOL v49 = [v48 localContext] == 0;

      if (!v49)
      {
        v50 = [v179 compressionInfo];
        unsigned int v172 = [v50 localCID];

        *(void *)__n_4 = a3;
        v51 = [v179 compressionInfo];
        [v51 localContext];
        uint64_t v52 = IDSHC_Compress();

        if (v52)
        {
          v53 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            id v54 = [v14 vifName];
            LODWORD(buf[0]) = 138412546;
            *(void *)((char *)buf + 4) = v54;
            WORD6(buf[0]) = 2048;
            *(void *)((char *)buf + 14) = v52;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%@: IDSHC_Compress failed (%lu), revert back to un-compressed", (uint8_t *)buf, 0x16u);
          }
        }
        uint64_t v55 = *(void *)__n_4;
        if (v172 < 0x10)
        {
          --*(void *)__n_4;
          int __n = a4 + 1;
          if (v10 == 6) {
            char v71 = -96;
          }
          else {
            char v71 = 0x80;
          }
          *(unsigned char *)(v55 - 1) = v172 | v71;
        }
        else
        {
          *(void *)__n_4 -= 3;
          int __n = a4 + 3;
          if (v10 == 6) {
            char v56 = -80;
          }
          else {
            char v56 = -112;
          }
          *(unsigned char *)(v55 - 3) = v56;
          *(unsigned char *)(*(void *)__n_4 + 1) = BYTE1(v172);
          *(unsigned char *)(*(void *)__n_4 + 2) = v172;
        }
        BOOL v72 = v52 == 0;
        v73 = (void *)_IDSLinkPacketBufferCreate();
        memcpy((void *)*v73, *(const void **)__n_4, __n);
        v73[2] = __n;
        if (v72)
        {
          char v75 = 0;
          goto LABEL_109;
        }
        unsigned int v57 = v172;
LABEL_105:
        unsigned int v172 = v57;
        if (v10 == 6)
        {
          tcp6checksum(0, 0, (int8x16_t *)a3, a4);
          char v74 = 32;
        }
        else
        {
          udp6checksum(0, 0, (int8x16_t *)a3, a4);
          char v74 = 0;
        }
        v73 = (void *)_IDSLinkPacketBufferCreate();
        *(unsigned char *)void *v73 = v74;
        memcpy((void *)(*v73 + 1), a3, a4);
        v73[2] = a4 + 1;
        char v75 = 1;
LABEL_109:
        v76 = v180;
        BOOL logPackets = v180->_logPackets;
        if (v10 == 17 && v180->_logPackets)
        {
          qword_100A4C898 = mach_continuous_time() - v44;
          v76 = v180;
          BOOL logPackets = v180->_logPackets;
        }
        if (logPackets) {
          char v78 = v75;
        }
        else {
          char v78 = 1;
        }
        if ((v78 & 1) == 0)
        {
          unint64_t v79 = v73[2];
          v80 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            if (v79 >= 0x14) {
              uint64_t v81 = 20;
            }
            else {
              uint64_t v81 = v79;
            }
            id v82 = [v14 vifName];
            id v83 = +[NSData dataWithBytesNoCopy:*v73 length:v81 freeWhenDone:0];
            v84 = v83;
            LODWORD(buf[0]) = 138414338;
            v85 = " ...";
            *(void *)((char *)buf + 4) = v82;
            *(_DWORD *)((char *)buf + 14) = 1;
            WORD6(buf[0]) = 1024;
            if (v79 < 0x15) {
              v85 = "";
            }
            WORD1(buf[1]) = 1024;
            DWORD1(buf[1]) = v10 == 6;
            WORD4(buf[1]) = 1024;
            *(_DWORD *)((char *)&buf[1] + 10) = v172;
            HIWORD(buf[1]) = 1024;
            LODWORD(buf[2]) = v177;
            WORD2(buf[2]) = 1024;
            *(_DWORD *)((char *)&buf[2] + 6) = v175;
            WORD5(buf[2]) = 2048;
            *(void *)((char *)&buf[2] + 12) = v79;
            WORD2(buf[3]) = 2112;
            *(void *)((char *)&buf[3] + 6) = v83;
            HIWORD(buf[3]) = 2080;
            *(void *)&uint8_t buf[4] = v85;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%@: outgoing header (compressed_bit:%d protocol_bit:%d local_cid:%d s_port:%u d_port:%u)\n\t\t=> c(%luB): [%@%s]", (uint8_t *)buf, 0x48u);
          }
          v76 = v180;
        }
        if (v76->_encryptionEnabled && [v179 encryptionEnabled])
        {
          unsigned int v86 = [v179 seqSend];
          uint64_t v87 = sub_100221370((uint64_t)[v179 encryptionState], v86, (unsigned __int8 *)*v73, v73[2], 1);
          if (v87)
          {
            id v88 = [v14 portMap];
            v89 = [v179 addressPair];
            v90 = [v89 localAddress];
            -[IDSUTunController releasePortIfNecessary:port:](v180, "releasePortIfNecessary:port:", v88, [v90 saPortHostOrder]);

            v91 = +[NSString stringWithFormat:@"Encryption failure: %u", v87];
            [(IDSUTunController *)v180 removeConnection:v179 fromDeviceConnectionInfo:v14 removeCode:5301 removeReason:v91];

            _IDSLinkPacketBufferRelease();
            if (a9)
            {
              v92 = v180->_linkManager;
              v93 = [v14 deviceUniqueID];
              v94 = [v14 cbuuid];
              [(IDSLinkManager *)v92 flushBuffer:0 toDeviceUniqueID:v93 cbuuid:v94];
            }
            goto LABEL_239;
          }
          IDSLinkPacketBufferAddBufferStart();
          v95 = (unsigned char *)*v73;
          v96 = (unsigned char *)*v73;
          *(_WORD *)void *v73 = 224;
          unsigned __int16 v97 = (unsigned __int16)[v179 seqSend];
          v96[2] = HIBYTE(v97);
          v95[3] = v97;
          unsigned int v98 = [v179 SSRCSend];
          v95[4] = HIBYTE(v98);
          v95[5] = BYTE2(v98);
          v95[6] = BYTE1(v98);
          v95[7] = v98;
          [v179 setSeqSend:(unsigned __int16)(v86 + 1)];
        }
        *((unsigned char *)v73 + 38) = [v179 isCloudEnabled];
        *((unsigned char *)v73 + 39) = [v179 isControlChannel];
        *((unsigned char *)v73 + 41) = [v179 isDefaultPairedDevice];
        if ((uint64_t)v73[2] > 675) {
          unsigned __int8 v99 = 0;
        }
        else {
          unsigned __int8 v99 = [v179 isRealTime];
        }
        *((unsigned char *)v73 + 42) = v99;
        if (*((unsigned char *)v73 + 39))
        {
          char v100 = 99;
          goto LABEL_135;
        }
        *((_DWORD *)v73 + 305) = [v179 sdNumberNoClose];
        uint64_t v121 = (uint64_t)[v179 priority];
        if (v121 <= 299)
        {
          switch(v121)
          {
            case 0:
              char v100 = 45;
              goto LABEL_135;
            case 100:
              char v100 = 115;
              goto LABEL_135;
            case 200:
              char v100 = 100;
              goto LABEL_135;
          }
        }
        else if (v121 > 699)
        {
          if (v121 == 700)
          {
            char v100 = 118;
            goto LABEL_135;
          }
          if (v121 == 800)
          {
            char v100 = 97;
            goto LABEL_135;
          }
        }
        else
        {
          if (v121 == 300)
          {
            char v100 = 117;
            goto LABEL_135;
          }
          if (v121 == 600)
          {
            char v100 = 114;
            goto LABEL_135;
          }
        }
        char v100 = 63;
LABEL_135:
        *((unsigned char *)v73 + 1217) = v100;
        if (qword_100A4C8A8 != -1) {
          dispatch_once(&qword_100A4C8A8, &stru_10098A438);
        }
        uint64_t v101 = mach_continuous_time();
        double v102 = *(double *)&qword_100A4C830;
        v103 = [v179 addressPair];
        v104 = [v103 localAddress];
        double v105 = v102 * (double)v101;
        if ([v104 saPortHostOrder] == 1024)
        {
        }
        else
        {
          v106 = [v179 addressPair];
          v107 = [v106 remoteAddress];
          BOOL v108 = [v107 saPortHostOrder] == 1024;

          if (!v108 && [v179 priority] != (id)300)
          {
            v109 = [v14 highPriorityConnectionSendingSet];
            BOOL v110 = [v109 count] == 0;

            if (!v110)
            {
              [v179 lastSuccessfulSentTime];
              BOOL v112 = v10 != 6;
              if (v105 - v111 > 0.5) {
                BOOL v112 = 1;
              }
              if (!v112)
              {
                if (v173 == a4)
                {
                  if (!v180->_logPackets) {
                    goto LABEL_150;
                  }
                  v113 = +[IDSFoundationLog utunController];
                  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                  {
                    id v114 = [v14 vifName];
                    id v115 = [v179 localConnectionGUID];
                    v116 = [v14 highPriorityConnectionSendingSet];
                    LODWORD(buf[0]) = 138412802;
                    *(void *)((char *)buf + 4) = v114;
                    WORD6(buf[0]) = 2112;
                    *(void *)((char *)buf + 14) = v115;
                    WORD3(buf[1]) = 2112;
                    *((void *)&buf[1] + 1) = v116;
                    _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%@: passing through low priority ack for [%@] - current busy high priority set(%@)", (uint8_t *)buf, 0x20u);
                  }
                }
                else
                {
                  if (!v180->_logPackets) {
                    goto LABEL_150;
                  }
                  v113 = +[IDSFoundationLog utunController];
                  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                  {
                    id v165 = [v14 vifName];
                    id v166 = [v179 localConnectionGUID];
                    v167 = [v14 highPriorityConnectionSendingSet];
                    LODWORD(buf[0]) = 138412802;
                    *(void *)((char *)buf + 4) = v165;
                    WORD6(buf[0]) = 2112;
                    *(void *)((char *)buf + 14) = v166;
                    WORD3(buf[1]) = 2112;
                    *((void *)&buf[1] + 1) = v167;
                    _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%@: cannot send low priority [%@] - current busy high priority set(%@)", (uint8_t *)buf, 0x20u);
                  }
                }

LABEL_150:
                unsigned int v117 = [v179 stateFlags];
                uint64_t v118 = (int)v174 + (int)a4 - v173 + ((BYTE4(v174) & 2) >> 1);
                if ((v117 & 0x40) != 0)
                {
                  if (v118 - [v179 expectedNextOutgoingSequenceNumber] <= 0x3FFFFFFE) {
                    [v179 setExpectedNextOutgoingSequenceNumber:v118];
                  }
                }
                else
                {
                  [v179 setStateFlags:v117 | 0x40];
                  [v179 setExpectedNextOutgoingSequenceNumber:v118];
                  [v179 setConnectionSetupStartTime:sub_100352F48()];
                  v119 = +[IDSFoundationLog utunController];
                  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf[0]) = 138412290;
                    *(void *)((char *)buf + 4) = v179;
                    _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "First packet for connection %@", (uint8_t *)buf, 0xCu);
                  }
                }
                v122 = v180;
                if (v180->_logPackets)
                {
                  v123 = +[IDSFoundationLog utunController];
                  if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
                  {
                    id v124 = [v14 vifName];
                    if ((v174 & 0x200000000) != 0) {
                      v125 = "S";
                    }
                    else {
                      v125 = "";
                    }
                    v126 = "R";
                    if ((v174 & 0x400000000) == 0) {
                      v126 = "";
                    }
                    v176 = v126;
                    v178 = v125;
                    if ((v174 & 0x800000000) != 0) {
                      v127 = "P";
                    }
                    else {
                      v127 = "";
                    }
                    if ((v174 & 0x1000000000) != 0) {
                      v128 = ".";
                    }
                    else {
                      v128 = "";
                    }
                    unsigned int v129 = [v179 expectedNextOutgoingSequenceNumber];
                    LODWORD(buf[0]) = 138414082;
                    *(void *)((char *)buf + 4) = v124;
                    WORD6(buf[0]) = 1024;
                    *(_DWORD *)((char *)buf + 14) = a4;
                    WORD1(buf[1]) = 1024;
                    DWORD1(buf[1]) = HIDWORD(v174);
                    WORD4(buf[1]) = 2080;
                    *(void *)((char *)&buf[1] + 10) = v178;
                    WORD1(buf[2]) = 2080;
                    *(void *)((char *)&buf[2] + 4) = v176;
                    WORD6(buf[2]) = 2080;
                    *(void *)((char *)&buf[2] + 14) = v127;
                    WORD3(buf[3]) = 2080;
                    *((void *)&buf[3] + 1) = v128;
                    LOWORD(buf[4]) = 1024;
                    *(_DWORD *)((char *)&buf[4] + 2) = v129;
                    _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "%@: Sending TCP %uB (flags[%02X] [%s%s%s%s])) noseq:%08x", (uint8_t *)buf, 0x46u);
                  }
                  v122 = v180;
                }
                if (!v122->_isSimulateResetLoopTest && (v174 & 0x200000000) != 0 && (v174 & 0x1000000000) == 0)
                {
                  v130 = [v14 controlChannel];
                  unsigned int v131 = [v130 didReceiveReestablishmentRequest];

                  if (v131)
                  {
                    double v132 = sub_100352F48();
                    v133 = [v14 controlChannel];
                    [v133 reestablishmentRequestReceiveTime];
                    BOOL v135 = v132 - v134 < 30.0;

                    if (v135)
                    {
                      v136 = +[IDSFoundationLog utunController];
                      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                      {
                        LODWORD(buf[0]) = 138412290;
                        *(void *)((char *)buf + 4) = v179;
                        _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Dropped SYN and wait for outgoing SYNACK for connection %@", (uint8_t *)buf, 0xCu);
                      }

                      _IDSLinkPacketBufferRelease();
                      goto LABEL_239;
                    }
                    v137 = [v14 controlChannel];
                    [v137 setDidReceiveReestablishmentRequest:0];

                    v138 = +[IDSFoundationLog utunController];
                    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf[0]) = 138412290;
                      *(void *)((char *)buf + 4) = v179;
                      _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "Reset control channel didReceiveReestablishmentRequest for connection %@", (uint8_t *)buf, 0xCu);
                    }
                  }
                }
LABEL_197:
                objc_msgSend(v179, "setPacketsSent:", (char *)objc_msgSend(v179, "packetsSent") + 1);
                objc_msgSend(v179, "setBytesSent:", (char *)objc_msgSend(v179, "bytesSent") + v73[2]);
                if (v10 == 17) {
                  kdebug_trace();
                }
                *((unsigned char *)v73 + 40) = a9;
                uint64_t v139 = [(IDSLinkManager *)v180->_linkManager sendPacketBuffer:v73 toDeviceUniqueID:v14[2] cbuuid:v14[1]];
                int v140 = v139;
                if (v180->_isSimulateResetLoopTest && (BYTE4(v174) & 0x12) == 2)
                {
                  v141 = sub_1003F2080((uint64_t)&v180->_deviceConnectionInfoTableByCbuuid, kIDSDefaultPairedDeviceID);
                  v142 = sub_1003F1964((uint64_t)[v14 connectionsTableByLocalRemotePortKey], 67109888);
                  v143 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(buf[0]) = 0;
                    _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "Custom Test 3 - reset one more time", (uint8_t *)buf, 2u);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (_IDSShouldLogTransport())
                    {
                      _IDSLogTransport();
                      if (_IDSShouldLog()) {
                        _IDSLogV();
                      }
                    }
                  }
                  [(IDSUTunController *)v180 resetTCPConnection:v142 forDeviceConnectionInfo:v141];
                  v180->_isSimulateResetLoopTest = 0;

                  goto LABEL_239;
                }
                if (v139 <= 5)
                {
                  if (!v139)
                  {
                    [v179 setLastSuccessfulSentTime:v105];
                    v149 = [v179 outgoingStallDetector];

                    if (v149)
                    {
                      v150 = [v179 outgoingStallDetector];
                      [v150 consumeBytes:a4];
                    }
                    if (v10 == 17 && v180->_logPackets)
                    {
                      double v151 = sub_100352F48();
                      v152 = (void *)qword_100A531F0;
                      size_t v153 = a4 - 8;
                      v154 = +[IDSUTunTimingLogger outgoingEventWithTimestamp:a4 - 8 duration:v151 processTime:v151 - (double)(unint64_t)qword_100A4C880 * *(double *)&qword_100A4C830 compressionTime:*(double *)&qword_100A4C830 * (double)(unint64_t)qword_100A4C890 sendTime:*(double *)&qword_100A4C830 * (double)(unint64_t)qword_100A4C898 bytes:v151 - (double)(unint64_t)qword_100A4C888 * *(double *)&qword_100A4C830];
                      [v152 addEvent:v154];

                      if (sub_100352F48() - *(double *)&qword_100A4C850 > 0.5)
                      {
                        memset(&buf[2], 170, 0x558uLL);
                        uuid_generate((unsigned __int8 *)&xmmword_100A4C858);
                        uuid_generate((unsigned __int8 *)&qword_100A4C868);
                        buf[0] = xmmword_100A4C858;
                        buf[1] = *(_OWORD *)&qword_100A4C868;
                        if (v153 < 0x21) {
                          size_t v153 = 32;
                        }
                        else {
                          arc4random_buf(&buf[2], v153);
                        }
                        qword_100A4C878 = (unint64_t)sub_100352F48();
                        ssize_t v168 = send((int)[v179 sdCopy], buf, v153, 0);
                        if (v168 == v153)
                        {
                          byte_100A4C848 = 1;
                        }
                        else
                        {
                          int v169 = *__error();
                          v170 = +[IDSFoundationLog utunController];
                          if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)__n_4 = 134218496;
                            *(void *)&__n_4[4] = v168;
                            *(_WORD *)&__n_4[12] = 1024;
                            *(_DWORD *)&__n_4[14] = v153;
                            *(_WORD *)&__n_4[18] = 1024;
                            int v183 = v169;
                            _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "cannot inject timing test packet (%zd != %d) (%d)", __n_4, 0x18u);
                          }
                        }
                      }
                    }
                    goto LABEL_239;
                  }
                  if (v139 != 1) {
                    goto LABEL_239;
                  }
                }
                else
                {
                  if (v139 == 6)
                  {
LABEL_212:
                    v144 = +[IDSFoundationLog utunController];
                    if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned int v145 = [v14 utunSocket];
                      LODWORD(buf[0]) = 67109376;
                      DWORD1(buf[0]) = v140;
                      WORD4(buf[0]) = 1024;
                      *(_DWORD *)((char *)buf + 10) = v145;
                      _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "[throughput] sendPacketBuffer error %u (s: %d)", (uint8_t *)buf, 0xEu);
                    }

                    goto LABEL_239;
                  }
                  if (v139 != 13)
                  {
                    if (v139 == 10) {
                      goto LABEL_212;
                    }
LABEL_239:

                    goto LABEL_240;
                  }
                }
                BOOL v146 = v14[2079] == 0;
                v147 = +[IDSFoundationLog utunController];
                BOOL v148 = os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT);
                if (v146)
                {
                  if (v148)
                  {
                    unsigned int v155 = [v14 utunSocket];
                    LODWORD(buf[0]) = 67109120;
                    DWORD1(buf[0]) = v155;
                    _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "[throughput] link throttling (s: %d)", (uint8_t *)buf, 8u);
                  }

                  [v14 utunSocket];
                }
                else
                {
                  if (v148)
                  {
                    LOWORD(buf[0]) = 0;
                    _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "[throughput] link throttling", (uint8_t *)buf, 2u);
                  }

                  os_channel_get_fd();
                }
                IDSTransportThreadSuspendSocket();
                if (a10) {
                  *a10 = 1;
                }
                goto LABEL_239;
              }
            }
          }
        }
        if (v10 != 6)
        {
          if (v180->_logPackets)
          {
            uint64_t v120 = mach_continuous_time();
            qword_100A4C890 = v120 - qword_100A4C888;
            qword_100A4C888 = v120;
          }
          goto LABEL_197;
        }
        goto LABEL_150;
      }
    }
    unsigned int v57 = 0;
    goto LABEL_105;
  }
  v15 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v14 vifName];
    unsigned int v17 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
    LODWORD(buf[0]) = 138412802;
    *(void *)((char *)buf + 4) = v16;
    WORD6(buf[0]) = 2112;
    *(void *)((char *)buf + 14) = v17;
    WORD3(buf[1]) = 2048;
    *((void *)&buf[1] + 1) = a4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: dropping packet %@ of length %zu", (uint8_t *)buf, 0x20u);
  }
  if (a9)
  {
LABEL_64:
    v41 = v180->_linkManager;
    v42 = [v14 deviceUniqueID];
    v43 = [v14 cbuuid];
    [(IDSLinkManager *)v41 flushBuffer:0 toDeviceUniqueID:v42 cbuuid:v43];
  }
LABEL_240:
}

- (void)handleUtunChannelRead:(id)a3 limit:(unsigned int)a4
{
  id v6 = a3;
  [v6 utunChannel];
  [v6 utunChannelRxRing];
  unsigned int v7 = os_channel_available_slot_count();
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = v8;
  long long v20 = v8;
  long long v17 = v8;
  long long v18 = v8;
  char v16 = 0;
  if (v7)
  {
    unsigned int v9 = v7;
    if (a4) {
      unsigned int v10 = a4;
    }
    else {
      unsigned int v10 = -1;
    }
    if (v7 >= v10) {
      unsigned int v11 = v10;
    }
    else {
      unsigned int v11 = v7;
    }
    if (!os_channel_get_next_slot()) {
      sub_10071FBDC();
    }
    unsigned int v12 = 1;
    do
    {
      ++v6[4166];
      if (WORD1(v17) >= 4uLL && *(_DWORD *)v18 == 503316480)
      {
        LOBYTE(v15) = v11 == v12;
        [(IDSUTunController *)self handleIPPayload:(void)v18 + 44 bytesLength:WORD1(v17) - 44 source:0 destination:0 upperProtocol:*(unsigned __int8 *)(v18 + 10) forDeviceConnectionInfo:v6 flush:v15 callerShouldStop:&v16];
      }
      if (!os_channel_get_next_slot()) {
        break;
      }
      if (v12 >= v11) {
        break;
      }
      ++v12;
    }
    while (!v16);
    os_channel_advance_slot();
    if (v16) {
      goto LABEL_17;
    }
    unsigned int v13 = [v6 utunChannelRxCount];
    unsigned int v14 = [v6 utunChannelRxRingSize] >> 1;
    if (v11 < v14) {
      unsigned int v14 = v11;
    }
    if (v9 < 2 || v13 >= v14)
    {
LABEL_17:
      [v6 setUtunChannelRxCount:0];
      os_channel_sync();
    }
  }
}

- (unsigned)handleUtunChannelWrite:(id)a3 source:(sockaddr *)a4 destination:(sockaddr *)a5 upperProtocol:(unsigned __int8)a6 bytes:(const void *)a7 bytesLen:(unint64_t)a8
{
  unsigned int v14 = (double *)a3;
  [v14 utunChannel];
  [v14 utunChannelTxRing];
  int v15 = os_channel_available_slot_count();
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v27 = v16;
  if (!v15)
  {
    if (v14[2084] == 0.0)
    {
      BOOL v23 = !self->_ignoreUTunChannelWriteSignal;
      long long v17 = +[IDSFoundationLog utunController];
      BOOL v24 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v23)
      {
        if (v24)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "handleUtunChannelWrite: utun has no slots", buf, 2u);
        }

        if (qword_100A4C8A8 != -1) {
          dispatch_once(&qword_100A4C8A8, &stru_10098A438);
        }
        v14[2084] = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
        os_channel_get_fd();
        IDSTransportThreadResumeSocket();
        goto LABEL_33;
      }
      if (v24)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "handleUtunChannelWrite: utun has no slots but do not arm write signal for testing", buf, 2u);
      }
    }
    else
    {
      if (qword_100A4C8A8 != -1) {
        dispatch_once(&qword_100A4C8A8, &stru_10098A438);
      }
      uint64_t v20 = mach_continuous_time();
      double v21 = *(double *)&qword_100A4C830;
      double v22 = v14[2084];
      long long v17 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v29 = v21 * (double)v20 - v22;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "handleUtunChannelWrite: utun has no slots for %0.6lfs", buf, 0xCu);
      }
    }
    goto LABEL_26;
  }
  if (a4->sa_family != 30 || a5->sa_family != 30)
  {
    long long v18 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "problem: handleUtunChannelWrite: address is incorrect - aborting in 1 second", buf, 2u);
    }

    long long v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "problem: handleUtunChannelWrite: address is incorrect - aborting in 1 second", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    sleep(1u);
    if (!isRunningTests()) {
      abort();
    }
    throwsIDSAbortException();
    goto LABEL_33;
  }
  if (!os_channel_get_next_slot()) {
    sub_10071FC08();
  }
  MEMORY[0xAAAAAAAAAAAAAAAA] = 503316480;
  MEMORY[0xAAAAAAAAAAAAAAAE] = 0u;
  MEMORY[0xAAAAAAAAAAAAAABE] = 0u;
  MEMORY[0xAAAAAAAAAAAAAACE] = 0;
  MEMORY[0xAAAAAAAAAAAAAAB6] = *(_OWORD *)&a4->sa_data[6];
  MEMORY[0xAAAAAAAAAAAAAAC6] = *(_OWORD *)&a5->sa_data[6];
  MEMORY[0xAAAAAAAAAAAAAAB2] = bswap32(a8) >> 16;
  MEMORY[0xAAAAAAAAAAAAAAB4] = a6;
  MEMORY[0xAAAAAAAAAAAAAAAE] = 96;
  if ((int)a8 + 44 > objc_msgSend(v14, "utunChannelMaxSlotSize", v27))
  {
    long long v17 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&double v29 = (a8 + 44);
      __int16 v30 = 2048;
      uint64_t v31 = [v14 utunChannelMaxSlotSize];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "problem: handleUtunChannelWrite: packet too large %lu > %lu", buf, 0x16u);
    }
LABEL_26:

LABEL_33:
    unsigned __int8 v25 = 0;
    goto LABEL_34;
  }
  memmove((void *)0xAAAAAAAAAAAAAAD6, a7, a8);
  os_channel_set_slot_properties();
  os_channel_advance_slot();
  os_channel_sync();
  unsigned __int8 v25 = 1;
LABEL_34:

  return v25;
}

- (BOOL)setupUTunForDeviceConnectionInfo:(id)a3
{
  v96 = a3;
  memset(v116, 170, 20);
  unint64_t v115 = 0xAAAAAAAAAAAAAAAALL;
  v3 = (const void *)NEVirtualInterfaceCreate();
  if (v3)
  {
LABEL_7:
    unsigned int v7 = NEVirtualInterfaceCopyName();
    [v96 setVifName:v7];
    [v96 setVifRef:v3];
    LODWORD(v116[2]) = 0;
    v116[1] = 0;
    unint64_t v115 = 7708;
    v116[0] = 33022;
    arc4random_buf(&v116[1], 8uLL);
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)((char *)v126 + 14) = v8;
    *(_OWORD *)v125 = v8;
    v126[0] = v8;
    inet_ntop(30, v116, v125, 0x1Cu);
    unsigned int v9 = +[NSString stringWithUTF8String:v125];
    unsigned int v10 = [v9 stringByAppendingString:@"%"];
    unsigned int v11 = [v10 stringByAppendingString:v7];

    unsigned int v12 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [v96 vifName];
      unsigned int v14 = +[IDSSockAddrWrapper wrapperWithSockAddr:&v115];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      *(void *)uint64_t v118 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: generated [%@] => [%@]", buf, 0x20u);
    }
    uint64_t v15 = NEVirtualInterfaceDupSocket();
    if ((v15 & 0x80000000) == 0)
    {
      [v96 setUtunSocket:v15];
      long long v16 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = [v96 cbuuid];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Get raw socket %d for device %@", buf, 0x12u);
      }
      NEVirtualInterfaceSetReadAutomatically();
      long long v18 = self;
      if (!self->_vifUseChannel) {
        goto LABEL_35;
      }
      memset(buf, 170, 16);
      v99[0] = 16;
      int v114 = 1;
      if (setsockopt(v15, 2, 17, &v114, 4u) != -1)
      {
        if (getsockopt(v15, 2, 18, buf, v99) != -1)
        {
          if (os_channel_attr_create())
          {
            uint64_t extended = os_channel_create_extended();
            if (extended)
            {
              *(void *)&v100.ai_flags = 0;
              *(void *)uuid_string_t out = 0;
              os_channel_attr_get();
              if (*(void *)&v100.ai_flags <= 0x5DCuLL) {
                sub_10071FC34();
              }
              os_channel_attr_get();
              if (!*(void *)out) {
                sub_10071FC60();
              }
              uint64_t v20 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v113 = 0;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "use skywalk channel for utun", v113, 2u);
              }

              [v96 setUtunNexusUUID:buf];
              [v96 setUtunChannel:extended];
              [v96 setUtunChannelMaxSlotSize:v100.ai_flags];
              os_channel_ring_id();
              [v96 setUtunChannelTxRing:os_channel_tx_ring()];
              os_channel_ring_id();
              [v96 setUtunChannelRxRing:os_channel_rx_ring()];
              [v96 setUtunChannelRxRingSize:*(unsigned int *)out];
              os_channel_attr_destroy();
LABEL_53:
              int v43 = NEVirtualInterfaceSetMTU();
              int v44 = *__error();
              v45 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v46 = [v96 vifName];
                v47 = (void *)v46;
                if (v43) {
                  int v48 = 0;
                }
                else {
                  int v48 = v44;
                }
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v46;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 1380;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v43;
                *(_WORD *)uint64_t v118 = 1024;
                *(_DWORD *)&v118[2] = v48;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%@: set mtu=%d %d (%d)", buf, 0x1Eu);
              }
              int v49 = NEVirtualInterfaceAddAddress();
              int v50 = *__error();
              v51 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v52 = [v96 vifName];
                v53 = (void *)v52;
                if (v49) {
                  int v54 = 0;
                }
                else {
                  int v54 = v50;
                }
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v52;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v11;
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)uint64_t v118 = v49;
                *(_WORD *)&v118[4] = 1024;
                *(_DWORD *)&v118[6] = v54;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%@: addaddress [%@] %d (%d)", buf, 0x22u);
              }
              int v55 = NEVirtualInterfaceSetRankNever();
              int v56 = *__error();
              unsigned int v57 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v58 = [v96 vifName];
                v59 = (void *)v58;
                if (v55) {
                  int v60 = 0;
                }
                else {
                  int v60 = v56;
                }
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v58;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v55;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v60;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%@: set rank never %d (%d)", buf, 0x18u);
              }
              int updated = NEVirtualInterfaceUpdateAdHocService();
              int v62 = *__error();
              int v63 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v64 = [v96 vifName];
                v65 = (void *)v64;
                if (updated) {
                  int v66 = 0;
                }
                else {
                  int v66 = v62;
                }
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v64;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = updated;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v66;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%@: update adhoc service %d (%d)", buf, 0x18u);
              }
              memset(&v100, 0, sizeof(v100));
              *(void *)unsigned __int8 v99 = 0xAAAAAAAAAAAAAAAALL;
              v100.ai_flags = 4;
              int v67 = getaddrinfo((const char *)[v11 UTF8String], 0, &v100, (addrinfo **)v99);
              BOOL v23 = v67 == 0;
              if (v67)
              {
                id v68 = +[IDSFoundationLog utunController];
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  v69 = [v96 vifName];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v69;
                  _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%@: getaddrinfo failed!!", buf, 0xCu);
                }
                NEVirtualInterfaceInvalidate();
                close(v15);
                CFRelease(v3);
              }
              else
              {
                unsigned int v70 = +[IDSSockAddrWrapper wrapperWithSockAddr:*(void *)(*(void *)v99 + 32)];
                [v96 setLocalSA:v70];

                freeaddrinfo(*(addrinfo **)v99);
                char v71 = +[IDSFoundationLog utunController];
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                {
                  BOOL v72 = [v96 vifName];
                  v73 = [v96 localSA];
                  char v74 = [v96 localSA];
                  int v75 = *((_DWORD *)[v74 sa6] + 6);
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v72;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v73;
                  *(_WORD *)&buf[22] = 1024;
                  *(_DWORD *)uint64_t v118 = v75;
                  _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%@: result localSA: [%@ @ %u]", buf, 0x1Cu);
                }
                v76 = [v96 localSA];
                v77 = [v76 sa6];
                LODWORD(v116[2]) = 0;
                v116[1] = 0;
                unint64_t v115 = 7708;
                v116[0] = 33022;
                if (v77) {
                  LODWORD(v116[2]) = v77[6];
                }
                arc4random_buf(&v116[1], 8uLL);

                char v78 = +[IDSSockAddrWrapper wrapperWithSockAddr:&v115];
                [v96 setRemoteSA:v78];

                *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
                *(void *)&long long v79 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v79 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)uuid_string_t out = v79;
                *(_OWORD *)&out[16] = v79;
                uuid_unparse_upper((const unsigned __int8 *)[v96 selfInstanceID], out);
                v80 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  id v81 = [v96 vifName];
                  id v82 = [v96 cbuuid];
                  id v83 = [v96 deviceUniqueID];
                  v84 = [v96 remoteSA];
                  *(_DWORD *)buf = 138413570;
                  *(void *)&uint8_t buf[4] = v81;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v82;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)uint64_t v118 = v83;
                  *(_WORD *)&v118[8] = 2112;
                  v119 = v84;
                  __int16 v120 = 2080;
                  uint64_t v121 = out;
                  __int16 v122 = 2112;
                  v123 = v96;
                  _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%@: created mapping [%@ / %@] <=> [%@] (selfInstanceID[%s] %@)", buf, 0x3Eu);
                }
                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    v85 = [v96 vifName];
                    unsigned int v86 = [v96 cbuuid];
                    uint64_t v87 = [v96 deviceUniqueID];
                    v93 = [v96 remoteSA];
                    _IDSLogTransport();

                    if (_IDSShouldLog())
                    {
                      id v88 = objc_msgSend(v96, "vifName", v85, v86, v87, v93, out, v96);
                      v89 = [v96 cbuuid];
                      v90 = [v96 deviceUniqueID];
                      v94 = [v96 remoteSA];
                      _IDSLogV();
                    }
                  }
                }
                v91 = v96;
                if (v96[2079])
                {
                  os_channel_get_fd();
                  v91 = v96;
                }
                id v98 = v91;
                unsigned __int16 v97 = v98;
                IDSTransportThreadAddSocket();
                objc_msgSend(v97, "setLinkLayerConnected:", -[IDSLinkManager isConnectedToDeviceID:](self->_linkManager, "isConnectedToDeviceID:", v97[1]));
              }
              goto LABEL_90;
            }
            int v114 = 0;
            setsockopt(v15, 2, 17, &v114, 4u);
            self->_BOOL vifUseChannel = 0;
            os_channel_attr_destroy();
            goto LABEL_34;
          }
          unsigned __int8 v25 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v100.ai_flags) = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "setupUTunForDeviceConnectionInfo: os_channel_attr_create failed", (uint8_t *)&v100, 2u);
          }

LABEL_25:
          BOOL v23 = 0;
LABEL_90:

          goto LABEL_91;
        }
        int v114 = 0;
        setsockopt(v15, 2, 17, &v114, 4u);
        self->_BOOL vifUseChannel = 0;
      }
LABEL_34:
      long long v18 = self;
LABEL_35:
      if (v18->_vifShouldReadMultiple)
      {
        v107 = _NSConcreteStackBlock;
        uint64_t v108 = 3221225472;
        v109 = sub_10035C72C;
        BOOL v110 = &unk_100989EC0;
        double v111 = v18;
        unsigned int v26 = v96;
        id v112 = v26;
        int MultipleIPPayloadsHandler = NEVirtualInterfaceSetReadMultipleIPPayloadsHandler();
        int v28 = *__error();
        double v29 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = v26[1];
          if (MultipleIPPayloadsHandler) {
            int v31 = 0;
          }
          else {
            int v31 = v28;
          }
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = MultipleIPPayloadsHandler;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: SetReadMultipleIPPayloadHandler %d (%d)", buf, 0x18u);
        }

        int v32 = NEVirtualInterfaceSetMaxPendingPackets();
        int v33 = *__error();
        id v34 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = v26[1];
          if (v32) {
            int v36 = 0;
          }
          else {
            int v36 = v33;
          }
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v35;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v32;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@: SetMaxPendingPackets %d (%d)", buf, 0x18u);
        }
      }
      else
      {
        uint64_t v101 = _NSConcreteStackBlock;
        uint64_t v102 = 3221225472;
        v103 = sub_10035C7C0;
        v104 = &unk_100989EE8;
        double v105 = v18;
        v37 = v96;
        id v106 = v37;
        int IPPayloadHandler = NEVirtualInterfaceSetReadIPPayloadHandler();
        int v39 = *__error();
        uint64_t v40 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = v37[1];
          if (IPPayloadHandler) {
            int v42 = 0;
          }
          else {
            int v42 = v39;
          }
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v41;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = IPPayloadHandler;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%@: SetReadIPPayloadHandler %d (%d)", buf, 0x18u);
        }
      }
      goto LABEL_53;
    }
    int v21 = *__error();
    double v22 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "NEVirtualInterfaceDupSocket failed with error(%d)", buf, 8u);
    }

    goto LABEL_25;
  }
  int v4 = 1;
  while (1)
  {
    v5 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v96 cbuuid];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NEVICreate failed for %@! - %d try", buf, 0x12u);
    }
    if (v4 == 3) {
      break;
    }
    usleep(0x1F4u);
    v3 = (const void *)NEVirtualInterfaceCreate();
    ++v4;
    if (v3) {
      goto LABEL_7;
    }
  }
  unsigned int v7 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v24 = [v96 cbuuid];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NEVICreate failed for %@! after %d tries", buf, 0x12u);
  }
  BOOL v23 = 0;
LABEL_91:

  return v23;
}

- (void)startDataChannelWithDevice:(id)a3 genericConnection:(id)a4 serviceConnectorService:(id)a5 endpoint:(id)a6
{
  id v10 = a3;
  unsigned int v11 = a4;
  unsigned int v12 = a5;
  unsigned int v13 = a6;
  id v83 = [(IDSUTunController *)self stringComponentsForServiceConnectorService:v12];
  if ((unint64_t)[v83 count] <= 2)
  {
    unsigned int v14 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      nw_connection_t v96 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ids-ipsec: service string %@ needs to have 3 components", buf, 0xCu);
    }
  }
  id v82 = [v83 objectAtIndex:0];
  uint64_t v15 = [v83 objectAtIndex:1];
  v84 = [v83 objectAtIndex:2];
  v85 = v15;
  if ([v15 isEqualToString:@"localdelivery"]) {
    int v16 = 2;
  }
  else {
    int v16 = 4;
  }
  long long v17 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = [v10 serviceConnectionCache];
    *(_DWORD *)buf = 138413058;
    nw_connection_t v96 = v11;
    __int16 v97 = 2112;
    id v98 = v12;
    __int16 v99 = 2112;
    addrinfo v100 = v13;
    __int16 v101 = 2112;
    uint64_t v102 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "ids-ipsec: startDataChannelWithDevice called with generic connection %@ for service %@ and endpoint %@ connection-cache %@", buf, 0x2Au);
  }
  id v81 = v13;
  long long v79 = v12;
  if (![v10 shouldUseIPsecLink])
  {
    v80 = 0;
    v76 = 0;
    goto LABEL_33;
  }
  if ([v85 isEqualToString:@"localdelivery"]) {
    unsigned int v19 = [v84 containsString:@"Cloud"];
  }
  else {
    unsigned int v19 = 0;
  }
  if ([v85 isEqualToString:@"localdelivery"]
    && ([v84 containsString:@"-C"] & 1) != 0)
  {
    uint64_t v20 = 3;
  }
  else
  {
    uint64_t v20 = 4;
  }
  if (_IDSSupportsDirectMessaging()
    && [v11 isDirectMsgChannel])
  {
    int v21 = v16;
    if ([v11 dataProtectionClass] == 2)
    {
      uint64_t v20 = 4;
    }
    else if ([v11 dataProtectionClass])
    {
      uint64_t v20 = v20;
    }
    else
    {
      uint64_t v20 = 3;
    }
  }
  else
  {
    int v21 = v16;
  }
  double v22 = +[NSString stringWithUTF8String:"61314"];
  v80 = [v10 serviceConnector];
  if (v19)
  {
    BOOL v23 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      nw_connection_t v96 = v85;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "ids-ipsec: calling internalStartConnectionWithEndpoint with cloud option for service %@", buf, 0xCu);
    }

    uint64_t v24 = +[NSString stringWithUTF8String:"61315"];

    uint64_t v25 = [v10 cloudServiceConnector];

    v80 = (void *)v25;
    double v22 = (void *)v24;
  }
  if (v81)
  {
    unsigned int v26 = v81;
LABEL_32:

    v76 = v26;
    int v16 = v21;
LABEL_33:
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_10035D4E0;
    v86[3] = &unk_10098A028;
    id v78 = v10;
    id v34 = v10;
    uint64_t v87 = v34;
    v77 = v11;
    uint64_t v35 = v11;
    id v88 = v35;
    id v89 = v82;
    v90 = v85;
    int v94 = v16;
    id v91 = v84;
    v92 = self;
    int v36 = v12;
    v93 = v36;
    v37 = objc_retainBlock(v86);
    if ([v34 shouldUseIPsecLink])
    {
      if (v35)
      {
        v38 = [v34 serviceConnectionCache];
        int v39 = [v38 objectForKey:v36];

        if (v39)
        {
          uint64_t v40 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            nw_connection_t v96 = v39;
            __int16 v97 = 2112;
            id v98 = v36;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "ids-ipsec: found service connection %@ in cache for service %@", buf, 0x16u);
          }

          [v35 setServiceConnection:v39];
          uint64_t v41 = [v34 serviceConnectionCache];
          [v41 removeObjectForKey:v36];

          ((void (*)(void *, void, void, void, void, uint64_t, void, NSObject *, void))v37[2])(v37, 0, 0, 0, 0, 0xFFFFFFFFLL, 0, v39, 0);
          goto LABEL_40;
        }
        if ([v35 protocol] == 17)
        {
          int v48 = [v35 addressPair];
          int v49 = [v48 remoteAddress];
          uint64_t v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u", [v49 saPortHostOrder]);

          v51 = [v35 addressPair];
          uint64_t v52 = [v51 localAddress];
          uint64_t v53 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u", [v52 saPortHostOrder]);

          id v54 = objc_alloc((Class)NSUUID);
          int v55 = +[IDSPairingManager sharedInstance];
          int v56 = [v55 pairedDeviceUUIDString];
          unsigned int v57 = v54;
          uint64_t v58 = (void *)v53;
          id v59 = [v57 initWithUUIDString:v56];

          char v74 = v59;
          id v73 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:v59];
          int v75 = (void *)v50;
          id v60 = [objc_alloc((Class)NREndpoint) initWithDeviceIdentifier:v73 portString:v50 dataProtectionClass:4];
          id v71 = [objc_alloc((Class)NRParametersPhoneCallRelay) initWithLocalPort:v58];
          v61 = [v71 copyParameters];
          BOOL v72 = v60;
          int v62 = [v60 copyEndpoint];
          int v63 = v61;
          nw_connection_t v64 = nw_connection_create(v62, v61);
          v65 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413314;
            nw_connection_t v96 = v64;
            __int16 v97 = 2112;
            id v98 = v36;
            __int16 v99 = 2112;
            addrinfo v100 = v62;
            __int16 v101 = 2112;
            uint64_t v102 = v58;
            __int16 v103 = 2112;
            v104 = v75;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "ids-ipsec: create udp connection %@ for service %@ endpoint %@ localPort %@ remotePort %@", buf, 0x34u);
          }

          if (v64)
          {
            int v66 = 0;
          }
          else
          {
            +[NSString stringWithFormat:@"failed to create udp connection for %@", v36];
            v69 = id v68 = v58;
            unsigned int v70 = +[NSDictionary dictionaryWithObject:v69 forKey:NSLocalizedDescriptionKey];
            int v66 = +[NSError errorWithDomain:@"IDSUTun" code:5071 userInfo:v70];

            uint64_t v58 = v68;
          }
          double v22 = v76;
          ((void (*)(void *, void, void, void, void, uint64_t, void, nw_connection_t, void *))v37[2])(v37, 0, 0, 0, 0, 0xFFFFFFFFLL, 0, v64, v66);

          v47 = v80;
          goto LABEL_47;
        }
      }
      v47 = v80;
      [v35 setServiceConnector:v80];
      double v22 = v76;
      [v35 setDefaultPairedDeviceEndpoint:v76];
      int v39 = nw_parameters_create();
      nw_parameters_set_traffic_class();
      [(IDSUTunController *)self internalStartConnectionWithEndpoint:v76 service:[v36 UTF8String] parameters:v39 serviceConnector:v80 completionHandler:v37];
      goto LABEL_47;
    }
    Class isa = v34[1].isa;
    int v39 = [v35 addressPair];
    int v43 = [v39 localAddress];
    int v44 = [v35 addressPair];
    v45 = [v44 remoteAddress];
    id v46 = [v35 protocol];
    [v35 priority];
    [(IDSUTunController *)self internalOpenSocketWithDestination:isa localSA:v43 remoteSA:v45 protocol:v46 trafficClass:TrafficClassForIDSOpenSocketPriorityLevel() completionHandler:v37];

LABEL_40:
    v47 = v80;
    double v22 = v76;
LABEL_47:

    int v67 = v87;
    long long v27 = v77;
    id v10 = v78;
    goto LABEL_48;
  }
  long long v27 = v11;
  id v28 = objc_alloc((Class)NSUUID);
  double v29 = +[IDSPairingManager sharedInstance];
  uint64_t v30 = [v29 pairedDeviceUUIDString];
  id v31 = [v28 initWithUUIDString:v30];

  if (v31)
  {
    id v32 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:v31];
    id v33 = [objc_alloc((Class)NREndpoint) initWithDeviceIdentifier:v32 portString:v22 dataProtectionClass:v20];
    unsigned int v26 = [v33 copyEndpoint];

    unsigned int v11 = v27;
    unsigned int v12 = v79;
    goto LABEL_32;
  }
  int v67 = +[IDSFoundationLog utunController];
  v47 = v80;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Asked to set up a connection when we dont have a paired device!  Aborting...", buf, 2u);
  }
LABEL_48:
}

- (BOOL)setupIPsecLinkForDeviceConnectionInfo:(id)a3
{
  id v3 = a3;
  [v3 setShouldUseIPsecLink:1];
  [v3 setVifName:@"IPsecLink"];
  *(_OWORD *)unsigned int v11 = xmmword_100794A40;
  *(_OWORD *)&v11[12] = *(long long *)((char *)&xmmword_100794A40 + 12);
  int v4 = +[IDSSockAddrWrapper wrapperWithSockAddr:v11];
  [v3 setLocalSA:v4];

  v5 = +[IDSSockAddrWrapper wrapperWithSockAddr:v11];
  [v3 setRemoteSA:v5];

  nw_parameters_t v6 = nw_parameters_create();
  nw_parameters_set_required_interface_subtype();
  unsigned int v7 = nw_service_connector_create();
  [v3 setServiceConnector:v7];
  long long v8 = nw_service_connector_create();
  [v3 setCloudServiceConnector:v8];
  nw_service_connector_start();
  nw_service_connector_start();
  unsigned int v9 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    unsigned int v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setupIPsecLinkForDeviceConnectionInfo serviceConnector %@ cloudServiceConnector %@", buf, 0x16u);
  }

  [v3 setLinkLayerConnected:1];
  return 1;
}

- (id)setupNewDeviceConnectionInfoForCbuuid:(id)a3 deviceUniqueID:(id)a4 identityPair:(id)a5 remoteDeviceEncryptionInfo:(id)a6 shouldUseIPsecLink:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v36 = 2112;
    if (v7) {
      CFStringRef v17 = @"YES";
    }
    id v37 = v13;
    __int16 v38 = 2112;
    CFStringRef v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "setupNewDeviceConnectionInfoForCbuuid %@ deviceUniqueID %@ shouldUseIPsecLink %@", buf, 0x20u);
  }

  long long v18 = objc_alloc_init(IDSDeviceConnectionInfo);
  [(IDSDeviceConnectionInfo *)v18 setCbuuid:v12];
  [(IDSDeviceConnectionInfo *)v18 setDeviceUniqueID:v13];
  if (v7)
  {
    [(IDSDeviceConnectionInfo *)v18 setLinkLayerConnected:1];
  }
  else
  {
    unsigned int v19 = [(IDSUTunController *)self linkManager];
    -[IDSDeviceConnectionInfo setLinkLayerConnected:](v18, "setLinkLayerConnected:", [v19 isConnectedToDeviceID:v12]);
  }
  pthread_mutex_lock(&self->_deviceConnectionInfoTableByCbuuidLock);
  sub_1003F1D68(&self->_deviceConnectionInfoTableByCbuuid.tableSize, v12, v18);
  pthread_mutex_unlock(&self->_deviceConnectionInfoTableByCbuuidLock);
  unsigned __int8 v20 = [v12 isEqualToString:kIDSDefaultPairedDeviceID];
  [(IDSDeviceConnectionInfo *)v18 setShouldUseIPsecLink:v7];
  if (v7) {
    unsigned __int8 v21 = [(IDSUTunController *)self setupIPsecLinkForDeviceConnectionInfo:v18];
  }
  else {
    unsigned __int8 v21 = [(IDSUTunController *)self setupUTunForDeviceConnectionInfo:v18];
  }
  if (v21)
  {
    double v22 = [IDSUTunControlChannel alloc];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100360F80;
    v30[3] = &unk_10098A078;
    unsigned __int8 v34 = v20;
    v30[4] = self;
    id v31 = v12;
    BOOL v23 = v18;
    id v32 = v23;
    id v33 = v13;
    uint64_t v24 = [(IDSUTunControlChannel *)v22 initWithDeviceUniqueID:v33 cbuuid:v31 receiveHandler:v30];
    [(IDSUTunControlChannel *)v24 setRemoteDeviceEncryptionInfo:v15];
    [(IDSUTunControlChannel *)v24 setDisableEncryption:self->_controlChannelEncryptionDisabled];
    if (v14 && !v7)
    {
      [(IDSUTunControlChannel *)v24 setIdentityPair:v14];
      [(IDSUTunControlChannel *)v24 encryptControlChannelForStoredIdentities];
    }
    [(IDSDeviceConnectionInfo *)v23 setControlChannel:v24];
    if ([(IDSDeviceConnectionInfo *)v23 linkLayerConnected])
    {
      [(IDSUTunController *)self startControlChannelWithDevice:v23 endpoint:0];
    }
    else
    {
      unsigned int v26 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Add a block for initial control channel setup on link connects.", buf, 2u);
      }

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v23);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100361794;
      v28[3] = &unk_10098A050;
      objc_copyWeak(&v29, (id *)buf);
      v28[4] = self;
      [(IDSDeviceConnectionInfo *)v23 addBlocksOnLinkConnect:v28];
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    uint64_t v25 = v23;
  }
  else
  {
    [(IDSDeviceConnectionInfo *)v18 utunSocket];
    IDSTransportThreadRemoveSocket();
    [(IDSDeviceConnectionInfo *)v18 cancelBlocksOnLinkConnect];
    [(IDSDeviceConnectionInfo *)v18 invalidate];
    sub_1003F2190((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (const char *)v12);
    uint64_t v25 = 0;
  }

  return v25;
}

- (IDSUTunController)init
{
  v25.receiver = self;
  v25.super_class = (Class)IDSUTunController;
  v2 = [(IDSUTunController *)&v25 init];
  if (!v2)
  {
LABEL_11:
    id v15 = v2;
    goto LABEL_15;
  }
  if (IDSTransportThreadInit())
  {
    id v3 = objc_alloc_init(IDSUTunTimingLogger);
    int v4 = (void *)qword_100A531F0;
    qword_100A531F0 = (uint64_t)v3;

    sub_1003F1D24((uint64_t)&v2->_deviceConnectionInfoTableByCbuuid, 32);
    pthread_mutex_init(&v2->_deviceConnectionInfoTableByCbuuidLock, 0);
    v5 = [(IDSUTunController *)v2 defaultPairedDeviceIdentityPair];
    unsigned int v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    unsigned __int8 v21 = sub_100361AF4;
    double v22 = &unk_100980EE8;
    nw_parameters_t v6 = v2;
    BOOL v23 = v6;
    BOOL v24 = v5 == 0;
    IDSTransportThreadAddSyncBlock();
    [(IDSUTunController *)v6 _reloadSettings];
    if (!v6->_controlChannelVersionCache)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      controlChannelVersionCache = v6->_controlChannelVersionCache;
      v6->_controlChannelVersionCache = (NSMutableDictionary *)Mutable;
    }
    v6->_controlChannelVersionCacheLock._os_unfair_lock_opaque = 0;
    unsigned int v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("ids multiplex ipsec queue", v10);
    ipsecQueue = v6->_ipsecQueue;
    v6->_ipsecQueue = (OS_dispatch_queue *)v11;

    if (IMGetDomainBoolForKey())
    {
      int v18 = 1;
      if (sysctlbyname("kern.skywalk.ring_stat_enable", 0, 0, &v18, 4uLL))
      {
        int v13 = *__error();
        id v14 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sysctl for kern.skywalk.ring_stat_enable failed %d", buf, 8u);
        }
      }
    }

    goto LABEL_11;
  }
  int v16 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "TransportThread initialization failed", buf, 2u);
  }

  id v15 = 0;
LABEL_15:

  return v15;
}

- (void)internalStartConnectionWithEndpoint:(id)a3 service:(const char *)a4 parameters:(id)a5 serviceConnector:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_retainBlock(a7);
  id v15 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v19 = a4;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ids-ipsec: starting service connector for %s on %@ with parameters %@", buf, 0x20u);
  }

  CFStringRef v17 = v14;
  id v16 = v14;
  nw_service_connector_start_request();
}

- (void)prepareControlChannelForDeviceConnectionInfo:(id)a3 genericConnection:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  [v5 setUint32Key:67109888];
  [v5 setIsCloudEnabled:1];
  [v5 setIsControlChannel:1];
  nw_parameters_t v6 = [v9 cbuuid];
  objc_msgSend(v5, "setIsDefaultPairedDevice:", objc_msgSend(v6, "isEqualToString:", kIDSDefaultPairedDeviceID));

  BOOL v7 = sub_1003F1964((uint64_t)[v9 connectionsTableByLocalRemotePortKey], (int)objc_msgSend(v5, "uint32Key"));
  long long v8 = v7;
  if (v7) {
    [v7 invalidate];
  }
  sub_1003F164C((int *)[v9 connectionsTableByLocalRemotePortKey], (int)objc_msgSend(v5, "uint32Key"), v5);
}

- (void)didConnectControlChannelForDeviceConnectionInfo:(id)a3 connection:(id)a4 error:(id)a5
{
  long long v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didConnectControlChannelForDeviceConnectionInfo called: connection %@ error %@", buf, 0x16u);
  }

  if (!v10)
  {
    dword_100A44230 = 4;
    qword_100A4C8A0 = 0;
    CFStringRef v17 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "startControlChannelWithDevice: finished with [%@]", buf, 0xCu);
    }

    int v18 = [v8 cbuuid];
    uint64_t v19 = kIDSDefaultPairedDeviceID;
    unsigned int v20 = [v18 isEqualToString:kIDSDefaultPairedDeviceID];

    if (v20)
    {
      id v21 = objc_alloc((Class)NSUUID);
      __int16 v22 = +[IDSCurrentDevice sharedInstance];
      id v23 = [v22 deviceIdentifier];
      id v70 = [v21 initWithUUIDString:v23];
    }
    else
    {
      memset(buf, 170, 16);
      uuid_clear(buf);
      id v70 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buf];
    }
    v65 = self;
    uint64_t v30 = +[IMDeviceSupport sharedInstance];
    uint64_t v31 = [v30 productName];

    id v32 = +[IMDeviceSupport sharedInstance];
    v69 = [v32 productVersion];

    id v33 = +[IMDeviceSupport sharedInstance];
    id v68 = [v33 productBuildVersion];

    unsigned __int8 v34 = +[IMDeviceSupport sharedInstance];
    int v67 = [v34 model];

    *(_DWORD *)buf = -1431655766;
    unsigned int v71 = -1431655766;
    unsigned int v72 = -1431655766;
    +[IDSPairingManager devicePairingProtocolVersion:buf minCompatibilityVersion:&v72 maxCompatibilityVersion:&v71];
    if (j__NRCompanionLinkIsEnabled()) {
      uint64_t v35 = 1023;
    }
    else {
      uint64_t v35 = 767;
    }
    __int16 v36 = +[IDSPairingManager sharedInstance];
    unsigned int v37 = [v36 activePairedDeviceHasPairingType:1];

    if (v37) {
      uint64_t v38 = 1024;
    }
    else {
      uint64_t v38 = 0;
    }
    uint64_t v39 = 0;
    if (_IDSSupportsDirectMessaging())
    {
      uint64_t v40 = [v8 cbuuid];
      unsigned int v41 = [v40 isEqualToString:v19];

      if (v41) {
        uint64_t v39 = 2048;
      }
      else {
        uint64_t v39 = 0;
      }
    }
    int v42 = objc_alloc_init(IDSUTunControlMessage_Hello);
    [(IDSUTunControlMessage_Hello *)v42 setControlChannelVersion:@"5"];
    int v66 = (void *)v31;
    [(IDSUTunControlMessage_Hello *)v42 setProductName:v31];
    [(IDSUTunControlMessage_Hello *)v42 setProductVersion:v69];
    [(IDSUTunControlMessage_Hello *)v42 setProductBuildVersion:v68];
    [(IDSUTunControlMessage_Hello *)v42 setModel:v67];
    int v43 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
    [(IDSUTunControlMessage_Hello *)v42 setPairingProtocolVersion:v43];

    int v44 = +[NSNumber numberWithUnsignedInt:v72];
    [(IDSUTunControlMessage_Hello *)v42 setMinCompatibilityVersion:v44];

    v45 = +[NSNumber numberWithUnsignedInt:v71];
    [(IDSUTunControlMessage_Hello *)v42 setMaxCompatibilityVersion:v45];

    id v46 = +[NSNumber numberWithUnsignedLongLong:v38 | v35 | v39];
    [(IDSUTunControlMessage_Hello *)v42 setCapabilityFlags:v46];

    [(IDSUTunControlMessage_Hello *)v42 setServiceMinCompatibilityVersion:&off_1009D1E18];
    [(IDSUTunControlMessage_Hello *)v42 setDeviceUniqueID:v70];
    id v47 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(v8, "selfInstanceID"));
    [(IDSUTunControlMessage_Hello *)v42 setInstanceID:v47];
    int v48 = [(IDSUTunControlMessage_Hello *)v42 data];
    int v49 = [v8 controlChannel];
    [v49 setConnecting:0];

    uint64_t v50 = [v8 controlChannel];
    [v50 useConnection:v9 withFirstMessage:v48];

    v51 = [v8 controlChannel];
    unsigned int v52 = [v51 isReadyForEncrypting];

    if (v52) {
      [(IDSLinkManager *)v65->_linkManager setRequireBT:0];
    }
    if (_IDSSupportsDirectMessaging())
    {
      uint64_t v53 = [v8 cbuuid];
      unsigned int v54 = [v53 isEqualToString:v19];

      if (v54)
      {
        char v80 = 14;
        int v55 = +[IDSDaemon sharedInstance];
        id v56 = [v55 copyDirectMessagingInfo];

        if ((unint64_t)[v56 length] > 8)
        {
          id v58 = objc_alloc_init((Class)NSMutableData);
          [v58 appendBytes:&v80 length:1];
          [v58 appendData:v56];
          unsigned int v57 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v79 = 0;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "sending control message: direct msg info", v79, 2u);
          }
        }
        else
        {
          unsigned int v57 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v79 = 0;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "sending control message: invalid info length", v79, 2u);
          }
          id v58 = 0;
        }

        nw_connection_t v64 = [v8 controlChannel];
        [v64 sendMessage:v58];
      }
    }

    int v63 = v70;
    goto LABEL_60;
  }
  id v12 = [v8 controlChannel];
  [v12 setConnecting:0];

  id v13 = [v8 controlChannel];
  unsigned int v14 = [v13 connected];

  id v15 = +[IDSFoundationLog utunController];
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v16)
    {
      uint64_t v24 = v8[1];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "startControlChannelWithDevice: error creating control channel with [%@] [%@]", buf, 0x16u);
    }

    objc_super v25 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = v8[1];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "UTunController control channel for [%@] creation failed: %@", buf, 0x16u);
    }

    if (self->_hasFixedDestination)
    {
      int v27 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "For the fixedInterface case, obliterate the connection.", buf, 2u);
      }

      [(IDSUTunController *)self obliterateConnectionInfoForCBUUID:v8[1] completionBlock:0 completionQueue:0];
    }
    id v28 = [v8 cbuuid];
    unsigned int v29 = [v28 isEqualToString:kIDSDefaultPairedDeviceID];

    if (v29)
    {
      if (*(double *)&qword_100A4C8A0 == 0.0)
      {
        if (qword_100A4C8A8 != -1) {
          dispatch_once(&qword_100A4C8A8, &stru_10098A438);
        }
        *(double *)&qword_100A4C8A0 = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
      }
      else
      {
        if (qword_100A4C8A8 != -1) {
          dispatch_once(&qword_100A4C8A8, &stru_10098A438);
        }
        double v59 = *(double *)&qword_100A4C830 * (double)mach_continuous_time() - *(double *)&qword_100A4C8A0;
        if (v59 > 30.0)
        {
          id v60 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v59;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "UTunController control channel for default paired device could not be started for %0.3lf seconds", buf, 0xCu);
          }
        }
      }
    }
    id v73 = _NSConcreteStackBlock;
    uint64_t v74 = 3221225472;
    int v75 = sub_100362A18;
    v76 = &unk_100980D88;
    v77 = self;
    id v78 = v8;
    IDSTransportThreadAddBlockAfter();
    if (dword_100A44230 >= 0) {
      int v61 = dword_100A44230;
    }
    else {
      int v61 = dword_100A44230 + 1;
    }
    int v62 = dword_100A44230 + (v61 >> 1);
    if (v62 >= 60) {
      int v62 = 60;
    }
    dword_100A44230 = v62;
    int v63 = v78;
LABEL_60:

    goto LABEL_61;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ids-ipsec: start_request returns error but control channel fine - assuming connected via available block. Error %@", buf, 0xCu);
  }

LABEL_61:
}

- (void)startControlChannelWithDevice:(id)a3 endpoint:(id)a4
{
  nw_parameters_t v6 = a3;
  id v7 = a4;
  long long v8 = [v6 controlChannel];
  if ([v8 connecting])
  {
  }
  else
  {
    id v9 = [v6 controlChannel];
    unsigned int v10 = [v9 connected];

    if (!v10) {
      goto LABEL_8;
    }
  }
  int v11 = IMGetDomainBoolForKey();
  id v12 = +[IDSFoundationLog utunController];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      unsigned int v14 = [v6 cbuuid];
      *(_DWORD *)buf = 138412290;
      unsigned int v72 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "startControlChannelWithDevice called but already connecting/connected - force continue %@", buf, 0xCu);
    }
LABEL_8:
    id v15 = [v6 controlChannel];
    [v15 setConnecting:1];

    BOOL v16 = [v6 localSA];
    id v12 = +[IDSSockAddrWrapper wrapperWithWrapper:v16 andPortHostOrder:1024];

    CFStringRef v17 = [v6 remoteSA];
    int v18 = +[IDSSockAddrWrapper wrapperWithWrapper:v17 andPortHostOrder:1024];

    uint64_t v19 = +[IDSSockAddrWrapperPair wrapperPairWithLocalAddress:v12 remoteAddress:v18];
    unsigned int v20 = [[IDSGenericConnection alloc] initWithAddressPair:v19 protocol:6];
    LODWORD(v17) = [v6 shouldUseIPsecLink];
    id v21 = +[IDSFoundationLog utunController];
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!v17)
    {
      if (v22)
      {
        int v27 = [v6 cbuuid];
        *(_DWORD *)buf = 138412290;
        unsigned int v72 = v27;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "startControlChannelWithDevice over utun/bt path for %@", buf, 0xCu);
      }
      uint64_t v28 = v6[1];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_100363514;
      v64[3] = &unk_10098A128;
      unsigned int v29 = v6;
      id v65 = v29;
      int v62 = v20;
      uint64_t v30 = v20;
      int v66 = v30;
      int v67 = self;
      [(IDSUTunController *)self internalOpenSocketWithDestination:v28 localSA:v12 remoteSA:v18 protocol:6 trafficClass:900 completionHandler:v64];
      uint64_t v31 = [v29 controlChannelCachedSYN];

      if (v31)
      {
        unsigned int v57 = v18;
        id v60 = v7;
        int v61 = self;
        double v59 = v19;
        if (v29[2079])
        {
          id v58 = [v19 remoteAddress];
          id v32 = [v58 sa];
          id v33 = [v19 localAddress];
          id v34 = [v33 sa];
          id v35 = [v29 controlChannelCachedSYN];
          id v36 = [v35 bytes];
          unsigned int v37 = [v29 controlChannelCachedSYN];
          unsigned int v38 = -[IDSUTunController handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:](v61, "handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:", v29, v32, v34, 6, v36, [v37 length]);
        }
        else
        {
          [v29 vifRef];
          id v58 = [v19 remoteAddress];
          [v58 sa];
          id v33 = [v19 localAddress];
          [v33 sa];
          id v35 = [v29 controlChannelCachedSYN];
          [v35 bytes];
          unsigned int v37 = [v29 controlChannelCachedSYN];
          [v37 length];
          unsigned int v38 = NEVirtualInterfaceWriteIPPayload();
        }
        unsigned int v50 = v38;

        v51 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v52 = [v29 vifName];
          uint64_t v53 = [v29 controlChannelCachedSYN];
          *(_DWORD *)buf = 138412802;
          unsigned int v72 = v52;
          __int16 v73 = 1024;
          unsigned int v74 = v50;
          __int16 v75 = 2112;
          v76 = v53;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%@: write cached control channel syn neRet=%d\n\t\t<= data[%@]", buf, 0x1Cu);
        }
        id v54 = [v29 controlChannelCachedSYN];
        int v55 = [v54 bytes];

        [(IDSGenericConnection *)v30 setFirstIncomingSYNSequenceNumber:bswap32(v55[1])];
        [v29 setControlChannelCachedSYN:0];
        [(IDSGenericConnection *)v30 setStateFlags:128];
        id v7 = v60;
        uint64_t v19 = v59;
        if (qword_100A4C8A8 != -1) {
          dispatch_once(&qword_100A4C8A8, &stru_10098A438);
        }
        int v18 = v57;
        [(IDSGenericConnection *)v30 setFirstPacketReceiveTime:*(double *)&qword_100A4C830 * (double)mach_continuous_time()];
        [(IDSGenericConnection *)v30 reportToAWD:[(IDSLinkManager *)v61->_linkManager currentLinkType:v29[1]] connectionType:1 error:0];
      }

      unsigned int v20 = v62;
      goto LABEL_30;
    }
    if (v22)
    {
      id v23 = [v6 cbuuid];
      *(_DWORD *)buf = 138412290;
      unsigned int v72 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "startControlChannelWithDevice over ipsec path for %@", buf, 0xCu);
    }
    if (v7)
    {
      uint64_t v24 = v19;
      id v25 = v7;
    }
    else
    {
      int v63 = v20;
      uint64_t v39 = v18;
      id v40 = objc_alloc((Class)NSUUID);
      unsigned int v41 = +[IDSPairingManager sharedInstance];
      int v42 = [v41 pairedDeviceUUIDString];
      id v43 = [v40 initWithUUIDString:v42];

      if (!v43)
      {
        id v56 = +[IDSFoundationLog utunController];
        int v18 = v39;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "startControlChannelWithDevice called but pairedDeviceUUIDString is nil.", buf, 2u);
        }

        unsigned int v20 = v63;
        [(IDSGenericConnection *)v63 invalidate];
        goto LABEL_30;
      }
      uint64_t v24 = v19;
      id v44 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:v43];
      id v45 = objc_alloc((Class)NREndpoint);
      id v46 = +[NSString stringWithUTF8String:"61315"];
      id v47 = [v45 initWithDeviceIdentifier:v44 portString:v46 dataProtectionClass:4];

      id v25 = [v47 copyEndpoint];
      int v18 = v39;
      unsigned int v20 = v63;
    }
    nw_parameters_t v48 = nw_parameters_create();
    nw_parameters_set_traffic_class();
    int v49 = [v6 cloudServiceConnector];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100363484;
    v68[3] = &unk_10098A128;
    v68[4] = self;
    v69 = v6;
    id v70 = v20;
    [(IDSUTunController *)self internalStartConnectionWithEndpoint:v25 service:"ids-control-channel" parameters:v48 serviceConnector:v49 completionHandler:v68];

    uint64_t v19 = v24;
LABEL_30:

    goto LABEL_31;
  }
  if (v13)
  {
    uint64_t v26 = [v6 cbuuid];
    *(_DWORD *)buf = 138412290;
    unsigned int v72 = v26;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "startControlChannelWithDevice called but already connecting/connected - returning %@", buf, 0xCu);
  }
LABEL_31:
}

- (void)resetTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 shouldUseIPsecLink]) {
    [(IDSUTunController *)self resetIPsecTCPConnection:v7 forDeviceConnectionInfo:v6];
  }
  else {
    [(IDSUTunController *)self resetUTunTCPConnection:v7 forDeviceConnectionInfo:v6];
  }
}

- (void)resetIPsecTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 serviceConnection];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "reset TCP for genericConnection %@ serviceConnection %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [v4 serviceConnection];

  if (v7)
  {
    [v4 _closeSockets];
    objc_msgSend(v4, "setStateFlags:", objc_msgSend(v4, "stateFlags") | 0x200);
  }
}

- (void)resetUTunTCPConnection:(id)a3 forDeviceConnectionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(v75, 170, sizeof(v75));
  int v7 = [v5 expectedNextIncomingSequenceNumber];
  int v8 = [v5 expectedNextOutgoingSequenceNumber];
  id v9 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "reset TCP for genericConnection %@ using seq:%08x ack:%08x", buf, 0x18u);
  }

  __int16 v10 = [v5 addressPair];
  int v11 = [v10 remoteAddress];
  __int16 v12 = (unsigned __int16)[v11 saPortHostOrder];
  BOOL v13 = [v5 addressPair];
  unsigned int v14 = [v13 localAddress];
  sub_100358F18((uint64_t)v75, v12, (__int16)[v14 saPortHostOrder], v7, v8);

  id v15 = v5;
  int v16 = [v15 sdCopy];
  if (v16 != -1)
  {
    unint64_t v99 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v97 = v17;
    long long v98 = v17;
    long long v95 = v17;
    long long v96 = v17;
    long long v93 = v17;
    long long v94 = v17;
    long long v91 = v17;
    long long v92 = v17;
    long long v89 = v17;
    long long v90 = v17;
    long long v87 = v17;
    long long v88 = v17;
    long long v85 = v17;
    long long v86 = v17;
    long long v83 = v17;
    long long v84 = v17;
    long long v81 = v17;
    long long v82 = v17;
    long long v79 = v17;
    long long v80 = v17;
    long long v78 = v17;
    *(_OWORD *)&uint8_t buf[32] = v17;
    long long v77 = v17;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v17;
    socklen_t v69 = 408;
    if (!getsockopt(v16, 6, 512, buf, &v69))
    {
      int v18 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = buf[0];
        int v20 = DWORD1(v77);
        int v21 = DWORD2(v77);
        unsigned int v22 = [v15 expectedNextIncomingSequenceNumber];
        unsigned int v23 = [v15 expectedNextOutgoingSequenceNumber];
        *(_DWORD *)id v70 = 67110144;
        *(_DWORD *)unsigned int v71 = v19;
        *(_WORD *)&v71[4] = 1024;
        *(_DWORD *)&v71[6] = v20;
        LOWORD(v72) = 1024;
        *(_DWORD *)((char *)&v72 + 2) = v21;
        HIWORD(v72) = 1024;
        *(_DWORD *)__int16 v73 = v22;
        *(_WORD *)&v73[4] = 1024;
        v74[0] = v23;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "TCP info (%u) tcpi_snd_nxt:%08x tcpi_rcv_nxt:%08x (connection: in:%08x out:%08x)", v70, 0x20u);
      }
    }
  }

  uint64_t v24 = [v15 addressPair];
  id v25 = [v24 remoteAddress];
  uint64_t v26 = (int8x16_t *)((char *)[v25 sa6] + 8);
  int v27 = [v15 addressPair];
  uint64_t v28 = [v27 localAddress];
  tcp6checksum(v26, (int8x16_t *)((char *)[v28 sa6] + 8), (int8x16_t *)v75, 0x14uLL);

  if (v6[2079])
  {
    unsigned int v29 = [v15 addressPair];
    uint64_t v30 = [v29 remoteAddress];
    id v31 = [v30 sa];
    id v32 = [v15 addressPair];
    id v33 = [v32 localAddress];
    unsigned int v34 = -[IDSUTunController handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:](self, "handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:", v6, v31, [v33 sa], 6, v75, 20);
  }
  else
  {
    [v6 vifRef];
    unsigned int v29 = [v15 addressPair];
    uint64_t v30 = [v29 remoteAddress];
    [v30 sa];
    id v32 = [v15 addressPair];
    id v33 = [v32 localAddress];
    [v33 sa];
    unsigned int v34 = NEVirtualInterfaceWriteIPPayload();
  }
  unsigned int v35 = v34;

  id v36 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v37 = [v6 vifName];
    unsigned int v38 = [v15 addressPair];
    uint64_t v39 = [v38 shortDescription];
    id v40 = +[NSData dataWithBytesNoCopy:v75 length:20 freeWhenDone:0];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v35;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v40;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@: write generated reset ports[%@] neRet=%d\n\t\t<= data[%@]", buf, 0x26u);
  }
  int connected_socket = [v15 sdCopy];
  if (connected_socket != -1
    || (int connected_socket = [v15 sdOriginal], connected_socket != -1)
    || (int connected_socket = [v15 sd], connected_socket != -1)
    || ([v15 serviceConnection], (uint64_t v66 = objc_claimAutoreleasedReturnValue()) != 0)
    && (int v67 = (void *)v66,
        int connected_socket = nw_connection_get_connected_socket(),
        v67,
        connected_socket != -1))
  {
    unint64_t v99 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v42 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v97 = v42;
    long long v98 = v42;
    long long v95 = v42;
    long long v96 = v42;
    long long v93 = v42;
    long long v94 = v42;
    long long v91 = v42;
    long long v92 = v42;
    long long v89 = v42;
    long long v90 = v42;
    long long v87 = v42;
    long long v88 = v42;
    long long v85 = v42;
    long long v86 = v42;
    long long v83 = v42;
    long long v84 = v42;
    long long v81 = v42;
    long long v82 = v42;
    long long v79 = v42;
    long long v80 = v42;
    long long v78 = v42;
    *(_OWORD *)&uint8_t buf[32] = v42;
    long long v77 = v42;
    *(_OWORD *)buf = v42;
    *(_OWORD *)&buf[16] = v42;
    socklen_t v69 = 408;
    if (!getsockopt(connected_socket, 6, 512, buf, &v69))
    {
      id v43 = [v15 addressPair];
      id v44 = [v43 remoteAddress];
      __int16 v45 = (unsigned __int16)[v44 saPortHostOrder];
      id v46 = [v15 addressPair];
      id v47 = [v46 localAddress];
      __int16 v48 = (unsigned __int16)[v47 saPortHostOrder];
      sub_100358F18((uint64_t)v75, v45, v48, SDWORD2(v77), SDWORD1(v77));

      int v49 = [v15 addressPair];
      unsigned int v50 = [v49 remoteAddress];
      v51 = (int8x16_t *)((char *)[v50 sa6] + 8);
      unsigned int v52 = [v15 addressPair];
      uint64_t v53 = [v52 localAddress];
      tcp6checksum(v51, (int8x16_t *)((char *)[v53 sa6] + 8), (int8x16_t *)v75, 0x14uLL);

      if (v6[2079])
      {
        id v54 = [v15 addressPair];
        int v55 = [v54 remoteAddress];
        id v56 = [v55 sa];
        unsigned int v57 = [v15 addressPair];
        id v58 = [v57 localAddress];
        unsigned int v59 = -[IDSUTunController handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:](self, "handleUtunChannelWrite:source:destination:upperProtocol:bytes:bytesLen:", v6, v56, [v58 sa], 6, v75, 20);
      }
      else
      {
        [v6 vifRef];
        id v54 = [v15 addressPair];
        int v55 = [v54 remoteAddress];
        [v55 sa];
        unsigned int v57 = [v15 addressPair];
        id v58 = [v57 localAddress];
        [v58 sa];
        unsigned int v59 = NEVirtualInterfaceWriteIPPayload();
      }
      unsigned int v60 = v59;

      int v61 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = [v6 vifName];
        int v63 = [v15 addressPair];
        nw_connection_t v64 = [v63 shortDescription];
        id v65 = +[NSData dataWithBytesNoCopy:v75 length:20 freeWhenDone:0];
        *(_DWORD *)id v70 = 138413058;
        *(void *)unsigned int v71 = v62;
        *(_WORD *)&v71[8] = 2112;
        unsigned int v72 = v64;
        *(_WORD *)__int16 v73 = 1024;
        *(_DWORD *)&v73[2] = v60;
        LOWORD(v74[0]) = 2112;
        *(void *)((char *)v74 + 2) = v65;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%@: write generated reset ports[%@] neRet=%d\n\t\t<= data[%@]", v70, 0x26u);
      }
    }
  }
  objc_msgSend(v15, "setStateFlags:", objc_msgSend(v15, "stateFlags", self) | 0x20);
}

- (IDSUTunController)initWithName:(id)a3 address:(id)a4 andTestTransport:(id)a5
{
  return 0;
}

- (void)removeConnection:(id)a3 fromDeviceConnectionInfo:(id)a4 removeCode:(int64_t)a5 removeReason:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    BOOL v13 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v12;
      __int16 v41 = 2112;
      id v42 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: closing connection %@", buf, 0x16u);
    }

    if ([v10 protocol] == 6) {
      [(IDSUTunController *)self resetTCPConnection:v10 forDeviceConnectionInfo:v11];
    }
    [(IDSUTunController *)self resetIPsecTCPConnection:v10 forDeviceConnectionInfo:v11];
    if ([v10 priority] == (id)300)
    {
      unsigned int v14 = [v11 highPriorityConnectionSendingSet];
      id v15 = [v10 localConnectionGUID];
      [v14 removeObject:v15];
    }
    int v16 = [v10 compressionInfo];
    uint64_t v17 = (uint64_t)[v16 state];

    if (v17 >= 1)
    {
      int v18 = [v10 compressionInfo];
      objc_msgSend(v11, "clearLocalCID:", objc_msgSend(v18, "localCID"));
    }
    int v19 = [v10 connectionID];

    if (v19)
    {
      int v20 = [v11 connectionsByID];
      int v21 = [v10 connectionID];
      [v20 removeObjectForKey:v21];
    }
    if (([v10 stateFlags] & 2) == 0)
    {
      unsigned int v22 = [v10 openSocketCompletionHandler];

      if (v22)
      {
        objc_msgSend(v10, "setStateFlags:", objc_msgSend(v10, "stateFlags") | 2);
        unsigned int v23 = [v10 openSocketCompletionHandler];
        [v10 setOpenSocketCompletionHandler:0];
        uint64_t v24 = +[NSDictionary dictionaryWithObject:v12 forKey:NSLocalizedDescriptionKey];
        id v25 = +[NSError errorWithDomain:@"IDSUTun" code:a5 userInfo:v24];

        uint64_t v26 = [v10 completionQueue];
        id v33 = _NSConcreteStackBlock;
        uint64_t v34 = 3221225472;
        unsigned int v35 = sub_1003648D0;
        id v36 = &unk_10097E818;
        id v37 = v25;
        id v38 = v23;
        id v27 = v25;
        id v28 = v23;
        dispatch_async(v26, &v33);
      }
    }
    unsigned int v29 = objc_msgSend(v10, "addressPair", v33, v34, v35, v36);

    if (v29) {
      sub_1003F1A54((uint64_t)[v11 connectionsTableByLocalRemotePortKey], (int)objc_msgSend(v10, "uint32Key"));
    }
    if ([v10 encryptionEnabled])
    {
      sub_1003F1A54((uint64_t)[v11 outgoingEncryptionTableBySSRC], (int)objc_msgSend(v10, "SSRCSend"));
      sub_1003F1A54((uint64_t)[v11 incomingEncryptionTableBySSRC], (int)objc_msgSend(v10, "SSRCRecv"));
    }
    [v10 invalidate];
    if ([v10 shouldStopBTDatagramLink])
    {
      [v10 setShouldStopBTDatagramLink:0];
      uint64_t v30 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [v10 connectionID];
        id v32 = [v31 service];
        *(_DWORD *)buf = 138412290;
        id v40 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "closeSocket for %@ using BT datagram link - stop", buf, 0xCu);
      }
      [(IDSLinkManager *)self->_linkManager stopBTDatagramLinkForDeviceUniqueID:IDSDeviceDefaultPairedDeviceUniqueID cbuuid:kIDSDefaultPairedDeviceID];
    }
  }
}

- (void)resetAllConnectionsForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connectionsByID];
  id v6 = [v5 allValues];
  id v7 = [v6 _copyForEnumerating];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v11);
        id v13 = [v4 portMap];
        unsigned int v14 = [v12 addressPair];
        id v15 = [v14 localAddress];
        -[IDSUTunController releasePortIfNecessary:port:](self, "releasePortIfNecessary:port:", v13, [v15 saPortHostOrder]);

        [(IDSUTunController *)self removeConnection:v12 fromDeviceConnectionInfo:v4 removeCode:5031 removeReason:@"resetting all connections"];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [(IDSUTunController *)self checkSuspendTrafficForDevice:v4 wait:1];
}

- (BOOL)handleIncomingPacket:(id *)a3 fromDeviceToken:(id)a4
{
  id v178 = a4;
  BOOL logPackets = self->_logPackets;
  if (self->_logPackets) {
    uint64_t v176 = mach_continuous_time();
  }
  else {
    uint64_t v176 = 0xAAAAAAAAAAAAAAAALL;
  }
  testDeviceConnectionInfo = self->_testDeviceConnectionInfo;
  if (testDeviceConnectionInfo)
  {
    id v8 = testDeviceConnectionInfo;
  }
  else
  {
    id v8 = sub_1003F2080((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v178);
    if (!v8)
    {
      id v8 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v178;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: waiting for first openSocket", buf, 0xCu);
      }
      BOOL v13 = 1;
      goto LABEL_244;
    }
  }
  unint64_t var2 = a3->var2;
  if (var2)
  {
    var0 = a3->var0;
    if (self->_encryptionEnabled && (unsigned int v11 = *var0, v11 >= 0xE0))
    {
      if (var2 <= 7)
      {
        id v12 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v178;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = var2;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: incoming packet not enough bytes for encryption header %d", buf, 0x12u);
        }
LABEL_45:

        id v27 = 0;
        BOOL v13 = 0;
LABEL_243:

        goto LABEL_244;
      }
      if (v11 != 224 || var0[1])
      {
        id v12 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v178;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: encryption expects 0xe000 - packet is corrupt", buf, 0xCu);
        }
        goto LABEL_45;
      }
      unsigned int v81 = *((unsigned __int16 *)var0 + 1);
      int v82 = bswap32(*((_DWORD *)var0 + 1));
      sub_1003F1964((uint64_t)[v8 incomingEncryptionTableBySSRC], v82);
      long long v83 = (double *)objc_claimAutoreleasedReturnValue();
      id v27 = v83;
      if (!v83)
      {
        __int16 v101 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
        {
          if (var2 >= 0x28) {
            uint64_t v102 = 40;
          }
          else {
            uint64_t v102 = var2;
          }
          uint64_t v103 = +[NSData dataWithBytesNoCopy:var0 length:v102 freeWhenDone:0];
          v104 = (void *)v103;
          double v105 = " ...";
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v178;
          *(_WORD *)&unsigned char buf[12] = 1024;
          if (var2 < 0x29) {
            double v105 = "";
          }
          *(_DWORD *)&buf[14] = v82;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v103;
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = v105;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "%@: unable to find decryption context for ssrc:%08x data:[%@%s]", buf, 0x26u);
        }
        id v27 = 0;
        goto LABEL_174;
      }
      if ([v83 didInvalidate])
      {
        long long v84 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v178;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v27;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&unsigned char buf[24] = v82;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%@: connection %@ is already invalidated for ssrc:%08x - dropping this incoming packet", buf, 0x1Cu);
        }

LABEL_174:
        BOOL v13 = 1;
        goto LABEL_243;
      }
      var0 += 8;
      var2 -= 8;
      uint64_t v131 = sub_100221370((uint64_t)[v27 encryptionState], bswap32(v81) >> 16, (unsigned __int8 *)var0, var2, 0);
      BOOL v13 = 1;
      if (v131)
      {
        uint64_t v132 = v131;
        if (v131 != 4)
        {
          id v133 = [v8 portMap];
          double v134 = [v27 addressPair];
          BOOL v135 = [v134 localAddress];
          -[IDSUTunController releasePortIfNecessary:port:](self, "releasePortIfNecessary:port:", v133, [v135 saPortHostOrder]);

          v136 = +[NSString stringWithFormat:@"Decryption failure: %u", v132];
          [(IDSUTunController *)self removeConnection:v27 fromDeviceConnectionInfo:v8 removeCode:5301 removeReason:v136];
        }
        goto LABEL_243;
      }
      unsigned int v14 = v27;
    }
    else
    {
      BOOL v13 = 0;
      unsigned int v14 = 0;
    }
    v182 = (int8x16_t *)0xAAAAAAAAAAAAAAAALL;
    int v181 = -1431655766;
    unsigned int v15 = *var0;
    int v16 = (v15 >> 5) & 3;
    if (v16)
    {
      if (v16 != 1)
      {
        unsigned int v177 = v14;
        unsigned int v20 = [v14 encryptionEnabled];
        oslog = +[IDSFoundationLog utunController];
        BOOL v21 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        if (!v20)
        {
          if (v21)
          {
            id v28 = +[NSData dataWithBytesNoCopy:var0 length:var2 freeWhenDone:0];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v178;
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = (v15 >> 5) & 3;
            *(_WORD *)&buf[18] = 2112;
            *(void *)&buf[20] = v28;
            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@: dropping unknown proto[0x%01x] packet [%@]", buf, 0x1Cu);
          }
          goto LABEL_157;
        }
        if (v21)
        {
          unsigned int v22 = +[NSData dataWithBytesNoCopy:var0 length:var2 freeWhenDone:0];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v178;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = (v15 >> 5) & 3;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v22;
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@: dropping unknown proto[0x%01x] packet (encrypted) [%@]", buf, 0x1Cu);
        }
LABEL_241:
        BOOL v13 = 1;
        goto LABEL_242;
      }
      int v17 = 6;
    }
    else
    {
      int v17 = 17;
    }
    unsigned int v173 = v17;
    if ((v15 & 0x80) == 0)
    {
      oslog = 0;
      v182 = (int8x16_t *)(var0 + 1);
      int v181 = var2 - 1;
      unsigned int v171 = bswap32(*(unsigned __int16 *)(var0 + 1)) >> 16;
      unsigned int v172 = __rev16(*(unsigned __int16 *)(var0 + 3));
      unsigned int v174 = 43690;
      unint64_t v170 = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_27;
    }
    if (logPackets)
    {
      if (var2 >= 0x14) {
        uint64_t v23 = 20;
      }
      else {
        uint64_t v23 = var2;
      }
      oslog = +[NSData dataWithBytes:var0 length:v23];
      unint64_t v24 = var2;
      if ((v15 & 0x10) == 0) {
        goto LABEL_40;
      }
    }
    else
    {
      oslog = 0;
      unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
      if ((v15 & 0x10) == 0)
      {
LABEL_40:
        unint64_t v170 = v24;
        unsigned int v174 = *var0 & 0xF;
        int v25 = -1;
        uint64_t v26 = 1;
LABEL_67:
        v182 = (int8x16_t *)&var0[v26];
        int v181 = v25 + var2;
        if (v14)
        {
          unsigned int v177 = v14;
          uint64_t v30 = [v14 compressionInfo];
          unsigned int v31 = [v30 remoteCID];

          if (v31 != v174)
          {
            id v32 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              id v33 = [v8 vifName];
              uint64_t v34 = [v177 compressionInfo];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v33;
              *(_WORD *)&unsigned char buf[12] = 1024;
              *(_DWORD *)&buf[14] = [v34 remoteCID];
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v174;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@: found connection with mismatched (remoteCID 0x%04x != remoteCID 0x%04x)", buf, 0x18u);
            }
            goto LABEL_241;
          }
        }
        else
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          *(void *)&unsigned char buf[24] = sub_100366794;
          *(void *)&uint8_t buf[32] = sub_1003667A4;
          *(void *)&buf[40] = 0;
          v179[0] = _NSConcreteStackBlock;
          v179[1] = 3221225472;
          v179[2] = sub_1003667AC;
          v179[3] = &unk_10098A150;
          __int16 v180 = v174;
          v179[4] = buf;
          sub_1003F1C58((uint64_t)[v8 connectionsTableByLocalRemotePortKey], (uint64_t)v179);
          unsigned int v35 = *(double **)(*(void *)&buf[8] + 40);
          unsigned int v177 = v35;
          if (v35)
          {
            id v36 = v35;
          }
          else
          {
            long long v86 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              long long v87 = [v8 vifName];
              *(_DWORD *)v191 = 138412546;
              v192 = v87;
              __int16 v193 = 1024;
              unsigned int v194 = v174;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%@: failed to resolve connection for remoteCID 0x%04x", v191, 0x12u);
            }
            unsigned int v35 = 0;
          }
          _Block_object_dispose(buf, 8);

          if (!v35) {
            goto LABEL_164;
          }
        }
        long long v88 = [v177 compressionInfo];
        BOOL v89 = [v88 remoteContext] == 0;

        if (v89)
        {
          unsigned int v59 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            long long v93 = [v8 vifName];
            long long v94 = [v177 compressionInfo];
            unsigned int v95 = [v94 remoteCID];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v93;
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = v95;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%@: remoteContext is nil for remoteCID %d, decompression failed.", buf, 0x12u);
          }
          goto LABEL_115;
        }
        long long v90 = [v177 compressionInfo];
        [v90 remoteContext];
        uint64_t v91 = IDSHC_DecompressSimple();

        if (v91)
        {
          long long v19 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            long long v92 = [v8 vifName];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v92;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v91;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: IDSHC_DecompressSimple failed (%lu)", buf, 0x16u);
          }
          goto LABEL_156;
        }
        long long v97 = [v177 addressPair];
        long long v98 = [v97 remoteAddress];
        unsigned int v171 = [v98 saPortHostOrder];

        unint64_t v99 = [v177 addressPair];
        addrinfo v100 = [v99 localAddress];
        unsigned int v172 = [v100 saPortHostOrder];

        unsigned int v14 = v177;
LABEL_27:
        if (v16)
        {
          if (v181 <= 19)
          {
            unsigned int v177 = v14;
            long long v19 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v178;
              *(_WORD *)&unsigned char buf[12] = 1024;
              *(_DWORD *)&buf[14] = v181;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: incoming packet not enough bytes for TCP header %d", buf, 0x12u);
            }
LABEL_156:

LABEL_157:
            BOOL v13 = 0;
LABEL_242:

            id v27 = v177;
            goto LABEL_243;
          }
        }
        else
        {
          if (v181 <= 7)
          {
            unsigned int v177 = v14;
            long long v19 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v178;
              *(_WORD *)&unsigned char buf[12] = 1024;
              *(_DWORD *)&buf[14] = v181;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: incoming packet not enough bytes for UDP header %d", buf, 0x12u);
            }
            goto LABEL_156;
          }
          if (logPackets)
          {
            unint64_t v168 = mach_continuous_time() - v176;
            int v169 = 1;
            goto LABEL_60;
          }
        }
        int v169 = 0;
        unint64_t v168 = 0xAAAAAAAAAAAAAAAALL;
LABEL_60:
        if (!v14)
        {
          sub_1003F1964((uint64_t)[v8 connectionsTableByLocalRemotePortKey], v171 | (v172 << 16));
          unsigned int v14 = (double *)objc_claimAutoreleasedReturnValue();
        }
        unsigned int v177 = v14;
        if ((v15 & 0x80) != 0) {
          goto LABEL_76;
        }
        if (v16)
        {
          if (!tcp6checksum(0, 0, v182, v181)) {
            goto LABEL_76;
          }
        }
        else if (!udp6checksum(0, 0, v182, v181))
        {
LABEL_76:
          if (v16)
          {
            if (logPackets)
            {
              id v37 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                id v166 = [v8 vifName];
                int v165 = v181;
                int v38 = v182->u8[13];
                if ((v38 & 2) != 0) {
                  uint64_t v39 = "S";
                }
                else {
                  uint64_t v39 = "";
                }
                id v40 = "R";
                if ((v38 & 4) == 0) {
                  id v40 = "";
                }
                v163 = v40;
                v164 = v39;
                if ((v38 & 8) != 0) {
                  __int16 v41 = "P";
                }
                else {
                  __int16 v41 = "";
                }
                id v42 = ".";
                if ((v38 & 0x10) == 0) {
                  id v42 = "";
                }
                v161 = v42;
                v162 = v41;
                id v43 = [v14 flagsString];
                *(_DWORD *)buf = 138414850;
                *(void *)&uint8_t buf[4] = v166;
                *(_WORD *)&unsigned char buf[12] = 1024;
                *(_DWORD *)&buf[14] = v165;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v38;
                *(_WORD *)&unsigned char buf[24] = 2080;
                *(void *)&buf[26] = v164;
                *(_WORD *)&buf[34] = 2080;
                *(void *)&buf[36] = v163;
                *(_WORD *)&buf[44] = 2080;
                *(void *)&buf[46] = v162;
                *(_WORD *)v184 = 2080;
                *(void *)&v184[2] = v161;
                LOWORD(v185) = 1024;
                *(_DWORD *)((char *)&v185 + 2) = v172;
                HIWORD(v185) = 1024;
                unsigned int v186 = v171;
                __int16 v187 = 2112;
                v188 = v43;
                __int16 v189 = 2048;
                v190 = v177;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@: Got TCP %dB (flags[%02X] [%s%s%s%s])) for %u <= %u (connection %@ (%p))", buf, 0x60u);
              }
              unsigned int v14 = v177;
            }
            if (v14)
            {
              id v44 = [v14 connectionID];
              __int16 v45 = [v44 service];
              if ([v45 isEqualToString:@"localdelivery"]) {
                int v46 = 2;
              }
              else {
                int v46 = 4;
              }
              unsigned int v167 = v46;

              id v47 = [v8 remoteSA];
              __int16 v48 = (char *)[v47 sa6];
              int v49 = [v8 localSA];
              unsigned int v50 = (char *)[v49 sa6];
              tcp6checksum((int8x16_t *)(v48 + 8), (int8x16_t *)(v50 + 8), v182, v181);

              int v51 = v181;
              unsigned int v52 = v182->u32[1];
              int v53 = (v182->u8[12] >> 2) & 0x3C;
              if (v53
                && self->_encryptionEnabled
                && (!*((unsigned char *)v177 + 4784) ? (char v54 = 1) : (char v54 = v13), (v54 & 1) == 0))
              {
                __int16 v122 = +[IDSFoundationLog utunController];
                if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v129 = [v8 vifName];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v129;
                  _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "%@: dropping TCP (unencrypted) - expect to be encrypted", buf, 0xCu);
                }
              }
              else
              {
                unsigned int v55 = [v177 stateFlags];
                unsigned int v56 = v55;
                uint64_t v57 = bswap32(v52);
                uint64_t v58 = (v57 + v51 - v53);
                if ((v182->i8[13] & 2) == 0)
                {
                  if ((v55 & 0x80) == 0)
                  {
                    unsigned int v59 = +[IDSFoundationLog utunController];
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v60 = [v8 vifName];
                      int v61 = (void *)v60;
                      int v62 = v182->u8[13];
                      int v63 = "S";
                      if ((v62 & 2) == 0) {
                        int v63 = "";
                      }
                      nw_connection_t v64 = "R";
                      *(_DWORD *)buf = 138414338;
                      if ((v62 & 4) == 0) {
                        nw_connection_t v64 = "";
                      }
                      *(void *)&uint8_t buf[4] = v60;
                      *(_WORD *)&unsigned char buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v181;
                      if ((v62 & 8) != 0) {
                        id v65 = "P";
                      }
                      else {
                        id v65 = "";
                      }
                      *(_WORD *)&buf[18] = 1024;
                      *(_DWORD *)&buf[20] = v62;
                      if ((v62 & 0x10) != 0) {
                        uint64_t v66 = ".";
                      }
                      else {
                        uint64_t v66 = "";
                      }
                      *(_WORD *)&unsigned char buf[24] = 2080;
                      *(void *)&buf[26] = v63;
                      *(_WORD *)&buf[34] = 2080;
                      *(void *)&buf[36] = v64;
                      *(_WORD *)&buf[44] = 2080;
                      *(void *)&buf[46] = v65;
                      *(_WORD *)v184 = 2080;
                      *(void *)&v184[2] = v66;
                      LOWORD(v185) = 1024;
                      *(_DWORD *)((char *)&v185 + 2) = v172;
                      HIWORD(v185) = 1024;
                      unsigned int v186 = v171;
                      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%@: dropping TCP (unexpected - no first packet) %dB (flags[%02X] [%s%s%s%s])) for %u <= %u", buf, 0x4Cu);
                    }
LABEL_115:

                    goto LABEL_241;
                  }
                  if (v58 - [v177 expectedNextIncomingSequenceNumber] <= 0x3FFFFFFE) {
                    [v177 setExpectedNextIncomingSequenceNumber:v58];
                  }
                  if ((v56 & 0x100) != 0) {
                    goto LABEL_201;
                  }
                  [v177 setStateFlags:v56 | 0x100];
                  id v106 = +[IDSFoundationLog utunController];
                  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v177;
                    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Received the first data packet for %@", buf, 0xCu);
                  }

                  double v107 = sub_100352F48();
                  v177[609] = v107;
                  if (v107 != 0.0)
                  {
                    uint64_t v108 = [v177 idsDeviceConnectionUUID];
                    BOOL v109 = v108 == 0;

                    if (!v109)
                    {
                      BOOL v110 = +[IDSDeviceConnectionAWDMetrics sharedInstance];
                      double v111 = v177[609];
                      id v112 = [v177 idsDeviceConnectionUUID];
                      [v110 setFirstPacketReceiveTime:v112 forConnectionUUID:v111];
                    }
                  }
                  if (([v8 shouldUseIPsecLink] & 1) == 0) {
                    goto LABEL_184;
                  }
                  goto LABEL_147;
                }
                if ((v55 & 0x80) == 0)
                {
                  [v177 setStateFlags:v55 | 0x80];
                  [v177 setFirstPacketReceiveTime:sub_100352F48()];
                  [v177 setFirstIncomingSYNSequenceNumber:v57];
                  [v177 setExpectedNextIncomingSequenceNumber:(v58 + 1)];
                  if (([v8 shouldUseIPsecLink] & 1) == 0)
                  {
LABEL_184:
                    unint64_t v85 = [(IDSLinkManager *)self->_linkManager currentLinkType:v8[1].isa];
                    goto LABEL_185;
                  }
LABEL_147:
                  unint64_t v85 = 5;
LABEL_185:
                  [v177 reportToAWD:v85 connectionType:v167 error:0];
LABEL_201:
                  double v126 = 1.22978294e19;
                  if ((v182->i8[13] & 4) != 0)
                  {
                    v127 = +[IDSFoundationLog utunController];
                    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v177;
                      _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "Got reset for connection %@", buf, 0xCu);
                    }

                    objc_msgSend(v177, "setStateFlags:", objc_msgSend(v177, "stateFlags") | 0x20);
                  }
                  uint64_t v128 = v176;
                  goto LABEL_220;
                }
                if (v172 != 1024
                  || v57 == [v177 firstIncomingSYNSequenceNumber]
                  || (v182->i8[13] & 0x10) != 0)
                {
                  goto LABEL_201;
                }
                int v113 = v181;
                int v114 = +[IDSFoundationLog utunController];
                if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                {
                  if (v113 >= 40) {
                    int v113 = 40;
                  }
                  Class isa = v8[1].isa;
                  uint64_t v116 = +[NSData dataWithBytesNoCopy:v182 length:v113 freeWhenDone:0];
                  unsigned int v117 = (void *)v116;
                  *(_DWORD *)buf = 138412802;
                  if (v113 == v181) {
                    uint64_t v118 = "";
                  }
                  else {
                    uint64_t v118 = " ...";
                  }
                  *(void *)&uint8_t buf[4] = isa;
                  *(_WORD *)&unsigned char buf[12] = 2112;
                  *(void *)&buf[14] = v116;
                  *(_WORD *)&buf[22] = 2080;
                  *(void *)&unsigned char buf[24] = v118;
                  _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Control channel reestablishment request from [%@]\n\t\t<= data[%@%s]", buf, 0x20u);
                }
                [(IDSUTunController *)self resetTCPConnection:v177 forDeviceConnectionInfo:v8];
                v119 = +[NSData dataWithBytes:v182 length:v181];
                [v8 setControlChannelCachedSYN:v119];

                __int16 v120 = [v8 controlChannel];
                [v120 setDidReceiveReestablishmentRequest:1];

                uint64_t v121 = [v8 controlChannel];
                [v121 setReestablishmentRequestReceiveTime:sub_100352F48()];

                __int16 v122 = +[IDSFoundationLog utunController];
                if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                {
                  v123 = [v8 controlChannel];
                  unsigned int v124 = [v123 didReceiveReestablishmentRequest];
                  CFStringRef v125 = @"NO";
                  if (v124) {
                    CFStringRef v125 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v125;
                  _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "Control channel setDidReceiveReestablishment %@ after reestablishment request", buf, 0xCu);
                }
              }
LABEL_211:

              goto LABEL_241;
            }
            __int16 v73 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v74 = [v8 vifName];
              __int16 v75 = (void *)v74;
              int v76 = v182->u8[13];
              long long v77 = "S";
              if ((v76 & 2) == 0) {
                long long v77 = "";
              }
              long long v78 = "R";
              *(_DWORD *)buf = 138414338;
              if ((v76 & 4) == 0) {
                long long v78 = "";
              }
              *(void *)&uint8_t buf[4] = v74;
              *(_WORD *)&unsigned char buf[12] = 1024;
              *(_DWORD *)&buf[14] = v181;
              if ((v76 & 8) != 0) {
                long long v79 = "P";
              }
              else {
                long long v79 = "";
              }
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v76;
              if ((v76 & 0x10) != 0) {
                long long v80 = ".";
              }
              else {
                long long v80 = "";
              }
              *(_WORD *)&unsigned char buf[24] = 2080;
              *(void *)&buf[26] = v77;
              *(_WORD *)&buf[34] = 2080;
              *(void *)&buf[36] = v78;
              *(_WORD *)&buf[44] = 2080;
              *(void *)&buf[46] = v79;
              *(_WORD *)v184 = 2080;
              *(void *)&v184[2] = v80;
              LOWORD(v185) = 1024;
              *(_DWORD *)((char *)&v185 + 2) = v172;
              HIWORD(v185) = 1024;
              unsigned int v186 = v171;
              _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%@: dropping TCP (no connection) %dB (flags[%02X] [%s%s%s%s])) for %u <= %u", buf, 0x4Cu);
            }
          }
          else
          {
            if (v14)
            {
              if (!self->_encryptionEnabled || (!*((unsigned char *)v14 + 4784) ? (char v67 = 1) : (char v67 = v13), (v67 & 1) != 0))
              {
                id v68 = [v14 readHandler];

                if (v68)
                {
                  socklen_t v69 = &v182->i8[8];
                  uint64_t v70 = v181 - 8;
                  a3->var1 = v70;
                  a3->unint64_t var2 = v70;
                  a3->var0 = v69;
                  unsigned int v71 = [v177 readHandler];
                  ((void (**)(void, $7E5B20AA39B03BD07413883FE2814EDA *))v71)[2](v71, a3);

                  goto LABEL_241;
                }
                v137 = [v8 remoteSA];
                id v138 = [v137 sa6];
                uint64_t v139 = [v8 localSA];
                id v140 = [v139 sa6];
                udp6checksum((uint64_t)v138 + 8, (uint64_t)v140 + 8, v182, v181);

                if (logPackets)
                {
                  uint64_t v128 = mach_continuous_time();
                  double v126 = (double)(v128 - v176);
                }
                else
                {
                  double v126 = 1.22978294e19;
                  uint64_t v128 = v176;
                }
                kdebug_trace();
LABEL_220:
                if (v8[2079].isa)
                {
                  v141 = [v8 remoteSA];
                  id v142 = [v141 sa];
                  v143 = [v8 localSA];
                  id v144 = [v143 sa];
                  unsigned int v145 = [(IDSUTunController *)self handleUtunChannelWrite:v8 source:v142 destination:v144 upperProtocol:v173 bytes:v182 bytesLen:v181];
                }
                else
                {
                  [v8 vifRef];
                  v141 = [v8 remoteSA];
                  [v141 sa];
                  v143 = [v8 localSA];
                  [v143 sa];
                  unsigned int v145 = NEVirtualInterfaceWriteIPPayload();
                }
                unsigned int v146 = v145;

                if (v169)
                {
                  uint64_t v147 = mach_continuous_time();
                  BOOL v148 = (void *)qword_100A531F0;
                  v149 = +[IDSUTunTimingLogger incomingEventWithTimestamp:var2 - 8 duration:*(double *)&qword_100A4C830 * (double)v147 processTime:*(double *)&qword_100A4C830 * (double)(v147 - v176) compressionTime:v126 * *(double *)&qword_100A4C830 kernelTime:*(double *)&qword_100A4C830 * (double)v168 bytes:*(double *)&qword_100A4C830 * (double)(v147 - v128)];
                  [v148 addEvent:v149];
                }
                if (logPackets)
                {
                  if ((v15 & 0x80) != 0)
                  {
                    v150 = +[IDSFoundationLog utunController];
                    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
                    {
                      double v151 = [v8 vifName];
                      v152 = " ...";
                      *(_DWORD *)buf = 138414338;
                      *(void *)&uint8_t buf[4] = v151;
                      *(_WORD *)&unsigned char buf[12] = 1024;
                      if (v170 < 0x15) {
                        v152 = "";
                      }
                      *(_DWORD *)&buf[14] = 1;
                      *(_WORD *)&buf[18] = 1024;
                      *(_DWORD *)&buf[20] = v174;
                      *(_WORD *)&unsigned char buf[24] = 1024;
                      *(_DWORD *)&buf[26] = v173;
                      *(_WORD *)&buf[30] = 1024;
                      *(_DWORD *)&uint8_t buf[32] = v171;
                      *(_WORD *)&buf[36] = 1024;
                      *(_DWORD *)&buf[38] = v172;
                      *(_WORD *)&buf[42] = 2048;
                      *(void *)&buf[44] = v170;
                      *(_WORD *)&buf[52] = 2112;
                      *(void *)v184 = oslog;
                      *(_WORD *)&v184[8] = 2080;
                      v185 = v152;
                      _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_DEFAULT, "%@: incoming data - compressed: %d(cid:%u) protocol:%d s_port:%u d_port:%u.\n\t\t<= c(%luB): [%@%s]", buf, 0x48u);
                    }
                  }
                  int v153 = v181;
                  v154 = +[IDSFoundationLog utunController];
                  if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                  {
                    if (v153 >= 40) {
                      int v153 = 40;
                    }
                    unsigned int v155 = [v8 vifName];
                    unsigned int v156 = [v177 expectedNextIncomingSequenceNumber];
                    uint64_t v157 = +[NSData dataWithBytesNoCopy:v182 length:v153 freeWhenDone:0];
                    v158 = (void *)v157;
                    *(_DWORD *)buf = 138414082;
                    if (v153 == v181) {
                      v159 = "";
                    }
                    else {
                      v159 = " ...";
                    }
                    *(void *)&uint8_t buf[4] = v155;
                    *(_WORD *)&unsigned char buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v173;
                    *(_WORD *)&buf[18] = 1024;
                    *(_DWORD *)&buf[20] = v172;
                    *(_WORD *)&unsigned char buf[24] = 1024;
                    *(_DWORD *)&buf[26] = v171;
                    *(_WORD *)&buf[30] = 1024;
                    *(_DWORD *)&uint8_t buf[32] = v146;
                    *(_WORD *)&buf[36] = 1024;
                    *(_DWORD *)&buf[38] = v156;
                    *(_WORD *)&buf[42] = 2112;
                    *(void *)&buf[44] = v157;
                    *(_WORD *)&buf[52] = 2080;
                    *(void *)v184 = v159;
                    _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "%@: write ippayload (proto=%u) %u <= %u neRet=%d niseq:%08x\n\t\t<= data[%@%s]", buf, 0x3Eu);
                  }
                }
                objc_msgSend(v177, "setPacketsReceived:", (char *)objc_msgSend(v177, "packetsReceived") + 1);
                objc_msgSend(v177, "setBytesReceived:", (char *)objc_msgSend(v177, "bytesReceived") + a3->var2);
                goto LABEL_241;
              }
              __int16 v122 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
              {
                v130 = [v8 vifName];
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v130;
                *(_WORD *)&unsigned char buf[12] = 1024;
                *(_DWORD *)&buf[14] = v181;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v172;
                *(_WORD *)&unsigned char buf[24] = 1024;
                *(_DWORD *)&buf[26] = v171;
                _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "%@: dropping UDP (unencrypted) %dB for %u <= %u", buf, 0x1Eu);
              }
              goto LABEL_211;
            }
            __int16 v73 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              long long v96 = [v8 vifName];
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v96;
              *(_WORD *)&unsigned char buf[12] = 1024;
              *(_DWORD *)&buf[14] = v181;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v172;
              *(_WORD *)&unsigned char buf[24] = 1024;
              *(_DWORD *)&buf[26] = v171;
              _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%@: dropping UDP (no connection) %dB for %u <= %u", buf, 0x1Eu);
            }
          }

LABEL_164:
          unsigned int v177 = 0;
          goto LABEL_241;
        }
        [v14 setChecksumFailed:1];
        if (([v8 capabilityFlags] & 0x80) != 0)
        {
          long long v19 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v72 = [v8 vifName];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v72;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v177;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: checksum failed for connection %@", buf, 0x16u);
          }
          goto LABEL_156;
        }
        goto LABEL_76;
      }
    }
    if (var2 <= 2)
    {
      unsigned int v177 = v14;
      unsigned int v29 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v178;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = var2;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: incoming packet not enough bytes for largeCID %d", buf, 0x12u);
      }

      goto LABEL_157;
    }
    unint64_t v170 = v24;
    unsigned int v174 = bswap32(*(unsigned __int16 *)(var0 + 1)) >> 16;
    int v25 = -3;
    uint64_t v26 = 3;
    goto LABEL_67;
  }
  long long v18 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v178;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: incoming packet not enough bytes to parse %d", buf, 0x12u);
  }

  BOOL v13 = 0;
LABEL_244:

  return v13;
}

- (void)internalOpenSocketWithDestination:(id)a3 localSA:(id)a4 remoteSA:(id)a5 protocol:(int)a6 trafficClass:(int)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if (a6 == 17) {
    int v17 = 2;
  }
  else {
    int v17 = 1;
  }
  uint64_t v18 = socket(30, v17, 0);
  if (v18 == -1)
  {
    BOOL v21 = __error();
    unsigned int v22 = +[NSString stringWithFormat:@"device %@: socket() failed: errno=%d: %s", v13, *v21, strerror(*v21)];
    uint64_t v23 = +[NSDictionary dictionaryWithObject:v22 forKey:NSLocalizedDescriptionKey];
    unint64_t v24 = +[NSError errorWithDomain:@"IDSUTun" code:5001 userInfo:v23];

    (*((void (**)(id, void, void, void, void, uint64_t, void, void, void *))v16 + 2))(v16, 0, 0, 0, 0, 0xFFFFFFFFLL, 0, 0, v24);
    IDSAssertNonFatalErrnoWithSource();

    goto LABEL_25;
  }
  uint64_t v19 = v18;
  IDSCheckFileDescriptorUsageWithSource();
  int v20 = fcntl(v19, 3, 0);
  fcntl(v19, 4, v20 | 4u);
  int v42 = 1;
  setsockopt(v19, 0xFFFF, 4130, &v42, 4u);
  int v41 = 1;
  setsockopt(v19, 0xFFFF, 4, &v41, 4u);
  int v40 = 1;
  setsockopt(v19, 0xFFFF, 512, &v40, 4u);
  if (a6 == 6)
  {
    *(_DWORD *)buf = 1;
    setsockopt(v19, 6, 521, buf, 4u);
    if (a7 <= 699)
    {
      if (a7 != 500 && a7 != 600) {
        goto LABEL_15;
      }
    }
    else if (a7 != 700 && a7 != 900 && a7 != 800)
    {
      goto LABEL_15;
    }
    int v39 = 1;
    setsockopt(v19, 6, 1, &v39, 4u);
  }
LABEL_15:
  sub_10035E880(v19, a7);
  int v25 = bind(v19, (const sockaddr *)[v14 sa], 0x1Cu);
  uint64_t v26 = *__error();
  id v27 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)[v14 sa6] + 8, 16);
    int v29 = *((_DWORD *)[v14 sa6] + 6);
    *(_DWORD *)buf = 138413570;
    id v44 = v13;
    __int16 v45 = 2112;
    *(void *)int v46 = v14;
    *(_WORD *)&v46[8] = 2112;
    id v47 = v28;
    __int16 v48 = 1024;
    int v49 = v29;
    __int16 v50 = 1024;
    int v51 = v25;
    __int16 v52 = 1024;
    int v53 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "for device %@: binding to [%@ [%@] @ scopeid=%d] iRet=%d (errno=%d)", buf, 0x32u);
  }
  if (v25)
  {
    close(v19);
    uint64_t v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"device %@: can't bind to [%@ @ scopeid=%d]: errno=%d: %s", v13, v14, *((unsigned int *)[v14 sa6] + 6), v26, strerror(v26));
    unsigned int v31 = +[NSDictionary dictionaryWithObject:v30 forKey:NSLocalizedDescriptionKey];
    uint64_t v32 = 5002;
  }
  else
  {
    int v33 = connect(v19, (const sockaddr *)[v15 sa], 0x1Cu);
    uint64_t v34 = *__error();
    unsigned int v35 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = +[IDSSockAddrWrapper wrapperWithSockAddr:](IDSSockAddrWrapper, "wrapperWithSockAddr:", [v15 sa]);
      int v37 = *((_DWORD *)[v15 sa6] + 6);
      *(_DWORD *)buf = 138413058;
      id v44 = v36;
      __int16 v45 = 1024;
      *(_DWORD *)int v46 = v37;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v33;
      LOWORD(v47) = 1024;
      *(_DWORD *)((char *)&v47 + 2) = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "connecting to [%@ @ scope=%u] %d (%d)", buf, 0x1Eu);
    }
    if (!v33 || v34 == 36)
    {
      (*((void (**)(id, void, void, void, void, uint64_t, void, void, void))v16 + 2))(v16, 0, 0, 0, 0, v19, 0, 0, 0);
      goto LABEL_25;
    }
    close(v19);
    uint64_t v30 = +[NSString stringWithFormat:@"device %@: can't connect to %@: errno=%d: %s", v13, v15, v34, strerror(v34)];
    unsigned int v31 = +[NSDictionary dictionaryWithObject:v30 forKey:NSLocalizedDescriptionKey];
    uint64_t v32 = 5003;
  }
  int v38 = +[NSError errorWithDomain:@"IDSUTun" code:v32 userInfo:v31];

  (*((void (**)(id, void, void, void, void, uint64_t, void, void, void *))v16 + 2))(v16, 0, 0, 0, 0, 0xFFFFFFFFLL, 0, 0, v38);
LABEL_25:
}

- (int)processCompressionRequest:(id)a3 fromDeviceConnectionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 vifName];
    *(_DWORD *)buf = 138412546;
    long long v80 = v8;
    __int16 v81 = 2112;
    *(void *)int v82 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: got control message: compression_req %@", buf, 0x16u);
  }
  id v9 = [v5 length];
  id v10 = v5;
  unsigned int v11 = (char *)[v10 bytes];
  if ((unint64_t)v9 > 0xA)
  {
    int v17 = v11;
    long long v78 = v6;
    uint64_t v18 = bswap32(*(unsigned __int16 *)(v11 + 1)) >> 16;
    uint64_t v19 = bswap32(*(unsigned __int16 *)(v11 + 3)) >> 16;
    uint64_t v20 = bswap32(*(unsigned __int16 *)(v11 + 5)) >> 16;
    uint64_t v21 = bswap32(*(unsigned __int16 *)(v11 + 7)) >> 16;
    uint64_t v22 = bswap32(*(unsigned __int16 *)(v11 + 9)) >> 16;
    uint64_t v23 = v18 + v19 + v20 + v21 + v22 + 23;
    if (v9 != (id)v23)
    {
      id v12 = +[IDSFoundationLog utunController];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v59 = 1;
        id v6 = v78;
        goto LABEL_52;
      }
      id v6 = v78;
      id v13 = [v78 vifName];
      *(_DWORD *)buf = 138412802;
      long long v80 = v13;
      __int16 v81 = 1024;
      *(_DWORD *)int v82 = v9;
      *(_WORD *)&v82[4] = 2048;
      *(void *)&v82[6] = v23;
      id v14 = "%@: invalid message size for UTCMType_CompressionRequest (%u != %lu)";
      id v15 = v12;
      uint32_t v16 = 28;
      goto LABEL_24;
    }
    unint64_t v24 = v11 + 23;
    id v12 = [objc_alloc((Class)NSString) initWithBytes:v11 + 23 length:v18 encoding:4];
    if (!v12)
    {
      id v27 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v78;
        int v61 = [v78 vifName];
        *(_DWORD *)buf = 138412290;
        long long v80 = v61;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionRequest cannot decode remoteConnectionGUID", buf, 0xCu);

        int v59 = 2;
      }
      else
      {
        int v59 = 2;
        id v6 = v78;
      }
      goto LABEL_51;
    }
    int v25 = &v24[v18];
    uint64_t v26 = [objc_alloc((Class)NSString) initWithBytes:v25 length:v19 encoding:4];
    id v27 = v26;
    if (!v26)
    {
      unsigned int v31 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v78;
        int v62 = [v78 vifName];
        *(_DWORD *)buf = 138412290;
        long long v80 = v62;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionRequest cannot decode localConnectionGUID", buf, 0xCu);

        int v59 = 2;
      }
      else
      {
        int v59 = 2;
        id v6 = v78;
      }
      goto LABEL_50;
    }
    long long v77 = v26;
    int v75 = bswap32(*(unsigned __int16 *)(v17 + 11)) >> 16;
    unsigned int v76 = bswap32(*(unsigned __int16 *)(v17 + 13)) >> 16;
    unsigned int v73 = bswap32(*(_DWORD *)(v17 + 19));
    unsigned int v74 = bswap32(*(_DWORD *)(v17 + 15));
    id v28 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [v78 vifName];
      *(_DWORD *)buf = 138413314;
      long long v80 = v29;
      __int16 v81 = 1024;
      *(_DWORD *)int v82 = v75;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = v76;
      *(_WORD *)&v82[10] = 1024;
      *(_DWORD *)&v82[12] = v74;
      *(_WORD *)&v82[16] = 1024;
      unsigned int v83 = v73;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: recv compression_req (#:%u remoteCID:%u seq:%u ack:%u)", buf, 0x24u);
    }
    uint64_t v30 = &v25[v19];
    unsigned int v31 = [objc_alloc((Class)NSString) initWithBytes:&v25[v19] length:v20 encoding:4];
    if (!v31)
    {
      int v33 = +[IDSFoundationLog utunController];
      id v6 = v78;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v63 = [v78 vifName];
        *(_DWORD *)buf = 138412290;
        long long v80 = v63;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionRequest cannot decode account", buf, 0xCu);
      }
      int v59 = 2;
      id v27 = v77;
      goto LABEL_49;
    }
    uint64_t v32 = (uint64_t)&v30[v20];
    int v33 = [objc_alloc((Class)NSString) initWithBytes:v32 length:v21 encoding:4];
    id v6 = v78;
    if (!v33)
    {
      uint64_t v34 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        nw_connection_t v64 = [v78 vifName];
        *(_DWORD *)buf = 138412290;
        long long v80 = v64;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionRequest cannot decode service", buf, 0xCu);
      }
      int v59 = 2;
      id v27 = v77;
      goto LABEL_48;
    }
    uint64_t v34 = [objc_alloc((Class)NSString) initWithBytes:v32 + v21 length:v22 encoding:4];
    if (!v34)
    {
      uint64_t v60 = +[IDSFoundationLog utunController];
      id v27 = v77;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        id v65 = [v78 vifName];
        *(_DWORD *)buf = 138412290;
        long long v80 = v65;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionRequest cannot decode name", buf, 0xCu);
      }
      int v59 = 2;
      goto LABEL_47;
    }
    uint64_t v35 = +[IDSGenericConnectionID idWithAccount:v31 service:v33 name:v34];
    id v36 = [v78 connectionsByID];
    unsigned int v72 = v35;
    int v37 = [v36 objectForKey:v35];

    int v38 = v37;
    id v27 = v77;
    if (v37)
    {
      int v39 = [v37 localConnectionGUID];
      if ([v39 isEqualToString:v77])
      {
        [v38 remoteConnectionGUID];
        int v40 = v71 = v38;
        unsigned __int8 v41 = [v40 isEqualToString:v12];

        int v38 = v71;
        if (v41)
        {
          int v42 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            id v43 = [v78 vifName];
            id v44 = [v71 addressPair];
            __int16 v45 = [v44 shortDescription];
            *(_DWORD *)buf = 138412546;
            long long v80 = v43;
            __int16 v81 = 2112;
            *(void *)int v82 = v45;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@: processCompressionRequest resolved connection ports[%@]", buf, 0x16u);

            int v38 = v71;
          }

          [v38 compressionInfo];
          v47 = int v46 = v38;
          [v47 setRemoteCID:v76];

          HIDWORD(v70) = [v46 protocol];
          __int16 v48 = [v46 addressPair];
          int v49 = [v48 remoteAddress];
          LODWORD(v70) = [v49 saPortHostOrder];

          __int16 v50 = objc_msgSend(v46, "addressPair", v70);
          int v51 = [v50 localAddress];
          [v51 saPortHostOrder];

          IDSHC_CreateContext();
          __int16 v52 = [v46 compressionInfo];
          [v52 setRemoteContext:0];

          int v53 = [v46 localConnectionGUID];
          char v54 = [v46 remoteConnectionGUID];
          unsigned int v55 = sub_100367880(v75, v53, v54, v31, v33, v34);

          id v6 = v78;
          unsigned int v56 = [v78 controlChannel];
          [v56 sendMessage:v55];

          uint64_t v57 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v58 = [v78 vifName];
            *(_DWORD *)buf = 138412546;
            long long v80 = v58;
            __int16 v81 = 2112;
            *(void *)int v82 = v55;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%@: sending control message: compression_resp %@", buf, 0x16u);
          }
          int v59 = 0;
          int v38 = v71;
          uint64_t v60 = v72;
LABEL_46:

LABEL_47:
LABEL_48:

LABEL_49:
LABEL_50:

LABEL_51:
          goto LABEL_52;
        }
      }
      else
      {
      }
    }
    uint64_t v66 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      [v78 vifName];
      id v68 = v67 = v38;
      *(_DWORD *)buf = 138412802;
      long long v80 = v68;
      __int16 v81 = 2112;
      *(void *)int v82 = v77;
      *(_WORD *)&v82[8] = 2112;
      *(void *)&v82[10] = v12;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionRequest found connection mismatch! (localGUID:%@ remoteGUID:%@)", buf, 0x20u);

      int v38 = v67;
    }

    int v59 = 2;
    uint64_t v60 = v72;
    goto LABEL_46;
  }
  id v12 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v6 vifName];
    *(_DWORD *)buf = 138412546;
    long long v80 = v13;
    __int16 v81 = 2048;
    *(void *)int v82 = v9;
    id v14 = "%@: UTCMType_CompressionRequest has invalid header length (%lu)";
    id v15 = v12;
    uint32_t v16 = 22;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
  }
  int v59 = 1;
LABEL_52:

  return v59;
}

- (int)processCompressionResponse:(id)a3 fromDeviceConnectionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 vifName];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    __int16 v77 = 2112;
    *(void *)long long v78 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: got control message: compression_resp %@", buf, 0x16u);
  }
  id v9 = [v5 length];
  id v10 = v5;
  unsigned int v11 = (char *)[v10 bytes];
  if ((unint64_t)v9 > 0xA)
  {
    id v15 = v11;
    id v16 = v10;
    int v75 = v6;
    uint64_t v17 = bswap32(*(unsigned __int16 *)(v11 + 1)) >> 16;
    uint64_t v18 = bswap32(*(unsigned __int16 *)(v11 + 3)) >> 16;
    uint64_t v19 = bswap32(*(unsigned __int16 *)(v11 + 5)) >> 16;
    uint64_t v20 = bswap32(*(unsigned __int16 *)(v11 + 7)) >> 16;
    uint64_t v21 = bswap32(*(unsigned __int16 *)(v11 + 9)) >> 16;
    uint64_t v22 = v17 + v18 + v19 + v20 + v21 + 13;
    if (v9 != (id)v22)
    {
      id v12 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v75;
        int v59 = [v75 vifName];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v59;
        __int16 v77 = 1024;
        *(_DWORD *)long long v78 = v9;
        *(_WORD *)&v78[4] = 2048;
        *(void *)&v78[6] = v22;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: invalid message size for UTCMType_CompressionResponse (%u != %lu)", buf, 0x1Cu);

        int v14 = 1;
      }
      else
      {
        int v14 = 1;
        id v6 = v75;
      }
      id v10 = v16;
      goto LABEL_54;
    }
    uint64_t v23 = v11 + 13;
    unsigned int v74 = [objc_alloc((Class)NSString) initWithBytes:v11 + 13 length:v17 encoding:4];
    if (!v74)
    {
      int v25 = +[IDSFoundationLog utunController];
      id v10 = v16;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v75;
        uint64_t v60 = [v75 vifName];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v60;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionResponse cannot decode remoteConnectionGUID", buf, 0xCu);

        int v14 = 2;
        id v12 = 0;
      }
      else
      {
        int v14 = 2;
        id v12 = 0;
        id v6 = v75;
      }
      goto LABEL_53;
    }
    unint64_t v24 = &v23[v17];
    int v25 = [objc_alloc((Class)NSString) initWithBytes:v24 length:v18 encoding:4];
    id v10 = v16;
    if (!v25)
    {
      uint64_t v30 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v75;
        int v61 = [v75 vifName];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v61;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionResponse cannot decode localConnectionGUID", buf, 0xCu);

        int v14 = 2;
        id v12 = v74;
      }
      else
      {
        int v14 = 2;
        id v12 = v74;
        id v6 = v75;
      }
      goto LABEL_52;
    }
    unsigned int v73 = bswap32(*(unsigned __int16 *)(v15 + 11)) >> 16;
    uint64_t v26 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      [v75 vifName];
      v28 = id v27 = v25;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v28;
      __int16 v77 = 1024;
      *(_DWORD *)long long v78 = v73;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@: recv compression_resp (#:%u)", buf, 0x12u);

      int v25 = v27;
    }

    int v29 = &v24[v18];
    uint64_t v30 = [objc_alloc((Class)NSString) initWithBytes:v29 length:v19 encoding:4];
    if (!v30)
    {
      uint64_t v32 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v75;
        [v75 vifName];
        v63 = int v62 = v25;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v63;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionResponse cannot decode account", buf, 0xCu);

        int v25 = v62;
        int v14 = 2;
        id v12 = v74;
      }
      else
      {
        int v14 = 2;
        id v12 = v74;
        id v6 = v75;
      }
      goto LABEL_51;
    }
    uint64_t v31 = (uint64_t)&v29[v19];
    uint64_t v32 = [objc_alloc((Class)NSString) initWithBytes:v31 length:v20 encoding:4];
    if (!v32)
    {
      uint64_t v34 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v75;
        [v75 vifName];
        v65 = nw_connection_t v64 = v25;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v65;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionResponse cannot decode service", buf, 0xCu);

        int v25 = v64;
        int v14 = 2;
        id v12 = v74;
      }
      else
      {
        int v14 = 2;
        id v12 = v74;
        id v6 = v75;
      }
      goto LABEL_50;
    }
    int v33 = v25;
    uint64_t v34 = [objc_alloc((Class)NSString) initWithBytes:v31 + v20 length:v21 encoding:4];
    if (!v34)
    {
      uint64_t v66 = +[IDSFoundationLog utunController];
      id v6 = v75;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        char v67 = [v75 vifName];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v67;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionResponse cannot decode name", buf, 0xCu);
      }
      int v14 = 2;
      id v12 = v74;
      int v25 = v33;
      goto LABEL_49;
    }
    uint64_t v35 = +[IDSGenericConnectionID idWithAccount:v30 service:v32 name:v34];
    id v36 = [v75 connectionsByID];
    unsigned int v72 = v35;
    int v37 = [v36 objectForKey:v35];

    if (v37)
    {
      int v38 = [v37 localConnectionGUID];
      if ([v38 isEqualToString:v33])
      {
        int v39 = [v37 remoteConnectionGUID];
        unsigned __int8 v40 = [v39 isEqualToString:v74];

        if (v40)
        {
          unsigned __int8 v41 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            [v75 vifName];
            int v42 = log = v41;
            id v43 = [v37 addressPair];
            id v44 = [v43 shortDescription];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v42;
            __int16 v77 = 2112;
            *(void *)long long v78 = v44;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@: processCompressionResponse resolved connection ports[%@]", buf, 0x16u);

            unsigned __int8 v41 = log;
          }

          __int16 v45 = [v37 compressionInfo];
          unsigned int v46 = [v45 reqCount];

          if (v46 <= v73)
          {
            id v47 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v48 = [v75 vifName];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v48;
              __int16 v77 = 1024;
              *(_DWORD *)long long v78 = v73;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%@: compression_req (%u) acknowledged!", buf, 0x12u);
            }
            int v49 = [v37 compressionInfo];
            [v49 setReqCount:v73];
          }
          *(void *)buf = 0;
          [v37 protocol];
          __int16 v50 = [v37 compressionInfo];
          [v50 localCID];

          int v51 = [v37 addressPair];
          __int16 v52 = [v51 localAddress];
          [v52 saPortHostOrder];

          int v53 = [v37 addressPair];
          char v54 = [v53 remoteAddress];
          [v54 saPortHostOrder];

          unsigned int v55 = [v37 compressionInfo];
          [v55 lastSentSeq];

          unsigned int v56 = [v37 compressionInfo];
          [v56 lastSentAck];

          IDSHC_CreateContext();
          uint64_t v57 = [v37 compressionInfo];
          [v57 setLocalContext:*(void *)buf];

          uint64_t v58 = [v37 compressionInfo];
          [v58 setState:2];

          int v14 = 0;
          id v12 = v74;
          id v6 = v75;
LABEL_48:

          int v25 = v33;
          uint64_t v66 = v72;
LABEL_49:

LABEL_50:
LABEL_51:

LABEL_52:
LABEL_53:

          goto LABEL_54;
        }
      }
      else
      {
      }
    }
    id v68 = +[IDSFoundationLog utunController];
    id v12 = v74;
    id v6 = v75;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      socklen_t v69 = [v75 vifName];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v69;
      __int16 v77 = 2112;
      *(void *)long long v78 = v33;
      *(_WORD *)&v78[8] = 2112;
      *(void *)&v78[10] = v74;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionResponse found connection mismatch! (localGUID:%@ remoteGUID:%@)", buf, 0x20u);
    }
    int v14 = 2;
    goto LABEL_48;
  }
  id v12 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v6 vifName];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    __int16 v77 = 2048;
    *(void *)long long v78 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CompressionResponse has invalid header length (%lu)", buf, 0x16u);
  }
  int v14 = 1;
LABEL_54:

  return v14;
}

- (void)startCompressionForConnection:(id)a3 deviceConnectionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IDSFoundationLog utunController];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 && v6)
  {
    if (v8)
    {
      id v9 = [v5 addressPair];
      id v10 = [v9 shortDescription];
      *(_DWORD *)buf = 138412290;
      unint64_t v54 = (unint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "startCompressionForConnection ports[%@]", buf, 0xCu);
    }
    id v11 = [v6 nextAvailableLocalCID];
    id v7 = +[IDSFoundationLog utunController];
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v11 == 0xFFFF)
    {
      if (v12)
      {
        unsigned __int8 v41 = [v6 vifName];
        *(_DWORD *)buf = 138412290;
        unint64_t v54 = (unint64_t)v41;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: failed to get local CID", buf, 0xCu);
      }
    }
    else
    {
      if (v12)
      {
        id v13 = [v6 vifName];
        *(_DWORD *)buf = 138412546;
        unint64_t v54 = (unint64_t)v13;
        __int16 v55 = 1024;
        LODWORD(v56) = v11;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: resolved next available localCID 0x%04x", buf, 0x12u);
      }
      int v14 = [v5 compressionInfo];
      [v14 setLocalCID:v11];

      id v15 = [v5 compressionInfo];
      objc_msgSend(v15, "setReqCount:", (unsigned __int16)((unsigned __int16)objc_msgSend(v15, "reqCount") + 1));

      [v5 setCompressionState:1];
      id v16 = [v5 compressionInfo];
      unsigned int v51 = [v16 reqCount];

      uint64_t v17 = [v5 compressionInfo];
      HIDWORD(v49) = [v17 lastSentSeq];

      uint64_t v18 = [v5 compressionInfo];
      LODWORD(v49) = [v18 lastSentAck];

      uint64_t v19 = [v5 connectionID];
      uint64_t v20 = [v19 account];

      uint64_t v21 = [v5 connectionID];
      uint64_t v22 = [v21 service];

      uint64_t v23 = [v5 connectionID];
      [v23 name];
      unint64_t v24 = v52 = v6;

      int v25 = [v5 localConnectionGUID];
      uint64_t v26 = [v5 remoteConnectionGUID];
      id v47 = v25;
      id v27 = v20;
      id v28 = v22;
      id v29 = v24;
      __int16 v45 = (const char *)[v47 UTF8String];
      unsigned int v42 = v11;
      LODWORD(v22) = strlen(v45);
      id v46 = v26;
      id v44 = (const char *)[v46 UTF8String];
      unsigned int v30 = strlen(v44);
      id v7 = v27;
      id v43 = (const char *)[v7 UTF8String];

      LODWORD(v26) = strlen(v43);
      id v31 = v28;
      uint64_t v32 = (const char *)[v31 UTF8String];
      __int16 v50 = v31;

      unsigned int v33 = strlen(v32);
      id v34 = v29;
      uint64_t v35 = (const char *)[v34 UTF8String];
      __int16 v48 = v34;

      unsigned int v36 = strlen(v35);
      LOWORD(v34) = v36;
      char v57 = 4;
      __int16 v58 = bswap32(v22) >> 16;
      LOWORD(v24) = v30;
      __int16 v59 = bswap32(v30) >> 16;
      __int16 v60 = bswap32(v26) >> 16;
      __int16 v61 = bswap32(v33) >> 16;
      __int16 v62 = bswap32(v36) >> 16;
      *(_WORD *)buf = __rev16(v51);
      *(_WORD *)&buf[2] = __rev16(v42);
      unint64_t v54 = _byteswap_uint64(v49);
      id v37 = objc_alloc_init((Class)NSMutableData);
      [v37 appendBytes:&v57 length:11];
      [v37 appendBytes:buf length:12];
      [v37 appendBytes:v45 length:(unsigned __int16)v22];
      [v37 appendBytes:v44 length:(unsigned __int16)v24];
      id v6 = v52;
      [v37 appendBytes:v43 length:(unsigned __int16)v26];
      [v37 appendBytes:v32 length:(unsigned __int16)v33];
      [v37 appendBytes:v35 length:(unsigned __int16)v34];

      int v38 = [v52 controlChannel];
      [v38 sendMessage:v37];

      int v39 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v40 = [v52 vifName];
        *(_DWORD *)buf = 138412546;
        unint64_t v54 = (unint64_t)v40;
        __int16 v55 = 2112;
        id v56 = v37;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@: sending control message: compression_req (%@)", buf, 0x16u);
      }
    }
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "startCompressionForConnection failed due to invalid parameters", buf, 2u);
  }
}

- (id)stringComponentsForServiceConnectorService:(id)a3
{
  return [a3 componentsSeparatedByString:@"/"];
}

- (void)receiveControlChannelMessage:(id)a3 fromCbuuid:(id)a4 deviceUniqueID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v317 = self;
  id v318 = a5;
  v319 = v9;
  v320 = sub_1003F2080((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v9);
  id v10 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v320 vifName];
    *(_DWORD *)buf = 138412290;
    v328 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: control message parsing..", buf, 0xCu);
  }
  id v321 = v8;
  BOOL v12 = (unsigned __int8 *)[v321 bytes];
  id v13 = (char *)[v321 length];
  int v14 = v13;
  if (!v13)
  {
    id v16 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v320 vifName];
      *(_DWORD *)buf = 138412290;
      v328 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: control message too small", buf, 0xCu);
    }
    goto LABEL_11;
  }
  int v15 = *v12;
  switch(*v12)
  {
    case 1u:
      uint64_t v22 = [IDSUTunControlMessage_Hello alloc];
      uint64_t v23 = [v320 vifName];
      unint64_t v24 = [(IDSUTunControlMessage_Hello *)v22 initWithBytes:v12 length:v14 loggingPrefixString:v23];

      int v25 = [(IDSUTunControlMessage_Hello *)v24 controlChannelVersion];
      LODWORD(v23) = v25 == 0;

      if (v23)
      {
        uint64_t v91 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          long long v92 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v92;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%@: control message: hello control channel version is nil", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v26 = [(IDSUTunControlMessage_Hello *)v24 instanceID];
        objc_msgSend(v26, "getUUIDBytes:", objc_msgSend(v320, "instanceID"));

        id v27 = [(IDSUTunControlMessage_Hello *)v24 capabilityFlags];
        objc_msgSend(v320, "setCapabilityFlags:", objc_msgSend(v27, "unsignedLongLongValue"));

        id v28 = [(IDSUTunControlMessage_Hello *)v24 serviceMinCompatibilityVersion];
        objc_msgSend(v320, "setServiceMinCompatibilityVersion:", (unsigned __int16)objc_msgSend(v28, "unsignedIntValue"));

        id v29 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v30 = [v320 vifName];
          *(_DWORD *)buf = 138412546;
          v328 = v30;
          __int16 v329 = 2112;
          *(void *)v330 = v24;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: got control message: %@", buf, 0x16u);
        }
        if (([v320 capabilityFlags] & 0x80) != 0)
        {
          id v31 = sub_1003F1964((uint64_t)[v320 connectionsTableByLocalRemotePortKey], 67109888);
          if ([v31 checksumFailed])
          {
            uint64_t v32 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v328 = v31;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Control channel checksum failed while receiving Hello. Resetting connection %@", buf, 0xCu);
            }

            [(IDSLinkManager *)v317->_linkManager triggerBTCorruptionRecoveryForCBUUID:v9];
            [(IDSUTunController *)v317 resetTCPConnection:v31 forDeviceConnectionInfo:v320];

            goto LABEL_113;
          }
          long long v97 = [v320 controlChannel];
          [v97 setChecksumEnabled:1];
        }
        long long v98 = [(IDSUTunControlMessage_Hello *)v24 controlChannelVersion];
        [v320 setControlChannelVersion:v98];

        os_unfair_lock_lock(&v317->_controlChannelVersionCacheLock);
        controlChannelVersionCache = v317->_controlChannelVersionCache;
        addrinfo v100 = [(IDSUTunControlMessage_Hello *)v24 controlChannelVersion];
        [(NSMutableDictionary *)controlChannelVersionCache setObject:v100 forKey:v9];

        os_unfair_lock_unlock(&v317->_controlChannelVersionCacheLock);
        if ([v9 isEqualToString:kIDSDefaultPairedDeviceID])
        {
          __int16 v101 = im_primary_queue();
          v324[0] = _NSConcreteStackBlock;
          v324[1] = 3221225472;
          v324[2] = sub_10036CB7C;
          v324[3] = &unk_10097E440;
          id v325 = v320;
          v326 = v24;
          dispatch_async(v101, v324);
        }
        uint64_t v102 = [v320 controlChannel];
        unsigned int v103 = [v102 didReceiveReestablishmentRequest];

        if (v103)
        {
          v104 = [v320 controlChannel];
          [v104 setDidReceiveReestablishmentRequest:0];

          double v105 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v328 = v320;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "%@: reset control channel didReceiveReestablishmentRequest NO", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport();
              if (_IDSShouldLog()) {
                _IDSLogV();
              }
            }
          }
        }
      }
LABEL_113:

      goto LABEL_12;
    case 2u:
    case 0xDu:
      if ((unint64_t)v13 > 0xF)
      {
        v311 = v12[1];
        unsigned int v305 = *((unsigned __int16 *)v12 + 1);
        unsigned int v308 = *((unsigned __int16 *)v12 + 2);
        unsigned int v35 = *((unsigned __int16 *)v12 + 3);
        unsigned int v36 = *((unsigned __int16 *)v12 + 4);
        unsigned int v37 = *((unsigned __int16 *)v12 + 5);
        unsigned int v38 = *((unsigned __int16 *)v12 + 6);
        unsigned int v39 = *((unsigned __int16 *)v12 + 7);
        int v40 = _IDSSupportsDirectMessaging();
        if (v15 == 13) {
          int v41 = v40;
        }
        else {
          int v41 = 0;
        }
        int v314 = v41;
        if (v41 == 1)
        {
          unsigned int v42 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            id v43 = [v320 vifName];
            *(_DWORD *)buf = 138412290;
            v328 = v43;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannelForDirectMsg processing request", buf, 0xCu);
          }
          uint64_t v44 = 8;
        }
        else
        {
          uint64_t v44 = 0;
        }
        uint64_t v79 = __rev16(v35);
        uint64_t v80 = __rev16(v37);
        uint64_t v81 = __rev16(v38);
        uint64_t v82 = __rev16(v39);
        if (!v79 || !v80 || !v81 || !v82)
        {
          int v89 = v82;
          id v16 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            long long v90 = [v320 vifName];
            *(_DWORD *)buf = 138413314;
            v328 = v90;
            __int16 v329 = 1024;
            *(_DWORD *)v330 = v79;
            *(_WORD *)&v330[4] = 1024;
            *(_DWORD *)&v330[6] = v80;
            *(_WORD *)&v330[10] = 1024;
            *(_DWORD *)&v330[12] = v81;
            *(_WORD *)&v330[16] = 1024;
            *(_DWORD *)&v330[18] = v89;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannel unexpected remoteGUID/account/service/name lengths (%u, %u, %u, %u)", buf, 0x24u);
          }
          goto LABEL_11;
        }
        uint64_t v83 = __rev16(v36);
        uint64_t v84 = v79 + v83 + v80 + v81 + v82 + v44 + 16;
        if (v14 != (char *)v84)
        {
          id v16 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            long long v96 = [v320 vifName];
            *(_DWORD *)buf = 138412802;
            v328 = v96;
            __int16 v329 = 1024;
            *(_DWORD *)v330 = v14;
            *(_WORD *)&v330[4] = 2048;
            *(void *)&v330[6] = v84;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannel unexpected size (%u != %lu)", buf, 0x1Cu);
          }
          goto LABEL_11;
        }
        uint64_t v85 = v82;
        long long v86 = v12 + 16;
        unsigned int v72 = [objc_alloc((Class)NSString) initWithBytes:v86 length:v79 encoding:4];
        if (v72)
        {
          long long v87 = &v86[v79];
          if (!v83)
          {
            long long v88 = 0;
LABEL_150:
            v304 = [objc_alloc((Class)NSString) initWithBytes:v87 length:v80 encoding:4];
            if (!v304)
            {
              v127 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v128 = [v320 vifName];
                *(_DWORD *)buf = 138412290;
                v328 = v128;
                _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannel cannot decode remoteConnectionGUID", buf, 0xCu);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v262 = [v320 vifName];
                  _IDSLogTransport();

                  if (_IDSShouldLog())
                  {
                    v263 = objc_msgSend(v320, "vifName", v262);
                    _IDSLogV();
                  }
                }
              }
              goto LABEL_333;
            }
            id v301 = [objc_alloc((Class)NSString) initWithBytes:&v87[v80] length:v81 encoding:4];
            if (!v301)
            {
              id v140 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
              {
                v141 = [v320 vifName];
                *(_DWORD *)buf = 138412290;
                v328 = v141;
                _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannel cannot decode service", buf, 0xCu);
              }
              if (!os_log_shim_legacy_logging_enabled()) {
                goto LABEL_332;
              }
              if (!_IDSShouldLogTransport()) {
                goto LABEL_332;
              }
              v264 = [v320 vifName];
              _IDSLogTransport();

              if (!_IDSShouldLog()) {
                goto LABEL_332;
              }
              objc_msgSend(v320, "vifName", v264);
              id v121 = (id)objc_claimAutoreleasedReturnValue();
              _IDSLogV();
LABEL_331:

LABEL_332:
LABEL_333:

              goto LABEL_334;
            }
            id v121 = [objc_alloc((Class)NSString) initWithBytes:&v87[v80 + v81] length:v85 encoding:4];
            if (!v121)
            {
              uint64_t v147 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v148 = [v320 vifName];
                *(_DWORD *)buf = 138412290;
                v328 = v148;
                _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannel cannot decode name", buf, 0xCu);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v267 = [v320 vifName];
                  _IDSLogTransport();

                  if (_IDSShouldLog())
                  {
                    v268 = objc_msgSend(v320, "vifName", v267);
                    _IDSLogV();
                  }
                }
              }
              goto LABEL_331;
            }
            if (v314)
            {
              size_t v290 = *(void *)&v87[v80 + v81 + v85];
              __int16 v122 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
              {
                v123 = [v320 vifName];
                *(_DWORD *)buf = 138412546;
                v328 = v123;
                __int16 v329 = 2048;
                *(void *)v330 = v290;
                _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannelForDirectMsg flags: %#llx", buf, 0x16u);
              }
            }
            else
            {
              size_t v290 = 0;
            }
            v299 = +[IDSGenericConnectionID idWithAccount:v304 service:v301 name:v121];
            v149 = [v320 connectionsByID];
            v150 = [v149 objectForKey:v299];

            double v151 = [v320 localSA];
            v152 = __rev16(v308);
            v310 = +[IDSSockAddrWrapper wrapperWithWrapper:v151 andPortHostOrder:v152];

            int v153 = [v320 remoteSA];
            v293 = (void *)__rev16(v305);
            v307 = +[IDSSockAddrWrapper wrapperWithWrapper:andPortHostOrder:](IDSSockAddrWrapper, "wrapperWithWrapper:andPortHostOrder:", v153);

            v296 = +[IDSSockAddrWrapperPair wrapperPairWithLocalAddress:v310 remoteAddress:v307];
            v154 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v155 = [v320 vifName];
              *(_DWORD *)buf = 138414850;
              v328 = v155;
              __int16 v329 = 1024;
              *(_DWORD *)v330 = v311;
              *(_WORD *)&v330[4] = 1024;
              *(_DWORD *)&v330[6] = v152;
              *(_WORD *)&v330[10] = 1024;
              *(_DWORD *)&v330[12] = v293;
              *(_WORD *)&v330[16] = 2112;
              *(void *)&v330[18] = v72;
              *(_WORD *)&v330[26] = 2112;
              *(void *)v331 = v88;
              *(_WORD *)&v331[8] = 2112;
              *(void *)v332 = v304;
              *(_WORD *)&v332[8] = 2112;
              *(void *)v333 = v301;
              *(_WORD *)&v333[8] = 2112;
              *(void *)v334 = v121;
              *(_WORD *)&v334[8] = 2112;
              *(void *)v335 = v150;
              *(_WORD *)&v335[8] = 2112;
              *(void *)v336 = v320;
              _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "%@: got control message: setup channel proto:%d ports[%u:::%u] remoteGUID[%@] forLocalGUID[%@] account:[%@] service[%@] name[%@] for connection[%@] deviceInfo[%@]", buf, 0x64u);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                [v320 vifName];
                v280 = v150;
                id v281 = v320;
                id v278 = v301;
                id v279 = v121;
                v276 = v88;
                v277 = v304;
                id v274 = v293;
                v275 = v72;
                v272 = v311;
                v258 = v273 = v152;
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  objc_msgSend(v320, "vifName", v258, v311, v152, v293, v72, v88, v304, v301, v121, v150, v320);
                  v280 = v150;
                  id v281 = v320;
                  id v278 = v301;
                  id v279 = v121;
                  v276 = v88;
                  v277 = v304;
                  id v274 = v293;
                  v275 = v72;
                  v272 = v311;
                  v258 = v273 = v152;
                  _IDSLogV();
                }
              }
            }
            if (v88 && !v150)
            {
              v150 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(&v150->super, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, &v150->super, OS_LOG_TYPE_DEFAULT, "control message in reply to cleaned up connection", buf, 2u);
              }
LABEL_330:

              goto LABEL_331;
            }
            if (v88 && v150)
            {
              unsigned int v156 = [(IDSGenericConnection *)v150 localConnectionGUID];
              unsigned __int8 v157 = [v156 isEqualToString:v88];

              if ((v157 & 1) == 0)
              {
                v158 = +[IDSFoundationLog utunController];
                if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, "control message not for current connection - assume local is current for now (message is old) and send CloseChannel for remote attempt", buf, 2u);
                }

                v159 = [v320 controlChannel];
                v160 = sub_100360720(0, v72, v304, v301, v121);
                [v159 sendMessage:v160];

                goto LABEL_330;
              }
            }
            else if (!v150)
            {
              goto LABEL_285;
            }
            unsigned int v177 = [(IDSGenericConnection *)v150 localConnectionGUID];
            if ([v88 isEqualToString:v177])
            {
              BOOL v178 = ([(IDSGenericConnection *)v150 stateFlags] & 8) == 0;

              if (!v178)
              {
                v179 = +[IDSFoundationLog utunController];
                if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_DEFAULT, "control message repeated for current connection - assume local is current and remote reconciled", buf, 2u);
                }

                goto LABEL_330;
              }
            }
            else
            {
            }
            if (([(IDSGenericConnection *)v150 stateFlags] & 8) == 0)
            {
              __int16 v180 = [(IDSGenericConnection *)v150 localConnectionGUID];
              BOOL v181 = [v180 compare:v72] == (id)1;

              if (v181)
              {
                v182 = +[IDSFoundationLog utunController];
                if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
                {
                  int v183 = [v320 vifName];
                  v184 = [(IDSGenericConnection *)v150 localConnectionGUID];
                  *(_DWORD *)buf = 138412546;
                  v328 = v183;
                  __int16 v329 = 2112;
                  *(void *)v330 = v184;
                  _os_log_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_DEFAULT, "%@: found connection [%@] - remote wins", buf, 0x16u);
                }
                id v185 = [v320 portMap];
                unsigned int v186 = [(IDSGenericConnection *)v150 addressPair];
                __int16 v187 = [v186 localAddress];
                -[IDSUTunController releasePortIfNecessary:port:](v317, "releasePortIfNecessary:port:", v185, [v187 saPortHostOrder]);

                [(IDSGenericConnection *)v150 setAddressPair:v296];
              }
              goto LABEL_288;
            }
            id v191 = [v320 portMap];
            v192 = [(IDSGenericConnection *)v150 addressPair];
            __int16 v193 = [v192 localAddress];
            -[IDSUTunController releasePortIfNecessary:port:](v317, "releasePortIfNecessary:port:", v191, [v193 saPortHostOrder]);

            [(IDSUTunController *)v317 removeConnection:v150 fromDeviceConnectionInfo:v320 removeCode:5050 removeReason:@"stale connection"];
            [(IDSUTunController *)v317 checkSuspendTrafficForDevice:v320 wait:1];
LABEL_285:
            v150 = [[IDSGenericConnection alloc] initWithConnectionID:v299 protocol:v311 isCloudEnabled:0];
            unsigned int v194 = [v320 cbuuid];
            -[IDSGenericConnection setIsDefaultPairedDevice:](v150, "setIsDefaultPairedDevice:", [v194 isEqualToString:kIDSDefaultPairedDeviceID]);

            [(IDSGenericConnection *)v150 setAddressPair:v296];
            v195 = [v320 connectionsByID];
            [v195 setObject:v150 forKey:v299];

            v196 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT))
            {
              v197 = [v320 vifName];
              id v198 = [(IDSGenericConnection *)v150 localConnectionGUID];
              id v199 = [v198 UTF8String];
              *(_DWORD *)buf = 138413058;
              v328 = v197;
              __int16 v329 = 1024;
              *(_DWORD *)v330 = v152;
              *(_WORD *)&v330[4] = 1024;
              *(_DWORD *)&v330[6] = v293;
              *(_WORD *)&v330[10] = 2080;
              *(void *)&v330[12] = v199;
              _os_log_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_DEFAULT, "%@: send setup channel message ports[%u:::%u] guid[%s]", buf, 0x22u);
            }
            v200 = [v320 controlChannel];
            v201 = [(IDSGenericConnection *)v150 localConnectionGUID];
            v202 = sub_10036C62C((char)v311, (__int16)v152, (__int16)v293, v201, v72, v304, v301, v121, v15 == 13, v290);
            [v200 sendMessage:v202];

            [(IDSGenericConnection *)v150 setStateFlags:[(IDSGenericConnection *)v150 stateFlags] | 4];
            [(IDSGenericConnection *)v150 setConnectionSetupStartTime:sub_100352F48()];
LABEL_288:
            v203 = [(IDSGenericConnection *)v150 addressPair];
            v204 = [v203 localAddress];
            unsigned int v205 = [v204 saPortHostOrder];
            v206 = [(IDSGenericConnection *)v150 addressPair];
            v207 = [v206 remoteAddress];
            -[IDSGenericConnection setUint32Key:](v150, "setUint32Key:", (v205 << 16) | [v207 saPortHostOrder]);

            v208 = sub_1003F1964((uint64_t)[v320 connectionsTableByLocalRemotePortKey], -[IDSGenericConnection uint32Key](v150, "uint32Key"));
            v209 = v208;
            if (v208) {
              [v208 invalidate];
            }
            sub_1003F164C((int *)[v320 connectionsTableByLocalRemotePortKey], -[IDSGenericConnection uint32Key](v150, "uint32Key"), v150);
            [(IDSGenericConnection *)v150 setStateFlags:[(IDSGenericConnection *)v150 stateFlags] | 8];
            [(IDSGenericConnection *)v150 setRemoteConnectionGUID:v72];
            if (!v314) {
              goto LABEL_326;
            }
            [(IDSGenericConnection *)v150 setDataProtectionClass:~v290 & 2];
            [(IDSGenericConnection *)v150 setIsDirectMsgChannel:1];
            if ((v290 & 4) != 0)
            {
              uint64_t v210 = 200;
            }
            else if ((v290 & 8) != 0)
            {
              uint64_t v210 = 300;
            }
            else
            {
              if ((v290 & 0x10) == 0) {
                goto LABEL_326;
              }
              uint64_t v210 = 100;
            }
            [(IDSGenericConnection *)v150 setSocketTrafficClass:v210];
LABEL_326:
            v254 = [v299 serviceConnectorServiceForAccount];
            [(IDSUTunController *)v317 startDataChannelWithDevice:v320 genericConnection:v150 serviceConnectorService:v254 endpoint:0];
            if (v314 && [v319 isEqualToString:kIDSDefaultPairedDeviceID])
            {
              v255 = +[IDSDaemon daemon];
              [v255 receivedDirectMsgSocketRequestForService:v301 stream:v121 flags:v290];
            }
            goto LABEL_330;
          }
          long long v88 = [objc_alloc((Class)NSString) initWithBytes:v87 length:v83 encoding:4];
          if (v88)
          {
            v87 += v83;
            goto LABEL_150;
          }
          unsigned int v129 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
          {
            v130 = [v320 vifName];
            *(_DWORD *)buf = 138412290;
            v328 = v130;
            _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannel cannot decode account", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v259 = [v320 vifName];
              _IDSLogTransport();

              if (_IDSShouldLog())
              {
LABEL_134:
                long long v88 = objc_msgSend(v320, "vifName", v259);
                _IDSLogV();
LABEL_334:
              }
            }
          }
        }
        else
        {
          BOOL v110 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
          {
            double v111 = [v320 vifName];
            *(_DWORD *)buf = 138412290;
            v328 = v111;
            _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannel cannot decode remoteConnectionGUID", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v259 = [v320 vifName];
              _IDSLogTransport();

              if (_IDSShouldLog()) {
                goto LABEL_134;
              }
            }
          }
        }
LABEL_335:

        goto LABEL_12;
      }
      id v16 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v320 vifName];
        *(_DWORD *)buf = 138412290;
        v328 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_SetupChannel insufficient header", buf, 0xCu);
      }
LABEL_11:

LABEL_12:
      return;
    case 3u:
      if ((unint64_t)v13 <= 0xA)
      {
        id v16 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v33 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v33;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CloseChannel insufficient header", buf, 0xCu);
        }
        goto LABEL_11;
      }
      uint64_t v58 = __rev16(*(unsigned __int16 *)(v12 + 1));
      uint64_t v59 = __rev16(*(unsigned __int16 *)(v12 + 3));
      uint64_t v60 = __rev16(*(unsigned __int16 *)(v12 + 5));
      uint64_t v61 = __rev16(*(unsigned __int16 *)(v12 + 7));
      uint64_t v62 = __rev16(*(unsigned __int16 *)(v12 + 9));
      uint64_t v63 = v58 + v59 + v60 + v61 + v62 + 11;
      if (v13 != (char *)v63)
      {
        id v16 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          long long v93 = [v320 vifName];
          *(_DWORD *)buf = 138412802;
          v328 = v93;
          __int16 v329 = 1024;
          *(_DWORD *)v330 = v14;
          *(_WORD *)&v330[4] = 2048;
          *(void *)&v330[6] = v63;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CloseChannel unexpected size (%u != %lu)", buf, 0x1Cu);
        }
        goto LABEL_11;
      }
      if (v58)
      {
        unsigned int v51 = [objc_alloc((Class)NSString) initWithBytes:v12 + 11 length:v58 encoding:4];
        if (!v51)
        {
          unsigned int v51 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            nw_connection_t v64 = [v320 vifName];
            *(_DWORD *)buf = 138412290;
            v328 = v64;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CloseChannel cannot decode remoteConnectionGUID", buf, 0xCu);
          }
          goto LABEL_123;
        }
      }
      else
      {
        unsigned int v51 = 0;
      }
      if (v59)
      {
        uint64_t v108 = [objc_alloc((Class)NSString) initWithBytes:&v12[v58 + 11] length:v59 encoding:4];
        if (!v108)
        {
          uint64_t v108 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v109 = [v320 vifName];
            *(_DWORD *)buf = 138412290;
            v328 = v109;
            _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CloseChannel cannot decode localConnectionGUID", buf, 0xCu);
          }
          goto LABEL_252;
        }
      }
      else
      {
        uint64_t v108 = 0;
      }
      id v316 = [objc_alloc((Class)NSString) initWithBytes:&v12[v58 + 11 + v59] length:v60 encoding:4];
      if (!v316)
      {
        int v113 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v124 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v124;
          _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CloseChannel cannot decode account", buf, 0xCu);
        }
        goto LABEL_251;
      }
      id v112 = &v12[v58 + 11 + v59 + v60];
      int v113 = [objc_alloc((Class)NSString) initWithBytes:v112 length:v61 encoding:4];
      if (!v113)
      {
        int v114 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v131 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v131;
          _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CloseChannel cannot decode service", buf, 0xCu);
        }
        goto LABEL_250;
      }
      int v114 = [objc_alloc((Class)NSString) initWithBytes:&v112[v61] length:v62 encoding:4];
      if (!v114)
      {
        unint64_t v115 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          id v144 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v144;
          _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_CloseChannel cannot decode name", buf, 0xCu);
        }
        goto LABEL_249;
      }
      unint64_t v115 = +[IDSGenericConnectionID idWithAccount:v316 service:v113 name:v114];
      uint64_t v116 = [v320 connectionsByID];
      v312 = [v116 objectForKey:v115];

      unsigned int v117 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v118 = [v320 vifName];
        *(_DWORD *)buf = 138414082;
        v328 = v118;
        __int16 v329 = 2112;
        *(void *)v330 = v108;
        *(_WORD *)&v330[8] = 2112;
        *(void *)&v330[10] = v51;
        *(_WORD *)&v330[18] = 2112;
        *(void *)&v330[20] = v316;
        *(_WORD *)v331 = 2112;
        *(void *)&v331[2] = v113;
        *(_WORD *)v332 = 2112;
        *(void *)&v332[2] = v114;
        *(_WORD *)v333 = 2112;
        *(void *)&v333[2] = v312;
        *(_WORD *)v334 = 2112;
        *(void *)&v334[2] = v320;
        _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%@: got control message: close channel localConnectionGUID[%@] remoteConnectionGUID[%@] account:[%@] service[%@] name[%@] for connection[%@] deviceInfo[%@]", buf, 0x52u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          [v320 vifName];
          v277 = v312;
          id v278 = v320;
          v275 = v113;
          v276 = v114;
          v273 = v51;
          v258 = id v274 = v316;
          v272 = v108;
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            objc_msgSend(v320, "vifName", v258, v108, v51, v316, v113, v114, v312, v320);
            v277 = v312;
            id v278 = v320;
            v275 = v113;
            v276 = v114;
            v273 = v51;
            v258 = id v274 = v316;
            v272 = v108;
            _IDSLogV();
          }
        }
      }
      if (!v312) {
        goto LABEL_248;
      }
      v119 = [v312 remoteConnectionGUID];
      unsigned int v120 = [v119 isEqualToString:v51];

      if (v120)
      {
        if (([v312 stateFlags] & 0x20) != 0) {
          goto LABEL_248;
        }
      }
      else
      {
        v164 = [v312 localConnectionGUID];
        unsigned int v165 = [v164 isEqualToString:v108];

        if (!v165 || ([v312 stateFlags] & 0x20) != 0) {
          goto LABEL_248;
        }
        id v166 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v166, OS_LOG_TYPE_FAULT)) {
          sub_10071FC8C(v166);
        }
      }
      id v167 = objc_msgSend(v320, "portMap", v258, v272, v273, v274, v275, v276, v277, v278);
      unint64_t v168 = [v312 addressPair];
      int v169 = [v168 localAddress];
      -[IDSUTunController releasePortIfNecessary:port:](v317, "releasePortIfNecessary:port:", v167, [v169 saPortHostOrder]);

      [(IDSUTunController *)v317 removeConnection:v312 fromDeviceConnectionInfo:v320 removeCode:5051 removeReason:@"remote close"];
      [(IDSUTunController *)v317 checkSuspendTrafficForDevice:v320 wait:1];
LABEL_248:

LABEL_249:
LABEL_250:

LABEL_251:
LABEL_252:

      goto LABEL_123;
    case 4u:
      [(IDSUTunController *)v317 processCompressionRequest:v321 fromDeviceConnectionInfo:v320];
      goto LABEL_12;
    case 5u:
      [(IDSUTunController *)v317 processCompressionResponse:v321 fromDeviceConnectionInfo:v320];
      goto LABEL_12;
    case 6u:
      if ((unint64_t)v13 <= 0x17)
      {
        id v16 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v45 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v45;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: SetupEncryptedChannel insufficient header", buf, 0xCu);
        }
        goto LABEL_11;
      }
      uint64_t v65 = __rev16(*((unsigned __int16 *)v12 + 3));
      uint64_t v66 = __rev16(*((unsigned __int16 *)v12 + 5));
      uint64_t v67 = __rev16(*((unsigned __int16 *)v12 + 6));
      uint64_t v68 = __rev16(*((unsigned __int16 *)v12 + 7));
      size_t v69 = __rev16(*((unsigned __int16 *)v12 + 11));
      if (!v65 || !v66 || !v67 || !v68 || !v69)
      {
        int v94 = v69;
        id v16 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v95 = [v320 vifName];
          *(_DWORD *)buf = 138413570;
          v328 = v95;
          __int16 v329 = 1024;
          *(_DWORD *)v330 = v65;
          *(_WORD *)&v330[4] = 1024;
          *(_DWORD *)&v330[6] = v66;
          *(_WORD *)&v330[10] = 1024;
          *(_DWORD *)&v330[12] = v67;
          *(_WORD *)&v330[16] = 1024;
          *(_DWORD *)&v330[18] = v68;
          *(_WORD *)&v330[22] = 1024;
          *(_DWORD *)&v330[24] = v94;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: SetupEncryptedChannel unexpected remoteGUID/account/service/name/key lengths (%u, %u, %u, %u, %u)", buf, 0x2Au);
        }
        goto LABEL_11;
      }
      uint64_t v70 = __rev16(*((unsigned __int16 *)v12 + 4));
      uint64_t v71 = v65 + v70 + v66 + v67 + v68 + v69 + 24;
      if (v13 != (char *)v71)
      {
        id v16 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v106 = [v320 vifName];
          *(_DWORD *)buf = 138412802;
          v328 = v106;
          __int16 v329 = 1024;
          *(_DWORD *)v330 = v14;
          *(_WORD *)&v330[4] = 2048;
          *(void *)&v330[6] = v71;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: SetupEncryptedChannel unexpected size (%u != %lu)", buf, 0x1Cu);
        }
        goto LABEL_11;
      }
      size_t v289 = v69;
      v303 = (void *)v12[1];
      uint64_t v306 = v68;
      unsigned int v297 = *((unsigned __int16 *)v12 + 1);
      unsigned int v300 = *((unsigned __int16 *)v12 + 2);
      unsigned int v291 = *((_DWORD *)v12 + 4);
      unsigned int v294 = *((unsigned __int16 *)v12 + 10);
      unsigned int v72 = [objc_alloc((Class)NSString) initWithBytes:v12 + 24 length:v65 encoding:4];
      if (v72)
      {
        unsigned int v73 = &v12[v65 + 24];
        if (!v70)
        {
          id v315 = 0;
LABEL_180:
          id v313 = [objc_alloc((Class)NSString) initWithBytes:v73 length:v66 encoding:4];
          if (!v313)
          {
            id v142 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
            {
              v143 = [v320 vifName];
              *(_DWORD *)buf = 138412290;
              v328 = v143;
              _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEFAULT, "%@: SetupEncryptedChannel cannot decode remoteConnectionGUID", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                v265 = [v320 vifName];
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  v266 = objc_msgSend(v320, "vifName", v265);
                  _IDSLogV();
                }
              }
            }
            goto LABEL_322;
          }
          uint64_t v132 = &v73[v66];
          v309 = (IDSGenericConnection *)[objc_alloc((Class)NSString) initWithBytes:&v73[v66] length:v67 encoding:4];
          if (!v309)
          {
            v161 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
            {
              v162 = [v320 vifName];
              *(_DWORD *)buf = 138412290;
              v328 = v162;
              _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_DEFAULT, "%@: SetupEncryptedChannel cannot decode service", buf, 0xCu);
            }
            if (!os_log_shim_legacy_logging_enabled()) {
              goto LABEL_321;
            }
            if (!_IDSShouldLogTransport()) {
              goto LABEL_321;
            }
            v269 = [v320 vifName];
            _IDSLogTransport();

            if (!_IDSShouldLog()) {
              goto LABEL_321;
            }
            v163 = objc_msgSend(v320, "vifName", v269);
            _IDSLogV();
LABEL_320:

LABEL_321:
LABEL_322:

            goto LABEL_335;
          }
          id v133 = &v132[v67];
          id v288 = [objc_alloc((Class)NSString) initWithBytes:&v132[v67] length:v306 encoding:4];
          if (!v288)
          {
            unint64_t v170 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v171 = [v320 vifName];
              *(_DWORD *)buf = 138412290;
              v328 = v171;
              _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "%@: SetupEncryptedChannel cannot decode name", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                v270 = [v320 vifName];
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  v271 = objc_msgSend(v320, "vifName", v270);
                  _IDSLogV();
                }
              }
            }
            goto LABEL_319;
          }
          v287 = +[IDSGenericConnectionID idWithAccount:service:name:](IDSGenericConnectionID, "idWithAccount:service:name:", v313, v309);
          double v134 = [v320 connectionsByID];
          BOOL v135 = [v134 objectForKey:v287];

          v136 = [v320 localSA];
          v285 = __rev16(v300);
          v302 = +[IDSSockAddrWrapper wrapperWithWrapper:andPortHostOrder:](IDSSockAddrWrapper, "wrapperWithWrapper:andPortHostOrder:", v136);

          v137 = [v320 remoteSA];
          v284 = __rev16(v297);
          v298 = +[IDSSockAddrWrapper wrapperWithWrapper:andPortHostOrder:](IDSSockAddrWrapper, "wrapperWithWrapper:andPortHostOrder:", v137);

          v286 = +[IDSSockAddrWrapperPair wrapperPairWithLocalAddress:v302 remoteAddress:v298];
          v292 = bswap32(v291);
          v295 = __rev16(v294);
          id v138 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v139 = [v320 vifName];
            *(_DWORD *)buf = 138415362;
            v328 = v139;
            __int16 v329 = 1024;
            *(_DWORD *)v330 = v292;
            *(_WORD *)&v330[4] = 1024;
            *(_DWORD *)&v330[6] = v295;
            *(_WORD *)&v330[10] = 1024;
            *(_DWORD *)&v330[12] = v303;
            *(_WORD *)&v330[16] = 1024;
            *(_DWORD *)&v330[18] = v285;
            *(_WORD *)&v330[22] = 1024;
            *(_DWORD *)&v330[24] = v284;
            *(_WORD *)v331 = 2112;
            *(void *)&v331[2] = v72;
            *(_WORD *)v332 = 2112;
            *(void *)&v332[2] = v315;
            *(_WORD *)v333 = 2112;
            *(void *)&v333[2] = v313;
            *(_WORD *)v334 = 2112;
            *(void *)&v334[2] = v309;
            *(_WORD *)v335 = 2112;
            *(void *)&v335[2] = v288;
            *(_WORD *)v336 = 2112;
            *(void *)&v336[2] = v135;
            __int16 v337 = 2112;
            v338 = v320;
            _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "%@: got control message: setup encrypted channel ssrc:%08x startSeq:%04x proto:%d ports[%u:::%u] remoteGUID[%@] forLocalGUID[%@] account:[%@] service[%@] name[%@] for connection[%@] deviceInfo[%@]", buf, 0x70u);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              [v320 vifName];
              v282 = v135;
              v283 = v320;
              v280 = v309;
              id v281 = v288;
              id v278 = v315;
              id v279 = v313;
              v276 = v284;
              v277 = v72;
              id v274 = v303;
              v275 = v285;
              v272 = v292;
              v258 = v273 = v295;
              _IDSLogTransport();

              if (_IDSShouldLog())
              {
                objc_msgSend(v320, "vifName", v258, v292, v295, v303, v285, v284, v72, v315, v313, v309, v288, v135, v320);
                v282 = v135;
                v283 = v320;
                v280 = v309;
                id v281 = v288;
                id v278 = v315;
                id v279 = v313;
                v276 = v284;
                v277 = v72;
                v275 = v285;
                v273 = v295;
                v258 = id v274 = v303;
                v272 = v292;
                _IDSLogV();
              }
            }
          }
          if (v315 && !v135)
          {
            BOOL v135 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(&v135->super, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, &v135->super, OS_LOG_TYPE_DEFAULT, "control message in reply to cleaned up connection", buf, 2u);
            }
            goto LABEL_318;
          }
          if (v315 && v135)
          {
            unsigned int v172 = [(IDSGenericConnection *)v135 localConnectionGUID];
            unsigned __int8 v173 = [v172 isEqualToString:v315];

            if ((v173 & 1) == 0)
            {
              unsigned int v174 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_DEFAULT, "control message not for current connection - assume local is current for now (message is old) and send CloseChannel for remote attempt", buf, 2u);
              }

              unsigned int v175 = [v320 controlChannel];
              uint64_t v176 = sub_100360720(0, v72, v313, v309, v288);
              [v175 sendMessage:v176];

              goto LABEL_318;
            }
          }
          else if (!v135)
          {
            goto LABEL_304;
          }
          v188 = [(IDSGenericConnection *)v135 localConnectionGUID];
          if ([v315 isEqualToString:v188])
          {
            BOOL v189 = ([(IDSGenericConnection *)v135 stateFlags] & 8) == 0;

            if (!v189)
            {
              v190 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_DEFAULT, "control message repeated for current connection - assume local is current and remote reconciled", buf, 2u);
              }
LABEL_283:

LABEL_318:
LABEL_319:
              v163 = v288;
              goto LABEL_320;
            }
          }
          else
          {
          }
          if (([(IDSGenericConnection *)v135 stateFlags] & 8) == 0)
          {
            if ([(IDSGenericConnection *)v135 keyMaterialLength] != v289)
            {
              v190 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
              {
                v256 = [v320 vifName];
                unsigned int v257 = [(IDSGenericConnection *)v135 keyMaterialLength];
                *(_DWORD *)buf = 138412802;
                v328 = v256;
                __int16 v329 = 1024;
                *(_DWORD *)v330 = v257;
                *(_WORD *)&v330[4] = 1024;
                *(_DWORD *)&v330[6] = v289;
                _os_log_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_DEFAULT, "%@: nonmatching key material length (local:%u remote:%u)", buf, 0x18u);
              }
              goto LABEL_283;
            }
            v211 = [(IDSGenericConnection *)v135 localConnectionGUID];
            BOOL v212 = [v211 compare:v72] == (id)1;

            if (v212)
            {
              v213 = +[IDSFoundationLog utunController];
              if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
              {
                v214 = [v320 vifName];
                v215 = [(IDSGenericConnection *)v135 localConnectionGUID];
                *(_DWORD *)buf = 138412546;
                v328 = v214;
                __int16 v329 = 2112;
                *(void *)v330 = v215;
                _os_log_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_DEFAULT, "%@: found connection [%@] - remote wins", buf, 0x16u);
              }
              id v216 = [v320 portMap];
              v217 = [(IDSGenericConnection *)v135 addressPair];
              v218 = [v217 localAddress];
              -[IDSUTunController releasePortIfNecessary:port:](v317, "releasePortIfNecessary:port:", v216, [v218 saPortHostOrder]);

              [(IDSGenericConnection *)v135 setAddressPair:v286];
            }
LABEL_311:
            [(IDSGenericConnection *)v135 setSSRCRecv:v292];
            [(IDSGenericConnection *)v135 setSeqRecvStart:v295];
            v238 = [(IDSGenericConnection *)v135 localKeyMaterial];
            size_t v239 = v289;
            v240 = (char *)&v133[v306];
            do
            {
              char v241 = *v240++;
              *v238++ ^= v241;
              --v239;
            }
            while (v239);
            bzero(&v133[v306], v289);
            v242 = [v320 controlChannelVersion];
            BOOL v243 = [v242 intValue] == 1;

            if (!v243) {
              [(IDSGenericConnection *)v135 setSrtpProtocolVersion:1];
            }
            v244 = [(IDSGenericConnection *)v135 localConnectionGUID];
            BOOL v245 = [v244 compare:v72] == (id)1;

            sub_100220DA4([(IDSGenericConnection *)v135 encryptionState], (uint64_t)[(IDSGenericConnection *)v135 localKeyMaterial], [(IDSGenericConnection *)v135 keyMaterialLength], v245, [(IDSGenericConnection *)v135 SSRCSend], [(IDSGenericConnection *)v135 seqSendStart], [(IDSGenericConnection *)v135 SSRCRecv], [(IDSGenericConnection *)v135 seqRecvStart], [(IDSGenericConnection *)v135 srtpProtocolVersion]);
            sub_1003F164C((int *)[v320 incomingEncryptionTableBySSRC], -[IDSGenericConnection SSRCRecv](v135, "SSRCRecv"), v135);
            v246 = [(IDSGenericConnection *)v135 addressPair];
            v247 = [v246 localAddress];
            unsigned int v248 = [v247 saPortHostOrder];
            v249 = [(IDSGenericConnection *)v135 addressPair];
            v250 = [v249 remoteAddress];
            -[IDSGenericConnection setUint32Key:](v135, "setUint32Key:", (v248 << 16) | [v250 saPortHostOrder]);

            v251 = sub_1003F1964((uint64_t)[v320 connectionsTableByLocalRemotePortKey], -[IDSGenericConnection uint32Key](v135, "uint32Key"));
            v252 = v251;
            if (v251) {
              [v251 invalidate];
            }
            sub_1003F164C((int *)[v320 connectionsTableByLocalRemotePortKey], -[IDSGenericConnection uint32Key](v135, "uint32Key"), v135);
            [(IDSGenericConnection *)v135 setStateFlags:[(IDSGenericConnection *)v135 stateFlags] | 8];
            [(IDSGenericConnection *)v135 setRemoteConnectionGUID:v72];
            v253 = [v287 serviceConnectorServiceForAccount];
            [(IDSUTunController *)v317 startDataChannelWithDevice:v320 genericConnection:v135 serviceConnectorService:v253 endpoint:0];

            goto LABEL_318;
          }
          id v219 = [v320 portMap];
          v220 = [(IDSGenericConnection *)v135 addressPair];
          v221 = [v220 localAddress];
          -[IDSUTunController releasePortIfNecessary:port:](v317, "releasePortIfNecessary:port:", v219, [v221 saPortHostOrder]);

          [(IDSUTunController *)v317 removeConnection:v135 fromDeviceConnectionInfo:v320 removeCode:5050 removeReason:@"stale connection"];
          [(IDSUTunController *)v317 checkSuspendTrafficForDevice:v320 wait:1];
LABEL_304:
          BOOL v135 = [[IDSGenericConnection alloc] initWithConnectionID:v287 protocol:v303 keyMaterialLength:v289 isCloudEnabled:0];
          v222 = [v320 cbuuid];
          -[IDSGenericConnection setIsDefaultPairedDevice:](v135, "setIsDefaultPairedDevice:", [v222 isEqualToString:kIDSDefaultPairedDeviceID]);

          [(IDSGenericConnection *)v135 setAddressPair:v286];
          v223 = [v320 connectionsByID];
          [v223 setObject:v135 forKey:v287];

          do
          {
            uint64_t v224 = arc4random();
            v225 = sub_1003F1964((uint64_t)[v320 outgoingEncryptionTableBySSRC], v224);
            BOOL v226 = v225 == 0;
          }
          while (!v226);
          [(IDSGenericConnection *)v135 setSSRCSend:v224];
          [(IDSGenericConnection *)v135 setSeqSendStart:(unsigned __int16)arc4random()];
          [(IDSGenericConnection *)v135 setSeqSend:[(IDSGenericConnection *)v135 seqSendStart]];
          [(IDSGenericConnection *)v135 setEncryptionEnabled:1];
          v227 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
          {
            v228 = [v320 vifName];
            id v229 = [(IDSGenericConnection *)v135 localConnectionGUID];
            id v230 = [v229 UTF8String];
            unsigned int v231 = [(IDSGenericConnection *)v135 seqSendStart];
            *(_DWORD *)buf = 138413570;
            v328 = v228;
            __int16 v329 = 1024;
            *(_DWORD *)v330 = v285;
            *(_WORD *)&v330[4] = 1024;
            *(_DWORD *)&v330[6] = v284;
            *(_WORD *)&v330[10] = 2080;
            *(void *)&v330[12] = v230;
            *(_WORD *)&v330[20] = 1024;
            *(_DWORD *)&v330[22] = v224;
            *(_WORD *)&v330[26] = 1024;
            *(_DWORD *)v331 = v231;
            _os_log_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_DEFAULT, "%@: send setup encrypted channel message ports[%u:::%u] guid[%s] ssrc:%08x startSeq:%04x", buf, 0x2Eu);
          }
          v232 = [v320 controlChannel];
          v233 = [(IDSGenericConnection *)v135 localConnectionGUID];
          unsigned __int16 v234 = [(IDSGenericConnection *)v135 seqSendStart];
          v235 = sub_10036C8C4((char)v303, (__int16)v285, (__int16)v284, v233, v72, v313, v309, v288, v224, SBYTE1(v224), SBYTE2(v224), SBYTE3(v224), v234, SHIBYTE(v234), (uint64_t)[(IDSGenericConnection *)v135 localKeyMaterial], (unsigned __int16)[(IDSGenericConnection *)v135 keyMaterialLength]);
          [v232 sendMessage:v235];

          [(IDSGenericConnection *)v135 setStateFlags:[(IDSGenericConnection *)v135 stateFlags] | 4];
          [(IDSGenericConnection *)v135 setConnectionSetupStartTime:sub_100352F48()];
          v236 = sub_1003F1964((uint64_t)[v320 connectionsTableByLocalRemotePortKey], -[IDSGenericConnection uint32Key](v135, "uint32Key"));
          v237 = v236;
          if (v236) {
            [v236 invalidate];
          }
          sub_1003F164C((int *)[v320 outgoingEncryptionTableBySSRC], -[IDSGenericConnection SSRCSend](v135, "SSRCSend"), v135);

          goto LABEL_311;
        }
        id v315 = [objc_alloc((Class)NSString) initWithBytes:&v12[v65 + 24] length:v70 encoding:4];
        if (v315)
        {
          v73 += v70;
          goto LABEL_180;
        }
        unsigned int v145 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v146 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v146;
          _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "%@: SetupEncryptedChannel cannot decode account", buf, 0xCu);
        }
        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_335;
        }
        if (!_IDSShouldLogTransport()) {
          goto LABEL_335;
        }
        v260 = [v320 vifName];
        _IDSLogTransport();

        if (!_IDSShouldLog()) {
          goto LABEL_335;
        }
      }
      else
      {
        CFStringRef v125 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
        {
          double v126 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v126;
          _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "%@: SetupEncryptedChannel cannot decode remoteConnectionGUID", buf, 0xCu);
        }
        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_335;
        }
        if (!_IDSShouldLogTransport()) {
          goto LABEL_335;
        }
        v260 = [v320 vifName];
        _IDSLogTransport();

        if (!_IDSShouldLog()) {
          goto LABEL_335;
        }
      }
      v261 = objc_msgSend(v320, "vifName", v260);
      _IDSLogV();

      goto LABEL_335;
    case 7u:
      id v34 = [v320 controlChannel];
      [v34 processFairplayHostSessionInfo:v321];

      goto LABEL_12;
    case 8u:
      id v46 = [v320 controlChannel];
      [v46 processFairplayDeviceInfo:v321];

      goto LABEL_12;
    case 9u:
      uint64_t v20 = [v320 controlChannel];
      [v20 processFairplayDeviceSessionInfo:v321];

      goto LABEL_12;
    case 0xAu:
      id v47 = [v320 controlChannel];
      [v47 processOTRNegotiationMessage:v321];

      goto LABEL_12;
    case 0xBu:
      if ((unint64_t)v13 <= 1)
      {
        id v16 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_EncryptControlChannel missing data", buf, 0xCu);
        }
        goto LABEL_11;
      }
      unsigned int v50 = v12[1];
      unsigned int v51 = [v320 controlChannel];
      unsigned int v52 = [v51 isReadyForEncrypting];
      unsigned int v53 = [v51 isDefaultPairedDevicePairedLocally];
      unsigned int v54 = [v51 isDefaultPairedDevicePairedRemotely];
      __int16 v55 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        id v56 = [v320 vifName];
        *(_DWORD *)buf = 138413826;
        v328 = v56;
        __int16 v329 = 1024;
        *(_DWORD *)v330 = v50;
        *(_WORD *)&v330[4] = 1024;
        *(_DWORD *)&v330[6] = (v50 >> 1) & 1;
        *(_WORD *)&v330[10] = 1024;
        *(_DWORD *)&v330[12] = v50 & 1;
        *(_WORD *)&v330[16] = 1024;
        *(_DWORD *)&v330[18] = v52;
        *(_WORD *)&v330[22] = 1024;
        *(_DWORD *)&v330[24] = v53;
        *(_WORD *)v331 = 1024;
        *(_DWORD *)&v331[2] = v54;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%@: got control message: encrypt control channel flags %d ispairedlocally %d ispairedremotely %d (isencrypting: %d ispairedlocally %d ispairedremotely %d)", buf, 0x30u);
      }
      if (v52) {
        goto LABEL_123;
      }
      [v51 setIsDefaultPairedDevicePairedRemotely:v50 & 1];
      if ((~v50 & 3) != 0)
      {
        if (v50) {
          unsigned int v107 = v53;
        }
        else {
          unsigned int v107 = 0;
        }
        if (v107 != 1)
        {
LABEL_123:

          goto LABEL_12;
        }
        char v57 = sub_10036C514(1);
        [v51 sendPriorityMessage:v57];
      }
      else
      {
        char v57 = sub_1003F1964((uint64_t)[v320 connectionsTableByLocalRemotePortKey], 67109888);
        [(IDSUTunController *)v317 resetTCPConnection:v57 forDeviceConnectionInfo:v320];
        [v51 encryptControlChannelForStoredIdentities];
      }

      goto LABEL_123;
    case 0xCu:
      uint64_t v21 = [v320 controlChannel];
      [v21 processSuspendOTRNegotiationMessage:v321];

      goto LABEL_12;
    case 0xEu:
      if ((unint64_t)v13 <= 9)
      {
        id v16 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v48 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v48;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: UTCMType_DirectMsgInfo insufficient header", buf, 0xCu);
        }
        goto LABEL_11;
      }
      if ([v9 isEqualToString:kIDSDefaultPairedDeviceID])
      {
        unsigned int v74 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          int v75 = [v320 vifName];
          *(_DWORD *)buf = 138412290;
          v328 = v75;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%@: got control message: direct message info", buf, 0xCu);
        }
        id v76 = [objc_alloc((Class)NSData) initWithBytes:v12 + 1 length:v14 - 1];
        __int16 v77 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10036CD50;
        block[3] = &unk_10097E4D0;
        id v323 = v76;
        id v78 = v76;
        dispatch_async(v77, block);
      }
      goto LABEL_12;
    default:
      id v16 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v49 = [v320 vifName];
        *(_DWORD *)buf = 138412546;
        v328 = v49;
        __int16 v329 = 1024;
        *(_DWORD *)v330 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: got invalid control message %d", buf, 0x12u);
      }
      goto LABEL_11;
  }
}

- (id)controlChannelVersionForCbuuid:(id)a3
{
  p_controlChannelVersionCacheLock = &self->_controlChannelVersionCacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_controlChannelVersionCacheLock);
  id v6 = [(NSMutableDictionary *)self->_controlChannelVersionCache objectForKey:v5];

  os_unfair_lock_unlock(p_controlChannelVersionCacheLock);

  return v6;
}

- (void)setupDataConnectionWithDeviceConnectionInfo:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v137 = [v6 objectForKey:@"account"];
  id v7 = [v6 objectForKey:@"service"];
  if (v7)
  {
    double v134 = [v6 objectForKey:IDSOpenSocketOptionStreamNameKey];
    id v133 = [v6 objectForKey:@"protocol"];
    v127 = [v6 objectForKey:IDSOpenSocketOptionClientIDKey];
    unsigned int v129 = [v6 objectForKey:IDSOpenSocketOptionConnectionUUIDKey];
    id v8 = [v6 objectForKey:IDSOpenSocketOptionPriorityKey];
    uint64_t v131 = v8;
    if (v8) {
      uint64_t v124 = (uint64_t)[v8 integerValue];
    }
    else {
      uint64_t v124 = 200;
    }
    id v10 = [v6 objectForKey:IDSOpenSocketOptionCloudEnabledKey];
    unsigned int v120 = [v10 BOOLValue];

    if (_IDSSupportsDirectMessaging())
    {
      id v11 = [v6 objectForKey:IDSOpenSocketOptionIsDirectMsgSocket];
      char v118 = [v11 BOOLValue];

      switch(v124)
      {
        case 100:
          uint64_t v12 = 16;
          break;
        case 200:
          uint64_t v12 = 4;
          break;
        case 300:
          uint64_t v12 = 8;
          break;
        default:
          uint64_t v12 = 0;
          break;
      }
      id v13 = [v6 objectForKey:IDSOpenSocketOptionDataProtectionClass];
      unsigned int v14 = [v13 unsignedIntValue];

      if (v14 == 2)
      {
        v12 |= 1uLL;
      }
      else if (!v14)
      {
        v12 |= 2uLL;
      }
      int v15 = [v6 objectForKey:IDSOpenSocketOptionDirectMsgType];
      int v16 = [v15 unsignedShortValue];
      switch(v16)
      {
        case 1:
          v12 |= 0x20uLL;
          break;
        case 5:
          v12 |= 0x80uLL;
          break;
        case 3:
          v12 |= 0x40uLL;
          break;
      }
    }
    else
    {
      uint64_t v12 = 0;
      char v118 = 0;
    }
    if ([v7 isEqualToIgnoringCase:@"com.apple.private.alloy.siri.proxy"])
    {
      uint64_t v17 = 600;
    }
    else if ([v7 isEqualToIgnoringCase:@"com.apple.private.alloy.phonecontinuity"])
    {
      uint64_t v17 = 800;
    }
    else
    {
      if (([v7 isEqualToIgnoringCase:@"com.apple.private.alloy.fignero"] & 1) == 0)
      {
        uint64_t v121 = v124;
        if (![v7 isEqualToIgnoringCase:@"com.apple.private.alloy.willow.proxy"]) {
          goto LABEL_35;
        }
      }
      uint64_t v17 = 700;
    }
    uint64_t v121 = v17;
LABEL_35:
    uint64_t v18 = [v6 objectForKey:IDSOpenSocketOptionEncryptionMethodKey];
    v130 = v18;
    if (v18) {
      id v19 = [v18 integerValue];
    }
    else {
      id v19 = 0;
    }
    BOOL v135 = IMGetCachedDomainValueForKey();
    if (v135)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [v5 vifName];
          *(_DWORD *)buf = 138412802;
          v149 = v21;
          __int16 v150 = 2112;
          *(void *)double v151 = v135;
          *(_WORD *)&v151[8] = 2112;
          *(void *)v152 = v133;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@: UTunSocketProtocolOverride [%@] instead of specified [%@]", buf, 0x20u);
        }
      }
    }
    if ([v133 isEqualToString:@"udp"]) {
      int v22 = 17;
    }
    else {
      int v22 = 6;
    }
    unsigned int v119 = v22;
    uint64_t v23 = [v6 objectForKey:IDSOpenSocketOptionRealTimeKey];
    unsigned int v123 = [v23 BOOLValue];

    unint64_t v24 = [v5 cbuuid];
    if ([v24 isEqualToString:kIDSDefaultPairedDeviceID])
    {
      unsigned int v128 = 1;
    }
    else
    {
      int v25 = [v6 objectForKey:IDSDevicePropertyDefaultPairedDevice];
      unsigned int v128 = [v25 BOOLValue];
    }
    double v126 = [v6 objectForKey:IDSOpenSocketOptionCBUUIDKey];
    if (v128)
    {
      id v125 = IDSDeviceDefaultPairedDeviceUniqueID;
    }
    else
    {
      id v125 = [v6 objectForKey:IDSOpenSocketOptionDeviceUniqueIDKey];
    }
    v136 = +[IDSGenericConnectionID idWithAccount:v137 service:v7 name:v134];
    uint64_t v26 = [v5 connectionsByID];
    id v27 = [v26 objectForKey:v136];

    if (v27)
    {
      id v28 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [v5 vifName];
        *(_DWORD *)buf = 138412802;
        v149 = v29;
        __int16 v150 = 2112;
        *(void *)double v151 = v27;
        *(_WORD *)&v151[8] = 2112;
        *(void *)v152 = v136;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: found connection [%@] for ID [%@]", buf, 0x20u);
      }
      if (([(IDSGenericConnection *)v27 stateFlags] & 1) == 0)
      {
        unsigned int v30 = [v6 objectForKeyedSubscript:@"connectionContext"];
        id v31 = v30;
        if (v30)
        {
          [v30 setDeviceConnectionInfo:v5];
          [v31 setConnection:v27];
          uint64_t v32 = [v31 readHandler];
          [(IDSGenericConnection *)v27 setReadHandler:v32];

          unsigned int v33 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = [v5 vifName];
            unsigned int v35 = [v31 readHandler];
            id v36 = objc_retainBlock(v35);
            *(_DWORD *)buf = 138412802;
            v149 = v34;
            __int16 v150 = 2048;
            *(void *)double v151 = v36;
            *(_WORD *)&v151[8] = 2112;
            *(void *)v152 = v27;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@: early return: bypass utun with readHandler %p for connection [%@]", buf, 0x20u);
          }
        }
        [(IDSGenericConnection *)v27 setClientID:v127];
        [(IDSGenericConnection *)v27 setPriority:v124];
        [(IDSGenericConnection *)v27 setSocketTrafficClass:v121];
        [(IDSGenericConnection *)v27 setStateFlags:[(IDSGenericConnection *)v27 stateFlags] | 1];
        [(IDSGenericConnection *)v27 setIsCloudEnabled:v120];
        [(IDSGenericConnection *)v27 setIsDefaultPairedDevice:v128];
        [(IDSGenericConnection *)v27 setIsRealTime:v123];
        if (v129)
        {
          [(IDSGenericConnection *)v27 setIdsDeviceConnectionUUID:v129];
          unsigned int v37 = +[IDSDeviceConnectionAWDMetrics sharedInstance];
          [(IDSGenericConnection *)v27 connectionInitTime];
          double v39 = v38;
          int v40 = [(IDSGenericConnection *)v27 idsDeviceConnectionUUID];
          [v37 setConnectionInitTime:v40 forConnectionUUID:v39];

          [(IDSGenericConnection *)v27 firstDataPacketReceiveTime];
          if (v41 != 0.0)
          {
            unsigned int v42 = +[IDSDeviceConnectionAWDMetrics sharedInstance];
            [(IDSGenericConnection *)v27 firstDataPacketReceiveTime];
            double v44 = v43;
            __int16 v45 = [(IDSGenericConnection *)v27 idsDeviceConnectionUUID];
            [v42 setFirstPacketReceiveTime:v45 forConnectionUUID:v44];
          }
        }
        if ([(IDSGenericConnection *)v27 sd] == -1
          && ([(IDSGenericConnection *)v27 connectError],
              id v46 = objc_claimAutoreleasedReturnValue(),
              BOOL v47 = v46 == 0,
              v46,
              v47))
        {
          BOOL v109 = [v6 objectForKey:IDSOpenSocketOptionSetAllowlistUUIDForStreamingSocket];
          unsigned int v110 = [v109 BOOLValue];

          if (v110) {
            [(IDSGenericConnection *)v27 setShouldSetAllowlistUUIDForStreamingSocket:1];
          }
          char v57 = [v6 objectForKey:@"completionHandler"];
          id v58 = [v6 objectForKey:@"completionHandlerQueue"];
          [(IDSGenericConnection *)v27 setCompletionQueue:v58];
          [(IDSGenericConnection *)v27 setOpenSocketCompletionHandler:v57];
        }
        else
        {
          [(IDSGenericConnection *)v27 setStateFlags:[(IDSGenericConnection *)v27 stateFlags] | 2];
          int v48 = [(IDSGenericConnection *)v27 sd];
          unint64_t v49 = [(IDSGenericConnection *)v27 connectError];
          [(IDSGenericConnection *)v27 setSd:0xFFFFFFFFLL];
          [(IDSGenericConnection *)v27 setConnectError:0];
          int v50 = TrafficClassForIDSOpenSocketPriorityLevel();
          sub_10035E880(v48, v50);
          unsigned int v51 = [v6 objectForKey:IDSOpenSocketOptionSetAllowlistUUIDForStreamingSocket];
          unsigned int v52 = [v51 BOOLValue];

          if (v52) {
            sub_10035E9F0(v48);
          }
          if (v123)
          {
            [(IDSGenericConnection *)v27 setShouldStopBTDatagramLink:1];
            unsigned int v53 = +[IDSFoundationLog utunController];
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v149 = v7;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "openSocket for %@ using BT datagram link - start", buf, 0xCu);
            }

            [(IDSLinkManager *)self->_linkManager startBTDatagramLinkForDeviceUniqueID:v125 cbuuid:v126];
          }
          linkManager = self->_linkManager;
          __int16 v55 = [v5 cbuuid];
          unint64_t v56 = [(IDSLinkManager *)linkManager currentLinkType:v55];

          char v57 = [v6 objectForKey:@"completionHandlerQueue"];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10036E31C;
          block[3] = &unk_10098A178;
          id v143 = v6;
          int v147 = v48;
          id v145 = v49;
          unint64_t v146 = v56;
          id v144 = v5;
          id v58 = v49;
          dispatch_async(v57, block);
        }
LABEL_117:

        id v9 = v134;
        goto LABEL_118;
      }
      id v59 = [v5 portMap];
      uint64_t v60 = [(IDSGenericConnection *)v27 addressPair];
      uint64_t v61 = [v60 localAddress];
      -[IDSUTunController releasePortIfNecessary:port:](self, "releasePortIfNecessary:port:", v59, [v61 saPortHostOrder]);

      [(IDSUTunController *)self removeConnection:v27 fromDeviceConnectionInfo:v5 removeCode:5102 removeReason:@"replace existing connection"];
    }
    unsigned __int16 v141 = -21846;
    if (sub_1002CBBB0((uint64_t)[v5 portMap], &v141))
    {
      uint64_t v62 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v63 = [v5 vifName];
        *(_DWORD *)buf = 138412802;
        v149 = v63;
        __int16 v150 = 2112;
        *(void *)double v151 = v7;
        *(_WORD *)&v151[8] = 2112;
        *(void *)v152 = v134;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%@: cannot allocate new port for service %@ name %@", buf, 0x20u);
      }
      queue = [v6 objectForKey:@"completionHandlerQueue"];
      v138[0] = _NSConcreteStackBlock;
      v138[1] = 3221225472;
      v138[2] = sub_10036E3DC;
      v138[3] = &unk_10097E440;
      id v139 = v5;
      id v140 = v6;
      dispatch_block_t v64 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v138);
      dispatch_async(queue, v64);

      uint64_t v65 = v139;
      uint64_t v66 = v27;
    }
    else
    {
      if ([v5 shouldUseIPsecLink]) {
        __int16 v67 = -4222;
      }
      else {
        __int16 v67 = 1025;
      }
      unsigned __int16 v117 = v67;
      uint64_t v68 = [v5 localSA];
      queue = +[IDSSockAddrWrapper wrapperWithWrapper:v68 andPortHostOrder:v141];

      size_t v69 = [v5 remoteSA];
      uint64_t v116 = +[IDSSockAddrWrapper wrapperWithWrapper:v69 andPortHostOrder:v117];

      unint64_t v115 = +[IDSSockAddrWrapperPair wrapperPairWithLocalAddress:queue remoteAddress:v116];
      BOOL v71 = self->_encryptionEnabled && v19 == 0;
      unsigned int v72 = [IDSGenericConnection alloc];
      if (v71)
      {
        uint64_t v66 = [(IDSGenericConnection *)v72 initWithConnectionID:v136 protocol:v119 keyMaterialLength:60 isCloudEnabled:v120];

        do
        {
          uint64_t v73 = arc4random();
          unsigned int v74 = sub_1003F1964((uint64_t)[v5 outgoingEncryptionTableBySSRC], v73);
          BOOL v75 = v74 == 0;
        }
        while (!v75);
        [(IDSGenericConnection *)v66 setSSRCSend:v73];
        [(IDSGenericConnection *)v66 setSeqSendStart:(unsigned __int16)arc4random()];
        [(IDSGenericConnection *)v66 setSeqSend:[(IDSGenericConnection *)v66 seqSendStart]];
        [(IDSGenericConnection *)v66 setKeyMaterialLength:60];
        [(IDSGenericConnection *)v66 setEncryptionEnabled:1];
        id v76 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v77 = [v5 vifName];
          int v78 = v141;
          id v79 = [(IDSGenericConnection *)v66 localConnectionGUID];
          id v80 = [v79 UTF8String];
          unsigned int v81 = [(IDSGenericConnection *)v66 seqSendStart];
          *(_DWORD *)buf = 138413570;
          v149 = v77;
          __int16 v150 = 1024;
          *(_DWORD *)double v151 = v78;
          *(_WORD *)&v151[4] = 1024;
          *(_DWORD *)&v151[6] = v117;
          *(_WORD *)v152 = 2080;
          *(void *)&v152[2] = v80;
          LOWORD(v153) = 1024;
          *(_DWORD *)((char *)&v153 + 2) = v73;
          HIWORD(v153) = 1024;
          unsigned int v154 = v81;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%@: send setup encrypted channel message ports[%u:::%u] guid[%s] ssrc:%08x startSeq:%04x", buf, 0x2Eu);
        }
        __int16 v82 = v141;
        uint64_t v83 = [(IDSGenericConnection *)v66 localConnectionGUID];
        unsigned __int16 v84 = [(IDSGenericConnection *)v66 seqSendStart];
        uint64_t v85 = sub_10036C8C4(v119, v82, v117, v83, 0, v137, v7, v134, v73, SBYTE1(v73), SBYTE2(v73), SBYTE3(v73), v84, SHIBYTE(v84), (uint64_t)[(IDSGenericConnection *)v66 localKeyMaterial], (unsigned __int16)[(IDSGenericConnection *)v66 keyMaterialLength]);

        sub_1003F164C((int *)[v5 outgoingEncryptionTableBySSRC], -[IDSGenericConnection SSRCSend](v66, "SSRCSend"), v66);
      }
      else
      {
        uint64_t v66 = [(IDSGenericConnection *)v72 initWithConnectionID:v136 protocol:v119 isCloudEnabled:v120];

        long long v86 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          long long v87 = [v5 vifName];
          int v88 = v141;
          id v89 = [(IDSGenericConnection *)v66 localConnectionGUID];
          id v90 = [v89 UTF8String];
          *(_DWORD *)buf = 138413058;
          v149 = v87;
          __int16 v150 = 1024;
          *(_DWORD *)double v151 = v88;
          *(_WORD *)&v151[4] = 1024;
          *(_DWORD *)&v151[6] = v117;
          *(_WORD *)v152 = 2080;
          *(void *)&v152[2] = v90;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%@: send setup channel message ports[%u:::%u] guid[%s]", buf, 0x22u);
        }
        __int16 v91 = v141;
        long long v92 = [(IDSGenericConnection *)v66 localConnectionGUID];
        uint64_t v85 = sub_10036C62C(v119, v91, v117, v92, 0, v137, v7, v134, v118, v12);
      }
      long long v93 = [v6 objectForKeyedSubscript:@"connectionContext"];
      int v94 = v93;
      if (v93)
      {
        [v93 setDeviceConnectionInfo:v5];
        [v94 setConnection:v66];
        unsigned int v95 = [v94 readHandler];
        [(IDSGenericConnection *)v66 setReadHandler:v95];

        long long v96 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          long long v97 = [v5 vifName];
          long long v98 = [v94 readHandler];
          id v99 = objc_retainBlock(v98);
          *(_DWORD *)buf = 138412802;
          v149 = v97;
          __int16 v150 = 2048;
          *(void *)double v151 = v99;
          *(_WORD *)&v151[8] = 2112;
          *(void *)v152 = v66;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%@: bypass utun with readHandler %p for connection [%@]", buf, 0x20u);
        }
      }
      [(IDSGenericConnection *)v66 setPriority:v124];
      [(IDSGenericConnection *)v66 setSocketTrafficClass:v121];
      [(IDSGenericConnection *)v66 setHasMoreData:1];
      [(IDSGenericConnection *)v66 setStateFlags:1];
      addrinfo v100 = [v6 objectForKey:@"completionHandler"];
      [(IDSGenericConnection *)v66 setOpenSocketCompletionHandler:v100];
      __int16 v101 = [v6 objectForKey:@"completionHandlerQueue"];
      [(IDSGenericConnection *)v66 setCompletionQueue:v101];
      [(IDSGenericConnection *)v66 setAddressPair:v115];
      [(IDSGenericConnection *)v66 setClientID:v127];
      if (v129) {
        [(IDSGenericConnection *)v66 setIdsDeviceConnectionUUID:v129];
      }
      uint64_t v102 = [v5 connectionsByID];
      [v102 setObject:v66 forKey:v136];

      unsigned int v103 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        v104 = [v5 vifName];
        *(_DWORD *)buf = 138413058;
        v149 = v104;
        __int16 v150 = 2112;
        *(void *)double v151 = v66;
        *(_WORD *)&v151[8] = 2112;
        *(void *)v152 = v136;
        *(_WORD *)&v152[8] = 2112;
        id v153 = v5;
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "%@: setting up new connection [%@] for ID [%@] deviceInfo[%@]", buf, 0x2Au);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        [v5 vifName];
        int v113 = v136;
        double v111 = v114 = v5;
        id v112 = v66;
        _IDSLogV();
      }
      double v105 = objc_msgSend(v6, "objectForKey:", IDSOpenSocketOptionSetAllowlistUUIDForStreamingSocket, v111, v112, v113, v114);
      unsigned int v106 = [v105 BOOLValue];

      if (v106) {
        [(IDSGenericConnection *)v66 setShouldSetAllowlistUUIDForStreamingSocket:1];
      }
      unsigned int v107 = [v5 controlChannel];
      [v107 sendMessage:v85];

      [(IDSGenericConnection *)v66 setStateFlags:[(IDSGenericConnection *)v66 stateFlags] | 4];
      if (qword_100A4C8A8 != -1) {
        dispatch_once(&qword_100A4C8A8, &stru_10098A438);
      }
      [(IDSGenericConnection *)v66 setConnectionSetupStartTime:*(double *)&qword_100A4C830 * (double)mach_continuous_time()];
      [(IDSGenericConnection *)v66 setIsDefaultPairedDevice:v128];
      [(IDSGenericConnection *)v66 setIsRealTime:v123];
      if (v123)
      {
        [(IDSGenericConnection *)v66 setShouldStopBTDatagramLink:1];
        uint64_t v108 = +[IDSFoundationLog utunController];
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v149 = v7;
          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "openSocket for %@ using BT datagram link - start", buf, 0xCu);
        }

        [(IDSLinkManager *)self->_linkManager startBTDatagramLinkForDeviceUniqueID:v125 cbuuid:v126];
      }

      uint64_t v65 = (void *)v116;
    }

    id v27 = v66;
    goto LABEL_117;
  }
  id v9 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Service is nil, please provide a valid service name.", buf, 2u);
  }
LABEL_118:
}

- (void)closeDataConnectionWithDeviceConnectionInfo:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKey:@"account"];
  id v9 = [v7 objectForKey:@"service"];
  id v10 = [v7 objectForKey:IDSOpenSocketOptionStreamNameKey];
  id v11 = +[IDSGenericConnectionID idWithAccount:v8 service:v9 name:v10];
  uint64_t v12 = [v6 connectionsByID];
  id v13 = [v12 objectForKey:v11];

  unsigned int v14 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v6 vifName];
    *(_DWORD *)buf = 138412802;
    unsigned int v30 = v15;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v7;
    __int16 v33 = 2112;
    id v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: closeSocketWithOptions called with options [%@] (connection %@)", buf, 0x20u);
  }
  if (v13 && ([v13 stateFlags] & 1) != 0)
  {
    int v16 = v8;
    uint64_t v17 = self;
    uint64_t v18 = [v13 localConnectionGUID];
    id v19 = [v13 remoteConnectionGUID];
    id v28 = v16;
    uint64_t v20 = sub_100360720(v18, v19, v16, v9, v10);

    if (v20)
    {
      uint64_t v21 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = [v6 vifName];
        *(_DWORD *)buf = 138412802;
        unsigned int v30 = v22;
        __int16 v31 = 2112;
        uint64_t v32 = v20;
        __int16 v33 = 2112;
        id v34 = v13;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@: close channel control message [%@] created for connection %@", buf, 0x20u);
      }
      uint64_t v23 = [v6 controlChannel];
      [v23 sendMessage:v20];
    }
    id v24 = [v6 portMap];
    int v25 = [v13 addressPair];
    [v25 localAddress];
    uint64_t v26 = v27 = (void *)v20;
    -[IDSUTunController releasePortIfNecessary:port:](v17, "releasePortIfNecessary:port:", v24, [v26 saPortHostOrder]);

    [(IDSUTunController *)v17 removeConnection:v13 fromDeviceConnectionInfo:v6 removeCode:5103 removeReason:@"closeSocketWithOptions called"];
    id v8 = v28;
  }
}

- (id)defaultPairedDeviceIdentityPair
{
  v2 = +[IDSRegistrationKeyManager sharedInstance];
  id v3 = [v2 latestCopyMessageProtectionIdentityForDataProtectionClass:2];

  if (v3)
  {
    id v4 = [objc_alloc((Class)IDSMPFullLegacyIdentity) initWithFullIdentity:v3];
    CFRelease(v3);
  }
  else
  {
    id v5 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed creating local identity because latestCopyMessageProtectionIdentity is nil", buf, 2u);
    }

    id v4 = 0;
  }
  id v6 = +[IDSPairingManager sharedInstance];
  id v7 = [v6 pairedDevicePublicKey];

  id v13 = 0;
  id v8 = +[IDSMPPublicLegacyIdentity identityWithData:v7 error:&v13];
  id v9 = v13;
  if (v8)
  {
    if (v4)
    {
      id v10 = [[IDSUTunControlChannelIdentityPair alloc] initWithLocalFullIdentity:v4 remotePublicIdentity:v8];
      goto LABEL_13;
    }
  }
  else
  {
    id v11 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v15 = v7;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed creating public identity from data: %@  (Error: %@)", buf, 0x16u);
    }
  }
  id v10 = 0;
LABEL_13:

  return v10;
}

- (id)_prepareConnectionInfoWithCBUUID:(id)a3 deviceUniqueID:(id)a4 shouldUseIPsecLink:(BOOL)a5 identityPair:(id)a6 remoteDeviceEncryptionInfo:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = [(IDSUTunController *)self setupNewDeviceConnectionInfoForCbuuid:v12 deviceUniqueID:a4 identityPair:a6 remoteDeviceEncryptionInfo:a7 shouldUseIPsecLink:v9];
  if (v13)
  {
    [(IDSLinkManager *)self->_linkManager triggerFixedInterfaceLinksDidConnect];
    id v14 = v13;
  }
  else
  {
    int v15 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: UTunController unable to create new device - cannot continue", (uint8_t *)&v17, 0xCu);
    }
  }

  return v13;
}

- (void)prepareDefaultPairedConnectionInfoWithDeviceUniqueID:(id)a3 shouldUseIPsecLink:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)openSocketWithOptions:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (__CFDictionary *)[v7 mutableCopy];
  id v11 = [v9 copy];

  id v12 = objc_retainBlock(v11);
  if (v12) {
    CFDictionarySetValue(v10, @"completionHandler", v12);
  }

  if (v8)
  {
    id v13 = v8;
  }
  else
  {
    im_primary_queue();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13) {
      goto LABEL_7;
    }
  }
  CFDictionarySetValue(v10, @"completionHandlerQueue", v13);

LABEL_7:
  id v14 = [(__CFDictionary *)v10 objectForKey:IDSOpenSocketOptionCBUUIDKey];
  int v15 = [(__CFDictionary *)v10 objectForKey:IDSDevicePropertyDefaultPairedDevice];
  unsigned int v16 = [v15 BOOLValue];

  if (v16)
  {
    id v17 = IDSDeviceDefaultPairedDeviceUniqueID;
  }
  else
  {
    id v17 = [(__CFDictionary *)v10 objectForKey:IDSOpenSocketOptionDeviceUniqueIDKey];
    [v17 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];
  }
  id v18 = [(__CFDictionary *)v10 objectForKey:IDSOpenSocketOptionCloudEnabledKey];
  [v18 BOOLValue];

  id v19 = [(__CFDictionary *)v10 objectForKey:IDSOpenSocketOptionIsIDSDSessionSocket];
  [v19 BOOLValue];

  [(__CFDictionary *)v10 objectForKeyedSubscript:IDSOpenSocketOptionRemoteDeviceEncryptionInfoKey];
  int v25 = v14;
  uint64_t v26 = v10;
  id v27 = v7;
  v29 = id v28 = v17;
  id v20 = v29;
  id v21 = v17;
  id v22 = v7;
  uint64_t v23 = v10;
  id v24 = v14;
  IDSTransportThreadAddBlock();
}

- (void)cleanupSocketsForClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)closeSocketWithOptions:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v11;
  id v9 = v12;
  id v10 = v7;
  IDSTransportThreadAddBlock();
}

- (void)closeSocketWithOptions:(id)a3
{
}

- (void)doCheckSuspendTrafficForDevice:(id)a3
{
  id v4 = a3;
  if (qword_100A4C8A8 != -1) {
    dispatch_once(&qword_100A4C8A8, &stru_10098A438);
  }
  double v5 = *(double *)&qword_100A4C830 * (double)mach_continuous_time();
  [v4 suspendTrafficCheckTime];
  if (v6 <= v5)
  {
    id v10 = [v4 connectionsByID];
    id v11 = (char *)[v10 count];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = objc_msgSend(v4, "connectionsByID", 0);
    id v13 = [v12 allValues];

    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v34 count:16];
    if (v14)
    {
      id v15 = v14;
      unsigned int v16 = 0;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v13);
          }
          v16 += [*(id *)(*((void *)&v20 + 1) + 8 * i) suspended];
        }
        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v34 count:16];
      }
      while (v15);
    }
    else
    {
      unsigned int v16 = 0;
    }

    id v19 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v31 = *(double *)&v11;
      __int16 v32 = 2048;
      __int16 v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Suspend traffic check: connections %lu =? suspended connections %lu", buf, 0x16u);
    }

    if (v11 == v16)
    {
      if (v4[2079]) {
        os_channel_get_fd();
      }
      else {
        [v4 utunSocket];
      }
      IDSTransportThreadSuspendSocket();
      [v4 setSuspendTraffic:1];
      [(IDSLinkManager *)self->_linkManager stopLinkForDeviceUniqueID:v4[2] cbuuid:v4[1] disconnectWP:1];
    }
    else
    {
      [v4 setSuspendTraffic:0];
    }
    [v4 setSuspendTrafficCheckTime:0.0];
  }
  else
  {
    [v4 suspendTrafficCheckTime];
    double v8 = v7 - v5 + 0.5;
    id v9 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Rescheduling suspend traffic check in %0.2lf seconds", buf, 0xCu);
    }

    id v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_1003712CC;
    id v27 = &unk_100980D88;
    id v28 = self;
    id v29 = v4;
    IDSTransportThreadAddBlockAfter();
  }
}

- (void)checkSuspendTrafficForDevice:(id)a3 wait:(BOOL)a4
{
  id v6 = a3;
  if (qword_100A4C8A8 != -1) {
    dispatch_once(&qword_100A4C8A8, &stru_10098A438);
  }
  uint64_t v7 = mach_continuous_time();
  if (a4)
  {
    double v8 = *(double *)&qword_100A4C830 * (double)v7;
    [v6 suspendTrafficCheckTime];
    if (v9 == 0.0)
    {
      [v6 setSuspendTrafficCheckTime:v8 + 15.0];
      id v10 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v16 = 15.5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scheduling a suspend traffic check in %0.2lf seconds", buf, 0xCu);
      }

      id v14 = v6;
      IDSTransportThreadAddBlockAfter();
    }
    else
    {
      id v11 = +[IDSFoundationLog utunController];
      double v12 = v8 + 15.0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        [v6 suspendTrafficCheckTime];
        *(_DWORD *)buf = 134217984;
        double v16 = v12 - v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Extending suspend traffic check by %0.2lf seconds", buf, 0xCu);
      }

      [v6 setSuspendTrafficCheckTime:v12];
    }
  }
  else
  {
    [v6 setSuspendTrafficCheckTime:0.0];
    [(IDSUTunController *)self doCheckSuspendTrafficForDevice:v6];
  }
}

- (void)suspendSocketWithOptions:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)resumeSocketWithOptions:(id)a3 shouldLogCall:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)releasePortIfNecessary:(IDSPortMap *)a3 port:(unsigned __int16)a4
{
  int v4 = a4;
  if ((a4 & 0xFFFE) == 0x400)
  {
    id v5 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "can't release a reserved port: %u", (uint8_t *)v6, 8u);
    }
  }
  else
  {
    sub_1002CC3B8((uint64_t)a3, a4);
  }
}

- (void)startUDPGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)stopUDPGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)createConnectionDataForDevice:(id)a3 localPartyID:(id)a4 dataReadyHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  IDSTransportThreadAddBlock();
}

- (void)processRemoteConnectionDataForDevice:(id)a3 remoteConnectionData:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  IDSTransportThreadAddBlock();
}

- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6
{
  id v7 = a3;
  id v10 = a5;
  id v8 = v10;
  id v9 = v7;
  IDSTransportThreadAddBlock();
}

- (void)stopGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (unint64_t)onTransportThread_SendToGlobalLinkWithSessionID:(id)a3 packetBuffer:(id *)a4
{
  linkManager = self->_linkManager;
  if (linkManager) {
    return -[IDSLinkManager sendPacketBuffer:toDeviceUniqueID:cbuuid:](linkManager, "sendPacketBuffer:toDeviceUniqueID:cbuuid:", a4, a3);
  }
  else {
    return 11;
  }
}

- (unint64_t)onTransportThread_SendToGlobalLinkWithSessionID:(id)a3 packetBufferArray:(id *)a4 arraySize:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  linkManager = self->_linkManager;
  if (linkManager)
  {
    unint64_t v10 = [(IDSLinkManager *)linkManager sendPacketBufferArray:a4 arraySize:v5 toDeviceUniqueID:v8 cbuuid:v8];
  }
  else if ((int)v5 < 1)
  {
    unint64_t v10 = 11;
  }
  else
  {
    uint64_t v11 = v5;
    unint64_t v10 = 11;
    do
    {
      ++a4;
      _IDSLinkPacketBufferRelease();
      --v11;
    }
    while (v11);
  }

  return v10;
}

- (void)startGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)connectGlobalLinkForDevice:(id)a3 sessionInfo:(id)a4 connectReadyHandler:(id)a5 withLocalInterfacePreference:(int)a6
{
  id v8 = a3;
  id v12 = a4;
  id v13 = a5;
  id v9 = v13;
  id v10 = v12;
  id v11 = v8;
  IDSTransportThreadAddBlock();
}

- (void)setAcceptedRelaySession:(id)a3 relaySessionID:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  IDSTransportThreadAddBlock();
}

- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)setTimeBase:(id)a3 forIDSSession:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  IDSTransportThreadAddBlock();
}

- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4 forIDSSession:(id)a5
{
  id v6 = a5;
  id v5 = v6;
  IDSTransportThreadAddBlock();
}

- (void)setAllowP2PforIDSSession:(id)a3 isEnabled:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)setForceTCPFallbackOnWiFi:(id)a3 forceTCPFallbackOnWiFi:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)setForceTCPFallbackOnCell:(id)a3 forceTCPFallbackOnCell:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)setSharedSessionHasJoined:(BOOL)a3 forIDSSession:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)setCellInterfaceName:(id)a3 forIDSSession:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  IDSTransportThreadAddBlock();
}

- (void)setIDSContextBlob:(id)a3 forIDSSession:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  IDSTransportThreadAddBlock();
}

- (void)clearSharedSessionHasJoinedForIDSSession:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)clearCellInterfaceName:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)clearIDSContextBlob:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)handleAllocateRequestFailureForDevice:(id)a3 requestID:(id)a4 errorCode:(int)a5
{
  id v6 = a3;
  id v9 = a4;
  id v7 = v9;
  id v8 = v6;
  IDSTransportThreadAddBlock();
}

- (void)getLinkInformationForDevice:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  IDSTransportThreadAddBlock();
}

- (void)onTransportThread_SendSKEData:(id)a3 skeData:(id)a4 completionHandler:(id)a5
{
}

- (void)onTransportThread_SendKeyMaterialMessage:(id)a3 relayGroupID:(id)a4 keyMaterialMessageData:(id)a5 destinationURIs:(id)a6 completionHandler:(id)a7
{
}

- (void)onTransportThread_setServerDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5
{
}

- (void)onTransportThread_requestMaterialsForSession:(id)a3 participantIDs:(id)a4 materialType:(int)a5
{
}

- (void)onTransportThread_SetDefaultUnderlyingLink:(id)a3 linkID:(char)a4
{
}

- (void)onTransportThread_SetPacketNotificationFilter:(id)a3 linkID:(char)a4 uniqueTag:(unsigned int)a5 isEnabled:(BOOL)a6
{
}

- (void)onTransportThread_DropIPPackets:(id)a3 linkID:(char)a4 payloadArray:(id)a5
{
}

- (void)onTransportThread_UpdateProtocolQualityOfService:(id)a3 linkID:(char)a4 isGood:(BOOL)a5
{
}

- (void)onTransportThread_StopKeepAlive:(id)a3 linkIDs:(id)a4
{
}

- (void)onTransportThread_setWiFiAssistState:(id)a3 isWiFiAssistEnabled:(BOOL)a4
{
}

- (void)onTransportThread_receiveJoinNotificationFromAParticipant:(id)a3
{
}

- (void)onTransportThread_CurrentCellularSignalStrength:(id)a3 signalRaw:(int *)a4 signalStrength:(int *)a5 signalGrade:(int *)a6
{
  uint64_t v10 = 0;
  int v9 = 0;
  [(IDSLinkManager *)self->_linkManager currentCellularSignalStrength:a3 signalRaw:(char *)&v10 + 4 signalStrength:&v10 signalGrade:&v9];
  if (a4) {
    *a4 = HIDWORD(v10);
  }
  if (a5) {
    *a5 = v10;
  }
  if (a6) {
    *a6 = v9;
  }
}

- (void)onTransportThread_startLinkProbing:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_stopLinkProbing:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_queryLinkProbingStatus:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_flushLinkProbingStatus:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_sendStatsRequest:(id)a3 options:(id)a4
{
}

- (void)onTransportThread_sendStatsRequestWithOptions:(id)a3 options:(id)a4
{
}

- (unint64_t)onTransportThread_getLinkType:(id)a3
{
  return [(IDSLinkManager *)self->_linkManager currentLinkType:a3];
}

- (void)onTransportThread_manageDesignatedDestinationsWithSessionID:(id)a3 destinations:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6
{
}

- (void)onTransportThread_removeParticipantIDsWithSessionID:(id)a3 participantIDs:(id)a4 sessionStateCounter:(unsigned int)a5
{
}

- (void)onTransportThread_setRemoteDeviceVersion:(id)a3 version:(unsigned int)a4
{
}

- (void)onTransportThread_getSessionInfo:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 options:(id)a6
{
}

- (void)onTransportThread_updateSessionParticipants:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 participants:(id)a6
{
}

- (void)onTransportThread_updateSessionURIToParticipantIDs:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 sessionInfo:(id)a6
{
}

- (void)onTransportThread_setUPlusOneModeForSessionID:(id)a3 isUPlusOneEnabled:(BOOL)a4
{
}

- (void)onTransportThread_registerPluginForGroup:(id)a3 relayGroupID:(id)a4 options:(id)a5
{
}

- (unint64_t)onTransportThread_participantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5
{
  return [(IDSLinkManager *)self->_linkManager participantIDForAlias:a3 salt:a4 sessionID:a5];
}

- (unint64_t)onTransportThread_createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5
{
  return [(IDSLinkManager *)self->_linkManager createAliasForParticipantID:a3 salt:a4 sessionID:a5];
}

- (void)onTransportThread_updateParticipantType:(unsigned __int16)a3 forSessionID:(id)a4 sessionStateCounter:(unsigned int)a5
{
}

- (void)onTransportThread_sendConnectedLinkInfoToAVCForSessionID:(id)a3
{
}

- (void)onTransportThread_reportLinkEventForSessionID:(id)a3 eventName:(id)a4 linkID:(unsigned __int8)a5
{
}

- (void)onTransportThread_reportLinkMetricsForSessionID:(id)a3 linkID:(unsigned __int8)a4 lastPacketReceivedTime:(double)a5 lastPacketSentTime:(double)a6
{
}

- (void)onTransportThread_setClientUniquePID:(unint64_t)a3 sessionID:(id)a4
{
}

- (void)onTransportThread_requestChildConnectionIDForLinkID:(char)a3 sessionID:(id)a4
{
}

- (void)startLocalSetup
{
}

- (void)obliterateConnectionInfoForCBUUID:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSPairingManager sharedInstance];
  id v6 = [v5 pairedDeviceUUIDString];
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    [(IDSUTunController *)self obliterateConnectionInfoWithCompletionBlock:0 completionQueue:0];
  }
  else
  {
    id v8 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "obliterateConnectionInfo called on a device that isnt the default paired device.  Ignoring...", v9, 2u);
    }
  }
}

- (void)obliterateConnectionInfoWithCompletionBlock:(id)a3 completionQueue:(id)a4
{
}

- (void)obliterateConnectionInfoForCBUUID:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v12 = a5;
  id v13 = v8;
  id v9 = v12;
  id v10 = v8;
  id v11 = v7;
  IDSTransportThreadAddBlock();
}

- (void)tearDownEncryptionForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
}

- (void)addPairedDevice:(id)a3
{
}

- (void)addPairedDevice:(id)a3 shouldPairDirectlyOverIPsec:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)connectPairedDevice:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)deletePairedDevice:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (id)copyLinkStatsDict
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = sub_100366794;
  id v8 = sub_1003667A4;
  id v9 = 0;
  IDSTransportThreadAddSyncBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)clearPluginCacheForSession:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)clearReliableUnicastStateForSession:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (id)onTransportThread_PerServiceDataTransferredForDevice:(id)a3 services:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    *(void *)&long long v25 = 0;
    *((void *)&v25 + 1) = &v25;
    uint64_t v26 = 0x3032000000;
    id v27 = sub_100366794;
    id v28 = sub_1003667A4;
    id v29 = 0;
    id v8 = sub_1003F2080((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v6);
    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_100A4C8B0);
      id v9 = [(id)qword_100A4C820 mutableCopy];
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100A4C8B0);
      id v10 = [v8 connectionsTableByLocalRemotePortKey];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100374CFC;
      v17[3] = &unk_10098A3A0;
      id v18 = v7;
      long long v20 = &v25;
      id v11 = v9;
      id v19 = v11;
      sub_1003F1C58((uint64_t)v10, (uint64_t)v17);
    }
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 40);
      *(_DWORD *)buf = 136315394;
      long long v22 = "-[IDSUTunController onTransportThread_PerServiceDataTransferredForDevice:services:]";
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s: reporting service stats %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v14 = *(id *)(*((void *)&v25 + 1) + 40);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v15 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v25) = 136315138;
      *(void *)((char *)&v25 + 4) = "-[IDSUTunController onTransportThread_PerServiceDataTransferredForDevice:services:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: invalid arguments", (uint8_t *)&v25, 0xCu);
    }

    id v14 = 0;
  }

  return v14;
}

- (id)perServiceDataTransferredForDevice:(id)a3 services:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_100366794;
    id v15 = sub_1003667A4;
    id v16 = 0;
    id v10 = v5;
    id v11 = v6;
    IDSTransportThreadAddSyncBlock();
    id v7 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v8 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSUTunController perServiceDataTransferredForDevice:services:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: invalid arguments", (uint8_t *)&buf, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)perServiceDataSentForDevice:(id)a3 services:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_100366794;
    id v15 = sub_1003667A4;
    id v16 = 0;
    id v10 = v5;
    id v11 = v6;
    IDSTransportThreadAddSyncBlock();
    id v7 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v8 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSUTunController perServiceDataSentForDevice:services:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: invalid arguments", (uint8_t *)&buf, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)perServiceDataReceivedForDevice:(id)a3 services:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_100366794;
    id v15 = sub_1003667A4;
    id v16 = 0;
    id v10 = v5;
    id v11 = v6;
    IDSTransportThreadAddSyncBlock();
    id v7 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v8 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSUTunController perServiceDataReceivedForDevice:services:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: invalid arguments", (uint8_t *)&buf, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (unint64_t)totalPacketsSentForDevice:(id)a3 services:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v9 = v5;
  id v10 = v6;
  IDSTransportThreadAddSyncBlock();
  unint64_t v7 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (unint64_t)totalPacketsReceivedForDevice:(id)a3 services:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v9 = v5;
  id v10 = v6;
  IDSTransportThreadAddSyncBlock();
  unint64_t v7 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (void)setPreferInfraWiFi:(BOOL)a3
{
}

- (void)setLinkPreferences:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (void)sendOTRNegotiationMessage:(id)a3 negotiationCount:(unsigned int)a4 negotiationData:(id)a5
{
  id v6 = a3;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  IDSTransportThreadAddBlock();
}

- (void)sendSuspendOTRNegotiationMessage:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSTransportThreadAddBlock();
}

- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return -[IDSUTunController handleIncomingPacket:fromDeviceToken:](self, "handleIncomingPacket:fromDeviceToken:", a4, a6, a5);
}

- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sub_1003F2080((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v10);
  id v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    __int16 v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[throughput] Now can send to device %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    long long v21 = v11;
    _IDSLogV();
  }
  if (v11)
  {
    uint64_t v13 = +[IDSDevicePolicyController sharedInstance];
    unsigned int v14 = [v13 shouldBlackOutDeviceWithCbuuid:v10];

    if (v14)
    {
      id v15 = +[IDSFoundationLog utunController];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v11 controlChannel];
        uint64_t v17 = [v16 deviceUniqueID];
        *(_DWORD *)long long buf = 138412546;
        __int16 v23 = v10;
        __int16 v24 = 2112;
        long long v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device %@/%@ is blacked out due to fairplay failures", buf, 0x16u);
      }
      [(IDSLinkManager *)self->_linkManager stopLinkForDeviceUniqueID:v9 cbuuid:v10 disconnectWP:1];
    }
    else
    {
      id v18 = [v11 vifName];
      sub_100376700((const char *)[v18 UTF8String], 1);

      if (([v11 linkLayerConnected] & 1) == 0)
      {
        [v11 setLinkLayerConnected:1];
        if (qword_100A4C8A8 != -1) {
          dispatch_once(&qword_100A4C8A8, &stru_10098A438);
        }
        mach_continuous_time();
        [v11 linkLayerDisconnectTime];
        if ([v10 isEqualToString:kIDSDefaultPairedDeviceID])
        {
          id v19 = +[IDSFoundationLog utunController];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "link is connected for default paired device, check suspended OTR sessions...", buf, 2u);
          }

          long long v20 = [v11 controlChannel];
          [v20 resumeOTRNegotiation];
        }
      }
      objc_msgSend(v11, "setSuspendTraffic:", 0, v21);
      if (v11[2079]) {
        os_channel_get_fd();
      }
      else {
        [v11 utunSocket];
      }
      IDSTransportThreadResumeSocket();
      [v11 performBlocksOnLinkConnect];
    }
  }
}

- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sub_1003F2080((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)v10);
  id v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[throughput] Now cannot send to device %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    unsigned int v14 = v11;
    _IDSLogV();
  }
  if (v11)
  {
    id v13 = [v11 vifName];
    sub_100376700((const char *)[v13 UTF8String], 0);

    if ([v11 linkLayerConnected])
    {
      [v11 setLinkLayerConnected:0];
      if (qword_100A4C8A8 != -1) {
        dispatch_once(&qword_100A4C8A8, &stru_10098A438);
      }
      [v11 setLinkLayerDisconnectTime:*(double *)&qword_100A4C830 * (double)mach_continuous_time()];
    }
    if (objc_msgSend(v10, "isEqualToString:", kIDSDefaultPairedDeviceID, v14))
    {
      if (v11[2079]) {
        os_channel_get_fd();
      }
      else {
        [v11 utunSocket];
      }
      IDSTransportThreadSuspendSocket();
    }
    else if (([v11 suspendTraffic] & 1) == 0)
    {
      if (v11[2079]) {
        os_channel_get_fd();
      }
      else {
        [v11 utunSocket];
      }
      IDSTransportThreadResumeSocket();
    }
  }
}

- (void)link:(id)a3 hasSpaceAvailable:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6
{
  BOOL v6 = a4;
  id v7 = sub_1003F2080((uint64_t)&self->_deviceConnectionInfoTableByCbuuid, (uint64_t)a6);
  if (v7)
  {
    id v8 = +[IDSFoundationLog utunController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v7[1];
      v11[0] = 67109378;
      v11[1] = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[throughput] Has space available(%d) for device %@", (uint8_t *)v11, 0x12u);
    }

    uint64_t v10 = v7[2079];
    if (v6)
    {
      if (v10) {
        os_channel_get_fd();
      }
      else {
        [v7 utunSocket];
      }
      IDSTransportThreadResumeSocket();
    }
    else
    {
      if (v10) {
        os_channel_get_fd();
      }
      else {
        [v7 utunSocket];
      }
      IDSTransportThreadSuspendSocket();
    }
  }
}

- (void)didUpdatePairedDevice:(id)a3
{
  id v3 = [(IDSUTunController *)self defaultPairedDeviceIdentityPair];
  id v4 = +[IDSFoundationLog utunController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "localdevicecontroller callback [%@]", buf, 0xCu);
  }

  id v5 = v3;
  IDSTransportThreadAddBlock();
}

- (void)clearStats
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100A4C8B0);
  id v2 = [(id)qword_100A4C820 allValues];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      BOOL v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (v7)
        {
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) setPacketsSent:0];
          [v7 setPacketsReceived:0];
          [v7 setBytesSent:0];
          [v7 setBytesReceived:0];
        }
        BOOL v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100A4C8B0);
}

- (unint64_t)onTransportThread_SendWithConnectionContext:(id)a3 packetBuffer:(id *)a4
{
  id v6 = a3;
  IDSLinkPacketBufferAddBufferStart();
  id v7 = [v6 connection];
  unsigned int v8 = [v7 uint32Key];

  *a4->var0 = HIBYTE(v8);
  a4->var0[1] = BYTE2(v8);
  a4->var0[2] = BYTE1(v8);
  a4->var0[3] = v8;
  a4->var0[4] = BYTE1(a4->var2);
  a4->var0[5] = a4->var2;
  a4->var0[7] = 0;
  a4->var0[6] = 0;
  var0 = a4->var0;
  int64_t var2 = a4->var2;
  long long v11 = [v6 deviceConnectionInfo];

  LOBYTE(v13) = 1;
  [(IDSUTunController *)self handleIPPayload:var0 bytesLength:var2 source:0 destination:0 upperProtocol:17 forDeviceConnectionInfo:v11 flush:v13 callerShouldStop:0];

  _IDSLinkPacketBufferRelease();
  return 0;
}

- (void)onTransportThread_StopBTDatagramLinkForDefaultPairedDevice
{
}

- (IDSLinkManager)linkManager
{
  return self->_linkManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDeviceConnectionInfo, 0);
  objc_storeStrong((id *)&self->_ipsecQueue, 0);
  objc_storeStrong((id *)&self->_controlChannelVersionCache, 0);

  objc_storeStrong((id *)&self->_linkManager, 0);
}

@end