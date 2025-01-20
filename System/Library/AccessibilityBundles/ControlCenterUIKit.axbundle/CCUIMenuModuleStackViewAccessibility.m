@interface CCUIMenuModuleStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation CCUIMenuModuleStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIMenuModuleStackView";
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