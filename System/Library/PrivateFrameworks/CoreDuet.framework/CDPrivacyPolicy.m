@interface CDPrivacyPolicy
@end

@implementation CDPrivacyPolicy

uint64_t __39___CDPrivacyPolicy_sharedPrivacyPolicy__block_invoke()
{
  v0 = [[_CDPrivacyPolicy alloc] initWithTemporalPrecision:1 canPersistOnStorage:64.0];
  uint64_t v1 = sharedPrivacyPolicy__sharedPrivacyPolicy;
  sharedPrivacyPolicy__sharedPrivacyPolicy = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end