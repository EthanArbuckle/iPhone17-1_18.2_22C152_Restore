@interface ABPostalNameContactEditingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (ABPostalNameContactEditingCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_accessibilityChildren;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setCardGroupItem:(id)a3;
@end

@implementation ABPostalNameContactEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ABPostalNameContactEditingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ABPostalNameContactEditingCell" hasInstanceVariable:@"_editingTextField" withType:"UITextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ABPostalNameContactEditingCell", @"setCardGroupItem:", "v", "@", 0);
}

- (id)_accessibilityChildren
{
  [(ABPostalNameContactEditingCellAccessibility *)self frame];
  if (v4 < 1.0 || v3 < 1.0)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ABPostalNameContactEditingCellAccessibility;
    v6 = [(ABPostalNameContactEditingCellAccessibility *)&v8 _accessibilityChildren];
  }

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)ABPostalNameContactEditingCellAccessibility;
  [(ABPostalNameContactEditingCellAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  double v3 = [(ABPostalNameContactEditingCellAccessibility *)self safeValueForKey:@"_editingTextField"];
  double v4 = [(ABPostalNameContactEditingCellAccessibility *)self safeValueForKey:@"_editingTextField"];
  v5 = [v4 safeValueForKey:@"placeholder"];
  [v3 setAccessibilityLabel:v5];
}

- (void)setCardGroupItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ABPostalNameContactEditingCellAccessibility;
  [(ABPostalNameContactEditingCellAccessibility *)&v4 setCardGroupItem:a3];
  [(ABPostalNameContactEditingCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (ABPostalNameContactEditingCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ABPostalNameContactEditingCellAccessibility;
  objc_super v4 = [(ABPostalNameContactEditingCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(ABPostalNameContactEditingCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  return v4;
}

@end