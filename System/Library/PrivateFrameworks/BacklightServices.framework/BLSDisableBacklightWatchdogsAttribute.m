@interface BLSDisableBacklightWatchdogsAttribute
+ (id)disableWatchdogs;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLSDisableBacklightWatchdogsAttribute

+ (id)disableWatchdogs
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40E00 error:a4];
}

@end