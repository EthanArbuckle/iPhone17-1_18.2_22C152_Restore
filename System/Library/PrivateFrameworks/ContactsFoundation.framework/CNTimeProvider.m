@interface CNTimeProvider
+ (CNTimeProvider)defaultProvider;
- (double)timestamp;
@end

@implementation CNTimeProvider

+ (CNTimeProvider)defaultProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CNTimeProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_0 != -1) {
    dispatch_once(&defaultProvider_cn_once_token_0, block);
  }
  v2 = (void *)defaultProvider_cn_once_object_0;

  return (CNTimeProvider *)v2;
}

- (double)timestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

uint64_t __33__CNTimeProvider_defaultProvider__block_invoke(uint64_t a1)
{
  defaultProvider_cn_once_object_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end