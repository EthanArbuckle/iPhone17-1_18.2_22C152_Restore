@interface HMRestrictedGuestHomeAccessSettings
+ (BOOL)doesAccessoryHaveRestrictedGuestCapableServiceTypes:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)secureClassServices;
+ (id)shortDescription;
- (BOOL)doAllAccessoriesBelongToHome:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMRestrictedGuestHomeAccessSchedule)guestAccessSchedule;
- (HMRestrictedGuestHomeAccessSettings)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSSet)accessAllowedToAccessories;
- (NSSet)identifiersOfAccessAllowedToAccessories;
- (NSString)description;
- (NSString)shortDescription;
- (id)locksWithReducedFunctionalityDueToSchedule;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)fixupAccessoriesForHome:(id)a3;
- (void)setAccessAllowedToAccessories:(id)a3;
- (void)setGuestAccessSchedule:(id)a3;
- (void)setIdentifiersOfAccessAllowedToAccessories:(id)a3;
@end

@implementation HMRestrictedGuestHomeAccessSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfAccessAllowedToAccessories, 0);
  objc_storeStrong((id *)&self->_guestAccessSchedule, 0);

  objc_storeStrong((id *)&self->_accessAllowedToAccessories, 0);
}

- (void)setIdentifiersOfAccessAllowedToAccessories:(id)a3
{
}

- (NSSet)identifiersOfAccessAllowedToAccessories
{
  return self->_identifiersOfAccessAllowedToAccessories;
}

- (void)setGuestAccessSchedule:(id)a3
{
}

- (HMRestrictedGuestHomeAccessSchedule)guestAccessSchedule
{
  return self->_guestAccessSchedule;
}

- (void)setAccessAllowedToAccessories:(id)a3
{
}

- (NSSet)accessAllowedToAccessories
{
  return self->_accessAllowedToAccessories;
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];
  v5 = (void *)[v3 initWithName:@"allowedAccessories" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMRestrictedGuestHomeAccessSettings *)self guestAccessSchedule];
  v8 = (void *)[v6 initWithName:@"schedule" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (void)fixupAccessoriesForHome:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMRestrictedGuestHomeAccessSettings *)self identifiersOfAccessAllowedToAccessories];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__HMRestrictedGuestHomeAccessSettings_fixupAccessoriesForHome___block_invoke;
  v14[3] = &unk_1E5942340;
  id v6 = v4;
  id v15 = v6;
  v7 = objc_msgSend(v5, "na_map:", v14);
  [(HMRestrictedGuestHomeAccessSettings *)self setAccessAllowedToAccessories:v7];

  v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [(HMRestrictedGuestHomeAccessSettings *)v9 accessAllowedToAccessories];
    v13 = [(HMRestrictedGuestHomeAccessSettings *)v9 guestAccessSchedule];
    *(_DWORD *)buf = 138543874;
    v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@AllowedAccessories: %@, AccessSchedules: %@", buf, 0x20u);
  }
}

uint64_t __63__HMRestrictedGuestHomeAccessSettings_fixupAccessoriesForHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) accessoryWithUUID:a2];
}

- (HMRestrictedGuestHomeAccessSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMRestrictedGuestHomeAccessSettings;
  v5 = [(HMRestrictedGuestHomeAccessSettings *)&v13 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HM.RG.Allowed.Accessory.Identifiers"];

    v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    [(HMRestrictedGuestHomeAccessSettings *)v5 setIdentifiersOfAccessAllowedToAccessories:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.RG.Schedule"];
    [(HMRestrictedGuestHomeAccessSettings *)v5 setGuestAccessSchedule:v11];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];

  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__33125;
    v17 = __Block_byref_object_dispose__33126;
    id v6 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v7 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    v8 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__HMRestrictedGuestHomeAccessSettings_encodeWithCoder___block_invoke;
    v12[3] = &unk_1E5942318;
    v12[4] = &v13;
    [v8 enumerateObjectsUsingBlock:v12];

    v9 = (void *)[(id)v14[5] copy];
    [v4 encodeObject:v9 forKey:@"HM.RG.Allowed.Accessory.Identifiers"];

    _Block_object_dispose(&v13, 8);
  }
  v10 = [(HMRestrictedGuestHomeAccessSettings *)self guestAccessSchedule];

  if (v10)
  {
    v11 = [(HMRestrictedGuestHomeAccessSettings *)self guestAccessSchedule];
    [v4 encodeObject:v11 forKey:@"HM.RG.Schedule"];
  }
}

void __55__HMRestrictedGuestHomeAccessSettings_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [+[HMRestrictedGuestHomeAccessSettings allocWithZone:a3] init];
  v5 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];
  [(HMRestrictedGuestHomeAccessSettings *)v4 setAccessAllowedToAccessories:v5];

  id v6 = [(HMRestrictedGuestHomeAccessSettings *)self guestAccessSchedule];
  [(HMRestrictedGuestHomeAccessSettings *)v4 setGuestAccessSchedule:v6];

  return v4;
}

- (unint64_t)hash
{
  id v4 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];
  if (v4)
  {
    v2 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];
    uint64_t v5 = [v2 hash];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [(HMRestrictedGuestHomeAccessSettings *)self guestAccessSchedule];
  if (v6)
  {
    uint64_t v7 = [(HMRestrictedGuestHomeAccessSettings *)self guestAccessSchedule];
    uint64_t v8 = [v7 hash];
  }
  else
  {
    uint64_t v8 = 0;
  }

  if (v4) {
  return v8 ^ v5;
  }
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
    && ([(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v6 accessAllowedToAccessories],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = HMFEqualObjects(),
        v8,
        v7,
        v9))
  {
    v10 = [(HMRestrictedGuestHomeAccessSettings *)self guestAccessSchedule];
    v11 = [v6 guestAccessSchedule];
    char v12 = HMFEqualObjects();
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)locksWithReducedFunctionalityDueToSchedule
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMRestrictedGuestHomeAccessSettings *)self guestAccessSchedule];

  if (v3)
  {
    id v4 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__HMRestrictedGuestHomeAccessSettings_locksWithReducedFunctionalityDueToSchedule__block_invoke;
    void v11[3] = &unk_1E59422B0;
    v11[4] = self;
    uint64_t v5 = objc_msgSend(v4, "na_filter:", v11);
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Configured Schedule is unrestricted so no locks have reduced functionality", buf, 0xCu);
    }
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v5;
}

BOOL __81__HMRestrictedGuestHomeAccessSettings_locksWithReducedFunctionalityDueToSchedule__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 supportsWalletKey] & 1) != 0
    || ([v3 supportsAccessCodes] & 1) != 0
    || ([v3 supportsUWBUnlock] & 1) != 0)
  {
    id v4 = [*(id *)(a1 + 32) guestAccessSchedule];
    uint64_t v5 = [v4 weekDayRules];
    unint64_t v6 = [v5 count];
    uint64_t v7 = [v3 weekDaySchedulesPerUserCapacity];
    if (v6 <= [v7 integerValue])
    {
      int v9 = [*(id *)(a1 + 32) guestAccessSchedule];
      v10 = [v9 yearDayRules];
      unint64_t v11 = [v10 count];
      char v12 = [v3 yearDaySchedulesPerUserCapacity];
      BOOL v8 = v11 <= [v12 integerValue];
    }
    else
    {
      BOOL v8 = 0;
    }

    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      v17 = [*(id *)(a1 + 32) guestAccessSchedule];
      id v18 = [v3 uuid];
      if (v8) {
        v19 = &stru_1EEE9DD88;
      }
      else {
        v19 = @"not ";
      }
      [v3 weekDaySchedulesPerUserCapacity];
      v30 = v13;
      v21 = BOOL v20 = v8;
      uint64_t v22 = [v3 yearDaySchedulesPerUserCapacity];
      *(_DWORD *)buf = 138544642;
      v32 = v16;
      __int16 v33 = 2112;
      v34 = v17;
      __int16 v35 = 2112;
      v36 = v18;
      __int16 v37 = 2112;
      v38 = v19;
      __int16 v39 = 2112;
      v40 = v21;
      __int16 v41 = 2112;
      v42 = v22;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Schedule %@ does %@fit on accessory: [%@] with week day schedule capacity: %@ and year day schedule capacity: %@", buf, 0x3Eu);

      BOOL v8 = v20;
      uint64_t v13 = v30;
    }
    BOOL v23 = !v8;
  }
  else
  {
    v25 = (void *)MEMORY[0x19F3A64A0]();
    id v26 = *(id *)(a1 + 32);
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      v29 = [v3 uuid];
      *(_DWORD *)buf = 138543618;
      v32 = v28;
      __int16 v33 = 2112;
      v34 = v29;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Allowed Accessory: [%@] does not have any physical access credentials", buf, 0x16u);
    }
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)doAllAccessoriesBelongToHome:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];
  if (v5
    && (unint64_t v6 = (void *)v5,
        [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    int v9 = [(HMRestrictedGuestHomeAccessSettings *)self accessAllowedToAccessories];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__HMRestrictedGuestHomeAccessSettings_doAllAccessoriesBelongToHome___block_invoke;
    v12[3] = &unk_1E59422B0;
    id v13 = v4;
    char v10 = objc_msgSend(v9, "na_allObjectsPassTest:", v12);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

uint64_t __68__HMRestrictedGuestHomeAccessSettings_doAllAccessoriesBelongToHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 home];
  id v4 = [v3 uuid];
  uint64_t v5 = [*(id *)(a1 + 32) uuid];
  uint64_t v6 = HMFEqualObjects();

  return v6;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureClassServices
{
  if (secureClassServices_onceToken != -1) {
    dispatch_once(&secureClassServices_onceToken, &__block_literal_global_33148);
  }
  v2 = (void *)secureClassServices_secureClassServices;

  return v2;
}

void __58__HMRestrictedGuestHomeAccessSettings_secureClassServices__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"00000081-0000-1000-8000-0026BB765291";
  v4[1] = @"00000041-0000-1000-8000-0026BB765291";
  v4[2] = @"00000045-0000-1000-8000-0026BB765291";
  v4[3] = @"0000007E-0000-1000-8000-0026BB765291";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)secureClassServices_secureClassServices;
  secureClassServices_secureClassServices = v2;
}

+ (BOOL)doesAccessoryHaveRestrictedGuestCapableServiceTypes:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__HMRestrictedGuestHomeAccessSettings_doesAccessoryHaveRestrictedGuestCapableServiceTypes___block_invoke;
  v4[3] = &__block_descriptor_40_e18_B16__0__NSString_8l;
  v4[4] = a1;
  return objc_msgSend(a3, "na_any:", v4);
}

uint64_t __91__HMRestrictedGuestHomeAccessSettings_doesAccessoryHaveRestrictedGuestCapableServiceTypes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 secureClassServices];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

@end