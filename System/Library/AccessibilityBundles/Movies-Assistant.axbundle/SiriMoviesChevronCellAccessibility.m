@interface SiriMoviesChevronCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)chevronButtonIsDimmed;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SiriMoviesChevronCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriMoviesChevronCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)chevronButtonIsDimmed
{
  v2 = [(SiriMoviesChevronCellAccessibility *)self safeValueForKey:@"chevronButton"];
  v3 = [v2 safeValueForKey:@"userInteractionEnabled"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isAccessibilityElement
{
  if (![(SiriMoviesChevronCellAccessibility *)self chevronButtonIsDimmed]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SiriMoviesChevronCellAccessibility;
  return [(SiriMoviesChevronCellAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  if ([(SiriMoviesChevronCellAccessibility *)self chevronButtonIsDimmed])
  {
    v6.receiver = self;
    v6.super_class = (Class)SiriMoviesChevronCellAccessibility;
    v3 = [(SiriMoviesChevronCellAccessibility *)&v6 accessibilityLabel];
  }
  else
  {
    objc_super v4 = [(SiriMoviesChevronCellAccessibility *)self safeValueForKey:@"chevronButton"];
    v3 = [v4 accessibilityLabel];
  }

  return v3;
}

- (id)accessibilityValue
{
  if ([(SiriMoviesChevronCellAccessibility *)self chevronButtonIsDimmed])
  {
    v6.receiver = self;
    v6.super_class = (Class)SiriMoviesChevronCellAccessibility;
    v3 = [(SiriMoviesChevronCellAccessibility *)&v6 accessibilityValue];
  }
  else
  {
    objc_super v4 = [(SiriMoviesChevronCellAccessibility *)self safeValueForKey:@"chevronButton"];
    v3 = [v4 accessibilityValue];
  }

  return v3;
}

- (id)accessibilityHint
{
  if ([(SiriMoviesChevronCellAccessibility *)self chevronButtonIsDimmed])
  {
    v5.receiver = self;
    v5.super_class = (Class)SiriMoviesChevronCellAccessibility;
    v3 = [(SiriMoviesChevronCellAccessibility *)&v5 accessibilityHint];
  }
  else
  {
    v3 = accessibilityLocalizedString(@"chevron.cell.hint");
  }

  return v3;
}

@end