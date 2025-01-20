@interface CALayer(UIFocusConformance)
- (id)_preferredFocusRegionCoordinateSpace;
- (id)focusGroupIdentifier;
- (id)focusItemsInRect:()UIFocusConformance;
- (id)preferredFocusEnvironments;
- (uint64_t)_axAreChildrenFocused;
- (uint64_t)_axSetAreChildrenFocused:()UIFocusConformance;
- (uint64_t)_destroyFocusLayer;
- (uint64_t)_prefersFocusContainment;
- (uint64_t)_updateFocusLayerFrame;
- (uint64_t)areChildrenFocused;
- (uint64_t)canBecomeFocused;
- (uint64_t)conformsToProtocol:()UIFocusConformance;
- (uint64_t)coordinateSpace;
- (uint64_t)parentFocusEnvironment;
- (uint64_t)setAreChildrenFocused:()UIFocusConformance;
- (uint64_t)shouldUpdateFocusInContext:()UIFocusConformance;
- (void)didUpdateFocusInContext:()UIFocusConformance withAnimationCoordinator:;
- (void)setNeedsFocusUpdate;
- (void)updateFocusIfNeeded;
@end

@implementation CALayer(UIFocusConformance)

- (uint64_t)_axAreChildrenFocused
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (uint64_t)_axSetAreChildrenFocused:()UIFocusConformance
{
  return __UIAccessibilitySetAssociatedBool();
}

- (uint64_t)areChildrenFocused
{
  return objc_msgSend(a1, "_axAreChildrenFocused", a2, a1) & 1;
}

- (uint64_t)setAreChildrenFocused:()UIFocusConformance
{
  return [a1 _axSetAreChildrenFocused:a3 & 1];
}

- (id)preferredFocusEnvironments
{
  return MEMORY[0x263EFFA68];
}

- (uint64_t)parentFocusEnvironment
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_8, 0, a2, a1);
}

- (id)focusGroupIdentifier
{
  id v11 = a1;
  location[1] = a2;
  v9.receiver = a1;
  v9.super_class = (Class)CALayer_0;
  location[0] = objc_msgSendSuper2(&v9, sel_focusGroupIdentifier);
  char v7 = 0;
  char v5 = 0;
  BOOL v4 = 0;
  if (!location[0])
  {
    id v8 = (id)[v11 _accessibilityParentView];
    char v7 = 1;
    id v6 = (id)[v8 safeValueForKey:@"_containingScrollView"];
    char v5 = 1;
    BOOL v4 = v6 == 0;
  }
  if (v5) {

  }
  if (v7) {
  if (v4)
  }
    id v12 = (id)[v11 _accessibilityDefaultFocusGroupIdentifier];
  else {
    id v12 = location[0];
  }
  objc_storeStrong(location, 0);
  v2 = v12;

  return v2;
}

- (void)setNeedsFocusUpdate
{
  id v3 = a1;
  v2[1] = a2;
  v2[0] = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:a1];
  [v2[0] requestFocusUpdateToEnvironment:v3];
  [v3 _updateFocusLayerFrame];
  objc_storeStrong(v2, 0);
}

- (void)updateFocusIfNeeded
{
  id v3 = a1;
  v2[1] = a2;
  v2[0] = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:a1];
  [v2[0] updateFocusIfNeeded];
  [v3 _updateFocusLayerFrame];
  objc_storeStrong(v2, 0);
}

- (uint64_t)shouldUpdateFocusInContext:()UIFocusConformance
{
  id location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)didUpdateFocusInContext:()UIFocusConformance withAnimationCoordinator:
{
  id v15 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v5 = v13;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  objc_super v9 = __80__CALayer_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v10 = &unk_2650ADFB0;
  id v11 = location[0];
  id v12 = v15;
  objc_msgSend(v5, "addCoordinatedAnimations:completion:");
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (uint64_t)_destroyFocusLayer
{
  return objc_msgSend(MEMORY[0x263F1C648], "removeRingFromFocusItem:", a1, a2, a1);
}

- (uint64_t)_updateFocusLayerFrame
{
  return objc_msgSend(MEMORY[0x263F1C648], "updateRingForFocusItem:", a1, a2, a1);
}

- (uint64_t)canBecomeFocused
{
  char v2 = 0;
  if ([a1 isAccessibilityElement]) {
    char v2 = [a1 accessibilityRespondsToUserInteraction];
  }
  return v2 & 1;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  id v3 = (id)[a1 _accessibilityParentView];
  id v2 = (id)[v3 _screen];
  id v4 = (id)[v2 coordinateSpace];

  return v4;
}

- (id)focusItemsInRect:()UIFocusConformance
{
  double v27 = a3;
  double v28 = a4;
  double v29 = a5;
  double v30 = a6;
  id v26 = a1;
  v25[1] = a2;
  v25[0] = 0;
  id v24 = (id)[a1 accessibilityElements];
  if (v24)
  {
    id v13 = v24;
    id v12 = (void *)MEMORY[0x263F08A98];
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    v21 = __48__CALayer_UIFocusConformance__focusItemsInRect___block_invoke;
    v22 = &unk_2650AE558;
    id v23 = v26;
    id v14 = (id)[v12 predicateWithBlock:&v18];
    id v6 = (id)objc_msgSend(v13, "filteredArrayUsingPredicate:");
    id v7 = v25[0];
    v25[0] = v6;

    objc_storeStrong(&v23, 0);
  }
  else if ([v26 accessibilityElementCount] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id obj = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v26, "accessibilityElementCount"));
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v11 = i;
      if (v11 >= [v26 accessibilityElementCount]) {
        break;
      }
      id v15 = (id)[v26 accessibilityElementAtIndex:i];
      if ([v15 conformsToProtocol:&unk_26F4908D0])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([v26 _accessibilityFKAShouldIncludeViewsAsElements] & 1) != 0)
        {
          [obj axSafelyAddObject:v15];
        }
      }
      objc_storeStrong(&v15, 0);
    }
    objc_storeStrong(v25, obj);
    objc_storeStrong(&obj, 0);
  }
  if (v25[0]) {
    id v8 = v25[0];
  }
  else {
    id v8 = MEMORY[0x263EFFA68];
  }
  id v10 = v8;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);

  return v10;
}

- (uint64_t)_prefersFocusContainment
{
  char v2 = 1;
  if (([a1 conformsToProtocol:&unk_26F4AA928] & 1) == 0)
  {
    char v2 = 1;
    if (([a1 _accessibilityIsTouchContainer] & 1) == 0) {
      char v2 = [a1 shouldGroupAccessibilityChildren];
    }
  }
  return v2 & 1;
}

- (uint64_t)coordinateSpace
{
  return objc_msgSend(a1, "_accessibilityParentView", a2, a1);
}

- (uint64_t)conformsToProtocol:()UIFocusConformance
{
  id v7 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  if (location[0] == &unk_26F4908D0
    || location[0] == &unk_26F490598
    || location[0] == &unk_26F490A08
    || location[0] == &unk_26F490EF8)
  {
    char v8 = 1;
    int v5 = 1;
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)CALayer_0;
    char v8 = objc_msgSendSuper2(&v4, sel_conformsToProtocol_, location[0]) & 1;
    int v5 = 1;
  }
  objc_storeStrong(location, 0);
  return v8 & 1;
}

@end