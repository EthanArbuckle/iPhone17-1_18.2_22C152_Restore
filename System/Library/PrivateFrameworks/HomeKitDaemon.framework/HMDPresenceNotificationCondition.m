@interface HMDPresenceNotificationCondition
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDPresenceNotificationCondition)initWithCoder:(id)a3;
- (HMDPresenceNotificationCondition)initWithDictionary:(id)a3;
- (HMDPresenceNotificationCondition)initWithPresenceEventType:(unint64_t)a3 presenceEventUserType:(unint64_t)a4 userUUIDs:(id)a5;
- (NSSet)userUUIDs;
- (id)attributeDescriptions;
- (id)serializedRegistrationForRemoteMessage;
- (unint64_t)hash;
- (unint64_t)presenceEventType;
- (unint64_t)presenceEventUserType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDPresenceNotificationCondition

- (void).cxx_destruct
{
}

- (NSSet)userUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)presenceEventUserType
{
  return self->_presenceEventUserType;
}

- (unint64_t)presenceEventType
{
  return self->_presenceEventType;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDPresenceNotificationCondition *)self presenceEventType];
  v4 = HMPresenceEventTypeAsString();
  v5 = (void *)[v3 initWithName:@"Presence Event Type" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDPresenceNotificationCondition *)self presenceEventUserType];
  v7 = HMPresenceEventUserTypeAsString();
  v8 = (void *)[v6 initWithName:@"Presence Event User Types" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDPresenceNotificationCondition *)self userUUIDs];
  v11 = (void *)[v9 initWithName:@"User UUIDs" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (HMDPresenceNotificationCondition)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HMDPSC.ck.pet"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HMDPSC.ck.peut"];
  v7 = (void *)MEMORY[0x263EFFA08];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  id v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HMDPSC.ck.uu"];

  v11 = [(HMDPresenceNotificationCondition *)self initWithPresenceEventType:v5 presenceEventUserType:v6 userUUIDs:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDPresenceNotificationCondition presenceEventType](self, "presenceEventType"), @"HMDPSC.ck.pet");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDPresenceNotificationCondition presenceEventUserType](self, "presenceEventUserType"), @"HMDPSC.ck.peut");
  uint64_t v5 = [(HMDPresenceNotificationCondition *)self userUUIDs];
  [v4 encodeObject:v5 forKey:@"HMDPSC.ck.uu"];

  objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"HMDPSC.ck.eu"];
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMDPresenceNotificationCondition *)self presenceEventType];
  return [(HMDPresenceNotificationCondition *)self presenceEventUserType] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (unint64_t v7 = [(HMDPresenceNotificationCondition *)self presenceEventType],
        v7 == [v6 presenceEventType])
    && (unint64_t v8 = [(HMDPresenceNotificationCondition *)self presenceEventUserType],
        v8 == [v6 presenceEventUserType]))
  {
    id v9 = [(HMDPresenceNotificationCondition *)self userUUIDs];
    v10 = [v6 userUUIDs];
    char v11 = [v9 isEqualToSet:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)serializedRegistrationForRemoteMessage
{
  v13.receiver = self;
  v13.super_class = (Class)HMDPresenceNotificationCondition;
  unint64_t v3 = [(HMDNotificationCondition *)&v13 serializedRegistrationForRemoteMessage];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDPresenceNotificationCondition presenceEventType](self, "presenceEventType"));
  [v4 setObject:v5 forKeyedSubscript:@"HMDPSC.ck.pet"];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDPresenceNotificationCondition presenceEventUserType](self, "presenceEventUserType"));
  [v4 setObject:v6 forKeyedSubscript:@"HMDPSC.ck.peut"];

  unint64_t v7 = [(HMDPresenceNotificationCondition *)self userUUIDs];
  unint64_t v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_17_174688);

  id v9 = [v8 allObjects];
  [v4 setObject:v9 forKeyedSubscript:@"HMDPSC.ck.uu"];

  v10 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
  char v11 = [v10 UUIDString];
  [v4 setObject:v11 forKeyedSubscript:@"HMDPSC.ck.eu"];

  return v4;
}

uint64_t __74__HMDPresenceNotificationCondition_serializedRegistrationForRemoteMessage__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (HMDPresenceNotificationCondition)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() type];
  LODWORD(v5) = [v5 doesTypeMatch:v4 against:v6];

  if (v5)
  {
    unint64_t v7 = [v4 objectForKeyedSubscript:@"HMDPSC.ck.pet"];
    uint64_t v8 = [v7 integerValue];

    id v9 = [v4 objectForKeyedSubscript:@"HMDPSC.ck.peut"];
    uint64_t v10 = [v9 integerValue];

    char v11 = (void *)MEMORY[0x263EFFA08];
    v12 = [v4 objectForKeyedSubscript:@"HMDPSC.ck.uu"];
    objc_super v13 = [v11 setWithArray:v12];

    v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_174690);
    self = [(HMDPresenceNotificationCondition *)self initWithPresenceEventType:v8 presenceEventUserType:v10 userUUIDs:v14];

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __55__HMDPresenceNotificationCondition_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (HMDPresenceNotificationCondition)initWithPresenceEventType:(unint64_t)a3 presenceEventUserType:(unint64_t)a4 userUUIDs:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDPresenceNotificationCondition;
  uint64_t v10 = [(HMDPresenceNotificationCondition *)&v13 init];
  char v11 = v10;
  if (v10)
  {
    v10->_presenceEventType = a3;
    v10->_presenceEventUserType = a4;
    objc_storeStrong((id *)&v10->_userUUIDs, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"HMDPSC.type";
}

@end