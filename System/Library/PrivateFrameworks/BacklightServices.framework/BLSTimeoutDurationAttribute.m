@interface BLSTimeoutDurationAttribute
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
@end

@implementation BLSTimeoutDurationAttribute

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(BLSDurationAttribute *)self duration];
  BOOL v8 = v7 <= 600.0
    || [(BLSAttribute *)self checkEntitlementSource:v6 forSingleEntitlement:0x1F0E40C40 error:a4];

  return v8;
}

@end