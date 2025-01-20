@interface DDRTaskRemoveDeviceFromKeychain
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskRemoveDeviceFromKeychain

- (void)run
{
}

- (double)estimatedTimeOfCompletion
{
  return 5.0;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.removeDeviceFromKeychain";
}

@end