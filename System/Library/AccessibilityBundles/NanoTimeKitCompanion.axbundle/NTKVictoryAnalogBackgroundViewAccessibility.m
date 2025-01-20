@interface NTKVictoryAnalogBackgroundViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axHandleNumberLabels:(id)a3;
- (void)_axLabelLogoButton:(id)a3;
- (void)_createLargeHourMarkerLabelsAndAttachToViewIfNeeded;
- (void)_createMediumNumberLayersIfNeededAndAttachToViewIfNeeded;
- (void)addLogoButtonIfNeeded;
- (void)addSmallLogoButtonIfNeeded;
@end

@implementation NTKVictoryAnalogBackgroundViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKVictoryAnalogBackgroundView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKVictoryAnalogBackgroundView" hasInstanceVariable:@"_logoButton" withType:"NTKVictoryLogoButton"];
  [v3 validateClass:@"NTKVictoryAnalogBackgroundView" hasInstanceVariable:@"_smallLogoButton" withType:"NTKVictoryLogoButton"];
  [v3 validateClass:@"NTKVictoryAnalogBackgroundView" hasInstanceVariable:@"_largeHourMarkerLabels" withType:"NSArray"];
  [v3 validateClass:@"NTKVictoryAnalogBackgroundView" hasInstanceVariable:@"_mediumNumberLayers" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKVictoryAnalogBackgroundView", @"addLogoButtonIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKVictoryAnalogBackgroundView", @"addSmallLogoButtonIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKVictoryAnalogBackgroundView", @"_createLargeHourMarkerLabelsAndAttachToViewIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKVictoryAnalogBackgroundView", @"_createMediumNumberLayersIfNeededAndAttachToViewIfNeeded", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)NTKVictoryAnalogBackgroundViewAccessibility;
  [(NTKVictoryAnalogBackgroundViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NTKVictoryAnalogBackgroundViewAccessibility *)self safeValueForKey:@"_logoButton"];
  [(NTKVictoryAnalogBackgroundViewAccessibility *)self _axLabelLogoButton:v3];

  v4 = [(NTKVictoryAnalogBackgroundViewAccessibility *)self safeValueForKey:@"_smallLogoButton"];
  [(NTKVictoryAnalogBackgroundViewAccessibility *)self _axLabelLogoButton:v4];

  v5 = [(NTKVictoryAnalogBackgroundViewAccessibility *)self safeArrayForKey:@"_largeHourMarkerLabels"];
  [(NTKVictoryAnalogBackgroundViewAccessibility *)self _axHandleNumberLabels:v5];

  v6 = [(NTKVictoryAnalogBackgroundViewAccessibility *)self safeArrayForKey:@"_mediumNumberLayers"];
  [(NTKVictoryAnalogBackgroundViewAccessibility *)self _axHandleNumberLabels:v6];
}

- (void)addLogoButtonIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVictoryAnalogBackgroundViewAccessibility;
  [(NTKVictoryAnalogBackgroundViewAccessibility *)&v3 addLogoButtonIfNeeded];
  [(NTKVictoryAnalogBackgroundViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)addSmallLogoButtonIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVictoryAnalogBackgroundViewAccessibility;
  [(NTKVictoryAnalogBackgroundViewAccessibility *)&v3 addSmallLogoButtonIfNeeded];
  [(NTKVictoryAnalogBackgroundViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_createLargeHourMarkerLabelsAndAttachToViewIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVictoryAnalogBackgroundViewAccessibility;
  [(NTKVictoryAnalogBackgroundViewAccessibility *)&v3 _createLargeHourMarkerLabelsAndAttachToViewIfNeeded];
  [(NTKVictoryAnalogBackgroundViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_createMediumNumberLayersIfNeededAndAttachToViewIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVictoryAnalogBackgroundViewAccessibility;
  [(NTKVictoryAnalogBackgroundViewAccessibility *)&v3 _createMediumNumberLayersIfNeededAndAttachToViewIfNeeded];
  [(NTKVictoryAnalogBackgroundViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axLabelLogoButton:(id)a3
{
  id v3 = a3;
  accessibilityLocalizedString(@"victory.watchkit.app", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAccessibilityLabel:v5];
}

- (void)_axHandleNumberLabels:(id)a3
{
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setIsAccessibilityElement:0];
        objc_super v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end