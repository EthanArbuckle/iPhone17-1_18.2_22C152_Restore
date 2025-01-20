@interface DDRTaskResetCoreLocationPermission
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetCoreLocationPermission

- (void)run
{
}

- (double)estimatedTimeOfCompletion
{
  return 0.1;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetCoreLocationPermission";
}

@end