@interface UIHoverGestureRecognizerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axGesture;
- (int64_t)state;
- (uint64_t)_axIsListeningForNotifications;
- (uint64_t)_axSetIsListeningForNotifications:(uint64_t)result;
- (uint64_t)_axSetSimulatedState:(uint64_t)result;
- (uint64_t)_axSimulatedState;
- (void)_accessibilityFocusedElementChanged:(id)a3;
- (void)_accessibilityFocusedElementChangedToElement:(void *)a1;
- (void)_accessibilitySimulateStateChange;
- (void)_axSetOverrideStateEnabled:(id)obj forFocusedElement:;
@end

@implementation UIHoverGestureRecognizerAccessibility

- (int64_t)state
{
  v6 = self;
  SEL v5 = a2;
  id v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIHoverGestureRecognizerAccessibility;
  id v4 = [(UIHoverGestureRecognizerAccessibility *)&v3 state];
  if ((uint64_t)v4 <= 0) {
    return -[UIHoverGestureRecognizerAccessibility _axSimulatedState]((uint64_t)v6);
  }
  else {
    return (int64_t)v4;
  }
}

- (uint64_t)_axSimulatedState
{
  if (a1) {
    return __UIAccessibilityGetAssociatedInteger();
  }
  else {
    return 0;
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"UIHoverGestureRecognizer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (uint64_t)_axIsListeningForNotifications
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_axSetIsListeningForNotifications:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (uint64_t)_axSetSimulatedState:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedInteger();
  }
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = @"UIGestureRecognizer";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UIHoverGestureRecognizer");
  [location[0] validateClass:@"UIGestureRecognizer" hasInstanceVariable:@"_targets" withType:"NSMutableArray"];
  objc_super v3 = @"UIGestureRecognizerTarget";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UIGestureRecognizerTarget" hasInstanceVariable:@"_target" withType:"@"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIGestureRecognizer", @"state", "q", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityFocusedElementChanged:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[location[0] userInfo];
  id v3 = (id)[v4 objectForKeyedSubscript:*MEMORY[0x263F1CE00]];
  -[UIHoverGestureRecognizerAccessibility _accessibilityFocusedElementChangedToElement:](v6, v3);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityFocusedElementChangedToElement:(void *)a1
{
  v18 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v18)
  {
    id v15 = -[UIHoverGestureRecognizerAccessibility _axGesture]((uint64_t)v18);
    BOOL v14 = -[UIHoverGestureRecognizerAccessibility _axSimulatedState]((uint64_t)v18) > 0;
    id v10 = (id)[v15 view];
    [v10 accessibilityFrame];
    rect1.origin.x = v2;
    rect1.origin.y = v3;
    rect1.size.width = v4;
    rect1.size.height = v5;

    [location accessibilityFrame];
    rect2.origin.x = v6;
    rect2.origin.y = v7;
    rect2.size.width = v8;
    rect2.size.height = v9;
    CGRectContainsRect(rect1, rect2);
    -[UIHoverGestureRecognizerAccessibility _axSetSimulatedState:]((uint64_t)v18);
    BOOL v11 = -[UIHoverGestureRecognizerAccessibility _axSimulatedState]((uint64_t)v18) > 0;
    if (v14 || v11) {
      -[UIHoverGestureRecognizerAccessibility _accessibilitySimulateStateChange](v18);
    }
    objc_storeStrong(&v15, 0);
    int v16 = 0;
  }
  else
  {
    int v16 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_axGesture
{
  uint64_t v6 = a1;
  if (a1)
  {
    char v5 = 0;
    objc_opt_class();
    id v4 = (id)__UIAccessibilityCastAsClass();
    id v3 = v4;
    objc_storeStrong(&v4, 0);
    id v7 = v3;
  }
  else
  {
    id v7 = 0;
  }
  v1 = v7;

  return v1;
}

- (void)_accessibilitySimulateStateChange
{
  id v12 = a1;
  if (a1)
  {
    id v11 = -[UIHoverGestureRecognizerAccessibility _axGesture]((uint64_t)v12);
    id v10 = (id)[v11 delegate];
    if (v10
      && (objc_opt_respondsToSelector() & 1) != 0
      && ([v10 gestureRecognizerShouldBegin:v11] & 1) == 0)
    {
      int v9 = 1;
    }
    else
    {
      id v8 = (id)[v12 safeArrayForKey:@"_targets"];
      uint64_t v1 = MEMORY[0x263EF8330];
      int v2 = -1073741824;
      int v3 = 0;
      id v4 = __74__UIHoverGestureRecognizerAccessibility__accessibilitySimulateStateChange__block_invoke;
      char v5 = &unk_2650ADFB0;
      id v6 = v8;
      id v7 = v11;
      AXPerformSafeBlock();
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v8, 0);
      int v9 = 0;
    }
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
}

void __74__UIHoverGestureRecognizerAccessibility__accessibilitySimulateStateChange__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0;
    unint64_t v5 = v8;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v4);
      id v1 = (id)[v10 target];
      objc_msgSend(v1, "performSelector:withObject:", objc_msgSend(v10, "action"), *(void *)(a1 + 40));

      ++v4;
      if (v2 + 1 >= v5)
      {
        uint64_t v4 = 0;
        unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

- (void)_axSetOverrideStateEnabled:(id)obj forFocusedElement:
{
  id v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v7)
  {
    if ((v6 & 1) == 0
      || (-[UIHoverGestureRecognizerAccessibility _axIsListeningForNotifications]((uint64_t)v7) & 1) != 0)
    {
      if ((v6 & 1) == 0
        && (-[UIHoverGestureRecognizerAccessibility _axIsListeningForNotifications]((uint64_t)v7) & 1) != 0)
      {
        -[UIHoverGestureRecognizerAccessibility _axSetIsListeningForNotifications:]((uint64_t)v7);
        id v3 = (id)[MEMORY[0x263F08A00] defaultCenter];
        [v3 removeObserver:v7 name:*MEMORY[0x263F1CDF8] object:0];

        -[UIHoverGestureRecognizerAccessibility _axSetSimulatedState:]((uint64_t)v7);
        -[UIHoverGestureRecognizerAccessibility _accessibilitySimulateStateChange](v7);
      }
    }
    else
    {
      -[UIHoverGestureRecognizerAccessibility _axSetIsListeningForNotifications:]((uint64_t)v7);
      id v4 = (id)[MEMORY[0x263F08A00] defaultCenter];
      [v4 addObserver:v7 selector:sel__accessibilityFocusedElementChanged_ name:*MEMORY[0x263F1CDF8] object:0];

      -[UIHoverGestureRecognizerAccessibility _accessibilityFocusedElementChangedToElement:](v7, location);
    }
  }
  objc_storeStrong(&location, 0);
}

@end