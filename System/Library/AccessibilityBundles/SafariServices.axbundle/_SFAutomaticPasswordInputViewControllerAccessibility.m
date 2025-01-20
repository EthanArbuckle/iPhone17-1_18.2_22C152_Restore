@interface _SFAutomaticPasswordInputViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _SFAutomaticPasswordInputViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFAutomaticPasswordInputViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFAutomaticPasswordInputViewController", @"viewWillAppear:", "v", "B", 0);
  [v3 validateClass:@"_SFAutomaticPasswordInputViewController" hasInstanceVariable:@"_inputView" withType:"UIInputView"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_SFAutomaticPasswordInputViewControllerAccessibility;
  [(_SFAutomaticPasswordInputViewControllerAccessibility *)&v3 viewWillAppear:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

@end