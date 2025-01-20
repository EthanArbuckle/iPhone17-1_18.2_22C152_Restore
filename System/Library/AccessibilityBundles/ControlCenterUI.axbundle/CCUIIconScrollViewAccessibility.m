@interface CCUIIconScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityServesAsFirstElement;
@end

@implementation CCUIIconScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIIconScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

@end