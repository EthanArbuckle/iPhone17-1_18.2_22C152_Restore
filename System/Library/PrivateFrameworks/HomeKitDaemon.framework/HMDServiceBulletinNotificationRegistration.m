@interface HMDServiceBulletinNotificationRegistration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDServiceBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 conditions:(id)a5;
- (HMDServiceBulletinNotificationRegistration)initWithCoder:(id)a3;
- (NSNumber)serviceInstanceID;
- (NSUUID)accessoryUUID;
- (id)attributeDescriptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDServiceBulletinNotificationRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSNumber)serviceInstanceID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)HMDServiceBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDServiceBulletinNotificationRegistration *)self accessoryUUID];
  v6 = (void *)[v4 initWithName:@"accessoryUUID" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDServiceBulletinNotificationRegistration *)self serviceInstanceID];
  v9 = (void *)[v7 initWithName:@"serviceInstanceID" value:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (HMDServiceBulletinNotificationRegistration)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[HMDBulletinNotificationRegistration alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDSBNR.ck.au"];
    if (v6)
    {
      id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDSBNR.ck.sii"];
      if (v7)
      {
        v8 = [(HMDBulletinNotificationRegistration *)v5 conditions];
        self = [(HMDServiceBulletinNotificationRegistration *)self initWithAccessoryUUID:v6 serviceInstanceID:v7 conditions:v8];

        v9 = self;
      }
      else
      {
        objc_super v13 = (void *)MEMORY[0x230FBD990]();
        self = self;
        v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = HMFGetLogIdentifier();
          int v17 = 138543618;
          v18 = v15;
          __int16 v19 = 2112;
          uint64_t v20 = 0;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded serviceInstanceID: %@", (uint8_t *)&v17, 0x16u);
        }
        v9 = 0;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      self = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v17 = 138543618;
        v18 = v12;
        __int16 v19 = 2112;
        uint64_t v20 = 0;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded accessoryUUID: %@", (uint8_t *)&v17, 0x16u);
      }
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDServiceBulletinNotificationRegistration;
  id v4 = a3;
  [(HMDBulletinNotificationRegistration *)&v7 encodeWithCoder:v4];
  v5 = [(HMDServiceBulletinNotificationRegistration *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"HMDSBNR.ck.au"];

  v6 = [(HMDServiceBulletinNotificationRegistration *)self serviceInstanceID];
  [v4 encodeObject:v6 forKey:@"HMDSBNR.ck.sii"];
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
  if (v6
    && (v13.receiver = self,
        v13.super_class = (Class)HMDServiceBulletinNotificationRegistration,
        [(HMDBulletinNotificationRegistration *)&v13 isEqual:v6]))
  {
    objc_super v7 = [(HMDServiceBulletinNotificationRegistration *)self accessoryUUID];
    v8 = [v6 accessoryUUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMDServiceBulletinNotificationRegistration *)self serviceInstanceID];
      v10 = [v6 serviceInstanceID];
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

- (HMDServiceBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 conditions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v9)
  {
LABEL_7:
    v18 = (void *)_HMFPreconditionFailure();
    return (HMDServiceBulletinNotificationRegistration *)+[HMDServiceBulletinNotificationRegistration supportsSecureCoding];
  }
  char v11 = v10;
  v20.receiver = self;
  v20.super_class = (Class)HMDServiceBulletinNotificationRegistration;
  v12 = [(HMDBulletinNotificationRegistration *)&v20 initWithConditions:v10];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    accessoryUUID = v12->_accessoryUUID;
    v12->_accessoryUUID = (NSUUID *)v13;

    uint64_t v15 = [v9 copy];
    serviceInstanceID = v12->_serviceInstanceID;
    v12->_serviceInstanceID = (NSNumber *)v15;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end