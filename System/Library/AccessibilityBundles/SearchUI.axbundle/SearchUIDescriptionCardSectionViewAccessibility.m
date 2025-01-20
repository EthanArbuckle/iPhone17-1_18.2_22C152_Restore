@interface SearchUIDescriptionCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (void)didPressMoreButton;
@end

@implementation SearchUIDescriptionCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIDescriptionCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchUIDescriptionCardSectionView" hasProperty:@"contentView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIDescriptionCardSectionView", @"didPressMoreButton", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKDescriptionView", @"text", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(SearchUIDescriptionCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
  id v3 = [v2 safeValueForKey:@"text"];
  v4 = [v3 accessibilityLabel];

  return v4;
}

- (void)didPressMoreButton
{
  v2.receiver = self;
  v2.super_class = (Class)SearchUIDescriptionCardSectionViewAccessibility;
  [(SearchUIDescriptionCardSectionViewAccessibility *)&v2 didPressMoreButton];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end