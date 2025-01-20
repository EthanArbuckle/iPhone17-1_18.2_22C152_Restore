@interface _UIBackgroundHitTestWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityCanBeConsideredAsMainWindow;
@end

@implementation _UIBackgroundHitTestWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBackgroundHitTestWindow";
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