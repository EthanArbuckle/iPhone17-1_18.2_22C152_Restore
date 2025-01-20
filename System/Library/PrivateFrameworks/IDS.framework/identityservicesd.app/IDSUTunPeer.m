@interface IDSUTunPeer
- (BOOL)_allCloudConnectionsAreIdle;
- (BOOL)_allConnectionsAreIdle;
- (BOOL)_messageTypeSupportedForCloudConnection:(int64_t)a3;
- (BOOL)_shouldLogTransportStats;
- (BOOL)hasSpaceForMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4 messageType:(int64_t)a5;
- (BOOL)isClassCConnected;
- (BOOL)isCloudConnected;
- (BOOL)isConnected;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isMagnetIndicatingPeerIsAwake;
- (BOOL)isNearby;
- (BOOL)isPeerAlwaysConnected;
- (BOOL)localSetupInProgress;
- (BOOL)manager:(id)a3 cbuuidDidDiscover:(id)a4;
- (BOOL)pendingCloudEnable;
- (BOOL)sendAckForMessageWithSequenceNumber:(unsigned int)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 connectionType:(int64_t)a6;
- (BOOL)supportsCloudConnections;
- (IDSUTunPeer)initWithIdentifier:(id)a3 btUUID:(id)a4 uniqueID:(id)a5 shouldUseIPsecLink:(BOOL)a6 isNearby:(BOOL)a7 isClassCConnected:(BOOL)a8;
- (IDSUTunPeerDelegate)delegate;
- (NSDictionary)defaultPriorityMessageStatistics;
- (NSDictionary)sendingMessageStatistics;
- (NSDictionary)syncPriorityMessageStatistics;
- (NSDictionary)urgentCloudPriorityMessageStatistics;
- (NSDictionary)urgentPriorityMessageStatistics;
- (NSString)btUUID;
- (NSString)identifier;
- (NSString)originalbtUUID;
- (NSString)uniqueID;
- (id)_connectionForPriority:(int64_t)a3 messageType:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
- (id)_copyPowerlogDictionaryWithOutgoingStats:(id)a3 incomingStats:(id)a4;
- (id)_copyStatisticsDict:(id)a3;
- (id)createConnectionWithIdentifier:(id)a3 priority:(int64_t)a4 shouldUseIPsecLink:(BOOL)a5 dataProtectionClass:(unsigned int)a6;
- (id)defaultCloudPriorityMessageStatistics;
- (id)rapportClient;
- (id)syncCloudPriorityMessageStatistics;
- (int)continuityConnectCount;
- (int64_t)_connectionTypeForConnection:(id)a3;
- (int64_t)_priorityForConnection:(id)a3;
- (os_unfair_lock_s)emptyStatesLock;
- (unsigned)linkType;
- (void)_accumulateStats:(id)a3 intoMessages:(unint64_t *)a4 andBytes:(unint64_t *)a5;
- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4;
- (void)_checkServicesPreferringInfraWiFi:(unsigned int)a3;
- (void)_clearCloudDisableTimer;
- (void)_clearDisableTimer;
- (void)_cloudDisableTimerFired:(id)a3;
- (void)_disableTimerFired:(id)a3;
- (void)_handleCBUUIDDidConnect:(id)a3 isDefaultPairedDevice:(BOOL)a4 isAlwaysConnected:(BOOL)a5;
- (void)_handleCBUUIDFailToConnect:(id)a3 withReason:(id)a4;
- (void)_powerLogServices:(id)a3 prefersInfraWifi:(BOOL)a4;
- (void)_powerlogDictionaryForPriority:(int64_t)a3;
- (void)_powerlogDictionaryForSockets;
- (void)_powerlogTransportStats;
- (void)_startCloudDisableTimerIfNecessary;
- (void)_startDisableTimerIfNecessary;
- (void)_startPowerLogTimersForAllPriorities;
- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4;
- (void)cancelMessageID:(id)a3;
- (void)clearStats;
- (void)connection:(id)a3 connectivityChanged:(BOOL)a4;
- (void)connection:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14;
- (void)connection:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14;
- (void)connection:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14;
- (void)connection:(id)a3 receivedAppLevelAckWithTopic:(id)a4 fromID:(id)a5 messageID:(id)a6 peerResponseIdentifier:(id)a7;
- (void)connectionHasSpaceForMessages:(id)a3 dataProtectionClass:(unsigned int)a4;
- (void)connectionIsEmpty:(id)a3;
- (void)connectionIsEmptyOfCloudMessages:(id)a3;
- (void)dealloc;
- (void)disableCloudConnectionForReason:(int64_t)a3;
- (void)disableConnectionForReason:(int64_t)a3 shouldWait:(BOOL)a4;
- (void)dropDisallowedMessages;
- (void)enableCloudConnection;
- (void)enableConnection;
- (void)forceOTRNegotiationForTopic:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5;
- (void)kickProgressBlockForMessageID:(id)a3;
- (void)logCurrentTransportStatsAndResetTimers;
- (void)manager:(id)a3 cbuuidDidConnect:(id)a4 isAlwaysConnected:(BOOL)a5;
- (void)manager:(id)a3 cbuuidDidDisconnect:(id)a4;
- (void)manager:(id)a3 cbuuidDidFailToConnect:(id)a4 withReason:(id)a5;
- (void)performBlock:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
- (void)performBlockForAllConnections:(id)a3;
- (void)performBlockForDirectConnections:(id)a3;
- (void)performBlockSynchronouslyForAllConnections:(id)a3;
- (void)sendMessage:(id)a3 priority:(int64_t)a4 messageType:(int64_t)a5;
- (void)setBtUUID:(id)a3;
- (void)setContinuityConnectCount:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setEmptyStatesLock:(os_unfair_lock_s)a3;
- (void)setEnableOTR:(BOOL)a3;
- (void)setIsClassCConnected:(BOOL)a3;
- (void)setIsCloudConnected:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsDefaultPairedDevice:(BOOL)a3;
- (void)setIsMagnetIndicatingPeerIsAwake:(BOOL)a3;
- (void)setIsNearby:(BOOL)a3;
- (void)setIsPeerAlwaysConnected:(BOOL)a3;
- (void)setLinkPreferences:(id)a3;
- (void)setLinkType:(unsigned __int8)a3;
- (void)setLocalSetupInProgress:(BOOL)a3;
- (void)setOriginalbtUUID:(id)a3;
- (void)setPendingCloudEnable:(BOOL)a3;
- (void)setPreferInfraWiFi:(BOOL)a3 services:(id)a4;
- (void)setSupportsCloudConnections:(BOOL)a3;
- (void)setUniqueID:(id)a3;
- (void)trafficClassesChanged;
- (void)unpairStart;
@end

@implementation IDSUTunPeer

- (BOOL)_allCloudConnectionsAreIdle
{
  im_assert_primary_base_queue();
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = -86;
  v3 = self->_urgentDirectConnections;
  v4 = +[IDSDaemonPriorityQueueController sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000046A0;
  v14[3] = &unk_100980368;
  v5 = v3;
  v15 = v5;
  v16 = &v17;
  [v4 performBlockSYNCHRONOUSLYWithPriority:v14 priority:300];

  if (*((unsigned char *)v18 + 24) && [(NSArray *)self->_defaultDirectConnections count])
  {
    v6 = self->_defaultDirectConnections;
    v7 = +[IDSDaemonPriorityQueueController sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000047C4;
    v11[3] = &unk_100980368;
    v8 = v6;
    v12 = v8;
    v13 = &v17;
    [v7 performBlockSYNCHRONOUSLYWithPriority:v11 priority:200];
  }
  char v9 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (void)_cloudDisableTimerFired:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  [(IDSUTunPeer *)self _clearCloudDisableTimer];
  if ([(IDSUTunPeer *)self _allCloudConnectionsAreIdle])
  {
    if (self->_isDefaultPairedDevice) {
      p_uniqueID = (NSString **)&kIDSDefaultPairedDeviceID;
    }
    else {
      p_uniqueID = &self->_uniqueID;
    }
    v6 = *p_uniqueID;
    v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tearing Down Global Link For %@ Due To Inactivity", buf, 0xCu);
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
    if (self->_shouldUseIPsecLink)
    {
      v8 = +[IDSUTunDeliveryController sharedInstance];
      [v8 defaultPeerSetWantsQuickRelayRequest:0];
    }
    else
    {
      v8 = +[IDSUTunController sharedInstance];
      [v8 disconnectGlobalLinkForDevice:v6 isReinitiating:0 completionHandler:0];
    }
  }
}

- (void)_clearCloudDisableTimer
{
  im_assert_primary_base_queue();
  [(IMDispatchTimer *)self->_cloudDisableTimer invalidate];
  cloudDisableTimer = self->_cloudDisableTimer;
  self->_cloudDisableTimer = 0;
}

- (id)createConnectionWithIdentifier:(id)a3 priority:(int64_t)a4 shouldUseIPsecLink:(BOOL)a5 dataProtectionClass:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  switch(a4)
  {
    case 100:
      CFStringRef v11 = @"-Sync";
      uint64_t v12 = 100;
      v13 = @"sync";
      break;
    case 300:
      CFStringRef v11 = @"-Urgent";
      uint64_t v12 = 300;
      v13 = @"urgent";
      break;
    case 200:
      CFStringRef v11 = @"-Default";
      uint64_t v12 = 200;
      v13 = @"default";
      break;
    default:
      if (!isRunningTests()) {
        abort();
      }
      throwsIDSAbortException();
      uint64_t v12 = 0;
      v13 = 0;
      CFStringRef v11 = 0;
      break;
  }
  if (v6 > 2)
  {
    CFStringRef v14 = &stru_10099BE78;
  }
  else
  {
    CFStringRef v14 = off_100980628[(int)v6];
    v13 = [(__CFString *)v13 stringByAppendingString:v14];
  }
  v15 = +[NSString stringWithFormat:@"%@%@%@", v10, v11, v14];
  v24 = v10;
  BOOL v16 = a5;
  BYTE1(v22) = a5;
  LOBYTE(v22) = 0;
  uint64_t v17 = -[IDSUTunConnection initWithIdentifier:socketPriority:btUUID:uniqueID:incomingServiceMap:outgoingServiceMap:isCloudEnabled:shouldUseIPsecLink:]([IDSUTunConnection alloc], "initWithIdentifier:socketPriority:btUUID:uniqueID:incomingServiceMap:outgoingServiceMap:isCloudEnabled:shouldUseIPsecLink:", v15, v12, self->_btUUID, self->_uniqueID, self->_incomingServiceMap, self->_outgoingServiceMap, v22);
  [(IDSUTunConnection *)v17 setSupportsLegacyOTRSessionToken:1];
  [(IDSUTunConnection *)v17 setMaxQueueSize:5242880];
  [(IDSUTunConnection *)v17 setDelegate:self];
  [(IDSUTunConnection *)v17 setSupportedMessageTypes:&off_1009D2B00];
  [(IDSUTunConnection *)v17 setIdsPriority:a4];
  [(IDSUTunConnection *)v17 setDataProtectionClass:v6];
  [(IDSUTunConnection *)v17 setName:v13];
  if (a4 == 300 || a4 == 200)
  {
    v18 = +[NSString stringWithFormat:@"%@%@Cloud%@", v24, v11, v14];
    BYTE1(v23) = v16;
    LOBYTE(v23) = 1;
    uint64_t v19 = -[IDSUTunConnection initWithIdentifier:socketPriority:btUUID:uniqueID:incomingServiceMap:outgoingServiceMap:isCloudEnabled:shouldUseIPsecLink:]([IDSUTunConnection alloc], "initWithIdentifier:socketPriority:btUUID:uniqueID:incomingServiceMap:outgoingServiceMap:isCloudEnabled:shouldUseIPsecLink:", v18, v12, self->_btUUID, self->_uniqueID, self->_incomingServiceMap, self->_outgoingServiceMap, v23);
    [(IDSUTunConnection *)v19 setSupportsLegacyOTRSessionToken:0];
    [(IDSUTunConnection *)v19 setMaxQueueSize:0x200000];
    [(IDSUTunConnection *)v19 setDelegate:self];
    [(IDSUTunConnection *)v19 setSupportedMessageTypes:&off_1009D2B18];
    [(IDSUTunConnection *)v17 setCloudConnection:v19];
    [(IDSUTunConnection *)v19 setIdsPriority:a4];
    [(IDSUTunConnection *)v19 setDataProtectionClass:v6];
    char v20 = [(__CFString *)v13 stringByAppendingString:@" Cloud"];
    [(IDSUTunConnection *)v19 setName:v20];
  }

  return v17;
}

- (IDSUTunPeer)initWithIdentifier:(id)a3 btUUID:(id)a4 uniqueID:(id)a5 shouldUseIPsecLink:(BOOL)a6 isNearby:(BOOL)a7 isClassCConnected:(BOOL)a8
{
  BOOL v9 = a6;
  v13 = (__CFString *)a3;
  id v87 = a4;
  id v14 = a5;
  v89.receiver = self;
  v89.super_class = (Class)IDSUTunPeer;
  v15 = [(IDSUTunPeer *)&v89 init];
  if (v15)
  {
    v15->_isDefaultPairedDevice = [v14 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];
    BOOL v16 = (NSString *)[(__CFString *)v13 copy];
    identifier = v15->_identifier;
    v15->_identifier = v16;

    v18 = (NSString *)[v14 copy];
    uniqueID = v15->_uniqueID;
    v15->_uniqueID = v18;

    v15->_isMagnetIndicatingPeerIsAwake = 1;
    v15->_shouldUseIPsecLink = v9;
    v15->_emptyStatesLock._os_unfair_lock_opaque = 0;
    if (v9) {
      v15->_isNearby = a7;
    }
    if (!v15->_isDefaultPairedDevice)
    {
      char v20 = (NSString *)[v87 copy];
      btUUID = v15->_btUUID;
      v15->_btUUID = v20;

      v15->_supportsCloudConnections = 1;
    }
    v86 = IMGetDomainValueForKey();
    v15->_waitForDefaultPairedDevice = 0;
    if (v15->_isDefaultPairedDevice)
    {
      uint64_t v22 = +[IDSUTunController sharedInstance];
      [v22 prepareDefaultPairedConnectionInfoWithDeviceUniqueID:v14 shouldUseIPsecLink:v9];

      v15->_waitForDefaultPairedDevice = 1;
    }
    uint64_t v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v99 = v15;
      __int16 v100 = 2112;
      CFStringRef v101 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Initing IDSUTunPeer %p %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v24 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v25 = @"YES";
      if (v15->_isDefaultPairedDevice) {
        CFStringRef v26 = @"YES";
      }
      else {
        CFStringRef v26 = @"NO";
      }
      if (v15->_waitForDefaultPairedDevice) {
        CFStringRef v27 = @"YES";
      }
      else {
        CFStringRef v27 = @"NO";
      }
      v28 = v15->_btUUID;
      v29 = v15->_uniqueID;
      if (!v9) {
        CFStringRef v25 = @"NO";
      }
      *(_DWORD *)buf = 138413570;
      v99 = (IDSUTunPeer *)v28;
      __int16 v100 = 2112;
      CFStringRef v101 = v26;
      __int16 v102 = 2112;
      v103 = v86;
      __int16 v104 = 2112;
      CFStringRef v105 = v27;
      __int16 v106 = 2112;
      v107 = v29;
      __int16 v108 = 2112;
      CFStringRef v109 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "btuuid %@ isDefaultPairedDevice: %@ pipePeripheralUUIDString: %@ waitForDefaultPairedDevice: %@ uniqueID %@ shouldUseIPsecLink: %@", buf, 0x3Eu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v30 = [IDSUTunPeerServiceMap alloc];
    v31 = +[NSString stringWithFormat:@"incoming:%@", v15->_btUUID];
    v32 = [(IDSUTunPeerServiceMap *)v30 initWithName:v31];
    incomingServiceMap = v15->_incomingServiceMap;
    v15->_incomingServiceMap = v32;

    v34 = [IDSUTunPeerServiceMap alloc];
    v35 = +[NSString stringWithFormat:@"outgoing:%@", v15->_btUUID];
    v36 = [(IDSUTunPeerServiceMap *)v34 initWithName:v35];
    outgoingServiceMap = v15->_outgoingServiceMap;
    v15->_outgoingServiceMap = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectedStates = v15->_connectedStates;
    v15->_connectedStates = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    emptyStates = v15->_emptyStates;
    v15->_emptyStates = v40;

    if (v9)
    {
      v42 = [(IDSUTunPeer *)v15 createConnectionWithIdentifier:v13 priority:300 shouldUseIPsecLink:1 dataProtectionClass:0];
      v43 = [(IDSUTunPeer *)v15 createConnectionWithIdentifier:v13 priority:300 shouldUseIPsecLink:1 dataProtectionClass:2];
      v44 = [(IDSUTunPeer *)v15 createConnectionWithIdentifier:v13 priority:200 shouldUseIPsecLink:1 dataProtectionClass:0];
      v45 = [(IDSUTunPeer *)v15 createConnectionWithIdentifier:v13 priority:200 shouldUseIPsecLink:1 dataProtectionClass:2];
      v46 = [(IDSUTunPeer *)v15 createConnectionWithIdentifier:v13 priority:100 shouldUseIPsecLink:1 dataProtectionClass:0];
      v47 = [(IDSUTunPeer *)v15 createConnectionWithIdentifier:v13 priority:100 shouldUseIPsecLink:1 dataProtectionClass:2];
      v93[0] = v42;
      v93[1] = v43;
      v93[2] = v44;
      v93[3] = v45;
      v93[4] = v46;
      v93[5] = v47;
      uint64_t v48 = +[NSArray arrayWithObjects:v93 count:6];
      directConnections = v15->_directConnections;
      v15->_directConnections = (NSArray *)v48;

      v92[0] = v42;
      v92[1] = v43;
      uint64_t v50 = +[NSArray arrayWithObjects:v92 count:2];
      urgentDirectConnections = v15->_urgentDirectConnections;
      v15->_urgentDirectConnections = (NSArray *)v50;

      v91[0] = v44;
      v91[1] = v45;
      uint64_t v52 = +[NSArray arrayWithObjects:v91 count:2];
      defaultDirectConnections = v15->_defaultDirectConnections;
      v15->_defaultDirectConnections = (NSArray *)v52;

      v90[0] = v46;
      v90[1] = v47;
      uint64_t v54 = +[NSArray arrayWithObjects:v90 count:2];
      syncDirectConnections = v15->_syncDirectConnections;
      v15->_syncDirectConnections = (NSArray *)v54;

      urgentConnectionForAck = v15->_urgentConnectionForAck;
      v15->_urgentConnectionForAck = v43;
      v57 = v43;

      defaultConnectionForAck = v15->_defaultConnectionForAck;
      v15->_defaultConnectionForAck = v45;
      v59 = v45;

      syncConnectionForAck = v15->_syncConnectionForAck;
      v15->_syncConnectionForAck = v47;
      v61 = v47;

      uint64_t v62 = [(IDSUTunConnection *)v57 cloudConnection];
      urgentCloudConnectionForAck = v15->_urgentCloudConnectionForAck;
      v15->_urgentCloudConnectionForAck = (IDSUTunConnection *)v62;

      uint64_t v64 = [(IDSUTunConnection *)v59 cloudConnection];
      defaultCloudConnectionForAck = v15->_defaultCloudConnectionForAck;
      v15->_defaultCloudConnectionForAck = (IDSUTunConnection *)v64;

      v15->_isClassCConnected = a8;
    }
    else
    {
      v66 = [(IDSUTunPeer *)v15 createConnectionWithIdentifier:v13 priority:300 shouldUseIPsecLink:0 dataProtectionClass:3];
      v67 = [(IDSUTunPeer *)v15 createConnectionWithIdentifier:v13 priority:200 shouldUseIPsecLink:0 dataProtectionClass:3];
      v68 = [(IDSUTunPeer *)v15 createConnectionWithIdentifier:v13 priority:100 shouldUseIPsecLink:0 dataProtectionClass:3];
      v97[0] = v66;
      v97[1] = v67;
      v97[2] = v68;
      uint64_t v69 = +[NSArray arrayWithObjects:v97 count:3];
      v70 = v15->_directConnections;
      v15->_directConnections = (NSArray *)v69;

      v96 = v66;
      uint64_t v71 = +[NSArray arrayWithObjects:&v96 count:1];
      v72 = v15->_urgentDirectConnections;
      v15->_urgentDirectConnections = (NSArray *)v71;

      v95 = v67;
      uint64_t v73 = +[NSArray arrayWithObjects:&v95 count:1];
      v74 = v15->_defaultDirectConnections;
      v15->_defaultDirectConnections = (NSArray *)v73;

      v94 = v68;
      uint64_t v75 = +[NSArray arrayWithObjects:&v94 count:1];
      v76 = v15->_syncDirectConnections;
      v15->_syncDirectConnections = (NSArray *)v75;

      v77 = v15->_urgentConnectionForAck;
      v15->_urgentConnectionForAck = v66;
      v42 = v66;

      v78 = v15->_defaultConnectionForAck;
      v15->_defaultConnectionForAck = v67;
      v44 = v67;

      v79 = v15->_syncConnectionForAck;
      v15->_syncConnectionForAck = v68;
      v46 = v68;

      uint64_t v80 = [(IDSUTunConnection *)v42 cloudConnection];
      v81 = v15->_urgentCloudConnectionForAck;
      v15->_urgentCloudConnectionForAck = (IDSUTunConnection *)v80;

      uint64_t v82 = [(IDSUTunConnection *)v44 cloudConnection];
      v83 = v15->_defaultCloudConnectionForAck;
      v15->_defaultCloudConnectionForAck = (IDSUTunConnection *)v82;
    }
    if ([(IDSUTunPeer *)v15 _shouldLogTransportStats]) {
      [(IDSUTunPeer *)v15 _powerlogTransportStats];
    }
    v88 = v15;
    im_dispatch_after_primary_queue();
  }
  return v15;
}

- (void)dealloc
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, " Deallocing UTunPeer %p", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v15 = self;
    _IDSLogV();
  }
  [(IMDispatchTimer *)self->_disableTimer invalidate];
  id v4 = +[IDSWPLinkManager sharedInstance];
  [v4 removeConnectivityDelegate:self];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_directConnections;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v9 setDelegate:0];
        id v10 = [v9 cloudConnection];
        [v10 setDelegate:0];

        [v9 setCloudConnection:0];
        [v9 invalidateTimeoutTimer];
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  powerLogTimerUrgent = self->_powerLogTimerUrgent;
  if (powerLogTimerUrgent) {
    dispatch_source_cancel(powerLogTimerUrgent);
  }
  powerLogTimerDefault = self->_powerLogTimerDefault;
  if (powerLogTimerDefault) {
    dispatch_source_cancel(powerLogTimerDefault);
  }
  powerLogTimerSync = self->_powerLogTimerSync;
  if (powerLogTimerSync) {
    dispatch_source_cancel(powerLogTimerSync);
  }
  powerLogTimerSockets = self->_powerLogTimerSockets;
  if (powerLogTimerSockets) {
    dispatch_source_cancel(powerLogTimerSockets);
  }
  v16.receiver = self;
  v16.super_class = (Class)IDSUTunPeer;
  [(IDSUTunPeer *)&v16 dealloc];
}

- (void)performBlockForDirectConnections:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_directConnections;
  id v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v8);
        id v10 = +[IDSDaemonPriorityQueueController sharedInstance];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10006129C;
        v13[3] = &unk_10097E818;
        id v11 = v4;
        v13[4] = v9;
        id v14 = v11;
        objc_msgSend(v10, "performBlockWithPriority:priority:", v13, objc_msgSend(v9, "priority"));

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)performBlockForAllConnections:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_directConnections;
  id v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        BOOL supportsCloudConnections = self->_supportsCloudConnections;
        id v11 = +[IDSDaemonPriorityQueueController sharedInstance];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100061454;
        v14[3] = &unk_1009802A0;
        id v12 = v4;
        void v14[4] = v9;
        id v15 = v12;
        BOOL v16 = supportsCloudConnections;
        objc_msgSend(v11, "performBlockWithPriority:priority:", v14, objc_msgSend(v9, "priority"));

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)performBlockSynchronouslyForAllConnections:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_directConnections;
  id v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        BOOL supportsCloudConnections = self->_supportsCloudConnections;
        id v11 = +[IDSDaemonPriorityQueueController sharedInstance];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10006169C;
        v14[3] = &unk_1009802A0;
        id v12 = v4;
        void v14[4] = v9;
        id v15 = v12;
        BOOL v16 = supportsCloudConnections;
        objc_msgSend(v11, "performBlockSYNCHRONOUSLYWithPriority:priority:", v14, objc_msgSend(v9, "priority"));

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)performBlock:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  id v8 = a3;
  if (self->_shouldUseIPsecLink)
  {
    if (a5 >= 3)
    {
      id v10 = +[IDSFoundationLog UTunPeer];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v18 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending message with unexpected data protection class (%d) - using C", buf, 8u);
      }

      int v9 = 0;
    }
    else
    {
      int v9 = dword_1007940C8[a5];
    }
  }
  else
  {
    int v9 = 3;
  }
  if (a4 > 199)
  {
    if (a4 == 300)
    {
LABEL_20:
      uint64_t v11 = 56;
      goto LABEL_21;
    }
    if (a4 == 200)
    {
      uint64_t v11 = 64;
      goto LABEL_21;
    }
LABEL_17:
    v13 = +[IDSFoundationLog UTunPeer];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Priority is %d - defaulting to Urgent", buf, 8u);
    }

    goto LABEL_20;
  }
  if (a4)
  {
    if (a4 == 100)
    {
      uint64_t v11 = 72;
LABEL_21:
      id v12 = *(id *)((char *)&self->super.isa + v11);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10006196C;
      v14[3] = &unk_1009802C8;
      int v16 = v9;
      id v15 = v8;
      [v12 enumerateObjectsUsingBlock:v14];

      goto LABEL_22;
    }
    goto LABEL_17;
  }
  id v12 = +[IDSFoundationLog UTunPeer];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    sub_10070B8EC(v12);
  }
LABEL_22:
}

- (void)setSupportsCloudConnections:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  if (self->_supportsCloudConnections != v3)
  {
    self->_BOOL supportsCloudConnections = v3;
    if (v3 && !self->_waitForDefaultPairedDevice)
    {
      [(IDSUTunPeer *)self enableCloudConnection];
    }
  }
}

- (void)setBtUUID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  long long v17 = v4;
  if (!v4 || self->_isDefaultPairedDevice || [(NSString *)self->_btUUID isEqualToString:v4])
  {
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      btUUID = self->_btUUID;
      *(_DWORD *)buf = 138412802;
      CFStringRef v27 = self;
      __int16 v28 = 2112;
      v29 = btUUID;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ ignoring btuuid update from %@ to %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    uint64_t v7 = (NSString *)[v4 copy];
    id v8 = self->_btUUID;
    self->_btUUID = v7;

    int v9 = v7;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = self;
    obj = self->_directConnections;
    id v11 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          BOOL supportsCloudConnections = v10->_supportsCloudConnections;
          int v16 = +[IDSDaemonPriorityQueueController sharedInstance];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100061D34;
          v19[3] = &unk_1009802F0;
          v19[4] = v14;
          long long v20 = v9;
          BOOL v21 = supportsCloudConnections;
          objc_msgSend(v16, "performBlockWithPriority:priority:", v19, objc_msgSend(v14, "priority"));
        }
        id v11 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)sendAckForMessageWithSequenceNumber:(unsigned int)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 connectionType:(int64_t)a6
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100061E70;
  v8[3] = &unk_100980318;
  v8[5] = a4;
  v8[6] = a6;
  unsigned int v9 = a5;
  unsigned int v10 = a3;
  v8[4] = &v11;
  -[IDSUTunPeer performBlock:priority:dataProtectionClass:](self, "performBlock:priority:dataProtectionClass:", v8);
  char v6 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)hasSpaceForMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4 messageType:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  unsigned int v9 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v9 assertRunningWithPriority:a3];

  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100062180;
  v11[3] = &unk_100980340;
  void v11[4] = &v13;
  v11[5] = a5;
  int v12 = v6;
  [(IDSUTunPeer *)self performBlock:v11 priority:a3 dataProtectionClass:v6];
  LOBYTE(a5) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return a5;
}

- (BOOL)isConnected
{
  im_assert_primary_base_queue();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v3 = self->_directConnections;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([(IDSUTunPeer *)self isClassCConnected]
          || [v8 dataProtectionClass])
        {
          unsigned int v9 = [(NSMutableDictionary *)self->_connectedStates objectForKeyedSubscript:v8];
          unsigned int v10 = [v9 BOOLValue];

          if (!v10) {
            goto LABEL_15;
          }
          if (self->_supportsCloudConnections)
          {
            uint64_t v11 = [v8 cloudConnection];

            if (v11)
            {
              connectedStates = self->_connectedStates;
              uint64_t v13 = [v8 cloudConnection];
              char v14 = [(NSMutableDictionary *)connectedStates objectForKeyedSubscript:v13];
              unsigned int v15 = [v14 BOOLValue];

              if (!v15)
              {
LABEL_15:
                BOOL v16 = 0;
                goto LABEL_16;
              }
            }
          }
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [&off_1009D2B30 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(&off_1009D2B30);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        int v12 = [v5 objectForKey:v11];
        uint64_t v13 = (char *)[v12 unsignedLongLongValue];

        char v14 = [v6 objectForKey:v11];
        unsigned int v15 = &v13[(void)[v14 unsignedLongLongValue]];

        BOOL v16 = +[NSNumber numberWithUnsignedLongLong:v15];
        [v6 setObject:v16 forKey:v11];
      }
      id v8 = [&off_1009D2B30 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (id)_copyStatisticsDict:(id)a3
{
  id v3 = a3;
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 allKeys];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v4;
        uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * v4);
        id v6 = objc_alloc_init((Class)NSMutableDictionary);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v7 = [&off_1009D2B48 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v24;
          do
          {
            unsigned int v10 = 0;
            do
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(&off_1009D2B48);
              }
              uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v10);
              int v12 = [v3 objectForKey:v5];
              uint64_t v13 = [v12 objectForKey:v11];
              id v14 = [v13 unsignedLongValue];

              unsigned int v15 = +[NSNumber numberWithUnsignedLongLong:v14];
              [v6 setObject:v15 forKey:v11];

              unsigned int v10 = (char *)v10 + 1;
            }
            while (v8 != v10);
            id v8 = [&off_1009D2B48 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v8);
        }
        [v20 setObject:v6 forKey:v5];

        uint64_t v4 = v22 + 1;
      }
      while ((id)(v22 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }

  return v20;
}

- (NSDictionary)sendingMessageStatistics
{
  im_assert_primary_base_queue();
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_100062C44;
  v45 = sub_100062C54;
  id v46 = (id)0xAAAAAAAAAAAAAAAALL;
  id v46 = +[NSMutableArray array];
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100062C5C;
  v40[3] = &unk_100980368;
  v40[4] = self;
  v40[5] = &v41;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v40 priority:200];

  uint64_t v4 = +[IDSDaemonPriorityQueueController sharedInstance];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100062DEC;
  v39[3] = &unk_100980368;
  v39[4] = self;
  v39[5] = &v41;
  [v4 performBlockSYNCHRONOUSLYWithPriority:v39 priority:300];

  uint64_t v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100062F7C;
  v38[3] = &unk_100980368;
  v38[4] = self;
  v38[5] = &v41;
  [v5 performBlockSYNCHRONOUSLYWithPriority:v38 priority:100];

  id v6 = +[NSMutableSet set];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = (id)v42[5];
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v35;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v34 + 1) + 8 * i) allKeys];
        [v6 addObjectsFromArray:v11];
      }
      id v8 = [v7 countByEnumeratingWithState:&v34 objects:v49 count:16];
    }
    while (v8);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v30 objects:v48 count:16];
  if (v12)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * (void)j);
        id v15 = objc_alloc_init((Class)NSMutableDictionary);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v16 = (id)v42[5];
        id v17 = [v16 countByEnumeratingWithState:&v26 objects:v47 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v27;
          do
          {
            for (k = 0; k != v17; k = (char *)k + 1)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v16);
              }
              id v20 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)k) objectForKey:v14];
              [(IDSUTunPeer *)self _addStatsFromDict:v20 toAggregate:v15];
            }
            id v17 = [v16 countByEnumeratingWithState:&v26 objects:v47 count:16];
          }
          while (v17);
        }

        [v25 setObject:v15 forKey:v14];
      }
      id v12 = [obj countByEnumeratingWithState:&v30 objects:v48 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(&v41, 8);

  return (NSDictionary *)v25;
}

- (NSDictionary)syncPriorityMessageStatistics
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned int v10 = sub_100062C44;
  uint64_t v11 = sub_100062C54;
  id v12 = 0;
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000631E0;
  v6[3] = &unk_100980390;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:100];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)defaultPriorityMessageStatistics
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned int v10 = sub_100062C44;
  uint64_t v11 = sub_100062C54;
  id v12 = 0;
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100063394;
  v6[3] = &unk_100980390;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:200];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)urgentPriorityMessageStatistics
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned int v10 = sub_100062C44;
  uint64_t v11 = sub_100062C54;
  id v12 = 0;
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100063548;
  v6[3] = &unk_100980390;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:300];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)urgentCloudPriorityMessageStatistics
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned int v10 = sub_100062C44;
  uint64_t v11 = sub_100062C54;
  id v12 = 0;
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000636FC;
  v6[3] = &unk_100980390;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:300];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)defaultCloudPriorityMessageStatistics
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned int v10 = sub_100062C44;
  uint64_t v11 = sub_100062C54;
  id v12 = 0;
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000638C0;
  v6[3] = &unk_100980390;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:200];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)syncCloudPriorityMessageStatistics
{
  return 0;
}

- (void)_accumulateStats:(id)a3 intoMessages:(unint64_t *)a4 andBytes:(unint64_t *)a5
{
  if (a3)
  {
    id v7 = a3;
    id v9 = [v7 objectForKey:@"localDeliveryQueueStatMessageCount"];
    id v8 = [v7 objectForKey:@"localDeliveryQueueStatBytes"];

    if (a4 && v9) {
      *a4 += (unint64_t)[v9 unsignedLongLongValue];
    }
    if (a5 && v8) {
      *a5 += (unint64_t)[v8 unsignedLongLongValue];
    }
  }
}

- (id)_copyPowerlogDictionaryWithOutgoingStats:(id)a3 incomingStats:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableSet set];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v68;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v68 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)v12) allKeys];
        [v8 addObjectsFromArray:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v10);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v45 = v7;
  id v14 = [v45 countByEnumeratingWithState:&v63 objects:v74 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v64;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v64 != v16) {
          objc_enumerationMutation(v45);
        }
        uint64_t v18 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)v17) allKeys];
        [v8 addObjectsFromArray:v18];

        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v45 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }
    while (v15);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v42 = v8;
  id v44 = [v42 countByEnumeratingWithState:&v59 objects:v73 count:16];
  CFMutableDictionaryRef Mutable = 0;
  if (v44)
  {
    uint64_t v43 = *(void *)v60;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v60 != v43) {
          objc_enumerationMutation(v42);
        }
        uint64_t v21 = *(void *)(*((void *)&v59 + 1) + 8 * (void)v20);
        uint64_t v57 = 0;
        uint64_t v58 = 0;
        uint64_t v55 = 0;
        uint64_t v56 = 0;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v22 = obj;
        id v23 = [v22 countByEnumeratingWithState:&v51 objects:v72 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v52;
          do
          {
            long long v26 = 0;
            do
            {
              if (*(void *)v52 != v25) {
                objc_enumerationMutation(v22);
              }
              long long v27 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)v26) objectForKey:v21];
              [(IDSUTunPeer *)self _accumulateStats:v27 intoMessages:&v58 andBytes:&v57];

              long long v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            id v24 = [v22 countByEnumeratingWithState:&v51 objects:v72 count:16];
          }
          while (v24);
        }

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v28 = v45;
        id v29 = [v28 countByEnumeratingWithState:&v47 objects:v71 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v48;
          do
          {
            long long v32 = 0;
            do
            {
              if (*(void *)v48 != v31) {
                objc_enumerationMutation(v28);
              }
              long long v33 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)v32) objectForKey:v21];
              [(IDSUTunPeer *)self _accumulateStats:v33 intoMessages:&v56 andBytes:&v55];

              long long v32 = (char *)v32 + 1;
            }
            while (v30 != v32);
            id v30 = [v28 countByEnumeratingWithState:&v47 objects:v71 count:16];
          }
          while (v30);
        }

        if (!Mutable) {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        id v34 = objc_alloc((Class)NSDictionary);
        long long v35 = +[NSNumber numberWithUnsignedLongLong:v57];
        long long v36 = +[NSNumber numberWithUnsignedLongLong:v58];
        long long v37 = +[NSNumber numberWithUnsignedLongLong:v55];
        v38 = +[NSNumber numberWithUnsignedLongLong:v56];
        v39 = +[NSNumber numberWithUnsignedChar:[(IDSUTunPeer *)self linkType]];
        id v40 = objc_msgSend(v34, "initWithObjectsAndKeys:", v35, @"IDSLocalOutgoingMessageBytes", v36, @"IDSLocalOutgoingMessages", v37, @"IDSLocalIncomingMessageBytes", v38, @"IDSLocalIncomingMessages", v39, @"IDSLocalLinkType", 0);

        [(__CFDictionary *)Mutable setObject:v40 forKey:v21];
        id v20 = (char *)v20 + 1;
      }
      while (v20 != v44);
      id v44 = [v42 countByEnumeratingWithState:&v59 objects:v73 count:16];
    }
    while (v44);
  }

  return Mutable;
}

- (void)_powerlogDictionaryForPriority:(int64_t)a3
{
  uint64_t v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v5 assertRunningWithPriority:a3];

  uint64_t v6 = 72;
  if (a3 == 200) {
    uint64_t v6 = 64;
  }
  if (a3 == 300) {
    uint64_t v6 = 56;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);
  id v8 = +[NSMutableArray array];
  id v9 = +[NSMutableArray array];
  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  long long v27 = sub_100064250;
  id v28 = &unk_1009803B8;
  id v10 = v8;
  id v29 = v10;
  id v30 = self;
  id v11 = v9;
  id v31 = v11;
  [v7 enumerateObjectsUsingBlock:&v25];
  id v12 = [(IDSUTunPeer *)self _copyPowerlogDictionaryWithOutgoingStats:v10 incomingStats:v11];
  if (v12)
  {
    uint64_t v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v12 count];
      CFStringRef v15 = @"Sync";
      if (a3 == 200) {
        CFStringRef v15 = @"Default";
      }
      *(_DWORD *)buf = 136315906;
      long long v33 = "-[IDSUTunPeer _powerlogDictionaryForPriority:]";
      __int16 v36 = 2112;
      __int16 v34 = 2048;
      long long v35 = self;
      if (a3 == 300) {
        CFStringRef v15 = @"URGENT";
      }
      CFStringRef v37 = v15;
      __int16 v38 = 2048;
      id v39 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: self %p reporting stats for %@ %lu", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      if (a3 == 200) {
        CFStringRef v16 = @"Default";
      }
      else {
        CFStringRef v16 = @"Sync";
      }
      if (a3 == 300) {
        CFStringRef v17 = @"URGENT";
      }
      else {
        CFStringRef v17 = v16;
      }
      CFStringRef v22 = v17;
      id v23 = [v12 count];
      id v20 = "-[IDSUTunPeer _powerlogDictionaryForPriority:]";
      uint64_t v21 = self;
      _IDSLogV();
    }
    if (a3 == 200) {
      CFStringRef v18 = @"Default";
    }
    else {
      CFStringRef v18 = @"Sync";
    }
    if (a3 == 300) {
      CFStringRef v19 = @"URGENT";
    }
    else {
      CFStringRef v19 = v18;
    }
    objc_msgSend(v12, "setObject:forKey:", v19, @"IDSLocalStatisticsCategory", v20, v21, v22, v23, context, v25, v26, v27, v28, v29, v30);
    IDSPowerLogDictionary();
  }
}

- (void)_powerlogDictionaryForSockets
{
  im_assert_primary_base_queue();
  v2 = +[IDSUTunController sharedInstance];
  uint64_t v3 = kIDSDefaultPairedDeviceID;
  uint64_t v26 = [v2 perServiceDataSentForDevice:kIDSDefaultPairedDeviceID services:0];

  id v4 = +[IDSUTunController sharedInstance];
  uint64_t v25 = [v4 perServiceDataReceivedForDevice:v3 services:0];

  uint64_t v5 = [v26 allKeys];
  uint64_t v6 = +[NSMutableSet setWithArray:v5];

  id v7 = [v25 allKeys];
  [v6 addObjectsFromArray:v7];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  id v27 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v27)
  {
    CFMutableDictionaryRef Mutable = 0;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        *(void *)buf = 0;
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t v29 = 0;
        id v11 = [v26 objectForKey:v10];
        [(IDSUTunPeer *)self _accumulateStats:v11 intoMessages:buf andBytes:&v31];

        id v12 = [v25 objectForKey:v10];
        [(IDSUTunPeer *)self _accumulateStats:v12 intoMessages:&v30 andBytes:&v29];

        if (!Mutable) {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        id v13 = objc_alloc((Class)NSDictionary);
        id v14 = +[NSNumber numberWithUnsignedLongLong:v31];
        CFStringRef v15 = +[NSNumber numberWithUnsignedLongLong:*(void *)buf];
        CFStringRef v16 = +[NSNumber numberWithUnsignedLongLong:v29];
        CFStringRef v17 = +[NSNumber numberWithUnsignedLongLong:v30];
        CFStringRef v18 = +[NSNumber numberWithUnsignedChar:[(IDSUTunPeer *)self linkType]];
        id v19 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, @"IDSLocalOutgoingSocketBytes", v15, @"IDSLocalOutgoingSocketPackets", v16, @"IDSLocalIncomingSocketBytes", v17, @"IDSLocalIncomingSocketPackets", v18, @"IDSLocalLinkType", 0);

        [(__CFDictionary *)Mutable setObject:v19 forKey:v10];
      }
      id v27 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v27);

    if (Mutable)
    {
      [(__CFDictionary *)Mutable setObject:@"Sockets" forKey:@"IDSLocalStatisticsCategory"];
      id v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [(__CFDictionary *)Mutable count];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[IDSUTunPeer _powerlogDictionaryForSockets]";
        __int16 v37 = 2048;
        __int16 v38 = self;
        __int16 v39 = 2048;
        id v40 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: self %p reporting stats for sockets %lu services", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        [(__CFDictionary *)Mutable count];
        _IDSLogV();
      }
      IDSPowerLogDictionary();
    }
  }
  else
  {

    CFMutableDictionaryRef Mutable = 0;
  }
}

- (void)_powerlogTransportStats
{
  [(IDSUTunPeer *)self _startPowerLogTimersForAllPriorities];
  uint64_t v3 = +[IMWeakReference weakRefWithObject:self];
  if (!self->_shouldUseIPsecLink)
  {
    id v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldUseIPsecLink) {
        CFStringRef v5 = @"YES";
      }
      else {
        CFStringRef v5 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling power logging for sockets {_shouldUseIPsecLink: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    uint64_t v6 = im_primary_queue();
    id v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
    powerLogTimerSockets = self->_powerLogTimerSockets;
    self->_powerLogTimerSockets = v7;

    id v9 = self->_powerLogTimerSockets;
    if (v9)
    {
      dispatch_time_t v10 = dispatch_time(0, 60000000000);
      dispatch_source_set_timer(v9, v10, 0xDF8475800uLL, 0x3B9ACA00uLL);
      id v11 = self->_powerLogTimerSockets;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100064A94;
      handler[3] = &unk_10097E4D0;
      id v13 = v3;
      dispatch_source_set_event_handler(v11, handler);
      dispatch_activate((dispatch_object_t)self->_powerLogTimerSockets);
    }
  }
}

- (void)_startPowerLogTimersForAllPriorities
{
  uint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v35 = "-[IDSUTunPeer _startPowerLogTimersForAllPriorities]";
    __int16 v36 = 2048;
    __int16 v37 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: self %p Enabling power logging for transport stats", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v26 = "-[IDSUTunPeer _startPowerLogTimersForAllPriorities]";
    id v27 = self;
    _IDSLogV();
  }
  id v4 = +[IMWeakReference weakRefWithObject:](IMWeakReference, "weakRefWithObject:", self, v26, v27);
  CFStringRef v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  uint64_t v6 = [v5 queueForPriority:300];
  id v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
  powerLogTimerUrgent = self->_powerLogTimerUrgent;
  self->_powerLogTimerUrgent = v7;

  id v9 = self->_powerLogTimerUrgent;
  if (v9)
  {
    dispatch_time_t v10 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v9, v10, 0xDF8475800uLL, 0x3B9ACA00uLL);
    id v11 = self->_powerLogTimerUrgent;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100064F08;
    handler[3] = &unk_10097E4D0;
    id v33 = v4;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate((dispatch_object_t)self->_powerLogTimerUrgent);
  }
  id v12 = +[IDSDaemonPriorityQueueController sharedInstance];
  id v13 = [v12 queueForPriority:200];
  id v14 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v13);
  powerLogTimerDefault = self->_powerLogTimerDefault;
  self->_powerLogTimerDefault = v14;

  CFStringRef v16 = self->_powerLogTimerDefault;
  if (v16)
  {
    dispatch_time_t v17 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v16, v17, 0xDF8475800uLL, 0x3B9ACA00uLL);
    CFStringRef v18 = self->_powerLogTimerDefault;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100064F50;
    v30[3] = &unk_10097E4D0;
    id v31 = v4;
    dispatch_source_set_event_handler(v18, v30);
    dispatch_activate((dispatch_object_t)self->_powerLogTimerDefault);
  }
  id v19 = +[IDSDaemonPriorityQueueController sharedInstance];
  id v20 = [v19 queueForPriority:100];
  id v21 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v20);
  powerLogTimerSync = self->_powerLogTimerSync;
  self->_powerLogTimerSync = v21;

  id v23 = self->_powerLogTimerSync;
  if (v23)
  {
    dispatch_time_t v24 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v23, v24, 0xDF8475800uLL, 0x3B9ACA00uLL);
    uint64_t v25 = self->_powerLogTimerSync;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100064F98;
    v28[3] = &unk_10097E4D0;
    id v29 = v4;
    dispatch_source_set_event_handler(v25, v28);
    dispatch_activate((dispatch_object_t)self->_powerLogTimerSync);
  }
}

- (void)logCurrentTransportStatsAndResetTimers
{
  uint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v31 = (IDSUTunPeer *)"-[IDSUTunPeer logCurrentTransportStatsAndResetTimers]";
    __int16 v32 = 2048;
    id v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: self %p Will log the current transport stats and restart timers.", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v22 = "-[IDSUTunPeer logCurrentTransportStatsAndResetTimers]";
    id v23 = self;
    _IDSLogV();
  }
  unsigned int v4 = [(IDSUTunPeer *)self _shouldLogTransportStats];
  if (v4 && self->_shouldUseIPsecLink)
  {
    powerLogTimerUrgent = self->_powerLogTimerUrgent;
    if (powerLogTimerUrgent)
    {
      dispatch_source_cancel(powerLogTimerUrgent);
      uint64_t v6 = self->_powerLogTimerUrgent;
      self->_powerLogTimerUrgent = 0;
    }
    powerLogTimerDefault = self->_powerLogTimerDefault;
    if (powerLogTimerDefault)
    {
      dispatch_source_cancel(powerLogTimerDefault);
      id v8 = self->_powerLogTimerDefault;
      self->_powerLogTimerDefault = 0;
    }
    powerLogTimerSync = self->_powerLogTimerSync;
    if (powerLogTimerSync)
    {
      dispatch_source_cancel(powerLogTimerSync);
      dispatch_time_t v10 = self->_powerLogTimerSync;
      self->_powerLogTimerSync = 0;
    }
    id v11 = +[IMWeakReference weakRefWithObject:self];
    id v12 = +[IDSDaemonPriorityQueueController sharedInstance];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100065410;
    v28[3] = &unk_10097E4D0;
    id v13 = v11;
    id v29 = v13;
    [v12 performBlockUrgentPriority:v28];

    id v14 = +[IDSDaemonPriorityQueueController sharedInstance];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100065458;
    v26[3] = &unk_10097E4D0;
    id v15 = v13;
    id v27 = v15;
    [v14 performBlockDefaultPriority:v26];

    CFStringRef v16 = +[IDSDaemonPriorityQueueController sharedInstance];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000654A0;
    v24[3] = &unk_10097E4D0;
    id v25 = v15;
    id v17 = v15;
    [v16 performBlockSyncPriority:v24];

    [(IDSUTunPeer *)self _startPowerLogTimersForAllPriorities];
  }
  else
  {
    CFStringRef v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = @"NO";
      BOOL shouldUseIPsecLink = self->_shouldUseIPsecLink;
      if (v4) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      id v31 = self;
      __int16 v32 = 2112;
      if (shouldUseIPsecLink) {
        CFStringRef v19 = @"YES";
      }
      id v33 = (IDSUTunPeer *)v21;
      __int16 v34 = 2112;
      CFStringRef v35 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ logCurrentTransportStatsAndResetTimers shouldLog=%@, _shouldUseIPsecLink=%@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)setLocalSetupInProgress:(BOOL)a3
{
  if (self->_localSetupInProgress != a3)
  {
    BOOL v3 = a3;
    self->_localSetupInProgress = a3;
    CFStringRef v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v8 = self;
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LOCALSETUP: %@ has been told to localSetupInProgress %@", buf, 0x16u);
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

- (void)enableConnection
{
  im_assert_primary_base_queue();
  BOOL v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412290;
    id v7 = uniqueID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "enableConnection for peer %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v5 = self->_uniqueID;
    _IDSLogV();
  }
  if (self->_isDefaultPairedDevice) {
    self->_waitForDefaultPairedDevice = 0;
  }
  -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", &stru_1009803F8, v5);
}

- (void)enableCloudConnection
{
  im_assert_primary_base_queue();
  BOOL v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412290;
    CFStringRef v19 = uniqueID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "enableCloudConnection for peer %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      CFStringRef v10 = self->_uniqueID;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        CFStringRef v10 = self->_uniqueID;
        _IDSLogV();
      }
    }
  }
  if (self->_supportsCloudConnections)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id obj = self->_directConnections;
    id v5 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v7);
          __int16 v9 = +[IDSDaemonPriorityQueueController sharedInstance];
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_100065A24;
          v12[3] = &unk_10097E4D0;
          v12[4] = v8;
          objc_msgSend(v9, "performBlockWithPriority:priority:", v12, objc_msgSend(v8, "priority"));

          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
  }
}

- (void)disableConnectionForReason:(int64_t)a3 shouldWait:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138412290;
    long long v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "disabling connection %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v11 = +[NSThread callStackSymbols];
    _IDSLogV();
  }
  im_assert_primary_base_queue();
  __int16 v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412802;
    long long v15 = uniqueID;
    __int16 v16 = 2048;
    id v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "disable Connection for peer %@:%p withReason %ld", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (self->_isDefaultPairedDevice) {
    self->_waitForDefaultPairedDevice = 1;
  }
  if (v4)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100065E94;
    v13[3] = &unk_100980418;
    v13[4] = a3;
    [(IDSUTunPeer *)self performBlockSynchronouslyForAllConnections:v13];
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100065FEC;
    v12[3] = &unk_100980418;
    v12[4] = a3;
    [(IDSUTunPeer *)self performBlockForAllConnections:v12];
  }
}

- (void)disableCloudConnectionForReason:(int64_t)a3
{
  im_assert_primary_base_queue();
  BOOL v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412802;
    id v23 = uniqueID;
    __int16 v24 = 2048;
    id v25 = self;
    __int16 v26 = 2048;
    int64_t v27 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "disable cloud connection for peer %@:%p withReason %ld", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v12 = self;
      int64_t v13 = a3;
      id v11 = self->_uniqueID;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v12 = self;
        int64_t v13 = a3;
        id v11 = self->_uniqueID;
        _IDSLogV();
      }
    }
  }
  if (self->_supportsCloudConnections)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = self->_directConnections;
    id v6 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          __int16 v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
          CFStringRef v10 = +[IDSDaemonPriorityQueueController sharedInstance];
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1000663F8;
          v16[3] = &unk_10097EDD8;
          v16[4] = v9;
          v16[5] = a3;
          objc_msgSend(v10, "performBlockWithPriority:priority:", v16, objc_msgSend(v9, "priority"));

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
  }
}

- (void)setEnableOTR:(BOOL)a3
{
  im_assert_primary_base_queue();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000664EC;
  v5[3] = &unk_100980438;
  BOOL v6 = a3;
  [(IDSUTunPeer *)self performBlockForAllConnections:v5];
}

- (void)setIsMagnetIndicatingPeerIsAwake:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  if (self->_isMagnetIndicatingPeerIsAwake != v3)
  {
    self->_isMagnetIndicatingPeerIsAwake = v3;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10006658C;
    v5[3] = &unk_100980438;
    BOOL v6 = v3;
    [(IDSUTunPeer *)self performBlockForAllConnections:v5];
  }
}

- (void)_powerLogServices:(id)a3 prefersInfraWifi:(BOOL)a4
{
  BOOL v4 = a4;
  id value = a3;
  id v6 = [value count];
  uint64_t v7 = @"Client Request";
  if (!v6) {
    uint64_t v7 = @"Idle Remove";
  }
  id v8 = v7;
  __int16 v9 = self->_servicesPreferringInfraWiFi;
  if (!v9) {
    __int16 v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  CFStringRef v10 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v11 = v10;
  if (v9) {
    CFDictionarySetValue(v10, @"IDSServicePrefersInfraWifi", v9);
  }
  CFDictionarySetValue(v11, @"Reason", v8);
  id v12 = +[NSNumber numberWithBool:v4];
  if (v12) {
    CFDictionarySetValue(v11, @"InfraWiFiState", v12);
  }

  if ([value count] && value) {
    CFDictionarySetValue(v11, @"Services", value);
  }
  IDSPowerLogDictionary();
}

- (void)_checkServicesPreferringInfraWiFi:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  im_assert_primary_base_queue();
  uint64_t v55 = v3;
  if (self->_dispatchCounterInfraWiFi == v3)
  {
    id v5 = +[IDSUTunController sharedInstance];
    id v6 = [v5 copyLinkStatsDict];

    uint64_t v7 = [v6 objectForKey:@"InfraWiFi"];
    id v8 = [v7 objectForKey:@"packetsReceived"];
    long long v53 = (char *)[v8 unsignedLongLongValue];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = self->_servicesPreferringInfraWiFi;
    id v57 = [(NSMutableSet *)obj countByEnumeratingWithState:&v60 objects:v78 count:16];
    if (v57)
    {
      unint64_t v9 = 0;
      uint64_t v56 = *(void *)v61;
      do
      {
        for (i = 0; i != v57; i = (char *)i + 1)
        {
          if (*(void *)v61 != v56) {
            objc_enumerationMutation(obj);
          }
          unint64_t v11 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          id v12 = [(IDSUTunPeer *)self syncPriorityMessageStatistics];
          int64_t v13 = [v12 objectForKey:v11];
          long long v14 = [v13 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"];
          long long v15 = (char *)[v14 unsignedLongLongValue];

          __int16 v16 = [(IDSUTunPeer *)self defaultPriorityMessageStatistics];
          long long v17 = [v16 objectForKey:v11];
          long long v18 = [v17 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"];
          id v19 = [v18 unsignedLongLongValue];

          long long v20 = [(IDSUTunPeer *)self urgentPriorityMessageStatistics];
          CFStringRef v21 = [v20 objectForKey:v11];
          CFStringRef v22 = [v21 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"];
          unint64_t v23 = (unint64_t)[v22 unsignedLongLongValue];

          __int16 v24 = &v15[(void)v19 + v23];
          if (self->_supportsCloudConnections)
          {
            id v25 = [(IDSUTunPeer *)self urgentCloudPriorityMessageStatistics];
            __int16 v26 = [v25 objectForKey:v11];
            int64_t v27 = [v26 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"];
            id v28 = [v27 unsignedLongLongValue];

            __int16 v24 = &v24[(void)v28];
            if (self->_supportsCloudConnections)
            {
              id v29 = [(IDSUTunPeer *)self defaultCloudPriorityMessageStatistics];
              uint64_t v30 = [v29 objectForKey:v11];
              id v31 = [v30 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"];
              id v32 = [v31 unsignedLongLongValue];

              __int16 v24 = &v24[(void)v32];
            }
          }
          id v33 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109634;
            int v65 = v55;
            __int16 v66 = 2112;
            unint64_t v67 = v11;
            __int16 v68 = 2048;
            long long v69 = v24;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "_checkServicesPreferringInfraWiFi %u: Service %@ has %llu delivered messages", buf, 0x1Cu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              unint64_t v47 = v11;
              long long v48 = v24;
              uint64_t v46 = v55;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                unint64_t v47 = v11;
                long long v48 = v24;
                uint64_t v46 = v55;
                _IDSLogV();
              }
            }
          }
          v9 += (unint64_t)v24;
        }
        id v57 = [(NSMutableSet *)obj countByEnumeratingWithState:&v60 objects:v78 count:16];
      }
      while (v57);
    }
    else
    {
      unint64_t v9 = 0;
    }

    __int16 v34 = +[IDSUTunController sharedInstance];
    id v35 = [v34 totalPacketsReceivedForDevice:kIDSDefaultPairedDeviceID services:self->_servicesPreferringInfraWiFi];

    __int16 v36 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t totalPacketsReceivedInfraWiFi = self->_totalPacketsReceivedInfraWiFi;
      unint64_t totalPacketsReceivedClientSockets = self->_totalPacketsReceivedClientSockets;
      unint64_t totalDeliveredMessagesInfraWiFi = self->_totalDeliveredMessagesInfraWiFi;
      *(_DWORD *)buf = 67110656;
      int v65 = v55;
      __int16 v66 = 2048;
      unint64_t v67 = totalPacketsReceivedInfraWiFi;
      __int16 v68 = 2048;
      long long v69 = v53;
      __int16 v70 = 2048;
      unint64_t v71 = totalPacketsReceivedClientSockets;
      __int16 v72 = 2048;
      id v73 = v35;
      __int16 v74 = 2048;
      unint64_t v75 = totalDeliveredMessagesInfraWiFi;
      __int16 v76 = 2048;
      unint64_t v77 = v9;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "_checkServicesPreferringInfraWiFi %u: InfraWiFi received %llu -> %llu packets. Client sockets received %llu -> %llu packets. Total delivered %llu -> %llu", buf, 0x44u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        unint64_t v51 = self->_totalDeliveredMessagesInfraWiFi;
        unint64_t v52 = v9;
        unint64_t v49 = self->_totalPacketsReceivedClientSockets;
        id v50 = v35;
        unint64_t v47 = self->_totalPacketsReceivedInfraWiFi;
        long long v48 = v53;
        uint64_t v46 = v55;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          unint64_t v51 = self->_totalDeliveredMessagesInfraWiFi;
          unint64_t v52 = v9;
          unint64_t v49 = self->_totalPacketsReceivedClientSockets;
          id v50 = v35;
          unint64_t v47 = self->_totalPacketsReceivedInfraWiFi;
          long long v48 = v53;
          uint64_t v46 = v55;
          _IDSLogV();
        }
      }
    }
    if (v9 == self->_totalDeliveredMessagesInfraWiFi
      && v35 == self->_totalPacketsReceivedClientSockets
      && v53 == (char *)self->_totalPacketsReceivedInfraWiFi)
    {
      id v40 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v65 = v55;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "_checkServicesPreferringInfraWiFi %u: No message delivered and no client socket packet received for services preferring InfraWiFi - disabling it now", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v46 = v55;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v46 = v55;
            _IDSLogV();
          }
        }
      }
      servicesPreferringInfraWiFi = self->_servicesPreferringInfraWiFi;
      if (servicesPreferringInfraWiFi)
      {
        [(NSMutableSet *)servicesPreferringInfraWiFi removeAllObjects];
        if (![(NSMutableSet *)self->_servicesPreferringInfraWiFi count])
        {
          id v42 = self->_servicesPreferringInfraWiFi;
          self->_servicesPreferringInfraWiFi = 0;
        }
        -[IDSUTunPeer _powerLogServices:prefersInfraWifi:](self, "_powerLogServices:prefersInfraWifi:", 0, 0, v46, v47, v48, v49, v50, v51, v52);
      }
      uint64_t v43 = +[IDSUTunController sharedInstance];
      [v43 setPreferInfraWiFi:0];
    }
    else
    {
      self->_unint64_t totalDeliveredMessagesInfraWiFi = v9;
      self->_unint64_t totalPacketsReceivedInfraWiFi = (unint64_t)v53;
      self->_unint64_t totalPacketsReceivedClientSockets = (unint64_t)v35;
      dispatch_time_t v44 = dispatch_time(0, 90000000000);
      id v45 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100066E98;
      block[3] = &unk_10097FDE8;
      block[4] = self;
      int v59 = v55;
      dispatch_after(v44, v45, block);
    }
  }
}

- (void)setPreferInfraWiFi:(BOOL)a3 services:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  im_assert_primary_base_queue();
  if (self->_isDefaultPairedDevice && [v6 count])
  {
    if (self->_localSetupInProgress)
    {
      uint64_t v7 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Local Setup is not complete yet - ignore preferInfraWiFi for %@", buf, 0xCu);
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
      id v8 = [objc_alloc((Class)NSMutableSet) initWithSet:self->_servicesPreferringInfraWiFi];
      if (v4)
      {
        servicesPreferringInfraWiFi = self->_servicesPreferringInfraWiFi;
        if (!servicesPreferringInfraWiFi)
        {
          CFStringRef v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          unint64_t v11 = self->_servicesPreferringInfraWiFi;
          self->_servicesPreferringInfraWiFi = v10;

          servicesPreferringInfraWiFi = self->_servicesPreferringInfraWiFi;
        }
        [(NSMutableSet *)servicesPreferringInfraWiFi addObjectsFromArray:v6];
        id v12 = +[IDSUTunController sharedInstance];
        [v12 setPreferInfraWiFi:1];

        unsigned int v13 = self->_dispatchCounterInfraWiFi + 1;
        self->_dispatchCounterInfraWiFi = v13;
        dispatch_time_t v14 = dispatch_time(0, 90000000000);
        long long v15 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10006721C;
        block[3] = &unk_10097FDE8;
        block[4] = self;
        unsigned int v27 = v13;
        dispatch_after(v14, v15, block);
      }
      else
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v16 = v6;
        id v17 = [v16 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v23;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v23 != v18) {
                objc_enumerationMutation(v16);
              }
              [(NSMutableSet *)self->_servicesPreferringInfraWiFi removeObject:*(void *)(*((void *)&v22 + 1) + 8 * i)];
            }
            id v17 = [v16 countByEnumeratingWithState:&v22 objects:v28 count:16];
          }
          while (v17);
        }

        if (![(NSMutableSet *)self->_servicesPreferringInfraWiFi count])
        {
          long long v20 = self->_servicesPreferringInfraWiFi;
          self->_servicesPreferringInfraWiFi = 0;
        }
        if (!self->_servicesPreferringInfraWiFi)
        {
          CFStringRef v21 = +[IDSUTunController sharedInstance];
          [v21 setPreferInfraWiFi:0];

          ++self->_dispatchCounterInfraWiFi;
        }
      }
      if (([(NSMutableSet *)self->_servicesPreferringInfraWiFi isEqualToSet:v8] & 1) == 0) {
        [(IDSUTunPeer *)self _powerLogServices:v6 prefersInfraWifi:v4];
      }
    }
  }
}

- (void)setLinkPreferences:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  if (v4 && self->_isDefaultPairedDevice)
  {
    if (self->_localSetupInProgress)
    {
      id v5 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Local Setup is not complete yet - ignore setLinkPreferences for %{public}@", buf, 0xCu);
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
      id v6 = +[IDSUTunController sharedInstance];
      [v6 setLinkPreferences:v4];
    }
  }
}

- (void)setIsConnected:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  if (self->_isConnected != v3)
  {
    self->_isConnected = v3;
    if (v3)
    {
      [(IDSUTunPeer *)self performBlockForAllConnections:&stru_100980458];
    }
  }
}

- (void)unpairStart
{
  im_assert_primary_base_queue();
  [(IDSUTunPeer *)self setLocalSetupInProgress:1];
  if ([(NSMutableSet *)self->_servicesPreferringInfraWiFi count])
  {
    servicesPreferringInfraWiFi = self->_servicesPreferringInfraWiFi;
    self->_servicesPreferringInfraWiFi = 0;

    id v4 = +[IDSUTunController sharedInstance];
    [v4 setPreferInfraWiFi:0];
  }
  ++self->_dispatchCounterInfraWiFi;
}

- (void)dropDisallowedMessages
{
  im_assert_primary_base_queue();

  [(IDSUTunPeer *)self performBlockForAllConnections:&stru_100980478];
}

- (void)trafficClassesChanged
{
  im_assert_primary_base_queue();

  [(IDSUTunPeer *)self performBlockForAllConnections:&stru_100980498];
}

- (void)clearStats
{
  im_assert_primary_base_queue();
  [(IDSUTunPeer *)self performBlockForAllConnections:&stru_1009804B8];
  id v3 = +[IDSUTunController sharedInstance];
  [v3 clearStats];
}

- (void)cancelMessageID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100067624;
    v5[3] = &unk_1009804E0;
    id v6 = v4;
    [(IDSUTunPeer *)self performBlockForAllConnections:v5];
  }
}

- (void)kickProgressBlockForMessageID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000676D4;
    v5[3] = &unk_1009804E0;
    id v6 = v4;
    [(IDSUTunPeer *)self performBlockForAllConnections:v5];
  }
}

- (void)sendMessage:(id)a3 priority:(int64_t)a4 messageType:(int64_t)a5
{
  id v8 = a3;
  id v28 = _os_activity_create((void *)&_mh_execute_header, "UTUNPeer sendMessage", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v28, &state);
  unint64_t v9 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v9 assertRunningWithPriority:a4];

  if (v8)
  {
    CFStringRef v10 = -[IDSUTunPeer _connectionForPriority:messageType:dataProtectionClass:](self, "_connectionForPriority:messageType:dataProtectionClass:", a4, a5, [v8 dataProtectionClass]);
    unint64_t v11 = v10;
    if (!self->_waitForDefaultPairedDevice) {
      [v10 setEnabled:1];
    }
    os_unfair_lock_lock(&self->_emptyStatesLock);
    [(NSMutableDictionary *)self->_emptyStates setObject:&__kCFBooleanFalse forKeyedSubscript:v11];
    os_unfair_lock_unlock(&self->_emptyStatesLock);
    if ([v8 requireBluetooth] && !self->_isNearby)
    {
      CFStringRef v21 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        long long v22 = [v8 messageUUID];
        *(_DWORD *)buf = 138412290;
        id v30 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Bluetooth is required but we are not nearby - failing message %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          long long v24 = [v8 messageUUID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            long long v24 = objc_msgSend(v8, "messageUUID", v24);
            _IDSLogV();
          }
        }
      }
      objc_msgSend(v8, "completionBlock", v24);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16) {
        goto LABEL_26;
      }
      long long v23 = [v8 toDeviceID];
      uint64_t v18 = +[IDSDaemonPriorityQueueController sharedInstance];
      id v19 = (id *)v26;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100067C90;
      v26[3] = &unk_1009800E8;
      void v26[4] = v11;
      id v20 = v23;
      v26[5] = v20;
      id v16 = v16;
      v26[6] = v16;
      [v18 performBlockMainQueue:v26];
    }
    else
    {
      if (![v8 requireLocalWiFi]
        || ([(IDSUTunPeer *)self rapportClient],
            id v12 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v13 = [v12 isDeviceDiscovered:self->_uniqueID],
            v12,
            (v13 & 1) != 0))
      {
        [v11 sendMessage:v8];
        [v11 resumeConnectivity];
LABEL_27:

        goto LABEL_28;
      }
      dispatch_time_t v14 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = [v8 messageUUID];
        *(_DWORD *)buf = 138412290;
        id v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Local WiFi is required but we are not discovered by Rapport - failing message %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          long long v24 = [v8 messageUUID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            long long v24 = objc_msgSend(v8, "messageUUID", v24);
            _IDSLogV();
          }
        }
      }
      objc_msgSend(v8, "completionBlock", v24);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
LABEL_26:

        goto LABEL_27;
      }
      id v17 = [v8 toDeviceID];
      uint64_t v18 = +[IDSDaemonPriorityQueueController sharedInstance];
      id v19 = (id *)v25;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100067D9C;
      v25[3] = &unk_1009800E8;
      v25[4] = v11;
      id v20 = v17;
      v25[5] = v20;
      id v16 = v16;
      v25[6] = v16;
      [v18 performBlockMainQueue:v25];
    }

    goto LABEL_26;
  }
LABEL_28:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (id)rapportClient
{
  return +[IDSRapportClient sharedInstance];
}

- (id)_connectionForPriority:(int64_t)a3 messageType:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v8 = a3 != 100
    && [(IDSUTunPeer *)self _messageTypeSupportedForCloudConnection:a4]
    && self->_supportsCloudConnections;
  uint64_t v13 = 0;
  dispatch_time_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100062C44;
  id v17 = sub_100062C54;
  id v18 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100068004;
  v11[3] = &unk_100980508;
  BOOL v12 = v8;
  void v11[4] = &v13;
  [(IDSUTunPeer *)self performBlock:v11 priority:a3 dataProtectionClass:v5];
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (BOOL)_messageTypeSupportedForCloudConnection:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (int64_t)_priorityForConnection:(id)a3
{
  return (int64_t)[a3 idsPriority];
}

- (int64_t)_connectionTypeForConnection:(id)a3
{
  if ([a3 isCloudEnabled]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)connection:(id)a3 connectivityChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  objc_msgSend(v7, "assertRunningWithPriority:", objc_msgSend(v6, "idsPriority"));

  BOOL v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 identifier];
    CFStringRef v10 = (void *)v9;
    CFStringRef v11 = @"NO";
    *(_DWORD *)buf = 138413058;
    long long v25 = self;
    if (v4) {
      CFStringRef v11 = @"YES";
    }
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    uint64_t v29 = v9;
    __int16 v30 = 2112;
    CFStringRef v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ isConnected changed to %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v12 = [v6 identifier];
    uint64_t v13 = (void *)v12;
    CFStringRef v14 = @"NO";
    if (v4) {
      CFStringRef v14 = @"YES";
    }
    uint64_t v19 = v12;
    CFStringRef v20 = v14;
    id v17 = self;
    id v18 = v6;
    _IDSLogV();
  }
  uint64_t v15 = +[IDSDaemonPriorityQueueController sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100068310;
  v21[3] = &unk_1009802F0;
  v21[4] = self;
  id v22 = v6;
  BOOL v23 = v4;
  id v16 = v6;
  [v15 performBlockMainQueue:v21];
}

- (void)connection:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14
{
  id v34 = a12;
  id v21 = a11;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  __int16 v28 = +[IDSDaemonPriorityQueueController sharedInstance];
  objc_msgSend(v28, "assertRunningWithPriority:", -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v27));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v29 = [(IDSUTunPeer *)self _priorityForConnection:v27];
  int64_t v30 = [(IDSUTunPeer *)self _connectionTypeForConnection:v27];

  LOBYTE(v33) = a14;
  LOBYTE(v32) = a13;
  LOWORD(v31) = __PAIR16__(a10, a9);
  objc_msgSend(WeakRetained, "peer:protobufReceived:topic:command:fromID:messageID:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:", self, v26, v25, v24, v23, v22, v31, v21, v34, v29, v32, v30, v33);
}

- (void)connection:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14
{
  id v34 = a12;
  id v21 = a11;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  __int16 v28 = +[IDSDaemonPriorityQueueController sharedInstance];
  objc_msgSend(v28, "assertRunningWithPriority:", -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v27));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v29 = [(IDSUTunPeer *)self _priorityForConnection:v27];
  int64_t v30 = [(IDSUTunPeer *)self _connectionTypeForConnection:v27];

  LOBYTE(v33) = a14;
  LOBYTE(v32) = a13;
  LOWORD(v31) = __PAIR16__(a10, a9);
  objc_msgSend(WeakRetained, "peer:dataReceived:topic:command:fromID:messageID:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:", self, v26, v25, v24, v23, v22, v31, v21, v34, v29, v32, v30, v33);
}

- (void)connection:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14
{
  id v34 = a12;
  id v21 = a11;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  __int16 v28 = +[IDSDaemonPriorityQueueController sharedInstance];
  objc_msgSend(v28, "assertRunningWithPriority:", -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v27));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v29 = [(IDSUTunPeer *)self _priorityForConnection:v27];
  int64_t v30 = [(IDSUTunPeer *)self _connectionTypeForConnection:v27];

  LOBYTE(v33) = a14;
  LOBYTE(v32) = a13;
  LOWORD(v31) = __PAIR16__(a10, a9);
  objc_msgSend(WeakRetained, "peer:messageReceived:topic:command:fromID:messageID:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:messageUUID:priority:isCompressed:connectionType:didWakeHint:", self, v26, v25, v24, v23, v22, v31, v21, v34, v29, v32, v30, v33);
}

- (void)connection:(id)a3 receivedAppLevelAckWithTopic:(id)a4 fromID:(id)a5 messageID:(id)a6 peerResponseIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = +[IDSDaemonPriorityQueueController sharedInstance];
  objc_msgSend(v17, "assertRunningWithPriority:", -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v16));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v18 = [(IDSUTunPeer *)self _priorityForConnection:v16];
  int64_t v19 = [(IDSUTunPeer *)self _connectionTypeForConnection:v16];

  [WeakRetained peer:self receivedAppLevelAckWithTopic:v15 fromID:v14 messageID:v13 peerResponseIdentifier:v12 priority:v18 connectionType:v19];
}

- (void)connectionHasSpaceForMessages:(id)a3 dataProtectionClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  im_assert_primary_base_queue();
  id v6 = [v10 idsPriority];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v6 == (id)300)
  {
    BOOL v8 = [v10 supportedMessageTypes];
    [WeakRetained peerHasSpaceForUrgentMessages:self dataProtectionClass:v4 withTypes:v8];
  }
  else
  {
    id v9 = [v10 idsPriority];
    BOOL v8 = [v10 supportedMessageTypes];
    [WeakRetained peerHasSpaceForNonUrgentMessages:self priority:v9 dataProtectionClass:v4 withTypes:v8];
  }
}

- (void)setPendingCloudEnable:(BOOL)a3
{
  self->_pendingCloudEnable = 1;
  if (!self->_supportsCloudConnections)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100068C64;
    v3[3] = &unk_1009804E0;
    v3[4] = self;
    [(IDSUTunPeer *)self performBlockForDirectConnections:v3];
  }
}

- (void)connectionIsEmpty:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_emptyStatesLock);
  [(NSMutableDictionary *)self->_emptyStates setObject:&__kCFBooleanTrue forKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_emptyStatesLock);
  if (self->_pendingCloudEnable && !self->_supportsCloudConnections)
  {
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if ([v4 idsPriority] == (id)300)
      {
        CFStringRef v6 = @"URGENT";
      }
      else
      {
        id v7 = [v4 idsPriority];
        CFStringRef v6 = @"Sync";
        if (v7 == (id)200) {
          CFStringRef v6 = @"Default";
        }
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabling %@ Cloud Connections on this peer", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      if ([v4 idsPriority] == (id)300)
      {
        CFStringRef v8 = @"URGENT";
      }
      else
      {
        id v9 = [v4 idsPriority];
        CFStringRef v8 = @"Sync";
        if (v9 == (id)200) {
          CFStringRef v8 = @"Default";
        }
      }
      CFStringRef v12 = v8;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        if (objc_msgSend(v4, "idsPriority", v12) == (id)300)
        {
          CFStringRef v10 = @"URGENT";
        }
        else
        {
          id v11 = [v4 idsPriority];
          CFStringRef v10 = @"Sync";
          if (v11 == (id)200) {
            CFStringRef v10 = @"Default";
          }
        }
        CFStringRef v12 = v10;
        _IDSLogV();
      }
    }
    *(_WORD *)&self->_BOOL supportsCloudConnections = 1;
    [(IDSUTunPeer *)self enableCloudConnection];
  }
  if (!self->_isPeerAlwaysConnected) {
    [(IDSUTunPeer *)self _startDisableTimerIfNecessary];
  }
}

- (void)connectionIsEmptyOfCloudMessages:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"YES";
    if (self->_pendingCloudEnable) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    BOOL isPeerAlwaysConnected = self->_isPeerAlwaysConnected;
    if (self->_supportsCloudConnections) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    if (!isPeerAlwaysConnected) {
      CFStringRef v6 = @"NO";
    }
    CFStringRef v27 = v7;
    __int16 v28 = 2112;
    CFStringRef v29 = v9;
    __int16 v30 = 2112;
    CFStringRef v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_pendingCloudEnable: %@, _supportsCloudConnections: %@, _isPeerAlwaysConnected: %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    CFStringRef v10 = self->_pendingCloudEnable ? @"YES" : @"NO";
    id v11 = self->_supportsCloudConnections ? @"YES" : @"NO";
    CFStringRef v12 = self->_isPeerAlwaysConnected ? @"YES" : @"NO";
    id v24 = v11;
    id v25 = v12;
    id v23 = v10;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if (self->_pendingCloudEnable) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      if (self->_supportsCloudConnections) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      if (self->_isPeerAlwaysConnected) {
        CFStringRef v15 = @"YES";
      }
      else {
        CFStringRef v15 = @"NO";
      }
      id v24 = (__CFString *)v14;
      id v25 = (__CFString *)v15;
      id v23 = (__CFString *)v13;
      _IDSLogV();
    }
  }
  if (self->_pendingCloudEnable && !self->_supportsCloudConnections)
  {
    id v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if ([v4 idsPriority] == (id)300)
      {
        CFStringRef v17 = @"URGENT";
      }
      else
      {
        id v18 = [v4 idsPriority];
        CFStringRef v17 = @"Sync";
        if (v18 == (id)200) {
          CFStringRef v17 = @"Default";
        }
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Enabling %@ Cloud Connections on this peer", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      if ([v4 idsPriority] == (id)300)
      {
        CFStringRef v19 = @"URGENT";
      }
      else
      {
        id v20 = [v4 idsPriority];
        CFStringRef v19 = @"Sync";
        if (v20 == (id)200) {
          CFStringRef v19 = @"Default";
        }
      }
      id v23 = (__CFString *)v19;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        if (objc_msgSend(v4, "idsPriority", v23) == (id)300)
        {
          CFStringRef v21 = @"URGENT";
        }
        else
        {
          id v22 = [v4 idsPriority];
          CFStringRef v21 = @"Sync";
          if (v22 == (id)200) {
            CFStringRef v21 = @"Default";
          }
        }
        id v23 = (__CFString *)v21;
        _IDSLogV();
      }
    }
    *(_WORD *)&self->_BOOL supportsCloudConnections = 1;
    [(IDSUTunPeer *)self enableCloudConnection];
  }
  if (!self->_isPeerAlwaysConnected) {
    [(IDSUTunPeer *)self _startCloudDisableTimerIfNecessary];
  }
}

- (void)_handleCBUUIDDidConnect:(id)a3 isDefaultPairedDevice:(BOOL)a4 isAlwaysConnected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  im_assert_primary_base_queue();
  CFStringRef v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = self;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ LinkManager did connect cbuuid %@ - enabling connections", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      CFStringRef v15 = self;
      unint64_t v16 = (unint64_t)v8;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        CFStringRef v15 = self;
        unint64_t v16 = (unint64_t)v8;
        _IDSLogV();
      }
    }
  }
  if (v5) {
    [(IDSUTunPeer *)self performBlockForAllConnections:&stru_100980528];
  }
  if (!a4)
  {
    CFStringRef v10 = +[IDSUTunDeliveryController sharedInstance];
    id v11 = [v10 lockedContinuityPeerID:v8];

    if (!v11)
    {
      ++self->_continuityConnectCount;
      CFStringRef v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uniqueID = self->_uniqueID;
        int continuityConnectCount = self->_continuityConnectCount;
        *(_DWORD *)buf = 138412546;
        id v20 = (IDSUTunPeer *)uniqueID;
        __int16 v21 = 1024;
        LODWORD(v22) = continuityConnectCount;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "continuityConnectCount for peer %@ is changed to %d.", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        CFStringRef v15 = (IDSUTunPeer *)self->_uniqueID;
        unint64_t v16 = self->_continuityConnectCount;
        _IDSLogV();
      }
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000695F4;
  v17[3] = &unk_100980438;
  BOOL v18 = a4;
  -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", v17, v15, v16);
  self->_BOOL isPeerAlwaysConnected = v5;
  if (!v5)
  {
    [(IDSUTunPeer *)self _clearDisableTimer];
    [(IDSUTunPeer *)self _startDisableTimerIfNecessary];
  }
}

- (void)manager:(id)a3 cbuuidDidConnect:(id)a4 isAlwaysConnected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  CFStringRef v9 = (IDSUTunPeer *)a4;
  im_assert_primary_base_queue();
  CFStringRef v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v5) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    __int16 v38 = v9;
    __int16 v39 = 2112;
    CFStringRef v40 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "manager:cbuuidDidConnect:%@ isAlwaysConnected:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v12 = @"NO";
    if (v5) {
      CFStringRef v12 = @"YES";
    }
    id v26 = v9;
    CFStringRef v28 = v12;
    _IDSLogV();
  }
  BOOL v13 = -[NSString isEqualToString:](self->_uniqueID, "isEqualToString:", IDSDeviceDefaultPairedDeviceUniqueID, v26, v28);
  if (v13)
  {
    CFStringRef v14 = 0;
  }
  else
  {
    CFStringRef v15 = +[IDSUTunDeliveryController sharedInstance];
    CFStringRef v14 = [v15 lockedContinuityPeerID:v9];

    if (v14 && ([(IDSUTunPeer *)v14 isEqualToString:self->_uniqueID] & 1) == 0)
    {
      id v20 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uniqueID = self->_uniqueID;
        *(_DWORD *)buf = 138412802;
        __int16 v38 = v14;
        __int16 v39 = 2112;
        CFStringRef v40 = (const __CFString *)v9;
        __int16 v41 = 2112;
        id v42 = (IDSUTunPeer *)uniqueID;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Peer %@ is already locked for btUUID %@, ignore peer %@.", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            goto LABEL_24;
          }
        }
      }
      goto LABEL_41;
    }
  }
  if (v9 && [(NSString *)self->_btUUID isEqualToString:v9])
  {
    if (v13 || v14)
    {
      id v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = self->_uniqueID;
        CFStringRef v24 = @"NO";
        *(_DWORD *)buf = 138412802;
        if (v13) {
          CFStringRef v24 = @"YES";
        }
        __int16 v38 = (IDSUTunPeer *)v23;
        __int16 v39 = 2112;
        CFStringRef v40 = v24;
        __int16 v41 = 2112;
        id v42 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Enable peer %@ now. (isDefaultPairedDevice %@   lockedPeer %@)", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        CFStringRef v25 = @"NO";
        if (v13) {
          CFStringRef v25 = @"YES";
        }
        CFStringRef v29 = v25;
        __int16 v30 = v14;
        CFStringRef v27 = self->_uniqueID;
        _IDSLogV();
      }
      -[IDSUTunPeer _handleCBUUIDDidConnect:isDefaultPairedDevice:isAlwaysConnected:](self, "_handleCBUUIDDidConnect:isDefaultPairedDevice:isAlwaysConnected:", v9, v13, v5, v27, v29, v30);
    }
    else
    {
      unint64_t v16 = +[IDSUTunDeliveryController sharedInstance];
      CFStringRef v17 = self->_uniqueID;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100069C70;
      v33[3] = &unk_100980550;
      v33[4] = self;
      id v34 = v9;
      BOOL v35 = v13;
      BOOL v36 = v5;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100069C84;
      v31[3] = &unk_10097E440;
      v31[4] = self;
      uint64_t v32 = v34;
      [v16 addContinuityPeer:v17 btUUID:v32 connectBlock:v33 failureBlock:v31];

      CFStringRef v14 = 0;
    }
    goto LABEL_41;
  }
  BOOL v18 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    btUUID = self->_btUUID;
    *(_DWORD *)buf = 138412802;
    __int16 v38 = self;
    __int16 v39 = 2112;
    CFStringRef v40 = (const __CFString *)v9;
    __int16 v41 = 2112;
    id v42 = (IDSUTunPeer *)btUUID;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "IGNORING %@ LinkManager did connect cbuuid %@ - enabling connections (%@)", buf, 0x20u);
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
LABEL_41:
}

- (void)_handleCBUUIDFailToConnect:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  im_assert_primary_base_queue();
  if (v6 && [(NSString *)self->_btUUID isEqualToString:v6])
  {
    id v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cbuuidDidFailToConnect for peer %@, disabling peer connections!", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v9 = v6;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v9 = v6;
          _IDSLogV();
        }
      }
    }
    [(IDSUTunPeer *)self _clearDisableTimer];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100069E68;
    v10[3] = &unk_1009804E0;
    id v11 = v7;
    [(IDSUTunPeer *)self performBlockForAllConnections:v10];
  }
}

- (void)manager:(id)a3 cbuuidDidFailToConnect:(id)a4 withReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_originalbtUUID)
  {
    id v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skip handling _handleCBUUIDFailToConnect for Phone continuity local message case.", v12, 2u);
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
    [(IDSUTunPeer *)self _handleCBUUIDFailToConnect:v9 withReason:v10];
  }
}

- (void)manager:(id)a3 cbuuidDidDisconnect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  im_assert_primary_base_queue();
  [(IDSUTunPeer *)self performBlockForAllConnections:&stru_100980570];
  if (v7 && [(NSString *)self->_btUUID isEqualToString:v7])
  {
    id v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v12 = self;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ LinkManager did disconnect cbuuid %@ - kicking our disable timer", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v9 = self;
        id v10 = v7;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v9 = self;
          id v10 = v7;
          _IDSLogV();
        }
      }
    }
    [(IDSUTunPeer *)self _startDisableTimerIfNecessary];
  }
}

- (BOOL)manager:(id)a3 cbuuidDidDiscover:(id)a4
{
  id v5 = a4;
  im_assert_primary_base_queue();
  if (v5 && [(NSString *)self->_btUUID isEqualToString:v5])
  {
    BOOL isNearby = self->_isNearby;
    BOOL v7 = 1;
    self->_BOOL isNearby = 1;
    if (!isNearby)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained peerNearbyStateChanged:self forceNotify:0];

      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_allConnectionsAreIdle
{
  im_assert_primary_base_queue();
  uint64_t v23 = 0;
  CFStringRef v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = -86;
  id v3 = self->_urgentDirectConnections;
  id v4 = +[IDSDaemonPriorityQueueController sharedInstance];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006A4D4;
  v20[3] = &unk_100980368;
  id v5 = v3;
  __int16 v21 = v5;
  id v22 = &v23;
  [v4 performBlockSYNCHRONOUSLYWithPriority:v20 priority:300];

  if (!*((unsigned char *)v24 + 24)) {
    goto LABEL_4;
  }
  id v6 = self->_defaultDirectConnections;
  BOOL v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006A5E0;
  v17[3] = &unk_100980368;
  id v8 = v6;
  BOOL v18 = v8;
  CFStringRef v19 = &v23;
  [v7 performBlockSYNCHRONOUSLYWithPriority:v17 priority:200];

  if (*((unsigned char *)v24 + 24))
  {
    id v9 = self->_syncDirectConnections;
    id v10 = +[IDSDaemonPriorityQueueController sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006A6EC;
    v14[3] = &unk_100980368;
    id v11 = v9;
    CFStringRef v15 = v11;
    unint64_t v16 = &v23;
    [v10 performBlockSYNCHRONOUSLYWithPriority:v14 priority:100];

    BOOL v12 = *((unsigned char *)v24 + 24) != 0;
  }
  else
  {
LABEL_4:
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v12;
}

- (void)_clearDisableTimer
{
  im_assert_primary_base_queue();
  [(IMDispatchTimer *)self->_disableTimer invalidate];
  disableTimer = self->_disableTimer;
  self->_disableTimer = 0;
}

- (void)_startDisableTimerIfNecessary
{
  im_assert_primary_base_queue();
  disableTimer = self->_disableTimer;
  if (disableTimer)
  {
    [(IMDispatchTimer *)disableTimer updateTimerInterval:15 repeats:0];
  }
  else
  {
    id v4 = objc_alloc((Class)IMDispatchTimer);
    id v5 = im_primary_queue();
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006A930;
    v8[3] = &unk_100980598;
    v8[4] = self;
    id v6 = (IMDispatchTimer *)[v4 initWithQueue:v5 interval:15 repeats:0 handlerBlock:v8];
    BOOL v7 = self->_disableTimer;
    self->_disableTimer = v6;
  }
}

- (void)_disableTimerFired:(id)a3
{
  im_assert_primary_base_queue();
  [(IDSUTunPeer *)self _clearDisableTimer];
  if ([(IDSUTunPeer *)self _allConnectionsAreIdle] && self->_btUUID)
  {
    [(IDSUTunPeer *)self performBlockForDirectConnections:&stru_1009805B8];
  }
}

- (void)_startCloudDisableTimerIfNecessary
{
  im_assert_primary_base_queue();
  cloudDisableTimer = self->_cloudDisableTimer;
  if (cloudDisableTimer)
  {
    unint64_t v4 = (unint64_t)sub_10006A9B0();
    [(IMDispatchTimer *)cloudDisableTimer updateTimerInterval:v4 repeats:0];
  }
  else
  {
    id v5 = objc_alloc((Class)IMDispatchTimer);
    id v6 = im_primary_queue();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C754;
    v9[3] = &unk_100980598;
    v9[4] = self;
    BOOL v7 = (IMDispatchTimer *)[v5 initWithQueue:v6 interval:(unint64_t)sub_10006A9B0() repeats:0 handlerBlock:v9];
    id v8 = self->_cloudDisableTimer;
    self->_cloudDisableTimer = v7;
  }
}

- (void)setIsPeerAlwaysConnected:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue();
  if (self->_isPeerAlwaysConnected != v3)
  {
    self->_BOOL isPeerAlwaysConnected = v3;
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"YES";
      if (!self->_isPeerAlwaysConnected) {
        CFStringRef v6 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      id v8 = self;
      __int16 v9 = 2112;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ isPeerAlwaysConnected is changed to %@", buf, 0x16u);
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
    if (self->_isPeerAlwaysConnected) {
      [(IDSUTunPeer *)self _clearCloudDisableTimer];
    }
    else {
      [(IDSUTunPeer *)self _startCloudDisableTimerIfNecessary];
    }
  }
}

- (void)forceOTRNegotiationForTopic:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_shouldUseIPsecLink)
  {
    CFStringRef v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v40 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ forceOTRNegotiationForTopic is no-op when ipsec is used", buf, 0xCu);
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
    BOOL supportsCloudConnections = self->_supportsCloudConnections;
    switch(a4)
    {
      case 100:
        CFStringRef v15 = self->_syncDirectConnections;
        unint64_t v16 = +[IDSDaemonPriorityQueueController sharedInstance];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10006B1E4;
        v27[3] = &unk_1009805E0;
        CFStringRef v28 = v15;
        id v29 = v8;
        uint64_t v31 = 100;
        id v30 = v9;
        BOOL v32 = supportsCloudConnections;
        CFStringRef v17 = v15;
        [v16 performBlockSyncPriority:v27];

        break;
      case 200:
        BOOL v18 = self->_defaultDirectConnections;
        CFStringRef v19 = +[IDSDaemonPriorityQueueController sharedInstance];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10006B310;
        v21[3] = &unk_1009805E0;
        id v22 = v18;
        id v23 = v8;
        uint64_t v25 = 200;
        id v24 = v9;
        BOOL v26 = supportsCloudConnections;
        id v20 = v18;
        [v19 performBlockDefaultPriority:v21];

        break;
      case 300:
        BOOL v12 = self->_urgentDirectConnections;
        __int16 v13 = +[IDSDaemonPriorityQueueController sharedInstance];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10006B0B8;
        v33[3] = &unk_1009805E0;
        id v34 = v12;
        id v35 = v8;
        uint64_t v37 = 300;
        id v36 = v9;
        BOOL v38 = supportsCloudConnections;
        id v14 = v12;
        [v13 performBlockUrgentPriority:v33];

        break;
    }
  }
}

- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006B4D8;
  v7[3] = &unk_100980608;
  id v8 = a3;
  BOOL v9 = a4;
  id v6 = v8;
  [(IDSUTunPeer *)self performBlockForAllConnections:v7];
}

- (BOOL)_shouldLogTransportStats
{
  if (self->_isDefaultPairedDevice) {
    return _IDSShouldPowerLog(@"IDS Local Network Stats", a2);
  }
  else {
    return 0;
  }
}

- (IDSUTunPeerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSUTunPeerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)btUUID
{
  return self->_btUUID;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (BOOL)isDefaultPairedDevice
{
  return self->_isDefaultPairedDevice;
}

- (void)setIsDefaultPairedDevice:(BOOL)a3
{
  self->_isDefaultPairedDevice = a3;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (void)setIsNearby:(BOOL)a3
{
  self->_BOOL isNearby = a3;
}

- (BOOL)localSetupInProgress
{
  return self->_localSetupInProgress;
}

- (BOOL)isMagnetIndicatingPeerIsAwake
{
  return self->_isMagnetIndicatingPeerIsAwake;
}

- (BOOL)supportsCloudConnections
{
  return self->_supportsCloudConnections;
}

- (BOOL)pendingCloudEnable
{
  return self->_pendingCloudEnable;
}

- (BOOL)isPeerAlwaysConnected
{
  return self->_isPeerAlwaysConnected;
}

- (int)continuityConnectCount
{
  return self->_continuityConnectCount;
}

- (void)setContinuityConnectCount:(int)a3
{
  self->_int continuityConnectCount = a3;
}

- (NSString)originalbtUUID
{
  return self->_originalbtUUID;
}

- (void)setOriginalbtUUID:(id)a3
{
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

- (unsigned)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(unsigned __int8)a3
{
  self->_linkType = a3;
}

- (os_unfair_lock_s)emptyStatesLock
{
  return self->_emptyStatesLock;
}

- (void)setEmptyStatesLock:(os_unfair_lock_s)a3
{
  self->_emptyStatesLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingServiceMap, 0);
  objc_storeStrong((id *)&self->_incomingServiceMap, 0);
  objc_storeStrong((id *)&self->_powerLogTimerSockets, 0);
  objc_storeStrong((id *)&self->_powerLogTimerSync, 0);
  objc_storeStrong((id *)&self->_powerLogTimerDefault, 0);
  objc_storeStrong((id *)&self->_powerLogTimerUrgent, 0);
  objc_storeStrong((id *)&self->_cloudDisableTimer, 0);
  objc_storeStrong((id *)&self->_disableTimer, 0);
  objc_storeStrong((id *)&self->_servicesPreferringInfraWiFi, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultCloudConnectionForAck, 0);
  objc_storeStrong((id *)&self->_urgentCloudConnectionForAck, 0);
  objc_storeStrong((id *)&self->_syncConnectionForAck, 0);
  objc_storeStrong((id *)&self->_defaultConnectionForAck, 0);
  objc_storeStrong((id *)&self->_urgentConnectionForAck, 0);
  objc_storeStrong((id *)&self->_emptyStates, 0);
  objc_storeStrong((id *)&self->_connectedStates, 0);
  objc_storeStrong((id *)&self->_syncDirectConnections, 0);
  objc_storeStrong((id *)&self->_defaultDirectConnections, 0);
  objc_storeStrong((id *)&self->_urgentDirectConnections, 0);
  objc_storeStrong((id *)&self->_directConnections, 0);
  objc_storeStrong((id *)&self->_originalbtUUID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_btUUID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end