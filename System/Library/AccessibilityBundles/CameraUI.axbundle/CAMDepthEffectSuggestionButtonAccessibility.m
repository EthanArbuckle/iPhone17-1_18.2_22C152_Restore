@interface CAMDepthEffectSuggestionButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityValue;
@end

@implementation CAMDepthEffectSuggestionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDepthEffectSuggestionButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDepthEffectSuggestionButton", @"mode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDepthEffectSuggestionButton", @"setMode:animated:", "v", "q", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"depth.button");
}

- (id)accessibilityValue
{
  uint64_t v2 = [(CAMDepthEffectSuggestionButtonAccessibility *)self safeIntegerForKey:@"mode"];
  if ((unint64_t)(v2 - 1) < 2)
  {
    id v3 = @"depth.on";
LABEL_5:
    v5 = accessibilityCameraUILocalizedString(v3);
    goto LABEL_9;
  }
  uint64_t v4 = v2;
  if (!v2)
  {
    id v3 = @"depth.off";
    goto LABEL_5;
  }
  v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    [(CAMDepthEffectSuggestionButtonAccessibility *)v4 accessibilityValue];
  }

  v5 = 0;
LABEL_9:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDepthEffectSuggestionButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDepthEffectSuggestionButtonAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)accessibilityActivate
{
  return 1;
}

void __68__CAMDepthEffectSuggestionButtonAccessibility_accessibilityActivate__block_invoke()
{
  v0 = __UIAccessibilitySafeClass();
  [v0 sendActionsForControlEvents:64];
}

- (void)accessibilityValue
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = [NSNumber numberWithInteger:a1];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_24019A000, a2, OS_LOG_TYPE_ERROR, "Missing value for depth effect suggestion button mode: %@", (uint8_t *)&v4, 0xCu);
}

@end