@interface PHSOSNotifyCountdownViewModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_axAnnouncementString;
@end

@implementation PHSOSNotifyCountdownViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHSOSNotifyCountdownViewModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axAnnouncementString
{
  uint64_t v2 = [(PHSOSNotifyCountdownViewModelAccessibility *)self safeUnsignedIntegerForKey:@"countdown"];
  v3 = NSString;
  v4 = accessibilityLocalizedString(@"sos.notify.countdown.announcement");
  v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);

  return v5;
}

@end