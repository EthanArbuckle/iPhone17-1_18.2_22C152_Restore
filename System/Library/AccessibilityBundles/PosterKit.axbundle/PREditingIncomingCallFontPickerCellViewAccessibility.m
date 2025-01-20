@interface PREditingIncomingCallFontPickerCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)axFontWeight:(id)a3;
@end

@implementation PREditingIncomingCallFontPickerCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingIncomingCallFontPickerCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PREditingIncomingCallFontPickerCellView" isKindOfClass:@"PREditingFontPickerCellView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingFontPickerCellView", @"contentFont", "@", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(PREditingIncomingCallFontPickerCellViewAccessibility *)self safeValueForKey:@"contentFont"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 fontName];
  v6 = [v5 componentsSeparatedByString:@"-"];

  v7 = [v4 familyName];
  v8 = [v6 lastObject];
  v11 = [(PREditingIncomingCallFontPickerCellViewAccessibility *)self axFontWeight:v8];
  v9 = __UIAXStringForVariables();

  return v9;
}

- (id)axFontWeight:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Medium"])
  {
    v4 = @"time.font.medium";
LABEL_9:
    v5 = accessibilityLocalizedString(v4);
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"Semibold"])
  {
    v4 = @"time.font.bold";
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"Light"])
  {
    v4 = @"time.font.light";
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"Heavy"])
  {
    v4 = @"time.font.heavy";
    goto LABEL_9;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

@end