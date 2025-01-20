@interface ANBundleHelper
@end

@implementation ANBundleHelper

uint64_t __32___ANBundleHelper_currentBundle__block_invoke()
{
  currentBundle_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

@end