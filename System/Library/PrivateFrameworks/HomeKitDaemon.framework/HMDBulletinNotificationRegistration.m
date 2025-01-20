@interface HMDBulletinNotificationRegistration
+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDBulletinNotificationRegistration)initWithCoder:(id)a3;
- (HMDBulletinNotificationRegistration)initWithConditions:(id)a3;
- (HMDBulletinNotificationRegistration)initWithDictionary:(id)a3;
- (NSPredicate)predicate;
- (NSSet)conditions;
- (id)attributeDescriptions;
- (id)serializedRegistrationForRemoteMessage;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDBulletinNotificationRegistration

- (void).cxx_destruct
{
}

- (NSSet)conditions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDBulletinNotificationRegistration *)self conditions];
  v5 = (void *)[v3 initWithName:@"conditions" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDBulletinNotificationRegistration)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v7 = [v5 setWithArray:v6];
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"HMDBNR.ck.c"];

  if (v8)
  {
    v9 = [(HMDBulletinNotificationRegistration *)self initWithConditions:v8];
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded conditions: %@", (uint8_t *)&v15, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinNotificationRegistration *)self conditions];
  [v4 encodeObject:v5 forKey:@"HMDBNR.ck.c"];
}

- (unint64_t)hash
{
  v2 = [(HMDBulletinNotificationRegistration *)self conditions];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMDBulletinNotificationRegistration *)self conditions];
    v8 = [v6 conditions];
    char v9 = [v7 isEqualToSet:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)serializedRegistrationForRemoteMessage
{
  v15[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(HMDBulletinNotificationRegistration *)self conditions];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(HMDBulletinNotificationRegistration *)self conditions];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__HMDBulletinNotificationRegistration_serializedRegistrationForRemoteMessage__block_invoke;
  v12[3] = &unk_264A18F78;
  v12[4] = self;
  id v13 = v5;
  id v7 = v5;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

  v14[0] = @"HMDBNR.reg.type";
  v8 = [(id)objc_opt_class() type];
  v15[0] = v8;
  v14[1] = @"HMDBNR.ck.c";
  char v9 = (void *)[v7 copy];
  v15[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v10;
}

void __77__HMDBulletinNotificationRegistration_serializedRegistrationForRemoteMessage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 serializedRegistrationForRemoteMessage];
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize condition %@ for remote message", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (HMDBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [v5 objectForKeyedSubscript:@"HMDBNR.ck.c"];

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __58__HMDBulletinNotificationRegistration_initWithDictionary___block_invoke;
  int v15 = &unk_264A2F140;
  v8 = self;
  v16 = v8;
  id v17 = v6;
  id v9 = v6;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v12);
  v10 = -[HMDBulletinNotificationRegistration initWithConditions:](v8, "initWithConditions:", v9, v12, v13, v14, v15);

  return v10;
}

void __58__HMDBulletinNotificationRegistration_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = off_264A12560;
  id v6 = [(id)objc_opt_class() type];
  LOBYTE(v4) = [(id)v4 doesTypeMatch:v3 against:v6];

  if ((v4 & 1) != 0
    || (uint64_t v7 = objc_opt_class(),
        id v5 = off_264A12598,
        [(id)objc_opt_class() type],
        v8 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v7) = [(id)v7 doesTypeMatch:v3 against:v8],
        v8,
        (v7 & 1) != 0))
  {
    uint64_t v9 = [objc_alloc(*v5) initWithDictionary:v3];
    if (v9)
    {
      v10 = (void *)v9;
      [*(id *)(a1 + 40) addObject:v9];
    }
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v14;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Dropping unknown type : %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (NSPredicate)predicate
{
  v2 = [(HMDBulletinNotificationRegistration *)self conditions];
  id v3 = +[HMDNotificationConditionConverter predicatesFromConditions:v2];
  uint64_t v4 = [v3 allObjects];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __48__HMDBulletinNotificationRegistration_predicate__block_invoke;
  v8[3] = &unk_264A29A30;
  id v9 = v4;
  id v5 = v4;
  id v6 = __48__HMDBulletinNotificationRegistration_predicate__block_invoke((uint64_t)v8);

  return (NSPredicate *)v6;
}

id __48__HMDBulletinNotificationRegistration_predicate__block_invoke(uint64_t a1)
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

- (HMDBulletinNotificationRegistration)initWithConditions:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)HMDBulletinNotificationRegistration;
    uint64_t v7 = [(HMDBulletinNotificationRegistration *)&v14 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_conditions, a3);
    }

    return v8;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (HMDBulletinNotificationRegistration *)+[HMDBulletinNotificationRegistration doesTypeMatch:v12 against:v13];
  }
}

+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4
{
  id v5 = a4;
  id v6 = [a3 objectForKeyedSubscript:@"HMDBNR.reg.type"];
  char v7 = [v6 isEqualToString:v5];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end