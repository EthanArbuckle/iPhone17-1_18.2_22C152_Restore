@interface DASConfigurationLimiter
@end

@implementation DASConfigurationLimiter

uint64_t __41___DASConfigurationLimiter_sharedLimiter__block_invoke()
{
  sharedLimiter_limitation_0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

@end