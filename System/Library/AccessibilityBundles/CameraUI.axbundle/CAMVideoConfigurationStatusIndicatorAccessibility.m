@interface CAMVideoConfigurationStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axFramerateTapped;
- (BOOL)_axResolutionTapped;
- (BOOL)_axSpatialVideoActive;
- (BOOL)_togglesFramerateForTouchAtLocation:(CGPoint)a3;
- (BOOL)_togglesResolutionForTouchAtLocation:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (id)_axFramerateLabel;
- (id)_axResolutionLabel;
- (id)_axSeparatorLabel;
- (id)_axVC;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetFramerateTapped:(BOOL)a3;
- (void)_axSetResolutionTapped:(BOOL)a3;
- (void)_handleTouchAtLocation:(CGPoint)a3;
- (void)layoutSubviews;
@end

@implementation CAMVideoConfigurationStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMVideoConfigurationStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axResolutionTapped
{
  return MEMORY[0x270F09620](self, &__CAMVideoConfigurationStatusIndicatorAccessibility___axResolutionTapped);
}

- (void)_axSetResolutionTapped:(BOOL)a3
{
}

- (BOOL)_axFramerateTapped
{
  return MEMORY[0x270F09620](self, &__CAMVideoConfigurationStatusIndicatorAccessibility___axFramerateTapped);
}

- (void)_axSetFramerateTapped:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMVideoConfigurationStatusIndicator", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMVideoConfigurationStatusIndicator", @"_togglesResolutionForTouchAtLocation:", "B", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMVideoConfigurationStatusIndicator", @"_togglesFramerateForTouchAtLocation:", "B", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMVideoConfigurationStatusIndicator", @"_handleTouchAtLocation:", "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMVideoConfigurationStatusIndicator", @"_resolutionString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMVideoConfigurationStatusIndicator", @"_framerateString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMVideoConfigurationStatusIndicator", @"_resolutionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMVideoConfigurationStatusIndicator", @"_framerateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMVideoConfigurationStatusIndicator", @"_separatorLabel", "@", 0);
  [v3 validateClass:@"CAMViewfinderViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentDevicePosition", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_isSpatialVideoInVideoModeActiveForMode:devicePosition:", "B", "q", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"video.configuration.status.button");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_initWeak(&location, self);
  v12.receiver = self;
  v12.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  [(CAMVideoConfigurationStatusIndicatorAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axSeparatorLabel];
  [v3 _setIsAccessibilityElementBlock:&__block_literal_global_17];
  v4 = [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axResolutionLabel];
  [v4 _setAccessibilityLabelBlock:&__block_literal_global_352];
  v5 = [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axFramerateLabel];
  [v5 _setAccessibilityLabelBlock:&__block_literal_global_357_0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v10[3] = &unk_2650A02E8;
  objc_copyWeak(&v11, &location);
  [v4 _setAccessibilityValueBlock:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v8[3] = &unk_2650A02E8;
  objc_copyWeak(&v9, &location);
  [v5 _setAccessibilityValueBlock:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v7[3] = &unk_2650A0310;
  v7[4] = self;
  [v4 _setAccessibilityAdditionalTraitsBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v6[3] = &unk_2650A0310;
  v6[4] = self;
  [v5 _setAccessibilityAdditionalTraitsBlock:v6];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

uint64_t __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 0;
}

id __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return accessibilityCameraUILocalizedString(@"resolution.label");
}

id __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return accessibilityCameraUILocalizedString(@"framerate.label");
}

id __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_resolutionString"];

  return v2;
}

id __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  v2 = NSString;
  id v3 = accessibilityCameraUILocalizedString(@"framerate.value");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained safeValueForKey:@"_framerateString"];
  v6 = objc_msgSend(v2, "stringWithFormat:", v3, v5);

  return v6;
}

uint64_t __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) _axSpatialVideoActive];
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  if (v1) {
    uint64_t v2 = 0;
  }
  return v2 | *MEMORY[0x263F1CF40];
}

uint64_t __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) _axSpatialVideoActive];
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  if (v1) {
    uint64_t v2 = 0;
  }
  return v2 | *MEMORY[0x263F1CF40];
}

- (id)_axVC
{
  uint64_t v2 = [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_368 startWithSelf:1];
  id v3 = [v2 _accessibilityViewController];

  return v3;
}

uint64_t __58__CAMVideoConfigurationStatusIndicatorAccessibility__axVC__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E18B0](@"CAMViewfinderViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axSpatialVideoActive
{
  uint64_t v2 = self;
  id v3 = [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axVC];
  v4 = [v3 safeValueForKey:@"_currentMode"];
  [v4 integerValue];

  v5 = [(CAMVideoConfigurationStatusIndicatorAccessibility *)v2 _axVC];
  [v5 safeIntegerForKey:@"_currentDevicePosition"];

  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  AXPerformSafeBlock();
  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __74__CAMVideoConfigurationStatusIndicatorAccessibility__axSpatialVideoActive__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _axVC];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _isSpatialVideoInVideoModeActiveForMode:*(void *)(a1 + 48) devicePosition:*(void *)(a1 + 56)];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  [(CAMVideoConfigurationStatusIndicatorAccessibility *)&v3 layoutSubviews];
  [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)_togglesResolutionForTouchAtLocation:(CGPoint)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  BOOL v4 = -[CAMVideoConfigurationStatusIndicatorAccessibility _togglesResolutionForTouchAtLocation:](&v6, sel__togglesResolutionForTouchAtLocation_, a3.x, a3.y);
  [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axSetResolutionTapped:v4];
  return v4;
}

- (BOOL)_togglesFramerateForTouchAtLocation:(CGPoint)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  BOOL v4 = -[CAMVideoConfigurationStatusIndicatorAccessibility _togglesFramerateForTouchAtLocation:](&v6, sel__togglesFramerateForTouchAtLocation_, a3.x, a3.y);
  [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axSetFramerateTapped:v4];
  return v4;
}

- (void)_handleTouchAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axSetResolutionTapped:0];
  [(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axSetFramerateTapped:0];
  v15.receiver = self;
  v15.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  -[CAMVideoConfigurationStatusIndicatorAccessibility _handleTouchAtLocation:](&v15, sel__handleTouchAtLocation_, x, y);
  if ([(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axResolutionTapped])
  {
    objc_super v6 = (void *)MEMORY[0x263F21660];
    uint64_t v7 = [(CAMVideoConfigurationStatusIndicatorAccessibility *)self safeValueForKey:@"_resolutionString"];
    v8 = [v6 axAttributedStringWithString:v7];
  }
  else
  {
    if (![(CAMVideoConfigurationStatusIndicatorAccessibility *)self _axFramerateTapped]) {
      return;
    }
    uint64_t v9 = (void *)MEMORY[0x263F21660];
    char v10 = NSString;
    uint64_t v7 = accessibilityCameraUILocalizedString(@"framerate.value");
    id v11 = [(CAMVideoConfigurationStatusIndicatorAccessibility *)self safeValueForKey:@"_framerateString"];
    objc_super v12 = objc_msgSend(v10, "stringWithFormat:", v7, v11);
    v8 = [v9 axAttributedStringWithString:v12];
  }
  if (v8)
  {
    [v8 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
    v14 = v8;
    id v13 = v8;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __76__CAMVideoConfigurationStatusIndicatorAccessibility__handleTouchAtLocation___block_invoke(uint64_t a1)
{
}

- (id)_axResolutionLabel
{
  return (id)[(CAMVideoConfigurationStatusIndicatorAccessibility *)self safeValueForKey:@"_resolutionLabel"];
}

- (id)_axFramerateLabel
{
  return (id)[(CAMVideoConfigurationStatusIndicatorAccessibility *)self safeValueForKey:@"_framerateLabel"];
}

- (id)_axSeparatorLabel
{
  return (id)[(CAMVideoConfigurationStatusIndicatorAccessibility *)self safeValueForKey:@"_separatorLabel"];
}

@end