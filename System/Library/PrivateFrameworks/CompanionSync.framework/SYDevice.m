@interface SYDevice
+ (NSSet)knownDevices;
+ (SYDevice)targetableDevice;
+ (id)deviceForIDSDevice:(id)a3;
+ (id)deviceForIDSDeviceID:(id)a3 fromList:(id)a4;
+ (id)deviceForNRDevice:(id)a3;
- (BOOL)cachedConnected;
- (BOOL)cachedIsNearby;
- (BOOL)hasCachedConnected;
- (BOOL)hasCachedNearby;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BOOL)isTargetable;
- (BOOL)supportsFileTransferMessageSend;
- (NRDevice)nrDevice;
- (NSDate)lastActiveDate;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)pairingStorePath;
- (NSString)systemBuildVersion;
- (NSString)systemVersion;
- (NSUUID)pairingID;
- (PBCodable)stateForLogging;
- (SYDevice)init;
- (SYDevice)initWithNRDevice:(id)a3;
- (id)findMatchingIDSDeviceFromList:(id)a3;
- (int64_t)deviceCode;
- (int64_t)state;
- (void)_updateCachedStateForProperty:(id)a3;
- (void)_updateStateFlagsPostingNotifications:(BOOL)a3;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)setCachedConnected:(BOOL)a3;
- (void)setCachedIsNearby:(BOOL)a3;
- (void)setHasCachedConnected:(BOOL)a3;
- (void)setHasCachedNearby:(BOOL)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SYDevice

+ (SYDevice)targetableDevice
{
  v2 = +[_SYDeviceMonitor sharedInstance];
  v3 = [v2 currentTargetableDevice];

  return (SYDevice *)v3;
}

+ (NSSet)knownDevices
{
  v2 = +[_SYDeviceMonitor sharedInstance];
  v3 = [v2 allDevices];

  return (NSSet *)v3;
}

+ (id)deviceForNRDevice:(id)a3
{
  id v3 = a3;
  v4 = +[_SYDeviceMonitor sharedInstance];
  v5 = [v4 deviceForNRDevice:v3];

  return v5;
}

+ (id)deviceForIDSDevice:(id)a3
{
  id v3 = (void *)MEMORY[0x263F57730];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  v6 = [v5 deviceForIDSDevice:v4];

  v7 = +[_SYDeviceMonitor sharedInstance];
  v8 = [v7 deviceForNRDevice:v6];

  return v8;
}

+ (id)deviceForIDSDeviceID:(id)a3 fromList:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:@"device:"])
  {
    v7 = [v5 substringFromIndex:7];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    v9 = (void *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "uniqueIDOverride", (void)v19);
          char v14 = [v13 isEqualToString:v7];

          if (v14)
          {
            v15 = [MEMORY[0x263F57730] sharedInstance];
            v16 = [v15 deviceForIDSDevice:v12];

            v17 = +[_SYDeviceMonitor sharedInstance];
            v9 = [v17 deviceForNRDevice:v16];

            goto LABEL_13;
          }
        }
        v9 = (void *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SYDevice)init
{
  return 0;
}

- (SYDevice)initWithNRDevice:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SYDevice;
  id v6 = [(SYDevice *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nrDevice, a3);
    uint64_t v8 = *MEMORY[0x263F57620];
    uint64_t v9 = [v5 valueForProperty:*MEMORY[0x263F57620]];
    pairingID = v7->_pairingID;
    v7->_pairingID = (NSUUID *)v9;

    nrDevice = v7->_nrDevice;
    uint64_t v12 = *MEMORY[0x263F575E8];
    v32[0] = v8;
    v32[1] = v12;
    uint64_t v13 = *MEMORY[0x263F575A8];
    v32[2] = *MEMORY[0x263F575C8];
    v32[3] = v13;
    uint64_t v15 = *MEMORY[0x263F57668];
    uint64_t v33 = *MEMORY[0x263F57560];
    uint64_t v14 = v33;
    uint64_t v34 = v15;
    uint64_t v17 = *MEMORY[0x263F575D8];
    uint64_t v35 = *MEMORY[0x263F57658];
    uint64_t v16 = v35;
    uint64_t v36 = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:8];
    [(NRDevice *)nrDevice addPropertyObserver:v7 forPropertyChanges:v18];

    [(SYDevice *)v7 _updateStateFlagsPostingNotifications:0];
    uint64_t v19 = [(NRDevice *)v7->_nrDevice valueForProperty:v12];
    pairingStorePath = v7->_pairingStorePath;
    v7->_pairingStorePath = (NSString *)v19;

    uint64_t v21 = [(NRDevice *)v7->_nrDevice valueForProperty:v17];
    lastActiveDate = v7->_lastActiveDate;
    v7->_lastActiveDate = (NSDate *)v21;

    uint64_t v23 = [(NRDevice *)v7->_nrDevice valueForProperty:v14];
    deviceClass = v7->_deviceClass;
    v7->_deviceClass = (NSString *)v23;

    uint64_t v25 = [(NRDevice *)v7->_nrDevice valueForProperty:v15];
    systemVersion = v7->_systemVersion;
    v7->_systemVersion = (NSString *)v25;

    uint64_t v27 = [(NRDevice *)v7->_nrDevice valueForProperty:v16];
    systemBuildVersion = v7->_systemBuildVersion;
    v7->_systemBuildVersion = (NSString *)v27;

    v29 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    pairingID = self->_pairingID;
    id v6 = [v4 pairingID];
    char v7 = [(NSUUID *)pairingID isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isTargetable
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (~LODWORD(v2->_state) & 0xBLL) == 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isPaired
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(SYDevice *)v2 state] & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isActive
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = ((unint64_t)[(SYDevice *)v2 state] >> 1) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)deviceCode
{
  v2 = [(SYDevice *)self deviceClass];
  int v3 = [v2 isEqualToString:@"Watch"];

  if (v3) {
    return 5;
  }
  else {
    return 2;
  }
}

- (BOOL)supportsFileTransferMessageSend
{
  int v3 = [(SYDevice *)self deviceClass];
  int v4 = [v3 isEqualToString:@"Watch"];

  id v5 = [(SYDevice *)self systemBuildVersion];
  id v6 = v5;
  if (v4) {
    char v7 = @"14S190";
  }
  else {
    char v7 = @"14A194";
  }
  uint64_t v8 = [v5 compare:v7];

  return v8 != -1;
}

- (id)findMatchingIDSDeviceFromList:(id)a3
{
  int v4 = (void *)MEMORY[0x263F57730];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  char v7 = [v6 deviceForNRDevice:self->_nrDevice fromIDSDevices:v5];

  return v7;
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 valueForProperty:v9];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v12 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543874;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "NRDevice property changed: %{public}@, %@ -> %@", (uint8_t *)&v21, 0x20u);
  }
  [(SYDevice *)self _updateCachedStateForProperty:v9];
  uint64_t v13 = *MEMORY[0x263F57620];
  if ([v9 isEqualToString:*MEMORY[0x263F57620]])
  {
    uint64_t v14 = [v8 valueForProperty:v13];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = (NSUUID *)[v14 copy];
      pairingID = self->_pairingID;
      self->_pairingID = v16;

      v18 = [MEMORY[0x263F08A00] defaultCenter];
      [v18 postNotificationName:@"SYDevicePairingIDChangedNotification" object:self];
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      long long v20 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_21C7C9000, v20, OS_LOG_TYPE_DEFAULT, "Disregarding NR attempt to zap pairing ID", (uint8_t *)&v21, 2u);
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (_StateAffectingPropertyKeys_onceToken != -1) {
    dispatch_once(&_StateAffectingPropertyKeys_onceToken, &__block_literal_global_225);
  }
  if ([(id)_StateAffectingPropertyKeys___set containsObject:v9])
  {
    [(SYDevice *)self _updateStateFlagsPostingNotifications:1];
  }
  else
  {
    if (_OSInfoAffectingPropertyKeys_onceToken != -1) {
      dispatch_once(&_OSInfoAffectingPropertyKeys_onceToken, &__block_literal_global_228);
    }
    if ([(id)_OSInfoAffectingPropertyKeys___set containsObject:v9])
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v19 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_21C7C9000, v19, OS_LOG_TYPE_DEFAULT, "Posting SYDeviceOSInfoChangedNotification", (uint8_t *)&v21, 2u);
      }
      uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
      [v15 postNotificationName:@"SYDeviceOSInfoChangedNotification" object:self];
      goto LABEL_24;
    }
  }
LABEL_25:
}

- (void)_updateCachedStateForProperty:(id)a3
{
  id v10 = a3;
  if ([v10 isEqualToString:*MEMORY[0x263F575E8]])
  {
    int v4 = [(NRDevice *)self->_nrDevice valueForProperty:v10];
    pairingStorePath = (NSDate *)self->_pairingStorePath;
    self->_pairingStorePath = v4;
  }
  else if ([v10 isEqualToString:*MEMORY[0x263F575D8]])
  {
    id v6 = [(NRDevice *)self->_nrDevice valueForProperty:v10];
    pairingStorePath = self->_lastActiveDate;
    self->_lastActiveDate = v6;
  }
  else if ([v10 isEqualToString:*MEMORY[0x263F57560]])
  {
    char v7 = [(NRDevice *)self->_nrDevice valueForProperty:v10];
    pairingStorePath = (NSDate *)self->_deviceClass;
    self->_deviceClass = v7;
  }
  else if ([v10 isEqualToString:*MEMORY[0x263F57668]])
  {
    id v8 = [(NRDevice *)self->_nrDevice valueForProperty:v10];
    pairingStorePath = (NSDate *)self->_systemVersion;
    self->_systemVersion = v8;
  }
  else
  {
    if (![v10 isEqualToString:*MEMORY[0x263F57658]]) {
      goto LABEL_12;
    }
    id v9 = [(NRDevice *)self->_nrDevice valueForProperty:v10];
    pairingStorePath = (NSDate *)self->_systemBuildVersion;
    self->_systemBuildVersion = v9;
  }

LABEL_12:
}

- (void)_updateStateFlagsPostingNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v4 = self;
  objc_sync_enter(v4);
  int64_t state = v4->_state;
  id v6 = [(NRDevice *)v4->_nrDevice valueForProperty:*MEMORY[0x263F575C8]];
  unsigned int v7 = [v6 BOOLValue];

  v4->_int64_t state = v4->_state & 0xFFFFFFFFFFFFFFFELL | v7;
  id v8 = [(NRDevice *)v4->_nrDevice valueForProperty:*MEMORY[0x263F575A8]];
  int v9 = [v8 BOOLValue];

  uint64_t v10 = 2;
  if (!v9) {
    uint64_t v10 = 0;
  }
  v4->_int64_t state = v4->_state & 0xFFFFFFFFFFFFFFFDLL | v10;
  v11 = [(NRDevice *)v4->_nrDevice valueForProperty:*MEMORY[0x263F575E8]];
  BOOL v12 = [v11 length] != 0;

  unint64_t v13 = v4->_state & 0xFFFFFFFFFFFFFFF7 | (8 * v12);
  v4->_int64_t state = v13;
  objc_sync_exit(v4);

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v14 = (void *)_sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    pairingID = v4->_pairingID;
    uint64_t v16 = v14;
    uint64_t v17 = [(NSUUID *)pairingID UUIDString];
    int64_t v18 = v4->_state;
    int v30 = 138543618;
    uint64_t v31 = (uint64_t)v17;
    __int16 v32 = 1024;
    LODWORD(v33) = v18;
    _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "Device %{public}@ state changed: %{companionsync:SYDeviceState}d", (uint8_t *)&v30, 0x12u);
  }
  if (v3)
  {
    uint64_t v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 postNotificationName:@"SYDeviceStateChangedNotification" object:v4];
  }
  int64_t v20 = state & 0xB;
  unint64_t v21 = v13 & 0xB;
  if ((v20 != 11) == (v21 == 11))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v22 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = v4->_pairingID;
      id v24 = v22;
      uint64_t v25 = [(NSUUID *)v23 UUIDString];
      v26 = (void *)v25;
      uint64_t v27 = "un";
      if (v21 == 11) {
        uint64_t v27 = "";
      }
      int v30 = 138543618;
      uint64_t v31 = v25;
      __int16 v32 = 2080;
      uint64_t v33 = v27;
      _os_log_impl(&dword_21C7C9000, v24, OS_LOG_TYPE_DEFAULT, "Device %{public}@ became %stargetable", (uint8_t *)&v30, 0x16u);
    }
    if (v3)
    {
      v28 = [MEMORY[0x263F08A00] defaultCenter];
      [v28 postNotificationName:@"SYDeviceTargetabilityChangedNotification" object:v4];

      if (v21 == 11)
      {
        v29 = +[_SYDeviceMonitor sharedInstance];
        [v29 deviceBecameTargetable:v4];
      }
    }
  }
}

- (NSString)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYDevice;
  int v4 = [(SYDevice *)&v8 description];
  id v5 = [(NSUUID *)self->_pairingID UUIDString];
  id v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  BOOL v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)SYDevice;
  int v4 = [(SYDevice *)&v14 debugDescription];
  id v5 = [(NSUUID *)self->_pairingID UUIDString];
  id v6 = [(SYDevice *)self pairingStorePath];
  if ([(SYDevice *)self isPaired]) {
    unsigned int v7 = "YES";
  }
  else {
    unsigned int v7 = "NO";
  }
  if ([(SYDevice *)self isActive]) {
    objc_super v8 = "YES";
  }
  else {
    objc_super v8 = "NO";
  }
  int v9 = [(SYDevice *)self deviceClass];
  uint64_t v10 = [(SYDevice *)self systemVersion];
  v11 = [(SYDevice *)self systemBuildVersion];
  BOOL v12 = [v3 stringWithFormat:@"%@: %@ (%@). Paired=%s, Active=%s. Class='%@', Version='%@', Build='%@'.", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (PBCodable)stateForLogging
{
  BOOL v3 = objc_opt_new();
  int v4 = [(SYDevice *)self pairingID];
  id v5 = [v4 UUIDString];
  [v3 setIdentifier:v5];

  objc_msgSend(v3, "setState:", -[SYDevice state](self, "state"));
  id v6 = [(SYDevice *)self deviceClass];
  [v3 setDeviceClass:v6];

  unsigned int v7 = [(SYDevice *)self systemBuildVersion];
  [v3 setBuildVersion:v7];

  return (PBCodable *)v3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSString)pairingStorePath
{
  return self->_pairingStorePath;
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (NSDate)lastActiveDate
{
  return self->_lastActiveDate;
}

- (BOOL)hasCachedNearby
{
  return self->_hasCachedNearby;
}

- (void)setHasCachedNearby:(BOOL)a3
{
  self->_hasCachedNearby = a3;
}

- (BOOL)cachedIsNearby
{
  return self->_cachedIsNearby;
}

- (void)setCachedIsNearby:(BOOL)a3
{
  self->_cachedIsNearby = a3;
}

- (BOOL)hasCachedConnected
{
  return self->_hasCachedConnected;
}

- (void)setHasCachedConnected:(BOOL)a3
{
  self->_hasCachedConnected = a3;
}

- (BOOL)cachedConnected
{
  return self->_cachedConnected;
}

- (void)setCachedConnected:(BOOL)a3
{
  self->_cachedConnected = a3;
}

- (NRDevice)nrDevice
{
  return self->_nrDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveDate, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_pairingStorePath, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_nrDevice, 0);
}

@end