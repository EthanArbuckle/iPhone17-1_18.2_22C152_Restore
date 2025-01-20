@interface UIPickerContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIPickerContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPickerContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIPickerContentView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPickerContentView", @"isChecked", "B", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  id v3 = (id)[(UIPickerContentViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  id v4 = (id)[v3 accessibilityLabel];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3 = 0;
  if ([(UIPickerContentViewAccessibility *)self safeBoolForKey:@"isChecked"]) {
    return *MEMORY[0x263F1CF38];
  }
  return v3;
}

@end