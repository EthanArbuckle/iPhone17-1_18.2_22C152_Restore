@interface MTATimerPresetViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axTimerPreset;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axSetTimerPreset:(id)a3;
- (void)setPresetItem:(id)a3;
@end

@implementation MTATimerPresetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTATimerPresetView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axTimerPreset
{
}

- (void)_axSetTimerPreset:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerPresetView", @"setPresetItem:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerPresetItem", @"duration", "d", 0);
}

- (id)accessibilityLabel
{
  v2 = [(MTATimerPresetViewAccessibility *)self _axTimerPreset];
  [v2 safeTimeIntervalForKey:@"duration"];
  id v3 = AXDurationStringForDuration();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (void)setPresetItem:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTATimerPresetViewAccessibility;
  id v4 = a3;
  [(MTATimerPresetViewAccessibility *)&v5 setPresetItem:v4];
  -[MTATimerPresetViewAccessibility _axSetTimerPreset:](self, "_axSetTimerPreset:", v4, v5.receiver, v5.super_class);
}

@end