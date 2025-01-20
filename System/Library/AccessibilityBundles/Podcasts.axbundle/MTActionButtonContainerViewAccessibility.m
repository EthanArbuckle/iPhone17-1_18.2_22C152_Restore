@interface MTActionButtonContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation MTActionButtonContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTActionButtonContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end