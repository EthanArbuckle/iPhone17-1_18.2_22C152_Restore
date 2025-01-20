@interface UIViewAnimationStateAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityAnimationTracker;
- (void)_accessibilityMarkAnimationNotInProgress:(void *)a1;
- (void)_accessibilitySetAnimationTracker:(uint64_t)a1;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
@end

@implementation UIViewAnimationStateAccessibility

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v10 = a4;
  id v9 = 0;
  if (_AXSAutomationEnabled())
  {
    id v4 = (id)[(UIViewAnimationStateAccessibility *)v12 safeValueForKey:@"_animationID"];
    id v5 = v9;
    id v9 = v4;
  }
  if (location[0])
  {
    id v6 = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v12);
    [v6 removeObject:location[0]];

    -[UIViewAnimationStateAccessibility _accessibilityMarkAnimationNotInProgress:](v12, location[0]);
  }
  v8.receiver = v12;
  v8.super_class = (Class)UIViewAnimationStateAccessibility;
  [(UIViewAnimationStateAccessibility *)&v8 animationDidStop:location[0] finished:v10];
  if (_AXSAutomationEnabled()) {
    UIAccessibilityPostNotification(*MEMORY[0x263F81440], v9);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v15 = self;
  SEL v14 = a2;
  memset(__b, 0, sizeof(__b));
  id obj = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v15);
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(__b[1] + 8 * v5);
      os_log_t oslog = (os_log_t)(id)AXLogUIA();
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v16, (uint64_t)v15, (uint64_t)v13);
        _os_log_impl(&dword_2402B7000, log, type, "Animation tracker missed didStop, removing in dealloc: %p:%p", v16, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      -[UIViewAnimationStateAccessibility _accessibilityMarkAnimationNotInProgress:](v15, v13);
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  v9.receiver = v15;
  v9.super_class = (Class)UIViewAnimationStateAccessibility;
  [(UIViewAnimationStateAccessibility *)&v9 dealloc];
}

- (id)_accessibilityAnimationTracker
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIViewAnimationState___accessibilityAnimationTracker);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilityMarkAnimationNotInProgress:(void *)a1
{
  id v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    [v3 _accessibilitySetAnimationsInProgress:0];
  }
  objc_storeStrong(&location, 0);
}

- (void)animationDidStart:(id)a3
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v36 = location[0] != 0;
  char v34 = 0;
  objc_opt_class();
  uint64_t v26 = 0;
  v27 = &v26;
  int v28 = 838860800;
  int v29 = 48;
  v30 = __Block_byref_object_copy__26;
  v31 = __Block_byref_object_dispose__26;
  id v32 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  int v21 = -1073741824;
  int v22 = 0;
  v23 = __55__UIViewAnimationStateAccessibility_animationDidStart___block_invoke;
  v24 = &unk_2650AE390;
  v25[1] = &v26;
  v25[0] = v38;
  AXPerformSafeBlock();
  id v19 = (id)v27[5];
  objc_storeStrong(v25, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  id v33 = (id)__UIAccessibilityCastAsClass();

  if (v34) {
    abort();
  }
  id v18 = v33;
  objc_storeStrong(&v33, 0);
  id v35 = v18;
  BOOL v17 = 0;
  BOOL v12 = 0;
  if (v18)
  {
    BOOL v12 = 0;
    if ([v35 isUserInteractionEnabled]) {
      BOOL v12 = [v35 safeIntegerForKey:@"_animationState"] == 4;
    }
  }
  BOOL v17 = v12;
  if (v12) {
    BOOL v36 = 0;
  }
  if (_AXSAutomationEnabled())
  {
    id v3 = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v38);
    BOOL v11 = v3 != 0;

    if (!v11)
    {
      objc_super v9 = v38;
      id v10 = (id)[MEMORY[0x263EFF9C0] set];
      -[UIViewAnimationStateAccessibility _accessibilitySetAnimationTracker:]((uint64_t)v9, v10);
    }
    id v7 = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v38);
    char v8 = [v7 containsObject:location[0]];

    if (v8)
    {
      os_log_t oslog = (os_log_t)(id)AXLogUIA();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v6 = type;
        __os_log_helper_16_0_0(v14);
        _os_log_error_impl(&dword_2402B7000, log, v6, "The same animation was started twice. It's possible this will lead to mismatch animation tracking", v14, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    if (v36)
    {
      id v4 = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v38);
      [v4 addObject:location[0]];
    }
  }
  if (v36) {
    [(UIViewAnimationStateAccessibility *)v38 _accessibilitySetAnimationsInProgress:1];
  }
  v13.receiver = v38;
  v13.super_class = (Class)UIViewAnimationStateAccessibility;
  [(UIViewAnimationStateAccessibility *)&v13 animationDidStart:location[0]];
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __55__UIViewAnimationStateAccessibility_animationDidStart___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _outerPropertyAnimator:1];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

+ (id)safeCategoryTargetClassName
{
  return @"UIViewAnimationState";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilitySetAnimationTracker:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  uint64_t v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = @"UIViewAnimationState";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewAnimationState", @"_outerPropertyAnimator:", "@", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewPropertyAnimator", @"_animationState", "q", 0);
  objc_storeStrong(v5, obj);
}

@end