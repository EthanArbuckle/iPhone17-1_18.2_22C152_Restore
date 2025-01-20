@interface UndoButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)undoFrom:(id)a3;
@end

@implementation UndoButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.UndoButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.UndoButton", @"undoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.UndoButton", @"undoFrom:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"UNDO_BUTTON");
}

- (unint64_t)accessibilityTraits
{
  v2 = [(UndoButtonAccessibility *)self safeValueForKey:@"undoButton"];
  uint64_t v3 = [v2 accessibilityTraits];
  unint64_t v4 = *MEMORY[0x263F1CEE8] | v3 | *MEMORY[0x263F1CF40];

  return v4;
}

- (void)undoFrom:(id)a3
{
  id v4 = a3;
  v5 = AXMeasureAccessibilityStateObserver();
  [v5 axHasConfirmedRectangle];

  v8.receiver = self;
  v8.super_class = (Class)UndoButtonAccessibility;
  [(UndoButtonAccessibility *)&v8 undoFrom:v4];

  v6 = accessibilityLocalizedString(@"DID_UNDO_LAST_POINT");
  v7 = accessibilityLocalizedString(@"DID_UNDO_POINT");
  AXMeasureAnnounceUpdatedMeasurement(v6, v7);
}

@end