@interface HFDemoModeAccessory
+ (BOOL)_hasValidKeys:(id)a3;
+ (id)_demoModeAccessoryTypeToHomeKitAccessoryType;
+ (id)accessoryWithContentsOfDictionary:(id)a3 forHome:(id)a4;
- (BOOL)_isAppleInternalAccessory;
- (BOOL)_shouldShowAppleInternalManufacturerInfo;
- (BOOL)areNotificationsEnabled;
- (BOOL)hf_effectiveIsFavorite;
- (BOOL)hf_hasSetFavorite;
- (BOOL)hf_isFavorite;
- (BOOL)hf_isMediaAccessory;
- (BOOL)hf_shouldShowSoftwareUpdateInfo;
- (BOOL)isInternallyCertified;
- (BOOL)isReachable;
- (Class)hf_itemClass;
- (HFDemoModeAccessory)initWithContentsOfDictionary:(id)a3 forHome:(id)a4;
- (HFServiceNameComponents)hf_serviceNameComponents;
- (HFUserNotificationServiceSettings)hf_userNotificationSettings;
- (HMHome)home;
- (NSPredicate)notificationCondition;
- (NSString)description;
- (NSString)firmwareVersion;
- (NSString)manufacturer;
- (NSString)model;
- (NSUUID)internalUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (id)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hf_updateIsFavorite:(BOOL)a3;
- (id)hf_updateUserNotificationSettings:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)name;
- (id)room;
- (id)serialNumber;
- (id)services;
- (id)symptomsHandler;
- (int64_t)certificationStatus;
- (void)_updateManufacturerInfoWithString:(id)a3 forKey:(id)a4;
- (void)setHome:(id)a3;
- (void)setInternalUniqueIdentifier:(id)a3;
- (void)setIsInternallyCertified:(BOOL)a3;
- (void)setNotificationCondition:(id)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
@end

@implementation HFDemoModeAccessory

+ (id)accessoryWithContentsOfDictionary:(id)a3 forHome:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HFDemoModeAccessory alloc] initWithContentsOfDictionary:v6 forHome:v5];

  return v7;
}

+ (BOOL)_hasValidKeys:(id)a3
{
  v18[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v18[0] = @"name";
  v18[1] = @"type";
  v18[2] = @"room";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        BOOL v11 = v10 != 0;

        v8 &= v11;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (NSUUID)uniqueIdentifier
{
  internalUniqueIdentifier = self->_internalUniqueIdentifier;
  if (!internalUniqueIdentifier)
  {
    id v4 = [(HFDemoModeAccessory *)self applicationData];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"UUID"];

    if (v5)
    {
      uint64_t v6 = (NSUUID *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
      uint64_t v7 = self->_internalUniqueIdentifier;
      self->_internalUniqueIdentifier = v6;
    }
    else
    {
      char v8 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
      v9 = self->_internalUniqueIdentifier;
      self->_internalUniqueIdentifier = v8;

      uint64_t v7 = [(NSUUID *)self->_internalUniqueIdentifier UUIDString];
      v10 = [(HFDemoModeAccessory *)self applicationData];
      [v10 setObject:v7 forKeyedSubscript:@"UUID"];
    }
    internalUniqueIdentifier = self->_internalUniqueIdentifier;
  }
  return internalUniqueIdentifier;
}

- (NSString)firmwareVersion
{
  v2 = [(HFDemoModeAccessory *)self applicationData];
  id v3 = [v2 objectForKeyedSubscript:@"manufacturerInfo"];

  id v4 = [v3 objectForKeyedSubscript:@"firmware"];

  return (NSString *)v4;
}

- (NSString)manufacturer
{
  v2 = [(HFDemoModeAccessory *)self applicationData];
  id v3 = [v2 objectForKeyedSubscript:@"manufacturerInfo"];

  id v4 = [v3 objectForKeyedSubscript:@"name"];

  return (NSString *)v4;
}

- (NSString)model
{
  id v3 = [(HFDemoModeAccessory *)self applicationData];
  id v4 = [v3 objectForKeyedSubscript:@"manufacturerInfo"];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"model"];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if ([(HFDemoModeAccessory *)self _isAppleInternalAccessory] {
         && [(HFDemoModeAccessory *)self _shouldShowAppleInternalManufacturerInfo])
  }
  {
    char v8 = [(HFDemoModeAccessory *)self uniqueIdentifier];
    v9 = [v8 UUIDString];

    v10 = objc_msgSend(v9, "substringWithRange:", objc_msgSend(v9, "length") - 7, 7);
    id v7 = [NSString stringWithFormat:@"993-%@/A", v10];
    [(HFDemoModeAccessory *)self _updateManufacturerInfoWithString:v7 forKey:@"model"];
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (id)serialNumber
{
  id v3 = [(HFDemoModeAccessory *)self applicationData];
  id v4 = [v3 objectForKeyedSubscript:@"manufacturerInfo"];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"serialNumber"];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if ([(HFDemoModeAccessory *)self _isAppleInternalAccessory] {
         && [(HFDemoModeAccessory *)self _shouldShowAppleInternalManufacturerInfo])
  }
  {
    char v8 = [(HFDemoModeAccessory *)self uniqueIdentifier];
    v9 = [v8 UUIDString];
    v10 = [v9 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26C081158];

    objc_msgSend(v10, "substringWithRange:", 0, 12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(HFDemoModeAccessory *)self _updateManufacturerInfoWithString:v7 forKey:@"serialNumber"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)room
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 home];

  uint64_t v5 = [v4 rooms];
  uint64_t v6 = (void *)MEMORY[0x263F08A98];
  id v7 = [(HFDemoModeAccessory *)self applicationData];
  char v8 = [v7 objectForKeyedSubscript:@"room"];
  v9 = [v6 predicateWithFormat:@"name = %@", v8];

  v10 = [v5 filteredArrayUsingPredicate:v9];

  if ([v10 count] == 1) {
    [v10 objectAtIndexedSubscript:0];
  }
  else {
  BOOL v11 = [v4 roomForEntireHome];
  }

  return v11;
}

- (id)name
{
  v2 = [(HFDemoModeAccessory *)self hf_serviceNameComponents];
  id v3 = [v2 serviceName];

  return v3;
}

- (id)category
{
  id v3 = [(HFDemoModeAccessory *)self applicationData];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"type"];
  uint64_t v5 = (void *)v4;
  uint64_t v6 = @"Other";
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  id v7 = v6;

  char v8 = [(id)objc_opt_class() _demoModeAccessoryTypeToHomeKitAccessoryType];
  v9 = [(HFDemoModeAccessory *)self applicationData];
  v10 = [v9 objectForKeyedSubscript:@"type"];
  uint64_t v11 = [v8 objectForKeyedSubscript:v10];
  v12 = (void *)v11;
  long long v13 = (void *)*MEMORY[0x263F0B0D0];
  if (v11) {
    long long v13 = (void *)v11;
  }
  id v14 = v13;

  long long v15 = (void *)[objc_alloc(MEMORY[0x263F0DF40]) initWithType:v14 name:v7];
  return v15;
}

- (id)services
{
  return (id)[MEMORY[0x263EFF8C0] array];
}

- (BOOL)isReachable
{
  return 1;
}

- (id)symptomsHandler
{
  return 0;
}

- (int64_t)certificationStatus
{
  if ([(HFDemoModeAccessory *)self isInternallyCertified]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)hf_shouldShowSoftwareUpdateInfo
{
  return 0;
}

- (BOOL)hf_isMediaAccessory
{
  if ([(HMAccessory *)self hf_isHomePod]) {
    return 1;
  }
  return [(HMAccessory *)self hf_isAppleTV];
}

- (BOOL)hf_isFavorite
{
  v2 = [(HFDemoModeAccessory *)self applicationData];
  id v3 = [v2 objectForKeyedSubscript:@"HFApplicationDataAccessoryIsFavoriteKey"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)hf_hasSetFavorite
{
  v2 = [(HFDemoModeAccessory *)self applicationData];
  id v3 = [v2 objectForKeyedSubscript:@"HFApplicationDataAccessoryIsFavoriteKey"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hf_effectiveIsFavorite
{
  if ([(HFDemoModeAccessory *)self hf_isFavorite]) {
    return 1;
  }
  else {
    return ![(HFDemoModeAccessory *)self hf_hasSetFavorite];
  }
}

- (id)hf_updateIsFavorite:(BOOL)a3
{
  BOOL v4 = [NSNumber numberWithBool:a3];
  uint64_t v5 = [(HFDemoModeAccessory *)self applicationData];
  [v5 setObject:v4 forKeyedSubscript:@"HFApplicationDataAccessoryIsFavoriteKey"];

  uint64_t v6 = (void *)MEMORY[0x263F58190];
  return (id)[v6 futureWithNoResult];
}

- (HFUserNotificationServiceSettings)hf_userNotificationSettings
{
  return 0;
}

- (id)hf_updateUserNotificationSettings:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", a3);
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  id v3 = [(HFDemoModeAccessory *)self applicationData];
  BOOL v4 = [v3 objectForKeyedSubscript:@"name"];

  uint64_t v5 = [(HFDemoModeAccessory *)self applicationData];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"room"];

  id v7 = [[HFServiceNameComponents alloc] initWithRawServiceName:v4 rawRoomName:v6];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [HFDemoModeAccessory alloc];
  uint64_t v5 = [(HFDemoModeAccessory *)self applicationData];
  uint64_t v6 = [v5 dictionary];
  id v7 = [(HFDemoModeAccessory *)self home];
  char v8 = [(HFDemoModeAccessory *)v4 initWithContentsOfDictionary:v6 forHome:v7];

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BOOL v4 = [HFDemoModeAccessory alloc];
  uint64_t v5 = [(HFDemoModeAccessory *)self applicationData];
  uint64_t v6 = [v5 dictionary];
  id v7 = [(HFDemoModeAccessory *)self home];
  char v8 = [(HFDemoModeAccessory *)v4 initWithContentsOfDictionary:v6 forHome:v7];

  return v8;
}

- (HFDemoModeAccessory)initWithContentsOfDictionary:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() _hasValidKeys:v6])
  {
    v16.receiver = self;
    v16.super_class = (Class)HFDemoModeAccessory;
    char v8 = [(HFDemoModeAccessory *)&v16 init];
    v9 = v8;
    if (v8)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __60__HFDemoModeAccessory_initWithContentsOfDictionary_forHome___block_invoke;
      v14[3] = &unk_264097C38;
      v10 = v8;
      long long v15 = v10;
      [v6 enumerateKeysAndObjectsUsingBlock:v14];
      objc_storeStrong(v10 + 80, a4);
      uint64_t v11 = [v6 objectForKeyedSubscript:@"type"];
      if (+[HFDemoModeAccessoryManager isInternalAccessoryType:v11])
      {
        [v10 setIsInternallyCertified:1];
      }
    }
    self = v9;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __60__HFDemoModeAccessory_initWithContentsOfDictionary_forHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 applicationData];
  [v7 setObject:v5 forKey:v6];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HFDemoModeAccessory *)self name];
  id v6 = [(HFDemoModeAccessory *)self uniqueIdentifier];
  id v7 = [v6 UUIDString];
  BOOL v8 = [(HFDemoModeAccessory *)self isReachable];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  v10 = [v3 stringWithFormat:@"<%@, Name = %@, Identifier = %@, Reachable = %@>", v4, v5, v7, v9];

  return (NSString *)v10;
}

+ (id)_demoModeAccessoryTypeToHomeKitAccessoryType
{
  if (_MergedGlobals_2_2 != -1) {
    dispatch_once(&_MergedGlobals_2_2, &__block_literal_global_54_1);
  }
  v2 = (void *)qword_26AB2EA28;
  return v2;
}

void __67__HFDemoModeAccessory__demoModeAccessoryTypeToHomeKitAccessoryType__block_invoke_2()
{
  v5[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0B030];
  v4[0] = @"AppleTV";
  v4[1] = @"HomePod";
  uint64_t v1 = *MEMORY[0x263F0B0A0];
  v5[0] = v0;
  v5[1] = v1;
  v4[2] = @"HomePodMini";
  v4[3] = @"MediaSystem-HomePod";
  v5[2] = v1;
  v5[3] = v1;
  v4[4] = @"MediaSystem-HomePodMini";
  v5[4] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  id v3 = (void *)qword_26AB2EA28;
  qword_26AB2EA28 = v2;
}

- (void)_updateManufacturerInfoWithString:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(HFDemoModeAccessory *)self applicationData];
  id v11 = [v8 objectForKeyedSubscript:@"manufacturerInfo"];

  v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v11];
  [v9 setObject:v7 forKeyedSubscript:v6];

  v10 = [(HFDemoModeAccessory *)self applicationData];
  [v10 setObject:v9 forKeyedSubscript:@"manufacturerInfo"];
}

- (BOOL)_isAppleInternalAccessory
{
  uint64_t v2 = [(HFDemoModeAccessory *)self applicationData];
  id v3 = [v2 objectForKeyedSubscript:@"type"];

  BOOL v4 = v3
    && (([v3 isEqualToString:@"HomePod"] & 1) != 0
     || ([v3 isEqualToString:@"HomePodMini"] & 1) != 0
     || ([v3 isEqualToString:@"MediaSystem-HomePod"] & 1) != 0
     || ([v3 isEqualToString:@"MediaSystem-HomePodMini"] & 1) != 0
     || ([v3 isEqualToString:@"AppleTV"] & 1) != 0);

  return v4;
}

- (BOOL)_shouldShowAppleInternalManufacturerInfo
{
  id v3 = [(HFDemoModeAccessory *)self applicationData];
  BOOL v4 = [v3 objectForKeyedSubscript:@"type"];
  if ([v4 isEqualToString:@"MediaSystem-HomePod"])
  {
    id v5 = [(HFDemoModeAccessory *)self applicationData];
    id v6 = [v5 objectForKeyedSubscript:@"type"];
    int v7 = [v6 isEqualToString:@"MediaSystem-HomePodMini"] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (NSUUID)internalUniqueIdentifier
{
  return self->_internalUniqueIdentifier;
}

- (void)setInternalUniqueIdentifier:(id)a3
{
}

- (BOOL)areNotificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  self->_notificationsEnabled = a3;
}

- (NSPredicate)notificationCondition
{
  return self->_notificationCondition;
}

- (void)setNotificationCondition:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (BOOL)isInternallyCertified
{
  return self->_isInternallyCertified;
}

- (void)setIsInternallyCertified:(BOOL)a3
{
  self->_isInternallyCertified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_notificationCondition, 0);
  objc_storeStrong((id *)&self->_internalUniqueIdentifier, 0);
}

- (Class)hf_itemClass
{
  return (Class)objc_opt_class();
}

@end