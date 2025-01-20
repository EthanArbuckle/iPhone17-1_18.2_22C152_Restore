@interface HKOnboardingCompletion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKOnboardingCompletion)initWithCoder:(id)a3;
- (HKOnboardingCompletion)initWithFeatureIdentifier:(id)a3 version:(int64_t)a4 completionDate:(id)a5 countryCode:(id)a6 countryCodeProvenance:(int64_t)a7;
- (HKOnboardingCompletion)initWithFeatureIdentifier:(id)a3 version:(int64_t)a4 completionDate:(id)a5 countryCode:(id)a6 countryCodeProvenance:(int64_t)a7 UUID:(id)a8;
- (NSDate)completionDate;
- (NSString)countryCode;
- (NSString)featureIdentifier;
- (NSUUID)UUID;
- (id)description;
- (int64_t)countryCodeProvenance;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKOnboardingCompletion

- (HKOnboardingCompletion)initWithFeatureIdentifier:(id)a3 version:(int64_t)a4 completionDate:(id)a5 countryCode:(id)a6 countryCodeProvenance:(int64_t)a7 UUID:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HKOnboardingCompletion;
  v18 = [(HKOnboardingCompletion *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    featureIdentifier = v18->_featureIdentifier;
    v18->_featureIdentifier = (NSString *)v19;

    v18->_version = a4;
    uint64_t v21 = [v15 copy];
    completionDate = v18->_completionDate;
    v18->_completionDate = (NSDate *)v21;

    uint64_t v23 = [v16 uppercaseString];
    countryCode = v18->_countryCode;
    v18->_countryCode = (NSString *)v23;

    v18->_countryCodeProvenance = a7;
    uint64_t v25 = [v17 copy];
    UUID = v18->_UUID;
    v18->_UUID = (NSUUID *)v25;
  }
  return v18;
}

- (HKOnboardingCompletion)initWithFeatureIdentifier:(id)a3 version:(int64_t)a4 completionDate:(id)a5 countryCode:(id)a6 countryCodeProvenance:(int64_t)a7
{
  v12 = (void *)MEMORY[0x1E4F29128];
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [v12 UUID];
  id v17 = [(HKOnboardingCompletion *)self initWithFeatureIdentifier:v15 version:a4 completionDate:v14 countryCode:v13 countryCodeProvenance:a7 UUID:v16];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    featureIdentifier = self->_featureIdentifier;
    v7 = (NSString *)v5[1];
    BOOL v12 = (featureIdentifier == v7 || v7 && -[NSString isEqualToString:](featureIdentifier, "isEqualToString:"))
       && self->_version == v5[2]
       && ((completionDate = self->_completionDate, v9 = (NSDate *)v5[3], completionDate == v9)
        || v9 && -[NSDate isEqualToDate:](completionDate, "isEqualToDate:"))
       && ((countryCode = self->_countryCode, v11 = (NSString *)v5[4], countryCode == v11)
        || v11 && -[NSString isEqualToString:](countryCode, "isEqualToString:"))
       && self->_countryCodeProvenance == v5[5];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  UUID = self->_UUID;
  featureIdentifier = self->_featureIdentifier;
  v7 = [NSNumber numberWithInteger:self->_version];
  countryCode = self->_countryCode;
  v9 = NSStringFromHKOnboardingCompletionCountryCodeProvenance(self->_countryCodeProvenance);
  v10 = [v3 stringWithFormat:@"<%@: %p %@ %@ v:%@ country:%@/%@ date:%@>", v4, self, UUID, featureIdentifier, v7, countryCode, v9, self->_completionDate];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  featureIdentifier = self->_featureIdentifier;
  id v5 = a3;
  [v5 encodeObject:featureIdentifier forKey:@"FeatureIdentifier"];
  [v5 encodeInteger:self->_version forKey:@"Version"];
  [v5 encodeObject:self->_completionDate forKey:@"CompletionDate"];
  [v5 encodeObject:self->_countryCode forKey:@"CountryCode"];
  [v5 encodeInteger:self->_countryCodeProvenance forKey:@"CountryCodeProvenance"];
  [v5 encodeObject:self->_UUID forKey:@"UUID"];
}

- (HKOnboardingCompletion)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKOnboardingCompletion;
  id v5 = [(HKOnboardingCompletion *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FeatureIdentifier"];
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v6;

    v5->_version = [v4 decodeIntegerForKey:@"Version"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CompletionDate"];
    completionDate = v5->_completionDate;
    v5->_completionDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CountryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    v5->_countryCodeProvenance = [v4 decodeIntegerForKey:@"CountryCodeProvenance"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v12;
  }
  return v5;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)version
{
  return self->_version;
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)countryCodeProvenance
{
  return self->_countryCodeProvenance;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end