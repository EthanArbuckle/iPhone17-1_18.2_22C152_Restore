@interface HMDResidentUser
+ (BOOL)supportsSecureCoding;
- (BOOL)isBlocked;
- (BOOL)refreshDisplayName;
- (BOOL)requiresMakoSupport;
- (BOOL)updateWithDevice:(id)a3;
- (HMDDevice)device;
- (HMDResidentUser)initWithCoder:(id)a3;
- (HMDResidentUser)initWithDevice:(id)a3 home:(id)a4 pairingIdentity:(id)a5 configurationState:(unint64_t)a6;
- (HMDResidentUser)initWithModelObject:(id)a3;
- (NSString)deviceIdentifier;
- (id)displayName;
- (id)legacyUser;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)userID;
- (unint64_t)configurationState;
- (void)configureWithHome:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)registerIdentity;
- (void)setConfigurationState:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDResidentUser

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDResidentUser;
  [(HMDUser *)&v8 encodeWithCoder:v4];
  v5 = [(HMDResidentUser *)self device];
  [v4 encodeObject:v5 forKey:@"HM.device"];

  if (objc_msgSend(v4, "hmd_isForSharedUser")) {
    unint64_t v6 = 3;
  }
  else {
    unint64_t v6 = [(HMDResidentUser *)self configurationState];
  }
  [v4 encodeInt32:v6 forKey:@"residentConfigState"];
  [v4 encodeBool:1 forKey:@"userIsRemoteGateway"];
  v7 = [(HMDResidentUser *)self deviceIdentifier];
  [v4 encodeObject:v7 forKey:@"residentIdentifier"];
}

- (HMDResidentUser)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDResidentUser;
  v5 = [(HMDUser *)&v27 initWithCoder:v4];
  if (v5)
  {
    v5->_configurationState = (int)[v4 decodeInt32ForKey:@"residentConfigState"];
    if ([v4 containsValueForKey:@"HM.device"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.device"];
      device = v5->_device;
      v5->_device = (HMDDevice *)v6;
LABEL_17:

      goto LABEL_18;
    }
    device = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
    if (device)
    {
      objc_super v8 = +[HMDDeviceHandle deviceHandleForDestination:device];
      if (v8)
      {
        v9 = +[HMDAccountRegistry sharedRegistry];
        uint64_t v10 = [v9 deviceForHandle:v8];
        v11 = v5->_device;
        v5->_device = (HMDDevice *)v10;
      }
    }
    if (v5->_device)
    {
      v12 = [(HMDResidentUser *)v5 userID];

      if (v12) {
        goto LABEL_16;
      }
      v13 = (void *)MEMORY[0x230FBD990]();
      v14 = v5;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v29 = v16;
        __int16 v30 = 2112;
        v31 = device;
        v17 = "%{public}@Could not determine userID from device generated for HMDResidentUser with expected destination: %@";
LABEL_14:
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);
      }
    }
    else
    {
      v13 = (void *)MEMORY[0x230FBD990]();
      v18 = v5;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v29 = v16;
        __int16 v30 = 2112;
        v31 = device;
        v17 = "%{public}@Failed to resolve device for HMDResidentUser with expected destination: %@";
        goto LABEL_14;
      }
    }

LABEL_16:
    v19 = [(HMDResidentUser *)v5 userID];

    if (!v19)
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      v22 = v5;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v29 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Missing expected userID", buf, 0xCu);
      }
      v25 = [[HMDAssertionLogEvent alloc] initWithReason:@"Missing expected userID"];
      v26 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v26 submitLogEvent:v25];
    }
    goto LABEL_17;
  }
LABEL_18:

  return v5;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    uint64_t v14 = [v13 device];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [v13 device];
      v17 = [(HMDResidentUser *)self device];
      int v18 = HMFEqualObjects();

      if (v18)
      {
        v19 = [v13 device];
        [(HMDResidentUser *)self setDevice:v19];
      }
    }
    uint64_t v20 = [v13 configState];
    if (v20)
    {
      v21 = (void *)v20;
      v22 = [v13 configState];
      int v23 = [v22 intValue];
      unint64_t v24 = [(HMDResidentUser *)self configurationState];

      if (v24 != v23)
      {
        v25 = [(HMDUser *)self home];
        int v26 = [v25 isOwnerUser];

        objc_super v27 = [v13 configState];
        int v28 = [v27 intValue];
        int v29 = v28;
        if (v26)
        {
          [(HMDResidentUser *)self setConfigurationState:v28];
        }
        else
        {

          if (v29 == 2)
          {
            __int16 v30 = (void *)MEMORY[0x230FBD990]();
            v31 = self;
            uint64_t v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v33 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v39 = v33;
              _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Disabling", buf, 0xCu);
            }
            [(HMDResidentUser *)v31 setConfigurationState:3];
          }
        }
      }
    }
  }
  id v34 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v35 = v34;
  }
  else {
    v35 = 0;
  }
  id v36 = v35;

  if (v36)
  {
    v37.receiver = self;
    v37.super_class = (Class)HMDResidentUser;
    [(HMDUser *)&v37 _transactionUserUpdated:0 newValues:v36 message:v10];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HMDResidentUser;
  v5 = [(HMDUser *)&v13 modelObjectWithChangeType:a3 version:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  if (v7)
  {
    id v8 = [(HMDResidentUser *)self device];
    [v7 setDevice:v8];

    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDResidentUser configurationState](self, "configurationState"));
    [v7 setConfigState:v9];

    id v10 = [(HMDResidentUser *)self encodingRemoteDisplayName];
    [v7 setDisplayName:v10];

    id v11 = [(HMDResidentUser *)self deviceIdentifier];
    [v7 setDeviceIdentifier:v11];
  }
  return v5;
}

- (id)legacyUser
{
  v2 = [[__HMDLegacyResidentUser alloc] initWithResidentUser:self];
  return v2;
}

- (void)setConfigurationState:(unint64_t)a3
{
  p_residentUserLock = &self->_residentUserLock;
  os_unfair_lock_lock_with_options();
  self->_configurationState = a3;
  os_unfair_lock_unlock(p_residentUserLock);
}

- (unint64_t)configurationState
{
  p_residentUserLock = &self->_residentUserLock;
  os_unfair_lock_lock_with_options();
  unint64_t configurationState = self->_configurationState;
  os_unfair_lock_unlock(p_residentUserLock);
  return configurationState;
}

- (BOOL)isBlocked
{
  v3 = [MEMORY[0x263F42620] productInfo];
  uint64_t v4 = [v3 productPlatform];

  if (v4 == 3)
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [(HMDUser *)self home];
    id v7 = v6;
    if (v6) {
      char v5 = [v6 isOwnerUser] - 1;
    }
    else {
      char v5 = 0;
    }
  }
  return v5 & 1;
}

- (BOOL)updateWithDevice:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    char v5 = [(HMDResidentUser *)self device];
    BOOL v6 = v5 == 0;

    if (!v5)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        int v20 = 138543618;
        v21 = v10;
        __int16 v22 = 2112;
        id v23 = v4;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating the device: %@", (uint8_t *)&v20, 0x16u);
      }
      [(HMDResidentUser *)v8 setDevice:v4];
    }
    id v11 = [(HMDResidentUser *)self device];
    v12 = [v11 name];
    objc_super v13 = [v4 name];
    char v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = HMFGetLogIdentifier();
        int v20 = 138543618;
        v21 = v18;
        __int16 v22 = 2112;
        id v23 = v4;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating the device: %@", (uint8_t *)&v20, 0x16u);
      }
      [(HMDResidentUser *)v16 setDevice:v4];
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setDevice:(id)a3
{
  id v4 = (HMDDevice *)a3;
  os_unfair_lock_lock_with_options();
  device = self->_device;
  self->_device = v4;

  os_unfair_lock_unlock(&self->_residentUserLock);
}

- (HMDDevice)device
{
  p_residentUserLock = &self->_residentUserLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_device;
  os_unfair_lock_unlock(p_residentUserLock);
  return v4;
}

- (void)registerIdentity
{
  id v5 = [(HMDUser *)self pairingIdentity];
  if (v5)
  {
    v3 = +[HMDIdentityRegistry sharedRegistry];
    id v4 = [(HMDResidentUser *)self device];
    [v3 registerIdentity:v5 device:v4 object:self];
  }
}

- (BOOL)requiresMakoSupport
{
  return 0;
}

- (id)displayName
{
  v2 = [(HMDResidentUser *)self device];
  v3 = [v2 name];

  return v3;
}

- (BOOL)refreshDisplayName
{
  return 0;
}

- (NSString)deviceIdentifier
{
  v2 = [(HMDResidentUser *)self device];
  v3 = [v2 idsIdentifier];
  id v4 = [v3 UUIDString];

  return (NSString *)v4;
}

- (id)userID
{
  v2 = [(HMDResidentUser *)self device];
  v3 = [v2 remoteDestinationString];

  return v3;
}

- (void)configureWithHome:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDResidentUser;
  [(HMDUser *)&v9 configureWithHome:v4];
  if ([(HMDResidentUser *)self isBlocked]
    && [(HMDResidentUser *)self configurationState] == 2)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    BOOL v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Disabling as we are blocked", buf, 0xCu);
    }
    [(HMDResidentUser *)v6 setConfigurationState:3];
  }
}

- (HMDResidentUser)initWithDevice:(id)a3 home:(id)a4 pairingIdentity:(id)a5 configurationState:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDResidentUser;
  uint64_t v12 = [(HMDUser *)&v15 initWithAccountHandle:0 home:a4 pairingIdentity:a5 privilege:0];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    v13->_unint64_t configurationState = a6;
    [(HMDUser *)v13 _setRemoteAccessAllowed:0];
  }

  return v13;
}

- (HMDResidentUser)initWithModelObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDResidentUser;
  id v5 = [(HMDUser *)&v13 initWithModelObject:v4];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      v5->_residentUserLock._os_unfair_lock_opaque = 0;
      uint64_t v9 = [v8 device];
      device = v5->_device;
      v5->_device = (HMDDevice *)v9;

      id v11 = [v8 configState];
      v5->_unint64_t configurationState = (int)[v11 intValue];
    }
    [(HMDUser *)v5 _setRemoteAccessAllowed:0];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end