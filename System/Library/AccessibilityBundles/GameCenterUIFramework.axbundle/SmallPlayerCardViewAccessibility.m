@interface SmallPlayerCardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SmallPlayerCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.SmallPlayerCardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.SmallPlayerCardView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.SmallPlayerCardView", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.SmallPlayerCardView", @"accessibilityInviteButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.SmallPlayerCardView", @"accessibilityCloseButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SmallPlayerCardViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilitySubtitleLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SmallPlayerCardViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SmallPlayerCardViewAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SmallPlayerCardViewAccessibility *)self safeValueForKey:@"accessibilityInviteButton"];
  v5 = [(SmallPlayerCardViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v6 = [v5 accessibilityLabel];
  [v4 setAccessibilityValue:v6];

  [v3 axSafelyAddObject:v4];
  v7 = [(SmallPlayerCardViewAccessibility *)self safeValueForKey:@"accessibilityCloseButton"];
  v8 = AXGameCenterUIFrameworkLocString(@"CLOSE_BUTTON");
  [v7 setAccessibilityLabel:v8];

  v9 = [v5 accessibilityLabel];
  [v7 setAccessibilityValue:v9];

  [v3 axSafelyAddObject:v7];

  return v3;
}

@end