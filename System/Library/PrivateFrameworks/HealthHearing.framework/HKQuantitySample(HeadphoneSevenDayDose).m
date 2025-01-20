@interface HKQuantitySample(HeadphoneSevenDayDose)
- (uint64_t)hk_canTriggerHeadphoneExposureNotification;
- (void)hk_canTriggerHeadphoneExposureNotification;
@end

@implementation HKQuantitySample(HeadphoneSevenDayDose)

- (uint64_t)hk_canTriggerHeadphoneExposureNotification
{
  v4 = [a1 quantityType];
  uint64_t v5 = [v4 code];

  if (v5 != 173) {
    return 0;
  }
  if (+[HKHearingFeatures unitTesting_simulateLocalHeadphonePlayback])
  {
    return 1;
  }
  v7 = [a1 sourceRevision];
  v8 = [v7 source];

  if (v8)
  {
    uint64_t v6 = [v8 _isLocalDevice];
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
      [(HKQuantitySample(HeadphoneSevenDayDose) *)v9 hk_canTriggerHeadphoneExposureNotification];
    }
    uint64_t v6 = 1;
  }

  return v6;
}

- (void)hk_canTriggerHeadphoneExposureNotification
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = NSStringFromSelector(a2);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_22315A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] missing source, defaulting to YES", (uint8_t *)&v5, 0xCu);
}

@end