@interface DKRateLimitPolicyEnforcer
@end

@implementation DKRateLimitPolicyEnforcer

uint64_t __53___DKRateLimitPolicyEnforcer_rateLimitPolicyEnforcer__block_invoke()
{
  v0 = objc_alloc_init(_DKRateLimitPolicyEnforcer);
  uint64_t v1 = rateLimitPolicyEnforcer_enforcer;
  rateLimitPolicyEnforcer_enforcer = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end