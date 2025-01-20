@interface _UIKeyboardTextSelectionInteractionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)beginTwoFingerCursorPanWithTranslation:(CGPoint)a3 executionContext:(id)a4;
- (void)endTwoFingerPanWithExecutionContext:(id)a3;
- (void)updateTwoFingerPanWithTranslation:(CGPoint)a3 executionContext:(id)a4;
@end

@implementation _UIKeyboardTextSelectionInteractionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyboardTextSelectionInteraction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "{CGPoint=dd}";
  v4 = "@";
  v5 = @"_UIKeyboardTextSelectionInteraction";
  v6 = "v";
  [location[0] validateClass:"{CGPoint=dd}" hasInstanceMethod:"@" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"updateTwoFingerPanWithTranslation:executionContext:", v6, v3, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"endTwoFingerPanWithExecutionContext:", v6, v4, 0);
  objc_storeStrong(v8, v7);
}

- (void)beginTwoFingerCursorPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  CGPoint v7 = a3;
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4.receiver = v6;
  v4.super_class = (Class)_UIKeyboardTextSelectionInteractionAccessibility;
  -[_UIKeyboardTextSelectionInteractionAccessibility beginTwoFingerCursorPanWithTranslation:executionContext:](&v4, sel_beginTwoFingerCursorPanWithTranslation_executionContext_, location[0], v7.x, v7.y);
  UIAccessibilityPostNotification(0x43Au, 0);
  objc_storeStrong(location, 0);
}

- (void)updateTwoFingerPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  CGPoint v7 = a3;
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4.receiver = v6;
  v4.super_class = (Class)_UIKeyboardTextSelectionInteractionAccessibility;
  -[_UIKeyboardTextSelectionInteractionAccessibility updateTwoFingerPanWithTranslation:executionContext:](&v4, sel_updateTwoFingerPanWithTranslation_executionContext_, location[0], v7.x, v7.y);
  if (!(++updateTwoFingerPanWithTranslation_executionContext__count % 3))
  {
    UIAccessibilityPostNotification(0x439u, 0);
    updateTwoFingerPanWithTranslation_executionContext__count = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)endTwoFingerPanWithExecutionContext:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIKeyboardTextSelectionInteractionAccessibility;
  [(_UIKeyboardTextSelectionInteractionAccessibility *)&v3 endTwoFingerPanWithExecutionContext:location[0]];
  UIAccessibilityPostNotification(0x43Bu, 0);
  objc_storeStrong(location, 0);
}

@end