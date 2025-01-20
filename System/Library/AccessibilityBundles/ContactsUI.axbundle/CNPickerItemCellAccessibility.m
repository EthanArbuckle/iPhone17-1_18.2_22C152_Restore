@interface CNPickerItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)beginEditing;
- (void)endEditing;
@end

@implementation CNPickerItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPickerItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPickerItemCell", @"textField", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPickerItemCell", @"beginEditing", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPickerItemCell", @"endEditing", "v", 0);
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(CNPickerItemCellAccessibility *)self safeValueForKey:@"textField"];
  int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    v5 = [(CNPickerItemCellAccessibility *)self safeValueForKey:@"textField"];
    unint64_t v6 = [v5 accessibilityTraits];

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPickerItemCellAccessibility;
    return [(CNPickerItemCellAccessibility *)&v8 accessibilityTraits];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CNPickerItemCellAccessibility *)self safeValueForKey:@"textLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(CNPickerItemCellAccessibility *)self safeValueForKey:@"textField"];
  int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    v5 = [(CNPickerItemCellAccessibility *)self safeValueForKey:@"textField"];
    unint64_t v6 = [v5 accessibilityValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)[(CNPickerItemCellAccessibility *)self safeValueForKey:@"textField"];
}

- (void)beginEditing
{
  v4.receiver = self;
  v4.super_class = (Class)CNPickerItemCellAccessibility;
  [(CNPickerItemCellAccessibility *)&v4 beginEditing];
  id v3 = (id)[(CNPickerItemCellAccessibility *)self safeValueForKey:@"_accessibilityClearChildren"];
}

- (void)endEditing
{
  v4.receiver = self;
  v4.super_class = (Class)CNPickerItemCellAccessibility;
  [(CNPickerItemCellAccessibility *)&v4 endEditing];
  id v3 = (id)[(CNPickerItemCellAccessibility *)self safeValueForKey:@"_accessibilityClearChildren"];
}

@end