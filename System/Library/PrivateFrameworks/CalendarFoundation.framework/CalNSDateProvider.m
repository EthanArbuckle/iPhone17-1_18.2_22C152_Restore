@interface CalNSDateProvider
+ (CalNSDateProvider)sharedInstance;
- (id)now;
@end

@implementation CalNSDateProvider

+ (CalNSDateProvider)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CalNSDateProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return (CalNSDateProvider *)v2;
}

uint64_t __35__CalNSDateProvider_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (id)now
{
  return (id)[MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
}

@end