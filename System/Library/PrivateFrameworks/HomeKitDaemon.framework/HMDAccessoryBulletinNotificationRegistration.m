@interface HMDAccessoryBulletinNotificationRegistration
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 conditions:(id)a6;
- (HMDAccessoryBulletinNotificationRegistration)initWithCoder:(id)a3;
- (HMDAccessoryBulletinNotificationRegistration)initWithDictionary:(id)a3;
- (NSNumber)characteristicInstanceID;
- (NSNumber)serviceInstanceID;
- (NSUUID)accessoryUUID;
- (id)attributeDescriptions;
- (id)serializedRegistrationForRemoteMessage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAccessoryBulletinNotificationRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicInstanceID, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSNumber)characteristicInstanceID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
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
  v17[3] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v16 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDAccessoryBulletinNotificationRegistration *)self accessoryUUID];
  v6 = (void *)[v4 initWithName:@"accessoryUUID" value:v5];
  v17[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDAccessoryBulletinNotificationRegistration *)self serviceInstanceID];
  v9 = (void *)[v7 initWithName:@"serviceInstanceID" value:v8];
  v17[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMDAccessoryBulletinNotificationRegistration *)self characteristicInstanceID];
  v12 = (void *)[v10 initWithName:@"characteristicInstanceID" value:v11];
  v17[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v14 = [v3 arrayByAddingObjectsFromArray:v13];

  return v14;
}

- (HMDAccessoryBulletinNotificationRegistration)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[HMDBulletinNotificationRegistration alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDABNR.ck.au"];
    if (v6)
    {
      id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDABNR.ck.sii"];
      if (v7)
      {
        v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDABNR.ck.cii"];
        if (v8)
        {
          v9 = [(HMDBulletinNotificationRegistration *)v5 conditions];
          self = [(HMDAccessoryBulletinNotificationRegistration *)self initWithAccessoryUUID:v6 serviceInstanceID:v7 characteristicInstanceID:v8 conditions:v9];

          id v10 = self;
        }
        else
        {
          v17 = (void *)MEMORY[0x230FBD990]();
          self = self;
          v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = HMFGetLogIdentifier();
            int v21 = 138543618;
            v22 = v19;
            __int16 v23 = 2112;
            uint64_t v24 = 0;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded characteristicInstanceID: %@", (uint8_t *)&v21, 0x16u);
          }
          id v10 = 0;
        }
      }
      else
      {
        v14 = (void *)MEMORY[0x230FBD990]();
        self = self;
        v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_super v16 = HMFGetLogIdentifier();
          int v21 = 138543618;
          v22 = v16;
          __int16 v23 = 2112;
          uint64_t v24 = 0;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded serviceInstanceID: %@", (uint8_t *)&v21, 0x16u);
        }
        id v10 = 0;
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      self = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v13;
        __int16 v23 = 2112;
        uint64_t v24 = 0;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded accessoryUUID: %@", (uint8_t *)&v21, 0x16u);
      }
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  id v4 = a3;
  [(HMDBulletinNotificationRegistration *)&v8 encodeWithCoder:v4];
  v5 = [(HMDAccessoryBulletinNotificationRegistration *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"HMDABNR.ck.au"];

  v6 = [(HMDAccessoryBulletinNotificationRegistration *)self serviceInstanceID];
  [v4 encodeObject:v6 forKey:@"HMDABNR.ck.sii"];

  id v7 = [(HMDAccessoryBulletinNotificationRegistration *)self characteristicInstanceID];
  [v4 encodeObject:v7 forKey:@"HMDABNR.ck.cii"];
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
    && (v15.receiver = self,
        v15.super_class = (Class)HMDAccessoryBulletinNotificationRegistration,
        [(HMDBulletinNotificationRegistration *)&v15 isEqual:v6]))
  {
    id v7 = [(HMDAccessoryBulletinNotificationRegistration *)self accessoryUUID];
    objc_super v8 = [v6 accessoryUUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMDAccessoryBulletinNotificationRegistration *)self serviceInstanceID];
      id v10 = [v6 serviceInstanceID];
      if ([v9 isEqual:v10])
      {
        v11 = [(HMDAccessoryBulletinNotificationRegistration *)self characteristicInstanceID];
        v12 = [v6 characteristicInstanceID];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)serializedRegistrationForRemoteMessage
{
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v10 serializedRegistrationForRemoteMessage];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDAccessoryBulletinNotificationRegistration *)self accessoryUUID];
  id v6 = [v5 UUIDString];
  [v4 setObject:v6 forKeyedSubscript:@"HMDABNR.ck.au"];

  id v7 = [(HMDAccessoryBulletinNotificationRegistration *)self serviceInstanceID];
  [v4 setObject:v7 forKeyedSubscript:@"HMDABNR.ck.sii"];

  objc_super v8 = [(HMDAccessoryBulletinNotificationRegistration *)self characteristicInstanceID];
  [v4 setObject:v8 forKeyedSubscript:@"HMDABNR.ck.cii"];

  return v4;
}

- (HMDAccessoryBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() type];
  LODWORD(v5) = [v5 doesTypeMatch:v4 against:v6];

  if (!v5)
  {
    v18 = 0;
    goto LABEL_7;
  }
  v26.receiver = self;
  v26.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  id v7 = [(HMDBulletinNotificationRegistration *)&v26 initWithDictionary:v4];
  if (!v7)
  {
LABEL_5:
    self = v7;
    v18 = self;
LABEL_7:

    return v18;
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"HMDABNR.ck.au"];
  if (v8)
  {
    v9 = (void *)v8;
    uint64_t v10 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v8];
    accessoryUUID = v7->_accessoryUUID;
    v7->_accessoryUUID = (NSUUID *)v10;

    v12 = [v4 objectForKeyedSubscript:@"HMDABNR.ck.sii"];
    uint64_t v13 = HAPInstanceIDFromValue();
    serviceInstanceID = v7->_serviceInstanceID;
    v7->_serviceInstanceID = (NSNumber *)v13;

    objc_super v15 = [v4 objectForKeyedSubscript:@"HMDABNR.ck.cii"];
    uint64_t v16 = HAPInstanceIDFromValue();
    characteristicInstanceID = v7->_characteristicInstanceID;
    v7->_characteristicInstanceID = (NSNumber *)v16;

    goto LABEL_5;
  }
  v20 = (HMDAccessoryBulletinNotificationRegistration *)_HMFPreconditionFailure();
  return [(HMDAccessoryBulletinNotificationRegistration *)v20 initWithAccessoryUUID:v22 serviceInstanceID:v23 characteristicInstanceID:v24 conditions:v25];
}

- (HMDAccessoryBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 conditions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    id v25 = (void *)_HMFPreconditionFailure();
    return (HMDAccessoryBulletinNotificationRegistration *)+[HMDAccessoryBulletinNotificationRegistration supportsSecureCoding];
  }
  v14 = v13;
  v27.receiver = self;
  v27.super_class = (Class)HMDAccessoryBulletinNotificationRegistration;
  objc_super v15 = [(HMDBulletinNotificationRegistration *)&v27 initWithConditions:v13];
  if (v15)
  {
    uint64_t v16 = [v10 copy];
    accessoryUUID = v15->_accessoryUUID;
    v15->_accessoryUUID = (NSUUID *)v16;

    v18 = (void *)[v11 copy];
    uint64_t v19 = HAPInstanceIDFromValue();
    serviceInstanceID = v15->_serviceInstanceID;
    v15->_serviceInstanceID = (NSNumber *)v19;

    SEL v21 = (void *)[v12 copy];
    uint64_t v22 = HAPInstanceIDFromValue();
    characteristicInstanceID = v15->_characteristicInstanceID;
    v15->_characteristicInstanceID = (NSNumber *)v22;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"HMDABNR.type";
}

@end