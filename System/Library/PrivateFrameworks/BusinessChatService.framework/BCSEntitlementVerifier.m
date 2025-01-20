@interface BCSEntitlementVerifier
- (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4;
@end

@implementation BCSEntitlementVerifier

- (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4
{
  return MEMORY[0x270F106D0](a3, a4);
}

@end