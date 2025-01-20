@interface MTPodcastPlaylistSheetHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axSwitch;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MTPodcastPlaylistSheetHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTPodcastPlaylistSheetHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTPodcastPlaylistSheetHeaderView" hasInstanceVariable:@"_switch" withType:"UISwitch"];
  [v3 validateClass:@"MTPodcastPlaylistSheetHeaderView" hasInstanceVariable:@"_title" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MTPodcastPlaylistSheetHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_title"];
}

- (id)_axSwitch
{
  return (id)[(MTPodcastPlaylistSheetHeaderViewAccessibility *)self safeValueForKey:@"_switch"];
}

- (id)accessibilityValue
{
  v2 = [(MTPodcastPlaylistSheetHeaderViewAccessibility *)self _axSwitch];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MTPodcastPlaylistSheetHeaderViewAccessibility *)self _axSwitch];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(MTPodcastPlaylistSheetHeaderViewAccessibility *)self _axSwitch];
  [v2 accessibilityTraits];

  return _AXTraitsRemoveTrait();
}

@end