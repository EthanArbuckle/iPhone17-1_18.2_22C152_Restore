@interface NTKContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown;
@end

@implementation NTKContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end