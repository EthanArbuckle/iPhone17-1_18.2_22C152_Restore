@interface SSSScreenshotViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation SSSScreenshotViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSSScreenshotView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end