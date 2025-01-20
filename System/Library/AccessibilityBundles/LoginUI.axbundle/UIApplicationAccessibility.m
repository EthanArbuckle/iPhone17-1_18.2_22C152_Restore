@interface UIApplicationAccessibility
@end

@implementation UIApplicationAccessibility

uint64_t __81__UIApplicationAccessibility__LoginUI__UIKit__accessibilitySoftwareMimicKeyboard__block_invoke()
{
  _accessibilitySoftwareMimicKeyboard_LUIUserLoginPasswordViewController = MEMORY[0x245652010](@"LUIUserLoginPasswordViewController");
  uint64_t result = MEMORY[0x245652010](@"LUIPasscodeView");
  _accessibilitySoftwareMimicKeyboard_LUIPasscodeView = result;
  return result;
}

uint64_t __81__UIApplicationAccessibility__LoginUI__UIKit__accessibilitySoftwareMimicKeyboard__block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __81__UIApplicationAccessibility__LoginUI__UIKit__accessibilitySoftwareMimicKeyboard__block_invoke_3()
{
  return objc_opt_isKindOfClass() & 1;
}

@end