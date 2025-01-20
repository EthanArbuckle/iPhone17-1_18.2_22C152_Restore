@interface MusicTrackCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MusicTrackCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.MusicTrackCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)[(MusicTrackCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end