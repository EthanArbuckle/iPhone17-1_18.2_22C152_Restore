@interface DKPrivacyPolicyEnforcer
@end

@implementation DKPrivacyPolicyEnforcer

uint64_t __49___DKPrivacyPolicyEnforcer_privacyPolicyEnforcer__block_invoke()
{
  v0 = objc_alloc_init(_DKPrivacyPolicyEnforcer);
  uint64_t v1 = privacyPolicyEnforcer_enforcer;
  privacyPolicyEnforcer_enforcer = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end