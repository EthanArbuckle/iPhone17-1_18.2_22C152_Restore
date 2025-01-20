@interface AXUIInstallBaseCategories
@end

@implementation AXUIInstallBaseCategories

uint64_t ___AXUIInstallBaseCategories_block_invoke()
{
  return +[UIAccessibilityLoader _accessibilityInitializeRuntimeOverrides];
}

@end