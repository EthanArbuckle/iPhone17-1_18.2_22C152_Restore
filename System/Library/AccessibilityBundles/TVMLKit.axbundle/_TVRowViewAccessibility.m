@interface _TVRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation _TVRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end