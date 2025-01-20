@interface CKAudioBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CKAudioBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAudioBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsSafeCategory();
  v3 = [v2 _axMessageSender];
  v4 = accessibilityLocalizedString(@"audio.message.label");
  v5 = [v2 _axStickerDescription];
  v6 = [v2 _axAcknowledgmentDescription];
  v9 = [v2 _axMessageTime];
  v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8];
}

- (id)accessibilityValue
{
  v2 = [(CKAudioBalloonViewAccessibility *)self safeValueForKey:@"duration"];
  [v2 doubleValue];
  v3 = AXDurationStringForDuration();

  return v3;
}

@end