@interface _TVStackViewFlowLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySortCollectionViewLogically;
@end

@implementation _TVStackViewFlowLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVStackViewFlowLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilitySortCollectionViewLogically
{
  if ([(_TVStackViewFlowLayoutAccessibility *)self safeIntegerForKey:@"supplementaryCellSection"] > 0)return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)_TVStackViewFlowLayoutAccessibility;
  return [(_TVStackViewFlowLayoutAccessibility *)&v4 _accessibilitySortCollectionViewLogically];
}

@end