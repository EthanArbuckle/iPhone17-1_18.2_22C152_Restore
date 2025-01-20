@interface NSSet(HFMediaProfileContainer)
- (uint64_t)hf_appleTVMediaProfiles;
- (uint64_t)hf_homePodMediaProfiles;
@end

@implementation NSSet(HFMediaProfileContainer)

- (uint64_t)hf_appleTVMediaProfiles
{
  return objc_msgSend(a1, "na_filter:", &__block_literal_global_443_0);
}

- (uint64_t)hf_homePodMediaProfiles
{
  return objc_msgSend(a1, "na_filter:", &__block_literal_global_447_0);
}

@end