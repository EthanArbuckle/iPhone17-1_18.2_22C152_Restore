@interface MPModelObjectEnforcementDisabledPThreadKey
@end

@implementation MPModelObjectEnforcementDisabledPThreadKey

uint64_t ___MPModelObjectEnforcementDisabledPThreadKey_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_MPModelObjectEnforcementDisabledPThreadKey_sThreadKey, 0);
}

@end