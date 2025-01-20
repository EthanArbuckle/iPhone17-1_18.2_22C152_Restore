@interface PHSOSDialCountdownViewModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axAnnouncementString;
- (unint64_t)countdown;
@end

@implementation PHSOSDialCountdownViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHSOSDialCountdownViewModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)countdown
{
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || UIAccessibilityIsAssistiveTouchRunning()
    || (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    return 10;
  }
  v4.receiver = self;
  v4.super_class = (Class)PHSOSDialCountdownViewModelAccessibility;
  return [(PHSOSDialCountdownViewModelAccessibility *)&v4 countdown];
}

- (id)_axAnnouncementString
{
  uint64_t v2 = [(PHSOSDialCountdownViewModelAccessibility *)self safeUnsignedIntegerForKey:@"countdown"];
  v3 = NSString;
  objc_super v4 = accessibilityLocalizedString(@"sos.dial.countdown.announcement");
  v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);

  v8 = accessibilityLocalizedString(@"sos.hint");
  v6 = __AXStringForVariables();

  return v6;
}

@end