@interface CLKTimeFormatterCache
@end

@implementation CLKTimeFormatterCache

uint64_t __40___CLKTimeFormatterCache_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

@end