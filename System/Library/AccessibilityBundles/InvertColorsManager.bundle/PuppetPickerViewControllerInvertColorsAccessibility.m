@interface PuppetPickerViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
@end

@implementation PuppetPickerViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PuppetPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PuppetPickerViewControllerInvertColorsAccessibility;
  v6 = [(PuppetPickerViewControllerInvertColorsAccessibility *)&v8 pickerView:a3 viewForRow:a4 forComponent:a5 reusingView:a6];
  [v6 setAccessibilityIgnoresInvertColors:1];

  return v6;
}

@end