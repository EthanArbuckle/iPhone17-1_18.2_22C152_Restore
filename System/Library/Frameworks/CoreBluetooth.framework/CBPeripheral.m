@interface CBPeripheral
- (BOOL)ancsAuthorized;
- (BOOL)canSendWriteWithoutResponse;
- (BOOL)isConnected;
- (BOOL)isConnectedToSystem;
- (BOOL)managedByFindMy;
- (BOOL)sendMsg:(int)a3 args:(id)a4 withReply:(id)a5;
- (BOOL)visibleInSettings;
- (CBPeripheral)initWithCentralManager:(id)a3 info:(id)a4;
- (CBPeripheralState)state;
- (NSArray)findMyGroupMembers;
- (NSArray)services;
- (NSHashTable)l2capChannels;
- (NSNumber)RSSI;
- (NSString)BDAddress;
- (NSString)findMySerialNumberString;
- (NSString)name;
- (NSString)remoteControllerId;
- (NSString)stableIdentifier;
- (NSUInteger)maximumWriteValueLengthForType:(CBCharacteristicWriteType)type;
- (NSUUID)findMyBeaconIdentifier;
- (NSUUID)findMyUserIdentifier;
- (id)attributeForHandle:(id)a3;
- (id)delegate;
- (id)description;
- (id)extendedDescription;
- (id)l2capChannelForPeer:(id)a3 withPsm:(unsigned __int16)a4;
- (id)sendSyncMsg:(int)a3 args:(id)a4;
- (unsigned)appearance;
- (unsigned)findMyPartIdentifier;
- (unsigned)writesPending;
- (void)dealloc;
- (void)discoverCharacteristics:(NSArray *)characteristicUUIDs forService:(CBService *)service;
- (void)discoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic;
- (void)discoverIncludedServices:(NSArray *)includedServiceUUIDs forService:(CBService *)service;
- (void)discoverServices:(NSArray *)serviceUUIDs;
- (void)enableFastLeConnection:(BOOL)a3 withInfo:(id)a4 completion:(id)a5;
- (void)getTimeSyncData;
- (void)handleAttributeEvent:(id)a3 args:(id)a4 attributeSelector:(SEL)a5 delegateSelector:(SEL)a6 delegateFlag:(BOOL)a7;
- (void)handleCharacteristicDescriptorsDiscovered:(id)a3;
- (void)handleCharacteristicEvent:(id)a3 characteristicSelector:(SEL)a4 delegateSelector:(SEL)a5 delegateFlag:(BOOL)a6;
- (void)handleCharacteristicValueNotifying:(id)a3;
- (void)handleCharacteristicValueUpdated:(id)a3;
- (void)handleCharacteristicValueWritten:(id)a3;
- (void)handleConnectionStateUpdated:(BOOL)a3;
- (void)handleDescriptorEvent:(id)a3 descriptorSelector:(SEL)a4 delegateSelector:(SEL)a5 delegateFlag:(BOOL)a6;
- (void)handleDescriptorValueUpdated:(id)a3;
- (void)handleDescriptorValueWritten:(id)a3;
- (void)handleDisconnection;
- (void)handleFailedConnection;
- (void)handleL2CAPChannelClosed:(id)a3;
- (void)handleL2CAPChannelOpened:(id)a3;
- (void)handleMsg:(int)a3 args:(id)a4;
- (void)handleNameUpdated:(id)a3;
- (void)handleRSSIUpdated:(id)a3;
- (void)handleServiceCharacteristicsDiscovered:(id)a3;
- (void)handleServiceEvent:(id)a3 serviceSelector:(SEL)a4 delegateSelector:(SEL)a5 delegateFlag:(BOOL)a6;
- (void)handleServiceIncludedServicesDiscovered:(id)a3;
- (void)handleServicesChanged:(id)a3;
- (void)handleServicesDiscovered:(id)a3;
- (void)handleSuccessfulConnection:(id)a3;
- (void)handleTimeSyncResponse:(id)a3;
- (void)handleVisibilityChanged:(id)a3;
- (void)invalidateAllAttributes;
- (void)isReadyForUpdates;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openL2CAPChannel:(CBL2CAPPSM)PSM;
- (void)openL2CAPChannel:(unsigned __int16)a3 options:(id)a4;
- (void)openL2CAPChannel:(unsigned __int16)a3 priority:(int64_t)a4;
- (void)readRSSI;
- (void)readValueForCharacteristic:(CBCharacteristic *)characteristic;
- (void)readValueForDescriptor:(CBDescriptor *)descriptor;
- (void)removeAllL2CAPChannels;
- (void)removeAttributeForHandle:(id)a3;
- (void)sendMsg:(int)a3 args:(id)a4;
- (void)sendMsg:(int)a3 requiresConnected:(BOOL)a4 args:(id)a5;
- (void)setAncsAuthorized:(BOOL)a3;
- (void)setAppearance:(unsigned __int16)a3;
- (void)setAttribute:(id)a3 forHandle:(id)a4;
- (void)setBDAddress:(id)a3;
- (void)setBroadcastValue:(BOOL)a3 forCharacteristic:(id)a4;
- (void)setCanSendWriteWithoutResponse:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setHighPriorityStream:(BOOL)a3 duration:(id)a4;
- (void)setName:(id)a3;
- (void)setNotifyValue:(BOOL)enabled forCharacteristic:(CBCharacteristic *)characteristic;
- (void)setOrphan;
- (void)setPeripheralName:(id)a3;
- (void)setRSSI:(id)a3;
- (void)setRemoteControllerId:(id)a3;
- (void)setServices:(id)a3;
- (void)setStableIdentifier:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setVisibleInSettings:(BOOL)a3;
- (void)setWritesPending:(unsigned int)a3;
- (void)updateFindMyInfo:(id)a3;
- (void)writeValue:(NSData *)data forCharacteristic:(CBCharacteristic *)characteristic type:(CBCharacteristicWriteType)type;
- (void)writeValue:(NSData *)data forDescriptor:(CBDescriptor *)descriptor;
@end

@implementation CBPeripheral

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMyUserIdentifier, 0);
  objc_storeStrong((id *)&self->_findMyBeaconIdentifier, 0);
  objc_storeStrong((id *)&self->_findMySerialNumberString, 0);
  objc_storeStrong((id *)&self->_findMyGroupMembers, 0);
  objc_storeStrong((id *)&self->_stableIdentifier, 0);
  objc_storeStrong((id *)&self->_BDAddress, 0);
  objc_storeStrong((id *)&self->_l2capChannels, 0);
  objc_storeStrong((id *)&self->_remoteControllerId, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_RSSI, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_attributes, 0);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: Forcing disconnection of unused peripheral %@. Did you forget to cancel the connection?", v2, v3, v4, v5, v6);
}

- (CBPeripheral)initWithCentralManager:(id)a3 info:(id)a4
{
  id v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CBPeripheral;
  v7 = [(CBPeer *)&v27 initWithInfo:v6 manager:a3];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"kCBMsgArgName"];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v10 = [v6 objectForKeyedSubscript:@"kCBMsgArgAdvertisementData"];
    v11 = [v10 objectForKeyedSubscript:@"kCBAdvDataAppearance"];
    v7->_appearance = [v11 unsignedShortValue];

    RSSI = v7->_RSSI;
    v7->_RSSI = 0;

    v7->_state = 0;
    services = v7->_services;
    v7->_services = 0;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributes = v7->_attributes;
    v7->_attributes = v14;

    v16 = [v6 objectForKeyedSubscript:@"kCBMsgArgConnectionState"];
    v7->_isConnectedToSystem = [v16 BOOLValue];

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    l2capChannels = v7->_l2capChannels;
    v7->_l2capChannels = (NSHashTable *)v17;

    v19 = [v6 objectForKeyedSubscript:@"kCBMsgArgAncsAuthorization"];
    v7->_ancsAuthorized = [v19 BOOLValue];

    v20 = [v6 objectForKey:@"kCBMsgArgVisibleInSettings"];

    if (v20)
    {
      v21 = [v6 objectForKeyedSubscript:@"kCBMsgArgVisibleInSettings"];
      v7->_visibleInSettings = [v21 BOOLValue];
    }
    else
    {
      v7->_visibleInSettings = 1;
    }
    uint64_t v22 = [v6 objectForKeyedSubscript:@"kCBMsgArgWhbStableIdentifier"];
    stableIdentifier = v7->_stableIdentifier;
    v7->_stableIdentifier = (NSString *)v22;

    uint64_t v24 = [v6 objectForKeyedSubscript:@"kCBMsgArgWhbRemoteControllerId"];
    remoteControllerId = v7->_remoteControllerId;
    v7->_remoteControllerId = (NSString *)v24;

    [(CBPeripheral *)v7 addObserver:v7 forKeyPath:@"delegate" options:0 context:0];
    [(CBPeripheral *)v7 updateFindMyInfo:v6];
  }

  return v7;
}

- (void)updateFindMyInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgFindMyGroupMembers"];
  findMyGroupMembers = self->_findMyGroupMembers;
  self->_findMyGroupMembers = v5;

  v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgFindMySerialNumberString"];
  findMySerialNumberString = self->_findMySerialNumberString;
  self->_findMySerialNumberString = v7;

  v9 = [v4 objectForKeyedSubscript:@"kCBMsgArgFindMyPartNumber"];
  self->_findMyPartIdentifier = [v9 intValue];

  v10 = [v4 objectForKeyedSubscript:@"kCBMsgArgFindMyManaged"];
  self->_managedByFindMy = [v10 BOOLValue];

  v11 = [v4 objectForKeyedSubscript:@"kCBMsgArgFindMyBeaconID"];
  findMyBeaconIdentifier = self->_findMyBeaconIdentifier;
  self->_findMyBeaconIdentifier = v11;

  v13 = [v4 objectForKeyedSubscript:@"kCBMsgArgFindMyUserID"];

  findMyUserIdentifier = self->_findMyUserIdentifier;
  self->_findMyUserIdentifier = v13;
}

- (id)description
{
  unint64_t state = self->_state;
  if (state > 3) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E5E324F0[state];
  }
  uint64_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = [(CBPeer *)self identifier];
  uint64_t v8 = [v7 UUIDString];
  v9 = [v5 stringWithFormat:@"<%@: %p, identifier = %@, name = %@, mtu = %lu, unint64_t state = %@>", v6, self, v8, self->_name, -[CBPeer mtuLength](self, "mtuLength"), v4];

  return v9;
}

- (id)extendedDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(CBPeripheral *)self description];
  uint64_t v5 = (void *)v4;
  uint64_t v6 = "YES";
  if (self->_visibleInSettings) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  if (!self->_managedByFindMy) {
    uint64_t v6 = "NO";
  }
  uint64_t v8 = [v3 stringWithFormat:@"%@ visibleInSettings %s findMyPartId:%d findMySerialNum:%@ findMyGroupMembers:%@ _findMyBeaconIdentifier:%@ _findMyUserIdentifier:%@ managedByFindMy:%s ", v4, v7, self->_findMyPartIdentifier, self->_findMySerialNumberString, self->_findMyGroupMembers, self->_findMyBeaconIdentifier, self->_findMyUserIdentifier, v6];

  return v8;
}

- (void)sendMsg:(int)a3 args:(id)a4
{
}

- (void)sendMsg:(int)a3 requiresConnected:(BOOL)a4 args:(id)a5
{
  BOOL v5 = a4;
  unsigned __int16 v6 = a3;
  id v8 = a5;
  v9 = [(CBPeer *)self manager];

  if (v9)
  {
    if (self->_state == 2 || !v5) {
      goto LABEL_9;
    }
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    {
      -[CBClassicPeer sendMsg:requiresConnected:args:]();
      if (v8) {
        goto LABEL_11;
      }
    }
    else
    {
LABEL_9:
      if (v8)
      {
LABEL_11:
        v11 = [(CBPeer *)self identifier];
        [v8 setObject:v11 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

        v12 = [(CBPeer *)self manager];
        [v12 sendMsg:v6 args:v8];

LABEL_12:
        return;
      }
    }
    id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    goto LABEL_11;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    goto LABEL_12;
  }
  -[CBPeripheral sendMsg:requiresConnected:args:]();
}

- (id)sendSyncMsg:(int)a3 args:(id)a4
{
  unsigned __int16 v4 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  v7 = [(CBPeer *)self identifier];
  [v6 setObject:v7 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  id v8 = [(CBPeer *)self manager];
  v9 = [v8 sendSyncMsg:v4 args:v6];

  return v9;
}

- (BOOL)sendMsg:(int)a3 args:(id)a4 withReply:(id)a5
{
  unsigned __int16 v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  v10 = [(CBPeer *)self identifier];
  [v8 setObject:v10 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  v11 = [(CBPeer *)self manager];
  char v12 = [v11 sendMsg:v6 args:v8 withReply:v9];

  return v12;
}

- (void)handleMsg:(int)a3 args:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = &selRef_handleVisibilityChanged_;
  id v8 = &selRef_handleNameUpdated_;
  switch((int)v4)
  {
    case 178:
      goto LABEL_30;
    case 179:
      v7 = &selRef_handleServicesChanged_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 180:
      v7 = &selRef_handleRSSIUpdated_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 181:
      v7 = &selRef_handleServicesDiscovered_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 182:
      v7 = &selRef_handleTimeSyncResponse_;
      goto LABEL_31;
    case 183:
    case 184:
    case 186:
    case 187:
    case 188:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 198:
    case 201:
    case 202:
      goto LABEL_8;
    case 185:
      goto LABEL_31;
    case 189:
      v7 = &selRef_handleServiceIncludedServicesDiscovered_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 190:
      v7 = &selRef_handleServiceCharacteristicsDiscovered_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 196:
      v7 = &selRef_handleCharacteristicValueUpdated_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 197:
      v7 = &selRef_handleCharacteristicValueWritten_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 199:
      v7 = &selRef_handleCharacteristicValueNotifying_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 200:
      v7 = &selRef_handleCharacteristicDescriptorsDiscovered_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 203:
      v7 = &selRef_handleDescriptorValueUpdated_;
      if (self->_state != 2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    case 204:
      id v8 = &selRef_handleDescriptorValueWritten_;
LABEL_30:
      v7 = v8;
      if (self->_state == 2) {
        goto LABEL_31;
      }
      goto LABEL_33;
    default:
      if (v4 == 23)
      {
        v7 = &selRef_handleL2CAPChannelOpened_;
        if (self->_state != 2) {
          goto LABEL_33;
        }
LABEL_31:
        objc_msgSend(self, *v7, v6);

        return;
      }
      if (v4 != 24)
      {
LABEL_8:
        v9.receiver = self;
        v9.super_class = (Class)CBPeripheral;
        [(CBPeer *)&v9 handleMsg:v4 args:v6];
LABEL_9:

        return;
      }
      v7 = &selRef_handleL2CAPChannelClosed_;
      if (self->_state == 2) {
        goto LABEL_31;
      }
LABEL_33:
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_9;
      }
      -[CBPeripheral handleMsg:args:]();

      return;
  }
}

- (id)attributeForHandle:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:a3];
}

- (void)setAttribute:(id)a3 forHandle:(id)a4
{
}

- (void)removeAttributeForHandle:(id)a3
{
}

- (void)invalidateAllAttributes
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_services;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "invalidate", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(CBPeripheral *)self setServices:0];
}

- (void)handleSuccessfulConnection:(id)a3
{
  id v4 = a3;
  id v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgATTMTU"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgIsLinkEncrypted"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionTransport"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgConnectionRole"];

  [(CBPeer *)self setHostState:0];
  -[CBPeer setMtuLength:](self, "setMtuLength:", [v8 unsignedIntegerValue]);
  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", [v5 BOOLValue]);
  [(CBPeripheral *)self setCanSendWriteWithoutResponse:1];
  -[CBPeer setConnectedTransport:](self, "setConnectedTransport:", [v6 unsignedIntegerValue]);
  if (v7) {
    -[CBPeer setRole:](self, "setRole:", [v7 unsignedIntegerValue]);
  }
  [(CBPeripheral *)self setState:2];
}

- (void)handleFailedConnection
{
}

- (void)handleDisconnection
{
  [(CBPeripheral *)self setRSSI:0];
  [(CBPeripheral *)self setState:0];
  [(CBPeer *)self setHostState:0];
  [(CBPeer *)self setMtuLength:23];
  [(CBPeer *)self setIsLinkEncrypted:0];
  [(CBPeripheral *)self setCanSendWriteWithoutResponse:0];
  [(CBPeer *)self setRole:-1];
  [(CBPeripheral *)self invalidateAllAttributes];

  [(CBPeripheral *)self setRemoteControllerId:0];
}

- (void)handleConnectionStateUpdated:(BOOL)a3
{
  self->_isConnectedToSystem = a3;
}

- (void)setOrphan
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"delegate", a4, a5, a6))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 2;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v9;

    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 4;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v11;

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 8;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFF7 | v13;

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 16;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v15;

    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 32;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v17;

    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = 64;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v19;

    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v21 = 128;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v21;

    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = 256;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v23;

    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v25 = 512;
    }
    else {
      __int16 v25 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFDFF | v25;

    id v26 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v27 = 1024;
    }
    else {
      __int16 v27 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFBFF | v27;

    id v28 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v29 = 2048;
    }
    else {
      __int16 v29 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xF7FF | v29;

    id v30 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v31 = 4096;
    }
    else {
      __int16 v31 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xEFFF | v31;

    id v32 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v33 = 0x2000;
    }
    else {
      __int16 v33 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xDFFF | v33;

    id v35 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v34 = 0x4000;
    }
    else {
      __int16 v34 = 0;
    }
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xBFFF | v34;
  }
}

- (BOOL)isConnected
{
  return self->_state == 2;
}

- (void)readRSSI
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: Reading RSSI for peripheral %@ while delegate is either nil or does not implement peripheral:didReadRSSI:error:", v2, v3, v4, v5, v6);
}

- (void)discoverServices:(NSArray *)serviceUUIDs
{
  uint64_t v4 = serviceUUIDs;
  if ((*(_WORD *)&self->_delegateFlags & 0x10) == 0)
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBPeripheral discoverServices:]();
    }
  }
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  uint8_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"kCBMsgArgUUIDs", 0);
  [(CBPeripheral *)self sendMsg:176 args:v6];
}

- (void)discoverIncludedServices:(NSArray *)includedServiceUUIDs forService:(CBService *)service
{
  uint64_t v7 = includedServiceUUIDs;
  id v8 = service;
  if (!v8)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CBPeripheral.m", 405, @"Invalid parameter not satisfying: %@", @"service != nil" object file lineNumber description];
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x20) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    -[CBPeripheral discoverIncludedServices:forService:]();
  }
LABEL_6:
  __int16 v9 = [(CBService *)v8 peripheral];

  if (v9 == self)
  {
    id v10 = (void *)MEMORY[0x1E4F1CA60];
    if (v7) {
      __int16 v11 = v7;
    }
    else {
      __int16 v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    id v12 = [(CBService *)v8 startHandle];
    __int16 v13 = [(CBService *)v8 endHandle];
    id v14 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"kCBMsgArgUUIDs", v12, @"kCBMsgArgServiceStartHandle", v13, @"kCBMsgArgServiceEndHandle", 0);
    [(CBPeripheral *)self sendMsg:187 args:v14];
  }
  else
  {
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
    }
      -[CBPeripheral discoverIncludedServices:forService:]();
  }
LABEL_14:
}

- (void)discoverCharacteristics:(NSArray *)characteristicUUIDs forService:(CBService *)service
{
  uint64_t v7 = characteristicUUIDs;
  id v8 = service;
  if (!v8)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CBPeripheral.m", 425, @"Invalid parameter not satisfying: %@", @"service != nil" object file lineNumber description];
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x40) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    -[CBPeripheral discoverCharacteristics:forService:]();
  }
LABEL_6:
  __int16 v9 = [(CBService *)v8 peripheral];

  if (v9 == self)
  {
    id v10 = (void *)MEMORY[0x1E4F1CA60];
    if (v7) {
      __int16 v11 = v7;
    }
    else {
      __int16 v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    id v12 = [(CBService *)v8 startHandle];
    __int16 v13 = [(CBService *)v8 endHandle];
    id v14 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"kCBMsgArgUUIDs", v12, @"kCBMsgArgServiceStartHandle", v13, @"kCBMsgArgServiceEndHandle", 0);
    [(CBPeripheral *)self sendMsg:188 args:v14];
  }
  else
  {
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
    }
      -[CBPeripheral discoverIncludedServices:forService:]();
  }
LABEL_14:
}

- (void)readValueForCharacteristic:(CBCharacteristic *)characteristic
{
  uint64_t v5 = characteristic;
  if (!v5)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBPeripheral.m", 445, @"Invalid parameter not satisfying: %@", @"characteristic != nil" object file lineNumber description];
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x80) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    -[CBPeripheral readValueForCharacteristic:]();
  }
LABEL_6:
  uint8_t v6 = [(CBCharacteristic *)v5 peripheral];

  if (v6 == self)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
    id v8 = [(CBCharacteristic *)v5 handle];
    __int16 v9 = [(CBCharacteristic *)v5 valueHandle];
    id v10 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"kCBMsgArgCharacteristicHandle", v9, @"kCBMsgArgCharacteristicValueHandle", 0);
    [(CBPeripheral *)self sendMsg:191 args:v10];

    goto LABEL_11;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
  }
    -[CBPeripheral readValueForCharacteristic:]();
LABEL_11:
}

- (NSUInteger)maximumWriteValueLengthForType:(CBCharacteristicWriteType)type
{
  if (type == CBCharacteristicWriteWithResponse) {
    return 512;
  }
  if (type != CBCharacteristicWriteWithoutResponse) {
    return 0;
  }
  unint64_t v5 = [(CBPeer *)self mtuLength];
  if (v5 - 3 >= 0x200) {
    return 512;
  }
  else {
    return v5 - 3;
  }
}

- (void)isReadyForUpdates
{
  unsigned int v3 = [(CBPeripheral *)self writesPending];
  [(CBPeripheral *)self setWritesPending:0];
  [(CBPeripheral *)self setCanSendWriteWithoutResponse:1];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      unint64_t v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 peripheralIsReadyToSendWriteWithoutResponse:self];
      }
    }
  }
}

- (void)writeValue:(NSData *)data forCharacteristic:(CBCharacteristic *)characteristic type:(CBCharacteristicWriteType)type
{
  __int16 v9 = data;
  id v10 = characteristic;
  __int16 v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"CBPeripheral.m", 491, @"Invalid parameter not satisfying: %@", @"data != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  __int16 v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"CBPeripheral.m", 492, @"Invalid parameter not satisfying: %@", @"characteristic != nil" object file lineNumber description];

LABEL_3:
  id v12 = [(CBCharacteristic *)v11 peripheral];

  if (v12 == self)
  {
    if (type == CBCharacteristicWriteWithoutResponse && ([(CBCharacteristic *)v11 properties] & 4) == 0)
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        -[CBPeripheral writeValue:forCharacteristic:type:]();
      }
    }
    __int16 v13 = (void *)MEMORY[0x1E4F1CA60];
    id v14 = [(CBCharacteristic *)v11 handle];
    __int16 v15 = [(CBCharacteristic *)v11 valueHandle];
    id v16 = [NSNumber numberWithInteger:type];
    __int16 v17 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, @"kCBMsgArgCharacteristicHandle", v15, @"kCBMsgArgCharacteristicValueHandle", v9, @"kCBMsgArgData", v16, @"kCBMsgArgType", 0);
    [(CBPeripheral *)self sendMsg:192 args:v17];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBPeripheral readValueForCharacteristic:]();
    }
  }
  if (type == CBCharacteristicWriteWithoutResponse)
  {
    [(CBPeripheral *)self setWritesPending:[(CBPeripheral *)self writesPending] + 1];
    [(CBPeripheral *)self setCanSendWriteWithoutResponse:[(CBPeripheral *)self writesPending] == 0];
  }
}

- (void)setBroadcastValue:(BOOL)a3 forCharacteristic:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CBPeripheral.m", 518, @"Invalid parameter not satisfying: %@", @"characteristic != nil" object file lineNumber description];
  }
  id v8 = [v7 peripheral];

  if (v8 == self)
  {
    __int16 v9 = (void *)MEMORY[0x1E4F1CA60];
    id v10 = [v7 handle];
    __int16 v11 = [v7 valueHandle];
    id v12 = [NSNumber numberWithBool:v4];
    __int16 v13 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"kCBMsgArgCharacteristicHandle", v11, @"kCBMsgArgCharacteristicValueHandle", v12, @"kCBMsgArgState", 0);
    [(CBPeripheral *)self sendMsg:193 args:v13];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBPeripheral readValueForCharacteristic:]();
    }
  }
}

- (void)setNotifyValue:(BOOL)enabled forCharacteristic:(CBCharacteristic *)characteristic
{
  BOOL v4 = enabled;
  id v7 = characteristic;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CBPeripheral.m", 534, @"Invalid parameter not satisfying: %@", @"characteristic != nil" object file lineNumber description];
  }
  id v8 = [(CBCharacteristic *)v7 peripheral];

  if (v8 == self)
  {
    __int16 v9 = (void *)MEMORY[0x1E4F1CA60];
    id v10 = [(CBCharacteristic *)v7 handle];
    __int16 v11 = [(CBCharacteristic *)v7 valueHandle];
    id v12 = [NSNumber numberWithBool:v4];
    __int16 v13 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"kCBMsgArgCharacteristicHandle", v11, @"kCBMsgArgCharacteristicValueHandle", v12, @"kCBMsgArgState", 0);
    [(CBPeripheral *)self sendMsg:194 args:v13];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBPeripheral readValueForCharacteristic:]();
    }
  }
}

- (void)discoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic
{
  unint64_t v5 = characteristic;
  if (!v5)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBPeripheral.m", 550, @"Invalid parameter not satisfying: %@", @"characteristic != nil" object file lineNumber description];
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x400) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    -[CBPeripheral discoverDescriptorsForCharacteristic:]();
  }
LABEL_6:
  id v6 = [(CBCharacteristic *)v5 peripheral];

  if (v6 == self)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA60];
    id v8 = [(CBCharacteristic *)v5 handle];
    __int16 v9 = [(CBCharacteristic *)v5 valueHandle];
    id v10 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"kCBMsgArgCharacteristicHandle", v9, @"kCBMsgArgCharacteristicValueHandle", 0);
    [(CBPeripheral *)self sendMsg:195 args:v10];

    goto LABEL_11;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
  }
    -[CBPeripheral readValueForCharacteristic:]();
LABEL_11:
}

- (void)readValueForDescriptor:(CBDescriptor *)descriptor
{
  unint64_t v5 = descriptor;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CBPeripheral.m", 569, @"Invalid parameter not satisfying: %@", @"descriptor != nil" object file lineNumber description];
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x800) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
    }
    -[CBPeripheral readValueForDescriptor:]();
  }
LABEL_6:
  id v6 = [(CBDescriptor *)v5 peripheral];

  if (v6 == self)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA60];
    id v8 = [(CBDescriptor *)v5 handle];
    __int16 v9 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"kCBMsgArgDescriptorHandle", 0);
    [(CBPeripheral *)self sendMsg:201 args:v9];

    goto LABEL_11;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
LABEL_9:
  }
    -[CBPeripheral readValueForDescriptor:]();
LABEL_11:
}

- (void)writeValue:(NSData *)data forDescriptor:(CBDescriptor *)descriptor
{
  id v7 = data;
  id v8 = descriptor;
  __int16 v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CBPeripheral.m", 587, @"Invalid parameter not satisfying: %@", @"data != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"CBPeripheral.m", 588, @"Invalid parameter not satisfying: %@", @"descriptor != nil" object file lineNumber description];

LABEL_3:
  id v10 = [(CBAttribute *)v9 UUID];
  __int16 v11 = +[CBUUID UUIDWithString:@"2902"];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    __int16 v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"CBPeripheral.m" lineNumber:590 description:@"Client Characteristic Configuration descriptors must be configured using setNotifyValue:forCharacteristic:"];
  }
  __int16 v13 = [(CBDescriptor *)v9 peripheral];

  if (v13 == self)
  {
    id v14 = (void *)MEMORY[0x1E4F1CA60];
    __int16 v15 = [(CBDescriptor *)v9 handle];
    id v16 = objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, @"kCBMsgArgDescriptorHandle", v7, @"kCBMsgArgData", 0);
    [(CBPeripheral *)self sendMsg:202 args:v16];
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBPeripheral readValueForDescriptor:]();
    }
  }
}

- (void)setPeripheralName:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    __int16 v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CBPeripheral.m", 608, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    id v5 = 0;
  }
  [(CBPeripheral *)self setName:v5];
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = [(CBPeer *)self identifier];
  id v8 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"kCBMsgArgDeviceUUID", v10, @"kCBMsgArgName", 0);
  [(CBPeripheral *)self sendMsg:183 args:v8];
}

- (void)setVisibleInSettings:(BOOL)a3
{
  self->_visibleInSettings = a3;
}

- (void)getTimeSyncData
{
}

- (void)setHighPriorityStream:(BOOL)a3 duration:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v10 = [(CBPeer *)self identifier];
  id v8 = [NSNumber numberWithBool:v4];
  __int16 v9 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v10, @"kCBMsgArgDeviceUUID", v8, @"kCBMsgArgSetHighPriorityStream", v7, @"kCBMsgArgHighPriorityStreamDuration", 0);

  [(CBPeripheral *)self sendMsg:184 args:v9];
}

- (void)openL2CAPChannel:(CBL2CAPPSM)PSM
{
}

- (void)openL2CAPChannel:(unsigned __int16)a3 priority:(int64_t)a4
{
  uint64_t v4 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  id v8 = @"kCBL2CAPChannelPriority";
  id v6 = [NSNumber numberWithInteger:a4];
  v9[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [(CBPeripheral *)self openL2CAPChannel:v4 options:v7];
}

- (void)openL2CAPChannel:(unsigned __int16)a3 options:(id)a4
{
  uint64_t v4 = a3;
  id v12 = a4;
  if (!v4)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CBPeripheral.m", 652, @"Invalid parameter not satisfying: %@", @"psm > 0" object file lineNumber description];
  }
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = [NSNumber numberWithUnsignedShort:v4];
  id v9 = (id)MEMORY[0x1E4F1CC08];
  if (v12) {
    id v9 = v12;
  }
  id v10 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"kCBMsgArgPSM", v9, @"kCBMsgArgOptions", 0);
  [(CBPeripheral *)self sendMsg:25 args:v10];
}

- (id)l2capChannelForPeer:(id)a3 withPsm:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = self->_l2capChannels;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      __int16 v13 = objc_msgSend(v12, "peer", (void)v17);
      if ([v13 isEqual:v6])
      {
        int v14 = [v12 PSM];

        if (v14 == v4)
        {
          id v15 = v12;

          goto LABEL_17;
        }
      }
      else
      {
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (!v9) {
          break;
        }
        goto LABEL_4;
      }
    }
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
    -[CBPeripheral l2capChannelForPeer:withPsm:]();
  }
  id v15 = 0;
LABEL_17:

  return v15;
}

- (void)removeAllL2CAPChannels
{
}

- (void)enableFastLeConnection:(BOOL)a3 withInfo:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [(CBPeer *)self identifier];
  [v10 setObject:v11 forKeyedSubscript:@"kCBMsgArgDeviceUUID"];

  id v12 = [NSNumber numberWithBool:v6];
  [v10 setObject:v12 forKeyedSubscript:@"kCBMsgArgEnable"];

  if (v8 && [v8 length]) {
    [v10 setObject:v8 forKeyedSubscript:@"kCBFastLeConnectionInfoData"];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CBPeripheral_enableFastLeConnection_withInfo_completion___block_invoke;
  v14[3] = &unk_1E5E310E0;
  id v15 = v9;
  id v13 = v9;
  [(CBPeripheral *)self sendMsg:186 args:v10 withReply:v14];
}

void __59__CBPeripheral_enableFastLeConnection_withInfo_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    int v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, a3);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithInfo:a2];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }
}

- (void)handleNameUpdated:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"kCBMsgArgName"];
  -[CBPeripheral setName:](self, "setName:");
  if (*(_WORD *)&self->_delegateFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained peripheralDidUpdateName:self];
  }
}

- (void)handleServicesChanged:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgServiceStartHandle"];
  id v20 = v4;
  __int16 v23 = [v4 objectForKeyedSubscript:@"kCBMsgArgServiceEndHandle"];
  [MEMORY[0x1E4F1CA48] array];
  uint64_t v22 = v21 = self;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = self->_services;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v12 = [v11 endHandle];
        unsigned int v13 = [v12 unsignedShortValue];
        if (v13 < [v5 unsignedShortValue])
        {
        }
        else
        {
          int v14 = [v11 startHandle];
          unsigned int v15 = [v14 unsignedShortValue];
          unsigned int v16 = [v23 unsignedShortValue];

          if (v15 <= v16)
          {
            [v11 invalidate];
            [v22 addObject:v11];
          }
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  if ([v22 count])
  {
    long long v17 = (void *)[(NSArray *)v21->_services mutableCopy];
    [v17 removeObjectsInArray:v22];
    [(CBPeripheral *)v21 setServices:v17];
  }
  if ((*(_WORD *)&v21->_delegateFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v21->_delegate);
    [WeakRetained peripheral:v21 didModifyServices:v22];

    long long v18 = v20;
  }
  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    }
    long long v18 = v20;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBPeripheral handleServicesChanged:]();
    }
  }
}

- (void)handleRSSIUpdated:(id)a3
{
  id v4 = a3;
  id v8 = [v4 objectForKeyedSubscript:@"kCBMsgArgData"];
  id v5 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];

  __int16 delegateFlags = (__int16)self->_delegateFlags;
  if ((delegateFlags & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained peripheral:self didReadRSSI:v8 error:v5];
LABEL_8:

    goto LABEL_9;
  }
  if (!v5)
  {
    [(CBPeripheral *)self setRSSI:v8];
    if ((*(_WORD *)&self->_delegateFlags & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if ((delegateFlags & 8) != 0)
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained peripheralDidUpdateRSSI:self error:v5];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)handleVisibilityChanged:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgVisibleInSettings"];
  self->_visibleInSettings = [v4 BOOLValue];
}

- (void)handleTimeSyncResponse:(id)a3
{
  id v11 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithInfo:");
  if ((*(_WORD *)&self->_delegateFlags & 0x2000) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [v11 objectForKeyedSubscript:@"kCBMsgArgTimeOfDay"];
    uint64_t v7 = [v11 objectForKeyedSubscript:@"kCBMsgArgLocalRefTime"];
    id v8 = [v11 objectForKeyedSubscript:@"kCBMsgArgRemoteRefTime"];
    uint64_t v9 = [v11 objectForKeyedSubscript:@"kCBMsgArgTimeToSend"];
    uint64_t v10 = [v11 objectForKeyedSubscript:@"kCBMsgArgGMTDelta"];
    [WeakRetained peripheral:self didReceiveTimeSyncWithReferenceTime:v6 localAbsolute:v7 remoteAbsolute:v8 receiveTime:v9 GMTDelta:v10 error:v4];
  }
}

- (void)handleServicesDiscovered:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if (!v5)
  {
    id v22 = v4;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgServices"];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_services];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (!v10)
    {
LABEL_29:

      __int16 v21 = (void *)[v8 copy];
      [(CBPeripheral *)self setServices:v21];

      id v5 = 0;
      id v4 = v22;
      if ((*(_WORD *)&self->_delegateFlags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_3;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      unsigned int v15 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
      unsigned int v16 = [v15 objectForKeyedSubscript:@"kCBMsgArgServiceStartHandle"];
      int v14 = [(CBPeripheral *)self attributeForHandle:v16];
      if (v14)
      {
        if (([v8 containsObject:v14] & 1) == 0) {
          goto LABEL_15;
        }
      }
      else
      {
        long long v18 = [v15 objectForKeyedSubscript:@"kCBMsgArgUUID"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || [v18 length] != 2 && objc_msgSend(v18, "length") != 4 && objc_msgSend(v18, "length") != 16)
        {
          if (CBLogInitOnce != -1) {
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          }
          id v20 = CBLogComponent;
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v28 = self;
            __int16 v29 = 2112;
            id v30 = v16;
            _os_log_debug_impl(&dword_1AB9F0000, v20, OS_LOG_TYPE_DEBUG, "Data in %@ does not contain a valid UUID for service handle = %@", buf, 0x16u);
          }

          int v14 = 0;
          goto LABEL_10;
        }
        int v14 = [[CBService alloc] initWithPeripheral:self dictionary:v15];
        long long v19 = [(CBService *)v14 startHandle];
        [(CBPeripheral *)self setAttribute:v14 forHandle:v19];

        if (([v8 containsObject:v14] & 1) == 0)
        {
LABEL_15:
          [v8 addObject:v14];
          if (CBLogInitOnce != -1) {
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          }
          long long v17 = CBLogComponent;
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v28 = (CBPeripheral *)v14;
            __int16 v29 = 2112;
            id v30 = self;
            _os_log_debug_impl(&dword_1AB9F0000, v17, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
          }
        }
      }
LABEL_10:

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (!v11) {
          goto LABEL_29;
        }
        goto LABEL_8;
      }
    }
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
LABEL_3:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained peripheral:self didDiscoverServices:v5];
  }
LABEL_4:
}

- (void)handleL2CAPChannelOpened:(id)a3
{
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v5 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBPeripheral handleL2CAPChannelOpened:](v5);
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithInfo:v4];
  if (v6)
  {
    if (CBLogInitOnce == -1)
    {
      uint64_t v7 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      uint64_t v7 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        id v8 = 0;
        if ((*(_WORD *)&self->_delegateFlags & 0x4000) == 0) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
    -[CBPeripheral handleL2CAPChannelOpened:](v7);
    id v8 = 0;
    if ((*(_WORD *)&self->_delegateFlags & 0x4000) == 0) {
      goto LABEL_12;
    }
LABEL_11:
    id v9 = [(CBPeripheral *)self delegate];
    [v9 peripheral:self didOpenL2CAPChannel:v8 error:v6];

    goto LABEL_12;
  }
  id v8 = [[CBL2CAPChannel alloc] initWithPeer:self info:v4];
  [(NSHashTable *)self->_l2capChannels addObject:v8];
  if ((*(_WORD *)&self->_delegateFlags & 0x4000) != 0) {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)handleL2CAPChannelClosed:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  id v6 = [v4 errorWithInfo:v5];
  uint64_t v7 = [v5 objectForKey:@"kCBMsgArgPSM"];

  unsigned __int16 v8 = [v7 intValue];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  id v9 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    [(CBPeripheral *)v8 handleL2CAPChannelClosed:v9];
  }
  uint64_t v10 = [(CBPeripheral *)self l2capChannelForPeer:self withPsm:v8];
  [(NSHashTable *)self->_l2capChannels removeObject:v10];
}

- (void)handleAttributeEvent:(id)a3 args:(id)a4 attributeSelector:(SEL)a5 delegateSelector:(SEL)a6 delegateFlag:(BOOL)a7
{
  BOOL v7 = a7;
  id v17 = a4;
  uint64_t v12 = [(CBPeripheral *)self attributeForHandle:a3];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    int v14 = [MEMORY[0x1E4F28C58] errorWithInfo:v17];
    if (!v14)
    {
      uint64_t v15 = objc_msgSend(v13, a5, v17);

      uint64_t v13 = (void *)v15;
    }
    if (v13 && v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, a6, self, v13, v14);
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)handleServiceEvent:(id)a3 serviceSelector:(SEL)a4 delegateSelector:(SEL)a5 delegateFlag:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = [v10 objectForKeyedSubscript:@"kCBMsgArgServiceStartHandle"];
  [(CBPeripheral *)self handleAttributeEvent:v11 args:v10 attributeSelector:a4 delegateSelector:a5 delegateFlag:v6];
}

- (void)handleCharacteristicEvent:(id)a3 characteristicSelector:(SEL)a4 delegateSelector:(SEL)a5 delegateFlag:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = [v10 objectForKeyedSubscript:@"kCBMsgArgCharacteristicHandle"];
  [(CBPeripheral *)self handleAttributeEvent:v11 args:v10 attributeSelector:a4 delegateSelector:a5 delegateFlag:v6];
}

- (void)handleDescriptorEvent:(id)a3 descriptorSelector:(SEL)a4 delegateSelector:(SEL)a5 delegateFlag:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = [v10 objectForKeyedSubscript:@"kCBMsgArgDescriptorHandle"];
  [(CBPeripheral *)self handleAttributeEvent:v11 args:v10 attributeSelector:a4 delegateSelector:a5 delegateFlag:v6];
}

- (void)handleServiceIncludedServicesDiscovered:(id)a3
{
}

- (void)handleServiceCharacteristicsDiscovered:(id)a3
{
}

- (void)handleCharacteristicValueUpdated:(id)a3
{
}

- (void)handleCharacteristicValueWritten:(id)a3
{
}

- (void)handleCharacteristicValueNotifying:(id)a3
{
}

- (void)handleCharacteristicDescriptorsDiscovered:(id)a3
{
}

- (void)handleDescriptorValueUpdated:(id)a3
{
}

- (void)handleDescriptorValueWritten:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (void)setName:(id)a3
{
}

- (NSNumber)RSSI
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRSSI:(id)a3
{
}

- (CBPeripheralState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSArray)services
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setServices:(id)a3
{
}

- (BOOL)canSendWriteWithoutResponse
{
  return self->_canSendWriteWithoutResponse;
}

- (void)setCanSendWriteWithoutResponse:(BOOL)a3
{
  self->_canSendWriteWithoutResponse = a3;
}

- (BOOL)ancsAuthorized
{
  return self->_ancsAuthorized;
}

- (void)setAncsAuthorized:(BOOL)a3
{
  self->_ancsAuthorized = a3;
}

- (unsigned)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(unsigned __int16)a3
{
  self->_appearance = a3;
}

- (unsigned)writesPending
{
  return self->_writesPending;
}

- (void)setWritesPending:(unsigned int)a3
{
  self->_writesPending = a3;
}

- (NSString)remoteControllerId
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRemoteControllerId:(id)a3
{
}

- (BOOL)isConnectedToSystem
{
  return self->_connectedToSystem;
}

- (NSHashTable)l2capChannels
{
  return self->_l2capChannels;
}

- (NSString)BDAddress
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBDAddress:(id)a3
{
}

- (BOOL)visibleInSettings
{
  return self->_visibleInSettings;
}

- (NSString)stableIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStableIdentifier:(id)a3
{
}

- (unsigned)findMyPartIdentifier
{
  return self->_findMyPartIdentifier;
}

- (NSArray)findMyGroupMembers
{
  return self->_findMyGroupMembers;
}

- (NSString)findMySerialNumberString
{
  return self->_findMySerialNumberString;
}

- (NSUUID)findMyBeaconIdentifier
{
  return self->_findMyBeaconIdentifier;
}

- (NSUUID)findMyUserIdentifier
{
  return self->_findMyUserIdentifier;
}

- (BOOL)managedByFindMy
{
  return self->_managedByFindMy;
}

- (void)sendMsg:requiresConnected:args:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "WARNING: %@ is not a valid peripheral", v2, v3, v4, v5, v6);
}

- (void)handleMsg:args:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_1AB9F0000, v0, v1, "%@ is not connected, ignoring message: %u");
}

- (void)discoverServices:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: Discovering services for peripheral %@ while delegate is either nil or does not implement peripheral:didDiscoverServices:", v2, v3, v4, v5, v6);
}

- (void)discoverIncludedServices:forService:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1AB9F0000, v0, v1, "WARNING: %@ is not a valid service for peripheral %@");
}

- (void)discoverIncludedServices:forService:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: Discovering included services for peripheral %@ while delegate is either nil or does not implement peripheral:didDiscoverIncludedServicesForService:error:", v2, v3, v4, v5, v6);
}

- (void)discoverCharacteristics:forService:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: Discovering characteristics on peripheral %@ while delegate is either nil or does not implement peripheral:didDiscoverCharacteristicsForService:error:", v2, v3, v4, v5, v6);
}

- (void)readValueForCharacteristic:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1AB9F0000, v0, v1, "WARNING: %@ is not a valid characteristic for peripheral %@");
}

- (void)readValueForCharacteristic:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: Reading characteristic value for peripheral %@ while delegate is either nil or does not implement peripheral:didUpdateValueForCharacteristic:error:", v2, v3, v4, v5, v6);
}

- (void)writeValue:forCharacteristic:type:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "WARNING: Characteristic %@ does not specify the \"Write Without Response\" property - ignoring response-less write", v2, v3, v4, v5, v6);
}

- (void)discoverDescriptorsForCharacteristic:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: Discovering characteristic descriptors for peripheral %@ while delegate is either nil or does not implement peripheral:didDiscoverDescriptorsForCharacteristic:error:", v2, v3, v4, v5, v6);
}

- (void)readValueForDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1AB9F0000, v0, v1, "WARNING: %@ is not a valid descriptor for peripheral %@");
}

- (void)readValueForDescriptor:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "API MISUSE: Reading descriptor value for peripheral %@ while delegate is either nil or does not implement peripheral:didUpdateValueForDescriptor:error:", v2, v3, v4, v5, v6);
}

- (void)l2capChannelForPeer:withPsm:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1AB9F0000, v1, OS_LOG_TYPE_ERROR, "No known channel matching peer %@ with psm %u", v2, 0x12u);
}

- (void)handleServicesChanged:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AB9F0000, v0, v1, "WARNING: The delegate for %@ does not implement -[peripheral:didModifyServices:]", v2, v3, v4, v5, v6);
}

- (void)handleL2CAPChannelOpened:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_ERROR, "Failed to open L2CAP channel", v1, 2u);
}

- (void)handleL2CAPChannelOpened:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_DEBUG, "l2CAP channel opened", v1, 2u);
}

- (void)handleL2CAPChannelClosed:(NSObject *)a3 .cold.1(unsigned __int16 a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a1;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_4_0(&dword_1AB9F0000, a2, a3, "l2CAP channel closed with psm : %u and result : %@", v3, (void)v4, HIWORD(a2), *MEMORY[0x1E4F143B8]);
}

@end