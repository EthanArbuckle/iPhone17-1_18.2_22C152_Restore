@interface CSMediaControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
@end

@implementation CSMediaControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSMediaControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

@end