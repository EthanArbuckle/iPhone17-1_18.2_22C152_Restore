@interface TextStyleEditingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TextStyleEditingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PaperKit.TextStyleEditingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PaperKit.TextStyleEditingView" hasSwiftField:@"fontNameControl" withSwiftType:"FontAttributeStylingControl"];
  [v3 validateClass:@"PaperKit.TextStyleEditingView" hasSwiftField:@"fontSizeControl" withSwiftType:"FontAttributeStylingControl"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)TextStyleEditingViewAccessibility;
  [(TextStyleEditingViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TextStyleEditingViewAccessibility *)self safeSwiftValueForKey:@"fontNameControl"];
  v4 = accessibilityLocalizedString(@"text.font");
  [v3 setAccessibilityLabel:v4];

  v5 = [(TextStyleEditingViewAccessibility *)self safeSwiftValueForKey:@"fontSizeControl"];
  v6 = accessibilityLocalizedString(@"text.size");
  [v5 setAccessibilityLabel:v6];
}

@end