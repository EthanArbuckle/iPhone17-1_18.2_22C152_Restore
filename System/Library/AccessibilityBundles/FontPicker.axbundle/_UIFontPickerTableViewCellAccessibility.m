@interface _UIFontPickerTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation _UIFontPickerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFontPickerTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_existingSystemAccessoryView:", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFontPickerTableViewCellAccessibility;
  [(_UIFontPickerTableViewCellAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(_UIFontPickerTableViewCellAccessibility *)self _existingSystemAccessoryView:0];
    objc_initWeak(&location, v3);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __85___UIFontPickerTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v4[3] = &unk_265121FF0;
    objc_copyWeak(&v5, &location);
    [v3 _setAccessibilityLabelBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFontPickerTableViewCellAccessibility;
  [(_UIFontPickerTableViewCellAccessibility *)&v3 layoutSubviews];
  [(_UIFontPickerTableViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end