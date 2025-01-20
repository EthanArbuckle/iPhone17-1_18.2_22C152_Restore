@interface HMDCameraAccessModeBulletinNotificationRegistration
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDCameraAccessModeBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 conditions:(id)a4;
- (HMDCameraAccessModeBulletinNotificationRegistration)initWithCoder:(id)a3;
- (HMDCameraAccessModeBulletinNotificationRegistration)initWithDictionary:(id)a3;
- (NSUUID)accessoryUUID;
- (id)attributeDescriptions;
- (id)serializedRegistrationForRemoteMessage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraAccessModeBulletinNotificationRegistration

- (void).cxx_destruct
{
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HMDCameraAccessModeBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDCameraAccessModeBulletinNotificationRegistration *)self accessoryUUID];
  v6 = (void *)[v4 initWithName:@"accessoryUUID" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMDCameraAccessModeBulletinNotificationRegistration)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[HMDBulletinNotificationRegistration alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDCAMBNR.ck.au"];
    if (v6)
    {
      v7 = [(HMDBulletinNotificationRegistration *)v5 conditions];
      self = [(HMDCameraAccessModeBulletinNotificationRegistration *)self initWithAccessoryUUID:v6 conditions:v7];

      v8 = self;
    }
    else
    {
      v9 = (void *)MEMORY[0x230FBD990]();
      self = self;
      objc_super v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        int v13 = 138543618;
        v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = 0;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded accessoryUUID: %@", (uint8_t *)&v13, 0x16u);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDCameraAccessModeBulletinNotificationRegistration;
  id v4 = a3;
  [(HMDBulletinNotificationRegistration *)&v6 encodeWithCoder:v4];
  v5 = [(HMDCameraAccessModeBulletinNotificationRegistration *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"HMDCAMBNR.ck.au"];
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
    && (v11.receiver = self,
        v11.super_class = (Class)HMDCameraAccessModeBulletinNotificationRegistration,
        [(HMDBulletinNotificationRegistration *)&v11 isEqual:v6]))
  {
    v7 = [(HMDCameraAccessModeBulletinNotificationRegistration *)self accessoryUUID];
    v8 = [v6 accessoryUUID];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)serializedRegistrationForRemoteMessage
{
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraAccessModeBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v8 serializedRegistrationForRemoteMessage];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDCameraAccessModeBulletinNotificationRegistration *)self accessoryUUID];
  id v6 = [v5 UUIDString];
  [v4 setObject:v6 forKeyedSubscript:@"HMDCAMBNR.ck.au"];

  return v4;
}

- (HMDCameraAccessModeBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() type];
  LODWORD(v5) = [v5 doesTypeMatch:v4 against:v6];

  if (!v5)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraAccessModeBulletinNotificationRegistration;
  v7 = [(HMDBulletinNotificationRegistration *)&v18 initWithDictionary:v4];
  if (!v7)
  {
LABEL_5:
    self = v7;
    v12 = self;
LABEL_7:

    return v12;
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"HMDCAMBNR.ck.au"];
  if (v8)
  {
    char v9 = (void *)v8;
    uint64_t v10 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v8];
    accessoryUUID = v7->_accessoryUUID;
    v7->_accessoryUUID = (NSUUID *)v10;

    goto LABEL_5;
  }
  v14 = (HMDCameraAccessModeBulletinNotificationRegistration *)_HMFPreconditionFailure();
  return [(HMDCameraAccessModeBulletinNotificationRegistration *)v14 initWithAccessoryUUID:v16 conditions:v17];
}

- (HMDCameraAccessModeBulletinNotificationRegistration)initWithAccessoryUUID:(id)a3 conditions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = v7;
    v15.receiver = self;
    v15.super_class = (Class)HMDCameraAccessModeBulletinNotificationRegistration;
    char v9 = [(HMDBulletinNotificationRegistration *)&v15 initWithConditions:v7];
    if (v9)
    {
      uint64_t v10 = [v6 copy];
      accessoryUUID = v9->_accessoryUUID;
      v9->_accessoryUUID = (NSUUID *)v10;
    }
    return v9;
  }
  else
  {
    int v13 = (void *)_HMFPreconditionFailure();
    return (HMDCameraAccessModeBulletinNotificationRegistration *)+[HMDCameraAccessModeBulletinNotificationRegistration supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"HMDCAMBNR.type";
}

@end