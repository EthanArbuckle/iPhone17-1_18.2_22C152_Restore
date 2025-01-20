@interface HKFeatureAvailabilityRequirementHealthAppIsNotHidden
+ (BOOL)supportsSecureCoding;
+ (id)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (id)requirementDescription;
- (unint64_t)hash;
@end

@implementation HKFeatureAvailabilityRequirementHealthAppIsNotHidden

+ (id)requirementIdentifier
{
  return @"HealthAppIsNotHidden";
}

- (id)requirementDescription
{
  return @"The Health app must not be hidden using Screen Time or other restrictions";
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  v4 = NSNumber;
  v5 = [a3 behavior];
  v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "healthAppHidden") ^ 1);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  unint64_t v4 = [v3 hash];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end