@interface CSExtension
@end

@implementation CSExtension

uint64_t __41__CSExtension_PKSubsystem_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sSharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end