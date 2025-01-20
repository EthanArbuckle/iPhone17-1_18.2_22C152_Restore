@interface MTUITimerCountdownViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MTUITimerCountdownViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTUITimerCountdownView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)MTUITimerCountdownViewAccessibility;
  v2 = [(MTUITimerCountdownViewAccessibility *)&v7 accessibilityLabel];
  v3 = NSString;
  v4 = accessibilityLocalizedString(@"timer.countdown.text");
  v5 = objc_msgSend(v3, "stringWithFormat:", v4, v2);

  return v5;
}

@end