@interface HMDCameraSignificantEventBulletinNotificationRegistrationRemote
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDBulletinNotificationRegistrationSource)source;
- (HMDCameraSignificantEventBulletinNotificationRegistration)registration;
- (HMDCameraSignificantEventBulletinNotificationRegistrationRemote)initWithCameraCameraSignificantEventBulletinNotificationRegistration:(id)a3 source:(id)a4;
- (HMDCameraSignificantEventBulletinNotificationRegistrationRemote)initWithCoder:(id)a3;
- (id)attributeDescriptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraSignificantEventBulletinNotificationRegistrationRemote

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_registration, 0);
}

- (HMDBulletinNotificationRegistrationSource)source
{
  return (HMDBulletinNotificationRegistrationSource *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCameraSignificantEventBulletinNotificationRegistration)registration
{
  return (HMDCameraSignificantEventBulletinNotificationRegistration *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDCameraSignificantEventBulletinNotificationRegistrationRemote *)self registration];
  v5 = (void *)[v3 initWithName:@"registration" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCameraSignificantEventBulletinNotificationRegistrationRemote *)self source];
  v8 = (void *)[v6 initWithName:@"source" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDCameraSignificantEventBulletinNotificationRegistrationRemote)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDCSEBNRR.ck.r"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDCSEBNRR.ck.s"];
    if (v6)
    {
      v7 = [(HMDCameraSignificantEventBulletinNotificationRegistrationRemote *)self initWithCameraCameraSignificantEventBulletinNotificationRegistration:v5 source:v6];
      v8 = v7;
    }
    else
    {
      v12 = (void *)MEMORY[0x230FBD990]();
      v7 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = HMFGetLogIdentifier();
        int v16 = 138543618;
        v17 = v14;
        __int16 v18 = 2112;
        uint64_t v19 = 0;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded source: %@", (uint8_t *)&v16, 0x16u);
      }
      v8 = 0;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded registration: %@", (uint8_t *)&v16, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraSignificantEventBulletinNotificationRegistrationRemote *)self registration];
  [v4 encodeObject:v5 forKey:@"HMDCSEBNRR.ck.r"];

  id v6 = [(HMDCameraSignificantEventBulletinNotificationRegistrationRemote *)self source];
  [v4 encodeObject:v6 forKey:@"HMDCSEBNRR.ck.s"];
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
    v7 = [(HMDCameraSignificantEventBulletinNotificationRegistrationRemote *)self registration];
    v8 = [v6 registration];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMDCameraSignificantEventBulletinNotificationRegistrationRemote *)self source];
      v10 = [v6 source];
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

- (HMDCameraSignificantEventBulletinNotificationRegistrationRemote)initWithCameraCameraSignificantEventBulletinNotificationRegistration:(id)a3 source:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (void *)_HMFPreconditionFailure();
    return (HMDCameraSignificantEventBulletinNotificationRegistrationRemote *)+[HMDCameraSignificantEventBulletinNotificationRegistrationRemote supportsSecureCoding];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistrationRemote;
  v10 = [(HMDCameraSignificantEventBulletinNotificationRegistrationRemote *)&v15 init];
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_registration, a3);
    objc_storeStrong((id *)&v11->_source, a4);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end