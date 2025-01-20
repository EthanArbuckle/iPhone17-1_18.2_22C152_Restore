@interface AKUIMainBundle
@end

@implementation AKUIMainBundle

uint64_t ___AKUIMainBundle_block_invoke()
{
  _AKUIMainBundle_mainBundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

@end