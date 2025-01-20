@interface UICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDescendantElementAtIndexPathIsValid:(id)a3;
- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused;
- (BOOL)_accessibilityHasOrderedChildren;
- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly;
- (BOOL)_accessibilityKeyCommandsShouldOverrideKeyCommands;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)_accessibilityOverridesContainerProtocol;
- (BOOL)_accessibilityShouldAvoidScrollingCollectionViewCells;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (BOOL)_accessibilityShouldUseCollectionViewCellAccessibilityElements;
- (BOOL)_accessibilitySpeakThisShouldOnlyIncludeVisibleElements;
- (BOOL)_reuseCell:(id)a3 notifyDidEndDisplaying:(BOOL)a4;
- (BOOL)_reuseSupplementaryView:(id)a3;
- (BOOL)_shouldSelectionFollowFocusForIndexPath:(id)a3 initiatedBySelection:(BOOL)a4;
- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility;
- (BOOL)accessibilityShouldSpeakItemReorderEvents;
- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (CGRect)_accessibilityBoundsOfCellsToLoad;
- (CGRect)_visibleBounds;
- (id)_accessibilityCollectionViewSupplementaryViews;
- (id)_accessibilityFuzzyHitTest:(CGPoint *)a3 withEvent:(id)a4;
- (id)_accessibilityGroupIdentifier;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityIndexPathOfDirectSubviewForDescendantElement:(id)a3 withElementKind:(id *)a4;
- (id)_accessibilityIndexPathToOtherCollectionViewItems;
- (id)_accessibilityLayoutAttributesForSupplementaryHeaderViewAtIndexPath:(id)a3;
- (id)_accessibilityOpaqueHeaderElementInDirection:(int64_t)a3 childElement:(id)a4;
- (id)_accessibilityOtherCollectionViewItems;
- (id)_accessibilityReusableViewForOpaqueElement:(id)a3;
- (id)_accessibilityRoleDescription;
- (id)_accessibilityScannerGroupElements;
- (id)_accessibilityScannerGroupElementsGroupedByRow;
- (id)_accessibilitySelectedChildren;
- (id)_accessibilitySortedElementsWithin;
- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3;
- (id)_accessibilitySortedViewChildrenWithOptions:(void *)a1;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViewAtIndexPath:(id)a3;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers;
- (id)_accessibilityUserTestingVisibleCells;
- (id)_axFirstLastOpaqueHeaderElementFromSection:(int64_t)a3 options:(id)a4 direction:(int64_t)a5;
- (id)_axFirstLastOpaqueHeaderElementInDirection:(int64_t)a3 options:(id)a4;
- (id)_axIndexBar;
- (id)_axIndexPathForGlobalRow:(void *)a1;
- (id)_axOffScreenOpaqueHeaderElementInDirection:(int64_t)a3 options:(id)a4 childElement:(id)a5;
- (id)_axOpaqueHeaderElementInDirection:(int64_t)a3 withinElements:(id)a4 startIndex:(unint64_t)a5;
- (id)_axSpeakItemReorderEvents;
- (id)_dequeueReusableViewOfKind:(id)a3 withIdentifier:(id)a4 forIndexPath:(id)a5 viewCategory:(unint64_t)a6;
- (id)_fulfillPromisedFocusRegionForCell:(id)a3;
- (id)accessibilityCellForRowAtIndexPath:(id)a3;
- (id)accessibilityCollectionCellElementForIndexPath:(id)a3;
- (id)accessibilityComparatorForSorting;
- (id)accessibilityCreatePrepareCellForIndexPath:(id)a3;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityElementForRow:(unint64_t)a3 andColumn:(unint64_t)a4;
- (id)accessibilityLabel;
- (id)axData;
- (id)preferredFocusedView;
- (int64_t)accessibilityContainerType;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (uint64_t)_accessibilityShouldDisableCellReuse;
- (uint64_t)_axGetShouldIgnorePromiseRegions;
- (uint64_t)_axGlobalRowForIndexPath:(void *)a1;
- (uint64_t)_axIsReorderingItems;
- (uint64_t)_axSetIsReorderingItems:(uint64_t)result;
- (uint64_t)_axSetShouldIgnorePromiseRegions:(uint64_t)result;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)_accessibilityScanningBehaviorTraits;
- (unint64_t)accessibilitySemanticGroupChildrentCount;
- (void)_accessibilityCollectionViewUpdateVisibleCells;
- (void)_accessibilityEnsureViewsAroundAreLoaded;
- (void)_accessibilityInitializeInternalData:(void *)a1;
- (void)_accessibilityPostReorderingAnnouncementForCurrentIndexPath:(id)a3 targetIndexPath:(id)a4 previousIndexPath:(id)a5;
- (void)_axHandleReusedView:(void *)a1;
- (void)_axResetData;
- (void)_axSetSpeakItemReorderEvents:(uint64_t)a1;
- (void)cancelInteractiveMovement;
- (void)deleteItemsAtIndexPaths:(id)a3;
- (void)deleteSections:(id)a3;
- (void)endInteractiveMovement;
- (void)insertItemsAtIndexPaths:(id)a3;
- (void)insertSections:(id)a3;
- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4;
- (void)reloadData;
- (void)reloadItemsAtIndexPaths:(id)a3;
- (void)reloadSections:(id)a3;
- (void)setAccessibilityComparatorForSorting:(id)a3;
- (void)setAccessibilityShouldBypassCollectionViewAccessibility:(BOOL)a3;
- (void)setAccessibilityShouldSpeakItemReorderEvents:(BOOL)a3;
@end

@implementation UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axSpeakItemReorderEvents
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UICollectionViewAccessibility___axSpeakItemReorderEvents);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_axSetSpeakItemReorderEvents:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (uint64_t)_axIsReorderingItems
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_axSetIsReorderingItems:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v18 = location;
  id v17 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UICollectionViewListSwipeActionsView"];
  [location[0] validateClass:@"UIIndexBarAccessoryView"];
  v14 = "@";
  v12 = @"UICollectionView";
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "@", 0);
  v4 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_ensureViewsAreLoadedInRect:", v7, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  uint64_t v3 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_dequeueReusableViewOfKind: withIdentifier: forIndexPath: viewCategory:", v14, v14, v14, "Q", 0);
  v16 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_createPreparedCellForItemAtIndexPath: withLayoutAttributes: applyAttributes:", v14, v14, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_updateVisibleCellsNow:", v3, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_visibleBounds", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_reuseCell:notifyDidEndDisplaying:", v14, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_reuseSupplementaryView:", v16, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_moveItemAtIndexPath:toIndexPath:", v7, v14, v14, 0);
  [location[0] validateClass:v12 hasInstanceVariable:@"_subviewManager" withType:"_UICollectionViewSubviewManager"];
  v13 = "NSMutableDictionary";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", @"_UICollectionViewSubviewManager", @"_reuseQueues");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"reloadItemsAtIndexPaths:", v7, v14, 0);
  v15 = @"UICollectionReusableView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"collectionViewLayout", v14, 0);
  v5 = "q";
  [location[0] validateClass:@"UICollectionViewFlowLayout" hasInstanceMethod:@"scrollDirection" withFullSignature:0];
  v8 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v12);
  [location[0] validateClass:@"UISwipeActionPullView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"isFocused", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_isFocusedOrAncestorOfFocusedView", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"preferredFocusedView", v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"canBecomeFocused", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"beginInteractiveMovementForItemAtIndexPath:", v16, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_fulfillPromisedFocusRegionForCell:", v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"endInteractiveMovement", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"cancelInteractiveMovement", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_globalIndexPathForItemAtIndexPath:", v5, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_indexPathForGlobalIndex:", v14, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_indexPathBeforeShadowUpdatesForIndexPath:", v14, 0);
  v6 = @"UIResponder";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v12);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"canResignFirstResponder", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"becomeFirstResponder", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"pressesBegan:withEvent:", v7, v14, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"pressesEnded:withEvent:", v7, v14, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"pressesCancelled:withEvent:", v7, v14, v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"_shouldSelectionFollowFocusForIndexPath:initiatedBySelection:", v14, v16, 0);
  v10 = @"UIScrollView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v12);
  v9 = @"UILayoutContainerView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UISplitViewControllerPanelImplView" isKindOfClass:v9];
  v11 = "UIView<_UIScrollViewScrollIndicator>";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v10, @"_verticalScrollIndicator");
  [location[0] validateClass:v10 hasInstanceVariable:@"_horizontalScrollIndicator" withType:v11];
  [location[0] validateClass:v12 hasInstanceVariable:@"_supplementaryViewClassDict" withType:v13];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, @"_isStyledAsHeaderOrFooterFromLayoutAttributes:", v16, v14, 0);
  objc_storeStrong(v18, v17);
}

- (BOOL)accessibilityShouldSpeakItemReorderEvents
{
  id v2 = -[UICollectionViewAccessibility _axSpeakItemReorderEvents](self);
  BOOL v5 = v2 != 0;

  if (!v5) {
    return -[UICollectionViewAccessibility _axIsReorderingItems]((uint64_t)self) & 1;
  }
  id v4 = -[UICollectionViewAccessibility _axSpeakItemReorderEvents](self);
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (void)setAccessibilityShouldSpeakItemReorderEvents:(BOOL)a3
{
  id v4 = (id)[NSNumber numberWithBool:a3];
  -[UICollectionViewAccessibility _axSetSpeakItemReorderEvents:]((uint64_t)self, v4);
}

- (unint64_t)_accessibilityAutomationType
{
  return 32;
}

- (id)accessibilityComparatorForSorting
{
  return (id)[(UICollectionViewAccessibility *)self _accessibilityValueForKey:@"accessibilityComparatorForSorting", a2, self];
}

- (void)setAccessibilityComparatorForSorting:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = v6;
  id v4 = (id)MEMORY[0x2455E7040](location[0]);
  -[UICollectionViewAccessibility _accessibilitySetRetainedValue:forKey:](v3, "_accessibilitySetRetainedValue:forKey:");

  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UICollectionViewAccessibility *)self _accessibilityValueForKey:@"shouldBypassCollectionViewAX"];
  if (location[0]) {
    char v4 = [location[0] BOOLValue] & 1;
  }
  else {
    char v4 = 0;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)setAccessibilityShouldBypassCollectionViewAccessibility:(BOOL)a3
{
}

- (BOOL)_accessibilityShouldUseCollectionViewCellAccessibilityElements
{
  if ([(UICollectionViewAccessibility *)self _accessibilityFauxCollectionViewCellsDisabled])return 0; {
  if (AXDoesRequestingClientDeserveAutomation()
  }
    && !_AXSAutomationFauxCollectionViewCellsEnabled())
  {
    return 0;
  }
  if (UIAccessibilityIsAppExtension()) {
    return 0;
  }
  LOBYTE(v3) = 0;
  if (AXDoesRequestingClientDeserveAutomation()) {
    int v3 = ![(UICollectionViewAccessibility *)self accessibilityCollectionViewBehavesLikeUIViewAccessibility];
  }
  return v3 & 1;
}

- (unint64_t)accessibilitySemanticGroupChildrentCount
{
  v9[2] = self;
  v9[1] = (id)a2;
  char v8 = 0;
  objc_opt_class();
  id v7 = (id)__UIAccessibilityCastAsClass();
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  unint64_t v5 = [v6 numberOfSections];
  unint64_t v4 = 0;
  for (unint64_t i = 0; i < v5; ++i)
    v4 += [v9[0] numberOfItemsInSection:i];
  objc_storeStrong(v9, 0);
  return v4;
}

- (id)axData
{
  unint64_t v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(UICollectionViewAccessibility *)self _accessibilityValueForKey:@"AXCollectionViewData"];
  if (!v4[0])
  {
    v4[0] = objc_alloc_init(AXCollectionViewData);

    [(UICollectionViewAccessibility *)v5 _accessibilitySetRetainedValue:v4[0] forKey:@"AXCollectionViewData"];
    -[UICollectionViewAccessibility _accessibilityInitializeInternalData:](v5, v4[0]);
  }
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (void)_accessibilityInitializeInternalData:(void *)a1
{
  id v8 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    id v5 = v8;
    uint64_t v4 = [v5 numberOfSections];
    uint64_t v3 = 0;
    for (uint64_t i = 0; i < v4; ++i)
      v3 += [v5 numberOfItemsInSection:i];
    -[AXCollectionViewData setChildCount:]((uint64_t)location, v3);
    objc_storeStrong(&v5, 0);
    int v6 = 0;
  }
  else
  {
    int v6 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (void)_axResetData
{
  if (a1)
  {
    [a1 _accessibilityRemoveValueForKey:@"AXCollectionViewData"];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)reloadData
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v2 reloadData];
  -[UICollectionViewAccessibility _axResetData](v4);
}

- (void)insertSections:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v3 insertSections:location[0]];
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)deleteSections:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v3 deleteSections:location[0]];
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)reloadSections:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v3 reloadSections:location[0]];
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  id v8 = self;
  SEL v7 = a2;
  int64_t v6 = a3;
  int64_t v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v4 moveSection:a3 toSection:a4];
  -[UICollectionViewAccessibility _axResetData](v8);
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  int64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v3 insertItemsAtIndexPaths:location[0]];
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
  int64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v3 reloadItemsAtIndexPaths:location[0]];
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  int64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v3 deleteItemsAtIndexPaths:location[0]];
  -[UICollectionViewAccessibility _axResetData](v5);
  objc_storeStrong(location, 0);
}

- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3
{
  SEL v7 = self;
  SEL v6 = a2;
  id v5 = a3;
  -[UICollectionViewAccessibility _axSetIsReorderingItems:]((uint64_t)self);
  v4.receiver = v7;
  v4.super_class = (Class)UICollectionViewAccessibility;
  return [(UICollectionViewAccessibility *)&v4 beginInteractiveMovementForItemAtIndexPath:v5];
}

- (void)endInteractiveMovement
{
  objc_super v4 = self;
  SEL v3 = a2;
  -[UICollectionViewAccessibility _axSetIsReorderingItems:]((uint64_t)self);
  v2.receiver = v4;
  v2.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v2 endInteractiveMovement];
}

- (void)cancelInteractiveMovement
{
  objc_super v4 = self;
  SEL v3 = a2;
  -[UICollectionViewAccessibility _axSetIsReorderingItems:]((uint64_t)self);
  v2.receiver = v4;
  v2.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v2 cancelInteractiveMovement];
}

- (void)_accessibilityPostReorderingAnnouncementForCurrentIndexPath:(id)a3 targetIndexPath:(id)a4 previousIndexPath:(id)a5
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  uint64_t v12 = [v22 item];
  BOOL v20 = v12 < [v21 item];
  uint64_t v13 = [v22 section];
  if (v13 > [v21 section])
  {
    id v19 = v24;
    uint64_t v9 = objc_msgSend(v19, "numberOfItemsInSection:", objc_msgSend(v22, "section"));
    BOOL v20 = v9 != [v22 item];
    objc_storeStrong(&v19, 0);
  }
  id v18 = (id)[(UICollectionViewAccessibility *)v24 cellForItemAtIndexPath:location[0]];
  id v8 = (id)[v18 _accessibilityBriefLabel];
  char v15 = 0;
  if (v8)
  {
    id v5 = v8;
  }
  else
  {
    id v16 = (id)[v18 accessibilityLabel];
    char v15 = 1;
    id v5 = v16;
  }
  id v17 = v5;
  if (v15) {

  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21980]);
  if (v18 && v17)
  {
    SEL v6 = NSString;
    id v7 = (id)accessibilityUIKitLocalizedString();
    id v14 = (id)[v6 stringWithFormat:v17];

    UIAccessibilitySpeak();
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)_axHandleReusedView:(void *)a1
{
  id v6 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    id v3 = (id)[v6 _accessibilityOpaqueElementParent];
    if (!v3 && ([v6 isAccessibilityOpaqueElementProvider] & 1) != 0) {
      objc_storeStrong(&v3, v6);
    }
    objc_msgSend(v3, "_accessibilityDidReuseOpaqueElementView:", location, &v3);
    objc_storeStrong(v2, 0);
    int v4 = 0;
  }
  else
  {
    int v4 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_reuseCell:(id)a3 notifyDidEndDisplaying:(BOOL)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  char v8 = 0;
  v7.receiver = v11;
  v7.super_class = (Class)UICollectionViewAccessibility;
  char v8 = [(UICollectionViewAccessibility *)&v7 _reuseCell:location[0] notifyDidEndDisplaying:a4];
  -[UICollectionViewAccessibility _axHandleReusedView:](v11, location[0]);
  char v6 = v8;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)_reuseSupplementaryView:(id)a3
{
  char v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UICollectionViewAccessibility;
  char v6 = [(UICollectionViewAccessibility *)&v5 _reuseSupplementaryView:location[0]];
  -[UICollectionViewAccessibility _axHandleReusedView:](v8, location[0]);
  char v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_accessibilityUserTestingVisibleCells
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[(UICollectionViewAccessibility *)self safeValueForKey:@"indexPathsForVisibleItems"];
  id v13 = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = v14[0];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v6);
      id location = [(UICollectionViewAccessibility *)v15 accessibilityCollectionCellElementForIndexPath:v12];
      if (location) {
        [v13 addObject:location];
      }
      objc_storeStrong(&location, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v13;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);

  return v3;
}

- (void)_accessibilityCollectionViewUpdateVisibleCells
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  uint64_t v5 = __79__UICollectionViewAccessibility__accessibilityCollectionViewUpdateVisibleCells__block_invoke;
  uint64_t v6 = &unk_2650ADF18;
  v7[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
}

void __79__UICollectionViewAccessibility__accessibilityCollectionViewUpdateVisibleCells__block_invoke(id *a1)
{
  v1[2] = a1;
  v1[1] = a1;
  v1[0] = a1[4];
  [v1[0] _updateVisibleCellsNow:1];
  objc_storeStrong(v1, 0);
}

- (id)accessibilityCreatePrepareCellForIndexPath:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = v35;
  uint64_t v26 = 0;
  v27 = &v26;
  int v28 = 838860800;
  int v29 = 48;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
  id v32 = 0;
  v19[3] = (id)MEMORY[0x263EF8330];
  int v20 = -1073741824;
  int v21 = 0;
  id v22 = __76__UICollectionViewAccessibility_accessibilityCreatePrepareCellForIndexPath___block_invoke;
  v23 = &unk_2650ADF88;
  v25[1] = &v26;
  id v24 = v33;
  v25[0] = location[0];
  AXPerformSafeBlock();
  if (v27[5])
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    int v10 = 838860800;
    int v11 = 48;
    uint64_t v12 = __Block_byref_object_copy__6;
    id v13 = __Block_byref_object_dispose__6;
    id v14 = 0;
    v7[1] = &v8;
    id v6 = v33;
    v7[0] = location[0];
    v7[2] = &v26;
    AXPerformSafeBlock();
    id v5 = (id)v9[5];
    objc_storeStrong(v7, 0);
    objc_storeStrong(&v6, 0);
    _Block_object_dispose(&v8, 8);
    objc_storeStrong(&v14, 0);
    id v15 = v5;
    [(UICollectionViewAccessibility *)v35 _accessibilityCollectionViewUpdateVisibleCells];
    id v36 = v15;
    int v16 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v19[0] = (id)AXLogUIA();
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v19[0], OS_LOG_TYPE_ERROR))
    {
      id v4 = (id)[v33 safeValueForKey:@"_layout"];
      id v17 = v4;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v37, (uint64_t)v17, (uint64_t)location[0]);
      _os_log_error_impl(&dword_2402B7000, (os_log_t)v19[0], v18, "No layout attributes for %@ at %@", v37, 0x16u);

      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(v19, 0);
    id v36 = 0;
    int v16 = 1;
  }
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v24, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v36;
}

void __76__UICollectionViewAccessibility_accessibilityCreatePrepareCellForIndexPath___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_layout"];
  id v1 = (id)[v5 initialLayoutAttributesForAppearingItemAtIndexPath:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  int v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __76__UICollectionViewAccessibility_accessibilityCreatePrepareCellForIndexPath___block_invoke_516(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createPreparedCellForItemAtIndexPath:*(void *)(a1 + 40) withLayoutAttributes:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) applyAttributes:1];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  int v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UICollectionViewAccessibility *)self accessibilityUserDefinedOpaqueElementScrollsContentIntoView];
  if (location[0])
  {
    char v7 = [location[0] BOOLValue] & 1;
  }
  else
  {
    [(UICollectionViewAccessibility *)v6 _accessibilityContentSize];
    if (AX_CGSizeIsProbablyEmpty(v2, v3))
    {
      char v7 = 0;
    }
    else
    {
      [(UICollectionViewAccessibility *)v6 bounds];
      char v7 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (uint64_t)_accessibilityShouldDisableCellReuse
{
  if (a1) {
    char v2 = [a1 _accessibilityShouldUseCollectionViewCellAccessibilityElements] & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (id)_dequeueReusableViewOfKind:(id)a3 withIdentifier:(id)a4 forIndexPath:(id)a5 viewCategory:(unint64_t)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  unint64_t v29 = a6;
  if (-[UICollectionViewAccessibility _accessibilityShouldDisableCellReuse](v33))
  {
    id v17 = (id)[(UICollectionViewAccessibility *)v33 safeValueForKey:@"_subviewManager"];
    id v28 = (id)[v17 safeDictionaryForKey:@"_reuseQueues"];

    id v27 = (id)[v28 objectForKeyedSubscript:location[0]];
    id v26 = 0;
    if ([location[0] isEqualToString:@"UICollectionElementKindCell"])
    {
      objc_storeStrong(&v26, v31);
    }
    else
    {
      id v6 = (id)[NSString stringWithFormat:@"%@/%@", location[0], v31];
      id v7 = v26;
      id v26 = v6;
    }
    id v25 = (id)[v27 objectForKey:v26];
    memset(__b, 0, sizeof(__b));
    id v15 = v25;
    uint64_t v16 = [v15 countByEnumeratingWithState:__b objects:v34 count:16];
    if (v16)
    {
      uint64_t v12 = *(void *)__b[2];
      uint64_t v13 = 0;
      unint64_t v14 = v16;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(v15);
        }
        id v24 = *(id *)(__b[1] + 8 * v13);
        [v24 removeFromSuperview];
        ++v13;
        if (v11 + 1 >= v14)
        {
          uint64_t v13 = 0;
          unint64_t v14 = [v15 countByEnumeratingWithState:__b objects:v34 count:16];
          if (!v14) {
            break;
          }
        }
      }
    }

    [v27 removeAllObjects];
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  v21.receiver = v33;
  v21.super_class = (Class)UICollectionViewAccessibility;
  id v22 = [(UICollectionViewAccessibility *)&v21 _dequeueReusableViewOfKind:location[0] withIdentifier:v31 forIndexPath:v30 viewCategory:v29];
  if ([location[0] isEqualToString:*MEMORY[0x263F1D120]])
  {
    uint64_t v8 = [v22 accessibilityTraits];
    [v22 setAccessibilityTraits:v8 | *MEMORY[0x263F1CEF8]];
  }
  id v10 = v22;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);

  return v10;
}

- (id)accessibilityCellForRowAtIndexPath:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = v15;
  uint64_t v12 = [v13 numberOfSections];
  char v10 = 0;
  BOOL v7 = 1;
  if (location[0])
  {
    BOOL v7 = 1;
    if ([location[0] section] < v12)
    {
      uint64_t v6 = [location[0] item];
      BOOL v7 = 1;
      if (v6 < objc_msgSend(v13, "numberOfItemsInSection:", objc_msgSend(location[0], "section")))
      {
        uint64_t v5 = [location[0] item];
        id v11 = (id)[v13 dataSource];
        char v10 = 1;
        BOOL v7 = v5 >= objc_msgSend(v11, "collectionView:numberOfItemsInSection:", v13, objc_msgSend(location[0], "section"));
      }
    }
  }
  if (v10) {

  }
  if (v7)
  {
    id v16 = 0;
    int v9 = 1;
  }
  else
  {
    id v8 = (id)[v13 cellForItemAtIndexPath:location[0]];
    if (!v8)
    {
      id v8 = [(UICollectionViewAccessibility *)v15 accessibilityCreatePrepareCellForIndexPath:location[0]];

      [v8 layoutSubviews];
      [v8 removeFromSuperview];
    }
    id v16 = v8;
    int v9 = 1;
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  double v3 = v16;

  return v3;
}

- (id)accessibilityCollectionCellElementForIndexPath:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = [(UICollectionViewAccessibility *)v11 axData];
  id v7 = (id)-[AXCollectionViewData children]((uint64_t)v9);
  id v8 = (id)[v7 objectForKey:location[0]];

  if (!v8)
  {
    id v3 = objc_allocWithZone((Class)UICollectionViewCellAccessibilityElement);
    id v8 = (id)[v3 initWithAccessibilityContainer:v11];

    [v8 setIndexPath:location[0]];
    id v6 = (id)-[AXCollectionViewData children]((uint64_t)v9);
    [v6 setObject:v8 forKey:location[0]];
  }
  id v5 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (uint64_t)_axGlobalRowForIndexPath:(void *)a1
{
  id v19 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v19)
  {
    uint64_t v16 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    int v13 = 0x20000000;
    int v14 = 32;
    uint64_t v15 = 0;
    uint64_t v4 = MEMORY[0x263EF8330];
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = __58__UICollectionViewAccessibility__axGlobalRowForIndexPath___block_invoke;
    id v8 = &unk_2650ADF88;
    v10[1] = &v11;
    id v9 = v19;
    v10[0] = location;
    AXPerformSafeBlock();
    uint64_t v3 = v12[3];
    objc_storeStrong(v10, 0);
    objc_storeStrong(&v9, 0);
    _Block_object_dispose(&v11, 8);
    uint64_t v16 = v3;
    uint64_t v20 = v3;
  }
  else
  {
    uint64_t v20 = 0;
  }
  int v17 = 1;
  objc_storeStrong(&location, 0);
  return v20;
}

uint64_t __58__UICollectionViewAccessibility__axGlobalRowForIndexPath___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _globalIndexPathForItemAtIndexPath:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_axIndexPathForGlobalRow:(void *)a1
{
  id v15 = a1;
  int v14 = a2;
  if (a1)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    int v8 = 838860800;
    int v9 = 48;
    char v10 = __Block_byref_object_copy__6;
    uint64_t v11 = __Block_byref_object_dispose__6;
    id v12 = 0;
    v5[1] = &v6;
    v5[0] = v15;
    v5[2] = v14;
    AXPerformSafeBlock();
    id v4 = (id)v7[5];
    objc_storeStrong(v5, 0);
    _Block_object_dispose(&v6, 8);
    objc_storeStrong(&v12, 0);
    id v13 = v4;
    id v16 = v4;
    objc_storeStrong(&v13, 0);
  }
  else
  {
    id v16 = 0;
  }
  char v2 = v16;

  return v2;
}

void __58__UICollectionViewAccessibility__axIndexPathForGlobalRow___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _indexPathForGlobalIndex:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (id)_accessibilityFuzzyHitTest:(CGPoint *)a3 withEvent:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v38 = self;
  SEL v37 = a2;
  id v36 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if ([(UICollectionViewAccessibility *)v38 _accessibilityShouldUseCollectionViewCellAccessibilityElements])
  {
    id v32 = 0;
    double v31 = 1.79769313e308;
    UIAccessibilityPointForPoint();
    v30[1] = v4;
    v30[2] = v5;
    v30[0] = (id)[(UICollectionViewAccessibility *)v38 safeValueForKey:@"indexPathsForVisibleItems"];
    memset(__b, 0, sizeof(__b));
    id obj = v30[0];
    uint64_t v21 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
    if (v21)
    {
      uint64_t v17 = *(void *)__b[2];
      uint64_t v18 = 0;
      unint64_t v19 = v21;
      while (1)
      {
        uint64_t v16 = v18;
        if (*(void *)__b[2] != v17) {
          objc_enumerationMutation(obj);
        }
        unint64_t v29 = *(void **)(__b[1] + 8 * v18);
        uint64_t v27 = 0;
        uint64_t v27 = -[UICollectionViewAccessibility _axGlobalRowForIndexPath:](v38, v29);
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v26 = [(UICollectionViewAccessibility *)v38 accessibilityCollectionCellElementForIndexPath:v29];
          [v26 accessibilityActivationPoint];
          v24[1] = v6;
          v24[2] = v7;
          AX_CGPointGetDistanceToPoint();
          double v25 = v8;
          if (v8 < v31)
          {
            double v31 = v25;
            objc_storeStrong(&v32, v26);
          }
          objc_storeStrong(&v26, 0);
        }
        ++v18;
        if (v16 + 1 >= v19)
        {
          uint64_t v18 = 0;
          unint64_t v19 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
          if (!v19) {
            break;
          }
        }
      }
    }

    if (v32)
    {
      v24[0] = (id)[v32 cell];
      [v24[0] bounds];
      CGRect rect = v43;
      CGRectGetMidX(v43);
      CGRectGetMidY(rect);
      CGPointMake_3();
      p_x = (_OWORD *)&v36->x;
      -[UICollectionViewAccessibility convertPoint:fromView:](v38, "convertPoint:fromView:", v24[0], v9, v10);
      *(void *)&long long v22 = v11;
      *((void *)&v22 + 1) = v12;
      _OWORD *p_x = v22;
      id v39 = v32;
      int v33 = 1;
      objc_storeStrong(v24, 0);
    }
    else
    {
      id v39 = 0;
      int v33 = 1;
    }
    objc_storeStrong(v30, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    v34.receiver = v38;
    v34.super_class = (Class)UICollectionViewAccessibility;
    id v39 = [(UICollectionViewAccessibility *)&v34 _accessibilityFuzzyHitTest:v36 withEvent:location];
    int v33 = 1;
  }
  objc_storeStrong(&location, 0);
  id v13 = v39;

  return v13;
}

- (BOOL)_accessibilityOverridesContainerProtocol
{
  if (a1)
  {
    if (!_accessibilityOverridesContainerProtocol_baseCount)
    {
      id v1 = (objc_class *)objc_opt_class();
      _accessibilityOverridesContainerProtocol_baseCount = (uint64_t)class_getInstanceMethod(v1, sel_accessibilityElementCount);
      uint64_t v2 = (objc_class *)objc_opt_class();
      _accessibilityOverridesContainerProtocol_baseElemAtIndex = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityElementAtIndex_);
      uint64_t v3 = (objc_class *)objc_opt_class();
      _accessibilityOverridesContainerProtocol_baseIndexOfElem = (uint64_t)class_getInstanceMethod(v3, sel_indexOfAccessibilityElement_);
      id v4 = (objc_class *)objc_opt_class();
      _accessibilityOverridesContainerProtocol_baseElems = (uint64_t)class_getInstanceMethod(v4, sel_accessibilityElements);
    }
    int v5 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v5, sel_accessibilityElementCount);
    uint64_t v6 = (objc_class *)objc_opt_class();
    Method v13 = class_getInstanceMethod(v6, sel_accessibilityElementAtIndex_);
    id v7 = (objc_class *)objc_opt_class();
    Method v12 = class_getInstanceMethod(v7, sel_indexOfAccessibilityElement_);
    double v8 = (objc_class *)objc_opt_class();
    Method v11 = class_getInstanceMethod(v8, sel_accessibilityElements);
    BOOL v10 = 0;
    if ((Method)_accessibilityOverridesContainerProtocol_baseCount != InstanceMethod)
    {
      BOOL v10 = 0;
      if ((Method)_accessibilityOverridesContainerProtocol_baseElemAtIndex != v13)
      {
        BOOL v10 = 0;
        if ((Method)_accessibilityOverridesContainerProtocol_baseIndexOfElem != v12) {
          return _accessibilityOverridesContainerProtocol_baseElems != (void)v11;
        }
      }
    }
    return v10;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_accessibilityShouldAvoidScrollingCollectionViewCells
{
  return ([(UICollectionViewAccessibility *)self isScrollEnabled] & 1) == 0;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  uint64_t v6 = self;
  SEL v5 = a2;
  char v4 = 1;
  if ([(UICollectionViewAccessibility *)self accessibilityCollectionViewBehavesLikeUIViewAccessibility])
  {
    v3.receiver = v6;
    v3.super_class = (Class)UICollectionViewAccessibility;
    char v4 = [(UICollectionViewAccessibility *)&v3 isAccessibilityOpaqueElementProvider];
  }
  if (([(id)*MEMORY[0x263F1D020] _accessibilityWantsOpaqueElementProviders] & 1) == 0) {
    char v4 = 0;
  }
  if ([(UICollectionViewAccessibility *)v6 accessibilityElementCount] != 0x7FFFFFFFFFFFFFFFLL
    && -[UICollectionViewAccessibility _accessibilityOverridesContainerProtocol]((uint64_t)v6))
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  CGPoint v71 = a3;
  v70 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v68 = [(UICollectionViewAccessibility *)v70 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v61 = 0;
  char v28 = 0;
  if (!v68)
  {
    uint64_t v62 = MEMORY[0x263EF8330];
    int v63 = -1073741824;
    int v64 = 0;
    v65 = __65__UICollectionViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v66 = &unk_2650AE580;
    v67 = v70;
    char v61 = 1;
    v60 = (id *)&v67;
    char v28 = ((uint64_t (*)(void))__65__UICollectionViewAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v28)
  {
    -[UICollectionViewAccessibility _accessibilitySetBoolValue:forKey:](v70, "_accessibilitySetBoolValue:forKey:", 1);
    id v59 = (id)-[UICollectionViewAccessibility accessibilityHitTest:withEvent:](v70, "accessibilityHitTest:withEvent:", location[0], v71.x, v71.y);
    [(UICollectionViewAccessibility *)v70 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    v72 = (UICollectionViewAccessibility *)v59;
    int v58 = 1;
    objc_storeStrong(&v59, 0);
  }
  else
  {
    int v58 = 0;
  }
  if (v61) {
    objc_storeStrong(v60, 0);
  }
  if (!v58)
  {
    if ([(UICollectionViewAccessibility *)v70 accessibilityCollectionViewBehavesLikeUIViewAccessibility])
    {
      v57.receiver = v70;
      v57.super_class = (Class)UICollectionViewAccessibility;
      v72 = (UICollectionViewAccessibility *)-[UICollectionViewAccessibility _accessibilityHitTest:withEvent:](&v57, sel__accessibilityHitTest_withEvent_, location[0], v71.x, v71.y);
      int v58 = 1;
      goto LABEL_92;
    }
    BOOL v56 = (unsigned __int16)[location[0] _accessibilityHitTestType] == 3;
    if (v56
      || ([(id)*MEMORY[0x263F1D020] _accessibilityWantsOpaqueElementProviders] & 1) != 0
      && [(UICollectionViewAccessibility *)v70 isAccessibilityOpaqueElementProvider])
    {
      v72 = (UICollectionViewAccessibility *)(id)-[UICollectionViewAccessibility __accessibilityHitTest:withEvent:](v70, "__accessibilityHitTest:withEvent:", location[0], v71.x, v71.y);
      int v58 = 1;
      goto LABEL_92;
    }
    if (![(UICollectionViewAccessibility *)v70 _accessibilityShouldUseCollectionViewCellAccessibilityElements])
    {
      v55.receiver = v70;
      v55.super_class = (Class)UICollectionViewAccessibility;
      v72 = (UICollectionViewAccessibility *)-[UICollectionViewAccessibility _accessibilityHitTest:withEvent:](&v55, sel__accessibilityHitTest_withEvent_, location[0], v71.x, v71.y);
      int v58 = 1;
      goto LABEL_92;
    }
    id v54 = v70;
    if ((-[UICollectionViewAccessibility pointInside:withEvent:](v70, "pointInside:withEvent:", location[0], v71.x, v71.y) & 1) == 0)
    {
      v72 = 0;
      int v58 = 1;
LABEL_91:
      objc_storeStrong(&v54, 0);
      goto LABEL_92;
    }
    id v26 = v70;
    id v27 = [(UICollectionViewAccessibility *)v70 _accessibilitySupplementaryHeaderViews];
    id v53 = (id)-[UICollectionViewAccessibility _accessibilityHitTestSupplementaryViews:point:withEvent:](v26, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v71.x, v71.y);

    if (v53
      || (id v24 = v70,
          id v25 = -[UICollectionViewAccessibility _accessibilitySupplementaryFooterViews](v70, "_accessibilitySupplementaryFooterViews"), v53 = (id)-[UICollectionViewAccessibility _accessibilityHitTestSupplementaryViews:point:withEvent:](v24, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v71.x, v71.y), 0, v25, v53))
    {
      v72 = (UICollectionViewAccessibility *)v53;
      int v58 = 1;
LABEL_90:
      objc_storeStrong(&v53, 0);
      goto LABEL_91;
    }
    id v52 = (id)objc_msgSend(v54, "__accessibilityHitTest:withEvent:", location[0], v71.x, v71.y);
    char v50 = 0;
    char v48 = 0;
    char v46 = 0;
    BOOL v23 = 0;
    if (v52)
    {
      BOOL v23 = 0;
      if (v52 != v70)
      {
        objc_opt_class();
        BOOL v23 = 0;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v51 = (id)[v52 _accessibilityAncestorIsKindOf:objc_opt_class()];
          char v50 = 1;
          BOOL v23 = 0;
          if (!v51)
          {
            id v49 = (id)[v52 _accessibilityAncestorIsKindOf:objc_opt_class()];
            char v48 = 1;
            BOOL v23 = 0;
            if (!v49)
            {
              id v47 = (id)[v52 accessibilityContainer];
              char v46 = 1;
              BOOL v23 = v47 != 0;
            }
          }
        }
      }
    }
    if (v46) {

    }
    if (v48) {
    if (v50)
    }

    if (v23)
    {
      if ([v52 isAccessibilityElement])
      {
        v72 = (UICollectionViewAccessibility *)v52;
        int v58 = 1;
LABEL_89:
        objc_storeStrong(&v52, 0);
        goto LABEL_90;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v52, "convertPoint:fromView:", v70, v71.x, v71.y);
        v44[1] = v4;
        v44[2] = v5;
        id v45 = (id)objc_msgSend(v52, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v4, *(double *)&v5);
        if ([v45 isAccessibilityElement])
        {
          v72 = (UICollectionViewAccessibility *)v45;
          int v58 = 1;
        }
        else
        {
          int v58 = 0;
        }
        objc_storeStrong(&v45, 0);
        if (v58) {
          goto LABEL_89;
        }
      }
    }
    if (![(UICollectionViewAccessibility *)v70 accessibilityElementCount])
    {
      v72 = v70;
      int v58 = 1;
      goto LABEL_89;
    }
    v44[0] = (id)objc_msgSend(v54, "indexPathForItemAtPoint:", v71.x, v71.y);
    char v42 = 0;
    BOOL v22 = 1;
    if (v44[0])
    {
      id v43 = (id)[v54 cellForItemAtIndexPath:v44[0]];
      char v42 = 1;
      BOOL v22 = v43 == 0;
    }
    if (v42) {

    }
    if (!v22) {
      goto LABEL_73;
    }
    if ((-[UICollectionViewAccessibility _accessibilityHitTestShouldFallbackToNearestChild](v70, "_accessibilityHitTestShouldFallbackToNearestChild") & 1) != 0&& ([location[0] _accessibilityAutomationHitTest] & 1) == 0)
    {
      id v6 = [(UICollectionViewAccessibility *)v70 _accessibilityFuzzyHitTest:&v71 withEvent:location[0]];
      id v7 = v53;
      id v53 = v6;
    }
    if (!v53 && v52)
    {
      id v41 = (id)[v52 _accessibilityAncestorIsKindOf:objc_opt_class()];
      char v39 = 0;
      objc_opt_class();
      id v21 = (id)[v41 safeValueForKey:@"_layoutAttributes"];
      id v38 = (id)__UIAccessibilityCastAsClass();

      id v37 = v38;
      objc_storeStrong(&v38, 0);
      id v40 = v37;
      id v36 = (id)[v37 representedElementKind];
      if (![v36 length]) {
        goto LABEL_69;
      }
      id v35 = (id)[(UICollectionViewAccessibility *)v70 safeDictionaryForKey:@"_supplementaryViewClassDict"];
      memset(__b, 0, 0x40uLL);
      id obj = (id)[v35 allKeys];
      uint64_t v20 = [obj countByEnumeratingWithState:__b objects:v73 count:16];
      if (v20)
      {
        uint64_t v16 = *(void *)__b[2];
        uint64_t v17 = 0;
        unint64_t v18 = v20;
        while (1)
        {
          uint64_t v15 = v17;
          if (*(void *)__b[2] != v16) {
            objc_enumerationMutation(obj);
          }
          void __b[8] = *(void *)(__b[1] + 8 * v17);
          char v33 = 0;
          objc_opt_class();
          id v32 = (id)__UIAccessibilityCastAsClass();
          if (v33) {
            abort();
          }
          id v31 = v32;
          objc_storeStrong(&v32, 0);
          char v14 = [v31 hasPrefix:v36];

          if (v14) {
            break;
          }
          ++v17;
          if (v15 + 1 >= v18)
          {
            uint64_t v17 = 0;
            unint64_t v18 = [obj countByEnumeratingWithState:__b objects:v73 count:16];
            if (!v18) {
              goto LABEL_65;
            }
          }
        }
        v72 = (UICollectionViewAccessibility *)v52;
        int v58 = 1;
      }
      else
      {
LABEL_65:
        int v58 = 0;
      }

      if (!v58) {
        int v58 = 0;
      }
      objc_storeStrong(&v35, 0);
      if (!v58) {
LABEL_69:
      }
        int v58 = 0;
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
      if (v58) {
        goto LABEL_88;
      }
    }
    if (v53)
    {
LABEL_73:
      uint64_t v30 = -[UICollectionViewAccessibility _axGlobalRowForIndexPath:](v70, v44[0]);
      if (v30 != 0x7FFFFFFFFFFFFFFFLL && !v53)
      {
        id v8 = [(UICollectionViewAccessibility *)v70 accessibilityCollectionCellElementForIndexPath:v44[0]];
        id v9 = v53;
        id v53 = v8;
      }
      if (v53)
      {
        id v29 = (id)objc_msgSend(v53, "_accessibilityHitTest:withEvent:", location[0], v71.x, v71.y);
        if (!v29
          && (-[UICollectionViewAccessibility _accessibilityHitTestShouldFallbackToNearestChild](v70, "_accessibilityHitTestShouldFallbackToNearestChild") & 1) != 0&& ([location[0] _accessibilityAutomationHitTest] & 1) == 0)
        {
          id v10 = (id)[v53 accessibilityElementAtIndex:0];
          id v11 = v29;
          id v29 = v10;
        }
        objc_storeStrong(&v53, v29);
        objc_storeStrong(&v29, 0);
      }
      if (v53 && ([v53 isAccessibilityElement] & 1) != 0
        || v53 && ([location[0] _accessibilityAutomationHitTest] & 1) != 0)
      {
        v72 = (UICollectionViewAccessibility *)v53;
        int v58 = 1;
      }
      else
      {
        v72 = v70;
        int v58 = 1;
      }
    }
    else
    {
      v72 = v70;
      int v58 = 1;
    }
LABEL_88:
    objc_storeStrong(v44, 0);
    goto LABEL_89;
  }
LABEL_92:
  objc_storeStrong(location, 0);
  Method v12 = v72;

  return v12;
}

BOOL __65__UICollectionViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  unint64_t v18 = (dispatch_once_t *)&UICollectionElementKindCell_block_invoke_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_13);
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
      id v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      char v4 = v8;
      id v10 = v4;
      uint64_t v2 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v2);
      id v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UICollectionElementKindCell_block_invoke_BaseImplementation;
}

void __65__UICollectionViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UICollectionElementKindCell_block_invoke_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      id v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      objc_super v3 = v7;
      id v9 = v3;
      uint64_t v2 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v2);
      id v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (BOOL)_accessibilityHasOrderedChildren
{
  SEL v5 = self;
  SEL v4 = a2;
  if ([(UICollectionViewAccessibility *)self isAccessibilityOpaqueElementProvider])
  {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewAccessibility;
  return [(UICollectionViewAccessibility *)&v3 _accessibilityHasOrderedChildren];
}

- (int64_t)accessibilityElementCount
{
  id v7 = self;
  v6[1] = (id)a2;
  if (![(UICollectionViewAccessibility *)self _accessibilityShouldUseCollectionViewCellAccessibilityElements])return 0x7FFFFFFFFFFFFFFFLL; {
  v6[0] = [(UICollectionViewAccessibility *)v7 axData];
  }
  uint64_t v5 = -[AXCollectionViewData childCount]((uint64_t)v6[0]);
  id v3 = [(UICollectionViewAccessibility *)v7 _accessibilityOtherCollectionViewItems];
  uint64_t v4 = [v3 count];

  int64_t v8 = v5 + v4;
  objc_storeStrong(v6, 0);
  return v8;
}

- (id)_accessibilityOtherCollectionViewItems
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v41 = self;
  v40[1] = (id)a2;
  v40[0] = (id)[MEMORY[0x263EFF980] array];
  id v14 = [(UICollectionViewAccessibility *)v41 axData];
  id v39 = (id)-[AXCollectionViewData children]((uint64_t)v14);

  char v37 = 0;
  objc_opt_class();
  id v36 = (id)__UIAccessibilityCastAsClass();
  id v35 = v36;
  objc_storeStrong(&v36, 0);
  id v38 = v35;
  memset(__b, 0, sizeof(__b));
  id obj = (id)[(UICollectionViewAccessibility *)v41 subviews];
  uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v34 = *(id *)(__b[1] + 8 * v10);
      char v32 = 0;
      objc_opt_class();
      char v7 = 0;
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = 0;
        char v28 = &v27;
        int v29 = 0x20000000;
        int v30 = 32;
        char v31 = 0;
        uint64_t v21 = MEMORY[0x263EF8330];
        int v22 = -1073741824;
        int v23 = 0;
        id v24 = __71__UICollectionViewAccessibility__accessibilityOtherCollectionViewItems__block_invoke;
        id v25 = &unk_2650AE390;
        v26[1] = &v27;
        v26[0] = v34;
        AXPerformSafeBlock();
        char v20 = v28[3] & 1;
        objc_storeStrong(v26, 0);
        _Block_object_dispose(&v27, 8);
        char v7 = v20;
      }
      char v32 = v7 & 1;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (v32)
          && ([v34 _accessibilityViewIsVisible] & 1) != 0)
        {
          if ((v32 & 1) == 0) {
            goto LABEL_18;
          }
          id v6 = v38;
          char v18 = 0;
          objc_opt_class();
          id v17 = (id)__UIAccessibilityCastAsClass();
          if (v18) {
            abort();
          }
          id v16 = v17;
          objc_storeStrong(&v17, 0);
          id v19 = (id)objc_msgSend(v6, "indexPathForCell:");

          id v2 = (id)[v39 objectForKey:v19];
          BOOL v5 = v2 == 0;

          int v15 = v5 ? 0 : 3;
          objc_storeStrong(&v19, 0);
          if (!v15) {
LABEL_18:
          }
            [v40[0] addObject:v34];
        }
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v4 = v40[0];
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(v40, 0);

  return v4;
}

void __71__UICollectionViewAccessibility__accessibilityOtherCollectionViewItems__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v3 = (id)[v1 safeValueForKey:@"_layoutAttributes"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v1, "_isStyledAsHeaderOrFooterFromLayoutAttributes:") & 1;
}

- (id)_accessibilityIndexPathToOtherCollectionViewItems
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v14 = self;
  v13[1] = (id)a2;
  v13[0] = (id)[MEMORY[0x263EFF9A0] dictionary];
  memset(__b, 0, sizeof(__b));
  id obj = [(UICollectionViewAccessibility *)v14 _accessibilityOtherCollectionViewItems];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v6);
      id location = (id)[(UICollectionViewAccessibility *)v14 indexPathForSupplementaryView:v12];
      if (location) {
        [v13[0] setObject:v12 forKey:location];
      }
      objc_storeStrong(&location, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v13[0];
  objc_storeStrong(v13, 0);

  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  uint64_t v12 = self;
  SEL v11 = a2;
  uint64_t v10 = (char *)a3;
  id v9 = [(UICollectionViewAccessibility *)self axData];
  if ((uint64_t)v10 < -[AXCollectionViewData childCount]((uint64_t)v9))
  {
    if (-[AXCollectionViewData childCount]((uint64_t)v9))
    {
      id v5 = -[UICollectionViewAccessibility _axIndexPathForGlobalRow:](v12, v10);
      if (v5) {
        id v13 = [(UICollectionViewAccessibility *)v12 accessibilityCollectionCellElementForIndexPath:v5];
      }
      else {
        id v13 = 0;
      }
      int v6 = 1;
      objc_storeStrong(&v5, 0);
    }
    else
    {
      id v13 = 0;
      int v6 = 1;
    }
  }
  else
  {
    id location = [(UICollectionViewAccessibility *)v12 _accessibilityOtherCollectionViewItems];
    unint64_t v7 = &v10[--[AXCollectionViewData childCount]((uint64_t)v9)];
    if ((uint64_t)v7 < 0 || (unint64_t)v7 >= [location count])
    {
      id v13 = 0;
      int v6 = 1;
    }
    else
    {
      id v13 = (id)[location objectAtIndex:v7];
      int v6 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v9, 0);
  id v3 = v13;

  return v3;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = v10;
    id v5 = (id)[location[0] indexPath];
    int64_t v11 = -[UICollectionViewAccessibility _axGlobalRowForIndexPath:](v4, v5);
  }
  else
  {
    id v8 = [(UICollectionViewAccessibility *)v10 _accessibilityOtherCollectionViewItems];
    uint64_t v7 = [v8 indexOfObject:location[0]];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      id v6 = [(UICollectionViewAccessibility *)v10 axData];
      int64_t v11 = -[AXCollectionViewData childCount]((uint64_t)v6) + v7;
    }
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(@"group.role");
}

- (int64_t)accessibilityContainerType
{
  id v2 = (id)[(UICollectionViewAccessibility *)self storedAccessibilityContainerType];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    if ([(UICollectionViewAccessibility *)self numberOfSections] <= 0
      || ([(UICollectionViewAccessibility *)self isAccessibilityElement] & 1) != 0)
    {
      return 0;
    }
    else
    {
      return 4;
    }
  }
  else
  {
    id v4 = (id)[(UICollectionViewAccessibility *)self storedAccessibilityContainerType];
    int64_t v7 = [v4 integerValue];
  }
  return v7;
}

- (BOOL)_accessibilityDescendantElementAtIndexPathIsValid:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[(UICollectionViewAccessibility *)v6 safeValueForKey:@"delegate"];
  BOOL v7 = !v4 || v4 == v6 || ([v4 _accessibilityDescendantElementAtIndexPathIsValid:location[0]] & 1) != 0;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_accessibilityScannerGroupElements
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v34 = self;
  v33[1] = (id)a2;
  if ([(UICollectionViewAccessibility *)self _accessibilityTreatCollectionViewRowsAsScannerGroups])
  {
    id v35 = -[UICollectionViewAccessibility _accessibilityScannerGroupElementsGroupedByRow](v34);
  }
  else
  {
    v33[0] = (id)[MEMORY[0x263EFF980] array];
    id v21 = (id)[MEMORY[0x263F81198] defaultSwitchControlOptions];
    id v32 = (id)-[UICollectionViewAccessibility _accessibilityViewChildrenWithOptions:](v34, "_accessibilityViewChildrenWithOptions:");

    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    id v30 = 0;
    uint64_t v29 = 64;
    if ([(UICollectionViewAccessibility *)v34 numberOfSections] > 1) {
      v29 |= 0x10uLL;
    }
    memset(__b, 0, sizeof(__b));
    id obj = v32;
    uint64_t v20 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
    if (v20)
    {
      uint64_t v16 = *(void *)__b[2];
      uint64_t v17 = 0;
      unint64_t v18 = v20;
      while (1)
      {
        uint64_t v15 = v17;
        if (*(void *)__b[2] != v16) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(id *)(__b[1] + 8 * v17);
        uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
        id v25 = [(UICollectionViewAccessibility *)v34 _accessibilityIndexPathOfDirectSubviewForDescendantElement:v28 withElementKind:0];
        if (v25) {
          uint64_t v26 = [v25 section];
        }
        if (v26 != v31)
        {
          if ([v30 count])
          {
            v38[0] = @"GroupElements";
            v39[0] = v30;
            v38[1] = @"GroupTraits";
            id v14 = (id)[NSNumber numberWithUnsignedLong:v29];
            v39[1] = v14;
            v38[2] = @"GroupScanBehaviorTraits";
            v39[2] = &unk_26F48EA08;
            v38[3] = @"GroupIdentifier";
            int64_t v11 = NSString;
            id v13 = [(UICollectionViewAccessibility *)v34 _accessibilityGroupIdentifier];
            id v12 = (id)[v11 stringWithFormat:@"%@-%lu", v13, v31];
            v39[3] = v12;
            id v24 = (id)[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];

            [v33[0] addObject:v24];
            objc_storeStrong(&v24, 0);
          }
          uint64_t v31 = v26;
          objc_storeStrong(&v30, 0);
          if (v26 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
            id v3 = v30;
            id v30 = v2;
          }
        }
        if (v30) {
          id v4 = v30;
        }
        else {
          id v4 = v33[0];
        }
        id v23 = v4;
        [v28 _accessibilityProcessScannerGroupElementPieces:v4];
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v25, 0);
        ++v17;
        if (v15 + 1 >= v18)
        {
          uint64_t v17 = 0;
          unint64_t v18 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
          if (!v18) {
            break;
          }
        }
      }
    }

    if ([v30 count])
    {
      v36[0] = @"GroupElements";
      v37[0] = v30;
      v36[1] = @"GroupTraits";
      id v10 = (id)[NSNumber numberWithUnsignedLong:v29];
      v37[1] = v10;
      v36[2] = @"GroupScanBehaviorTraits";
      v37[2] = &unk_26F48EA08;
      v36[3] = @"GroupIdentifier";
      BOOL v7 = NSString;
      id v9 = [(UICollectionViewAccessibility *)v34 _accessibilityGroupIdentifier];
      id v8 = (id)[v7 stringWithFormat:@"%@-%lu", v9, v31];
      v37[3] = v8;
      id v22 = (id)[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];

      [v33[0] addObject:v22];
      objc_storeStrong(&v22, 0);
    }
    id v35 = v33[0];
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(v33, 0);
  }
  BOOL v5 = v35;

  return v5;
}

- (id)_accessibilityScannerGroupElementsGroupedByRow
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v37 = a1;
  if (a1)
  {
    id v36 = (id)[MEMORY[0x263EFF980] array];
    id v21 = (id)[MEMORY[0x263F81198] defaultSwitchControlOptions];
    id v35 = (id)objc_msgSend(v37, "_accessibilityViewChildrenWithOptions:");

    uint64_t v34 = 80;
    uint64_t v33 = [v37 _accessibilityCollectionViewItemsPerRow];
    uint64_t v32 = 0;
    id v31 = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    id obj = v35;
    uint64_t v23 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
    if (v23)
    {
      uint64_t v18 = *(void *)__b[2];
      uint64_t v19 = 0;
      unint64_t v20 = v23;
      while (1)
      {
        uint64_t v17 = v19;
        if (*(void *)__b[2] != v18) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(id *)(__b[1] + 8 * v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v36 addObject:v30];
        }
        else
        {
          id v28 = (id)[v30 _accessibilityIndexPath];
          if (v28
            || (v16 = (id)[v30 _accessibilityAncestorIsKindOf:objc_opt_class()], v1 = (id)objc_msgSend(v16, "_accessibilityIndexPath"), id v2 = v28, v28 = v1, v2, v16, v28))
          {
            uint64_t v26 = 0;
            uint64_t v3 = [v28 item];
            uint64_t v26 = v3 / v33;
            if (v3 / v33 == v32)
            {
              [v31 addObject:v30];
            }
            else
            {
              if ([v31 count])
              {
                v41[0] = @"GroupElements";
                id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v31];
                v42[0] = v15;
                v41[1] = @"GroupTraits";
                id v14 = (id)[NSNumber numberWithUnsignedLong:v34];
                v42[1] = v14;
                v41[2] = @"GroupScanBehaviorTraits";
                v42[2] = &unk_26F48EA08;
                v41[3] = @"GroupIdentifier";
                int64_t v11 = NSString;
                id v13 = (id)[v37 _accessibilityGroupIdentifier];
                id v12 = (id)[v11 stringWithFormat:@"%@-%lu", v13, v32];
                v42[3] = v12;
                id v25 = (id)[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];

                [v36 addObject:v25];
                [v31 removeAllObjects];
                objc_storeStrong(&v25, 0);
              }
              uint64_t v32 = v26;
              [v31 addObject:v30];
            }
            int v27 = 0;
          }
          else
          {
            int v27 = 3;
          }
          objc_storeStrong(&v28, 0);
        }
        ++v19;
        if (v17 + 1 >= v20)
        {
          uint64_t v19 = 0;
          unint64_t v20 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
          if (!v20) {
            break;
          }
        }
      }
    }

    if ([v31 count])
    {
      v39[0] = @"GroupElements";
      id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v31];
      v40[0] = v10;
      v39[1] = @"GroupTraits";
      id v9 = (id)[NSNumber numberWithUnsignedLong:v34];
      v40[1] = v9;
      v39[2] = @"GroupScanBehaviorTraits";
      id v40[2] = &unk_26F48EA08;
      v39[3] = @"GroupIdentifier";
      id v6 = NSString;
      id v8 = (id)[v37 _accessibilityGroupIdentifier];
      id v7 = (id)[v6 stringWithFormat:@"%@-%lu", v8, v32];
      v40[3] = v7;
      id v24 = (id)[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];

      [v36 addObject:v24];
      [v31 removeAllObjects];
      objc_storeStrong(&v24, 0);
    }
    id v38 = v36;
    int v27 = 1;
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  else
  {
    id v38 = 0;
  }
  id v4 = v38;

  return v4;
}

- (id)_accessibilityGroupIdentifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
}

- (id)_accessibilitySortedElementsWithin
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  BOOL v5 = v7;
  if (((uint64_t (*)(void))__67__UICollectionViewAccessibility__accessibilitySortedElementsWithin__block_invoke)())
  {
    id v8 = -[UICollectionViewAccessibility _accessibilitySortedViewChildrenWithOptions:](v7, location[0]);
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
  }
  objc_storeStrong((id *)&v5, 0);
  if (!v4) {
    id v8 = [(UICollectionViewAccessibility *)v7 _accessibilitySortedElementsWithinWithOptions:location[0]];
  }
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

BOOL __67__UICollectionViewAccessibility__accessibilitySortedElementsWithin__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&UICollectionElementKindCell_block_invoke_2_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_581);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
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
      id v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      int v4 = v8;
      id v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v2);
      id v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UICollectionElementKindCell_block_invoke_2_BaseImplementation;
}

void __67__UICollectionViewAccessibility__accessibilitySortedElementsWithin__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    UICollectionElementKindCell_block_invoke_2_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      id v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      uint64_t v3 = v7;
      id v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v2);
      id v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilitySortedViewChildrenWithOptions:(void *)a1
{
  uint64_t v41 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v41)
  {
    [v41 _accessibilityEnsureViewsAroundAreLoaded];
    id v38 = (id)[v41 _accessibilityViewChildrenWithOptions:location];
    char v37 = 0;
    id v15 = (id)[v41 collectionViewLayout];
    objc_opt_class();
    char v35 = 0;
    char v16 = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v36 = (id)[v41 collectionViewLayout];
      char v35 = 1;
      char v16 = [v36 _accessibilitySortCollectionViewLogically];
    }
    if (v35) {

    }
    char v37 = v16 & 1;
    id v2 = (id)[v41 accessibilityComparatorForSorting];
    BOOL v14 = v2 == 0;

    if (v14)
    {
      if ([v41 _accessibilityOnlyComparesByXAxis])
      {
        id v5 = (id)[v41 _accessibilityGeometrySortedElements:v38];
        id v6 = v38;
        id v38 = v5;
      }
      else if (v37)
      {
        id v34 = (id)[v41 collectionViewLayout];
        id v12 = v38;
        uint64_t v27 = MEMORY[0x263EF8330];
        int v28 = -1073741824;
        int v29 = 0;
        id v30 = __77__UICollectionViewAccessibility__accessibilitySortedViewChildrenWithOptions___block_invoke;
        id v31 = &unk_2650AEA60;
        id v32 = v41;
        id v33 = v34;
        id v7 = (id)[v12 sortedArrayUsingComparator:&v27];
        id v8 = v38;
        id v38 = v7;

        objc_storeStrong(&v33, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v34, 0);
      }
    }
    else
    {
      id v13 = (id)[v41 accessibilityComparatorForSorting];
      id v3 = (id)objc_msgSend(v38, "sortedArrayUsingComparator:");
      id v4 = v38;
      id v38 = v3;
    }
    id v11 = v38;
    uint64_t v20 = MEMORY[0x263EF8330];
    int v21 = -1073741824;
    int v22 = 0;
    uint64_t v23 = __77__UICollectionViewAccessibility__accessibilitySortedViewChildrenWithOptions___block_invoke_2;
    id v24 = &unk_2650AE9C0;
    id v25 = v41;
    id v26 = (id)[v11 indexesOfObjectsPassingTest:&v20];
    if ([v26 count])
    {
      id v19 = (id)[v38 mutableCopy];
      [v19 removeObjectsAtIndexes:v26];
      objc_storeStrong(&v38, v19);
      objc_storeStrong(&v19, 0);
    }
    id v18 = -[UICollectionViewAccessibility _axIndexBar](v41);
    if (v18)
    {
      id v17 = (id)[v38 mutableCopy];
      [v17 removeObject:v18];
      [v17 insertObject:v18 atIndex:0];
      objc_storeStrong(&v38, v17);
      objc_storeStrong(&v17, 0);
    }
    id v42 = v38;
    int v39 = 1;
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    id v42 = 0;
    int v39 = 1;
  }
  objc_storeStrong(&location, 0);
  id v9 = v42;

  return v9;
}

- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  char v10 = __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke;
  id v11 = &unk_2650AE580;
  id v12 = v15;
  char v13 = ((uint64_t (*)(void))__79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke)() & 1;
  id v5 = v15;
  char v6 = ((uint64_t (*)(void))__79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_587)() & 1;
  if (v13 & 1) == 0 || (v6) {
    id v16 = -[UICollectionViewAccessibility _accessibilitySortedViewChildrenWithOptions:](v15, location[0]);
  }
  else {
    id v16 = [(UICollectionViewAccessibility *)v15 _accessibilitySortedElementsWithin];
  }
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
  id v3 = v16;

  return v3;
}

BOOL __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  id v18 = (dispatch_once_t *)&UICollectionElementKindCell_block_invoke_3_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_586);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
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
      int v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      id v4 = v8;
      char v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UICollectionElementKindCell_block_invoke_3_BaseImplementation;
}

void __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    UICollectionElementKindCell_block_invoke_3_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      id v3 = v7;
      int v9 = v3;
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

BOOL __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_587(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  id v18 = (dispatch_once_t *)&UICollectionElementKindCell_block_invoke_4_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_590);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
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
      int v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
      id v4 = v8;
      char v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UICollectionElementKindCell_block_invoke_4_BaseImplementation;
}

void __79__UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2_588(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
  if (InstanceMethod)
  {
    UICollectionElementKindCell_block_invoke_4_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
      id v3 = v7;
      int v9 = v3;
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

uint64_t __77__UICollectionViewAccessibility__accessibilitySortedViewChildrenWithOptions___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v48 = 0;
  objc_storeStrong(&v48, a3);
  id v47 = a1;
  uint64_t v46 = 0;
  id v45 = 0;
  id v44 = 0;
  id v3 = a1[4];
  id v42 = 0;
  id v26 = (id)[v3 _accessibilityIndexPathOfDirectSubviewForDescendantElement:location[0] withElementKind:&v42];
  objc_storeStrong(&v45, v42);
  id v43 = v26;
  id v4 = a1[4];
  id v40 = v44;
  id v28 = (id)[v4 _accessibilityIndexPathOfDirectSubviewForDescendantElement:v48 withElementKind:&v40];
  objc_storeStrong(&v44, v40);
  id v41 = v28;
  if (v43 && v41)
  {
    uint64_t v39 = [v43 section];
    uint64_t v38 = [v41 section];
    if (v39 == v38)
    {
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v5 = 1;
      if (v39 < v38) {
        uint64_t v5 = -1;
      }
      uint64_t v24 = v5;
    }
    uint64_t v46 = v24;
    if (!v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) == 0 || ([v45 isEqualToString:v44])
      {
        if (([v45 isEqualToString:@"UICollectionElementKindCell"] & 1) != 0
          && ([v44 isEqualToString:@"UICollectionElementKindCell"] & 1) != 0)
        {
          uint64_t v37 = [v43 item];
          uint64_t v36 = [v41 item];
          if (v37 == v36)
          {
            uint64_t v23 = 0;
          }
          else
          {
            uint64_t v6 = 1;
            if (v37 < v36) {
              uint64_t v6 = -1;
            }
            uint64_t v23 = v6;
          }
          uint64_t v46 = v23;
        }
      }
      else if ([v45 isEqualToString:*MEMORY[0x263F1D120]])
      {
        uint64_t v46 = -1;
      }
      else if ([v44 isEqualToString:*MEMORY[0x263F1D120]])
      {
        uint64_t v46 = 1;
      }
      else if ([v45 isEqualToString:*MEMORY[0x263F1D118]])
      {
        uint64_t v46 = 1;
      }
      else if ([v44 isEqualToString:*MEMORY[0x263F1D118]])
      {
        uint64_t v46 = -1;
      }
    }
    if (([a1[4] _accessibilityIsRTL] & 1) != 0 && v46)
    {
      [location[0] accessibilityFrame];
      *(void *)char v35 = v7;
      *(void *)&v35[8] = v8;
      *(void *)&v35[16] = v9;
      *(void *)&v35[24] = v10;
      [v48 accessibilityFrame];
      rect.origin.x = v11;
      rect.origin.y = v12;
      rect.size.width = v13;
      rect.size.height = v14;
      [a1[4] _accessibilityAllowedGeometryOverlap];
      double v33 = v15;
      BOOL v22 = 0;
      if (CGFAbs(*(double *)&v35[8] - rect.origin.y) < v15) {
        BOOL v22 = CGFAbs(*(double *)&v35[24] - rect.size.height) < v33;
      }
      if (v22)
      {
        double MinX = CGRectGetMinX(*(CGRect *)v35);
        double v31 = CGRectGetMinX(rect);
        double MaxX = CGRectGetMaxX(*(CGRect *)v35);
        double v29 = CGRectGetMaxX(rect);
        if (v31 > MinX || MinX >= MaxX || (char v21 = 1, MaxX > v29))
        {
          BOOL v20 = 0;
          if (MinX <= v31)
          {
            BOOL v20 = 0;
            if (v31 < v29) {
              BOOL v20 = v29 <= MaxX;
            }
          }
          char v21 = v20;
        }
        if (*(double *)v35 < rect.origin.x && v46 == -1
          || (char v19 = 0, *(double *)v35 > rect.origin.x) && (char v19 = 0, v46 == 1))
        {
          char v19 = v21 ^ 1;
        }
        if (v19)
        {
          uint64_t v16 = 1;
          if (v46 == 1) {
            uint64_t v16 = -1;
          }
          uint64_t v46 = v16;
        }
      }
    }
  }
  if (!v46) {
    uint64_t v46 = [location[0] accessibilityCompareGeometry:v48];
  }
  uint64_t v18 = v46;
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  return v18;
}

uint64_t __77__UICollectionViewAccessibility__accessibilitySortedViewChildrenWithOptions___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9[3] = a3;
  v9[2] = a4;
  v9[1] = a1;
  v9[0] = (id)[a1[4] _accessibilityIndexPathOfDirectSubviewForDescendantElement:location[0] withElementKind:0];
  int v8 = [a1[4] _accessibilityDescendantElementAtIndexPathIsValid:v9[0]] ^ 1;
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)_axIndexBar
{
  id v6 = a1;
  if (a1)
  {
    id location = 0;
    id v4 = v6;
    id obj = (id)[v4 accessoryViewAtEdge:1];
    NSClassFromString(&cfstr_Uiindexbaracce_0.isa);
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong(&location, obj);
    }
    id v7 = location;
    objc_storeStrong(&obj, 0);
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v7 = 0;
  }
  id v1 = v7;

  return v1;
}

- (CGRect)_visibleBounds
{
  id v17 = self;
  SEL v16 = a2;
  memset(&v18, 0, sizeof(v18));
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewAccessibility;
  [(UICollectionViewAccessibility *)&v15 _visibleBounds];
  v18.origin.double x = v2;
  v18.origin.double y = v3;
  v18.size.double width = v4;
  v18.size.double height = v5;
  if (UIAccessibilityIsVoiceOverRunning()
    && [(UICollectionViewAccessibility *)v17 isAccessibilityOpaqueElementProvider])
  {
    [(UICollectionViewAccessibility *)v17 _accessibilityBoundsOfCellsToLoad];
    r2.origin.double x = v6;
    r2.origin.double y = v7;
    r2.size.double width = v8;
    r2.size.double height = v9;
    CGRect v18 = CGRectUnion(v18, r2);
  }
  double y = v18.origin.y;
  double x = v18.origin.x;
  double height = v18.size.height;
  double width = v18.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_accessibilityEnsureViewsAroundAreLoaded
{
}

- (CGRect)_accessibilityBoundsOfCellsToLoad
{
  [(UICollectionViewAccessibility *)self bounds];
  return CGRectInset(v2, -1.0 * v2.size.width, -1.0 * v2.size.height);
}

- (id)_accessibilityIndexPathOfDirectSubviewForDescendantElement:(id)a3 withElementKind:(id *)a4
{
  uint64_t v36 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  id v34 = a4;
  id v33 = v36;
  id v32 = (id)[location[0] _accessibilityFindAncestor:&__block_literal_global_600 startWithSelf:1];
  BOOL v31 = 0;
  do
  {
    id v30 = (id)[v32 superview];
    BOOL v13 = 1;
    if (v30 != v33) {
      BOOL v13 = v30 == 0;
    }
    BOOL v31 = v13;
    if (!v13) {
      objc_storeStrong(&v32, v30);
    }
    objc_storeStrong(&v30, 0);
  }
  while (!v31);
  id v29 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v34)
    {
      CGFloat v4 = @"UICollectionElementKindCell";
      *id v34 = v4;
    }
    id v5 = (id)[v33 indexPathForCell:v32];
    id v6 = v29;
    id v29 = v5;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v34)
      {
        char v27 = 0;
        objc_opt_class();
        id v12 = (id)[v32 safeValueForKey:@"_layoutAttributes"];
        id v26 = (id)__UIAccessibilityCastAsClass();

        id v25 = v26;
        objc_storeStrong(&v26, 0);
        id v28 = v25;
        id v11 = (id)[v25 representedElementKind];
        if (v11) {
          CGFloat v7 = (__CFString *)v11;
        }
        else {
          CGFloat v7 = @"UICollectionElementKindCell";
        }
        *id v34 = v7;

        objc_storeStrong(&v28, 0);
      }
      uint64_t v18 = 0;
      char v19 = &v18;
      int v20 = 838860800;
      int v21 = 48;
      BOOL v22 = __Block_byref_object_copy__6;
      uint64_t v23 = __Block_byref_object_dispose__6;
      id v24 = 0;
      v17[1]  = &v18;
      id v16 = v33;
      v17[0]  = v32;
      AXPerformSafeBlock();
      id v15 = (id)v19[5];
      objc_storeStrong(v17, 0);
      objc_storeStrong(&v16, 0);
      _Block_object_dispose(&v18, 8);
      objc_storeStrong(&v24, 0);
      id v8 = v29;
      id v29 = v15;
    }
  }
  id v10 = v29;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);

  return v10;
}

uint64_t __108__UICollectionViewAccessibility__accessibilityIndexPathOfDirectSubviewForDescendantElement_withElementKind___block_invoke(void *a1, void *a2)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass  = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

void __108__UICollectionViewAccessibility__accessibilityIndexPathOfDirectSubviewForDescendantElement_withElementKind___block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) indexPathForSupplementaryView:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  CGFloat v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40)  = v1;
}

- (BOOL)_accessibilitySpeakThisShouldOnlyIncludeVisibleElements
{
  return 0;
}

- (id)_accessibilityReusableViewForOpaqueElement:(id)a3
{
  id location[2] = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  id v7 = location[0];
  while (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    id v3 = (id)[v7 accessibilityContainer];
    id v4 = v7;
    id v7 = v3;
  }
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v23[1]  = *MEMORY[0x263EF8340];
  BOOL v22 = self;
  v21[1]  = (id)a2;
  v20.receiver  = self;
  v20.super_class  = (Class)UICollectionViewAccessibility;
  v21[0]  = [(UICollectionViewAccessibility *)&v20 _accessibilitySupplementaryHeaderViews];
  if (!v21[0])
  {
    id v2 = (id)[MEMORY[0x263EFF8C0] array];
    id v3 = v21[0];
    v21[0]  = v2;
  }
  id v19 = -[UICollectionViewAccessibility _axIndexBar](v22);
  if (v19)
  {
    if ([v21[0] count])
    {
      id v18 = (id)[MEMORY[0x263EFF980] arrayWithObject:v19];
      [v18 addObjectsFromArray:v21[0]];
      objc_storeStrong(v21, v18);
      objc_storeStrong(&v18, 0);
    }
    else
    {
      v23[0]  = v19;
      id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      id v5 = v21[0];
      v21[0]  = v4;
    }
  }
  id v17 = [(UICollectionViewAccessibility *)v22 _accessibilityCollectionViewSupplementaryViews];
  id v6 = (id)objc_msgSend(v17, "ax_filteredArrayUsingBlock:", &__block_literal_global_604);
  id v7 = v17;
  id v17 = v6;

  id v13 = (id)-[UICollectionViewAccessibility safeArrayForKey:](v22, "safeArrayForKey:");
  id v12 = (id)objc_msgSend(v13, "ax_filteredArrayUsingBlock:", &__block_literal_global_610);
  id v16 = (id)[v12 firstObject];

  id v14 = (id)[v16 safeArrayForKey:@"subviews"];
  id v15 = (id)objc_msgSend(v14, "ax_filteredArrayUsingBlock:", &__block_literal_global_612);

  if ([v15 count])
  {
    id v8 = (id)[v17 arrayByAddingObjectsFromArray:v15];
    id v9 = v17;
    id v17 = v8;
  }
  id v11 = (id)[v21[0] arrayByAddingObjectsFromArray:v17];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v21, 0);

  return v11;
}

uint64_t __71__UICollectionViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(void *a1, void *a2)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uiswipeactionp_0.isa);
  isKindOfClass  = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __71__UICollectionViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke_2(void *a1, void *a2)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uicollectionvi_15.isa);
  char v3 = 0;
  if (objc_opt_isKindOfClass()) {
    char v3 = [location[0] _accessibilityViewIsVisible];
  }
  objc_storeStrong(location, 0);
  return v3 & 1;
}

uint64_t __71__UICollectionViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke_3(void *a1, void *a2)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uiswipeactionp_0.isa);
  char v3 = 0;
  if (objc_opt_isKindOfClass()) {
    char v3 = [location[0] _accessibilityViewIsVisible];
  }
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)accessibilityLabel
{
  id v8 = self;
  SEL v7 = a2;
  id v2 = (id)[(UICollectionViewAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    if (!UIAccessibilityIsVoiceOverRunning()
      || ([(UICollectionViewAccessibility *)v8 isAccessibilityElement] & 1) != 0)
    {
      v6.receiver  = v8;
      v6.super_class  = (Class)UICollectionViewAccessibility;
      id v9 = [(UICollectionViewAccessibility *)&v6 accessibilityLabel];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = (id)[(UICollectionViewAccessibility *)v8 accessibilityUserDefinedLabel];
  }
  char v3 = v9;

  return v3;
}

- (id)_accessibilityCollectionViewSupplementaryViews
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v14 = self;
  v13[1]  = (id)a2;
  v13[0]  = (id)[MEMORY[0x263EFF980] array];
  if (_AXSAutomationEnabled())
  {
    id location = (id)[(UICollectionViewAccessibility *)v14 visibleCells];
    memset(__b, 0, sizeof(__b));
    id obj = (id)[(UICollectionViewAccessibility *)v14 subviews];
    uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(__b[1] + 8 * v6);
        if (([location containsObject:v11] & 1) == 0
          && ([v11 _accessibilityViewIsVisible] & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v13[0] addObject:v11];
          }
        }
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&location, 0);
  }
  id v3 = v13[0];
  objc_storeStrong(v13, 0);

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v9 = self;
  location[1]  = (id)a2;
  location[0]  = [(UICollectionViewAccessibility *)self _accessibilityCollectionViewSupplementaryViews];
  id v2 = (id)objc_msgSend(location[0], "ax_filteredArrayUsingBlock:", &__block_literal_global_622);
  id v3 = location[0];
  location[0]  = v2;

  if ([location[0] count])
  {
    id v10 = location[0];
  }
  else
  {
    v6.receiver  = v9;
    v6.super_class  = (Class)UICollectionViewAccessibility;
    id v10 = [(UICollectionViewAccessibility *)&v6 _accessibilitySupplementaryFooterViews];
  }
  int v7 = 1;
  objc_storeStrong(location, 0);
  uint64_t v4 = v10;

  return v4;
}

uint64_t __71__UICollectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(void *a1, void *a2)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uiswipeactionp_0.isa);
  int v3 = objc_opt_isKindOfClass() ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v20 = self;
  v19[1]  = (id)a2;
  v18.receiver  = self;
  v18.super_class  = (Class)UICollectionViewAccessibility;
  id v9 = [(UICollectionViewAccessibility *)&v18 _accessibilitySupplementaryViewSectionHeaderIdentifiers];
  v19[0]  = (id)AXGuaranteedMutableArray();

  id v17 = (id)[(UICollectionViewAccessibility *)v20 safeDictionaryForKey:@"_supplementaryViewClassDict"];
  memset(__b, 0, sizeof(__b));
  id obj = (id)[v17 allKeys];
  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      if ([v16 localizedCaseInsensitiveContainsString:@"header"])
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v13 = [v16 rangeOfString:@"/"];
        uint64_t v14 = v2;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v19[0] addObject:v16];
        }
        else
        {
          id location = (id)[v16 substringToIndex:v13];
          if ([location length]) {
            [v19[0] addObject:location];
          }
          objc_storeStrong(&location, 0);
        }
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  id v4 = v19[0];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v19, 0);

  return v4;
}

- (id)_accessibilitySupplementaryHeaderViewAtIndexPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v27 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = [(UICollectionViewAccessibility *)v27 _accessibilitySupplementaryViewSectionHeaderIdentifiers];
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v25 = *(id *)(__b[1] + 8 * v7);
      uint64_t v16 = 0;
      id v17 = &v16;
      int v18 = 838860800;
      int v19 = 48;
      objc_super v20 = __Block_byref_object_copy__6;
      int v21 = __Block_byref_object_dispose__6;
      id v22 = 0;
      v15[1]  = &v16;
      uint64_t v13 = v27;
      id v14 = v25;
      v15[0]  = location[0];
      AXPerformSafeBlock();
      id v12 = (id)v17[5];
      objc_storeStrong(v15, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong((id *)&v13, 0);
      _Block_object_dispose(&v16, 8);
      objc_storeStrong(&v22, 0);
      id v23 = v12;
      if (v12)
      {
        id v28 = v23;
        int v11 = 1;
      }
      else
      {
        int v11 = 0;
      }
      objc_storeStrong(&v23, 0);
      if (v11) {
        break;
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v8) {
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
LABEL_11:
    int v11 = 0;
  }

  if (!v11) {
    id v28 = 0;
  }
  objc_storeStrong(location, 0);
  int v3 = v28;

  return v3;
}

void __82__UICollectionViewAccessibility__accessibilitySupplementaryHeaderViewAtIndexPath___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) supplementaryViewForElementKind:*(void *)(a1 + 40) atIndexPath:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  int v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40)  = v1;
}

- (id)_accessibilityLayoutAttributesForSupplementaryHeaderViewAtIndexPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v27 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = [(UICollectionViewAccessibility *)v27 _accessibilitySupplementaryViewSectionHeaderIdentifiers];
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v25 = *(id *)(__b[1] + 8 * v7);
      uint64_t v16 = 0;
      id v17 = &v16;
      int v18 = 838860800;
      int v19 = 48;
      objc_super v20 = __Block_byref_object_copy__6;
      int v21 = __Block_byref_object_dispose__6;
      id v22 = 0;
      v15[1]  = &v16;
      uint64_t v13 = v27;
      id v14 = v25;
      v15[0]  = location[0];
      AXPerformSafeBlock();
      id v12 = (id)v17[5];
      objc_storeStrong(v15, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong((id *)&v13, 0);
      _Block_object_dispose(&v16, 8);
      objc_storeStrong(&v22, 0);
      id v23 = v12;
      if (v12)
      {
        id v28 = v23;
        int v11 = 1;
      }
      else
      {
        int v11 = 0;
      }
      objc_storeStrong(&v23, 0);
      if (v11) {
        break;
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v8) {
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
LABEL_11:
    int v11 = 0;
  }

  if (!v11) {
    id v28 = 0;
  }
  objc_storeStrong(location, 0);
  int v3 = v28;

  return v3;
}

void __101__UICollectionViewAccessibility__accessibilityLayoutAttributesForSupplementaryHeaderViewAtIndexPath___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) layoutAttributesForSupplementaryElementOfKind:*(void *)(a1 + 40) atIndexPath:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  int v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40)  = v1;
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  unint64_t v8 = self;
  SEL v7 = a2;
  BOOL v6 = 0;
  id location = (id)[(UICollectionViewAccessibility *)self safeValueForKey:@"collectionViewLayout"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [location safeIntegerForKey:@"scrollDirection"];
    if (v4) {
      BOOL v6 = v4 == 1;
    }
    else {
      BOOL v6 = 1;
    }
  }
  unint64_t v3 = v6 | 0xC;
  objc_storeStrong(&location, 0);
  return v3;
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  return 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)_accessibilityKeyCommandsShouldOverrideKeyCommands
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  unint64_t v8 = self;
  SEL v7 = a2;
  if ([(UICollectionViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    char v5 = 0;
    BOOL v3 = 0;
    if (([(UICollectionViewAccessibility *)v8 safeBoolForKey:@"_isFocusedOrAncestorOfFocusedView"] & 1) == 0)
    {
      id v6 = (id)[(UICollectionViewAccessibility *)v8 _axGetLastFocusedChild];
      char v5 = 1;
      BOOL v3 = v6 != 0;
    }
    BOOL v9 = v3;
    if (v5) {
  }
    }
  else
  {
    v4.receiver  = v8;
    v4.super_class  = (Class)UICollectionViewAccessibility;
    return [(UICollectionViewAccessibility *)&v4 canBecomeFocused];
  }
  return v9;
}

- (id)preferredFocusedView
{
  char v27 = self;
  v26[1]  = (id)a2;
  v25.receiver  = self;
  v25.super_class  = (Class)UICollectionViewAccessibility;
  v26[0]  = [(UICollectionViewAccessibility *)&v25 preferredFocusedView];
  if ([(UICollectionViewAccessibility *)v27 _accessibilityIsFKARunningForFocusItem])
  {
    id v24 = (id)[(UICollectionViewAccessibility *)v27 _axGetLastFocusedChild];
    id v23 = (id)[v24 _accessibilityFindAncestor:&__block_literal_global_638 startWithSelf:1];
    char v22 = 0;
    char v21 = 0;
    objc_opt_class();
    id v20 = (id)__UIAccessibilityCastAsClass();
    id v19 = v20;
    objc_storeStrong(&v20, 0);
    char v10 = [v19 _accessibilityViewIsVisible];

    char v22 = v10 & 1;
    char v18 = 0;
    char v16 = 0;
    BOOL v11 = 0;
    if ([v23 _isEligibleForFocusInteraction])
    {
      BOOL v11 = 0;
      if ([v23 isUserInteractionEnabled])
      {
        id v17 = (id)[v23 _accessibilityIndexPath];
        char v16 = 1;
        BOOL v11 = v17 != 0;
      }
    }
    if (v16) {

    }
    char v18 = v11;
    BOOL v15 = 0;
    char v9 = 0;
    if (v24)
    {
      char v9 = 0;
      if (v22)
      {
        char v8 = 1;
        if (v23) {
          char v8 = v18;
        }
        char v9 = v8;
      }
    }
    BOOL v15 = v9;
    if ((v9 & 1) == 0)
    {
      char v14 = 0;
      objc_opt_class();
      id v13 = (id)__UIAccessibilityCastAsSafeCategory();
      id v12 = v13;
      objc_storeStrong(&v13, 0);
      id v6 = v23;
      id v7 = (id)[(UICollectionViewAccessibility *)v27 visibleCells];
      id v2 = -[UIViewAccessibility _accessibilityViewMatchingFKAView:inArray:]((uint64_t)v12, v6, v7);
      id v3 = v24;
      id v24 = v2;

      [(UICollectionViewAccessibility *)v27 _axSetLastFocusedChild:v24];
      BOOL v15 = v24 != 0;
    }
    if (v15) {
      objc_storeStrong(v26, v24);
    }
    else {
      [(UICollectionViewAccessibility *)v27 _axSetLastFocusedChild:0];
    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  id v5 = v26[0];
  objc_storeStrong(v26, 0);

  return v5;
}

uint64_t __53__UICollectionViewAccessibility_preferredFocusedView__block_invoke(void *a1, void *a2)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass  = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (uint64_t)_axGetShouldIgnorePromiseRegions
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_axSetShouldIgnorePromiseRegions:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (id)_fulfillPromisedFocusRegionForCell:(id)a3
{
  char v8 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  if (-[UICollectionViewAccessibility _accessibilityIsFKARunningForFocusItem](v8, "_accessibilityIsFKARunningForFocusItem") & 1) != 0&& (-[UICollectionViewAccessibility _axGetShouldIgnorePromiseRegions]((uint64_t)v8))
  {
    id v9 = 0;
    int v6 = 1;
  }
  else
  {
    v5.receiver  = v8;
    v5.super_class  = (Class)UICollectionViewAccessibility;
    id v9 = [(UICollectionViewAccessibility *)&v5 _fulfillPromisedFocusRegionForCell:location[0]];
    int v6 = 1;
  }
  objc_storeStrong(location, 0);
  id v3 = v9;

  return v3;
}

- (BOOL)_shouldSelectionFollowFocusForIndexPath:(id)a3 initiatedBySelection:(BOOL)a4
{
  BOOL v11 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  char v8 = 0;
  v7.receiver  = v11;
  v7.super_class  = (Class)UICollectionViewAccessibility;
  char v8 = [(UICollectionViewAccessibility *)&v7 _shouldSelectionFollowFocusForIndexPath:location[0] initiatedBySelection:a4];
  if ([(UICollectionViewAccessibility *)v11 _accessibilityIsFKARunningForFocusItem])char v8 = 0; {
  char v5 = v8;
  }
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (id)accessibilityElementForRow:(unint64_t)a3 andColumn:(unint64_t)a4
{
  id v12 = self;
  SEL v11 = a2;
  unint64_t v10 = a3;
  unint64_t v9 = a4;
  id v8 = (id)[(UICollectionViewAccessibility *)self _accessibilityGetBlockForAttribute:5006];
  if (v8)
  {
    id v13 = objc_retainAutoreleasedReturnValue((id)(*((uint64_t (**)(id, unint64_t, unint64_t))v8
                                                  + 2))(v8, v10, v9));
    int v7 = 1;
  }
  else
  {
    id v6 = (id)[MEMORY[0x263F088C8] indexPathForItem:v10 inSection:v9];
    id v13 = [(UICollectionViewAccessibility *)v12 accessibilityCellForRowAtIndexPath:v6];
    int v7 = 1;
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_super v4 = v13;

  return v4;
}

- (id)_accessibilitySelectedChildren
{
  id v20 = self;
  v19[1]  = (id)a2;
  v19[0]  = (id)[(UICollectionViewAccessibility *)self indexPathsForSelectedItems];
  if ([(UICollectionViewAccessibility *)v20 _accessibilityShouldUseCollectionViewCellAccessibilityElements])
  {
    id v5 = v19[0];
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    char v16 = __63__UICollectionViewAccessibility__accessibilitySelectedChildren__block_invoke;
    id v17 = &unk_2650AEAF8;
    char v18 = v20;
    id v21 = (id)objc_msgSend(v5, "ax_flatMappedArrayUsingBlock:", &v13);
    objc_storeStrong((id *)&v18, 0);
  }
  else
  {
    id v4 = v19[0];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    unint64_t v9 = __63__UICollectionViewAccessibility__accessibilitySelectedChildren__block_invoke_2;
    unint64_t v10 = &unk_2650AEAF8;
    SEL v11 = v20;
    id v21 = (id)objc_msgSend(v4, "ax_flatMappedArrayUsingBlock:", &v6);
    objc_storeStrong((id *)&v11, 0);
  }
  int v12 = 1;
  objc_storeStrong(v19, 0);
  char v2 = v21;

  return v2;
}

id __63__UICollectionViewAccessibility__accessibilitySelectedChildren__block_invoke(id *a1, void *a2)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[a1[4] accessibilityCollectionCellElementForIndexPath:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

id __63__UICollectionViewAccessibility__accessibilitySelectedChildren__block_invoke_2(id *a1, void *a2)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[a1[4] accessibilityCellForRowAtIndexPath:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_accessibilityOpaqueHeaderElementInDirection:(int64_t)a3 childElement:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v38 = self;
  SEL v37 = a2;
  int64_t v36 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v34 = 0;
  id v33 = (id)[MEMORY[0x263F81198] options];
  if (location)
  {
    id v32 = [(UICollectionViewAccessibility *)v38 _accessibilitySortedElementsWithin];
    id v31 = (id)[MEMORY[0x263EFF980] array];
    id v30 = 0;
    memset(__b, 0, sizeof(__b));
    id obj = v32;
    uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0;
      unint64_t v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(obj);
        }
        id v29 = *(id *)(__b[1] + 8 * v14);
        id v27 = (id)[v29 _accessibilityLeafDescendantsWithOptions:v33];
        [v31 addObjectsFromArray:v27];
        if (v29 == location) {
          objc_storeStrong(&v30, v27);
        }
        objc_storeStrong(&v27, 0);
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    id v26 = 0;
    if (v30)
    {
      char v24 = 0;
      char v22 = 0;
      if (v36 == 1)
      {
        id v25 = (id)[v30 lastObject];
        char v24 = 1;
        objc_storeStrong(&v26, v25);
      }
      else
      {
        id v23 = (id)[v30 firstObject];
        char v22 = 1;
        objc_storeStrong(&v26, v23);
      }
      if (v22) {

      }
      if (v24) {
    }
      }
    else
    {
      objc_storeStrong(&v26, location);
    }
    uint64_t v21 = [v31 indexOfObject:v26];
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _AXAssert();
      os_log_t v18 = (os_log_t)(id)AXLogOpaqueElements();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v39, (uint64_t)location, (uint64_t)v31);
        _os_log_debug_impl(&dword_2402B7000, v18, OS_LOG_TYPE_DEBUG, "Could not find child element %@ in collection view elements %@. Falling through to existing search code.", v39, 0x16u);
      }
      objc_storeStrong((id *)&v18, 0);
    }
    else
    {
      id v6 = [(UICollectionViewAccessibility *)v38 _axOpaqueHeaderElementInDirection:v36 withinElements:v31 startIndex:v21];
      id v7 = v34;
      id v34 = v6;

      oslog  = (os_log_t)(id)AXLogOpaqueElements();
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v34);
        _os_log_debug_impl(&dword_2402B7000, oslog, type, "Header from existing sorted elements within: %@", v40, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (!v34)
      {
        id v8 = [(UICollectionViewAccessibility *)v38 _axOffScreenOpaqueHeaderElementInDirection:v36 options:v33 childElement:location];
        id v9 = v34;
        id v34 = v8;
      }
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    id v4 = [(UICollectionViewAccessibility *)v38 _axFirstLastOpaqueHeaderElementInDirection:v36 options:v33];
    id v5 = v34;
    id v34 = v4;
  }
  id v11 = v34;
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&location, 0);

  return v11;
}

- (id)_axOffScreenOpaqueHeaderElementInDirection:(int64_t)a3 options:(id)a4 childElement:(id)a5
{
  v45[1]  = *MEMORY[0x263EF8340];
  id v43 = self;
  SEL v42 = a2;
  int64_t v41 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v39 = 0;
  objc_storeStrong(&v39, a5);
  id v38 = 0;
  id v37 = v43;
  [v37 contentOffset];
  *(void *)&long long v36 = v5;
  *((void *)&v36 + 1)  = v6;
  id v35 = (id)[v37 indexPathsForVisibleItems];
  id v34 = (id)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"section" ascending:1];
  v45[0]  = v34;
  id v23 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
  id v22 = (id)objc_msgSend(v35, "sortedArrayUsingDescriptors:");
  id v33 = (id)[v22 mutableCopy];

  if ([v35 count])
  {
    if (v41 == 1)
    {
      id v19 = (id)[v33 lastObject];
      uint64_t v20 = [v19 section] + 1;

      uint64_t v32 = v20;
      uint64_t v31 = [v37 numberOfSections];
      for (uint64_t i = v20; i < v31; ++i)
      {
        id v7 = [(UICollectionViewAccessibility *)v43 _axFirstLastOpaqueHeaderElementFromSection:i options:location direction:v41];
        id v8 = v38;
        id v38 = v7;

        if (v38) {
          break;
        }
      }
    }
    else
    {
      id v17 = (id)[v33 firstObject];
      uint64_t v18 = [v17 section];

      uint64_t v29 = v18;
      for (j  = v18; j >= 0; --j)
      {
        id v9 = [(UICollectionViewAccessibility *)v43 _axFirstLastOpaqueHeaderElementFromSection:j options:location direction:v41];
        id v10 = v38;
        id v38 = v9;

        if ([v38 _accessibilityIsDescendantOfElement:v39]) {
          objc_storeStrong(&v38, 0);
        }
        if (v38) {
          break;
        }
      }
    }
  }
  else
  {
    id v27 = (id)AXLogOpaqueElements();
    char v26 = 2;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
    {
      log  = v27;
      os_log_type_t type = v26;
      __os_log_helper_16_0_0(v25);
      _os_log_debug_impl(&dword_2402B7000, log, type, "Got a collection view with no visible index paths! Falling back to usual opaque element search logic.", v25, 2u);
    }
    objc_storeStrong(&v27, 0);
  }
  if (!v38)
  {
    oslog  = (os_log_t)(id)AXLogOpaqueElements();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v39);
      _os_log_debug_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_DEBUG, "No headers found after %@.", v44, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [v37 setContentOffset:v36];
    id v11 = (id)[MEMORY[0x263EFF9D0] null];
    id v12 = v38;
    id v38 = v11;
  }
  id v14 = v38;
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&location, 0);

  return v14;
}

- (id)_axFirstLastOpaqueHeaderElementFromSection:(int64_t)a3 options:(id)a4 direction:(int64_t)a5
{
  id v30 = self;
  SEL v29 = a2;
  int64_t v28 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  int64_t v26 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  int v21 = 838860800;
  int v22 = 48;
  id v23 = __Block_byref_object_copy__6;
  char v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  id v18 = v30;
  id v17 = (id)[MEMORY[0x263F088C8] indexPathForItem:0 inSection:v28];
  id v16 = [(UICollectionViewAccessibility *)v30 _accessibilityLayoutAttributesForSupplementaryHeaderViewAtIndexPath:v17];
  [v16 frame];
  *(CGFloat *)&long long v9 = v32.origin.x;
  *((void *)&v9 + 1)  = *(void *)&v32.origin.y;
  *(CGFloat *)&long long v10 = v32.size.width;
  *((void *)&v10 + 1)  = *(void *)&v32.size.height;
  long long v14 = v9;
  long long v15 = v10;
  if (!CGRectIsEmpty(v32))
  {
    if ([v18 numberOfItemsInSection:v28] > 0) {
      [v18 scrollToItemAtIndexPath:v17 atScrollPosition:0 animated:0];
    }
    [v18 layoutIfNeeded];
    id v13 = [(UICollectionViewAccessibility *)v30 _accessibilitySupplementaryHeaderViewAtIndexPath:v17];
    id v5 = (id)[v13 _accessibilityLeafDescendantsWithOptions:location];
    id v12 = v5;
    if (v26 == 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", v6);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  id v8 = (id)v20[5];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  _Block_object_dispose(&v19, 8);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&location, 0);

  return v8;
}

void __94__UICollectionViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1]  = a1;
  location[0]  = 0;
  objc_storeStrong(location, a2);
  uint64_t v4 = [location[0] accessibilityTraits];
  if ((v4 & *MEMORY[0x263F1CEF8]) != 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), location[0]);
    *a4  = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_axOpaqueHeaderElementInDirection:(int64_t)a3 withinElements:(id)a4 startIndex:(unint64_t)a5
{
  int v21 = self;
  SEL v20 = a2;
  int64_t v19 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unint64_t v17 = a5;
  id v16 = 0;
  if (v19 == 1)
  {
    unint64_t v15 = [location count];
    for (unint64_t i = v17 + 1; i < v15; ++i)
    {
      id obj = (id)[location objectAtIndexedSubscript:i];
      uint64_t v5 = [obj accessibilityTraits];
      if ((v5 & *MEMORY[0x263F1CEF8]) != 0)
      {
        objc_storeStrong(&v16, obj);
        int v12 = 2;
      }
      else
      {
        int v12 = 0;
      }
      objc_storeStrong(&obj, 0);
      if (v12) {
        break;
      }
    }
  }
  else
  {
    for (j  = v17 - 1; j >= 0; --j)
    {
      id v10 = (id)[location objectAtIndexedSubscript:j];
      uint64_t v6 = [v10 accessibilityTraits];
      if ((v6 & *MEMORY[0x263F1CEF8]) != 0)
      {
        objc_storeStrong(&v16, v10);
        int v12 = 5;
      }
      else
      {
        int v12 = 0;
      }
      objc_storeStrong(&v10, 0);
      if (v12) {
        break;
      }
    }
  }
  id v8 = v16;
  int v12 = 1;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&location, 0);

  return v8;
}

- (id)_axFirstLastOpaqueHeaderElementInDirection:(int64_t)a3 options:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v24 = self;
  SEL v23 = a2;
  int64_t v22 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v20 = 0;
  id v19 = v24;
  uint64_t v18 = [v19 numberOfSections];
  [v19 contentOffset];
  *(void *)&long long v17 = v4;
  *((void *)&v17 + 1)  = v5;
  if (v22 == 1)
  {
    for (uint64_t i = 0; i < v18; ++i)
    {
      id v6 = [(UICollectionViewAccessibility *)v24 _axFirstLastOpaqueHeaderElementFromSection:i options:location direction:v22];
      id v7 = v20;
      id v20 = v6;

      if (v20) {
        break;
      }
    }
  }
  else
  {
    for (j  = v18 - 1; j >= 0; --j)
    {
      id v8 = [(UICollectionViewAccessibility *)v24 _axFirstLastOpaqueHeaderElementFromSection:j options:location direction:v22];
      id v9 = v20;
      id v20 = v8;

      if (v20) {
        break;
      }
    }
  }
  if (!v20)
  {
    oslog  = (os_log_t)(id)AXLogOpaqueElements();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v24);
      _os_log_debug_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_DEBUG, "No headers found in %@.", v25, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [v19 setContentOffset:v17];
    id v10 = (id)[MEMORY[0x263EFF9D0] null];
    id v11 = v20;
    id v20 = v10;
  }
  id v13 = v20;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);

  return v13;
}

@end