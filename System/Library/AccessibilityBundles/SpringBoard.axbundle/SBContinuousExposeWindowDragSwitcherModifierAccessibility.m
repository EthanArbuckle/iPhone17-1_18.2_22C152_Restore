@interface SBContinuousExposeWindowDragSwitcherModifierAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)handleGestureEvent:(id)a3;
@end

@implementation SBContinuousExposeWindowDragSwitcherModifierAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBContinuousExposeWindowDragSwitcherModifier";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBContinuousExposeWindowDragSwitcherModifier", @"selectedDisplayItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBGestureSwitcherModifierEvent", @"phase", "Q", 0);
  [v3 validateClass:@"SBContinuousExposeWindowDragSwitcherModifier" hasInstanceVariable:@"_destinationModifier" withType:"SBContinuousExposeWindowDragDestinationSwitcherModifier"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBContinuousExposeWindowDragDestinationSwitcherModifier", @"proposedAppLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"allItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBContinuousExposeWindowDragSwitcherModifier", @"handleGestureEvent:", "@", "@", 0);
}

- (id)handleGestureEvent:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifierAccessibility;
  v5 = [(SBContinuousExposeWindowDragSwitcherModifierAccessibility *)&v25 handleGestureEvent:v4];
  v6 = [(SBContinuousExposeWindowDragSwitcherModifierAccessibility *)self safeValueForKey:@"selectedDisplayItem"];
  uint64_t v7 = [v4 safeIntegerForKey:@"phase"];
  v8 = [(SBContinuousExposeWindowDragSwitcherModifierAccessibility *)self safeValueForKey:@"_destinationModifier"];
  v9 = v8;
  if (v7 == 3)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = [v8 safeValueForKey:@"proposedAppLayout"];
    v11 = [v10 safeArrayForKey:@"allItems"];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          if (*(void **)(*((void *)&v21 + 1) + 8 * i) == v6)
          {
            LODWORD(v12) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    uint64_t v15 = [v6 accessibilityLabel];
    v16 = (void *)v15;
    if (v12 && v15)
    {
      UIAccessibilityNotifications v17 = *MEMORY[0x263F1CDC8];
      v18 = accessibilityLocalizedString(@"continuous.expose.window.drag.switcher.modifier.added.to.stage");
      v19 = AXCFormattedString();
      UIAccessibilityPostNotification(v17, v19);
    }
  }

  return v5;
}

@end