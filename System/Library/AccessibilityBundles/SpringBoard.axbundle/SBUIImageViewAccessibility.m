@interface SBUIImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SBUIImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)SBUIImageViewAccessibility;
  unint64_t v3 = [(SBUIImageViewAccessibility *)&v6 accessibilityTraits];
  v4 = [(SBUIImageViewAccessibility *)self accessibilityIdentification];
  if ([v4 isEqualToString:@"LockIcon"]
    || [v4 isEqualToString:@"AlarmClock"]
    || [v4 isEqualToString:@"TTY"]
    || [v4 isEqualToString:@"Play"]
    || [v4 isEqualToString:@"Plus"])
  {
    v3 |= *MEMORY[0x263F813F0];
  }

  return v3;
}

- (BOOL)accessibilityActivate
{
  unint64_t v3 = [(SBUIImageViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"NotificationRoller"];

  if (v4)
  {
    [(id)*MEMORY[0x263F1D020] accessibilityPerformAction:5000 withValue:*MEMORY[0x263EFFB38] fencePort:0];
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBUIImageViewAccessibility;
    return [(SBUIImageViewAccessibility *)&v6 accessibilityActivate];
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  unint64_t v3 = [(SBUIImageViewAccessibility *)self accessibilityIdentifier];
  if (([v3 isEqualToString:@"NotificationRoller"] & 1) != 0
    || ([v3 isEqualToString:@"CameraGrabber"] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBUIImageViewAccessibility;
    BOOL v4 = [(SBUIImageViewAccessibility *)&v6 _accessibilitySupportsActivateAction];
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  if (!isAccessibilityElement_validAXIDSet)
  {
    uint64_t v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA08]), "initWithObjects:", @"LockIcon", @"wallpaperView", @"AlarmClock", @"TTY", @"Play", @"Plus", 0);
    BOOL v4 = (void *)isAccessibilityElement_validAXIDSet;
    isAccessibilityElement_validAXIDSet = v3;
  }
  v5 = [(SBUIImageViewAccessibility *)self accessibilityIdentification];
  char v6 = [(id)isAccessibilityElement_validAXIDSet containsObject:v5];
  v7 = [(SBUIImageViewAccessibility *)self safeValueForKey:@"tag"];
  uint64_t v8 = [v7 integerValue];

  BOOL v9 = 1;
  if (v8 != 1337 && (v6 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBUIImageViewAccessibility;
    BOOL v9 = [(SBUIImageViewAccessibility *)&v11 isAccessibilityElement];
  }

  return v9;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(SBUIImageViewAccessibility *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"LockIcon"])
  {
    BOOL v4 = @"lock.icon.text";
LABEL_13:
    uint64_t v5 = accessibilityLocalizedString(v4);
    goto LABEL_14;
  }
  if ([v3 isEqualToString:@"wallpaperView"])
  {
    BOOL v4 = @"wallpaper.text";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"AlarmClock"])
  {
    BOOL v4 = @"statusbar.alarmclock.icon";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"TTY"])
  {
    BOOL v4 = @"statusbar.tty.icon";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"Play"])
  {
    BOOL v4 = @"statusbar.play.icon";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"Plus"])
  {
    BOOL v4 = @"statusbar.plus.icon";
    goto LABEL_13;
  }
  v8.receiver = self;
  v8.super_class = (Class)SBUIImageViewAccessibility;
  uint64_t v5 = [(SBUIImageViewAccessibility *)&v8 accessibilityLabel];
LABEL_14:
  char v6 = (void *)v5;

  return v6;
}

@end