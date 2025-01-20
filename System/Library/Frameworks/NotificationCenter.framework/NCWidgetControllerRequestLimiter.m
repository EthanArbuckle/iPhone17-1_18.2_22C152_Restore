@interface NCWidgetControllerRequestLimiter
@end

@implementation NCWidgetControllerRequestLimiter

uint64_t __51___NCWidgetControllerRequestLimiter_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

@end