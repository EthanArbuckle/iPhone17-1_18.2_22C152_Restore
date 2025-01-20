@interface IDSUTunDeliveryController
+ (IDSUTunDeliveryController)sharedInstance;
- (BOOL)defaultPeerIsCloudConnected;
- (BOOL)defaultPeerIsNearby;
- (BOOL)enableOTR;
- (BOOL)hasSpaceForCloudMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4;
- (BOOL)hasSpaceForMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4;
- (BOOL)isClassCConnected;
- (BOOL)isCloudConnected;
- (BOOL)isConnected;
- (BOOL)isLocalSetUpInProgress;
- (BOOL)isPeerForPhoneContinuityLocalMessage:(id)a3;
- (BOOL)isPresent;
- (BOOL)isTerminusConnected;
- (BOOL)isTerminusConnectedOverBluetooth;
- (BOOL)isTerminusNearby;
- (BOOL)isTerminusRegistered;
- (BOOL)localSetupInProgress;
- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice;
- (IDSConnectivityMonitor)connectivityMonitor;
- (IDSNRDeviceBridge)idsNRDeviceBridge;
- (IDSNRDevicePreferencesHandler)nrDevicePreferencesHandler;
- (IDSPairingManager)pairingManager;
- (IDSUTunDeliveryController)init;
- (IDSUTunDeliveryController)initWithBroadcastQueue:(id)a3 pairingManager:(id)a4;
- (IDSUTunDeliveryControllerDelegate)delegate;
- (NSDictionary)defaultPriorityMessageStatistics;
- (NSDictionary)queuedIncomingMessageDictionary;
- (NSDictionary)sendingMessageStatistics;
- (NSDictionary)syncPriorityMessageStatistics;
- (NSDictionary)urgentCloudPriorityMessageStatistics;
- (NSDictionary)urgentPriorityMessageStatistics;
- (NSSet)allowedTrafficClasses;
- (double)lastCloudConnectedTime;
- (double)notificationDelayInSeconds;
- (id)_copyPairedDevice;
- (id)_copyPeerWithID:(id)a3;
- (id)_createPeerFromDeviceID:(id)a3;
- (id)_createPeerFromDeviceInfo:(id)a3;
- (id)_currentOTRTimer;
- (id)_deviceIDForPeer:(id)a3;
- (id)_pairedDeviceUUID;
- (id)hashForString:(id)a3;
- (id)lockedContinuityPeerID:(id)a3;
- (id)pendingContinuityPeerID:(id)a3;
- (id)sessionIDforPeer:(id)a3;
- (id)topicForStreamID:(unsigned __int16)a3;
- (unsigned)_nextMessageID;
- (void)_OTREnableTimerFiredOnMain;
- (void)_cleanupContinuityPeerMaps:(id)a3;
- (void)_disableOTRForDefaultPairedPeer:(id)a3;
- (void)_enableOTRForDefaultPairedDevice;
- (void)_refreshIPsecStatus;
- (void)_removeDevicePreferencesHandler;
- (void)_removePeerFromDeviceID:(id)a3;
- (void)_setCloudConnectionConnected:(BOOL)a3 forPeer:(id)a4;
- (void)_setOTREnableTimer;
- (void)_updateLocalSetupInProgressState:(BOOL)a3;
- (void)addConnectivityDelegate:(id)a3;
- (void)addContinuityPeer:(id)a3 btUUID:(id)a4 connectBlock:(id)a5 failureBlock:(id)a6;
- (void)addUTunPeerWithDeviceUniqueID:(id)a3 btuuid:(id)a4;
- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4;
- (void)cancelMessageID:(id)a3;
- (void)dealloc;
- (void)defaultPeerClassCConnectivityDidChange:(BOOL)a3;
- (void)defaultPeerCloudConnectivityChanged:(BOOL)a3;
- (void)defaultPeerConnectivityChanged:(BOOL)a3;
- (void)defaultPeerDropDisallowedMessages;
- (void)defaultPeerLinkTypeChanged:(unsigned __int8)a3;
- (void)defaultPeerMagnetIndicationOfAwakeStateChanged:(BOOL)a3;
- (void)defaultPeerNearbyChanged:(BOOL)a3;
- (void)defaultPeerSetLinkPreferences:(id)a3;
- (void)defaultPeerSetPreferInfraWiFi:(BOOL)a3 services:(id)a4;
- (void)defaultPeerSetWantsQuickRelayRequest:(BOOL)a3;
- (void)defaultPeerSupportsDirectMessaging:(BOOL)a3 isObliterating:(BOOL)a4;
- (void)defaultPeerUnpairStart;
- (void)deviceWithUniqueID:(id)a3 updatedUUID:(id)a4;
- (void)didAddPairedDevice:(id)a3;
- (void)didRemovePairedDevice:(id)a3;
- (void)didUpdatePairedDevice:(id)a3;
- (void)enableCloudConnectionForDefaultPairedDevice:(BOOL)a3;
- (void)enableConnectionForDefaultPairedDevice:(BOOL)a3;
- (void)enableOTRForDefaultPairedDevice;
- (void)ensureLocalSetupInProgressConsistencyAfterQWS;
- (void)findDefaultPeerToForceOTRNegotiation:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5;
- (void)kickProgressBlockForMessageID:(id)a3;
- (void)legacyUTunBTLinkManagerDefaultPeerCloudConnectivityChanged:(BOOL)a3;
- (void)legacyUTunBTLinkManagerDefaultPeerConnectivityChanged:(BOOL)a3;
- (void)legacyUTunBTLinkManagerDefaultPeerNearbyChanged:(BOOL)a3;
- (void)localAccountSetupCompleted;
- (void)localSetupCompleted;
- (void)localSetupStarted;
- (void)lockContinuityPeer:(id)a3 btUUID:(id)a4;
- (void)nrDeviceBridge:(id)a3 defaultPeerClassCConnectivityDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 defaultPeerCloudConnectivityDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 defaultPeerConnectivityDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 defaultPeerNearbyDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 deviceMagnetIndicationOfAwakeStateDidChange:(BOOL)a4;
- (void)nrDeviceBridge:(id)a3 linkType:(unsigned __int8)a4;
- (void)peer:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16;
- (void)peer:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16;
- (void)peer:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16;
- (void)peer:(id)a3 receivedAppLevelAckWithTopic:(id)a4 fromID:(id)a5 messageID:(id)a6 peerResponseIdentifier:(id)a7 priority:(int64_t)a8 connectionType:(int64_t)a9;
- (void)peerCloudConnectivityChanged:(id)a3;
- (void)peerCloudConnectivityChanged:(id)a3 isCloudConnected:(BOOL)a4;
- (void)peerConnectivityChanged:(id)a3;
- (void)peerHasSpaceForNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
- (void)peerHasSpaceForNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 withTypes:(id)a6;
- (void)peerHasSpaceForUrgentMessages:(id)a3 dataProtectionClass:(unsigned int)a4 withTypes:(id)a5;
- (void)peerNearbyStateChanged:(id)a3 forceNotify:(BOOL)a4;
- (void)prepareForQuickSwitch;
- (void)rapportClient:(id)a3 didDiscoverDevice:(id)a4;
- (void)rapportClient:(id)a3 didLoseDevice:(id)a4;
- (void)removeConnectivityDelegate:(id)a3;
- (void)removeUTunPeerWithDeviceUniqueID:(id)a3 btuuid:(id)a4 reason:(int64_t)a5 shouldWait:(BOOL)a6;
- (void)removeUTunPeerWithSessionID:(id)a3 reason:(int64_t)a4 shouldWait:(BOOL)a5;
- (void)sendData:(id)a3 service:(id)a4 protobuf:(id)a5 resourcePath:(id)a6 resourceMetadata:(id)a7 priority:(int64_t)a8 dataProtectionClass:(unsigned int)a9 nonWaking:(BOOL)a10 nonCloudWaking:(BOOL)a11 requireBluetooth:(BOOL)a12 requireLocalWiFi:(BOOL)a13 queueOneIdentifier:(id)a14 expirationDate:(id)a15 enforceRemoteTimeouts:(BOOL)a16 expectsPeerResponse:(BOOL)a17 wantsAppAck:(BOOL)a18 compressPayload:(BOOL)a19 compressed:(BOOL)a20 peerResponseIdentifier:(id)a21 messageID:(id)a22 topic:(id)a23 awdTopic:(id)a24 command:(id)a25 fromID:(id)a26 uriToDeviceID:(id)a27 localDeviceDestinationDeviceUUID:(id)a28 bypassDuet:(BOOL)a29 duetIdentifiersOverride:(id)a30 messageType:(int64_t)a31 fallbackBlock:(id)a32 progressBlock:(id)a33 completionBlock:(id)a34;
- (void)setAllowedTrafficClasses:(id)a3;
- (void)setConnectivityMonitor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueIDToCBUUID:(id)a3;
- (void)setIdsNRDeviceBridge:(id)a3;
- (void)setIsClassCConnected:(BOOL)a3;
- (void)setIsCloudConnected:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsLocalSetUpInProgress:(BOOL)a3;
- (void)setLastCloudConnectedTime:(double)a3;
- (void)setNotificationDelayInSeconds:(double)a3;
- (void)setNrDevicePreferencesHandler:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setPendingCloudFlagOnDefaultPeer;
- (void)setShouldUseIPsecLinkForDefaultPairedDevice:(BOOL)a3;
- (void)setTopics:(id)a3;
- (void)startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:(id)a3;
- (void)stopIdsNRDeviceBridgeAndPreferenceHandler;
- (void)systemScreenDidPowerDown;
- (void)tryNextContinuityPeer:(id)a3;
- (void)unlockAllContinuityPeers;
- (void)unlockContinuityPeer:(id)a3;
- (void)updatecloudDeliveryStateOnDefaultPeer;
@end

@implementation IDSUTunDeliveryController

+ (IDSUTunDeliveryController)sharedInstance
{
  if (qword_100A4AA48 != -1) {
    dispatch_once(&qword_100A4AA48, &stru_100985988);
  }
  v2 = (void *)qword_100A4AA50;

  return (IDSUTunDeliveryController *)v2;
}

- (IDSUTunDeliveryController)initWithBroadcastQueue:(id)a3 pairingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  im_assert_primary_base_queue();
  v51.receiver = self;
  v51.super_class = (Class)IDSUTunDeliveryController;
  v9 = [(IDSUTunDeliveryController *)&v51 init];
  v10 = v9;
  if (v9)
  {
    if (!v9->_deviceIDToPeer)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      deviceIDToPeer = v10->_deviceIDToPeer;
      v10->_deviceIDToPeer = (NSMutableDictionary *)Mutable;
    }
    if (!v10->_btuuidToSessionID)
    {
      CFMutableDictionaryRef v13 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      btuuidToSessionID = v10->_btuuidToSessionID;
      v10->_btuuidToSessionID = (NSMutableDictionary *)v13;
    }
    pthread_mutex_init(&v10->_deviceIDToPeerLock, 0);
    pthread_mutex_init(&v10->_streamIDToTopicLock, 0);
    pthread_mutex_init(&v10->_trafficClassLock, 0);
    pthread_mutex_init(&v10->_continuityPeerLock, 0);
    v10->_notificationDelayInSeconds = 10.0;
    objc_storeStrong((id *)&v10->_broadcastQueue, a3);
    objc_storeStrong((id *)&v10->_pairingManager, a4);
    v15 = [(IDSPairingManager *)v10->_pairingManager cbuuidsOfPairingDevices];
    v16 = [(IDSPairingManager *)v10->_pairingManager cbuuidsOfPairedDevices];
    if ([v15 count]) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = [v16 count] == 0;
    }
    v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = @"not ";
      if (v17) {
        CFStringRef v19 = &stru_10099BE78;
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v53 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "LOCALSETUP: at launch default local setup does %@need to happen.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v20 = v17 ? &stru_10099BE78 : @"not ";
      v46 = v20;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v46 = v20;
        _IDSLogV();
      }
    }
    v10->_shouldUseIPsecLinkForDefaultPairedDevice = [(IDSPairingManager *)v10->_pairingManager shouldUseIPsecLinkForDefaultPairedDevice];
    v21 = [IDSUTunPeer alloc];
    uint64_t v22 = IDSDeviceDefaultPairedDeviceUniqueID;
    v23 = [(IDSUTunPeer *)v21 initWithIdentifier:@"UTunDelivery-Default" btUUID:0 uniqueID:IDSDeviceDefaultPairedDeviceUniqueID shouldUseIPsecLink:v10->_shouldUseIPsecLinkForDefaultPairedDevice isNearby:0 isClassCConnected:0];
    [(IDSUTunPeer *)v23 setDelegate:v10];
    [(IDSUTunPeer *)v23 setLocalSetupInProgress:v17];
    if ([(IDSPairingManager *)v10->_pairingManager pairedDeviceServiceMinCompatibilityVersion] >= 3)
    {
      v24 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "LOCALSETUP: Enabling Cloud On This Device", buf, 2u);
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
      [(IDSUTunPeer *)v23 setSupportsCloudConnections:1];
    }
    [(NSMutableDictionary *)v10->_deviceIDToPeer setObject:v23 forKey:v22];
    if (v10->_shouldUseIPsecLinkForDefaultPairedDevice) {
      char v25 = 0;
    }
    else {
      char v25 = IMGetDomainBoolForKey() ^ 1;
    }
    v10->_enableOTR = v25;
    v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (v10->_enableOTR) {
        CFStringRef v27 = @"YES";
      }
      else {
        CFStringRef v27 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v53 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "EnableOTR: %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v28 = v10->_enableOTR ? @"YES" : @"NO";
      v47 = v28;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        if (v10->_enableOTR) {
          CFStringRef v29 = @"YES";
        }
        else {
          CFStringRef v29 = @"NO";
        }
        v47 = (__CFString *)v29;
        _IDSLogV();
      }
    }
    if ([(IDSPairingManager *)v10->_pairingManager isPaired])
    {
      v30 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        if (v10->_enableOTR) {
          CFStringRef v31 = @"YES";
        }
        else {
          CFStringRef v31 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v53 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Already paired, set OTR for default paired device: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        v32 = v10->_enableOTR ? @"YES" : @"NO";
        v48 = v32;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          if (v10->_enableOTR) {
            CFStringRef v33 = @"YES";
          }
          else {
            CFStringRef v33 = @"NO";
          }
          v48 = (__CFString *)v33;
          _IDSLogV();
        }
      }
      -[IDSUTunPeer setEnableOTR:](v23, "setEnableOTR:", v10->_enableOTR, v48);
      v10->_otrInitialized = 1;
    }
    [(IDSPairingManager *)v10->_pairingManager addDelegate:v10];
    v10->_messageID = 0;
    v34 = [(IDSUTunDeliveryController *)v10 _pairedDeviceUUID];
    [(IDSUTunDeliveryController *)v10 startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:v34];
    v35 = [(IDSUTunDeliveryController *)v10 idsNRDeviceBridge];
    -[IDSUTunPeer setIsClassCConnected:](v23, "setIsClassCConnected:", [v35 isClassCConnected]);

    [(IDSUTunDeliveryController *)v10 _updateLocalSetupInProgressState:v17];
    v36 = +[IMSystemMonitor sharedInstance];
    [v36 setActive:1];

    v37 = +[IMSystemMonitor sharedInstance];
    [v37 setWatchesScreenLightState:1];

    v38 = +[IMSystemMonitor sharedInstance];
    [v38 addListener:v10];

    v39 = +[IDSRapportClient sharedInstance];
    [v39 addDelegate:v10];

    if (CUTIsInternalInstall())
    {
      v40 = objc_alloc_init(IDSConnectivityMonitor);
      connectivityMonitor = v10->_connectivityMonitor;
      v10->_connectivityMonitor = v40;

      uint64_t v42 = +[NSHashTable weakObjectsHashTable];
      connectivityDelegates = v10->_connectivityDelegates;
      v10->_connectivityDelegates = (NSHashTable *)v42;

      [(NSHashTable *)v10->_connectivityDelegates addObject:v10->_connectivityMonitor];
    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1001DEF3C;
    v49[3] = &unk_1009859B0;
    v50 = v10;
    v44 = im_primary_queue();
    sub_1003319E8(v49, @"IDS-Connectivity-Status", (uint64_t)v44);
  }
  return v10;
}

- (IDSUTunDeliveryController)init
{
  v3 = im_primary_queue();
  v4 = +[IDSPairingManager sharedInstance];
  v5 = [(IDSUTunDeliveryController *)self initWithBroadcastQueue:v3 pairingManager:v4];

  return v5;
}

- (void)dealloc
{
  [(IDSUTunDeliveryController *)self _removeDevicePreferencesHandler];
  v3 = [(IDSUTunDeliveryController *)self pairingManager];
  [v3 removeDelegate:self];

  [(IMTimer *)self->_otrTimer invalidate];
  otrTimer = self->_otrTimer;
  self->_otrTimer = 0;

  v5 = +[IDSRapportClient sharedInstance];
  [v5 removeDelegate:self];

  [(NSMutableDictionary *)self->_deviceIDToPeer enumerateKeysAndObjectsUsingBlock:&stru_1009859F0];
  pthread_mutex_destroy(&self->_deviceIDToPeerLock);
  pthread_mutex_destroy(&self->_streamIDToTopicLock);
  pthread_mutex_destroy(&self->_trafficClassLock);
  pthread_mutex_destroy(&self->_continuityPeerLock);
  v6.receiver = self;
  v6.super_class = (Class)IDSUTunDeliveryController;
  [(IDSUTunDeliveryController *)&v6 dealloc];
}

- (id)_pairedDeviceUUID
{
  v3 = [(IDSUTunDeliveryController *)self pairingManager];
  unsigned int v4 = [v3 isPaired];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSUUID);
    objc_super v6 = [(IDSUTunDeliveryController *)self pairingManager];
    id v7 = [v6 pairedDeviceUUIDString];
    id v8 = [v5 initWithUUIDString:v7];

    v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Queried pairedDeviceUUIDString {pairedDeviceUUIDString: %@}", buf, 0xCu);
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
    v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Could not query pairedDeviceUUIDString {isPaired: 0}", buf, 2u);
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
  }

  return v8;
}

- (void)startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSUTunDeliveryController *)self idsNRDeviceBridge];
  if (v5
    && ([(IDSUTunDeliveryController *)self idsNRDeviceBridge],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isDevicesIdentifierEqualTo:v4],
        v6,
        v5,
        v7))
  {
    id v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NRDeviceMonitor already running for {deviceIdentifier: %@}.", buf, 0xCu);
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
    [(IDSUTunDeliveryController *)self _removeDevicePreferencesHandler];
    [(IDSUTunDeliveryController *)self setIdsNRDeviceBridge:0];
    if (v4)
    {
      v9 = [[IDSNRDevicePreferencesHandler alloc] initWithDeviceIdentifier:v4];
      [(IDSUTunDeliveryController *)self setNrDevicePreferencesHandler:v9];

      v10 = [[IDSNRDeviceBridge alloc] initWithDeviceIdentifier:v4 delegate:self];
      [(IDSUTunDeliveryController *)self setIdsNRDeviceBridge:v10];

      pthread_mutex_lock(&self->_trafficClassLock);
      v11 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
      [v11 setAllowedTrafficClasses:self->_allowedTrafficClasses];

      pthread_mutex_unlock(&self->_trafficClassLock);
    }
  }
}

- (void)stopIdsNRDeviceBridgeAndPreferenceHandler
{
  [(IDSUTunDeliveryController *)self _removeDevicePreferencesHandler];

  [(IDSUTunDeliveryController *)self setIdsNRDeviceBridge:0];
}

- (void)_removeDevicePreferencesHandler
{
  v3 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];

  if (v3)
  {
    id v4 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
    [v4 cancel];

    [(IDSUTunDeliveryController *)self setNrDevicePreferencesHandler:0];
  }
}

- (void)_refreshIPsecStatus
{
  v3 = [(IDSUTunDeliveryController *)self pairingManager];
  self->_shouldUseIPsecLinkForDefaultPairedDevice = [v3 shouldUseIPsecLinkForDefaultPairedDevice];

  id v4 = [(IDSUTunDeliveryController *)self _pairedDeviceUUID];
  id v5 = v4;
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice && v4 != 0)
  {
    id v7 = v4;
    id v4 = [(IDSUTunDeliveryController *)self startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:v4];
    id v5 = v7;
  }

  _objc_release_x1(v4, v5);
}

- (unsigned)_nextMessageID
{
  return atomic_fetch_add((atomic_uint *volatile)&self->_messageID, 1u);
}

- (id)_copyPeerWithID:(id)a3
{
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_deviceIDToPeerLock);
  objc_super v6 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:v5];

  pthread_mutex_unlock(p_deviceIDToPeerLock);
  return v6;
}

- (id)_copyPairedDevice
{
  return [(IDSUTunDeliveryController *)self _copyPeerWithID:IDSDeviceDefaultPairedDeviceUniqueID];
}

- (id)hashForString:(id)a3
{
  memset(md, 170, sizeof(md));
  v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  id v5 = +[NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)md) >> 16];

  return v5;
}

- (void)setDeviceUniqueIDToCBUUID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received devices with unique ids -> cbuuids %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v6 = v4;
    _IDSLogV();
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DFBD8;
  v7[3] = &unk_100985A18;
  v7[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7, v6);
}

- (void)deviceWithUniqueID:(id)a3 updatedUUID:(id)a4
{
  id v6 = (IDSUTunPeer *)a3;
  id v7 = (IDSUTunPeer *)a4;
  im_assert_primary_base_queue();
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    BOOL v17 = v6;
    __int16 v18 = 2112;
    CFStringRef v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received device with unique id %@ updated BTUUID: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v13 = v6;
    v14 = v7;
    _IDSLogV();
  }
  if (v6
    && ![(IDSUTunPeer *)v6 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID])
  {
    pthread_mutex_lock(&self->_deviceIDToPeerLock);
    v10 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:v6];
    if (v10)
    {
      pthread_mutex_unlock(&self->_deviceIDToPeerLock);
      v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        BOOL v17 = v10;
        __int16 v18 = 2112;
        CFStringRef v19 = v6;
        __int16 v20 = 2112;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating existing peer %@ for uniqueID %@ with btuuid %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v14 = v6;
        v15 = v7;
        id v13 = v10;
        _IDSLogV();
      }
      -[IDSUTunPeer setBtUUID:](v10, "setBtUUID:", v7, v13, v14, v15);
    }
    else
    {
      v10 = [[IDSUTunPeer alloc] initWithIdentifier:@"UTunDelivery" btUUID:v7 uniqueID:v6 shouldUseIPsecLink:0 isNearby:0 isClassCConnected:0];
      [(IDSUTunPeer *)v10 setDelegate:self];
      [(NSMutableDictionary *)self->_deviceIDToPeer setObject:v10 forKey:v6];
      pthread_mutex_unlock(&self->_deviceIDToPeerLock);
      v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        BOOL v17 = v10;
        __int16 v18 = 2112;
        CFStringRef v19 = v6;
        __int16 v20 = 2112;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Created new peer %@ for uniqueID %@ with btuuid %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  else
  {
    id v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring update for nil or default paired device BTUUID: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_updateLocalSetupInProgressState:(BOOL)a3
{
  BOOL v3 = a3;
  -[IDSUTunDeliveryController setIsLocalSetUpInProgress:](self, "setIsLocalSetUpInProgress:");
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v5 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];

    if (v5)
    {
      id v6 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
      id v7 = v6;
      if (v3) {
        [v6 localSetUpStarted];
      }
      else {
        [v6 localSetUpCompleted];
      }
    }
  }
}

- (void)localSetupStarted
{
  im_assert_primary_base_queue();
  BOOL v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LOCALSETUP: local setup started - clearing all stats", v5, 2u);
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
  id v4 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  [v4 clearStats];
  [(IDSUTunDeliveryController *)self _updateLocalSetupInProgressState:1];
}

- (void)localSetupCompleted
{
  im_assert_primary_base_queue();
  BOOL v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LOCALSETUP: Informed that local setup has completed!", v5, 2u);
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
  id v4 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  [v4 setLocalSetupInProgress:0];
  [(IDSUTunDeliveryController *)self _updateLocalSetupInProgressState:0];
}

- (BOOL)localSetupInProgress
{
  id v2 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  unsigned __int8 v3 = [v2 localSetupInProgress];

  return v3;
}

- (void)prepareForQuickSwitch
{
  id v3 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  if ([v3 localSetupInProgress])
  {
    [v3 setLocalSetupInProgress:0];
    [(IDSUTunDeliveryController *)self _updateLocalSetupInProgressState:0];
  }
  id v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LOCALSETUP: Disabling Cloud Connections for QWS", v5, 2u);
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
  [v3 setSupportsCloudConnections:0];
}

- (void)updatecloudDeliveryStateOnDefaultPeer
{
  id v3 = [(IDSUTunDeliveryController *)self pairingManager];
  unsigned int v4 = [v3 pairedDeviceServiceMinCompatibilityVersion];

  if (v4 >= 3)
  {
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LOCALSETUP: Enabling Cloud Connections", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    id v6 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
    [v6 setSupportsCloudConnections:1];
  }
}

- (void)ensureLocalSetupInProgressConsistencyAfterQWS
{
  id v7 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  objc_msgSend(v7, "setLocalSetupInProgress:", -[IDSUTunDeliveryController isLocalSetUpInProgress](self, "isLocalSetUpInProgress"));
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v3 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];

    if (v3)
    {
      unsigned int v4 = [(IDSUTunDeliveryController *)self isLocalSetUpInProgress];
      id v5 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
      id v6 = v5;
      if (v4) {
        [v5 localSetUpStarted];
      }
      else {
        [v5 localSetUpCompleted];
      }
    }
  }
}

- (void)setPendingCloudFlagOnDefaultPeer
{
  id v2 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  [v2 setPendingCloudEnable:1];
}

- (void)_removePeerFromDeviceID:(id)a3
{
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_deviceIDToPeerLock);
  [(NSMutableDictionary *)self->_deviceIDToPeer removeObjectForKey:v5];

  pthread_mutex_unlock(p_deviceIDToPeerLock);
}

- (id)_createPeerFromDeviceID:(id)a3
{
  unsigned int v4 = +[NSDictionary dictionaryWithObject:a3 forKey:IDSDevicePairedDeviceID];
  id v5 = [(IDSUTunDeliveryController *)self _createPeerFromDeviceInfo:v4];

  return v5;
}

- (id)_createPeerFromDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:IDSDevicePairedDeviceID];
  id v6 = [v4 objectForKey:@"bt-id"];
  id v7 = [v4 objectForKey:@"session-id"];
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  if (!v7 || ![(IDSUTunPeer *)v7 length])
  {
    v11 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:v5];
    if (v11) {
      goto LABEL_31;
    }
    v11 = [[IDSUTunPeer alloc] initWithIdentifier:@"UTunDelivery" btUUID:v6 uniqueID:v5 shouldUseIPsecLink:0 isNearby:0 isClassCConnected:0];
    [(NSMutableDictionary *)self->_deviceIDToPeer setObject:v11 forKey:v5];
    v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      deviceIDToPeer = self->_deviceIDToPeer;
      *(_DWORD *)buf = 138412802;
      CFStringRef v19 = v11;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      v23 = deviceIDToPeer;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Peer %@ is created from btID %@ (peer map: %@)", buf, 0x20u);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_25;
    }
    if (!_IDSShouldLogTransport()) {
      goto LABEL_25;
    }
    _IDSLogTransport();
    if (!_IDSShouldLog()) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if ([v5 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID])
  {
    id v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_deviceIDToPeer;
      *(_DWORD *)buf = 138412802;
      CFStringRef v19 = v7;
      __int16 v20 = 2112;
      id v21 = v4;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WARNING: Peer from sessionID %@ shouldn't be created for the default paired device! (deviceInfo: %@) (peer map: %@)", buf, 0x20u);
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
    v11 = 0;
    goto LABEL_31;
  }
  v11 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:v7];
  if (v11) {
    goto LABEL_31;
  }
  v11 = [[IDSUTunPeer alloc] initWithIdentifier:@"UTunDelivery" btUUID:v7 uniqueID:v5 shouldUseIPsecLink:0 isNearby:0 isClassCConnected:0];
  [(IDSUTunPeer *)v11 setOriginalbtUUID:v6];
  [(NSMutableDictionary *)self->_deviceIDToPeer setObject:v11 forKey:v7];
  [(NSMutableDictionary *)self->_btuuidToSessionID setObject:v7 forKey:v6];
  v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_deviceIDToPeer;
    *(_DWORD *)buf = 138412802;
    CFStringRef v19 = v11;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Peer %@ is created from sessionID %@ (peer map: %@)", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
LABEL_24:
      }
        _IDSLogV();
    }
  }
LABEL_25:
  if (v11)
  {
    [(IDSUTunPeer *)v11 setDelegate:self];
    v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v19 = v11;
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Created new peer %@ for uniqueID %@ with btuuid %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
LABEL_31:
  pthread_mutex_unlock(p_deviceIDToPeerLock);

  return v11;
}

- (void)sendData:(id)a3 service:(id)a4 protobuf:(id)a5 resourcePath:(id)a6 resourceMetadata:(id)a7 priority:(int64_t)a8 dataProtectionClass:(unsigned int)a9 nonWaking:(BOOL)a10 nonCloudWaking:(BOOL)a11 requireBluetooth:(BOOL)a12 requireLocalWiFi:(BOOL)a13 queueOneIdentifier:(id)a14 expirationDate:(id)a15 enforceRemoteTimeouts:(BOOL)a16 expectsPeerResponse:(BOOL)a17 wantsAppAck:(BOOL)a18 compressPayload:(BOOL)a19 compressed:(BOOL)a20 peerResponseIdentifier:(id)a21 messageID:(id)a22 topic:(id)a23 awdTopic:(id)a24 command:(id)a25 fromID:(id)a26 uriToDeviceID:(id)a27 localDeviceDestinationDeviceUUID:(id)a28 bypassDuet:(BOOL)a29 duetIdentifiersOverride:(id)a30 messageType:(int64_t)a31 fallbackBlock:(id)a32 progressBlock:(id)a33 completionBlock:(id)a34
{
  id v77 = a3;
  id v63 = a4;
  id v76 = a5;
  id v58 = a6;
  id v59 = a7;
  id v60 = a14;
  id v75 = a15;
  id v57 = a21;
  id v53 = a22;
  id v55 = a23;
  id v38 = a24;
  id v50 = a25;
  id v39 = a26;
  id v51 = a27;
  id v52 = a28;
  id v54 = a30;
  id v40 = a32;
  id v41 = a33;
  id v56 = a34;
  v61 = +[IDSDaemonPriorityQueueController sharedInstance];
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_1001E1180;
  v79[3] = &unk_100985A90;
  BOOL v102 = a16;
  unsigned int v101 = a9;
  BOOL v103 = a10;
  BOOL v104 = a11;
  BOOL v105 = a17;
  BOOL v106 = a18;
  BOOL v107 = a19;
  BOOL v108 = a20;
  BOOL v109 = a12;
  BOOL v110 = a13;
  BOOL v111 = a29;
  v79[4] = self;
  id v80 = v55;
  int64_t v99 = a8;
  int64_t v100 = a31;
  id v81 = v53;
  id v82 = v77;
  id v83 = v76;
  id v84 = v75;
  id v85 = v50;
  id v86 = v51;
  id v87 = v52;
  id v88 = v58;
  id v89 = v59;
  id v90 = v57;
  id v91 = v38;
  id v92 = v39;
  id v97 = v40;
  id v98 = v41;
  id v93 = v60;
  id v94 = v54;
  id v95 = v63;
  id v96 = v56;
  id v66 = v63;
  id v68 = v54;
  id v71 = v60;
  id v74 = v41;
  id v72 = v40;
  id v70 = v39;
  id v69 = v38;
  id v67 = v57;
  id v65 = v59;
  id v64 = v58;
  id v62 = v56;
  id v42 = v52;
  id v43 = v51;
  id v44 = v50;
  id v45 = v75;
  id v46 = v76;
  id v47 = v77;
  id v48 = v53;
  id v49 = v55;
  [v61 performBlockWithPriority:v79 priority:a8];
}

- (void)cancelMessageID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  if ([v4 length])
  {
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to cancel message ID: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v11 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v11 = v4;
          _IDSLogV();
        }
      }
    }
    p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
    pthread_mutex_lock(&self->_deviceIDToPeerLock);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [(NSMutableDictionary *)self->_deviceIDToPeer allValues];
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "cancelMessageID:", v4, v11);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    pthread_mutex_unlock(p_deviceIDToPeerLock);
  }
}

- (void)kickProgressBlockForMessageID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMutableDictionary *)self->_deviceIDToPeer allValues];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) kickProgressBlockForMessageID:v4];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  pthread_mutex_unlock(p_deviceIDToPeerLock);
}

- (id)topicForStreamID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  p_streamIDToTopicLock = &self->_streamIDToTopicLock;
  pthread_mutex_lock(&self->_streamIDToTopicLock);
  streamIDToTopic = self->_streamIDToTopic;
  id v7 = +[NSNumber numberWithUnsignedShort:v3];
  id v8 = [(NSMutableDictionary *)streamIDToTopic objectForKey:v7];

  pthread_mutex_unlock(p_streamIDToTopicLock);

  return v8;
}

- (BOOL)isPresent
{
  im_assert_primary_base_queue();
  id v3 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  unsigned __int8 v4 = [v3 isConnected];

  return v4;
}

- (BOOL)defaultPeerIsNearby
{
  im_assert_primary_base_queue();
  id v3 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  unsigned __int8 v4 = [v3 isNearby];

  return v4;
}

- (BOOL)defaultPeerIsCloudConnected
{
  return 0;
}

- (void)localAccountSetupCompleted
{
  self->_localAccountSetupCompleted = 1;
  id v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_defaultPeerConnectedDeferred) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "local account setup complete - has deferred task? %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v5 = self->_defaultPeerConnectedDeferred ? @"YES" : @"NO";
    id v8 = v5;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if (self->_defaultPeerConnectedDeferred) {
        CFStringRef v6 = @"YES";
      }
      else {
        CFStringRef v6 = @"NO";
      }
      id v8 = (__CFString *)v6;
      _IDSLogV();
    }
  }
  if (self->_defaultPeerConnectedDeferred)
  {
    self->_defaultPeerConnectedDeferred = 0;
    id v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "calling deferred default peer connected", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    -[IDSUTunDeliveryController defaultPeerConnectivityChanged:](self, "defaultPeerConnectivityChanged:", 1, v8);
  }
}

- (void)enableConnectionForDefaultPairedDevice:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "enableConnectionForDefaultPairedDevice %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    CFStringRef v11 = v7;
    _IDSLogV();
  }
  id v8 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v3) {
      [v8 enableConnection];
    }
    else {
      [v8 disableConnectionForReason:14 shouldWait:0];
    }
  }
  else
  {
    CFStringRef v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v13 = (const __CFString *)IDSDeviceDefaultPairedDeviceUniqueID;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No connection found for default paired device %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)enableCloudConnectionForDefaultPairedDevice:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "enableCloudConnectionForDefaultPairedDevice %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    CFStringRef v11 = v7;
    _IDSLogV();
  }
  id v8 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v3) {
      [v8 enableCloudConnection];
    }
    else {
      [v8 disableCloudConnectionForReason:14];
    }
  }
  else
  {
    CFStringRef v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v13 = (const __CFString *)IDSDeviceDefaultPairedDeviceUniqueID;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No connection found for default paired device %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (BOOL)hasSpaceForMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CFStringRef v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v7 assertRunningWithPriority:a3];

  id v8 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  LOBYTE(v4) = [v8 hasSpaceForMessagesWithPriority:a3 dataProtectionClass:v4 messageType:4];

  return v4;
}

- (BOOL)hasSpaceForCloudMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CFStringRef v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v7 assertRunningWithPriority:a3];

  id v8 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  LOBYTE(v4) = [v8 hasSpaceForMessagesWithPriority:a3 dataProtectionClass:v4 messageType:6];

  return v4;
}

- (void)setTopics:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  pthread_mutex_lock(&self->_streamIDToTopicLock);
  id v5 = [(NSMutableDictionary *)self->_streamIDToTopic allValues];
  CFStringRef v6 = +[NSSet setWithArray:v5];

  if (v4 && v6 && [v6 isEqualToSet:v4])
  {
    pthread_mutex_unlock(&self->_streamIDToTopicLock);
  }
  else
  {
    streamIDToTopic = self->_streamIDToTopic;
    self->_streamIDToTopic = 0;

    if (!self->_streamIDToTopic)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      uint64_t v9 = self->_streamIDToTopic;
      self->_streamIDToTopic = Mutable;
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001E30F8;
    v13[3] = &unk_100985AB8;
    v13[4] = self;
    [v4 enumerateObjectsUsingBlock:v13];
    CFStringRef v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v11 = [(NSMutableDictionary *)self->_streamIDToTopic allKeys];
      *(_DWORD *)buf = 138412290;
      long long v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Got topic set update %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      long long v12 = [(NSMutableDictionary *)self->_streamIDToTopic allKeys];
      _IDSLogV();
    }
    pthread_mutex_unlock(&self->_streamIDToTopicLock);
  }
}

- (NSDictionary)syncPriorityMessageStatistics
{
  im_assert_primary_base_queue();
  id v3 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  id v4 = [v3 syncPriorityMessageStatistics];

  return (NSDictionary *)v4;
}

- (NSDictionary)defaultPriorityMessageStatistics
{
  im_assert_primary_base_queue();
  id v3 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  id v4 = [v3 defaultPriorityMessageStatistics];

  return (NSDictionary *)v4;
}

- (NSDictionary)urgentPriorityMessageStatistics
{
  im_assert_primary_base_queue();
  id v3 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  id v4 = [v3 urgentPriorityMessageStatistics];

  return (NSDictionary *)v4;
}

- (NSDictionary)urgentCloudPriorityMessageStatistics
{
  im_assert_primary_base_queue();
  id v3 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  id v4 = [v3 urgentCloudPriorityMessageStatistics];

  return (NSDictionary *)v4;
}

- (NSDictionary)sendingMessageStatistics
{
  im_assert_primary_base_queue();
  id v3 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  id v4 = [v3 sendingMessageStatistics];

  return (NSDictionary *)v4;
}

- (NSDictionary)queuedIncomingMessageDictionary
{
  im_assert_primary_base_queue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    CFStringRef v6 = [v5 deliveryControllerQueuedIncomingMessageDictionary:self];
  }
  else
  {
    CFStringRef v6 = 0;
  }

  return (NSDictionary *)v6;
}

- (void)setAllowedTrafficClasses:(id)a3
{
  id v5 = a3;
  im_assert_primary_base_queue();
  p_trafficClassLock = &self->_trafficClassLock;
  pthread_mutex_lock(&self->_trafficClassLock);
  if (([(NSSet *)self->_allowedTrafficClasses isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_allowedTrafficClasses, a3);
    CFStringRef v7 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:IDSDeviceDefaultPairedDeviceUniqueID];
    [v7 trafficClassesChanged];

    if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
    {
      id v8 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];

      if (v8)
      {
        uint64_t v9 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
        [v9 setAllowedTrafficClasses:v5];
      }
      else
      {
        uint64_t v9 = +[IDSFoundationLog delivery];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138412290;
          id v11 = v5;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Warning: -[IDSUTunDeliveryController setAllowedTrafficClasses:] called but missing nrDevicePreferencesHandler; allowedTrafficClasses %@",
            (uint8_t *)&v10,
            0xCu);
        }
      }
    }
  }
  pthread_mutex_unlock(p_trafficClassLock);
}

- (NSSet)allowedTrafficClasses
{
  p_trafficClassLock = &self->_trafficClassLock;
  pthread_mutex_lock(&self->_trafficClassLock);
  char v4 = self->_allowedTrafficClasses;
  pthread_mutex_unlock(p_trafficClassLock);

  return v4;
}

- (void)systemScreenDidPowerDown
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System did lock", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  deviceIDToPeer = self->_deviceIDToPeer;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E366C;
  v5[3] = &unk_100985AE0;
  v5[4] = self;
  [(NSMutableDictionary *)deviceIDToPeer enumerateKeysAndObjectsUsingBlock:v5];
}

- (void)removeUTunPeerWithSessionID:(id)a3 reason:(int64_t)a4 shouldWait:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  int v10 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:v8];
  [v10 disableConnectionForReason:a4 shouldWait:v5];
  [v10 setDelegate:0];
  id v11 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:v8];

  if (v11) {
    [(NSMutableDictionary *)self->_deviceIDToPeer removeObjectForKey:v8];
  }
  btuuidToSessionID = self->_btuuidToSessionID;
  CFStringRef v13 = [v10 originalbtUUID];
  long long v14 = [(NSMutableDictionary *)btuuidToSessionID objectForKey:v13];

  if (v14 && [v14 isEqualToString:v8])
  {
    long long v15 = self->_btuuidToSessionID;
    v16 = [v10 originalbtUUID];
    [(NSMutableDictionary *)v15 removeObjectForKey:v16];
  }
  else
  {
    BOOL v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "There is a new session for the local path, skipped removing...", v18, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  pthread_mutex_unlock(p_deviceIDToPeerLock);
}

- (void)removeUTunPeerWithDeviceUniqueID:(id)a3 btuuid:(id)a4 reason:(int64_t)a5 shouldWait:(BOOL)a6
{
  BOOL v6 = a6;
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  uint64_t v10 = IDSDeviceDefaultPairedDeviceUniqueID;
  id v11 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:IDSDeviceDefaultPairedDeviceUniqueID];
  [(NSMutableDictionary *)self->_deviceIDToPeer removeObjectForKey:v10];
  pthread_mutex_unlock(p_deviceIDToPeerLock);
  [(IDSUTunDeliveryController *)self _disableOTRForDefaultPairedPeer:v11];
  [v11 disableConnectionForReason:a5 shouldWait:v6];
  [v11 setDelegate:0];
}

- (void)addUTunPeerWithDeviceUniqueID:(id)a3 btuuid:(id)a4
{
  BOOL v6 = (__CFString *)a3;
  id v7 = a4;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  uint64_t v8 = IDSDeviceDefaultPairedDeviceUniqueID;
  uint64_t v9 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:IDSDeviceDefaultPairedDeviceUniqueID];

  if (v9)
  {
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      deviceIDToPeer = self->_deviceIDToPeer;
      *(_DWORD *)buf = 138478339;
      CFStringRef v24 = v6;
      __int16 v25 = 2113;
      id v26 = v7;
      __int16 v27 = 2113;
      v28 = deviceIDToPeer;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Already have a peer ignoring call to add {deviceUniqueID: %{private}@, btuuid: %{private}@, deviceIDToPeer: %{private}@}", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    pthread_mutex_unlock(&self->_deviceIDToPeerLock);
  }
  else
  {
    [(IDSUTunDeliveryController *)self _refreshIPsecStatus];
    long long v12 = [(IDSUTunDeliveryController *)self idsNRDeviceBridge];
    id v13 = [v12 isNearby];

    long long v14 = [(IDSUTunDeliveryController *)self idsNRDeviceBridge];
    id v15 = [v14 isClassCConnected];

    v16 = [[IDSUTunPeer alloc] initWithIdentifier:@"UTunDelivery-Default" btUUID:0 uniqueID:v8 shouldUseIPsecLink:self->_shouldUseIPsecLinkForDefaultPairedDevice isNearby:v13 isClassCConnected:v15];
    [(IDSUTunPeer *)v16 setDelegate:self];
    [(NSMutableDictionary *)self->_deviceIDToPeer setObject:v16 forKey:v8];
    pthread_mutex_unlock(&self->_deviceIDToPeerLock);
    [(IDSUTunDeliveryController *)self peerNearbyStateChanged:v16 forceNotify:1];
    if (self->_shouldUseIPsecLinkForDefaultPairedDevice) {
      char v17 = 0;
    }
    else {
      char v17 = IMGetDomainBoolForKey() ^ 1;
    }
    self->_enableOTR = v17;
    id v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_enableOTR) {
        CFStringRef v19 = @"YES";
      }
      else {
        CFStringRef v19 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "EnableOTR: %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      __int16 v20 = self->_enableOTR ? @"YES" : @"NO";
      __int16 v22 = v20;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        if (self->_enableOTR) {
          CFStringRef v21 = @"YES";
        }
        else {
          CFStringRef v21 = @"NO";
        }
        __int16 v22 = (__CFString *)v21;
        _IDSLogV();
      }
    }
    [(IDSUTunPeer *)v16 enableConnection];
  }
}

- (void)addConnectivityDelegate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    connectivityDelegates = self->_connectivityDelegates;
    id v9 = v5;
    if (!connectivityDelegates)
    {
      id v7 = +[NSHashTable weakObjectsHashTable];
      uint64_t v8 = self->_connectivityDelegates;
      self->_connectivityDelegates = v7;

      connectivityDelegates = self->_connectivityDelegates;
    }
    id v4 = [(NSHashTable *)connectivityDelegates addObject:v9];
    id v5 = v9;
  }

  _objc_release_x1(v4, v5);
}

- (void)removeConnectivityDelegate:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_connectivityDelegates, "removeObject:");
  }
}

- (id)_deviceIDForPeer:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1001E3ECC;
  char v17 = sub_1001E3EDC;
  id v18 = 0;
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  deviceIDToPeer = self->_deviceIDToPeer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001E3EE4;
  v10[3] = &unk_100985B08;
  id v7 = v4;
  id v11 = v7;
  long long v12 = &v13;
  [(NSMutableDictionary *)deviceIDToPeer enumerateKeysAndObjectsUsingBlock:v10];
  pthread_mutex_unlock(p_deviceIDToPeerLock);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)peer:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16
{
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a11;
  id v26 = a12;
  __int16 v27 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v27 assertRunningWithPriority:a13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a5) = objc_opt_respondsToSelector();

  if (a5)
  {
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    v30 = [(IDSUTunDeliveryController *)self _deviceIDForPeer:v36];
    LOBYTE(v33) = a16;
    LOBYTE(v32) = a14;
    LOWORD(v31) = __PAIR16__(a10, a9);
    objc_msgSend(v29, "deliveryController:protobufReceived:topic:command:deviceID:btUUID:messageID:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:", self, v35, v34, v22, v30, v23, v24, v31, v25, v26, a13, v32, a15, v33);
  }
}

- (void)peer:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16
{
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a11;
  id v26 = a12;
  __int16 v27 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v27 assertRunningWithPriority:a13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a5) = objc_opt_respondsToSelector();

  if (a5)
  {
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    v30 = [(IDSUTunDeliveryController *)self _deviceIDForPeer:v36];
    LOBYTE(v33) = a16;
    LOBYTE(v32) = a14;
    LOWORD(v31) = __PAIR16__(a10, a9);
    objc_msgSend(v29, "deliveryController:dataReceived:topic:command:deviceID:btUUID:messageID:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:", self, v35, v34, v22, v30, v23, v24, v31, v25, v26, a13, v32, a15, v33);
  }
}

- (void)peer:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 priority:(int64_t)a13 isCompressed:(BOOL)a14 connectionType:(int64_t)a15 didWakeHint:(BOOL)a16
{
  id v42 = a3;
  id v41 = a4;
  id v40 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a11;
  id v26 = a12;
  __int16 v27 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v27 assertRunningWithPriority:a13];

  uint64_t v28 = [v42 originalbtUUID];
  if (v28)
  {
    id v29 = (void *)v28;
    v30 = [v42 btUUID];
    unsigned int v31 = [v23 isEqualToString:v30];

    if (v31)
    {
      uint64_t v32 = [v42 originalbtUUID];

      id v23 = (id)v32;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v34 = objc_opt_respondsToSelector();

  if (v34)
  {
    id v35 = objc_loadWeakRetained((id *)&self->_delegate);
    id v36 = [(IDSUTunDeliveryController *)self _deviceIDForPeer:v42];
    LOBYTE(v39) = a16;
    LOBYTE(v38) = a14;
    LOWORD(v37) = __PAIR16__(a10, a9);
    objc_msgSend(v35, "deliveryController:messageReceived:topic:command:deviceID:btUUID:messageID:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:", self, v41, v40, v22, v36, v23, v24, v37, v25, v26, a13, v38, a15, v39);
  }
}

- (void)peer:(id)a3 receivedAppLevelAckWithTopic:(id)a4 fromID:(id)a5 messageID:(id)a6 peerResponseIdentifier:(id)a7 priority:(int64_t)a8 connectionType:(int64_t)a9
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  CFStringRef v19 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v19 assertRunningWithPriority:a8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    id v23 = [(IDSUTunDeliveryController *)self _deviceIDForPeer:v24];
    [v22 deliveryController:self receivedAppLevelAckWithTopic:v15 deviceID:v23 btUUID:v16 messageID:v17 peerResponseIdentifier:v18 priority:a8 connectionType:a9];
  }
}

- (void)peerNearbyStateChanged:(id)a3 forceNotify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  im_assert_primary_base_queue();
  unsigned int v7 = [v6 isNearby];
  id v8 = [v6 uniqueID];
  id v9 = +[IMSystemMonitor sharedInstance];
  unsigned int v10 = [v9 isScreenLit];

  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(NSMutableDictionary *)self->_deviceIDToPeer count];
    CFStringRef v13 = @"NO";
    *(_DWORD *)buf = 138413058;
    if (v10) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    if (v7) {
      CFStringRef v13 = @"YES";
    }
    CFStringRef v24 = v13;
    __int16 v25 = 2112;
    CFStringRef v26 = v14;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    __int16 v29 = 2048;
    id v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "peer nearby state changed:%@    screenLit:%@   uniqueID:%@   peer-count:%lu", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [(NSMutableDictionary *)self->_deviceIDToPeer count];
    _IDSLogV();
  }
  if ((v4 | v10) == 1)
  {
    if (v7)
    {
      int64_t v15 = 0;
    }
    else
    {
      [(IDSUTunDeliveryController *)self notificationDelayInSeconds];
      int64_t v15 = 1000000000 * (int)v16;
    }
    dispatch_time_t v17 = dispatch_time(0, v15);
    broadcastQueue = self->_broadcastQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E48FC;
    block[3] = &unk_10097E418;
    block[4] = self;
    id v21 = v6;
    id v22 = v8;
    dispatch_after(v17, broadcastQueue, block);
    if (v7)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      self->_lastIsNearbyBecameTrue = v19;
    }
  }
}

- (void)peerConnectivityChanged:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  unsigned int v5 = [v4 isConnected];
  id v6 = [v4 uniqueID];
  unsigned int v7 = [v6 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];
  if ((v7 & v5) == 1) {
    uint64_t isLinkForDefaultPeerConnected = self->_isLinkForDefaultPeerConnected;
  }
  else {
    uint64_t isLinkForDefaultPeerConnected = v5 & ~v7;
  }
  [(IDSUTunDeliveryController *)self setIsConnected:isLinkForDefaultPeerConnected];
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    deviceIDToPeer = self->_deviceIDToPeer;
    *(_DWORD *)buf = 138412802;
    if (isLinkForDefaultPeerConnected) {
      CFStringRef v10 = @"YES";
    }
    double v33 = *(double *)&v10;
    __int16 v34 = 2112;
    id v35 = v6;
    __int16 v36 = 2112;
    uint64_t v37 = deviceIDToPeer;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "peer connectivity changed: %@    uniqueID: %@   map: %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v12 = @"NO";
    if (isLinkForDefaultPeerConnected) {
      CFStringRef v12 = @"YES";
    }
    uint64_t v28 = v6;
    __int16 v29 = self->_deviceIDToPeer;
    double v27 = *(double *)&v12;
    _IDSLogV();
  }
  if (isLinkForDefaultPeerConnected)
  {
    int v13 = 0;
  }
  else
  {
    CFStringRef v14 = [(IDSUTunDeliveryController *)self idsNRDeviceBridge];
    if ([v14 latestLinkType] == 2)
    {
      int v13 = 0;
    }
    else
    {
      [(IDSUTunDeliveryController *)self notificationDelayInSeconds];
      int v13 = (int)v15;
    }
  }
  dispatch_time_t v16 = dispatch_time(0, 1000000000 * v13);
  broadcastQueue = self->_broadcastQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E5040;
  block[3] = &unk_10097E440;
  block[4] = self;
  id v18 = v6;
  id v31 = v18;
  dispatch_after(v16, broadcastQueue, block);
  +[NSDate timeIntervalSinceReferenceDate];
  double v20 = v19;
  double lastConnectedTime = self->_lastConnectedTime;
  double v22 = v20 - lastConnectedTime;
  if (isLinkForDefaultPeerConnected) {
    double v22 = 0.0;
  }
  if (lastConnectedTime <= 0.0) {
    double v23 = 0.0;
  }
  else {
    double v23 = v22;
  }
  if (isLinkForDefaultPeerConnected)
  {
    self->_double lastConnectedTime = v20;
    if ((isLinkForDefaultPeerConnected & [v4 isNearby]) == 1)
    {
      uint64_t v24 = (unint64_t)((v20 - self->_lastIsNearbyBecameTrue) * 1000.0);
      if (v24 >= 1)
      {
        __int16 v25 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v33 = *(double *)&v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Submitting AWD metric {nearbyToConnectedDurationInMs: %lld ms}.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        IMSubmitSimpleAWDMetric();
      }
    }
  }
  else
  {
    self->_double lastConnectedTime = 0.0;
    if (v23 > 0.0)
    {
      CFStringRef v26 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v33 = v23;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Submitting aggd metric for connected time %f seconds.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        double v27 = v23;
        _IDSLogV();
      }
      IMSubmitSimpleAggegateMetric();
    }
    objc_msgSend(v4, "isNearby", *(void *)&v27, v28, v29);
  }
}

- (void)peerCloudConnectivityChanged:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  id v5 = [v4 isCloudConnected];
  CFStringRef v26 = v4;
  id v6 = [v4 uniqueID];
  [(IDSUTunDeliveryController *)self setIsCloudConnected:v5];
  unsigned int v7 = [(NSHashTable *)self->_connectivityDelegates allObjects];
  id v8 = [v7 copy];

  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    if (v5) {
      CFStringRef v10 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v33 = v10;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Broadcasting isCloudConnected %@ for %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v11 = v5 ? @"YES" : @"NO";
    uint64_t v24 = v11;
    __int16 v25 = v6;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      uint64_t v24 = v11;
      __int16 v25 = v6;
      _IDSLogV();
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      double v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        dispatch_time_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v15);
        if (objc_opt_respondsToSelector()) {
          [v16 deliveryController:self uniqueID:v6 isCloudConnected:v5];
        }
        double v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }

  if (![v26 isCloudConnected]
    || ([(IDSUTunDeliveryController *)self lastCloudConnectedTime], v17 == 0.0))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    -[IDSUTunDeliveryController setLastCloudConnectedTime:](self, "setLastCloudConnectedTime:");
  }
  else
  {
    id v18 = objc_alloc((Class)IDSCloudMessagingLinkReEstablishedMetric);
    +[NSDate timeIntervalSinceReferenceDate];
    double v20 = v19;
    [(IDSUTunDeliveryController *)self lastCloudConnectedTime];
    id v22 = [v18 initWithInactiveTime:0 linkType:0 priorLinkType:v20 - v21];
    double v23 = +[IDSAWDLogger logger];
    [v23 logMetric:v22];
  }
}

- (void)peerHasSpaceForNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 withTypes:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  im_assert_primary_base_queue();
  id v12 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  id v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"Sync";
    if (a4 == 200) {
      CFStringRef v14 = @"Default";
    }
    CFStringRef v15 = @"Class D";
    if (a4 == 300) {
      CFStringRef v14 = @"URGENT";
    }
    if (v7 == 1) {
      CFStringRef v15 = @"Class A";
    }
    if (!v7) {
      CFStringRef v15 = @"Class C";
    }
    *(_DWORD *)buf = 138413058;
    id v21 = v10;
    CFStringRef v23 = v14;
    __int16 v22 = 2112;
    __int16 v24 = 2112;
    CFStringRef v25 = v15;
    if (v12 == v10) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    __int16 v26 = 2112;
    CFStringRef v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "peerHasSpaceForNonUrgentMessages %@ %@ %@ isDefaultPeer? %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (v12 == v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      [v19 deliveryControllerHasSpaceforNonUrgentMessages:self priority:a4 dataProtectionClass:v7 ofTypes:v11];
    }
  }
}

- (void)peerHasSpaceForNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  im_assert_primary_base_queue();
  id v9 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"Sync";
    if (a4 == 200) {
      CFStringRef v11 = @"Default";
    }
    CFStringRef v12 = @"Class D";
    if (a4 == 300) {
      CFStringRef v11 = @"URGENT";
    }
    if (v5 == 1) {
      CFStringRef v12 = @"Class A";
    }
    if (!v5) {
      CFStringRef v12 = @"Class C";
    }
    *(_DWORD *)buf = 138413058;
    id v18 = v8;
    CFStringRef v20 = v11;
    __int16 v19 = 2112;
    __int16 v21 = 2112;
    CFStringRef v22 = v12;
    if (v9 == v8) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    __int16 v23 = 2112;
    CFStringRef v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "peerHasSpaceForNonUrgentMessages %@ %@ %@ isDefaultPeer? %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (v9 == v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 deliveryControllerHasSpaceforNonUrgentMessages:self priority:a4 dataProtectionClass:v5];
    }
  }
}

- (void)peerHasSpaceForUrgentMessages:(id)a3 dataProtectionClass:(unsigned int)a4 withTypes:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  im_assert_primary_base_queue();
  id v10 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  CFStringRef v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"Class D";
    if (v6 == 1) {
      CFStringRef v12 = @"Class A";
    }
    *(_DWORD *)buf = 138413058;
    id v18 = v8;
    if (!v6) {
      CFStringRef v12 = @"Class C";
    }
    CFStringRef v20 = @"URGENT";
    __int16 v19 = 2112;
    __int16 v21 = 2112;
    CFStringRef v22 = v12;
    if (v10 == v8) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    __int16 v23 = 2112;
    CFStringRef v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "peerHasSpaceForUrgentMessages %@ %@ %@ isDefaultPeer? %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (v10 == v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 deliveryControllerHasSpaceforUrgentMessages:self dataProtectionClass:v6 ofTypes:v9];
    }
  }
}

- (void)defaultPeerConnectivityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  [(IDSUTunDeliveryController *)self _refreshIPsecStatus];
  if (!v3)
  {
    self->_defaultPeerConnectedDeferred = 0;
    uint64_t v7 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];

    if (v7)
    {
      uint64_t v6 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
      [v6 annouceAvailabilityForCloudMessaging];
      goto LABEL_7;
    }
LABEL_8:
    BOOL isLinkForDefaultPeerConnected = self->_isLinkForDefaultPeerConnected;
    self->_BOOL isLinkForDefaultPeerConnected = v3;
    id v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"YES";
      if (isLinkForDefaultPeerConnected) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      if (!v3) {
        CFStringRef v10 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v21 = v11;
      __int16 v22 = 2112;
      CFStringRef v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "default peer connectivity changed: %@ -> %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      CFStringRef v12 = isLinkForDefaultPeerConnected ? @"YES" : @"NO";
      CFStringRef v13 = v3 ? @"YES" : @"NO";
      id v18 = v12;
      __int16 v19 = v13;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v18 = v12;
        __int16 v19 = v13;
        _IDSLogV();
      }
    }
    id v14 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
    char v15 = v14;
    if (v14)
    {
      if (isLinkForDefaultPeerConnected != v3)
      {
        [v14 setIsConnected:v3];
        [(IDSUTunDeliveryController *)self peerConnectivityChanged:v15];
      }
    }
    else
    {
      id v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "default peer connectivity changed but no default peer", buf, 2u);
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

    return;
  }
  if (self->_localAccountSetupCompleted)
  {
    [(IDSUTunDeliveryController *)self enableConnectionForDefaultPairedDevice:1];
    uint64_t v5 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];

    if (v5)
    {
      uint64_t v6 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
      [v6 revokeAvailabilityForCloudMessaging];
LABEL_7:

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  self->_defaultPeerConnectedDeferred = 1;
  double v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "local account setup has not finished yet - defer default peer connected", buf, 2u);
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

- (void)legacyUTunBTLinkManagerDefaultPeerConnectivityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  [(IDSUTunDeliveryController *)self _refreshIPsecStatus];
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    uint64_t v5 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "legacyUTunBTLinkManagerDefaultPeerConnectivityChanged: %@ but using IPsec link - drop callback", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [(IDSUTunDeliveryController *)self defaultPeerConnectivityChanged:v3];
  }
}

- (void)defaultPeerNearbyChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  id v5 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  CFStringRef v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 isNearby];
    if (v7 != v3)
    {
      unsigned int v8 = v7;
      [v6 setIsNearby:v3];
      id v9 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v10 = @"NO";
        if (v8) {
          CFStringRef v11 = @"YES";
        }
        else {
          CFStringRef v11 = @"NO";
        }
        if (v3) {
          CFStringRef v10 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v17 = v11;
        __int16 v18 = 2112;
        CFStringRef v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "default peer nearby changed: %@ -> %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        if (v8) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        if (v3) {
          CFStringRef v13 = @"YES";
        }
        else {
          CFStringRef v13 = @"NO";
        }
        CFStringRef v14 = v12;
        CFStringRef v15 = v13;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          CFStringRef v14 = v12;
          CFStringRef v15 = v13;
          _IDSLogV();
        }
      }
      -[IDSUTunDeliveryController peerNearbyStateChanged:forceNotify:](self, "peerNearbyStateChanged:forceNotify:", v6, 1, v14, v15);
    }
  }
}

- (void)defaultPeerLinkTypeChanged:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  im_assert_primary_base_queue();
  id v5 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  if (!v5)
  {
    CFStringRef v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ Did not find default peer device.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        unsigned int v7 = self;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          unsigned int v7 = self;
          _IDSLogV();
        }
      }
    }
  }
  objc_msgSend(v5, "logCurrentTransportStatsAndResetTimers", v7);
  if ([v5 linkType] != v3) {
    [v5 setLinkType:v3];
  }
}

- (void)legacyUTunBTLinkManagerDefaultPeerNearbyChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  [(IDSUTunDeliveryController *)self _refreshIPsecStatus];
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v5 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "legacyUTunBTLinkManagerDefaultPeerNearbyChanged: %@ but using IPsec link - drop callback", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [(IDSUTunDeliveryController *)self defaultPeerNearbyChanged:v3];
  }
}

- (void)defaultPeerCloudConnectivityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  id v5 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  CFStringRef v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cloud connectivity changed for default peer: %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    if (v3) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    CFStringRef v9 = v8;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      CFStringRef v9 = v8;
      _IDSLogV();
    }
  }
  -[IDSUTunDeliveryController _setCloudConnectionConnected:forPeer:](self, "_setCloudConnectionConnected:forPeer:", v3, v5, v9);
}

- (void)legacyUTunBTLinkManagerDefaultPeerCloudConnectivityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  [(IDSUTunDeliveryController *)self _refreshIPsecStatus];
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v5 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "legacyUTunBTLinkManagerDefaultPeerCloudConnectivityChanged: %@ but using IPsec link - drop callback", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [(IDSUTunDeliveryController *)self defaultPeerCloudConnectivityChanged:v3];
  }
}

- (void)defaultPeerMagnetIndicationOfAwakeStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "defaultPeerMagnetIndicationOfAwakeStateChanged %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    CFStringRef v9 = v7;
    _IDSLogV();
  }
  id v8 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  [v8 setIsMagnetIndicatingPeerIsAwake:v3];
}

- (void)defaultPeerClassCConnectivityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "defaultPeerClassCConnectivityDidChange %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    CFStringRef v9 = v7;
    _IDSLogV();
  }
  id v8 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  [v8 setIsClassCConnected:v3];
  [(IDSUTunDeliveryController *)self setIsClassCConnected:v3];
  [(IDSUTunDeliveryController *)self peerConnectivityChanged:v8];
}

- (void)defaultPeerSetPreferInfraWiFi:(BOOL)a3 services:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  im_assert_primary_base_queue();
  CFStringRef v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v15 = v8;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "defaultPeerSetPreferInfraWiFi: %@ services: %@", buf, 0x16u);
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
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    CFStringRef v9 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      CFStringRef v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "defaultPeerSetPreferInfraWiFi failed due to nil device identifier.", buf, 2u);
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
      CFStringRef v11 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
      [v11 setPreferInfraWiFiRequest:v4 services:v6];
    }
  }
  else
  {
    id v12 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
    [v12 setPreferInfraWiFi:v4 services:v6];
  }
}

- (void)defaultPeerSetLinkPreferences:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v5 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];

    if (v5)
    {
      id v6 = +[IDSLinkPreferencesManager sharedInstance];
      CFStringRef v7 = [v6 accumulativePreferencesForAllServices];

      uint64_t v8 = [v7 objectForKey:@"PacketsPerSecond"];
      CFStringRef v9 = (void *)v8;
      if (v8) {
        BOOL v10 = (_UNKNOWN **)v8;
      }
      else {
        BOOL v10 = &off_1009D1860;
      }
      CFStringRef v11 = v10;

      uint64_t v12 = [v7 objectForKey:@"InputBytesPerSecond"];
      CFStringRef v13 = (void *)v12;
      if (v12) {
        CFStringRef v14 = (_UNKNOWN **)v12;
      }
      else {
        CFStringRef v14 = &off_1009D1860;
      }
      CFStringRef v15 = v14;

      uint64_t v16 = [v7 objectForKey:@"OutputBytesPerSecond"];
      id v17 = (void *)v16;
      if (v16) {
        __int16 v18 = (_UNKNOWN **)v16;
      }
      else {
        __int16 v18 = &off_1009D1860;
      }
      CFStringRef v19 = v18;

      CFStringRef v20 = [v7 objectForKey:@"Intent"];
      if ([v20 isEqualToString:@"forceBTClassic"]
        && [v11 unsignedIntValue] <= 0xC7)
      {

        CFStringRef v11 = &off_1009D1878;
      }
      CFStringRef v21 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        id v36 = v4;
        __int16 v37 = 1024;
        unsigned int v38 = [v11 unsignedIntValue];
        __int16 v39 = 1024;
        unsigned int v40 = [v15 unsignedIntValue];
        __int16 v41 = 1024;
        unsigned int v42 = [v19 unsignedIntValue];
        __int16 v43 = 2114;
        id v44 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "setBluetoothLinkPreferences: service: %{public}@, pps: %d input bps: %d output bps: %d intent: %{public}@", buf, 0x28u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v22 = [v11 unsignedIntValue];
          id v23 = [v15 unsignedIntValue];
          id v33 = [v19 unsignedIntValue];
          __int16 v34 = v20;
          id v31 = v22;
          id v32 = v23;
          id v30 = v4;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v24 = objc_msgSend(v11, "unsignedIntValue", v4, v22, v23, v33, v20);
            id v25 = [v15 unsignedIntValue];
            id v33 = [v19 unsignedIntValue];
            __int16 v34 = v20;
            id v31 = v24;
            id v32 = v25;
            id v30 = v4;
            _IDSLogV();
          }
        }
      }
      __int16 v26 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
      [v26 setBluetoothLinkPreferences:v11 inputbps:v15 outputbps:v19];
    }
    else
    {
      long long v29 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "defaultPeerSetLinkPreferences failed due to nil device identifier.", buf, 2u);
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
    CFStringRef v27 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v4;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "defaultPeerSetLinkPreferences, service: %{public}@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v30 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v30 = v4;
          _IDSLogV();
        }
      }
    }
    id v28 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
    [v28 setLinkPreferences:v4];
  }
}

- (void)defaultPeerSetWantsQuickRelayRequest:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  [(IDSUTunDeliveryController *)self _refreshIPsecStatus];
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "defaultPeerSetWantsQuickRelayRequest: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      CFStringRef v7 = v3 ? @"YES" : @"NO";
      BOOL v10 = v7;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        BOOL v10 = v7;
        _IDSLogV();
      }
    }
    uint64_t v8 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];

    if (v8)
    {
      CFStringRef v9 = [(IDSUTunDeliveryController *)self nrDevicePreferencesHandler];
      [v9 setQuickRelayRequest:v3];
    }
    else
    {
      CFStringRef v9 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[IDSUTunDeliveryController defaultPeerSetWantsQuickRelayRequest:] called but missing nrDevicePreferencesHandler", buf, 2u);
      }
    }
  }
}

- (void)defaultPeerSupportsDirectMessaging:(BOOL)a3 isObliterating:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  im_assert_primary_base_queue();
  if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
  {
    CFStringRef v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"NO";
      if (v5) {
        CFStringRef v8 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "defaultPeerSupportsDirectMessaging: %@", buf, 0xCu);
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
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 deliveryController:self device:0 supportsDirectMessaging:v5 isObliterating:v4];
    }
  }
}

- (void)defaultPeerUnpairStart
{
  im_assert_primary_base_queue();
  BOOL v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "defaultPeerUnpairStart", v5, 2u);
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
  id v4 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  [v4 unpairStart];
  [(IDSUTunDeliveryController *)self _updateLocalSetupInProgressState:1];
}

- (void)defaultPeerDropDisallowedMessages
{
  im_assert_primary_base_queue();
  BOOL v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "defaultPeerDropDisallowedMessages", v5, 2u);
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
  id v4 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  [v4 dropDisallowedMessages];
}

- (void)peerCloudConnectivityChanged:(id)a3 isCloudConnected:(BOOL)a4
{
  BOOL v4 = a4;
  CFStringRef v6 = (__CFString *)a3;
  im_assert_primary_base_queue();
  if ([(__CFString *)v6 isEqualToString:kIDSDefaultPairedDeviceID])
  {
    [(IDSUTunDeliveryController *)self _refreshIPsecStatus];
    if (self->_shouldUseIPsecLinkForDefaultPairedDevice)
    {
      CFStringRef v7 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v8 = @"NO";
        if (v4) {
          CFStringRef v8 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "peerCloudConnectivityChanged: %@ but using IPsec link - drop callback", buf, 0xCu);
      }
      goto LABEL_20;
    }
    CFStringRef v9 = (__CFString *)IDSDeviceDefaultPairedDeviceUniqueID;

    CFStringRef v6 = v9;
  }
  char v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v4) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v16 = v6;
    __int16 v17 = 2112;
    CFStringRef v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "cloud connectivity changed for peer %@: %@.", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    CFStringRef v12 = v4 ? @"YES" : @"NO";
    CFStringRef v13 = v6;
    CFStringRef v14 = v12;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      CFStringRef v13 = v6;
      CFStringRef v14 = v12;
      _IDSLogV();
    }
  }
  CFStringRef v7 = -[IDSUTunDeliveryController _createPeerFromDeviceID:](self, "_createPeerFromDeviceID:", v6, v13, v14);
  [(IDSUTunDeliveryController *)self _setCloudConnectionConnected:v4 forPeer:v7];
LABEL_20:
}

- (void)_setCloudConnectionConnected:(BOOL)a3 forPeer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CFStringRef v7 = v6;
  if (v6)
  {
    if (v4) {
      [v6 enableCloudConnection];
    }
    unsigned int v8 = [v7 isCloudConnected];
    if (v8 != v4)
    {
      unsigned int v9 = v8;
      [v7 setIsCloudConnected:v4];
      char v10 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v11 = @"NO";
        if (v9) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        CFStringRef v20 = v7;
        CFStringRef v22 = v12;
        __int16 v21 = 2112;
        if (v4) {
          CFStringRef v11 = @"YES";
        }
        __int16 v23 = 2112;
        CFStringRef v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ cloud connectivity changed: %@ -> %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        if (v9) {
          CFStringRef v13 = @"YES";
        }
        else {
          CFStringRef v13 = @"NO";
        }
        if (v4) {
          CFStringRef v14 = @"YES";
        }
        else {
          CFStringRef v14 = @"NO";
        }
        CFStringRef v17 = v13;
        CFStringRef v18 = v14;
        CFStringRef v16 = v7;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          CFStringRef v17 = v13;
          CFStringRef v18 = v14;
          CFStringRef v16 = v7;
          _IDSLogV();
        }
      }
      -[IDSUTunDeliveryController peerCloudConnectivityChanged:](self, "peerCloudConnectivityChanged:", v7, v16, v17, v18);
    }
  }
  else
  {
    CFStringRef v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Tried to process cloud connectivity change with nil peer.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (BOOL)isTerminusConnected
{
  id v2 = [(IDSUTunDeliveryController *)self idsNRDeviceBridge];
  unsigned __int8 v3 = [v2 isConnected];

  return v3;
}

- (BOOL)isTerminusNearby
{
  id v2 = [(IDSUTunDeliveryController *)self idsNRDeviceBridge];
  unsigned __int8 v3 = [v2 isNearby];

  return v3;
}

- (BOOL)isTerminusRegistered
{
  id v2 = [(IDSUTunDeliveryController *)self idsNRDeviceBridge];
  unsigned __int8 v3 = [v2 isRegistered];

  return v3;
}

- (BOOL)isTerminusConnectedOverBluetooth
{
  unsigned __int8 v3 = [(IDSUTunDeliveryController *)self idsNRDeviceBridge];
  if ([v3 isConnected])
  {
    BOOL v4 = [(IDSUTunDeliveryController *)self idsNRDeviceBridge];
    BOOL v5 = [v4 latestLinkType] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)nrDeviceBridge:(id)a3 defaultPeerConnectivityDidChange:(BOOL)a4
{
}

- (void)nrDeviceBridge:(id)a3 defaultPeerNearbyDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  [(IDSUTunDeliveryController *)self defaultPeerNearbyChanged:v4];
  id v6 = [(IDSUTunDeliveryController *)self _copyPairedDevice];
  if (v6 && v4)
  {
    CFStringRef v7 = [(NSHashTable *)self->_connectivityDelegates allObjects];
    id v8 = [v7 copy];

    unsigned int v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = [v6 uniqueID];
      *(_DWORD *)buf = 138412290;
      __int16 v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Broadcasting found nearby IPsec device {uniqueID: %@}", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        CFStringRef v17 = [v6 uniqueID];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          CFStringRef v18 = objc_msgSend(v6, "uniqueID", v17);
          _IDSLogV();
        }
      }
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      do
      {
        CFStringRef v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          CFStringRef v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v14);
          if (objc_opt_respondsToSelector())
          {
            CFStringRef v16 = [v6 uniqueID];
            [v15 deliveryController:self foundNearbyIPsecCapableDeviceWithUniqueID:v16];
          }
          CFStringRef v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [(IDSUTunDeliveryController *)self peerNearbyStateChanged:v6 forceNotify:1];
  }
}

- (void)nrDeviceBridge:(id)a3 defaultPeerCloudConnectivityDidChange:(BOOL)a4
{
}

- (void)nrDeviceBridge:(id)a3 deviceMagnetIndicationOfAwakeStateDidChange:(BOOL)a4
{
}

- (void)nrDeviceBridge:(id)a3 linkType:(unsigned __int8)a4
{
}

- (void)nrDeviceBridge:(id)a3 defaultPeerClassCConnectivityDidChange:(BOOL)a4
{
}

- (void)_setOTREnableTimer
{
  [(IMTimer *)self->_otrTimer invalidate];
  otrTimer = self->_otrTimer;
  self->_otrTimer = 0;

  BOOL v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Set Enable OTR Timer for 60.0 seconds", v9, 2u);
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
  id v5 = objc_alloc((Class)IMTimer);
  id v6 = im_primary_queue();
  CFStringRef v7 = (IMTimer *)[v5 initWithTimeInterval:@"OTREnableTimer" name:1 shouldWake:self target:"_enableOTRForDefaultPairedDevice" selector:0 userInfo:v6 queue:60.0];
  id v8 = self->_otrTimer;
  self->_otrTimer = v7;
}

- (void)_OTREnableTimerFiredOnMain
{
  unsigned __int8 v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E84BC;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_enableOTRForDefaultPairedDevice
{
  im_assert_primary_base_queue();
  if (self->_enableOTR)
  {
    unsigned __int8 v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Set OTR for defaultPairedDevice: YES.", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    BOOL v4 = +[IDSOTRController sharedInstance];
    [v4 resetAllSessions];

    id v5 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:IDSDeviceDefaultPairedDeviceUniqueID];
    [v5 setEnableOTR:1];
    self->_otrInitialized = 1;
  }
}

- (void)_disableOTRForDefaultPairedPeer:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set OTR for defaultPairedDevice: NO.", v7, 2u);
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
  [(IMTimer *)self->_otrTimer invalidate];
  otrTimer = self->_otrTimer;
  self->_otrTimer = 0;

  [v4 setEnableOTR:0];
  self->_otrInitialized = 0;
}

- (void)didAddPairedDevice:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didAddPairedDevice is called.", v8, 2u);
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
  id v6 = +[IDSOTRKeyStorage sharedInstance];
  [v6 removeSessionKeyForAllTokenFromMainQueue];

  CFStringRef v7 = +[IDSOTRController sharedInstance];
  [v7 removeAllCachedSessionsFromMainQueue];

  if (self->_enableOTR) {
    [(IDSUTunDeliveryController *)self _setOTREnableTimer];
  }
}

- (void)didRemovePairedDevice:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didRemovePairedDevice is called.", v9, 2u);
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
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  id v6 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:IDSDeviceDefaultPairedDeviceUniqueID];
  pthread_mutex_unlock(&self->_deviceIDToPeerLock);
  [(IDSUTunDeliveryController *)self _disableOTRForDefaultPairedPeer:v6];
  CFStringRef v7 = +[IDSOTRKeyStorage sharedInstance];
  [v7 removeSessionKeyForAllTokenFromMainQueue];

  id v8 = +[IDSOTRController sharedInstance];
  [v8 removeAllCachedSessionsFromMainQueue];
}

- (void)didUpdatePairedDevice:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"YES";
    if (self->_enableOTR) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    if (!self->_otrInitialized) {
      CFStringRef v6 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didUpdatePairedDevice is called, enable OTR %@, otrInitialized %@.", buf, 0x16u);
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
  if (self->_enableOTR && self->_otrInitialized)
  {
    id v8 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:IDSDeviceDefaultPairedDeviceUniqueID];
    [v8 setEnableOTR:1];
  }
}

- (void)findDefaultPeerToForceOTRNegotiation:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  unsigned int v9 = +[IDSUTunDeliveryController sharedInstance];
  id v10 = [v9 _copyPairedDevice];

  [v10 forceOTRNegotiationForTopic:v8 priority:a4 completionBlock:v7];
}

- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4
{
  id v6 = a3;
  im_assert_primary_base_queue();
  deviceIDToPeer = self->_deviceIDToPeer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001E8D38;
  v9[3] = &unk_100985B30;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [(NSMutableDictionary *)deviceIDToPeer enumerateKeysAndObjectsUsingBlock:v9];
}

- (void)_cleanupContinuityPeerMaps:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_peerListMap objectForKey:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned int v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(IDSUTunDeliveryController *)self _copyPeerWithID:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        [v10 setContinuityConnectCount:0];

        unsigned int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(NSMutableDictionary *)self->_peerListMap removeObjectForKey:v4];
  [(NSMutableDictionary *)self->_pendingPeerMap removeObjectForKey:v4];
  [(NSMutableDictionary *)self->_peerConnectBlocksMap removeObjectForKey:v4];
  [(NSMutableDictionary *)self->_peerFailureBlocksMap removeObjectForKey:v4];
}

- (void)lockContinuityPeer:(id)a3 btUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_continuityPeerLock = &self->_continuityPeerLock;
  pthread_mutex_lock(&self->_continuityPeerLock);
  unsigned int v9 = [(NSMutableDictionary *)self->_lockedPeerMap objectForKey:v7];
  id v10 = v9;
  if (v9)
  {
    if (([v9 isEqualToString:v6] & 1) == 0)
    {
      long long v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = v10;
        __int16 v20 = 2112;
        id v21 = v7;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Peer %@ is already locked for btUUID %@, ignore peer %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  else
  {
    lockedPeerMap = self->_lockedPeerMap;
    if (!lockedPeerMap)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      long long v14 = self->_lockedPeerMap;
      self->_lockedPeerMap = Mutable;

      lockedPeerMap = self->_lockedPeerMap;
    }
    [(NSMutableDictionary *)lockedPeerMap setObject:v6 forKey:v7];
    CFStringRef v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Lock peer %@ for btUUID %@.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v16 = v6;
      id v17 = v7;
      _IDSLogV();
    }
    -[IDSUTunDeliveryController _cleanupContinuityPeerMaps:](self, "_cleanupContinuityPeerMaps:", v7, v16, v17);
  }
  pthread_mutex_unlock(p_continuityPeerLock);
}

- (void)unlockContinuityPeer:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_continuityPeerLock);
  id v5 = [(NSMutableDictionary *)self->_lockedPeerMap objectForKey:v4];
  if (v5)
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remove locked peer %@ for btUUID %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v7 = v5;
      id v8 = v4;
      _IDSLogV();
    }
    -[NSMutableDictionary removeObjectForKey:](self->_lockedPeerMap, "removeObjectForKey:", v4, v7, v8);
  }
  [(IDSUTunDeliveryController *)self _cleanupContinuityPeerMaps:v4];
  pthread_mutex_unlock(&self->_continuityPeerLock);
}

- (void)unlockAllContinuityPeers
{
  p_continuityPeerLock = &self->_continuityPeerLock;
  pthread_mutex_lock(&self->_continuityPeerLock);
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unlock all peers, clean up.", v10, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  lockedPeerMap = self->_lockedPeerMap;
  self->_lockedPeerMap = 0;

  peerListMap = self->_peerListMap;
  self->_peerListMap = 0;

  pendingPeerMap = self->_pendingPeerMap;
  self->_pendingPeerMap = 0;

  peerConnectBlocksMap = self->_peerConnectBlocksMap;
  self->_peerConnectBlocksMap = 0;

  peerFailureBlocksMap = self->_peerFailureBlocksMap;
  self->_peerFailureBlocksMap = 0;

  pthread_mutex_unlock(p_continuityPeerLock);
}

- (id)lockedContinuityPeerID:(id)a3
{
  p_continuityPeerLock = &self->_continuityPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_continuityPeerLock);
  id v6 = [(NSMutableDictionary *)self->_lockedPeerMap objectForKey:v5];

  pthread_mutex_unlock(p_continuityPeerLock);

  return v6;
}

- (id)pendingContinuityPeerID:(id)a3
{
  p_continuityPeerLock = &self->_continuityPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_continuityPeerLock);
  id v6 = [(NSMutableDictionary *)self->_pendingPeerMap objectForKey:v5];

  pthread_mutex_unlock(p_continuityPeerLock);

  return v6;
}

- (void)addContinuityPeer:(id)a3 btUUID:(id)a4 connectBlock:(id)a5 failureBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID])
  {
    long long v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "addContinuityPeer is called for default paired device, please file a bug.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  else
  {
    p_continuityPeerLock = &self->_continuityPeerLock;
    pthread_mutex_lock(&self->_continuityPeerLock);
    [(NSMutableDictionary *)self->_peerListMap objectForKey:v11];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v46;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(v15);
          }
          if ([*(id *)(*((void *)&v45 + 1) + 8 * i) isEqualToString:v10])
          {
            pthread_mutex_unlock(p_continuityPeerLock);
            CFStringRef v27 = v15;
            goto LABEL_48;
          }
        }
        id v16 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v50 = v10;
      __int16 v51 = 2112;
      id v52 = v11;
      __int16 v53 = 2112;
      id v54 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Add new peer %@ for btUUID %@, list %@.", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v41 = v11;
      id v43 = v15;
      id v38 = v10;
      _IDSLogV();
    }
    if (!v15) {
      id v15 = objc_alloc_init((Class)NSMutableArray);
    }
    objc_msgSend(v15, "addObject:", v10, v38, v41, v43);
    peerListMap = self->_peerListMap;
    if (!peerListMap)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      __int16 v22 = self->_peerListMap;
      self->_peerListMap = Mutable;

      peerListMap = self->_peerListMap;
    }
    [(NSMutableDictionary *)peerListMap setObject:v15 forKey:v11];
    id v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "current peer list:%@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v39 = v15;
      _IDSLogV();
    }
    pendingPeerMap = self->_pendingPeerMap;
    if (!pendingPeerMap)
    {
      id v25 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      __int16 v26 = self->_pendingPeerMap;
      self->_pendingPeerMap = v25;

      pendingPeerMap = self->_pendingPeerMap;
    }
    CFStringRef v27 = -[NSMutableDictionary objectForKey:](pendingPeerMap, "objectForKey:", v11, v39);
    if (!v27)
    {
      [(NSMutableDictionary *)self->_pendingPeerMap setObject:v10 forKey:v11];
      id v28 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v50 = v10;
        __int16 v51 = 2112;
        id v52 = v11;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Enable peer %@ for btUUID %@.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v40 = v10;
        id v42 = v11;
        _IDSLogV();
      }
      if (v12)
      {
        long long v29 = im_primary_queue();
        dispatch_async(v29, v12);
      }
    }
    -[NSMutableDictionary objectForKey:](self->_peerConnectBlocksMap, "objectForKey:", v11, v40, v42);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    if (!v30) {
      id v30 = objc_alloc_init((Class)NSMutableDictionary);
    }
    if (!self->_peerConnectBlocksMap)
    {
      id v31 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      peerConnectBlocksMap = self->_peerConnectBlocksMap;
      self->_peerConnectBlocksMap = v31;
    }
    id v33 = [v12 copy];
    [v30 setObject:v33 forKey:v10];

    [(NSMutableDictionary *)self->_peerConnectBlocksMap setObject:v30 forKey:v11];
    id v34 = [(NSMutableDictionary *)self->_peerFailureBlocksMap objectForKey:v11];
    if (!v34) {
      id v34 = objc_alloc_init((Class)NSMutableDictionary);
    }
    if (!self->_peerFailureBlocksMap)
    {
      id v35 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      peerFailureBlocksMap = self->_peerFailureBlocksMap;
      self->_peerFailureBlocksMap = v35;
    }
    id v37 = [v13 copy];
    [v34 setObject:v37 forKey:v10];

    [(NSMutableDictionary *)self->_peerFailureBlocksMap setObject:v34 forKey:v11];
    pthread_mutex_unlock(p_continuityPeerLock);

LABEL_48:
  }
}

- (void)tryNextContinuityPeer:(id)a3
{
  id v4 = a3;
  p_continuityPeerLock = &self->_continuityPeerLock;
  pthread_mutex_lock(&self->_continuityPeerLock);
  id v41 = self;
  id v38 = v4;
  id v39 = [(NSMutableDictionary *)self->_lockedPeerMap objectForKey:v4];
  if (!v39)
  {
    id v6 = [(NSMutableDictionary *)self->_pendingPeerMap objectForKey:v4];
    if (!v6)
    {
      id v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "No pending peer, bail out.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      pthread_mutex_unlock(p_continuityPeerLock);
      goto LABEL_62;
    }
    id v7 = [(NSMutableDictionary *)self->_peerListMap objectForKey:v4];
    id v8 = [(IDSUTunDeliveryController *)self _copyPeerWithID:v6];
    id v9 = [v8 continuityConnectCount];

    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v49 = v7;
      __int16 v50 = 2112;
      __int16 v51 = v6;
      __int16 v52 = 1024;
      int v53 = (int)v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Search peer in %@. (current peer %@, count %d)", buf, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v34 = v6;
      id v36 = v9;
      id v32 = v7;
      _IDSLogV();
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v7;
    id v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v11)
    {
      id v40 = 0;
      uint64_t v12 = *(void *)v44;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEqualToString:", v6, v32, v34, v36) & 1) == 0)
          {
            id v15 = [(IDSUTunDeliveryController *)v41 _copyPeerWithID:v14];
            id v16 = [v15 continuityConnectCount];
            uint64_t v17 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v49 = v14;
              __int16 v50 = 1024;
              LODWORD(v51) = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "peer %@ has count %d", buf, 0x12u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v32 = v14;
              id v34 = v16;
              _IDSLogV();
            }
            if ((int)v16 >= (int)v9)
            {
              id v16 = v9;
            }
            else
            {
              id v18 = v14;

              id v40 = v18;
            }

            id v9 = v16;
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v11);

      if (v40)
      {
        id v19 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v49 = v40;
          __int16 v50 = 2112;
          __int16 v51 = v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Try new peer %@, disable peer %@.", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v32 = v40;
          id v34 = v6;
          _IDSLogV();
        }
        __int16 v20 = -[NSMutableDictionary objectForKey:](v41->_peerFailureBlocksMap, "objectForKey:", v38, v32, v34);
        id v21 = [v20 objectForKey:v6];

        if (v21)
        {
          __int16 v22 = im_primary_queue();
          dispatch_async(v22, v21);
        }
        pendingPeerMap = v41->_pendingPeerMap;
        if (!pendingPeerMap)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          id v25 = v41->_pendingPeerMap;
          v41->_pendingPeerMap = (NSMutableDictionary *)Mutable;

          pendingPeerMap = v41->_pendingPeerMap;
        }
        [(NSMutableDictionary *)pendingPeerMap setObject:v40 forKey:v38];
        __int16 v26 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v49 = v40;
          __int16 v50 = 2112;
          __int16 v51 = v38;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Enable peer %@ for btUUID %@.", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v33 = v40;
          id v35 = v38;
          _IDSLogV();
        }
        CFStringRef v27 = -[NSMutableDictionary objectForKey:](v41->_peerConnectBlocksMap, "objectForKey:", v38, v33, v35);
        id v28 = [v27 objectForKey:v40];

        if (v28)
        {
          long long v29 = im_primary_queue();
          dispatch_async(v29, v28);
        }
        pthread_mutex_unlock(p_continuityPeerLock);

LABEL_61:
LABEL_62:

        goto LABEL_63;
      }
    }
    else
    {
    }
    id v31 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v6;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Found no other peer, stick with peer %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    pthread_mutex_unlock(p_continuityPeerLock);
    id v40 = 0;
    goto LABEL_61;
  }
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v49 = v39;
    __int16 v50 = 2112;
    __int16 v51 = v38;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer %@ is already locked for btUUID %@, skip other peers.", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  pthread_mutex_unlock(p_continuityPeerLock);
LABEL_63:
}

- (BOOL)isPeerForPhoneContinuityLocalMessage:(id)a3
{
  id v4 = a3;
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  pthread_mutex_lock(&self->_deviceIDToPeerLock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [(NSMutableDictionary *)self->_deviceIDToPeer allValues];
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [v10 btUUID];
        if ([v11 isEqualToString:v4])
        {
          uint64_t v12 = [v10 originalbtUUID];
          BOOL v13 = v12 == 0;

          if (!v13)
          {
            id v15 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = [v10 btUUID];
              *(_DWORD *)buf = 138412290;
              __int16 v26 = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peer's session ID %@ is for the phone continuity local message.", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v19 = [v10 btUUID];
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  __int16 v20 = objc_msgSend(v10, "btUUID", v19);
                  _IDSLogV();
                }
              }
            }
            BOOL v14 = 1;
            goto LABEL_20;
          }
        }
        else
        {
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_20:

  pthread_mutex_unlock(p_deviceIDToPeerLock);
  return v14;
}

- (id)sessionIDforPeer:(id)a3
{
  p_deviceIDToPeerLock = &self->_deviceIDToPeerLock;
  id v5 = a3;
  pthread_mutex_lock(p_deviceIDToPeerLock);
  id v6 = [(NSMutableDictionary *)self->_btuuidToSessionID objectForKey:v5];

  pthread_mutex_unlock(p_deviceIDToPeerLock);

  return v6;
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (id)_currentOTRTimer
{
  return self->_otrTimer;
}

- (void)enableOTRForDefaultPairedDevice
{
  im_assert_primary_base_queue();
  unsigned __int8 v3 = [(IDSUTunDeliveryController *)self _currentOTRTimer];

  if (!v3)
  {
    id v7 = [(IDSUTunDeliveryController *)self pairingManager];
    if ([v7 isPaired])
    {
      BOOL enableOTR = self->_enableOTR;

      if (enableOTR)
      {
        id v5 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Told to enable OTR for default paired device", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
        id v6 = [(NSMutableDictionary *)self->_deviceIDToPeer objectForKey:IDSDeviceDefaultPairedDeviceUniqueID];
        [v6 setEnableOTR:1];
        self->_otrInitialized = 1;
      }
    }
    else
    {
    }
  }
}

- (void)rapportClient:(id)a3 didDiscoverDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  im_assert_primary_base_queue();
  id v8 = [(IDSUTunDeliveryController *)self _copyPeerWithID:v7];
  if (!v8)
  {
    id v8 = [(IDSUTunDeliveryController *)self _createPeerFromDeviceID:v7];
  }
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Rapport discovered device. {Peer:%@, deviceID:%@}", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v11 = v8;
    id v12 = v7;
    _IDSLogV();
  }
  if (+[IMUserDefaults isLiveDeliveryWarmUpEnabled])
  {
    if (([v8 isCloudConnected] & 1) == 0)
    {
      [v8 enableCloudConnection];
      id v10 = +[IDSUTunController sharedInstance];
      [v10 startGlobalLinkForDevice:v7];
    }
    [v8 setIsPeerAlwaysConnected:1];
  }
}

- (void)rapportClient:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  im_assert_primary_base_queue();
  id v8 = [(IDSUTunDeliveryController *)self _copyPeerWithID:v7];
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Rapport lost device. {Peer:%@, deviceID:%@}", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v10 = v8;
    id v11 = v7;
    _IDSLogV();
  }
  if (+[IMUserDefaults isLiveDeliveryWarmUpEnabled](IMUserDefaults, "isLiveDeliveryWarmUpEnabled", v10, v11))[v8 setIsPeerAlwaysConnected:0]; {
}
  }

- (IDSUTunDeliveryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSUTunDeliveryControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enableOTR
{
  return self->_enableOTR;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isCloudConnected
{
  return self->_isCloudConnected;
}

- (void)setIsCloudConnected:(BOOL)a3
{
  self->_isCloudConnected = a3;
}

- (BOOL)isClassCConnected
{
  return self->_isClassCConnected;
}

- (void)setIsClassCConnected:(BOOL)a3
{
  self->_isClassCConnected = a3;
}

- (double)lastCloudConnectedTime
{
  return self->_lastCloudConnectedTime;
}

- (void)setLastCloudConnectedTime:(double)a3
{
  self->_lastCloudConnectedTime = a3;
}

- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice
{
  return self->_shouldUseIPsecLinkForDefaultPairedDevice;
}

- (void)setShouldUseIPsecLinkForDefaultPairedDevice:(BOOL)a3
{
  self->_shouldUseIPsecLinkForDefaultPairedDevice = a3;
}

- (IDSNRDeviceBridge)idsNRDeviceBridge
{
  return self->_idsNRDeviceBridge;
}

- (void)setIdsNRDeviceBridge:(id)a3
{
}

- (IDSNRDevicePreferencesHandler)nrDevicePreferencesHandler
{
  return self->_nrDevicePreferencesHandler;
}

- (void)setNrDevicePreferencesHandler:(id)a3
{
}

- (IDSConnectivityMonitor)connectivityMonitor
{
  return self->_connectivityMonitor;
}

- (void)setConnectivityMonitor:(id)a3
{
}

- (double)notificationDelayInSeconds
{
  return self->_notificationDelayInSeconds;
}

- (void)setNotificationDelayInSeconds:(double)a3
{
  self->_notificationDelayInSeconds = a3;
}

- (BOOL)isLocalSetUpInProgress
{
  return self->_isLocalSetUpInProgress;
}

- (void)setIsLocalSetUpInProgress:(BOOL)a3
{
  self->_isLocalSetUpInProgress = a3;
}

- (void)setPairingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_connectivityMonitor, 0);
  objc_storeStrong((id *)&self->_nrDevicePreferencesHandler, 0);
  objc_storeStrong((id *)&self->_idsNRDeviceBridge, 0);
  objc_storeStrong((id *)&self->_broadcastQueue, 0);
  objc_storeStrong((id *)&self->_peerFailureBlocksMap, 0);
  objc_storeStrong((id *)&self->_peerConnectBlocksMap, 0);
  objc_storeStrong((id *)&self->_pendingPeerMap, 0);
  objc_storeStrong((id *)&self->_peerListMap, 0);
  objc_storeStrong((id *)&self->_lockedPeerMap, 0);
  objc_storeStrong((id *)&self->_otrTimer, 0);
  objc_storeStrong((id *)&self->_allowedTrafficClasses, 0);
  objc_storeStrong((id *)&self->_connectivityDelegates, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamIDToTopic, 0);
  objc_storeStrong((id *)&self->_btuuidToSessionID, 0);

  objc_storeStrong((id *)&self->_deviceIDToPeer, 0);
}

@end