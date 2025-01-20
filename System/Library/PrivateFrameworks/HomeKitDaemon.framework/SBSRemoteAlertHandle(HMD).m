@interface SBSRemoteAlertHandle(HMD)
- (uint64_t)activate;
@end

@implementation SBSRemoteAlertHandle(HMD)

- (uint64_t)activate
{
  return [a1 activateWithContext:0];
}

@end