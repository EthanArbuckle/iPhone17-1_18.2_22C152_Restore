@interface HMDHAPAccessory(CHIP)
- (BOOL)requiresThreadRouter;
@end

@implementation HMDHAPAccessory(CHIP)

- (BOOL)requiresThreadRouter
{
  v2 = [(HMDHAPAccessory *)self chipAccessoryServer];
  char v3 = [v2 requiresThreadRouter];

  return v3;
}

@end