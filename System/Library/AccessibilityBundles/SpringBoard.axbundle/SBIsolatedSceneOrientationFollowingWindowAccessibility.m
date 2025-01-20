@interface SBIsolatedSceneOrientationFollowingWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityWindowVisible;
@end

@implementation SBIsolatedSceneOrientationFollowingWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIsolatedSceneOrientationFollowingWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  return 0;
}

@end