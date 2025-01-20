@interface HMSetupAccessoryDescription
@end

@implementation HMSetupAccessoryDescription

uint64_t __51__HMSetupAccessoryDescription_HFAdditions__hf_home__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  v4 = [*(id *)(a1 + 32) homeUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __66__HMSetupAccessoryDescription_HFAdditions__hf_isLaunchedByHomeApp__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToString:a2];
}

@end