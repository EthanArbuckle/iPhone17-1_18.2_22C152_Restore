@interface UIUndoGestureInteractionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setUndoHUDType:(int64_t)a3 visibility:(BOOL)a4;
@end

@implementation UIUndoGestureInteractionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIUndoGestureInteraction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIUndoGestureInteraction", @"setUndoHUDType:visibility:", "v", "q", "B", 0);
  objc_storeStrong(v4, obj);
}

- (void)setUndoHUDType:(int64_t)a3 visibility:(BOOL)a4
{
  v8 = self;
  SEL v7 = a2;
  int64_t v6 = a3;
  BOOL v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)UIUndoGestureInteractionAccessibility;
  [(UIUndoGestureInteractionAccessibility *)&v4 setUndoHUDType:a3 visibility:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end