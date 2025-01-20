@interface HKFeatureAvailabilityRequirementWatchLowPowerModeIsOff
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)requirementDescription;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementWatchLowPowerModeIsOff

+ (NSString)requirementIdentifier
{
  return (NSString *)@"WatchLowPowerModeIsOff";
}

- (NSString)requirementDescription
{
  return (NSString *)@"Low Power Mode must be turned off on the active watch";
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  v4 = NSNumber;
  v5 = [a3 watchLowPowerModeDataSource];
  v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "isWatchLowPowerModeEnabled") ^ 1);

  return v6;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  v7 = [a4 watchLowPowerModeDataSource];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__HKFeatureAvailabilityRequirementWatchLowPowerModeIsOff_registerObserver_forDataSource___block_invoke;
  v8[3] = &unk_1E58C5770;
  v8[4] = self;
  [v7 registerObserver:v6 onLowPowerModeChange:v8];
}

uint64_t __89__HKFeatureAvailabilityRequirementWatchLowPowerModeIsOff_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, int a3)
{
  return [a2 featureAvailabilityRequirement:*(void *)(a1 + 32) didUpdateSatisfaction:a3 ^ 1u];
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5 = a3;
  id v6 = [a4 watchLowPowerModeDataSource];
  [v6 unregisterObserver:v5];
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