@interface CKMessageEntryRecordedAudioViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (CKMessageEntryRecordedAudioViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityApplyPlayPauseDeleteButtonLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateProgress;
@end

@implementation CKMessageEntryRecordedAudioViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageEntryRecordedAudioView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKActionMenuWindow"];
  [v3 validateClass:@"CKMessageEntryRecordedAudioView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CKActionMenuWindow", @"sharedInstance", "@", 0);
  [v3 validateClass:@"CKAudioMediaObject" isKindOfClass:@"CKAVMediaObject"];
  [v3 validateClass:@"CKMessageEntryRecordedAudioView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryRecordedAudioView", @"audioMediaObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAVMediaObject", @"duration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryRecordedAudioView", @"waveformImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryRecordedAudioView", @"updateProgress", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryRecordedAudioView", @"isPlaying", "B", 0);
}

- (void)_accessibilityApplyPlayPauseDeleteButtonLabel
{
  id v3 = [(CKMessageEntryRecordedAudioViewAccessibility *)self safeUIViewForKey:@"playPauseDeleteButton"];
  v2 = accessibilityLocalizedString(@"audio.message.delete.button");
  [v3 setAccessibilityLabel:v2];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryRecordedAudioViewAccessibility;
  [(CKMessageEntryRecordedAudioViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CKMessageEntryRecordedAudioViewAccessibility *)self _accessibilityApplyPlayPauseDeleteButtonLabel];
}

- (CKMessageEntryRecordedAudioViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryRecordedAudioViewAccessibility;
  objc_super v3 = -[CKMessageEntryRecordedAudioViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CKMessageEntryRecordedAudioViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (BOOL)accessibilityViewIsModal
{
  objc_opt_class();
  v2 = [NSClassFromString(&cfstr_Ckactionmenuwi.isa) sharedInstance];
  objc_super v3 = __UIAccessibilityCastAsClass();

  LODWORD(v2) = [v3 isHidden] ^ 1;
  return (char)v2;
}

- (void)updateProgress
{
  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryRecordedAudioViewAccessibility;
  [(CKMessageEntryRecordedAudioViewAccessibility *)&v11 updateProgress];
  objc_super v3 = [(CKMessageEntryRecordedAudioViewAccessibility *)self safeValueForKey:@"timeLabel"];
  [v3 setIsAccessibilityElement:0];

  objc_opt_class();
  v4 = [(CKMessageEntryRecordedAudioViewAccessibility *)self safeValueForKey:@"waveformImageView"];
  objc_super v5 = __UIAccessibilityCastAsClass();

  [v5 setIsAccessibilityElement:1];
  uint64_t v6 = [v5 accessibilityTraits];
  [v5 setAccessibilityTraits:v6 & ~*MEMORY[0x263F1CF00]];
  v7 = accessibilityLocalizedString(@"audio.duration.label");
  [v5 setAccessibilityLabel:v7];

  v8 = [(CKMessageEntryRecordedAudioViewAccessibility *)self safeValueForKey:@"audioMediaObject"];
  v9 = [v8 safeValueForKey:@"duration"];
  [v9 doubleValue];
  v10 = AXDurationStringForDuration();
  [v5 setAccessibilityValue:v10];

  [v5 setAccessibilityRespondsToUserInteraction:0];
}

@end