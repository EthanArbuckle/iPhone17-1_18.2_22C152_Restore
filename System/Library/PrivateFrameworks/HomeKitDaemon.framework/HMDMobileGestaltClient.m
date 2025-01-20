@interface HMDMobileGestaltClient
- (BOOL)homeSafetySecurityEnabled;
- (BOOL)supportsReceivingARCStreamOverAirPlay;
- (BOOL)supportsSiriHub;
- (HMDMobileGestaltClient)init;
- (HMDMobileGestaltClient)initWithHomeSafetySecurityEnabled:(BOOL)a3;
- (NSString)serialNumber;
@end

@implementation HMDMobileGestaltClient

- (BOOL)homeSafetySecurityEnabled
{
  return self->_homeSafetySecurityEnabled;
}

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

- (HMDMobileGestaltClient)init
{
  return [(HMDMobileGestaltClient *)self initWithHomeSafetySecurityEnabled:0];
}

- (HMDMobileGestaltClient)initWithHomeSafetySecurityEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDMobileGestaltClient;
  result = [(HMDMobileGestaltClient *)&v5 init];
  if (result) {
    result->_homeSafetySecurityEnabled = a3;
  }
  return result;
}

@end