@interface MKAttributionLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MKAttributionLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKAttributionLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v3 = [(MKAttributionLabelAccessibility *)self safeValueForKey:@"_innerText"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 string];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MKAttributionLabelAccessibility;
  return *MEMORY[0x263F1CF10] | [(MKAttributionLabelAccessibility *)&v3 accessibilityTraits];
}

@end