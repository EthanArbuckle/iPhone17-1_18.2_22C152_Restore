@interface CAMFlashStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMFlashStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMFlashStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFlashStatusIndicator", @"flashMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFlashStatusIndicator", @"isFlashUnavailable", "B", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"FLASH_MODE_BUTTON_LABEL");
}

- (id)accessibilityValue
{
  if ([(CAMFlashStatusIndicatorAccessibility *)self safeBoolForKey:@"isFlashUnavailable"])
  {
    id v3 = @"FLASH_MODE_BUTTON_UNAVAILABLE";
  }
  else
  {
    v4 = [(CAMFlashStatusIndicatorAccessibility *)self safeValueForKey:@"flashMode"];
    uint64_t v5 = [v4 integerValue];

    v6 = @"FLASH_MODE_BUTTON_VALUE_AUTO";
    if (v5 == 1) {
      v6 = @"FLASH_MODE_BUTTON_VALUE_ON";
    }
    if (v5) {
      id v3 = v6;
    }
    else {
      id v3 = @"FLASH_MODE_BUTTON_VALUE_OFF";
    }
  }
  v7 = accessibilityCameraKitLocalizedString(v3);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMFlashStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMFlashStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end