@interface CSPasscodeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5;
@end

@implementation CSPasscodeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSPasscodeViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __107__CSPasscodeViewControllerAccessibility_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke;
  v11[3] = &unk_26511B820;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)CSPasscodeViewControllerAccessibility;
  id v9 = v8;
  [(CSPasscodeViewControllerAccessibility *)&v10 performCustomTransitionToVisible:v6 withAnimationSettings:a4 completion:v11];
}

void __107__CSPasscodeViewControllerAccessibility_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v2, 0);
}

@end