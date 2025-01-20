@interface HKFeatureAvailabilityOnboardingEligibilityRequirement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityOnboardingEligibilityRequirement)initWithCoder:(id)a3;
- (HKFeatureAvailabilityOnboardingEligibilityRequirement)initWithFeatureIdentifier:(id)a3;
- (NSString)featureIdentifier;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureAvailabilityOnboardingEligibilityRequirement

- (HKFeatureAvailabilityOnboardingEligibilityRequirement)initWithFeatureIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityOnboardingEligibilityRequirement;
  v6 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_featureIdentifier, a3);
  }

  return v7;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(a3, "onboardingEligibilityForFeatureWithIdentifier:error:", self->_featureIdentifier);
  if (v6)
  {
    v7 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self isSatisfiedWithOnboardingEligibility:v6 error:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"HKFeatureAvailabilityOnboardingEligibilityRequirement.m" lineNumber:38 description:@"Subclasses must override this method"];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSString *)self->_featureIdentifier isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = [(NSString *)self->_featureIdentifier hash] ^ v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKFeatureAvailabilityOnboardingEligibilityRequirement)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureIdentifier"];

  NSUInteger v6 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self initWithFeatureIdentifier:v5];
  return v6;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
}

@end