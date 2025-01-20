@interface AXSSInterDeviceCommunicator
- (AXSSInterDeviceActionReceiver)actionReceiver;
- (AXSSInterDeviceCommunicator)init;
- (AXSSInterDeviceConnectionListener)connectionListener;
- (AXSSInterDeviceSearchObserver)searchObserver;
- (AXSSInterDeviceSecurityHelper)securityHelper;
- (BOOL)_setUpSessionIfNecessary;
- (BOOL)canSearch;
- (BOOL)isForwardingSwitchEvents;
- (BOOL)isIdle;
- (BOOL)isReceivingSwitchEvents;
- (BOOL)isSearching;
- (IDSService)service;
- (MCNearbyServiceAdvertiser)advertiser;
- (MCNearbyServiceBrowser)browser;
- (MCPeerID)forwarder;
- (MCPeerID)localPeerID;
- (MCPeerID)receiver;
- (MCSession)session;
- (NSArray)searchResults;
- (NSMutableArray)availableDevices;
- (NSMutableDictionary)deviceTypesByPeerID;
- (NSTimer)dummyPacketTimer;
- (id)_messageForSelection:(BOOL)a3 settings:(id)a4;
- (id)_messageForSwitchEvent:(id)a3 index:(unint64_t)a4;
- (id)_stateDescription;
- (id)_stringForState:(int64_t)a3;
- (int64_t)state;
- (unint64_t)numberOfBurstPacketsRemaining;
- (unint64_t)switchEventIndex;
- (void)_advertise;
- (void)_broadcastICloudMessage:(id)a3;
- (void)_cancelAdvertising;
- (void)_handleHighlightMessage;
- (void)_handlePerformSysdiagnoseMessage;
- (void)_handleSelectionMessageWithPayload:(id)a3;
- (void)_handleSwitchEventMessageWithPayload:(id)a3 fromPeer:(id)a4;
- (void)_handleTimeoutAsPotentialReceiver;
- (void)_removePeerFromAvailableDevices:(id)a3;
- (void)_sendDataToReceiver:(id)a3;
- (void)_sendDummyPacket;
- (void)_setUpSessionIfNecessary;
- (void)_tearDownAdvertiser;
- (void)_tearDownBrowser;
- (void)_tearDownConnectivity;
- (void)_tearDownSession;
- (void)advertiser:(id)a3 didNotStartAdvertisingPeer:(id)a4;
- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6;
- (void)browser:(id)a3 didNotStartBrowsingForPeers:(id)a4;
- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5;
- (void)browser:(id)a3 lostPeer:(id)a4;
- (void)dealloc;
- (void)forwardSwitchEvent:(id)a3;
- (void)highlightSearchResult:(id)a3;
- (void)performSysdiagnoseOnReceiver;
- (void)search;
- (void)searchResults;
- (void)selectSearchResult:(id)a3 settings:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7;
- (void)session:(id)a3 didReceiveCertificate:(id)a4 fromPeer:(id)a5 certificateHandler:(id)a6;
- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6;
- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6;
- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5;
- (void)setActionReceiver:(id)a3;
- (void)setAdvertiser:(id)a3;
- (void)setAvailableDevices:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setConnectionListener:(id)a3;
- (void)setDeviceTypesByPeerID:(id)a3;
- (void)setDummyPacketTimer:(id)a3;
- (void)setForwarder:(id)a3;
- (void)setNumberOfBurstPacketsRemaining:(unint64_t)a3;
- (void)setReceiver:(id)a3;
- (void)setSearchObserver:(id)a3;
- (void)setSecurityHelper:(id)a3;
- (void)setSession:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSwitchEventIndex:(unint64_t)a3;
- (void)stop;
@end

@implementation AXSSInterDeviceCommunicator

- (AXSSInterDeviceCommunicator)init
{
  v21.receiver = self;
  v21.super_class = (Class)AXSSInterDeviceCommunicator;
  v2 = [(AXSSInterDeviceCommunicator *)&v21 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    availableDevices = v2->_availableDevices;
    v2->_availableDevices = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceTypesByPeerID = v2->_deviceTypesByPeerID;
    v2->_deviceTypesByPeerID = v5;

    v7 = (void *)MGCopyAnswer();
    if ([v7 length])
    {
      v8 = objc_msgSend(v7, "axss_stringByTrimmingToLength:encoding:", 63, 4);
    }
    else
    {
      v8 = 0;
    }
    if (![v8 length])
    {
      v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v10 = [v9 localizedStringForKey:@"UNTITLED_DEVICE" value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];

      v8 = (void *)v10;
    }
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v11 = (void *)getMCPeerIDClass_softClass;
    uint64_t v30 = getMCPeerIDClass_softClass;
    if (!getMCPeerIDClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __getMCPeerIDClass_block_invoke;
      v25 = &unk_1E606CF80;
      v26 = &v27;
      __getMCPeerIDClass_block_invoke((uint64_t)buf);
      v11 = (void *)v28[3];
    }
    v12 = v11;
    _Block_object_dispose(&v27, 8);
    uint64_t v13 = [[v12 alloc] initWithDisplayName:v8];
    localPeerID = v2->_localPeerID;
    v2->_localPeerID = (MCPeerID *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.accessibility.switchcontrol"];
    service = v2->_service;
    v2->_service = (IDSService *)v15;

    [(IDSService *)v2->_service addDelegate:v2 queue:MEMORY[0x1E4F14428]];
    v17 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3B9D000, v17, OS_LOG_TYPE_DEFAULT, "Initialized IDSService.", buf, 2u);
    }

    v18 = objc_alloc_init(AXSSInterDeviceSecurityHelper);
    securityHelper = v2->_securityHelper;
    v2->_securityHelper = v18;
  }
  return v2;
}

- (void)dealloc
{
  [(AXSSInterDeviceCommunicator *)self _tearDownConnectivity];
  [(IDSService *)self->_service removeDelegate:self];
  [(NSTimer *)self->_dummyPacketTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AXSSInterDeviceCommunicator;
  [(AXSSInterDeviceCommunicator *)&v3 dealloc];
}

- (id)_stateDescription
{
  int64_t v3 = [(AXSSInterDeviceCommunicator *)self state];

  return [(AXSSInterDeviceCommunicator *)self _stringForState:v3];
}

- (id)_stringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return off_1E606DCC0[a3];
  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:].cold.8(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(AXSSInterDeviceCommunicator *)self _stringForState:self->_state];
    uint64_t v15 = [(AXSSInterDeviceCommunicator *)self _stringForState:a3];
    int v85 = 138412546;
    v86 = v14;
    __int16 v87 = 2112;
    v88 = v15;
    _os_log_impl(&dword_1B3B9D000, v13, OS_LOG_TYPE_DEFAULT, "IDC State: %@ => %@", (uint8_t *)&v85, 0x16u);
  }
  int64_t state = self->_state;
  if (state == a3) {
    return;
  }
  self->_int64_t state = a3;
  if (a3 != 3 || state != 2)
  {
    if (a3 == 3 && state == 6)
    {
      v38 = AXSSLogForCategory(0);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator setState:](v38, v39, v40, v41, v42, v43, v44, v45);
      }

      goto LABEL_23;
    }
    if (a3 == 3 && state == 4)
    {
      v48 = AXSSLogForCategory(0);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator setState:].cold.4(v48, v49, v50, v51, v52, v53, v54, v55);
      }
    }
    else
    {
      if (a3 != 3 || state != 5)
      {
        if (a3 == 2)
        {
          v63 = [(AXSSInterDeviceCommunicator *)self receiver];

          if (!v63)
          {
            v64 = AXSSLogForCategory(0);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
              -[AXSSInterDeviceCommunicator setState:](v64, v65, v66, v67, v68, v69, v70, v71);
            }
          }
          [(AXSSInterDeviceCommunicator *)self setSwitchEventIndex:0];
          v72 = [(AXSSInterDeviceCommunicator *)self connectionListener];
          v73 = [(AXSSInterDeviceCommunicator *)self receiver];
          v74 = [v73 displayName];
          [v72 didConnectAsForwarderToDeviceWithName:v74];

          v75 = [(AXSSInterDeviceCommunicator *)self dummyPacketTimer];

          if (v75)
          {
            v76 = AXSSLogForCategory(0);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
              -[AXSSInterDeviceCommunicator setState:].cold.6(v76, v77, v78, v79, v80, v81, v82, v83);
            }
          }
          [(AXSSInterDeviceCommunicator *)self setNumberOfBurstPacketsRemaining:10];
          v84 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__sendDummyPacket selector:0 userInfo:1 repeats:0.00545454545];
          [(AXSSInterDeviceCommunicator *)self setDummyPacketTimer:v84];

          v47 = [(AXSSInterDeviceCommunicator *)self dummyPacketTimer];
          [v47 setTolerance:0.000545454545];
          goto LABEL_26;
        }
        if (state == 2) {
          goto LABEL_13;
        }
        if (state != 6) {
          goto LABEL_24;
        }
LABEL_23:
        v46 = [(AXSSInterDeviceCommunicator *)self connectionListener];
        [v46 didDisconnectAsReceiver];

        goto LABEL_24;
      }
      v48 = AXSSLogForCategory(0);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator setState:].cold.5(v48, v56, v57, v58, v59, v60, v61, v62);
      }
    }

    [(AXSSInterDeviceCommunicator *)self setReceiver:0];
    return;
  }
  v17 = AXSSLogForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[AXSSInterDeviceCommunicator setState:](v17, v18, v19, v20, v21, v22, v23, v24);
  }

LABEL_13:
  v25 = [(AXSSInterDeviceCommunicator *)self receiver];

  if (!v25)
  {
    v26 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:](v26, v27, v28, v29, v30, v31, v32, v33);
    }
  }
  v34 = [(AXSSInterDeviceCommunicator *)self connectionListener];
  v35 = [(AXSSInterDeviceCommunicator *)self receiver];
  v36 = [v35 displayName];
  [v34 didDisconnectAsForwarderFromDeviceWithName:v36];

  v37 = [(AXSSInterDeviceCommunicator *)self dummyPacketTimer];
  [v37 invalidate];

  [(AXSSInterDeviceCommunicator *)self setDummyPacketTimer:0];
LABEL_24:
  [(AXSSInterDeviceCommunicator *)self setReceiver:0];
  if (!a3)
  {
    [(AXSSInterDeviceCommunicator *)self _tearDownConnectivity];
    v47 = [(AXSSInterDeviceCommunicator *)self connectionListener];
    [v47 didBecomeIdle];
LABEL_26:
  }
}

- (void)_tearDownAdvertiser
{
  int64_t v3 = [(AXSSInterDeviceCommunicator *)self advertiser];

  if (v3)
  {
    v4 = [(AXSSInterDeviceCommunicator *)self advertiser];
    [v4 stopAdvertisingPeer];

    v5 = [(AXSSInterDeviceCommunicator *)self advertiser];
    [v5 setDelegate:0];

    [(AXSSInterDeviceCommunicator *)self setAdvertiser:0];
  }
}

- (void)_tearDownSession
{
  int64_t v3 = [(AXSSInterDeviceCommunicator *)self session];

  if (v3)
  {
    v4 = [(AXSSInterDeviceCommunicator *)self session];
    [v4 disconnect];

    v5 = [(AXSSInterDeviceCommunicator *)self session];
    [v5 setDelegate:0];

    [(AXSSInterDeviceCommunicator *)self setSession:0];
  }
}

- (void)_tearDownBrowser
{
  int64_t v3 = [(AXSSInterDeviceCommunicator *)self browser];

  if (v3)
  {
    v4 = [(AXSSInterDeviceCommunicator *)self browser];
    [v4 stopBrowsingForPeers];

    v5 = [(AXSSInterDeviceCommunicator *)self browser];
    [v5 setDelegate:0];

    [(AXSSInterDeviceCommunicator *)self setBrowser:0];
  }
}

- (void)_tearDownConnectivity
{
  [(AXSSInterDeviceCommunicator *)self _tearDownBrowser];
  [(AXSSInterDeviceCommunicator *)self _tearDownSession];
  [(AXSSInterDeviceCommunicator *)self _tearDownAdvertiser];
  [(NSMutableArray *)self->_availableDevices removeAllObjects];
  [(NSMutableDictionary *)self->_deviceTypesByPeerID removeAllObjects];
  [(AXSSInterDeviceCommunicator *)self setReceiver:0];

  [(AXSSInterDeviceCommunicator *)self setForwarder:0];
}

- (void)_broadcastICloudMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(IDSService *)self->_service devices];
  uint64_t v6 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v5;
    _os_log_impl(&dword_1B3B9D000, v6, OS_LOG_TYPE_DEFAULT, "Devices: %@", buf, 0xCu);
  }

  if ([v5 count])
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = (void *)IDSCopyIDForDevice();
          if (v13) {
            [v7 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    service = self->_service;
    id v20 = 0;
    id v21 = 0;
    char v15 = [(IDSService *)service sendMessage:v4 toDestinations:v7 priority:300 options:0 identifier:&v21 error:&v20];
    id v16 = v21;
    id v17 = v20;
    uint64_t v18 = AXSSLogForCategory(1);
    uint64_t v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v16;
        _os_log_impl(&dword_1B3B9D000, v19, OS_LOG_TYPE_DEFAULT, "Message sent to other devices with identifier %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[AXSSInterDeviceCommunicator _broadcastICloudMessage:]();
    }
  }
}

- (BOOL)_setUpSessionIfNecessary
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    int64_t v3 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:].cold.8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  session = self->_session;
  if (!session)
  {
    uint64_t v12 = [(AXSSInterDeviceCommunicator *)self securityHelper];
    uint64_t v13 = [v12 securityIdentity];

    if ([(AXSSInterDeviceCommunicator *)self state] != 1 || v13)
    {
      if (v13)
      {
        uint64_t v31 = 0;
        uint64_t v32 = &v31;
        uint64_t v33 = 0x2050000000;
        long long v22 = (void *)getMCSessionClass_softClass;
        uint64_t v34 = getMCSessionClass_softClass;
        if (!getMCSessionClass_softClass)
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __getMCSessionClass_block_invoke;
          v30[3] = &unk_1E606CF80;
          v30[4] = &v31;
          __getMCSessionClass_block_invoke((uint64_t)v30);
          long long v22 = (void *)v32[3];
        }
        long long v23 = v22;
        _Block_object_dispose(&v31, 8);
        id v24 = [v23 alloc];
        long long v25 = [(AXSSInterDeviceCommunicator *)self localPeerID];
        v26 = (MCSession *)[v24 initWithPeer:v25 securityIdentity:v13 encryptionPreference:1];
        uint64_t v27 = self->_session;
        self->_session = v26;

        [(MCSession *)self->_session setAWDLDisabled:1];
        [(MCSession *)self->_session setHeartbeatTimeout:4];
        [(MCSession *)self->_session setDelegate:self];
        goto LABEL_18;
      }
    }
    else
    {
      v14 = AXSSLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(AXSSInterDeviceCommunicator *)v14 _setUpSessionIfNecessary];
      }
    }
    id v28 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator _setUpSessionIfNecessary]();
    }

LABEL_18:
    session = self->_session;
  }
  return session != 0;
}

- (BOOL)isReceivingSwitchEvents
{
  return [(AXSSInterDeviceCommunicator *)self state] == 6;
}

- (BOOL)isForwardingSwitchEvents
{
  return [(AXSSInterDeviceCommunicator *)self state] == 2;
}

- (BOOL)isSearching
{
  return [(AXSSInterDeviceCommunicator *)self state] == 1;
}

- (BOOL)isIdle
{
  return [(AXSSInterDeviceCommunicator *)self state] == 0;
}

- (BOOL)canSearch
{
  if ([(AXSSInterDeviceCommunicator *)self state]) {
    return 0;
  }
  int64_t v3 = [(IDSService *)self->_service devices];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(AXSSInterDeviceSecurityHelper *)self->_securityHelper securityIdentity];

    if (v5) {
      return 1;
    }
    uint64_t v7 = AXSSLogForCategory(1);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Can't search because our security identity isn't ready yet.";
    uint64_t v9 = buf;
    goto LABEL_9;
  }
  uint64_t v7 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = 0;
    uint64_t v8 = "Can't search because no other iCloud devices are available.";
    uint64_t v9 = (uint8_t *)&v10;
LABEL_9:
    _os_log_impl(&dword_1B3B9D000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
  }
LABEL_10:

  return 0;
}

- (void)search
{
}

- (void)_cancelAdvertising
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Timed out while advertising.", v2, v3, v4, v5, v6);
}

- (void)_handleTimeoutAsPotentialReceiver
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Timed out while connected as potential receiver.", v2, v3, v4, v5, v6);
}

- (void)_advertise
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:].cold.8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  [(AXSSInterDeviceCommunicator *)self setState:3];
  if (!self->_advertiser)
  {
    int v11 = MGGetSInt32Answer();
    uint64_t v12 = @"phone";
    if (v11 == 3) {
      uint64_t v12 = @"pad";
    }
    uint64_t v13 = v12;
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v14 = (void *)getMCNearbyServiceAdvertiserClass_softClass;
    uint64_t v30 = getMCNearbyServiceAdvertiserClass_softClass;
    if (!getMCNearbyServiceAdvertiserClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v34 = __getMCNearbyServiceAdvertiserClass_block_invoke;
      v35 = &unk_1E606CF80;
      v36 = &v27;
      __getMCNearbyServiceAdvertiserClass_block_invoke((uint64_t)&buf);
      v14 = (void *)v28[3];
    }
    uint64_t v15 = v14;
    _Block_object_dispose(&v27, 8);
    id v16 = [v15 alloc];
    uint64_t v17 = [(AXSSInterDeviceCommunicator *)self localPeerID];
    v31[0] = @"AXSSIDCVersion";
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 1);
    v31[1] = @"AXSSIDCDeviceType";
    v32[0] = v18;
    v32[1] = v13;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    uint64_t v20 = (MCNearbyServiceAdvertiser *)[v16 initWithPeer:v17 discoveryInfo:v19 serviceType:@"switchcontrol"];
    advertiser = self->_advertiser;
    self->_advertiser = v20;

    long long v22 = [(AXSSInterDeviceCommunicator *)self advertiser];
    [v22 setAWDLDisabled:1];

    long long v23 = [(AXSSInterDeviceCommunicator *)self advertiser];
    [v23 setDelegate:self];

    id v24 = [(AXSSInterDeviceCommunicator *)self advertiser];
    [v24 startAdvertisingPeer];

    long long v25 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [(AXSSInterDeviceCommunicator *)self advertiser];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1B3B9D000, v25, OS_LOG_TYPE_DEFAULT, "Created advertiser: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__cancelAdvertising object:0];
  [(AXSSInterDeviceCommunicator *)self performSelector:sel__cancelAdvertising withObject:0 afterDelay:30.0];
}

- (void)stop
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:].cold.8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  [(AXSSInterDeviceCommunicator *)self setState:0];
}

- (NSArray)searchResults
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:].cold.8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  if ([(AXSSInterDeviceCommunicator *)self state] != 1)
  {
    int v11 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(AXSSInterDeviceCommunicator *)v11 searchResults];
    }
  }
  uint64_t v19 = [(AXSSInterDeviceCommunicator *)self availableDevices];
  uint64_t v20 = (void *)[v19 copy];

  return (NSArray *)v20;
}

- (void)highlightSearchResult:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXSSInterDeviceCommunicator *)self state] != 1)
  {
    uint64_t v5 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(AXSSInterDeviceCommunicator *)v5 searchResults];
    }
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F28F98];
  v26 = @"MessageType";
  v27[0] = @"HighlightAsPotentialSlave";
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  id v24 = 0;
  uint64_t v15 = [v13 dataWithPropertyList:v14 format:200 options:0 error:&v24];
  id v16 = v24;

  if (!v15)
  {
    long long v22 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator highlightSearchResult:]();
    }
    goto LABEL_12;
  }
  uint64_t v17 = [(AXSSInterDeviceCommunicator *)self session];
  uint64_t v18 = [v4 peerID];
  long long v25 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  id v23 = v16;
  char v20 = [v17 sendData:v15 toPeers:v19 withMode:0 error:&v23];
  id v21 = v23;

  if ((v20 & 1) == 0)
  {
    long long v22 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator highlightSearchResult:]();
    }
    id v16 = v21;
LABEL_12:

    id v21 = v16;
  }
}

- (id)_messageForSelection:(BOOL)a3 settings:(id)a4
{
  BOOL v4 = a3;
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v7 = [NSNumber numberWithBool:v4];
  uint64_t v8 = [v6 dictionaryWithObject:v7 forKey:@"IsSelected"];

  if (v5)
  {
    uint64_t v9 = [v5 dictionaryRepresentation];
    [v8 setObject:v9 forKeyedSubscript:@"Settings"];
  }
  v12[0] = @"MessageType";
  v12[1] = @"MessagePayload";
  v13[0] = @"Selection";
  v13[1] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (void)selectSearchResult:(id)a3 settings:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v8 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:].cold.8(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  id v16 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v6 peerID];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v62 = v17;
    __int16 v63 = 2112;
    id v64 = v7;
    _os_log_impl(&dword_1B3B9D000, v16, OS_LOG_TYPE_DEFAULT, "Selecting %@ with %@", buf, 0x16u);
  }
  uint64_t v18 = [v6 peerID];
  [(AXSSInterDeviceCommunicator *)self setReceiver:v18];

  [(AXSSInterDeviceCommunicator *)self setState:2];
  uint64_t v19 = (void *)MEMORY[0x1E4F28F98];
  char v20 = [(AXSSInterDeviceCommunicator *)self _messageForSelection:1 settings:v7];
  id v58 = 0;
  id v21 = [v19 dataWithPropertyList:v20 format:200 options:0 error:&v58];
  id v22 = v58;

  if (v21)
  {
    id v50 = v6;
    id v23 = [(AXSSInterDeviceCommunicator *)self session];
    id v24 = [(AXSSInterDeviceCommunicator *)self receiver];
    uint64_t v60 = v24;
    long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    id v57 = v22;
    char v26 = [v23 sendData:v21 toPeers:v25 withMode:0 error:&v57];
    id v27 = v57;

    if ((v26 & 1) == 0)
    {
      v47 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator selectSearchResult:settings:].cold.4();
      }

      [(AXSSInterDeviceCommunicator *)self stop];
      id v22 = v27;
      goto LABEL_36;
    }
    v48 = v27;
    id v49 = v7;
    id v28 = [MEMORY[0x1E4F1CA48] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v29 = [(AXSSInterDeviceCommunicator *)self availableDevices];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v54 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v35 = [v34 peerID];
          v36 = [(AXSSInterDeviceCommunicator *)self receiver];

          if (v35 != v36)
          {
            uint64_t v37 = [v34 peerID];
            [v28 addObject:v37];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v31);
    }

    if (![v28 count])
    {
      id v44 = v48;
      id v7 = v49;
LABEL_35:

      id v22 = v44;
LABEL_36:
      id v6 = v50;
      goto LABEL_37;
    }
    v38 = (void *)MEMORY[0x1E4F28F98];
    uint64_t v39 = [(AXSSInterDeviceCommunicator *)self _messageForSelection:0 settings:0];
    id v52 = 0;
    uint64_t v40 = [v38 dataWithPropertyList:v39 format:200 options:0 error:&v52];
    id v41 = v52;

    id v7 = v49;
    if (v40)
    {
      uint64_t v42 = [(AXSSInterDeviceCommunicator *)self session];
      id v51 = v41;
      char v43 = [v42 sendData:v40 toPeers:v28 withMode:0 error:&v51];
      id v44 = v51;

      if (v43)
      {
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v45 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator selectSearchResult:settings:]();
      }
      id v41 = v44;
    }
    else
    {
      uint64_t v45 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator selectSearchResult:settings:]();
      }
    }

    id v44 = v41;
    goto LABEL_34;
  }
  v46 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    -[AXSSInterDeviceCommunicator selectSearchResult:settings:]();
  }

LABEL_37:
  [(AXSSInterDeviceCommunicator *)self _tearDownBrowser];
}

- (id)_messageForSwitchEvent:(id)a3 index:(unint64_t)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"MessageType";
  v14[1] = @"MessagePayload";
  v15[0] = @"SwitchEvent";
  v12[0] = @"Index";
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithUnsignedLongLong:a4];
  v12[1] = @"DictionaryRepresentation";
  v13[0] = v7;
  uint64_t v8 = [v6 dictionaryRepresentation];

  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v10;
}

- (void)_sendDataToReceiver:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AXSSInterDeviceCommunicator *)self session];
  id v6 = [(AXSSInterDeviceCommunicator *)self receiver];
  v24[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v18[0] = 0;
  char v8 = [v5 sendData:v4 toPeers:v7 withMode:1 error:v18];
  id v9 = v18[0];

  if ((v8 & 1) == 0)
  {
    uint64_t v10 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator _sendDataToReceiver:]();
    }

    id v11 = [v9 domain];
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v12 = (id *)getMCErrorDomainSymbolLoc_ptr;
    uint64_t v23 = getMCErrorDomainSymbolLoc_ptr;
    if (!getMCErrorDomainSymbolLoc_ptr)
    {
      v18[1] = (id)MEMORY[0x1E4F143A8];
      v18[2] = (id)3221225472;
      v18[3] = __getMCErrorDomainSymbolLoc_block_invoke;
      v18[4] = &unk_1E606CF80;
      uint64_t v19 = &v20;
      uint64_t v13 = (void *)MultipeerConnectivityLibrary();
      uint64_t v14 = dlsym(v13, "MCErrorDomain");
      *(void *)(v19[1] + 24) = v14;
      getMCErrorDomainSymbolLoc_ptr = *(void *)(v19[1] + 24);
      uint64_t v12 = (id *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v12)
    {
      +[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
      __break(1u);
    }
    id v15 = *v12;
    if (v11 == v15)
    {
      BOOL v16 = [v9 code] == 1;

      if (v16)
      {
        uint64_t v17 = AXSSLogForCategory(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[AXSSInterDeviceCommunicator _sendDataToReceiver:]();
        }

        [(AXSSInterDeviceCommunicator *)self setState:0];
      }
    }
    else
    {
    }
  }
}

- (void)forwardSwitchEvent:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:].cold.8(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = [(AXSSInterDeviceCommunicator *)self receiver];

  if (!v13)
  {
    uint64_t v14 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  uint64_t v22 = [(AXSSInterDeviceCommunicator *)self receiver];

  if (v22)
  {
    [(AXSSInterDeviceCommunicator *)self setSwitchEventIndex:[(AXSSInterDeviceCommunicator *)self switchEventIndex] + 1];
    uint64_t v23 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218498;
      unint64_t v31 = [(AXSSInterDeviceCommunicator *)self switchEventIndex];
      __int16 v32 = 2048;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl(&dword_1B3B9D000, v23, OS_LOG_TYPE_INFO, "Forwarding switch event %llu at time %f: %@", buf, 0x20u);
    }

    id v24 = (void *)MEMORY[0x1E4F28F98];
    long long v25 = [(AXSSInterDeviceCommunicator *)self _messageForSwitchEvent:v4 index:[(AXSSInterDeviceCommunicator *)self switchEventIndex]];
    id v29 = 0;
    char v26 = [v24 dataWithPropertyList:v25 format:200 options:0 error:&v29];
    id v27 = v29;

    if (v26)
    {
      [(AXSSInterDeviceCommunicator *)self _sendDataToReceiver:v26];
    }
    else
    {
      id v28 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator forwardSwitchEvent:]();
      }
    }
  }
}

- (void)performSysdiagnoseOnReceiver
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Error sending message to perform sysdiagnose on receiver: %@", v2, v3, v4, v5, v6);
}

- (void)_sendDummyPacket
{
  CFAbsoluteTimeGetCurrent();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1B3B9D000, v0, v1, "Sending burst dummy packet at %f", v2, v3, v4, v5, v6);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v13 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:].cold.8(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  uint64_t v21 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [(AXSSInterDeviceCommunicator *)self _stateDescription];
    int v32 = 138412546;
    uint64_t v33 = (uint64_t)v11;
    __int16 v34 = 2112;
    uint64_t v35 = (uint64_t)v22;
    _os_log_impl(&dword_1B3B9D000, v21, OS_LOG_TYPE_DEFAULT, "Did receive message: %@. State: %@", (uint8_t *)&v32, 0x16u);
  }
  uint64_t v23 = [(AXSSInterDeviceCommunicator *)self connectionListener];
  int v24 = [v23 canAdvertise];

  if (!v24)
  {
    id v28 = AXSSLogForCategory(1);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    LOWORD(v32) = 0;
    id v29 = "Could not advertise because the inter device menu item was not enabled.";
    goto LABEL_15;
  }
  long long v25 = [v10 deviceForFromID:v12];

  if (!v25)
  {
    id v28 = AXSSLogForCategory(1);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    int v32 = 138412290;
    uint64_t v33 = (uint64_t)v12;
    id v29 = "Received message, but it was not from our account. FromID: %@";
    uint64_t v30 = v28;
    uint32_t v31 = 12;
LABEL_20:
    _os_log_impl(&dword_1B3B9D000, v30, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v32, v31);
    goto LABEL_21;
  }
  if ([(AXSSInterDeviceCommunicator *)self state] && [(AXSSInterDeviceCommunicator *)self state] != 3)
  {
    id v28 = AXSSLogForCategory(1);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    LOWORD(v32) = 0;
    id v29 = "Didn't advertise because we were in the middle of some other operation";
LABEL_15:
    uint64_t v30 = v28;
    uint32_t v31 = 2;
    goto LABEL_20;
  }
  char v26 = [v11 objectForKeyedSubscript:@"AXSSIDCVersion"];
  uint64_t v27 = [v26 integerValue];

  if (v27 != 1)
  {
    id v28 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 134218240;
      uint64_t v33 = v27;
      __int16 v34 = 2048;
      uint64_t v35 = 1;
      id v29 = "Compatibility version %ld did not match our compatibility version %ld";
      uint64_t v30 = v28;
      uint32_t v31 = 22;
      goto LABEL_20;
    }
LABEL_21:

    goto LABEL_22;
  }
  [(AXSSInterDeviceCommunicator *)self _advertise];
LABEL_22:
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  uint64_t v5 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B3B9D000, v5, OS_LOG_TYPE_DEFAULT, "Devices changed: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a7;
  id v11 = AXSSLogForCategory(1);
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1B3B9D000, v12, OS_LOG_TYPE_DEFAULT, "Successfully sent message with identifier %@.", (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[AXSSInterDeviceCommunicator service:account:identifier:didSendWithSuccess:error:]();
  }
}

- (void)_handleSwitchEventMessageWithPayload:(id)a3 fromPeer:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [v6 objectForKeyedSubscript:@"Index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 unsignedLongLongValue];
    }
    else
    {
      id v10 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator _handleSwitchEventMessageWithPayload:fromPeer:]();
      }

      uint64_t v9 = 0;
    }
    id v11 = [v6 objectForKeyedSubscript:@"DictionaryRepresentation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [[AXSSInterDeviceSwitchEvent alloc] initWithDictionaryRepresentation:v11];
      int64_t v13 = [(AXSSInterDeviceCommunicator *)self state];
      id v14 = AXSSLogForCategory(1);
      uint64_t v15 = v14;
      if (v13 == 6)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v17 = 134218498;
          uint64_t v18 = v9;
          __int16 v19 = 2048;
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          __int16 v21 = 2112;
          uint64_t v22 = v12;
          _os_log_impl(&dword_1B3B9D000, v15, OS_LOG_TYPE_INFO, "Handling switch event %llu at time %f: %@", (uint8_t *)&v17, 0x20u);
        }

        uint64_t v15 = [(AXSSInterDeviceCommunicator *)self actionReceiver];
        uint64_t v16 = [v7 displayName];
        [v15 didReceiveSwitchEvent:v12 forDeviceWithName:v16];
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[AXSSInterDeviceCommunicator _handleSwitchEventMessageWithPayload:fromPeer:](self, (uint64_t)v12, v15);
      }
    }
    else
    {
      AXSSLogForCategory(1);
      id v12 = (AXSSInterDeviceSwitchEvent *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator _handleSwitchEventMessageWithPayload:fromPeer:]();
      }
    }
  }
  else
  {
    BOOL v8 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator _handleSwitchEventMessageWithPayload:fromPeer:].cold.4();
    }
  }
}

- (void)_handleSelectionMessageWithPayload:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXSSInterDeviceCommunicator *)self state] == 5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 objectForKeyedSubscript:@"IsSelected"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v5 BOOLValue])
        {
          [(AXSSInterDeviceCommunicator *)self setState:6];
          id v6 = [v4 objectForKeyedSubscript:@"Settings"];
          if (v6) {
            id v7 = [[AXSSSwitchControlSettings alloc] initWithDictionaryRepresentation:v6];
          }
          else {
            id v7 = 0;
          }
          uint64_t v9 = AXSSLogForCategory(1);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = 138412290;
            id v12 = v7;
            _os_log_impl(&dword_1B3B9D000, v9, OS_LOG_TYPE_DEFAULT, "Connected as receiver with settings %@", (uint8_t *)&v11, 0xCu);
          }

          id v10 = [(AXSSInterDeviceCommunicator *)self connectionListener];
          [v10 didConnectAsReceiverWithSettings:v7];
        }
        else
        {
          [(AXSSInterDeviceCommunicator *)self setState:0];
        }
      }
      else
      {
        BOOL v8 = AXSSLogForCategory(1);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[AXSSInterDeviceCommunicator _handleSelectionMessageWithPayload:]();
        }
      }
    }
    else
    {
      uint64_t v5 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator _handleSelectionMessageWithPayload:]();
      }
    }
  }
  else
  {
    uint64_t v5 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator _handleSelectionMessageWithPayload:](self);
    }
  }
}

- (void)_handleHighlightMessage
{
  uint64_t v1 = [a1 _stateDescription];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1B3B9D000, v2, v3, "Was asked to highlight as a potential receiver, but our state was %@", v4, v5, v6, v7, v8);
}

- (void)_handlePerformSysdiagnoseMessage
{
  uint64_t v1 = [a1 _stateDescription];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1B3B9D000, v2, v3, "Was asked to perform a sysdiagnose, but our state was %@", v4, v5, v6, v7, v8);
}

- (void)_removePeerFromAvailableDevices:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = AXSSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AXSSInterDeviceCommunicator setState:].cold.8(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = [(AXSSInterDeviceCommunicator *)self availableDevices];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__AXSSInterDeviceCommunicator__removePeerFromAvailableDevices___block_invoke;
  v19[3] = &unk_1E606DBE8;
  id v14 = v4;
  id v20 = v14;
  uint64_t v15 = [v13 indexOfObjectPassingTest:v19];

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v14;
      _os_log_impl(&dword_1B3B9D000, v16, OS_LOG_TYPE_DEFAULT, "Removed from available results: %@", buf, 0xCu);
    }

    int v17 = [(AXSSInterDeviceCommunicator *)self availableDevices];
    [v17 removeObjectAtIndex:v15];

    uint64_t v18 = [(AXSSInterDeviceCommunicator *)self searchObserver];
    [v18 didUpdateSearchResults];
  }
}

BOOL __63__AXSSInterDeviceCommunicator__removePeerFromAvailableDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 peerID];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a5;
  id v24 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:a4 options:0 format:0 error:&v24];
  id v9 = v24;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = v8;
    uint64_t v11 = [v10 objectForKeyedSubscript:@"MessageType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      uint64_t v13 = [v10 objectForKeyedSubscript:@"MessagePayload"];
      if ([v12 isEqualToString:@"DummyPacket"])
      {
        id v14 = AXSSLogForCategory(1);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[AXSSInterDeviceCommunicator session:didReceiveData:fromPeer:]();
        }
      }
      else
      {
        int v16 = [v12 isEqualToString:@"BurstDummyPacket"];
        int v17 = AXSSLogForCategory(1);
        id v14 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[AXSSInterDeviceCommunicator session:didReceiveData:fromPeer:]();
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          char v26 = v10;
          __int16 v27 = 2112;
          id v28 = v7;
          _os_log_impl(&dword_1B3B9D000, v14, OS_LOG_TYPE_INFO, "Received message %@ from peer %@", buf, 0x16u);
        }
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__AXSSInterDeviceCommunicator_session_didReceiveData_fromPeer___block_invoke;
      block[3] = &unk_1E606DC10;
      id v20 = v12;
      __int16 v21 = self;
      id v22 = v13;
      uint64_t v23 = v7;
      id v18 = v13;
      uint64_t v15 = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      uint64_t v15 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[AXSSInterDeviceCommunicator session:didReceiveData:fromPeer:]((uint64_t)v11, (uint64_t)v7, v15);
      }
    }
  }
  else
  {
    uint64_t v10 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      char v26 = v7;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_error_impl(&dword_1B3B9D000, v10, OS_LOG_TYPE_ERROR, "Unexpected format for data from peer %@. Unarchived: %@. Error: %@", buf, 0x20u);
    }
  }
}

void __63__AXSSInterDeviceCommunicator_session_didReceiveData_fromPeer___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) isEqualToString:@"SwitchEvent"])
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    [v3 _handleSwitchEventMessageWithPayload:v4 fromPeer:v5];
  }
  else if ([*v2 isEqualToString:@"Selection"])
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    [v6 _handleSelectionMessageWithPayload:v7];
  }
  else if ([*v2 isEqualToString:@"HighlightAsPotentialSlave"])
  {
    uint64_t v8 = *(void **)(a1 + 40);
    [v8 _handleHighlightMessage];
  }
  else if ([*v2 isEqualToString:@"PerformSysdiagnose"])
  {
    id v9 = *(void **)(a1 + 40);
    [v9 _handlePerformSysdiagnoseMessage];
  }
  else if (([*v2 isEqualToString:@"DummyPacket"] & 1) == 0 {
         && ([*v2 isEqualToString:@"BurstDummyPacket"] & 1) == 0)
  }
  {
    uint64_t v10 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __63__AXSSInterDeviceCommunicator_session_didReceiveData_fromPeer___block_invoke_cold_1((uint64_t)v2, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6
{
  uint64_t v6 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AXSSInterDeviceCommunicator session:didStartReceivingResourceWithName:fromPeer:withProgress:]();
  }
}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7
{
  uint64_t v7 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[AXSSInterDeviceCommunicator session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:]();
  }
}

- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6
{
  uint64_t v6 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AXSSInterDeviceCommunicator session:didReceiveStream:withName:fromPeer:]();
  }
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5
{
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AXSSInterDeviceCommunicator_session_peer_didChangeState___block_invoke;
  block[3] = &unk_1E606DC38;
  uint64_t v11 = self;
  int64_t v12 = a5;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__AXSSInterDeviceCommunicator_session_peer_didChangeState___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    uint64_t v5 = [*(id *)(a1 + 40) _stateDescription];
    int v56 = 138412802;
    uint64_t v57 = v3;
    __int16 v58 = 2112;
    uint64_t v59 = v4;
    __int16 v60 = 2112;
    uint64_t v61 = v5;
    _os_log_impl(&dword_1B3B9D000, v2, OS_LOG_TYPE_DEFAULT, "Peer %@ did change state to %@ while our state was %@", (uint8_t *)&v56, 0x20u);
  }
  switch([*(id *)(a1 + 40) state])
  {
    case 1:
      int v17 = *(void **)(a1 + 40);
      if (*(void *)(a1 + 48) == 2)
      {
        id v18 = [v17 deviceTypesByPeerID];
        __int16 v19 = [v18 objectForKeyedSubscript:*(void *)(a1 + 32)];

        if (![v19 length])
        {
          id v20 = AXSSLogForCategory(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            __59__AXSSInterDeviceCommunicator_session_peer_didChangeState___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
          }
        }
        if ([v19 length])
        {
          id v28 = AXSSLogForCategory(1);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = *(void *)(a1 + 32);
            int v56 = 138412290;
            uint64_t v57 = v29;
            _os_log_impl(&dword_1B3B9D000, v28, OS_LOG_TYPE_DEFAULT, "Added to available results: %@", (uint8_t *)&v56, 0xCu);
          }

          id v30 = [*(id *)(a1 + 40) availableDevices];
          uint64_t v31 = +[AXSSInterDeviceSearchResult searchResultWithPeerID:*(void *)(a1 + 32) deviceType:v19];
          [v30 addObject:v31];

          int v32 = [*(id *)(a1 + 40) searchObserver];
          [v32 didUpdateSearchResults];
        }
      }
      else
      {
        [v17 _removePeerFromAvailableDevices:*(void *)(a1 + 32)];
      }
      return;
    case 2:
      uint64_t v33 = [*(id *)(a1 + 40) receiver];

      if (!v33)
      {
        __int16 v34 = AXSSLogForCategory(0);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[AXSSInterDeviceCommunicator setState:](v34, v35, v36, v37, v38, v39, v40, v41);
        }
      }
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = [*(id *)(a1 + 40) receiver];
      goto LABEL_24;
    case 4:
      id v44 = [*(id *)(a1 + 40) forwarder];

      if (!v44)
      {
        uint64_t v45 = AXSSLogForCategory(0);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          [(AXSSInterDeviceCommunicator *)v45 _handleHighlightMessage];
        }
      }
      long long v53 = *(void **)(a1 + 32);
      long long v54 = [*(id *)(a1 + 40) forwarder];
      LODWORD(v53) = [v53 isEqual:v54];

      if (!v53) {
        return;
      }
      uint64_t v55 = *(void *)(a1 + 48);
      if (v55)
      {
        if (v55 == 2)
        {
          [*(id *)(a1 + 40) setState:5];
          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 40) selector:sel__handleTimeoutAsPotentialReceiver object:0];
          [*(id *)(a1 + 40) performSelector:sel__handleTimeoutAsPotentialReceiver withObject:0 afterDelay:120.0];
        }
      }
      else
      {
LABEL_26:
        [*(id *)(a1 + 40) setState:0];
      }
      return;
    case 5:
    case 6:
      uint64_t v6 = [*(id *)(a1 + 40) forwarder];

      if (!v6)
      {
        id v7 = AXSSLogForCategory(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(AXSSInterDeviceCommunicator *)v7 _handleHighlightMessage];
        }
      }
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = [*(id *)(a1 + 40) forwarder];
LABEL_24:
      uint64_t v42 = (void *)v16;
      int v43 = [v15 isEqual:v16];

      if (v43 && *(void *)(a1 + 48) != 2) {
        goto LABEL_26;
      }
      return;
    default:
      return;
  }
}

- (void)session:(id)a3 didReceiveCertificate:(id)a4 fromPeer:(id)a5 certificateHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [(AXSSInterDeviceCommunicator *)self securityHelper];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__AXSSInterDeviceCommunicator_session_didReceiveCertificate_fromPeer_certificateHandler___block_invoke;
  void v15[3] = &unk_1E606DC60;
  id v16 = v9;
  id v17 = v10;
  id v13 = v10;
  id v14 = v9;
  [v12 verifyCertificate:v11 completion:v15];
}

uint64_t __89__AXSSInterDeviceCommunicator_session_didReceiveCertificate_fromPeer_certificateHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_1B3B9D000, v4, OS_LOG_TYPE_DEFAULT, "Should trust peer %@: %i", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_1B3B9D000, v9, OS_LOG_TYPE_DEFAULT, "Found peer %@ with info %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AXSSInterDeviceCommunicator_browser_foundPeer_withDiscoveryInfo___block_invoke;
  block[3] = &unk_1E606C898;
  id v13 = v8;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__AXSSInterDeviceCommunicator_browser_foundPeer_withDiscoveryInfo___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"AXSSIDCVersion"];
  if (!v2
    || (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) objectForKeyedSubscript:@"AXSSIDCDeviceType"],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v3,
        !v5))
  {
    uint64_t v12 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __67__AXSSInterDeviceCommunicator_browser_foundPeer_withDiscoveryInfo___block_invoke_cold_1();
    }
    goto LABEL_10;
  }
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"AXSSIDCVersion"];
  uint64_t v7 = [v6 integerValue];

  if (v7 != 1)
  {
    uint64_t v12 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = 1;
      _os_log_impl(&dword_1B3B9D000, v12, OS_LOG_TYPE_DEFAULT, "Compatibility version %ld did not match our version %ld", buf, 0x16u);
    }
LABEL_10:

    return;
  }
  if ([*(id *)(a1 + 40) _setUpSessionIfNecessary])
  {
    id v8 = [*(id *)(a1 + 40) browser];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [*(id *)(a1 + 40) session];
    [v8 invitePeer:v9 toSession:v10 withContext:0 timeout:30.0];

    id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"AXSSIDCDeviceType"];
    id v11 = [*(id *)(a1 + 40) deviceTypesByPeerID];
    [v11 setObject:v13 forKeyedSubscript:*(void *)(a1 + 48)];
  }
}

- (void)browser:(id)a3 lostPeer:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1B3B9D000, v6, OS_LOG_TYPE_DEFAULT, "Lost peer %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__AXSSInterDeviceCommunicator_browser_lostPeer___block_invoke;
  v8[3] = &unk_1E606C9A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __48__AXSSInterDeviceCommunicator_browser_lostPeer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2 != 1)
  {
    if (([v3 state] == 6
       || [*(id *)(a1 + 32) state] == 5
       || [*(id *)(a1 + 32) state] == 4)
      && ([*(id *)(a1 + 32) forwarder],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isEqual:*(void *)(a1 + 40)],
          v5,
          v6))
    {
      id v7 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        id v8 = "Lost peer was forwarder, so stopping now";
        id v9 = (uint8_t *)&v13;
LABEL_15:
        _os_log_impl(&dword_1B3B9D000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else
    {
      if ([*(id *)(a1 + 32) state] != 2) {
        return;
      }
      id v10 = [*(id *)(a1 + 32) receiver];
      int v11 = [v10 isEqual:*(void *)(a1 + 40)];

      if (!v11) {
        return;
      }
      id v7 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        id v8 = "Lost peer was receiver, so stopping now";
        id v9 = (uint8_t *)&v12;
        goto LABEL_15;
      }
    }

    [*(id *)(a1 + 32) setState:0];
    return;
  }
  uint64_t v4 = *(void *)(a1 + 40);

  [v3 _removePeerFromAvailableDevices:v4];
}

- (void)browser:(id)a3 didNotStartBrowsingForPeers:(id)a4
{
  id v5 = a4;
  int v6 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AXSSInterDeviceCommunicator browser:didNotStartBrowsingForPeers:]();
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AXSSInterDeviceCommunicator_browser_didNotStartBrowsingForPeers___block_invoke;
  block[3] = &unk_1E606C8C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__AXSSInterDeviceCommunicator_browser_didNotStartBrowsingForPeers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:0];
}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_1B3B9D000, v12, OS_LOG_TYPE_DEFAULT, "Received invitation from %@ with context %@.", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__AXSSInterDeviceCommunicator_advertiser_didReceiveInvitationFromPeer_withContext_invitationHandler___block_invoke;
  block[3] = &unk_1E606DC88;
  void block[4] = self;
  id v16 = v9;
  id v17 = v11;
  id v13 = v11;
  id v14 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __101__AXSSInterDeviceCommunicator_advertiser_didReceiveInvitationFromPeer_withContext_invitationHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 3)
  {
    if ([*(id *)(a1 + 32) _setUpSessionIfNecessary])
    {
      [*(id *)(a1 + 32) setForwarder:*(void *)(a1 + 40)];
      uint64_t v2 = *(void *)(a1 + 48);
      uint64_t v3 = [*(id *)(a1 + 32) session];
      (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, 1, v3);

      uint64_t v4 = *(void **)(a1 + 32);
      [v4 setState:4];
    }
  }
  else
  {
    id v5 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) _stateDescription];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1B3B9D000, v5, OS_LOG_TYPE_DEFAULT, "State was %@, so ignoring invitation from peer.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)advertiser:(id)a3 didNotStartAdvertisingPeer:(id)a4
{
  id v5 = a4;
  int v6 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AXSSInterDeviceCommunicator advertiser:didNotStartAdvertisingPeer:]();
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AXSSInterDeviceCommunicator_advertiser_didNotStartAdvertisingPeer___block_invoke;
  block[3] = &unk_1E606C8C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__AXSSInterDeviceCommunicator_advertiser_didNotStartAdvertisingPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:0];
}

- (AXSSInterDeviceConnectionListener)connectionListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionListener);

  return (AXSSInterDeviceConnectionListener *)WeakRetained;
}

- (void)setConnectionListener:(id)a3
{
}

- (AXSSInterDeviceActionReceiver)actionReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionReceiver);

  return (AXSSInterDeviceActionReceiver *)WeakRetained;
}

- (void)setActionReceiver:(id)a3
{
}

- (AXSSInterDeviceSearchObserver)searchObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchObserver);

  return (AXSSInterDeviceSearchObserver *)WeakRetained;
}

- (void)setSearchObserver:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (int64_t)state
{
  return self->_state;
}

- (MCPeerID)localPeerID
{
  return self->_localPeerID;
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (MCNearbyServiceBrowser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (MCNearbyServiceAdvertiser)advertiser
{
  return self->_advertiser;
}

- (void)setAdvertiser:(id)a3
{
}

- (NSMutableArray)availableDevices
{
  return self->_availableDevices;
}

- (void)setAvailableDevices:(id)a3
{
}

- (NSMutableDictionary)deviceTypesByPeerID
{
  return self->_deviceTypesByPeerID;
}

- (void)setDeviceTypesByPeerID:(id)a3
{
}

- (MCPeerID)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
}

- (MCPeerID)forwarder
{
  return self->_forwarder;
}

- (void)setForwarder:(id)a3
{
}

- (unint64_t)switchEventIndex
{
  return self->_switchEventIndex;
}

- (void)setSwitchEventIndex:(unint64_t)a3
{
  self->_switchEventIndex = a3;
}

- (NSTimer)dummyPacketTimer
{
  return self->_dummyPacketTimer;
}

- (void)setDummyPacketTimer:(id)a3
{
}

- (unint64_t)numberOfBurstPacketsRemaining
{
  return self->_numberOfBurstPacketsRemaining;
}

- (void)setNumberOfBurstPacketsRemaining:(unint64_t)a3
{
  self->_numberOfBurstPacketsRemaining = a3;
}

- (AXSSInterDeviceSecurityHelper)securityHelper
{
  return self->_securityHelper;
}

- (void)setSecurityHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityHelper, 0);
  objc_storeStrong((id *)&self->_dummyPacketTimer, 0);
  objc_storeStrong((id *)&self->_forwarder, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_deviceTypesByPeerID, 0);
  objc_storeStrong((id *)&self->_availableDevices, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_localPeerID, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_searchObserver);
  objc_destroyWeak((id *)&self->_actionReceiver);

  objc_destroyWeak((id *)&self->_connectionListener);
}

- (void)setState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setState:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setState:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setState:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setState:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setState:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setState:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_broadcastICloudMessage:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1B3B9D000, v0, v1, "Error sending message %@: %@");
}

- (void)_setUpSessionIfNecessary
{
}

- (void)searchResults
{
}

- (void)highlightSearchResult:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Error serializing message to highlight receiver: %@", v2, v3, v4, v5, v6);
}

- (void)highlightSearchResult:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Error highlighting search result: %@", v2, v3, v4, v5, v6);
}

- (void)selectSearchResult:settings:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Error serializing message to select search result: %@", v2, v3, v4, v5, v6);
}

- (void)selectSearchResult:settings:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Error serializing message to deselect search results: %@", v2, v3, v4, v5, v6);
}

- (void)selectSearchResult:settings:.cold.3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Error rejecting devices: %@", v2, v3, v4, v5, v6);
}

- (void)selectSearchResult:settings:.cold.4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Error accepting device: %@", v2, v3, v4, v5, v6);
}

- (void)_sendDataToReceiver:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Disconnected from receiver without being notified", v2, v3, v4, v5, v6);
}

- (void)_sendDataToReceiver:.cold.3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Unable to send data to receiver: %@", v2, v3, v4, v5, v6);
}

- (void)forwardSwitchEvent:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Error serializing message to forward switch event: %@", v2, v3, v4, v5, v6);
}

- (void)service:account:identifier:didSendWithSuccess:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1B3B9D000, v0, v1, "Failed to send message with identifier %@. Error: %@");
}

- (void)_handleSwitchEventMessageWithPayload:(NSObject *)a3 fromPeer:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 _stateDescription];
  OUTLINED_FUNCTION_9();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1B3B9D000, a3, OS_LOG_TYPE_ERROR, "Received switch event while we were not connected as a receiver. State: %@, event: %@", v6, 0x16u);
}

- (void)_handleSwitchEventMessageWithPayload:fromPeer:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Unexpected type for switch event dictionary representation: %@", v2, v3, v4, v5, v6);
}

- (void)_handleSwitchEventMessageWithPayload:fromPeer:.cold.3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Unexpected type for switch event index: %@", v2, v3, v4, v5, v6);
}

- (void)_handleSwitchEventMessageWithPayload:fromPeer:.cold.4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Unexpected type for switch event payload: %@", v2, v3, v4, v5, v6);
}

- (void)_handleSelectionMessageWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Unexpected type for selection flag: %@", v2, v3, v4, v5, v6);
}

- (void)_handleSelectionMessageWithPayload:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Unexpected format for selection message to potential receiver", v2, v3, v4, v5, v6);
}

- (void)_handleSelectionMessageWithPayload:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 _stateDescription];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1B3B9D000, v2, v3, "Received selection message while in unexpected state: %@", v4, v5, v6, v7, v8);
}

- (void)session:didReceiveData:fromPeer:.cold.1()
{
  CFAbsoluteTimeGetCurrent();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1B3B9D000, v0, v1, "Received dummy packet at %f", v2, v3, v4, v5, v6);
}

- (void)session:didReceiveData:fromPeer:.cold.2()
{
  CFAbsoluteTimeGetCurrent();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1B3B9D000, v0, v1, "Received burst dummy packet at %f", v2, v3, v4, v5, v6);
}

- (void)session:(uint64_t)a1 didReceiveData:(uint64_t)a2 fromPeer:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  uint64_t v10 = a1;
  __int16 v11 = v6;
  uint64_t v12 = a2;
  id v8 = v7;
  _os_log_error_impl(&dword_1B3B9D000, a3, OS_LOG_TYPE_ERROR, "Unexpected class: %@ for message type: %@ from peer: %@", v9, 0x20u);
}

void __63__AXSSInterDeviceCommunicator_session_didReceiveData_fromPeer___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)session:didStartReceivingResourceWithName:fromPeer:withProgress:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Unexpected delegate callback: didStartReceivingResourceWithName", v2, v3, v4, v5, v6);
}

- (void)session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Unexpected delegate callback: didFinishReceivingResourceWithName", v2, v3, v4, v5, v6);
}

- (void)session:didReceiveStream:withName:fromPeer:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Unexpected delegate callback: didReceiveStream", v2, v3, v4, v5, v6);
}

void __59__AXSSInterDeviceCommunicator_session_peer_didChangeState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__AXSSInterDeviceCommunicator_browser_foundPeer_withDiscoveryInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B3B9D000, v0, v1, "Peer did not advertise compatibility version or device type", v2, v3, v4, v5, v6);
}

- (void)browser:didNotStartBrowsingForPeers:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Error browsing: %@", v2, v3, v4, v5, v6);
}

- (void)advertiser:didNotStartAdvertisingPeer:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "Did not start advertising: %@", v2, v3, v4, v5, v6);
}

@end