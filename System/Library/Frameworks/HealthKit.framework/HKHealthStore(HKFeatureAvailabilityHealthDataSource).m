@interface HKHealthStore(HKFeatureAvailabilityHealthDataSource)
@end

@implementation HKHealthStore(HKFeatureAvailabilityHealthDataSource)

- (void)featureAvailabilityProvidingForFeatureIdentifier:()HKFeatureAvailabilityHealthDataSource .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_19C023000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] HK_TARGET_OS_HAS_SLEEP_DAEMON true but missing getSleepFeatureAvailabilityProviding()", (uint8_t *)&v3, 0xCu);
}

- (void)featureAvailabilityProvidingForFeatureIdentifier:()HKFeatureAvailabilityHealthDataSource .cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "id<HKFeatureAvailabilityProviding>  _Nullable getSleepFeatureAvailabilityProviding(NSString *__strong, HKHealthStore *__strong, __strong HKFeatureIdentifier)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKFeatureAvailabilityHealthDataSource.m", 30, @"%s", dlerror());

  __break(1u);
}

@end