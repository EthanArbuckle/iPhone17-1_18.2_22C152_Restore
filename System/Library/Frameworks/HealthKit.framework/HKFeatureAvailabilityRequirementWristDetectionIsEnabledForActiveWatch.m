@interface HKFeatureAvailabilityRequirementWristDetectionIsEnabledForActiveWatch
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)requirementDescription;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementWristDetectionIsEnabledForActiveWatch

+ (NSString)requirementIdentifier
{
  return (NSString *)@"WristDetectionIsEnabledForActiveWatch";
}

- (NSString)requirementDescription
{
  return (NSString *)@"The Wrist Detection setting for the active watch must be enabled";
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  v4 = NSNumber;
  v5 = [a3 wristDetectionSettingDataSource];
  v6 = [v5 wristDetectionSettingManager];
  v7 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "isWristDetectEnabled"));

  return v7;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  v7 = [a4 wristDetectionSettingDataSource];
  v8 = [MEMORY[0x1E4F1CA98] null];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__HKFeatureAvailabilityRequirementWristDetectionIsEnabledForActiveWatch_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E58C0E40;
  v9[4] = self;
  [v7 registerObserver:v6 forKey:v8 newValueHandler:v9];
}

void __104__HKFeatureAvailabilityRequirementWristDetectionIsEnabledForActiveWatch_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", v4, objc_msgSend(a3, "BOOLValue"));
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5 = a3;
  id v7 = [a4 wristDetectionSettingDataSource];
  id v6 = [MEMORY[0x1E4F1CA98] null];
  [v7 unregisterObserver:v5 forKey:v6];
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