@interface BLSDisableInactiveTapGestureAttribute
+ (id)disableTapGesture;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLSDisableInactiveTapGestureAttribute

+ (id)disableTapGesture
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40DC0 error:a4];
}

@end