@interface VoiceVolumeControlViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_animateContentUpdate;
@end

@implementation VoiceVolumeControlViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VoiceVolumeControlView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VoiceVolumeControlView" hasInstanceVariable:@"_currentSelection" withType:"NSInteger"];
  [v3 validateClass:@"VoiceVolumeControlView" hasInstanceVariable:@"_buttons" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VoiceVolumeControlView", @"_animateContentUpdate", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(VoiceVolumeControlViewAccessibility *)self safeArrayForKey:@"_buttons"];
  uint64_t v4 = [(VoiceVolumeControlViewAccessibility *)self safeIntegerForKey:@"_currentSelection"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = *MEMORY[0x263F1CF38];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        char v16 = 0;
        objc_opt_class();
        v11 = __UIAccessibilityCastAsClass();
        uint64_t v12 = [v11 tag];
        uint64_t v13 = [v11 accessibilityTraits];
        if (v12 == v4) {
          uint64_t v14 = v9 | v13;
        }
        else {
          uint64_t v14 = _AXTraitsRemoveTrait();
        }
        [v11 setAccessibilityTraits:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15.receiver = self;
  v15.super_class = (Class)VoiceVolumeControlViewAccessibility;
  [(VoiceVolumeControlViewAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
}

- (void)_animateContentUpdate
{
  v3.receiver = self;
  v3.super_class = (Class)VoiceVolumeControlViewAccessibility;
  [(VoiceVolumeControlViewAccessibility *)&v3 _animateContentUpdate];
  [(VoiceVolumeControlViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end