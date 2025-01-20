@interface _IDSDevice
- (BOOL)isActive;
- (BOOL)isCloudConnected;
- (BOOL)isConnected;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isHSATrusted;
- (BOOL)isLocallyPaired;
- (BOOL)isNearby;
- (BOOL)isTinker;
- (BOOL)locallyPresent;
- (BOOL)supportsApplePay;
- (BOOL)supportsHandoff;
- (BOOL)supportsMMSRelay;
- (BOOL)supportsPhoneCalls;
- (BOOL)supportsSMSRelay;
- (BOOL)supportsTethering;
- (BOOL)supportsiCloudPairing;
- (IDSEndpointCapabilities)capabilities;
- (NSArray)identities;
- (NSArray)linkedUserURIs;
- (NSData)pushToken;
- (NSDate)lastActivityDate;
- (NSString)description;
- (NSString)deviceColor;
- (NSString)enclosureColor;
- (NSString)modelIdentifier;
- (NSString)name;
- (NSString)productBuildVersion;
- (NSString)productName;
- (NSString)productVersion;
- (NSString)service;
- (NSString)uniqueID;
- (NSString)uniqueIDOverride;
- (NSUUID)nsuuid;
- (NSUUID)stableBluetoothIdentifier;
- (_IDSDevice)initWithDictionary:(id)a3;
- (id)compactDescription;
- (id)fullDescription;
- (int64_t)deviceType;
- (int64_t)relationship;
- (unint64_t)maxCompatibilityVersion;
- (unint64_t)minCompatibilityVersion;
- (unint64_t)pairingProtocolVersion;
- (unint64_t)serviceMinCompatibilityVersion;
- (void)_addIdentity:(id)a3;
- (void)_cloudConnectedStateChanged;
- (void)_connectedStateChanged;
- (void)_nearbyStateChanged;
- (void)_setAccount:(id)a3;
- (void)_setService:(id)a3;
- (void)_stateChanged;
- (void)cancel;
- (void)dealloc;
- (void)setNSUUID:(id)a3;
- (void)stateDidChange:(unint64_t)a3;
@end

@implementation _IDSDevice

- (_IDSDevice)initWithDictionary:(id)a3
{
  id v5 = a3;
  v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A3F7D0();
    }
  }
  if (_IDSRunningInDaemon())
  {
    v9 = +[IDSLogging IDSDevice];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v9);
    }

    v10 = 0;
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)_IDSDevice;
    v11 = [(_IDSDevice *)&v33 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_info, a3);
      v13 = [(_IDSDevice *)v12 uniqueIDOverride];
      if (![v13 length])
      {
        uint64_t v14 = [(_IDSDevice *)v12 uniqueID];

        v13 = (void *)v14;
      }
      v15 = [NSString stringWithFormat:@"%@-%@", *MEMORY[0x1E4F6AED8], v13];
      uint64_t v16 = +[IDSDeviceStateMonitoring sharedInstanceForNotificationName:v15];
      monitor = v12->_monitor;
      v12->_monitor = (IDSDeviceStateMonitoring *)v16;

      v18 = v12->_monitor;
      v19 = +[IDSInternalQueueController sharedInstance];
      uint64_t v20 = [v19 queue];
      [(IDSDeviceStateMonitoring *)v18 registerForStateUpdates:v12 queue:v20];

      uint64_t v21 = [(IDSDeviceStateMonitoring *)v12->_monitor currentState];
      v12->_nearby = (*MEMORY[0x1E4F6B5F8] & v21) != 0;
      v12->_connected = (*MEMORY[0x1E4F6B5F0] & v21) != 0;
      BOOL v22 = (*MEMORY[0x1E4F6B5E8] & v21) != 0;
      v12->_immutableCloudConnected = v22;
      v12->_cloudConnected = v22;
      uint64_t v23 = *MEMORY[0x1E4F6AE18];
      v24 = [(NSDictionary *)v12->_info objectForKey:*MEMORY[0x1E4F6AE18]];
      objc_opt_class();
      LOBYTE(v20) = objc_opt_isKindOfClass();
      id v25 = objc_alloc(MEMORY[0x1E4F6B448]);
      if (v20) {
        v26 = v24;
      }
      else {
        v26 = (void *)MEMORY[0x1E4F1CC08];
      }
      uint64_t v27 = [v25 initWithCapabilitiesMap:v26];
      capabilities = v12->_capabilities;
      v12->_capabilities = (IDSEndpointCapabilities *)v27;

      v29 = (void *)[(NSDictionary *)v12->_info mutableCopy];
      [v29 removeObjectForKey:v23];
      uint64_t v30 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v29];
      info = v12->_info;
      v12->_info = (NSDictionary *)v30;
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (void)cancel
{
  monitor = self->_monitor;
  if (monitor)
  {
    [(IDSDeviceStateMonitoring *)monitor unRegisterForStateUpdates:self];
    v4 = self->_monitor;
    self->_monitor = 0;
  }
}

- (void)dealloc
{
  [(_IDSDevice *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)_IDSDevice;
  [(_IDSDevice *)&v3 dealloc];
}

- (void)stateDidChange:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3F868();
    }
  }
  int nearby = self->_nearby;
  int connected = self->_connected;
  int cloudConnected = self->_cloudConnected;
  int v11 = (*MEMORY[0x1E4F6B5F8] & a3) != 0;
  self->_int nearby = v11;
  int v12 = (*MEMORY[0x1E4F6B5F0] & a3) != 0;
  self->_int connected = v12;
  int v13 = (*MEMORY[0x1E4F6B5E8] & a3) != 0;
  self->_int cloudConnected = v13;
  BOOL v14 = nearby == v11 && connected == v12;
  int v15 = !v14;
  if (!v14) {
    [(_IDSDevice *)self _nearbyStateChanged];
  }
  if (connected != v12)
  {
    [(_IDSDevice *)self _connectedStateChanged];
    if (cloudConnected == v13) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (cloudConnected != v13)
  {
LABEL_19:
    [(_IDSDevice *)self _cloudConnectedStateChanged];
    goto LABEL_20;
  }
  if (v15) {
LABEL_20:
  }
    [(_IDSDevice *)self _stateChanged];
  uint64_t v16 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v17 = self->_nearby;
    BOOL v18 = self->_connected;
    BOOL v19 = self->_cloudConnected;
    v20[0] = 67110400;
    v20[1] = nearby;
    __int16 v21 = 1024;
    int v22 = connected;
    __int16 v23 = 1024;
    int v24 = cloudConnected;
    __int16 v25 = 1024;
    BOOL v26 = v17;
    __int16 v27 = 1024;
    BOOL v28 = v18;
    __int16 v29 = 1024;
    BOOL v30 = v19;
    _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Device note -- old: {isNearby: %d, isConnected: %d, isCloudConnected: %d} new: {isNearby: %d, isConnected: %d, isCloudConnected: %d}", (uint8_t *)v20, 0x26u);
  }
}

- (NSString)uniqueID
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3F900();
    }
  }
  int v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int v7 = [v6 _stringForKey:*MEMORY[0x1E4F6B220]];

  return (NSString *)v7;
}

- (NSString)uniqueIDOverride
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3F998();
    }
  }
  int v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE38]];

  return (NSString *)v6;
}

- (NSString)productBuildVersion
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FA30();
    }
  }
  int v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int v7 = [v6 objectForKey:*MEMORY[0x1E4F6B1D8]];

  return (NSString *)v7;
}

- (NSString)productName
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FAC8();
    }
  }
  int v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int v7 = [v6 objectForKey:*MEMORY[0x1E4F6B1E0]];

  return (NSString *)v7;
}

- (NSString)productVersion
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FB60();
    }
  }
  int v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int v7 = [v6 objectForKey:*MEMORY[0x1E4F6B1E8]];

  return (NSString *)v7;
}

- (NSString)modelIdentifier
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FBF8();
    }
  }
  int v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE30]];

  return (NSString *)v6;
}

- (NSString)name
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FC90();
    }
  }
  int v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE88]];

  return (NSString *)v6;
}

- (NSString)service
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FD28();
    }
  }
  int v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEB8]];

  return (NSString *)v6;
}

- (id)fullDescription
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FDC0();
    }
  }
  v35 = NSString;
  int v6 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v6);
  v39 = [(_IDSDevice *)self name];
  v38 = [(_IDSDevice *)self modelIdentifier];
  objc_super v33 = [(_IDSDevice *)self uniqueID];
  uint64_t v31 = [(_IDSDevice *)self uniqueIDOverride];
  BOOL v30 = [(_IDSDevice *)self pushToken];
  __int16 v29 = [(_IDSDevice *)self service];
  BOOL v28 = [(_IDSDevice *)self identities];
  v37 = [(_IDSDevice *)self linkedUserURIs];
  v32 = [(_IDSDevice *)self nsuuid];
  __int16 v27 = [v32 UUIDString];
  int64_t v26 = [(_IDSDevice *)self relationship];
  if ([(_IDSDevice *)self supportsSMSRelay]) {
    int v7 = @"YES";
  }
  else {
    int v7 = @"NO";
  }
  __int16 v25 = v7;
  if ([(_IDSDevice *)self supportsMMSRelay]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  int v24 = v8;
  if ([(_IDSDevice *)self supportsPhoneCalls]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  __int16 v23 = v9;
  int v22 = [(_IDSDevice *)self deviceColor];
  v10 = [(_IDSDevice *)self enclosureColor];
  if ([(_IDSDevice *)self locallyPresent]) {
    int v11 = @"YES";
  }
  else {
    int v11 = @"NO";
  }
  __int16 v21 = v11;
  if ([(_IDSDevice *)self isDefaultPairedDevice]) {
    int v12 = @"YES";
  }
  else {
    int v12 = @"NO";
  }
  uint64_t v20 = v12;
  if ([(_IDSDevice *)self isNearby]) {
    int v13 = @"YES";
  }
  else {
    int v13 = @"NO";
  }
  if ([(_IDSDevice *)self isConnected]) {
    BOOL v14 = @"YES";
  }
  else {
    BOOL v14 = @"NO";
  }
  if ([(_IDSDevice *)self isCloudConnected]) {
    int v15 = @"YES";
  }
  else {
    int v15 = @"NO";
  }
  if ([(_IDSDevice *)self isActive]) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  if ([(_IDSDevice *)self isLocallyPaired]) {
    BOOL v17 = @"YES";
  }
  else {
    BOOL v17 = @"NO";
  }
  BOOL v18 = [(_IDSDevice *)self productBuildVersion];
  objc_msgSend(v35, "stringWithFormat:", @"[%@ %p:   Name: %@   Model: %@   UniqueID: %@   UniqueID Override: %@   Push Token: %@   Service: %@   Handles: %@   linkedUserURIs: %@   nsuuid: %@   relationship: %lu   supportsSMSRelay: %@   supportsMMSRelay: %@   supportsPhoneCalls: %@   deviceColor: %@   enclosureColor: %@  local: %@   defaultPairedDevice: %@   isNearby: %@  isConnected: %@  isCloudConnected: %@  isActive: %@  isLocallyPaired: %@  build: %@   pairing protocol: %lu   min compatibility version: %lu   max compatibility version: %lu]", v34, self, v39, v38, v33, v31, v30, v29, v28, v37, v27, v26, v25, v24, v23, v22,
    v10,
    v21,
    v20,
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    [(_IDSDevice *)self pairingProtocolVersion],
    [(_IDSDevice *)self minCompatibilityVersion],
  v36 = [(_IDSDevice *)self maxCompatibilityVersion]);

  return v36;
}

- (NSString)description
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FE58();
    }
  }
  BOOL v6 = [(_IDSDevice *)self isLocallyPaired];
  v34 = NSString;
  int v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v36 = [(_IDSDevice *)self name];
  [(_IDSDevice *)self modelIdentifier];
  BOOL v37 = v6;
  v35 = v38 = (void *)v8;
  if (v6)
  {
    v39 = @"all 0s";
    BOOL v28 = @"YES";
  }
  else
  {
    v39 = [(_IDSDevice *)self uniqueID];
    BOOL v28 = @"NO";
  }
  v32 = [(_IDSDevice *)self uniqueIDOverride];
  uint64_t v31 = [(_IDSDevice *)self pushToken];
  BOOL v30 = [(_IDSDevice *)self service];
  objc_super v33 = [(_IDSDevice *)self nsuuid];
  __int16 v29 = [v33 UUIDString];
  int64_t v27 = [(_IDSDevice *)self relationship];
  if ([(_IDSDevice *)self supportsSMSRelay]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  int64_t v26 = v9;
  if ([(_IDSDevice *)self supportsMMSRelay]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  __int16 v25 = v10;
  if ([(_IDSDevice *)self supportsPhoneCalls]) {
    int v11 = @"YES";
  }
  else {
    int v11 = @"NO";
  }
  int v24 = v11;
  int v12 = [(_IDSDevice *)self deviceColor];
  __int16 v23 = [(_IDSDevice *)self enclosureColor];
  if ([(_IDSDevice *)self locallyPresent]) {
    int v13 = @"YES";
  }
  else {
    int v13 = @"NO";
  }
  int v22 = v13;
  if ([(_IDSDevice *)self isDefaultPairedDevice]) {
    BOOL v14 = @"YES";
  }
  else {
    BOOL v14 = @"NO";
  }
  if ([(_IDSDevice *)self isNearby]) {
    int v15 = @"YES";
  }
  else {
    int v15 = @"NO";
  }
  if ([(_IDSDevice *)self isConnected]) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  if ([(_IDSDevice *)self isActive]) {
    BOOL v17 = @"YES";
  }
  else {
    BOOL v17 = @"NO";
  }
  if ([(_IDSDevice *)self isHSATrusted]) {
    BOOL v18 = @"YES";
  }
  else {
    BOOL v18 = @"NO";
  }
  BOOL v19 = [(_IDSDevice *)self productBuildVersion];
  objc_msgSend(v34, "stringWithFormat:", @"[%@ %p:   Name: %@    Model: %@   UniqueID: %@   UniqueID Override: %@   Push Token: %@   Service: %@   nsuuid: %@   relationship: %lu    supportsSMSRelay: %@   supportsMMSRelay: %@   supportsPhoneCalls: %@   deviceColor: %@   enclosureColor: %@  local: %@   defaultPairedDevice: %@   isNearby: %@  isConnected: %@  isActive: %@  isLocallyPaired: %@  isHSATrusted: %@  build: %@   pairing protocol: %lu   min compatibility version: %lu   max compatibility version: %lu]", v38, self, v36, v35, v39, v32, v31, v30, v29, v27, v26, v25, v24, v12, v23, v22,
    v14,
    v15,
    v16,
    v17,
    v28,
    v18,
    v19,
    [(_IDSDevice *)self pairingProtocolVersion],
    [(_IDSDevice *)self minCompatibilityVersion],
  uint64_t v20 = [(_IDSDevice *)self maxCompatibilityVersion]);

  if (!v37) {

  }
  return (NSString *)v20;
}

- (id)compactDescription
{
  objc_super v3 = NSString;
  int v4 = [(_IDSDevice *)self uniqueIDOverride];
  id v5 = [(_IDSDevice *)self pushToken];
  BOOL v6 = @"NO";
  if ([(_IDSDevice *)self isNearby]) {
    int v7 = @"YES";
  }
  else {
    int v7 = @"NO";
  }
  if ([(_IDSDevice *)self isConnected]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if ([(_IDSDevice *)self isActive]) {
    BOOL v6 = @"YES";
  }
  v9 = [v3 stringWithFormat:@"[%p uid: %@, tok: %@, near: %@, conn: %@, active: %@, rel: %lu]", self, v4, v5, v7, v8, v6, -[_IDSDevice relationship](self, "relationship")];

  return v9;
}

- (BOOL)isNearby
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FEF0();
    }
  }
  return self->_nearby;
}

- (BOOL)isConnected
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3FF88();
    }
  }
  return self->_connected;
}

- (BOOL)isCloudConnected
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40020();
    }
  }
  return self->_immutableCloudConnected;
}

- (BOOL)locallyPresent
{
  v2 = +[IDSInternalQueueController sharedInstance];
  int v3 = [v2 assertQueueIsCurrent];

  if (v3)
  {
    int v4 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_191A400B8();
    }
  }
  return 1;
}

- (BOOL)isDefaultPairedDevice
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40150();
    }
  }
  return [(_IDSDevice *)self isActive];
}

- (BOOL)isLocallyPaired
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A401E8();
    }
  }
  BOOL v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE20]];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)isActive
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40280();
    }
  }
  BOOL v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE50]];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (int64_t)relationship
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40318();
    }
  }
  BOOL v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE98]];
  if ([v6 integerValue] == 1) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = 1;
  }

  return v7;
}

- (NSDate)lastActivityDate
{
  return 0;
}

- (unint64_t)pairingProtocolVersion
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A403B0();
    }
  }
  BOOL v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE90]];
  int64_t v7 = v6;
  if (v6) {
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)minCompatibilityVersion
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40448();
    }
  }
  BOOL v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE78]];
  int64_t v7 = v6;
  if (v6) {
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)maxCompatibilityVersion
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A404E0();
    }
  }
  BOOL v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE70]];
  int64_t v7 = v6;
  if (v6) {
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)serviceMinCompatibilityVersion
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40578();
    }
  }
  BOOL v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AED0]];
  int64_t v7 = v6;
  if (v6) {
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (NSArray)linkedUserURIs
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40610();
    }
  }
  BOOL v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE60]];

  return (NSArray *)v6;
}

- (void)setNSUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int64_t v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A406A8();
    }
  }
  unint64_t v8 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = self;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Client request to set uuid %@ on device %@", (uint8_t *)&v13, 0x16u);
  }

  if ([(_IDSDevice *)self supportsiCloudPairing])
  {
    v9 = +[IDSDaemonController sharedInstance];
    v10 = [v4 UUIDString];
    int v11 = [(_IDSDevice *)self uniqueID];
    int v12 = [(_IDSDevice *)self service];
    [v9 setNSUUID:v10 onDeviceWithUniqueID:v11 forService:v12];
  }
  else
  {
    v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "  => Device doesn't support it, ignoring", (uint8_t *)&v13, 2u);
    }
  }
}

- (NSUUID)nsuuid
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40740();
    }
  }
  if ([(_IDSDevice *)self supportsHandoff]
    && (uint64_t v6 = *MEMORY[0x1E4F6AE80],
        [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE80]],
        int64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    v9 = [(NSDictionary *)self->_info objectForKey:v6];
    v10 = (void *)[v8 initWithUUIDString:v9];
  }
  else
  {
    v10 = 0;
  }

  return (NSUUID *)v10;
}

- (NSUUID)stableBluetoothIdentifier
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A407D8();
    }
  }
  uint64_t v6 = *MEMORY[0x1E4F6AEC0];
  int64_t v7 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEC0]];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    v9 = [(NSDictionary *)self->_info objectForKey:v6];
    v10 = (void *)[v8 initWithUUIDString:v9];
  }
  else
  {
    v10 = 0;
  }

  return (NSUUID *)v10;
}

- (BOOL)supportsiCloudPairing
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40870();
    }
  }
  if ([(_IDSDevice *)self isDefaultPairedDevice]) {
    return 0;
  }
  if ([(_IDSDevice *)self supportsTethering]) {
    return 1;
  }
  return [(_IDSDevice *)self supportsHandoff];
}

- (BOOL)supportsTethering
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40908();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F6B218]];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)supportsHandoff
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A409A0();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F6B1F8]];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)supportsApplePay
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40A38();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F6B1F0]];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)supportsSMSRelay
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40AD0();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F6B210]];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)supportsMMSRelay
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40B68();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F6B200]];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)supportsPhoneCalls
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40C00();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F6B208]];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (int64_t)deviceType
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40C98();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F6B1C8]];
  unsigned int v8 = [v7 unsignedIntValue];

  if (v8)
  {
    int64_t v9 = v8;
  }
  else
  {
    v10 = [(_IDSDevice *)self productName];
    int64_t v9 = IDSDeviceTypeFromProductName();
  }
  return v9;
}

- (NSString)deviceColor
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40D30();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F6B1C0]];

  return (NSString *)v7;
}

- (NSString)enclosureColor
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40DC8();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA0]];
  int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F6B1D0]];

  return (NSString *)v7;
}

- (BOOL)isHSATrusted
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40E60();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE58]];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (NSData)pushToken
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40EF8();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AEA8]];

  return (NSData *)v6;
}

- (NSArray)identities
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A40F90();
    }
  }
  uint64_t v6 = [(NSDictionary *)self->_info objectForKey:*MEMORY[0x1E4F6AE40]];

  return (NSArray *)v6;
}

- (void)_addIdentity:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    char v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A41028();
    }
  }
  if (v4)
  {
    unsigned int v8 = [v4 objectForKey:@"uri"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int64_t v9 = [(_IDSDevice *)self identities];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
LABEL_8:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v13) objectForKey:@"uri"];
        char v15 = [v14 isEqualToIgnoringCase:v8];

        if (v15) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v11) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:

      uint64_t v16 = [(_IDSDevice *)self identities];
      int64_t v9 = (void *)[v16 mutableCopy];

      if (v9)
      {
        [v9 addObject:v4];
        info = self->_info;
        p_info = &self->_info;
        BOOL v19 = (NSDictionary *)[(NSDictionary *)info mutableCopy];
        [(NSDictionary *)v19 setObject:v9 forKey:*MEMORY[0x1E4F6AE40]];
      }
      else
      {
        uint64_t v20 = self->_info;
        p_info = &self->_info;
        BOOL v19 = (NSDictionary *)[(NSDictionary *)v20 mutableCopy];
        [(NSDictionary *)v19 removeObjectForKey:*MEMORY[0x1E4F6AE40]];
      }
      __int16 v21 = *p_info;
      *p_info = v19;
    }
  }
}

- (BOOL)isTinker
{
  return ((unint64_t)[(_IDSDevice *)self relationship] >> 1) & 1;
}

- (void)_nearbyStateChanged
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(_IDSDevice *)self isTinker])
  {
    int v3 = [(CUTWeakReference *)self->_account object];
    id v4 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(_IDSDevice *)self service];
      int v7 = 134218242;
      unsigned int v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Nearby triggering nearbyDevicesChanged on account %p %@", (uint8_t *)&v7, 0x16u);
    }
    int v6 = [v3 _internal];
    [v6 _callNearbyDevicesChanged];
  }
}

- (void)_connectedStateChanged
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(_IDSDevice *)self isTinker])
  {
    int v3 = [(CUTWeakReference *)self->_account object];
    id v4 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(_IDSDevice *)self service];
      int v7 = 134218242;
      unsigned int v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Connected triggering connectedDevicesChanged on account %p %@", (uint8_t *)&v7, 0x16u);
    }
    int v6 = [v3 _internal];
    [v6 _callConnectedDevicesChanged];
  }
}

- (void)_cloudConnectedStateChanged
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(_IDSDevice *)self isTinker])
  {
    int v3 = [(CUTWeakReference *)self->_account object];
    id v4 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(_IDSDevice *)self service];
      int v7 = 134218242;
      unsigned int v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Cloud connected triggering cloudConnectedDevicesChanged on service %p %@", (uint8_t *)&v7, 0x16u);
    }
    int v6 = [v3 _internal];
    [v6 _callCloudConnectedDevicesChanged];
  }
}

- (void)_stateChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(_IDSDevice *)self isTinker])
  {
    int v3 = [(CUTWeakReference *)self->_serviceReference object];
    id v4 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(_IDSDevice *)self service];
      int v6 = [(_IDSDevice *)self compactDescription];
      int v8 = 134218498;
      __int16 v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "State change triggering linkedDevicesChanged on service %p %@ for device: %@", (uint8_t *)&v8, 0x20u);
    }
    int v7 = [v3 _internal];
    [v7 _callLinkedDevicesChanged];
  }
}

- (void)_setAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A410C0();
    }
  }
  if (v4)
  {
    int v8 = [MEMORY[0x1E4F59E30] weakRefWithObject:v4];
    account = self->_account;
    self->_account = v8;
  }
}

- (void)_setService:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A41158();
    }
  }
  if (v4)
  {
    int v8 = [MEMORY[0x1E4F59E30] weakRefWithObject:v4];
    serviceReference = self->_serviceReference;
    self->_serviceReference = v8;
  }
}

- (IDSEndpointCapabilities)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_serviceReference, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

@end