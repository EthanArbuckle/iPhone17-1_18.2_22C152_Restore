@interface SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)handleGestureEvent:(id)a3;
@end

@implementation SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBContinuousExposeWindowDragDestinationSwitcherModifier";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBContinuousExposeWindowDragDestinationSwitcherModifier", @"proposedDestination", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBContinuousExposeWindowDragDestinationSwitcherModifier", @"selectedDisplayItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBContinuousExposeWindowDragDestinationSwitcherModifier", @"handleGestureEvent:", "@", "@", 0);
}

- (id)handleGestureEvent:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility;
  v4 = [(SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility *)&v13 handleGestureEvent:a3];
  uint64_t v5 = [(SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility *)self safeIntegerForKey:@"proposedDestination"];
  v6 = [(SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility *)self safeValueForKey:@"selectedDisplayItem"];
  v7 = v6;
  if (v5 == 2)
  {
    if (cancelDrag) {
      goto LABEL_12;
    }
    v9 = [v6 accessibilityLabel];
    if (v9)
    {
      v10 = accessibilityLocalizedString(@"continuous.expose.window.drag.destination.add.to.stage");
      v12 = [v7 accessibilityLabel];
      v8 = AXCFormattedString();
    }
    else
    {
      v8 = 0;
    }
    cancelDrag = 1;

    if (!v8) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v5 && cancelDrag == 1)
  {
    v8 = accessibilityLocalizedString(@"continuous.expose.window.drag.destination.cancel");
    cancelDrag = 0;
    if (v8)
    {
LABEL_11:
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v8);
    }
  }
LABEL_12:

  return v4;
}

@end