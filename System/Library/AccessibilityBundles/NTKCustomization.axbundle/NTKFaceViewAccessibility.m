@interface NTKFaceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanStartTimeTravel;
- (BOOL)_accessibilityFKAShouldProcessChildren;
- (BOOL)_accessibilityTimeTravelEnabled;
- (BOOL)_axIsDoneAnnouncing;
- (BOOL)_axIsWaitingToAnnounce;
- (id)_accessibilityNotificationObserver;
- (id)_accessibilityScrubTimer;
- (id)_accessibilityTimeTravelDate;
- (id)detachedComplicationDisplayWrapperForSlot:(id)a3;
- (id)normalComplicationDisplayWrapperForSlot:(id)a3;
- (void)_accessibilityAnnounceScrub;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetNotificationObserver:(id)a3;
- (void)_accessibilitySetScrubTimer:(id)a3;
- (void)_accessibilitySetTimeTravelDate:(id)a3;
- (void)_accessibilityTimeAnnouncementDidFinish;
- (void)_axSetIsDoneAnnouncing:(BOOL)a3;
- (void)_axSetIsWaitingToAnnounce:(BOOL)a3;
- (void)_loadSnapshotContentViews;
- (void)dealloc;
- (void)endScrubbingAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)scrubToDate:(id)a3 animated:(BOOL)a4;
- (void)setTimeView:(id)a3;
- (void)startScrubbingAnimated:(BOOL)a3;
@end

@implementation NTKFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKFaceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKFaceView" hasInstanceVariable:@"_timeView" withType:"UIView<NTKTimeView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"setTimeView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"_loadSnapshotContentViews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"startScrubbingAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"endScrubbingAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"scrubToDate: animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"normalComplicationDisplayWrapperForSlot:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"detachedComplicationDisplayWrapperForSlot:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"_supportsTimeScrubbing", "B", 0);
  [v3 validateClass:@"NTKFaceView" hasInstanceVariable:@"_timeScrubbing" withType:"B"];
  [v3 validateClass:@"NTKFaceView" hasInstanceVariable:@"_editing" withType:"B"];
  [v3 validateClass:@"NTKTimeTravelSettings"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"NTKTimeTravelSettings", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKTimeTravelSettings", @"isTimeTravelEnabled", "B", 0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceViewAccessibility;
  [(NTKFaceViewAccessibility *)&v3 layoutSubviews];
  [(NTKFaceViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)NTKFaceViewAccessibility;
  [(NTKFaceViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(NTKFaceViewAccessibility *)self safeValueForKey:@"_timeView"];
  [v3 _setAccessibilityServesAsFirstElement:1];
}

- (BOOL)_accessibilityFKAShouldProcessChildren
{
  return [(NTKFaceViewAccessibility *)self safeBoolForKey:@"_editing"] ^ 1;
}

- (void)setTimeView:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKFaceViewAccessibility;
  [(NTKFaceViewAccessibility *)&v5 setTimeView:v4];
  if (v4) {
    [v4 _setAccessibilityServesAsFirstElement:1];
  }
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceViewAccessibility;
  [(NTKFaceViewAccessibility *)&v3 _loadSnapshotContentViews];
  [(NTKFaceViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)_axIsDoneAnnouncing
{
  return ___UIAccessibilityGetAssociatedBool(self, &__NTKFaceView___axIsDoneAnnouncing);
}

- (void)_axSetIsDoneAnnouncing:(BOOL)a3
{
}

- (BOOL)_axIsWaitingToAnnounce
{
  return ___UIAccessibilityGetAssociatedBool(self, &__NTKFaceView___axIsWaitingToAnnounce);
}

- (void)_axSetIsWaitingToAnnounce:(BOOL)a3
{
}

- (id)_accessibilityTimeTravelDate
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NTKFaceView___accessibilityTimeTravelDate);
}

- (void)_accessibilitySetTimeTravelDate:(id)a3
{
}

- (id)_accessibilityNotificationObserver
{
  return (id)___UIAccessibilityGetAssociatedNonRetainedObject(self, &__NTKFaceView___accessibilityNotificationObserver);
}

- (void)_accessibilitySetNotificationObserver:(id)a3
{
}

- (id)_accessibilityScrubTimer
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NSTimer___accessibilityScrubTimer);
}

- (void)_accessibilitySetScrubTimer:(id)a3
{
}

- (void)dealloc
{
  objc_super v3 = [(NTKFaceViewAccessibility *)self _accessibilityNotificationObserver];

  if (v3)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    objc_super v5 = [(NTKFaceViewAccessibility *)self _accessibilityNotificationObserver];
    [v4 removeObserver:v5];

    [(NTKFaceViewAccessibility *)self _accessibilitySetNotificationObserver:0];
    +[AXTimeTravelDateManager setTimeTravelDate:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)NTKFaceViewAccessibility;
  [(NTKFaceViewAccessibility *)&v6 dealloc];
}

- (void)startScrubbingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NTKFaceViewAccessibility *)self _accessibilityCanStartTimeTravel])
  {
    objc_super v6 = accessibilityLocalizedString(@"time.travel", v5);
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    _accessibilitySetTimeTravelIsActive(1);
  }
  v7.receiver = self;
  v7.super_class = (Class)NTKFaceViewAccessibility;
  [(NTKFaceViewAccessibility *)&v7 startScrubbingAnimated:v3];
}

- (void)endScrubbingAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceViewAccessibility;
  [(NTKFaceViewAccessibility *)&v3 endScrubbingAnimated:a3];
  _accessibilitySetTimeTravelIsActive(0);
  +[AXTimeTravelDateManager setTimeTravelDate:0];
}

- (void)scrubToDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NTKFaceViewAccessibility;
  id v6 = a3;
  [(NTKFaceViewAccessibility *)&v9 scrubToDate:v6 animated:v4];
  objc_super v7 = [(NTKFaceViewAccessibility *)self _accessibilityScrubTimer];
  [v7 invalidate];
  [(NTKFaceViewAccessibility *)self _accessibilitySetTimeTravelDate:v6];
  v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_accessibilityAnnounceScrub" selector:0 userInfo:0 repeats:0.3];

  [(NTKFaceViewAccessibility *)self _accessibilitySetScrubTimer:v8];
  +[AXTimeTravelDateManager setTimeTravelDate:v6];
}

- (id)normalComplicationDisplayWrapperForSlot:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceViewAccessibility;
  uint64_t v5 = [(NTKFaceViewAccessibility *)&v8 normalComplicationDisplayWrapperForSlot:v4];
  if (_AXSAutomationEnabled())
  {
    id v6 = +[NSString stringWithFormat:@"normal-complication-%@", v4];
    [v5 setAccessibilityIdentifier:v6];
  }

  return v5;
}

- (id)detachedComplicationDisplayWrapperForSlot:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceViewAccessibility;
  uint64_t v5 = [(NTKFaceViewAccessibility *)&v8 detachedComplicationDisplayWrapperForSlot:v4];
  if (_AXSAutomationEnabled())
  {
    id v6 = +[NSString stringWithFormat:@"detached-complication-%@", v4];
    [v5 setAccessibilityIdentifier:v6];
  }

  return v5;
}

- (void)_accessibilityAnnounceScrub
{
  objc_super v3 = [(NTKFaceViewAccessibility *)self _accessibilityTimeTravelDate];
  if (v3)
  {
    id v8 = v3;
    id v4 = AXDateStringForFormat();
    uint64_t v5 = +[AXAttributedString axAttributedStringWithString:v4];
    [v5 setAttribute:kCFBooleanTrue forKey:UIAccessibilityTokenClockTime];
    id v6 = [(NTKFaceViewAccessibility *)self _accessibilityCharacterVoiceName];
    if ([v6 length])
    {
      [v5 setAttribute:v6 forKey:UIAccessibilityTokenSpeakAsCharacter];
      [v5 setAttribute:v8 forKey:UIAccessibilityTokenCharacterTimeToSpeak];
      [v5 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenCharacterSuppressFlavorSpeech];
    }
    UIAccessibilitySpeak();
    objc_super v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"_accessibilityTimeAnnouncementDidFinish" name:UIAccessibilityAnnouncementDidFinishNotification object:0];

    [(NTKFaceViewAccessibility *)self _accessibilitySetTimeTravelDate:0];
    objc_super v3 = v8;
  }
}

- (void)_accessibilityTimeAnnouncementDidFinish
{
  UIAccessibilityNotifications v3 = UIAccessibilityLayoutChangedNotification;
  v6[0] = kAXPerformElementUpdateImmediatelyToken;
  v6[1] = kAXForceUpdateChangeToken;
  id v4 = +[NSArray arrayWithObjects:v6 count:2];
  UIAccessibilityPostNotification(v3, v4);

  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIAccessibilityAnnouncementDidFinishNotification object:0];
}

- (BOOL)_accessibilityTimeTravelEnabled
{
  unsigned int v2 = [(NTKFaceViewAccessibility *)self safeBoolForKey:@"_supportsTimeScrubbing"];
  if (v2)
  {
    UIAccessibilityNotifications v3 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
    unsigned __int8 v4 = [v3 safeBoolForKey:@"isTimeTravelEnabled"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)_accessibilityCanStartTimeTravel
{
  unsigned int v3 = [(NTKFaceViewAccessibility *)self _accessibilityTimeTravelEnabled];
  if (v3) {
    LOBYTE(v3) = [(NTKFaceViewAccessibility *)self safeBoolForKey:@"_timeScrubbing"] ^ 1;
  }
  return v3;
}

@end