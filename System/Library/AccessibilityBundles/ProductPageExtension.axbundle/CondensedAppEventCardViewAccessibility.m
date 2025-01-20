@interface CondensedAppEventCardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CondensedAppEventCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.CondensedAppEventCardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ProductPageExtension.CondensedAppEventCardView" hasSwiftField:@"appEventFormattedDateView" withSwiftType:"AppPromotionFormattedDateView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.CondensedAppEventCardView", @"accessibilityTitleLabel", "@", 0);
  [v3 validateClass:@"ProductPageExtension.AppPromotionFormattedDateView"];
  [v3 validateClass:@"ProductPageExtension.AppPromotionFormattedDateView" hasSwiftField:@"textLabel" withSwiftType:"DynamicTypeLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityAppStoreLocalizedString(@"view.event.hint");
}

- (id)accessibilityLabel
{
  id v3 = [(CondensedAppEventCardViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v4 = [(CondensedAppEventCardViewAccessibility *)self safeSwiftValueForKey:@"appEventFormattedDateView"];
  MEMORY[0x24565D250](@"AppStore.AppPromotionFormattedDateView");
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 safeSwiftValueForKey:@"textLabel"];
    v6 = __UIAXStringForVariables();
  }
  else
  {
    v6 = __UIAXStringForVariables();
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CondensedAppEventCardViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CondensedAppEventCardViewAccessibility *)&v3 accessibilityTraits];
}

@end