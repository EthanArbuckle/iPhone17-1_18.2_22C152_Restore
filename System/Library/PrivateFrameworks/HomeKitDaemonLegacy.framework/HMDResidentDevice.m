@interface HMDResidentDevice
+ (BOOL)supportsSecureCoding;
+ (id)batteryStateAsString:(int64_t)a3;
+ (id)deriveUUIDFromHomeUUID:(id)a3 deviceUUID:(id)a4;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)_updateRawCapabilities:(id)a3;
- (BOOL)isBlocked;
- (BOOL)isConfirmed;
- (BOOL)isCurrentDevice;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowBattery;
- (BOOL)isReachable;
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
- (HMDHome)home;
- (HMDResidentDevice)initWithCoder:(id)a3;
- (HMDResidentDevice)initWithDevice:(id)a3 identifier:(id)a4;
- (HMDResidentDevice)initWithDeviceController:(id)a3 identifier:(id)a4;
- (HMDResidentDevice)initWithModel:(id)a3;
- (HMDResidentDeviceManager)residentDeviceManager;
- (HMResidentCapabilities)capabilities;
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
  [v14 encodeObject:v6 forKey:*MEMORY[0x1E4F2DD18]];

  BOOL v7 = (!objc_msgSend(v14, "hmd_isForSharedUser") || !-[HMDResidentDevice isBlocked](self, "isBlocked"))
    && [(HMDResidentDevice *)self isEnabled];
  [v14 encodeBool:v7 forKey:@"HM.enabled"];
  if (objc_msgSend(v14, "hmd_isForXPCTransport"))
  {
    objc_msgSend(v14, "encodeInteger:forKey:", -[HMDResidentDevice status](self, "status"), @"HM.status");
    objc_msgSend(v14, "encodeInteger:forKey:", -[HMDResidentDevice legacyResidentCapabilities](self, "legacyResidentCapabilities"), @"HM.capabilities");
    BOOL v8 = [(HMDResidentDevice *)self supportsResidentSelection];
    [v14 encodeBool:v8 forKey:*MEMORY[0x1E4F2DD38]];
    if (objc_msgSend(v14, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      v9 = [(HMDResidentDevice *)self device];
      v10 = [v9 idsIdentifier];
      [v14 encodeObject:v10 forKey:@"HM.accountIdentifier"];

      v11 = [(HMDResidentDevice *)self device];
      v12 = [v11 remoteDestinationString];
      [v14 encodeObject:v12 forKey:*MEMORY[0x1E4F2D090]];

      v13 = [(HMDResidentDevice *)self deviceIRKData];
      [v14 encodeObject:v13 forKey:*MEMORY[0x1E4F2DD20]];
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
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2DD18]];
  v6 = [MEMORY[0x1E4F29128] UUID];
  BOOL v7 = [(HMDResidentDevice *)self initWithDevice:v5 identifier:v6];

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
  v16 = NSString;
  v15 = [(HMDResidentDevice *)self name];
  v18 = [(HMDResidentDevice *)self device];
  v17 = [v18 identifier];
  v19 = [v17 UUIDString];
  [(HMDResidentDevice *)self isEnabled];
  id v14 = HMFBooleanToString();
  [(HMDResidentDevice *)self isConfirmed];
  v3 = HMFBooleanToString();
  [(HMDResidentDevice *)self isReachable];
  id v4 = HMFBooleanToString();
  v5 = +[HMDResidentDevice batteryStateAsString:[(HMDResidentDevice *)self batteryState]];
  v6 = [(HMDResidentDevice *)self deviceIRKData];
  BOOL v7 = [(HMDResidentDevice *)self device];
  BOOL v8 = [v7 idsIdentifier];
  uint64_t v9 = [(HMDResidentDevice *)self device];
  v10 = [v9 remoteDestinationString];
  v11 = [v16 stringWithFormat:@"name: %@, uuid: %@, isEnabled: %@, isConfirmed: %@, isReachable: %@, isReachableByIDS: %@, batteryState: %@, deviceIRKData: %@, idsIdentifier: %@, idsDestination: %@", v15, v19, v14, v3, v4, @"N/A", v5, v6, v8, v10];

  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v11 forKey:*MEMORY[0x1E4F64EA0]];

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
    BOOL v7 = [(HMDResidentDevice *)self identifier];
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

- (BOOL)_updateRawCapabilities:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F2EA60]) initWithProtoData:v5];
  os_unfair_lock_lock_with_options();
  if (!v5 || self->_rawCapabilities) && ([v6 isEqual:self->_capabilitiesInternal])
  {
    os_unfair_lock_unlock(&self->_lock);
    BOOL v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_rawCapabilities, a3);
    id v8 = (HMResidentCapabilities *)[objc_alloc(MEMORY[0x1E4F2EA60]) initWithProtoData:v5];
    capabilitiesInternal = self->_capabilitiesInternal;
    self->_capabilitiesInternal = v8;

    os_unfair_lock_unlock(&self->_lock);
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v13;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updated resident capabilities to %@", buf, 0x16u);
    }
    id v14 = [(HMDResidentDevice *)v11 home];
    v15 = [v14 homeManager];
    v16 = [(HMDResidentDevice *)v11 identifier];
    [v15 updateGenerationCounterWithReason:@"Resident Capabilities Updated" sourceUUID:v16 shouldNotifyClients:1];

    if (v6)
    {
      v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v18 = [(HMDResidentDevice *)v11 identifier];
      v21[1] = @"residentCapabilities";
      v22[0] = v18;
      v22[1] = v6;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
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

  id v14 = [(HMDResidentDevice *)self device];
  v15 = [v14 version];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:@"4.0"];
  int v17 = [v15 isAtLeastVersion:v16];

  BOOL v18 = isWatch();
  if (v18
    && (+[HMDDeviceCapabilities deviceCapabilities],
        v15 = objc_claimAutoreleasedReturnValue(),
        ![v15 supportsCloudDataSync]))
  {
    int v20 = 1;
  }
  else
  {
    v19 = [(HMDResidentDevice *)self home];
    int v20 = [v19 isOwnerUser] ^ 1;

    if (!v18)
    {
      if (!v17) {
        goto LABEL_12;
      }
LABEL_8:
      int v21 = [v14 isCurrentDevice];
      if (a4 > 3) {
        int v22 = v21;
      }
      else {
        int v22 = 0;
      }
      if ((v22 | v20) != 1) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
  }

  if (v17) {
    goto LABEL_8;
  }
LABEL_12:
  v23 = [v14 identifier];
  v24 = [v23 UUIDString];
  [(HMDResidentDeviceModel *)v11 setDeviceUUID:v24];

  if (v20 && self->_device)
  {
    -[HMDResidentDeviceModel setDevice:](v11, "setDevice:");
    device = self->_device;
    self->_device = 0;
  }
  else
  {
    [(HMDResidentDeviceModel *)v11 setDevice:v14];
  }
LABEL_16:

  return v11;
}

- (void)_handleResidentDeviceUpdateConfirmed:(BOOL)a3
{
  int v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int confirmed = self->_confirmed;
  self->_int confirmed = v3;
  os_unfair_lock_unlock(p_lock);
  if (confirmed != v3)
  {
    BOOL v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      int v22 = v10;
      __int16 v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of resident device confirmed state changing to %{public}@", buf, 0x16u);
    }
    v12 = [(HMDResidentDevice *)v8 home];
    v13 = [v12 uuid];
    v19[1] = @"HMDResidentDeviceResidentNotificationKey";
    v20[0] = v13;
    v20[1] = v8;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"HMDResidentDeviceConfirmedStateChangedNotification" object:v8 userInfo:v14];

    if ((v3 & 1) == 0)
    {
      v16 = [(HMDResidentDevice *)v8 device];
      int v17 = [v16 isCurrentDevice];

      if (v17)
      {
        BOOL v18 = [(HMDResidentDevice *)v8 residentDeviceManager];
        [v18 confirmAsResident];
      }
    }
  }
}

- (void)_handleResidentDeviceUpdateEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(HMDResidentDevice *)self isEnabled] != a3)
  {
    [(HMDResidentDevice *)self setEnabled:v3];
    id v5 = [(HMDResidentDevice *)self residentDeviceManager];
    [v5 updateResidentAvailability];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"HMDResidentDeviceEnabledStateChangedNotification" object:self];

    BOOL v7 = [(HMDResidentDevice *)self home];
    id v8 = [v5 primaryResidentDevice];
    uint64_t v9 = [v8 device];
    int v10 = [v9 isCurrentDevice];

    if (v10)
    {
      BOOL v11 = [(HMDResidentDevice *)self isEnabled];
      v12 = (void *)MEMORY[0x1D9452090]();
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
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations with resident due to primary resident enabled", buf, 0xCu);
        }
        int v17 = [(HMDResidentDevice *)v13 device];
        v28 = v17;
        BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        [v7 enableNotificationsForDevices:v18];
      }
      else
      {
        if (v15)
        {
          v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v30 = v19;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations resident due to primary resident disabled", buf, 0xCu);
        }
        int v17 = [(HMDResidentDevice *)v13 device];
        uint64_t v27 = v17;
        BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
        [v7 disableNotificationsForDevices:v18];
      }
    }
    int v20 = [v5 primaryResidentUUID];
    int v21 = v20;
    if (v3)
    {
      if (v20)
      {

        int v22 = [(HMDResidentDevice *)self device];
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
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v94 = a5;
  int v10 = [v94 transactionResult];
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
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    BOOL v15 = [(HMDResidentDevice *)self device];
    v16 = [v15 backingStoreObjectsWithChangeType:0 version:4];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v103 objects:v116 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v104;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v104 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v103 + 1) + 8 * i) dumpDebug:@"LOCAL: "];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v103 objects:v116 count:16];
      }
      while (v18);
    }
  }
  int v21 = [v9 device];

  if (v21)
  {
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    int v22 = [v9 device];
    int v23 = [v22 backingStoreObjectsWithChangeType:0 version:4];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v99 objects:v115 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v100;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v100 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v99 + 1) + 8 * j) dumpDebug:@"REMOTE: "];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v99 objects:v115 count:16];
      }
      while (v25);
    }
  }
  v28 = [v9 deviceUUID];

  v95 = v10;
  if (v28)
  {
    id v29 = objc_alloc(MEMORY[0x1E4F29128]);
    v30 = [v9 deviceUUID];
    uint64_t v31 = (void *)[v29 initWithUUIDString:v30];

    v32 = [(HMDResidentDevice *)self deviceController];
    v33 = [v32 identifier];
    char v34 = objc_msgSend(v31, "hmf_isEqualToUUID:", v33);

    if ((v34 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x1D9452090]();
      v36 = self;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v39 = id v38 = v8;
        v40 = [v31 UUIDString];
        *(_DWORD *)buf = 138543618;
        v110 = v39;
        __int16 v111 = 2112;
        v112 = v40;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Updating the underlying device with identifier: %@", buf, 0x16u);

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
      [v95 markChanged];
    }

    int v10 = v95;
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
      v58 = (void *)MEMORY[0x1D9452090]();
      v59 = self;
      v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v61 = HMFGetLogIdentifier();
        v62 = [(HMDResidentDevice *)v59 device];
        [v9 device];
        v64 = id v63 = v8;
        *(_DWORD *)buf = 138543874;
        v110 = v61;
        __int16 v111 = 2112;
        v112 = v62;
        __int16 v113 = 2112;
        v114 = v64;
        _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_INFO, "%{public}@Cloud changed our device, preferring local device -- local: %@, cloud :%@", buf, 0x20u);

        id v8 = v63;
        int v10 = v95;
      }
      BOOL v13 = 1;
    }
    else
    {
      v65 = [(HMDResidentDevice *)self deviceController];
      v66 = [v9 device];
      [v65 updateWithDevice:v66 completionHandler:0];
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

    if (v51 != v53)
    {
      v54 = [v9 enabled];
      if (![v54 BOOLValue])
      {
LABEL_36:

LABEL_37:
        [v10 markChanged];
        v56 = [v9 enabled];
        -[HMDResidentDevice _handleResidentDeviceUpdateEnabled:](self, "_handleResidentDeviceUpdateEnabled:", [v56 BOOLValue]);

        v107 = @"kEnabledKey";
        v57 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
        v108 = v57;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];

        goto LABEL_48;
      }
      v55 = [(HMDResidentDevice *)self home];
      if ([v55 isOwnerUser])
      {

        goto LABEL_36;
      }
      BOOL v67 = [(HMDResidentDevice *)self isBlocked];

      if (!v67) {
        goto LABEL_37;
      }
      v68 = (void *)MEMORY[0x1D9452090]();
      v69 = self;
      v70 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v71 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v110 = v71;
        _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_INFO, "%{public}@Not enabling, we are currently blocked", buf, 0xCu);
      }
    }
    v50 = 0;
  }
LABEL_48:
  uint64_t v72 = [v9 confirmed];
  if (v72)
  {
    v73 = (void *)v72;
    int v74 = [(HMDResidentDevice *)self isConfirmed];
    v75 = [v9 confirmed];
    int v76 = [v75 BOOLValue];

    BOOL v77 = v74 == v76;
    int v10 = v95;
    if (!v77)
    {
      [v95 markChanged];
      v78 = [v9 confirmed];
      -[HMDResidentDevice _handleResidentDeviceUpdateConfirmed:](self, "_handleResidentDeviceUpdateConfirmed:", [v78 BOOLValue]);
    }
  }
  if ([v10 changed])
  {
    v79 = [(HMDResidentDevice *)self residentDeviceManager];
    [v79 notifyClientsOfUpdatedResidentDevice:self];
  }
  v80 = [(HMDResidentDevice *)self home];
  if (v13)
  {
    id v93 = v8;
    v81 = (void *)MEMORY[0x1D9452090]([v10 markChanged]);
    v82 = self;
    v83 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      v84 = HMFGetLogIdentifier();
      v85 = [(HMDResidentDevice *)v82 device];
      *(_DWORD *)buf = 138543618;
      v110 = v84;
      __int16 v111 = 2112;
      v112 = v85;
      _os_log_impl(&dword_1D49D5000, v83, OS_LOG_TYPE_INFO, "%{public}@Pushing back with current device: %@", buf, 0x16u);
    }
    v86 = [(HMDResidentDevice *)v82 modelObjectWithChangeType:2 version:4];
    v87 = [v80 backingStore];
    v88 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    v89 = [v87 transaction:@"residentUpdated" options:v88];

    [v89 add:v86];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke;
    v97[3] = &unk_1E6A197F0;
    id v98 = v80;
    [v89 save:v97];

    id v8 = v93;
    int v10 = v95;
  }
  v90 = [v80 backingStore];
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __67__HMDResidentDevice__residentDeviceModelUpdated_newValues_message___block_invoke_2;
  v96[3] = &unk_1E6A197F0;
  v96[4] = self;
  [v90 submitBlock:v96];

  v91 = [v94 responseHandler];

  if (v91)
  {
    v92 = [v94 responseHandler];
    ((void (**)(void, void, void *))v92)[2](v92, 0, v50);
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

    BOOL v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);

    id v7 = (id)v10;
  }
}

- (id)appleMediaAccessoryName
{
  BOOL v3 = [(HMDResidentDevice *)self home];
  id v4 = [v3 appleMediaAccessories];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__HMDResidentDevice_appleMediaAccessoryName__block_invoke;
  v8[3] = &unk_1E6A18D10;
  v8[4] = self;
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v8);

  v6 = [v5 name];

  return v6;
}

uint64_t __44__HMDResidentDevice_appleMediaAccessoryName__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 device];
  id v5 = [v4 idsIdentifier];
  v6 = [v3 idsIdentifier];

  uint64_t v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

- (unint64_t)productTypeForModelIdentifier:(id)a3
{
  id v3 = a3;
  if (productTypeForModelIdentifier__onceToken != -1) {
    dispatch_once(&productTypeForModelIdentifier__onceToken, &__block_literal_global_82);
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
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AppleTV5,3";
  v2[1] = @"AppleTV6,2";
  v3[0] = &unk_1F2DC8758;
  v3[1] = &unk_1F2DC8770;
  v2[2] = @"AppleTV14,1";
  v2[3] = @"AppleTV14,1";
  v3[2] = &unk_1F2DC8788;
  v3[3] = &unk_1F2DC87A0;
  v2[4] = @"AppleTV11,1";
  v2[5] = @"AudioAccessory1,2";
  v3[4] = &unk_1F2DC87B8;
  v3[5] = &unk_1F2DC87D0;
  v2[6] = @"AudioAccessory1,1";
  v2[7] = @"AudioAccessory5,1";
  v3[6] = &unk_1F2DC87E8;
  v3[7] = &unk_1F2DC8800;
  v2[8] = @"AudioAccessory6,1";
  v3[8] = &unk_1F2DC8818;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  id v1 = (void *)productTypeForModelIdentifier__modelIdentifierToProductTypeMap;
  productTypeForModelIdentifier__modelIdentifierToProductTypeMap = v0;
}

- (void)__deviceUpdated:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HMDResidentDevice *)self device];

  if (v7 == v8)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      BOOL v15 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification device was updated", (uint8_t *)&v14, 0xCu);
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
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F2DD28];
  char v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDResidentDevice isEnabled](self, "isEnabled"));
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E4F2DD30];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDResidentDevice status](self, "status"));
  v10[1] = v4;
  v9[2] = *MEMORY[0x1E4F2DD10];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDResidentDevice legacyResidentCapabilities](self, "legacyResidentCapabilities"));
  v10[2] = v5;
  v9[3] = *MEMORY[0x1E4F2DD40];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDResidentDevice supportsResidentSelection](self, "supportsResidentSelection"));
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

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
  char v3 = [(HMDResidentDevice *)self device];
  id v4 = [v3 capabilities];
  id v5 = [(HMDResidentDevice *)self device];
  unint64_t v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 24) & 1;
}

- (BOOL)supportsResidentFirmwareUpdate
{
  char v3 = [(HMDResidentDevice *)self device];
  id v4 = [v3 capabilities];
  id v5 = [(HMDResidentDevice *)self device];
  unint64_t v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 23) & 1;
}

- (BOOL)supportsFirmwareUpdate
{
  char v3 = [(HMDResidentDevice *)self device];
  id v4 = [v3 capabilities];
  id v5 = [(HMDResidentDevice *)self device];
  unint64_t v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 11) & 1;
}

- (BOOL)supportsShortcutActions
{
  char v3 = [(HMDResidentDevice *)self device];
  id v4 = [v3 capabilities];
  id v5 = [(HMDResidentDevice *)self device];
  unint64_t v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 8) & 1;
}

- (BOOL)supportsMediaActions
{
  char v3 = [(HMDResidentDevice *)self device];
  id v4 = [v3 capabilities];
  id v5 = [(HMDResidentDevice *)self device];
  unint64_t v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 9) & 1;
}

- (BOOL)supportsMediaSystem
{
  char v3 = [(HMDResidentDevice *)self device];
  id v4 = [v3 capabilities];
  id v5 = [(HMDResidentDevice *)self device];
  unint64_t v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 4) & 1;
}

- (BOOL)supportsSharedEventTriggerActivation
{
  char v3 = [(HMDResidentDevice *)self device];
  id v4 = [v3 capabilities];
  id v5 = [(HMDResidentDevice *)self device];
  unint64_t v6 = residentCapabilitiesForDevice(v4, v5);

  return (v6 >> 3) & 1;
}

- (BOOL)isConfirmed
{
  char v3 = [(HMDResidentDevice *)self residentDeviceManager];
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
  if ([(HMDResidentDevice *)self isEnabled]) {
    unint64_t v3 = [(HMDResidentDevice *)self isReachable];
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = [(HMDResidentDevice *)self home];
  id v5 = [v4 primaryResident];
  int v6 = [v5 isEqual:self];

  if (v6) {
    unint64_t v7 = v3 | 2;
  }
  else {
    unint64_t v7 = v3;
  }
  if ([(HMDResidentDevice *)self isLowBattery]) {
    v7 |= 8uLL;
  }
  if ([(HMDResidentDevice *)self batteryState] == 1) {
    return v7 | 4;
  }
  else {
    return v7;
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
      id v5 = [(HMDResidentDevice *)v4 device];
      int v6 = [(HMDResidentDevice *)self device];
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
  int v6 = [(HMDResidentDevice *)self device];
  char v7 = v6;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [v6 privateDescription];

    char v7 = (void *)v8;
  }
  id v9 = NSString;
  uint64_t v10 = [(HMDResidentDevice *)self shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    BOOL v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = &stru_1F2C9F1A8;
  }
  [(HMDResidentDevice *)self isEnabled];
  id v12 = HMFBooleanToString();
  [(HMDResidentDevice *)self isConfirmed];
  BOOL v13 = HMFBooleanToString();
  [(HMDResidentDevice *)self isReachable];
  int v14 = HMFBooleanToString();
  BOOL v15 = [v9 stringWithFormat:@"<%@%@, Enabled = %@, Confirmed = %@, Reachable = %@, Device = %@>", v10, v11, v12, v13, v14, v7];

  if (v3) {
  return v15;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  char v5 = [(HMDResidentDevice *)self identifier];
  int v6 = [v5 UUIDString];
  char v7 = [(HMDResidentDevice *)self device];
  uint64_t v8 = [v7 name];
  id v9 = [(HMDResidentDevice *)self device];
  uint64_t v10 = [v9 version];
  BOOL v11 = [v3 stringWithFormat:@"%@ %@ %@ Ver: %@", v4, v6, v8, v10];

  return v11;
}

- (HMResidentCapabilities)capabilities
{
  v2 = [(HMDResidentDevice *)self device];
  BOOL v3 = [v2 capabilities];

  return (HMResidentCapabilities *)v3;
}

- (unint64_t)legacyResidentCapabilities
{
  BOOL v3 = [(HMDResidentDevice *)self device];
  id v4 = [v3 capabilities];
  char v5 = [(HMDResidentDevice *)self device];
  unint64_t v6 = residentCapabilitiesForDevice(v4, v5);

  return v6;
}

- (BOOL)isBlocked
{
  BOOL v3 = [(HMDResidentDevice *)self device];

  if (!v3) {
    return 0;
  }
  if (isBlocked_onceToken != -1) {
    dispatch_once(&isBlocked_onceToken, &__block_literal_global_103038);
  }
  id v4 = [(HMDResidentDevice *)self device];
  char v5 = [v4 version];
  char v6 = [v5 isAtLeastVersion:isBlocked_unblockedVersion];

  return v6 ^ 1;
}

uint64_t __30__HMDResidentDevice_isBlocked__block_invoke()
{
  uint64_t v0 = [[HMDHomeKitVersion alloc] initWithVersionString:@"4.1.1"];
  uint64_t v1 = isBlocked_unblockedVersion;
  isBlocked_unblockedVersion = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)configureWithHome:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v4);
  char v5 = [v4 residentDeviceManager];
  objc_storeWeak((id *)&self->_residentDeviceManager, v5);

  os_unfair_lock_unlock(&self->_lock);
  [(HMDDeviceController *)self->_deviceController setDelegate:self];
  char v6 = [(HMDResidentDevice *)self device];
  __registerForDeviceNotifications(self, v6);

  device = self->_device;
  self->_device = 0;

  if (-[HMDResidentDevice isBlocked](self, "isBlocked") && ([v4 isOwnerUser] & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      BOOL v13 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Disabling as we are blocked", (uint8_t *)&v12, 0xCu);
    }
    [(HMDResidentDevice *)v9 setEnabled:0];
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
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
    id v9 = [(HMDResidentDevice *)&v13 init];
    uint64_t v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_identifier, a4);
      v10->_enabled = 1;
      v10->_reachable = 1;
      objc_storeStrong((id *)&v10->_deviceController, a3);
    }
    self = v10;
    BOOL v11 = self;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSString)name
{
  v2 = [(HMDResidentDevice *)self device];
  BOOL v3 = [v2 name];

  return (NSString *)v3;
}

- (HMDResidentDevice)initWithDevice:(id)a3 identifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = +[HMDDeviceController deviceControllerForDevice:v7];
    uint64_t v10 = [(HMDResidentDevice *)self initWithDeviceController:v9 identifier:v8];

    if (v10) {
      objc_storeStrong((id *)&v10->_device, a3);
    }
    self = v10;
    BOOL v11 = self;
  }
  else
  {
    int v12 = (void *)MEMORY[0x1D9452090]();
    objc_super v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      BOOL v15 = +[HMDResidentDevice shortDescription];
      int v17 = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      int v20 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%@] Device is required.", (uint8_t *)&v17, 0x16u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (HMDResidentDevice)initWithModel:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 deviceUUID];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    id v7 = [v4 deviceUUID];
    id v8 = (void *)[v6 initWithUUIDString:v7];

    char v5 = +[HMDDeviceController placeholderDeviceControllerWithIdentifier:v8];
  }
  id v9 = [v4 device];

  if (v9)
  {
    if (!v5)
    {
      uint64_t v10 = [v4 device];
      char v5 = +[HMDDeviceController deviceControllerForDevice:v10];
    }
    BOOL v11 = [v4 device];
    [v5 updateWithDevice:v11 completionHandler:0];
  }
  if (v5)
  {
    int v12 = [v4 uuid];
    objc_super v13 = [(HMDResidentDevice *)self initWithDeviceController:v5 identifier:v12];

    if (v13)
    {
      uint64_t v14 = [v4 enabled];
      v13->_enabled = [v14 BOOLValue];

      BOOL v15 = [v4 confirmed];
      v13->_char confirmed = [v15 BOOLValue];
    }
    uint64_t v16 = v13;
    int v17 = v16;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = HMFGetLogIdentifier();
      uint64_t v21 = [v4 deviceUUID];
      int v22 = [v4 uuid];
      int v23 = [v22 UUIDString];
      uint64_t v24 = [v4 device];
      uint64_t v25 = @"YES";
      int v27 = 138544130;
      v28 = v20;
      if (!v24) {
        uint64_t v25 = @"NO";
      }
      __int16 v29 = 2112;
      v30 = v21;
      __int16 v31 = 2112;
      v32 = v23;
      __int16 v33 = 2112;
      char v34 = v25;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not retrieve device with UUID %@ for resident: %@; device encoding present: %@",
        (uint8_t *)&v27,
        0x2Au);
    }
    int v17 = 0;
  }

  return v17;
}

+ (id)deriveUUIDFromHomeUUID:(id)a3 deviceUUID:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 UUIDString];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  id v8 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29_103062 != -1) {
    dispatch_once(&logCategory__hmf_once_t29_103062, &__block_literal_global_140_103063);
  }
  v2 = (void *)logCategory__hmf_once_v30_103064;
  return v2;
}

uint64_t __32__HMDResidentDevice_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v30_103064;
  logCategory__hmf_once_v30_103064 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)batteryStateAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"HMFPowerBatteryStateUnknown";
  }
  else {
    return off_1E6A0EFE0[a3 - 1];
  }
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end