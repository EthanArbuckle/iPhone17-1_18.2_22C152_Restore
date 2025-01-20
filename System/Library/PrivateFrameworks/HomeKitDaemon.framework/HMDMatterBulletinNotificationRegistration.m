@interface HMDMatterBulletinNotificationRegistration
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDMatterBulletinNotificationRegistration)initWithCoder:(id)a3;
- (HMDMatterBulletinNotificationRegistration)initWithDictionary:(id)a3 withHome:(id)a4;
- (HMDMatterBulletinNotificationRegistration)initWithMatterPaths:(id)a3 conditions:(id)a4;
- (NSArray)matterPaths;
- (id)attributeDescriptions;
- (id)serializedRegistrationForRemoteMessage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDMatterBulletinNotificationRegistration

- (void).cxx_destruct
{
}

- (NSArray)matterPaths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HMDMatterBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDMatterBulletinNotificationRegistration *)self matterPaths];
  v6 = (void *)[v4 initWithName:@"matterPaths" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMDMatterBulletinNotificationRegistration)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[HMDBulletinNotificationRegistration alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDMBNR.ck.mp"];
    if (v6)
    {
      v7 = [(HMDBulletinNotificationRegistration *)v5 conditions];
      self = [(HMDMatterBulletinNotificationRegistration *)self initWithMatterPaths:v6 conditions:v7];

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
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded matterPaths: %@", (uint8_t *)&v13, 0x16u);
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
  v6.super_class = (Class)HMDMatterBulletinNotificationRegistration;
  id v4 = a3;
  [(HMDBulletinNotificationRegistration *)&v6 encodeWithCoder:v4];
  v5 = [(HMDMatterBulletinNotificationRegistration *)self matterPaths];
  [v4 encodeObject:v5 forKey:@"HMDMBNR.ck.mp"];
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
        v11.super_class = (Class)HMDMatterBulletinNotificationRegistration,
        [(HMDBulletinNotificationRegistration *)&v11 isEqual:v6]))
  {
    v7 = [(HMDMatterBulletinNotificationRegistration *)self matterPaths];
    v8 = [v6 matterPaths];
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
  v8.super_class = (Class)HMDMatterBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v8 serializedRegistrationForRemoteMessage];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDMatterBulletinNotificationRegistration *)self matterPaths];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_96578);

  [v4 setObject:v6 forKeyedSubscript:@"HMDMBNR.ck.mp"];
  return v4;
}

id __83__HMDMatterBulletinNotificationRegistration_serializedRegistrationForRemoteMessage__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF9A0];
  id v3 = a2;
  id v4 = [v2 dictionary];
  v5 = [v3 accessory];
  id v6 = [v5 uuid];
  v7 = [v6 UUIDString];
  [v4 setObject:v7 forKeyedSubscript:@"HMDMBNR.ck.auuid"];

  objc_super v8 = [v3 endpointID];
  [v4 setObject:v8 forKeyedSubscript:@"HMDMBNR.ck.eid"];

  char v9 = [v3 clusterID];
  [v4 setObject:v9 forKeyedSubscript:@"HMDMBNR.ck.cid"];

  objc_super v10 = [v3 attributeID];
  [v4 setObject:v10 forKeyedSubscript:@"HMDMBNR.ck.aid"];

  objc_super v11 = [v3 eventID];

  [v4 setObject:v11 forKeyedSubscript:@"HMDMBNR.ck.evid"];
  return v4;
}

- (HMDMatterBulletinNotificationRegistration)initWithDictionary:(id)a3 withHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = objc_opt_class();
  char v9 = [(id)objc_opt_class() type];
  LODWORD(v8) = [v8 doesTypeMatch:v6 against:v9];

  if (v8)
  {
    v20.receiver = self;
    v20.super_class = (Class)HMDMatterBulletinNotificationRegistration;
    objc_super v10 = [(HMDBulletinNotificationRegistration *)&v20 initWithDictionary:v6];
    if (v10)
    {
      objc_super v11 = objc_msgSend(v6, "hmf_arrayForKey:", @"HMDMBNR.ck.mp");
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __73__HMDMatterBulletinNotificationRegistration_initWithDictionary_withHome___block_invoke;
      v17[3] = &unk_264A1E2D8;
      id v18 = v7;
      v12 = v10;
      v19 = v12;
      uint64_t v13 = objc_msgSend(v11, "na_map:", v17);
      matterPaths = v12->_matterPaths;
      v12->_matterPaths = (NSArray *)v13;
    }
    self = v10;
    __int16 v15 = self;
  }
  else
  {
    __int16 v15 = 0;
  }

  return v15;
}

id __73__HMDMatterBulletinNotificationRegistration_initWithDictionary_withHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hmf_stringForKey:", @"HMDMBNR.ck.auuid");
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
  id v6 = [*(id *)(a1 + 32) accessoryWithUUID:v5];
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
    char v9 = objc_msgSend(v3, "hmf_numberForKey:", @"HMDMBNR.ck.eid");
    objc_super v10 = objc_msgSend(v3, "hmf_numberForKey:", @"HMDMBNR.ck.cid");
    objc_super v11 = objc_msgSend(v3, "hmf_numberForKey:", @"HMDMBNR.ck.aid");
    uint64_t v12 = objc_msgSend(v3, "hmf_numberForKey:", @"HMDMBNR.ck.evid");
    uint64_t v13 = (void *)v12;
    if (v11)
    {
      uint64_t v14 = +[HMDMatterPath PathWithAttributeID:v11 endpointID:v9 clusterID:v10];
    }
    else
    {
      if (!v12)
      {
        v19 = 0;
        goto LABEL_13;
      }
      uint64_t v14 = +[HMDMatterPath PathWithEventID:v12 endpointID:v9 clusterID:v10];
    }
    v19 = (void *)v14;
LABEL_13:
    [v19 setAccessory:v8];

    goto LABEL_14;
  }
  __int16 v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    id v18 = HMFGetLogIdentifier();
    int v21 = 138543618;
    v22 = v18;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find matter accessory for matter path: %@", (uint8_t *)&v21, 0x16u);
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (HMDMatterBulletinNotificationRegistration)initWithMatterPaths:(id)a3 conditions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    char v9 = v8;
    v15.receiver = self;
    v15.super_class = (Class)HMDMatterBulletinNotificationRegistration;
    objc_super v10 = [(HMDBulletinNotificationRegistration *)&v15 initWithConditions:v8];
    objc_super v11 = v10;
    if (v10) {
      objc_storeStrong((id *)&v10->_matterPaths, a3);
    }

    return v11;
  }
  else
  {
    uint64_t v13 = (void *)_HMFPreconditionFailure();
    return (HMDMatterBulletinNotificationRegistration *)+[HMDMatterBulletinNotificationRegistration supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"HMDMBNR.type";
}

@end