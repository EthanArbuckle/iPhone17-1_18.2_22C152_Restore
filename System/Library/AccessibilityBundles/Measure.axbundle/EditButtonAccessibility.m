@interface EditButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation EditButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.EditButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.EditButton", @"editEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.EditButton", @"isInputEnabled", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"ADD_BUTTON");
}

- (id)accessibilityValue
{
  v2 = AXMeasureSpeakableDescriptionForCurrentMeasurement();
  if (v2)
  {
    id v3 = NSString;
    v4 = accessibilityLocalizedString(@"ADD_BUTTON_LAST_MEASUREMENT");
    v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3 = *MEMORY[0x263F1CF68] | *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CF40];
  if (![(EditButtonAccessibility *)self safeBoolForKey:@"editEnabled"]
    || ([(EditButtonAccessibility *)self safeBoolForKey:@"isInputEnabled"] & 1) == 0)
  {
    v3 |= *MEMORY[0x263F1CF20];
  }
  return v3;
}

@end