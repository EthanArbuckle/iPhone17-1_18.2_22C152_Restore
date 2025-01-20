@interface UIApplicationAccessibility__LoginUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityActiveKeyboard;
- (id)_accessibilitySoftwareMimicKeyboard;
@end

@implementation UIApplicationAccessibility__LoginUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LUIUserLoginPasswordViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"LUIPasscodeView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LUIPasscodeView", @"passCodeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeLockViewWithKeypad", @"_numberPad", "@", 0);
}

- (id)_accessibilitySoftwareMimicKeyboard
{
  if (_accessibilitySoftwareMimicKeyboard_onceToken != -1) {
    dispatch_once(&_accessibilitySoftwareMimicKeyboard_onceToken, &__block_literal_global_0);
  }
  if (_accessibilitySoftwareMimicKeyboard_LUIUserLoginPasswordViewController) {
    BOOL v3 = _accessibilitySoftwareMimicKeyboard_LUIPasscodeView == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    uint64_t v25 = _accessibilitySoftwareMimicKeyboard_LUIUserLoginPasswordViewController;
    uint64_t v26 = _accessibilitySoftwareMimicKeyboard_LUIPasscodeView;
    v24 = @"Could not find classes: LUIUserLoginPasswordViewController=%@, LUIPasscodeView=%@";
    char v23 = 1;
    _AXLogWithFacility();
  }
  else
  {
    v4 = [(id)*MEMORY[0x263F1D020] _accessibilityMainWindow];
    v5 = [v4 rootViewController];
    v6 = [v5 childViewControllers];

    uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_299];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v7;
      char v29 = 0;
      objc_opt_class();
      v9 = [v6 objectAtIndex:v8];
      v10 = __UIAccessibilityCastAsClass();

      v11 = [v10 view];
      v12 = [v11 subviews];
      uint64_t v13 = [v12 indexOfObjectPassingTest:&__block_literal_global_303];

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = [v10 view];
        v15 = [v14 subviews];
        v16 = [v15 objectAtIndex:v13];

        objc_opt_class();
        char v28 = 0;
        v17 = [v16 safeValueForKey:@"passCodeView"];
        v18 = __UIAccessibilitySafeClass();

        v19 = __UIAccessibilityCastAsClass();

        char v29 = 0;
        objc_opt_class();
        v20 = [v19 safeValueForKey:@"_numberPad"];
        v21 = __UIAccessibilityCastAsClass();

        if ([v21 _accessibilityViewIsVisible])
        {

          goto LABEL_17;
        }
      }
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)UIApplicationAccessibility__LoginUI__UIKit;
  v21 = [(UIApplicationAccessibility__LoginUI__UIKit *)&v27 _accessibilitySoftwareMimicKeyboard];
LABEL_17:

  return v21;
}

- (id)_accessibilityActiveKeyboard
{
  BOOL v3 = [MEMORY[0x263F1C710] activeKeyboard];
  v4 = v3;
  if (v3
    && ([v3 window],
        v5 = objc_claimAutoreleasedReturnValue(),
        [(id)*MEMORY[0x263F1D020] _accessibilityMainWindow],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {
    id v7 = v4;
    uint64_t v8 = v7;
    while (1)
    {
      MEMORY[0x245652010](@"LUIPasscodeView");
      if (objc_opt_isKindOfClass())
      {
        if ([v8 _accessibilityViewIsVisible]) {
          break;
        }
      }
      uint64_t v9 = [v8 superview];

      uint64_t v8 = (void *)v9;
      if (!v9) {
        goto LABEL_7;
      }
    }
    id v10 = v7;
  }
  else
  {
LABEL_7:
    v12.receiver = self;
    v12.super_class = (Class)UIApplicationAccessibility__LoginUI__UIKit;
    id v10 = [(UIApplicationAccessibility__LoginUI__UIKit *)&v12 _accessibilityActiveKeyboard];
  }

  return v10;
}

@end