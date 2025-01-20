@interface IDSLinkManager
- (BOOL)_hasGlobalLinkConnectingOrConnected;
- (BOOL)_startUDPLinkHandshakeForDefaultDevice:(BOOL)a3 immediately:(BOOL)a4;
- (BOOL)isConnectedToDeviceID:(id)a3;
- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (IDSLinkManager)initWithDelegate:(id)a3;
- (id)_getIDSLinkTypeString:(unint64_t)a3;
- (id)_linkKeyForLink:(id)a3;
- (id)_newGlobalLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 options:(id)a5;
- (id)_newUDPGlobalLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (id)_newUDPLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 IPVersion:(unint64_t)a5 port:(unsigned __int16)a6;
- (id)_selectBestLink:(id)a3;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 forceReport:(BOOL)a4;
- (id)linkForCBUUID:(id)a3;
- (unint64_t)_getIDSLinkTypeFromWRMLinkType:(unint64_t)a3;
- (unint64_t)_getWRMLinkTypeFromIDSLinkType:(unint64_t)a3;
- (unint64_t)_sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5 link:(id)a6;
- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5;
- (unint64_t)currentDefaultDeviceLinkType;
- (unint64_t)currentLinkType:(id)a3;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)_addAllocateRequestForDevice:(id)a3 requestID:(id)a4;
- (void)_bringUpWiFi:(BOOL)a3;
- (void)_clearWiFiAssociationPowerAssertion;
- (void)_connectivityChangedForDefaultDevice:(BOOL)a3 isCloudConnected:(BOOL)a4;
- (void)_createWiFiAssociationPowerAssertion:(double)a3;
- (void)_createWiFiManagerClient;
- (void)_handleNetworkChanges:(id)a3;
- (void)_handleWRMLinkRecommendation:(unint64_t)a3;
- (void)_handleWiFiAutoJoinStatusChange:(int64_t)a3 WiFiSSID:(id)a4;
- (void)_nearbyChangedForDefaultDevice;
- (void)_processLMCommandPacket:(id *)a3 fromLink:(id)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)_processLinkChangeForDefaultDeviceFrom:(id)a3 to:(id)a4;
- (void)_removeAllLinksForDeviceID:(id)a3;
- (void)_removeAllocateRequestForDevice:(id)a3 requestID:(id)a4;
- (void)_removeLinkForDeviceID:(id)a3 linkKey:(id)a4 verifyWithLink:(id)a5;
- (void)_sendUDPLinkInterfaceAddresses:(id)a3 toDeviceID:(id)a4 isRetransmission:(BOOL)a5 isReply:(BOOL)a6;
- (void)_setBestLinkToCurrent:(id)a3;
- (void)_startAllocateRequestForDevice:(id)a3;
- (void)_startCellularDataStatusListener:(BOOL)a3;
- (void)_startNetworkInterfaceListener:(BOOL)a3;
- (void)_startReporter;
- (void)_subscribeToWRMForLinkRecommendation:(unint64_t)a3;
- (void)_suspendBTLink:(BOOL)a3 cbuuid:(id)a4;
- (void)_unsubscribeFromWRMForLinkRecommendation;
- (void)addPairedDevice:(id)a3;
- (void)cellularRadioAccessTechnologyDidChange:(BOOL)a3;
- (void)cellularSoMaskDidChange:(unsigned int)a3;
- (void)clearCellInterfaceName:(id)a3;
- (void)clearIDSContextBlob:(id)a3;
- (void)clearPluginCacheForSession:(id)a3;
- (void)clearReliableUnicastStateForSession:(id)a3;
- (void)clearSharedSessionHasJoinedForIDSSession:(id)a3;
- (void)connectGlobalLinkForDevice:(id)a3 sessionInfo:(id)a4 connectReadyHandler:(id)a5 withLocalInterfacePreference:(int)a6;
- (void)connectPairedDevice:(id)a3;
- (void)createConnectionDataForDevice:(id)a3 localPartyID:(id)a4 dataReadyHandler:(id)a5;
- (void)currentCellularSignalStrength:(id)a3 signalRaw:(int *)a4 signalStrength:(int *)a5 signalGrade:(int *)a6;
- (void)currentLinkType:(unint64_t *)a3 andRATType:(unsigned int *)a4 forDeviceID:(id)a5;
- (void)dealloc;
- (void)deletePairedDevice:(id)a3;
- (void)didReceiveBlockedIndicationForLink:(id)a3 reason:(unsigned int)a4;
- (void)disconnectGlobalLinkForDevice:(id)a3 isReinitiating:(BOOL)a4 completionHandler:(id)a5;
- (void)dropIPPackets:(id)a3 linkID:(char)a4 payloadArray:(id)a5;
- (void)flushBuffer:(unint64_t)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)flushLinkProbingStatus:(id)a3 options:(id)a4;
- (void)getSessionInfo:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 options:(id)a6;
- (void)handleAllocateRequestFailureForDevice:(id)a3 requestID:(id)a4 errorCode:(int)a5;
- (void)injectFakePacketInBTLink:(id *)a3 cbuuid:(id)a4;
- (void)link:(id)a3 didAddQREvent:(id)a4;
- (void)link:(id)a3 didCellularMTUChange:(unsigned __int16)a4;
- (void)link:(id)a3 didCellularNWPathFlagsChanged:(unsigned __int16)a4;
- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didConnectOverCloud:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didConnectUnderlyingLink:(char)a4 linkUUID:(id)a5 localAttributes:(id)a6 remoteAttributes:(id)a7;
- (void)link:(id)a3 didDefaultUnderlyingLinkChangeSucceeded:(BOOL)a4 currentDefaultLinkID:(char)a5;
- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didDisconnectOverCloud:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didDisconnectUnderlyingLinkID:(char)a4 linkUUID:(id)a5 reason:(unsigned __int8)a6;
- (void)link:(id)a3 didFailToConnectOverCloud:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didFinishConvergenceForRelaySessionID:(id)a4;
- (void)link:(id)a3 didGetLinkProbingStatus:(id)a4;
- (void)link:(id)a3 didRATChange:(unsigned __int8)a4;
- (void)link:(id)a3 didReceiveChildConnections:(id)a4 forLinkID:(char)a5;
- (void)link:(id)a3 didReceiveEncryptedDataBlobs:(id)a4;
- (void)link:(id)a3 didReceiveErrorIndicationWithCode:(unsigned int)a4;
- (void)link:(id)a3 didReceiveKeyMaterialMessageData:(id)a4 fromParticipantIDs:(id)a5 toParticipantID:(id)a6;
- (void)link:(id)a3 didReceiveMappedParticipantsDict:(id)a4 forLinkID:(char)a5;
- (void)link:(id)a3 didReceiveMaterialInfo:(id)a4 material:(id)a5;
- (void)link:(id)a3 didReceiveParticipantUpdate:(id)a4 status:(unsigned __int16)a5;
- (void)link:(id)a3 didReceivePluginDisconnect:(id)a4;
- (void)link:(id)a3 didReceivePluginRegistration:(unint64_t)a4 pluginName:(id)a5;
- (void)link:(id)a3 didReceivePluginUnregistration:(unint64_t)a4 pluginName:(id)a5;
- (void)link:(id)a3 didReceiveReliableUnicastServerMaterial:(id)a4;
- (void)link:(id)a3 didReceiveReportEvent:(id)a4;
- (void)link:(id)a3 didReceiveRequestToPurgeRegistration:(id)a4;
- (void)link:(id)a3 didReceiveSKEData:(id)a4;
- (void)link:(id)a3 didReceiveSessionInfo:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 status:(unsigned int)a7;
- (void)link:(id)a3 didReceiveSessionStateCounter:(unsigned int)a4;
- (void)link:(id)a3 didReceiveSessionStats:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 success:(BOOL)a7;
- (void)link:(id)a3 didWiFiNWPathFlagsChanged:(unsigned __int16)a4;
- (void)link:(id)a3 hasSpaceAvailable:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)link:(id)a3 hostAwakeDidChange:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6;
- (void)manageDesignatedDestinationsWithSessionID:(id)a3 destinations:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6;
- (void)manager:(id)a3 didPairedDeviceChange:(BOOL)a4;
- (void)manager:(id)a3 didPowerStateChange:(BOOL)a4;
- (void)manager:(id)a3 linkDidConnect:(id)a4;
- (void)manager:(id)a3 linkDidDisconnect:(id)a4;
- (void)obliterateConnectionInfo;
- (void)processRemoteConnectionDataForDevice:(id)a3 remoteConnectionData:(id)a4 completionHandler:(id)a5;
- (void)queryLinkProbingStatus:(id)a3 options:(id)a4;
- (void)receiveJoinNotificationFromAParticipant:(id)a3;
- (void)registerPluginForGroup:(id)a3 relayGroupID:(id)a4 options:(id)a5;
- (void)removeParticipantIDsWithSessionID:(id)a3 participantIDs:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)reportLinkEventForSessionID:(id)a3 eventName:(id)a4 linkID:(unsigned __int8)a5;
- (void)reportLinkMetricsForSessionID:(id)a3 linkID:(unsigned __int8)a4 lastPacketReceivedTime:(double)a5 lastPacketSentTime:(double)a6;
- (void)requestChildConnectionIDForLinkID:(char)a3 sessionID:(id)a4;
- (void)requestMaterialsForSession:(id)a3 participantIDs:(id)a4 materialType:(int)a5;
- (void)sendConnectedLinkInfoToAVCForSessionID:(id)a3;
- (void)sendKeyMaterialMessage:(id)a3 relayGroupID:(id)a4 keyMaterialMessageData:(id)a5 destinationURIs:(id)a6 completionHandler:(id)a7;
- (void)sendSKEData:(id)a3 skeData:(id)a4 completionHandler:(id)a5;
- (void)sendStatsRequest:(id)a3 options:(id)a4;
- (void)sendStatsRequestForClient:(id)a3 options:(id)a4;
- (void)setAcceptedRelaySession:(id)a3 relaySessionID:(id)a4 options:(id)a5;
- (void)setAllowP2PforIDSSession:(id)a3 isEnabled:(BOOL)a4;
- (void)setCellInterfaceName:(id)a3 forIDSSession:(id)a4;
- (void)setClientUniquePID:(unint64_t)a3 sessionID:(id)a4;
- (void)setDefaultUnderlyingLink:(id)a3 linkID:(char)a4;
- (void)setForceTCPFallbackOnCell:(id)a3 forceTCPFallbackOnCell:(BOOL)a4;
- (void)setForceTCPFallbackOnWiFi:(id)a3 forceTCPFallbackOnWiFi:(BOOL)a4;
- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4;
- (void)setIDSContextBlob:(id)a3 forIDSSession:(id)a4;
- (void)setIsOnPhoneCall:(BOOL)a3 forDeviceID:(id)a4;
- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4 forIDSSession:(id)a5;
- (void)setLinkPreferences:(id)a3;
- (void)setPacketNotificationFilter:(id)a3 linkID:(char)a4 uniqueTag:(unsigned int)a5 isEnabled:(BOOL)a6;
- (void)setPreferInfraWiFi:(BOOL)a3;
- (void)setRemoteDeviceVersion:(id)a3 version:(unsigned int)a4;
- (void)setRequireBT:(BOOL)a3;
- (void)setServerDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5;
- (void)setSharedSessionHasJoined:(BOOL)a3 forIDSSession:(id)a4;
- (void)setShouldStartBTLinkManager:(BOOL)a3;
- (void)setTimeBase:(id)a3 forIDSSession:(id)a4;
- (void)setUPlusOneModeForSessionID:(id)a3 isUPlusOneEnabled:(BOOL)a4;
- (void)setWiFiAssistState:(id)a3 isWiFiAssistEnabled:(BOOL)a4;
- (void)start;
- (void)startBTDatagramLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6;
- (void)startGlobalLinkForDevice:(id)a3;
- (void)startLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (void)startLinkProbing:(id)a3 options:(id)a4;
- (void)startLocalSetup;
- (void)startUDPGlobalLinkForDevice:(id)a3;
- (void)stopBTDatagramLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (void)stopGlobalLinkForDevice:(id)a3;
- (void)stopKeepAlive:(id)a3 linkIDs:(id)a4;
- (void)stopLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 disconnectWP:(BOOL)a5;
- (void)stopLinkProbing:(id)a3 options:(id)a4;
- (void)stopUDPGlobalLinkForDevice:(id)a3;
- (void)terminateCallDueToIdleClientForLink:(id)a3;
- (void)triggerBTCorruptionRecoveryForCBUUID:(id)a3;
- (void)triggerFixedInterfaceLinksDidConnect;
- (void)updateParticipantType:(unsigned __int16)a3 forSessionID:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)updateProtocolQualityOfService:(id)a3 linkID:(char)a4 isGood:(BOOL)a5;
- (void)updateSessionParticipants:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 participants:(id)a6;
- (void)updateSessionURIToParticipantIDs:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 sessionInfo:(id)a6;
@end

@implementation IDSLinkManager

- (void)disconnectGlobalLinkForDevice:(id)a3 isReinitiating:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = 0;
  if (!v8)
  {
    v12 = 0;
    goto LABEL_14;
  }
  cbuuidToLinks = self->_cbuuidToLinks;
  v12 = 0;
  if (!cbuuidToLinks) {
    goto LABEL_14;
  }
  v13 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
  v10 = v13;
  if (!v13)
  {
    v12 = 0;
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v12 = (id)CFDictionaryGetValue((CFDictionaryRef)v13, @"IDSLinkGlobalKey");
  if (!v12) {
    goto LABEL_14;
  }
  v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "disconnectGlobalLinkForDevice for  %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v17 = v8;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v17 = v8;
        _IDSLogV();
      }
    }
  }
  if ((unint64_t)objc_msgSend(v12, "state", v17) > 4)
  {
LABEL_14:
    if (!v9) {
      goto LABEL_16;
    }
LABEL_15:
    v15 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10025948C;
    block[3] = &unk_10097E7F0;
    id v19 = v9;
    dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(v15, v16);

    goto LABEL_16;
  }
  [v12 disconnectWithCompletionHandler:v9 isReinitiating:v6];
LABEL_16:
}

- (IDSLinkManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)IDSLinkManager;
  v5 = [(IDSLinkManager *)&v36 init];
  if (v5)
  {
    BOOL v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "============= New LinkManager %@ starting =============", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v32 = v5;
      _IDSLogV();
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    cbuuidToLinks = v5->_cbuuidToLinks;
    v5->_cbuuidToLinks = (NSMutableDictionary *)Mutable;

    CFMutableDictionaryRef v9 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    deviceIDToCurrentLink = v5->_deviceIDToCurrentLink;
    v5->_deviceIDToCurrentLink = (NSMutableDictionary *)v9;

    v11 = +[IMLockdownManager sharedInstance];
    v5->_isInternalInstall = [v11 isInternalInstall];

    v5->_demoMode = 0;
    if (CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0)
      && CFPreferencesGetAppIntegerValue(@"FProgramNumber", @"com.apple.demo-settings", 0) == 5)
    {
      v5->_demoMode = 1;
    }
    v12 = IMGetDomainValueForKey();
    v13 = v12;
    if (v12) {
      double v14 = (double)[v12 unsignedIntValue];
    }
    else {
      double v14 = 1.0;
    }
    v5->_minReportFileOpenTimeInterval = v14;
    v5->_previousReportFileOpenTime = 0.0;
    uint64_t v15 = +[IMUserDefaults fixedInterface];
    fixedInterface = v5->_fixedInterface;
    v5->_fixedInterface = (NSString *)v15;

    uint64_t v17 = +[IMUserDefaults fixedInterfaceDestination];
    fixedInterfaceDestination = v5->_fixedInterfaceDestination;
    v5->_fixedInterfaceDestination = (NSString *)v17;

    id v19 = v5->_fixedInterface;
    if (v19 && v5->_fixedInterfaceDestination)
    {
      v20 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (IDSLinkManager *)v5->_fixedInterface;
        v22 = v5->_fixedInterfaceDestination;
        *(_DWORD *)buf = 138412546;
        v38 = v21;
        __int16 v39 = 2112;
        v40 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Both FixedInterface [%@] and FixedInterfaceDestination [%@] are set. Setting up UDPLink only.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v33 = v5->_fixedInterface;
          v35 = v5->_fixedInterfaceDestination;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v33 = v5->_fixedInterface;
            v35 = v5->_fixedInterfaceDestination;
            _IDSLogV();
          }
        }
      }
      v5->_hasFixedDestination = 1;
    }
    else
    {
      v5->_fixedInterface = 0;

      v23 = v5->_fixedInterfaceDestination;
      v5->_fixedInterfaceDestination = 0;

      v5->_hasFixedDestination = 0;
      v24 = [[IDSBTLinkManager alloc] initWithDelegate:v5 pairedDevice:0];
      btLinkManager = v5->_btLinkManager;
      v5->_btLinkManager = v24;

      if (v5->_btLinkManager)
      {
        [(IDSLinkManager *)v5 _startNetworkInterfaceListener:1];
        [(IDSLinkManager *)v5 _startCellularDataStatusListener:1];
      }
    }
    [(IDSLinkManager *)v5 _startReporter];
    v26 = IMGetDomainValueForKey();
    v27 = v26;
    if (v26) {
      double v28 = (double)[v26 unsignedIntValue];
    }
    else {
      double v28 = 60.0;
    }
    v5->_int preferInfraWiFiConnectionTimeout = v28;
    v29 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int preferInfraWiFiConnectionTimeout = (int)v5->_preferInfraWiFiConnectionTimeout;
      *(_DWORD *)buf = 67109120;
      LODWORD(v38) = preferInfraWiFiConnectionTimeout;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Use preferInfraWiFiConnectionTimeout: %d seconds.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v34 = (int)v5->_preferInfraWiFiConnectionTimeout;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v34 = (int)v5->_preferInfraWiFiConnectionTimeout;
          _IDSLogV();
        }
      }
    }
    [(IDSLinkManager *)v5 _createWiFiManagerClient];
  }
  return v5;
}

- (void)dealloc
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "============= Dealloc LinkManager %@ =============", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v10 = self;
    _IDSLogV();
  }
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    CFRelease(dynamicStore);
  }
  -[IDSLinkManager _bringUpWiFi:](self, "_bringUpWiFi:", 0, v10);
  if (self->_wifiDevice)
  {
    if (qword_100A4C360 != -1) {
      dispatch_once(&qword_100A4C360, &stru_100986E30);
    }
    if (off_100A4C358) {
      off_100A4C358(self->_wifiDevice, 0, 0);
    }
    CFRelease(self->_wifiDevice);
  }
  if (self->_wifiManager)
  {
    if (qword_100A4C370 != -1) {
      dispatch_once(&qword_100A4C370, &stru_100986E50);
    }
    v5 = (void (*)(void *, CFRunLoopRef, const CFRunLoopMode))off_100A4C368;
    if (off_100A4C368)
    {
      wifiManager = self->_wifiManager;
      CFRunLoopRef Main = CFRunLoopGetMain();
      v5(wifiManager, Main, kCFRunLoopDefaultMode);
    }
    CFRelease(self->_wifiManager);
  }
  [(IDSBTLinkManager *)self->_btLinkManager stop];
  [(IDSWPLinkManager *)self->_wpLinkManager setDelegate:0];
  reporterTimer = self->_reporterTimer;
  if (reporterTimer)
  {
    dispatch_source_cancel(reporterTimer);
    CFMutableDictionaryRef v9 = self->_reporterTimer;
    self->_reporterTimer = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)IDSLinkManager;
  [(IDSLinkManager *)&v11 dealloc];
}

- (void)start
{
  v3 = +[IDSWPLinkManager sharedInstance];
  wpLinkManager = self->_wpLinkManager;
  self->_wpLinkManager = v3;

  [(IDSWPLinkManager *)self->_wpLinkManager setDelegate:self];
  if (self->_hasFixedDestination)
  {
    BOOL v5 = [(NSString *)self->_fixedInterfaceDestination rangeOfString:@":"] != (id)0x7FFFFFFFFFFFFFFFLL;
    uint64_t v6 = kIDSDefaultPairedDeviceID;
    id v7 = [(IDSLinkManager *)self _newUDPLinkForDeviceUniqueID:0 cbuuid:kIDSDefaultPairedDeviceID IPVersion:v5 port:49888];
    if ([(NSString *)self->_fixedInterfaceDestination rangeOfString:@"="] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = +[IDSSockAddrWrapper wrapperWithAddressString:self->_fixedInterfaceDestination withPortHostOrder:49888 withInterfaceName:self->_fixedInterface];
      [v7 setDestinationAddress:v8 isFixedDestination:self->_hasFixedDestination fromAddress:0];
    }
    else
    {
      sub_1002487E8(self->_fixedInterfaceDestination, self->_fixedInterface);
      CFMutableDictionaryRef v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      deviceIDToUDPDestinations = self->_deviceIDToUDPDestinations;
      self->_deviceIDToUDPDestinations = v9;

      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v12 = self->_deviceIDToUDPDestinations;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100249B4C;
      v14[3] = &unk_100980928;
      CFMutableDictionaryRef v15 = Mutable;
      v13 = Mutable;
      [(NSDictionary *)v12 enumerateKeysAndObjectsUsingBlock:v14];
      [v7 setDestinationAddressToDeviceIDMap:v13];
    }
    [(IDSLinkManager *)self _setBestLinkToCurrent:v6];
    self->_isDefaultDeviceNearby = 1;
    [(IDSLinkManager *)self _nearbyChangedForDefaultDevice];
  }
}

- (void)triggerFixedInterfaceLinksDidConnect
{
  if (self->_hasFixedDestination)
  {
    deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
    if (deviceIDToCurrentLink) {
      BOOL v4 = kIDSDefaultPairedDeviceID == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      Value = 0;
    }
    else {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)deviceIDToCurrentLink, kIDSDefaultPairedDeviceID);
    }
    id v6 = Value;
    CFMutableDictionaryRef v9 = [(NSDictionary *)self->_deviceIDToUDPDestinations allKeys];
    v10 = v6;
    id v7 = v6;
    id v8 = v9;
    IDSTransportThreadAddBlock();
  }
}

- (id)copyLinkStatsDict
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  Value = 0;
  if (self->_cbuuidToLinks) {
    BOOL v5 = kIDSDefaultPairedDeviceID == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_cbuuidToLinks, kIDSDefaultPairedDeviceID);
  }
  id v6 = [Value allValues];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [v11 copyLinkStatsDict];
        if (v12) {
          CFDictionarySetValue(Mutable, [v11 linkTypeString], v12);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
  id v13 = objc_alloc((Class)NSDictionary);
  double v14 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesReceived];
  CFMutableDictionaryRef v15 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesSent];
  dispatch_block_t v16 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsDropped];
  uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsReceived];
  v18 = +[NSNumber numberWithUnsignedLongLong:self->_totalPacketsSent];
  id v19 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, @"bytesReceived", v15, @"bytesSent", v16, @"packetsDropped", v17, @"packetsReceived", v18, @"packetsSent", 0);

  if (v19) {
    CFDictionarySetValue(Mutable, @"total", v19);
  }

  return Mutable;
}

- (id)generateLinkReport:(double)a3 forceReport:(BOOL)a4
{
  double previousReportTime = self->_previousReportTime;
  double v6 = a3 - previousReportTime;
  if (a4 || v6 >= 30.0)
  {
    if (previousReportTime == 0.0)
    {
LABEL_36:
      self->_double previousReportTime = a3;
      return 0;
    }
    int reporterFd = self->_reporterFd;
    if (reporterFd != -1)
    {
LABEL_5:
      *(void *)&v90[15] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)v90 = v8;
      long long v89 = v8;
      long long v88 = v8;
      long long v87 = v8;
      long long v86 = v8;
      long long v85 = v8;
      long long v84 = v8;
      long long v83 = v8;
      long long v82 = v8;
      long long v81 = v8;
      long long v80 = v8;
      long long v79 = v8;
      strcpy(__s, "=======================================================\n");
      size_t v9 = strlen(__s);
      if (write(reporterFd, __s, v9) <= 0)
      {
        close(self->_reporterFd);
        self->_int reporterFd = -1;
        v10 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          reporterFile = self->_reporterFile;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "closed FIFO file %s", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        dispatch_source_cancel((dispatch_source_t)self->_reporterTimer);
        reporterTimer = self->_reporterTimer;
        self->_reporterTimer = 0;
      }
LABEL_12:
      id v12 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", @"                            Since last report (for %.1fs)\tCumulative total\n", *(void *)&v6);
      id v13 = [(NSMutableDictionary *)self->_cbuuidToLinks allKeys];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id obj = v13;
      id v14 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v70;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v70 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(const void **)(*((void *)&v69 + 1) + 8 * i);
            deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
            if (deviceIDToCurrentLink) {
              BOOL v19 = v17 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (v19) {
              Value = 0;
            }
            else {
              Value = (void *)CFDictionaryGetValue((CFDictionaryRef)deviceIDToCurrentLink, *(const void **)(*((void *)&v69 + 1) + 8 * i));
            }
            id v21 = Value;
            long long v22 = 0;
            if (self->_cbuuidToLinks && v17) {
              long long v22 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_cbuuidToLinks, v17);
            }
            long long v23 = [v22 allValues];
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            id v24 = [v23 countByEnumeratingWithState:&v65 objects:v74 count:16];
            if (v24)
            {
              uint64_t v25 = *(void *)v66;
              do
              {
                for (j = 0; j != v24; j = (char *)j + 1)
                {
                  if (*(void *)v66 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  v27 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * (void)j), "generateLinkReport:isCurrentLink:", objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * (void)j), "isEqual:", v21), a3);
                  [v12 appendString:v27];
                }
                id v24 = [v23 countByEnumeratingWithState:&v65 objects:v74 count:16];
              }
              while (v24);
            }
          }
          id v14 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
        }
        while (v14);
      }

      unint64_t totalPacketsSent = self->_totalPacketsSent;
      unint64_t previousPacketsSent = self->_previousPacketsSent;
      v59 = formattedBytes();
      double v28 = formattedSpeed();
      unint64_t v29 = self->_totalPacketsSent;
      v30 = formattedBytes();
      unint64_t totalPacketsReceived = self->_totalPacketsReceived;
      unint64_t previousPacketsReceived = self->_previousPacketsReceived;
      v33 = formattedBytes();
      uint64_t v34 = formattedSpeed();
      unint64_t v35 = self->_totalPacketsReceived;
      objc_super v36 = formattedBytes();
      [v12 appendFormat:@"  Combined              Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n                   Dropped %6llu pkts                       %6llu pkts", totalPacketsSent - previousPacketsSent, v59, v28, v29, v30, totalPacketsReceived - previousPacketsReceived, v33, v34, v35, v36, self->_totalPacketsDropped - self->_previousPacketsDropped, self->_totalPacketsDropped];

      v37 = +[IDSUTunController sharedInstance];
      v38 = objc_msgSend(v37, "onTransportThread_PerServiceDataTransferredForDevice:services:", kIDSDefaultPairedDeviceID, 0);
      __int16 v39 = sub_100248E70(v38);

      [v12 appendString:@"\n\nStreaming Usage Statistics:\n"];
      [v12 appendString:v39];
      v40 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10024A9A0;
      block[3] = &unk_10097E440;
      id v63 = v12;
      v64 = self;
      id v41 = v12;
      dispatch_async(v40, block);

      long long v42 = *(_OWORD *)&self->_totalBytesReceived;
      *(_OWORD *)&self->_previousBytesSent = *(_OWORD *)&self->_totalBytesSent;
      *(_OWORD *)&self->_previousBytesReceived = v42;
      self->_previousPacketsDropped = self->_totalPacketsDropped;

      goto LABEL_36;
    }
    if (a3 - self->_previousReportFileOpenTime < self->_minReportFileOpenTimeInterval) {
      return 0;
    }
    self->_previousReportFileOpenTime = a3;
    v44 = self->_reporterFile;
    int v45 = open(self->_reporterFile, 5);
    self->_int reporterFd = v45;
    if (v45 != -1)
    {
      v46 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__s = 136315138;
        *(void *)&__s[4] = v44;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "opened FIFO file %s for writing", (uint8_t *)__s, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v47 = self->_reporterTimer;
      if (v47) {
        dispatch_source_cancel(v47);
      }
      v48 = im_primary_queue();
      v49 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v48);
      v50 = self->_reporterTimer;
      self->_reporterTimer = v49;

      v51 = self->_reporterTimer;
      dispatch_time_t v52 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v51, v52, 0x12A05F200uLL, 0x5F5E100uLL);
      v53 = self->_reporterTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10024A8F8;
      handler[3] = &unk_10097E4D0;
      handler[4] = self;
      dispatch_source_set_event_handler(v53, handler);
      dispatch_resume((dispatch_object_t)self->_reporterTimer);
      int reporterFd = self->_reporterFd;
      if (reporterFd == -1) {
        goto LABEL_12;
      }
      goto LABEL_5;
    }
    int v54 = *__error();
    if (v54 != 6)
    {
      v55 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__s = 136315394;
        *(void *)&__s[4] = v44;
        *(_WORD *)&__s[12] = 1024;
        *(_DWORD *)&__s[14] = v54;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "cannot open reporting FIFO file %s, errno=%d", (uint8_t *)__s, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  return 0;
}

- (void)_startReporter
{
  self->_int reporterFd = -1;
  if (!self->_isInternalInstall) {
    return;
  }
  memset(v26, 170, sizeof(v26));
  if (!confstr(65537, v26, 0x401uLL))
  {
    uint64_t v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_startReporter cannot locate temporary directory", (uint8_t *)&v22, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      return;
    }
LABEL_27:
    _IDSLogV();
    return;
  }
  v3 = opendir(v26);
  BOOL v4 = v3;
  if (!v3)
  {
    v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      long long v23 = v26;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "_startReporter cannot open %s", (uint8_t *)&v22, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      return;
    }
    goto LABEL_27;
  }
  BOOL v5 = readdir(v3);
  if (v5)
  {
    *(void *)&long long v6 = 136315138;
    long long v21 = v6;
    do
    {
      d_name = v5->d_name;
      if (!strncmp(v5->d_name, "ids-report.", 0xBuLL))
      {
        size_t v8 = strlen(v26) + v5->d_namlen;
        size_t v9 = v8 + 1;
        unint64_t v10 = (v8 + 16) & 0xFFFFFFFFFFFFFFF0;
        objc_super v11 = (char *)&v21 - v10;
        if (v9) {
          memset((char *)&v21 - v10, 170, v9);
        }
        snprintf(v11, v9, "%s%s", v26, d_name);
        id v12 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = v21;
          long long v23 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "removing old fifo file %s", (uint8_t *)&v22, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        unlink(v11);
      }
      BOOL v5 = readdir(v4);
    }
    while (v5);
  }
  closedir(v4);
  pid_t v13 = getpid();
  reporterFile = self->_reporterFile;
  snprintf(self->_reporterFile, 0x401uLL, "%s%s%u", v26, "ids-report.", v13);
  if (!mkfifo(self->_reporterFile, 0x1A4u))
  {
    int v15 = open(self->_reporterFile, 5);
    self->_int reporterFd = v15;
    if (v15 == -1)
    {
      int v19 = *__error();
      if (v19 != 6)
      {
        v20 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 136315394;
          long long v23 = reporterFile;
          __int16 v24 = 1024;
          int v25 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "cannot open reporting FIFO file %s, errno=%d", (uint8_t *)&v22, 0x12u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLog()) {
            goto LABEL_38;
          }
        }
      }
    }
    else
    {
      dispatch_block_t v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315138;
        long long v23 = reporterFile;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "opened FIFO file %s for writing", (uint8_t *)&v22, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_38:
      }
        _IDSLogV();
    }
  }
}

- (void)_createWiFiManagerClient
{
  if (self->_isCentral)
  {
    if (qword_100A4C380 != -1) {
      dispatch_once(&qword_100A4C380, &stru_100986E70);
    }
    v3 = (void *)off_100A4C378(0, 0);
    self->_wifiManager = v3;
    if (v3)
    {
      if (qword_100A4C390 != -1) {
        dispatch_once(&qword_100A4C390, &stru_100986E90);
      }
      BOOL v4 = (void *)off_100A4C388(self->_wifiManager);
      BOOL v5 = v4;
      if (v4)
      {
        id v6 = [v4 count];
        if (v6)
        {
          id v6 = [v5 objectAtIndex:0];
        }
        self->_wifiDevice = v6;
      }
      if (!self->_wifiDevice)
      {
        objc_super v11 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No WifiDevice available!", buf, 2u);
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
        goto LABEL_45;
      }
      if (qword_100A4C3A0 != -1) {
        dispatch_once(&qword_100A4C3A0, &stru_100986EB0);
      }
      if (off_100A4C398)
      {
        off_100A4C398(self->_wifiDevice, sub_10024C0F0, self);
        if (qword_100A4C3B0 != -1) {
          dispatch_once(&qword_100A4C3B0, &stru_100986ED0);
        }
        id v7 = (void (*)(void *, CFRunLoopRef, const CFRunLoopMode))off_100A4C3A8;
        if (off_100A4C3A8)
        {
          wifiManager = self->_wifiManager;
          CFRunLoopRef Main = CFRunLoopGetMain();
          v7(wifiManager, Main, kCFRunLoopDefaultMode);
LABEL_47:

          return;
        }
        pid_t v13 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WiFiManagerClientScheduleWithRunLoop not found in MobileWiFi", v19, 2u);
        }

        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_43;
        }
        if (!_IDSShouldLogTransport()) {
          goto LABEL_43;
        }
        _IDSLogTransport();
        if (!_IDSShouldLog()) {
          goto LABEL_43;
        }
      }
      else
      {
        id v12 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "WiFiDeviceClientRegisterAutoJoinNotificationCallback not found in MobileWiFi", v18, 2u);
        }

        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_43;
        }
        if (!_IDSShouldLogTransport()) {
          goto LABEL_43;
        }
        _IDSLogTransport();
        if (!_IDSShouldLog()) {
          goto LABEL_43;
        }
      }
      _IDSLogV();
LABEL_43:
      wifiDevice = self->_wifiDevice;
      if (wifiDevice)
      {
        CFRelease(wifiDevice);
        self->_wifiDevice = 0;
      }
LABEL_45:
      int v15 = self->_wifiManager;
      if (v15)
      {
        CFRelease(v15);
        self->_wifiManager = 0;
      }
      goto LABEL_47;
    }
    unint64_t v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_block_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WiFiManagerClientCreate failed!", v16, 2u);
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

- (id)_linkKeyForLink:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v4 = @"IDSLinkBTKey";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v4 = @"IDSLinkBTDatagramKey";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFStringRef v4 = @"IDSLinkBTLEKey";
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFStringRef v4 = @"IDSLinkLocalUDPKey";
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFStringRef v4 = @"IDSLinkGlobalUDPKey";
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              CFStringRef v4 = @"IDSLinkGlobalKey";
            }
            else {
              CFStringRef v4 = @"IDSLinkNoneKey";
            }
          }
        }
      }
    }
  }

  return (id)v4;
}

- (void)_suspendBTLink:(BOOL)a3 cbuuid:(id)a4
{
  BOOL v4 = a3;
  id v6 = kIDSDefaultPairedDeviceID;
  cbuuidToLinks = self->_cbuuidToLinks;
  if (cbuuidToLinks) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || (CFDictionaryRef v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6)) == 0)
  {
    CFDictionaryRef v10 = 0;
    self->_BOOL doesDefaultDevicePreferInfraWiFi = v4;
  }
  else
  {
    CFDictionaryRef v10 = v9;
    objc_super v11 = (id)CFDictionaryGetValue(v9, @"IDSLinkBTKey");
    BOOL doesDefaultDevicePreferInfraWiFi = self->_doesDefaultDevicePreferInfraWiFi;
    self->_BOOL doesDefaultDevicePreferInfraWiFi = v4;
    if (v11)
    {
      pid_t v13 = v11;
      unsigned int v14 = [v11 isLinkSuspended];
      int v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v16 = @"NO";
        if (v14) {
          CFStringRef v17 = @"YES";
        }
        else {
          CFStringRef v17 = @"NO";
        }
        if (v4) {
          CFStringRef v16 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v19 = v17;
        __int16 v20 = 2112;
        CFStringRef v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "_suspendBTLink %@ -> %@", buf, 0x16u);
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
      if (v14 == v4)
      {
        if (doesDefaultDevicePreferInfraWiFi && !v4 && !self->_isCentral)
        {
          [(IDSLinkManager *)self _startUDPLinkHandshakeForDefaultDevice:0 immediately:1];
          if (self->_isDefaultDeviceUsingBTLink) {
            [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:1 isCloudConnected:self->_lastSentDefaultDeviceCloudConnectivity];
          }
        }
      }
      else
      {
        [v13 suspendLink:v4];
        [(IDSLinkManager *)self _setBestLinkToCurrent:v6];
      }
      goto LABEL_24;
    }
  }
  if (!v4) {
    [(IDSLinkManager *)self _setBestLinkToCurrent:v6];
  }
  pid_t v13 = 0;
LABEL_24:
}

- (void)injectFakePacketInBTLink:(id *)a3 cbuuid:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_isInternalInstall)
  {
    id key = kIDSDefaultPairedDeviceID;

    BOOL v8 = 0;
    if (self->_cbuuidToLinks)
    {
      Value = 0;
      if (key)
      {
        Value = (id)CFDictionaryGetValue((CFDictionaryRef)self->_cbuuidToLinks, key);
        BOOL v8 = Value;
        if (Value) {
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)Value, @"IDSLinkBTKey");
        }
      }
    }
    else
    {
      Value = 0;
    }
    [Value injectFakePacket:a3];

    id v6 = key;
  }
}

- (void)_connectivityChangedForDefaultDevice:(BOOL)a3 isCloudConnected:(BOOL)a4
{
  if (self->_shouldStartBTLinkManager)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    if (a3) {
      self->_hasDelayedNoConnectivityNotification = 0;
    }
    if (self->_lastSentDefaultDeviceConnectivity != a3 || self->_lastSentDefaultDeviceCloudConnectivity != a4)
    {
      id v7 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v8 = @"YES";
        if (self->_lastSentDefaultDeviceConnectivity) {
          CFStringRef v9 = @"YES";
        }
        else {
          CFStringRef v9 = @"NO";
        }
        BOOL lastSentDefaultDeviceCloudConnectivity = self->_lastSentDefaultDeviceCloudConnectivity;
        if (v5) {
          CFStringRef v11 = @"YES";
        }
        else {
          CFStringRef v11 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        CFStringRef v26 = v9;
        if (lastSentDefaultDeviceCloudConnectivity) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        __int16 v27 = 2112;
        CFStringRef v28 = v11;
        if (!v4) {
          CFStringRef v8 = @"NO";
        }
        __int16 v29 = 2112;
        CFStringRef v30 = v12;
        __int16 v31 = 2112;
        CFStringRef v32 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_connectivityChangedForDefaultDevice: local(%@ -> %@), cloud(%@ -> %@).", buf, 0x2Au);
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
      self->_lastSentDefaultDeviceConnectivity = v5;
      self->_BOOL lastSentDefaultDeviceCloudConnectivity = v4;
      if (v5 || v4)
      {
        CFStringRef v16 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_connectivityChangedForDefaultDevice sending UTunController didConnectForDevice (default)", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained link:self didConnectForDeviceUniqueID:0 cbuuid:kIDSDefaultPairedDeviceID];
      }
      else
      {
        pid_t v13 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_connectivityChangedForDefaultDevice sending UTunController didDisconnectForDevice (default)", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained link:self didDisconnectForDeviceUniqueID:0 cbuuid:kIDSDefaultPairedDeviceID];
      }
    }
    if (self->_hasDelayedNoConnectivityNotification)
    {
      CFStringRef v17 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v18 = @"NO";
        if (v5) {
          CFStringRef v18 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_connectivityChangedForDefaultDevice NOT(delay) sending legacyUTunBTLinkManagerDefaultPeerConnectivityChanged: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    else if (self->_lastSentDefaultPeerConnectivity != v5)
    {
      self->_lastSentDefaultPeerConnectivity = v5;
      CFStringRef v19 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10024CF7C;
      block[3] = &unk_100986EF0;
      BOOL v24 = v5;
      dispatch_async(v19, block);
    }
    __int16 v20 = im_primary_queue();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10024D114;
    v21[3] = &unk_100986EF0;
    BOOL v22 = v4;
    dispatch_async(v20, v21);
  }
  else
  {
    int v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not processing _connectivityChangedForDefaultDevice in the IPsecLink path.", buf, 2u);
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

- (void)_nearbyChangedForDefaultDevice
{
  if (self->_lastSentDefaultDeviceNearby != self->_isDefaultDeviceNearby)
  {
    id v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v4 = @"YES";
      if (self->_lastSentDefaultDeviceNearby) {
        CFStringRef v5 = @"YES";
      }
      else {
        CFStringRef v5 = @"NO";
      }
      if (!self->_isDefaultDeviceNearby) {
        CFStringRef v4 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v9 = v5;
      __int16 v10 = 2112;
      CFStringRef v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_nearbyChangedForDefaultDevice: %@ -> %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    self->_lastSentDefaultDeviceNearby = self->_isDefaultDeviceNearby;
    id v6 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10024D484;
    block[3] = &unk_10097E4D0;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

- (void)_processLMCommandPacket:(id *)a3 fromLink:(id)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6
{
  __int16 v10 = (__CFString *)a4;
  id v57 = a5;
  id v11 = a6;
  *(void *)&double v12 = *(unsigned __int8 *)a3->var0;
  switch(*a3->var0)
  {
    case '@':
    case 'B':
      pid_t v13 = IMGetDomainValueForKey();
      id v14 = v13;
      if (!v13 || ![v13 BOOLValue] || self->_doesDefaultDevicePreferInfraWiFi)
      {

        goto LABEL_6;
      }
      v49 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Ignore LMCommandUDPLinkAddress/Reply due to disabled range extension via defaults.", buf, 2u);
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
      goto LABEL_136;
    case 'A':
    case 'C':
      v33 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(double *)&CFStringRef v34 = COERCE_DOUBLE(&stru_10099BE78);
        if (LODWORD(v12) == 67) {
          *(double *)&CFStringRef v34 = COERCE_DOUBLE(@"(reply) ");
        }
        *(_DWORD *)buf = 138412546;
        double v59 = *(double *)&v34;
        __int16 v60 = 2112;
        CFStringRef v61 = v10;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "received remote UDPLink interface down %@through %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        *(double *)&unint64_t v35 = LODWORD(v12) == 67 ? COERCE_DOUBLE(@"(reply) ") : COERCE_DOUBLE(&stru_10099BE78);
        double v50 = *(double *)&v35;
        v51 = v10;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          double v50 = *(double *)&v35;
          v51 = v10;
          _IDSLogV();
        }
      }
      if (self->_doesDefaultDevicePreferInfraWiFi) {
        [(IDSLinkManager *)self _suspendBTLink:0 cbuuid:v11];
      }
      id v14 = -[IDSLinkManager _newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:](self, "_newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:", 0, v11, 0, 0, *(void *)&v50, v51);
      if (LODWORD(v12) == 65) {
        [(IDSLinkManager *)self _sendUDPLinkInterfaceAddresses:v14 toDeviceID:v11 isRetransmission:0 isReply:1];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v14 setDestinationAddress:0 isFixedDestination:self->_hasFixedDestination fromAddress:0];
      }
      if (self->_isCentral)
      {
        if (!self->_mayBringUpWiFi) {
          goto LABEL_136;
        }
        objc_super v36 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "will NOT bring up WiFi when losing BTLink", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          _IDSLogTransport();
          BOOL v37 = 0;
          if ((_IDSShouldLog() & 1) == 0) {
            goto LABEL_135;
          }
LABEL_85:
          _IDSLogV();
          goto LABEL_135;
        }
        BOOL v37 = 0;
      }
      else
      {
        if (self->_mayBringUpWiFi) {
          goto LABEL_136;
        }
        v40 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "will bring up WiFi when losing BTLink", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          _IDSLogTransport();
          BOOL v37 = 1;
          if ((_IDSShouldLog() & 1) == 0) {
            goto LABEL_135;
          }
          goto LABEL_85;
        }
        BOOL v37 = 1;
      }
LABEL_135:
      self->_mayBringUpWiFi = v37;
LABEL_136:

      goto LABEL_137;
    case 'D':
      __int16 v39 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Remote device reported data corruption", buf, 2u);
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
      if (objc_opt_respondsToSelector()) {
        [(__CFString *)v10 remoteDetectedCorruption];
      }
      goto LABEL_137;
    case 'E':
    case 'F':
LABEL_6:
      int v15 = +[IDSInterfaceAddress interfaceAddressWithTransmittedBytes:a3->var0 + 1 length:a3->var2 - 1 withLocalInterfaceName:self->_fixedInterface];
      CFStringRef v16 = v15;
      if (v15)
      {
        CFStringRef v17 = [v15 address];

        if (v17)
        {
          unsigned int v55 = LODWORD(v12) & 0xFFFFFFFB;
          unsigned int v18 = LODWORD(v12) - 69;
          CFStringRef v19 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v20 = &stru_10099BE78;
            *(double *)&CFStringRef v21 = COERCE_DOUBLE(@"(prefer) ");
            if (v18 >= 2) {
              *(double *)&CFStringRef v21 = COERCE_DOUBLE(&stru_10099BE78);
            }
            *(_DWORD *)buf = 138413058;
            double v59 = *(double *)&v21;
            __int16 v60 = 2112;
            if (v55 == 66) {
              CFStringRef v20 = @"(reply) ";
            }
            CFStringRef v61 = v20;
            __int16 v62 = 2112;
            id v63 = v16;
            __int16 v64 = 2112;
            long long v65 = v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "received remote UDPLink %@interface address %@%@ through %@", buf, 0x2Au);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            *(double *)&BOOL v22 = v18 >= 2 ? COERCE_DOUBLE(&stru_10099BE78) : COERCE_DOUBLE(@"(prefer) ");
            long long v23 = v55 == 66 ? @"(reply) " : &stru_10099BE78;
            v53 = v16;
            int v54 = v10;
            double v50 = *(double *)&v22;
            v51 = v23;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v53 = v16;
              int v54 = v10;
              double v50 = *(double *)&v22;
              v51 = v23;
              _IDSLogV();
            }
          }
          if (v18 <= 1)
          {
            if (!self->_isCentral || (ids_monotonic_time(), double v25 = v24 - self->_rejectedPreferInfraWiFi, v25 >= 8.0))
            {
              uint64_t v27 = 1;
LABEL_88:
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              id v42 = -[IDSLinkManager _newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:](self, "_newUDPLinkForDeviceUniqueID:cbuuid:IPVersion:port:", 0, v11, [v16 IPVersion], 0);
              char v43 = v27 ^ 1;
              if (!self->_isCentral) {
                char v43 = 1;
              }
              if ((v43 & 1) != 0 || !self->_doesDefaultDevicePreferInfraWiFi | isKindOfClass & 1)
              {
                if ((isKindOfClass & 1) != 0 && a3->var19.ss_family) {
                  id v32 = [objc_alloc((Class)IDSSockAddrWrapper) initWithSockAddr:&a3->var19];
                }
                else {
                  id v32 = 0;
                }
                v44 = objc_msgSend(v16, "address", *(void *)&v50, v51, v53, v54);
                unsigned __int8 v45 = [v42 setDestinationAddress:v44 isFixedDestination:self->_hasFixedDestination fromAddress:v32];

                if ((v45 & 1) == 0)
                {
                  v46 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "received remote UDPLink interface address doesn't match to the source of the packet - ignoring", buf, 2u);
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
                  goto LABEL_124;
                }
              }
              else
              {
                id v32 = 0;
              }
              if (v27)
              {
                BOOL doesDefaultDevicePreferInfraWiFi = self->_doesDefaultDevicePreferInfraWiFi;
                if (self->_isCentral)
                {
                  if (self->_doesDefaultDevicePreferInfraWiFi) {
                    goto LABEL_111;
                  }
LABEL_110:
                  -[IDSLinkManager _suspendBTLink:cbuuid:](self, "_suspendBTLink:cbuuid:", v27, v11, *(void *)&v50);
LABEL_111:
                  if (isKindOfClass)
                  {
                    if (!self->_isWiFiBroughtUp)
                    {
LABEL_124:

                      goto LABEL_125;
                    }
                    self->_shouldKeepWiFiUp = 1;
                    [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:1 isCloudConnected:self->_lastSentDefaultDeviceCloudConnectivity];
                  }
                  else if (!self->_mayBringUpWiFi)
                  {
                    v48 = OSLogHandleForTransportCategory();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "will bring up WiFi when losing BTLink", buf, 2u);
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
                    self->_mayBringUpWiFi = 1;
                  }
                  if (v55 != 66) {
                    [(IDSLinkManager *)self _sendUDPLinkInterfaceAddresses:v42 toDeviceID:v11 isRetransmission:0 isReply:1];
                  }
                  goto LABEL_124;
                }
              }
              else
              {
                BOOL doesDefaultDevicePreferInfraWiFi = self->_doesDefaultDevicePreferInfraWiFi;
              }
              if (!doesDefaultDevicePreferInfraWiFi) {
                goto LABEL_111;
              }
              goto LABEL_110;
            }
            CFStringRef v26 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              double v59 = v25;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Rejected last preferInfraWiFi request %.1f seconds ago - ignoring this preferInfraWiFi request", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                double v50 = v25;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  double v50 = v25;
                  _IDSLogV();
                }
              }
            }
          }
          uint64_t v27 = 0;
          goto LABEL_88;
        }
      }
      CFStringRef v28 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v29 = a3->var2 - 1;
        CFStringRef v30 = +[NSData dataWithBytes:a3->var0 + 1 length:v29];
        *(_DWORD *)buf = 134218242;
        double v59 = *(double *)&v29;
        __int16 v60 = 2112;
        CFStringRef v61 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "received invalid interface address bytes(%ld) = %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          int64_t v31 = a3->var2 - 1;
          dispatch_time_t v52 = +[NSData dataWithBytes:a3->var0 + 1 length:v31];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3->var0 + 1, a3->var2 - 1, v31, v52);
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            _IDSLogV();
LABEL_125:
          }
        }
      }

LABEL_137:

      return;
    default:
      v38 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v59 = v12;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "unknown LMCommand %lu received", buf, 0xCu);
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
      goto LABEL_137;
  }
}

- (void)_sendUDPLinkInterfaceAddresses:(id)a3 toDeviceID:(id)a4 isRetransmission:(BOOL)a5 isReply:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  double v12 = v11;
  if (self->_hasFixedDestination) {
    goto LABEL_109;
  }
  pid_t v13 = (const void *)kIDSDefaultPairedDeviceID;
  if (![v11 isEqualToString:kIDSDefaultPairedDeviceID]) {
    goto LABEL_109;
  }
  if ([v10 isInvalidated])
  {
    id v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "UDPLink invalidated - stop retransmitting local interface address", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_108;
    }
    if (!_IDSShouldLogTransport()) {
      goto LABEL_108;
    }
    _IDSLogTransport();
    if (!_IDSShouldLog()) {
      goto LABEL_108;
    }
    goto LABEL_107;
  }
  if (v6) {
    goto LABEL_46;
  }
  ids_monotonic_time();
  double v16 = v15;
  if (v7)
  {
    [v10 lastDestinationSent];
    double v18 = v17;
    [v10 lastDestinationReceived];
    if (v18 <= v19)
    {
      v51 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "already received remote interface address - stop retransmitting local interface address", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_108;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_108;
      }
      _IDSLogTransport();
      if (!_IDSShouldLog()) {
        goto LABEL_108;
      }
LABEL_107:
      _IDSLogV();
LABEL_108:
      self->_double addressRetransmissionInterval = 0.0;
      goto LABEL_109;
    }
    if (self->_isDefaultDeviceUsingBTLink) {
      double v20 = 30.0;
    }
    else {
      double v20 = 60.0;
    }
    [v10 lastDestinationSent];
    if (v16 - v21 > v20)
    {
      BOOL v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v59 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "didn't receive remote interface address for last %.0fs - giving up!", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          double v53 = v20;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            double v53 = v20;
            _IDSLogV();
          }
        }
      }
      if (self->_isCentral)
      {
        Value = 0;
        if (v13 && self->_deviceIDToCurrentLink) {
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, v13);
        }
        id v24 = Value;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v25 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            double v59 = *(double *)&v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "setDestinationAddress nil for %@.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              double v53 = *(double *)&v24;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                double v53 = *(double *)&v24;
                _IDSLogV();
              }
            }
          }
          objc_msgSend(v24, "setDestinationAddress:isFixedDestination:fromAddress:", 0, self->_hasFixedDestination, 0, *(void *)&v53);
        }
        -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v13, *(void *)&v53);
      }
      -[IDSLinkManager _bringUpWiFi:](self, "_bringUpWiFi:", 0, *(void *)&v53);
      self->_double addressRetransmissionInterval = 0.0;
      if (self->_doesDefaultDevicePreferInfraWiFi) {
        [(IDSLinkManager *)self _suspendBTLink:0 cbuuid:v12];
      }
      goto LABEL_109;
    }
LABEL_46:
    id v28 = [v10 copyCurrentNetworkInterfaces];
    int64_t v29 = [v28 firstObject];
    CFStringRef v30 = [v29 address];
    localWiFiAddressUsedForDefaultDevice = self->_localWiFiAddressUsedForDefaultDevice;
    self->_localWiFiAddressUsedForDefaultDevice = v30;

    id v32 = (void *)_IDSLinkPacketBufferCreate();
    if (v29)
    {
      v33 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v34 = @"(prefer) ";
        if (!self->_doesDefaultDevicePreferInfraWiFi) {
          CFStringRef v34 = &stru_10099BE78;
        }
        CFStringRef v35 = @"(reply) ";
        *(_DWORD *)buf = 138412802;
        double v59 = *(double *)&v34;
        __int16 v60 = 2112;
        if (!v6) {
          CFStringRef v35 = &stru_10099BE78;
        }
        CFStringRef v61 = v35;
        __int16 v62 = 2112;
        id v63 = v29;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "transmitting UDPLink %@interface address %@%@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        objc_super v36 = self->_doesDefaultDevicePreferInfraWiFi ? @"(prefer) " : &stru_10099BE78;
        BOOL v37 = v6 ? @"(reply) " : &stru_10099BE78;
        int v54 = v37;
        unsigned int v55 = v29;
        double v53 = *(double *)&v36;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          if (self->_doesDefaultDevicePreferInfraWiFi) {
            CFStringRef v38 = @"(prefer) ";
          }
          else {
            CFStringRef v38 = &stru_10099BE78;
          }
          int v54 = v37;
          unsigned int v55 = v29;
          double v53 = *(double *)&v38;
          _IDSLogV();
        }
      }
      if (v6) {
        unsigned int v39 = 70;
      }
      else {
        unsigned int v39 = 69;
      }
      if (v6) {
        unsigned int v40 = 66;
      }
      else {
        unsigned int v40 = 64;
      }
      if (self->_doesDefaultDevicePreferInfraWiFi) {
        uint64_t v41 = v39;
      }
      else {
        uint64_t v41 = v40;
      }
      uint64_t v42 = (uint64_t)objc_msgSend(v29, "getTransmittableBytes:withPrefixByte:", *v32, v41, *(void *)&v53, v54, v55);
    }
    else
    {
      if (!self->_isDefaultDeviceUsingBTLink)
      {
        dispatch_time_t v52 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "cannot send LinkDown when BT is not used - bail out", buf, 2u);
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
        if (!v6) {
          self->_double addressRetransmissionInterval = 0.0;
        }
        goto LABEL_101;
      }
      char v43 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v44 = &stru_10099BE78;
        if (v6) {
          CFStringRef v44 = @"(reply)";
        }
        *(_DWORD *)buf = 138412290;
        double v59 = *(double *)&v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "transmitting UDPLink interface down%@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        unsigned __int8 v45 = v6 ? @"(reply)" : &stru_10099BE78;
        double v53 = *(double *)&v45;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          double v53 = *(double *)&v45;
          _IDSLogV();
        }
      }
      if (v6) {
        char v46 = 67;
      }
      else {
        char v46 = 65;
      }
      *(unsigned char *)void *v32 = v46;
      uint64_t v42 = 1;
    }
    v32[2] = v42;
    unint64_t v47 = -[IDSLinkManager sendPacketBuffer:toDeviceUniqueID:cbuuid:](self, "sendPacketBuffer:toDeviceUniqueID:cbuuid:", v32, 0, v12, *(void *)&v53);
    if (v47 == 13 || v47 == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained link:self hasSpaceAvailable:0 deviceUniqueID:0 cbuuid:v12];
    }
    if (v6)
    {
LABEL_101:

      goto LABEL_109;
    }
    double addressRetransmissionInterval = self->_addressRetransmissionInterval;
    double v50 = 1.0;
    if (addressRetransmissionInterval != 0.0)
    {
      if (addressRetransmissionInterval >= 4.0)
      {
LABEL_100:
        id v56 = v10;
        id v57 = v12;
        IDSTransportThreadAddBlockAfter();

        goto LABEL_101;
      }
      double v50 = addressRetransmissionInterval + addressRetransmissionInterval;
    }
    self->_double addressRetransmissionInterval = v50;
    goto LABEL_100;
  }
  [v10 setLastDestinationSent:v15];
  if (self->_addressRetransmissionInterval <= 0.0) {
    goto LABEL_46;
  }
  CFStringRef v26 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    double v27 = self->_addressRetransmissionInterval;
    *(_DWORD *)buf = 134217984;
    double v59 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "retransmission already scheduled with %.1fs - resetting it to 1s next time", buf, 0xCu);
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
  self->_double addressRetransmissionInterval = 0.5;
LABEL_109:
}

- (void)_createWiFiAssociationPowerAssertion:(double)a3
{
  if (self->_isCentral)
  {
    id v5 = [objc_alloc((Class)CUTPowerAssertion) initWithIdentifier:@"IDSLinkManagerWiFiPowerAssertion" timeout:a3];
    id WiFiPowerAssertion = self->_WiFiPowerAssertion;
    self->_id WiFiPowerAssertion = v5;

    BOOL v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = self->_WiFiPowerAssertion;
      *(_DWORD *)buf = 134218240;
      id v10 = v8;
      __int16 v11 = 1024;
      int v12 = (int)a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Created new power assertion %p for WiFi association with timeout %d.", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
}

- (void)_clearWiFiAssociationPowerAssertion
{
  if (self->_isCentral && self->_WiFiPowerAssertion)
  {
    id v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id WiFiPowerAssertion = self->_WiFiPowerAssertion;
      *(_DWORD *)buf = 134217984;
      id v7 = WiFiPowerAssertion;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing power assertion %p for WiFi association", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    id v5 = self->_WiFiPowerAssertion;
    self->_id WiFiPowerAssertion = 0;
  }
}

- (void)_handleWiFiAutoJoinStatusChange:(int64_t)a3 WiFiSSID:(id)a4
{
  id v18 = a4;
  self->_int64_t currentWiFiAutoJoinStatus = a3;
  if ((unint64_t)(a3 - 3) > 1)
  {
    self->_isWiFiAssociated = 0;
    if (unint64_t)(a3 - 1) < 0xA && ((0x213u >> (a3 - 1)))
    {
      char v9 = 1;
      goto LABEL_11;
    }
    if (self->_isWiFiBroughtUp) {
      [(IDSLinkManager *)self _clearWiFiAssociationPowerAssertion];
    }
    WiFiAssociationFailureHandler = (void (**)(void))self->_WiFiAssociationFailureHandler;
    if (WiFiAssociationFailureHandler)
    {
      WiFiAssociationFailureHandler[2]();
      id v8 = self->_WiFiAssociationFailureHandler;
      self->_WiFiAssociationFailureHandler = 0;
    }
  }
  else
  {
    self->_isWiFiAssociated = 1;
    if (self->_isWiFiBroughtUp) {
      [(IDSLinkManager *)self _clearWiFiAssociationPowerAssertion];
    }
  }
  char v9 = 0;
LABEL_11:
  objc_storeStrong((id *)&self->_currentWiFiSSID, a4);
  if (self->_isCentral)
  {
    char v10 = self->_isWiFiBroughtUp ? v9 : 1;
    if ((v10 & 1) == 0 && self->_WiFiAssociationStartTime > 0.0)
    {
      BOOL v11 = !self->_doesDefaultDevicePreferInfraWiFi;
      ids_monotonic_time();
      unint64_t v13 = (unint64_t)(v12 - self->_WiFiAssociationStartTime);
      int64_t currentWiFiAutoJoinStatus = self->_currentWiFiAutoJoinStatus;
      id v15 = [objc_alloc((Class)IDSWiFiSetupAttemptMetric) initWithAttemptType:v11 msDuration:v13 result:currentWiFiAutoJoinStatus client:@"IDSLinkManager_WiFi"];
      double v16 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v16 logMetric:v15];

      double v17 = +[IDSAWDLogging sharedInstance];
      [v17 wifiSetupAttemptType:v11 duration:v13 result:currentWiFiAutoJoinStatus client:@"IDSLinkManager_WiFi"];

      self->_WiFiAssociationStartTime = 0.0;
    }
  }
}

- (BOOL)_startUDPLinkHandshakeForDefaultDevice:(BOOL)a3 immediately:(BOOL)a4
{
  if (!self->_requireBT)
  {
    BOOL v6 = a4;
    BOOL v7 = a3;
    char v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"NO";
      if (v7) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      BOOL mayBringUpWiFi = self->_mayBringUpWiFi;
      if (v6) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      CFStringRef v51 = v11;
      __int16 v52 = 2112;
      CFStringRef v53 = v13;
      if (mayBringUpWiFi) {
        CFStringRef v10 = @"YES";
      }
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_startUDPLinkHandshakeForDefaultDevice wantsWiFi %@ immediately %@ mayBringUpWiFi %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v14 = v7 ? @"YES" : @"NO";
      id v15 = v6 ? @"YES" : @"NO";
      double v16 = self->_mayBringUpWiFi ? @"YES" : @"NO";
      CFStringRef v38 = v15;
      uint64_t v39 = (uint64_t)v16;
      BOOL v37 = v14;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        if (self->_mayBringUpWiFi) {
          CFStringRef v17 = @"YES";
        }
        else {
          CFStringRef v17 = @"NO";
        }
        CFStringRef v38 = v15;
        uint64_t v39 = (uint64_t)v17;
        BOOL v37 = v14;
        _IDSLogV();
      }
    }
    if (v7)
    {
      if (self->_isCentral)
      {
        if (!self->_mayBringUpWiFi)
        {
          id v18 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "_startUDPLinkHandshakeForDefaultDevice Central: wantsWiFi is YES but mayBringUpWiFi is NO - skip!", buf, 2u);
          }

          int v5 = os_log_shim_legacy_logging_enabled();
          if (v5)
          {
            int v5 = _IDSShouldLogTransport();
            if (v5)
            {
              _IDSLogTransport();
              int v5 = _IDSShouldLog();
              if (v5) {
                goto LABEL_103;
              }
            }
          }
          return v5;
        }
      }
      else if (!self->_localWiFiAddressUsedForDefaultDevice)
      {
        CFStringRef v35 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "_startUDPLinkHandshakeForDefaultDevice !Central: wantsWiFi is YES but localWiFi has no IP - skip!", buf, 2u);
        }

        int v5 = os_log_shim_legacy_logging_enabled();
        if (v5)
        {
          int v5 = _IDSShouldLogTransport();
          if (v5)
          {
            _IDSLogTransport();
            int v5 = _IDSShouldLog();
            if (v5) {
              goto LABEL_103;
            }
          }
        }
        return v5;
      }
      double v19 = [(id)IMWeakLinkClass() sharedInstance];
      unsigned __int8 v20 = [v19 isWiFiEnabled];

      if ((v20 & 1) == 0)
      {
        v33 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "wantsWiFi = YES but isWiFiEnabled = NO - not enabling WoW/AutoAssociation", buf, 2u);
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
        if (self->_doesDefaultDevicePreferInfraWiFi)
        {
          CFStringRef v34 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "preferInfraWiFi was requested - reject it", buf, 2u);
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
          unsigned __int8 v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          unint64_t v47 = sub_10024FC50;
          v48 = &unk_10097FE58;
          v49 = self;
          IDSTransportThreadAddBlock();
        }
        goto LABEL_96;
      }
    }
    int v21 = !v7 || v6;
    if (self->_isCentral) {
      int v22 = v7;
    }
    else {
      int v22 = !v7 || v6;
    }
    if (v7 && self->_isWiFiBroughtUp) {
      int v21 = 1;
    }
    unsigned int v23 = self->_handshakeCounter + 1;
    self->_handshakeCounter = v23;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10024FD0C;
    v41[3] = &unk_100986F40;
    v41[4] = self;
    unsigned int v42 = v23;
    BOOL v43 = v7;
    char v44 = v22;
    id v24 = objc_retainBlock(v41);
    if (v21)
    {
      double v25 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v26 = @"down";
        if (v7) {
          CFStringRef v26 = @"up";
        }
        CFStringRef v27 = &stru_10099BE78;
        if (!v22) {
          CFStringRef v27 = @"don't ";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v51 = v26;
        __int16 v52 = 2112;
        CFStringRef v53 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "_startUDPLinkHandshakeForDefaultDevice bring %@ WiFi, %@send handshake now", buf, 0x16u);
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
      ((void (*)(void *, void))v24[2])(v24, 0);
    }
    else
    {
      id v28 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v29 = @"down";
        if (v7) {
          CFStringRef v29 = @"up";
        }
        *(_DWORD *)buf = 138412802;
        CFStringRef v51 = v29;
        if (v22) {
          CFStringRef v30 = &stru_10099BE78;
        }
        else {
          CFStringRef v30 = @"don't ";
        }
        __int16 v52 = 2112;
        CFStringRef v53 = v30;
        __int16 v54 = 2048;
        uint64_t v55 = 0x4024000000000000;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "_startUDPLinkHandshakeForDefaultDevice bring %@ WiFi, %@send handshake in %.1f seconds", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        int64_t v31 = v7 ? @"up" : @"down";
        id v32 = v22 ? &stru_10099BE78 : @"don't ";
        CFStringRef v38 = v32;
        uint64_t v39 = 0x4024000000000000;
        BOOL v37 = v31;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          CFStringRef v38 = v32;
          uint64_t v39 = 0x4024000000000000;
          BOOL v37 = v31;
          _IDSLogV();
        }
      }
      -[IDSLinkManager _createWiFiAssociationPowerAssertion:](self, "_createWiFiAssociationPowerAssertion:", 10.0, v37, v38, v39);
      unsigned int v40 = v24;
      IDSTransportThreadAddBlockAfter();
    }
    LOBYTE(v5) = 1;
    return v5;
  }
  CFStringRef v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LinkManager requires BT, skip WiFi handshake.", buf, 2u);
  }

  int v5 = os_log_shim_legacy_logging_enabled();
  if (v5)
  {
    int v5 = _IDSShouldLogTransport();
    if (v5)
    {
      _IDSLogTransport();
      int v5 = _IDSShouldLog();
      if (v5)
      {
LABEL_103:
        _IDSLogV();
LABEL_96:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (void)_processLinkChangeForDefaultDeviceFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();
  objc_opt_class();
  int v10 = objc_opt_isKindOfClass();
  CFStringRef v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v33 = (unint64_t)v6;
    __int16 v34 = 2112;
    unint64_t v35 = (unint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "process link change for default paired device (oldLink:%@, newLink:%@).", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v30 = v6;
      id v31 = v7;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v30 = v6;
        id v31 = v7;
        _IDSLogV();
      }
    }
  }
  uint64_t v12 = v9 & 1;
  char v13 = isKindOfClass ^ v9 & 1;
  if (v13) {
    self->_isDefaultDeviceUsingBTLink = v9 & 1;
  }
  if (v7)
  {
    uint64_t v14 = kIDSDefaultPairedDeviceID;
    CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToCurrentLink, kIDSDefaultPairedDeviceID, v7);
    if ((v12 | v10))
    {
      [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:v12 isCloudConnected:v10 & 1];
      if ((v13 & 1) == 0) {
        goto LABEL_24;
      }
      int v15 = 0;
      goto LABEL_18;
    }
    if (!self->_isCentral && self->_doesDefaultDevicePreferInfraWiFi) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v14 = kIDSDefaultPairedDeviceID;
    if (kIDSDefaultPairedDeviceID)
    {
      deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
      if (deviceIDToCurrentLink) {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)deviceIDToCurrentLink, kIDSDefaultPairedDeviceID);
      }
    }
  }
  int v15 = 1;
  BOOL v17 = 1;
  if ((v13 & 1) == 0)
  {
LABEL_23:
    self->_hasDelayedNoConnectivityNotification = v17;
    -[IDSLinkManager _connectivityChangedForDefaultDevice:isCloudConnected:](self, "_connectivityChangedForDefaultDevice:isCloudConnected:", 0, self->_lastSentDefaultDeviceCloudConnectivity, v30, v31);
    goto LABEL_24;
  }
LABEL_18:
  id v18 = IMGetDomainValueForKey();
  double v19 = v18;
  if (v18 && [v18 BOOLValue] && !self->_doesDefaultDevicePreferInfraWiFi)
  {
    CFStringRef v29 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Skip wifi handshake due to disabled range extension via defaults.", buf, 2u);
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
    BOOL v17 = 0;
  }
  else
  {
    BOOL v17 = -[IDSLinkManager _startUDPLinkHandshakeForDefaultDevice:immediately:](self, "_startUDPLinkHandshakeForDefaultDevice:immediately:", isKindOfClass & 1, self->_doesDefaultDevicePreferInfraWiFi, v30, v31);
  }

  if (v15) {
    goto LABEL_23;
  }
LABEL_24:
  if (v12)
  {
    unint64_t v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v20 = 2;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unint64_t v20 = (unint64_t)[v7 defaultLinkType];
      }
      else {
        unint64_t v20 = 0;
      }
    }
  }
  if (self->_currentDefaultDeviceLinkType != v20)
  {
    uint64_t v21 = [v7 linkTypeString];
    if (v21) {
      int v22 = (__CFString *)v21;
    }
    else {
      int v22 = @"NoLink";
    }
    unsigned int v23 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t currentDefaultDeviceLinkType = self->_currentDefaultDeviceLinkType;
      *(_DWORD *)buf = 134218498;
      unint64_t v33 = currentDefaultDeviceLinkType;
      __int16 v34 = 2048;
      unint64_t v35 = v20;
      __int16 v36 = 2112;
      BOOL v37 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Link type changed from %lu to %lu, current link: %@", buf, 0x20u);
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
    self->_unint64_t currentDefaultDeviceLinkType = v20;
    if (v20 == 1)
    {
      [(IDSLinkManager *)self disconnectGlobalLinkForDevice:v14 isReinitiating:0 completionHandler:0];
      [(IDSLinkManager *)self _clearWiFiAssociationPowerAssertion];
      [(IDSLinkManager *)self _bringUpWiFi:0];
    }
    id v25 = objc_alloc((Class)NSDictionary);
    CFStringRef v26 = +[NSNumber numberWithUnsignedInteger:self->_currentDefaultDeviceLinkType];
    id v27 = objc_msgSend(v25, "initWithObjectsAndKeys:", v26, @"IDSLinkType", 0);

    IDSPowerLogDictionary();
    if (v20 == 2 && self->_doesDefaultDevicePreferInfraWiFi) {
      [(IDSLinkManager *)self _subscribeToWRMForLinkRecommendation:0];
    }
    else {
      [(IDSLinkManager *)self _unsubscribeFromWRMForLinkRecommendation];
    }
    id v28 = +[IDSWRMExchange sharedInstance];
    objc_msgSend(v28, "handleActiveLinkChange:", -[IDSLinkManager _getWRMLinkTypeFromIDSLinkType:](self, "_getWRMLinkTypeFromIDSLinkType:", self->_currentDefaultDeviceLinkType));
  }
}

- (id)_selectBestLink:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = [v3 allValues];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    unint64_t v9 = 255;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 state] == (id)4 && (unint64_t)objc_msgSend(v11, "headerOverhead") < v9)
        {
          unint64_t v9 = (unint64_t)[v11 headerOverhead];
          id v12 = v11;

          id v7 = v12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_setBestLinkToCurrent:(id)a3
{
  CFStringRef v4 = (NSMutableDictionary *)a3;
  Value = 0;
  if (v4 && self->_deviceIDToCurrentLink) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, v4);
  }
  id v6 = Value;
  id v7 = 0;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    unint64_t v9 = 0;
    if (cbuuidToLinks)
    {
      id v7 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      if (v7)
      {
        unint64_t v9 = [(IDSLinkManager *)self _selectBestLink:v7];
      }
      else
      {
        unint64_t v9 = 0;
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  int v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = self->_cbuuidToLinks;
    deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
    *(_DWORD *)buf = 138413314;
    id v30 = v4;
    __int16 v31 = 2112;
    id v32 = deviceIDToCurrentLink;
    __int16 v33 = 2112;
    __int16 v34 = v12;
    __int16 v35 = 2112;
    __int16 v36 = v6;
    __int16 v37 = 2112;
    CFStringRef v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_setBestLinkToCurrent cbuuid %@ _deviceIDToCurrentLink %@ _cbuuidToLinks %@ oldlink %@ newlink %@", buf, 0x34u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v27 = v6;
    id v28 = v9;
    id v25 = self->_deviceIDToCurrentLink;
    CFStringRef v26 = self->_cbuuidToLinks;
    unsigned int v23 = v4;
    _IDSLogV();
  }
  if (v9 != v6)
  {
    char v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [(NSMutableDictionary *)v9 deviceUniqueID];
      *(_DWORD *)buf = 138413058;
      id v30 = v6;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2112;
      __int16 v34 = v4;
      __int16 v35 = 2112;
      __int16 v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "set current link from %@ to %@ for cbuuid %@ deviceUniqueID %@", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        [(NSMutableDictionary *)v9 deviceUniqueID];
        v27 = CFStringRef v26 = v4;
        unsigned int v23 = v6;
        id v25 = v9;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          [(NSMutableDictionary *)v9 deviceUniqueID];
          v27 = CFStringRef v26 = v4;
          unsigned int v23 = v6;
          id v25 = v9;
          _IDSLogV();
        }
      }
    }
    if (-[NSMutableDictionary isEqualToString:](v4, "isEqualToString:", kIDSDefaultPairedDeviceID, v23, v25, v26, v27, v28)&& !self->_hasFixedDestination)
    {
      [(IDSLinkManager *)self _processLinkChangeForDefaultDeviceFrom:v6 to:v9];
      goto LABEL_52;
    }
    if (v9)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToCurrentLink, v4, v9);
      if (self->_hasFixedDestination)
      {
        [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:1 isCloudConnected:0];
        goto LABEL_52;
      }
      long long v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "sending UTunController didConnectForDevice %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v24 = v4;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v24 = v4;
            _IDSLogV();
          }
        }
      }
      long long v17 = [(NSMutableDictionary *)v9 alternateDelegate];
      id v18 = v17;
      if (v17)
      {
        [v17 link:self didConnectForDeviceUniqueID:0 cbuuid:v4];
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained link:self didConnectForDeviceUniqueID:0 cbuuid:v4];
      }
    }
    else
    {
      if (v4)
      {
        long long v15 = self->_deviceIDToCurrentLink;
        if (v15) {
          CFDictionaryRemoveValue((CFMutableDictionaryRef)v15, v4);
        }
      }
      if (self->_hasFixedDestination)
      {
        [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:0 isCloudConnected:0];
        goto LABEL_52;
      }
      double v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v4;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "sending UTunController didDisconnectForDevice %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v24 = v4;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v24 = v4;
            _IDSLogV();
          }
        }
      }
      unint64_t v20 = [(NSMutableDictionary *)v6 alternateDelegate];
      id v18 = v20;
      if (v20)
      {
        [v20 link:self didDisconnectForDeviceUniqueID:0 cbuuid:v4];
      }
      else
      {
        id v22 = objc_loadWeakRetained((id *)&self->_delegate);
        [v22 link:self didDisconnectForDeviceUniqueID:0 cbuuid:v4];
      }
    }
  }
LABEL_52:
}

- (id)_newUDPLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 IPVersion:(unint64_t)a5 port:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  id v10 = a3;
  CFStringRef v11 = (__CFString *)a4;
  id v12 = 0;
  char v13 = 1;
  if (v11)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    if (cbuuidToLinks)
    {
      long long v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v11);
      id v12 = v15;
      if (v15)
      {
        long long v16 = (id)CFDictionaryGetValue((CFDictionaryRef)v15, @"IDSLinkLocalUDPKey");
        if (v16)
        {
          long long v17 = v16;
          goto LABEL_28;
        }
        char v13 = 0;
      }
    }
  }
  id v18 = (NSMutableDictionary *)[objc_alloc((Class)IDSUDPLink) initWithDeviceUniqueID:v10 cbuuid:v11];
  [(NSMutableDictionary *)v18 setDelegate:self];
  if (v13)
  {
    id v12 = +[NSMutableDictionary dictionaryWithObject:v18 forKey:@"IDSLinkLocalUDPKey"];
    if (v12)
    {
      double v19 = self->_cbuuidToLinks;
      CFStringRef v20 = v11;
      uint64_t v21 = v12;
LABEL_12:
      CFDictionarySetValue((CFMutableDictionaryRef)v19, v20, v21);
    }
  }
  else if (v18)
  {
    CFStringRef v20 = @"IDSLinkLocalUDPKey";
    double v19 = v12;
    uint64_t v21 = v18;
    goto LABEL_12;
  }
  [(NSMutableDictionary *)v18 setPort:v6];
  [(NSMutableDictionary *)v18 setAllowsLinkLocal:self->_hasFixedDestination];
  id v22 = [(NSMutableDictionary *)v18 newSocketWithIPVersion:a5 wantsAWDL:0 wantsWiFi:1 wantsCellular:0];
  unsigned int v23 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    [(NSMutableDictionary *)v18 state];
    if ((unint64_t)[(NSMutableDictionary *)v18 state] > 6) {
      id v24 = "UnexpectedState";
    }
    else {
      id v24 = (const char *)_IDSLinkStateStrings[(void)[(NSMutableDictionary *)v18 state]];
    }
    *(_DWORD *)buf = 138412802;
    CFStringRef v29 = v18;
    __int16 v30 = 2080;
    __int16 v31 = v24;
    __int16 v32 = 2048;
    id v33 = [v22 count];
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "created new UDPLink %@ state %s with %lu interfaces", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    [(NSMutableDictionary *)v18 state];
    id v25 = (unint64_t)[(NSMutableDictionary *)v18 state] > 6
        ? "UnexpectedState"
        : (char *)_IDSLinkStateStrings[(void)[(NSMutableDictionary *)v18 state]];
    id v27 = [v22 count];
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      [(NSMutableDictionary *)v18 state];
      if ((unint64_t)[(NSMutableDictionary *)v18 state] <= 6) {
        [(NSMutableDictionary *)v18 state];
      }
      [v22 count];
      _IDSLogV();
    }
  }
  long long v17 = v18;

LABEL_28:
  return v17;
}

- (id)_newUDPGlobalLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v8 = 0;
  char v9 = 1;
  if (v7)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    if (cbuuidToLinks)
    {
      CFStringRef v11 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v7);
      uint64_t v8 = v11;
      if (v11)
      {
        id v12 = (id)CFDictionaryGetValue((CFDictionaryRef)v11, @"IDSLinkGlobalUDPKey");
        if (v12)
        {
          char v13 = v12;
          goto LABEL_23;
        }
        char v9 = 0;
      }
    }
  }
  char v13 = [[IDSUDPGlobalLink alloc] initWithDeviceUniqueID:v6 cbuuid:v7];
  [(IDSUDPGlobalLink *)v13 setDelegate:self];
  if (v9)
  {
    uint64_t v8 = +[NSMutableDictionary dictionaryWithObject:v13 forKey:@"IDSLinkGlobalUDPKey"];
    if (v8)
    {
      long long v14 = self->_cbuuidToLinks;
      CFStringRef v15 = v7;
      long long v16 = (IDSUDPGlobalLink *)v8;
LABEL_12:
      CFDictionarySetValue((CFMutableDictionaryRef)v14, v15, v16);
    }
  }
  else if (v13)
  {
    CFStringRef v15 = @"IDSLinkGlobalUDPKey";
    long long v14 = v8;
    long long v16 = v13;
    goto LABEL_12;
  }
  long long v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    [(IDSUDPGlobalLink *)v13 state];
    if ([(IDSUDPGlobalLink *)v13 state] > 6) {
      id v18 = "UnexpectedState";
    }
    else {
      id v18 = (const char *)_IDSLinkStateStrings[[(IDSUDPGlobalLink *)v13 state]];
    }
    *(_DWORD *)buf = 138412546;
    id v22 = v13;
    __int16 v23 = 2080;
    id v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "created new UDPGlobalLink %@ state %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [(IDSUDPGlobalLink *)v13 state];
    if ([(IDSUDPGlobalLink *)v13 state] <= 6) {
      [(IDSUDPGlobalLink *)v13 state];
    }
    _IDSLogV();
  }
LABEL_23:
  double v19 = v13;

  return v19;
}

- (id)_newGlobalLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_hasFixedDestination)
  {
    id v11 = 0;
  }
  else
  {
    Value = 0;
    if (v9 && self->_sessionIDToPluginNameToPluginOptionsDict) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_sessionIDToPluginNameToPluginOptionsDict, v9);
    }
    id v13 = Value;
    long long v14 = 0;
    if (v9 && self->_sessionIDToSharedSessionHasJoined) {
      long long v14 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_sessionIDToSharedSessionHasJoined, v9);
    }
    id v15 = [v14 BOOLValue];
    long long v16 = 0;
    if (v9 && self->_sessionIDToCellInterfaceName) {
      long long v16 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_sessionIDToCellInterfaceName, v9);
    }
    id v42 = v16;
    long long v17 = 0;
    if (v9 && self->_sessionIDToIDSContextBlob) {
      long long v17 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_sessionIDToIDSContextBlob, v9);
    }
    id v43 = v17;
    id v18 = 0;
    LOBYTE(v19) = 1;
    if (v9
      && (cbuuidToLinks = self->_cbuuidToLinks) != 0
      && (uint64_t v21 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9),
          (id v18 = v21) != 0)
      && (v22 = (id)CFDictionaryGetValue((CFDictionaryRef)v21, @"IDSLinkGlobalKey"), (double v19 = v22) != 0))
    {
      if (self->_timeBase) {
        objc_msgSend(v22, "setTimeBase:");
      }
      if (self->_isReliableUnicastSession) {
        [v19 setIsReliableUnicastSession:1 isClient:self->_isReliableUnicastClient];
      }
      if (v13) {
        [v19 setPluginCache:v13];
      }
      [v19 setSharedSessionHasJoined:v15];
      [v19 setCellInterfaceName:v42];
      [v19 setIDSContextBlob:v43];
      id v11 = v19;
    }
    else
    {
      id v23 = objc_msgSend(objc_alloc((Class)+[IDSGlobalLink getGLClassWithOptions:](IDSGlobalLink, "getGLClassWithOptions:", v10)), "initWithDeviceUniqueID:cbuuid:", v8, v9);
      [v23 setCellInterfaceName:v42];
      [v23 setIDSContextBlob:v43];
      [v23 setSharedSessionHasJoined:v15];
      [v23 setDelegate:self];
      [v23 setIsReliableUnicastSession:self->_isReliableUnicastSession isClient:self->_isReliableUnicastClient];
      if (v13) {
        [v23 setPluginCache:v13];
      }
      CFMutableDictionaryRef Mutable = (__CFDictionary *)[v10 mutableCopy];
      if (!Mutable) {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      if ([v9 isEqualToString:kIDSDefaultPairedDeviceID]) {
        CFDictionarySetValue(Mutable, IDSGlobalLinkOptionForceRelayKey, &__kCFBooleanTrue);
      }
      timeBase = self->_timeBase;
      if (timeBase) {
        CFDictionarySetValue(Mutable, IDSGlobalLinkOptionTimeBaseKey, timeBase);
      }
      id v26 = [objc_alloc((Class)IDSGlobalLinkBlocks) initWithBlocks:&stru_100986FA8 qraAWDBlock:&stru_100986FE8 qraCONBlock:&stru_100987028 qraDISBlock:&stru_100987048];
      if (v26)
      {
        CFDictionarySetValue(Mutable, IDSGlobalLinkOptionQRABlockKey, v26);
      }
      else
      {
        BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v27) {
          sub_10071B4B4(v27, v28, v29, v30, v31, v32, v33, v34);
        }
      }

      [v23 startWithOptions:Mutable];
      if (v19)
      {
        id v18 = +[NSMutableDictionary dictionaryWithObject:v23 forKey:@"IDSLinkGlobalKey"];
        if (v18) {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_cbuuidToLinks, v9, v18);
        }
      }
      else if (v23)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v18, @"IDSLinkGlobalKey", v23);
      }
      __int16 v35 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        [v23 state];
        if ((unint64_t)[v23 state] > 6) {
          __int16 v36 = "UnexpectedState";
        }
        else {
          __int16 v36 = (const char *)_IDSLinkStateStrings[(void)[v23 state]];
        }
        *(_DWORD *)buf = 138412802;
        id v45 = v23;
        __int16 v46 = 2112;
        id v47 = v9;
        __int16 v48 = 2080;
        v49 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "created new GlobalLink %@ for session %@ (=> cbuuid), state %s.", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        [v23 state];
        if ((unint64_t)[v23 state] > 6) {
          __int16 v37 = "UnexpectedState";
        }
        else {
          __int16 v37 = (const char *)_IDSLinkStateStrings[(void)[v23 state]];
        }
        id v40 = v9;
        uint64_t v41 = v37;
        id v39 = v23;
        _IDSLogV();
      }
      -[IDSLinkManager _startNetworkInterfaceListener:](self, "_startNetworkInterfaceListener:", 1, v39, v40, v41);
      [(IDSLinkManager *)self _startCellularDataStatusListener:1];
      id v11 = v23;
    }
  }

  return v11;
}

- (void)_bringUpWiFi:(BOOL)a3
{
  if (a3)
  {
    if (self->_shouldBringWiFiDown)
    {
      CFStringRef v4 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "resetting _shouldBringWiFiDown to NO", buf, 2u);
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
      self->_shouldBringWiFiDown = 0;
    }
    if (!self->_isWiFiBroughtUp)
    {
      id v5 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "enable AutoAssociation and WoW now", buf, 2u);
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
      *(_WORD *)&self->_isWiFiBroughtUp = 1;
      if (self->_isCentral && self->_wifiDevice && !self->_isWiFiAssociated)
      {
        ids_monotonic_time();
        self->_WiFiAssociationStartTime = v6;
      }
      id v7 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100252E24;
      block[3] = &unk_10097E4D0;
      void block[4] = self;
      dispatch_async(v7, block);
    }
  }
  else if (self->_isWiFiBroughtUp)
  {
    deviceIDToGlobalLinkUp = self->_deviceIDToGlobalLinkUp;
    id v9 = (const void *)kIDSDefaultPairedDeviceID;
    if (deviceIDToGlobalLinkUp) {
      BOOL v10 = kIDSDefaultPairedDeviceID == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      Value = 0;
    }
    else {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)deviceIDToGlobalLinkUp, kIDSDefaultPairedDeviceID);
    }
    unsigned int v12 = [Value BOOLValue];
    if (self->_isDefaultDeviceOnPhoneCall)
    {
      id v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deferring disabling AutoAssociation and WoW because we are on a phone call", buf, 2u);
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
      self->_shouldBringWiFiDown = 1;
    }
    else if (v12)
    {
      if (self->_currentDefaultDeviceLinkType == 1)
      {
        long long v14 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deferring disabling AutoAssociation and WoW, wait for GlobalLink disconnect.", buf, 2u);
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
        [(IDSLinkManager *)self disconnectGlobalLinkForDevice:v9 isReinitiating:0 completionHandler:0];
      }
      else
      {
        CFStringRef v20 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t currentDefaultDeviceLinkType = self->_currentDefaultDeviceLinkType;
          *(_DWORD *)buf = 67109120;
          int v26 = currentDefaultDeviceLinkType;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Deferring disabling AutoAssociation and WoW, current linkType:%d.", buf, 8u);
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
    else
    {
      id v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Disable AutoAssociation and WoW now", buf, 2u);
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
      *(_WORD *)&self->_isWiFiBroughtUp = 0;
      if (self->_isCentral)
      {
        long long v16 = 0;
        self->_WiFiAssociationStartTime = 0.0;
        cbuuidToLinks = self->_cbuuidToLinks;
        if (cbuuidToLinks)
        {
          id v18 = 0;
          if (v9)
          {
            double v19 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9);
            long long v16 = v19;
            if (v19)
            {
              id v18 = (id)CFDictionaryGetValue((CFDictionaryRef)v19, @"IDSLinkLocalUDPKey");
              if (v18) {
                [v16 removeObjectForKey:@"IDSLinkLocalUDPKey"];
              }
            }
            else
            {
              id v18 = 0;
            }
          }
        }
        else
        {
          id v18 = 0;
        }
      }
      id v22 = im_primary_queue();
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100252EB4;
      v23[3] = &unk_10097E4D0;
      v23[4] = self;
      dispatch_async(v22, v23);
    }
  }
}

- (void)_removeLinkForDeviceID:(id)a3 linkKey:(id)a4 verifyWithLink:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (__CFString *)a5;
  id v11 = 0;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v13 = 0;
    if (cbuuidToLinks)
    {
      long long v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      id v13 = v14;
      id v11 = 0;
      if (v9)
      {
        if (v14)
        {
          id v11 = (id)CFDictionaryGetValue(v14, v9);
          if (v11)
          {
            if (!v10 || [(__CFString *)v10 isEqual:v11])
            {
              id v15 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v16 = @"a BT/BTLE link";
                if (v10) {
                  CFStringRef v16 = v10;
                }
                *(_DWORD *)buf = 138412546;
                CFStringRef v18 = v16;
                __int16 v19 = 2112;
                id v20 = v8;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "removing %@ from links for device %@", buf, 0x16u);
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
              if (objc_opt_respondsToSelector()) {
                [v11 invalidate];
              }
              CFDictionaryRemoveValue(v13, v9);
              [(IDSLinkManager *)self _setBestLinkToCurrent:v8];
            }
          }
        }
      }
    }
  }
  else
  {
    id v13 = 0;
  }
}

- (void)_removeAllLinksForDeviceID:(id)a3
{
  id key = a3;
  if (key && (cbuuidToLinks = self->_cbuuidToLinks) != 0)
  {
    id v5 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, key);
    [v5 enumerateKeysAndObjectsUsingBlock:&stru_100987088];
  }
  else
  {
    [0 enumerateKeysAndObjectsUsingBlock:&stru_100987088];
    id v5 = 0;
    if (!key) {
      goto LABEL_7;
    }
  }
  double v6 = self->_cbuuidToLinks;
  if (v6) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)v6, key);
  }
LABEL_7:
  -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:");
}

- (BOOL)_hasGlobalLinkConnectingOrConnected
{
  id v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    *(_DWORD *)buf = 138412290;
    id v22 = cbuuidToLinks;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_hasGlobalLinkConnectingOrConnected: _cbuuidToLinks: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v15 = self->_cbuuidToLinks;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v15 = self->_cbuuidToLinks;
        _IDSLogV();
      }
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSMutableDictionary *)self->_cbuuidToLinks allValues];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        CFDictionaryRef v9 = *(const __CFDictionary **)(*((void *)&v16 + 1) + 8 * i);
        if (v9)
        {
          BOOL v10 = (id)CFDictionaryGetValue(v9, @"IDSLinkGlobalKey");
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (unint64_t)[(NSMutableDictionary *)v10 state] <= 4)
            {
              unsigned int v12 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v22 = v10;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ is still connecting or connected.", buf, 0xCu);
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

              BOOL v11 = 1;
              goto LABEL_28;
            }
          }
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_28:

  return v11;
}

- (void)_startNetworkInterfaceListener:(BOOL)a3
{
  dynamicStore = self->_dynamicStore;
  if (a3)
  {
    if (!dynamicStore)
    {
      context.version = 0;
      context.info = self;
      context.retain = (const void *(__cdecl *)(const void *))&_CFRetain;
      context.release = (void (__cdecl *)(const void *))&_CFRelease;
      context.copyDescription = 0;
      id v5 = SCDynamicStoreCreate(0, @"com.apple.idslinkmanager.networkinterfacelistener", (SCDynamicStoreCallBack)sub_100253814, &context);
      self->_dynamicStore = v5;
      if (v5)
      {
        int v6 = SCDynamicStoreSetNotificationKeys(v5, 0, (CFArrayRef)&off_1009D2CF8);
        uint64_t v7 = self->_dynamicStore;
        if (v6)
        {
          id v8 = im_primary_queue();
          SCDynamicStoreSetDispatchQueue(v7, v8);

          CFDictionaryRef v9 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)BOOL v11 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "network interface listener started", v11, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport();
              if (_IDSShouldLog()) {
LABEL_17:
              }
                _IDSLogV();
            }
          }
        }
        else
        {
          CFRelease(self->_dynamicStore);
          self->_dynamicStore = 0;
        }
      }
    }
  }
  else if (dynamicStore)
  {
    SCDynamicStoreSetDispatchQueue(dynamicStore, 0);
    CFRelease(self->_dynamicStore);
    self->_dynamicStore = 0;
    BOOL v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(context.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "network interface listener stopped", (uint8_t *)&context, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          goto LABEL_17;
        }
      }
    }
  }
}

- (void)_startCellularDataStatusListener:(BOOL)a3
{
  if (a3)
  {
    if (!self->_cellularDataStatusListenerStarted)
    {
      self->_cellularDataStatusListenerStarted = 1;
      CFStringRef v4 = +[IDSCellularLinkMonitor sharedInstance];
      [v4 addCellularLinkDelegate:self];

      id v5 = +[IDSCellularLinkMonitor sharedInstance];
      [v5 registerCellularDataStatusNotification:1];

      int v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cellular data status listener started", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
LABEL_13:
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
  }
  else if (self->_cellularDataStatusListenerStarted)
  {
    self->_cellularDataStatusListenerStarted = 0;
    uint64_t v7 = +[IDSCellularLinkMonitor sharedInstance];
    [v7 removeCellularLinkDelegate:self];

    id v8 = +[IDSCellularLinkMonitor sharedInstance];
    [v8 registerCellularDataStatusNotification:0];

    CFDictionaryRef v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "cellular data status listener stopped", v10, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport()) {
        goto LABEL_13;
      }
    }
  }
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3->var0) {
    int v10 = (*(unsigned __int8 *)a3->var0 >> 5) & 1;
  }
  else {
    int v10 = 0;
  }
  if (self->_isInternalInstall || self->_demoMode)
  {
    if (!self->_reporterTimer)
    {
      ids_monotonic_time();
      id v11 = -[IDSLinkManager generateLinkReport:forceReport:](self, "generateLinkReport:forceReport:", 0);
    }
    if (self->_hasFixedDestination)
    {
      int64_t var2 = a3->var2;
      if (!self->_deviceIDToUDPDestinations) {
        goto LABEL_30;
      }
      Value = 0;
      uint64_t v14 = kIDSDefaultPairedDeviceID;
      if (self->_deviceIDToCurrentLink && kIDSDefaultPairedDeviceID) {
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, kIDSDefaultPairedDeviceID);
      }
      id v15 = Value;
      if (v9)
      {
        deviceIDToUDPDestinations = self->_deviceIDToUDPDestinations;
        if (deviceIDToUDPDestinations)
        {
          long long v17 = (id)CFDictionaryGetValue((CFDictionaryRef)deviceIDToUDPDestinations, v9);
          if (v17)
          {
            long long v18 = v17;
            unint64_t v19 = (unint64_t)[v15 sendPacketBuffer:a3 destination:v17 toDeviceID:0];
            id v20 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              if (v19 > 0xF) {
                uint64_t v21 = "UnexpectedSendResult";
              }
              else {
                uint64_t v21 = (const char *)_IDSLinkSendResultStrings[v19];
              }
              *(_DWORD *)buf = 138412802;
              int64_t v62 = (int64_t)v15;
              __int16 v63 = 2048;
              *(void *)__int16 v64 = var2;
              *(_WORD *)&v64[8] = 2080;
              *(void *)&v64[10] = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sending a packet over %@ (%zdB) = %s", buf, 0x20u);
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

            goto LABEL_76;
          }
        }
      }
      unsigned __int8 v27 = [v9 isEqualToString:v14];

      if ((v27 & 1) == 0)
      {
LABEL_30:
        id v15 = 0;
        if (v9)
        {
          deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
          if (deviceIDToCurrentLink)
          {
            uint64_t v29 = (id)CFDictionaryGetValue((CFDictionaryRef)deviceIDToCurrentLink, v9);
            id v15 = v29;
            if (v29)
            {
              if ([v29 state] == (id)4)
              {
                unint64_t v19 = (unint64_t)[v15 sendPacketBuffer:a3 toDeviceUniqueID:v8 cbuuid:v9];
                uint64_t v30 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  if (v19 > 0xF) {
                    uint64_t v31 = "UnexpectedSendResult";
                  }
                  else {
                    uint64_t v31 = (const char *)_IDSLinkSendResultStrings[v19];
                  }
                  *(_DWORD *)buf = 138412802;
                  int64_t v62 = (int64_t)v15;
                  __int16 v63 = 2048;
                  *(void *)__int16 v64 = var2;
                  *(_WORD *)&v64[8] = 2080;
                  *(void *)&v64[10] = v31;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "sending a packet over %@ (%zdB) = %s", buf, 0x20u);
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
LABEL_76:

                if (v19 == 13 || !v19)
                {
                  int64x2_t v44 = vdupq_n_s64(1uLL);
                  v44.i64[0] = var2;
                  *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v44);
                  goto LABEL_128;
                }
                goto LABEL_39;
              }
            }
          }
        }
      }
      _IDSLinkPacketBufferRelease();
      unint64_t v19 = 6;
LABEL_39:
      ++self->_totalPacketsDropped;
      goto LABEL_128;
    }
  }
  if (!a3->var10) {
    goto LABEL_101;
  }
  unint64_t currentDefaultDeviceLinkType = self->_currentDefaultDeviceLinkType;
  if (currentDefaultDeviceLinkType - 3 > 1)
  {
    if (currentDefaultDeviceLinkType == 1)
    {
      if (!a3->var11) {
        goto LABEL_101;
      }
      id v39 = 0;
      if (v9)
      {
        cbuuidToLinks = self->_cbuuidToLinks;
        id v34 = 0;
        uint64_t v41 = 0;
        if (cbuuidToLinks)
        {
          id v42 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9);
          id v39 = v42;
          if (v42)
          {
            id v43 = (id)CFDictionaryGetValue((CFDictionaryRef)v42, @"IDSLinkBTDatagramKey");
            uint64_t v41 = v43;
            if (v43 && [v43 state] == (id)4)
            {
              id v34 = v41;
              uint64_t v41 = v34;
            }
            else
            {
              id v34 = 0;
            }
          }
          else
          {
            id v34 = 0;
            uint64_t v41 = 0;
          }
        }
      }
      else
      {
        id v34 = 0;
        uint64_t v41 = 0;
      }

      if (!v34) {
        goto LABEL_101;
      }
    }
    else
    {
      if (currentDefaultDeviceLinkType != 2 || !a3->var7) {
        goto LABEL_101;
      }
      uint64_t v32 = 0;
      if (v9)
      {
        uint64_t v33 = self->_cbuuidToLinks;
        id v34 = 0;
        __int16 v35 = 0;
        if (v33)
        {
          __int16 v36 = (id)CFDictionaryGetValue((CFDictionaryRef)v33, v9);
          uint64_t v32 = v36;
          if (v36)
          {
            __int16 v37 = (id)CFDictionaryGetValue((CFDictionaryRef)v36, @"IDSLinkGlobalKey");
            __int16 v35 = v37;
            if (v37 && [v37 state] == (id)4)
            {
              id v34 = v35;
              CFStringRef v38 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                int64_t v62 = (int64_t)v34;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "use %@ for cloud enabled packet.", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  id v58 = v34;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    id v58 = v34;
                    _IDSLogV();
                  }
                }
              }
              __int16 v35 = v34;
            }
            else
            {
              id v34 = 0;
            }
          }
          else
          {
            id v34 = 0;
            __int16 v35 = 0;
          }
        }
      }
      else
      {
        id v34 = 0;
        __int16 v35 = 0;
      }

      if (!v34) {
        goto LABEL_101;
      }
    }
    if (!a3->var8) {
      goto LABEL_94;
    }
    id v45 = 0;
    if (v9 && self->_deviceIDToCurrentLink) {
      id v45 = (id)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, v9);
    }
    if (v34 == v45)
    {
LABEL_94:
      id v47 = 0;
    }
    else
    {
      __int16 v46 = 0;
      if (v9 && self->_deviceIDToCurrentLink) {
        __int16 v46 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, v9);
      }
      id v47 = v46;
    }
    if (objc_msgSend(v34, "state", v58) == (id)4)
    {
      if (v47)
      {
        uint64_t v48 = _IDSLinkPacketBufferClone();
        char v49 = 0;
      }
      else
      {
        uint64_t v48 = 0;
        char v49 = 1;
      }
      goto LABEL_106;
    }
    goto LABEL_129;
  }
  if (a3->var7)
  {
LABEL_101:
    if (!v9
      || (double v50 = self->_deviceIDToCurrentLink) == 0
      || (CFStringRef v51 = (id)CFDictionaryGetValue((CFDictionaryRef)v50, v9)) == 0)
    {
      ++self->_totalPacketsDropped;
      __int16 v52 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v62 = (int64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "no current link for %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v58 = v9;
        _IDSLogV();
      }
      if ((objc_msgSend(v9, "isEqualToString:", kIDSDefaultPairedDeviceID, v58) & 1) == 0 && !a3->var7)
      {
        CFStringRef v53 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v62 = (int64_t)v9;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "No current link for %@ -- asking WiProx to connect.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v60 = v9;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              id v60 = v9;
              _IDSLogV();
            }
          }
        }
        __int16 v54 = +[IDSWPLinkManager sharedInstance];
        [v54 connectToPeer:v9];
      }
      id v47 = 0;
      id v34 = 0;
      goto LABEL_126;
    }
    id v34 = v51;
    id v47 = 0;
    if ([v51 state] == (id)4)
    {
      char v49 = 1;
      uint64_t v48 = 0;
LABEL_106:
      if (v10) {
        kdebug_trace();
      }
      unint64_t v19 = -[IDSLinkManager _sendPacketBuffer:toDeviceUniqueID:cbuuid:link:](self, "_sendPacketBuffer:toDeviceUniqueID:cbuuid:link:", a3, v8, v9, v34, v58);
      if (v49)
      {
        if (v48) {
          _IDSLinkPacketBufferRelease();
        }
      }
      else
      {
        id v57 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v62 = (int64_t)v47;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "use %@ for control message", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v59 = v47;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              id v59 = v47;
              _IDSLogV();
            }
          }
        }
        if (!-[IDSLinkManager _sendPacketBuffer:toDeviceUniqueID:cbuuid:link:](self, "_sendPacketBuffer:toDeviceUniqueID:cbuuid:link:", v48, v8, v9, v47, v59))unint64_t v19 = 0; {
      }
        }
      goto LABEL_127;
    }
LABEL_129:
    ++self->_totalPacketsDropped;
    id v56 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v62 = (int64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "dropped data for device %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    if (!a3->var7) {
      [(IDSLinkManager *)self startLinkForDeviceUniqueID:v8 cbuuid:v9];
    }
LABEL_126:
    _IDSLinkPacketBufferRelease();
    unint64_t v19 = 6;
LABEL_127:

    goto LABEL_128;
  }
  ++self->_totalPacketsDropped;
  id v23 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v24 = a3->var2;
    unint64_t v25 = self->_currentDefaultDeviceLinkType;
    unint64_t totalPacketsDropped = self->_totalPacketsDropped;
    *(_DWORD *)buf = 134218496;
    int64_t v62 = v24;
    __int16 v63 = 1024;
    *(_DWORD *)__int16 v64 = v25;
    *(_WORD *)&v64[4] = 2048;
    *(void *)&v64[6] = totalPacketsDropped;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "dropping a packet (%zdB) over link type (%d), #dropped: %llu.", buf, 0x1Cu);
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
  _IDSLinkPacketBufferRelease();
  unint64_t v19 = 6;
LABEL_128:

  return v19;
}

- (unint64_t)_sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5 link:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int64_t var2 = a3->var2;
  BOOL var10 = a3->var10;
  id v15 = [v12 sendPacketBuffer:a3 toDeviceUniqueID:v10 cbuuid:v11];
  unint64_t v16 = (unint64_t)v15;
  if (var10 && v15 != 0)
  {
    long long v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (v16 > 0xF) {
        unint64_t v19 = "UnexpectedSendResult";
      }
      else {
        unint64_t v19 = (const char *)_IDSLinkSendResultStrings[v16];
      }
      *(_DWORD *)buf = 138412802;
      id v23 = v12;
      __int16 v24 = 2048;
      int64_t v25 = var2;
      __int16 v26 = 2080;
      unsigned __int8 v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sending a packet over %@ (%zdB) = %s", buf, 0x20u);
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
  if (v16 != 13 && v16)
  {
    uint64_t v20 = 216;
  }
  else
  {
    self->_totalBytesSent += var2;
    uint64_t v20 = 192;
  }
  ++*(Class *)((char *)&self->super.isa + v20);

  return v16;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = 0;
  unint64_t v13 = 12;
  if (!v11)
  {
    id v15 = 0;
    goto LABEL_14;
  }
  cbuuidToLinks = self->_cbuuidToLinks;
  id v15 = 0;
  if (cbuuidToLinks)
  {
    unint64_t v16 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v11);
    id v12 = v16;
    if (v16)
    {
      long long v17 = (id)CFDictionaryGetValue((CFDictionaryRef)v16, @"IDSLinkGlobalKey");
      id v15 = v17;
      if (v17)
      {
        if ([v17 state] == (id)4)
        {
          id v18 = v15;
          id v15 = v18;
          if ((int)v7 < 1)
          {
            uint64_t v19 = 0;
          }
          else
          {
            uint64_t v19 = 0;
            uint64_t v20 = v7;
            uint64_t v21 = a3;
            do
            {
              uint64_t v22 = (uint64_t)*v21++;
              v19 += *(void *)(v22 + 16);
              --v20;
            }
            while (v20);
          }
          unint64_t v13 = (unint64_t)[v18 sendPacketBufferArray:a3 arraySize:v7 toDeviceUniqueID:v10 cbuuid:v11];
          if (v13)
          {
            uint64_t v26 = 216;
          }
          else
          {
            self->_totalBytesSent += v19;
            uint64_t v26 = 192;
          }
          *(Class *)((char *)&self->super.isa + v26) = (Class)(*(char **)((char *)&self->super.isa + v26) + (int)v7);
          __int16 v24 = v15;
          goto LABEL_18;
        }
        unint64_t v13 = 6;
        goto LABEL_14;
      }
    }
    else
    {
      id v15 = 0;
    }
    unint64_t v13 = 12;
  }
LABEL_14:
  self->_totalPacketsDropped += (int)v7;
  if ((int)v7 >= 1)
  {
    uint64_t v23 = v7;
    do
    {
      ++a3;
      _IDSLinkPacketBufferRelease();
      --v23;
    }
    while (v23);
  }
  __int16 v24 = 0;
LABEL_18:

  return v13;
}

- (void)flushBuffer:(unint64_t)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  id v9 = v8;
  if (!self->_hasFixedDestination)
  {
    id v10 = 0;
    if (v8)
    {
      cbuuidToLinks = self->_cbuuidToLinks;
      id v12 = 0;
      if (cbuuidToLinks)
      {
        unint64_t v13 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9);
        id v10 = v13;
        if (v13)
        {
          uint64_t v14 = (id)CFDictionaryGetValue((CFDictionaryRef)v13, @"IDSLinkBTKey");
          id v12 = v14;
          if (v14) {
            [v14 flushBuffer:a3];
          }
        }
        else
        {
          id v12 = 0;
        }
      }
    }
    else
    {
      id v12 = 0;
    }
  }
}

- (void)startLocalSetup
{
  if (!self->_hasFixedDestination)
  {
    id v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startLocalSetup called", v4, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    [(IDSLinkManager *)self addPairedDevice:@"LOCAL-SETUP-STARTED"];
    [(IDSLinkManager *)self _startNetworkInterfaceListener:1];
    [(IDSLinkManager *)self _startCellularDataStatusListener:1];
  }
}

- (void)obliterateConnectionInfo
{
  if (!self->_hasFixedDestination)
  {
    self->_BOOL mayBringUpWiFi = 0;
    [(IDSLinkManager *)self _bringUpWiFi:0];
    id v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "obliterateConnectionInfo called", buf, 2u);
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
    [(IDSLinkManager *)self _removeAllLinksForDeviceID:kIDSDefaultPairedDeviceID];
    [(IDSLinkManager *)self deletePairedDevice:0];
    if (![(IDSLinkManager *)self _hasGlobalLinkConnectingOrConnected])
    {
      [(IDSLinkManager *)self _startNetworkInterfaceListener:0];
      [(IDSLinkManager *)self _startCellularDataStatusListener:0];
    }
    localWiFiAddressUsedForDefaultDevice = self->_localWiFiAddressUsedForDefaultDevice;
    if (localWiFiAddressUsedForDefaultDevice)
    {
      self->_localWiFiAddressUsedForDefaultDevice = 0;
    }
    if (self->_doesDefaultDevicePreferInfraWiFi)
    {
      self->_BOOL doesDefaultDevicePreferInfraWiFi = 0;
      id v5 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "reset preferInfraWiFi.", buf, 2u);
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
    int v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"YES";
      if (self->_lastSentDefaultDeviceNearby) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      if (self->_lastSentDefaultDeviceConnectivity) {
        CFStringRef v9 = @"YES";
      }
      else {
        CFStringRef v9 = @"NO";
      }
      BOOL lastSentDefaultPeerConnectivity = self->_lastSentDefaultPeerConnectivity;
      if (self->_lastSentDefaultDeviceCloudConnectivity) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      if (!lastSentDefaultPeerConnectivity) {
        CFStringRef v7 = @"NO";
      }
      CFStringRef v14 = v8;
      __int16 v15 = 2112;
      CFStringRef v16 = v9;
      __int16 v17 = 2112;
      CFStringRef v18 = v11;
      __int16 v19 = 2112;
      CFStringRef v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "reset last sent default peer states (deviceNearby:%@, deviceConnectivity:%@, deviceCloudConnectivity:%@, peerConnectivity:%@).", buf, 0x2Au);
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
    *(_DWORD *)&self->_lastSentDefaultDeviceNearby = 0;
    if (self->_isDefaultDeviceOnPhoneCall)
    {
      self->_isDefaultDeviceOnPhoneCall = 0;
      id v12 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "reset phone call state.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (void)addPairedDevice:(id)a3
{
  id v4 = a3;
  if (!self->_hasFixedDestination)
  {
    btLinkManager = self->_btLinkManager;
    if (btLinkManager)
    {
      int v6 = [(IDSBTLinkManager *)btLinkManager pairedDevice];
      unsigned int v7 = [v6 isEqualToString:v4];

      if (v7)
      {
        CFStringRef v8 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v16 = v4;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "addPairedDevice for the same UUID %@ - Ignoring", buf, 0xCu);
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
      else
      {
        CFStringRef v11 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100255530;
        block[3] = &unk_10097E4D0;
        id v12 = v4;
        id v14 = v12;
        dispatch_async(v11, block);

        [(IDSLinkManager *)self _removeAllLinksForDeviceID:kIDSDefaultPairedDeviceID];
        [(IDSBTLinkManager *)self->_btLinkManager updatePairedDevice:v12];
      }
    }
    else
    {
      CFStringRef v9 = [[IDSBTLinkManager alloc] initWithDelegate:self pairedDevice:v4];
      id v10 = self->_btLinkManager;
      self->_btLinkManager = v9;

      if (self->_shouldStartBTLinkManager) {
        [(IDSBTLinkManager *)self->_btLinkManager start];
      }
    }
  }
}

- (void)connectPairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_hasFixedDestination)
  {
    if (v4
      && ([(IDSBTLinkManager *)self->_btLinkManager pairedDevice],
          int v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v5 isEqualToString:v6],
          v6,
          v7))
    {
      [(IDSBTLinkManager *)self->_btLinkManager connect];
    }
    else
    {
      CFStringRef v8 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connectPairedDevice for unknown UUID %@ - Ignoring", buf, 0xCu);
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
}

- (void)deletePairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_hasFixedDestination)
  {
    if (v4
      && ([(IDSBTLinkManager *)self->_btLinkManager pairedDevice],
          int v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v5 isEqualToString:v6],
          v6,
          !v7))
    {
      id v12 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "deletePairedDevice for unknown UUID %@ - Ignoring", buf, 0xCu);
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
    else
    {
      CFStringRef v8 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "deletePairedDevice for %@", buf, 0xCu);
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
      CFStringRef v9 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100255B38;
      block[3] = &unk_10097E4D0;
      id v14 = v5;
      dispatch_async(v9, block);

      self->_isDefaultDeviceNearby = 0;
      [(IDSLinkManager *)self _nearbyChangedForDefaultDevice];
      uint64_t v10 = kIDSDefaultPairedDeviceID;
      [(IDSLinkManager *)self disconnectGlobalLinkForDevice:kIDSDefaultPairedDeviceID isReinitiating:0 completionHandler:0];
      [(IDSLinkManager *)self stopGlobalLinkForDevice:v10];
      [(IDSBTLinkManager *)self->_btLinkManager obliterateConnectionInfo];
      [(IDSBTLinkManager *)self->_btLinkManager stop];
      btLinkManager = self->_btLinkManager;
      self->_btLinkManager = 0;

      [(IDSLinkManager *)self _removeAllLinksForDeviceID:v10];
    }
  }
}

- (void)setPreferInfraWiFi:(BOOL)a3
{
  if (self->_hasFixedDestination) {
    return;
  }
  if (self->_requireBT)
  {
    id v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LinkManager requires BT, ignore preferInfraWiFi request.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
LABEL_16:
        }
          _IDSLogV();
      }
    }
  }
  else if (self->_isCentral)
  {
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "preferInfraWiFi must not be initiated from this device", v12, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          goto LABEL_16;
        }
      }
    }
  }
  else if (a3)
  {
    if (self->_doesDefaultDevicePreferInfraWiFi) {
      return;
    }
    if (self->_localWiFiAddressUsedForDefaultDevice)
    {
      int v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "switching to preferInfraWiFi mode", v11, 2u);
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
      self->_BOOL doesDefaultDevicePreferInfraWiFi = 1;
      if (self->_isDefaultDeviceUsingBTLink) {
        [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:0 isCloudConnected:self->_lastSentDefaultDeviceCloudConnectivity];
      }
      [(IDSLinkManager *)self _startUDPLinkHandshakeForDefaultDevice:1 immediately:1];
    }
    else
    {
      CFStringRef v8 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "preferInfraWiFi requested but no local IP available - ignoring", v10, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            goto LABEL_16;
          }
        }
      }
    }
  }
  else if (self->_doesDefaultDevicePreferInfraWiFi)
  {
    unsigned int v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "switching back to Magnet/InfraWiFi mode", v9, 2u);
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
    [(IDSLinkManager *)self _suspendBTLink:0 cbuuid:kIDSDefaultPairedDeviceID];
  }
}

- (void)setLinkPreferences:(id)a3
{
}

- (BOOL)isConnectedToDeviceID:(id)a3
{
  BOOL result = 0;
  if (a3)
  {
    deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
    if (deviceIDToCurrentLink) {
      return CFDictionaryGetValue((CFDictionaryRef)deviceIDToCurrentLink, a3) != 0;
    }
  }
  return result;
}

- (void)triggerBTCorruptionRecoveryForCBUUID:(id)a3
{
  CFDictionaryRef v4 = 0;
  id key = a3;
  if (key)
  {
    Value = 0;
    if (self->_cbuuidToLinks)
    {
      Value = (id)CFDictionaryGetValue((CFDictionaryRef)self->_cbuuidToLinks, key);
      CFDictionaryRef v4 = (const __CFDictionary *)Value;
      if (Value)
      {
        int v6 = (id)CFDictionaryGetValue((CFDictionaryRef)Value, @"IDSLinkBTKey");
        if (v6)
        {
          unsigned int v7 = v6;
          [v6 triggerBTCorruptionRecovery];

          goto LABEL_9;
        }
        Value = (void *)CFDictionaryGetValue(v4, @"IDSLinkBTLEKey");
      }
    }
  }
  else
  {
    Value = 0;
  }
  [Value triggerBTCorruptionRecovery];
LABEL_9:
}

- (void)setRequireBT:(BOOL)a3
{
  if (self->_requireBT != a3)
  {
    BOOL v3 = a3;
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LinkManager requires BT: %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    self->_requireBT = v3;
  }
}

- (void)setShouldStartBTLinkManager:(BOOL)a3
{
  if (self->_shouldStartBTLinkManager != a3)
  {
    self->_shouldStartBTLinkManager = a3;
    CFDictionaryRef v4 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldStartBTLinkManager) {
        CFStringRef v5 = @"YES";
      }
      else {
        CFStringRef v5 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LinkManager shouldStartBTLinkManager: %@.", buf, 0xCu);
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
    btLinkManager = self->_btLinkManager;
    if (self->_shouldStartBTLinkManager)
    {
      if (btLinkManager) {
        [(IDSBTLinkManager *)btLinkManager start];
      }
    }
    else if (btLinkManager)
    {
      [(IDSBTLinkManager *)btLinkManager obliterateConnectionInfo];
      [(IDSBTLinkManager *)self->_btLinkManager stop];
    }
  }
}

- (void)startLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = v7;
  if (v7
    && ([v7 isEqualToString:kIDSDefaultPairedDeviceID] & 1) == 0
    && !self->_hasFixedDestination)
  {
    CFDictionaryRef deviceIDToCurrentLink = (const __CFDictionary *)self->_deviceIDToCurrentLink;
    if (deviceIDToCurrentLink) {
      CFDictionaryRef deviceIDToCurrentLink = (const __CFDictionary *)CFDictionaryGetValue(deviceIDToCurrentLink, v8);
    }
    CFDictionaryRef v10 = deviceIDToCurrentLink;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v17 = v8;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Already have BTLE link for cbuuid %@ deviceUniqueID %@", buf, 0x16u);
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
    else
    {
      id v12 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v17 = v8;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No connected BTLE link for cbuuid %@ deviceUniqueID %@ -- asking WiProx to connect.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v14 = v8;
          id v15 = v6;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v14 = v8;
            id v15 = v6;
            _IDSLogV();
          }
        }
      }
      unint64_t v13 = +[IDSWPLinkManager sharedInstance];
      [v13 connectToPeer:v8];
    }
  }
}

- (void)stopLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4 disconnectWP:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  CFDictionaryRef v10 = v9;
  if (v9
    && ([v9 isEqualToString:kIDSDefaultPairedDeviceID] & 1) == 0
    && !self->_hasFixedDestination)
  {
    CFStringRef v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Asked to disconnect from cbuuid %@ deviceUniqueID %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        unint64_t v13 = v10;
        id v14 = v8;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          unint64_t v13 = v10;
          id v14 = v8;
          _IDSLogV();
        }
      }
    }
    -[IDSLinkManager _removeAllLinksForDeviceID:](self, "_removeAllLinksForDeviceID:", v10, v13, v14);
    if (v5)
    {
      id v12 = +[IDSWPLinkManager sharedInstance];
      [v12 disconnectFromPeer:v10];
    }
  }
}

- (void)startUDPGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "startUDPGlobalLinkForDevice %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v6 = v4;
    _IDSLogV();
  }
}

- (void)stopUDPGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stopUDPGlobalLinkForDevice %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v11 = v4;
    _IDSLogV();
  }
  id v6 = 0;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v8 = 0;
    if (cbuuidToLinks)
    {
      id v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      id v6 = v9;
      if (v9)
      {
        id v8 = (id)CFDictionaryGetValue(v9, @"IDSLinkGlobalUDPKey");
        if (v8)
        {
          CFDictionaryRef v10 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v13 = v4;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remove UDPGlobalLink for device %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v11 = v4;
            _IDSLogV();
          }
          if (objc_opt_respondsToSelector()) {
            [v8 invalidate];
          }
          CFDictionaryRemoveValue(v6, @"IDSLinkGlobalUDPKey");
        }
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  -[IDSLinkManager _removeAllLinksForDeviceID:](self, "_removeAllLinksForDeviceID:", v4, v11);
}

- (void)createConnectionDataForDevice:(id)a3 localPartyID:(id)a4 dataReadyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "createConnectionDataForDevice - deviceID=%@, localPartyID=%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v21 = v8;
      id v22 = v9;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v21 = v8;
        id v22 = v9;
        _IDSLogV();
      }
    }
  }
  id v12 = 0;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (id v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (id v12 = v14) != 0)
    && (id v15 = (id)CFDictionaryGetValue((CFDictionaryRef)v14, @"IDSLinkGlobalUDPKey")) != 0)
  {
    id v16 = v15;
    if (objc_opt_respondsToSelector()) {
      [v16 createConnectionData:v9 dataReadyHandler:v10];
    }
  }
  else
  {
    __int16 v17 = +[NSDictionary dictionaryWithObject:@"No UDPGlobalLink is found", NSLocalizedDescriptionKey, v21, v22 forKey];
    id v18 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8006 userInfo:v17];

    id v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No UDPGlobalLink is found.", buf, 2u);
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
    if (v10)
    {
      CFStringRef v20 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002570CC;
      block[3] = &unk_10097E818;
      id v25 = v10;
      id v24 = v18;
      dispatch_async(v20, block);
    }
    id v16 = 0;
  }
}

- (void)processRemoteConnectionDataForDevice:(id)a3 remoteConnectionData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "processRemoteConnectionDataForDevice - %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v21 = v8;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v21 = v8;
        _IDSLogV();
      }
    }
  }
  id v12 = 0;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (id v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (id v12 = v14) != 0)
    && (id v15 = (id)CFDictionaryGetValue((CFDictionaryRef)v14, @"IDSLinkGlobalUDPKey")) != 0)
  {
    id v16 = v15;
    if (objc_opt_respondsToSelector()) {
      [v16 processRemoteConnectionData:v9 completionHandler:v10];
    }
  }
  else
  {
    __int16 v17 = +[NSDictionary dictionaryWithObject:@"No UDPGlobalLink is found", NSLocalizedDescriptionKey, v21 forKey];
    id v18 = +[NSError errorWithDomain:@"UDPGlobalLink" code:8006 userInfo:v17];

    id v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No UDPGlobalLink is found.", buf, 2u);
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
    if (v10)
    {
      CFStringRef v20 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100257470;
      block[3] = &unk_10097E818;
      id v24 = v10;
      id v23 = v18;
      dispatch_async(v20, block);
    }
    id v16 = 0;
  }
}

- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v19 = v10;
    __int16 v20 = 2112;
    if (v8) {
      CFStringRef v13 = @"YES";
    }
    CFStringRef v21 = v13;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "startConnectionForDevice - deviceID=%@ isInitiator=%@ remotePartyID=%@", buf, 0x20u);
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
  id v14 = 0;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v16 = 0;
    if (cbuuidToLinks)
    {
      __int16 v17 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      id v14 = v17;
      if (v17)
      {
        id v16 = (id)CFDictionaryGetValue((CFDictionaryRef)v17, @"IDSLinkGlobalUDPKey");
        if (v16 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v16 startConnectionForDevice:v10 isInitiator:v8 remotePartyID:v11 useStunMICheck:v6];
        }
      }
      else
      {
        id v16 = 0;
      }
    }
  }
  else
  {
    id v16 = 0;
  }
}

- (void)startBTDatagramLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "startBTDatagramLinkForDeviceUniqueID - deviceID %@ cbuuid %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v9 = v6;
      id v10 = v7;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v9 = v6;
        id v10 = v7;
        _IDSLogV();
      }
    }
  }
  [(IDSBTLinkManager *)self->_btLinkManager startDatagramLink];
}

- (void)stopBTDatagramLinkForDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "stopBTDatagramLinkForDeviceUniqueID - deviceID %@ cbuuid %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v9 = v6;
      id v10 = v7;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v9 = v6;
        id v10 = v7;
        _IDSLogV();
      }
    }
  }
  [(IDSBTLinkManager *)self->_btLinkManager stopDatagramLink];
}

- (void)_startAllocateRequestForDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_hasFixedDestination) {
    goto LABEL_41;
  }
  unsigned int v6 = [v4 isEqualToString:kIDSDefaultPairedDeviceID];
  if (!v6 || self->_currentDefaultDeviceLinkType != 1)
  {
    id v8 = [(IDSLinkManager *)self _newGlobalLinkForDeviceUniqueID:0 cbuuid:v5 options:0];
    id v9 = [v8 state];
    if ((unint64_t)v9 < 2)
    {
      if (([v8 hasReachableInterface:0] & 1) != 0
        || ([v8 hasReachableInterface:1] & 1) != 0)
      {
        Value = 0;
        if (v5 && self->_deviceIDToGlobalLinkUp) {
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToGlobalLinkUp, v5);
        }
        if (![Value BOOLValue])
        {
          if (!self->_deviceIDToGlobalLinkUp)
          {
            CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            deviceIDToGlobalLinkUp = self->_deviceIDToGlobalLinkUp;
            self->_deviceIDToGlobalLinkUp = Mutable;
          }
          CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToGlobalLinkUp, v5, &__kCFBooleanTrue);
          if (v6) {
            self->_delayedDefaultDeviceAllocateRequest = 0;
          }
          __int16 v17 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100257F00;
          block[3] = &unk_10097E440;
          id v21 = v5;
          __int16 v22 = self;
          dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
          dispatch_async(v17, v18);

          goto LABEL_40;
        }
        id v14 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v5;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "skip allocate request for %@, link is already up.", buf, 0xCu);
        }

        if (!os_log_shim_legacy_logging_enabled()
          || !_IDSShouldLogTransport()
          || (_IDSLogTransport(), !_IDSShouldLog()))
        {
LABEL_40:

          goto LABEL_41;
        }
      }
      else
      {
        id v19 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v5;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "skip allocate request for %@, no local interface.", buf, 0xCu);
        }

        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_40;
        }
        if (!_IDSShouldLogTransport()) {
          goto LABEL_40;
        }
        _IDSLogTransport();
        if (!_IDSShouldLog()) {
          goto LABEL_40;
        }
      }
    }
    else
    {
      id v10 = v9;
      id v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = _IDSLinkStateStrings[(void)v10];
        *(_DWORD *)buf = 138412546;
        id v24 = v5;
        __int16 v25 = 2080;
        uint64_t v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "skip allocate request for %@, link is in state [%s].", buf, 0x16u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_40;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_40;
      }
      _IDSLogTransport();
      if (!_IDSShouldLog()) {
        goto LABEL_40;
      }
    }
    _IDSLogV();
    goto LABEL_40;
  }
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "skip allocate request for %@, BT is connected.", buf, 0xCu);
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
LABEL_41:
}

- (void)startGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_hasFixedDestination) {
    goto LABEL_36;
  }
  unsigned int v6 = [v4 isEqualToString:kIDSDefaultPairedDeviceID];
  if (!v6 || self->_currentDefaultDeviceLinkType != 1)
  {
    id v8 = [(IDSLinkManager *)self _newGlobalLinkForDeviceUniqueID:0 cbuuid:v5 options:0];
    id v9 = (char *)[v8 state];
    id v10 = v9;
    if ((unint64_t)v9 < 2)
    {
      __int16 v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = _IDSLinkStateStrings[(void)v10];
        *(_DWORD *)buf = 138412802;
        id v21 = v8;
        __int16 v22 = 2112;
        id v23 = v5;
        __int16 v24 = 2080;
        uint64_t v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "start new GlobalLink %@ for %@, link state [%s].", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          dispatch_block_t v18 = v5;
          uint64_t v19 = _IDSLinkStateStrings[(void)v10];
          id v17 = v8;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            dispatch_block_t v18 = v5;
            uint64_t v19 = _IDSLinkStateStrings[(void)v10];
            id v17 = v8;
            _IDSLogV();
          }
        }
      }
      if (v6)
      {
        [(IDSLinkManager *)self _bringUpWiFi:1];
        self->_delayedDefaultDeviceAllocateRequest = 1;
        [(IDSLinkManager *)self _startCellularDataStatusListener:1];
      }
      -[IDSLinkManager _startAllocateRequestForDevice:](self, "_startAllocateRequestForDevice:", v5, v17, v18, v19);
      goto LABEL_35;
    }
    if ((unint64_t)(v9 - 7) > 0xFFFFFFFFFFFFFFFDLL)
    {
      if (!v6 || self->_delayedDefaultDeviceAllocateRequest) {
        goto LABEL_35;
      }
      self->_delayedDefaultDeviceAllocateRequest = 1;
      id v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)_IDSLinkStateStrings[(void)v10];
        *(_DWORD *)buf = 138412546;
        id v21 = v5;
        __int16 v22 = 2080;
        id v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "delayed allcoate request for %@, link state is [%s].", buf, 0x16u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_35;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_35;
      }
      _IDSLogTransport();
      if (!_IDSShouldLog()) {
        goto LABEL_35;
      }
    }
    else
    {
      id v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)_IDSLinkStateStrings[(void)v10];
        *(_DWORD *)buf = 138412546;
        id v21 = v5;
        __int16 v22 = 2080;
        id v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "skip starting GlobalLink for %@, link state is [%s].", buf, 0x16u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_35;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_35;
      }
      _IDSLogTransport();
      if (!_IDSShouldLog()) {
        goto LABEL_35;
      }
    }
    _IDSLogV();
LABEL_35:

    goto LABEL_36;
  }
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "skip starting GlobalLink for %@, BT is connected.", buf, 0xCu);
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
LABEL_36:
}

- (void)stopGlobalLinkForDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stopGlobalLinkForDevice %@ (=> cbuuid)", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v15 = v4;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v15 = v4;
        _IDSLogV();
      }
    }
  }
  unsigned int v6 = 0;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v8 = 0;
    if (cbuuidToLinks)
    {
      id v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      unsigned int v6 = v9;
      if (v9)
      {
        id v8 = (id)CFDictionaryGetValue(v9, @"IDSLinkGlobalKey");
        if (v8)
        {
          id v10 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v19 = v8;
            __int16 v20 = 2112;
            id v21 = v4;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remove %@ for session %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v15 = v8;
              id v17 = v4;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v15 = v8;
                id v17 = v4;
                _IDSLogV();
              }
            }
          }
          objc_msgSend(v8, "invalidate", v15, v17);
          CFDictionaryRemoveValue(v6, @"IDSLinkGlobalKey");
        }
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  if (!self->_btLinkManager
    && ![(IDSLinkManager *)self _hasGlobalLinkConnectingOrConnected])
  {
    [(IDSLinkManager *)self _startNetworkInterfaceListener:0];
    [(IDSLinkManager *)self _startCellularDataStatusListener:0];
  }
  Value = 0;
  if (v4 && self->_deviceIDToGlobalLinkUp) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToGlobalLinkUp, v4);
  }
  if (objc_msgSend(Value, "BOOLValue", v15)) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToGlobalLinkUp, v4, &__kCFBooleanFalse);
  }
  if ([v4 isEqualToString:kIDSDefaultPairedDeviceID])
  {
    self->_delayedDefaultDeviceAllocateRequest = 0;
    uint64_t v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "IDSGlobalLink is brought down for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        unint64_t v16 = (unint64_t)v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          unint64_t v16 = (unint64_t)v4;
          _IDSLogV();
        }
      }
    }
    if (self->_currentDefaultDeviceLinkType != 2)
    {
      __int16 v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t currentDefaultDeviceLinkType = self->_currentDefaultDeviceLinkType;
        *(_DWORD *)buf = 67109120;
        LODWORD(v19) = currentDefaultDeviceLinkType;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Bring down WiFi (currentLinkType:%d).", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          unint64_t v16 = self->_currentDefaultDeviceLinkType;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            unint64_t v16 = self->_currentDefaultDeviceLinkType;
            _IDSLogV();
          }
        }
      }
      -[IDSLinkManager _bringUpWiFi:](self, "_bringUpWiFi:", 0, v16);
    }
  }
  else
  {
    [(IDSLinkManager *)self _removeAllLinksForDeviceID:v4];
  }
}

- (void)connectGlobalLinkForDevice:(id)a3 sessionInfo:(id)a4 connectReadyHandler:(id)a5 withLocalInterfacePreference:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = (__CFString *)a3;
  CFDictionaryRef v11 = (const __CFDictionary *)a4;
  id v12 = a5;
  if (!self->_hasFixedDestination)
  {
    if ([(__CFString *)v10 isEqualToString:kIDSDefaultPairedDeviceID]
      && self->_currentDefaultDeviceLinkType == 1)
    {
      __int16 v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Magent is connected, skip connecting GlobalLink for %@.", buf, 0xCu);
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
    else
    {
      Value = 0;
      if (v11 && kIDSQRAllocateKey_RequestID) {
        Value = (void *)CFDictionaryGetValue(v11, kIDSQRAllocateKey_RequestID);
      }
      id v15 = Value;
      [(IDSLinkManager *)self _removeAllocateRequestForDevice:v10 requestID:v15];
      unint64_t v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v42 = v15;
        __int16 v43 = 2112;
        int64x2_t v44 = v10;
        __int16 v45 = 2112;
        CFDictionaryRef v46 = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Receive allocate response for request %@, device %@. connectGlobalLinkForDevice with sessionInfo %@.", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v34 = v10;
          CFDictionaryRef v36 = v11;
          uint64_t v32 = v15;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v34 = v10;
            CFDictionaryRef v36 = v11;
            uint64_t v32 = v15;
            _IDSLogV();
          }
        }
      }
      id v17 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_block_t v18 = [(__CFDictionary *)v11 objectForKeyedSubscript:kIDSQRAllocateKey_StreamInfoSubscribedStreams];
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "connectGlobalLinkForDevice: sessionInfo[kIDSQRAllocateKey_StreamInfoSubscribedStreams]:%@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v19 = kIDSQRAllocateKey_StreamInfoSubscribedStreams;
          uint64_t v32 = [(__CFDictionary *)v11 objectForKeyedSubscript:kIDSQRAllocateKey_StreamInfoSubscribedStreams];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            uint64_t v32 = -[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v19, v32);
            _IDSLogV();
          }
        }
      }
      id v20 = -[IDSLinkManager _newGlobalLinkForDeviceUniqueID:cbuuid:options:](self, "_newGlobalLinkForDeviceUniqueID:cbuuid:options:", 0, v10, v11, v32, v34, v36);
      if (kIDSQRAllocateKey_AlternateDelegate) {
        BOOL v21 = v11 != 0;
      }
      else {
        BOOL v21 = 0;
      }
      if (v21) {
        __int16 v22 = (void *)CFDictionaryGetValue(v11, kIDSQRAllocateKey_AlternateDelegate);
      }
      else {
        __int16 v22 = 0;
      }
      id v23 = v22;
      __int16 v24 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v42 = v23;
        __int16 v43 = 2112;
        int64x2_t v44 = v10;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Set alternateDelegate %@ for %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v33 = v23;
        __int16 v35 = v10;
        _IDSLogV();
      }
      objc_msgSend(v20, "setAlternateDelegate:", v23, v33, v35);
      if (kIDSQRAllocateKey_ClientUniquePID) {
        BOOL v25 = v11 != 0;
      }
      else {
        BOOL v25 = 0;
      }
      if (v25) {
        uint64_t v26 = (void *)CFDictionaryGetValue(v11, kIDSQRAllocateKey_ClientUniquePID);
      }
      else {
        uint64_t v26 = 0;
      }
      id v27 = v26;
      objc_msgSend(v20, "setClientUniquePID:", objc_msgSend(v27, "unsignedLongLongValue"));
      if (v20)
      {
        [v20 connectWithSessionInfo:v11 interfaceAddress:0 joinSession:1 completionHandler:v12 withLocalInterfacePreference:v6];
      }
      else
      {
        __int16 v28 = +[NSDictionary dictionaryWithObject:@"No GlobalLink is found." forKey:NSLocalizedDescriptionKey];
        __int16 v37 = +[NSError errorWithDomain:@"GlobalLink" code:8006 userInfo:v28];

        id v29 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v42 = @"No GlobalLink is found.";
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
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
        if (v12)
        {
          uint64_t v30 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100259478;
          block[3] = &unk_10097E818;
          id v40 = v12;
          id v39 = v37;
          dispatch_block_t v31 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
          dispatch_async(v30, v31);
        }
      }
    }
  }
}

- (void)_addAllocateRequestForDevice:(id)a3 requestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6
    || (deviceIDToAllocRequests = self->_deviceIDToAllocRequests) == 0
    || (id v9 = (id)CFDictionaryGetValue((CFDictionaryRef)deviceIDToAllocRequests, v6)) == 0)
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
  }
  if (v7 && v9) {
    CFArrayAppendValue((CFMutableArrayRef)v9, v7);
  }
  if (!self->_deviceIDToAllocRequests)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryRef v11 = self->_deviceIDToAllocRequests;
    self->_deviceIDToAllocRequests = Mutable;
  }
  id v12 = v9;
  if (v9)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToAllocRequests, v6, v12);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071B548();
  }

  __int16 v13 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "allocate request %@ is pending for %@", buf, 0x16u);
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

- (void)_removeAllocateRequestForDevice:(id)a3 requestID:(id)a4
{
  id v6 = a4;
  Value = 0;
  id v8 = v6;
  if (a3 && self->_deviceIDToAllocRequests)
  {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToAllocRequests, a3);
    id v6 = v8;
  }
  [Value removeObject:v6];
}

- (void)handleAllocateRequestFailureForDevice:(id)a3 requestID:(id)a4 errorCode:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 1024;
    int v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "handleAllocateRequestFailureForDevice - deviceID %@, requestID %@, erroCode %d", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v13 = v9;
      uint64_t v14 = v5;
      id v12 = v8;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v13 = v9;
        uint64_t v14 = v5;
        id v12 = v8;
        _IDSLogV();
      }
    }
  }
  -[IDSLinkManager _removeAllocateRequestForDevice:requestID:](self, "_removeAllocateRequestForDevice:requestID:", v8, v9, v12, v13, v14);
  Value = 0;
  if (v8 && self->_deviceIDToGlobalLinkUp) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToGlobalLinkUp, v8);
  }
  if ([Value BOOLValue]) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_deviceIDToGlobalLinkUp, v8, &__kCFBooleanFalse);
  }
}

- (void)setAcceptedRelaySession:(id)a3 relaySessionID:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFDictionaryRef v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setAcceptedRelaySession - sessionID %@, relaySessionID %@.", buf, 0x16u);
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
  id v12 = 0;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    uint64_t v14 = 0;
    if (cbuuidToLinks)
    {
      id v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      id v12 = v15;
      if (v15)
      {
        id v16 = (id)CFDictionaryGetValue((CFDictionaryRef)v15, @"IDSLinkGlobalKey");
        uint64_t v14 = v16;
        if (v16) {
          [v16 setAcceptedRelaySession:v9 options:v10];
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
}

- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    *(_DWORD *)buf = 136315650;
    id v15 = "-[IDSLinkManager setHasPendingAllocation:forIDSSession:]";
    __int16 v16 = 2112;
    id v17 = v6;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, hasPendingAllocation %@.", buf, 0x20u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    CFDictionaryRef v11 = 0;
    if (cbuuidToLinks)
    {
      id v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        CFDictionaryRef v11 = v13;
        if (v13) {
          [v13 setHasPendingAllocation:v4];
        }
      }
      else
      {
        CFDictionaryRef v11 = 0;
      }
    }
  }
  else
  {
    CFDictionaryRef v11 = 0;
  }
}

- (void)setTimeBase:(id)a3 forIDSSession:(id)a4
{
  id v6 = (NSDate *)a3;
  id v7 = a4;
  CFStringRef v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    CFDictionaryRef v11 = "-[IDSLinkManager setTimeBase:forIDSSession:]";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, timeBase %@.", buf, 0x20u);
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
  timeBase = self->_timeBase;
  self->_timeBase = v6;
}

- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4 forIDSSession:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    *(_DWORD *)buf = 136315650;
    __int16 v12 = "-[IDSLinkManager setIsReliableUnicastSession:isClient:forIDSSession:]";
    __int16 v13 = 2112;
    id v14 = v8;
    if (v6) {
      CFStringRef v10 = @"YES";
    }
    __int16 v15 = 2112;
    CFStringRef v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, isReliableUnicastSession %@.", buf, 0x20u);
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
  self->_isReliableUnicastSession = v6;
  self->_isReliableUnicastClient = a4;
}

- (void)setAllowP2PforIDSSession:(id)a3 isEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[IDSLinkManager setAllowP2PforIDSSession:isEnabled:]";
    __int16 v16 = 2112;
    id v17 = v6;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, setAllowP2PforIDSSession: %@", buf, 0x20u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    CFDictionaryRef v11 = 0;
    if (cbuuidToLinks)
    {
      __int16 v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        __int16 v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        CFDictionaryRef v11 = v13;
        if (v13) {
          [v13 setAllowP2P:v4];
        }
      }
      else
      {
        CFDictionaryRef v11 = 0;
      }
    }
  }
  else
  {
    CFDictionaryRef v11 = 0;
  }
}

- (void)setForceTCPFallbackOnWiFi:(id)a3 forceTCPFallbackOnWiFi:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[IDSLinkManager setForceTCPFallbackOnWiFi:forceTCPFallbackOnWiFi:]";
    __int16 v16 = 2112;
    id v17 = v6;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, setForceTCPFallbackOnWiFi: %@", buf, 0x20u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    CFDictionaryRef v11 = 0;
    if (cbuuidToLinks)
    {
      __int16 v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        __int16 v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        CFDictionaryRef v11 = v13;
        if (v13) {
          [v13 setForceTCPFallbackOnWiFi:v4];
        }
      }
      else
      {
        CFDictionaryRef v11 = 0;
      }
    }
  }
  else
  {
    CFDictionaryRef v11 = 0;
  }
}

- (void)setForceTCPFallbackOnCell:(id)a3 forceTCPFallbackOnCell:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[IDSLinkManager setForceTCPFallbackOnCell:forceTCPFallbackOnCell:]";
    __int16 v16 = 2112;
    id v17 = v6;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, setForceTCPFallbackOnCell: %@", buf, 0x20u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    CFDictionaryRef v11 = 0;
    if (cbuuidToLinks)
    {
      __int16 v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        __int16 v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        CFDictionaryRef v11 = v13;
        if (v13) {
          [v13 setForceTCPFallbackOnCell:v4];
        }
      }
      else
      {
        CFDictionaryRef v11 = 0;
      }
    }
  }
  else
  {
    CFDictionaryRef v11 = 0;
  }
}

- (void)setSharedSessionHasJoined:(BOOL)a3 forIDSSession:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    *(_DWORD *)buf = 136315650;
    __int16 v22 = "-[IDSLinkManager setSharedSessionHasJoined:forIDSSession:]";
    __int16 v23 = 2112;
    id v24 = v6;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    __int16 v25 = 2112;
    CFStringRef v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, sharedSessionHasJoined %@.", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v9 = v4 ? @"YES" : @"NO";
    id v19 = v6;
    id v20 = v9;
    __int16 v18 = "-[IDSLinkManager setSharedSessionHasJoined:forIDSSession:]";
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      id v19 = v6;
      id v20 = v9;
      __int16 v18 = "-[IDSLinkManager setSharedSessionHasJoined:forIDSSession:]";
      _IDSLogV();
    }
  }
  if (!self->_sessionIDToSharedSessionHasJoined)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    sessionIDToSharedSessionHasJoined = self->_sessionIDToSharedSessionHasJoined;
    self->_sessionIDToSharedSessionHasJoined = Mutable;
  }
  __int16 v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4, v18, v19, v20);
  if (v12)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToSharedSessionHasJoined, v6, v12);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071B5C4();
  }

  __int16 v13 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    __int16 v15 = 0;
    if (cbuuidToLinks)
    {
      __int16 v16 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      __int16 v13 = v16;
      if (v16)
      {
        id v17 = (id)CFDictionaryGetValue((CFDictionaryRef)v16, @"IDSLinkGlobalKey");
        __int16 v15 = v17;
        if (v17) {
          [v17 setSharedSessionHasJoined:v4];
        }
      }
      else
      {
        __int16 v15 = 0;
      }
    }
  }
  else
  {
    __int16 v15 = 0;
  }
}

- (void)clearSharedSessionHasJoinedForIDSSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[IDSLinkManager clearSharedSessionHasJoinedForIDSSession:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v9 = "-[IDSLinkManager clearSharedSessionHasJoinedForIDSSession:]";
      id v10 = v4;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v9 = "-[IDSLinkManager clearSharedSessionHasJoinedForIDSSession:]";
        id v10 = v4;
        _IDSLogV();
      }
    }
  }
  sessionIDToSharedSessionHasJoined = self->_sessionIDToSharedSessionHasJoined;
  if (!sessionIDToSharedSessionHasJoined)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFStringRef v8 = self->_sessionIDToSharedSessionHasJoined;
    self->_sessionIDToSharedSessionHasJoined = Mutable;

    sessionIDToSharedSessionHasJoined = self->_sessionIDToSharedSessionHasJoined;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](sessionIDToSharedSessionHasJoined, "setObject:forKeyedSubscript:", 0, v4, v9, v10);
}

- (void)setCellInterfaceName:(id)a3 forIDSSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[IDSLinkManager setCellInterfaceName:forIDSSession:]";
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, setCellInterfaceName %@.", buf, 0x20u);
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
  if (!self->_sessionIDToCellInterfaceName)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    sessionIDToCellInterfaceName = self->_sessionIDToCellInterfaceName;
    self->_sessionIDToCellInterfaceName = Mutable;
  }
  id v11 = v6;
  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToCellInterfaceName, v7, v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071B640();
  }

  __int16 v12 = 0;
  if (v7)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v14 = 0;
    if (cbuuidToLinks)
    {
      __int16 v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v7);
      __int16 v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue((CFDictionaryRef)v15, @"IDSLinkGlobalKey");
        id v14 = v16;
        if (v16) {
          [v16 setCellInterfaceName:v11];
        }
      }
      else
      {
        id v14 = 0;
      }
    }
  }
  else
  {
    id v14 = 0;
  }
}

- (void)setIDSContextBlob:(id)a3 forIDSSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[IDSLinkManager setIDSContextBlob:forIDSSession:]";
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@, setIDSContextBlob %@.", buf, 0x20u);
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
  if (!self->_sessionIDToIDSContextBlob)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    sessionIDToIDSContextBlob = self->_sessionIDToIDSContextBlob;
    self->_sessionIDToIDSContextBlob = Mutable;
  }
  id v11 = v6;
  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToIDSContextBlob, v7, v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071B6BC();
  }

  __int16 v12 = 0;
  if (v7)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v14 = 0;
    if (cbuuidToLinks)
    {
      __int16 v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v7);
      __int16 v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue((CFDictionaryRef)v15, @"IDSLinkGlobalKey");
        id v14 = v16;
        if (v16) {
          [v16 setIDSContextBlob:v11];
        }
      }
      else
      {
        id v14 = 0;
      }
    }
  }
  else
  {
    id v14 = 0;
  }
}

- (void)clearCellInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[IDSLinkManager clearCellInterfaceName:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v9 = "-[IDSLinkManager clearCellInterfaceName:]";
      id v10 = v4;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v9 = "-[IDSLinkManager clearCellInterfaceName:]";
        id v10 = v4;
        _IDSLogV();
      }
    }
  }
  sessionIDToCellInterfaceName = self->_sessionIDToCellInterfaceName;
  if (!sessionIDToCellInterfaceName)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFStringRef v8 = self->_sessionIDToCellInterfaceName;
    self->_sessionIDToCellInterfaceName = Mutable;

    sessionIDToCellInterfaceName = self->_sessionIDToCellInterfaceName;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](sessionIDToCellInterfaceName, "setObject:forKeyedSubscript:", 0, v4, v9, v10);
}

- (void)clearIDSContextBlob:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[IDSLinkManager clearIDSContextBlob:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - sessionID %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v9 = "-[IDSLinkManager clearIDSContextBlob:]";
      id v10 = v4;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v9 = "-[IDSLinkManager clearIDSContextBlob:]";
        id v10 = v4;
        _IDSLogV();
      }
    }
  }
  sessionIDToIDSContextBlob = self->_sessionIDToIDSContextBlob;
  if (!sessionIDToIDSContextBlob)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFStringRef v8 = self->_sessionIDToIDSContextBlob;
    self->_sessionIDToIDSContextBlob = Mutable;

    sessionIDToIDSContextBlob = self->_sessionIDToIDSContextBlob;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](sessionIDToIDSContextBlob, "setObject:forKeyedSubscript:", 0, v4, v9, v10);
}

- (void)sendSKEData:(id)a3 skeData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v8;
    __int16 v24 = 1024;
    LODWORD(v25) = [v9 length];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sendSKEData - sessionID %@, skeData %d Bytes.", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v20 = v8;
      id v21 = [v9 length];
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v12 = objc_msgSend(v9, "length", v8, v21);
        id v20 = v8;
        id v21 = v12;
        _IDSLogV();
      }
    }
  }
  __int16 v13 = 0;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (__int16 v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (__int16 v13 = v15) != 0)
    && (__int16 v16 = (id)CFDictionaryGetValue((CFDictionaryRef)v15, @"IDSLinkGlobalKey")) != 0)
  {
    id v17 = v16;
    [v16 sendSKEData:v9];
  }
  else
  {
    __int16 v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      __int16 v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sendSKEData - sessionID %@, there is no link for sendSKEData (links:%@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v20 = v8;
      id v21 = v13;
      _IDSLogV();
    }
    __int16 v19 = +[NSDictionary dictionaryWithObject:@"there is no link for sendSKEData", NSLocalizedDescriptionKey, v20, v21 forKey];
    id v17 = +[NSError errorWithDomain:@"LinkManager" code:8006 userInfo:v19];

    if (v10) {
      v10[2](v10, v17);
    }
  }
}

- (void)sendKeyMaterialMessage:(id)a3 relayGroupID:(id)a4 keyMaterialMessageData:(id)a5 destinationURIs:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void (**)(id, uint64_t))a7;
  id v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessage - sessionID %@, groupID %@", buf, 0x16u);
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
  __int16 v18 = 0;
  if (v12
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (id v20 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v12),
        (__int16 v18 = v20) != 0)
    && (id v21 = (id)CFDictionaryGetValue((CFDictionaryRef)v20, @"IDSLinkGlobalKey")) != 0)
  {
    id v22 = v21;
    [v21 sendKeyMaterialMessageData:v14 relayGroupID:v13 destinationURIs:v15 completionHandler:v16];
  }
  else
  {
    id v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessage - sessionID %@, there is no link (links:%@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    if (v16) {
      v16[2](v16, 33);
    }
  }
}

- (void)setServerDesiredMaterialsForSession:(id)a3 materials:(id)a4 signer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setDesiredMaterialsForSession - sessionID %@", buf, 0xCu);
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
  id v12 = 0;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (id v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (id v12 = v14) != 0)
    && (id v15 = (id)CFDictionaryGetValue((CFDictionaryRef)v14, @"IDSLinkGlobalKey")) != 0)
  {
    __int16 v16 = v15;
    [v15 setServerDesiredMaterialsForSession:v8 materials:v9 signer:v10];
  }
  else
  {
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "setServerDesiredMaterialsForSession - sessionID %@, there is no link (links: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)requestMaterialsForSession:(id)a3 participantIDs:(id)a4 materialType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "requestMaterialsForParticipantIDs - sessionID %@", buf, 0xCu);
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
  id v11 = 0;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (id v11 = v13) != 0)
    && (id v14 = (id)CFDictionaryGetValue((CFDictionaryRef)v13, @"IDSLinkGlobalKey")) != 0)
  {
    id v15 = v14;
    [v14 requestMaterialsForSession:v8 participantIDs:v9 materialType:v5];
  }
  else
  {
    __int16 v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "setServerDesiredMaterialsForSession - sessionID %@, there is no link (links: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)setDefaultUnderlyingLink:(id)a3 linkID:(char)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 1024;
    int v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setDefaultUnderlyingLink - sessionID %@, linkID:%d.", buf, 0x12u);
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
  id v8 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v10 = 0;
    if (cbuuidToLinks)
    {
      id v11 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v8 = v11;
      if (v11)
      {
        id v12 = (id)CFDictionaryGetValue((CFDictionaryRef)v11, @"IDSLinkGlobalKey");
        id v10 = v12;
        if (v12) {
          [v12 setDefaultUnderlyingLink:v4];
        }
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }
}

- (void)setPacketNotificationFilter:(id)a3 linkID:(char)a4 uniqueTag:(unsigned int)a5 isEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v19 = v10;
    if (v6) {
      CFStringRef v12 = @"YES";
    }
    __int16 v20 = 1024;
    int v21 = v8;
    __int16 v22 = 2112;
    CFStringRef v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setPacketNotificationFilter - sessionID %@, linkID:%d, enable:%@.", buf, 0x1Cu);
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
  id v13 = 0;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    __int16 v15 = 0;
    if (cbuuidToLinks)
    {
      int v16 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      id v13 = v16;
      if (v16)
      {
        id v17 = (id)CFDictionaryGetValue((CFDictionaryRef)v16, @"IDSLinkGlobalKey");
        __int16 v15 = v17;
        if (v17) {
          [v17 setPacketNotificationFilter:v8 uniqueTag:v7 isEnabled:v6];
        }
      }
      else
      {
        __int16 v15 = 0;
      }
    }
  }
  else
  {
    __int16 v15 = 0;
  }
}

- (void)dropIPPackets:(id)a3 linkID:(char)a4 payloadArray:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v8;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "dropIPPackets - sessionID %@, linkID:%d, payloadArray:%@.", buf, 0x1Cu);
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
  id v11 = 0;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v13 = 0;
    if (cbuuidToLinks)
    {
      id v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      id v11 = v14;
      if (v14)
      {
        __int16 v15 = (id)CFDictionaryGetValue((CFDictionaryRef)v14, @"IDSLinkGlobalKey");
        id v13 = v15;
        if (v15) {
          [v15 dropIPPackets:v6 payloadArray:v9];
        }
      }
      else
      {
        id v13 = 0;
      }
    }
  }
  else
  {
    id v13 = 0;
  }
}

- (void)updateProtocolQualityOfService:(id)a3 linkID:(char)a4 isGood:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v17 = v8;
    if (v5) {
      CFStringRef v10 = @"YES";
    }
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 2112;
    CFStringRef v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "updateProtocolQualityOfService - sessionID %@, linkID:%d, isGood:%@.", buf, 0x1Cu);
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
  id v11 = 0;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v13 = 0;
    if (cbuuidToLinks)
    {
      id v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      id v11 = v14;
      if (v14)
      {
        __int16 v15 = (id)CFDictionaryGetValue((CFDictionaryRef)v14, @"IDSLinkGlobalKey");
        id v13 = v15;
        if (v15) {
          [v15 updateProtocolQualityOfService:v6 isGood:v5];
        }
      }
      else
      {
        id v13 = 0;
      }
    }
  }
  else
  {
    id v13 = 0;
  }
}

- (void)stopKeepAlive:(id)a3 linkIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "stopKeepAlive - sessionID %@, linkIDs:%@.", buf, 0x16u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0;
    if (cbuuidToLinks)
    {
      CFStringRef v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        id v11 = v13;
        if (v13) {
          [v13 stopKeepAlive:v7];
        }
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (void)setWiFiAssistState:(id)a3 isWiFiAssistEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WiFiAssist enabled: %@", buf, 0xCu);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0;
    if (cbuuidToLinks)
    {
      CFStringRef v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        id v11 = v13;
        if (v13) {
          [v13 setWiFiAssistState:v4];
        }
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (void)currentCellularSignalStrength:(id)a3 signalRaw:(int *)a4 signalStrength:(int *)a5 signalGrade:(int *)a6
{
  id v10 = a3;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "currentCellularSignalStrength - sessionID %@.", buf, 0xCu);
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
  CFStringRef v12 = 0;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v14 = 0;
    if (cbuuidToLinks)
    {
      CFStringRef v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      CFStringRef v12 = v15;
      if (v15)
      {
        __int16 v16 = (id)CFDictionaryGetValue((CFDictionaryRef)v15, @"IDSLinkGlobalKey");
        id v14 = v16;
        if (v16) {
          [v16 currentCellularSignalStrength:a4 signalStrength:a5 signalGrade:a6];
        }
      }
      else
      {
        id v14 = 0;
      }
    }
  }
  else
  {
    id v14 = 0;
  }
}

- (void)startLinkProbing:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "startLinkProbing - sessionID %@, options: %@.", buf, 0x16u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0;
    if (cbuuidToLinks)
    {
      CFStringRef v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        id v11 = v13;
        if (v13) {
          [v13 startLinkProbing:v7];
        }
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (void)stopLinkProbing:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "stopLinkProbing - sessionID %@, options: %@.", buf, 0x16u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0;
    if (cbuuidToLinks)
    {
      CFStringRef v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        id v11 = v13;
        if (v13) {
          [v13 stopLinkProbing:v7];
        }
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (void)queryLinkProbingStatus:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "queryLinkProbingStatus - sessionID %@, options: %@.", buf, 0x16u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0;
    if (cbuuidToLinks)
    {
      CFStringRef v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        id v11 = v13;
        if (v13) {
          [v13 queryLinkProbingStatus:v7];
        }
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (void)flushLinkProbingStatus:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "flushLinkProbingStatus - sessionID %@, options: %@.", buf, 0x16u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0;
    if (cbuuidToLinks)
    {
      CFStringRef v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        id v11 = v13;
        if (v13) {
          [v13 flushLinkProbingStatus:v7];
        }
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (void)sendStatsRequestForClient:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sendStatsRequestForSessionID - sessionID %@, options: %@.", buf, 0x16u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0;
    if (cbuuidToLinks)
    {
      CFStringRef v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        id v11 = v13;
        if (v13) {
          [v13 sendStatsRequestForClient:v7];
        }
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (void)sendStatsRequest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sendStatsRequest - sessionID %@, options: %@.", buf, 0x16u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0;
    if (cbuuidToLinks)
    {
      CFStringRef v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        id v11 = v13;
        if (v13) {
          [v13 sendStatsRequest:v7];
        }
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (void)setRemoteDeviceVersion:(id)a3 version:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 1024;
    int v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setRemoteDeviceVersion - sessionID %@, version: %u.", buf, 0x12u);
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
  CFStringRef v8 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v10 = 0;
    if (cbuuidToLinks)
    {
      id v11 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      CFStringRef v8 = v11;
      if (v11)
      {
        CFStringRef v12 = (id)CFDictionaryGetValue((CFDictionaryRef)v11, @"IDSLinkGlobalKey");
        id v10 = v12;
        if (v12) {
          [v12 setRemoteDeviceVersion:v4];
        }
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }
}

- (void)receiveJoinNotificationFromAParticipant:(id)a3
{
  id v4 = a3;
  BOOL v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "receiveJoinNotificationFromAParticipant - sessionID %@.", buf, 0xCu);
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
  id v6 = 0;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    CFStringRef v8 = 0;
    if (cbuuidToLinks)
    {
      id v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      id v6 = v9;
      if (v9)
      {
        id v10 = (id)CFDictionaryGetValue((CFDictionaryRef)v9, @"IDSLinkGlobalKey");
        CFStringRef v8 = v10;
        if (v10) {
          [v10 receiveJoinNotificationFromAParticipant];
        }
      }
      else
      {
        CFStringRef v8 = 0;
      }
    }
  }
  else
  {
    CFStringRef v8 = 0;
  }
}

- (void)setUPlusOneModeForSessionID:(id)a3 isUPlusOneEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    CFStringRef v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setUPlusOneModeForSessionID - sessionID %@, isUPlusOneEnabled: %@.", buf, 0x16u);
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
  id v9 = 0;
  if (v6)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v11 = 0;
    if (cbuuidToLinks)
    {
      id v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6);
      id v9 = v12;
      if (v12)
      {
        id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey");
        id v11 = v13;
        if (v13) {
          [v13 enableUPlusOneSessionForTransition:v4];
        }
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (void)manageDesignatedDestinationsWithSessionID:(id)a3 destinations:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v19 = v10;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 1024;
    int v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "manageDesignatedDestinationsWithSessionID - sessionID %@, sessionStateCounter: %u, destinations: %@, withType: %u", buf, 0x22u);
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
  id v13 = 0;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v15 = 0;
    if (cbuuidToLinks)
    {
      __int16 v16 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      id v13 = v16;
      if (v16)
      {
        CFStringRef v17 = (id)CFDictionaryGetValue((CFDictionaryRef)v16, @"IDSLinkGlobalKey");
        id v15 = v17;
        if (v17) {
          [v17 manageDesignatedDestinations:v11 relayGroupID:v10 withType:v7 sessionStateCounter:v6];
        }
      }
      else
      {
        id v15 = 0;
      }
    }
  }
  else
  {
    id v15 = 0;
  }
}

- (void)removeParticipantIDsWithSessionID:(id)a3 participantIDs:(id)a4 sessionStateCounter:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v8;
    __int16 v18 = 1024;
    int v19 = v5;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "removeParticipantIDsWithSessionID - sessionID %@, sessionStateCounter: %u, participantIDs: %@", buf, 0x1Cu);
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
  id v11 = 0;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v13 = 0;
    if (cbuuidToLinks)
    {
      id v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      id v11 = v14;
      if (v14)
      {
        id v15 = (id)CFDictionaryGetValue((CFDictionaryRef)v14, @"IDSLinkGlobalKey");
        id v13 = v15;
        if (v15) {
          [v15 removeParticipantIDs:v9 relayGroupID:v8 sessionStateCounter:v5];
        }
      }
      else
      {
        id v13 = 0;
      }
    }
  }
  else
  {
    id v13 = 0;
  }
}

- (void)getSessionInfo:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v41 = a4;
  id v11 = a5;
  CFDictionaryRef v12 = (const __CFDictionary *)a6;
  Value = 0;
  if (v12 && IDSGlobalLinkOptionSessionInfoRequestTypeKey) {
    Value = (void *)CFDictionaryGetValue(v12, IDSGlobalLinkOptionSessionInfoRequestTypeKey);
  }
  unsigned int v14 = [Value unsignedIntValue];
  id v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v43 = v41;
    __int16 v44 = 2112;
    id v45 = v11;
    __int16 v46 = 2112;
    CFDictionaryRef v47 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "get session info for group %@, session %@, options %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v38 = v11;
      CFDictionaryRef v40 = v12;
      id v36 = v41;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v38 = v11;
        CFDictionaryRef v40 = v12;
        id v36 = v41;
        _IDSLogV();
      }
    }
  }
  __int16 v16 = 0;
  if (v10)
  {
    id v17 = 0;
    if (self->_cbuuidToLinks)
    {
      id v17 = (id)CFDictionaryGetValue((CFDictionaryRef)self->_cbuuidToLinks, v10);
      __int16 v16 = v17;
      if (v17) {
        id v17 = (void *)CFDictionaryGetValue((CFDictionaryRef)v17, @"IDSLinkGlobalKey");
      }
    }
  }
  else
  {
    id v17 = 0;
  }
  id v18 = v17;
  id v19 = v18;
  if (v18 || v14 != 1)
  {
    if (v18)
    {
      if (v14 != 1)
      {
        __int16 v24 = v12;
LABEL_58:
        objc_msgSend(v19, "getSessionInfo:relaySessionID:requestType:options:", v41, v11, v14, v24, v36, v38);

        goto LABEL_59;
      }
LABEL_48:
      dispatch_block_t v31 = 0;
      if (v12 && IDSGlobalLinkOptionQRSessionInfoKey) {
        dispatch_block_t v31 = (void *)CFDictionaryGetValue(v12, IDSGlobalLinkOptionQRSessionInfoKey);
      }
      __int16 v24 = v31;
      uint64_t v32 = (const void *)IDSGlobalLinkOptionSessionInfoCommandFlagKey;
      uint64_t v33 = [(__CFDictionary *)v12 objectForKey:IDSGlobalLinkOptionSessionInfoCommandFlagKey];
      id v34 = [v33 unsignedIntValue];

      if (v34)
      {
        __int16 v35 = +[NSNumber numberWithUnsignedInt:v34];
        if (v35)
        {
          CFDictionarySetValue(v24, v32, v35);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10071B738();
        }
      }
      goto LABEL_58;
    }
  }
  else
  {
    __int16 v20 = (const void *)IDSGlobalLinkOptionNewLinkOptionsKey;
    if (v12) {
      BOOL v21 = IDSGlobalLinkOptionNewLinkOptionsKey == 0;
    }
    else {
      BOOL v21 = 1;
    }
    int v22 = !v21;
    if (v21) {
      id v23 = 0;
    }
    else {
      id v23 = CFDictionaryGetValue(v12, IDSGlobalLinkOptionNewLinkOptionsKey);
    }
    id v19 = -[IDSLinkManager _newGlobalLinkForDeviceUniqueID:cbuuid:options:](self, "_newGlobalLinkForDeviceUniqueID:cbuuid:options:", 0, v10, v23, v36, v38, v40);
    if (v19)
    {
      if (v22)
      {
        int v25 = (id)CFDictionaryGetValue(v12, v20);
        __int16 v26 = 0;
        if (v25 && kIDSQRAllocateKey_AlternateDelegate) {
          __int16 v26 = (void *)CFDictionaryGetValue((CFDictionaryRef)v25, kIDSQRAllocateKey_AlternateDelegate);
        }
      }
      else
      {
        int v25 = 0;
        __int16 v26 = 0;
      }
      id v27 = v26;
      __int16 v28 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v43 = v27;
        __int16 v44 = 2112;
        id v45 = v10;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Set alternateDelegate %@ for %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v37 = v27;
        id v39 = v10;
        _IDSLogV();
      }
      objc_msgSend(v19, "setAlternateDelegate:", v27, v37, v39);
      if (kIDSQRAllocateKey_ClientUniquePID) {
        BOOL v29 = v12 != 0;
      }
      else {
        BOOL v29 = 0;
      }
      if (v29) {
        uint64_t v30 = (void *)CFDictionaryGetValue(v12, kIDSQRAllocateKey_ClientUniquePID);
      }
      else {
        uint64_t v30 = 0;
      }
      objc_msgSend(v19, "setClientUniquePID:", objc_msgSend(v30, "unsignedLongLongValue"));

      goto LABEL_48;
    }
  }
  __int16 v24 = v12;
LABEL_59:
}

- (void)updateSessionParticipants:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 participants:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "update session participants for group %@, session %@", buf, 0x16u);
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
  id v15 = 0;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v17 = 0;
    if (cbuuidToLinks)
    {
      id v18 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      id v15 = v18;
      if (v18)
      {
        id v19 = (id)CFDictionaryGetValue((CFDictionaryRef)v18, @"IDSLinkGlobalKey");
        id v17 = v19;
        if (v19) {
          [v19 updateSessionParticipants:v11 relaySessionID:v12 participants:v13];
        }
      }
      else
      {
        id v17 = 0;
      }
    }
  }
  else
  {
    id v17 = 0;
  }
}

- (void)registerPluginForGroup:(id)a3 relayGroupID:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  CFDictionaryRef v10 = (const __CFDictionary *)a5;
  if (!self->_sessionIDToPluginNameToPluginOptionsDict)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    sessionIDToPluginNameToPluginOptionsDict = self->_sessionIDToPluginNameToPluginOptionsDict;
    self->_sessionIDToPluginNameToPluginOptionsDict = Mutable;
  }
  id v13 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v10 && IDSGlobalLinkOptionPluginNameKey)
  {
    unsigned int v14 = (id)CFDictionaryGetValue(v10, IDSGlobalLinkOptionPluginNameKey);
    CFDictionaryRef v15 = v10;
LABEL_8:
    CFDictionarySetValue(v13, v14, v10);
    goto LABEL_9;
  }
  CFDictionaryRef v16 = v10;
  if (v10)
  {
    unsigned int v14 = 0;
    goto LABEL_8;
  }
  BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v24) {
    sub_10071B830(v24, v25, v26, v27, v28, v29, v30, v31);
  }
  unsigned int v14 = 0;
LABEL_9:

  id v17 = v13;
  if (v17)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToPluginNameToPluginOptionsDict, v8, v17);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071B7B4();
  }

  id v18 = 0;
  if (v8
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (__int16 v20 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8),
        (id v18 = v20) != 0)
    && (id v21 = (id)CFDictionaryGetValue((CFDictionaryRef)v20, @"IDSLinkGlobalKey")) != 0)
  {
    __int16 v22 = v21;
    [v21 registerPluginWithOptions:v10 relayGroupID:v9];
  }
  else
  {
    id v23 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "registerPluginForGroup could not find GlobalLink for session %@", buf, 0xCu);
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

- (void)clearPluginCacheForSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "clearPluginCacheForSession for session %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v9 = v4;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v9 = v4;
        _IDSLogV();
      }
    }
  }
  sessionIDToPluginNameToPluginOptionsDict = self->_sessionIDToPluginNameToPluginOptionsDict;
  if (!sessionIDToPluginNameToPluginOptionsDict)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionIDToPluginNameToPluginOptionsDict;
    self->_sessionIDToPluginNameToPluginOptionsDict = Mutable;

    sessionIDToPluginNameToPluginOptionsDict = self->_sessionIDToPluginNameToPluginOptionsDict;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](sessionIDToPluginNameToPluginOptionsDict, "setObject:forKeyedSubscript:", 0, v4, v9);
}

- (void)clearReliableUnicastStateForSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "clearReliableUnicastStateForSession for session %@", buf, 0xCu);
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
  *(_WORD *)&self->_isReliableUnicastSession = 0;
}

- (void)updateSessionURIToParticipantIDs:(id)a3 relayGroupID:(id)a4 relaySessionID:(id)a5 sessionInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "updateSessionURIToParticipantIDs for group %@, session %@", buf, 0x16u);
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
  CFDictionaryRef v15 = 0;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v17 = 0;
    if (cbuuidToLinks)
    {
      id v18 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      CFDictionaryRef v15 = v18;
      if (v18)
      {
        id v19 = (id)CFDictionaryGetValue((CFDictionaryRef)v18, @"IDSLinkGlobalKey");
        id v17 = v19;
        if (v19) {
          [v19 updateURIToParticipantIDs:v11 relaySessionID:v12 sessionInfo:v13];
        }
      }
      else
      {
        id v17 = 0;
      }
    }
  }
  else
  {
    id v17 = 0;
  }
}

- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = 0;
  if (v9
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (id v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9),
        (id v10 = v12) != 0)
    && (id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey")) != 0)
  {
    unsigned int v14 = v13;
    id v15 = [v13 createAliasForParticipantID:a3 salt:v8 relayGroupID:v9];
  }
  else
  {
    CFDictionaryRef v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "createAliasForParticipantID could not find GlobalLink for session %@", buf, 0xCu);
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
    id v15 = 0;
  }

  return (unint64_t)v15;
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = 0;
  if (v9
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (id v12 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v9),
        (id v10 = v12) != 0)
    && (id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)v12, @"IDSLinkGlobalKey")) != 0)
  {
    unsigned int v14 = v13;
    id v15 = [v13 participantIDForAlias:a3 salt:v8 relayGroupID:v9];
  }
  else
  {
    CFDictionaryRef v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "participantIDForAlias could not find GlobalLink for session %@", buf, 0xCu);
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
    id v15 = 0;
  }

  return (unint64_t)v15;
}

- (void)updateParticipantType:(unsigned __int16)a3 forSessionID:(id)a4 sessionStateCounter:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v16 = v6;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "updateParticipantType %u - sessionID %@", buf, 0x12u);
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
  id v10 = 0;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v12 = 0;
    if (cbuuidToLinks)
    {
      id v13 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      id v10 = v13;
      if (v13)
      {
        unsigned int v14 = (id)CFDictionaryGetValue((CFDictionaryRef)v13, @"IDSLinkGlobalKey");
        id v12 = v14;
        if (v14) {
          [v14 setParticipantType:v6 relayGroupID:v8 sessionStateCounter:v5];
        }
      }
      else
      {
        id v12 = 0;
      }
    }
  }
  else
  {
    id v12 = 0;
  }
}

- (void)sendConnectedLinkInfoToAVCForSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sendConnectedLinkInfoToAVCForSessionID %@", buf, 0xCu);
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
  uint64_t v6 = 0;
  if (v4)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v8 = 0;
    if (cbuuidToLinks)
    {
      id v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v4);
      uint64_t v6 = v9;
      if (v9)
      {
        id v10 = (id)CFDictionaryGetValue((CFDictionaryRef)v9, @"IDSLinkGlobalKey");
        id v8 = v10;
        if (v10) {
          [v10 sendConnectedLinkInfoToAVC];
        }
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)reportLinkEventForSessionID:(id)a3 eventName:(id)a4 linkID:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 1024;
    int v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "reportLinkEventForSessionID %@, eventName:%@, linkID: %d", buf, 0x1Cu);
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
  id v11 = 0;
  if (v8)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    id v13 = 0;
    if (cbuuidToLinks)
    {
      unsigned int v14 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v8);
      id v11 = v14;
      if (v14)
      {
        id v15 = (id)CFDictionaryGetValue((CFDictionaryRef)v14, @"IDSLinkGlobalKey");
        id v13 = v15;
        if (v15) {
          [v15 reportLinkEvent:v9 linkID:v5];
        }
      }
      else
      {
        id v13 = 0;
      }
    }
  }
  else
  {
    id v13 = 0;
  }
}

- (void)reportLinkMetricsForSessionID:(id)a3 linkID:(unsigned __int8)a4 lastPacketReceivedTime:(double)a5 lastPacketSentTime:(double)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v18 = v10;
    __int16 v19 = 1024;
    int v20 = v8;
    __int16 v21 = 2048;
    double v22 = a5;
    __int16 v23 = 2048;
    double v24 = a6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "reportLinkMetricsForSessionID %@, linkID: %d, lastPacketReceivedTime: %f, lastPacketSentTime: %f", buf, 0x26u);
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
  id v12 = 0;
  if (v10)
  {
    cbuuidToLinks = self->_cbuuidToLinks;
    unsigned int v14 = 0;
    if (cbuuidToLinks)
    {
      id v15 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v10);
      id v12 = v15;
      if (v15)
      {
        int v16 = (id)CFDictionaryGetValue((CFDictionaryRef)v15, @"IDSLinkGlobalKey");
        unsigned int v14 = v16;
        if (v16) {
          [v16 reportLinkMetricsForLinkID:v8 lastPacketReceivedTime:a5 lastPacketSentTime:a6];
        }
      }
      else
      {
        unsigned int v14 = 0;
      }
    }
  }
  else
  {
    unsigned int v14 = 0;
  }
}

- (void)setClientUniquePID:(unint64_t)a3 sessionID:(id)a4
{
  id v6 = a4;
  id v7 = 0;
  if (v6
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (id v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6),
        (id v7 = v9) != 0)
    && (id v10 = (id)CFDictionaryGetValue((CFDictionaryRef)v9, @"IDSLinkGlobalKey")) != 0)
  {
    id v11 = v10;
    [v10 setClientUniquePID:a3];
  }
  else
  {
    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setClientUniquePID could not find GlobalLink for session %@", buf, 0xCu);
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

- (void)requestChildConnectionIDForLinkID:(char)a3 sessionID:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = 0;
  if (v6
    && (cbuuidToLinks = self->_cbuuidToLinks) != 0
    && (id v9 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v6),
        (id v7 = v9) != 0)
    && (id v10 = (id)CFDictionaryGetValue((CFDictionaryRef)v9, @"IDSLinkGlobalKey")) != 0)
  {
    id v11 = v10;
    [v10 requestChildConnectionIDForLinkID:v4 relayGroupID:v6];
  }
  else
  {
    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "requestChildConnectionIDForLinkID could not find GlobalLink for session %@", buf, 0xCu);
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

- (void)setIsOnPhoneCall:(BOOL)a3 forDeviceID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setIsOnPhoneCall %@ for deviceID %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v9 = v4 ? @"YES" : @"NO";
    id v11 = v9;
    id v12 = v6;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      id v11 = v9;
      id v12 = v6;
      _IDSLogV();
    }
  }
  if (objc_msgSend(v6, "isEqualToString:", kIDSDefaultPairedDeviceID, v11, v12))
  {
    BOOL isDefaultDeviceOnPhoneCall = self->_isDefaultDeviceOnPhoneCall;
    self->_BOOL isDefaultDeviceOnPhoneCall = v4;
    if (isDefaultDeviceOnPhoneCall && !v4 && self->_shouldBringWiFiDown) {
      [(IDSLinkManager *)self _bringUpWiFi:0];
    }
  }
}

- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v20 = a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ didConnectForDevice %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v18 = v8;
    id v19 = v9;
    _IDSLogV();
  }
  -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v9, v18, v19);
  if (self->_hasFixedDestination)
  {
    id v11 = [(NSDictionary *)self->_deviceIDToUDPDestinations allKeys];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v16 = +[IDSWPLinkManager sharedInstance];
          [v16 setAlwaysConnectedForCBUUID:v15];
        }
        id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
    id v21 = v8;
    id v17 = v11;
    IDSTransportThreadAddBlockAfter();
  }
}

- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ didDisconnectForDevice %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v13 = v8;
    id v14 = v10;
    _IDSLogV();
  }
  id v12 = -[IDSLinkManager _linkKeyForLink:](self, "_linkKeyForLink:", v8, v13, v14);
  [(IDSLinkManager *)self _removeLinkForDeviceID:v10 linkKey:v12 verifyWithLink:v8];
  if (([v12 isEqualToString:@"IDSLinkBTKey"] & 1) != 0
    || [v12 isEqualToString:@"IDSLinkBTLEKey"])
  {
    [(IDSBTLinkManager *)self->_btLinkManager removeLink:v8];
    [(IDSWPLinkManager *)self->_wpLinkManager removeLink:v8];
  }
}

- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int64_t var2 = a4->var2;
  int64x2_t v14 = vdupq_n_s64(1uLL);
  v14.i64[0] = var2;
  *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v14);
  if (var2 >= 1)
  {
    if ((*a4->var0 & 0xE0) == 0x40 && !a4->var6)
    {
      [(IDSLinkManager *)self _processLMCommandPacket:a4 fromLink:v10 deviceUniqueID:v11 cbuuid:v12];
      unsigned __int8 v17 = 1;
      goto LABEL_10;
    }
    if ((*a4->var0 & 0x20) != 0) {
      kdebug_trace();
    }
  }
  uint64_t v15 = [v10 alternateDelegate];
  id v16 = v15;
  if (v15)
  {
    unsigned __int8 v17 = [v15 link:self didReceivePacket:a4 fromDeviceUniqueID:v11 cbuuid:v12];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v17 = [WeakRetained link:self didReceivePacket:a4 fromDeviceUniqueID:v11 cbuuid:v12];
  }
LABEL_10:

  return v17;
}

- (void)link:(id)a3 hostAwakeDidChange:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6
{
  id v7 = [a3 cbuuid];
  unsigned int v8 = [v7 isEqualToString:kIDSDefaultPairedDeviceID];

  if (v8)
  {
    id v9 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100260508;
    block[3] = &unk_100986EF0;
    BOOL v11 = a4;
    dispatch_async(v9, block);
  }
}

- (void)link:(id)a3 hasSpaceAvailable:(BOOL)a4 deviceUniqueID:(id)a5 cbuuid:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!self->_isCentral && self->_doesDefaultDevicePreferInfraWiFi && self->_currentDefaultDeviceLinkType == 1)
  {
    int64x2_t v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "default device is in preferInfraWiFi handshake, skip notifying BTLink hasSpaceAvailable.", v15, 2u);
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
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self hasSpaceAvailable:v8 deviceUniqueID:v11 cbuuid:v12];
  }
}

- (void)link:(id)a3 didReceiveSKEData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 alternateDelegate];
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v8;
    __int16 v13 = 1024;
    unsigned int v14 = [v7 length];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didReceiveSKEData - alternateDelegate:%@, skeData:%d bytes.", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v10 = [v7 length];
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        objc_msgSend(v7, "length", v8, v10);
        _IDSLogV();
      }
    }
  }
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 link:self didReceiveSKEData:v7];
  }
}

- (void)link:(id)a3 didReceiveKeyMaterialMessageData:(id)a4 fromParticipantIDs:(id)a5 toParticipantID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = [v10 alternateDelegate];
  uint64_t v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    unsigned __int8 v17 = v14;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "didReceiveKeyMaterialMessage - alternateDelegate:%@ from %@ to %@", buf, 0x20u);
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
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v14 link:self didReceiveKeyMaterialMessageData:v11 fromParticipantIDs:v12 toParticipantID:v13];
  }
}

- (void)link:(id)a3 didReceiveMaterialInfo:(id)a4 material:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 alternateDelegate];
  id v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    unsigned int v14 = v11;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo - alternateDelegate:%@ materialInfo:%@", buf, 0x16u);
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
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v11 link:self didReceiveMaterialInfo:v9 material:v10];
  }
}

- (void)link:(id)a3 didConnectOverCloud:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_shouldStartBTLinkManager)
  {
    id v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didConnectOverCloud for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v14 = v10;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v14 = v10;
          _IDSLogV();
        }
      }
    }
    -[IDSLinkManager _setBestLinkToCurrent:](self, "_setBestLinkToCurrent:", v10, v14);
    if ([v10 isEqualToString:kIDSDefaultPairedDeviceID])
    {
      [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:self->_lastSentDefaultDeviceConnectivity isCloudConnected:1];
    }
    else
    {
      id v13 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100260F04;
      block[3] = &unk_10097E4D0;
      id v16 = v10;
      dispatch_async(v13, block);
    }
  }
  else
  {
    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not processing didConnectOverCloud in the IPsecLink path.", buf, 2u);
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

- (void)link:(id)a3 didFailToConnectOverCloud:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didFailToConnectOverCloud for %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v13 = v10;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v13 = v10;
        _IDSLogV();
      }
    }
  }
  -[IDSLinkManager disconnectGlobalLinkForDevice:isReinitiating:completionHandler:](self, "disconnectGlobalLinkForDevice:isReinitiating:completionHandler:", v10, 0, 0, v13);
  [(IDSLinkManager *)self _setBestLinkToCurrent:v10];
  if ([v10 isEqualToString:kIDSDefaultPairedDeviceID])
  {
    [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:self->_lastSentDefaultDeviceConnectivity isCloudConnected:0];
  }
  else
  {
    id v12 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100261188;
    block[3] = &unk_10097E4D0;
    id v15 = v10;
    dispatch_async(v12, block);
  }
}

- (void)link:(id)a3 didDisconnectOverCloud:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didDisconnectOverCloud for %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v17 = v10;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v17 = v10;
        _IDSLogV();
      }
    }
  }
  -[IDSLinkManager stopGlobalLinkForDevice:](self, "stopGlobalLinkForDevice:", v10, v17);
  [(IDSLinkManager *)self _setBestLinkToCurrent:v10];
  id v12 = [v8 cbuuid];
  uint64_t v13 = kIDSDefaultPairedDeviceID;
  unsigned int v14 = [v12 isEqualToString:kIDSDefaultPairedDeviceID];

  if (v14)
  {
    [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:self->_lastSentDefaultDeviceConnectivity isCloudConnected:0];
    if (self->_delayedDefaultDeviceAllocateRequest)
    {
      id v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "allocation request was delayed, retry...", buf, 2u);
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
      [(IDSLinkManager *)self _startAllocateRequestForDevice:v13];
    }
  }
  else
  {
    id v16 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002614F8;
    block[3] = &unk_10097E4D0;
    id v19 = v10;
    dispatch_async(v16, block);
  }
}

- (void)link:(id)a3 didConnectUnderlyingLink:(char)a4 linkUUID:(id)a5 localAttributes:(id)a6 remoteAttributes:(id)a7
{
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v12 alternateDelegate];
  id v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v16;
    __int16 v20 = 1024;
    int v21 = v10;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "didConnectUnderlyingLink - alternateDelegate:%@, linkID:%d, linkUUID:%@.", buf, 0x1Cu);
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
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v16 link:self didConnectUnderlyingLink:v10 linkUUID:v13 localAttributes:v14 remoteAttributes:v15];
  }
}

- (void)link:(id)a3 didReceiveChildConnections:(id)a4 forLinkID:(char)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 alternateDelegate];
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 1024;
    int v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didReceiveChildConnectionID - alternateDelegate:%@, connections:%@ linkID:%d", buf, 0x1Cu);
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
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v10 link:self didReceiveChildConnections:v9 forLinkID:v5];
  }
}

- (void)link:(id)a3 didReceiveReliableUnicastServerMaterial:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 alternateDelegate];
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didReceiveReliableUnicastServerMaterial - material: %@", buf, 0xCu);
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
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 link:self didReceiveReliableUnicastServerMaterial:v7];
  }
}

- (void)link:(id)a3 didDisconnectUnderlyingLinkID:(char)a4 linkUUID:(id)a5 reason:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = [v10 alternateDelegate];
  id v13 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v15 = v12;
    __int16 v16 = 1024;
    int v17 = v8;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 1024;
    int v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "didDisconnectUnderlyingLinkID - alternateDelegate:%@, linkID:%d, linkUUID:%@, reason: %d", buf, 0x22u);
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
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 link:self didDisconnectUnderlyingLinkID:v8 linkUUID:v11 reason:v6];
  }
}

- (void)link:(id)a3 didDefaultUnderlyingLinkChangeSucceeded:(BOOL)a4 currentDefaultLinkID:(char)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 alternateDelegate];
  id v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v9;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didDefaultUnderlyingLinkChangeSucceeded - alternateDelegate:%@, currentDefaultLinkID:%d.", buf, 0x12u);
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
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v9 link:self didDefaultUnderlyingLinkChangeSucceeded:v6 currentDefaultLinkID:v5];
  }
}

- (void)link:(id)a3 didWiFiNWPathFlagsChanged:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [v6 alternateDelegate];
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didWiFiNWPathFlagsChanged - alternateDelegate:%@, nwPathFlags:%u.", buf, 0x12u);
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
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 link:self didWiFiNWPathFlagsChanged:v4];
  }
}

- (void)link:(id)a3 didCellularNWPathFlagsChanged:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [v6 alternateDelegate];
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didCellularNWPathFlagsChanged - alternateDelegate:%@, nwPathFlags:%u.", buf, 0x12u);
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
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 link:self didCellularNWPathFlagsChanged:v4];
  }
}

- (void)link:(id)a3 didRATChange:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [v6 alternateDelegate];
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v7;
    __int16 v11 = 2080;
    uint64_t v12 = IDSRadioAccessTechnologyToString();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didRATChange - alternateDelegate:%@, newRAT:%s.", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      IDSRadioAccessTechnologyToString();
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        IDSRadioAccessTechnologyToString();
        _IDSLogV();
      }
    }
  }
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 link:self didRATChange:v4];
  }
}

- (void)link:(id)a3 didCellularMTUChange:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [v6 alternateDelegate];
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didCellularMTUChange - alternateDelegate:%@, cellular MTU:%u.", buf, 0x12u);
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
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 link:self didCellularMTUChange:v4];
  }
}

- (void)link:(id)a3 didGetLinkProbingStatus:(id)a4
{
  id v7 = a4;
  id v6 = [a3 alternateDelegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 link:self didGetLinkProbingStatus:v7];
  }
}

- (void)terminateCallDueToIdleClientForLink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 alternateDelegate];
  id v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "terminateCallDueToIdleClientForLink - alternateDelegate:%@", buf, 0xCu);
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
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 terminateCallDueToIdleClientForLink:self];
  }
}

- (void)link:(id)a3 didReceiveSessionInfo:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 status:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = [v12 alternateDelegate];
  int v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v14;
    __int16 v20 = 2112;
    id v21 = v15;
    __int16 v22 = 1024;
    int v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "receive session-info for group %@, session %@, status: %u.", buf, 0x1Cu);
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
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v16 link:self didReceiveSessionInfo:v13 relayGroupID:v14 relaySessionID:v15 status:v7];
  }
}

- (void)link:(id)a3 didFinishConvergenceForRelaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 alternateDelegate];
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didFinishConvergenceForRelaySessionID: %@.", buf, 0xCu);
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
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 link:self didFinishConvergenceForRelaySessionID:v7];
  }
}

- (void)link:(id)a3 didReceiveSessionStats:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 success:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = [v12 alternateDelegate];
  int v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v20 = v14;
    __int16 v21 = 2112;
    if (v7) {
      CFStringRef v18 = @"YES";
    }
    id v22 = v15;
    __int16 v23 = 2112;
    CFStringRef v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "receive session stats for group %@, session %@, success: %@.", buf, 0x20u);
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
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v16 link:self didReceiveSessionStats:v13 relayGroupID:v14 relaySessionID:v15 success:v7];
  }
}

- (void)link:(id)a3 didReceiveReportEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 alternateDelegate];
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didReceiveReportEvent - alternateDelegate:%@, eventDictionary:%@", buf, 0x16u);
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
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 link:self didReceiveReportEvent:v7];
  }
}

- (void)link:(id)a3 didAddQREvent:(id)a4
{
  id v7 = a4;
  id v6 = [a3 alternateDelegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 link:self didAddQREvent:v7];
  }
}

- (void)link:(id)a3 didReceiveParticipantUpdate:(id)a4 status:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v9 = a4;
  id v8 = [a3 alternateDelegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 link:self didReceiveParticipantUpdate:v9 status:v5];
  }
}

- (void)link:(id)a3 didReceivePluginRegistration:(unint64_t)a4 pluginName:(id)a5
{
  id v9 = a5;
  id v8 = [a3 alternateDelegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 link:self didReceivePluginRegistration:a4 pluginName:v9];
  }
}

- (void)link:(id)a3 didReceivePluginUnregistration:(unint64_t)a4 pluginName:(id)a5
{
  id v9 = a5;
  id v8 = [a3 alternateDelegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 link:self didReceivePluginUnregistration:a4 pluginName:v9];
  }
}

- (void)link:(id)a3 didReceiveRequestToPurgeRegistration:(id)a4
{
  id v7 = a4;
  id v6 = [a3 alternateDelegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 link:self didReceiveRequestToPurgeRegistration:v7];
  }
}

- (void)link:(id)a3 didReceivePluginDisconnect:(id)a4
{
  id v7 = a4;
  id v6 = [a3 alternateDelegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 link:self didReceivePluginDisconnect:v7];
  }
}

- (void)link:(id)a3 didReceiveMappedParticipantsDict:(id)a4 forLinkID:(char)a5
{
  uint64_t v5 = a5;
  id v9 = a4;
  id v8 = [a3 alternateDelegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 link:self didReceiveMappedParticipantsDict:v9 forLinkID:v5];
  }
}

- (void)link:(id)a3 didReceiveSessionStateCounter:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [a3 alternateDelegate];
  id v7 = (void *)v6;
  if (v6)
  {
    id v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector();
    id v7 = v9;
    if (v8)
    {
      [v9 link:self didReceiveSessionStateCounter:v4];
      id v7 = v9;
    }
  }
}

- (void)didReceiveBlockedIndicationForLink:(id)a3 reason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [a3 alternateDelegate];
  id v7 = (void *)v6;
  if (v6)
  {
    id v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector();
    id v7 = v9;
    if (v8)
    {
      [v9 didReceiveBlockedIndicationForLink:self reason:v4];
      id v7 = v9;
    }
  }
}

- (void)link:(id)a3 didReceiveEncryptedDataBlobs:(id)a4
{
  id v7 = a4;
  uint64_t v6 = [a3 alternateDelegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 link:self didReceiveEncryptedDataBlobs:v7];
  }
}

- (void)link:(id)a3 didReceiveErrorIndicationWithCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [a3 alternateDelegate];
  id v7 = (void *)v6;
  if (v6)
  {
    id v9 = (void *)v6;
    char v8 = objc_opt_respondsToSelector();
    id v7 = v9;
    if (v8)
    {
      [v9 link:self didReceiveErrorIndicationWithCode:v4];
      id v7 = v9;
    }
  }
}

- (void)manager:(id)a3 didPowerStateChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"OFF";
    if (v4) {
      CFStringRef v7 = @"ON";
    }
    *(_DWORD *)buf = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    CFStringRef v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ reported power state change: %@", buf, 0x16u);
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
  if (!v4)
  {
    id v8 = v5;
    IDSTransportThreadAddBlock();
  }
}

- (void)manager:(id)a3 linkDidConnect:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)manager:(id)a3 linkDidDisconnect:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)manager:(id)a3 didPairedDeviceChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && !self->_isCentral)
  {
    CFStringRef v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ reported paired device change.", buf, 0xCu);
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
    id v8 = v6;
    IDSTransportThreadAddBlock();
  }
}

- (void)_handleNetworkChanges:(id)a3
{
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = a3;
  int v4 = 0;
  id v5 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v5)
  {
    uint64_t v55 = 0;
    uint64_t v6 = *(void *)v62;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v62 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(__CFString **)(*((void *)&v61 + 1) + 8 * i);
        if (([(__CFString *)v8 hasPrefix:@"State:/Network/Interface/utun", v53] & 1) == 0)
        {
          if ([(__CFString *)v8 hasPrefix:@"State:/Network/Interface/en1"])
          {
            id v9 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_handleNetworkChanges ignores en1 interface", buf, 2u);
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
          else
          {
            unsigned int v10 = [(__CFString *)v8 hasPrefix:@"State:/Network/Interface/pdp_ip"];
            __int16 v11 = (void *)SCDynamicStoreCopyValue(self->_dynamicStore, v8);
            v4 |= v10 ^ 1;
            if (v11)
            {
              CFTypeID TypeID = CFDictionaryGetTypeID();
              if (TypeID == CFGetTypeID(v11)) {
                CFDictionaryRef v13 = v11;
              }
              else {
                CFDictionaryRef v13 = 0;
              }
              id v15 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                if (v13) {
                  Value = CFDictionaryGetValue(v13, @"Addresses");
                }
                else {
                  Value = 0;
                }
                *(_DWORD *)buf = 138412546;
                long long v67 = v8;
                __int16 v68 = 2112;
                long long v69 = Value;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "_handleNetworkChanges %@ = %@", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
              {
                int v17 = v13 ? CFDictionaryGetValue(v13, @"Addresses") : 0;
                CFStringRef v53 = (IDSSockAddrWrapper *)v8;
                __int16 v54 = v17;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  if (v13) {
                    CFStringRef v18 = CFDictionaryGetValue(v13, @"Addresses");
                  }
                  else {
                    CFStringRef v18 = 0;
                  }
                  CFStringRef v53 = (IDSSockAddrWrapper *)v8;
                  __int16 v54 = v18;
                  _IDSLogV();
                }
              }
              CFRelease(v11);
              if ([(__CFString *)v8 hasSuffix:@"/IPv4"]) {
                LODWORD(v55) = 1;
              }
              else {
                HIDWORD(v55) |= [(__CFString *)v8 hasSuffix:@"/IPv6"];
              }
            }
            else
            {
              id v14 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                long long v67 = v8;
                __int16 v68 = 2112;
                long long v69 = 0;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_handleNetworkChanges %@ = %@", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  CFStringRef v53 = (IDSSockAddrWrapper *)v8;
                  __int16 v54 = 0;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    CFStringRef v53 = (IDSSockAddrWrapper *)v8;
                    __int16 v54 = 0;
                    _IDSLogV();
                  }
                }
              }
              if ([(__CFString *)v8 hasSuffix:@"/IPv4", v53, v54]) {
                LODWORD(v55) = 1;
              }
              else {
                HIDWORD(v55) |= [(__CFString *)v8 hasSuffix:@"/IPv6"];
              }
            }
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v55 = 0;
  }

  [(NSMutableDictionary *)self->_cbuuidToLinks allKeys];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = 0;
  id v21 = [v19 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v58;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v58 != v22) {
          objc_enumerationMutation(v19);
        }
        CFStringRef v24 = *(const void **)(*((void *)&v57 + 1) + 8 * (void)j);
        cbuuidToLinks = self->_cbuuidToLinks;
        if (cbuuidToLinks) {
          BOOL v26 = v24 == 0;
        }
        else {
          BOOL v26 = 1;
        }
        if (v26)
        {
          uint64_t v27 = 0;
        }
        else
        {
          id v28 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v24);
          uint64_t v27 = v28;
          if (v28)
          {
            __int16 v29 = (id)CFDictionaryGetValue((CFDictionaryRef)v28, @"IDSLinkGlobalKey");

            if (v29)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v29 handleNetworkAddressChanges:v55 & 1 hasIPv6AddressChange:BYTE4(v55) & 1];
                if (((v55 ^ 1 | BYTE4(v55)) & 1) == 0) {
                  [v29 handleNetworkAddressChanges:0 hasIPv6AddressChange:1];
                }
              }
              id v20 = v29;
            }
            else
            {
              id v20 = 0;
            }
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v21);
  }

  if (v4 & v55)
  {
    uint64_t v30 = kIDSDefaultPairedDeviceID;
    id v31 = [(IDSLinkManager *)self _newUDPLinkForDeviceUniqueID:0 cbuuid:kIDSDefaultPairedDeviceID IPVersion:0 port:0];
    id v32 = [v31 copyCurrentNetworkInterfaces];
    id v33 = v32;
    if (self->_isDefaultDeviceUsingBTLink)
    {
      if (!self->_isCentral && self->_doesDefaultDevicePreferInfraWiFi && ![v32 count])
      {
        [(IDSLinkManager *)self _suspendBTLink:0 cbuuid:v30];
LABEL_107:
        CFStringRef v51 = objc_msgSend(v33, "firstObject", v53);
        __int16 v52 = [v51 address];
        [v31 reconnectWithLocalAddress:v52];

        goto LABEL_108;
      }
      goto LABEL_73;
    }
    id v37 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      localWiFiAddressUsedForDefaultDevice = self->_localWiFiAddressUsedForDefaultDevice;
      *(_DWORD *)buf = 138412290;
      long long v67 = localWiFiAddressUsedForDefaultDevice;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "_handleNetworkChanges _localWiFiAddressUsedForDefaultDevice = %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        CFStringRef v53 = self->_localWiFiAddressUsedForDefaultDevice;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          CFStringRef v53 = self->_localWiFiAddressUsedForDefaultDevice;
          _IDSLogV();
        }
      }
    }
    if (!objc_msgSend(v33, "count", v53))
    {
      if (self->_doesDefaultDevicePreferInfraWiFi)
      {
        [(IDSLinkManager *)self _suspendBTLink:0 cbuuid:v30];
        if (self->_isCentral)
        {
          ids_monotonic_time();
          self->_rejectedPreferInfraWiFi = v44;
          [(IDSLinkManager *)self _sendUDPLinkInterfaceAddresses:v31 toDeviceID:v30 isRetransmission:0 isReply:0];
        }
      }
      else
      {
        [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:0 isCloudConnected:self->_lastSentDefaultDeviceCloudConnectivity];
      }
      goto LABEL_107;
    }
    id v39 = [v33 firstObject];
    CFDictionaryRef v40 = v39;
    if (self->_isWiFiBroughtUp)
    {
      id v41 = self->_localWiFiAddressUsedForDefaultDevice;
      if (!self->_isCentral)
      {
        CFDictionaryRef v47 = [v39 address];
        unsigned __int8 v48 = [(IDSSockAddrWrapper *)v41 isEqualToWrapper:v47];

        char v49 = [v33 firstObject];
        double v50 = [v49 address];
        [v31 reconnectWithLocalAddress:v50];

        if ((v48 & 1) == 0) {
          goto LABEL_108;
        }
LABEL_74:
        if (v31) {
          [(IDSLinkManager *)self _sendUDPLinkInterfaceAddresses:v31 toDeviceID:v30 isRetransmission:0 isReply:0];
        }
        if (self->_delayedDefaultDeviceAllocateRequest)
        {
          id v36 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "receive WiFi IP address, start QR allocation.", buf, 2u);
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
          [(IDSLinkManager *)self _startAllocateRequestForDevice:v30];
        }
        goto LABEL_108;
      }
      if (!v41
        || ([v39 address],
            CFStringRef v42 = objc_claimAutoreleasedReturnValue(),
            unsigned int v43 = [(IDSSockAddrWrapper *)v41 isEqualToWrapper:v42],
            v42,
            v43))
      {
        self->_shouldKeepWiFiUp = 1;

LABEL_73:
        id v34 = objc_msgSend(v33, "firstObject", v53);
        __int16 v35 = [v34 address];
        [v31 reconnectWithLocalAddress:v35];

        goto LABEL_74;
      }
    }
    else
    {
      [(IDSLinkManager *)self _connectivityChangedForDefaultDevice:0 isCloudConnected:self->_lastSentDefaultDeviceCloudConnectivity];
    }

    id v45 = [v33 firstObject];
    __int16 v46 = [v45 address];
    [v31 reconnectWithLocalAddress:v46];

LABEL_108:
  }
}

- (void)currentLinkType:(unint64_t *)a3 andRATType:(unsigned int *)a4 forDeviceID:(id)a5
{
  id v8 = a5;
  *a3 = 0;
  *a4 = 0;
  if ([v8 isEqualToString:kIDSDefaultPairedDeviceID])
  {
    *a3 = self->_currentDefaultDeviceLinkType;
  }
  else
  {
    Value = 0;
    if (v8 && self->_deviceIDToCurrentLink) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, v8);
    }
    id v10 = Value;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v10 defaultLinkType];
      *a3 = (unint64_t)v11;
      if (v11 == (id)4)
      {
        CFStringRef v12 = +[IDSCellularLinkMonitor sharedInstance];
        *a4 = [v12 radioAccessTechnology];
      }
      else
      {
        *a4 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
        *a3 = 2;
      }
    }
    CFDictionaryRef v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = *a3;
      uint64_t v15 = *a4;
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = v14;
      __int16 v18 = 2048;
      uint64_t v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "LinkType %lu, RATType %lu for non-FaceTime clients", buf, 0x16u);
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

- (id)linkForCBUUID:(id)a3
{
  Value = 0;
  if (a3)
  {
    CFDictionaryRef deviceIDToCurrentLink = self->_deviceIDToCurrentLink;
    if (deviceIDToCurrentLink) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)deviceIDToCurrentLink, a3);
    }
  }
  id v6 = Value;

  return v6;
}

- (unint64_t)currentLinkType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kIDSDefaultPairedDeviceID])
  {
    unint64_t currentDefaultDeviceLinkType = self->_currentDefaultDeviceLinkType;
  }
  else
  {
    Value = 0;
    if (v4 && self->_deviceIDToCurrentLink) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_deviceIDToCurrentLink, v4);
    }
    id v7 = Value;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t currentDefaultDeviceLinkType = (unint64_t)[v7 defaultLinkType];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
        unint64_t currentDefaultDeviceLinkType = 2;
      }
      else {
        unint64_t currentDefaultDeviceLinkType = 0;
      }
    }
    id v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v4;
      __int16 v12 = 1024;
      int v13 = currentDefaultDeviceLinkType;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "current link type for %@ is %d.", buf, 0x12u);
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
  return currentDefaultDeviceLinkType;
}

- (id)_getIDSLinkTypeString:(unint64_t)a3
{
  if (a3 > 6) {
    return @"UnexpectedType";
  }
  else {
    return *(&off_100987158 + a3);
  }
}

- (unint64_t)_getIDSLinkTypeFromWRMLinkType:(unint64_t)a3
{
  if (a3 > 3) {
    return 6;
  }
  else {
    return qword_1007945D0[a3];
  }
}

- (unint64_t)_getWRMLinkTypeFromIDSLinkType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 2;
  }
  else {
    return qword_1007945F0[a3 - 1];
  }
}

- (void)_handleWRMLinkRecommendation:(unint64_t)a3
{
  int v3 = a3;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WRM recommends the link type %u, but IDS ignores WRM recommendations per rdar://problem/33602915 discussion", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_subscribeToWRMForLinkRecommendation:(unint64_t)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002651AC;
  v7[3] = &unk_1009870D0;
  v7[4] = self;
  id v4 = objc_retainBlock(v7);
  id v5 = +[IDSWRMExchange sharedInstance];
  int v6 = dispatch_get_global_queue(-32768, 0);
  [v5 subscribeForRecommendation:v6 recommendationType:a3 block:v4];
}

- (void)_unsubscribeFromWRMForLinkRecommendation
{
  id v2 = +[IDSWRMExchange sharedInstance];
  [v2 unsubscribeForRecommendation];
}

- (void)cellularRadioAccessTechnologyDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cellular RAT changed, usable: %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v7 = v3 ? @"YES" : @"NO";
    __int16 v23 = v7;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      __int16 v23 = v7;
      _IDSLogV();
    }
  }
  if (v3)
  {
    id v8 = [(NSMutableDictionary *)self->_cbuuidToLinks allKeys];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v8;
    id v10 = 0;
    id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        int v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          unint64_t v14 = *(const void **)(*((void *)&v24 + 1) + 8 * (void)v13);
          cbuuidToLinks = self->_cbuuidToLinks;
          if (cbuuidToLinks) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {
            unint64_t v17 = 0;
          }
          else
          {
            __int16 v18 = (id)CFDictionaryGetValue((CFDictionaryRef)cbuuidToLinks, v14);
            unint64_t v17 = v18;
            if (v18)
            {
              uint64_t v19 = (id)CFDictionaryGetValue((CFDictionaryRef)v18, @"IDSLinkGlobalKey");

              if (v19)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v19 handleCellularRATChange];
                }
                id v10 = v19;
              }
              else
              {
                id v10 = 0;
              }
            }
          }

          int v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    if (!self->_delayedDefaultDeviceAllocateRequest) {
      goto LABEL_41;
    }
    id v20 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v30 = (const __CFString *)kIDSDefaultPairedDeviceID;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "celluar data is usable, retry QR allocation for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      int v21 = _IDSShouldLogTransport();
      uint64_t v22 = kIDSDefaultPairedDeviceID;
      if (v21)
      {
        __int16 v23 = (__CFString *)kIDSDefaultPairedDeviceID;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          _IDSLogV();
          -[IDSLinkManager _startAllocateRequestForDevice:](self, "_startAllocateRequestForDevice:", v22, v22);
LABEL_41:

          return;
        }
      }
    }
    else
    {
      uint64_t v22 = kIDSDefaultPairedDeviceID;
    }
    -[IDSLinkManager _startAllocateRequestForDevice:](self, "_startAllocateRequestForDevice:", v22, v23);
    goto LABEL_41;
  }
}

- (void)cellularSoMaskDidChange:(unsigned int)a3
{
  id v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cellular SoMask changed: %u.", buf, 8u);
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
  IDSTransportThreadAddBlock();
}

- (unint64_t)currentDefaultDeviceLinkType
{
  return self->_currentDefaultDeviceLinkType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIDToIDSContextBlob, 0);
  objc_storeStrong((id *)&self->_sessionIDToCellInterfaceName, 0);
  objc_storeStrong((id *)&self->_sessionIDToPluginNameToPluginOptionsDict, 0);
  objc_storeStrong((id *)&self->_sessionIDToSharedSessionHasJoined, 0);
  objc_storeStrong((id *)&self->_timeBase, 0);
  objc_storeStrong((id *)&self->_localWiFiAddressUsedForDefaultDevice, 0);
  objc_storeStrong((id *)&self->_defaultDeviceCbuuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reporterTimer, 0);
  objc_storeStrong((id *)&self->_fixedInterfaceDestination, 0);
  objc_storeStrong((id *)&self->_fixedInterface, 0);
  objc_storeStrong(&self->_WiFiPowerAssertion, 0);
  objc_storeStrong((id *)&self->_currentWiFiSSID, 0);
  objc_storeStrong(&self->_WiFiAssociationFailureHandler, 0);
  objc_storeStrong((id *)&self->_deviceIDToGlobalLinkUp, 0);
  objc_storeStrong((id *)&self->_deviceIDToAllocRequests, 0);
  objc_storeStrong((id *)&self->_wpLinkManager, 0);
  objc_storeStrong((id *)&self->_btLinkManager, 0);
  objc_storeStrong((id *)&self->_deviceIDToUDPDestinations, 0);
  objc_storeStrong((id *)&self->_deviceIDToCurrentLink, 0);

  objc_storeStrong((id *)&self->_cbuuidToLinks, 0);
}

@end