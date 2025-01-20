@interface UIDimmingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCoversScreen;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityObscuredScreenAllowedViews;
- (id)_childFocusViews;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (uint64_t)_accessibilityCanDismiss;
@end

@implementation UIDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDimmingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  [location[0] validateClass:@"UIView" hasInstanceMethod:@"_childFocusViews" withFullSignature:0];
  v4 = @"UIDimmingView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, @"_ignoresTouches");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPresentationController", @"_shouldDismiss", v5, 0);
  objc_storeStrong(v7, obj);
}

- (BOOL)_accessibilityCoversScreen
{
  return a1
      && ([a1 safeBoolForKey:@"_ignoresTouches"] & 1) == 0
      && ([a1 isUserInteractionEnabled] & 1) != 0
      && ([a1 _accessibilityViewIsVisible] & 1) != 0;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v27 = self;
  v26[1] = (id)a2;
  v26[0] = (id)[(UIDimmingViewAccessibility *)self safeValueForKey:@"passthroughViews"];
  id v16 = (id)[(UIDimmingViewAccessibility *)v27 superview];
  id v15 = (id)[v16 subviews];
  id v14 = (id)[v15 reverseObjectEnumerator];
  id v25 = (id)[v14 allObjects];

  id v24 = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = v25;
  uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v18)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v18;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      v23 = *(UIDimmingViewAccessibility **)(__b[1] + 8 * v12);
      if (v23 == v27) {
        break;
      }
      [v24 addObject:v23];
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v13) {
          goto LABEL_9;
        }
      }
    }
    int v21 = 2;
  }
  else
  {
LABEL_9:
    int v21 = 0;
  }

  memset(v19, 0, sizeof(v19));
  id v8 = v26[0];
  uint64_t v9 = [v8 countByEnumeratingWithState:v19 objects:v28 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)v19[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)v19[2] != v5) {
        objc_enumerationMutation(v8);
      }
      uint64_t v20 = *(void *)(v19[1] + 8 * v6);
      if (([v24 containsObject:v20] & 1) == 0) {
        [v24 addObject:v20];
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [v8 countByEnumeratingWithState:v19 objects:v28 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v24;
  int v21 = 1;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);

  return v3;
}

- (BOOL)accessibilityViewIsModal
{
  id v2 = (id)[(UIDimmingViewAccessibility *)self storedAccessibilityViewIsModal];
  BOOL v5 = v2 == 0;

  if (v5) {
    return -[UIDimmingViewAccessibility _accessibilityCoversScreen](self);
  }
  id v4 = (id)[(UIDimmingViewAccessibility *)self storedAccessibilityViewIsModal];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (uint64_t)_accessibilityCanDismiss
{
  id v5 = a1;
  if (a1)
  {
    id v4 = (id)[v5 safeValueForKey:@"_delegate"];
    NSClassFromString(&cfstr_Uipopovercontr.isa);
    if (objc_opt_isKindOfClass())
    {
      id location = (id)[v4 safeValueForKey:@"_delegate"];
      if (location)
      {
        char v6 = [location _accessibilityCanDismissPopoverController:v4] & 1;
        int v2 = 1;
      }
      else
      {
        int v2 = 0;
      }
      objc_storeStrong(&location, 0);
      if (v2) {
        goto LABEL_12;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v6 = [v4 safeBoolForKey:@"_shouldDismiss"] & 1;
LABEL_12:
        objc_storeStrong(&v4, 0);
        return v6 & 1;
      }
    }
    char v6 = 1;
    goto LABEL_12;
  }
  char v6 = 0;
  return v6 & 1;
}

- (BOOL)accessibilityActivate
{
  v8[2] = self;
  v8[1] = (id)a2;
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  char v6 = __51__UIDimmingViewAccessibility_accessibilityActivate__block_invoke;
  BOOL v7 = &unk_2650ADF18;
  v8[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v8, 0);
  return 1;
}

uint64_t __51__UIDimmingViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mouseUp:", 0, a1, a1);
}

- (CGPoint)accessibilityActivationPoint
{
  v29 = self;
  v28[1] = (id)a2;
  if (!AXDoesRequestingClientDeserveAutomation()) {
    goto LABEL_10;
  }
  v28[0] = (id)[(UIDimmingViewAccessibility *)v29 safeValueForKey:@"_delegate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id location = (id)[v28[0] presentedView];
  if (!location) {
    goto LABEL_6;
  }
  [(UIDimmingViewAccessibility *)v29 accessibilityFrame];
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  [location accessibilityFrame];
  uint64_t v18 = v6;
  uint64_t v19 = v7;
  uint64_t v20 = v8;
  uint64_t v21 = v9;
  AX_CGRectBySubtractingRect();
  CGRect v26 = v33;
  if (CGRectIsEmpty(v33))
  {
LABEL_6:
    int v17 = 0;
  }
  else
  {
    AX_CGRectGetCenter();
    double v30 = v10;
    double v31 = v11;
    int v17 = 1;
  }
  objc_storeStrong(&location, 0);
  if (!v17) {
LABEL_8:
  }
    int v17 = 0;
  objc_storeStrong(v28, 0);
  if (!v17)
  {
LABEL_10:
    v16.receiver = v29;
    v16.super_class = (Class)UIDimmingViewAccessibility;
    [(UIDimmingViewAccessibility *)&v16 accessibilityActivationPoint];
    double v30 = v12;
    double v31 = v13;
  }
  double v14 = v30;
  double v15 = v31;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  return [(UIDimmingViewAccessibility *)self accessibilityActivate];
}

- (int64_t)accessibilityContainerType
{
  uint64_t v7 = self;
  SEL v6 = a2;
  id v2 = (id)[(UIDimmingViewAccessibility *)self storedAccessibilityContainerType];
  BOOL v4 = v2 == 0;

  if (v4)
  {
    if (-[UIDimmingViewAccessibility _accessibilityCoversScreen](v7)
      && (-[UIDimmingViewAccessibility _accessibilityCanDismiss](v7) & 1) != 0)
    {
      return 4;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5.receiver = v7;
    v5.super_class = (Class)UIDimmingViewAccessibility;
    return [(UIDimmingViewAccessibility *)&v5 accessibilityContainerType];
  }
}

- (id)accessibilityLabel
{
  if (-[UIDimmingViewAccessibility _accessibilityCoversScreen](self)
    && (-[UIDimmingViewAccessibility _accessibilityCanDismiss](self) & 1) != 0)
  {
    id v4 = (id)UIKitAccessibilityLocalizedString();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)accessibilityIdentifier
{
  if (-[UIDimmingViewAccessibility _accessibilityCoversScreen](self)
    && (-[UIDimmingViewAccessibility _accessibilityCanDismiss](self) & 1) != 0)
  {
    id v4 = @"PopoverDismissRegion";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)accessibilityHint
{
  if (-[UIDimmingViewAccessibility _accessibilityCoversScreen](self)
    && (-[UIDimmingViewAccessibility _accessibilityCanDismiss](self) & 1) != 0)
  {
    id v4 = (id)UIKitAccessibilityLocalizedString();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_childFocusViews
{
  v28 = self;
  v27[1] = (id)a2;
  v26.receiver = self;
  v26.super_class = (Class)UIDimmingViewAccessibility;
  v27[0] = [(UIDimmingViewAccessibility *)&v26 _childFocusViews];
  if ([(UIDimmingViewAccessibility *)v28 _accessibilityIsFKARunningForFocusItem])
  {
    if ([(UIDimmingViewAccessibility *)v28 accessibilityElementsHidden])
    {
      id v29 = MEMORY[0x263EFFA68];
      int v25 = 1;
    }
    else
    {
      id v17 = (id)[(UIDimmingViewAccessibility *)v28 safeArrayForKey:@"passthroughViews"];
      id v24 = (id)[v17 mutableCopy];

      if ([v24 count])
      {
        double v13 = v28;
        uint64_t v18 = MEMORY[0x263EF8330];
        int v19 = -1073741824;
        int v20 = 0;
        uint64_t v21 = __46__UIDimmingViewAccessibility__childFocusViews__block_invoke;
        uint64_t v22 = &unk_2650AE790;
        id v23 = v24;
        id v2 = (id)[(UIDimmingViewAccessibility *)v13 _accessibilityFindAncestor:&v18 startWithSelf:0];
        double v14 = (void *)MEMORY[0x263EFF8C0];
        id v16 = (id)[v24 reverseObjectEnumerator];
        id v15 = (id)[v16 allObjects];
        id v3 = (id)objc_msgSend(v14, "axArrayWithPossiblyNilArrays:", 2, v15, v27[0]);
        id v4 = v27[0];
        v27[0] = v3;

        objc_storeStrong(&v23, 0);
      }
      uint64_t v7 = (void *)MEMORY[0x263F1CB60];
      id v12 = (id)[v27[0] reverseObjectEnumerator];
      id v11 = (id)[v12 allObjects];
      id v10 = (id)objc_msgSend(v7, "_subviewsReplacedByModalViewSubviewsIfNecessary:");
      id v9 = (id)[v10 reverseObjectEnumerator];
      id v8 = (id)[v9 allObjects];
      id v29 = (id)objc_msgSend(v8, "ax_filteredArrayUsingBlock:", &__block_literal_global_19);

      int v25 = 1;
      objc_storeStrong(&v24, 0);
    }
  }
  else
  {
    id v29 = v27[0];
    int v25 = 1;
  }
  objc_storeStrong(v27, 0);
  objc_super v5 = v29;

  return v5;
}

uint64_t __46__UIDimmingViewAccessibility__childFocusViews__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ([a1[4] containsObject:location[0]]) {
    [a1[4] removeObject:location[0]];
  }
  objc_storeStrong(location, 0);
  return 0;
}

uint64_t __46__UIDimmingViewAccessibility__childFocusViews__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityFKAShouldBeProcessed];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

@end