@interface CCUIConnectivityButtonViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
- (id)_accessibilityControlCenterGenericOnOff;
@end

@implementation CCUIConnectivityButtonViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIConnectivityButtonViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIConnectivityButtonViewController" isKindOfClass:@"CCUILabeledRoundButtonViewController"];
  [v3 validateClass:@"CCUIConnectivityCellularDataViewController" isKindOfClass:@"CCUIConnectivityButtonViewController"];
  [v3 validateClass:@"CCUIConnectivityHotspotViewController" isKindOfClass:@"CCUIConnectivityButtonViewController"];
  [v3 validateClass:@"CCUIConnectivityAirplaneViewController" isKindOfClass:@"CCUIConnectivityButtonViewController"];
  [v3 validateClass:@"CCUIConnectivityAirplaneViewController" hasProperty:@"title" withType:"@"];
}

- (id)_accessibilityControlCenterButtonLabel
{
  id v3 = [(CCUIConnectivityButtonViewControllerAccessibility *)self safeStringForKey:@"title"];
  v4 = [(CCUIConnectivityButtonViewControllerAccessibility *)self safeStringForKey:@"subtitle"];
  if (MEMORY[0x245648230](@"CCUIConnectivityButtonViewController"))
  {
    v5 = [(CCUIConnectivityButtonViewControllerAccessibility *)self _accessibilityControlCenterGenericOnOff];
    v6 = [v5 objectForKey:@"on"];
    if ([v4 isEqualToString:v6])
    {
    }
    else
    {
      v7 = [v5 objectForKey:@"off"];
      int v8 = [v4 isEqualToString:v7];

      if (!v8)
      {
LABEL_6:

        goto LABEL_7;
      }
    }

    v4 = 0;
    goto LABEL_6;
  }
LABEL_7:
  v9 = __UIAXStringForVariables();

  return v9;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  if (objc_opt_isKindOfClass()) {
    return @"cellular-data-button";
  }
  MEMORY[0x245648230](@"CCUIConnectivityAirplaneViewController");
  if (objc_opt_isKindOfClass()) {
    return @"airplane-mode-button";
  }
  MEMORY[0x245648230](@"CCUIConnectivityHotspotViewController");
  if (objc_opt_isKindOfClass()) {
    return @"hotspot-button";
  }
  else {
    return 0;
  }
}

- (id)_accessibilityControlCenterGenericOnOff
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x245648230](@"CCUIConnectivityButtonViewController", a2);
  v4 = [(CCUIConnectivityButtonViewControllerAccessibility *)self _accessibilityControlCenterButtonIdentifier];
  if ([v4 isEqualToString:@"cellular-data-button"])
  {
    v5 = @"CONTROL_CENTER_STATUS_CELLULAR_DATA_ON";
    v6 = @"CONTROL_CENTER_STATUS_CELLULAR_DATA_OFF";
LABEL_13:
    v7 = [MEMORY[0x263F086E0] bundleForClass:v3];
    int v8 = [v7 localizedStringForKey:v5 value:&stru_26F673348 table:0];
    v9 = [v7 localizedStringForKey:v6 value:&stru_26F673348 table:0];
    v12[0] = @"on";
    v12[1] = @"off";
    v13[0] = v8;
    v13[1] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"airplane-mode-button"])
  {
    v5 = @"CONTROL_CENTER_STATUS_AIRPLANE_MODE_ON";
    v6 = @"CONTROL_CENTER_STATUS_AIRPLANE_MODE_OFF";
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"com.apple.ControlCenter.WiFi"])
  {
    v5 = @"CONTROL_CENTER_STATUS_WIFI_ON";
    v6 = @"CONTROL_CENTER_STATUS_WIFI_OFF";
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"com.apple.ControlCenter.Bluetooth"])
  {
    v5 = @"CONTROL_CENTER_STATUS_BLUETOOTH_ON";
    v6 = @"CONTROL_CENTER_STATUS_BLUETOOTH_OFF";
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"hotspot-button"])
  {
    v5 = @"CONTROL_CENTER_STATUS_HOTSPOT_ON";
    v6 = @"CONTROL_CENTER_STATUS_HOTSPOT_OFF";
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"com.apple.ControlCenter.VPN"])
  {
    v5 = @"CONTROL_CENTER_STATUS_VPN_ON";
    v6 = @"CONTROL_CENTER_STATUS_VPN_OFF";
    goto LABEL_13;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

@end