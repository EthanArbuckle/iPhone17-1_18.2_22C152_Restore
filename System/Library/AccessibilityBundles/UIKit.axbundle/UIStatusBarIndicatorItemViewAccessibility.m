@interface UIStatusBarIndicatorItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarIndicatorItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarIndicatorItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v30[2] = self;
  v30[1] = (id)a2;
  v30[0] = 0;
  id v29 = (id)[(UIStatusBarIndicatorItemViewAccessibility *)self safeValueForKey:@"item"];
  id location = (id)[v29 safeValueForKey:@"indicatorName"];
  if ([location isEqualToString:@"Alarm"])
  {
    id v2 = accessibilityLocalizedString(@"status.alarm.clock.icon");
    id v3 = v30[0];
    v30[0] = v2;
  }
  else if ([location isEqualToString:@"Plus"])
  {
    id v4 = accessibilityLocalizedString(@"status.nike.plus.icon");
    id v5 = v30[0];
    v30[0] = v4;
  }
  else if ([location isEqualToString:@"Play"])
  {
    id v6 = accessibilityLocalizedString(@"status.play.icon");
    id v7 = v30[0];
    v30[0] = v6;
  }
  else if ([location isEqualToString:@"CallForward"])
  {
    id v8 = accessibilityLocalizedString(@"status.call.forward.icon");
    id v9 = v30[0];
    v30[0] = v8;
  }
  else if ([location isEqualToString:@"VPN"])
  {
    id v10 = accessibilityLocalizedString(@"status.vpn.icon");
    id v11 = v30[0];
    v30[0] = v10;
  }
  else if ([location isEqualToString:@"TTY"])
  {
    if ([MEMORY[0x263F62B00] isRTTSupported]) {
      id v12 = accessibilityLocalizedString(@"status.rtt.tty.icon");
    }
    else {
      id v12 = accessibilityLocalizedString(@"status.tty.icon");
    }
    id v13 = v30[0];
    v30[0] = v12;
  }
  else if ([location isEqualToString:@"Location"])
  {
    id v14 = accessibilityLocalizedString(@"status.location.icon");
    id v15 = v30[0];
    v30[0] = v14;
  }
  else if ([location isEqualToString:@"RotationLock"])
  {
    id v16 = accessibilityLocalizedString(@"status.rotationlock.icon");
    id v17 = v30[0];
    v30[0] = v16;
  }
  else if ([location isEqualToString:@"AirPlay"])
  {
    id v18 = accessibilityLocalizedString(@"status.airplay.icon");
    id v19 = v30[0];
    v30[0] = v18;
  }
  else if ([location isEqualToString:@"BTHeadphones"])
  {
    id v20 = accessibilityLocalizedString(@"status.bluetoothheadphones");
    id v21 = v30[0];
    v30[0] = v20;
  }
  else if ([location isEqualToString:@"Siri"])
  {
    id v22 = accessibilityLocalizedString(@"status.siri");
    id v23 = v30[0];
    v30[0] = v22;
  }
  else if ([location isEqualToString:@"CarPlay"])
  {
    id v24 = accessibilityLocalizedString(@"status.carplay");
    id v25 = v30[0];
    v30[0] = v24;
  }
  id v27 = v30[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(v30, 0);

  return v27;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarIndicatorItemViewAccessibility;
  return [(UIStatusBarIndicatorItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end