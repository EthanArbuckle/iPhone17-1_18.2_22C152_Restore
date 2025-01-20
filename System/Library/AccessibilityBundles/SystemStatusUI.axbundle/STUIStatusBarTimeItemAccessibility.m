@interface STUIStatusBarTimeItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (STUIStatusBarTimeItemAccessibility)init;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STUIStatusBarTimeItemAccessibility

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarTimeItemAccessibility;
  v5 = [(STUIStatusBarTimeItemAccessibility *)&v7 applyUpdate:a3 toDisplayItem:a4];
  [(STUIStatusBarTimeItemAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarTimeItemAccessibility;
  [(STUIStatusBarTimeItemAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  v3 = [(STUIStatusBarTimeItemAccessibility *)self safeUIViewForKey:@"timeView"];
  [v3 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsTime"];
  v4 = [(STUIStatusBarTimeItemAccessibility *)self safeUIViewForKey:@"shortTimeView"];
  [v4 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsTime"];
  v5 = [(STUIStatusBarTimeItemAccessibility *)self safeUIViewForKey:@"pillTimeView"];
  [v5 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsPillTime"];
  v6 = [(STUIStatusBarTimeItemAccessibility *)self safeUIViewForKey:@"dateView"];
  [v6 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsDate"];
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarTimeItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarTimeItem", @"applyUpdate:toDisplayItem:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarTimeItem", @"timeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarTimeItem", @"pillTimeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarTimeItem", @"shortTimeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarTimeItem", @"dateView", "@", 0);
}

- (STUIStatusBarTimeItemAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarTimeItemAccessibility;
  v2 = [(STUIStatusBarTimeItemAccessibility *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(STUIStatusBarTimeItemAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  }
  return v3;
}

@end