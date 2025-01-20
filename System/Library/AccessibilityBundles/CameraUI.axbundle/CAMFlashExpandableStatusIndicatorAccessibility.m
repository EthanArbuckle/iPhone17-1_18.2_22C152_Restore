@interface CAMFlashExpandableStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (id)_axCurrentFlashValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_axCurrentFlashValue;
@end

@implementation CAMFlashExpandableStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMFlashExpandableStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFlashExpandableStatusIndicator", @"flashMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFlashExpandableStatusIndicator", @"isFlashUnavailable", "B", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"FLASH_MODE_BUTTON_LABEL");
}

- (id)accessibilityValue
{
  id v3 = [(CAMFlashExpandableStatusIndicatorAccessibility *)self _axCurrentFlashValue];
  if (v3)
  {
    uint64_t v4 = [(CAMFlashExpandableStatusIndicatorAccessibility *)self _axCurrentFlashValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMFlashExpandableStatusIndicatorAccessibility;
    uint64_t v4 = [(CAMFlashExpandableStatusIndicatorAccessibility *)&v7 accessibilityValue];
  }
  v5 = (void *)v4;

  return v5;
}

- (BOOL)accessibilityActivate
{
  v8.receiver = self;
  v8.super_class = (Class)CAMFlashExpandableStatusIndicatorAccessibility;
  BOOL v3 = [(CAMFlashExpandableStatusIndicatorAccessibility *)&v8 accessibilityActivate];
  uint64_t v4 = [(CAMFlashExpandableStatusIndicatorAccessibility *)self _axCurrentFlashValue];
  v5 = v4;
  if (v4)
  {
    id v7 = v4;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  return v3;
}

void __71__CAMFlashExpandableStatusIndicatorAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
}

- (id)_axCurrentFlashValue
{
  if ([(CAMFlashExpandableStatusIndicatorAccessibility *)self safeBoolForKey:@"isFlashUnavailable"])
  {
    BOOL v3 = @"FLASH_MODE_BUTTON_UNAVAILABLE";
LABEL_9:
    v6 = accessibilityCameraKitLocalizedString(v3);
    goto LABEL_10;
  }
  uint64_t v4 = [(CAMFlashExpandableStatusIndicatorAccessibility *)self safeValueForKey:@"flashMode"];
  uint64_t v5 = [v4 integerValue];

  switch(v5)
  {
    case 2:
      BOOL v3 = @"FLASH_MODE_BUTTON_VALUE_AUTO";
      goto LABEL_9;
    case 1:
      BOOL v3 = @"FLASH_MODE_BUTTON_VALUE_ON";
      goto LABEL_9;
    case 0:
      BOOL v3 = @"FLASH_MODE_BUTTON_VALUE_OFF";
      goto LABEL_9;
  }
  objc_super v8 = AXLogAppAccessibility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(CAMFlashExpandableStatusIndicatorAccessibility *)v5 _axCurrentFlashValue];
  }

  v6 = 0;
LABEL_10:

  return v6;
}

- (void)_axCurrentFlashValue
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24019A000, a2, OS_LOG_TYPE_ERROR, "CAMFlashMode unhandled : %lu", (uint8_t *)&v2, 0xCu);
}

@end