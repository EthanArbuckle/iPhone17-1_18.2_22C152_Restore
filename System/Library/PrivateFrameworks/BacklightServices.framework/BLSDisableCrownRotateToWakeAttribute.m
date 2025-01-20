@interface BLSDisableCrownRotateToWakeAttribute
+ (id)disableCrownRotateToWake;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLSDisableCrownRotateToWakeAttribute

+ (id)disableCrownRotateToWake
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:@"com.apple.backlight.disable_crown_rotate_to_wake_assertion" error:a4];
}

@end