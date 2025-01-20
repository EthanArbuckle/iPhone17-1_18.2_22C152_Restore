@interface CKDetailsSeparatorCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
@end

@implementation CKDetailsSeparatorCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsSeparatorCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end