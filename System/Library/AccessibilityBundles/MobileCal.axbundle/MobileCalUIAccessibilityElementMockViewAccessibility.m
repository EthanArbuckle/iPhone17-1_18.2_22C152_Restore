@interface MobileCalUIAccessibilityElementMockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
@end

@implementation MobileCalUIAccessibilityElementMockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAccessibilityElementMockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityActivate
{
  v3 = [(MobileCalUIAccessibilityElementMockViewAccessibility *)self safeValueForKey:@"_view"];
  v4 = [v3 safeValueForKey:@"window"];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MobileCalUIAccessibilityElementMockViewAccessibility;
  return [(MobileCalUIAccessibilityElementMockViewAccessibility *)&v6 accessibilityActivate];
}

@end