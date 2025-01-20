@interface HKNonMPNDeviceRegionFeatureSupportedStateProvider
+ (unint64_t)atrialFibrillationDetectionSupportedStateForCurrentDeviceRegion;
+ (unint64_t)atrialFibrillationDetectionSupportedStateForDeviceRegion:(id)a3;
+ (unint64_t)electrocardiogramSupportedOnPhone:(id)a3 iOSVersionString:(id)a4;
+ (unint64_t)electrocardiogramSupportedStateForCurrentDeviceRegion;
+ (unint64_t)electrocardiogramSupportedStateForDeviceRegion:(id)a3;
@end

@implementation HKNonMPNDeviceRegionFeatureSupportedStateProvider

+ (unint64_t)electrocardiogramSupportedStateForDeviceRegion:(id)a3
{
  return 1;
}

+ (unint64_t)electrocardiogramSupportedStateForCurrentDeviceRegion
{
  return 1;
}

+ (unint64_t)electrocardiogramSupportedOnPhone:(id)a3 iOSVersionString:(id)a4
{
  return 1;
}

+ (unint64_t)atrialFibrillationDetectionSupportedStateForCurrentDeviceRegion
{
  return 1;
}

+ (unint64_t)atrialFibrillationDetectionSupportedStateForDeviceRegion:(id)a3
{
  return 1;
}

@end