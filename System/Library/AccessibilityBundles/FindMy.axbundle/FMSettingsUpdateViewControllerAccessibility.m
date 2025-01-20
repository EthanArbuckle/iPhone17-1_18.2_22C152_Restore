@interface FMSettingsUpdateViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation FMSettingsUpdateViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FindMy.FMSettingsUpdateViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FindMy.FMSettingsUpdateViewController", @"accessibilityButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FindMy.FMSettingsUpdateViewController", @"viewDidLoad", "v", 0);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)FMSettingsUpdateViewControllerAccessibility;
  [(FMSettingsUpdateViewControllerAccessibility *)&v6 viewDidLoad];
  objc_opt_class();
  id v3 = [(FMSettingsUpdateViewControllerAccessibility *)self safeValueForKey:@"accessibilityButton"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F81370] | v5];
}

@end