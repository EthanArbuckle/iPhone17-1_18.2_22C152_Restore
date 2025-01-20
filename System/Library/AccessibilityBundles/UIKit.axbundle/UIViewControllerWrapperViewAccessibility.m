@interface UIViewControllerWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
- (int64_t)accessibilityContainerType;
@end

@implementation UIViewControllerWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIViewControllerWrapperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 0;
}

@end