@interface SSScreenshotsWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityCanBeConsideredAsMainWindow;
@end

@implementation SSScreenshotsWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSScreenshotsWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  return 0;
}

@end