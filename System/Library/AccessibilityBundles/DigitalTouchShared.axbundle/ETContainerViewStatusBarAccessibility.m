@interface ETContainerViewStatusBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAutomationHitTestReverseOrder;
- (id)accessibilityElements;
@end

@implementation ETContainerViewStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETContainerViewStatusBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETContainerViewStatusBar" isKindOfClass:@"PUICStatusBarAppContextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUICStatusBarAppContextView", @"navigationBackButtonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUICStatusBarAppContextView", @"titleLabel", "@", 0);
}

- (id)accessibilityElements
{
  v11.receiver = self;
  v11.super_class = (Class)ETContainerViewStatusBarAccessibility;
  id v3 = [(ETContainerViewStatusBarAccessibility *)&v11 accessibilityElements];
  v4 = [(ETContainerViewStatusBarAccessibility *)self safeValueForKey:@"navigationBackButtonView"];

  if (!v4)
  {
    v5 = (void *)[v3 mutableCopy];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x263EFF980] array];
    }
    v8 = v7;

    v9 = [(ETContainerViewStatusBarAccessibility *)self safeValueForKey:@"titleLabel"];
    [v9 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    [v8 axSafelyAddObject:v9];

    id v3 = v8;
  }

  return v3;
}

- (BOOL)_accessibilityAutomationHitTestReverseOrder
{
  return 1;
}

@end