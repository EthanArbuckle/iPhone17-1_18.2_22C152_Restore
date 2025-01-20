@interface HKMCSettingsManager(Support)
@end

@implementation HKMCSettingsManager(Support)

- (void)setProjectionAttributesOnWatchFromUseHeartRateInput:()Support useWristTemperatureInput:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_fault_impl(&dword_2249E9000, v1, OS_LOG_TYPE_FAULT, "[%{public}@] setProjectionAttributesOnWatchFromUseHeartRateInput should only be called on the watch", (uint8_t *)&v3, 0xCu);
}

@end