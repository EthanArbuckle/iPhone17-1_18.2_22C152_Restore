@interface FontFamiliesCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (FontFamiliesCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAddLabelToButton;
@end

@implementation FontFamiliesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FontFamiliesCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_axAddLabelToButton
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 accessoryView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = accessibilityLocalizedString(@"download.button");
    [v3 setAccessibilityLabel:v4];
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)FontFamiliesCellAccessibility;
  [(FontFamiliesCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(FontFamiliesCellAccessibility *)self _axAddLabelToButton];
}

- (FontFamiliesCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)FontFamiliesCellAccessibility;
  v5 = [(FontFamiliesCellAccessibility *)&v7 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  [(FontFamiliesCellAccessibility *)v5 _axAddLabelToButton];
  return v5;
}

@end