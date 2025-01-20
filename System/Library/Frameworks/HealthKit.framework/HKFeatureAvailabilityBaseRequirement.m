@interface HKFeatureAvailabilityBaseRequirement
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)requirementDescription;
- (id)_hk_featureAvailabilityRequirements;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
@end

@implementation HKFeatureAvailabilityBaseRequirement

- (id)_hk_featureAvailabilityRequirements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
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

+ (NSString)requirementIdentifier
{
  return (NSString *)@"unimplemented";
}

- (NSString)requirementDescription
{
  return (NSString *)@"unimplemented";
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

@end