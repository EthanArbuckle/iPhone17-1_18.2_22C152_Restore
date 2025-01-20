@interface OfferButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation OfferButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SubscribePageExtension.OfferButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SubscribePageExtension.OfferButton" hasSwiftField:@"label" withSwiftType:"DynamicTypeLabel"];
  [v3 validateClass:@"SubscribePageExtension.OfferButton" hasSwiftField:@"subtitleLabel" withSwiftType:"DynamicTypeLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)OfferButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(OfferButtonAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF68];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(OfferButtonAccessibility *)self safeSwiftValueForKey:@"label"];
  v6 = [(OfferButtonAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end