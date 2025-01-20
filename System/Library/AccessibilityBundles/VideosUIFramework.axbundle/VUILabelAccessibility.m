@interface VUILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation VUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUILabel" isKindOfClass:@"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILabel", @"textLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUITextLayout", @"textTransform", "q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)VUILabelAccessibility;
  [(VUILabelAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(VUILabelAccessibility *)self tag] == 100) {
    [(VUILabelAccessibility *)self setIsAccessibilityElement:0];
  }
}

- (id)accessibilityLabel
{
  v9.receiver = self;
  v9.super_class = (Class)VUILabelAccessibility;
  objc_super v3 = [(VUILabelAccessibility *)&v9 accessibilityLabel];
  v4 = [(VUILabelAccessibility *)self safeValueForKey:@"textLayout"];
  v5 = __UIAccessibilitySafeClass();

  if ([v5 safeIntegerForKey:@"textTransform"] == 2)
  {
    uint64_t v6 = [v3 localizedLowercaseString];

    objc_super v3 = (void *)v6;
  }
  v7 = [v3 stringByReplacingOccurrencesOfString:@"·" withString:&stru_26F829E60];

  return v7;
}

@end