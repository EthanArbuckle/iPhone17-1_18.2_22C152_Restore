@interface MeasureUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axIsDeleteButton;
- (BOOL)axIsActuallySelected;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)axSetIsActuallySelected:(BOOL)a3;
@end

@implementation MeasureUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)axIsActuallySelected
{
  return MEMORY[0x270F0A438](self, &__MeasureUIButtonAccessibility__axIsActuallySelected);
}

- (void)axSetIsActuallySelected:(BOOL)a3
{
}

- (BOOL)_axIsDeleteButton
{
  v2 = [(MeasureUIButtonAccessibility *)self accessibilityIdentification];
  char v3 = [v2 isEqualToString:@"AXMeasureDeleteButton"];

  return v3;
}

- (id)accessibilityLabel
{
  if ([(MeasureUIButtonAccessibility *)self _axIsDeleteButton])
  {
    char v3 = accessibilityLocalizedString(@"DELETE_BUTTON");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MeasureUIButtonAccessibility;
    char v3 = [(MeasureUIButtonAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)MeasureUIButtonAccessibility;
  unint64_t v3 = [(MeasureUIButtonAccessibility *)&v5 accessibilityTraits];
  if ([(MeasureUIButtonAccessibility *)self _axIsDeleteButton]) {
    return v3 & ~*MEMORY[0x263F1CF38] | *MEMORY[0x263F1CF40];
  }
  if ([(MeasureUIButtonAccessibility *)self axIsActuallySelected]) {
    v3 |= *MEMORY[0x263F1CF38];
  }
  return v3;
}

@end