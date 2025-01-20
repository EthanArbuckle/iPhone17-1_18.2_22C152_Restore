@interface SUUIStackedBarCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsTappable;
- (BOOL)accessibilityActivate;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIStackedBarCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIStackedBarCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIStackedBarCell" hasInstanceVariable:@"_backButton" withType:"UIButton"];
  [v3 validateClass:@"SUUIStackedBarCell" hasInstanceVariable:@"_expanded" withType:"BOOL"];
}

- (BOOL)accessibilityActivate
{
  BOOL v3 = [(SUUIStackedBarCellAccessibility *)self _axIsTappable];
  if (v3)
  {
    objc_opt_class();
    v4 = [(SUUIStackedBarCellAccessibility *)self safeValueForKey:@"_backButton"];
    v5 = __UIAccessibilityCastAsClass();

    [v5 sendActionsForControlEvents:64];
  }
  return v3;
}

- (id)accessibilityHint
{
  if ([(SUUIStackedBarCellAccessibility *)self _axIsTappable]
    && [(SUUIStackedBarCellAccessibility *)self safeBoolForKey:@"_expanded"])
  {
    BOOL v3 = accessibilityLocalizedString(@"explore.category.collapse");
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  if (![(SUUIStackedBarCellAccessibility *)self _axIsTappable]) {
    return *MEMORY[0x263F1CF48];
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIStackedBarCellAccessibility;
  return [(SUUIStackedBarCellAccessibility *)&v4 accessibilityTraits];
}

- (BOOL)_axIsTappable
{
  objc_opt_class();
  BOOL v3 = [(SUUIStackedBarCellAccessibility *)self safeValueForKey:@"_backButton"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  int v5 = [v4 isHidden] ^ 1;
  return v5;
}

@end