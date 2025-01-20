@interface BLSGlobalCacheFlipbookOnDisplayWakeAttribute
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLSGlobalCacheFlipbookOnDisplayWakeAttribute

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return [(BLSAttribute *)self checkEntitlementSource:a3 forSingleEntitlement:0x1F0E40CC0 error:a4];
}

@end