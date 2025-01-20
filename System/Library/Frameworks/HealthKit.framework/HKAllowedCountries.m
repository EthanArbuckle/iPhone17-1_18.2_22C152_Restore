@interface HKAllowedCountries
+ (BOOL)supportsSecureCoding;
+ (id)allowedCountriesInIntersectionOfLocalAndRemoteSetPendingSync:(id)a3;
+ (id)allowedCountriesInIntersectionOfLocalSet:(id)a3 remoteSet:(id)a4;
+ (id)allowedCountriesInLocalSet:(id)a3;
+ (id)capabilityNotSupportedOnRemoteDevice:(id)a3;
+ (id)noRemoteDevice:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)someRegionIsSupported;
- (HKAllowedCountries)initWithCoder:(id)a3;
- (HKCountrySet)localCountrySet;
- (HKCountrySet)remoteCountrySet;
- (NSString)prettyPrintedDescription;
- (NSString)version;
- (int64_t)category;
- (int64_t)remoteState;
- (unint64_t)hash;
- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3;
- (void)_initWithCategory:(void *)a3 version:(void *)a4 localCountrySet:(uint64_t)a5 remoteState:(void *)a6 remoteCountrySet:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAllowedCountries

+ (id)allowedCountriesInLocalSet:(id)a3
{
  id v3 = a3;
  v4 = [[_HKAllowedCountriesInLocalSet alloc] initWithLocalCountrySet:v3];

  return v4;
}

+ (id)noRemoteDevice:(id)a3
{
  id v3 = a3;
  v4 = [[_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction alloc] initWithLocalCountrySet:v3 remoteState:2];

  return v4;
}

+ (id)capabilityNotSupportedOnRemoteDevice:(id)a3
{
  id v3 = a3;
  v4 = [[_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction alloc] initWithLocalCountrySet:v3 remoteState:3];

  return v4;
}

+ (id)allowedCountriesInIntersectionOfLocalAndRemoteSetPendingSync:(id)a3
{
  id v3 = a3;
  v4 = [[_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction alloc] initWithLocalCountrySet:v3 remoteState:4];

  return v4;
}

+ (id)allowedCountriesInIntersectionOfLocalSet:(id)a3 remoteSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_HKAllowedCountriesInIntersectionOfLocalAndRemoteSet alloc] initWithLocalCountrySet:v6 remoteCountrySet:v5];

  return v7;
}

- (void)_initWithCategory:(void *)a3 version:(void *)a4 localCountrySet:(uint64_t)a5 remoteState:(void *)a6 remoteCountrySet:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)HKAllowedCountries;
    v14 = objc_msgSendSuper2(&v23, sel_init);
    a1 = v14;
    if (v14)
    {
      if (a5 != 5 || v13)
      {
        v14[1] = a2;
        uint64_t v17 = [v11 copy];
        v18 = (void *)a1[2];
        a1[2] = v17;

        uint64_t v19 = [v12 copy];
        v20 = (void *)a1[3];
        a1[3] = v19;

        a1[4] = a5;
        uint64_t v21 = [v13 copy];
        v16 = (void *)a1[5];
        a1[5] = v21;
      }
      else
      {
        _HKInitializeLogging();
        v15 = HKLogInfrastructure();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:]((uint64_t)a1, v15);
        }

        v16 = a1;
        a1 = 0;
      }
    }
  }

  return a1;
}

- (NSString)prettyPrintedDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = [(HKAllowedCountries *)self localCountrySet];
  id v5 = [v4 allCountryCodes];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];
  v7 = [v6 componentsJoinedByString:@", "];

  int64_t v8 = [(HKAllowedCountries *)self category];
  if (v8 == 2)
  {
    [v3 appendString:@"Available based on the intersection of countries specified by the local and remote devices:\n"];
    [v3 appendFormat:@"Local : %@\n", v7];
    id v11 = [(HKAllowedCountries *)self localCountrySet];
    id v12 = NSStringFromHKCountrySetProvenance([v11 provenance]);
    [v3 appendFormat:@"(Provenance: %@)\n", v12];

    [v3 appendString:@"Remote: "];
    switch([(HKAllowedCountries *)self remoteState])
    {
      case 2:
        id v13 = @"No device";
        goto LABEL_9;
      case 3:
        id v13 = @"Device capability not supported";
        goto LABEL_9;
      case 4:
        id v13 = @"Awaiting sync of countries";
LABEL_9:
        [v3 appendString:v13];
        break;
      case 5:
        v16 = [(HKAllowedCountries *)self remoteCountrySet];
        uint64_t v17 = [v16 allCountryCodes];
        v18 = [v17 sortedArrayUsingSelector:sel_compare_];
        uint64_t v19 = [v18 componentsJoinedByString:@", "];
        v20 = (void *)v19;
        if (v19) {
          uint64_t v21 = (__CFString *)v19;
        }
        else {
          uint64_t v21 = &stru_1EEC60288;
        }
        [v3 appendString:v21];

        v9 = [(HKAllowedCountries *)self remoteCountrySet];
        v10 = NSStringFromHKCountrySetProvenance([v9 provenance]);
        [v3 appendFormat:@"\n(Provenance: %@)\n", v10];
        goto LABEL_4;
      default:
        break;
    }
  }
  else if (v8 == 1)
  {
    [v3 appendString:@"Available only in countries specified by this device:\n"];
    [v3 appendFormat:@"%@\n", v7];
    v9 = [(HKAllowedCountries *)self localCountrySet];
    v10 = NSStringFromHKCountrySetProvenance([v9 provenance]);
    [v3 appendFormat:@"(Provenance: %@)\n", v10];
LABEL_4:
  }
  v14 = (void *)[v3 copy];

  return (NSString *)v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKAllowedCountries;
  if (![(HKAllowedCountries *)&v14 isEqual:v4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v5 = 0;
      goto LABEL_18;
    }
    id v6 = v4;
    if (self->_category != v6[1]) {
      goto LABEL_16;
    }
    localCountrySet = self->_localCountrySet;
    int64_t v8 = (HKCountrySet *)v6[3];
    if (localCountrySet != v8 && (!v8 || !-[HKCountrySet isEqual:](localCountrySet, "isEqual:"))) {
      goto LABEL_16;
    }
    remoteCountrySet = self->_remoteCountrySet;
    v10 = (HKCountrySet *)v6[5];
    if (remoteCountrySet != v10 && (!v10 || !-[HKCountrySet isEqual:](remoteCountrySet, "isEqual:"))) {
      goto LABEL_16;
    }
    if (self->_remoteState != v6[4]) {
      goto LABEL_16;
    }
    version = self->_version;
    id v12 = (NSString *)v6[2];
    if (version == v12)
    {
      char v5 = 1;
      goto LABEL_17;
    }
    if (v12) {
      char v5 = -[NSString isEqual:](version, "isEqual:");
    }
    else {
LABEL_16:
    }
      char v5 = 0;
LABEL_17:

    goto LABEL_18;
  }
  char v5 = 1;
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  int64_t category = self->_category;
  unint64_t v4 = [(HKCountrySet *)self->_localCountrySet hash] ^ category;
  unint64_t v5 = v4 ^ [(HKCountrySet *)self->_remoteCountrySet hash] ^ self->_remoteState;
  return v5 ^ [(NSString *)self->_version hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t category = self->_category;
  id v5 = a3;
  [v5 encodeInteger:category forKey:@"category"];
  [v5 encodeObject:self->_localCountrySet forKey:@"localCountrySet"];
  [v5 encodeObject:self->_remoteCountrySet forKey:@"remoteCountrySet"];
  [v5 encodeInteger:self->_remoteState forKey:@"remoteState"];
  [v5 encodeObject:self->_version forKey:@"version"];
}

- (HKAllowedCountries)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"category"];
  if ((unint64_t)(v5 - 1) >= 2)
  {
    _HKInitializeLogging();
    v7 = HKLogInfrastructure();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HKAllowedCountries initWithCoder:]((uint64_t)self, v5);
    }
    goto LABEL_10;
  }
  uint64_t v6 = [v4 decodeIntegerForKey:@"remoteState"];
  if ((unint64_t)(v6 - 1) >= 5)
  {
    _HKInitializeLogging();
    v7 = HKLogInfrastructure();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HKAllowedCountries initWithCoder:]((uint64_t)self, v6);
    }
LABEL_10:
    v10 = 0;
    goto LABEL_15;
  }
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localCountrySet"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteCountrySet"];
  if (v7 && v8)
  {
    self = -[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:](self, v5, v7, v8, v6, v9);
    v10 = self;
  }
  else
  {
    _HKInitializeLogging();
    id v11 = HKLogInfrastructure();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543874;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      id v13 = v15;
      _os_log_error_impl(&dword_19C023000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Missing required fields: %{public}@ %{public}@", (uint8_t *)&v14, 0x20u);
    }
    v10 = 0;
  }

LABEL_15:
  return v10;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)version
{
  return self->_version;
}

- (HKCountrySet)localCountrySet
{
  return self->_localCountrySet;
}

- (int64_t)remoteState
{
  return self->_remoteState;
}

- (HKCountrySet)remoteCountrySet
{
  return self->_remoteCountrySet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCountrySet, 0);
  objc_storeStrong((id *)&self->_localCountrySet, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  return 0;
}

- (BOOL)someRegionIsSupported
{
  return 0;
}

- (void)_initWithCategory:(uint64_t)a1 version:(NSObject *)a2 localCountrySet:remoteState:remoteCountrySet:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] activeRemoteCountries is required when remoteState is HKRemoteAllowedCountriesStateReady", (uint8_t *)&v4, 0xCu);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  id v3 = objc_opt_class();
  int v4 = NSNumber;
  id v5 = v3;
  uint64_t v6 = [v4 numberWithInteger:a2];
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v7, v8, "[%{public}@] Unsupported remote state: %{public}@", v9, v10, v11, v12, v13);
}

- (void)initWithCoder:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  id v3 = objc_opt_class();
  int v4 = NSNumber;
  id v5 = v3;
  uint64_t v6 = [v4 numberWithInteger:a2];
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v7, v8, "[%{public}@] Unsupported category: %{public}@", v9, v10, v11, v12, v13);
}

@end