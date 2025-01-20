@interface MPVolumeSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
- (void)_layoutVolumeWarningView;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MPVolumeSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPVolumeSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MPVolumeSlider" hasInstanceVariable:@"_volumeController" withType:"MPVolumeController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVolumeController", @"volumeWarningEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVolumeController", @"EUVolumeLimit", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVolumeController", @"volumeWarningState", "q", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(MPVolumeSliderAccessibility *)self accessibilityUserDefinedLabel];

  if (v3) {
    [(MPVolumeSliderAccessibility *)self accessibilityUserDefinedLabel];
  }
  else {
  v4 = accessibilityLocalizedString(@"volumeslider");
  }

  return v4;
}

- (void)accessibilityIncrement
{
  id v3 = [(MPVolumeSliderAccessibility *)self safeValueForKey:@"value"];
  [v3 floatValue];
  float v5 = v4;

  v10.receiver = self;
  v10.super_class = (Class)MPVolumeSliderAccessibility;
  [(MPVolumeSliderAccessibility *)&v10 accessibilityIncrement];
  v6 = [(MPVolumeSliderAccessibility *)self safeValueForKey:@"value"];
  [v6 floatValue];
  float v8 = v7;

  if (v5 != v8) {
    id v9 = (id)[(MPVolumeSliderAccessibility *)self safeValueForKey:@"_commitVolumeChange"];
  }
}

- (void)accessibilityDecrement
{
  id v3 = [(MPVolumeSliderAccessibility *)self safeValueForKey:@"value"];
  [v3 floatValue];
  float v5 = v4;

  v10.receiver = self;
  v10.super_class = (Class)MPVolumeSliderAccessibility;
  [(MPVolumeSliderAccessibility *)&v10 accessibilityDecrement];
  v6 = [(MPVolumeSliderAccessibility *)self safeValueForKey:@"value"];
  [v6 floatValue];
  float v8 = v7;

  if (v5 != v8) {
    id v9 = (id)[(MPVolumeSliderAccessibility *)self safeValueForKey:@"_commitVolumeChange"];
  }
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(MPVolumeSliderAccessibility *)self bounds];
  v12.double x = x;
  v12.double y = y;
  if (CGRectContainsPoint(v13, v12))
  {
    v10.receiver = self;
    v10.super_class = (Class)MPVolumeSliderAccessibility;
    float v8 = -[MPVolumeSliderAccessibility _accessibilityHitTest:withEvent:](&v10, sel__accessibilityHitTest_withEvent_, v7, x, y);
  }
  else
  {
    float v8 = 0;
  }

  return v8;
}

- (void)_layoutVolumeWarningView
{
  v22.receiver = self;
  v22.super_class = (Class)MPVolumeSliderAccessibility;
  [(MPVolumeSliderAccessibility *)&v22 _layoutVolumeWarningView];
  id v3 = [(MPVolumeSliderAccessibility *)self safeValueForKey:@"_volumeController"];
  float v4 = __UIAccessibilitySafeClass();

  uint64_t v5 = [v4 safeIntegerForKey:@"volumeWarningState"];
  [v4 safeFloatForKey:@"EUVolumeLimit"];
  float v7 = v6;
  [(MPVolumeSliderAccessibility *)self safeFloatForKey:@"value"];
  float v9 = v8;
  objc_super v10 = (void *)MEMORY[0x263F08A30];
  v11 = objc_msgSend(NSNumber, "numberWithFloat:");
  CGPoint v12 = [v10 localizedStringFromNumber:v11 numberStyle:3];

  if ([v4 safeBoolForKey:@"volumeWarningEnabled"])
  {
    if (v5 == 2)
    {
      if (v9 < v7) {
        goto LABEL_5;
      }
LABEL_10:
      UIAccessibilityNotifications v17 = *MEMORY[0x263F1CDC8];
      v18 = accessibilityLocalizedString(@"volume.eulimit.approach");
      UIAccessibilityPostNotification(v17, v18);

      v19 = accessibilityLocalizedString(@"volume.eulimit.approach");
      uint64_t v20 = [v12 stringByAppendingFormat:@", %@", v19];

      [(MPVolumeSliderAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"axDidAddEUWarning"];
      if (UIAccessibilityIsVoiceOverRunning())
      {
        v21 = [MEMORY[0x263F544E0] sharedAVSystemController];
        [v21 allowUserToExceedEUVolumeLimit];
      }
      CGPoint v12 = (void *)v20;
      goto LABEL_13;
    }
    if (v5 == 4)
    {
      if (v9 != v7)
      {
LABEL_5:
        [(MPVolumeSliderAccessibility *)self _accessibilityBoolValueForKey:@"axDidAddEUWarning"];
        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
  if ([(MPVolumeSliderAccessibility *)self _accessibilityBoolValueForKey:@"axDidAddEUWarning"]&& v5 == 3)
  {
    UIAccessibilityNotifications v13 = *MEMORY[0x263F1CDC8];
    v14 = accessibilityLocalizedString(@"volume.eulimit.warning");
    UIAccessibilityPostNotification(v13, v14);

    v15 = accessibilityLocalizedString(@"volume.eulimit.warning");
    uint64_t v16 = [v12 stringByAppendingFormat:@", %@", v15];

    [(MPVolumeSliderAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"axDidAddEUWarning"];
    CGPoint v12 = (void *)v16;
  }
LABEL_13:
  [(MPVolumeSliderAccessibility *)self setAccessibilityValue:v12];
}

@end