@interface UITableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanPerformEscapeAction;
- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused;
- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)_accessibilityKeyCommandsShouldOverrideKeyCommands;
- (BOOL)_accessibilityNativeFocusPreferredElementIsValid;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4;
- (BOOL)_accessibilityShouldDisableCellReuse;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (BOOL)_accessibilityShouldVerifyTableViewCellsAreVisibleByHitTesting;
- (BOOL)_accessibilitySpeakThisShouldOnlyIncludeVisibleElements;
- (BOOL)_automationPrefersRealElements;
- (BOOL)_shouldSelectionFollowFocusForIndexPath:(id)a3 initiatedBySelection:(BOOL)a4;
- (BOOL)_swipeDeletionCommitted;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)accessibilityScrollLeftPageSupported;
- (BOOL)accessibilityScrollRightPageSupported;
- (BOOL)isAccessibilityElement;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGRect)accessibilityFrame;
- (id)_accessibilityFirstVisibleItem;
- (id)_accessibilityFooterElement;
- (id)_accessibilityFuzzyHitTest:(id)obj withEvent:;
- (id)_accessibilityGroupIdentifier;
- (id)_accessibilityHeaderElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityInternalData;
- (id)_accessibilityInternalDataRetrieveOnly;
- (id)_accessibilityLastFocusedChild;
- (id)_accessibilityOpaqueHeaderElementInDirection:(int64_t)a3 childElement:(id)a4;
- (id)_accessibilityReorderMessageForNewIndexPath:(uint64_t)a3 swappedWithRow:(char)a4 movingDown:;
- (id)_accessibilityReusableViewForOpaqueElement:(id)a3;
- (id)_accessibilityRoleDescription;
- (id)_accessibilityScannerGroupElements;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySearchResultsTableView;
- (id)_accessibilitySelectedChildren;
- (id)_accessibilitySortedElementsWithin;
- (id)_accessibilitySortedElementsWithinPreservingFloatingHeader:(void *)a3 sortedElements:;
- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3;
- (id)_accessibilitySubviews;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibilityTableViewCellElementForIndexPath:(id)a3;
- (id)_accessibilityUIScrollViewScrollStatus;
- (id)_accessibilityUseOpaqueElements;
- (id)_accessibilityUserTestingVisibleCells;
- (id)_accessibilityUserTestingVisibleSections;
- (id)_accessibilityViewChildrenWithOptions:(id)a3;
- (id)_accessibilityVisibleHeaderSections;
- (id)_axAttemptCreationOfViewType:(id)obj identifier:;
- (id)_axAttemptStoryboard:(int)a3 viewType:;
- (id)_axFirstLastOpaqueHeaderElementFromSection:(int64_t)a3 options:(id)a4 direction:(int64_t)a5;
- (id)_axFirstLastOpaqueHeaderElementInDirection:(id)obj options:;
- (id)_axGetIndexGuide;
- (id)_axOffScreenOpaqueHeaderElementInDirection:(id)obj options:(void *)a4 childElement:;
- (id)_axOpaqueHeaderElementInDirection:(id)obj withinElements:(uint64_t)a4 startIndex:;
- (id)_axVisibleHeadersAndFootersAfterLastVisibleCellSection:(void *)a1;
- (id)_axVisibleHeadersAndFootersPriorToFirstVisibleCellSection:(void *)a1;
- (id)_childFocusViews;
- (id)_delegateViewForFooterInSection:(int64_t)a3;
- (id)_delegateViewForHeaderInSection:(int64_t)a3;
- (id)accessibilityCellForRowAtIndexPath:(id)a3;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityElementForRow:(unint64_t)a3 andColumn:(unint64_t)a4;
- (id)accessibilityLabel;
- (id)accessibilityTableViewCellAccessibilityElementForTableViewCell:(id)a3;
- (id)accessibilityTableViewCellElementAtGlobalRow:(int64_t)a3;
- (id)accessibilityTableViewSectionElementAtSection:(char)a3 isHeader:;
- (id)automationElements;
- (id)dequeueReusableCellWithIdentifier:(id)a3;
- (id)dequeueReusableCellWithIdentifier:(id)a3 forIndexPath:(id)a4;
- (id)dequeueReusableHeaderFooterViewWithIdentifier:(id)a3;
- (id)description;
- (id)indexPathsForRowsInRect:(CGRect)a3;
- (id)preferredFocusEnvironments;
- (id)preferredFocusedView;
- (int64_t)accessibilityContainerType;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (uint64_t)_accessibilityCheckForAlreadyExistingCellElementForCell:(void *)a3 inItems:;
- (uint64_t)_accessibilityDefaultTableViewCellScrollPosition;
- (uint64_t)_accessibilityHasAccessibleOrContainerSubview;
- (uint64_t)_accessibilityHasAccessibleOrContainerSubviewWithSubviewTree:(void *)a1;
- (uint64_t)_accessibilityIsSearchTableVisible;
- (uint64_t)_accessibilitySearchControllerDimmingViewVisible;
- (uint64_t)_accessibilitySearchTableViewVisible;
- (uint64_t)_accessibilitySetShouldConsiderSwipeDeletionCommitted:(uint64_t)result;
- (uint64_t)_accessibilityShouldConsiderSwipeDeletionCommitted;
- (uint64_t)_accessibilitySkipItemsInSectionList:(void *)a3 view:;
- (uint64_t)_accessibilitySwappedWithRowForInitialGlobalRow:(uint64_t)a3 oldGlobalRow:(uint64_t)a4 globalRow:;
- (uint64_t)_axNumberOfSections;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilitySemanticGroupChildrentCount;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityClearChildren;
- (void)_accessibilityInitializeInternalData;
- (void)_accessibilityOpaqueElementScrollCleanup;
- (void)_axPostLayoutChange;
- (void)_axSetIndexGuide:(uint64_t)a1;
- (void)_axSetupIndexGuide;
- (void)_axUpdateSelectedBackgroundVisibilityForCell:(id)a3 visible:(BOOL)a4;
- (void)_cellDidHideSelectedBackground:(id)a3;
- (void)_cellDidShowSelectedBackground:(id)a3;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_endReorderingForCell:(id)a3 wasCancelled:(BOOL)a4 animated:(BOOL)a5;
- (void)_reorderPositionChangedForCell:(id)a3;
- (void)_reuseTableViewSubview:(id)a3 viewType:(int)a4;
- (void)_setAccessibilitySearchControllerDimmingViewHidden;
- (void)_setAccessibilitySearchControllerDimmingViewVisible;
- (void)_setAccessibilitySearchTableViewHidden;
- (void)_setAccessibilitySearchTableViewVisible;
- (void)_updateDropTargetAppearanceWithTargetIndexPath:(id)a3 dropProposal:(id)a4 dropSession:(id)a5;
- (void)accessibilityFindMockParentForTableViewCell:(void *)a1;
- (void)dealloc;
- (void)deleteRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4;
- (void)deleteSections:(id)a3 withRowAnimation:(int64_t)a4;
- (void)insertRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4;
- (void)insertSections:(id)a3 withRowAnimation:(int64_t)a4;
- (void)reloadData;
- (void)reloadRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4;
- (void)reloadSections:(id)a3 withRowAnimation:(int64_t)a4;
- (void)setCountString:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setReusableCellsEnabled:(BOOL)a3;
- (void)setTableHeaderViewShouldAutoHide:(BOOL)a3;
@end

@implementation UITableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityUseOpaqueElements
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UITableViewAccessibility___accessibilityUseOpaqueElements);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)_accessibilityShouldConsiderSwipeDeletionCommitted
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_accessibilitySetShouldConsiderSwipeDeletionCommitted:(uint64_t)result
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
  v19 = location;
  id v18 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = @"UITableView";
  v15 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"cellForRowAtIndexPath:", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"dequeueReusableCellWithIdentifier:", v15, 0);
  v10 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"indexPathForRowAtGlobalRow:", v15, "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"numberOfRowsInSection:", v10, 0);
  v3 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"rectForFooterInSection:", v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"rectForHeaderInSection:", v3, v10, 0);
  v12 = "B";
  v17 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"scrollToRowAtIndexPath: atScrollPosition: animated:", v15, v10, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"setCountString:", v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_dataSourceImplementsTitleForFooterInSection", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_delegateImplementsViewForFooterInSection", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_delegateImplementsViewForHeaderInSection", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_delegateWantsFooterForSection:", v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_delegateWantsFooterTitleForSection:", v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_delegateWantsHeaderForSection:", v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_delegateWantsHeaderTitleForSection:", v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_endReorderingForCell: wasCancelled: animated:", v17, v15, v12, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_performAction: forCell: sender:", v17, ":", v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_reorderingSupport", v15, 0);
  v4 = "{_NSRange=QQ}";
  [location[0] validateClass:v16 hasInstanceMethod:@"_visibleGlobalRows" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_hasSwipeToDeleteRow", v12, 0);
  [location[0] validateClass:@"UISwipeActionPullView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_updateVisibleCellsImmediatelyIfNecessary", v17, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_floatingRectForHeaderInSection: heightCanBeGuessed:", v3, v10, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_floatingRectForFooterInSection: heightCanBeGuessed:", v3, v10, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_sectionsInRect:", v4, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_sectionForHeaderView:", v10, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_visibleHeaderFooterViews", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UISearchDisplayControllerContainerView", @"behindView", v15, 0);
  v5 = "i";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_nibMapForType:", v15, "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_createPreparedCellForRowAtIndexPath: willDisplay:", v15, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_dragAndDropUsedForReordering", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_reorderPositionChangedForCell:", v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_delegateViewForFooterInSection:", v15, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_delegateViewForHeaderInSection:", v15, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_configureCellForDisplay: forIndexPath:", v17, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_reuseTableViewSubview: viewType:", v17, v15, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_setupCell:forEditing:atIndexPath:animated:updateSeparators:", v17, v15, v12, v15, v12, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_updateDropTargetAppearanceWithTargetIndexPath:dropProposal:dropSession:", v17, v15, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_gapIndexPath", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_draggedIndexPath", v15, 0);
  v13 = @"UIScrollView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v16);
  v6 = @"UILayoutContainerView";
  v9 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UISplitViewControllerPanelImplView" isKindOfClass:v6];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v13, @"contentSize", "{CGSize=dd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"setContentOffset:", v17, "{CGPoint=dd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UISwipeActionController", @"currentSwipeOccurrence", v15, 0);
  v8 = @"UISwipeOccurrence";
  v7 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_pullViewForSwipeDirection:", v15, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_swipeDeletionCommitted", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_childFocusViews", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"preferredFocusedView", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"canBecomeFocused", v12, 0);
  [location[0] validateClass:v16 isKindOfClass:v9];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_isFocusedOrAncestorOfFocusedView", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_didUpdateFocusInContext:", v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_numberOfSections", v10, 0);
  v11 = @"UIResponder";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v16);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, @"canResignFirstResponder", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, @"becomeFirstResponder", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"pressesBegan:withEvent:", v17, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"pressesEnded:withEvent:", v17, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"pressesCancelled:withEvent:", v17, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_shouldSelectionFollowFocusForIndexPath:initiatedBySelection:", v15, v12, 0);
  v14 = "UIView<_UIScrollViewScrollIndicator>";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v13, @"_verticalScrollIndicator");
  [location[0] validateClass:v13 hasInstanceVariable:@"_horizontalScrollIndicator" withType:v14];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_cellDidShowSelectedBackground:", v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_cellDidHideSelectedBackground:", v17, v15, 0);
  objc_storeStrong(v19, v18);
}

- (unint64_t)_accessibilityAutomationType
{
  return 26;
}

- (id)indexPathsForRowsInRect:(CGRect)a3
{
  CGRect v8 = a3;
  v7 = self;
  SEL v6 = a2;
  if (-[UITableViewAccessibility _axNumberOfSections](self))
  {
    v5.receiver = v7;
    v5.super_class = (Class)UITableViewAccessibility;
    id v9 = -[UITableViewAccessibility indexPathsForRowsInRect:](&v5, sel_indexPathsForRowsInRect_, v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  }
  else
  {
    id v9 = 0;
  }
  v3 = v9;

  return v3;
}

- (uint64_t)_axNumberOfSections
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v8 = a1;
  if (!a1) {
    return 0;
  }
  uint64_t v7 = [v8 numberOfSections];
  uint64_t v6 = v7;
  id location = (id)[v8 safeValueForKey:@"_numberOfSections"];
  if (location)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [location integerValue];
      if (v7 != v4)
      {
        os_log_t oslog = (os_log_t)(id)AXLogAppAccessibility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v10, v7, v4);
          _os_log_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_INFO, "Number of sections from table view (%ld) and data source (%ld) differed while initializing accessibility data.", v10, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      if (v7 >= v4) {
        uint64_t v2 = v4;
      }
      else {
        uint64_t v2 = v7;
      }
      uint64_t v6 = v2;
    }
  }
  uint64_t v9 = v6;
  objc_storeStrong(&location, 0);
  return v9;
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  *(CGFloat *)&long long v23 = a3.origin.x;
  *((void *)&v23 + 1) = *(void *)&a3.origin.y;
  *(CGFloat *)&long long v24 = a3.size.width;
  *((void *)&v24 + 1) = *(void *)&a3.size.height;
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (location[0])
  {
    UIEdgeInsetsMake();
    double v17 = v4;
    double v18 = v5;
    uint64_t v19 = v6;
    uint64_t v20 = v7;
    *(void *)&long long v15 = UIEdgeInsetsInsetRect_1(*(double *)&v23, *((double *)&v23 + 1), *(double *)&v24, *((double *)&v24 + 1), v4, v5);
    *((void *)&v15 + 1) = v8;
    *(void *)&long long v16 = v9;
    *((void *)&v16 + 1) = v10;
    long long v23 = v15;
    long long v24 = v16;
  }
  v14.receiver = v22;
  v14.super_class = (Class)UITableViewAccessibility;
  unsigned __int8 v13 = -[UITableViewAccessibility _accessibilityScrollToFrame:forView:](&v14, sel__accessibilityScrollToFrame_forView_, location[0], v23, v24, location);
  objc_storeStrong(v12, 0);
  return v13 & 1;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewAccessibility *)self _accessibilityValueForKey:@"AXTableViewOpaqueScrollsIntoViewKey"];
  if (location[0]) {
    char v4 = [location[0] BOOLValue] & 1;
  }
  else {
    char v4 = 1;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  id v2 = -[UITableViewAccessibility _accessibilityUseOpaqueElements](self);
  BOOL v5 = v2 == 0;

  if (v5) {
    return -[UITableViewAccessibility _automationPrefersRealElements](self)
  }
        || ([(id)*MEMORY[0x263F1D020] _accessibilityWantsOpaqueElementProviders] & 1) != 0;
  id v4 = -[UITableViewAccessibility _accessibilityUseOpaqueElements](self);
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (BOOL)_automationPrefersRealElements
{
  if (a1)
  {
    if (AXDoesRequestingClientDeserveAutomation())
    {
      if ([a1 _accessibilityFauxTableViewCellsDisabled]) {
        return 1;
      }
      else {
        return !_AXSAutomationFauxTableViewCellsEnabled() || (UIAccessibilityIsAppExtension() & 1) != 0;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 0;
  }
}

- (id)_axOpaqueHeaderElementInDirection:(id)obj withinElements:(uint64_t)a4 startIndex:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v25 = a1;
  uint64_t v24 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v22 = a4;
  if (v25)
  {
    id v20 = 0;
    id v19 = (id)MEMORY[0x2455E7040](&__block_literal_global_38);
    if (v24 == 1)
    {
      unint64_t v18 = [location count];
      for (unint64_t i = v22 + 1; i < v18; ++i)
      {
        id v12 = (id)[location objectAtIndexedSubscript:i];
        char v13 = (*((uint64_t (**)(void))v19 + 2))();

        if (v13)
        {
          id v4 = (id)[location objectAtIndexedSubscript:i];
          id v5 = v20;
          id v20 = v4;

          break;
        }
      }
    }
    else
    {
      for (uint64_t j = v22 - 1; j >= 0; --j)
      {
        id v10 = (id)[location objectAtIndexedSubscript:j];
        char v11 = (*((uint64_t (**)(void))v19 + 2))();

        if (v11)
        {
          id v6 = (id)[location objectAtIndexedSubscript:j];
          id v7 = v20;
          id v20 = v6;

          break;
        }
      }
    }
    os_log_t oslog = (os_log_t)(id)AXLogElementTraversal();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v20);
      _os_log_debug_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_DEBUG, "got me opaque header: %@", v27, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v26 = v20;
    int v21 = 1;
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    id v26 = 0;
    int v21 = 1;
  }
  objc_storeStrong(&location, 0);
  uint64_t v8 = v26;

  return v8;
}

uint64_t __88__UITableViewAccessibility__axOpaqueHeaderElementInDirection_withinElements_startIndex___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char IsHeaderInSearchContexts = _UIAXElementIsHeaderInSearchContexts(location[0]);
  objc_storeStrong(location, 0);
  return IsHeaderInSearchContexts & 1;
}

- (id)_axFirstLastOpaqueHeaderElementFromSection:(int64_t)a3 options:(id)a4 direction:(int64_t)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  v74 = self;
  SEL v73 = a2;
  int64_t v72 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  int64_t v70 = a5;
  uint64_t v63 = 0;
  v64 = &v63;
  int v65 = 838860800;
  int v66 = 48;
  v67 = __Block_byref_object_copy__20;
  v68 = __Block_byref_object_dispose__20;
  id v69 = 0;
  id v62 = v74;
  [v62 rectForHeaderInSection:v72];
  rect.origin.x = v5;
  rect.origin.y = v6;
  rect.size.width = v7;
  rect.size.height = v8;
  os_log_t oslog = (os_log_t)(id)AXLogOpaqueElements();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = v72;
    v29 = NSStringFromCGRect(rect);
    id v58 = v29;
    __os_log_helper_16_2_2_8_0_8_66((uint64_t)v77, v30, (uint64_t)v58);
    _os_log_debug_impl(&dword_2402B7000, oslog, type, "Rect for header in section %ld: %{public}@", v77, 0x16u);

    objc_storeStrong(&v58, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (!CGRectIsEmpty(rect))
  {
    objc_msgSend(v62, "scrollRectToVisible:animated:", 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    [v62 layoutIfNeeded];
    id v57 = 0;
    char v55 = 0;
    objc_opt_class();
    id v28 = (id)[(UITableViewAccessibility *)v74 safeValueForKey:@"_visibleHeaderFooterViews"];
    id v54 = (id)__UIAccessibilityCastAsClass();

    id v53 = v54;
    objc_storeStrong(&v54, 0);
    id v56 = v53;
    memset(__b, 0, sizeof(__b));
    obuint64_t j = v53;
    uint64_t v27 = [obj countByEnumeratingWithState:__b objects:v76 count:16];
    if (v27)
    {
      uint64_t v23 = *(void *)__b[2];
      uint64_t v24 = 0;
      unint64_t v25 = v27;
      while (1)
      {
        uint64_t v22 = v24;
        if (*(void *)__b[2] != v23) {
          objc_enumerationMutation(obj);
        }
        id v52 = *(id *)(__b[1] + 8 * v24);
        uint64_t v46 = 0;
        v47 = &v46;
        int v48 = 0x20000000;
        int v49 = 32;
        uint64_t v50 = 0;
        uint64_t v39 = MEMORY[0x263EF8330];
        int v40 = -1073741824;
        int v41 = 0;
        v42 = __89__UITableViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke;
        v43 = &unk_2650ADF88;
        v45[1] = &v46;
        id v44 = v62;
        v45[0] = v52;
        AXPerformSafeBlock();
        uint64_t v38 = v47[3];
        objc_storeStrong(v45, 0);
        objc_storeStrong(&v44, 0);
        _Block_object_dispose(&v46, 8);
        if (v38 == v72) {
          break;
        }
        ++v24;
        if (v22 + 1 >= v25)
        {
          uint64_t v24 = 0;
          unint64_t v25 = [obj countByEnumeratingWithState:__b objects:v76 count:16];
          if (!v25) {
            goto LABEL_12;
          }
        }
      }
      objc_storeStrong(&v57, v52);
      int v37 = 2;
    }
    else
    {
LABEL_12:
      int v37 = 0;
    }

    os_log_t v36 = (os_log_t)(id)AXLogOpaqueElements();
    os_log_type_t v35 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = @"Previous";
      if (v70 != 2) {
        uint64_t v9 = @"Next";
      }
      uint64_t v20 = (uint64_t)v9;
      uint64_t v21 = v72;
      id v19 = (id)[v57 recursiveDescription];
      id v34 = v19;
      __os_log_helper_16_2_3_8_66_8_0_8_66((uint64_t)v75, v20, v21, (uint64_t)v34);
      _os_log_debug_impl(&dword_2402B7000, v36, v35, "%{public}@ header view at section %ld: %{public}@", v75, 0x20u);

      objc_storeStrong(&v34, 0);
    }
    objc_storeStrong((id *)&v36, 0);
    id v33 = 0;
    if (v57)
    {
      id v10 = (id)[v57 _accessibilityLeafDescendantsWithOptions:location];
      id v11 = v33;
      id v33 = v10;
    }
    else if ([v62 numberOfRowsInSection:v72] > 0)
    {
      id v18 = v62;
      id v17 = (id)[MEMORY[0x263F088C8] indexPathForRow:0 inSection:v72];
      id v32 = (id)objc_msgSend(v18, "cellForRowAtIndexPath:");

      id v12 = (id)[v32 _accessibilityLeafDescendantsWithOptions:location];
      id v13 = v33;
      id v33 = v12;

      objc_storeStrong(&v32, 0);
    }
    if (v70 == 2) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 0;
    }
    objc_msgSend(v33, "enumerateObjectsWithOptions:usingBlock:", v14);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v57, 0);
  }
  id v16 = (id)v64[5];
  int v37 = 1;
  objc_storeStrong(&v62, 0);
  _Block_object_dispose(&v63, 8);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&location, 0);

  return v16;
}

uint64_t __89__UITableViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _sectionForHeaderView:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __89__UITableViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke_560(NSObject *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v10 = a3;
  uint64_t v9 = a4;
  oslog[1] = a1;
  if (_UIAXElementIsHeaderInSearchContexts(location[0]))
  {
    oslog[0] = (os_log_t)(id)AXLogOpaqueElements();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      if (a1[5].isa == (Class)2) {
        id v4 = @"previous";
      }
      else {
        id v4 = @"next";
      }
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v12, (uint64_t)v4, (uint64_t)location[0]);
      _os_log_debug_impl(&dword_2402B7000, oslog[0], OS_LOG_TYPE_DEBUG, "Found %{public}@ header element %{public}@", v12, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
    objc_storeStrong((id *)(*((void *)a1[4].isa + 1) + 40), location[0]);
    unsigned char *v9 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_axFirstLastOpaqueHeaderElementInDirection:(id)obj options:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v27 = a1;
  uint64_t v26 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v27)
  {
    id v23 = 0;
    id v22 = v27;
    uint64_t v21 = -[UITableViewAccessibility _axNumberOfSections](v27);
    [v22 contentOffset];
    *(void *)&long long v20 = v3;
    *((void *)&v20 + 1) = v4;
    if (v26 == 1)
    {
      for (uint64_t i = 0; i < v21; ++i)
      {
        id v5 = (id)[v27 _axFirstLastOpaqueHeaderElementFromSection:i options:location direction:v26];
        id v6 = v23;
        id v23 = v5;

        if (v23) {
          break;
        }
      }
    }
    else
    {
      for (uint64_t j = v21 - 1; j >= 0; --j)
      {
        id v7 = (id)[v27 _axFirstLastOpaqueHeaderElementFromSection:j options:location direction:v26];
        id v8 = v23;
        id v23 = v7;

        if (v23) {
          break;
        }
      }
    }
    if (!v23)
    {
      os_log_t oslog = (os_log_t)(id)AXLogOpaqueElements();
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v30, (uint64_t)v27);
        _os_log_debug_impl(&dword_2402B7000, oslog, type, "No headers found in %{public}@.", v30, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      long long v15 = v20;
      long long v14 = v20;
      [v22 setContentOffset:v20];
      id v9 = (id)[MEMORY[0x263EFF9D0] null];
      id v10 = v23;
      id v23 = v9;
    }
    os_log_t v13 = (os_log_t)(id)AXLogElementTraversal();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v23);
      _os_log_debug_impl(&dword_2402B7000, v13, OS_LOG_TYPE_DEBUG, "First/Last opaque header, %@", v29, 0xCu);
    }
    objc_storeStrong((id *)&v13, 0);
    id v28 = v23;
    int v24 = 1;
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    id v28 = 0;
    int v24 = 1;
  }
  objc_storeStrong(&location, 0);
  id v11 = v28;

  return v11;
}

- (id)_axOffScreenOpaqueHeaderElementInDirection:(id)obj options:(void *)a4 childElement:
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  SEL v73 = a1;
  uint64_t v72 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v70 = 0;
  objc_storeStrong(&v70, a4);
  if (v73)
  {
    id v68 = 0;
    id v67 = v73;
    [v67 contentOffset];
    *(void *)&long long v21 = v4;
    *((void *)&v21 + 1) = v5;
    long long v66 = v21;
    [v67 visibleBounds];
    *(void *)&long long v19 = v6;
    *((void *)&v19 + 1) = v7;
    *(void *)&long long v20 = v8;
    *((void *)&v20 + 1) = v9;
    long long v64 = v19;
    long long v65 = v20;
    NSRange v63 = (NSRange)0;
    uint64_t v56 = 0;
    id v57 = &v56;
    int v58 = 0x10000000;
    int v59 = 48;
    v60 = &unk_24046C852;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    oslog[3] = (os_log_t)MEMORY[0x263EF8330];
    int v49 = -1073741824;
    int v50 = 0;
    v51 = __92__UITableViewAccessibility__axOffScreenOpaqueHeaderElementInDirection_options_childElement___block_invoke;
    id v52 = &unk_2650AF298;
    v53[1] = &v56;
    v53[0] = v67;
    long long v54 = v64;
    long long v55 = v65;
    AXPerformSafeBlock();
    NSRange v63 = (NSRange)*((_OWORD *)v57 + 2);
    objc_storeStrong(v53, 0);
    _Block_object_dispose(&v56, 8);
    oslog[0] = (os_log_t)(id)AXLogOpaqueElements();
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      id v18 = NSStringFromRange(v63);
      id v46 = v18;
      __os_log_helper_16_2_1_8_66((uint64_t)v78, (uint64_t)v46);
      _os_log_debug_impl(&dword_2402B7000, oslog[0], type, "Visible sections: %{public}@", v78, 0xCu);

      objc_storeStrong(&v46, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
    for (uint64_t i = (char *)v63.location; ; ++i)
    {
      NSRange v76 = v63;
      if ((unint64_t)i >= v63.location + v63.length) {
        break;
      }
      uint64_t v36 = 0;
      int v37 = &v36;
      int v38 = 838860800;
      int v39 = 48;
      int v40 = __Block_byref_object_copy__20;
      int v41 = __Block_byref_object_dispose__20;
      id v42 = 0;
      uint64_t v30 = MEMORY[0x263EF8330];
      int v31 = -1073741824;
      int v32 = 0;
      id v33 = __92__UITableViewAccessibility__axOffScreenOpaqueHeaderElementInDirection_options_childElement___block_invoke_570;
      id v34 = &unk_2650AE6B8;
      v35[1] = &v36;
      v35[0] = v73;
      v35[2] = i;
      AXPerformSafeBlock();
      id v29 = (id)v37[5];
      objc_storeStrong(v35, 0);
      _Block_object_dispose(&v36, 8);
      objc_storeStrong(&v42, 0);
      id v43 = v29;
      if (v29 == v70)
      {
        uint64_t v45 = (uint64_t)i;
        int v69 = 2;
      }
      else
      {
        int v69 = 0;
      }
      objc_storeStrong(&v43, 0);
      if (v69) {
        break;
      }
    }
    if (v72 == 1)
    {
      NSRange v75 = v63;
      NSUInteger v28 = v63.location + v63.length;
      unint64_t v27 = -[UITableViewAccessibility _axNumberOfSections](v73);
      for (NSUInteger j = v28; j < v27; ++j)
      {
        id v10 = (id)[v73 _axFirstLastOpaqueHeaderElementFromSection:j options:location direction:v72];
        id v11 = v68;
        id v68 = v10;

        if (v68)
        {
          if (v45 != j) {
            break;
          }
        }
      }
    }
    else
    {
      NSUInteger v25 = v63.location;
      for (NSUInteger k = v63.location; ; --k)
      {
        id v12 = (id)[v73 _axFirstLastOpaqueHeaderElementFromSection:k options:location direction:v72];
        id v13 = v68;
        id v68 = v12;

        if (v68)
        {
          if (v45 != k) {
            break;
          }
        }
        if (!k) {
          break;
        }
      }
    }
    if (!v68 || v68 == v70)
    {
      os_log_t v23 = (os_log_t)(id)AXLogOpaqueElements();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v77, (uint64_t)v70);
        _os_log_debug_impl(&dword_2402B7000, v23, OS_LOG_TYPE_DEBUG, "No headers found after %{public}@.", v77, 0xCu);
      }
      objc_storeStrong((id *)&v23, 0);
      [v67 setContentOffset:v66];
      id v14 = (id)[MEMORY[0x263EFF9D0] null];
      id v15 = v68;
      id v68 = v14;
    }
    id v74 = v68;
    int v69 = 1;
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, 0);
  }
  else
  {
    id v74 = 0;
    int v69 = 1;
  }
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&location, 0);
  id v16 = v74;

  return v16;
}

__n128 __92__UITableViewAccessibility__axOffScreenOpaqueHeaderElementInDirection_options_childElement___block_invoke(uint64_t a1)
{
  v4.n128_u64[0] = objc_msgSend(*(id *)(a1 + 32), "_sectionsInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4.n128_u64[1] = v1;
  __n128 result = v4;
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v4;
  return result;
}

void __92__UITableViewAccessibility__axOffScreenOpaqueHeaderElementInDirection_options_childElement___block_invoke_570(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _visibleHeaderViewForSection:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (id)_accessibilityOpaqueHeaderElementInDirection:(int64_t)a3 childElement:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  int v41 = self;
  SEL v40 = a2;
  uint64_t v39 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v37 = 0;
  id v36 = (id)[MEMORY[0x263F81198] options];
  if (location)
  {
    id v35 = [(UITableViewAccessibility *)v41 _accessibilitySortedElementsWithinWithOptions:v36];
    id v34 = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    obNSUInteger j = v35;
    uint64_t v22 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
    if (v22)
    {
      uint64_t v18 = *(void *)__b[2];
      uint64_t v19 = 0;
      unint64_t v20 = v22;
      while (1)
      {
        uint64_t v17 = v19;
        if (*(void *)__b[2] != v18) {
          objc_enumerationMutation(obj);
        }
        id v33 = *(id *)(__b[1] + 8 * v19);
        id v15 = v34;
        id v16 = (id)[v33 _accessibilityLeafDescendantsWithOptions:v36];
        objc_msgSend(v15, "addObjectsFromArray:");

        ++v19;
        if (v17 + 1 >= v20)
        {
          uint64_t v19 = 0;
          unint64_t v20 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
          if (!v20) {
            break;
          }
        }
      }
    }

    id v31 = (id)[location _accessibilityLeafDescendantsWithOptions:v36];
    uint64_t v30 = 0;
    char v28 = 0;
    char v26 = 0;
    if (v39 == 1)
    {
      id v13 = v34;
      id v29 = (id)[v31 lastObject];
      char v28 = 1;
      uint64_t v14 = objc_msgSend(v13, "indexOfObject:");
    }
    else
    {
      id v12 = v34;
      id v27 = (id)[v31 firstObject];
      char v26 = 1;
      uint64_t v14 = objc_msgSend(v12, "indexOfObject:");
    }
    if (v26) {

    }
    if (v28) {
    uint64_t v30 = v14;
    }
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      _AXAssert();
    }
    if (v30 == 0x7FFFFFFFFFFFFFFFLL)
    {
      os_log_t v23 = (os_log_t)(id)AXLogOpaqueElements();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v42, (uint64_t)location, (uint64_t)v34);
        _os_log_debug_impl(&dword_2402B7000, v23, OS_LOG_TYPE_DEBUG, "Could not find child element %{public}@ in table view elements %{public}@. Falling through to existing search code.", v42, 0x16u);
      }
      objc_storeStrong((id *)&v23, 0);
    }
    else
    {
      id v6 = -[UITableViewAccessibility _axOpaqueHeaderElementInDirection:withinElements:startIndex:]((uint64_t)v41, v39, v34, v30);
      id v7 = v37;
      id v37 = v6;

      os_log_t oslog = (os_log_t)(id)AXLogOpaqueElements();
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v43, (uint64_t)v37);
        _os_log_debug_impl(&dword_2402B7000, oslog, type, "Header from existing sorted elements within: %{public}@", v43, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (!v37)
      {
        id v8 = -[UITableViewAccessibility _axOffScreenOpaqueHeaderElementInDirection:options:childElement:](v41, v39, v36, location);
        id v9 = v37;
        id v37 = v8;
      }
    }
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  else
  {
    id v4 = -[UITableViewAccessibility _axFirstLastOpaqueHeaderElementInDirection:options:](v41, v39, v36);
    id v5 = v37;
    id v37 = v4;
  }
  id v11 = v37;
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&location, 0);

  return v11;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  uint64_t v14 = self;
  v13[1] = (id)a2;
  v13[0] = (id)[MEMORY[0x263EFF980] array];
  id v12 = [(UITableViewAccessibility *)v14 _accessibilityHeaderElement];
  if ([v12 isAccessibilityElement])
  {
    [v13[0] addObject:v12];
  }
  else
  {
    char v9 = 0;
    char v7 = 0;
    if ([v12 _accessibilityHasOrderedChildren])
    {
      id v10 = (id)[v12 _accessibilityElements];
      char v9 = 1;
      id v2 = v10;
    }
    else
    {
      id v8 = (id)[v12 _accessibilitySubviews];
      char v7 = 1;
      id v2 = v8;
    }
    id location = v2;
    if (v7) {

    }
    if (v9) {
    if ([location count])
    }
      [v13[0] addObjectsFromArray:location];
    objc_storeStrong(&location, 0);
  }
  id v6 = (id)[(UITableViewAccessibility *)v14 safeValueForKey:@"_index"];
  if ([v6 _accessibilityViewIsVisible]) {
    [v13[0] axSafelyAddObject:v6];
  }
  if (-[UITableViewAccessibility _accessibilityIsSearchTableVisible](v14))
  {
    id v5 = -[UITableViewAccessibility _accessibilitySearchResultsTableView](v14);
    if (v5) {
      [v13[0] addObject:v5];
    }
    objc_storeStrong(&v5, 0);
  }
  id v4 = v13[0];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);

  return v4;
}

- (uint64_t)_accessibilityIsSearchTableVisible
{
  if (a1)
  {
    NSClassFromString(&cfstr_Uisearchresult.isa);
    char v3 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v2 = 1;
      if ((-[UITableViewAccessibility _accessibilitySearchTableViewVisible](a1) & 1) == 0) {
        char v2 = -[UITableViewAccessibility _accessibilitySearchControllerDimmingViewVisible](a1);
      }
      char v3 = v2;
    }
    char v5 = v3 & 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (id)_accessibilitySearchResultsTableView
{
  id v8 = a1;
  if (a1)
  {
    id location = (id)[v8 safeValueForKey:@"subviews"];
    uint64_t v6 = [location indexOfObjectPassingTest:&__block_literal_global_669];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = 0;
    }
    else
    {
      id v5 = (id)[location objectAtIndex:v6];
      id v4 = (id)[v5 safeValueForKey:@"behindView"];
      id v3 = (id)[v4 subviews];
      id v9 = (id)[v3 lastObject];
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v9 = 0;
  }
  id v1 = v9;

  return v1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)[MEMORY[0x263EFF980] array];
  id v7 = [(UITableViewAccessibility *)v9 _accessibilityFooterElement];
  if ([v7 isAccessibilityElement])
  {
    [v8[0] addObject:v7];
  }
  else
  {
    id location = (id)[v7 _accessibilitySubviews];
    if ([location count]) {
      [v8[0] addObjectsFromArray:location];
    }
    objc_storeStrong(&location, 0);
  }
  id v5 = (id)[(UITableViewAccessibility *)v9 safeValueForKey:@"_verticalScrollIndicator"];
  if ([v5 isAccessibilityElement]) {
    [v8[0] addObject:v5];
  }
  id v4 = (id)[(UITableViewAccessibility *)v9 safeValueForKey:@"_horizontalScrollIndicator"];
  if ([v4 isAccessibilityElement]) {
    [v8[0] addObject:v4];
  }
  id v3 = v8[0];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);

  return v3;
}

- (void)insertSections:(id)a3 withRowAnimation:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v5 insertSections:location[0] withRowAnimation:a4];
  if ([location[0] count]) {
    [(UITableViewAccessibility *)v8 _accessibilityClearChildren];
  }
  objc_storeStrong(location, 0);
}

- (void)deleteSections:(id)a3 withRowAnimation:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v5 deleteSections:location[0] withRowAnimation:a4];
  if ([location[0] count]) {
    [(UITableViewAccessibility *)v8 _accessibilityClearChildren];
  }
  objc_storeStrong(location, 0);
}

- (void)reloadSections:(id)a3 withRowAnimation:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v5 reloadSections:location[0] withRowAnimation:a4];
  if ([location[0] count]) {
    [(UITableViewAccessibility *)v8 _accessibilityClearChildren];
  }
  objc_storeStrong(location, 0);
}

- (void)insertRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v5 insertRowsAtIndexPaths:location[0] withRowAnimation:a4];
  if ([location[0] count]) {
    [(UITableViewAccessibility *)v8 _accessibilityClearChildren];
  }
  objc_storeStrong(location, 0);
}

- (void)deleteRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v5 deleteRowsAtIndexPaths:location[0] withRowAnimation:a4];
  if ([location[0] count]) {
    [(UITableViewAccessibility *)v8 _accessibilityClearChildren];
  }
  objc_storeStrong(location, 0);
}

- (void)reloadRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v5 reloadRowsAtIndexPaths:location[0] withRowAnimation:a4];
  [location[0] count];
  objc_storeStrong(location, 0);
}

- (void)reloadData
{
  objc_super v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v3 reloadData];
  id location = (id)[(UITableViewAccessibility *)v5 _accessibilityValueForKey:@"AXInternalData"];
  if (location) {
    [(UITableViewAccessibility *)v5 _accessibilityClearChildren];
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)accessibilityScrollLeftPageSupported
{
  return 0;
}

- (BOOL)accessibilityScrollRightPageSupported
{
  return 0;
}

- (void)setReusableCellsEnabled:(BOOL)a3
{
  int64_t v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  id v3 = (id)[(UITableViewAccessibility *)self _accessibilityValueForKey:@"AXInternalData"];
  -[_AXTableViewInternal setReusableCellsEnabled:]((uint64_t)v3, v4);
  objc_storeStrong(&v3, 0);
}

- (void)setTableHeaderViewShouldAutoHide:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3.receiver = v7;
    v3.super_class = (Class)UITableViewAccessibility;
    [(UITableViewAccessibility *)&v3 setTableHeaderViewShouldAutoHide:0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UITableViewAccessibility;
    [(UITableViewAccessibility *)&v4 setTableHeaderViewShouldAutoHide:v5];
  }
}

- (id)_axAttemptStoryboard:(int)a3 viewType:
{
  id v38 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  int v36 = a3;
  if (v38)
  {
    id v34 = 0;
    uint64_t v26 = 0;
    id v27 = &v26;
    int v28 = 838860800;
    int v29 = 48;
    uint64_t v30 = __Block_byref_object_copy__20;
    id v31 = __Block_byref_object_dispose__20;
    id v32 = 0;
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    long long v21 = __58__UITableViewAccessibility__axAttemptStoryboard_viewType___block_invoke;
    uint64_t v22 = &unk_2650AF2C0;
    v24[1] = &v26;
    id v23 = v38;
    int v25 = v36;
    v24[0] = location;
    AXPerformSafeBlock();
    id v17 = (id)v27[5];
    objc_storeStrong(v24, 0);
    objc_storeStrong(&v23, 0);
    _Block_object_dispose(&v26, 8);
    objc_storeStrong(&v32, 0);
    id v33 = v17;
    if (v17)
    {
      id v8 = (id)[v38 safeValueForKey:@"_nibExternalObjectsTables"];
      id v16 = (id)[v8 objectForKey:location];

      char v13 = 0;
      if (v16)
      {
        id v14 = (id)[NSDictionary dictionaryWithObject:v16 forKey:*MEMORY[0x263F1D4E0]];
        char v13 = 1;
        id v3 = v14;
      }
      else
      {
        id v3 = 0;
      }
      id v15 = v3;
      if (v13) {

      }
      id v12 = (id)[v33 instantiateWithOwner:0 options:v15];
      if ([v12 count] == 1)
      {
        id v4 = (id)[v12 objectAtIndex:0];
        id v5 = v34;
        id v34 = v4;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v10 = v34;
        id v11 = location;
        AXPerformSafeBlock();
        objc_storeStrong(&v11, 0);
        objc_storeStrong(&v10, 0);
      }
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
    }
    id v39 = v34;
    int v35 = 1;
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    id v39 = 0;
    int v35 = 1;
  }
  objc_storeStrong(&location, 0);
  SEL v6 = v39;

  return v6;
}

void __58__UITableViewAccessibility__axAttemptStoryboard_viewType___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 32) _nibMapForType:*(unsigned int *)(a1 + 56)];
  id v1 = (id)[v5 valueForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

uint64_t __58__UITableViewAccessibility__axAttemptStoryboard_viewType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setReuseIdentifier:", *(void *)(a1 + 40), a1, a1);
}

- (id)_axAttemptCreationOfViewType:(id)obj identifier:
{
  id v23 = a1;
  int v22 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v23)
  {
    id v19 = -[UITableViewAccessibility _axAttemptStoryboard:viewType:](v23, location, v22);
    if (!v19)
    {
      uint64_t v14 = 0;
      id v15 = &v14;
      int v16 = 1342177280;
      int v17 = 32;
      uint64_t v18 = 0;
      v12[1] = &v14;
      id v11 = v23;
      int v13 = v22;
      v12[0] = location;
      AXPerformSafeBlock();
      if (v22 == 1)
      {
        id v10 = objc_alloc((Class)v15[3]);
        id v9 = (void *)[v10 initWithStyle:0 reuseIdentifier:location];
        id v3 = v19;
        id v19 = v9;

        [v19 setReuseIdentifier:location];
      }
      else
      {
        id v8 = objc_alloc((Class)v15[3]);
        id v7 = (void *)[v8 initWithReuseIdentifier:location];
        id v4 = v19;
        id v19 = v7;
      }
      objc_storeStrong(v12, 0);
      objc_storeStrong(&v11, 0);
      _Block_object_dispose(&v14, 8);
    }
    id v24 = v19;
    int v20 = 1;
    objc_storeStrong(&v19, 0);
  }
  else
  {
    id v24 = 0;
    int v20 = 1;
  }
  objc_storeStrong(&location, 0);
  id v5 = v24;

  return v5;
}

void __68__UITableViewAccessibility__axAttemptCreationOfViewType_identifier___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _classMapForType:*(unsigned int *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (id)[v2 valueForKey:*(void *)(a1 + 40)];
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
    v4 += [v9[0] numberOfRowsInSection:i];
  objc_storeStrong(v9, 0);
  return v4;
}

- (BOOL)_accessibilityShouldDisableCellReuse
{
  if (a1)
  {
    if (-[UITableViewAccessibility _automationPrefersRealElements](a1))
    {
      return 0;
    }
    else
    {
      BOOL v2 = 0;
      if (([a1 isAccessibilityOpaqueElementProvider] & 1) == 0) {
        return UIAccessibilityIsVoiceOverRunning();
      }
      return v2;
    }
  }
  else
  {
    return 0;
  }
}

- (id)dequeueReusableCellWithIdentifier:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[UITableViewAccessibility _accessibilityShouldDisableCellReuse](v9))
  {
    id v7 = -[UITableViewAccessibility _axAttemptStoryboard:viewType:](v9, location[0], 1);
    if (!v7)
    {
      id v7 = -[UITableViewAccessibility _axAttemptCreationOfViewType:identifier:](v9, 1, location[0]);
    }
    id v10 = v7;
    int v6 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)UITableViewAccessibility;
    id v10 = [(UITableViewAccessibility *)&v5 dequeueReusableCellWithIdentifier:location[0]];
    int v6 = 1;
  }
  objc_storeStrong(location, 0);
  id v3 = v10;

  return v3;
}

- (id)dequeueReusableCellWithIdentifier:(id)a3 forIndexPath:(id)a4
{
  int v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  if (-[UITableViewAccessibility _accessibilityShouldDisableCellReuse](v20))
  {
    id v17 = -[UITableViewAccessibility _axAttemptCreationOfViewType:identifier:](v20, 1, location[0]);
    if (v17)
    {
      uint64_t v9 = MEMORY[0x263EF8330];
      int v10 = -1073741824;
      int v11 = 0;
      id v12 = __75__UITableViewAccessibility_dequeueReusableCellWithIdentifier_forIndexPath___block_invoke;
      int v13 = &unk_2650AE3B8;
      uint64_t v14 = v20;
      id v15 = v17;
      id v16 = v18;
      AXPerformSafeBlock();
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v15, 0);
      objc_storeStrong((id *)&v14, 0);
    }
    id v21 = v17;
    int v8 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v7.receiver = v20;
    v7.super_class = (Class)UITableViewAccessibility;
    id v21 = [(UITableViewAccessibility *)&v7 dequeueReusableCellWithIdentifier:location[0] forIndexPath:v18];
    int v8 = 1;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  unint64_t v4 = v21;

  return v4;
}

uint64_t __75__UITableViewAccessibility_dequeueReusableCellWithIdentifier_forIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureCellForDisplay:forIndexPath:", *(void *)(a1 + 40), *(void *)(a1 + 48), a1, a1);
}

- (id)dequeueReusableHeaderFooterViewWithIdentifier:(id)a3
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[UITableViewAccessibility _accessibilityShouldDisableCellReuse](v9))
  {
    id v7 = -[UITableViewAccessibility _axAttemptCreationOfViewType:identifier:](v9, 2, location[0]);
    id v10 = v7;
    int v6 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)UITableViewAccessibility;
    id v10 = [(UITableViewAccessibility *)&v5 dequeueReusableHeaderFooterViewWithIdentifier:location[0]];
    int v6 = 1;
  }
  objc_storeStrong(location, 0);
  id v3 = v10;

  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  int v20 = self;
  SEL v19 = a2;
  BOOL v18 = a3;
  BOOL v17 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v16 setEditing:a3 animated:a4];
  [(UITableViewAccessibility *)v20 _accessibilityClearChildren];
  if (([(UITableViewAccessibility *)v20 safeBoolForKey:@"_hasSwipeToDeleteRow"] & 1) == 0)
  {
    char v14 = 0;
    objc_opt_class();
    id v5 = (id)[(UITableViewAccessibility *)v20 safeValueForKey:@"focusedCell"];
    id v13 = (id)__UIAccessibilityCastAsClass();

    id v12 = v13;
    objc_storeStrong(&v13, 0);
    id v15 = v12;
    id v11 = (id)[v12 _accessibilityIndexPath];
    char v4 = [v15 isEditing];
    if ((v4 & 1) != v18)
    {
      if (v11)
      {
        int v6 = v20;
        id v7 = v15;
        BOOL v9 = v18;
        id v8 = v11;
        BOOL v10 = v17;
        AXPerformSafeBlock();
        objc_storeStrong(&v8, 0);
        objc_storeStrong(&v7, 0);
        objc_storeStrong((id *)&v6, 0);
      }
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v15, 0);
  }
}

uint64_t __48__UITableViewAccessibility_setEditing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupCell:forEditing:atIndexPath:animated:updateSeparators:", *(void *)(a1 + 40), *(unsigned char *)(a1 + 56) & 1, *(void *)(a1 + 48), *(unsigned char *)(a1 + 57) & 1, 1, a1, a1);
}

- (void)setCountString:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)-[UITableViewAccessibility safeValueForKey:](v7, "safeValueForKey:");
  v4.receiver = v7;
  v4.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v4 setCountString:location[0]];
  id v3 = (id)[(UITableViewAccessibility *)v7 safeValueForKey:@"_countLabel"];
  if (v5 != v3) {
    [(UITableViewAccessibility *)v7 _accessibilityClearChildren];
  }
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_reuseTableViewSubview:(id)a3 viewType:(int)a4
{
  BOOL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v8 = a4;
  v7.receiver = v10;
  v7.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v7 _reuseTableViewSubview:location[0] viewType:a4];
  id v6 = (id)[(UITableViewAccessibility *)v10 _accessibilityOpaqueElementParent];
  if (!v6
    && [(UITableViewAccessibility *)v10 isAccessibilityOpaqueElementProvider])
  {
    objc_storeStrong(&v6, v10);
  }
  objc_msgSend(v6, "_accessibilityDidReuseOpaqueElementView:", location[0], &v6);
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_swipeDeletionCommitted
{
  id v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  if (-[UITableViewAccessibility _accessibilityShouldConsiderSwipeDeletionCommitted]((uint64_t)self)) {
    return 1;
  }
  v3.receiver = v6;
  v3.super_class = (Class)UITableViewAccessibility;
  return [(UITableViewAccessibility *)&v3 _swipeDeletionCommitted];
}

- (void)_cellDidShowSelectedBackground:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v3 _cellDidShowSelectedBackground:location[0]];
  [(UITableViewAccessibility *)v5 _axUpdateSelectedBackgroundVisibilityForCell:location[0] visible:1];
  objc_storeStrong(location, 0);
}

- (void)_cellDidHideSelectedBackground:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v3 _cellDidHideSelectedBackground:location[0]];
  [(UITableViewAccessibility *)v5 _axUpdateSelectedBackgroundVisibilityForCell:location[0] visible:0];
  objc_storeStrong(location, 0);
}

- (void)_axUpdateSelectedBackgroundVisibilityForCell:(id)a3 visible:(BOOL)a4
{
  objc_super v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v5 = objc_msgSend(location[0], "_accessibilityBoolValueForKey:") & 1;
  [location[0] _accessibilitySetBoolValue:a4 forKey:@"AXIsShowingSelectedBackground"];
  if (a4
    && (v5 & 1) == 0
    && ([(UITableViewAccessibility *)v7 allowsMultipleSelection] & 1) == 0
    && ([location[0] isSelected] & 1) == 0)
  {
    [location[0] _accessibilitySetNativeFocus];
  }
  objc_storeStrong(location, 0);
}

- (id)accessibilityCellForRowAtIndexPath:(id)a3
{
  id v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v41 = 0;
  BOOL v17 = 1;
  if (location[0])
  {
    uint64_t v16 = [location[0] section];
    BOOL v17 = 1;
    if (v16 < -[UITableViewAccessibility _axNumberOfSections](v44))
    {
      unint64_t v15 = [location[0] row];
      BOOL v17 = 1;
      if (v15 < -[UITableViewAccessibility numberOfRowsInSection:](v44, "numberOfRowsInSection:", [location[0] section]))
      {
        uint64_t v14 = [location[0] row];
        id v42 = (id)[(UITableViewAccessibility *)v44 dataSource];
        char v41 = 1;
        BOOL v17 = v14 >= (int)objc_msgSend(v42, "tableView:numberOfRowsInSection:", v44, objc_msgSend(location[0], "section"));
      }
    }
  }
  if (v41) {

  }
  if (v17)
  {
    id v45 = 0;
    int v40 = 1;
  }
  else
  {
    [(UITableViewAccessibility *)v44 setReusableCellsEnabled:0];
    [(UITableViewAccessibility *)v44 safeCGSizeForKey:@"contentSize"];
    v38[1] = v3;
    double v39 = v4;
    uint64_t v32 = 0;
    id v33 = &v32;
    int v34 = 838860800;
    int v35 = 48;
    int v36 = __Block_byref_object_copy__20;
    id v37 = __Block_byref_object_dispose__20;
    v38[0] = 0;
    uint64_t v25 = MEMORY[0x263EF8330];
    int v26 = -1073741824;
    int v27 = 0;
    int v28 = __63__UITableViewAccessibility_accessibilityCellForRowAtIndexPath___block_invoke;
    int v29 = &unk_2650ADF88;
    v31[1] = &v32;
    uint64_t v30 = v44;
    v31[0] = location[0];
    AXPerformSafeBlock();
    [(id)v33[5] layoutSubviews];
    [(UITableViewAccessibility *)v44 safeCGSizeForKey:@"contentSize"];
    uint64_t v23 = v5;
    double v24 = v6;
    [(id)v33[5] accessibilityFrame];
    CGRect v22 = v47;
    double MaxY = CGRectGetMaxY(v47);
    [(UITableViewAccessibility *)v44 accessibilityFrame];
    CGRect rect = v48;
    double MinY = CGRectGetMinY(v48);
    double v7 = MaxY;
    if (MaxY < MinY)
    {
      [(UITableViewAccessibility *)v44 _accessibilityContentOffset];
      *(void *)&long long v20 = v8;
      *((double *)&v20 + 1) = v9 + v24 - v39;
      BOOL v18 = v44;
      long long v19 = v20;
      AXPerformSafeBlock();
      objc_storeStrong((id *)&v18, 0);
    }
    -[UITableViewAccessibility setReusableCellsEnabled:](v44, "setReusableCellsEnabled:", 1, v7);
    id v45 = (id)v33[5];
    int v40 = 1;
    objc_storeStrong(v31, 0);
    objc_storeStrong((id *)&v30, 0);
    _Block_object_dispose(&v32, 8);
    objc_storeStrong(v38, 0);
  }
  objc_storeStrong(location, 0);
  BOOL v10 = v45;

  return v10;
}

void __63__UITableViewAccessibility_accessibilityCellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  uint64_t v1 = [*(id *)(a1 + 32) _createPreparedCellForRowAtIndexPath:*(void *)(a1 + 40) willDisplay:1];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;

  location[0] = (id)[*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [location[0] tableView:*(void *)(a1 + 32) didEndDisplayingCell:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forRowAtIndexPath:*(void *)(a1 + 40)];
  }
  objc_storeStrong(location, 0);
}

uint64_t __63__UITableViewAccessibility_accessibilityCellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48), a1, a1);
}

- (void)_axPostLayoutChange
{
}

- (id)_accessibilityInternalData
{
  double v4 = a1;
  if (a1)
  {
    id v3 = (id)[v4 _accessibilityValueForKey:@"AXInternalData"];
    if (!v3)
    {
      id v3 = (id)[objc_allocWithZone((Class)_AXTableViewInternal) init];

      [v4 _accessibilitySetRetainedValue:v3 forKey:@"AXInternalData"];
      -[UITableViewAccessibility _accessibilityInitializeInternalData](v4);
    }
    id v5 = v3;
    objc_storeStrong(&v3, 0);
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v1 = v5;

  return v1;
}

- (void)_accessibilityInitializeInternalData
{
  v51 = a1;
  if (a1)
  {
    [v51 _accessibilityRemoveValueForKey:@"isAXElement"];
    id v50 = (id)-[UITableViewAccessibility _accessibilityInternalData](v51);
    unint64_t v49 = -[UITableViewAccessibility _axNumberOfSections](v51);
    uint64_t v48 = 0;
    CGRect v47 = 0;
    uint64_t v46 = 0;
    uint64_t v45 = 0;
    while ((unint64_t)v47 < v49)
    {
      uint64_t v40 = 0;
      char v41 = &v40;
      int v42 = 0x20000000;
      int v43 = 32;
      char v44 = 0;
      uint64_t v34 = MEMORY[0x263EF8330];
      int v35 = -1073741824;
      int v36 = 0;
      id v37 = __64__UITableViewAccessibility__accessibilityInitializeInternalData__block_invoke;
      id v38 = &unk_2650AE6B8;
      v39[1] = &v40;
      v39[0] = v51;
      v39[2] = v47;
      AXPerformSafeBlock();
      char v33 = v41[3] & 1;
      objc_storeStrong(v39, 0);
      _Block_object_dispose(&v40, 8);
      if (v33)
      {
        ++v48;
        id v20 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v50);
        uint64_t v16 = NSDictionary;
        id v19 = (id)[NSNumber numberWithInteger:v47];
        id v18 = (id)objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", @"header", @"type", v19, @"offset", 0);
        uint64_t v65 = v46;
        uint64_t v64 = 1;
        uint64_t v66 = v46;
        uint64_t v67 = 1;
        uint64_t v31 = v46;
        uint64_t v32 = 1;
        id v17 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v46, 1);
        objc_msgSend(v20, "setObject:forKey:", v18);
      }
      uint64_t v46 = v48;
      uint64_t v30 = 0;
      uint64_t v30 = [v51 numberOfRowsInSection:v47];
      v48 += v30;
      if (v30 > 0)
      {
        id v15 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v50);
        id v11 = NSDictionary;
        id v14 = (id)[NSNumber numberWithInteger:v45];
        id v13 = (id)objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", @"row", @"type", v14, @"offset", 0);
        uint64_t v61 = v46;
        uint64_t v60 = v48 - v46;
        uint64_t v62 = v46;
        uint64_t v63 = v48 - v46;
        uint64_t v28 = v46;
        uint64_t v29 = v48 - v46;
        id v12 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v46, v48 - v46);
        objc_msgSend(v15, "setObject:forKey:", v13);
      }
      v45 += v30;
      uint64_t v46 = v48;
      uint64_t v23 = 0;
      double v24 = &v23;
      int v25 = 0x20000000;
      int v26 = 32;
      char v27 = 0;
      v22[1] = &v23;
      v22[0] = v51;
      v22[2] = v47;
      AXPerformSafeBlock();
      char v21 = v24[3] & 1;
      objc_storeStrong(v22, 0);
      _Block_object_dispose(&v23, 8);
      if (v21)
      {
        ++v48;
        id v10 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v50);
        double v6 = NSDictionary;
        id v9 = (id)[NSNumber numberWithInteger:v47];
        id v8 = (id)objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", @"footer", @"type", v9, @"offset", 0);
        uint64_t v57 = v46;
        uint64_t v56 = 1;
        uint64_t v58 = v46;
        uint64_t v59 = 1;
        id v7 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v46, 1);
        objc_msgSend(v10, "setObject:forKey:", v8);
      }
      uint64_t v46 = v48;
      ++v47;
    }
    id v1 = (id)[v51 safeValueForKey:@"_countLabel"];
    BOOL v5 = v1 == 0;

    if (!v5)
    {
      ++v48;
      id v4 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v50);
      id v3 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"tableCount", @"type", 0);
      uint64_t v53 = v48 - 1;
      uint64_t v52 = 1;
      uint64_t v54 = v48 - 1;
      uint64_t v55 = 1;
      id v2 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v48 - 1, 1);
      objc_msgSend(v4, "setObject:forKey:", v3);
    }
    -[_AXTableViewInternal setAccessibleElementCount:]((uint64_t)v50, v48);
    objc_storeStrong(&v50, 0);
  }
}

- (id)_accessibilityInternalDataRetrieveOnly
{
  if (a1) {
    id v2 = (id)[a1 _accessibilityValueForKey:@"AXInternalData"];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilityClearChildren
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v23 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewAccessibility *)self _accessibilityValueForKey:@"AXInternalData"];
  if (location[0])
  {
    id v15 = (id)-[_AXTableViewInternal children]((uint64_t)location[0]);
    id v14 = (id)[v15 allValues];
    [v14 enumerateObjectsUsingBlock:&__block_literal_global_634];

    memset(__b, 0, sizeof(__b));
    obNSUInteger j = (id)-[_AXTableViewInternal sectionHeaders]((uint64_t)location[0]);
    uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
    if (v17)
    {
      uint64_t v11 = *(void *)__b[2];
      uint64_t v12 = 0;
      unint64_t v13 = v17;
      while (1)
      {
        uint64_t v10 = v12;
        if (*(void *)__b[2] != v11) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(id *)(__b[1] + 8 * v12);
        [v21 setAccessibilityContainer:0];
        ++v12;
        if (v10 + 1 >= v13)
        {
          uint64_t v12 = 0;
          unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
          if (!v13) {
            break;
          }
        }
      }
    }

    memset(v18, 0, sizeof(v18));
    id v8 = (id)-[_AXTableViewInternal sectionFooters]((uint64_t)location[0]);
    uint64_t v9 = [v8 countByEnumeratingWithState:v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)v18[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)v18[2] != v5) {
          objc_enumerationMutation(v8);
        }
        id v19 = *(id *)(v18[1] + 8 * v6);
        [v19 setAccessibilityContainer:0];
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [v8 countByEnumeratingWithState:v18 objects:v24 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }

    [(UITableViewAccessibility *)v23 _accessibilityRemoveValueForKey:@"AXInternalData"];
    [(id)_ReloadTimer invalidate];
    id v2 = (id)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:v23 target:sel__axPostLayoutChange selector:0 userInfo:0 repeats:0.5];
    id v3 = (void *)_ReloadTimer;
    _ReloadTimer = (uint64_t)v2;
  }
  objc_storeStrong(location, 0);
}

void __55__UITableViewAccessibility__accessibilityClearChildren__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setAccessibilityContainer:0];
  objc_storeStrong(location, 0);
}

- (CGRect)accessibilityFrame
{
  id v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v6 accessibilityFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (uint64_t)_accessibilitySearchTableViewVisible
{
  double v3 = a1;
  if (a1)
  {
    id v2 = -[UITableViewAccessibility _accessibilityInternalDataRetrieveOnly](v3);
    char v4 = -[_AXTableViewInternal searchTableViewVisible]((uint64_t)v2) & 1;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_accessibilitySearchControllerDimmingViewVisible
{
  double v3 = a1;
  if (a1)
  {
    id v2 = -[UITableViewAccessibility _accessibilityInternalDataRetrieveOnly](v3);
    char v4 = -[_AXTableViewInternal searchControllerDimmingViewVisible]((uint64_t)v2) & 1;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_accessibilityHasAccessibleOrContainerSubviewWithSubviewTree:(void *)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v13 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v13)
  {
    if (location != v13
      && (([location isAccessibilityElement] & 1) != 0
       || ([location _accessibilityHasOrderedChildren] & 1) != 0))
    {
      char v14 = 1;
      int v11 = 1;
    }
    else
    {
      memset(__b, 0, sizeof(__b));
      obNSUInteger j = (id)[location subviews];
      uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
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
          uint64_t v10 = *(void *)(__b[1] + 8 * v5);
          if (-[UITableViewAccessibility _accessibilityHasAccessibleOrContainerSubviewWithSubviewTree:](v13, v10)) {
            break;
          }
          ++v5;
          if (v3 + 1 >= v6)
          {
            uint64_t v5 = 0;
            unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
            if (!v6) {
              goto LABEL_15;
            }
          }
        }
        char v14 = 1;
        int v11 = 1;
      }
      else
      {
LABEL_15:
        int v11 = 0;
      }

      if (!v11)
      {
        char v14 = 0;
        int v11 = 1;
      }
    }
  }
  else
  {
    char v14 = 0;
    int v11 = 1;
  }
  objc_storeStrong(&location, 0);
  return v14 & 1;
}

- (uint64_t)_accessibilityHasAccessibleOrContainerSubview
{
  uint64_t v5 = a1;
  if (a1)
  {
    id location = (id)[v5 _accessibilityValueForKey:@"AXHasAccessibleOrContainerSubview"];
    if (location)
    {
      char v6 = [location BOOLValue] & 1;
    }
    else
    {
      unsigned __int8 v3 = -[UITableViewAccessibility _accessibilityHasAccessibleOrContainerSubviewWithSubviewTree:](v5, v5) & 1;
      id v2 = (id)[NSNumber numberWithBool:v3];
      objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:");

      char v6 = v3 & 1;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v28 = self;
  SEL v27 = a2;
  if (-[UITableViewAccessibility _accessibilityIsSearchTableVisible](self))
  {
    char v29 = 1;
  }
  else if ([(UITableViewAccessibility *)v28 isAccessibilityOpaqueElementProvider])
  {
    uint64_t v25 = [(UITableViewAccessibility *)v28 safeRangeForKey:@"_visibleGlobalRows"];
    uint64_t v26 = v2;
    LOBYTE(v7) = 0;
    if (!v2) {
      int v7 = -[UITableViewAccessibility _accessibilityHasAccessibleOrContainerSubview](v28) ^ 1;
    }
    char v29 = v7 & 1;
  }
  else
  {
    id v6 = (id)[(UITableViewAccessibility *)v28 isAccessibilityUserDefinedElement];

    if (v6)
    {
      v24.receiver = v28;
      v24.super_class = (Class)UITableViewAccessibility;
      char v29 = [(UITableViewAccessibility *)&v24 isAccessibilityElement];
    }
    else
    {
      uint64_t v23 = [(UITableViewAccessibility *)v28 accessibilityElementCount];
      char v21 = 0;
      BOOL v5 = 0;
      if (!v23)
      {
        id v22 = [(UITableViewAccessibility *)v28 _accessibilityHeaderElement];
        char v21 = 1;
        BOOL v5 = v22 == 0;
      }
      if (v21) {

      }
      if (v5)
      {
        char v29 = 1;
      }
      else
      {
        id v20 = (id)[(UITableViewAccessibility *)v28 _accessibilityValueForKey:@"isAXElement"];
        if (v20)
        {
          char v29 = [v20 BOOLValue] & 1;
          int v19 = 1;
        }
        else
        {
          uint64_t v14 = 0;
          id v15 = &v14;
          int v16 = 0x20000000;
          int v17 = 32;
          char v18 = 0;
          uint64_t v4 = v28;
          uint64_t v8 = MEMORY[0x263EF8330];
          int v9 = -1073741824;
          int v10 = 0;
          int v11 = __50__UITableViewAccessibility_isAccessibilityElement__block_invoke;
          uint64_t v12 = &unk_2650AEEA8;
          v13[0] = v28;
          v13[1] = &v14;
          [(UITableViewAccessibility *)v4 accessibilityEnumerateContainerElementsUsingBlock:&v8];
          if (v15[3])
          {
            char v29 = 0;
            int v19 = 1;
          }
          else
          {
            int v19 = 0;
          }
          objc_storeStrong(v13, 0);
          _Block_object_dispose(&v14, 8);
        }
        objc_storeStrong(&v20, 0);
        if (!v19)
        {
          [(UITableViewAccessibility *)v28 _accessibilitySetRetainedValue:*MEMORY[0x263EFFB40] forKey:@"isAXElement"];
          char v29 = 1;
        }
      }
    }
  }
  return v29 & 1;
}

void __50__UITableViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (([location[0] isAccessibilityElement] & 1) != 0
    || ([location[0] _accessibilityHasOrderedChildren] & 1) != 0
    && [location[0] accessibilityElementCount] > 0)
  {
    [*(id *)(a1 + 32) _accessibilitySetRetainedValue:*MEMORY[0x263EFFB38] forKey:@"isAXElement"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  BOOL v5 = self;
  SEL v4 = a2;
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  objc_msgSend(v2, "removeObserver:name:object:", v5, *MEMORY[0x263F1D1B0]);

  [(UITableViewAccessibility *)v5 _accessibilityClearChildren];
  [(id)_ReloadTimer invalidate];
  objc_storeStrong((id *)&_ReloadTimer, 0);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v3 dealloc];
}

- (id)_accessibilityFooterElement
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(UITableViewAccessibility *)self safeValueForKey:@"tableFooterView"];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (id)_accessibilityHeaderElement
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(UITableViewAccessibility *)self safeValueForKey:@"tableHeaderView"];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (id)_accessibilityFuzzyHitTest:(id)obj withEvent:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v35 = a1;
  uint64_t v34 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v35)
  {
    id v31 = 0;
    double v30 = 1.79769313e308;
    UIAccessibilityPointForPoint();
    v29[1] = v3;
    v29[2] = v4;
    v29[0] = (id)[v35 safeValueForKey:@"indexPathsForVisibleRows"];
    memset(__b, 0, sizeof(__b));
    id obja = v29[0];
    uint64_t v20 = [obja countByEnumeratingWithState:__b objects:v37 count:16];
    if (v20)
    {
      uint64_t v16 = *(void *)__b[2];
      uint64_t v17 = 0;
      unint64_t v18 = v20;
      while (1)
      {
        uint64_t v15 = v17;
        if (*(void *)__b[2] != v16) {
          objc_enumerationMutation(obja);
        }
        uint64_t v28 = *(void *)(__b[1] + 8 * v17);
        uint64_t v26 = 0;
        uint64_t v26 = [v35 globalRowForRowAtIndexPath:v28];
        if (v26 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v25 = (id)[v35 accessibilityTableViewCellElementAtGlobalRow:v26];
          [v25 accessibilityActivationPoint];
          v23[1] = v5;
          v23[2] = v6;
          AX_CGPointGetDistanceToPoint();
          double v24 = v7;
          if (v7 < v30)
          {
            double v30 = v24;
            objc_storeStrong(&v31, v25);
          }
          objc_storeStrong(&v25, 0);
        }
        ++v17;
        if (v15 + 1 >= v18)
        {
          uint64_t v17 = 0;
          unint64_t v18 = [obja countByEnumeratingWithState:__b objects:v37 count:16];
          if (!v18) {
            break;
          }
        }
      }
    }

    if (v31)
    {
      v23[0] = (id)[v31 tableViewCell];
      [v23[0] bounds];
      CGRect rect = v40;
      CGRectGetMidX(v40);
      CGRectGetMidY(rect);
      CGPointMake_6();
      uint64_t v14 = v34;
      objc_msgSend(v35, "convertPoint:fromView:", v23[0], v8, v9);
      *(void *)&long long v21 = v10;
      *((void *)&v21 + 1) = v11;
      _OWORD *v14 = v21;
      id v36 = v31;
      int v32 = 1;
      objc_storeStrong(v23, 0);
    }
    else
    {
      id v36 = 0;
      int v32 = 1;
    }
    objc_storeStrong(v29, 0);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    id v36 = 0;
    int v32 = 1;
  }
  objc_storeStrong(&location, 0);
  uint64_t v12 = v36;

  return v12;
}

uint64_t __64__UITableViewAccessibility__accessibilitySearchResultsTableView__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uisearchdispla.isa);
  char v6 = objc_opt_isKindOfClass() & 1;
  if (v6) {
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)_accessibilitySubviews
{
  double v8 = self;
  v7[1] = (id)a2;
  if (-[UITableViewAccessibility _accessibilityIsSearchTableVisible](self))
  {
    v7[0] = [(UITableViewAccessibility *)v8 _accessibilitySupplementaryHeaderViews];
    id v6 = [(UITableViewAccessibility *)v8 _accessibilitySupplementaryFooterViews];
    id v5 = (id)[MEMORY[0x263EFF980] arrayWithArray:v7[0]];
    [v5 addObjectsFromArray:v6];
    id v9 = v5;
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(v7, 0);
  }
  else
  {
    v4.receiver = v8;
    v4.super_class = (Class)UITableViewAccessibility;
    id v9 = [(UITableViewAccessibility *)&v4 _accessibilitySubviews];
  }
  id v2 = v9;

  return v2;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v118 = a3;
  v117 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v115 = [(UITableViewAccessibility *)v117 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v108 = 0;
  char v35 = 0;
  if (!v115)
  {
    uint64_t v109 = MEMORY[0x263EF8330];
    int v110 = -1073741824;
    int v111 = 0;
    v112 = __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v113 = &unk_2650AE580;
    v114 = v117;
    char v108 = 1;
    v107 = (id *)&v114;
    char v35 = ((uint64_t (*)(void))__60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v35)
  {
    -[UITableViewAccessibility _accessibilitySetBoolValue:forKey:](v117, "_accessibilitySetBoolValue:forKey:", 1);
    id v106 = (id)-[UITableViewAccessibility accessibilityHitTest:withEvent:](v117, "accessibilityHitTest:withEvent:", location[0], v118.x, v118.y);
    [(UITableViewAccessibility *)v117 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    v119 = (UITableViewAccessibility *)v106;
    int v105 = 1;
    objc_storeStrong(&v106, 0);
  }
  else
  {
    int v105 = 0;
  }
  if (v108) {
    objc_storeStrong(v107, 0);
  }
  if (!v105)
  {
    if ((-[UITableViewAccessibility pointInside:withEvent:](v117, "pointInside:withEvent:", location[0], v118.x, v118.y) & 1) == 0)
    {
      v119 = 0;
      int v105 = 1;
      goto LABEL_100;
    }
    if ((unsigned __int16)[location[0] _accessibilityHitTestType] == 3)
    {
      v119 = (UITableViewAccessibility *)(id)-[UITableViewAccessibility __accessibilityHitTest:withEvent:](v117, "__accessibilityHitTest:withEvent:", location[0], v118.x, v118.y);
      int v105 = 1;
      goto LABEL_100;
    }
    char v33 = v117;
    id v34 = [(UITableViewAccessibility *)v117 _accessibilitySupplementaryHeaderViews];
    id v103 = (id)-[UITableViewAccessibility _accessibilityHitTestSupplementaryViews:point:withEvent:](v33, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v118.x, v118.y);

    if (v103
      || (id v31 = v117,
          id v32 = -[UITableViewAccessibility _accessibilitySupplementaryFooterViews](v117, "_accessibilitySupplementaryFooterViews"), v103 = (id)-[UITableViewAccessibility _accessibilityHitTestSupplementaryViews:point:withEvent:](v31, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v118.x, v118.y), 0, v32, v103))
    {
      v119 = (UITableViewAccessibility *)v103;
      int v105 = 1;
    }
    else
    {
      if ([(UITableViewAccessibility *)v117 isAccessibilityOpaqueElementProvider])
      {
        v119 = (UITableViewAccessibility *)(id)-[UITableViewAccessibility __accessibilityHitTest:withEvent:](v117, "__accessibilityHitTest:withEvent:", location[0], v118.x, v118.y);
        int v105 = 1;
        goto LABEL_99;
      }
      v102 = 0;
      unint64_t v101 = -[UITableViewAccessibility _axNumberOfSections](v117);
      while ((unint64_t)v102 < v101)
      {
        [(UITableViewAccessibility *)v117 rectForSection:v102];
        CGRect v100 = v121;
        if (CGRectContainsPoint(v121, v118)) {
          break;
        }
        ++v102;
      }
      char v99 = 0;
      if ((unint64_t)v102 >= v101) {
        goto LABEL_40;
      }
      memset(&v98, 0, sizeof(v98));
      uint64_t v91 = 0;
      v92 = &v91;
      int v93 = 0x10000000;
      int v94 = 64;
      v95 = &unk_24046C852;
      long long v96 = 0u;
      long long v97 = 0u;
      v85[3] = (id)MEMORY[0x263EF8330];
      int v86 = -1073741824;
      int v87 = 0;
      v88 = __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_682;
      v89 = &unk_2650AE6B8;
      v90[1] = &v91;
      v90[0] = v117;
      v90[2] = v102;
      AXPerformSafeBlock();
      CGRect v98 = *(CGRect *)((unsigned char *)v92 + 1);
      objc_storeStrong(v90, 0);
      _Block_object_dispose(&v91, 8);
      if (CGRectContainsPoint(v98, v118))
      {
        v85[0] = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v117, (uint64_t)v102, 1);
        id v4 = (id)objc_msgSend(v85[0], "_accessibilityHitTest:withEvent:", location[0], v118.x, v118.y);
        id v5 = v103;
        id v103 = v4;

        if (v103)
        {
          v119 = (UITableViewAccessibility *)v103;
          int v105 = 1;
        }
        else
        {
          char v99 = 1;
          int v105 = 0;
        }
        objc_storeStrong(v85, 0);
        if (v105) {
          goto LABEL_99;
        }
      }
      else
      {
        id v29 = (id)[(UITableViewAccessibility *)v117 safeValueForKey:@"allowsHeaderViewsToFloat"];
        char v30 = [v29 BOOLValue];

        if (v30)
        {
          memset(&rect, 0, sizeof(rect));
          uint64_t v77 = 0;
          uint64_t v78 = (CGRect *)&v77;
          int v79 = 0x10000000;
          int v80 = 64;
          v81 = &unk_24046C852;
          long long v82 = 0u;
          long long v83 = 0u;
          v71[1] = (id)MEMORY[0x263EF8330];
          int v72 = -1073741824;
          int v73 = 0;
          id v74 = __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2_687;
          NSRange v75 = &unk_2650AE6B8;
          v76[1] = &v77;
          v76[0] = v117;
          v76[2] = v102;
          AXPerformSafeBlock();
          CGRect rect = v78[1];
          objc_storeStrong(v76, 0);
          _Block_object_dispose(&v77, 8);
          if (CGRectContainsPoint(rect, v118))
          {
            v71[0] = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v117, (uint64_t)v102, 1);
            id v6 = (id)objc_msgSend(v71[0], "_accessibilityHitTest:withEvent:", location[0], v118.x, v118.y);
            id v7 = v103;
            id v103 = v6;

            if (v103)
            {
              v119 = (UITableViewAccessibility *)v103;
              int v105 = 1;
            }
            else
            {
              char v99 = 1;
              int v105 = 0;
            }
            objc_storeStrong(v71, 0);
            if (v105) {
              goto LABEL_99;
            }
          }
        }
      }
      [(UITableViewAccessibility *)v117 rectForFooterInSection:v102];
      CGRect v70 = v122;
      if (!CGRectContainsPoint(v122, v118)) {
        goto LABEL_40;
      }
      id v69 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v117, (uint64_t)v102, 0);
      id v8 = (id)objc_msgSend(v69, "_accessibilityHitTest:withEvent:", location[0], v118.x, v118.y);
      id v9 = v103;
      id v103 = v8;

      if (v103)
      {
        v119 = (UITableViewAccessibility *)v103;
        int v105 = 1;
      }
      else
      {
        char v99 = 1;
        int v105 = 0;
      }
      objc_storeStrong(&v69, 0);
      if (!v105)
      {
LABEL_40:
        NSClassFromString(&cfstr_Uisearchresult.isa);
        char v68 = objc_opt_isKindOfClass() & 1;
        if ((-[UITableViewAccessibility _accessibilitySearchControllerDimmingViewVisible](v117) & 1) != 0
          && (v68 & 1) == 0)
        {
          v119 = 0;
          int v105 = 1;
          goto LABEL_99;
        }
        if (-[UITableViewAccessibility _accessibilityIsSearchTableVisible](v117))
        {
          id v67 = -[UITableViewAccessibility _accessibilitySearchResultsTableView](v117);
          id v28 = v67;
          [v67 convertPoint:v117 fromView:v118];
          v66[1] = v10;
          v66[2] = v11;
          v119 = (UITableViewAccessibility *)(id)objc_msgSend(v28, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v10, *(double *)&v11);
          int v105 = 1;
          objc_storeStrong(&v67, 0);
          goto LABEL_99;
        }
        v66[0] = (id)-[UITableViewAccessibility __accessibilityHitTest:withEvent:](v117, "__accessibilityHitTest:withEvent:", location[0], v118.x, v118.y);
        char v64 = 0;
        char v62 = 0;
        char v60 = 0;
        BOOL v27 = 0;
        if (v66[0])
        {
          BOOL v27 = 0;
          if (v66[0] != v117)
          {
            objc_opt_class();
            BOOL v27 = 0;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v65 = (id)[v66[0] _accessibilityAncestorIsKindOf:objc_opt_class()];
              char v64 = 1;
              BOOL v27 = 0;
              if (!v65)
              {
                id v63 = (id)[v66[0] _accessibilityAncestorIsKindOf:objc_opt_class()];
                char v62 = 1;
                BOOL v27 = 0;
                if (!v63)
                {
                  id v61 = (id)[v66[0] accessibilityContainer];
                  char v60 = 1;
                  BOOL v27 = v61 != 0;
                }
              }
            }
          }
        }
        if (v60) {

        }
        if (v62) {
        if (v64)
        }

        if (!v27) {
          goto LABEL_63;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_63;
        }
        [v66[0] convertPoint:v117 fromView:v118];
        double v57 = v12;
        double v58 = v13;
        id v59 = (id)objc_msgSend(v66[0], "_accessibilityHitTest:withEvent:", location[0], v12, v13);
        if ([v59 isAccessibilityElement])
        {
          v119 = (UITableViewAccessibility *)v59;
          int v105 = 1;
        }
        else
        {
          int v105 = 0;
        }
        objc_storeStrong(&v59, 0);
        if (!v105)
        {
LABEL_63:
          if (v101)
          {
            if ([(UITableViewAccessibility *)v117 accessibilityElementCount])
            {
              v54[0] = (id)-[UITableViewAccessibility indexPathForRowAtPoint:](v117, "indexPathForRowAtPoint:", v118.x, v118.y);
              uint64_t v46 = 0;
              CGRect v47 = &v46;
              int v48 = 838860800;
              int v49 = 48;
              id v50 = __Block_byref_object_copy__20;
              v51 = __Block_byref_object_dispose__20;
              id v52 = 0;
              uint64_t v39 = MEMORY[0x263EF8330];
              int v40 = -1073741824;
              int v41 = 0;
              int v42 = __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_3;
              int v43 = &unk_2650ADF88;
              v45[1] = &v46;
              char v44 = v117;
              v45[0] = v54[0];
              AXPerformSafeBlock();
              id v38 = (id)v47[5];
              objc_storeStrong(v45, 0);
              objc_storeStrong((id *)&v44, 0);
              _Block_object_dispose(&v46, 8);
              objc_storeStrong(&v52, 0);
              id v53 = v38;
              if (v54[0] && v53) {
                goto LABEL_79;
              }
              if ((-[UITableViewAccessibility _accessibilityHitTestShouldFallbackToNearestChild](v117, "_accessibilityHitTestShouldFallbackToNearestChild") & 1) != 0&& ([location[0] _accessibilityAutomationHitTest] & 1) == 0)
              {
                id v18 = -[UITableViewAccessibility _accessibilityFuzzyHitTest:withEvent:](v117, &v118, location[0]);
                id v19 = v103;
                id v103 = v18;
              }
              if (v103)
              {
LABEL_79:
                uint64_t v37 = [(UITableViewAccessibility *)v117 globalRowForRowAtIndexPath:v54[0]];
                if (v37 != 0x7FFFFFFFFFFFFFFFLL && !v103)
                {
                  id v20 = [(UITableViewAccessibility *)v117 accessibilityTableViewCellElementAtGlobalRow:v37];
                  id v21 = v103;
                  id v103 = v20;
                }
                if (v103)
                {
                  id v36 = (id)objc_msgSend(v103, "_accessibilityHitTest:withEvent:", location[0], v118.x, v118.y);
                  if (!v36
                    && (-[UITableViewAccessibility _accessibilityHitTestShouldFallbackToNearestChild](v117, "_accessibilityHitTestShouldFallbackToNearestChild") & 1) != 0&& ([location[0] _accessibilityAutomationHitTest] & 1) == 0)
                  {
                    id v22 = (id)[v103 accessibilityElementAtIndex:0];
                    id v23 = v36;
                    id v36 = v22;
                  }
                  objc_storeStrong(&v103, v36);
                  objc_storeStrong(&v36, 0);
                }
                if (v103 && ([v103 isAccessibilityElement] & 1) != 0
                  || v103 && ([location[0] _accessibilityAutomationHitTest] & 1) != 0)
                {
                  v119 = (UITableViewAccessibility *)v103;
                  int v105 = 1;
                }
                else
                {
                  if (v99) {
                    v119 = 0;
                  }
                  else {
                    v119 = v117;
                  }
                  int v105 = 1;
                }
              }
              else
              {
                v119 = v117;
                int v105 = 1;
              }
              objc_storeStrong(&v53, 0);
              objc_storeStrong(v54, 0);
              goto LABEL_98;
            }
            goto LABEL_71;
          }
          id v26 = (id)[(UITableViewAccessibility *)v117 safeValueForKey:@"frame"];
          [v26 CGRectValue];
          v54[1] = v14;
          v54[2] = v15;
          double v55 = v16;
          double v56 = v17;

          if (([location[0] _accessibilityAutomationHitTest] & 1) != 0
            || [(UITableViewAccessibility *)v117 isAccessibilityElement]
            && v55 > 0.0
            && v56 > 0.0)
          {
LABEL_71:
            v119 = v117;
            int v105 = 1;
            goto LABEL_98;
          }
          v119 = 0;
          int v105 = 1;
        }
LABEL_98:
        objc_storeStrong(v66, 0);
      }
    }
LABEL_99:
    objc_storeStrong(&v103, 0);
  }
LABEL_100:
  objc_storeStrong(location, 0);
  double v24 = v119;

  return v24;
}

BOOL __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  id v18 = (dispatch_once_t *)&_ReloadTimer_block_invoke_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_676);
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
      id v4 = v8;
      uint64_t v10 = v4;
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
  return Implementation != (IMP)_ReloadTimer_block_invoke_BaseImplementation;
}

void __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    _ReloadTimer_block_invoke_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
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
      id v3 = v7;
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

__n128 __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_682(uint64_t a1)
{
  [*(id *)(a1 + 32) rectForHeaderInSection:*(void *)(a1 + 48)];
  *(void *)&long long v8 = v1;
  *((void *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  __n128 result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

- (id)accessibilityTableViewSectionElementAtSection:(char)a3 isHeader:
{
  id v22 = a1;
  uint64_t v21 = a2;
  char v20 = a3 & 1;
  if (a1)
  {
    id v19 = -[UITableViewAccessibility _accessibilityInternalData](v22);
    id v18 = (id)[NSNumber numberWithInteger:v21];
    char v15 = 0;
    char v13 = 0;
    char v11 = 0;
    char v9 = 0;
    if (v20)
    {
      id v16 = (id)-[_AXTableViewInternal sectionHeaders]((uint64_t)v19);
      char v15 = 1;
      id v14 = (id)[v16 objectForKey:v18];
      char v13 = 1;
      id v3 = v14;
    }
    else
    {
      id v12 = (id)-[_AXTableViewInternal sectionFooters]((uint64_t)v19);
      char v11 = 1;
      id v10 = (id)[v12 objectForKey:v18];
      char v9 = 1;
      id v3 = v10;
    }
    id location = v3;
    if (v9) {

    }
    if (v11) {
    if (v13)
    }

    if (v15) {
    if (!location)
    }
    {
      obNSUInteger j = (id)[objc_allocWithZone((Class)UITableViewSectionElement) initWithAccessibilityContainer:v22];
      -[UITableViewSectionElement setIsHeader:]((uint64_t)obj, v20 & 1);
      -[UITableViewSectionElement setSection:]((uint64_t)obj, v21);
      objc_storeStrong(&location, obj);
      if (v20)
      {
        id v7 = (id)-[_AXTableViewInternal sectionHeaders]((uint64_t)v19);
        [v7 setObject:location forKey:v18];
      }
      else
      {
        id v6 = (id)-[_AXTableViewInternal sectionFooters]((uint64_t)v19);
        [v6 setObject:location forKey:v18];
      }
      objc_storeStrong(&obj, 0);
    }
    id v23 = location;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    id v23 = 0;
  }
  unint64_t v4 = v23;

  return v4;
}

__n128 __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2_687(uint64_t a1)
{
  [*(id *)(a1 + 32) _floatingRectForHeaderInSection:*(void *)(a1 + 48) heightCanBeGuessed:0];
  *(void *)&long long v8 = v1;
  *((void *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  __n128 result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

void __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_3(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v1;
}

- (id)_accessibilityVisibleHeaderSections
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  char v33 = self;
  v32[1] = (id)a2;
  v32[0] = (id)[(UITableViewAccessibility *)self safeValueForKey:@"indexPathsForVisibleRows"];
  id v31 = (id)[MEMORY[0x263EFF980] array];
  uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
  memset(__b, 0, sizeof(__b));
  obNSUInteger j = v32[0];
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
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
      id v29 = *(id *)(__b[1] + 8 * v7);
      uint64_t v4 = [v29 section];
      if (v4 != v30)
      {
        uint64_t v20 = 0;
        uint64_t v21 = &v20;
        int v22 = 838860800;
        int v23 = 48;
        double v24 = __Block_byref_object_copy__20;
        id v25 = __Block_byref_object_dispose__20;
        id v26 = 0;
        uint64_t v13 = MEMORY[0x263EF8330];
        int v14 = -1073741824;
        int v15 = 0;
        id v16 = __63__UITableViewAccessibility__accessibilityVisibleHeaderSections__block_invoke;
        double v17 = &unk_2650ADF88;
        v19[1] = &v20;
        id v18 = v33;
        v19[0] = v29;
        AXPerformSafeBlock();
        id v12 = (id)v21[5];
        objc_storeStrong(v19, 0);
        objc_storeStrong((id *)&v18, 0);
        _Block_object_dispose(&v20, 8);
        objc_storeStrong(&v26, 0);
        id v27 = v12;
        if (v12)
        {
          id v11 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v33, [v29 section], 1);
          if (v11) {
            [v31 addObject:v11];
          }
          objc_storeStrong(&v11, 0);
        }
        uint64_t v30 = [v29 section];
        objc_storeStrong(&v27, 0);
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  id v3 = v31;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(v32, 0);

  return v3;
}

void __63__UITableViewAccessibility__accessibilityVisibleHeaderSections__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_visibleHeaderViewForSection:", objc_msgSend(*(id *)(a1 + 40), "section"));
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v1;
}

- (id)_accessibilityUserTestingVisibleSections
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v21 = self;
  v20[1] = (id)a2;
  v20[0] = (id)[(UITableViewAccessibility *)self safeValueForKey:@"indexPathsForVisibleRows"];
  id v19 = (id)[MEMORY[0x263EFF980] array];
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  memset(__b, 0, sizeof(__b));
  obNSUInteger j = v20[0];
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(__b[1] + 8 * v9);
      uint64_t v2 = [v17 section];
      if (v2 != v18)
      {
        id v15 = (id)-[UITableViewAccessibility _visibleHeaderViewForSection:](v21, "_visibleHeaderViewForSection:", [v17 section]);
        if (v15)
        {
          id location = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v21, [v17 section], 1);
          if (location) {
            [v19 addObject:location];
          }
          objc_storeStrong(&location, 0);
        }
        id v3 = (id)-[UITableViewAccessibility _visibleFooterViewForSection:](v21, "_visibleFooterViewForSection:", [v17 section]);
        id v4 = v15;
        id v15 = v3;

        if (v15)
        {
          id v13 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v21, [v17 section], 0);
          if (v13) {
            [v19 addObject:v13];
          }
          objc_storeStrong(&v13, 0);
        }
        uint64_t v18 = [v17 section];
        objc_storeStrong(&v15, 0);
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v6 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v20, 0);

  return v6;
}

- (uint64_t)_accessibilitySkipItemsInSectionList:(void *)a3 view:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v26 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v24 = 0;
  objc_storeStrong(&v24, a3);
  if (v26)
  {
    char v22 = 0;
    memset(__b, 0, sizeof(__b));
    id v12 = location;
    uint64_t v13 = [v12 countByEnumeratingWithState:__b objects:v28 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0;
      unint64_t v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(v12);
        }
        uint64_t v21 = *(id **)(__b[1] + 8 * v10);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        char v18 = 0;
        BOOL v7 = 0;
        if (isKindOfClass)
        {
          id v19 = -[UITableViewSectionElement accessibilityChildren](v21);
          char v18 = 1;
          BOOL v7 = [v19 count] == 1;
        }
        if (v18) {

        }
        if (v7)
        {
          id v5 = -[UITableViewSectionElement accessibilityChildren](v21);
          id v17 = (id)[v5 firstObject];

          objc_opt_class();
          char v15 = 0;
          BOOL v6 = 0;
          if (objc_opt_isKindOfClass())
          {
            id v16 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v17);
            char v15 = 1;
            BOOL v6 = v16 == v24;
          }
          if (v15) {

          }
          if (v6)
          {
            char v22 = 1;
            int v23 = 2;
          }
          else
          {
            int v23 = 0;
          }
          objc_storeStrong(&v17, 0);
          if (v23) {
            break;
          }
        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          uint64_t v10 = 0;
          unint64_t v11 = [v12 countByEnumeratingWithState:__b objects:v28 count:16];
          if (!v11) {
            goto LABEL_22;
          }
        }
      }
    }
    else
    {
LABEL_22:
      int v23 = 0;
    }

    char v27 = v22 & 1;
    int v23 = 1;
  }
  else
  {
    char v27 = 0;
    int v23 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
  return v27 & 1;
}

- (uint64_t)_accessibilityCheckForAlreadyExistingCellElementForCell:(void *)a3 inItems:
{
  id v11 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v11 isAccessibilityOpaqueElementProvider] & 1) == 0)
    {
      id v7 = location;
      id v6 = (id)[v11 indexPathForCell:v7];
      if (v6)
      {
        id v5 = (id)[v11 _accessibilityTableViewCellElementForIndexPath:v6];
        char v12 = [v9 containsObject:v5] & 1;
        int v8 = 1;
        objc_storeStrong(&v5, 0);
      }
      else
      {
        char v12 = 0;
        int v8 = 1;
      }
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v7, 0);
    }
    else
    {
      char v12 = 0;
      int v8 = 1;
    }
  }
  else
  {
    char v12 = 0;
    int v8 = 1;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
  return v12 & 1;
}

- (id)automationElements
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  char v33 = self;
  v32[1] = (id)a2;
  v31.receiver = self;
  v31.super_class = (Class)UITableViewAccessibility;
  id v21 = [(UITableViewAccessibility *)&v31 automationElements];
  id v22 = (id)[v21 mutableCopy];
  char v29 = 0;
  if (v22)
  {
    id v2 = v22;
  }
  else
  {
    id v30 = (id)[MEMORY[0x263EFF980] array];
    char v29 = 1;
    id v2 = v30;
  }
  v32[0] = v2;
  if (v29) {

  }
  id v19 = objc_alloc(MEMORY[0x263EFF980]);
  id v20 = (id)[(UITableViewAccessibility *)v33 subviews];
  id v28 = (id)objc_msgSend(v19, "initWithArray:");

  while ([v28 count])
  {
    id location = (id)[v28 firstObject];
    [v28 removeObjectAtIndex:0];
    if (([location isAccessibilityElement] & 1) != 0
      && ([location _accessibilityViewIsVisible] & 1) != 0)
    {
      memset(__b, 0, sizeof(__b));
      obNSUInteger j = v32[0];
      uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
      if (v18)
      {
        uint64_t v14 = *(void *)__b[2];
        uint64_t v15 = 0;
        unint64_t v16 = v18;
        while (1)
        {
          uint64_t v13 = v15;
          if (*(void *)__b[2] != v14) {
            objc_enumerationMutation(obj);
          }
          id v26 = *(id *)(__b[1] + 8 * v15);
          if (v26 != location)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [location _accessibilityIsViewDescendantOfElement:v26];
            }
          }
          ++v15;
          if (v13 + 1 >= v16)
          {
            uint64_t v15 = 0;
            unint64_t v16 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
            if (!v16) {
              break;
            }
          }
        }
      }

      if ((-[UITableViewAccessibility _accessibilitySkipItemsInSectionList:view:]((uint64_t)v33, v32[0], location) & 1) == 0
        && (-[UITableViewAccessibility _accessibilityCheckForAlreadyExistingCellElementForCell:inItems:](v33, location, v32[0]) & 1) == 0&& ([v32[0] containsObject:location] & 1) == 0)
      {
        [v32[0] addObject:location];
      }
    }
    else
    {
      NSClassFromString(&cfstr_Uiswipeactionp_0.isa);
      if (objc_opt_isKindOfClass())
      {
        memset(v23, 0, sizeof(v23));
        id v11 = (id)[location _accessibleSubviews];
        uint64_t v12 = [v11 countByEnumeratingWithState:v23 objects:v34 count:16];
        if (v12)
        {
          uint64_t v8 = *(void *)v23[2];
          uint64_t v9 = 0;
          unint64_t v10 = v12;
          while (1)
          {
            uint64_t v7 = v9;
            if (*(void *)v23[2] != v8) {
              objc_enumerationMutation(v11);
            }
            uint64_t v24 = *(void *)(v23[1] + 8 * v9);
            if (([v32[0] containsObject:v24] & 1) == 0) {
              [v32[0] axSafelyAddObjectsFromArray:v24];
            }
            ++v9;
            if (v7 + 1 >= v10)
            {
              uint64_t v9 = 0;
              unint64_t v10 = [v11 countByEnumeratingWithState:v23 objects:v34 count:16];
              if (!v10) {
                break;
              }
            }
          }
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v5 = v28;
          id v6 = (id)[location subviews];
          objc_msgSend(v5, "axSafelyAddObjectsFromArray:");
        }
      }
    }
    objc_storeStrong(&location, 0);
  }
  id v4 = v32[0];
  objc_storeStrong(&v28, 0);
  objc_storeStrong(v32, 0);

  return v4;
}

- (id)_accessibilityUserTestingVisibleCells
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)[(UITableViewAccessibility *)self safeValueForKey:@"indexPathsForVisibleRows"];
  id v14 = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  obNSUInteger j = v15[0];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
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
      uint64_t v13 = *(void *)(__b[1] + 8 * v6);
      uint64_t v11 = 0;
      uint64_t v11 = [(UITableViewAccessibility *)v16 globalRowForRowAtIndexPath:v13];
      id location = [(UITableViewAccessibility *)v16 accessibilityTableViewCellElementAtGlobalRow:v11];
      if (location) {
        [v14 addObject:location];
      }
      objc_storeStrong(&location, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v14;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);

  return v3;
}

- (void)_setAccessibilitySearchTableViewVisible
{
  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] = -[UITableViewAccessibility _accessibilityInternalData](self);
  -[_AXTableViewInternal setSearchTableViewVisible:]((uint64_t)v2[0], 1);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(v2, 0);
}

- (void)_setAccessibilitySearchTableViewHidden
{
  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] = -[UITableViewAccessibility _accessibilityInternalData](self);
  -[_AXTableViewInternal setSearchTableViewVisible:]((uint64_t)v2[0], 0);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(v2, 0);
}

- (void)_setAccessibilitySearchControllerDimmingViewVisible
{
  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] = -[UITableViewAccessibility _accessibilityInternalData](self);
  -[_AXTableViewInternal setSearchControllerDimmingViewVisible:]((uint64_t)v2[0], 1);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(v2, 0);
}

- (void)_setAccessibilitySearchControllerDimmingViewHidden
{
  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] = -[UITableViewAccessibility _accessibilityInternalData](self);
  -[_AXTableViewInternal setSearchControllerDimmingViewVisible:]((uint64_t)v2[0], 0);
  objc_storeStrong(v2, 0);
}

- (id)_accessibilityViewChildrenWithOptions:(id)a3
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v7 = [location[0] shouldIncludeKeyboardObscuredElements] & 1;
  [location[0] setShouldIncludeKeyboardObscuredElements:1];
  v5.receiver = v9;
  v5.super_class = (Class)UITableViewAccessibility;
  id v6 = [(UITableViewAccessibility *)&v5 _accessibilityViewChildrenWithOptions:location[0]];
  [location[0] setShouldIncludeKeyboardObscuredElements:v7 & 1];
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_accessibilitySortedElementsWithin
{
  uint64_t v13 = self;
  v12[1] = (id)a2;
  v7[1] = (id)MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  unint64_t v10 = __62__UITableViewAccessibility__accessibilitySortedElementsWithin__block_invoke;
  uint64_t v11 = &unk_2650AE580;
  v12[0] = self;
  if (((uint64_t (*)(void))__62__UITableViewAccessibility__accessibilitySortedElementsWithin__block_invoke)())
  {
    v6.receiver = v13;
    v6.super_class = (Class)UITableViewAccessibility;
    v7[0] = [(UITableViewAccessibility *)&v6 _accessibilitySortedElementsWithin];
    id v14 = -[UITableViewAccessibility _accessibilitySortedElementsWithinPreservingFloatingHeader:sortedElements:](v13, 0, v7[0]);
    int v5 = 1;
    objc_storeStrong(v7, 0);
  }
  else
  {
    int v5 = 0;
  }
  objc_storeStrong(v12, 0);
  if (!v5)
  {
    id v4 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
    id v14 = [(UITableViewAccessibility *)v13 _accessibilitySortedElementsWithinWithOptions:v4];
    int v5 = 1;
    objc_storeStrong(&v4, 0);
  }
  id v2 = v14;

  return v2;
}

BOOL __62__UITableViewAccessibility__accessibilitySortedElementsWithin__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&_ReloadTimer_block_invoke_2_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_700);
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
      unint64_t v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      char v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)_ReloadTimer_block_invoke_2_BaseImplementation;
}

void __62__UITableViewAccessibility__accessibilitySortedElementsWithin__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    _ReloadTimer_block_invoke_2_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      char v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      id v3 = v7;
      int v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
      objc_super v6 = NSStringFromClass(v2);
      int v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilitySortedElementsWithinPreservingFloatingHeader:(void *)a3 sortedElements:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v30 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v28 = 0;
  objc_storeStrong(&v28, a3);
  if (v30)
  {
    id v26 = (id)[v28 mutableCopy];
    id v25 = (id)[v30 safeValueForKey:@"_index"];
    if (v25) {
      [v26 removeObject:v25];
    }
    id v24 = (id)[MEMORY[0x263EFF9C0] set];
    memset(__b, 0, sizeof(__b));
    id v10 = (id)[v30 indexPathsForVisibleRows];
    uint64_t v11 = [v10 countByEnumeratingWithState:__b objects:v32 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0;
      unint64_t v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v10);
        }
        id v23 = *(id *)(__b[1] + 8 * v8);
        id v21 = (id)objc_msgSend(v30, "headerViewForSection:", objc_msgSend(v23, "section"));
        if (v21 && ([v21 floating] & 1) != 0 && v21 != location) {
          [v24 addObject:v21];
        }
        objc_storeStrong(&v21, 0);
        ++v8;
        if (v6 + 1 >= v9)
        {
          uint64_t v8 = 0;
          unint64_t v9 = [v10 countByEnumeratingWithState:__b objects:v32 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }

    if ([v24 count])
    {
      id v20 = (id)[MEMORY[0x263F089C8] indexSet];
      id v5 = v26;
      uint64_t v13 = MEMORY[0x263EF8330];
      int v14 = -1073741824;
      int v15 = 0;
      uint64_t v16 = __102__UITableViewAccessibility__accessibilitySortedElementsWithinPreservingFloatingHeader_sortedElements___block_invoke;
      id v17 = &unk_2650AF330;
      id v18 = v24;
      id v19 = v20;
      [v5 enumerateObjectsUsingBlock:&v13];
      [v26 removeObjectsAtIndexes:v20];
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v20, 0);
    }
    if (v25) {
      [v26 insertObject:v25 atIndex:0];
    }
    id v31 = v26;
    int v27 = 1;
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v31 = 0;
    int v27 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&location, 0);
  id v3 = v31;

  return v3;
}

- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v17 = MEMORY[0x263EF8330];
  int v18 = -1073741824;
  int v19 = 0;
  id v20 = __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke;
  id v21 = &unk_2650AE580;
  id v22 = v25;
  char v23 = ((uint64_t (*)(void))__74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke)() & 1;
  v10[1] = (id)MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_706;
  int v14 = &unk_2650AE580;
  int v15 = v25;
  char v16 = ((uint64_t (*)(void))__74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_706)() & 1;
  v10[0] = 0;
  if (v23 & 1) == 0 || (v16)
  {
    v9.receiver = v25;
    v9.super_class = (Class)UITableViewAccessibility;
    id v5 = [(UITableViewAccessibility *)&v9 _accessibilitySortedElementsWithinWithOptions:location[0]];
    id v6 = v10[0];
    v10[0] = v5;
  }
  else
  {
    id v3 = [(UITableViewAccessibility *)v25 _accessibilitySortedElementsWithin];
    id v4 = v10[0];
    v10[0] = v3;
  }
  id v8 = -[UITableViewAccessibility _accessibilitySortedElementsWithinPreservingFloatingHeader:sortedElements:](v25, 0, v10[0]);
  objc_storeStrong(v10, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(location, 0);

  return v8;
}

BOOL __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  int v18 = (dispatch_once_t *)&_ReloadTimer_block_invoke_3_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_705);
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
      id v4 = v8;
      id v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      objc_super v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)_ReloadTimer_block_invoke_3_BaseImplementation;
}

void __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    _ReloadTimer_block_invoke_3_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
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
      objc_super v9 = v3;
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

BOOL __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_706(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  int v18 = (dispatch_once_t *)&_ReloadTimer_block_invoke_4_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_709);
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
      id v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
      id v4 = v8;
      char v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      objc_super v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)_ReloadTimer_block_invoke_4_BaseImplementation;
}

void __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2_707(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
  if (InstanceMethod)
  {
    _ReloadTimer_block_invoke_4_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
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
      objc_super v9 = v3;
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

void __102__UITableViewAccessibility__accessibilitySortedElementsWithinPreservingFloatingHeader_sortedElements___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v17 = a3;
  uint64_t v16 = a4;
  uint64_t v15 = a1;
  memset(__b, 0, sizeof(__b));
  obNSUInteger j = a1[4];
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v12)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v12;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(__b[1] + 8 * v6);
      if ([location[0] _accessibilityIsDescendantOfElement:v14]) {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v7) {
          goto LABEL_9;
        }
      }
    }
    [a1[5] addIndex:v17];
  }
LABEL_9:

  objc_storeStrong(location, 0);
}

- (int64_t)accessibilityElementCount
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  if ([(UITableViewAccessibility *)self isAccessibilityOpaqueElementProvider]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  location[0] = -[UITableViewAccessibility _accessibilityInternalData](v4);
  if (-[UITableViewAccessibility _accessibilityIsSearchTableVisible](v4)) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = -[_AXTableViewInternal accessibleElementCount]((uint64_t)location[0]);
  }
  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __64__UITableViewAccessibility__accessibilityInitializeInternalData__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _delegateWantsHeaderForSection:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result & 1;
  return result;
}

uint64_t __64__UITableViewAccessibility__accessibilityInitializeInternalData__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _delegateWantsFooterForSection:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result & 1;
  return result;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v48 = -[UITableViewAccessibility _accessibilityInternalData](v50);
  id v47 = location[0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [(UITableViewAccessibility *)v50 accessibilityTableViewCellAccessibilityElementForTableViewCell:v47];
    id v4 = v47;
    id v47 = v3;
  }
  objc_opt_class();
  char v46 = objc_opt_isKindOfClass() & 1;
  objc_opt_class();
  char v45 = objc_opt_isKindOfClass() & 1;
  if ((v46 & 1) == 0 && (v45 & 1) == 0) {
    goto LABEL_30;
  }
  memset(__b, 0, sizeof(__b));
  obNSUInteger j = (id)-[_AXTableViewInternal indexMap]((uint64_t)v48);
  uint64_t v28 = [obj countByEnumeratingWithState:__b objects:v60 count:16];
  if (v28)
  {
    uint64_t v24 = *(void *)__b[2];
    uint64_t v25 = 0;
    unint64_t v26 = v28;
    while (1)
    {
      uint64_t v23 = v25;
      if (*(void *)__b[2] != v24) {
        objc_enumerationMutation(obj);
      }
      id v44 = *(id *)(__b[1] + 8 * v25);
      id v20 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v48);
      id v42 = (id)[v20 objectForKey:v44];

      id v41 = (id)[v42 objectForKey:@"type"];
      unint64_t v40 = 0;
      id v21 = (id)[v42 objectForKey:@"offset"];
      uint64_t v22 = [v21 integerValue];

      unint64_t v40 = v22;
      uint64_t v38 = 0;
      unint64_t v39 = 0;
      uint64_t v38 = [v44 rangeValue];
      unint64_t v39 = v5;
      if ((v45 & 1) == 0) {
        goto LABEL_47;
      }
      unint64_t v19 = v40;
      if (v19 != -[UITableViewSectionElement section]((uint64_t)v47)) {
        goto LABEL_47;
      }
      if (([v41 isEqualToString:@"header"] & 1) != 0
        && (-[UITableViewSectionElement isHeader]((uint64_t)v47) & 1) != 0
        || ([v41 isEqualToString:@"footer"] & 1) != 0
        && (-[UITableViewSectionElement isHeader]((uint64_t)v47) & 1) == 0)
      {
        int64_t v51 = v38;
        int v37 = 1;
      }
      else
      {
LABEL_47:
        if ((v46 & 1) == 0 || ([v41 isEqualToString:@"row"] & 1) == 0) {
          goto LABEL_24;
        }
        id v36 = (id)-[UITableViewCellAccessibilityElement indexPath]((uint64_t)v47);
        unint64_t v35 = [(UITableViewAccessibility *)v50 globalRowForRowAtIndexPath:v36];
        unint64_t v53 = v40;
        unint64_t v52 = v39;
        unint64_t v54 = v40;
        unint64_t v55 = v39;
        unint64_t v33 = v40;
        unint64_t v34 = v39;
        unint64_t v57 = v40;
        unint64_t v58 = v39;
        unint64_t v56 = v35;
        BOOL v18 = 0;
        if (v35 >= v40) {
          BOOL v18 = v56 - v57 < v58;
        }
        if (v18)
        {
          uint64_t v17 = v38;
          int64_t v51 = v17 + [v36 row];
          int v37 = 1;
        }
        else
        {
          int v37 = 0;
        }
        objc_storeStrong(&v36, 0);
        if (!v37) {
LABEL_24:
        }
          int v37 = 0;
      }
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      if (v37) {
        break;
      }
      ++v25;
      if (v23 + 1 >= v26)
      {
        uint64_t v25 = 0;
        unint64_t v26 = [obj countByEnumeratingWithState:__b objects:v60 count:16];
        if (!v26) {
          goto LABEL_28;
        }
      }
    }
  }
  else
  {
LABEL_28:
    int v37 = 0;
  }

  if (!v37)
  {
LABEL_30:
    id v14 = v47;
    id v15 = (id)[(UITableViewAccessibility *)v50 safeValueForKey:@"_countLabel"];
    char v16 = objc_msgSend(v14, "isEqual:");

    if ((v16 & 1) == 0) {
      goto LABEL_43;
    }
    memset(v31, 0, sizeof(v31));
    id v12 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v48);
    uint64_t v13 = [v12 countByEnumeratingWithState:v31 objects:v59 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)v31[2];
      uint64_t v10 = 0;
      unint64_t v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)v31[2] != v9) {
          objc_enumerationMutation(v12);
        }
        id v32 = *(id *)(v31[1] + 8 * v10);
        id v7 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v48);
        id v30 = (id)[v7 objectForKey:v32];

        id v29 = (id)[v30 objectForKey:@"type"];
        if ([v29 isEqualToString:@"tableCount"])
        {
          int64_t v51 = [v32 rangeValue];
          int v37 = 1;
        }
        else
        {
          int v37 = 0;
        }
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
        if (v37) {
          break;
        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          uint64_t v10 = 0;
          unint64_t v11 = [v12 countByEnumeratingWithState:v31 objects:v59 count:16];
          if (!v11) {
            goto LABEL_41;
          }
        }
      }
    }
    else
    {
LABEL_41:
      int v37 = 0;
    }

    if (!v37)
    {
LABEL_43:
      int64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
      int v37 = 1;
    }
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  return v51;
}

- (id)_delegateViewForHeaderInSection:(int64_t)a3
{
  uint64_t v17 = self;
  v16[2] = (id)a2;
  v16[1] = (id)a3;
  v15.receiver = self;
  v15.super_class = (Class)UITableViewAccessibility;
  v16[0] = [(UITableViewAccessibility *)&v15 _delegateViewForHeaderInSection:a3];
  [v16[0] setShouldGroupAccessibilityChildren:1];
  id v14 = (id)[(UITableViewAccessibility *)v17 _accessibilityValueForKey:@"HeaderUpdateTimer"];
  if (!v14)
  {
    id v6 = objc_alloc(MEMORY[0x263F21398]);
    id v7 = MEMORY[0x263EF83A0];
    id v14 = (id)objc_msgSend(v6, "initWithTargetSerialQueue:");

    [(UITableViewAccessibility *)v17 _accessibilitySetRetainedValue:v14 forKey:@"HeaderUpdateTimer"];
  }
  [v14 cancel];
  id v4 = v14;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  unint64_t v11 = __60__UITableViewAccessibility__delegateViewForHeaderInSection___block_invoke;
  id v12 = &unk_2650ADF18;
  id v13 = v16[0];
  [v4 afterDelay:&v8 processBlock:0.5];
  id v5 = v16[0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v16, 0);

  return v5;
}

id __60__UITableViewAccessibility__delegateViewForHeaderInSection___block_invoke(uint64_t a1)
{
  id v1 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityFindDescendant:", &__block_literal_global_740, a1, a1);

  return v1;
}

uint64_t __60__UITableViewAccessibility__delegateViewForHeaderInSection___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v4 = 0;
  BOOL v3 = 0;
  if ([location[0] isAccessibilityElement])
  {
    id v5 = (id)[location[0] accessibilityUserDefinedTraits];
    char v4 = 1;
    BOOL v3 = v5 == 0;
  }
  if (v4) {

  }
  if (v3) {
    [location[0] _setAccessibilityAdditionalTraitsBlock:&__block_literal_global_743];
  }
  objc_storeStrong(location, 0);
  return 0;
}

uint64_t __60__UITableViewAccessibility__delegateViewForHeaderInSection___block_invoke_3()
{
  return *MEMORY[0x263F1CEF8];
}

- (id)_delegateViewForFooterInSection:(int64_t)a3
{
  v6[3] = self;
  v6[2] = (id)a2;
  v6[1] = (id)a3;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewAccessibility;
  v6[0] = [(UITableViewAccessibility *)&v5 _delegateViewForFooterInSection:a3];
  [v6[0] setShouldGroupAccessibilityChildren:1];
  id v4 = v6[0];
  objc_storeStrong(v6, 0);

  return v4;
}

- (void)_updateDropTargetAppearanceWithTargetIndexPath:(id)a3 dropProposal:(id)a4 dropSession:(id)a5
{
  int v73 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v71 = 0;
  objc_storeStrong(&v71, a4);
  id v70 = 0;
  objc_storeStrong(&v70, a5);
  char v68 = 0;
  objc_opt_class();
  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  int v62 = 838860800;
  int v63 = 48;
  char v64 = __Block_byref_object_copy__20;
  id v65 = __Block_byref_object_dispose__20;
  id v66 = 0;
  uint64_t v54 = MEMORY[0x263EF8330];
  int v55 = -1073741824;
  int v56 = 0;
  unint64_t v57 = __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke;
  unint64_t v58 = &unk_2650AE390;
  v59[1] = &v60;
  v59[0] = v73;
  AXPerformSafeBlock();
  id v53 = (id)v61[5];
  objc_storeStrong(v59, 0);
  _Block_object_dispose(&v60, 8);
  objc_storeStrong(&v66, 0);
  id v67 = (id)__UIAccessibilityCastAsClass();

  if (v68) {
    abort();
  }
  id v52 = v67;
  objc_storeStrong(&v67, 0);
  id v69 = v52;
  v51.receiver = v73;
  v51.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v51 _updateDropTargetAppearanceWithTargetIndexPath:location[0] dropProposal:v71 dropSession:v70];
  char v49 = 0;
  objc_opt_class();
  uint64_t v41 = 0;
  id v42 = &v41;
  int v43 = 838860800;
  int v44 = 48;
  char v45 = __Block_byref_object_copy__20;
  char v46 = __Block_byref_object_dispose__20;
  id v47 = 0;
  uint64_t v35 = MEMORY[0x263EF8330];
  int v36 = -1073741824;
  int v37 = 0;
  uint64_t v38 = __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke_2;
  unint64_t v39 = &unk_2650AE390;
  v40[1] = &v41;
  v40[0] = v73;
  AXPerformSafeBlock();
  id v34 = (id)v42[5];
  objc_storeStrong(v40, 0);
  _Block_object_dispose(&v41, 8);
  objc_storeStrong(&v47, 0);
  id v48 = (id)__UIAccessibilityCastAsClass();

  if (v49) {
    abort();
  }
  id v33 = v48;
  objc_storeStrong(&v48, 0);
  id v50 = v33;
  if (([v69 isEqual:v33] & 1) == 0 && v69 && v50)
  {
    char v30 = 0;
    objc_opt_class();
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    int v24 = 838860800;
    int v25 = 48;
    unint64_t v26 = __Block_byref_object_copy__20;
    int v27 = __Block_byref_object_dispose__20;
    id v28 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    int v17 = -1073741824;
    int v18 = 0;
    unint64_t v19 = __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke_3;
    id v20 = &unk_2650AE390;
    v21[1] = &v22;
    v21[0] = v73;
    AXPerformSafeBlock();
    id v15 = (id)v23[5];
    objc_storeStrong(v21, 0);
    _Block_object_dispose(&v22, 8);
    objc_storeStrong(&v28, 0);
    id v29 = (id)__UIAccessibilityCastAsClass();

    if (v30) {
      abort();
    }
    id v14 = v29;
    objc_storeStrong(&v29, 0);
    id v31 = v14;
    if (v14)
    {
      uint64_t v13 = [(UITableViewAccessibility *)v73 globalRowForRowAtIndexPath:v31];
      uint64_t v12 = [(UITableViewAccessibility *)v73 globalRowForRowAtIndexPath:v69];
      uint64_t v11 = [(UITableViewAccessibility *)v73 globalRowForRowAtIndexPath:v50];
      BOOL v10 = v11 > v12;
      uint64_t v9 = -[UITableViewAccessibility _accessibilitySwappedWithRowForInitialGlobalRow:oldGlobalRow:globalRow:]((uint64_t)v73, v13, v12, v11);
      id v8 = -[UITableViewAccessibility _accessibilityReorderMessageForNewIndexPath:swappedWithRow:movingDown:](v73, v50, v9, v11 > v12);
      id argument = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v8];
      [argument setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21808]];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
      objc_storeStrong(&argument, 0);
      objc_storeStrong(&v8, 0);
      int v32 = 0;
    }
    else
    {
      int v32 = 1;
    }
    objc_storeStrong(&v31, 0);
  }
  else
  {
    int v32 = 1;
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, 0);
}

void __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _gapIndexPath];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v1;
}

void __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _gapIndexPath];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v1;
}

void __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke_3(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _draggedIndexPath];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v1;
}

- (uint64_t)_accessibilitySwappedWithRowForInitialGlobalRow:(uint64_t)a3 oldGlobalRow:(uint64_t)a4 globalRow:
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = a3;
  if (a2 != a4)
  {
    if (a4 >= a3)
    {
      if (a4 > a3)
      {
        if (a2 <= a4) {
          return a4;
        }
        else {
          return a3;
        }
      }
    }
    else if (a2 >= a4)
    {
      return a3 - 1;
    }
    else
    {
      return a4 + 1;
    }
  }
  return v5;
}

- (id)_accessibilityReorderMessageForNewIndexPath:(uint64_t)a3 swappedWithRow:(char)a4 movingDown:
{
  int v72 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  uint64_t v70 = a3;
  char v69 = a4 & 1;
  if (v72)
  {
    uint64_t v67 = [v72 globalRowForRowAtIndexPath:location];
    id v66 = (id)[v72 indexPathForRowAtGlobalRow:v70];
    uint64_t v59 = 0;
    uint64_t v60 = &v59;
    int v61 = 838860800;
    int v62 = 48;
    int v63 = __Block_byref_object_copy__20;
    char v64 = __Block_byref_object_dispose__20;
    id v65 = (id)[v72 cellForRowAtIndexPath:v66];
    if (([(id)v60[5] isAccessibilityElement] & 1) == 0)
    {
      id v4 = (void *)v60[5];
      v53[1] = (id)MEMORY[0x263EF8330];
      int v54 = -1073741824;
      int v55 = 0;
      int v56 = __98__UITableViewAccessibility__accessibilityReorderMessageForNewIndexPath_swappedWithRow_movingDown___block_invoke;
      unint64_t v57 = &unk_2650AEB20;
      unint64_t v58 = &v59;
      objc_msgSend(v4, "accessibilityEnumerateContainerElementsUsingBlock:");
    }
    v53[0] = (id)[(id)v60[5] _accessibilityAXAttributedLabel];
    id v52 = (id)[(id)v60[5] accessibilityLanguage];
    id v51 = 0;
    if ([v53[0] length])
    {
      if (v69)
      {
        int v25 = NSString;
        id v24 = accessibilityLocalizedString(@"row.reorder.moved.below");
        id v13 = (id)[v25 stringWithFormat:v53[0]];
        id v14 = v51;
        id v51 = v13;
      }
      else
      {
        uint64_t v23 = NSString;
        id v22 = accessibilityLocalizedString(@"row.reorder.moved.above");
        id v15 = (id)[v23 stringWithFormat:v53[0]];
        id v16 = v51;
        id v51 = v15;
      }
    }
    else if (v67 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v50 = 0;
      char v48 = 0;
      uint64_t v39 = [location section];
      char v38 = 0;
      if (v39 < -[UITableViewAccessibility _axNumberOfSections](v72))
      {
        id v49 = (id)[v72 dataSource];
        char v48 = 1;
        char v38 = objc_opt_respondsToSelector();
      }
      if (v48) {

      }
      if (v38)
      {
        id v37 = (id)[v72 dataSource];
        id v5 = (id)objc_msgSend(v37, "tableView:titleForHeaderInSection:", v72, objc_msgSend(location, "section"));
        id v6 = v50;
        id v50 = v5;
      }
      if ([v50 length])
      {
        int v36 = NSString;
        id v35 = accessibilityLocalizedString(@"row.index.path.section.name");
        [location row];
        id v34 = (id)AXFormatInteger();
        id v7 = (id)objc_msgSend(v36, "stringWithFormat:", v35, v50, v34);
        id v8 = v51;
        id v51 = v7;
      }
      else
      {
        id v33 = NSString;
        id v32 = accessibilityLocalizedString(@"row.index.path");
        [location section];
        id v31 = (id)AXFormatInteger();
        [location row];
        id v30 = (id)AXFormatInteger();
        id v9 = (id)objc_msgSend(v33, "stringWithFormat:", v32, v31, v30);
        id v10 = v51;
        id v51 = v9;
      }
      objc_storeStrong(&v50, 0);
    }
    else
    {
      unint64_t v47 = -[UITableViewAccessibility _axNumberOfSections](v72);
      unint64_t v46 = 0;
      uint64_t v45 = 0;
      while (v46 < v47)
        v45 += [v72 numberOfRowsInSection:v46++];
      ++v67;
      id v29 = NSString;
      id v28 = accessibilityLocalizedString(@"row.with.total.count");
      id v27 = (id)AXFormatInteger();
      id v26 = (id)AXFormatInteger();
      id v11 = (id)objc_msgSend(v29, "stringWithFormat:", v28, v27, v26);
      id v12 = v51;
      id v51 = v11;
    }
    if ([v52 length])
    {
      id v17 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v51];
      id v18 = v51;
      id v51 = v17;

      uint64_t v43 = [v51 rangeOfString:v53[0]];
      uint64_t v44 = v19;
      id v42 = (id)*MEMORY[0x263F217A8];
      if (([v53[0] isAXAttributedString] & 1) != 0
        && ([v53[0] hasAttribute:*MEMORY[0x263F217F0]] & 1) != 0)
      {
        objc_storeStrong(&v42, (id)*MEMORY[0x263F217F0]);
      }
      objc_msgSend(v51, "setAttribute:forKey:withRange:", v52, v42, v43, v44);
      objc_storeStrong(&v42, 0);
    }
    id v73 = v51;
    int v68 = 1;
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong(v53, 0);
    _Block_object_dispose(&v59, 8);
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, 0);
  }
  else
  {
    id v73 = 0;
    int v68 = 1;
  }
  objc_storeStrong(&location, 0);
  id v20 = v73;

  return v20;
}

void __98__UITableViewAccessibility__accessibilityReorderMessageForNewIndexPath_swappedWithRow_movingDown___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_reorderPositionChangedForCell:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v13 = (id)[(UITableViewAccessibility *)v17 safeValueForKey:@"_reorderingSupport"];
    id v12 = (id)[v13 safeValueForKey:@"_initialIndexPath"];
    id v11 = (id)objc_msgSend(v13, "safeValueForKey:");
    v10.receiver = v17;
    v10.super_class = (Class)UITableViewAccessibility;
    [(UITableViewAccessibility *)&v10 _reorderPositionChangedForCell:location[0]];
    id v9 = (id)[v13 safeValueForKey:@"_targetIndexPath"];
    if ([v11 isEqual:v9])
    {
      int v14 = 1;
    }
    else
    {
      uint64_t v8 = [(UITableViewAccessibility *)v17 globalRowForRowAtIndexPath:v12];
      uint64_t v7 = [(UITableViewAccessibility *)v17 globalRowForRowAtIndexPath:v9];
      uint64_t v6 = [(UITableViewAccessibility *)v17 globalRowForRowAtIndexPath:v11];
      uint64_t v5 = -[UITableViewAccessibility _accessibilitySwappedWithRowForInitialGlobalRow:oldGlobalRow:globalRow:]((uint64_t)v17, v8, v6, v7);
      id argument = -[UITableViewAccessibility _accessibilityReorderMessageForNewIndexPath:swappedWithRow:movingDown:](v17, v9, v5, v7 > v6);
      BOOL v3 = (UIAccessibilityNotifications *)MEMORY[0x263F1CDC8];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
      UIAccessibilityPostNotification(*v3, (id)*MEMORY[0x263F21980]);
      objc_storeStrong(&argument, 0);
      int v14 = 0;
    }
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    v15.receiver = v17;
    v15.super_class = (Class)UITableViewAccessibility;
    [(UITableViewAccessibility *)&v15 _reorderPositionChangedForCell:location[0]];
    int v14 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_endReorderingForCell:(id)a3 wasCancelled:(BOOL)a4 animated:(BOOL)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  BOOL v8 = a5;
  v7.receiver = v11;
  v7.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v7 _endReorderingForCell:location[0] wasCancelled:a4 animated:a5];
  [(UITableViewAccessibility *)v11 _accessibilityClearChildren];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityTableViewCellElementForIndexPath:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v9 = -[UITableViewAccessibility _accessibilityInternalData](v12);
    id v7 = (id)-[_AXTableViewInternal children]((uint64_t)v9);
    id v8 = (id)[v7 objectForKey:location[0]];

    if (!v8)
    {
      id v3 = objc_allocWithZone((Class)UITableViewCellAccessibilityElement);
      id v8 = (id)[v3 initWithAccessibilityContainer:v12];

      -[UITableViewCellAccessibilityElement setIndexPath:]((uint64_t)v8, location[0]);
      id v6 = (id)-[_AXTableViewInternal children]((uint64_t)v9);
      [v6 setObject:v8 forKey:location[0]];
    }
    id v13 = v8;
    int v10 = 1;
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    id v13 = 0;
    int v10 = 1;
  }
  objc_storeStrong(location, 0);
  id v4 = v13;

  return v4;
}

- (id)accessibilityTableViewCellElementAtGlobalRow:(int64_t)a3
{
  id v6 = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = (id)[(UITableViewAccessibility *)self indexPathForRowAtGlobalRow:a3];
  if (location[0]) {
    id v7 = [(UITableViewAccessibility *)v6 _accessibilityTableViewCellElementForIndexPath:location[0]];
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong(location, 0);
  id v3 = v7;

  return v3;
}

- (id)_accessibilityFirstVisibleItem
{
  id v9 = self;
  v8[1] = (id)a2;
  if ([(UITableViewAccessibility *)self isAccessibilityOpaqueElementProvider])
  {
    -[UITableViewAccessibility _accessibilitySetBoolValue:forKey:](v9, "_accessibilitySetBoolValue:forKey:", 0);
    v8[0] = (id)[(UITableViewAccessibility *)v9 _accessibilityFirstOpaqueElement];
    [(UITableViewAccessibility *)v9 _accessibilityRemoveValueForKey:@"AXTableViewOpaqueScrollsIntoViewKey"];
    id v10 = v8[0];
    objc_storeStrong(v8, 0);
  }
  else
  {
    id v7 = (id)[(UITableViewAccessibility *)v9 indexPathsForVisibleRows];
    if ([v7 count])
    {
      id v5 = (id)[v7 objectAtIndex:0];
      id v4 = [(UITableViewAccessibility *)v9 accessibilityTableViewCellElementAtGlobalRow:[(UITableViewAccessibility *)v9 globalRowForRowAtIndexPath:v5]];
      id v10 = v4;
      int v6 = 1;
      objc_storeStrong(&v4, 0);
      objc_storeStrong(&v5, 0);
    }
    else
    {
      id v10 = 0;
      int v6 = 1;
    }
    objc_storeStrong(&v7, 0);
  }
  uint64_t v2 = v10;

  return v2;
}

- (void)_accessibilityOpaqueElementScrollCleanup
{
  uint64_t v2 = (void *)[(UITableViewAccessibility *)self safeValueForKey:@"_updateVisibleCellsImmediatelyIfNecessary", a2, self];

  id v3 = v2;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v35 = self;
  SEL v34 = a2;
  unint64_t v33 = a3;
  if ([(UITableViewAccessibility *)self isAccessibilityOpaqueElementProvider])
  {
    id v36 = 0;
    goto LABEL_35;
  }
  if (-[UITableViewAccessibility _accessibilitySearchTableViewVisible](v35))
  {
    id v36 = 0;
    goto LABEL_35;
  }
  id v32 = -[UITableViewAccessibility _accessibilityInternalData](v35);
  if (-[_AXTableViewInternal accessibleElementCount]((uint64_t)v32))
  {
    id v30 = 0;
    uint64_t v29 = 0;
    uint64_t v38 = 0;
    uint64_t v37 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    long long v28 = 0uLL;
    memset(__b, 0, sizeof(__b));
    obNSUInteger j = (id)-[_AXTableViewInternal indexMap]((uint64_t)v32);
    uint64_t v20 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
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
        id v27 = *(id *)(__b[1] + 8 * v17);
        *(void *)&long long v25 = [v27 rangeValue];
        *((void *)&v25 + 1) = v3;
        long long v28 = v25;
        long long v42 = v25;
        unint64_t v41 = v33;
        BOOL v14 = 0;
        if (v33 >= (unint64_t)v25) {
          BOOL v14 = v41 - (unint64_t)v42 < *((void *)&v42 + 1);
        }
        if (v14) {
          break;
        }
        ++v17;
        if (v15 + 1 >= v18)
        {
          uint64_t v17 = 0;
          unint64_t v18 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
          if (!v18) {
            goto LABEL_17;
          }
        }
      }
      id v12 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v32);
      id v24 = (id)[v12 objectForKey:v27];

      id v4 = (id)[v24 objectForKey:@"type"];
      id v5 = v30;
      id v30 = v4;

      id v13 = (id)[v24 objectForKey:@"offset"];
      uint64_t v29 = [v13 integerValue];

      int v31 = 2;
      objc_storeStrong(&v24, 0);
    }
    else
    {
LABEL_17:
      int v31 = 0;
    }

    if (!v30)
    {
      _AXAssert();
      id v36 = 0;
      int v31 = 1;
LABEL_33:
      objc_storeStrong(&v30, 0);
      goto LABEL_34;
    }
    id v23 = 0;
    if ([v30 isEqualToString:@"row"])
    {
      unint64_t v33 = v33 - v28 + v29;
      id v6 = [(UITableViewAccessibility *)v35 accessibilityTableViewCellElementAtGlobalRow:v33];
      id v7 = v23;
      id v23 = v6;

LABEL_31:
      id v36 = v23;
      int v31 = 1;
      goto LABEL_32;
    }
    if ([v30 isEqualToString:@"tableCount"])
    {
      id v36 = (id)[(UITableViewAccessibility *)v35 safeValueForKey:@"_countLabel"];
      int v31 = 1;
    }
    else
    {
      char v22 = [v30 isEqualToString:@"header"] & 1;
      char v21 = [v30 isEqualToString:@"footer"] & 1;
      if ((v22 & 1) == 0 && (v21 & 1) == 0) {
        _AXAssert();
      }
      if (v22 & 1) != 0 || (v21)
      {
        id v8 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v35, v29, v22 & 1);
        id v9 = v23;
        id v23 = v8;

        goto LABEL_31;
      }
      id v36 = 0;
      int v31 = 1;
    }
LABEL_32:
    objc_storeStrong(&v23, 0);
    goto LABEL_33;
  }
  id v36 = 0;
  int v31 = 1;
LABEL_34:
  objc_storeStrong(&v32, 0);
LABEL_35:
  id v10 = v36;

  return v10;
}

- (uint64_t)_accessibilityDefaultTableViewCellScrollPosition
{
  if (a1) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)accessibilityElementForRow:(unint64_t)a3 andColumn:(unint64_t)a4
{
  id v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  unint64_t v10 = a4;
  id v9 = 0;
  if (a4 < -[UITableViewAccessibility _axNumberOfSections](self)
    && v11 < [(UITableViewAccessibility *)v13 numberOfRowsInSection:v10])
  {
    id location = (id)[MEMORY[0x263F088C8] indexPathForRow:v11 inSection:v10];
    if ([(UITableViewAccessibility *)v13 isAccessibilityOpaqueElementProvider])
    {
      [(UITableViewAccessibility *)v13 scrollToRowAtIndexPath:location atScrollPosition:0 animated:0];
      id v4 = (id)[(UITableViewAccessibility *)v13 cellForRowAtIndexPath:location];
    }
    else
    {
      id v4 = [(UITableViewAccessibility *)v13 _accessibilityTableViewCellElementForIndexPath:location];
    }
    id v5 = v9;
    id v9 = v4;

    objc_storeStrong(&location, 0);
  }
  id v7 = v9;
  objc_storeStrong(&v9, 0);

  return v7;
}

- (id)accessibilityTableViewCellAccessibilityElementForTableViewCell:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[(UITableViewAccessibility *)v8 indexPathForCell:location[0]];
  if (v6)
  {
    uint64_t v3 = [(UITableViewAccessibility *)v8 globalRowForRowAtIndexPath:v6];
    id v9 = [(UITableViewAccessibility *)v8 accessibilityTableViewCellElementAtGlobalRow:v3];
  }
  else
  {
    id v9 = 0;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  id v4 = v9;

  return v4;
}

- (void)accessibilityFindMockParentForTableViewCell:(void *)a1
{
  id v8 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    id v5 = (id)[v8 indexPathForCell:location];
    if (v5)
    {
      uint64_t v4 = [v8 globalRowForRowAtIndexPath:v5];
      id v3 = (id)[v8 accessibilityTableViewCellElementAtGlobalRow:v4];
      id v2 = (id)[v3 tableViewCell];
      objc_storeStrong(&v3, 0);
    }
    objc_storeStrong(&v5, 0);
    int v6 = 0;
  }
  else
  {
    int v6 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityUIScrollViewScrollStatus
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewAccessibility;
  return [(UITableViewAccessibility *)&v3 _accessibilityScrollStatus];
}

- (BOOL)_accessibilityShouldVerifyTableViewCellsAreVisibleByHitTesting
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  uint64_t v43 = self;
  v42[1] = (id)a2;
  v42[0] = (id)[(UITableViewAccessibility *)self _accessibilityDelegateScrollStatus];
  if ([v42[0] length])
  {
    id v44 = v42[0];
    int v41 = 1;
  }
  else
  {
    id v2 = (UITableViewAccessibility *)(id)[(UITableViewAccessibility *)v43 safeValueForKey:@"dataSource"];
    BOOL v25 = v2 == v43;

    if (v25
      || ((v24 = (id)-[UITableViewAccessibility safeValueForKey:](v43, "safeValueForKey:", @"dataSource"), id location = (id)[v24 _accessibilityScrollStatus], v24, !location)? (v41 = 0): (v44 = location, v41 = 1), objc_storeStrong(&location, 0), !v41))
    {
      id v3 = (id)[(UITableViewAccessibility *)v43 safeValueForKey:@"_updateVisibleCellsImmediatelyIfNecessary"];
      id v39 = (id)[(UITableViewAccessibility *)v43 safeValueForKey:@"indexPathsForVisibleRows"];
      if ([(UITableViewAccessibility *)v43 _accessibilityShouldVerifyTableViewCellsAreVisibleByHitTesting])
      {
        id v22 = v39;
        char v21 = (void *)MEMORY[0x263F08A98];
        uint64_t v33 = MEMORY[0x263EF8330];
        int v34 = -1073741824;
        int v35 = 0;
        id v36 = __54__UITableViewAccessibility__accessibilityScrollStatus__block_invoke;
        uint64_t v37 = &unk_2650AF358;
        uint64_t v38 = v43;
        id v23 = (id)[v21 predicateWithBlock:&v33];
        id v4 = (id)objc_msgSend(v22, "filteredArrayUsingPredicate:");
        id v5 = v39;
        id v39 = v4;

        objc_storeStrong((id *)&v38, 0);
      }
      if ([v39 count])
      {
        uint64_t v17 = v43;
        id v18 = (id)[v39 objectAtIndex:0];
        uint64_t v31 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v17, "globalRowForRowAtIndexPath:");

        uint64_t v19 = v43;
        id v20 = (id)[v39 lastObject];
        uint64_t v29 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v19, "globalRowForRowAtIndexPath:");

        uint64_t v32 = v31 + 1;
        uint64_t v30 = v29 + 1;
        uint64_t v28 = 0;
        uint64_t v27 = -[UITableViewAccessibility _axNumberOfSections](v43);
        for (uint64_t i = 0; i < v27; ++i)
          v28 += [(UITableViewAccessibility *)v43 numberOfRowsInSection:i];
        if (v32 == v30)
        {
          id v13 = NSString;
          id v16 = accessibilityLocalizedString(@"row.with.total.count");
          id v15 = (id)AXFormatInteger();
          id v14 = (id)AXFormatInteger();
          id v44 = (id)objc_msgSend(v13, "stringWithFormat:", v16, v15, v14);
        }
        else
        {
          id v8 = NSString;
          id v12 = accessibilityLocalizedString(@"table.scrollbypage.status");
          id v11 = (id)AXFormatInteger();
          id v10 = (id)AXFormatInteger();
          id v9 = (id)AXFormatInteger();
          id v44 = (id)objc_msgSend(v8, "stringWithFormat:", v12, v11, v10, v9);
        }
        int v41 = 1;
      }
      else
      {
        id v44 = 0;
        int v41 = 1;
      }
      objc_storeStrong(&v39, 0);
    }
  }
  objc_storeStrong(v42, 0);
  int v6 = v44;

  return v6;
}

uint64_t __54__UITableViewAccessibility__accessibilityScrollStatus__block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v11 = 0;
  objc_storeStrong(&v11, a3);
  v10[1] = a1;
  v10[0] = (id)[a1[4] cellForRowAtIndexPath:location[0]];
  char v9 = [v10[0] _accessibilityIsVisibleByCompleteHitTest] & 1;
  id v6 = (id)[v10[0] safeValueForKey:@"_accessibilityMockParent"];
  char v7 = [v6 _accessibilityIsVisibleByCompleteHitTest];

  char v8 = 1;
  if ((v9 & 1) == 0) {
    char v8 = v7 & 1;
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)description
{
  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewAccessibility;
  v5[0] = [(UITableViewAccessibility *)&v4 description];
  id v3 = v5[0];
  objc_storeStrong(v5, 0);

  return v3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v27 = self;
  v26[1] = (id)a2;
  if (!UIAccessibilityIsVoiceOverRunning()
    || [(UITableViewAccessibility *)v27 isAccessibilityElement])
  {
    id v2 = (id)[(UITableViewAccessibility *)v27 accessibilityUserDefinedLabel];
    BOOL v17 = v2 == 0;

    if (v17)
    {
      v26[0] = (id)[(UITableViewAccessibility *)v27 safeValueForKey:@"backgroundView"];
      if ([v26[0] isAccessibilityElement])
      {
        id v28 = (id)[v26[0] _accessibilityAXAttributedLabel];
        int v25 = 1;
      }
      else
      {
        if (![(UITableViewAccessibility *)v27 isAccessibilityElement]) {
          goto LABEL_26;
        }
        id v24 = (id)[MEMORY[0x263F81198] options];
        [v24 setShouldUseAllSubviews:1];
        id v23 = [(UITableViewAccessibility *)v27 _accessibilityViewChildrenWithOptions:v24];
        id location = 0;
        memset(__b, 0, sizeof(__b));
        obNSUInteger j = v23;
        uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (v16)
        {
          uint64_t v12 = *(void *)__b[2];
          uint64_t v13 = 0;
          unint64_t v14 = v16;
          while (1)
          {
            uint64_t v11 = v13;
            if (*(void *)__b[2] != v12) {
              objc_enumerationMutation(obj);
            }
            id v21 = *(id *)(__b[1] + 8 * v13);
            char v18 = 0;
            BOOL v10 = 0;
            if (objc_msgSend(v21, "isAccessibilityElement", v8, v9))
            {
              objc_opt_class();
              BOOL v10 = 0;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v19 = (id)[v21 _accessibilityAncestorIsKindOf:objc_opt_class()];
                char v18 = 1;
                BOOL v10 = v19 == 0;
              }
            }
            if (v18) {

            }
            if (v10)
            {
              id v8 = (id)[v21 accessibilityLabel];
              char v9 = @"__AXStringForVariablesSentinel";
              id v3 = (id)__UIAXStringForVariables();
              id v4 = location;
              id location = v3;
            }
            ++v13;
            if (v11 + 1 >= v14)
            {
              uint64_t v13 = 0;
              unint64_t v14 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
              if (!v14) {
                break;
              }
            }
          }
        }

        if ([location length])
        {
          id v28 = location;
          int v25 = 1;
        }
        else
        {
          int v25 = 0;
        }
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
        if (!v25)
        {
LABEL_26:
          [(UITableViewAccessibility *)v27 safeRangeForKey:@"_visibleGlobalRows", v8, v9];
          if (v5) {
            id v28 = 0;
          }
          else {
            id v28 = accessibilityLocalizedString(@"uitable.emptytable.text");
          }
          int v25 = 1;
        }
      }
      objc_storeStrong(v26, 0);
    }
    else
    {
      id v28 = (id)[(UITableViewAccessibility *)v27 accessibilityUserDefinedLabel];
    }
  }
  else
  {
    id v28 = 0;
  }
  id v6 = v28;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  id v2 = (id)[(UITableViewAccessibility *)self accessibilityUserDefinedTraits];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    if (-[UITableViewAccessibility _accessibilityIsSearchTableVisible](self)) {
      return *MEMORY[0x263F813E8];
    }
    else {
      return *MEMORY[0x263F1CF18];
    }
  }
  else
  {
    id v4 = (id)[(UITableViewAccessibility *)self accessibilityUserDefinedTraits];
    unint64_t v7 = [v4 unsignedLongLongValue];
  }
  return v7;
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
  id v2 = (id)[(UITableViewAccessibility *)self storedAccessibilityContainerType];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    if (-[UITableViewAccessibility _axNumberOfSections](self) <= 0
      || [(UITableViewAccessibility *)self isAccessibilityElement])
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
    id v4 = (id)[(UITableViewAccessibility *)self storedAccessibilityContainerType];
    int64_t v7 = [v4 integerValue];
  }
  return v7;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  id v6 = self;
  SEL v5 = a2;
  if (![(UITableViewAccessibility *)self accessibilityElementCount]) {
    return 0;
  }
  v3.receiver = v6;
  v3.super_class = (Class)UITableViewAccessibility;
  return [(UITableViewAccessibility *)&v3 accessibilityRespondsToUserInteraction];
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 0;
}

- (id)_axVisibleHeadersAndFootersPriorToFirstVisibleCellSection:(void *)a1
{
  char v18 = a1;
  uint64_t v17 = a2;
  if (!a1)
  {
    id v19 = 0;
    goto LABEL_18;
  }
  [v18 accessibilityFrame];
  v16.origin.x = v2;
  v16.origin.y = v3;
  v16.size.width = v4;
  v16.size.height = v5;
  id v15 = (id)[MEMORY[0x263EFF980] array];
  for (uint64_t i = v17 - 1; i >= 0; --i)
  {
    id v13 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v18, i, 0);
    if (v13)
    {
      memset(&recta, 0, sizeof(recta));
      [v13 accessibilityFrame];
      CGRect recta = v21;
      double MaxY = CGRectGetMaxY(v21);
      if (MaxY <= CGRectGetMinY(v16))
      {
        int v11 = 2;
        goto LABEL_15;
      }
      objc_msgSend(v15, "insertObject:atIndex:", v13, 0, MaxY);
    }
    id location = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v18, i, 1);
    if (!location) {
      goto LABEL_13;
    }
    [location accessibilityFrame];
    double v8 = CGRectGetMaxY(v22);
    if (v8 > CGRectGetMinY(v16))
    {
      objc_msgSend(v15, "insertObject:atIndex:", location, 0, v8);
LABEL_13:
      int v11 = 0;
      goto LABEL_14;
    }
    int v11 = 2;
LABEL_14:
    objc_storeStrong(&location, 0);
LABEL_15:
    objc_storeStrong(&v13, 0);
    if (v11) {
      break;
    }
  }
  id v19 = v15;
  int v11 = 1;
  objc_storeStrong(&v15, 0);
LABEL_18:
  id v6 = v19;

  return v6;
}

- (id)_axVisibleHeadersAndFootersAfterLastVisibleCellSection:(void *)a1
{
  id v19 = a1;
  uint64_t v18 = a2;
  if (!a1)
  {
    id v20 = 0;
    goto LABEL_18;
  }
  [v19 accessibilityFrame];
  v17.origin.x = v2;
  v17.origin.y = v3;
  v17.size.width = v4;
  v17.size.height = v5;
  id v16 = (id)[MEMORY[0x263EFF980] array];
  uint64_t v15 = -[UITableViewAccessibility _axNumberOfSections](v19);
  for (uint64_t i = v18 + 1; i < v15; ++i)
  {
    id v13 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v19, i, 1);
    if (v13)
    {
      memset(&recta, 0, sizeof(recta));
      [v13 accessibilityFrame];
      CGRect recta = v22;
      double MinY = CGRectGetMinY(v22);
      if (MinY > CGRectGetMaxY(v17))
      {
        int v11 = 2;
        goto LABEL_15;
      }
      objc_msgSend(v16, "insertObject:atIndex:", v13, 0, MinY);
    }
    id location = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v19, i, 0);
    if (!location) {
      goto LABEL_13;
    }
    [location accessibilityFrame];
    double v8 = CGRectGetMinY(v23);
    if (v8 <= CGRectGetMaxY(v17))
    {
      objc_msgSend(v16, "insertObject:atIndex:", location, 0, v8);
LABEL_13:
      int v11 = 0;
      goto LABEL_14;
    }
    int v11 = 2;
LABEL_14:
    objc_storeStrong(&location, 0);
LABEL_15:
    objc_storeStrong(&v13, 0);
    if (v11) {
      break;
    }
  }
  id v20 = v16;
  int v11 = 1;
  objc_storeStrong(&v16, 0);
LABEL_18:
  id v6 = v20;

  return v6;
}

- (id)_accessibilityScannerGroupElements
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  int v61 = self;
  v60[1] = (id)a2;
  v60[0] = (id)[MEMORY[0x263EFF980] array];
  uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
  id v58 = 0;
  uint64_t v57 = 64;
  if (-[UITableViewAccessibility _axNumberOfSections](v61) > 1) {
    v57 |= 0x10uLL;
  }
  memset(__b, 0, sizeof(__b));
  obuint64_t j = (id)[(UITableViewAccessibility *)v61 indexPathsForVisibleRows];
  uint64_t v40 = [obj countByEnumeratingWithState:__b objects:v68 count:16];
  if (v40)
  {
    uint64_t v36 = *(void *)__b[2];
    uint64_t v37 = 0;
    unint64_t v38 = v40;
    while (1)
    {
      uint64_t v35 = v37;
      if (*(void *)__b[2] != v36) {
        objc_enumerationMutation(obj);
      }
      id v56 = *(id *)(__b[1] + 8 * v37);
      int v34 = v61;
      uint64_t v33 = [v56 row];
      id v54 = -[UITableViewAccessibility accessibilityElementForRow:andColumn:](v34, "accessibilityElementForRow:andColumn:", v33, [v56 section]);
      unint64_t v53 = 0;
      unint64_t v53 = [v56 section];
      if (v53 != v59)
      {
        if ([v58 count])
        {
          v66[0] = @"GroupElements";
          v67[0] = v58;
          v66[1] = @"GroupTraits";
          id v32 = (id)[NSNumber numberWithUnsignedLong:v57];
          v67[1] = v32;
          v66[2] = @"GroupScanBehaviorTraits";
          v67[2] = &unk_26F48EAF8;
          id v66[3] = @"GroupIdentifier";
          uint64_t v29 = NSString;
          id v31 = [(UITableViewAccessibility *)v61 _accessibilityGroupIdentifier];
          id v30 = (id)[v29 stringWithFormat:@"%@-%lu", v31, v59];
          v67[3] = v30;
          id v52 = (id)[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:4];

          [v60[0] addObject:v52];
          objc_storeStrong(&v52, 0);
        }
        if (v59 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v51 = -[UITableViewAccessibility _axVisibleHeadersAndFootersPriorToFirstVisibleCellSection:](v61, v53);
          memset(v49, 0, sizeof(v49));
          id v27 = v51;
          uint64_t v28 = [v27 countByEnumeratingWithState:v49 objects:v65 count:16];
          if (v28)
          {
            uint64_t v24 = *(void *)v49[2];
            uint64_t v25 = 0;
            unint64_t v26 = v28;
            while (1)
            {
              uint64_t v23 = v25;
              if (*(void *)v49[2] != v24) {
                objc_enumerationMutation(v27);
              }
              id v50 = *(id *)(v49[1] + 8 * v25);
              [v50 _accessibilityProcessScannerGroupElementPieces:v60[0]];
              ++v25;
              if (v23 + 1 >= v26)
              {
                uint64_t v25 = 0;
                unint64_t v26 = [v27 countByEnumeratingWithState:v49 objects:v65 count:16];
                if (!v26) {
                  break;
                }
              }
            }
          }

          objc_storeStrong(&v51, 0);
        }
        else
        {
          for (unint64_t i = v59; i < v53; ++i)
          {
            if (i != v59)
            {
              id v22 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, i, 1);
              [v22 _accessibilityProcessScannerGroupElementPieces:v60[0]];
            }
            id v21 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, i, 0);
            [v21 _accessibilityProcessScannerGroupElementPieces:v60[0]];
          }
        }
        id v20 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, v53, 1);
        [v20 _accessibilityProcessScannerGroupElementPieces:v60[0]];

        uint64_t v59 = v53;
        objc_storeStrong(&v58, 0);
        if (v53 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
          id v3 = v58;
          id v58 = v2;
        }
      }
      if (v58) {
        id v4 = v58;
      }
      else {
        id v4 = v60[0];
      }
      id v47 = v4;
      [v54 _accessibilityProcessScannerGroupElementPieces:v4];
      objc_storeStrong(&v47, 0);
      objc_storeStrong(&v54, 0);
      ++v37;
      if (v35 + 1 >= v38)
      {
        uint64_t v37 = 0;
        unint64_t v38 = [obj countByEnumeratingWithState:__b objects:v68 count:16];
        if (!v38) {
          break;
        }
      }
    }
  }

  if ([v58 count])
  {
    v63[0] = @"GroupElements";
    v64[0] = v58;
    v63[1] = @"GroupTraits";
    id v19 = (id)[NSNumber numberWithUnsignedLong:v57];
    v64[1] = v19;
    v63[2] = @"GroupScanBehaviorTraits";
    v64[2] = &unk_26F48EAF8;
    v63[3] = @"GroupIdentifier";
    id v16 = NSString;
    id v18 = [(UITableViewAccessibility *)v61 _accessibilityGroupIdentifier];
    id v17 = (id)[v16 stringWithFormat:@"%@-%lu", v18, v59];
    v64[3] = v17;
    id v46 = (id)[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:4];

    [v60[0] addObject:v46];
    objc_storeStrong(&v46, 0);
  }
  if (v59 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v60[0] count]) {
      _AXAssert();
    }
    uint64_t v42 = -[UITableViewAccessibility _axNumberOfSections](v61);
    for (uint64_t j = 0; j < v42; ++j)
    {
      id v7 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, j, 1);
      [v7 _accessibilityProcessScannerGroupElementPieces:v60[0]];

      id v8 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, j, 0);
      [v8 _accessibilityProcessScannerGroupElementPieces:v60[0]];
    }
  }
  else
  {
    id v13 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, v59, 0);
    [v13 _accessibilityProcessScannerGroupElementPieces:v60[0]];

    id v45 = -[UITableViewAccessibility _axVisibleHeadersAndFootersAfterLastVisibleCellSection:](v61, v59);
    memset(v43, 0, sizeof(v43));
    id v14 = v45;
    uint64_t v15 = [v14 countByEnumeratingWithState:v43 objects:v62 count:16];
    if (v15)
    {
      uint64_t v10 = *(void *)v43[2];
      uint64_t v11 = 0;
      unint64_t v12 = v15;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)v43[2] != v10) {
          objc_enumerationMutation(v14);
        }
        id v44 = *(id *)(v43[1] + 8 * v11);
        [v44 _accessibilityProcessScannerGroupElementPieces:v60[0]];
        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [v14 countByEnumeratingWithState:v43 objects:v62 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v45, 0);
  }
  id v6 = v60[0];
  objc_storeStrong(&v58, 0);
  objc_storeStrong(v60, 0);

  return v6;
}

- (id)_accessibilityGroupIdentifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
}

- (BOOL)_accessibilitySpeakThisShouldOnlyIncludeVisibleElements
{
  return 0;
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  uint64_t v9 = self;
  v8[1] = (id)a2;
  char v7 = 0;
  objc_opt_class();
  id v6 = (id)__UIAccessibilityCastAsClass();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  if ([v5 isEditing])
  {
    char v10 = 1;
  }
  else
  {
    v3.receiver = v9;
    v3.super_class = (Class)UITableViewAccessibility;
    char v10 = [(UITableViewAccessibility *)&v3 _accessibilityCanPerformEscapeAction];
  }
  int v4 = 1;
  objc_storeStrong(v8, 0);
  return v10 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v9 = self;
  v8[1] = (id)a2;
  char v7 = 0;
  objc_opt_class();
  id v6 = (id)__UIAccessibilityCastAsClass();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  if ([v5 isEditing])
  {
    [v8[0] setEditing:0 animated:1];
    char v10 = 1;
  }
  else
  {
    v3.receiver = v9;
    v3.super_class = (Class)UITableViewAccessibility;
    char v10 = [(UITableViewAccessibility *)&v3 accessibilityPerformEscape];
  }
  int v4 = 1;
  objc_storeStrong(v8, 0);
  return v10 & 1;
}

- (id)_accessibilityReusableViewForOpaqueElement:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = location[0];
  while (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
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

- (BOOL)_accessibilityNativeFocusPreferredElementIsValid
{
  uint64_t v9 = self;
  SEL v8 = a2;
  uint64_t v6 = [(UITableViewAccessibility *)self safeRangeForKey:@"_visibleGlobalRows"];
  uint64_t v7 = v2;
  unsigned __int8 v4 = 0;
  if (v2)
  {
    v5.receiver = v9;
    v5.super_class = (Class)UITableViewAccessibility;
    unsigned __int8 v4 = [(UITableViewAccessibility *)&v5 _accessibilityNativeFocusPreferredElementIsValid];
  }
  return v4 & 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)_accessibilityKeyCommandsShouldOverrideKeyCommands
{
  return 1;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewAccessibility;
  [(UITableViewAccessibility *)&v3 _didUpdateFocusInContext:location[0]];
  objc_storeStrong(location, 0);
}

- (id)_accessibilityLastFocusedChild
{
  uint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewAccessibility *)self _axGetLastFocusedChild];
  id v5 = location[0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = __58__UITableViewAccessibility__accessibilityLastFocusedChild__block_invoke;
  unint64_t v12 = &unk_2650AE790;
  id v13 = v15;
  id v2 = (id)[v5 _accessibilityFindAncestor:&v8 startWithSelf:1];
  BOOL v6 = v2 == 0;

  if (v6)
  {
    int v7 = 0;
  }
  else
  {
    id v16 = location[0];
    int v7 = 1;
  }
  objc_storeStrong((id *)&v13, 0);
  if (!v7) {
    id v16 = 0;
  }
  objc_storeStrong(location, 0);
  objc_super v3 = v16;

  return v3;
}

BOOL __58__UITableViewAccessibility__accessibilityLastFocusedChild__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)preferredFocusEnvironments
{
  v10[1] = *MEMORY[0x263EF8340];
  int v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UITableViewAccessibility;
  v8[0] = [(UITableViewAccessibility *)&v7 preferredFocusEnvironments];
  if ([(UITableViewAccessibility *)v9 _accessibilityIsFKARunningForFocusItem])
  {
    id location = [(UITableViewAccessibility *)v9 preferredFocusedView];
    if (location)
    {
      v10[0] = location;
      id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
      id v3 = v8[0];
      v8[0] = v2;
    }
    objc_storeStrong(&location, 0);
  }
  id v5 = v8[0];
  objc_storeStrong(v8, 0);

  return v5;
}

- (id)preferredFocusedView
{
  id v31 = self;
  v30[1] = (id)a2;
  v29.receiver = self;
  v29.super_class = (Class)UITableViewAccessibility;
  v30[0] = [(UITableViewAccessibility *)&v29 preferredFocusedView];
  if ([(UITableViewAccessibility *)v31 _accessibilityIsFKARunningForFocusItem])
  {
    char v28 = 1;
    char v26 = 0;
    objc_opt_class();
    id v25 = (id)__UIAccessibilityCastAsClass();
    id v24 = v25;
    objc_storeStrong(&v25, 0);
    id v27 = v24;
    id v23 = [(UITableViewAccessibility *)v31 _accessibilityLastFocusedChild];
    if (v23)
    {
      id v22 = (id)[v23 _accessibilityFindAncestor:&__block_literal_global_851 startWithSelf:1];
      id v21 = (id)[v22 _accessibilityIndexPath];
      char v20 = v21 != 0;
      if (v21)
      {
        id v13 = (id)[v27 cellForRowAtIndexPath:v21];
        char v14 = 0;
        if (v13 == v22) {
          char v14 = [v22 _accessibilityViewIsVisible];
        }
        char v20 = v14 & 1;
      }
      if ((v20 & 1) == 0)
      {
        char v19 = 0;
        objc_opt_class();
        id v18 = (id)__UIAccessibilityCastAsSafeCategory();
        id v17 = v18;
        objc_storeStrong(&v18, 0);
        id v11 = v22;
        id v12 = (id)[(UITableViewAccessibility *)v31 visibleCells];
        id v2 = -[UIViewAccessibility _accessibilityViewMatchingFKAView:inArray:]((uint64_t)v17, v11, v12);
        id v3 = v23;
        id v23 = v2;

        [(UITableViewAccessibility *)v31 _axSetLastFocusedChild:v23];
        char v20 = v23 != 0;
      }
      if (v23 && (v20 & 1) != 0)
      {
        objc_storeStrong(v30, v23);
        char v28 = 0;
      }
      else
      {
        [(UITableViewAccessibility *)v31 _axSetLastFocusedChild:0];
      }
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
    }
    char v15 = 0;
    BOOL v10 = 0;
    if (v28)
    {
      id v16 = (id)[v27 indexPathForSelectedRow];
      char v15 = 1;
      BOOL v10 = v16 != 0;
    }
    if (v15) {

    }
    if (v10)
    {
      id v8 = v27;
      id v9 = (id)[v27 indexPathForSelectedRow];
      id v4 = (id)objc_msgSend(v8, "cellForRowAtIndexPath:");
      id v5 = v30[0];
      v30[0] = v4;
    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v27, 0);
  }
  id v7 = v30[0];
  objc_storeStrong(v30, 0);

  return v7;
}

uint64_t __48__UITableViewAccessibility_preferredFocusedView__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  return 1;
}

- (id)_childFocusViews
{
  uint64_t v35 = self;
  v34[1] = (id)a2;
  v33.receiver = self;
  v33.super_class = (Class)UITableViewAccessibility;
  id v19 = [(UITableViewAccessibility *)&v33 _childFocusViews];
  v34[0] = (id)[v19 mutableCopy];

  if ([(UITableViewAccessibility *)v35 _accessibilityIsFKARunningForFocusItem])
  {
    char v31 = 0;
    objc_opt_class();
    id v18 = (id)[(UITableViewAccessibility *)v35 _swipeActionController];
    id v17 = (id)[v18 safeValueForKey:@"currentSwipeOccurrence"];
    id v30 = (id)__UIAccessibilityCastAsClass();

    id v29 = v30;
    objc_storeStrong(&v30, 0);
    id v32 = v29;
    if (v29)
    {
      id v16 = v34[0];
      uint64_t v22 = 0;
      id v23 = &v22;
      int v24 = 838860800;
      int v25 = 48;
      char v26 = __Block_byref_object_copy__20;
      id v27 = __Block_byref_object_dispose__20;
      id v28 = 0;
      v21[1] = &v22;
      v21[0] = v32;
      AXPerformSafeBlock();
      id v20 = (id)v23[5];
      objc_storeStrong(v21, 0);
      _Block_object_dispose(&v22, 8);
      objc_storeStrong(&v28, 0);
      objc_msgSend(v16, "axSafelyAddObject:");
    }
    id v4 = v34[0];
    id v5 = [(UITableViewAccessibility *)v35 _accessibilitySupplementaryHeaderViews];
    objc_msgSend(v4, "axSafelyAddObjectsFromArray:");

    id v6 = v34[0];
    id v7 = [(UITableViewAccessibility *)v35 _accessibilitySupplementaryFooterViews];
    objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

    id v8 = v34[0];
    id v9 = (id)[(UITableViewAccessibility *)v35 safeValueForKey:@"_index"];
    objc_msgSend(v8, "removeObject:");

    -[UITableViewAccessibility _axSetupIndexGuide](v35);
    BOOL v10 = (void *)MEMORY[0x263F1CB60];
    id v15 = (id)[v34[0] reverseObjectEnumerator];
    id v14 = (id)[v15 allObjects];
    id v13 = (id)objc_msgSend(v10, "_subviewsReplacedByModalViewSubviewsIfNecessary:");
    id v12 = (id)[v13 reverseObjectEnumerator];
    id v11 = (id)[v12 allObjects];
    id v36 = (id)objc_msgSend(v11, "ax_filteredArrayUsingBlock:", &__block_literal_global_857);

    objc_storeStrong(&v32, 0);
  }
  else
  {
    id v36 = v34[0];
  }
  objc_storeStrong(v34, 0);
  id v2 = v36;

  return v2;
}

void __44__UITableViewAccessibility__childFocusViews__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_pullViewForSwipeDirection:", objc_msgSend(*(id *)(a1 + 32), "safeUnsignedIntegerForKey:", @"configuredDirection"));
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v1;
}

- (void)_axSetupIndexGuide
{
  id v13 = a1;
  if (a1)
  {
    id v12 = (id)[v13 safeValueForKey:@"_index"];
    id v6 = -[UITableViewAccessibility _axGetIndexGuide](v13);
    BOOL v7 = 0;
    if (!v6) {
      BOOL v7 = v12 != 0;
    }

    if (v7)
    {
      id v11 = v13;
      id v10 = objc_alloc_init(MEMORY[0x263F1C640]);
      id v5 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v12);
      objc_msgSend(v10, "setPreferredFocusEnvironments:");

      [v10 setAccessibilityContainer:v12];
      [v11 bounds];
      long long v8 = v1;
      double v9 = v2;
      if ([v13 _accessibilityIsRTL]) {
        int v3 = -1;
      }
      else {
        int v3 = 1;
      }
      *(double *)&long long v8 = (double)v3 * v9 * 2.0;
      [v11 contentSize];
      objc_msgSend(v10, "_setManualLayoutFrame:", v8, v9, v4);
      -[UITableViewAccessibility _axSetIndexGuide:]((uint64_t)v13, v10);
      [v11 addLayoutGuide:v10];
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong(&v12, 0);
  }
}

uint64_t __44__UITableViewAccessibility__childFocusViews__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityFKAShouldBeProcessed];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_shouldSelectionFollowFocusForIndexPath:(id)a3 initiatedBySelection:(BOOL)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  char v8 = 0;
  v7.receiver = v11;
  v7.super_class = (Class)UITableViewAccessibility;
  char v8 = [(UITableViewAccessibility *)&v7 _shouldSelectionFollowFocusForIndexPath:location[0] initiatedBySelection:a4];
  if ([(UITableViewAccessibility *)v11 _accessibilityIsFKARunningForFocusItem])char v8 = 0; {
  char v5 = v8;
  }
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (id)_axGetIndexGuide
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UITableViewAccessibility___axGetIndexGuide);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_axSetIndexGuide:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilitySelectedChildren
{
  id v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)[(UITableViewAccessibility *)self indexPathsForSelectedRows];
  if ([(UITableViewAccessibility *)v20 isAccessibilityOpaqueElementProvider])
  {
    id v5 = v19[0];
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    id v16 = __58__UITableViewAccessibility__accessibilitySelectedChildren__block_invoke;
    id v17 = &unk_2650AEAF8;
    id v18 = v20;
    id v21 = (id)objc_msgSend(v5, "ax_flatMappedArrayUsingBlock:", &v13);
    objc_storeStrong((id *)&v18, 0);
  }
  else
  {
    id v4 = v19[0];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    BOOL v9 = __58__UITableViewAccessibility__accessibilitySelectedChildren__block_invoke_2;
    id v10 = &unk_2650AEAF8;
    id v11 = v20;
    id v21 = (id)objc_msgSend(v4, "ax_flatMappedArrayUsingBlock:", &v6);
    objc_storeStrong((id *)&v11, 0);
  }
  int v12 = 1;
  objc_storeStrong(v19, 0);
  id v2 = v21;

  return v2;
}

id __58__UITableViewAccessibility__accessibilitySelectedChildren__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[a1[4] accessibilityCellForRowAtIndexPath:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

id __58__UITableViewAccessibility__accessibilitySelectedChildren__block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[a1[4] _accessibilityTableViewCellElementForIndexPath:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

@end