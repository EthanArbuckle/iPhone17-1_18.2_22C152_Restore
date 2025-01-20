@interface BLSDisableLongCoverGestureAttribute
+ (id)disableLongCoverGesture;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLSDisableLongCoverGestureAttribute

+ (id)disableLongCoverGesture
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40DA0 error:a4];
}

@end