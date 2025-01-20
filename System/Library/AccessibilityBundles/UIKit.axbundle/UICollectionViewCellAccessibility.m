@interface UICollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestReverseOrder;
- (BOOL)_accessibilityImplementsDefaultRowRange;
- (BOOL)_accessibilityIsInCollectionCell;
- (BOOL)_accessibilityIsOutsideParentBounds;
- (BOOL)_accessibilityRespondsToUserInteractionForElement:(id)a3;
- (BOOL)_axContentViewHasSingleFocusableSubview;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)accessibilityScrollToVisible;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (_NSRange)_accessibilityIndexPathAsRange;
- (_NSRange)accessibilityRowRange;
- (id)_accessibilityCachedChildren;
- (id)_accessibilityChildren;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityIndexPath;
- (id)_accessibilityListConfiguration;
- (id)_accessibilityParentCollectionView;
- (id)_accessibilityParentScrollView;
- (id)_axCustomActionsForActions:(void *)a1;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (id)axData;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityClearInternalCaches;
- (void)_setPopupMenuButton:(id)a3;
- (void)accessibilityClearInternalData;
- (void)accessibilityReuseChildren:(id)a3 forMockParent:(id)a4;
- (void)addSubview:(id)a3;
- (void)insertSubview:(id)a3 aboveSubview:(id)a4;
- (void)insertSubview:(id)a3 atIndex:(int64_t)a4;
- (void)insertSubview:(id)a3 belowSubview:(id)a4;
- (void)prepareForReuse;
- (void)willRemoveSubview:(id)a3;
@end

@implementation UICollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v12 = location;
  id v11 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = @"UICollectionViewCell";
  v10 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = @"UICollectionView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"_UICollectionViewDragAndDropController"];
  v3 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v9);
  v8 = "@";
  [location[0] validateClass:v9 hasInstanceMethod:@"contentConfiguration" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_contentViewConfiguration", v8, 0);
  [location[0] validateClass:v9 hasInstanceVariable:@"_contentView" withType:"UIView"];
  v7 = "B";
  [location[0] validateClass:v3 hasInstanceMethod:@"_isEligibleForFocusInteraction" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"canBecomeFocused", v7, 0);
  v4 = @"UICollectionViewCompositionalLayout";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"dataSourceSnapshotter", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDataSourceSnapshotter", @"snapshot", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"layoutSectionProvider", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"collectionViewLayout", v8, 0);
  v6 = @"UIListContentView";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"configuration", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityRespondsToUserInteraction", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_setPopupMenuButton:", v10, v8, 0);
  objc_storeStrong(v12, v11);
}

- (unint64_t)_accessibilityAutomationType
{
  return 75;
}

- (id)_accessibilityParentCollectionView
{
  return (id)[(UICollectionViewCellAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
}

- (id)_accessibilityParentScrollView
{
  if (a1) {
    id v2 = (id)[a1 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (unint64_t)accessibilityTraits
{
  v6 = self;
  SEL v5 = a2;
  unint64_t v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewCellAccessibility;
  unint64_t v4 = [(UICollectionViewCellAccessibility *)&v3 accessibilityTraits];
  if ([(UICollectionViewCellAccessibility *)v6 isSelected]) {
    v4 |= *MEMORY[0x263F1CF38];
  }
  return v4;
}

- (id)accessibilityLabel
{
  v21 = self;
  v20[1] = (id)a2;
  v20[0] = (id)[(UICollectionViewCellAccessibility *)self accessibilityUserDefinedLabel];
  if (v20[0])
  {
    id v22 = v20[0];
    int v19 = 1;
  }
  else
  {
    id location = (id)objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityLabel", v21);
    id v2 = (id)[(id)*MEMORY[0x263F81160] objectForKeyedSubscript:location];
    BOOL v16 = v2 == 0;

    if (v16)
    {
      id v15 = (id)[(UICollectionViewCellAccessibility *)v21 safeValueForKey:@"_contentViewConfiguration"];
      id v3 = (id)[v15 accessibilityLabel];
      id v4 = v20[0];
      v20[0] = v3;

      if (![v20[0] length])
      {
        id v14 = -[UICollectionViewCellAccessibility _accessibilityListConfiguration](v21);
        id v5 = (id)[v14 accessibilityLabel];
        id v6 = v20[0];
        v20[0] = v5;
      }
      if (![v20[0] length])
      {
        id v13 = (id)[(UICollectionViewCellAccessibility *)v21 safeValueForKey:@"contentConfiguration"];
        id v7 = (id)[v13 accessibilityLabel];
        id v8 = v20[0];
        v20[0] = v7;
      }
      if (![v20[0] length])
      {
        v17.receiver = v21;
        v17.super_class = (Class)UICollectionViewCellAccessibility;
        id v9 = [(UICollectionViewCellAccessibility *)&v17 accessibilityLabel];
        id v10 = v20[0];
        v20[0] = v9;
      }
      [(id)*MEMORY[0x263F81160] setObject:v20[0] forKeyedSubscript:location];
      id v22 = v20[0];
      int v19 = 1;
    }
    else
    {
      id v22 = (id)[(id)*MEMORY[0x263F81160] objectForKeyedSubscript:location];
      int v19 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v20, 0);
  id v11 = v22;

  return v11;
}

- (id)_accessibilityListConfiguration
{
  if (a1)
  {
    id v4 = (id)[a1 safeUIViewForKey:@"_contentView"];
    id v3 = (id)[v4 _accessibilityFindUnsortedSubviewDescendantsPassingTest:&__block_literal_global_14];
    id v2 = (id)[v3 firstObject];
    id v5 = (id)[v2 safeValueForKey:@"configuration"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)accessibilityValue
{
  BOOL v16 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UICollectionViewCellAccessibility *)self accessibilityUserDefinedValue];
  if (location[0])
  {
    id v17 = location[0];
    int v14 = 1;
  }
  else
  {
    id v12 = (id)[(UICollectionViewCellAccessibility *)v16 safeValueForKey:@"_contentViewConfiguration"];
    location[0] = (id)[v12 accessibilityValue];

    if (![location[0] length])
    {
      id v11 = -[UICollectionViewCellAccessibility _accessibilityListConfiguration](v16);
      id v2 = (id)[v11 accessibilityValue];
      id v3 = location[0];
      location[0] = v2;
    }
    if (![location[0] length])
    {
      id v10 = (id)[(UICollectionViewCellAccessibility *)v16 safeValueForKey:@"contentConfiguration"];
      id v4 = (id)[v10 accessibilityValue];
      id v5 = location[0];
      location[0] = v4;
    }
    if (![location[0] length])
    {
      v13.receiver = v16;
      v13.super_class = (Class)UICollectionViewCellAccessibility;
      id v6 = [(UICollectionViewCellAccessibility *)&v13 accessibilityValue];
      id v7 = location[0];
      location[0] = v6;
    }
    id v17 = location[0];
    int v14 = 1;
  }
  objc_storeStrong(location, 0);
  id v8 = v17;

  return v8;
}

uint64_t __68__UICollectionViewCellAccessibility__accessibilityListConfiguration__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uilistcontentv_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (void)prepareForReuse
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UICollectionViewCellAccessibility;
  [(UICollectionViewCellAccessibility *)&v2 prepareForReuse];
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v4);
  [(UICollectionViewCellAccessibility *)v4 setAccessibilityElements:0];
}

- (void)_accessibilityClearInternalCaches
{
  id v2 = a1;
  if (a1)
  {
    [v2 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
    id v1 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityChildren", v2);
    objc_msgSend((id)*MEMORY[0x263F81160], "setObject:forKeyedSubscript:");
    objc_storeStrong(&v1, 0);
  }
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v21 = a3;
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v18 = [(UICollectionViewCellAccessibility *)v20 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v11 = 0;
  char v6 = 0;
  if (!v18)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = __69__UICollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke;
    BOOL v16 = &unk_2650AE580;
    id v17 = v20;
    char v11 = 1;
    id v10 = (id *)&v17;
    char v6 = ((uint64_t (*)(void))__69__UICollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v6)
  {
    -[UICollectionViewCellAccessibility _accessibilitySetBoolValue:forKey:](v20, "_accessibilitySetBoolValue:forKey:", 1);
    id v9 = (id)-[UICollectionViewCellAccessibility accessibilityHitTest:withEvent:](v20, "accessibilityHitTest:withEvent:", location[0], v21.x, v21.y);
    [(UICollectionViewCellAccessibility *)v20 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v22 = v9;
    int v8 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    int v8 = 0;
  }
  if (v11) {
    objc_storeStrong(v10, 0);
  }
  if (!v8)
  {
    if (-[UICollectionViewCellAccessibility pointInside:withEvent:](v20, "pointInside:withEvent:", location[0], v21.x, v21.y))
    {
      v7.receiver = v20;
      v7.super_class = (Class)UICollectionViewCellAccessibility;
      id v22 = -[UICollectionViewCellAccessibility _accessibilityHitTest:withEvent:](&v7, sel__accessibilityHitTest_withEvent_, location[0], v21.x, v21.y);
    }
    else
    {
      id v22 = 0;
    }
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
  id v4 = v22;

  return v4;
}

BOOL __69__UICollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  char v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_396);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      int v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v4 = v8;
      id v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      objc_super v7 = NSStringFromClass(v2);
      id v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation;
}

void __69__UICollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      objc_super v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      SEL v3 = v7;
      id v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      int v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (void)accessibilityReuseChildren:(id)a3 forMockParent:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)automationElements
{
  return -[UICollectionViewCellAccessibility _accessibilityCachedChildren](self);
}

- (id)_accessibilityCachedChildren
{
  id v17 = a1;
  if (!a1)
  {
    id v18 = 0;
    goto LABEL_13;
  }
  id v16 = 0;
  if (_AXSAutomationEnabled())
  {
    id v15 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityChildren", v17);
    id v1 = (id)[(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v15];
    BOOL v10 = v1 == 0;

    if (v10)
    {
      char v13 = 0;
      objc_opt_class();
      id v12 = (id)__UIAccessibilityCastAsSafeCategory();
      id v11 = v12;
      objc_storeStrong(&v12, 0);
      id v2 = -[UIViewAccessibility _accessibilityUserTestingSubviewsSorted:](v11, 1);
      id v3 = v16;
      id v16 = v2;

      [(id)*MEMORY[0x263F81160] setObject:v16 forKeyedSubscript:v15];
      int v14 = 0;
    }
    else
    {
      id v18 = (id)[(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v15];
      int v14 = 1;
    }
    objc_storeStrong(&v15, 0);
    if (v14) {
      goto LABEL_12;
    }
  }
  else
  {
    id v4 = (id)[v17 _accessibilityValueForKey:*MEMORY[0x263F81490]];
    id v5 = v16;
    id v16 = v4;

    if (!v16)
    {
      id v8 = (id)[MEMORY[0x263EFF980] array];
      id v9 = (void *)MEMORY[0x263F81490];
      objc_msgSend(v17, "_accessibilitySetRetainedValue:forKey:");

      id v16 = (id)[v17 _accessibilitySortedElementsWithin];
      [v17 _accessibilitySetRetainedValue:v16 forKey:*v9];
    }
  }
  id v18 = v16;
  int v14 = 1;
LABEL_12:
  objc_storeStrong(&v16, 0);
LABEL_13:
  char v6 = v18;

  return v6;
}

- (id)_accessibilityChildren
{
  char v4 = 0;
  LOBYTE(v3) = 1;
  if (![(UICollectionViewCellAccessibility *)self isAccessibilityElement])
  {
    id v5 = (id)[(UICollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
    char v4 = 1;
    int v3 = [v5 _accessibilityShouldUseCollectionViewCellAccessibilityElements] ^ 1;
  }
  if (v4) {

  }
  if (v3) {
    id v7 = 0;
  }
  else {
    id v7 = -[UICollectionViewCellAccessibility _accessibilityCachedChildren](self);
  }

  return v7;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  id v5 = self;
  SEL v4 = a2;
  if (_AXSAutomationEnabled()) {
    return 1;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewCellAccessibility;
  return [(UICollectionViewCellAccessibility *)&v3 _accessibilityHitTestReverseOrder];
}

- (BOOL)_accessibilityRespondsToUserInteractionForElement:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(UICollectionViewCellAccessibility *)v7 isAccessibilityElement])
  {
    char v8 = 1;
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UICollectionViewCellAccessibility;
    char v8 = [(UICollectionViewCellAccessibility *)&v4 _accessibilityRespondsToUserInteractionForElement:location[0]];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)_privateAccessibilityCustomActions
{
  v39 = self;
  v38[1] = (id)a2;
  v38[0] = (id)[MEMORY[0x263EFF980] array];
  id v18 = v38[0];
  v37.receiver = v39;
  v37.super_class = (Class)UICollectionViewCellAccessibility;
  id v19 = [(UICollectionViewCellAccessibility *)&v37 _privateAccessibilityCustomActions];
  objc_msgSend(v18, "axSafelyAddObjectsFromArray:");

  id v36 = [(UICollectionViewCellAccessibility *)v39 _accessibilityIndexPath];
  if (v36)
  {
    id v34 = (id)[(UICollectionViewCellAccessibility *)v39 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    id v33 = (id)[v34 safeValueForKey:@"collectionViewLayout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v31 = 0;
      objc_opt_class();
      id v30 = (id)__UIAccessibilityCastAsClass();
      id v29 = v30;
      objc_storeStrong(&v30, 0);
      id v32 = v29;
      id v11 = v38[0];
      BOOL v10 = v39;
      id v13 = (id)[v29 _leadingSwipeActionsConfigurationForIndexPath:v36];
      id v12 = -[UICollectionViewCellAccessibility _axCustomActionsForActions:](v10, v13);
      objc_msgSend(v11, "axSafelyAddObjectsFromArray:");

      id v15 = v38[0];
      int v14 = v39;
      id v17 = (id)[v32 _trailingSwipeActionsConfigurationForIndexPath:v36];
      id v16 = -[UICollectionViewCellAccessibility _axCustomActionsForActions:](v14, v17);
      objc_msgSend(v15, "axSafelyAddObjectsFromArray:");

      id v28 = (id)[(UICollectionViewCellAccessibility *)v39 safeUIViewForKey:@"_contentView"];
      if (objc_opt_respondsToSelector())
      {
        char v26 = 0;
        objc_opt_class();
        id v9 = (id)[v28 safeValueForKey:@"_leadingSwipeActionsConfiguration"];
        id v25 = (id)__UIAccessibilityCastAsClass();

        id v24 = v25;
        objc_storeStrong(&v25, 0);
        id v27 = v24;
        id v7 = v38[0];
        id v8 = -[UICollectionViewCellAccessibility _axCustomActionsForActions:](v39, v24);
        objc_msgSend(v7, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v27, 0);
      }
      if (objc_opt_respondsToSelector())
      {
        char v22 = 0;
        objc_opt_class();
        id v6 = (id)[v28 safeValueForKey:@"_trailingSwipeActionsConfiguration"];
        id v21 = (id)__UIAccessibilityCastAsClass();

        id v20 = v21;
        objc_storeStrong(&v21, 0);
        id v23 = v20;
        id v4 = v38[0];
        id v5 = -[UICollectionViewCellAccessibility _axCustomActionsForActions:](v39, v20);
        objc_msgSend(v4, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v23, 0);
      }
      id v40 = v38[0];
      int v35 = 1;
      objc_storeStrong(&v28, 0);
      objc_storeStrong(&v32, 0);
    }
    else
    {
      id v40 = v38[0];
      int v35 = 1;
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    id v40 = v38[0];
    int v35 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v38, 0);
  id v2 = v40;

  return v2;
}

- (id)_axCustomActionsForActions:(void *)a1
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v35 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v35)
  {
    id v32 = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    id obj = (id)[location actions];
    uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v37 count:16];
    if (v19)
    {
      uint64_t v15 = *(void *)__b[2];
      uint64_t v16 = 0;
      unint64_t v17 = v19;
      while (1)
      {
        uint64_t v14 = v16;
        if (*(void *)__b[2] != v15) {
          objc_enumerationMutation(obj);
        }
        id v31 = *(id *)(__b[1] + 8 * v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = (id)[v31 accessibilityLabel];
          if (!v29)
          {
            id v2 = (id)[v31 title];
            id v3 = v29;
            id v29 = v2;

            if (!v29)
            {
              id v13 = (id)[v31 image];
              id v4 = (id)[v13 accessibilityLabel];
              id v5 = v29;
              id v29 = v4;
            }
          }
          id v6 = (id)objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", @"\n", @" ", v10);
          id v7 = v29;
          id v29 = v6;

          if ([v29 length])
          {
            objc_initWeak(&from, v35);
            id v12 = objc_alloc(MEMORY[0x263F1C390]);
            id v11 = v29;
            uint64_t v20 = MEMORY[0x263EF8330];
            int v21 = -1073741824;
            int v22 = 0;
            id v23 = __64__UICollectionViewCellAccessibility__axCustomActionsForActions___block_invoke;
            id v24 = &unk_2650AEB90;
            id v25 = v31;
            objc_copyWeak(&v26, &from);
            id v27 = (id)[v12 initWithName:v11 actionHandler:&v20];
            [v32 addObject:v27];
            objc_storeStrong(&v27, 0);
            objc_destroyWeak(&v26);
            objc_storeStrong(&v25, 0);
            objc_destroyWeak(&from);
          }
          objc_storeStrong(&v29, 0);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v10 = v31;
            _AXAssert();
          }
        }
        ++v16;
        if (v14 + 1 >= v17)
        {
          uint64_t v16 = 0;
          unint64_t v17 = [obj countByEnumeratingWithState:__b objects:v37 count:16];
          if (!v17) {
            break;
          }
        }
      }
    }

    id v36 = v32;
    int v33 = 1;
    objc_storeStrong(&v32, 0);
  }
  else
  {
    id v36 = 0;
    int v33 = 1;
  }
  objc_storeStrong(&location, 0);
  id v8 = v36;

  return v8;
}

uint64_t __64__UICollectionViewCellAccessibility__axCustomActionsForActions___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[1] = a1;
  v12[0] = (id)[a1[4] handler];
  if (v12[0])
  {
    uint64_t v4 = MEMORY[0x263EF8330];
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = __64__UICollectionViewCellAccessibility__axCustomActionsForActions___block_invoke_2;
    id v8 = &unk_2650AEB68;
    objc_copyWeak(&v11, a1 + 5);
    id v10 = v12[0];
    id v9 = a1[4];
    AXPerformSafeBlock();
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    objc_destroyWeak(&v11);
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
  return 1;
}

void __64__UICollectionViewCellAccessibility__axCustomActionsForActions___block_invoke_2(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (location[0]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong(location, 0);
}

- (void)addSubview:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewCellAccessibility;
  [(UICollectionViewCellAccessibility *)&v3 addSubview:location[0]];
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v5);
  objc_storeStrong(location, 0);
}

- (void)willRemoveSubview:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewCellAccessibility;
  [(UICollectionViewCellAccessibility *)&v3 willRemoveSubview:location[0]];
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v5);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 belowSubview:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UICollectionViewCellAccessibility;
  [(UICollectionViewCellAccessibility *)&v5 insertSubview:location[0] belowSubview:v6];
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v8);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 aboveSubview:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UICollectionViewCellAccessibility;
  [(UICollectionViewCellAccessibility *)&v5 insertSubview:location[0] aboveSubview:v6];
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v8);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UICollectionViewCellAccessibility;
  [(UICollectionViewCellAccessibility *)&v5 insertSubview:location[0] atIndex:a4];
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v8);
  objc_storeStrong(location, 0);
}

- (int64_t)accessibilityElementCount
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[(UICollectionViewCellAccessibility *)self accessibilityElements];
  if (v7[0])
  {
    int64_t v9 = [v7[0] count];
    int v6 = 1;
  }
  else
  {
    id location = [(UICollectionViewCellAccessibility *)v8 _accessibilityChildren];
    if (location)
    {
      uint64_t v4 = [location count];
      if (v4) {
        uint64_t v3 = v4;
      }
      else {
        uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
      }
      int64_t v9 = v3;
      int v6 = 1;
    }
    else
    {
      int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      int v6 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v7, 0);
  return v9;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  int64_t v9 = self;
  SEL v8 = a2;
  int64_t v7 = a3;
  id location = (id)[(UICollectionViewCellAccessibility *)self accessibilityElements];
  if (location)
  {
    id v10 = (id)[location objectAtIndexedSubscript:v7];
  }
  else
  {
    id v5 = [(UICollectionViewCellAccessibility *)v9 _accessibilityChildren];
    id v10 = (id)[v5 objectAtIndex:v7];
  }
  objc_storeStrong(&location, 0);
  uint64_t v3 = v10;

  return v3;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  int64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[(UICollectionViewCellAccessibility *)v7 accessibilityElements];
  if (v5)
  {
    int64_t v8 = [v5 indexOfObject:location[0]];
  }
  else
  {
    id v4 = [(UICollectionViewCellAccessibility *)v7 _accessibilityChildren];
    int64_t v8 = [v4 indexOfObject:location[0]];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)accessibilityClearInternalData
{
}

- (id)axData
{
  id v5 = self;
  v4[1]  = (id)a2;
  v4[0]  = (id)[(UICollectionViewCellAccessibility *)self _accessibilityValueForKey:@"AXCollectionViewCellData"];
  if (!v4[0])
  {
    v4[0]  = objc_alloc_init(AXCollectionViewCellData);

    [(UICollectionViewCellAccessibility *)v5 _accessibilitySetRetainedValue:v4[0] forKey:@"AXCollectionViewCellData"];
  }
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (id)_accessibilityIndexPath
{
  int64_t v8 = self;
  v7[1]  = (id)a2;
  id v5 = (id)[(UICollectionViewCellAccessibility *)self accessibilityContainer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = (id)[(UICollectionViewCellAccessibility *)v8 accessibilityContainer];
    id v9 = (id)[v4 indexPath];
  }
  else
  {
    v7[0]  = [(UICollectionViewCellAccessibility *)v8 _accessibilityParentCollectionView];
    id v9 = (id)[v7[0] indexPathForCell:v8];
    objc_storeStrong(v7, 0);
  }
  id v2 = v9;

  return v2;
}

- (_NSRange)accessibilityRowRange
{
  unint64_t v17 = self;
  v16[1]  = (id)a2;
  v16[0]  = (id)[(UICollectionViewCellAccessibility *)self _accessibilityValueForKey:@"_accessibilityRowRangeKey"];
  if (v16[0])
  {
    NSUInteger v18 = [v16[0] rangeValue];
    NSUInteger v19 = v2;
    int v15 = 1;
  }
  else
  {
    char v13 = 0;
    objc_opt_class();
    id v6 = (id)[(UICollectionViewCellAccessibility *)v17 _accessibilityAncestorIsKindOf:objc_opt_class()];
    id v12 = (id)__UIAccessibilityCastAsClass();

    id v11 = v12;
    objc_storeStrong(&v12, 0);
    id v14 = v11;
    id v10 = [(UICollectionViewCellAccessibility *)v17 _accessibilityIndexPath];
    if (v10)
    {
      uint64_t v9 = [v10 item];
      uint64_t v8 = objc_msgSend(v14, "numberOfItemsInSection:", objc_msgSend(v10, "section"));
      uint64_t v21 = v9;
      uint64_t v20 = v8;
      uint64_t v22 = v9;
      uint64_t v23 = v8;
      NSUInteger v18 = v9;
      NSUInteger v19 = v8;
    }
    else
    {
      v7.receiver  = v17;
      v7.super_class  = (Class)UICollectionViewCellAccessibility;
      NSUInteger v18 = (NSUInteger)[(UICollectionViewCellAccessibility *)&v7 accessibilityRowRange];
      NSUInteger v19 = v3;
    }
    int v15 = 1;
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(v16, 0);
  NSUInteger v4 = v18;
  NSUInteger v5 = v19;
  result.length  = v5;
  result.id location = v4;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  v9[2]  = self;
  v9[1]  = (id)a2;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  objc_super v7 = (uint64_t (*)(void))__76__UICollectionViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke;
  uint64_t v8 = &unk_2650AE580;
  v9[0]  = self;
  int v3 = v7() ^ 1;
  objc_storeStrong(v9, 0);
  return v3 & 1;
}

BOOL __76__UICollectionViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  NSUInteger v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_2_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_463);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityRowRange);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log  = v12;
      os_log_type_t type = v11;
      uint64_t v8 = NSStringFromSelector(sel_accessibilityRowRange);
      uint64_t v4 = v8;
      id v10 = v4;
      NSUInteger v2 = (objc_class *)objc_opt_class();
      objc_super v7 = NSStringFromClass(v2);
      uint64_t v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_2_BaseImplementation;
}

void __76__UICollectionViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityRowRange);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_2_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log  = v11;
      os_log_type_t type = v10;
      objc_super v7 = NSStringFromSelector(sel_accessibilityRowRange);
      int v3 = v7;
      uint64_t v9 = v3;
      NSUInteger v2 = (objc_class *)objc_opt_class();
      int v6 = NSStringFromClass(v2);
      uint64_t v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (BOOL)accessibilityScrollToVisible
{
  v104  = self;
  v103[1]  = (id)a2;
  id v2 = (id)AXRetainAutorelease();
  v103[0]  = (id)[(UICollectionViewCellAccessibility *)v104 _accessibilityParentView];
  v102  = [(UICollectionViewCellAccessibility *)v104 _accessibilityParentCollectionView];
  objc_opt_class();
  v100  = 0;
  v56  = 1;
  if (objc_opt_isKindOfClass())
  {
    v101  = -[UICollectionViewCellAccessibility _accessibilityParentScrollView](v104);
    v100  = 1;
    v56  = v101 != v102;
  }
  if (v100) {

  }
  if (v56)
  {
    v105  = 0;
    v99  = 1;
  }
  else if ([v102 _accessibilityShouldAvoidScrollingCollectionViewCells])
  {
    v105  = 0;
    v99  = 1;
  }
  else
  {
    v98  = (id)[v102 indexPathsForVisibleItems];
    v97  = (id)[v102 indexPathForCell:v104];
    if (v97)
    {
      v96  = 0;
      v95[8]  = 0;
      v54  = (id)[(UICollectionViewCellAccessibility *)v104 safeValueForKey:@"window"];
      id v3 = (id)AXUIKeyboardWindow();
      v55  = v54 == v3;

      *(void *)v95  = v55;
      v94  = 0;
      if (!v55 && (_UIAXObjectIsBehindKeyboard() & 1) != 0)
      {
        v96  = 1;
        v94  = 1;
      }
      if ((v94 & 1) == 0)
      {
        v53  = (id)[v102 safeValueForKey:@"visibleBounds"];
        [v53 rectValue];
        v93.origin.x  = v4;
        v93.origin.y  = v5;
        v93.size.width  = v6;
        v93.size.height  = v7;

        [v102 _accessibilityVisibleContentInset];
        v89  = v8;
        v90  = v9;
        v91  = v10;
        v92  = v11;
        v88.origin.x  = UIEdgeInsetsInsetRect(v93.origin.x, v93.origin.y, v93.size.width, v93.size.height, v8, v9);
        v88.origin.y  = v12;
        v88.size.width  = v13;
        v88.size.height  = v14;
        v93  = v88;
        [(UICollectionViewCellAccessibility *)v104 bounds];
        v83  = v15;
        v84  = v16;
        v85  = v17;
        v86  = v18;
        v87  = v17 * 1.5;
        [(UICollectionViewCellAccessibility *)v104 bounds];
        v78  = v19;
        v79  = v20;
        v80  = v21;
        v81  = v22;
        v82  = v22 * 1.5;
        [v103[0] frame];
        rect2.origin.x  = v23;
        rect2.origin.y  = v24;
        rect2.size.width  = v25;
        rect2.size.height  = v26;
        if (!CGRectContainsRect(v88, rect2))
        {
          MaxY  = CGRectGetMaxY(rect2);
          v109  = MaxY - CGRectGetMinY(v93);
          if (fabs(v109) > v82 || (MinY  = CGRectGetMinY(rect2), v108  = MinY - CGRectGetMaxY(v93), fabs(v108) > v82))
          {
            [v102 contentSize];
            v75  = v27;
            v76  = v28;
            if (v93.size.height < v28)
            {
              v96  = 2;
              v94  = 1;
            }
          }
          MaxX  = CGRectGetMaxX(rect2);
          v107  = MaxX - CGRectGetMinX(v93);
          if (fabs(v107) > v87 || (MinX  = CGRectGetMinX(rect2), v106  = MinX - CGRectGetMaxX(v93), fabs(v106) > v87))
          {
            [v102 contentSize];
            v73  = v29;
            v74  = v30;
            if (v93.size.width < v29)
            {
              *(void *)&v95[1]  = 16;
              v94  = 1;
            }
          }
        }
      }
      v72  = [v98 count];
      if ((v94 & 1) != 0 || v72 != 1)
      {
        v71  = [v102 numberOfSections];
        if ([v97 section] < v71
          && v71
          && (v48  = [v97 item],
              v48 < objc_msgSend(v102, "numberOfItemsInSection:", objc_msgSend(v97, "section"))))
        {
          if (*(void *)&v95[1] || v96)
          {
            v70  = [(UICollectionViewCellAccessibility *)v104 _accessibilityCollectionViewCellScrollShouldInformScrollDelegate] & 1;
            v69  = (id)[v102 delegate];
            if (v70 & 1) != 0 && (objc_opt_respondsToSelector()) {
              [v69 scrollViewWillBeginDragging:v102];
            }
            [v102 scrollToItemAtIndexPath:v97 atScrollPosition:*(void *)&v95[1] | v96 animated:0];
            v47  = (id)[v102 safeValueForKey:@"visibleBounds"];
            [v47 rectValue];
            rect1.origin.x  = v31;
            rect1.origin.y  = v32;
            rect1.size.width  = v33;
            rect1.size.height  = v34;

            [v102 _accessibilityVisibleContentInset];
            v64  = v35;
            v65  = v36;
            v66  = v37;
            v67  = v38;
            v63.origin.x  = UIEdgeInsetsInsetRect(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v35, v36);
            v63.origin.y  = v39;
            v63.size.width  = v40;
            v63.size.height  = v41;
            rect1  = v63;
            [v103[0] frame];
            v62.origin.x  = v42;
            v62.origin.y  = v43;
            v62.size.width  = v44;
            v62.size.height  = v45;
            if (!CGRectContainsRect(v63, v62) && !CGRectContainsRect(v62, rect1)) {
              objc_msgSend(v102, "scrollRectToVisible:animated:", 0, v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
            }
            v60  = v70 & 1;
            v57  = v69;
            v58  = v102;
            v61  = v95[0] & 1;
            v59  = v104;
            AXPerformBlockOnMainThreadAfterDelay();
            v105  = 1;
            v99  = 1;
            objc_storeStrong((id *)&v59, 0);
            objc_storeStrong(&v58, 0);
            objc_storeStrong(&v57, 0);
            objc_storeStrong(&v69, 0);
          }
          else
          {
            v105  = 0;
            v99  = 1;
          }
        }
        else
        {
          v105  = 0;
          v99  = 1;
        }
      }
      else
      {
        v105  = 0;
        v99  = 1;
      }
    }
    else
    {
      v105  = 0;
      v99  = 1;
    }
    objc_storeStrong(&v97, 0);
    objc_storeStrong(&v98, 0);
  }
  objc_storeStrong(&v102, 0);
  objc_storeStrong(v103, 0);
  return v105 & 1;
}

void __65__UICollectionViewCellAccessibility_accessibilityScrollToVisible__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) & 1) != 0 && (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) scrollViewDidEndDragging:*(void *)(a1 + 40) willDecelerate:0];
  }
  if (*(unsigned char *)(a1 + 56) & 1) != 0 && (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) scrollViewWillBeginDecelerating:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 56) & 1) != 0 && (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) scrollViewDidEndDecelerating:*(void *)(a1 + 40)];
  }
  char v5 = 0;
  char v3 = 0;
  LOBYTE(v1)  = 0;
  if ((*(unsigned char *)(a1 + 57) & 1) == 0)
  {
    id v6 = (id)[*(id *)(a1 + 48) _accessibilityWindow];
    char v5 = 1;
    id v4 = (id)[v6 firstResponder];
    char v3 = 1;
    int v1 = [v4 _accessibilityIsDescendantOfElement:*(void *)(a1 + 48)] ^ 1;
  }
  if (v3) {

  }
  if (v5) {
  if (v1)
  }
    _UIAXDismissKeyboardIfNecessary();
}

- (BOOL)_accessibilityIsOutsideParentBounds
{
  CGFloat v12 = self;
  v11[1]  = (id)a2;
  v11[0]  = (id)[(UICollectionViewCellAccessibility *)self accessibilityContainer];
  id v7 = (id)[v11[0] window];
  [v7 accessibilityFrame];
  CGRect v10 = CGRectInset(v13, 0.0, 40.0);
  [(UICollectionViewCellAccessibility *)v12 accessibilityFrame];
  rect2.origin.x  = v2;
  rect2.origin.y  = v3;
  rect2.size.width  = v4;
  rect2.size.height  = v5;
  BOOL v8 = !CGRectContainsRect(v10, rect2);

  objc_storeStrong(v11, 0);
  return v8;
}

- (id)accessibilityDragSourceDescriptors
{
  v27[1]  = *MEMORY[0x263EF8340];
  CGFloat v25 = self;
  v24[1]  = (id)a2;
  v24[0]  = (id)[(UICollectionViewCellAccessibility *)self accessibilityUserDefinedDragSourceDescriptors];
  if (v24[0])
  {
    id v26 = v24[0];
    int v23 = 1;
  }
  else
  {
    id v22 = [(UICollectionViewCellAccessibility *)v25 _accessibilityParentCollectionView];
    char v20 = 0;
    id v11 = (id)[v22 safeValueForKeyPath:@"_dragAndDropController.sourceController"];
    id v19 = (id)__UIAccessibilitySafeClass();

    id v18 = v19;
    objc_storeStrong(&v19, 0);
    id v21 = v18;
    if (v18)
    {
      char v16 = 0;
      objc_opt_class();
      id v15 = (id)__UIAccessibilityCastAsClass();
      id v14 = v15;
      objc_storeStrong(&v15, 0);
      id v17 = v14;
      [v14 bounds];
      UIRectGetCenter();
      objc_msgSend(v14, "convertPoint:toView:", v22, v2, v3);
      double v12 = v4;
      double v13 = v5;
      id v8 = objc_alloc(MEMORY[0x263F1C3B8]);
      id v10 = accessibilityLocalizedString(@"drag.collection.view.cell");
      id v9 = (id)objc_msgSend(v8, "initWithName:point:inView:", v12, v13);
      v27[0]  = v9;
      id v26 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];

      int v23 = 1;
      objc_storeStrong(&v17, 0);
    }
    else
    {
      id v26 = 0;
      int v23 = 1;
    }
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(v24, 0);
  id v6 = v26;

  return v6;
}

- (id)accessibilityDropPointDescriptors
{
  v27[1]  = *MEMORY[0x263EF8340];
  CGFloat v25 = self;
  v24[1]  = (id)a2;
  v24[0]  = (id)[(UICollectionViewCellAccessibility *)self accessibilityUserDefinedDropPointDescriptors];
  if (v24[0])
  {
    id v26 = v24[0];
    int v23 = 1;
  }
  else
  {
    id v22 = [(UICollectionViewCellAccessibility *)v25 _accessibilityParentCollectionView];
    char v20 = 0;
    id v11 = (id)[v22 safeValueForKey:@"dragAndDropController"];
    id v19 = (id)__UIAccessibilitySafeClass();

    id v18 = v19;
    objc_storeStrong(&v19, 0);
    id v21 = v18;
    if (v18)
    {
      char v16 = 0;
      objc_opt_class();
      id v15 = (id)__UIAccessibilityCastAsClass();
      id v14 = v15;
      objc_storeStrong(&v15, 0);
      id v17 = v14;
      [v14 bounds];
      UIRectGetCenter();
      objc_msgSend(v14, "convertPoint:toView:", v22, v2, v3);
      double v12 = v4;
      double v13 = v5;
      id v8 = objc_alloc(MEMORY[0x263F1C3B8]);
      id v10 = accessibilityLocalizedString(@"drop.collection.view.cell.onto");
      id v9 = (id)objc_msgSend(v8, "initWithName:point:inView:", v12, v13);
      v27[0]  = v9;
      id v26 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];

      int v23 = 1;
      objc_storeStrong(&v17, 0);
    }
    else
    {
      id v26 = 0;
      int v23 = 1;
    }
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(v24, 0);
  id v6 = v26;

  return v6;
}

- (BOOL)isAccessibilityElement
{
  id v11 = self;
  SEL v10 = a2;
  id v2 = (id)[(UICollectionViewCellAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v8 = v2 == 0;

  if (v8)
  {
    id v5 = (id)[(UICollectionViewCellAccessibility *)v11 safeValueForKey:@"contentConfiguration"];
    id v4 = (id)[v5 accessibilityLabel];
    BOOL v6 = [v4 length] == 0;

    if (v6)
    {
      v9.receiver  = v11;
      v9.super_class  = (Class)UICollectionViewCellAccessibility;
      return [(UICollectionViewCellAccessibility *)&v9 isAccessibilityElement];
    }
    else
    {
      return 1;
    }
  }
  else
  {
    id v7 = (id)[(UICollectionViewCellAccessibility *)v11 isAccessibilityUserDefinedElement];
    BOOL v12 = [v7 BOOLValue] & 1;
  }
  return v12;
}

- (BOOL)_isEligibleForFocusInteraction
{
  BOOL v12 = self;
  SEL v11 = a2;
  char v10 = 0;
  v9.receiver  = self;
  v9.super_class  = (Class)UICollectionViewCellAccessibility;
  char v10 = [(UICollectionViewCellAccessibility *)&v9 _isEligibleForFocusInteraction];
  char v4 = 0;
  LOBYTE(v3)  = 0;
  if ([(UICollectionViewCellAccessibility *)v12 _accessibilityIsFKARunningForFocusItem])
  {
    LOBYTE(v3)  = 0;
    if (v10)
    {
      char v8 = 0;
      objc_opt_class();
      id v7 = (id)__UIAccessibilityCastAsClass();
      id v6 = v7;
      objc_storeStrong(&v7, 0);
      id v5 = v6;
      char v4 = 1;
      int v3 = [v6 isUserInteractionEnabled] ^ 1;
    }
  }
  if (v4) {

  }
  if (v3) {
    char v10 = 0;
  }
  return v10 & 1;
}

- (void)_setPopupMenuButton:(id)a3
{
  id v18 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  v16.receiver  = v18;
  v16.super_class  = (Class)UICollectionViewCellAccessibility;
  [(UICollectionViewCellAccessibility *)&v16 _setPopupMenuButton:location[0]];
  objc_initWeak(&v15, location[0]);
  id v4 = objc_loadWeakRetained(&v15);
  uint64_t v5 = [v4 accessibilityTraits];

  id v14 = (void *)v5;
  objc_initWeak(v13, v18);
  id v3 = location[0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  objc_super v9 = __57__UICollectionViewCellAccessibility__setPopupMenuButton___block_invoke;
  char v10 = &unk_2650AEBE0;
  objc_copyWeak(&v11, v13);
  objc_copyWeak(v12, &v15);
  v12[1]  = v14;
  [v3 _setAccessibilityTraitsBlock:&v6];
  objc_destroyWeak(v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_storeStrong(location, 0);
}

uint64_t __57__UICollectionViewCellAccessibility__setPopupMenuButton___block_invoke(uint64_t a1)
{
  WeakRetained  = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = 0;
  LOBYTE(v4)  = 0;
  if ([WeakRetained _accessibilityIsUserInteractionEnabled])
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    char v5 = 1;
    int v4 = [v6 _accessibilityIsUserInteractionEnabled] ^ 1;
  }
  if (v5) {

  }
  if (v4) {
    return *(void *)(a1 + 48) & ~*MEMORY[0x263F1CF20];
  }
  else {
    return *(void *)(a1 + 48);
  }
}

- (BOOL)canBecomeFocused
{
  id v15 = self;
  SEL v14 = a2;
  char v13 = 0;
  v12.receiver  = self;
  v12.super_class  = (Class)UICollectionViewCellAccessibility;
  char v13 = [(UICollectionViewCellAccessibility *)&v12 canBecomeFocused];
  if (([(UICollectionViewCellAccessibility *)v15 _accessibilityIsFKARunningForFocusItem] & 1) == 0)
  {
LABEL_16:
    char v16 = v13 & 1;
    return v16 & 1;
  }
  id v2 = (id)[(UICollectionViewCellAccessibility *)v15 storedAccessibilityRespondsToUserInteraction];
  BOOL v10 = v2 == 0;

  if (v10)
  {
    if ((v13 & 1) == 0
      && ([(UICollectionViewCellAccessibility *)v15 accessibilityRespondsToUserInteraction] & 1) != 0)
    {
      id v18 = (dispatch_once_t *)&canBecomeFocused_onceToken;
      id location = 0;
      objc_storeStrong(&location, &__block_literal_global_507);
      if (*v18 != -1) {
        dispatch_once(v18, location);
      }
      objc_storeStrong(&location, 0);
      id v3 = (objc_class *)objc_opt_class();
      BOOL v11 = class_getInstanceMethod(v3, sel_accessibilityRespondsToUserInteraction) != (Method)canBecomeFocused_accessibilityRespondsToUserInteractionBaseMethod;
      id v4 = (id)[(UICollectionViewCellAccessibility *)v15 storedAccessibilityRespondsToUserInteraction];
      BOOL v7 = v4 != 0;

      BOOL v8 = 1;
      if (!v11)
      {
        BOOL v8 = 1;
        if (!v7)
        {
          BOOL v8 = 1;
          if (([(UICollectionViewCellAccessibility *)v15 safeBoolForKey:@"_accessibilityRespondsToUserInteraction"] & 1) == 0)BOOL v8 = [(UICollectionViewCellAccessibility *)v15 accessibilityTraits] != 0; {
        }
          }
      }
      char v13 = v8;
    }
    if (v13)
    {
      char v13 = !-[UICollectionViewCellAccessibility _axContentViewHasSingleFocusableSubview](v15);
      if (v13)
      {
        id v5 = (id)[(UICollectionViewCellAccessibility *)v15 _accessibilityFindSubviewDescendant:&__block_literal_global_512];
        char v13 = v5 == 0;
      }
    }
    goto LABEL_16;
  }
  id v9 = (id)[(UICollectionViewCellAccessibility *)v15 storedAccessibilityRespondsToUserInteraction];
  char v16 = [v9 BOOLValue] & 1;

  return v16 & 1;
}

Method __53__UICollectionViewCellAccessibility_canBecomeFocused__block_invoke()
{
  v0  = (objc_class *)objc_opt_class();
  result  = class_getInstanceMethod(v0, sel_accessibilityRespondsToUserInteraction);
  canBecomeFocused_accessibilityRespondsToUserInteractionBaseMethod  = (uint64_t)result;
  return result;
}

- (BOOL)_axContentViewHasSingleFocusableSubview
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v22 = a1;
  if (a1)
  {
    id location = 0;
    id v20 = (id)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
    id v19 = (id)[v22 safeUIViewForKey:@"_contentView"];
    [v20 axSafelyAddObject:v19];
    do
    {
      if (![v20 count]) {
        break;
      }
      id v18 = (id)[v20 firstObject];
      [v20 removeObjectAtIndex:0];
      char v17 = 0;
      if (([v18 safeBoolForKey:@"_isEligibleForFocusInteraction"] & 1) != 0
        && (([v18 canBecomeFocused] & 1) != 0 || (objc_msgSend(v18, "isFocused") & 1) != 0))
      {
        objc_storeStrong(&location, v18);
        char v17 = 1;
      }
      else
      {
        memset(__b, 0, sizeof(__b));
        id obj = (id)[v18 subviews];
        uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
        if (v11)
        {
          uint64_t v7 = *(void *)__b[2];
          uint64_t v8 = 0;
          unint64_t v9 = v11;
          while (1)
          {
            if (*(void *)__b[2] != v7) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(id *)(__b[1] + 8 * v8);
            [v16 frame];
            double v13 = v1;
            double v14 = v2;
            [v18 frame];
            if (!__CGSizeEqualToSize_0(v13, v14, v3, v4)) {
              break;
            }
            [v20 addObject:v16];
            if (++v8 >= v9)
            {
              uint64_t v8 = 0;
              unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
              if (!v9) {
                break;
              }
            }
          }
        }
      }
      int v12 = (v17 & 1) != 0 ? 3 : 0;
      objc_storeStrong(&v18, 0);
    }
    while (!v12);
    BOOL v23 = location != 0;
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    return 0;
  }
  return v23;
}

uint64_t __53__UICollectionViewCellAccessibility_canBecomeFocused__block_invoke_2(void *a1, void *a2)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (_NSRange)_accessibilityIndexPathAsRange
{
  id location[2] = self;
  location[1]  = (id)a2;
  uint64_t v8 = 0x7FFFFFFFLL;
  uint64_t v7 = 0;
  uint64_t v9 = 0x7FFFFFFFLL;
  uint64_t v10 = 0;
  uint64_t v5 = 0x7FFFFFFFLL;
  uint64_t v6 = 0;
  location[0]  = [(UICollectionViewCellAccessibility *)self _accessibilityIndexPath];
  if (location[0])
  {
    uint64_t v5 = [location[0] item];
    uint64_t v6 = [location[0] section];
  }
  objc_storeStrong(location, 0);
  NSUInteger v2 = v5;
  NSUInteger v3 = v6;
  result.length  = v3;
  result.id location = v2;
  return result;
}

- (BOOL)_accessibilityIsInCollectionCell
{
  return 1;
}

@end