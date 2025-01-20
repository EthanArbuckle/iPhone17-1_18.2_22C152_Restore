@interface UIStatusBarDataNetworkItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (BOOL)isWLAN;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UIStatusBarDataNetworkItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarDataNetworkItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)[objc_alloc(MEMORY[0x263F21660]) initWithString:@"SSID"];
  [v4[0] setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21848]];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (id)accessibilityLabel
{
  v48 = self;
  v47[1] = (id)a2;
  v47[0] = 0;
  id v40 = (id)[(UIStatusBarDataNetworkItemViewAccessibility *)self safeValueForKey:@"_showRSSI"];
  char v41 = [v40 BOOLValue];

  if (v41)
  {
    id v35 = (id)[(UIStatusBarDataNetworkItemViewAccessibility *)v48 safeValueForKey:@"_wifiStrengthRaw"];
    int v36 = [v35 intValue];

    int v46 = v36;
    v37 = NSString;
    if ([(UIStatusBarDataNetworkItemViewAccessibility *)v48 isWLAN]) {
      v2 = @"status.network.wlan.rssi.strength";
    }
    else {
      v2 = @"status.network.wifi.rssi.strength";
    }
    id v39 = accessibilityLocalizedString(v2);
    id v38 = (id)AXFormatInteger();
    id v3 = (id)objc_msgSend(v37, "stringWithFormat:", v39, v38);
    id v4 = v47[0];
    v47[0] = v3;
  }
  else
  {
    id v33 = (id)[(UIStatusBarDataNetworkItemViewAccessibility *)v48 safeValueForKey:@"_dataNetworkType"];
    unsigned int v34 = [v33 intValue];

    unsigned int v45 = v34;
    if (v34)
    {
      uint64_t v6 = v34;
      char v5 = 1;
    }
    else
    {
      uint64_t v6 = 0;
      char v5 = 0;
    }
    if (v5)
    {
      _AXAssert();
    }
    else
    {
      switch(v6)
      {
        case 0:
          id v13 = accessibilityLocalizedString(@"status.network.gprs");
          id v14 = v47[0];
          v47[0] = v13;

          break;
        case 1:
          id v11 = accessibilityLocalizedString(@"status.network.edge");
          id v12 = v47[0];
          v47[0] = v11;

          break;
        case 2:
          id v15 = accessibilityLocalizedString(@"status.network.umts");
          id v16 = v47[0];
          v47[0] = v15;

          break;
        case 3:
          id v19 = accessibilityLocalizedString(@"status.network.4g");
          id v20 = v47[0];
          v47[0] = v19;

          break;
        case 4:
          id v21 = accessibilityLocalizedString(@"status.network.lte");
          id v22 = v47[0];
          v47[0] = v21;

          break;
        case 5:
          char v44 = [(UIStatusBarDataNetworkItemViewAccessibility *)v48 isWLAN];
          id v31 = (id)[(UIStatusBarDataNetworkItemViewAccessibility *)v48 safeValueForKey:@"_wifiStrengthBars"];
          unsigned int v32 = [v31 intValue];

          unsigned int v43 = v32;
          if (v32)
          {
            id location = 0;
            if (v44) {
              objc_storeStrong(&location, @"status.network.wlan.signal.bars");
            }
            else {
              objc_storeStrong(&location, @"status.network.wifi.signal.bars");
            }
            v29 = NSString;
            id v30 = accessibilityLocalizedString(location);
            id v9 = (id)objc_msgSend(v29, "localizedStringWithFormat:", v43, 3);
            id v10 = v47[0];
            v47[0] = v9;

            objc_storeStrong(&location, 0);
          }
          else
          {
            if (v44) {
              id v7 = accessibilityLocalizedString(@"status.network.wlan.no.signal");
            }
            else {
              id v7 = accessibilityLocalizedString(@"status.network.wifi.no.signal");
            }
            id v8 = v47[0];
            v47[0] = v7;
          }
          break;
        case 6:
          id v17 = accessibilityLocalizedString(@"status.network.ios.hotspot");
          id v18 = v47[0];
          v47[0] = v17;

          break;
        case 7:
          id v23 = accessibilityLocalizedString(@"status.network.1x");
          id v24 = v47[0];
          v47[0] = v23;

          break;
        case 8:
          id v25 = accessibilityLocalizedString(@"status.network.5ge");
          id v26 = v47[0];
          v47[0] = v25;

          break;
        default:
          JUMPOUT(0);
      }
    }
  }
  id v28 = v47[0];
  objc_storeStrong(v47, 0);

  return v28;
}

- (unint64_t)accessibilityTraits
{
  char v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarDataNetworkItemViewAccessibility;
  return [(UIStatusBarDataNetworkItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v5 = (id)-[UIStatusBarDataNetworkItemViewAccessibility safeValueForKey:](v14, "safeValueForKey:");
  char v6 = [v5 BOOLValue];

  char v11 = v6 & 1;
  v10.receiver = v14;
  v10.super_class = (Class)UIStatusBarDataNetworkItemViewAccessibility;
  [(UIStatusBarDataNetworkItemViewAccessibility *)&v10 touchesEnded:location[0] withEvent:v12];
  int v7 = v11 & 1;
  id v8 = (id)[(UIStatusBarDataNetworkItemViewAccessibility *)v14 safeValueForKey:@"_showRSSI"];
  BOOL v9 = v7 == ([v8 BOOLValue] & 1);

  if (!v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isWLAN
{
  objc_super v10 = self;
  SEL v9 = a2;
  *(void *)&v8[1] = (id)[(UIStatusBarDataNetworkItemViewAccessibility *)self _accessibilityValueForKey:@"axIsWLAN"];
  if (!*(void *)&v8[1])
  {
    int v7 = NSNumber;
    *(void *)id v8 = MGGetBoolAnswer() & 1;
    id v2 = (id)[v7 numberWithBool:*(void *)v8];
    objc_super v3 = *(void **)&v8[1];
    *(void *)&v8[1] = v2;

    [(UIStatusBarDataNetworkItemViewAccessibility *)v10 _accessibilitySetRetainedValue:*(void *)&v8[1] forKey:@"axIsWLAN"];
  }
  char v6 = objc_msgSend(*(id *)&v8[1], "BOOLValue", &v8[1]);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

@end