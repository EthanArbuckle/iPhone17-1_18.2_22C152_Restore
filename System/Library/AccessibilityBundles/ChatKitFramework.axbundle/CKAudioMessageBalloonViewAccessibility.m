@interface CKAudioMessageBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CKAudioMessageBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.CKAudioMessageBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ChatKit.CKAudioMessageBalloonView" hasSwiftField:@"$__lazy_storage_$_timeLabel" withSwiftType:"Optional<UILabel>"];
  [v3 validateClass:@"ChatKit.CKAudioMessageBalloonView" hasSwiftField:@"$__lazy_storage_$_transcriptionLabel" withSwiftType:"Optional<CKTranscriptionView>"];
  [v3 validateClass:@"ChatKit.CKTranscriptionView" hasSwiftField:@"text" withSwiftType:"Optional<String>"];
  [v3 validateClass:@"ChatKit.CKTranscriptionView" hasSwiftField:@"expansionButton" withSwiftType:"UIButton"];
  [v3 validateClass:@"ChatKit.CKAudioMessageBalloonView" isKindOfClass:@"CKBalloonView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonView", @"delegate", "@", 0);
  [v3 validateProtocol:@"CKBalloonViewDelegate" hasRequiredInstanceMethod:@"balloonViewTapped:withModifierFlags:selectedText:"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsSafeCategory();
  id v3 = [v2 _axMessageSender];
  v4 = accessibilityLocalizedString(@"audio.message.label");
  v5 = [v2 _axReplyDescription];
  v6 = [v2 _axStickerDescription];
  v7 = [v2 _axAcknowledgmentDescription];
  v10 = [v2 _axMessageTime];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)accessibilityValue
{
  id v3 = [(CKAudioMessageBalloonViewAccessibility *)self safeSwiftValueForKey:@"$__lazy_storage_$_timeLabel"];
  v4 = [v3 accessibilityLabel];

  AXDurationForDurationString();
  v5 = AXDurationStringForDuration();
  v6 = [(CKAudioMessageBalloonViewAccessibility *)self safeSwiftValueForKey:@"$__lazy_storage_$_transcriptionLabel"];
  v7 = [v6 safeSwiftStringForKey:@"text"];
  if ([v7 length])
  {
    v8 = __UIAXStringForVariables();
  }
  else
  {
    v10 = accessibilityLocalizedString(@"no.transcript");
    v8 = __UIAXStringForVariables();
  }

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(CKAudioMessageBalloonViewAccessibility *)self safeSwiftValueForKey:@"$__lazy_storage_$_transcriptionLabel"];
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [v2 safeSwiftValueForKey:@"expansionButton"];
  v5 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

@end