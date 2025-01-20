@interface HMDCameraSignificantEventBulletinNotificationRegistration
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDCameraSignificantEventBulletinNotificationRegistration)initWithCameraIdentifier:(id)a3 notificationModes:(unint64_t)a4 significantEventTypes:(unint64_t)a5 personFamiliarityOptions:(unint64_t)a6 conditions:(id)a7;
- (HMDCameraSignificantEventBulletinNotificationRegistration)initWithCoder:(id)a3;
- (HMDCameraSignificantEventBulletinNotificationRegistration)initWithDictionary:(id)a3;
- (NSUUID)cameraIdentifier;
- (id)attributeDescriptions;
- (id)predicate;
- (id)serializedRegistrationForRemoteMessage;
- (unint64_t)notificationModes;
- (unint64_t)personFamiliarityOptions;
- (unint64_t)significantEventTypes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraSignificantEventBulletinNotificationRegistration

- (void).cxx_destruct
{
}

- (unint64_t)personFamiliarityOptions
{
  return self->_personFamiliarityOptions;
}

- (unint64_t)significantEventTypes
{
  return self->_significantEventTypes;
}

- (unint64_t)notificationModes
{
  return self->_notificationModes;
}

- (NSUUID)cameraIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v21[4] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v20 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v19 = [(HMDCameraSignificantEventBulletinNotificationRegistration *)self cameraIdentifier];
  v5 = (void *)[v4 initWithName:@"Camera Identifier" value:v19];
  v21[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  unint64_t v18 = [(HMDCameraSignificantEventBulletinNotificationRegistration *)self notificationModes];
  v7 = NSPrintF();
  v8 = objc_msgSend(v6, "initWithName:value:", @"Notification Modes", v7, v18, &unk_2303E4950);
  v21[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCameraSignificantEventBulletinNotificationRegistration *)self significantEventTypes];
  v10 = HMCameraSignificantEventTypesAsString();
  v11 = (void *)[v9 initWithName:@"Significant Event Types" value:v10];
  v21[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCameraSignificantEventBulletinNotificationRegistration *)self personFamiliarityOptions];
  v13 = HMCameraSignificantEventPersonFamiliarityOptionsAsString();
  v14 = (void *)[v12 initWithName:@"Person Familiarity Options" value:v13];
  v21[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
  v16 = [v3 arrayByAddingObjectsFromArray:v15];

  return v16;
}

- (HMDCameraSignificantEventBulletinNotificationRegistration)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[HMDBulletinNotificationRegistration alloc] initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDCSEBNR.ck.ci"];
    if (v6)
    {
      uint64_t v7 = [v4 decodeIntegerForKey:@"HMDCSEBNR.ck.nm"];
      uint64_t v8 = [v4 decodeIntegerForKey:@"HMDCSEBNR.ck.set"];
      uint64_t v9 = [v4 decodeIntegerForKey:@"HMDCSEBNR.ck.pfo"];
      v10 = [(HMDBulletinNotificationRegistration *)v5 conditions];
      self = [(HMDCameraSignificantEventBulletinNotificationRegistration *)self initWithCameraIdentifier:v6 notificationModes:v7 significantEventTypes:v8 personFamiliarityOptions:v9 conditions:v10];

      v11 = self;
    }
    else
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      self = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = HMFGetLogIdentifier();
        int v16 = 138543618;
        v17 = v14;
        __int16 v18 = 2112;
        uint64_t v19 = 0;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded cameraIdentifier: %@", (uint8_t *)&v16, 0x16u);
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
  id v4 = a3;
  [(HMDBulletinNotificationRegistration *)&v6 encodeWithCoder:v4];
  v5 = [(HMDCameraSignificantEventBulletinNotificationRegistration *)self cameraIdentifier];
  [v4 encodeObject:v5 forKey:@"HMDCSEBNR.ck.ci"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDCameraSignificantEventBulletinNotificationRegistration notificationModes](self, "notificationModes"), @"HMDCSEBNR.ck.nm");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes"), @"HMDCSEBNR.ck.set");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDCameraSignificantEventBulletinNotificationRegistration personFamiliarityOptions](self, "personFamiliarityOptions"), @"HMDCSEBNR.ck.pfo");
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
    && (v14.receiver = self,
        v14.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration,
        [(HMDBulletinNotificationRegistration *)&v14 isEqual:v6]))
  {
    uint64_t v7 = [(HMDCameraSignificantEventBulletinNotificationRegistration *)self cameraIdentifier];
    uint64_t v8 = [v6 cameraIdentifier];
    if ([v7 isEqual:v8]
      && (unint64_t v9 = [(HMDCameraSignificantEventBulletinNotificationRegistration *)self notificationModes],
          v9 == [v6 notificationModes])
      && (unint64_t v10 = -[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes"), v10 == [v6 significantEventTypes]))
    {
      unint64_t v11 = [(HMDCameraSignificantEventBulletinNotificationRegistration *)self personFamiliarityOptions];
      BOOL v12 = v11 == [v6 personFamiliarityOptions];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)serializedRegistrationForRemoteMessage
{
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v11 serializedRegistrationForRemoteMessage];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDCameraSignificantEventBulletinNotificationRegistration *)self cameraIdentifier];
  id v6 = [v5 UUIDString];
  [v4 setObject:v6 forKeyedSubscript:@"HMDCSEBNR.ck.ci"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraSignificantEventBulletinNotificationRegistration notificationModes](self, "notificationModes"));
  [v4 setObject:v7 forKeyedSubscript:@"HMDCSEBNR.ck.nm"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes"));
  [v4 setObject:v8 forKeyedSubscript:@"HMDCSEBNR.ck.set"];

  unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraSignificantEventBulletinNotificationRegistration personFamiliarityOptions](self, "personFamiliarityOptions"));
  [v4 setObject:v9 forKeyedSubscript:@"HMDCSEBNR.ck.pfo"];

  return v4;
}

- (HMDCameraSignificantEventBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() type];
  LODWORD(v5) = [v5 doesTypeMatch:v4 against:v6];

  if (!v5)
  {
    v15 = 0;
    goto LABEL_7;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
  uint64_t v7 = [(HMDBulletinNotificationRegistration *)&v19 initWithDictionary:v4];
  if (!v7)
  {
LABEL_5:
    self = v7;
    v15 = self;
LABEL_7:

    return v15;
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"HMDCSEBNR.ck.ci"];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    uint64_t v10 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v8];
    cameraIdentifier = v7->_cameraIdentifier;
    v7->_cameraIdentifier = (NSUUID *)v10;

    BOOL v12 = [v4 objectForKeyedSubscript:@"HMDCSEBNR.ck.nm"];
    v7->_notificationModes = [v12 integerValue];

    v13 = [v4 objectForKeyedSubscript:@"HMDCSEBNR.ck.set"];
    v7->_significantEventTypes = [v13 integerValue];

    objc_super v14 = [v4 objectForKeyedSubscript:@"HMDCSEBNR.ck.pfo"];
    v7->_personFamiliarityOptions = [v14 integerValue];

    goto LABEL_5;
  }
  v17 = (HMDCameraSignificantEventBulletinNotificationRegistration *)_HMFPreconditionFailure();
  return (HMDCameraSignificantEventBulletinNotificationRegistration *)[(HMDCameraSignificantEventBulletinNotificationRegistration *)v17 predicate];
}

- (id)predicate
{
  v3 = [(HMDBulletinNotificationRegistration *)self conditions];
  id v4 = +[HMDNotificationConditionConverter predicatesFromConditions:v3];
  v5 = [v4 allObjects];

  if (([(HMDCameraSignificantEventBulletinNotificationRegistration *)self notificationModes] & 1) != 0
    || ([(HMDCameraSignificantEventBulletinNotificationRegistration *)self significantEventTypes] & 0x1F) != 0)
  {
    id v6 = objc_msgSend(MEMORY[0x263F0E188], "predicateForSignificantEventTypes:", -[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes"));
    uint64_t v7 = [v5 arrayByAddingObject:v6];

    v5 = (void *)v7;
  }
  if (([(HMDCameraSignificantEventBulletinNotificationRegistration *)self personFamiliarityOptions] & 7) != 0)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263F0E188], "predicateForPersonFamiliarityOptions:", -[HMDCameraSignificantEventBulletinNotificationRegistration personFamiliarityOptions](self, "personFamiliarityOptions"));
    uint64_t v9 = [v5 arrayByAddingObject:v8];

    v5 = (void *)v9;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__HMDCameraSignificantEventBulletinNotificationRegistration_predicate__block_invoke;
  v13[3] = &unk_264A29A30;
  id v14 = v5;
  id v10 = v5;
  objc_super v11 = __70__HMDCameraSignificantEventBulletinNotificationRegistration_predicate__block_invoke((uint64_t)v13);

  return v11;
}

id __70__HMDCameraSignificantEventBulletinNotificationRegistration_predicate__block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] < 2)
  {
    if ([*(id *)(a1 + 32) count] == 1)
    {
      v2 = [*(id *)(a1 + 32) firstObject];
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:*(void *)(a1 + 32)];
  }
  return v2;
}

- (HMDCameraSignificantEventBulletinNotificationRegistration)initWithCameraIdentifier:(id)a3 notificationModes:(unint64_t)a4 significantEventTypes:(unint64_t)a5 personFamiliarityOptions:(unint64_t)a6 conditions:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (v12)
  {
    id v14 = v13;
    v21.receiver = self;
    v21.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
    v15 = [(HMDBulletinNotificationRegistration *)&v21 initWithConditions:v13];
    if (v15)
    {
      uint64_t v16 = [v12 copy];
      cameraIdentifier = v15->_cameraIdentifier;
      v15->_cameraIdentifier = (NSUUID *)v16;

      v15->_notificationModes = a4;
      v15->_significantEventTypes = a5;
      v15->_personFamiliarityOptions = a6;
    }

    return v15;
  }
  else
  {
    objc_super v19 = (void *)_HMFPreconditionFailure();
    return (HMDCameraSignificantEventBulletinNotificationRegistration *)+[HMDCameraSignificantEventBulletinNotificationRegistration supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"HMDCSEBNR.type";
}

@end