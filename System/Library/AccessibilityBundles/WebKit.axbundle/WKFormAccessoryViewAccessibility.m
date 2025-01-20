@interface WKFormAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)axNextItem;
- (id)axPreviousItem;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation WKFormAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WKFormAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WKFormAccessoryView" hasInstanceVariable:@"_nextItem" withType:"{RetainPtr<UIBarButtonItem>=\"m_ptr\"^v}"];
  [v3 validateClass:@"WKFormAccessoryView" hasInstanceVariable:@"_previousItem" withType:"{RetainPtr<UIBarButtonItem>=\"m_ptr\"^v}"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)WKFormAccessoryViewAccessibility;
  [(WKFormAccessoryViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(WKFormAccessoryViewAccessibility *)self axNextItem];
  v4 = accessibilityLocalizedString(@"next.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(WKFormAccessoryViewAccessibility *)self axPreviousItem];
  v6 = accessibilityLocalizedString(@"previous.button");
  [v5 setAccessibilityLabel:v6];
}

- (id)axNextItem
{
  v2 = (id *)[(WKFormAccessoryViewAccessibility *)self safeIvarForKey:@"_nextItem"];
  if (v2) {
    v2 = (id *)*v2;
  }

  return v2;
}

- (id)axPreviousItem
{
  v2 = (id *)[(WKFormAccessoryViewAccessibility *)self safeIvarForKey:@"_previousItem"];
  if (v2) {
    v2 = (id *)*v2;
  }

  return v2;
}

@end