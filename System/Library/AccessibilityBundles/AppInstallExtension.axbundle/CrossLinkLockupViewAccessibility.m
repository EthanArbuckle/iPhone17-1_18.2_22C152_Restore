@interface CrossLinkLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axLockupView;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CrossLinkLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.CrossLinkLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppInstallExtension.CrossLinkLockupView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppInstallExtension.CrossLinkLockupView", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppInstallExtension.CrossLinkLockupView", @"accessibilityLockupView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(CrossLinkLockupViewAccessibility *)self _axLockupView];
  v4 = [(CrossLinkLockupViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v5 = [(CrossLinkLockupViewAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel"];
  v6 = [MEMORY[0x263EFF980] array];
  if ([v3 _accessibilityViewIsVisible]) {
    [v6 axSafelyAddObject:v3];
  }
  if ([v4 _accessibilityViewIsVisible]) {
    [v6 axSafelyAddObject:v4];
  }
  if ([v5 _accessibilityViewIsVisible]) {
    [v6 axSafelyAddObject:v5];
  }
  v7 = AXLabelForElements();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(CrossLinkLockupViewAccessibility *)self _axLockupView];
  id v3 = [v2 _accessibilitySupplementaryFooterViews];

  return v3;
}

- (id)_axLockupView
{
  return (id)[(CrossLinkLockupViewAccessibility *)self safeValueForKey:@"accessibilityLockupView"];
}

@end