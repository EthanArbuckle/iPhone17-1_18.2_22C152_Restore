@interface CBClassicManager
- (BOOL)connectable;
- (BOOL)discoverable;
- (BOOL)inquiryState;
- (BOOL)isInquiryRunning;
- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3;
- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3;
- (BOOL)secureBluetooth:(BOOL)a3 withAuthData:(id)a4;
- (BOOL)setBTPowerState:(BOOL)a3;
- (BOOL)testMode;
- (CBClassicManager)initWithQueue:(id)a3 options:(id)a4;
- (NSMapTable)peers;
- (id)classicPeerDiscovered;
- (id)classicPeerWithInfo:(id)a3;
- (id)connectCallback;
- (id)connectionStatusHandler;
- (id)disconnectCallback;
- (id)getLocalSDPDatabase;
- (id)inquiryServiceAddedHandler;
- (id)pairingStatusHandler;
- (id)peerWithIdentifier:(id)a3;
- (id)peerWithInfo:(id)a3;
- (id)retrievePairedPeersWithOptions:(id)a3;
- (id)retrievePeerWithAddress:(id)a3;
- (id)sdpRecordAddedHandler;
- (id)serviceAddedHandler;
- (int64_t)powerState;
- (unsigned)addServiceWithData:(id)a3;
- (void)addService:(id)a3;
- (void)addService:(id)a3 sdpRecord:(id)a4 sdpRecordAddedHandler:(id)a5;
- (void)addServiceToInquiryList:(id)a3;
- (void)alertUserNotificationIsReady:(id)a3;
- (void)cancelPeerConnection:(id)a3;
- (void)cancelPeerConnection:(id)a3 force:(BOOL)a4;
- (void)cancelPeerConnection:(id)a3 options:(id)a4;
- (void)connectPeer:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)forEachClassicPeer:(id)a3;
- (void)handleLocalDeviceStateUpdatedMsg:(id)a3;
- (void)handleMsg:(unsigned __int16)a3 args:(id)a4;
- (void)handlePeerConnectionCompleted:(id)a3;
- (void)handlePeerConnectionStateUpdated:(id)a3;
- (void)handlePeerDisconnectionCompleted:(id)a3;
- (void)handlePeerDiscovered:(id)a3;
- (void)handleSDPRecordAdded:(id)a3;
- (void)handleServiceAddedToInquiryList:(id)a3;
- (void)handleServiceAddedToSDP:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)orphanClassicPeers;
- (void)removeAllServices;
- (void)removeAllServicesFromInquiryList;
- (void)removeService:(id)a3;
- (void)removeServiceFromInquiryList:(id)a3;
- (void)removeServiceHandle:(unsigned int)a3;
- (void)setBTConnectable:(BOOL)a3;
- (void)setBTDiscoverable:(BOOL)a3;
- (void)setClassicPeerDiscovered:(id)a3;
- (void)setConnectCallback:(id)a3;
- (void)setConnectionStatusHandler:(id)a3;
- (void)setDisconnectCallback:(id)a3;
- (void)setInquiryServiceAddedHandler:(id)a3;
- (void)setPairingStatusHandler:(id)a3;
- (void)setSdpRecordAddedHandler:(id)a3;
- (void)setServiceAddedHandler:(id)a3;
- (void)setTestMode:(BOOL)a3;
- (void)startInquiryWithOptions:(id)a3 classicPeerDiscovered:(id)a4;
- (void)stopInquiry;
@end

@implementation CBClassicManager

- (CBClassicManager)initWithQueue:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CBClassicManager;
  v8 = [(CBManager *)&v13 initInternal];
  if (v8)
  {
    [(CBClassicManager *)v8 addObserver:v8 forKeyPath:@"state" options:0 context:objc_opt_class()];
    [(CBClassicManager *)v8 addObserver:v8 forKeyPath:@"powerState" options:0 context:objc_opt_class()];
    [(CBClassicManager *)v8 addObserver:v8 forKeyPath:@"localName" options:0 context:objc_opt_class()];
    [(CBClassicManager *)v8 addObserver:v8 forKeyPath:@"inquiryState" options:0 context:objc_opt_class()];
    [(CBClassicManager *)v8 addObserver:v8 forKeyPath:@"discoverable" options:0 context:objc_opt_class()];
    [(CBClassicManager *)v8 addObserver:v8 forKeyPath:@"connectable" options:0 context:objc_opt_class()];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    peers = v8->_peers;
    v8->_peers = (NSMapTable *)v9;

    v8->_testMode = 0;
    v8->_connectable = 0;
    v8->_discoverable = 0;
    v8->_powerState = 1;
    v11 = [v7 valueForKey:@"kCBManagerIsIOBluetoothShim"];
    -[CBManager setTccApproved:](v8, "setTccApproved:", [v11 BOOLValue]);

    [(CBManager *)v8 startWithQueue:v6 options:v7 sessionType:3];
  }

  return v8;
}

- (void)dealloc
{
  [(CBClassicManager *)self orphanClassicPeers];
  [(CBClassicManager *)self removeObserver:self forKeyPath:@"state" context:objc_opt_class()];
  [(CBClassicManager *)self removeObserver:self forKeyPath:@"powerState" context:objc_opt_class()];
  [(CBClassicManager *)self removeObserver:self forKeyPath:@"localName" context:objc_opt_class()];
  [(CBClassicManager *)self removeObserver:self forKeyPath:@"inquiryState" context:objc_opt_class()];
  [(CBClassicManager *)self removeObserver:self forKeyPath:@"discoverable" context:objc_opt_class()];
  [(CBClassicManager *)self removeObserver:self forKeyPath:@"connectable" context:objc_opt_class()];
  v3.receiver = self;
  v3.super_class = (Class)CBClassicManager;
  [(CBManager *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  if (objc_opt_class() == a6)
  {
    int v13 = [v12 isEqualToString:@"state"];

    if (v13)
    {
      if ([(CBManager *)self state] != CBManagerStatePoweredOn && [(CBManager *)self state] != 10)
      {
        [(CBClassicManager *)self forEachClassicPeer:&__block_literal_global_3];
        if ([(CBManager *)self state] == CBManagerStateResetting) {
          [(CBClassicManager *)self orphanClassicPeers];
        }
      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CBClassicManager;
    [(CBClassicManager *)&v14 observeValueForKeyPath:v12 ofObject:v10 change:v11 context:a6];
  }
}

uint64_t __67__CBClassicManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handleDisconnection];
}

- (id)peerWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(CBManager *)self tccApproved])
  {
    v5 = self->_peers;
    objc_sync_enter(v5);
    id v6 = [(NSMapTable *)self->_peers objectForKey:v4];
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)classicPeerWithInfo:(id)a3
{
  id v4 = a3;
  if ([(CBManager *)self tccApproved])
  {
    v5 = self->_peers;
    objc_sync_enter(v5);
    peers = self->_peers;
    id v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
    v8 = [(NSMapTable *)peers objectForKey:v7];

    if (!v8)
    {
      v8 = [[CBClassicPeer alloc] initWithInfo:v4 manager:self];
      uint64_t v9 = [(CBManager *)self sendSyncMsg:41 args:v4];
      [(CBClassicPeer *)v8 handleMsg:41 args:v9];
      id v10 = self->_peers;
      id v11 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
      [(NSMapTable *)v10 setObject:v8 forKey:v11];
    }
    objc_sync_exit(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)peerWithInfo:(id)a3
{
  id v4 = a3;
  if ([(CBManager *)self tccApproved])
  {
    uint64_t v5 = [(CBClassicManager *)self classicPeerWithInfo:v4];

    id v6 = (void *)v5;
  }
  else
  {

    id v6 = 0;
  }
  return v6;
}

- (void)forEachClassicPeer:(id)a3
{
  v8 = (void (**)(id, uint64_t))a3;
  if ([(CBManager *)self tccApproved])
  {
    id v4 = self->_peers;
    objc_sync_enter(v4);
    uint64_t v5 = [(NSMapTable *)self->_peers objectEnumerator];
    for (i = 0; ; i = (void *)v7)
    {
      uint64_t v7 = [v5 nextObject];

      if (!v7) {
        break;
      }
      v8[2](v8, v7);
    }

    objc_sync_exit(v4);
  }
}

- (void)orphanClassicPeers
{
  if ([(CBManager *)self tccApproved])
  {
    [(CBClassicManager *)self forEachClassicPeer:&__block_literal_global_60];
    obj = self->_peers;
    objc_sync_enter(obj);
    [(NSMapTable *)self->_peers removeAllObjects];
    objc_sync_exit(obj);
  }
}

void __38__CBClassicManager_orphanClassicPeers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    __38__CBClassicManager_orphanClassicPeers__block_invoke_cold_1();
  }
  [v2 handleDisconnection];
  [v2 setOrphan];
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return a3 == 27 || a3 == 52;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  if (a3 <= 0x3Cu && ((1 << a3) & 0x1000000000000300) != 0) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)CBClassicManager;
  return -[CBManager isMsgAllowedAlways:](&v6, sel_isMsgAllowedAlways_);
}

- (void)setBTConnectable:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_connectable != a3)
  {
    objc_super v6 = @"kCBMsgArgConnectableState";
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:");
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(CBManager *)self sendMsg:28 args:v5];
  }
}

- (void)setBTDiscoverable:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_discoverable != a3)
  {
    objc_super v6 = @"kCBMsgArgDiscoverableState";
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:");
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(CBManager *)self sendMsg:29 args:v5];
  }
}

- (BOOL)setBTPowerState:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  int64_t powerState = self->_powerState;
  if (!a3)
  {
    if (powerState != 2) {
      return 0;
    }
LABEL_6:
    uint64_t v9 = @"kCBMsgArgBTPowerState";
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:");
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    BOOL v5 = [(CBManager *)self sendMsg:27 args:v8];

    return v5;
  }
  if (powerState != 2) {
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)secureBluetooth:(BOOL)a3 withAuthData:(id)a4
{
  BOOL v4 = a3;
  v14[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CBClassicManager.m", 203, @"Invalid parameter not satisfying: %@", @"authData != nil" object file lineNumber description];
  }
  v13[0] = @"kCBMsgArgSecureBluetoothMode";
  uint64_t v8 = [NSNumber numberWithBool:v4];
  v13[1] = @"kCBMsgArgSecureBluetoothData";
  v14[0] = v8;
  v14[1] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  BOOL v10 = [(CBManager *)self sendMsg:60 args:v9];

  return v10;
}

- (void)handleLocalDeviceStateUpdatedMsg:(id)a3
{
  id v4 = a3;
  id v14 = [v4 objectForKeyedSubscript:@"kCBMsgArgInquiryState"];
  BOOL v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectableState"];
  objc_super v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgDiscoverableState"];
  id v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgBTPowerState"];

  if (v14)
  {
    [(CBClassicManager *)self willChangeValueForKey:@"inquiryState"];
    self->_inquiryState = [v14 BOOLValue];
    [(CBClassicManager *)self didChangeValueForKey:@"inquiryState"];
  }
  if (v5)
  {
    int v8 = [v5 BOOLValue];
    if (self->_connectable != v8)
    {
      BOOL v9 = v8;
      [(CBClassicManager *)self willChangeValueForKey:@"connectable"];
      self->_connectable = v9;
      [(CBClassicManager *)self didChangeValueForKey:@"connectable"];
    }
  }
  if (v6)
  {
    int v10 = [v6 BOOLValue];
    if (self->_discoverable != v10)
    {
      BOOL v11 = v10;
      [(CBClassicManager *)self willChangeValueForKey:@"discoverable"];
      self->_discoverable = v11;
      [(CBClassicManager *)self didChangeValueForKey:@"discoverable"];
    }
  }
  if (v7)
  {
    int v12 = [v7 intValue];
    [(CBClassicManager *)self willChangeValueForKey:@"powerState"];
    int64_t v13 = v12 == 2;
    if (v12 == 1) {
      int64_t v13 = 2;
    }
    self->_int64_t powerState = v13;
    [(CBClassicManager *)self didChangeValueForKey:@"powerState"];
  }
}

- (void)startInquiryWithOptions:(id)a3 classicPeerDiscovered:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  int v8 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager startInquiryWithOptions:classicPeerDiscovered:](v8, self, (uint64_t)v6);
  }
  [(CBClassicManager *)self setClassicPeerDiscovered:v7];
  if ([(CBManager *)self state] == CBManagerStatePoweredOn)
  {
    BOOL v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kCBMsgArgInquiryState"];
    if (![v6 count])
    {
LABEL_21:
      if ([(CBManager *)self sendMsg:30 args:v9]) {
        self->_isInquiryRunning = 1;
      }

      goto LABEL_24;
    }
    int v10 = [v6 objectForKeyedSubscript:@"kCBInquiryLength"];
    if (v10) {
      [v9 setObject:v10 forKeyedSubscript:@"kCBMsgArgInquiryLength"];
    }
    BOOL v11 = [v6 objectForKeyedSubscript:@"kCBInquiryInfinite"];
    if (v11) {
      [v9 setObject:v11 forKeyedSubscript:@"kCBMsgArgInquiryInfinite"];
    }
    int v12 = [v6 objectForKeyedSubscript:@"kCBInquiryServices"];
    if (v12) {
      [v9 setObject:v12 forKeyedSubscript:@"kCBMsgArgServiceUUIDs"];
    }
    int64_t v13 = [v6 objectForKeyedSubscript:@"kCBInquiryRSSIThreshold"];
    if (v13) {
      [v9 setObject:v13 forKeyedSubscript:@"kCBMsgArgRssi"];
    }
    id v14 = [v6 objectForKeyedSubscript:@"kCBInquiryReportDuplicates"];
    if (!v14)
    {
LABEL_20:

      goto LABEL_21;
    }
    if (CBLogInitOnce == -1)
    {
      v15 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        [v9 setObject:v14 forKeyedSubscript:@"kCBMsgArgInquiryReportDuplicates"];
        goto LABEL_20;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v15 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
    }
    int v16 = 136315394;
    v17 = "-[CBClassicManager startInquiryWithOptions:classicPeerDiscovered:]";
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1AB9F0000, v15, OS_LOG_TYPE_DEFAULT, "%s reportDuplicates set to %@", (uint8_t *)&v16, 0x16u);
    goto LABEL_19;
  }
LABEL_24:
}

- (void)stopInquiry
{
  if (self->_isInquiryRunning)
  {
    [(CBManager *)self sendMsg:52 args:0];
    self->_isInquiryRunning = 0;
  }
}

- (id)retrievePairedPeersWithOptions:(id)a3
{
  id v4 = a3;
  if ([(CBManager *)self tccApproved])
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
      -[CBClassicManager retrievePairedPeersWithOptions:]();
    }
    BOOL v5 = [v4 objectForKeyedSubscript:@"kCBOptionConnectedKey"];
    id v6 = [v4 objectForKeyedSubscript:@"kCBOptionServicesKey"];
    id v7 = [v4 objectForKeyedSubscript:@"kCBOptionIdentifiersKey"];
    int v8 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v9 = v8;
    if (v5) {
      [v8 setObject:v5 forKeyedSubscript:@"kCBMsgArgConnectionState"];
    }
    if ([v6 count]) {
      [v9 setObject:v6 forKeyedSubscript:@"kCBMsgArgServiceUUIDs"];
    }
    if ([v7 count]) {
      [v9 setObject:v7 forKeyedSubscript:@"kCBMsgArgUUIDs"];
    }
    int v10 = [MEMORY[0x1E4F1CA48] array];
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
LABEL_14:
        BOOL v11 = [(CBManager *)self sendSyncMsg:37 args:v9];
        int v12 = [v11 objectForKeyedSubscript:@"kCBMsgArgDevices"];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __51__CBClassicManager_retrievePairedPeersWithOptions___block_invoke;
        v16[3] = &unk_1E5E33AB8;
        id v13 = v10;
        id v17 = v13;
        __int16 v18 = self;
        [v12 enumerateObjectsUsingBlock:v16];
        id v14 = v13;

        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
    }
    -[CBClassicManager retrievePairedPeersWithOptions:]();
    goto LABEL_14;
  }
  id v14 = 0;
LABEL_16:

  return v14;
}

void __51__CBClassicManager_retrievePairedPeersWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) peerWithInfo:a2];
  [v2 addObject:v3];
}

- (id)getLocalSDPDatabase
{
  if ([(CBManager *)self tccApproved])
  {
    id v3 = [(CBManager *)self sendSyncMsg:59 args:MEMORY[0x1E4F1CC08]];
    uint64_t v4 = [v3 objectForKeyedSubscript:@"kCBMsgArgSDPRecordData"];

    BOOL v5 = (void *)v4;
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (void)addService:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(CBManager *)self tccApproved]) {
    goto LABEL_15;
  }
  if (v5)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CBClassicManager.m", 333, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  id v6 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager addService:](v5, v6);
  }
  id v7 = [v5 data];
  if ([v7 length] != 2)
  {
    int v8 = [v5 data];
    if ([v8 length] == 4)
    {
    }
    else
    {
      BOOL v9 = [v5 data];
      uint64_t v10 = [v9 length];

      if (v10 == 16) {
        goto LABEL_12;
      }
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"CBClassicManager.m", 336, @"Invalid parameter not satisfying: %@", @"serviceUUID.data.length == 2 || serviceUUID.data.length == 4 || serviceUUID.data.length == 16" object file lineNumber description];
    }
  }

LABEL_12:
  id v14 = @"kCBMsgArgServiceUUID";
  v15[0] = v5;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  BOOL v12 = [(CBManager *)self sendMsg:31 args:v11];

  if (!v12)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }
    -[CBClassicManager addService:]();
  }
LABEL_15:
}

- (void)removeService:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(CBManager *)self tccApproved]) {
    goto LABEL_9;
  }
  if (v5)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  else
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CBClassicManager.m", 346, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager removeService:]();
  }
  BOOL v9 = @"kCBMsgArgServiceUUID";
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  BOOL v7 = [(CBManager *)self sendMsg:32 args:v6];

  if (!v7)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }
    -[CBClassicManager removeService:]();
  }
LABEL_9:
}

- (void)removeServiceHandle:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  if (![(CBManager *)self tccApproved]) {
    return;
  }
  if (v3)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  else
  {
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBClassicManager.m", 356, @"Invalid parameter not satisfying: %@", @"serviceHandle != 0" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  id v6 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager removeServiceHandle:](v3, v6);
  }
  BOOL v12 = @"kCBMsgArgServiceHandle";
  BOOL v7 = [NSNumber numberWithUnsignedInt:v3];
  v13[0] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  BOOL v9 = [(CBManager *)self sendMsg:32 args:v8];

  if (!v9)
  {
    if (CBLogInitOnce == -1)
    {
      uint64_t v10 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        return;
      }
LABEL_13:
      -[CBClassicManager removeServiceHandle:](v3, v10);
      return;
    }
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    uint64_t v10 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
  }
}

- (void)removeAllServices
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  id v2 = "-[CBClassicManager removeAllServices]";
  _os_log_debug_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)addServiceToInquiryList:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(CBManager *)self tccApproved]) {
    goto LABEL_15;
  }
  if (v5)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  else
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CBClassicManager.m", 376, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager addServiceToInquiryList:]();
  }
  id v6 = [v5 data];
  if ([v6 length] != 2)
  {
    BOOL v7 = [v5 data];
    if ([v7 length] == 4)
    {
    }
    else
    {
      int v8 = [v5 data];
      uint64_t v9 = [v8 length];

      if (v9 == 16) {
        goto LABEL_12;
      }
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"CBClassicManager.m", 379, @"Invalid parameter not satisfying: %@", @"serviceUUID.data.length == 2 || serviceUUID.data.length == 4 || serviceUUID.data.length == 16" object file lineNumber description];
    }
  }

LABEL_12:
  id v13 = @"kCBMsgArgServiceUUID";
  v14[0] = v5;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  BOOL v11 = [(CBManager *)self sendMsg:34 args:v10];

  if (!v11)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }
    -[CBClassicManager addServiceToInquiryList:]();
  }
LABEL_15:
}

- (void)removeServiceFromInquiryList:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(CBManager *)self tccApproved]) {
    goto LABEL_9;
  }
  if (v5)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  else
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CBClassicManager.m", 389, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager removeServiceFromInquiryList:]();
  }
  uint64_t v9 = @"kCBMsgArgServiceUUID";
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  BOOL v7 = [(CBManager *)self sendMsg:35 args:v6];

  if (!v7)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }
    -[CBClassicManager removeServiceFromInquiryList:]();
  }
LABEL_9:
}

- (void)removeAllServicesFromInquiryList
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AB9F0000, v0, v1, "Failed to remove all services from inquiry list", v2, v3, v4, v5, v6);
}

- (void)addService:(id)a3 sdpRecord:(id)a4 sdpRecordAddedHandler:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  if (![(CBManager *)self tccApproved]) {
    goto LABEL_9;
  }
  if (v9 | v10)
  {
    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CBClassicManager.m", 410, @"Invalid parameter not satisfying: %@", @"serviceUUID != nil || sdpRecord != nil" object file lineNumber description];

    if (CBLogInitOnce == -1) {
      goto LABEL_4;
    }
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
LABEL_4:
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager addService:sdpRecord:sdpRecordAddedHandler:]();
  }
  [(CBClassicManager *)self setSdpRecordAddedHandler:v11];
  v15[0] = @"kCBMsgArgUUID";
  v15[1] = @"kCBMsgArgOptions";
  v16[0] = v9;
  v16[1] = v10;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  BOOL v13 = [(CBManager *)self sendMsg:31 args:v12];

  if (!v13)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }
    -[CBClassicManager addService:sdpRecord:sdpRecordAddedHandler:]();
  }
LABEL_9:
}

- (unsigned)addServiceWithData:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(CBManager *)self tccApproved])
  {
    if (!v5)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"CBClassicManager.m", 423, @"Invalid parameter not satisfying: %@", @"serviceData != nil" object file lineNumber description];
    }
    BOOL v12 = @"kCBMsgArgSDPRecordData";
    v13[0] = v5;
    uint8_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    BOOL v7 = [(CBManager *)self sendSyncMsg:31 args:v6];

    int v8 = [v7 objectForKeyedSubscript:@"kCBMsgArgServiceHandle"];
    unsigned int v9 = [v8 unsignedIntValue];
  }
  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

- (void)connectPeer:(id)a3 options:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(CBManager *)self tccApproved])
  {
    if (!v7)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"CBClassicManager.m", 433, @"Invalid parameter not satisfying: %@", @"peer != nil" object file lineNumber description];
    }
    unsigned int v9 = [v8 objectForKeyedSubscript:@"kCBOptionServicesKey"];
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    unint64_t v10 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      BOOL v12 = [v7 name];
      *(_DWORD *)buf = 136315650;
      v21 = "-[CBClassicManager connectPeer:options:]";
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1AB9F0000, v11, OS_LOG_TYPE_DEFAULT, "%s %@ uuids: %@", buf, 0x20u);
    }
    v18[0] = @"kCBMsgArgDeviceUUID";
    BOOL v13 = [v7 identifier];
    v18[1] = @"kCBMsgArgOptions";
    v19[0] = v13;
    v19[1] = v8;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    BOOL v15 = [(CBManager *)self sendMsg:39 args:v14];

    if (v15)
    {
      uint64_t v16 = [v7 state];
      if (v16 == 3 || !v16) {
        [v7 setState:1];
      }
    }
  }
}

- (void)cancelPeerConnection:(id)a3
{
  id v4 = a3;
  if ([(CBManager *)self tccApproved]) {
    [(CBClassicManager *)self cancelPeerConnection:v4 force:0];
  }
}

- (void)cancelPeerConnection:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ([(CBManager *)self tccApproved])
  {
    if (!v11)
    {
      unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"CBClassicManager.m", 464, @"Invalid parameter not satisfying: %@", @"peer != nil" object file lineNumber description];
    }
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = v7;
    if (v4) {
      uint64_t v9 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v9 = MEMORY[0x1E4F1CC28];
    }
    [v7 setObject:v9 forKey:@"kCBCancelConnectOptionForce"];
    [(CBClassicManager *)self cancelPeerConnection:v11 options:v8];
  }
}

- (void)cancelPeerConnection:(id)a3 options:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(CBManager *)self tccApproved])
  {
    if (!v7)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"CBClassicManager.m", 476, @"Invalid parameter not satisfying: %@", @"peer != nil" object file lineNumber description];
    }
    v15[0] = @"kCBMsgArgDeviceUUID";
    uint64_t v9 = [v7 identifier];
    unint64_t v10 = (void *)v9;
    v15[1] = @"kCBMsgArgOptions";
    id v11 = (id)MEMORY[0x1E4F1CC08];
    if (v8) {
      id v11 = v8;
    }
    v16[0] = v9;
    v16[1] = v11;
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    BOOL v13 = [(CBManager *)self sendMsg:40 args:v12];

    if (v13 && (unint64_t)([v7 state] - 1) <= 1) {
      [v7 setState:3];
    }
  }
}

- (void)setTestMode:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self->_testMode != a3)
  {
    id v8 = @"kCBMsgArgState";
    id v5 = objc_msgSend(NSNumber, "numberWithBool:");
    v9[0] = v5;
    uint8_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    BOOL v7 = [(CBManager *)self sendMsg:43 args:v6];

    if (v7) {
      self->_testMode = a3;
    }
  }
}

- (id)retrievePeerWithAddress:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CBManager *)self tccApproved])
  {
    if ([v4 length])
    {
      BOOL v12 = @"kCBMsgArgAddressString";
      id v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint8_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
      v13[0] = v6;
      BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v8 = [(CBManager *)self sendSyncMsg:38 args:v7];

      uint64_t v9 = [v8 objectForKeyedSubscript:@"kCBMsgArgDevices"];
      if (v9)
      {
        unint64_t v10 = [(CBClassicManager *)self classicPeerWithInfo:v9];
        [v10 setAddressString:v4];
      }
      else
      {
        unint64_t v10 = 0;
      }

      goto LABEL_12;
    }
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicManager retrievePeerWithAddress:]();
    }
  }
  unint64_t v10 = 0;
LABEL_12:

  return v10;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  int v7 = 0;
  id v8 = &selRef_handlePeerDiscovered_;
  switch((int)v4)
  {
    case 16:
      BOOL v15 = [(CBManager *)self sharedPairingAgent];
      [v15 handlePairingMessage:16 args:v6];

      return;
    case 17:
    case 18:
      unint64_t v10 = [(CBClassicManager *)self pairingStatusHandler];

      if (v10)
      {
        id v11 = [(CBClassicManager *)self classicPeerWithInfo:v6];
        BOOL v12 = [MEMORY[0x1E4F28C58] errorWithInfo:v6];
        BOOL v13 = [(CBClassicManager *)self pairingStatusHandler];
        ((void (**)(void, void *, uint64_t))v13)[2](v13, v11, [v12 code]);
      }
      id v14 = [(CBManager *)self sharedPairingAgent];
      [v14 handlePairingMessage:v4 args:v6];

      return;
    case 23:
    case 24:
    case 45:
    case 56:
    case 57:
      uint64_t v9 = [(CBClassicManager *)self classicPeerWithInfo:v6];
      [v9 handleMsg:v4 args:v6];

      goto LABEL_3;
    case 44:
      goto LABEL_21;
    case 46:
      int v7 = 0;
      id v17 = sel_handleServiceAddedToSDP_;
      if ([(CBManager *)self state] == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
      goto LABEL_22;
    case 47:
      int v7 = 0;
      id v17 = sel_handleSDPRecordAdded_;
      if ([(CBManager *)self state] == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
      goto LABEL_22;
    case 48:
      int v7 = 0;
      id v17 = sel_handleServiceAddedToInquiryList_;
      if ([(CBManager *)self state] == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
      goto LABEL_22;
    case 49:
      int v7 = 0;
      id v17 = sel_handlePeerConnectionCompleted_;
      if ([(CBManager *)self state] == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
      goto LABEL_22;
    case 50:
      int v7 = 0;
      id v8 = &selRef_handlePeerDisconnectionCompleted_;
LABEL_21:
      id v17 = *v8;
      if ([(CBManager *)self state] != CBManagerStatePoweredOn) {
        goto LABEL_22;
      }
      goto LABEL_28;
    case 51:
      int v7 = 1;
      id v17 = sel_handlePeerConnectionStateUpdated_;
      if ([(CBManager *)self state] == CBManagerStatePoweredOn) {
        goto LABEL_28;
      }
LABEL_22:
      if ((([(CBManager *)self state] != 10) & ~v7) != 0)
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        }
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        {
          -[CBClassicManager handleMsg:args:]();
        }
        else
        {
LABEL_3:
        }
      }
      else
      {
LABEL_28:
        objc_msgSend(self, v17, v6);
      }
      break;
    default:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      uint64_t v16 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_3;
      }
      -[CBCentralManager handleMsg:args:](v4, v16);

      break;
  }
}

- (void)handlePeerDiscovered:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isInquiryRunning)
  {
    id v5 = [(CBClassicManager *)self classicPeerWithInfo:v4];
    if (v5)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      id v6 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = v6;
        id v8 = [v5 name];
        int v10 = 136315650;
        id v11 = "-[CBClassicManager handlePeerDiscovered:]";
        __int16 v12 = 2112;
        BOOL v13 = v8;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl(&dword_1AB9F0000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ - %@", (uint8_t *)&v10, 0x20u);
      }
      uint64_t v9 = [(CBClassicManager *)self classicPeerDiscovered];
      ((void (**)(void, CBClassicManager *, void *, id))v9)[2](v9, self, v5, v4);
    }
    else
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        -[CBClassicManager handlePeerDiscovered:]();
      }
    }
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicManager handlePeerDiscovered:]();
    }
  }
}

- (void)handlePeerConnectionStateUpdated:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBClassicManager handlePeerConnectionStateUpdated:]();
  }
  id v5 = [(CBClassicManager *)self classicPeerWithInfo:v4];
  [v5 handlePeerUpdated:v4];
  id v6 = [(CBClassicManager *)self connectionStatusHandler];
  if (!v6 || [v5 state] == 1) {
    goto LABEL_9;
  }
  uint64_t v7 = [v5 state];

  if (v7 != 3)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    id v8 = [(CBClassicManager *)self connectionStatusHandler];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v5, [v6 code]);

LABEL_9:
  }
}

- (void)handleServiceAddedToSDP:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBClassicManager handleServiceAddedToSDP:]();
    uint64_t v9 = [(CBClassicManager *)self serviceAddedHandler];

    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v5 = [(CBClassicManager *)self serviceAddedHandler];

  if (v5)
  {
LABEL_5:
    id v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
    id v8 = [(CBClassicManager *)self serviceAddedHandler];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v7, [v6 code]);
  }
LABEL_6:
}

- (void)handleServiceAddedToInquiryList:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBClassicManager handleServiceAddedToInquiryList:]();
    uint64_t v9 = [(CBClassicManager *)self inquiryServiceAddedHandler];

    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v5 = [(CBClassicManager *)self inquiryServiceAddedHandler];

  if (v5)
  {
LABEL_5:
    id v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
    id v8 = [(CBClassicManager *)self inquiryServiceAddedHandler];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v7, [v6 code]);
  }
LABEL_6:
}

- (void)handleSDPRecordAdded:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBClassicManager handleSDPRecordAdded:]();
    uint64_t v9 = [(CBClassicManager *)self sdpRecordAddedHandler];

    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v5 = [(CBClassicManager *)self sdpRecordAddedHandler];

  if (v5)
  {
LABEL_5:
    id v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgServiceUUID"];
    id v8 = [(CBClassicManager *)self sdpRecordAddedHandler];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v7, [v6 code]);
  }
LABEL_6:
}

- (void)handlePeerConnectionCompleted:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v6 = [(CBClassicManager *)self peerWithIdentifier:v5];

  if (v6)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    uint64_t v7 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = "-[CBClassicManager handlePeerConnectionCompleted:]";
      __int16 v17 = 2112;
      __int16 v18 = v6;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_1AB9F0000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v15, 0x20u);
    }
    id v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgInternalState"];
    uint64_t v9 = v8;
    if (v8) {
      objc_msgSend(v6, "setInternalState:", (int)objc_msgSend(v8, "intValue"));
    }
    int v10 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    if (v10)
    {
      [v6 handleFailedConnection];
      id v11 = [(CBClassicManager *)self connectCallback];

      if (!v11)
      {
LABEL_11:

        goto LABEL_16;
      }
    }
    else
    {
      [v6 handleSuccessfulConnection:v4];
      __int16 v14 = [(CBClassicManager *)self connectCallback];

      if (!v14) {
        goto LABEL_11;
      }
    }
    __int16 v12 = [(CBClassicManager *)self connectCallback];
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v6, [v10 code]);

    goto LABEL_11;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  BOOL v13 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBClassicManager handlePeerConnectionCompleted:](v13, v4);
  }
LABEL_16:
}

- (void)handlePeerDisconnectionCompleted:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  id v6 = [(CBClassicManager *)self peerWithIdentifier:v5];

  if (v6)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    uint64_t v7 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      int v15 = "-[CBClassicManager handlePeerDisconnectionCompleted:]";
      __int16 v16 = 2112;
      __int16 v17 = v6;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1AB9F0000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v14, 0x20u);
    }
    id v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgInternalState"];
    uint64_t v9 = v8;
    if (v8) {
      objc_msgSend(v6, "setInternalState:", (int)objc_msgSend(v8, "intValue"));
    }
    int v10 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
    [v6 handleDisconnection];
    id v11 = [(CBClassicManager *)self disconnectCallback];

    if (v11)
    {
      __int16 v12 = [(CBClassicManager *)self disconnectCallback];
      ((void (**)(void, void *, uint64_t))v12)[2](v12, v6, [v10 code]);
    }
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    BOOL v13 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBClassicManager handlePeerDisconnectionCompleted:](v13, v4);
    }
  }
}

- (void)alertUserNotificationIsReady:(id)a3
{
}

- (BOOL)inquiryState
{
  return self->_inquiryState;
}

- (BOOL)discoverable
{
  return self->_discoverable;
}

- (BOOL)connectable
{
  return self->_connectable;
}

- (id)connectCallback
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setConnectCallback:(id)a3
{
}

- (id)disconnectCallback
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setDisconnectCallback:(id)a3
{
}

- (id)serviceAddedHandler
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setServiceAddedHandler:(id)a3
{
}

- (id)inquiryServiceAddedHandler
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setInquiryServiceAddedHandler:(id)a3
{
}

- (NSMapTable)peers
{
  return self->_peers;
}

- (BOOL)isInquiryRunning
{
  return self->_isInquiryRunning;
}

- (int64_t)powerState
{
  return self->_powerState;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (id)classicPeerDiscovered
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setClassicPeerDiscovered:(id)a3
{
}

- (id)sdpRecordAddedHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setSdpRecordAddedHandler:(id)a3
{
}

- (id)pairingStatusHandler
{
  return objc_getProperty(self, a2, 208, 1);
}

- (void)setPairingStatusHandler:(id)a3
{
}

- (id)connectionStatusHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setConnectionStatusHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionStatusHandler, 0);
  objc_storeStrong(&self->_pairingStatusHandler, 0);
  objc_storeStrong(&self->_sdpRecordAddedHandler, 0);
  objc_storeStrong(&self->_classicPeerDiscovered, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong(&self->_inquiryServiceAddedHandler, 0);
  objc_storeStrong(&self->_serviceAddedHandler, 0);
  objc_storeStrong(&self->_disconnectCallback, 0);

  objc_storeStrong(&self->_connectCallback, 0);
}

void __38__CBClassicManager_orphanClassicPeers__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1AB9F0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)startInquiryWithOptions:(uint64_t)a3 classicPeerDiscovered:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  int v6 = 136315650;
  uint64_t v7 = "-[CBClassicManager startInquiryWithOptions:classicPeerDiscovered:]";
  __int16 v8 = 2048;
  uint64_t v9 = [a2 state];
  __int16 v10 = 2112;
  uint64_t v11 = a3;
  _os_log_debug_impl(&dword_1AB9F0000, v5, OS_LOG_TYPE_DEBUG, "%s block with state %ld and options: %@ ", (uint8_t *)&v6, 0x20u);
}

- (void)retrievePairedPeersWithOptions:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1AB9F0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)addService:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AB9F0000, v0, v1, "Failed to add SDP services", v2, v3, v4, v5, v6);
}

- (void)addService:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = [a1 data];
  int v5 = 136315650;
  uint8_t v6 = "-[CBClassicManager addService:]";
  __int16 v7 = 2112;
  __int16 v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = [v4 length];
  _os_log_debug_impl(&dword_1AB9F0000, v3, OS_LOG_TYPE_DEBUG, "%s %@, len: %lu", (uint8_t *)&v5, 0x20u);
}

- (void)removeService:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "Error removing service: %@", v2, v3, v4, v5, v6);
}

- (void)removeService:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1AB9F0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)removeServiceHandle:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AB9F0000, a2, OS_LOG_TYPE_ERROR, "Error removing service handle: %X", (uint8_t *)v2, 8u);
}

- (void)removeServiceHandle:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[CBClassicManager removeServiceHandle:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_1AB9F0000, a2, OS_LOG_TYPE_DEBUG, "%s %X", (uint8_t *)&v2, 0x12u);
}

- (void)addServiceToInquiryList:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AB9F0000, v0, v1, "Failed to add services to inquiry list", v2, v3, v4, v5, v6);
}

- (void)addServiceToInquiryList:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1AB9F0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)removeServiceFromInquiryList:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "Failed to remove service from inquiry list %@", v2, v3, v4, v5, v6);
}

- (void)removeServiceFromInquiryList:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1AB9F0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)addService:sdpRecord:sdpRecordAddedHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "Failed to add service %@ (with SDP record)", v2, v3, v4, v5, v6);
}

- (void)addService:sdpRecord:sdpRecordAddedHandler:.cold.2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_2();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_1AB9F0000, v2, OS_LOG_TYPE_DEBUG, "%s %@ sdp: %@", (uint8_t *)v3, 0x20u);
}

- (void)retrievePeerWithAddress:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AB9F0000, v0, v1, "WARNING: Invalid address specified, cannot create a CBClassicPeer from an empty string", v2, v3, v4, v5, v6);
}

- (void)handleMsg:args:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1AB9F0000, v1, OS_LOG_TYPE_ERROR, "%@ is not powered on, ignoring message: %u", v2, 0x12u);
}

- (void)handlePeerDiscovered:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AB9F0000, v0, v1, "Inquiry not running", v2, v3, v4, v5, v6);
}

- (void)handlePeerDiscovered:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1AB9F0000, v0, v1, "Discovered null peer", v2, v3, v4, v5, v6);
}

- (void)handlePeerConnectionStateUpdated:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1AB9F0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)handleServiceAddedToSDP:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1AB9F0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)handleServiceAddedToInquiryList:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1AB9F0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)handleSDPRecordAdded:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1AB9F0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)handlePeerConnectionCompleted:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1AB9F0000, v3, OS_LOG_TYPE_ERROR, "%s %@ not found", (uint8_t *)v5, 0x16u);
}

- (void)handlePeerDisconnectionCompleted:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 objectForKeyedSubscript:@"kCBMsgArgDeviceUUID"];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1AB9F0000, v3, OS_LOG_TYPE_ERROR, "handlePeerDisconnectionCompleted: %@ not found", v5, 0xCu);
}

@end