@interface CKNanoAudioBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CKNanoAudioBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNanoAudioBalloonView";
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
  v5 = [v2 _axReplyDescription];
  v6 = [v2 _axStickerDescription];
  v7 = [v2 _axAcknowledgmentDescription];
  v10 = [v2 _axMessageTime];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8];
}

- (id)accessibilityValue
{
  v2 = [(CKNanoAudioBalloonViewAccessibility *)self safeValueForKey:@"duration"];
  [v2 doubleValue];
  v3 = AXDurationStringForDuration();

  return v3;
}

@end