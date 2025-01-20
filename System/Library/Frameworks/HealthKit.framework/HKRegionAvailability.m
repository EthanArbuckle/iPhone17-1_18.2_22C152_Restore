@interface HKRegionAvailability
+ (BOOL)supportsSecureCoding;
+ (id)allowedInSomeCountries:(id)a3;
+ (id)anyCountryAvailability;
+ (id)uncheckedAvailability;
- (BOOL)isEqual:(id)a3;
- (HKAllowedCountries)allowedCountries;
- (HKRegionAvailability)initWithCoder:(id)a3;
- (NSString)prettyPrintedDescription;
- (NSString)version;
- (id)onboardingEligibilityForCountryCode:(id)a3;
- (int64_t)category;
- (unint64_t)hash;
- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3;
- (void)_initWithCategory:(void *)a3 version:(void *)a4 allowedCountries:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKRegionAvailability

+ (id)uncheckedAvailability
{
  v2 = objc_alloc_init(_HKUncheckedRegionAvailability);

  return v2;
}

+ (id)anyCountryAvailability
{
  v2 = objc_alloc_init(_HKAnyCountryAvailability);

  return v2;
}

+ (id)allowedInSomeCountries:(id)a3
{
  id v3 = a3;
  v4 = [[_HKAllowedInSomeCountriesAvailability alloc] initWithAllowedCountries:v3];

  return v4;
}

- (void)_initWithCategory:(void *)a3 version:(void *)a4 allowedCountries:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)HKRegionAvailability;
    v9 = objc_msgSendSuper2(&v17, sel_init);
    a1 = v9;
    if (v9)
    {
      if ((unint64_t)(a2 - 4) > 0xFFFFFFFFFFFFFFFCLL)
      {
        if (a2 != 3 || v8)
        {
          v9[1] = a2;
          uint64_t v13 = [v7 copy];
          v14 = (void *)a1[2];
          a1[2] = v13;

          uint64_t v15 = [v8 copy];
          v12 = (void *)a1[3];
          a1[3] = v15;
          goto LABEL_14;
        }
        _HKInitializeLogging();
        v11 = HKLogInfrastructure();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[HKRegionAvailability _initWithCategory:version:allowedCountries:]();
        }
      }
      else
      {
        _HKInitializeLogging();
        v10 = HKLogInfrastructure();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[HKRegionAvailability _initWithCategory:version:allowedCountries:]((uint64_t)a1, a2, v10);
        }
      }
      v12 = a1;
      a1 = 0;
LABEL_14:
    }
  }

  return a1;
}

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  id v4 = a3;
  v5 = [HKFeatureAvailabilityOnboardingEligibility alloc];
  unint64_t v6 = [(HKRegionAvailability *)self ineligibilityReasonsForOnboardingCountryCode:v4];

  id v7 = [(HKRegionAvailability *)self version];
  id v8 = [(HKFeatureAvailabilityOnboardingEligibility *)v5 initWithIneligibilityReasons:v6 countryAvailabilityVersion:v7];

  return v8;
}

- (NSString)prettyPrintedDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(HKRegionAvailability *)self version];
  [v3 appendFormat:@"Version: %@\n", v4];

  int64_t v5 = [(HKRegionAvailability *)self category];
  switch(v5)
  {
    case 3:
      id v7 = [(HKRegionAvailability *)self allowedCountries];
      uint64_t v8 = [v7 prettyPrintedDescription];
      v9 = (void *)v8;
      if (v8) {
        v10 = (__CFString *)v8;
      }
      else {
        v10 = &stru_1EEC60288;
      }
      [v3 appendString:v10];

      goto LABEL_11;
    case 2:
      unint64_t v6 = @"All countries";
      break;
    case 1:
      unint64_t v6 = @"Unchecked";
      break;
    default:
      goto LABEL_11;
  }
  [v3 appendString:v6];
LABEL_11:
  v11 = (void *)[v3 copy];

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKRegionAvailability;
  if (![(HKRegionAvailability *)&v12 isEqual:v4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v5 = 0;
      goto LABEL_14;
    }
    unint64_t v6 = v4;
    allowedCountries = self->_allowedCountries;
    uint64_t v8 = (HKAllowedCountries *)v6[3];
    if (allowedCountries != v8 && (!v8 || !-[HKAllowedCountries isEqual:](allowedCountries, "isEqual:"))
      || self->_category != v6[1])
    {
      goto LABEL_12;
    }
    version = self->_version;
    v10 = (NSString *)v6[2];
    if (version == v10)
    {
      char v5 = 1;
      goto LABEL_13;
    }
    if (v10) {
      char v5 = -[NSString isEqual:](version, "isEqual:");
    }
    else {
LABEL_12:
    }
      char v5 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v5 = 1;
LABEL_14:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKAllowedCountries *)self->_allowedCountries hash];
  version = self->_version;
  int64_t v5 = self->_category ^ v3;
  return v5 ^ [(NSString *)version hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  allowedCountries = self->_allowedCountries;
  id v5 = a3;
  [v5 encodeObject:allowedCountries forKey:@"allowedCountries"];
  [v5 encodeInteger:self->_category forKey:@"category"];
  [v5 encodeObject:self->_version forKey:@"version"];
}

- (HKRegionAvailability)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"category"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowedCountries"];

  if (v6)
  {
    self = -[HKRegionAvailability _initWithCategory:version:allowedCountries:](self, v5, v6, v7);
    uint64_t v8 = self;
  }
  else
  {
    _HKInitializeLogging();
    v9 = HKLogInfrastructure();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HKRegionAvailability initWithCoder:]();
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)version
{
  return self->_version;
}

- (HKAllowedCountries)allowedCountries
{
  return self->_allowedCountries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedCountries, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  return 0;
}

- (void)_initWithCategory:(uint64_t)a1 version:(uint64_t)a2 allowedCountries:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = NSNumber;
  id v7 = v5;
  uint64_t v8 = [v6 numberWithInteger:a2];
  int v9 = 138543618;
  v10 = v5;
  __int16 v11 = 2114;
  objc_super v12 = v8;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Unknown category value: %{public}@", (uint8_t *)&v9, 0x16u);
}

- (void)_initWithCategory:version:allowedCountries:.cold.2()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_4(&dword_19C023000, v1, v2, "[%{public}@] Allowed countries is required when category is HKRegionAvailabilityCategoryAllowedInSomeCountries", v3, v4, v5, v6, 2u);
}

- (void)initWithCoder:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_4(&dword_19C023000, v1, v2, "[%{public}@] Version is required", v3, v4, v5, v6, 2u);
}

@end