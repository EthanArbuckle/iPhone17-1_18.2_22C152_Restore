@interface ActivitySharingFriendListCompetitionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ActivitySharingFriendListCompetitionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.ActivitySharingFriendListCompetitionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)_UIAXStringForAllChildren(self, a2);
}

@end