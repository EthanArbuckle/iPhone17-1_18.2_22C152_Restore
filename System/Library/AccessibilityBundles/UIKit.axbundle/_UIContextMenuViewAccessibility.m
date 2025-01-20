@interface _UIContextMenuViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)accessibilityScrollToVisible;
- (id)accessibilityElements;
- (void)displayMenu:(id)a3 updateType:(unint64_t)a4 alongsideAnimations:(id)a5;
@end

@implementation _UIContextMenuViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContextMenuView";
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
  v3 = @"_UIContextMenuView";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"currentListView", v4, 0);
  v8 = "Q";
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"displayMenu:updateType:alongsideAnimations:", v4, "Q", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIContextMenuUIController", @"platterPanController", v4, 0);
  v7 = @"_UIContextMenuPanController";
  v5 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"moveToDetentPosition:updateScrubPath:", v6, "q", v5, 0);
  [location[0] validateClass:v7 hasInstanceVariable:@"_currentDetentIndex" withType:v8];
  objc_storeStrong(v10, v9);
}

- (void)displayMenu:(id)a3 updateType:(unint64_t)a4 alongsideAnimations:(id)a5
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v20 = a4;
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  objc_initWeak(&v18, v22);
  v7 = v22;
  id v8 = location[0];
  unint64_t v9 = v20;
  uint64_t v11 = MEMORY[0x263EF8330];
  int v12 = -1073741824;
  int v13 = 0;
  v14 = __78___UIContextMenuViewAccessibility_displayMenu_updateType_alongsideAnimations___block_invoke;
  v15 = &unk_2650AE1E0;
  id v16 = v19;
  objc_copyWeak(&v17, &v18);
  v10.receiver = v7;
  v10.super_class = (Class)_UIContextMenuViewAccessibility;
  [(_UIContextMenuViewAccessibility *)&v10 displayMenu:v8 updateType:v9 alongsideAnimations:&v11];
  objc_destroyWeak(&v17);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(&v18);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (id)accessibilityElements
{
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = (id)[(_UIContextMenuViewAccessibility *)self safeValueForKey:@"currentListView"];
  id v5 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

- (BOOL)accessibilityScrollToVisible
{
  v8[2] = self;
  v8[1] = (id)a2;
  id v4 = (id)[(_UIContextMenuViewAccessibility *)self safeValueForKey:@"delegate"];
  v8[0] = (id)[v4 safeValueForKey:@"platterPanController"];

  if ([v8[0] safeBoolForKey:@"enabled"])
  {
    uint64_t v6 = objc_msgSend(v8[0], "safeIntegerForKey:");
    id v5 = v8[0];
    AXPerformSafeBlock();
    uint64_t v2 = [v8[0] safeIntegerForKey:@"_currentDetentIndex"];
    BOOL v9 = v2 != v6;
    int v7 = 1;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    BOOL v9 = 0;
    int v7 = 1;
  }
  objc_storeStrong(v8, 0);
  return v9;
}

- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v17 = a3;
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  BOOL v14 = 0;
  v13.receiver = v16;
  v13.super_class = (Class)_UIContextMenuViewAccessibility;
  BOOL v14 = [(_UIContextMenuViewAccessibility *)&v13 _accessibilityAllowOutOfBoundsHitTestAtPoint:location[0] withEvent:v17];
  if (v14)
  {
    BOOL v18 = v14;
  }
  else
  {
    id v12 = (id)[(_UIContextMenuViewAccessibility *)v16 safeUIViewForKey:@"currentListView"];
    char v10 = 0;
    objc_opt_class();
    id v9 = (id)__UIAccessibilityCastAsClass();
    id v8 = v9;
    objc_storeStrong(&v9, 0);
    id v11 = v8;
    UIAccessibilityPointForPoint();
    point.x = v4;
    point.y = v5;
    [v12 accessibilityFrame];
    BOOL v18 = CGRectContainsPoint(v19, point);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(location, 0);
  return v18;
}

@end