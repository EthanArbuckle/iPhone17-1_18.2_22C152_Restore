@interface UIKeyboardLayoutCursorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityLastFocusChangeNotificationTimer;
- (void)_accessibilitySetLastFocusChangeNotificationTimer:(id)a3;
- (void)_axPostFocusChangeNotification;
- (void)setSelectedKeyIndex:(int64_t)a3;
@end

@implementation UIKeyboardLayoutCursorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardLayoutCursor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIKeyboardLayoutCursor";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"handleVisualDirectionalInput:", "B", "i", 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"_keyplaneName" withType:"NSString"];
  [location[0] validateClass:v3 hasInstanceVariable:@"_keyplane" withType:"UIKBTree"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBTree", @"componentName", "@", 0);
  objc_storeStrong(v5, obj);
}

- (id)_accessibilityLastFocusChangeNotificationTimer
{
  return objc_getAssociatedObject(self, &__UIKeyboardLayoutCursorAccessibility___accessibilityLastFocusChangeNotificationTimer);
}

- (void)_accessibilitySetLastFocusChangeNotificationTimer:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (void)_axPostFocusChangeNotification
{
}

- (void)setSelectedKeyIndex:(int64_t)a3
{
  v19 = self;
  SEL v18 = a2;
  int64_t v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardLayoutCursorAccessibility;
  [(UIKeyboardLayoutCursorAccessibility *)&v16 setSelectedKeyIndex:a3];
  id v3 = [(UIKeyboardLayoutCursorAccessibility *)v19 _accessibilityLastFocusChangeNotificationTimer];
  BOOL v7 = v3 != 0;

  if (!v7)
  {
    id v5 = objc_alloc(MEMORY[0x263F21398]);
    id v6 = MEMORY[0x263EF83A0];
    id v15 = (id)objc_msgSend(v5, "initWithTargetSerialQueue:");

    [v15 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(UIKeyboardLayoutCursorAccessibility *)v19 _accessibilitySetLastFocusChangeNotificationTimer:v15];
    objc_storeStrong(&v15, 0);
  }
  objc_initWeak(&from, v19);
  id v4 = [(UIKeyboardLayoutCursorAccessibility *)v19 _accessibilityLastFocusChangeNotificationTimer];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  v11 = __59__UIKeyboardLayoutCursorAccessibility_setSelectedKeyIndex___block_invoke;
  v12 = &unk_2650AE1B8;
  objc_copyWeak(v13, &from);
  [v4 afterDelay:&v8 processBlock:0.1];

  objc_destroyWeak(v13);
  objc_destroyWeak(&from);
}

void __59__UIKeyboardLayoutCursorAccessibility_setSelectedKeyIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axPostFocusChangeNotification];
}

@end