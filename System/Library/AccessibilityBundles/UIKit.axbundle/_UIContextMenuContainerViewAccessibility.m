@interface _UIContextMenuContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScrollAncestor;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollDownPageSupported;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)accessibilityScrollUpPageSupported;
- (BOOL)accessibilityViewIsModal;
- (double)_axTranslationForDetentIndex:(void *)a3 currentDetentIndex:(id)obj detents:;
- (id)_axDetentsForPanController:(uint64_t)a1;
- (id)_axPanController;
- (uint64_t)_axCurrentDetentIndexForPanController:(uint64_t)a1;
- (void)_axApplyTranslation:(id)obj forDetentIndex:(double)a4 panController:(double)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation _UIContextMenuContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContextMenuContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  id v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIContextMenuContainerView";
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = @"_UIContextMenuPanController";
  objc_msgSend(location[0], "validateClass:");
  v7 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3);
  v4 = @"UIGestureRecognizer";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UIPanGestureRecognizer");
  [location[0] validateClass:v4 hasInstanceVariable:@"_targets" withType:"NSMutableArray"];
  v6 = "@";
  [location[0] validateClass:v5 hasInstanceMethod:@"detents" withFullSignature:0];
  [location[0] validateClass:v5 hasInstanceVariable:@"_currentDetentIndex" withType:"Q"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_updateViewPositionsWithTranslation:location:ended:withVelocity:", v8, "{CAPoint3D=ddd}", "{CAPoint3D=ddd}", "B", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"didUpdateFocusInContext: withAnimationCoordinator:", v8, v6, v6, 0);
  objc_storeStrong(v10, v9);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (id)_axPanController
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v26[1] = a1;
  if (a1)
  {
    v26[0] = 0;
    char v24 = 0;
    objc_opt_class();
    id v23 = (id)__UIAccessibilityCastAsClass();
    id v22 = v23;
    objc_storeStrong(&v23, 0);
    id v25 = v22;
    memset(__b, 0, sizeof(__b));
    id obj = (id)[v22 gestureRecognizers];
    uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
    if (v14)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v14;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(id *)(__b[1] + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = (id)[v21 safeArrayForKey:@"_targets"];
          memset(v17, 0, sizeof(v17));
          id v7 = v19;
          uint64_t v8 = [v7 countByEnumeratingWithState:v17 objects:v28 count:16];
          if (v8)
          {
            uint64_t v4 = *(void *)v17[2];
            uint64_t v5 = 0;
            unint64_t v6 = v8;
            while (1)
            {
              uint64_t v3 = v5;
              if (*(void *)v17[2] != v4) {
                objc_enumerationMutation(v7);
              }
              id v18 = *(id *)(v17[1] + 8 * v5);
              id v16 = (id)[v18 safeValueForKey:@"_target"];
              NSClassFromString(&cfstr_Uicontextmenup.isa);
              if (objc_opt_isKindOfClass())
              {
                objc_storeStrong(v26, v16);
                int v15 = 4;
              }
              else
              {
                int v15 = 0;
              }
              objc_storeStrong(&v16, 0);
              if (v15) {
                break;
              }
              ++v5;
              if (v3 + 1 >= v6)
              {
                uint64_t v5 = 0;
                unint64_t v6 = [v7 countByEnumeratingWithState:v17 objects:v28 count:16];
                if (!v6) {
                  break;
                }
              }
            }
          }

          objc_storeStrong(&v19, 0);
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }

    id v27 = v26[0];
    objc_storeStrong(&v25, 0);
    objc_storeStrong(v26, 0);
  }
  else
  {
    id v27 = 0;
  }
  v1 = v27;

  return v1;
}

- (id)_axDetentsForPanController:(uint64_t)a1
{
  uint64_t v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5) {
    id v6 = (id)[location safeArrayForKey:@"detents"];
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong(&location, 0);
  v2 = v6;

  return v2;
}

- (uint64_t)_axCurrentDetentIndexForPanController:(uint64_t)a1
{
  uint64_t v4 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v4) {
    uint64_t v5 = [location safeUnsignedIntegerForKey:@"_currentDetentIndex"];
  }
  else {
    uint64_t v5 = 0;
  }
  objc_storeStrong(&location, 0);
  return v5;
}

- (double)_axTranslationForDetentIndex:(void *)a3 currentDetentIndex:(id)obj detents:
{
  uint64_t v14 = a1;
  uint64_t v13 = a2;
  location[1] = a3;
  location[0] = 0;
  objc_storeStrong(location, obj);
  double v15 = 0.0;
  uint64_t v16 = 0;
  if (v14)
  {
    char v10 = 0;
    objc_opt_class();
    id v7 = (id)[location[0] objectAtIndexedSubscript:v13];
    id v9 = (id)__UIAccessibilityCastAsClass();

    id v8 = v9;
    objc_storeStrong(&v9, 0);
    [v8 CGPointValue];
    double v15 = v4;
    uint64_t v16 = v5;
  }
  int v11 = 1;
  objc_storeStrong(location, 0);
  return v15;
}

- (void)_axApplyTranslation:(id)obj forDetentIndex:(double)a4 panController:(double)a5
{
  *(double *)&long long v27 = a4;
  *((double *)&v27 + 1) = a5;
  uint64_t v26 = a1;
  uint64_t v25 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v26)
  {
    id v22 = (void *)[location safeIvarForKey:@"_currentDetentIndex"];
    if (v22) {
      *id v22 = v25;
    }
    long long v21 = 0uLL;
    char v16 = 0;
    objc_opt_class();
    id v15 = (id)__UIAccessibilityCastAsClass();
    id v14 = v15;
    objc_storeStrong(&v15, 0);
    [v14 bounds];
    uint64_t v17 = v5;
    uint64_t v18 = v6;
    uint64_t v19 = v7;
    uint64_t v20 = v8;
    AX_CGRectGetCenter();
    *(void *)&long long v21 = v9;
    *((void *)&v21 + 1) = v10;

    id v11 = location;
    long long v12 = v27;
    long long v13 = v21;
    AXPerformSafeBlock();
    objc_storeStrong(&v11, 0);
    int v23 = 0;
  }
  else
  {
    int v23 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  uint64_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v18 = 0;
  [location[0] accessibilityFrame];
  v17.origin.x = v3;
  v17.origin.y = v4;
  v17.size.width = v5;
  v17.size.height = v6;
  [(_UIContextMenuContainerViewAccessibility *)v20 accessibilityFrame];
  CGRect v16 = v21;
  if (!CGRectContainsRect(v21, v17))
  {
    id v15 = -[_UIContextMenuContainerViewAccessibility _axPanController](v20);
    id v14 = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v20, v15);
    long long v13 = (void *)-[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v20, v15);
    for (unint64_t i = (unint64_t)v13; i < [v14 count]; ++i)
    {
      double v10 = -[_UIContextMenuContainerViewAccessibility _axTranslationForDetentIndex:currentDetentIndex:detents:]((uint64_t)v20, i, v13, v14);
      double v11 = v7;
      v22.origin.x = v17.origin.x + v10;
      v22.origin.y = v17.origin.y + v7;
      v22.size = v17.size;
      if (CGRectContainsRect(v16, v22))
      {
        [(_UIContextMenuContainerViewAccessibility *)(uint64_t)v20 _axApplyTranslation:v15 forDetentIndex:v10 panController:v11];
        char v18 = 1;
      }
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  char v9 = v18;
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (BOOL)accessibilityScrollUpPageSupported
{
  double v7 = self;
  v6[1] = (id)a2;
  v6[0] = -[_UIContextMenuContainerViewAccessibility _axPanController](self);
  id v5 = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v7, v6[0]);
  unint64_t v3 = -[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v7, v6[0]);
  BOOL v4 = v3 < [v5 count] - 1;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

- (BOOL)accessibilityScrollUpPage
{
  long long v13 = self;
  SEL v12 = a2;
  char v11 = 0;
  id v10 = -[_UIContextMenuContainerViewAccessibility _axPanController](self);
  id location = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v13, v10);
  uint64_t v8 = (void *)-[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v13, v10);
  if ((unint64_t)v8 < [location count] - 1)
  {
    double v7 = -[_UIContextMenuContainerViewAccessibility _axTranslationForDetentIndex:currentDetentIndex:detents:]((uint64_t)v13, (uint64_t)v8 + 1, v8, location);
    [(_UIContextMenuContainerViewAccessibility *)(uint64_t)v13 _axApplyTranslation:v10 forDetentIndex:v7 panController:v2];
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CE30];
    id v6 = accessibilityLocalizedString(@"context.menu.scrolled.up");
    UIAccessibilityPostNotification(notification, v6);

    char v11 = 1;
  }
  char v4 = v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
  return v4 & 1;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  double v7 = self;
  v6[1] = (id)a2;
  v6[0] = -[_UIContextMenuContainerViewAccessibility _axPanController](self);
  id location = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v7, v6[0]);
  unint64_t v4 = -[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v7, v6[0]);
  BOOL v3 = 0;
  if (v4) {
    BOOL v3 = v4 < [location count];
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v6, 0);
  return v3;
}

- (BOOL)accessibilityScrollDownPage
{
  long long v13 = self;
  SEL v12 = a2;
  char v11 = 0;
  id v10 = -[_UIContextMenuContainerViewAccessibility _axPanController](self);
  id location = -[_UIContextMenuContainerViewAccessibility _axDetentsForPanController:]((uint64_t)v13, v10);
  uint64_t v8 = (void *)-[_UIContextMenuContainerViewAccessibility _axCurrentDetentIndexForPanController:]((uint64_t)v13, v10);
  if (v8 && (unint64_t)v8 < [location count])
  {
    double v7 = -[_UIContextMenuContainerViewAccessibility _axTranslationForDetentIndex:currentDetentIndex:detents:]((uint64_t)v13, (uint64_t)v8 - 1, v8, location);
    [(_UIContextMenuContainerViewAccessibility *)(uint64_t)v13 _axApplyTranslation:v10 forDetentIndex:v7 panController:v2];
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CE30];
    id v6 = accessibilityLocalizedString(@"context.menu.scrolled.down");
    UIAccessibilityPostNotification(notification, v6);

    char v11 = 1;
  }
  char v4 = v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
  return v4 & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  v22.receiver = v25;
  v22.super_class = (Class)_UIContextMenuContainerViewAccessibility;
  [(_UIContextMenuContainerViewAccessibility *)&v22 didUpdateFocusInContext:location[0] withAnimationCoordinator:v23];
  char v17 = 0;
  char v15 = 0;
  BOOL v7 = 0;
  if ([(_UIContextMenuContainerViewAccessibility *)v25 _accessibilityIsFKARunningForFocusItem])
  {
    char v21 = 0;
    objc_opt_class();
    id v5 = (id)[location[0] nextFocusedItem];
    id v20 = (id)__UIAccessibilityCastAsClass();

    id v19 = v20;
    objc_storeStrong(&v20, 0);
    id v18 = v19;
    char v17 = 1;
    id v16 = (id)[v19 _accessibilityAncestorIsKindOf:objc_opt_class()];
    char v15 = 1;
    BOOL v7 = v16 != 0;
  }
  if (v15) {

  }
  if (v17) {
  if (v7)
  }
  {
    id v4 = v23;
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    char v11 = __93___UIContextMenuContainerViewAccessibility_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
    SEL v12 = &unk_2650AFA90;
    long long v13 = v25;
    id v14 = location[0];
    objc_msgSend(v4, "addCoordinatedFocusingAnimations:completion:", &v8);
    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

@end