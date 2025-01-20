@interface AKFontSizePickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation AKFontSizePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKFontSizePicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKFontSizePicker", @"slider", "@", 0);
  [v3 validateClass:@"AKFontSizePicker" hasInstanceVariable:@"_value" withType:"d"];
}

- (BOOL)isAccessibilityElement
{
  v6.receiver = self;
  v6.super_class = (Class)AKFontSizePickerAccessibility;
  BOOL v3 = [(AKFontSizePickerAccessibility *)&v6 isAccessibilityElement];
  v4 = [(AKFontSizePickerAccessibility *)self safeValueForKey:@"slider"];

  return v4 || v3;
}

- (id)accessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)AKFontSizePickerAccessibility;
  BOOL v3 = [(AKFontSizePickerAccessibility *)&v7 accessibilityLabel];
  v4 = [(AKFontSizePickerAccessibility *)self safeValueForKey:@"slider"];

  if (v4)
  {
    uint64_t v5 = accessibilityLocalizedString(@"text.size");

    BOOL v3 = (void *)v5;
  }

  return v3;
}

- (id)accessibilityValue
{
  v11.receiver = self;
  v11.super_class = (Class)AKFontSizePickerAccessibility;
  BOOL v3 = [(AKFontSizePickerAccessibility *)&v11 accessibilityValue];
  v4 = [(AKFontSizePickerAccessibility *)self safeValueForKey:@"slider"];

  if (v4)
  {
    uint64_t v5 = NSString;
    objc_super v6 = accessibilityLocalizedString(@"stroke.fontsize.value");
    objc_super v7 = NSNumber;
    [(AKFontSizePickerAccessibility *)self safeCGFloatForKey:@"_value"];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    uint64_t v9 = objc_msgSend(v5, "stringWithFormat:", v6, v8);

    BOOL v3 = (void *)v9;
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)AKFontSizePickerAccessibility;
  unint64_t v3 = [(AKFontSizePickerAccessibility *)&v7 accessibilityTraits];
  v4 = [(AKFontSizePickerAccessibility *)self safeValueForKey:@"slider"];

  uint64_t v5 = *MEMORY[0x263F1CED8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (void)accessibilityDecrement
{
  id v2 = [(AKFontSizePickerAccessibility *)self safeValueForKey:@"slider"];
  [v2 accessibilityDecrement];
}

- (void)accessibilityIncrement
{
  id v2 = [(AKFontSizePickerAccessibility *)self safeValueForKey:@"slider"];
  [v2 accessibilityIncrement];
}

@end