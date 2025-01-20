@interface AVTRecordingButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityAttributedLabel;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setUIState:(unint64_t)a3;
@end

@implementation AVTRecordingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTRecordingButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTRecordingButton", @"uiState", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTRecordingButton", @"setUIState:", "v", "Q", 0);
}

- (id)accessibilityAttributedLabel
{
  v11[1] = *MEMORY[0x263EF8340];
  if ([(AVTRecordingButtonAccessibility *)self safeIntegerForKey:@"uiState"])
  {
    v2 = 0;
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x263F089B8]);
    v4 = accessibilityLocalizedString(@"animoji.record.button");
    v2 = (void *)[v3 initWithString:v4];

    v5 = [MEMORY[0x263EFF960] preferredLanguages];
    v6 = [v5 firstObject];
    int v7 = [v6 hasPrefix:@"en"];

    if (v7)
    {
      uint64_t v10 = *MEMORY[0x263F1CE88];
      v11[0] = @"ɻɪ.ˈkwɔɻd";
      v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      objc_msgSend(v2, "setAttributes:range:", v8, 0, objc_msgSend(v2, "length"));
    }
  }

  return v2;
}

- (id)accessibilityLabel
{
  unint64_t v2 = [(AVTRecordingButtonAccessibility *)self safeIntegerForKey:@"uiState"];
  if (v2 <= 3)
  {
    id v3 = accessibilityLocalizedString(off_26510A4A0[v2]);
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)AVTRecordingButtonAccessibility;
  unint64_t v3 = [(AVTRecordingButtonAccessibility *)&v7 accessibilityTraits];
  uint64_t v4 = [(AVTRecordingButtonAccessibility *)self safeIntegerForKey:@"uiState"];
  uint64_t v5 = *MEMORY[0x263F1CF40];
  if (v4 != 1) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (void)setUIState:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTRecordingButtonAccessibility;
  [(AVTRecordingButtonAccessibility *)&v4 setUIState:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
}

@end