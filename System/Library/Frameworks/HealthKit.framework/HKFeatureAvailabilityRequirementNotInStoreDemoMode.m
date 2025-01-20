@interface HKFeatureAvailabilityRequirementNotInStoreDemoMode
+ (BOOL)supportsSecureCoding;
+ (id)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (id)requirementDescription;
- (unint64_t)hash;
@end

@implementation HKFeatureAvailabilityRequirementNotInStoreDemoMode

+ (id)requirementIdentifier
{
  return @"NotInStoreDemoMode";
}

- (id)requirementDescription
{
  return @"This device must not be running in store demo mode.";
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = [v4 behavior];
  int v6 = [v5 isAppleWatch];

  v7 = NSNumber;
  v8 = [v4 behavior];
  int v9 = [v8 isRunningStoreDemoMode];
  if (!v6)
  {
    uint64_t v11 = v9 ^ 1u;
    v10 = v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v10 = v7;
    uint64_t v11 = 0;
LABEL_5:
    v12 = [v10 numberWithInt:v11];
    goto LABEL_7;
  }
  v13 = [v4 behavior];
  v12 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v13, "runningInStoreDemoModeF201") ^ 1);

LABEL_7:

  return v12;
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