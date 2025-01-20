@interface MPAVRoutingTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsUsingSmartAudioCheckmarkStyle;
- (BOOL)_axIsVolumeSliderVisible;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityDescriptionForRoute:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityMediaRoute;
- (id)accessibilityValue;
- (void)setAccessibilityMediaRoute:(id)a3;
- (void)updateForEndpoint:(id)a3 routeItem:(id)a4 inferLocalizedModelName:(BOOL)a5;
@end

@implementation MPAVRoutingTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPAVRoutingTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityMediaRoute
{
}

- (void)setAccessibilityMediaRoute:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MPAVRoutingTableViewCell" hasInstanceVariable:@"_subtitleTextLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVRoutingTableViewCell", @"_shouldShowSeparateBatteryPercentagesForBatteryLevel:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVRoute", @"batteryLevel", "@", 0);
  [v3 validateClass:@"MPAVRoutingTableViewCell" hasInstanceVariable:@"_routeNameLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVRoutingTableViewCell", @"updateForEndpoint:routeItem:inferLocalizedModelName:", "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVRoutingTableViewCell", @"useSmartAudioCheckmarkStyle", "B", 0);
  [v3 validateClass:@"MPAVRoutingTableViewCell" hasInstanceVariable:@"_volumeSlider" withType:"MPVolumeSlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVRoutingViewItem", @"mainRoute", "@", 0);
}

- (BOOL)_axIsUsingSmartAudioCheckmarkStyle
{
  return [(MPAVRoutingTableViewCellAccessibility *)self safeBoolForKey:@"useSmartAudioCheckmarkStyle"];
}

- (BOOL)_axIsVolumeSliderVisible
{
  v2 = [(MPAVRoutingTableViewCellAccessibility *)self safeUIViewForKey:@"_volumeSlider"];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 isHidden] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  if (-[MPAVRoutingTableViewCellAccessibility _axIsUsingSmartAudioCheckmarkStyle](self, "_axIsUsingSmartAudioCheckmarkStyle")&& (v14 = 0, objc_opt_class(), __UIAccessibilityCastAsClass(), id v3 = objc_claimAutoreleasedReturnValue(), [v3 accessoryView], v4 = objc_claimAutoreleasedReturnValue(), v3, v4))
  {
    [v4 accessibilityActivationPoint];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MPAVRoutingTableViewCellAccessibility;
    [(MPAVRoutingTableViewCellAccessibility *)&v13 accessibilityActivationPoint];
    double v6 = v9;
    double v8 = v10;
  }
  double v11 = v6;
  double v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(MPAVRoutingTableViewCellAccessibility *)self accessibilityMediaRoute];
  int v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    double v5 = [(MPAVRoutingTableViewCellAccessibility *)self _accessibilityDescriptionForRoute:v4];
  }
  else
  {
    double v5 = 0;
  }
  double v6 = [(MPAVRoutingTableViewCellAccessibility *)self safeValueForKey:@"_routeNameLabel"];
  double v7 = __UIAXStringForVariables();

  return v7;
}

- (id)_accessibilityDescriptionForRoute:(id)a3
{
  return AXLabelForMediaRoute(a3);
}

- (id)accessibilityValue
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  objc_opt_class();
  id v3 = [(MPAVRoutingTableViewCellAccessibility *)self accessibilityMediaRoute];
  int v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  double v5 = [v4 safeValueForKey:@"batteryLevel"];
  double v6 = __UIAccessibilityCastAsClass();

  if (v6 && v4 && ([v4 isPickedOnPairedDevice] & 1) == 0)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    char v14 = __59__MPAVRoutingTableViewCellAccessibility_accessibilityValue__block_invoke;
    v15 = &unk_2650A2D68;
    id v16 = v6;
    AXPerformSafeBlock();
  }
  if (!objc_msgSend((id)v18[5], "length", v12, v13, v14, v15))
  {
    double v7 = [(MPAVRoutingTableViewCellAccessibility *)self safeValueForKey:@"_subtitleTextLabel"];
    uint64_t v8 = [v7 accessibilityLabel];
    double v9 = (void *)v18[5];
    v18[5] = v8;
  }
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v10;
}

void __59__MPAVRoutingTableViewCellAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) leftPercentage];
  if (v2)
  {
    id v3 = (void *)v2;
    int v4 = [*(id *)(a1 + 32) rightPercentage];

    if (v4)
    {
      if (![*(id *)(a1 + 40) _shouldShowSeparateBatteryPercentagesForBatteryLevel:*(void *)(a1 + 32)])
      {
        v15 = [*(id *)(a1 + 32) leftPercentage];
        [v15 floatValue];
        float v17 = v16;
        v18 = [*(id *)(a1 + 32) rightPercentage];
        [v18 floatValue];
        uint64_t v19 = *(void **)(a1 + 32);
        if (v17 < v20) {
          [v19 leftPercentage];
        }
        else {
        v21 = [v19 rightPercentage];
        }
        [v21 floatValue];

        id v22 = NSString;
        double v6 = accessibilityLocalizedString(@"audio.route.single.battery.level");
        double v7 = AXFormatFloatWithPercentage();
        objc_msgSend(v22, "stringWithFormat:", v6, v7);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      double v5 = NSString;
      double v6 = accessibilityLocalizedString(@"audio.route.left.right.battery.level");
      double v7 = [*(id *)(a1 + 32) leftPercentage];
      [v7 floatValue];
      uint64_t v8 = AXFormatFloatWithPercentage();
      double v9 = [*(id *)(a1 + 32) rightPercentage];
      [v9 floatValue];
      id v10 = AXFormatFloatWithPercentage();
      objc_msgSend(v5, "stringWithFormat:", v6, v8, v10);
      id v31 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_15:

      goto LABEL_16;
    }
  }
  double v11 = [*(id *)(a1 + 32) leftPercentage];

  if (v11)
  {
    uint64_t v12 = NSString;
    double v6 = accessibilityLocalizedString(@"audio.route.single.battery.left.level");
    uint64_t v13 = [*(id *)(a1 + 32) leftPercentage];
LABEL_9:
    double v7 = v13;
    [v13 floatValue];
    uint64_t v8 = AXFormatFloatWithPercentage();
    objc_msgSend(v12, "stringWithFormat:", v6, v8);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  char v14 = [*(id *)(a1 + 32) rightPercentage];

  if (v14)
  {
    uint64_t v12 = NSString;
    double v6 = accessibilityLocalizedString(@"audio.route.single.battery.right.level");
    uint64_t v13 = [*(id *)(a1 + 32) rightPercentage];
    goto LABEL_9;
  }
  id v31 = 0;
LABEL_16:
  v23 = [*(id *)(a1 + 32) casePercentage];

  if (v23)
  {
    v24 = NSString;
    v25 = accessibilityLocalizedString(@"audio.route.case.battery.level");
    v26 = [*(id *)(a1 + 32) casePercentage];
    [v26 floatValue];
    v27 = AXFormatFloatWithPercentage();
    v23 = objc_msgSend(v24, "stringWithFormat:", v25, v27);
  }
  uint64_t v28 = __UIAXStringForVariables();
  uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
  v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v28;
}

- (void)updateForEndpoint:(id)a3 routeItem:(id)a4 inferLocalizedModelName:(BOOL)a5
{
  BOOL v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)MPAVRoutingTableViewCellAccessibility;
  id v8 = a4;
  [(MPAVRoutingTableViewCellAccessibility *)&v10 updateForEndpoint:a3 routeItem:v8 inferLocalizedModelName:v5];
  double v9 = objc_msgSend(v8, "safeValueForKey:", @"mainRoute", v10.receiver, v10.super_class);

  [(MPAVRoutingTableViewCellAccessibility *)self setAccessibilityMediaRoute:v9];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end