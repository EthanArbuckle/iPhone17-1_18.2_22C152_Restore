@interface HMDResidentDevice
+ (BOOL)supportsSecureCoding;
+ (id)batteryStateAsString:(int64_t)a3;
+ (id)deriveUUIDFromHomeUUID:(id)a3 deviceUUID:(id)a4;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)_updateMessageAddress:(id)a3;
- (BOOL)_updateRawCapabilities:(id)a3;
- (BOOL)isConfirmed;
- (BOOL)isCurrentDevice;
- (BOOL)isDeviceEquivalentToDeviceAddress:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowBattery;
- (BOOL)isReachable;
- (BOOL)isReachableByIDS;
- (BOOL)supportsCustomMediaApplicationDestination;
- (BOOL)supportsFirmwareUpdate;
- (BOOL)supportsMediaActions;
- (BOOL)supportsMediaSystem;
- (BOOL)supportsNativeMatter;
- (BOOL)supportsResidentFirmwareUpdate;
- (BOOL)supportsResidentSelection;
- (BOOL)supportsSharedEventTriggerActivation;
- (BOOL)supportsShortcutActions;
- (HMDDevice)device;
- (HMDDeviceAddress)messageAddress;
- (HMDHome)home;
- (HMDResidentDevice)initWithCoder:(id)a3;
- (HMDResidentDevice)initWithDevice:(id)a3 home:(id)a4;
- (HMDResidentDevice)initWithDevice:(id)a3 home:(id)a4 name:(id)a5 rawCapabilities:(id)a6 messageAddress:(id)a7 deviceIRKData:(id)a8;
- (HMDResidentDevice)initWithDevice:(id)a3 identifier:(id)a4;
- (HMDResidentDevice)initWithDeviceController:(id)a3 identifier:(id)a4;
- (HMDResidentDevice)initWithModel:(id)a3;
- (HMDResidentDeviceManager)residentDeviceManager;
- (HMResidentCapabilities)capabilitiesInternal;
- (NSData)deviceIRKData;
- (NSData)rawCapabilities;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (NSUUID)identifier;
- (id)appleMediaAccessoryName;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)deviceController;
- (id)dumpState;
- (id)logIdentifier;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)privateDescription;
- (id)runtimeState;
- (id)shortDescription;
- (int64_t)batteryState;
- (unint64_t)hash;
- (unint64_t)legacyResidentCapabilities;
- (unint64_t)productType;
- (unint64_t)productTypeForModelIdentifier:(id)a3;
- (unint64_t)status;
- (void)__deviceUpdated:(id)a3;
- (void)_handleResidentDeviceUpdateConfirmed:(BOOL)a3;
- (void)_handleResidentDeviceUpdateEnabled:(BOOL)a3;
- (void)_residentDeviceModelUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)configureWithHome:(id)a3;
- (void)dealloc;
- (void)deviceController:(id)a3 didUpdateDevice:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryState:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLowBattery:(BOOL)a3;
- (void)setReachable:(BOOL)a3;
- (void)setReachableByIDS:(BOOL)a3;
- (void)setResidentDeviceManager:(id)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateDeviceIRKData:(id)a3;
@end

@implementation HMDResidentDevice

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_residentDeviceManager);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceIRKData, 0);
  objc_storeStrong((id *)&self->_messageAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_capabilitiesInternal, 0);
  objc_storeStrong((id *)&self->_rawCapabilities, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setResidentDeviceManager:(id)a3
{
}

- (void)setHome:(id)a3
{
}

- (void)setLowBattery:(BOOL)a3
{
  self->_lowBattery = a3;
}

- (BOOL)isLowBattery
{
  return self->_lowBattery;
}

- (void)setBatteryState:(int64_t)a3
{
  self->_batteryState = a3;
}

- (int64_t)batteryState
{
  return self->_batteryState;
}

- (void)setReachableByIDS:(BOOL)a3
{
  self->_reachableByIDS = a3;
}

- (BOOL)isReachableByIDS
{
  return self->_reachableByIDS;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  v4 = [(HMDResidentDevice *)self identifier];
  [v14 encodeObject:v4 forKey:@"HM.identifier"];

  v5 = [(HMDResidentDevice *)self home];
  [v14 encodeConditionalObject:v5 forKey:@"home"];

  v6 = [(HMDResidentDevice *)self device];
  [v14 encodeObject:v6 forKey:*MEMORY[0x263F0D520]];

  objc_msgSend(v14, "encodeBool:forKey:", -[HMDResidentDevice isEnabled](self, "isEnabled"), @"HM.enabled");
  if (objc_msgSend(v14, "hmd_isForXPCTransport"))
  {
    v7 = [(HMDResidentDevice *)self name];
    [v14 encodeObject:v7 forKey:@"HM.name"];

    objc_msgSend(v14, "encodeInteger:forKey:", -[HMDResidentDevice status](self, "status"), @"HM.status");
    objc_msgSend(v14, "encodeInteger:forKey:", -[HMDResidentDevice legacyResidentCapabilities](self, "legacyResidentCapabilities"), @"HM.capabilities");
    BOOL v8 = [(HMDResidentDevice *)self supportsResidentSelection];
    [v14 encodeBool:v8 forKey:*MEMORY[0x263F0D540]];
    if (objc_msgSend(v14, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      v9 = [(HMDResidentDevice *)self device];
      v10 = [v9 idsIdentifier];
      [v14 encodeObject:v10 forKey:@"HM.accountIdentifier"];

      v11 = [(HMDResidentDevice *)self device];
      v12 = [v11 remoteDestinationString];
      [v14 encodeObject:v12 forKey:*MEMORY[0x263F0C640]];

      v13 = [(HMDResidentDevice *)self deviceIRKData];
      [v14 encodeObject:v13 forKey:*MEMORY[0x263F0D528]];
    }
  }
  else
  {
    objc_msgSend(v14, "encodeBool:forKey:", -[HMDResidentDevice isConfirmed](self, "isConfirmed"), @"HM.confirmed");
  }
}

- (HMDResidentDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0D520]];
  v6 = [MEMORY[0x263F08C38] UUID];
  v7 = [(HMDResidentDevice *)self initWithDevice:v5 identifier:v6];

  if (v7)
  {
    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    objc_storeWeak((id *)&v7->_home, v8);

    if ([v4 containsValueForKey:@"HM.identifier"])
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
      identifier = v7->_identifier;
      v7->_identifier = (NSUUID *)v9;
    }
    if ([v4 containsValueForKey:@"HM.enabled"]) {
      v7->_enabled = [v4 decodeBoolForKey:@"HM.enabled"];
    }
    v7->_confirmed = [v4 decodeBoolForKey:@"HM.confirmed"];
  }

  return v7;
}

- (id)logIdentifier
{
  v2 = [(HMDResidentDevice *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)dumpState
{
  v17 = NSString;
  v16 = [(HMDResidentDevice *)self name];
  v19 = [(HMDResidentDevice *)self device];
  v18 = [v19 identifier];
  v20 = [v18 UUIDString];
  [(HMDResidentDevice *)self isEnabled];
  v15 = HMFBooleanToString();
  [(HMDResidentDevice *)self isConfirmed];
  id v14 = HMFBooleanToString();
  [(HMDResidentDevice *)self isReachable];
  v3 = HMFBooleanToString();
  [(HMDResidentDevice *)self isReachableByIDS];
  id v4 = HMFBooleanToString();
  v5 = +[HMDResidentDevice batteryStateAsString:[(HMDResidentDevice *)self batteryState]];
  v6 = [(HMDResidentDevice *)self deviceIRKData];
  v7 = [(HMDResidentDevice *)self device];
  BOOL v8 = [v7 idsIdentifier];
  uint64_t v9 = [(HMDResidentDevice *)self device];
  v10 = [v9 remoteDestinationString];
  v11 = [v17 stringWithFormat:@"name: %@, uuid: %@, isEnabled: %@, isConfirmed: %@, isReachable: %@, isReachableByIDS: %@, batteryState: %@, deviceIRKData: %@, idsIdentifier: %@, idsDestination: %@", v16, v20, v15, v14, v3, v4, v5, v6, v8, v10];

  v12 = [NSDictionary dictionaryWithObject:v11 forKey:*MEMORY[0x263F41FA8]];

  return v12;
}

- (void)deviceController:(id)a3 didUpdateDevice:(id)a4
{
}

- (void)updateDeviceIRKData:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  if ([(NSData *)self->_deviceIRKData isEqualToData:v8])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_deviceIRKData, a3);
    os_unfair_lock_unlock(&self->_lock);
    v5 = [(HMDResidentDevice *)self home];
    v6 = [v5 homeManager];
    v7 = [(HMDResidentDevice *)self identifier];
    [v6 updateGenerationCounterWithReason:@"Device IRK Data Updated" sourceUUID:v7 shouldNotifyClients:1];
  }
}

- (NSData)deviceIRKData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_deviceIRKData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)_updateMessageAddress:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  BOOL v6 = [(HMDDeviceAddress *)self->_messageAddress isEqual:v5];
  if (v6)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_messageAddress, a3);
    os_unfair_lock_unlock(&self->_lock);
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Updated device message address to %@", buf, 0x16u);
    }
    v11 = [(HMDResidentDevice *)v8 messageAddress];
    v15[1] = @"HMDResidentDeviceResidentNotificationKey";
    v16[0] = v11;
    v16[1] = v8;
    v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:@"HMDResidentDeviceAddressChangedNotification" object:v8 userInfo:v12];
  }
  return !v6;
}

- (HMDDeviceAddress)messageAddress
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_messageAddress;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)_updateRawCapabilities:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F0E6C0]) initWithProtoData:v5];
  os_unfair_lock_lock_with_options();
  if (!v5 || self->_rawCapabilities) && ([v6 isEqual:self->_capabilitiesInternal])
  {
    os_unfair_lock_unlock(&self->_lock);
    BOOL v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_rawCapabilities, a3);
    id v8 = (HMResidentCapabilities *)[objc_alloc(MEMORY[0x263F0E6C0]) initWithProtoData:v5];
    capabilitiesInternal = self->_capabilitiesInternal;
    self->_capabilitiesInternal = v8;

    os_unfair_lock_unlock(&self->_lock);
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v13;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updated resident capabilities to %@", buf, 0x16u);
    }
    id v14 = [(HMDResidentDevice *)v11 home];
    v15 = [v14 homeManager];
    v16 = [(HMDResidentDevice *)v11 identifier];
    [v15 updateGenerationCounterWithReason:@"Resident Capabilities Updated" sourceUUID:v16 shouldNotifyClients:1];

    if (v6)
    {
      v17 = [MEMORY[0x263F08A00] defaultCenter];
      v18 = [(HMDResidentDevice *)v11 identifier];
      v21[1] = @"residentCapabilities";
      v22[0] = v18;
      v22[1] = v6;
      __int16 v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      [v17 postNotificationName:@"HMDResidentDeviceCapabilitiesUpdatedNotification" object:v11 userInfo:v19];
    }
    BOOL v7 = 1;
  }

  return v7;
}

- (NSData)rawCapabilities
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_rawCapabilities;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMResidentCapabilities)capabilitiesInternal
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_capabilitiesInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  BOOL v7 = [HMDResidentDeviceModel alloc];
  id v8 = [(HMDResidentDevice *)self identifier];
  uint64_t v9 = [(HMDResidentDevice *)self home];
  v10 = [v9 uuid];
  v11 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:a3 uuid:v8 parentUUID:v10];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
  [(HMDResidentDeviceModel *)v11 setEnabled:v12];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDResidentDevice isConfirmed](self, "isConfirmed"));
  [(HMDResidentDeviceModel *)v11 setConfirmed:v13];

  id v14 = [(HMDResidentDevice *)self rawCapabilities];
  [(HMDResidentDeviceModel *)v11 setResidentCapabilities:v14];

  v15 = [(HMDResidentDevice *)self device];
  v16 = [v15 version];
  v17 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"4.0"];
  LODWORD(v10) = [v16 isAtLeastVersion:v17];

  isWatch();
  v18 = [(HMDResidentDevice *)self home];
  int v19 = [v18 isOwnerUser];

  if (!v10
    || ((char v20 = [v15 isCurrentDevice], a4 > 3) ? (v21 = v20) : (v21 = 0), (v21 & 1) != 0 || v19 != 1))
  {
    v22 = [v15 identifier];
    v23 = [v22 UUIDString];
    [(HMDResidentDeviceModel *)v11 setDeviceUUID:v23];

    if ((v19 & 1) != 0 || !self->_device)
    {
      [(HMDResidentDeviceModel *)v11 setDevice:v15];
    }
    else
    {
      -[HMDResidentDeviceModel setDevice:](v11, "setDevice:");
      device = self->_device;
      self->_device = 0;
    }
  }

  return v11;
}

- (void)_handleResidentDeviceUpdateConfirmed:(BOOL)a3
{
  int v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int confirmed = self->_confirmed;
  self->_int confirmed = v3;
  os_unfair_lock_unlock(p_lock);
  if (confirmed != v3)
  {
    BOOL v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      __int16 v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of resident device confirmed state changing to %{public}@", buf, 0x16u);
    }
    v12 = [(HMDResidentDevice *)v8 home];
    v13 = [v12 uuid];
    v19[1] = @"HMDResidentDeviceResidentNotificationKey";
    v20[0] = v13;
    v20[1] = v8;
    id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 postNotificationName:@"HMDResidentDeviceConfirmedStateChangedNotification" object:v8 userInfo:v14];

    if ((v3 & 1) == 0)
    {
      v16 = [(HMDResidentDevice *)v8 device];
      int v17 = [v16 isCurrentDevice];

      if (v17)
      {
        v18 = [(HMDResidentDevice *)v8 residentDeviceManager];
        [v18 confirmAsResident];
      }
    }
  }
}

- (void)_handleResidentDeviceUpdateEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(HMDResidentDevice *)self isEnabled] != a3)
  {
    [(HMDResidentDevice *)self setEnabled:v3];
    id v5 = [(HMDResidentDevice *)self residentDeviceManager];
    [v5 updateResidentAvailability];
    BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"HMDResidentDeviceEnabledStateChangedNotification" object:self];

    BOOL v7 = [(HMDResidentDevice *)self home];
    id v8 = [v5 primaryResidentDevice];
    uint64_t v9 = [v8 device];
    int v10 = [v9 isCurrentDevice];

    if (v10)
    {
      BOOL v11 = [(HMDResidentDevice *)self isEnabled];
      v12 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      id v14 = HMFGetOSLogHandle();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v15)
        {
          v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v30 = v16;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations with resident due to primary resident enabled", buf, 0xCu);
        }
        int v17 = [(HMDResidentDevice *)v13 device];
        v28 = v17;
        v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
        [v7 enableNotificationsForDevices:v18];
      }
      else
      {
        if (v15)
        {
          int v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v30 = v19;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations resident due to primary resident disabled", buf, 0xCu);
        }
        int v17 = [(HMDResidentDevice *)v13 device];
        uint64_t v27 = v17;
        v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
        [v7 disableNotificationsForDevices:v18];
      }
    }
    char v20 = [v5 primaryResidentUUID];
    char v21 = v20;
    if (v3)
    {
      if (v20)
      {

        v22 = [(HMDResidentDevice *)self device];
        int v23 = [v22 isCurrentDevice];

        if (v23) {
          [v5 confirmOnAvailability];
        }
        goto LABEL_19;
      }
      uint64_t v26 = 3;
    }
    else
    {
      v24 = [(HMDResidentDevice *)self identifier];
      int v25 = [v21 isEqual:v24];

      if (!v25)
      {
LABEL_19:

        return;
      }
      uint64_t v26 = 4;
    }
    [v5 electResidentDevice:v26];
    goto LABEL_19;
  }
}

- (void)_residentDeviceModelUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v89 = a5;
  int v10 = [v89 transactionResult];
  BOOL v11 = [(HMDResidentDevice *)self device];
  int v12 = [v11 isCurrentDevice];

  if (v12) {
    BOOL v13 = ([v10 source] & 0xFFFFFFFFFFFFFFFELL) == 2;
  }
  else {
    BOOL v13 = 0;
  }
  id v14 = [(HMDResidentDevice *)self device];

  if (v14)
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    BOOL v15 = [(HMDResidentDevice *)self device];
    v16 = [v15 backingStoreObjectsWithChangeType:0 version:4];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v98 objects:v111 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v99 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v98 + 1) + 8 * i) dumpDebug:@"LOCAL: "];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v98 objects:v111 count:16];
      }
      while (v18);
    }
  }
  char v21 = [v9 device];

  if (v21)
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v22 = [v9 device];
    int v23 = [v22 backingStoreObjectsWithChangeType:0 version:4];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v94 objects:v110 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v95;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v95 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v94 + 1) + 8 * j) dumpDebug:@"REMOTE: "];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v94 objects:v110 count:16];
      }
      while (v25);
    }
  }
  v28 = [v9 deviceUUID];

  v90 = v10;
  if (v28)
  {
    id v29 = objc_alloc(MEMORY[0x263F08C38]);
    v30 = [v9 deviceUUID];
    uint64_t v31 = (void *)[v29 initWithUUIDString:v30];

    v32 = [(HMDResidentDevice *)self deviceController];
    v33 = [v32 identifier];
    char v34 = objc_msgSend(v31, "hmf_isEqualToUUID:", v33);

    if ((v34 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x230FBD990]();
      v36 = self;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v39 = id v38 = v8;
        v40 = [v31 UUIDString];
        *(_DWORD *)buf = 138543618;
        v105 = v39;
        __int16 v106 = 2112;
        v107 = v40;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Updating the underlying device with identifier: %@", buf, 0x16u);

        id v8 = v38;
      }

      v41 = +[HMDDeviceController placeholderDeviceControllerWithIdentifier:v31];
      os_unfair_lock_lock_with_options();
      deviceController = v36->_deviceController;
      v36->_deviceController = v41;
      v43 = v41;

      os_unfair_lock_unlock(&v36->_lock);
      [(HMDDeviceController *)v43 setDelegate:v36];
      v44 = [(HMDDeviceController *)v43 device];

      __handleUpdatedDevice(v36, v44);
      [v90 markChanged];
    }

    int v10 = v90;
  }
  uint64_t v45 = [v9 device];
  if (!v45) {
    goto LABEL_30;
  }
  v46 = (void *)v45;
  v47 = [(HMDResidentDevice *)self device];
  v48 = [v9 device];
  char v49 = [v47 isBackingStorageEqual:v48];

  if ((v49 & 1) == 0)
  {
    if (v13)
    {
      v56 = (void *)MEMORY[0x230FBD990]();
      v57 = self;
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = HMFGetLogIdentifier();
        v60 = [(HMDResidentDevice *)v57 device];
        [v9 device];
        v62 = id v61 = v8;
        *(_DWORD *)buf = 138543874;
        v105 = v59;
        __int16 v106 = 2112;
        v107 = v60;
        __int16 v108 = 2112;
        v109 = v62;
        _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Cloud changed our device, preferring local device -- local: %@, cloud :%@", buf, 0x20u);

        id v8 = v61;
        int v10 = v90;
      }
      BOOL v13 = 1;
    }
    else
    {
      v86 = [(HMDResidentDevice *)self deviceController];
      v87 = [v9 device];
      [v86 updateWithDevice:v87 completionHandler:0];
    }
  }
  else
  {
LABEL_30:
    BOOL v13 = 0;
  }
  v50 = [v9 enabled];
  if (v50)
  {
    int v51 = [(HMDResidentDevice *)self isEnabled];
    v52 = [v9 enabled];
    int v53 = [v52 BOOLValue];

    if (v51 == v53)
    {
      v50 = 0;
    }
    else
    {
      [v10 markChanged];
      v54 = [v9 enabled];
      -[HMDResidentDevice _handleResidentDeviceUpdateEnabled:](self, "_handleResidentDeviceUpdateEnabled:", [v54 BOOLValue]);

      v102 = @"kEnabledKey";
      v55 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
      v103 = v55;
      v50 = [NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    }
  }
  uint64_t v63 = [v9 confirmed];
  if (v63)
  {
    v64 = (void *)v63;
    int v65 = [(HMDResidentDevice *)self isConfirmed];
    v66 = [v9 confirmed];
    int v67 = [v66 BOOLValue];

    BOOL v68 = v65 == v67;
    int v10 = v90;
    if (!v68)
    {
      [v90 markChanged];
      v69 = [v9 confirmed];
      -[HMDResidentDevice _handleResidentDeviceUpdateConfirmed:](self, "_handleResidentDeviceUpdateConfirmed:", [v69 BOOLValue]);
    }
  }
  v70 = [v9 residentCapabilities];

  if (v70)
  {
    v71 = [v9 residentCapabilities];
    [(HMDResidentDevice *)self _updateRawCapabilities:v71];
  }
  if ([v10 changed])
  {
    v72 = [(HMDResidentDevice *)self residentDeviceManager];
    [v72 notifyClientsOfUpdatedResidentDevice:self];
  }
  v73 = [(HMDResidentDevice *)self home];
  if (v13)
  {
    id v88 = v8;
    v74 = (void *)MEMORY[0x230FBD990]([v10 markChanged]);
    v75 = self;
    v76 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      v77 = HMFGetLogIdentifier();
      v78 = [(HMDResidentDevice *)v75 device];
      *(_DWORD *)buf = 138543618;
      v105 = v77;
      __int16 v106 = 2112;
      v107 = v78;
      _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_INFO, "%{public}@Pushing back with current device: %@", buf, 0x16u);
    }
    v79 = [(HMDResidentDevice *)v75 modelObjectWithChangeType:2 version:4];
    v80 = [v73 backingStore];
    v81 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    v82 = [v80 transaction:@"residentUpdated" options:v81];

    [v82 add:v79];
    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke;
    v92[3] = &unk_264A2F3E8;
    id v93 = v73;
    [v82 save:v92];

    id v8 = v88;
    int v10 = v90;
  }
  v83 = [v73 backingStore];
  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke_2;
  v91[3] = &unk_264A2F3E8;
  v91[4] = self;
  [v83 submitBlock:v91];

  v84 = [v89 responseHandler];

  if (v84)
  {
    v85 = [v89 responseHandler];
    ((void (**)(void, void, void *))v85)[2](v85, 0, v50);
  }
}

uint64_t __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveWithReason:@"residentUpdated" information:0 postSyncNotification:0 objectChange:1];
}

void __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) residentDeviceManager];
  [v1 run];
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v12;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (v9)
  {
    [(HMDResidentDevice *)self _residentDeviceModelUpdated:0 newValues:v9 message:v7];
  }
  else
  {
    uint64_t v10 = [v7 responseHandler];

    BOOL v11 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);

    id v7 = (id)v10;
  }
}

- (id)appleMediaAccessoryName
{
  BOOL v3 = [(HMDResidentDevice *)self home];
  id v4 = [v3 appleMediaAccessories];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__HMDResidentDevice_appleMediaAccessoryName__block_invoke;
  v8[3] = &unk_264A2E3A0;
  v8[4] = self;
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v8);

  BOOL v6 = [v5 name];

  return v6;
}

uint64_t __44__HMDResidentDevice_appleMediaAccessoryName__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 device];
  id v5 = [v4 idsIdentifier];
  BOOL v6 = [v3 idsIdentifier];

  uint64_t v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

- (unint64_t)productTypeForModelIdentifier:(id)a3
{
  id v3 = a3;
  if (productTypeForModelIdentifier__onceToken != -1) {
    dispatch_once(&productTypeForModelIdentifier__onceToken, &__block_literal_global_150438);
  }
  unint64_t v4 = [(id)productTypeForModelIdentifier__modelIdentifierToProductTypeMap objectForKeyedSubscript:v3];

  if (v4)
  {
    id v5 = [(id)productTypeForModelIdentifier__modelIdentifierToProductTypeMap objectForKeyedSubscript:v3];
    unint64_t v4 = [v5 unsignedIntValue];
  }
  return v4;
}

void __51__HMDResidentDevice_productTypeForModelIdentifier___block_invoke()
{
  v3[9] = *MEMORY[0x263EF8340];
  v2[0] = @"AppleTV5,3";
  v2[1] = @"AppleTV6,2";
  v3[0] = &unk_26E4721C0;
  v3[1] = &unk_26E4721D8;
  v2[2] = @"AppleTV14,1";
  v2[3] = @"AppleTV14,1";
  v3[2] = &unk_26E4721F0;
  v3[3] = &unk_26E472208;
  v2[4] = @"AppleTV11,1";
  v2[5] = @"AudioAccessory1,2";
  v3[4] = &unk_26E472220;
  v3[5] = &unk_26E472238;
  v2[6] = @"AudioAccessory1,1";
  v2[7] = @"AudioAccessory5,1";
  v3[6] = &unk_26E472250;
  v3[7] = &unk_26E472268;
  v2[8] = @"AudioAccessory6,1";
  v3[8] = &unk_26E472280;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:9];
  id v1 = (void *)productTypeForModelIdentifier__modelIdentifierToProductTypeMap;
  productTypeForModelIdentifier__modelIdentifierToProductTypeMap = v0;
}

- (void)__deviceUpdated:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HMDResidentDevice *)self device];

  if (v7 == v8)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      BOOL v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification device was updated", (uint8_t *)&v14, 0xCu);
    }
    BOOL v13 = [(HMDResidentDevice *)v10 residentDeviceManager];
    [v13 notifyClientsOfUpdatedResidentDevice:v10];
  }
}

- (id)deviceController
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_deviceController;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDDevice)device
{
  v2 = [(HMDResidentDevice *)self deviceController];
  id v3 = [v2 device];

  return (HMDDevice *)v3;
}

- (BOOL)isCurrentDevice
{
  v2 = [(HMDResidentDevice *)self device];
  char v3 = [v2 isCurrentDevice];

  return v3;
}

- (id)runtimeState
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = *MEMORY[0x263F0D530];
  char v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
  v10[0] = v3;
  v9[1] = *MEMORY[0x263F0D538];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDResidentDevice status](self, "status"));
  v10[1] = v4;
  v9[2] = *MEMORY[0x263F0D518];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDResidentDevice legacyResidentCapabilities](self, "legacyResidentCapabilities"));
  v10[2] = v5;
  v9[3] = *MEMORY[0x263F0D548];
  BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDResidentDevice supportsResidentSelection](self, "supportsResidentSelection"));
  v10[3] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (BOOL)supportsNativeMatter
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  char v3 = [v2 supportsNativeMatter];

  return v3;
}

- (BOOL)supportsResidentSelection
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  char v3 = [v2 supportsResidentSelection];

  return v3;
}

- (BOOL)supportsCustomMediaApplicationDestination
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  unint64_t v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 24) & 1;
}

- (BOOL)supportsResidentFirmwareUpdate
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  unint64_t v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 23) & 1;
}

- (BOOL)supportsFirmwareUpdate
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  unint64_t v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 11) & 1;
}

- (BOOL)supportsShortcutActions
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  unint64_t v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 8) & 1;
}

- (BOOL)supportsMediaActions
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  unint64_t v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 9) & 1;
}

- (BOOL)supportsMediaSystem
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  unint64_t v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 4) & 1;
}

- (unint64_t)productType
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(HMDResidentDevice *)self isCurrentDevice])
  {
    unint64_t v3 = [(HMDResidentDevice *)self device];
    id v4 = [v3 productInfo];
  }
  else
  {
    unint64_t v3 = +[HMDAppleAccountManager sharedManager];
    id v5 = [(HMDResidentDevice *)self device];
    BOOL v6 = [v5 idsIdentifier];
    id v4 = [v3 idsDeviceForIDSIdentifier:v6];
  }
  id v7 = [v4 modelIdentifier];

  if (v7)
  {
    unint64_t v8 = [(HMDResidentDevice *)self productTypeForModelIdentifier:v7];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      BOOL v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not find the model identifier.", (uint8_t *)&v14, 0xCu);
    }
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)supportsSharedEventTriggerActivation
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  unint64_t v3 = residentCapabilitiesForDevice(v2);

  return (v3 >> 3) & 1;
}

- (BOOL)isConfirmed
{
  unint64_t v3 = [(HMDResidentDevice *)self residentDeviceManager];
  if ([v3 isResidentElectionV2Enabled])
  {
    id v4 = [v3 primaryResidentUUID];
    if (v4)
    {
      id v5 = [(HMDResidentDevice *)self identifier];
      char confirmed = [v4 isEqual:v5];
    }
    else
    {
      char confirmed = 0;
    }
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    char confirmed = self->_confirmed;
    os_unfair_lock_unlock(p_lock);
  }

  return confirmed;
}

- (unint64_t)status
{
  if ([(HMDResidentDevice *)self isEnabled])
  {
    if ([(HMDResidentDevice *)self isReachable])
    {
LABEL_3:
      uint64_t v3 = 1;
      goto LABEL_10;
    }
    id v4 = [(HMDResidentDevice *)self home];
    if ([v4 supportsResidentSelection]
      && [(HMDResidentDevice *)self isReachableByIDS])
    {
      BOOL v5 = [(HMDResidentDevice *)self supportsResidentSelection];

      if (!v5) {
        goto LABEL_3;
      }
    }
    else
    {
    }
  }
  uint64_t v3 = 0;
LABEL_10:
  BOOL v6 = [(HMDResidentDevice *)self home];
  id v7 = [v6 primaryResident];
  int v8 = [v7 isEqual:self];

  if (v8) {
    unint64_t v9 = v3 | 2;
  }
  else {
    unint64_t v9 = v3;
  }
  if ([(HMDResidentDevice *)self isLowBattery]) {
    v9 |= 8uLL;
  }
  if ([(HMDResidentDevice *)self batteryState] == 1) {
    return v9 | 4;
  }
  else {
    return v9;
  }
}

- (HMDResidentDeviceManager)residentDeviceManager
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_residentDeviceManager);
  os_unfair_lock_unlock(p_lock);
  return (HMDResidentDeviceManager *)WeakRetained;
}

- (HMDHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMDHome *)WeakRetained;
}

- (BOOL)isDeviceEquivalentToDeviceAddress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(HMDResidentDevice *)self messageAddress];
    char v6 = [v5 isEquivalentToDeviceAddress:v4];

    if (v6) {
      goto LABEL_4;
    }
    id v7 = [(HMDResidentDevice *)self device];
    int v8 = [v7 idsIdentifier];
    unint64_t v9 = [v4 idsIdentifier];
    char v10 = [v8 isEqual:v9];

    if (v10)
    {
LABEL_4:
      char v11 = 1;
    }
    else
    {
      id v12 = [(HMDResidentDevice *)self device];
      BOOL v13 = [v12 globalHandles];
      int v14 = [v13 firstObject];
      BOOL v15 = [v4 idsDestination];
      uint64_t v16 = +[HMDDeviceHandle deviceHandleForDestination:v15];
      char v11 = [v14 isEqual:v16];
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDResidentDevice *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(HMDResidentDevice *)v4 device];
      char v6 = [(HMDResidentDevice *)self device];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMDResidentDevice *)self device];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)privateDescription
{
  return [(HMDResidentDevice *)self descriptionWithPointer:0];
}

- (NSString)description
{
  return (NSString *)[(HMDResidentDevice *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDResidentDevice *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = shouldLogPrivateInformation();
  char v6 = [(HMDResidentDevice *)self device];
  char v7 = v6;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [v6 privateDescription];

    char v7 = (void *)v8;
  }
  unint64_t v9 = NSString;
  char v10 = [(HMDResidentDevice *)self shortDescription];
  BOOL v19 = v3;
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    char v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v11 = &stru_26E2EB898;
  }
  [(HMDResidentDevice *)self isEnabled];
  id v12 = HMFBooleanToString();
  [(HMDResidentDevice *)self isConfirmed];
  BOOL v13 = HMFBooleanToString();
  [(HMDResidentDevice *)self isReachable];
  int v14 = HMFBooleanToString();
  [(HMDResidentDevice *)self isReachableByIDS];
  BOOL v15 = HMFBooleanToString();
  uint64_t v16 = [(HMDResidentDevice *)self capabilities];
  uint64_t v17 = [v9 stringWithFormat:@"<%@%@, Enabled = %@, Confirmed = %@, Reachable = %@, Reachable by IDS = %@, Capabilities = %@, Device = %@>", v10, v11, v12, v13, v14, v15, v16, v7];

  if (v19) {
  return v17;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  char v5 = [(HMDResidentDevice *)self identifier];
  char v6 = [v5 UUIDString];
  char v7 = [(HMDResidentDevice *)self device];
  uint64_t v8 = [v7 name];
  unint64_t v9 = [(HMDResidentDevice *)self device];
  char v10 = [v9 version];
  char v11 = [v3 stringWithFormat:@"%@ %@ %@ Ver: %@", v4, v6, v8, v10];

  return v11;
}

- (unint64_t)legacyResidentCapabilities
{
  v2 = [(HMDResidentDevice *)self capabilitiesInternal];
  unint64_t v3 = residentCapabilitiesForDevice(v2);

  return v3;
}

- (void)configureWithHome:(id)a3
{
  obuint64_t j = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, obj);
  id v4 = [obj residentDeviceManager];
  objc_storeWeak((id *)&self->_residentDeviceManager, v4);

  os_unfair_lock_unlock(&self->_lock);
  [(HMDDeviceController *)self->_deviceController setDelegate:self];
  char v5 = [(HMDResidentDevice *)self device];
  __registerForDeviceNotifications(self, v5);

  device = self->_device;
  self->_device = 0;
}

- (void)dealloc
{
  unint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDResidentDevice;
  [(HMDResidentDevice *)&v4 dealloc];
}

- (HMDResidentDevice)initWithDeviceController:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDResidentDevice;
    unint64_t v9 = [(HMDResidentDevice *)&v13 init];
    char v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_identifier, a4);
      v10->_enabled = 1;
      v10->_reachable = 1;
      v10->_reachableByIDS = 1;
      objc_storeStrong((id *)&v10->_deviceController, a3);
    }
    self = v10;
    char v11 = self;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)name
{
  unint64_t v3 = [(HMDResidentDevice *)self appleMediaAccessoryName];
  objc_super v4 = v3;
  if (v3)
  {
    char v5 = v3;
LABEL_5:
    id v7 = v5;
    goto LABEL_6;
  }
  name = self->_name;
  if (name)
  {
    char v5 = name;
    goto LABEL_5;
  }
  unint64_t v9 = [(HMDResidentDevice *)self device];
  id v7 = [v9 name];

LABEL_6:
  return (NSString *)v7;
}

- (HMDResidentDevice)initWithDevice:(id)a3 home:(id)a4 name:(id)a5 rawCapabilities:(id)a6 messageAddress:(id)a7 deviceIRKData:(id)a8
{
  id v30 = a5;
  id v15 = a6;
  id v29 = a7;
  obuint64_t j = a8;
  id v28 = a8;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = objc_opt_class();
  BOOL v19 = [v16 uuid];

  char v20 = [v17 identifier];
  char v21 = [v18 deriveUUIDFromHomeUUID:v19 deviceUUID:v20];

  v22 = [(HMDResidentDevice *)self initWithDevice:v17 identifier:v21];
  if (v22)
  {
    objc_storeStrong((id *)&v22->_name, a5);
    if (v15)
    {
      objc_storeStrong((id *)&v22->_rawCapabilities, a6);
      uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263F0E6C0]), "initWithProtoData:", v15, obj, v28, v29, v30);
      capabilitiesInternal = v22->_capabilitiesInternal;
      v22->_capabilitiesInternal = (HMResidentCapabilities *)v23;
    }
    objc_storeStrong((id *)&v22->_messageAddress, a7);
    objc_storeStrong((id *)&v22->_deviceIRKData, obj);
    uint64_t v25 = v22;
  }

  return v22;
}

- (HMDResidentDevice)initWithDevice:(id)a3 home:(id)a4
{
  return [(HMDResidentDevice *)self initWithDevice:a3 home:a4 name:0 rawCapabilities:0 messageAddress:0 deviceIRKData:0];
}

- (HMDResidentDevice)initWithDevice:(id)a3 identifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    unint64_t v9 = +[HMDDeviceController deviceControllerForDevice:v7];
    char v10 = [(HMDResidentDevice *)self initWithDeviceController:v9 identifier:v8];

    if (v10) {
      objc_storeStrong((id *)&v10->_device, a3);
    }
    self = v10;
    char v11 = self;
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    objc_super v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      id v15 = +[HMDResidentDevice shortDescription];
      int v17 = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      char v20 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%@] Device is required.", (uint8_t *)&v17, 0x16u);
    }
    char v11 = 0;
  }

  return v11;
}

- (HMDResidentDevice)initWithModel:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 deviceUUID];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F08C38]);
    id v7 = [v4 deviceUUID];
    id v8 = (void *)[v6 initWithUUIDString:v7];

    char v5 = +[HMDDeviceController placeholderDeviceControllerWithIdentifier:v8];
  }
  unint64_t v9 = [v4 device];

  if (v9)
  {
    if (!v5)
    {
      char v10 = [v4 device];
      char v5 = +[HMDDeviceController deviceControllerForDevice:v10];
    }
    char v11 = [v4 device];
    [v5 updateWithDevice:v11 completionHandler:0];
  }
  if (v5)
  {
    id v12 = [v4 uuid];
    objc_super v13 = [(HMDResidentDevice *)self initWithDeviceController:v5 identifier:v12];

    if (v13)
    {
      int v14 = [v4 enabled];
      v13->_enabled = [v14 BOOLValue];

      id v15 = [v4 confirmed];
      v13->_char confirmed = [v15 BOOLValue];

      id v16 = [v4 residentCapabilities];
      if (v16)
      {
        objc_storeStrong((id *)&v13->_rawCapabilities, v16);
        uint64_t v17 = [objc_alloc(MEMORY[0x263F0E6C0]) initWithProtoData:v16];
        capabilitiesInternal = v13->_capabilitiesInternal;
        v13->_capabilitiesInternal = (HMResidentCapabilities *)v17;
      }
    }
    __int16 v19 = v13;
    char v20 = v19;
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    __int16 v19 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = [v4 deviceUUID];
      uint64_t v25 = [v4 uuid];
      uint64_t v26 = [v25 UUIDString];
      uint64_t v27 = [v4 device];
      id v28 = @"YES";
      int v30 = 138544130;
      uint64_t v31 = v23;
      if (!v27) {
        id v28 = @"NO";
      }
      __int16 v32 = 2112;
      v33 = v24;
      __int16 v34 = 2112;
      v35 = v26;
      __int16 v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not retrieve device with UUID %@ for resident: %@; device encoding present: %@",
        (uint8_t *)&v30,
        0x2Au);
    }
    char v20 = 0;
  }

  return v20;
}

+ (id)deriveUUIDFromHomeUUID:(id)a3 deviceUUID:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 UUIDString];
  v10[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

  id v8 = objc_msgSend(MEMORY[0x263F08C38], "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31_150506 != -1) {
    dispatch_once(&logCategory__hmf_once_t31_150506, &__block_literal_global_139_150507);
  }
  v2 = (void *)logCategory__hmf_once_v32_150508;
  return v2;
}

void __32__HMDResidentDevice_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v32_150508;
  logCategory__hmf_once_v32_150508 = v0;
}

+ (id)batteryStateAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"HMFPowerBatteryStateUnknown";
  }
  else {
    return off_264A21F08[a3 - 1];
  }
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end