@interface NPLPeopleViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (BOOL)_accessibilityShouldSortTableViewCellChildren;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
@end

@implementation NPLPeopleViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NPLPeopleViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (BOOL)_accessibilityShouldSortTableViewCellChildren
{
  return 1;
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)NPLPeopleViewCellAccessibility;
  [(NPLPeopleViewCellAccessibility *)&v7 pageViewController:a3 didFinishAnimating:a4 previousViewControllers:a5 transitionCompleted:a6];
  [(NPLPeopleViewCellAccessibility *)self _accessibilityClearChildren];
}

@end