@interface HMMUptimeProvider
+ (HMMUptimeProvider)sharedInstance;
@end

@implementation HMMUptimeProvider

+ (HMMUptimeProvider)sharedInstance
{
  if (sharedInstance__hmf_once_t0 != -1) {
    dispatch_once(&sharedInstance__hmf_once_t0, &__block_literal_global_88);
  }
  v2 = (void *)sharedInstance__hmf_once_v1;
  return (HMMUptimeProvider *)v2;
}

uint64_t __35__HMMUptimeProvider_sharedInstance__block_invoke()
{
  sharedInstance__hmf_once_v1 = objc_alloc_init(HMMUptimeProvider);
  return MEMORY[0x1F41817F8]();
}

@end