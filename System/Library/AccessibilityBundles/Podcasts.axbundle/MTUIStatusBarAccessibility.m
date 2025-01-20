@interface MTUIStatusBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)_accessibilitySortPriority;
@end

@implementation MTUIStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilitySortPriority
{
  return *(void *)"d" + 1;
}

@end