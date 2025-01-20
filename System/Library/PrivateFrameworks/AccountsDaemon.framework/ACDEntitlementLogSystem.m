@interface ACDEntitlementLogSystem
@end

@implementation ACDEntitlementLogSystem

uint64_t ___ACDEntitlementLogSystem_block_invoke()
{
  _ACDEntitlementLogSystem_log = (uint64_t)os_log_create("com.apple.accounts", "entitlement");

  return MEMORY[0x270F9A758]();
}

@end