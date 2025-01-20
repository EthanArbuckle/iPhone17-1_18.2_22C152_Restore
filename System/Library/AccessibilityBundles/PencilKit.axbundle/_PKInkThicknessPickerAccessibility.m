@interface _PKInkThicknessPickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation _PKInkThicknessPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_PKInkThicknessPicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_PKInkThicknessPicker", @"thicknessButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_PKInkThicknessPicker", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)_PKInkThicknessPickerAccessibility;
  [(_PKInkThicknessPickerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_PKInkThicknessPickerAccessibility *)self safeArrayForKey:@"thicknessButtons"];
  if ([v3 count] != 5) {
    _AXAssert();
  }
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      if (v4 > 4)
      {
        v5 = 0;
      }
      else
      {
        v5 = accessibilityPencilKitLocalizedString(off_265143058[v4]);
      }
      v6 = [v3 objectAtIndex:v4];
      [v6 setAccessibilityValue:v5];

      ++v4;
    }
    while (v4 < [v3 count]);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_PKInkThicknessPickerAccessibility;
  [(_PKInkThicknessPickerAccessibility *)&v3 layoutSubviews];
  [(_PKInkThicknessPickerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end