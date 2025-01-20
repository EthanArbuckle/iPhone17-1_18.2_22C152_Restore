@interface MusicUsageDetailHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MusicUsageDetailHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicUsageDetailHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicUsageDetailHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"MusicUsageDetailHeaderView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
  [v3 validateClass:@"MusicUsageDetailHeaderView" hasInstanceVariable:@"_sizeLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MusicUsageDetailHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(MusicUsageDetailHeaderViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  v6 = [v5 accessibilityLabel];
  v7 = [(MusicUsageDetailHeaderViewAccessibility *)self safeValueForKey:@"_sizeLabel"];
  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

@end