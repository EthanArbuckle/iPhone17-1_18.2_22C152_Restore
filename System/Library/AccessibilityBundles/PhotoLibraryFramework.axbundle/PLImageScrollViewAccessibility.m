@interface PLImageScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsScrollAncestor;
@end

@implementation PLImageScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLImageScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 0;
}

@end