@interface HPSBatteryStatusViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- ($FFD8FFF7A5D2C2666551BEB14716E99F)_accessibilityBatteryStatus;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setupViews;
@end

@implementation HPSBatteryStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HPSBatteryStatusView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HPSBatteryStatusView" hasInstanceVariable:@"untethered" withType:"B"];
  [v3 validateClass:@"HPSBatteryStatusView" hasInstanceVariable:@"leftImageView" withType:"UIImageView"];
  [v3 validateClass:@"HPSBatteryStatusView" hasInstanceVariable:@"rightImageView" withType:"UIImageView"];
  [v3 validateClass:@"HPSBatteryStatusView" hasInstanceVariable:@"caseImageView" withType:"UIImageView"];
  [v3 validateClass:@"HPSBatteryStatusView" hasInstanceVariable:@"deviceImageView" withType:"UIImageView"];
  [v3 validateClass:@"HPSBatteryStatusView" hasInstanceVariable:@"currentDevice" withType:"<BluetoothDeviceProtocol>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BTSDevice", @"classicDevice", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HPSBatteryStatusView", @"setupViews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BTSDevice", @"name", "@", 0);
}

- ($FFD8FFF7A5D2C2666551BEB14716E99F)_accessibilityBatteryStatus
{
  *(void *)&retstr->var8 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  v4 = [(HPSBatteryStatusViewAccessibility *)self safeValueForKey:@"currentDevice"];
  v5 = [v4 safeValueForKey:@"classicDevice"];
  v6 = __UIAccessibilityCastAsProtocol();

  [v6 batteryStatus:retstr];
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v33[3] = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)HPSBatteryStatusViewAccessibility;
  [(HPSBatteryStatusViewAccessibility *)&v31 _accessibilityLoadAccessibilityInformation];
  if ([(HPSBatteryStatusViewAccessibility *)self safeBoolForKey:@"untethered"])
  {
    objc_initWeak(&location, self);
    id v3 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    v4 = accessibilityLocalizedString(@"Left Earbud");
    [v3 setAccessibilityLabel:v4];

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v28[3] = &unk_265124148;
    objc_copyWeak(&v29, &location);
    [v3 _setAccessibilityValueBlock:v28];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v26[3] = &unk_265124198;
    objc_copyWeak(&v27, &location);
    [v3 _setAccessibilityFrameBlock:v26];
    v5 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    v6 = accessibilityLocalizedString(@"Right Earbud");
    [v5 setAccessibilityLabel:v6];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
    v24[3] = &unk_265124148;
    objc_copyWeak(&v25, &location);
    [v5 _setAccessibilityValueBlock:v24];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v22[3] = &unk_265124198;
    objc_copyWeak(&v23, &location);
    [v5 _setAccessibilityFrameBlock:v22];
    v7 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    v8 = accessibilityLocalizedString(@"Case");
    [v7 setAccessibilityLabel:v8];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
    v20[3] = &unk_265124148;
    objc_copyWeak(&v21, &location);
    [v7 _setAccessibilityValueBlock:v20];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
    v18[3] = &unk_265124198;
    objc_copyWeak(&v19, &location);
    [v7 _setAccessibilityFrameBlock:v18];
    v33[0] = v3;
    v33[1] = v5;
    v33[2] = v7;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];
    [(HPSBatteryStatusViewAccessibility *)self setAccessibilityElements:v9];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_initWeak(&location, self);
    v10 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    v11 = [(HPSBatteryStatusViewAccessibility *)self safeValueForKey:@"currentDevice"];
    v12 = [v11 safeValueForKey:@"name"];
    [v10 setAccessibilityLabel:v12];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
    v16[3] = &unk_265124148;
    objc_copyWeak(&v17, &location);
    [v10 _setAccessibilityValueBlock:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
    v14[3] = &unk_265124198;
    objc_copyWeak(&v15, &location);
    [v10 _setAccessibilityFrameBlock:v14];
    v32 = v10;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    [(HPSBatteryStatusViewAccessibility *)self setAccessibilityElements:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
}

id __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_accessibilityBatteryStatus", (unsigned __int128)0, (unsigned __int128)0, 0);
  }

  id v3 = AXFormatFloatWithPercentage();

  return v3;
}

double __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeUIViewForKey:@"leftImageView"];
  [v2 accessibilityFrame];
  double v4 = v3;

  return v4;
}

id __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_accessibilityBatteryStatus", (unsigned __int128)0, (unsigned __int128)0, 0);
  }

  double v3 = AXFormatFloatWithPercentage();

  return v3;
}

double __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeUIViewForKey:@"rightImageView"];
  [v2 accessibilityFrame];
  double v4 = v3;

  return v4;
}

id __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  long long v5 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_accessibilityBatteryStatus", (unsigned __int128)0, 0);
  }
  else {
    long long v5 = 0u;
  }

  if (BYTE8(v5))
  {
    double v3 = AXFormatFloatWithPercentage();
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

double __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeUIViewForKey:@"caseImageView"];
  [v2 accessibilityFrame];
  double v4 = v3;

  return v4;
}

id __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_accessibilityBatteryStatus", (unsigned __int128)0, (unsigned __int128)0, 0);
  }

  double v3 = AXFormatFloatWithPercentage();

  return v3;
}

double __79__HPSBatteryStatusViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeUIViewForKey:@"deviceImageView"];
  [v2 accessibilityFrame];
  double v4 = v3;

  return v4;
}

- (void)setupViews
{
  v3.receiver = self;
  v3.super_class = (Class)HPSBatteryStatusViewAccessibility;
  [(HPSBatteryStatusViewAccessibility *)&v3 setupViews];
  [(HPSBatteryStatusViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end