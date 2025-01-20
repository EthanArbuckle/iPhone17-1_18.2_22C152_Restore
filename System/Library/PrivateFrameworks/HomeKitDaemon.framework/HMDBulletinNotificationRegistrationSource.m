@interface HMDBulletinNotificationRegistrationSource
+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDBulletinNotificationRegistrationSource)initWithCoder:(id)a3;
- (HMDBulletinNotificationRegistrationSource)initWithDictionary:(id)a3;
- (HMDBulletinNotificationRegistrationSource)initWithUserUUID:(id)a3 deviceAddress:(id)a4;
- (HMDDevice)device;
- (HMDDeviceAddress)deviceAddress;
- (NSUUID)userUUID;
- (id)attributeDescriptions;
- (id)serializedRegistrationForRemoteMessage;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDBulletinNotificationRegistrationSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
}

- (HMDDeviceAddress)deviceAddress
{
  return (HMDDeviceAddress *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDBulletinNotificationRegistrationSource *)self userUUID];
  v5 = (void *)[v3 initWithName:@"userUUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDBulletinNotificationRegistrationSource *)self deviceAddress];
  v8 = (void *)[v6 initWithName:@"deviceAddress" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDBulletinNotificationRegistrationSource)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDBNRS.ck.dii"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDBNRS.ck.did"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDBNRS.ck.uu"];
  v8 = (void *)v7;
  if (!v5)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v14 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = 0;
    v15 = "%{public}@Could not initialize from decoded deviceIdsIdentifier: %@";
LABEL_11:
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x16u);

    goto LABEL_12;
  }
  if (!v6)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v14 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = 0;
    v15 = "%{public}@Could not initialize from decoded deviceIdsDestination: %@";
    goto LABEL_11;
  }
  if (!v7)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      v15 = "%{public}@Could not initialize from decoded userUUID: %@";
      goto LABEL_11;
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  v9 = [[HMDDeviceAddress alloc] initWithIDSIdentifier:v5 idsDestination:v6];
  v10 = [(HMDBulletinNotificationRegistrationSource *)self initWithUserUUID:v8 deviceAddress:v9];

  v11 = v10;
LABEL_13:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBulletinNotificationRegistrationSource *)self deviceAddress];
  id v6 = [v5 idsIdentifier];
  [v4 encodeObject:v6 forKey:@"HMDBNRS.ck.dii"];

  uint64_t v7 = [(HMDBulletinNotificationRegistrationSource *)self deviceAddress];
  v8 = [v7 idsDestination];
  [v4 encodeObject:v8 forKey:@"HMDBNRS.ck.did"];

  id v9 = [(HMDBulletinNotificationRegistrationSource *)self userUUID];
  [v4 encodeObject:v9 forKey:@"HMDBNRS.ck.uu"];
}

- (unint64_t)hash
{
  v2 = [(HMDBulletinNotificationRegistrationSource *)self deviceAddress];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(HMDBulletinNotificationRegistrationSource *)self deviceAddress];
    v8 = [v6 deviceAddress];
    if ([v7 isEqual:v8])
    {
      id v9 = [(HMDBulletinNotificationRegistrationSource *)self userUUID];
      v10 = [v6 userUUID];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)serializedRegistrationForRemoteMessage
{
  v15[4] = *MEMORY[0x263EF8340];
  v14[0] = @"HMDBNRS.reg.type";
  unint64_t v3 = [(id)objc_opt_class() type];
  v15[0] = v3;
  v14[1] = @"HMDBNRS.ck.dii";
  id v4 = [(HMDBulletinNotificationRegistrationSource *)self deviceAddress];
  v5 = [v4 idsIdentifier];
  id v6 = [v5 UUIDString];
  v15[1] = v6;
  v14[2] = @"HMDBNRS.ck.did";
  uint64_t v7 = [(HMDBulletinNotificationRegistrationSource *)self deviceAddress];
  v8 = [v7 idsDestination];
  v15[2] = v8;
  v14[3] = @"HMDBNRS.ck.uu";
  id v9 = [(HMDBulletinNotificationRegistrationSource *)self userUUID];
  v10 = [v9 UUIDString];
  v15[3] = v10;
  char v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  v12 = (void *)[v11 mutableCopy];

  return v12;
}

- (HMDBulletinNotificationRegistrationSource)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"HMDBNRS.ck.dii"];
  if (!v5)
  {
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  id v6 = (void *)v5;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"HMDBNRS.ck.did"];
    if (!v8)
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        int v25 = 138543618;
        v26 = v20;
        __int16 v27 = 2112;
        uint64_t v28 = 0;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded deviceIdsDestination: %@", (uint8_t *)&v25, 0x16u);
      }
      v14 = 0;
      goto LABEL_17;
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"HMDBNRS.ck.uu"];
    if (v9)
    {
      v10 = (void *)v9;
      char v11 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
      if (v11)
      {
        v12 = [[HMDDeviceAddress alloc] initWithIDSIdentifier:v7 idsDestination:v8];
        v13 = [(HMDBulletinNotificationRegistrationSource *)self initWithUserUUID:v11 deviceAddress:v12];

        v14 = v13;
      }
      else
      {
        uint64_t v21 = (void *)MEMORY[0x230FBD990]();
        v13 = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          int v25 = 138543618;
          v26 = v23;
          __int16 v27 = 2112;
          uint64_t v28 = 0;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded userUUID: %@", (uint8_t *)&v25, 0x16u);
        }
        v14 = 0;
      }

LABEL_17:
      goto LABEL_18;
    }
LABEL_20:
    _HMFPreconditionFailure();
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  v13 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v17 = HMFGetLogIdentifier();
    int v25 = 138543618;
    v26 = v17;
    __int16 v27 = 2112;
    uint64_t v28 = 0;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded deviceIdsIdentifier: %@", (uint8_t *)&v25, 0x16u);
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (HMDDevice)device
{
  unint64_t v3 = [HMDDevice alloc];
  id v4 = [(HMDBulletinNotificationRegistrationSource *)self deviceAddress];
  uint64_t v5 = [(HMDDevice *)v3 initWithDeviceAddress:v4];

  return v5;
}

- (HMDBulletinNotificationRegistrationSource)initWithUserUUID:(id)a3 deviceAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (void *)_HMFPreconditionFailure();
    return (HMDBulletinNotificationRegistrationSource *)+[HMDBulletinNotificationRegistrationSource doesTypeMatch:v17 against:v18];
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDBulletinNotificationRegistrationSource;
  uint64_t v9 = [(HMDBulletinNotificationRegistrationSource *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    userUUID = v9->_userUUID;
    v9->_userUUID = (NSUUID *)v10;

    uint64_t v12 = [v8 copy];
    deviceAddress = v9->_deviceAddress;
    v9->_deviceAddress = (HMDDeviceAddress *)v12;
  }
  return v9;
}

+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4
{
  id v5 = a4;
  id v6 = [a3 objectForKeyedSubscript:@"HMDBNRS.reg.type"];
  char v7 = [v6 isEqualToString:v5];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"HMDBNRS.type";
}

@end