@interface HURecordingButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityAttributedHint;
- (id)accessibilityAttributedLabel;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation HURecordingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HURecordingButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HURecordingButton", @"currentRecordingState", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HURecordingButton", @"setEnabled:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HURecordingButton", @"setImage:forState:animated:", "v", "@", "Q", "B", 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityAttributedLabel
{
  v11[1] = *MEMORY[0x263EF8340];
  if ([(HURecordingButtonAccessibility *)self safeUnsignedIntegerForKey:@"currentRecordingState"])
  {
    v2 = 0;
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x263F089B8]);
    v4 = accessibilityHomeUILocalizedString(@"record.button");
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

- (id)accessibilityUserInputLabels
{
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HURecordingButtonAccessibility *)self safeUnsignedIntegerForKey:@"currentRecordingState"];
  if (v2 == 4)
  {
    id v3 = accessibilityHomeUILocalizedString(@"stop.button");
    v8[0] = v3;
    v4 = accessibilityHomeUILocalizedString(@"stop.alternative.done");
    v8[1] = v4;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    goto LABEL_5;
  }
  if (!v2)
  {
    id v3 = accessibilityHomeUILocalizedString(@"record.button");
    v9[0] = v3;
    v4 = accessibilityHomeUILocalizedString(@"record.alternative.start");
    v9[1] = v4;
    v5 = accessibilityHomeUILocalizedString(@"record.alternative.announce");
    v9[2] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];

LABEL_5:
    goto LABEL_7;
  }
  v6 = (void *)MEMORY[0x263EFFA68];
LABEL_7:

  return v6;
}

- (void)setImage:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)HURecordingButtonAccessibility;
  [(HURecordingButtonAccessibility *)&v5 setImage:a3 forState:a4 animated:a5];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)accessibilityHint
{
  return 0;
}

- (id)accessibilityAttributedHint
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HURecordingButtonAccessibility;
  [(HURecordingButtonAccessibility *)&v3 setEnabled:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(HURecordingButtonAccessibility *)self safeUnsignedIntegerForKey:@"currentRecordingState"];
  switch(v2)
  {
    case 0:
      objc_super v3 = @"record.button";
      goto LABEL_7;
    case 5:
      objc_super v3 = @"send.button";
      goto LABEL_7;
    case 4:
      objc_super v3 = @"stop.button";
LABEL_7:
      v4 = accessibilityHomeUILocalizedString(v3);
      goto LABEL_9;
  }
  v4 = 0;
LABEL_9:

  return v4;
}

@end