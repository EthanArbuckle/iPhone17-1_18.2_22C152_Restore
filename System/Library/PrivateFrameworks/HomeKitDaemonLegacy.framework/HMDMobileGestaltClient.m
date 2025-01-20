@interface HMDMobileGestaltClient
- (BOOL)supportsReceivingARCStreamOverAirPlay;
- (BOOL)supportsSiriHub;
- (NSString)serialNumber;
@end

@implementation HMDMobileGestaltClient

- (NSString)serialNumber
{
  v2 = (void *)MGGetStringAnswer();
  return (NSString *)v2;
}

- (BOOL)supportsReceivingARCStreamOverAirPlay
{
  return MGGetBoolAnswer();
}

- (BOOL)supportsSiriHub
{
  return MGGetBoolAnswer();
}

@end