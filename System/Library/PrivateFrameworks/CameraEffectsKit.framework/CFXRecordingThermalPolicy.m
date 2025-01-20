@interface CFXRecordingThermalPolicy
- (unint64_t)priority;
- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6;
@end

@implementation CFXRecordingThermalPolicy

- (unint64_t)priority
{
  return 0;
}

- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6
{
  *a6 = 30;
  *a5 = 30;
}

@end