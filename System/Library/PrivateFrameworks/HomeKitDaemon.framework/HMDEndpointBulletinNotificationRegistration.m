@interface HMDEndpointBulletinNotificationRegistration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDEndpointBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 endpointID:(id)a4 conditions:(id)a5;
- (HMDEndpointBulletinNotificationRegistration)initWithCoder:(id)a3;
- (NSNumber)endpointID;
- (NSUUID)accessoryUUID;
- (id)attributeDescriptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDEndpointBulletinNotificationRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSNumber)endpointID
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
  v13.super_class = (Class)HMDEndpointBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDEndpointBulletinNotificationRegistration *)self accessoryUUID];
  v6 = (void *)[v4 initWithName:@"accessoryUUID" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDEndpointBulletinNotificationRegistration *)self endpointID];
  v9 = (void *)[v7 initWithName:@"endpointID" value:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (HMDEndpointBulletinNotificationRegistration)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[HMDBulletinNotificationRegistration alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDEBNR.ck.a"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDEBNR.ck.e"];
    v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      self = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v16 = 138543874;
        v17 = v12;
        __int16 v18 = 2112;
        v19 = v6;
        __int16 v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded accessoryUUID: %@ endpointID: %@", (uint8_t *)&v16, 0x20u);
      }
      v14 = 0;
    }
    else
    {
      objc_super v13 = [(HMDBulletinNotificationRegistration *)v5 conditions];
      self = [(HMDEndpointBulletinNotificationRegistration *)self initWithAccessoryUUID:v6 endpointID:v8 conditions:v13];

      v14 = self;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDEndpointBulletinNotificationRegistration;
  id v4 = a3;
  [(HMDBulletinNotificationRegistration *)&v7 encodeWithCoder:v4];
  v5 = [(HMDEndpointBulletinNotificationRegistration *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"HMDEBNR.ck.a"];

  v6 = [(HMDEndpointBulletinNotificationRegistration *)self endpointID];
  [v4 encodeObject:v6 forKey:@"HMDEBNR.ck.e"];
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
        v13.super_class = (Class)HMDEndpointBulletinNotificationRegistration,
        [(HMDBulletinNotificationRegistration *)&v13 isEqual:v6]))
  {
    objc_super v7 = [(HMDEndpointBulletinNotificationRegistration *)self accessoryUUID];
    v8 = [v6 accessoryUUID];
    if ([v7 isEqual:v8])
    {
      BOOL v9 = [(HMDEndpointBulletinNotificationRegistration *)self endpointID];
      v10 = [v6 endpointID];
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

- (HMDEndpointBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 endpointID:(id)a4 conditions:(id)a5
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
    __int16 v18 = (void *)_HMFPreconditionFailure();
    return (HMDEndpointBulletinNotificationRegistration *)+[HMDEndpointBulletinNotificationRegistration supportsSecureCoding];
  }
  char v11 = v10;
  v20.receiver = self;
  v20.super_class = (Class)HMDEndpointBulletinNotificationRegistration;
  v12 = [(HMDBulletinNotificationRegistration *)&v20 initWithConditions:v10];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    accessoryUUID = v12->_accessoryUUID;
    v12->_accessoryUUID = (NSUUID *)v13;

    uint64_t v15 = [v9 copy];
    endpointID = v12->_endpointID;
    v12->_endpointID = (NSNumber *)v15;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end