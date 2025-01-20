@interface MediaControlsParentContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation MediaControlsParentContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsParentContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end