@interface NavAudioControlViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySetNavTypeToAlerts;
- (BOOL)_accessibilitySetNavTypeToAll;
- (BOOL)_accessibilitySetNavTypeToNone;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation NavAudioControlViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavAudioControlView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavAudioControlView", @"currentAudioType", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavAudioControlView", @"availableAudioTypes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavAudioControlView", @"_selectAudioType:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavAudioControlView", @"_accessibilityTextForAudioType:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavAudioControlView", @"_animateContentUpdate", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return AXMapsLocString(@"AUDIO");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityCustomActions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v14 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(NavAudioControlViewAccessibility *)self safeArrayForKey:@"availableAudioTypes"];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      v13 = sel__accessibilitySetNavTypeToNone;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = (int)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v7), "intValue", v13);
        v9 = [(NavAudioControlViewAccessibility *)self _accessibilityTextForAudioType:v8];
        if (v9)
        {
          v10 = sel__accessibilitySetNavTypeToAll;
          if (!v8) {
            goto LABEL_12;
          }
          if (v8 == 2)
          {
            v10 = v13;
LABEL_12:
            v11 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v9 target:self selector:v10];
            [v14 addObject:v11];

            goto LABEL_13;
          }
          v10 = sel__accessibilitySetNavTypeToAlerts;
          if (v8 == 1) {
            goto LABEL_12;
          }
        }
LABEL_13:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v14;
}

- (id)accessibilityValue
{
  uint64_t v3 = (int)[(NavAudioControlViewAccessibility *)self safeIntForKey:@"currentAudioType"];

  return (id)[(NavAudioControlViewAccessibility *)self _accessibilityTextForAudioType:v3];
}

- (BOOL)_accessibilitySetNavTypeToAll
{
  return 1;
}

- (BOOL)_accessibilitySetNavTypeToAlerts
{
  return 1;
}

- (BOOL)_accessibilitySetNavTypeToNone
{
  return 1;
}

@end