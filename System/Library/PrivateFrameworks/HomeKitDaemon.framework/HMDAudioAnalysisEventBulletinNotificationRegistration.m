@interface HMDAudioAnalysisEventBulletinNotificationRegistration
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithCoder:(id)a3;
- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithConditions:(id)a3 audioAnalysisClassifierOptions:(unint64_t)a4 accessoryUUID:(id)a5;
- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithDictionary:(id)a3;
- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithLocalBulletinAudioAnalysisRegistration:(id)a3;
- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithPredicate:(id)a3 accessoryUUID:(id)a4;
- (NSUUID)accessoryUUID;
- (id)attributeDescriptions;
- (id)predicate;
- (id)serializedRegistrationForRemoteMessage;
- (unint64_t)audioAnalysisClassifierOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAudioAnalysisEventBulletinNotificationRegistration

- (void).cxx_destruct
{
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)audioAnalysisClassifierOptions
{
  return self->_audioAnalysisClassifierOptions;
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)self accessoryUUID];
  v6 = (void *)[v4 initWithName:@"accessoryUUID" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](self, "audioAnalysisClassifierOptions"));
  v9 = (void *)[v7 initWithName:@"classifiers" value:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [(id)objc_opt_class() type];
  LODWORD(v5) = [v5 doesTypeMatch:v4 against:v6];

  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
    id v7 = [(HMDBulletinNotificationRegistration *)&v16 initWithDictionary:v4];
    if (v7)
    {
      uint64_t v8 = objc_msgSend(v4, "hmf_UUIDForKey:", @"Accessory");
      accessoryUUID = v7->_accessoryUUID;
      v7->_accessoryUUID = (NSUUID *)v8;

      v10 = [v4 objectForKeyedSubscript:@"Classifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
      id v12 = v11;

      unsigned int v13 = [v12 unsignedIntValue];
      v7->_audioAnalysisClassifierOptions = v13;
    }
    self = v7;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)serializedRegistrationForRemoteMessage
{
  v9.receiver = self;
  v9.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
  v3 = [(HMDBulletinNotificationRegistration *)&v9 serializedRegistrationForRemoteMessage];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)self accessoryUUID];
  v6 = [v5 UUIDString];
  [v4 setObject:v6 forKeyedSubscript:@"Accessory"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](self, "audioAnalysisClassifierOptions"));
  [v4 setObject:v7 forKeyedSubscript:@"Classifier"];

  return v4;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [[HMDBulletinNotificationRegistration alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Accessory"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Classifier"];
    uint64_t v8 = [v7 unsignedIntegerValue];
    objc_super v9 = [(HMDBulletinNotificationRegistration *)v5 conditions];
    self = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)self initWithConditions:v9 audioAnalysisClassifierOptions:v8 accessoryUUID:v6];

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
  id v4 = a3;
  [(HMDBulletinNotificationRegistration *)&v7 encodeWithCoder:v4];
  v5 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"Accessory"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](self, "audioAnalysisClassifierOptions"));
  [v4 encodeObject:v6 forKey:@"Classifier"];
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
  v6 = v5;
  objc_super v7 = v6;
  if (v6 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v8 = [(HMDBulletinNotificationRegistration *)v6 conditions];
    objc_super v9 = [(HMDBulletinNotificationRegistration *)self conditions];
    if ([v8 isEqual:v9])
    {
      v10 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)v7 accessoryUUID];
      v11 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)self accessoryUUID];
      if ([v10 isEqual:v11])
      {
        uint64_t v12 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)v7 audioAnalysisClassifierOptions];
        BOOL v13 = v12 == [(HMDAudioAnalysisEventBulletinNotificationRegistration *)self audioAnalysisClassifierOptions];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithPredicate:(id)a3 accessoryUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[HMDNotificationConditionConverter conditionsFromPredicate:v7];
  objc_super v9 = [MEMORY[0x263F0E668] audioAnalysisNotificationOptionsInPredicate:v7];

  LODWORD(v7) = [v9 unsignedIntValue];
  v10 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)self initWithConditions:v8 audioAnalysisClassifierOptions:v7 accessoryUUID:v6];

  return v10;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithLocalBulletinAudioAnalysisRegistration:(id)a3
{
  id v4 = a3;
  v5 = [v4 conditions];
  if (v5)
  {
    id v6 = +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:v5];
  }
  else
  {
    id v7 = [MEMORY[0x263EFFA08] set];
    id v6 = +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:v7];
  }
  uint64_t v8 = [v4 classifierOptions];
  objc_super v9 = [v4 accessoryModelID];

  v10 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)self initWithConditions:v6 audioAnalysisClassifierOptions:v8 accessoryUUID:v9];
  return v10;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithConditions:(id)a3 audioAnalysisClassifierOptions:(unint64_t)a4 accessoryUUID:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
  v10 = [(HMDBulletinNotificationRegistration *)&v13 initWithConditions:a3];
  v11 = v10;
  if (v10)
  {
    v10->_audioAnalysisClassifierOptions = a4;
    objc_storeStrong((id *)&v10->_accessoryUUID, a5);
  }

  return v11;
}

- (id)predicate
{
  v3 = [(HMDBulletinNotificationRegistration *)self conditions];
  id v4 = +[HMDNotificationConditionConverter predicatesFromConditions:v3];
  v5 = [v4 allObjects];

  id v6 = objc_msgSend(MEMORY[0x263F0E120], "predicateForAudioAnalysisOptions:", -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](self, "audioAnalysisClassifierOptions"));
  id v7 = [v5 arrayByAddingObject:v6];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__HMDAudioAnalysisEventBulletinNotificationRegistration_predicate__block_invoke;
  v11[3] = &unk_264A29A30;
  id v12 = v7;
  id v8 = v7;
  id v9 = __66__HMDAudioAnalysisEventBulletinNotificationRegistration_predicate__block_invoke((uint64_t)v11);

  return v9;
}

id __66__HMDAudioAnalysisEventBulletinNotificationRegistration_predicate__block_invoke(uint64_t a1)
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

+ (id)type
{
  return @"HMDAudioAnalysisEventBulletinNotificationRegistration";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end