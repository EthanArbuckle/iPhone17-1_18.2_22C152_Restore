@interface UIStatusBarSignalStrengthItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UIStatusBarSignalStrengthItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarSignalStrengthItemView";
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
  v21 = self;
  v20[1] = (id)a2;
  v20[0] = 0;
  id v18 = (id)[(UIStatusBarSignalStrengthItemViewAccessibility *)self safeValueForKey:@"_showRSSI"];
  char v19 = [v18 BOOLValue];

  if (v19)
  {
    id v14 = (id)[(UIStatusBarSignalStrengthItemViewAccessibility *)v21 safeValueForKey:@"_signalStrengthRaw"];
    [v14 intValue];

    v15 = NSString;
    id v17 = accessibilityLocalizedString(@"status.signal.rssi");
    id v16 = (id)AXFormatInteger();
    id v2 = (id)objc_msgSend(v15, "stringWithFormat:", v17, v16);
    id v3 = v20[0];
    v20[0] = v2;
  }
  else
  {
    id v12 = (id)[(UIStatusBarSignalStrengthItemViewAccessibility *)v21 safeValueForKey:@"_signalStrengthBars"];
    unsigned int v13 = [v12 intValue];

    if (v13)
    {
      v10 = NSString;
      id v11 = accessibilityLocalizedString(@"status.signal.bars");
      id v6 = (id)objc_msgSend(v10, "localizedStringWithFormat:", v13, 4);
      id v7 = v20[0];
      v20[0] = v6;
    }
    else
    {
      id v4 = accessibilityLocalizedString(@"status.signal.no.signal");
      id v5 = v20[0];
      v20[0] = v4;
    }
  }
  id v9 = v20[0];
  objc_storeStrong(v20, 0);

  return v9;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarSignalStrengthItemViewAccessibility;
  return [(UIStatusBarSignalStrengthItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v5 = (id)-[UIStatusBarSignalStrengthItemViewAccessibility safeValueForKey:](v14, "safeValueForKey:");
  char v6 = [v5 BOOLValue];

  char v11 = v6 & 1;
  v10.receiver = v14;
  v10.super_class = (Class)UIStatusBarSignalStrengthItemViewAccessibility;
  [(UIStatusBarSignalStrengthItemViewAccessibility *)&v10 touchesEnded:location[0] withEvent:v12];
  int v7 = v11 & 1;
  id v8 = (id)[(UIStatusBarSignalStrengthItemViewAccessibility *)v14 safeValueForKey:@"_showRSSI"];
  BOOL v9 = v7 == ([v8 BOOLValue] & 1);

  if (!v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

@end