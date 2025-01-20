@interface AVNowPlayingTransportBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsNotFirstElement;
- (BOOL)isAccessibilityElement;
- (id)_axStringForElapsedAndRemainingTime;
- (id)accessibilityLabel;
- (int64_t)_accessibilityReinterpretVoiceOverCommand:(int64_t)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateRemainingTimeText;
- (void)setHint:(int64_t)a3;
@end

@implementation AVNowPlayingTransportBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVNowPlayingTransportBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVNowPlayingTransportBar" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingTransportBar", @"createViews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingTransportBar", @"_updateRemainingTimeText", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingTransportBar", @"setHint:", "v", "q", 0);
  [v3 validateClass:@"AVNowPlayingTransportBar" hasInstanceVariable:@"_elapsedTimeLabel" withType:"AVAnimatingLabel"];
  [v3 validateClass:@"AVNowPlayingTransportBar" hasInstanceVariable:@"_startTimeLabel" withType:"UILabel"];
  [v3 validateClass:@"AVNowPlayingTransportBar" hasInstanceVariable:@"_remainingTimeLabel" withType:"AVAnimatingLabel"];
  [v3 validateClass:@"AVNowPlayingTransportBar" hasInstanceVariable:@"_clonedPlayer" withType:"AVPlayer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingTransportBar", @"frameSource", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  char v7 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  if (UIAccessibilityIsVoiceOverRunning() && ([v3 _accessibilityViewIsVisible] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AVNowPlayingTransportBarAccessibility;
    BOOL v4 = [(AVNowPlayingTransportBarAccessibility *)&v6 isAccessibilityElement];
  }

  return v4;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return [(AVNowPlayingTransportBarAccessibility *)self _accessibilityViewIsVisible] ^ 1;
}

- (int64_t)_accessibilityReinterpretVoiceOverCommand:(int64_t)a3
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(AVNowPlayingTransportBarAccessibility *)self safeValueForKey:@"_remainingTimeLabel"];
  int v3 = [v2 _accessibilityViewIsVisible];

  if (v3)
  {
    BOOL v4 = accessibilityLocalizedString(@"transport.bar.label");
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_updateRemainingTimeText
{
  v14.receiver = self;
  v14.super_class = (Class)AVNowPlayingTransportBarAccessibility;
  [(AVNowPlayingTransportBarAccessibility *)&v14 _updateRemainingTimeText];
  int v3 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v4 = [v3 voiceOverPreferredTVInteractionMode];

  if (v4 == 1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    objc_super v6 = [(AVNowPlayingTransportBarAccessibility *)self _accessibilityValueForKey:@"kAXLastPlayStateAnnouncementTime"];
    [v6 doubleValue];
    double v8 = v7;

    objc_opt_class();
    v9 = [(AVNowPlayingTransportBarAccessibility *)self safeValueForKey:@"_clonedPlayer"];
    v10 = __UIAccessibilityCastAsClass();

    if (Current - v8 > 3.0)
    {
      objc_msgSend(v10, "rate", Current - v8);
      if (fabsf(v11) > 1.0)
      {
        v12 = [(AVNowPlayingTransportBarAccessibility *)self _axStringForElapsedAndRemainingTime];
        UIAccessibilitySpeakIfNotSpeaking();

        v13 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
        [(AVNowPlayingTransportBarAccessibility *)self _accessibilitySetRetainedValue:v13 forKey:@"kAXLastPlayStateAnnouncementTime"];
      }
    }
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)AVNowPlayingTransportBarAccessibility;
  [(AVNowPlayingTransportBarAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  int v3 = [(AVNowPlayingTransportBarAccessibility *)self safeValueForKey:@"_elapsedTimeLabel"];
  [v3 setAccessibilityIdentifier:@"AXElapsedTime"];

  uint64_t v4 = [(AVNowPlayingTransportBarAccessibility *)self safeValueForKey:@"_startTimeLabel"];
  [v4 setAccessibilityIdentifier:@"AXStartTime"];

  v5 = [(AVNowPlayingTransportBarAccessibility *)self safeValueForKey:@"_currentClockTimeLabel"];
  [v5 setAccessibilityIdentifier:@"AXCurrentClock"];

  objc_super v6 = [(AVNowPlayingTransportBarAccessibility *)self safeValueForKey:@"_endingClockTimeLabel"];
  [v6 setAccessibilityIdentifier:@"AXEndingClock"];

  double v7 = [(AVNowPlayingTransportBarAccessibility *)self safeValueForKey:@"_remainingTimeLabel"];
  [v7 setAccessibilityIdentifier:@"AXRemainingTime"];
}

- (id)_axStringForElapsedAndRemainingTime
{
  int v3 = [(AVNowPlayingTransportBarAccessibility *)self safeBoolForKey:@"displaysClockTimes"];
  if (v3) {
    uint64_t v4 = @"_currentClockTimeLabel";
  }
  else {
    uint64_t v4 = @"_elapsedTimeLabel";
  }
  v5 = [(AVNowPlayingTransportBarAccessibility *)self safeUIViewForKey:v4];
  int v6 = [v5 _accessibilityViewIsVisible];
  double v7 = [v5 accessibilityLabel];
  if ([v7 length]) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    if (v3) {
      v10 = @"media.time.current";
    }
    else {
      v10 = @"media.time.elapsed";
    }
    float v11 = accessibilityLocalizedString(v10);
    v9 = objc_msgSend(NSString, "localizedStringWithFormat:", v11, v7);
  }
  if (v3) {
    v12 = @"_endingClockTimeLabel";
  }
  else {
    v12 = @"_remainingTimeLabel";
  }
  v13 = [(AVNowPlayingTransportBarAccessibility *)self safeUIViewForKey:v12];
  int v14 = [v13 _accessibilityViewIsVisible];
  v15 = [v13 accessibilityLabel];
  if ([v15 length]) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    v17 = 0;
  }
  else
  {
    if (v3) {
      v18 = @"media.time.ending";
    }
    else {
      v18 = @"media.time.remaining";
    }
    v19 = accessibilityLocalizedString(v18);
    v17 = objc_msgSend(NSString, "localizedStringWithFormat:", v19, v15);
  }
  v20 = __UIAXStringForVariables();

  return v20;
}

- (void)setHint:(int64_t)a3
{
  v5 = [(AVNowPlayingTransportBarAccessibility *)self safeValueForKey:@"_hint"];
  [v5 integerValue];

  v12.receiver = self;
  v12.super_class = (Class)AVNowPlayingTransportBarAccessibility;
  [(AVNowPlayingTransportBarAccessibility *)&v12 setHint:a3];
  switch(a3)
  {
    case 0:
    case 7:
      UIAccessibilityPostNotification(0xBD5u, 0);
      return;
    case 1:
      int v6 = @"tv.player.fastforwarding";
      goto LABEL_9;
    case 2:
      int v6 = @"tv.player.rewinding";
      goto LABEL_9;
    case 5:
      int v6 = @"next.track";
      goto LABEL_9;
    case 6:
      int v6 = @"previous.track";
LABEL_9:
      float v11 = accessibilityLocalizedString(v6);
      if (v11) {
        goto LABEL_10;
      }
      return;
    case 8:
      double v7 = NSString;
      BOOL v8 = accessibilityLocalizedString(@"tv.player.paused.with.remaining");
      v9 = [(AVNowPlayingTransportBarAccessibility *)self safeValueForKey:@"remainingTimeLabel"];
      v10 = [v9 accessibilityLabel];
      float v11 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v10);

      if (!v11) {
        return;
      }
LABEL_10:
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v11);

      break;
    default:
      return;
  }
}

@end